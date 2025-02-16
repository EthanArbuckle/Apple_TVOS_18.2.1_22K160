@interface GTLaunchServiceXPCProxy
- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4;
- (BOOL)launchReplayService:(id)a3 error:(id *)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4;
- (GTLaunchServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4;
- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation GTLaunchServiceXPCProxy

- (GTLaunchServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___GTLaunchServiceXPCProxy;
  v8 = -[GTLaunchServiceXPCProxy init](&v25, "init");
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTLaunchService;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolName]);
    v11 = NSStringFromProtocol((Protocol *)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    unsigned int v13 = [v10 isEqualToString:v12];

    if (!v13)
    {

      v23 = 0LL;
      goto LABEL_6;
    }

    v14 = objc_alloc(&OBJC_CLASS___GTServiceConnection);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceUDID]);
    v16 = -[GTServiceConnection initWithConnection:device:port:]( v14,  "initWithConnection:device:port:",  v6,  v15,  [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTXPCConnection *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](&OBJC_CLASS___GTServiceProperties, "protocolMethods:", v9));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 protocolMethods]);
    id v20 = newSetWithArrayMinusArray(v18, v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v21;
  }

  v23 = v8;
LABEL_6:

  return v23;
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
    v10.super_class = (Class)&OBJC_CLASS___GTLaunchServiceXPCProxy;
    BOOL v8 = -[GTLaunchServiceXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (BOOL)launchReplayService:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 environment]);
  id v9 = [v8 mutableCopy];

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionUUID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  [v9 setObject:v11 forKeyedSubscript:@"GT_LAUNCH_UUID"];

  id v12 = [v9 copy];
  [v7 setEnvironment:v12];

  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v7);

  uint64_t v15 = objc_claimAutoreleasedReturnValue( -[GTXPCConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  a4));
  v16 = (void *)v15;
  if (v15)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v15, "error");
    v18 = nserror;
    BOOL v19 = nserror == 0LL;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  uint64_t v10 = objc_claimAutoreleasedReturnValue( -[GTXPCConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  a4));
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    unsigned int v13 = nserror;
    BOOL v14 = nserror == 0LL;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  uint64_t v10 = objc_claimAutoreleasedReturnValue( -[GTXPCConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  a4));
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    unsigned int v13 = nserror;
    BOOL v14 = nserror == 0LL;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000F51C;
  v12[3] = &unk_100030940;
  id v13 = v7;
  id v11 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v12);
}

- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000F660;
  v12[3] = &unk_100030940;
  id v13 = v7;
  id v11 = v7;
  -[GTXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", empty, v12);
}

- (void).cxx_destruct
{
}

@end