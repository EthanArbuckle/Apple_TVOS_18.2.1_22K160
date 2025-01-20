@interface GEOAPDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GEOAPDaemon)init;
- (void)_setupSigHandler;
- (void)_shutdown;
- (void)dealloc;
@end

@implementation GEOAPDaemon

- (GEOAPDaemon)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GEOAPDaemon;
  v2 = -[GEOAPDaemon init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_shutdownRequested = 0;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("GEOAPDaemon", v5);
    serialQ = v3->_serialQ;
    v3->_serialQ = (OS_dispatch_queue *)v6;

    v8 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.geoanalyticsd");
    listener = v3->_listener;
    v3->_listener = v8;

    -[NSXPCListener setDelegate:](v3->_listener, "setDelegate:", v3);
    -[NSXPCListener _setQueue:](v3->_listener, "_setQueue:", v3->_serialQ);
  }

  id v10 = sub_10000A67C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "hello", v13, 2u);
  }

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  id v5 = sub_10000A67C();
  dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "new connection : %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = sub_10000A4A0((id *)objc_alloc(&OBJC_CLASS___GEOAPDaemonManagerBridge), v4);
  [v4 setExportedObject:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GEOAPXPCDaemonExporting));
  [v4 setExportedInterface:v8];

  [v4 resume];
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GEOAPDaemon;
  -[GEOAPDaemon dealloc](&v3, "dealloc");
}

- (void)_shutdown
{
  self->_shutdownRequested = 1;
  id v2 = sub_1000168E0();
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10001A000((uint64_t)v3);

  xpc_transaction_exit_clean();
}

- (void)_setupSigHandler
{
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)self->_serialQ);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v3;

  id v5 = self->_sigtermSource;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000BE18;
  v6[3] = &unk_1000289F0;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
}

@end