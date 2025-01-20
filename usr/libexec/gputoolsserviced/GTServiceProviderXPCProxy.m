@interface GTServiceProviderXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)waitForService:(id)a3 error:(id *)a4;
- (GTServiceProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)allServices;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterService:(unint64_t)a3;
- (void)registerService:(id)a3 forProcess:(id)a4;
- (void)waitForService:(id)a3 completionHandler:(id)a4;
@end

@implementation GTServiceProviderXPCProxy

- (GTServiceProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___GTServiceProviderXPCProxy;
  v8 = -[GTServiceProviderXPCProxy init](&v32, "init");
  if (!v8) {
    goto LABEL_4;
  }
  os_log_t v9 = os_log_create("com.apple.gputools.transport", "ServiceProviderProxy");
  log = v8->_log;
  v8->_log = v9;

  v11 = &OBJC_PROTOCOL___GTServiceProvider;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolName]);
  v13 = NSStringFromProtocol((Protocol *)v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned __int8 v15 = [v12 isEqualToString:v14];

  if ((v15 & 1) != 0)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v7 deviceUDID]);
    deviceUDID = v8->_deviceUDID;
    v8->_deviceUDID = (NSString *)v16;

    v18 = objc_alloc(&OBJC_CLASS___GTServiceConnection);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUDID]);
    v20 = -[GTServiceConnection initWithConnection:device:port:]( v18,  "initWithConnection:device:port:",  v6,  v19,  [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](&OBJC_CLASS___GTServiceProperties, "protocolMethods:", v11));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolMethods]);
    id v24 = newSetWithArrayMinusArray(v22, v23);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v25;

    v27 = (NSMutableDictionary *)[&__NSDictionary0__struct mutableCopy];
    observerIdToPort = v8->_observerIdToPort;
    v8->_observerIdToPort = v27;

LABEL_4:
    v29 = v8;
    goto LABEL_8;
  }

  v30 = v8->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_1000139D4(v30);
  }

  v29 = 0LL;
LABEL_8:

  return v29;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v7))
  {
    BOOL v8 = 0;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___GTServiceProviderXPCProxy;
    BOOL v8 = -[GTServiceProviderXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (id)allServices
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___GTProcessService);
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }

  else
  {
    nsarray = 0LL;
  }

  return nsarray;
}

- (void)registerService:(id)a3 forProcess:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "serviceProperties", (uint64_t)v15);
  xpc_dictionary_set_nsobject(empty, "processInfo", (uint64_t)v7);

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v15, "setServicePort:", xpc_dictionary_get_uint64(v10, "servicePort"));
    string = xpc_dictionary_get_string(v11, "deviceUDID");
    if (string) {
      v13 = string;
    }
    else {
      v13 = "";
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    [v15 setDeviceUDID:v14];
  }

  else
  {
    [v15 setServicePort:0];
    [v15 setDeviceUDID:0];
  }
}

- (void)waitForService:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v11 = v8;
  v12 = (const char *)[v11 UTF8String];

  xpc_dictionary_set_string(empty, "protocolName", v12);
  connection = self->_connection;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100012B0C;
  v15[3] = &unk_100030940;
  id v16 = v7;
  id v14 = v7;
  -[GTServiceConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v15);
}

- (BOOL)waitForService:(id)a3 error:(id *)a4
{
  id v7 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v10 = v7;
  id v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(empty, "protocolName", v11);
  uint64_t v12 = objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  a4));
  v13 = (void *)v12;
  if (v12)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v12, "error");
    id v15 = nserror;
    BOOL v16 = nserror == 0LL;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)deregisterService:(unint64_t)a3
{
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "servicePort", a3);
  -[GTServiceConnection sendMessage:](self->_connection, "sendMessage:", xdict);
}

- (unint64_t)registerObserver:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = -[GTServiceProviderReplyStream initWithObserver:]( objc_alloc(&OBJC_CLASS___GTServiceProviderReplyStream),  "initWithObserver:",  v5);

  unint64_t v9 = -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:replyStreamId:error:]( self->_connection,  "sendMessageWithReplySync:replyStreamId:error:",  empty,  v9,  0LL));
  id v11 = v10;
  if (v10)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v10, "observerId");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v9));
    observerIdToPort = self->_observerIdToPort;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  uint64));
    -[NSMutableDictionary setObject:forKeyedSubscript:](observerIdToPort, "setObject:forKeyedSubscript:", v13, v15);
  }

  else
  {
    uint64_t uint64 = 0LL;
  }

  return uint64;
}

- (void)deregisterObserver:(unint64_t)a3
{
  observerIdToPort = self->_observerIdToPort;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](observerIdToPort, "objectForKeyedSubscript:", v7));
  id v9 = [v8 unsignedLongValue];

  id v10 = self->_observerIdToPort;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "observerId", a3);
  id v13 =  -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  xdict,  0LL);
  -[GTServiceConnection deregisterDispatcher:](self->_connection, "deregisterDispatcher:", v9);
}

- (void).cxx_destruct
{
}

@end