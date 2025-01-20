@interface IDSCredentialsDaemonMIGInterface
+ (id)sharedInstance;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
@end

@implementation IDSCredentialsDaemonMIGInterface

+ (id)sharedInstance
{
  if (qword_100015808 != -1) {
    dispatch_once(&qword_100015808, &stru_100010768);
  }
  return (id)qword_100015810;
}

- (void)__setupServer
{
  uint64_t v3 = OSLogHandleForIDSCategory("RemoteCredentialsAgent", a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Accepting Incoming Grant Requests", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v5)
    && _IDSShouldLog(1LL, @"RemoteCredentialsAgent"))
  {
    _IDSLogV(1LL, @"IDSFoundation", @"RemoteCredentialsAgent", @"Accepting Incoming Grant Requests");
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000099B4;
  v18[3] = &unk_1000106C8;
  v18[4] = self;
  v6 = objc_retainBlock(v18);
  uint64_t v7 = kIDSRemoteCredentialDaemonAuthGrantPortName;
  id v8 = [kIDSRemoteCredentialDaemonAuthGrantPortName UTF8String];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t v11 = IMXPCCreateServerConnection(v8, v6, v6, &stru_1000107A8, v10);
  server = self->_server;
  p_server = &self->_server;
  *p_server = (OS_xpc_object *)v11;

  if (!*p_server)
  {
    uint64_t v15 = OSLogHandleForIDSCategory("Warning", v14);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "IDSRemoteURLConnectionDaemonMIGInterface: Could not create server with name: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v17))
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
  block[2] = sub_10000A194;
  block[3] = &unk_1000106C8;
  block[4] = self;
  if (qword_100015818 != -1) {
    dispatch_once(&qword_100015818, block);
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