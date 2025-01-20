@interface AXTVCoreRemoteDeviceManager
- (AXTVCoreRemoteDeviceManager)init;
- (void)disconnectDevice:(id)a3;
- (void)sendMessage:(const char *)a3 args:(id)a4;
@end

@implementation AXTVCoreRemoteDeviceManager

- (AXTVCoreRemoteDeviceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVCoreRemoteDeviceManager;
  v2 = -[AXTVCoreRemoteDeviceManager init](&v6, "init");
  if (v2)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTServer.le", 0LL, 0LL);
    connection = v2->_connection;
    v2->_connection = mach_service;

    xpc_connection_set_event_handler(v2->_connection, &stru_66968);
    xpc_connection_resume(v2->_connection);
  }

  return v2;
}

- (void)disconnectDevice:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 address]);

  id v6 = v5;
  xpc_dictionary_set_string(xdict, "kDeviceAddress", (const char *)[v6 UTF8String]);

  -[AXTVCoreRemoteDeviceManager sendMessage:args:](self, "sendMessage:args:", "DisconnectClassicDevice", xdict);
}

- (void)sendMessage:(const char *)a3 args:(id)a4
{
  xpc_object_t value = a4;
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, "kMsgId", a3);
  if (value) {
    xpc_dictionary_set_value(v6, "kMsgArgs", value);
  }
  xpc_connection_send_message(self->_connection, v6);
}

- (void).cxx_destruct
{
}

@end