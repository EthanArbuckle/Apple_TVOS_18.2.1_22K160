@interface IMDaemonMIGInterface
+ (id)sharedInstance;
- (IMDaemonMIGInterfaceDelegate)delegate;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
- (void)setDelegate:(id)a3;
@end

@implementation IMDaemonMIGInterface

+ (id)sharedInstance
{
  if (qword_100071068 != -1) {
    dispatch_once(&qword_100071068, &stru_100065898);
  }
  return (id)qword_100071070;
}

- (void)__setupServer
{
  if (IMOSLoggingEnabled(self, a2))
  {
    v3 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemon");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Accepting Incoming Grant Requests", buf, 2u);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100023B74;
  v10[3] = &unk_1000658C0;
  v10[4] = self;
  self->_connection_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.imagent.connection_queue", 0LL);
  IMXPCCreateServerConnectionWithQueue = (uint64_t (*)(id, OS_dispatch_queue *, void *, void *, Block_layout *, OS_dispatch_queue *))IMSharedHelperGet_IMXPCCreateServerConnectionWithQueue();
  uint64_t v5 = kFZDaemonAuthGrantPortName;
  v6 = (OS_xpc_object *)IMXPCCreateServerConnectionWithQueue( [kFZDaemonAuthGrantPortName UTF8String],  self->_connection_queue,  v10,  v10,  &stru_100065900,  self->_connection_queue);
  self->_server = v6;
  if (!v6)
  {
    if (IMOSLoggingEnabled(0LL, v7))
    {
      v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "IMDaemonMIGInterface: Could not create server with name: %@",  buf,  0xCu);
      }
    }

    exit(-1);
  }

  xpc_connection_resume(v6);
  p_notifyToken = &self->_notifyToken;
  notify_register_check("_IMDaemonRunningNotifyToken", p_notifyToken);
  notify_set_state(*p_notifyToken, 1uLL);
  notify_post("_IMDaemonRunningNotifyToken");
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002404C;
  block[3] = &unk_1000658C0;
  block[4] = self;
  if (qword_100071078 != -1) {
    dispatch_once(&qword_100071078, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    xpc_connection_cancel(server);
    self->_server = 0LL;
  }

  connection_queue = (dispatch_object_s *)self->_connection_queue;
  if (connection_queue)
  {
    dispatch_release(connection_queue);
    self->_connection_queue = 0LL;
  }

  notify_set_state(self->_notifyToken, 0LL);
  notify_post("_IMDaemonRunningNotifyToken");
}

- (IMDaemonMIGInterfaceDelegate)delegate
{
  return (IMDaemonMIGInterfaceDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end