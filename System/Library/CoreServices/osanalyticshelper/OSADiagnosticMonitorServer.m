@interface OSADiagnosticMonitorServer
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OSADiagnosticMonitorServer)init;
- (void)didWriteLog:(id)a3 filePath:(id)a4;
- (void)failedToWriteLog:(id)a3 error:(id)a4;
- (void)q_addConnection:(id)a3 entitled:(BOOL)a4;
- (void)willWriteLog:(id)a3 details:(id)a4;
@end

@implementation OSADiagnosticMonitorServer

+ (id)sharedInstance
{
  if (qword_100026258 != -1) {
    dispatch_once(&qword_100026258, &stru_100020EF0);
  }
  return (id)qword_100026250;
}

- (OSADiagnosticMonitorServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OSADiagnosticMonitorServer;
  v2 = -[OSADiagnosticMonitorServer init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.osanalystics.diagnosticmonitorserver", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    clients = v2->_clients;
    v2->_clients = (NSMutableSet *)v5;

    v7 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v8 = -[NSXPCListener initWithMachServiceName:](v7, "initWithMachServiceName:", kOSADiagnosticMonitorMachService);
    listener = v2->_listener;
    v2->_listener = v8;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (void)willWriteLog:(id)a3 details:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticMonitorLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received log event: %@", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000DDF4;
  block[3] = &unk_100020F18;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

- (void)didWriteLog:(id)a3 filePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticMonitorLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Log write succeeded: %@", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E028;
  block[3] = &unk_100020F18;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

- (void)failedToWriteLog:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DiagnosticMonitorLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Log write failed: %@", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E25C;
  block[3] = &unk_100020F18;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.osanalytics.canusediagnosticmonitor"]);
  unsigned int v7 = [v6 BOOLValue];

  uint64_t v8 = DiagnosticMonitorLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10001599C(v5);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_100015A0C(v5, v10);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E464;
  block[3] = &unk_100020F40;
  block[4] = self;
  id v15 = v5;
  char v16 = v7;
  id v12 = v5;
  dispatch_async(queue, block);

  return 1;
}

- (void)q_addConnection:(id)a3 entitled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = -[Client initWithConnection:entitled:](objc_alloc(&OBJC_CLASS___Client), "initWithConnection:entitled:", v6, v4);
  uint64_t v8 = OSADiagnosticMonitorClientInterface(-[NSMutableSet addObject:](self->_clients, "addObject:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 setRemoteObjectInterface:v9];

  uint64_t v10 = OSADiagnosticMonitorServerInterface();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:v7];
  [v6 _setQueue:self->_queue];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_10000E584;
  char v16 = &unk_100020F68;
  id v17 = v7;
  v18 = self;
  id v12 = v7;
  [v6 setInvalidationHandler:&v13];
  objc_msgSend(v6, "resume", v13, v14, v15, v16);
}

- (void).cxx_destruct
{
}

@end