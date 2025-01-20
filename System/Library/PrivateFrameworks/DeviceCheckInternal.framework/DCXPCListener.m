@interface DCXPCListener
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DCXPCListener)init;
- (NSXPCListener)listener;
- (OS_dispatch_queue)sigtermQueue;
- (OS_dispatch_source)sigtermSource;
- (void)registerForSigtermObserver;
- (void)setListener:(id)a3;
- (void)setSigtermQueue:(id)a3;
- (void)setSigtermSource:(id)a3;
- (void)start;
@end

@implementation DCXPCListener

- (OS_dispatch_queue)sigtermQueue
{
  sigtermQueue = self->_sigtermQueue;
  if (!sigtermQueue)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.devicecheckd.sigterm.queue", v5);
    v7 = self->_sigtermQueue;
    self->_sigtermQueue = v6;

    sigtermQueue = self->_sigtermQueue;
  }

  return sigtermQueue;
}

- (DCXPCListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DCXPCListener;
  v2 = -[DCXPCListener init](&v6, "init");
  if (v2)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.devicecheckd");
    -[DCXPCListener setListener:](v2, "setListener:", v3);

    dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DCXPCListener listener](v2, "listener"));
    [v4 setDelegate:v2];
  }

  return v2;
}

- (void)start
{
  id v3 = sub_1000043BC();
  dispatch_queue_attr_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DC starting...", v6, 2u);
  }

  -[DCXPCListener registerForSigtermObserver](self, "registerForSigtermObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DCXPCListener listener](self, "listener"));
  [v5 resume];
}

+ (id)sharedInstance
{
  if (qword_10000D040 != -1) {
    dispatch_once(&qword_10000D040, &stru_100008348);
  }
  return (id)qword_10000D038;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1000043BC();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Incoming connections.. %@", buf, 0xCu);
  }

  id v9 = sub_1000043BC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client has entitlement", buf, 2u);
  }

  v11 = -[DCClientHandler initWithConnection:](objc_alloc(&OBJC_CLASS___DCClientHandler), "initWithConnection:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DCDeviceMetadataInterface XPCInterface](&OBJC_CLASS___DCDeviceMetadataInterface, "XPCInterface"));
  [v6 setExportedInterface:v12];

  [v6 setExportedObject:v11];
  objc_initWeak((id *)buf, v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100004860;
  v14[3] = &unk_100008370;
  objc_copyWeak(&v15, (id *)buf);
  [v6 setInvalidationHandler:v14];
  [v6 resume];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)registerForSigtermObserver
{
  id v3 = sub_1000043BC();
  dispatch_queue_attr_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up SIGTERM observer.", v9, 2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DCXPCListener sigtermQueue](self, "sigtermQueue"));
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v5);
  -[DCXPCListener setSigtermSource:](self, "setSigtermSource:", v6);

  id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[DCXPCListener sigtermSource](self, "sigtermSource"));
  dispatch_source_set_event_handler(v7, &stru_100008390);

  v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[DCXPCListener sigtermSource](self, "sigtermSource"));
  dispatch_activate(v8);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (void)setSigtermSource:(id)a3
{
}

- (void)setSigtermQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end