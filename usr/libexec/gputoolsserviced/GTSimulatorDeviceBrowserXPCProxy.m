@interface GTSimulatorDeviceBrowserXPCProxy
- (BOOL)isSimulatorDevice:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GTSimulatorDeviceBrowserXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)deviceProperties:(id)a3 error:(id *)a4;
@end

@implementation GTSimulatorDeviceBrowserXPCProxy

- (GTSimulatorDeviceBrowserXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___GTSimulatorDeviceBrowserXPCProxy;
  v8 = -[GTSimulatorDeviceBrowserXPCProxy init](&v25, "init");
  if (v8)
  {
    v9 = &OBJC_PROTOCOL___GTSimulatorDeviceBrowser;
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
    v8->_connection = v16;

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
    v10.super_class = (Class)&OBJC_CLASS___GTSimulatorDeviceBrowserXPCProxy;
    BOOL v8 = -[GTSimulatorDeviceBrowserXPCProxy respondsToSelector:](&v10, "respondsToSelector:", a3);
  }

  return v8;
}

- (BOOL)isSimulatorDevice:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = v5;
  v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v9);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  0LL));
  v11 = v10;
  if (v10) {
    BOOL v12 = xpc_dictionary_get_BOOL(v10, "returnValue");
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)deviceProperties:(id)a3 error:(id *)a4
{
  id v7 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v10 = v7;
  v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v11);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[GTServiceConnection sendMessageWithReplySync:error:]( self->_connection,  "sendMessageWithReplySync:error:",  empty,  a4));
  if (v12)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___GTDeviceProperties);
    nsobject = xpc_dictionary_get_nsobject(v12, "returnValue", v13);
    if (a4) {
      *a4 = (id)xpc_dictionary_get_nserror(v12, "error");
    }
  }

  else
  {
    nsobject = 0LL;
  }

  return nsobject;
}

- (void).cxx_destruct
{
}

@end