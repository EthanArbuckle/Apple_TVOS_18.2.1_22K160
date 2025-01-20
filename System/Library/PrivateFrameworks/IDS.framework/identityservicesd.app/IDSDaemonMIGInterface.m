@interface IDSDaemonMIGInterface
+ (id)sharedInstance;
- (IDSDaemonMIGInterfaceDelegate)delegate;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
- (void)setDelegate:(id)a3;
- (void)shutDownSim2HostServer;
@end

@implementation IDSDaemonMIGInterface

+ (id)sharedInstance
{
  if (qword_1009BEAF8 != -1) {
    dispatch_once(&qword_1009BEAF8, &stru_1008FAF78);
  }
  return (id)qword_1009BEB00;
}

- (void)__setupServer
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10011D18C;
  v17[3] = &unk_1008F6010;
  v17[4] = self;
  v3 = objc_retainBlock(v17);
  if ((_os_feature_enabled_impl("IDS", "UseNewThreadArch_v1") & 1) != 0) {
    dispatch_queue_t v4 = 0LL;
  }
  else {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.identityservicesd.connection_queue", 0LL);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDependencyProvider XPCAdapter](&OBJC_CLASS___IDSDependencyProvider, "XPCAdapter"));
  uint64_t v6 = kIDSDaemonAuthGrantPortName;
  v7 = (IDSXPCConnectionProtocol *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "createServiceConnectionWithServiceName:invalidationHandler:terminationHandler:pee rEventHandler:peerQueue:",  objc_msgSend(kIDSDaemonAuthGrantPortName, "UTF8String"),  v3,  v3,  &stru_1008FAFB8,  v4));
  server = self->_server;
  self->_server = v7;

  v9 = self->_server;
  if (!v9)
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Warning");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "IDSDaemonMIGInterface: Could not create server with name: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v16))
    {
      _IDSWarnV(@"IDSFoundation", @"IDSDaemonMIGInterface: Could not create server with name: %@");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"IDSDaemonMIGInterface: Could not create server with name: %@");
      _IDSLogTransport( @"Warning",  @"IDS",  @"IDSDaemonMIGInterface: Could not create server with name: %@");
    }

    exit(-1);
  }

  -[IDSXPCConnectionProtocol resume](v9, "resume");
  v11 = (const char *)IMUserScopedNotification("_IDSDaemonRunningNotifyToken", v10);
  notify_register_check(v11, &self->_notifyToken);
  notify_set_state(self->_notifyToken, 1uLL);
  v13 = (const char *)IMUserScopedNotification("_IDSDaemonRunningNotifyToken", v12);
  notify_post(v13);
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011DA1C;
  block[3] = &unk_1008F6010;
  block[4] = self;
  if (qword_1009BEB08 != -1) {
    dispatch_once(&qword_1009BEB08, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    -[IDSXPCConnectionProtocol cancel](server, "cancel");
    dispatch_queue_t v4 = self->_server;
    self->_server = 0LL;
  }

  notify_set_state(self->_notifyToken, 0LL);
  uint64_t v6 = (const char *)IMUserScopedNotification("_IDSDaemonRunningNotifyToken", v5);
  notify_post(v6);
}

- (void)shutDownSim2HostServer
{
  self->_shuttingDownSim2Host = 1;
  serverSim2Host = self->_serverSim2Host;
  if (serverSim2Host)
  {
    -[IDSXPCConnectionProtocol cancel](serverSim2Host, "cancel");
    dispatch_queue_t v4 = self->_serverSim2Host;
    self->_serverSim2Host = 0LL;
  }

- (IDSDaemonMIGInterfaceDelegate)delegate
{
  return (IDSDaemonMIGInterfaceDelegate *)objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end