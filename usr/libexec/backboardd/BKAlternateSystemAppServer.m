@interface BKAlternateSystemAppServer
+ (id)sharedInstance;
- (BKAlternateSystemAppManager)alternateSystemAppManager;
- (BKAlternateSystemAppServer)init;
- (BOOL)_queue_listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)clientConnection;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (void)_handleInterruptedOrInvalidatedConnection;
- (void)blockSystemAppForAlternateSystemApp;
- (void)dealloc;
- (void)openAlternateSystemAppWithBundleID:(id)a3;
- (void)run;
- (void)setAlternateSystemAppManager:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)terminateAlternateSystemAppWithBundleID:(id)a3;
- (void)unblockSystemAppForAlternateSystemApp;
@end

@implementation BKAlternateSystemAppServer

- (BKAlternateSystemAppServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___BKAlternateSystemAppServer;
  v2 = -[BKAlternateSystemAppServer init](&v10, "init");
  if (v2)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.backboard.altsysapp");
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v3;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    clientConnection = v2->_clientConnection;
    v2->_clientConnection = 0LL;

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[BKAlternateSystemAppManager sharedInstance]( &OBJC_CLASS___BKAlternateSystemAppManager,  "sharedInstance"));
    -[BKAlternateSystemAppServer setAlternateSystemAppManager:](v2, "setAlternateSystemAppManager:", v6);

    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.backboard.altsysappserver");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BKAlternateSystemAppServer;
  -[BKAlternateSystemAppServer dealloc](&v3, "dealloc");
}

- (void)run
{
}

- (void)_handleInterruptedOrInvalidatedConnection
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062D00;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_queue_listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromAuditToken:](&OBJC_CLASS___BSAuditToken, "tokenFromAuditToken:", v26));
  uint64_t v10 = BKReplaceSystemAppEntitlement;
  id v11 = [v9 hasEntitlement:BKReplaceSystemAppEntitlement];
  if ((v11 & 1) == 0)
  {
    uint64_t v14 = ((uint64_t (*)(void))BKLogAlternateSystemApp)();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[Server] Entitlement %{public}@ required to open alternate system app.",  buf,  0xCu);
    }

    goto LABEL_11;
  }

  if (self->_clientConnection)
  {
    uint64_t v12 = BKLogAlternateSystemApp(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[Server] Rejecting BKAlternateSystemAppServer connection because we already have one",  buf,  2u);
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = BKLogAlternateSystemApp(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[Server] Got a connection request on listener %{public}@: connection %{public}@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v20 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100062C74;
  v15[3] = &unk_1000B7B80;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  v18 = buf;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(queue, v15);
  char v13 = *(_BYTE *)(*(void *)&buf[8] + 24LL);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (void)blockSystemAppForAlternateSystemApp
{
  uint64_t v3 = BKLogAlternateSystemApp(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Server] Received request to block primary system app for alternate system app",  buf,  2u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062B9C;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)unblockSystemAppForAlternateSystemApp
{
  uint64_t v3 = BKLogAlternateSystemApp(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Server] Received request to unblock primary system app for alternate system app",  buf,  2u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100062AAC;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)openAlternateSystemAppWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BKLogAlternateSystemApp(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[Server] Received request to open alternate system app \"%{public}@\"",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100062684;
  v9[3] = &unk_1000B8030;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (void)terminateAlternateSystemAppWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BKLogAlternateSystemApp(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[Server] Received request to terminate alternate system app \"%{public}@\"",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100062534;
  v9[3] = &unk_1000B8030;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BKAlternateSystemAppManager)alternateSystemAppManager
{
  return self->_alternateSystemAppManager;
}

- (void)setAlternateSystemAppManager:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC228 != -1) {
    dispatch_once(&qword_1000DC228, &stru_1000B7B30);
  }
  return (id)qword_1000DC220;
}

@end