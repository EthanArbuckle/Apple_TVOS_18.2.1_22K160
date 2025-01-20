@interface IDSRemoteURLConnectionDaemonMIGInterface
+ (id)sharedInstance;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
@end

@implementation IDSRemoteURLConnectionDaemonMIGInterface

+ (id)sharedInstance
{
  if (qword_100015980 != -1) {
    dispatch_once(&qword_100015980, &stru_1000106A0);
  }
  return (id)qword_100015988;
}

- (void)__setupServer
{
  uint64_t v3 = OSLogHandleForIDSCategory("RemoteLoading");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Accepting Incoming Grant Requests", buf, 2u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100006478;
  v17[3] = &unk_100010638;
  v17[4] = self;
  v6 = objc_retainBlock(v17);
  uint64_t v7 = kIDSRemoteURLConnectionDaemonAuthGrantPortName;
  id v8 = [kIDSRemoteURLConnectionDaemonAuthGrantPortName UTF8String];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v11 = IMXPCCreateServerConnection(v8, v6, v6, &stru_1000106E0, v10);
  server = self->_server;
  p_server = &self->_server;
  *p_server = (OS_xpc_object *)v11;

  if (!*p_server)
  {
    uint64_t v14 = OSLogHandleForIDSCategory("Warning");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "IDSRemoteURLConnectionDaemonMIGInterface: Could not create server with name: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v16))
    {
      _IDSWarnV( @"IDSFoundation",  @"IDSRemoteURLConnectionDaemonMIGInterface: Could not create server with name: %@");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"IDSRemoteURLConnectionDaemonMIGInterface: Could not create server with name: %@");
      _IDSLogTransport( @"Warning",  @"IDS",  @"IDSRemoteURLConnectionDaemonMIGInterface: Could not create server with name: %@");
    }

    exit(-1);
  }

  xpc_connection_resume(*p_server);
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000076A4;
  block[3] = &unk_100010638;
  block[4] = self;
  if (qword_100015990 != -1) {
    dispatch_once(&qword_100015990, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    xpc_connection_cancel(server);
    v4 = self->_server;
    self->_server = 0LL;
  }

- (void).cxx_destruct
{
}

@end