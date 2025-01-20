@interface IDSDaemonMIGQueryInterface
+ (id)sharedInstance;
- (IDSDaemonMIGQueryInterfaceDelegate)delegate;
- (void)__setupServer;
- (void)acceptIncomingGrantRequests;
- (void)denyIncomingGrantRequests;
- (void)setDelegate:(id)a3;
@end

@implementation IDSDaemonMIGQueryInterface

+ (id)sharedInstance
{
  if (qword_1009C0AD0 != -1) {
    dispatch_once(&qword_1009C0AD0, &stru_100900C20);
  }
  return (id)qword_1009C0AD8;
}

- (void)__setupServer
{
  uint64_t v3 = OSLogHandleForIDSCategory("IDQuery");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Accepting Incoming Grant Query Requests",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v5))
  {
    MarcoLogMadridLevel( @"IDSDaemonMIGQueryInterface",  0LL,  @"IDQuery",  @"Accepting Incoming Grant Query Requests");
    IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Accepting Incoming Grant Query Requests");
    if ((_IMWillLog(@"IDQuery", v6) & 1) != 0) {
      _IMAlwaysLog(0LL, @"IDQuery", @"Accepting Incoming Grant Query Requests");
    }
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10030CA10;
  v19[3] = &unk_1008F6010;
  v19[4] = self;
  v7 = objc_retainBlock(v19);
  dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_queue_t v10 = dispatch_queue_create(0LL, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDependencyProvider XPCAdapter](&OBJC_CLASS___IDSDependencyProvider, "XPCAdapter"));
  uint64_t v12 = kIDSDaemonQueryAuthGrantPortName;
  uint64_t v13 = objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "createServiceConnectionWithServiceName:invalidationHandler:terminationHandler:peerEventHandler:peerQueue:",  objc_msgSend(kIDSDaemonQueryAuthGrantPortName, "UTF8String"),  v7,  v7,  &stru_100900C40,  v10));
  server = self->_server;
  p_server = (id *)&self->_server;
  id *p_server = (id)v13;

  if (!*p_server)
  {
    uint64_t v16 = OSLogHandleForIDSCategory("Warning");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "IDSDaemonMIGQueryInterface: Could not create server with name: %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v18))
    {
      MarcoLogMadridLevel( @"IDSDaemonMIGQueryInterface",  0LL,  @"IDQuery",  @"IDSDaemonMIGQueryInterface: Could not create server with name: %@");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"IDSDaemonMIGQueryInterface: Could not create server with name: %@");
      _IMWarn(@"IDSDaemonMIGQueryInterface: Could not create server with name: %@");
    }

    exit(-1);
  }

  [*p_server resume];
}

- (void)acceptIncomingGrantRequests
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10030EAE4;
  block[3] = &unk_1008F6010;
  block[4] = self;
  if (qword_1009C0AE0 != -1) {
    dispatch_once(&qword_1009C0AE0, block);
  }
}

- (void)denyIncomingGrantRequests
{
  self->_shuttingDown = 1;
  server = self->_server;
  if (server)
  {
    -[IDSXPCConnectionProtocol cancel](server, "cancel");
    v4 = self->_server;
    self->_server = 0LL;
  }

- (IDSDaemonMIGQueryInterfaceDelegate)delegate
{
  return (IDSDaemonMIGQueryInterfaceDelegate *)objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end