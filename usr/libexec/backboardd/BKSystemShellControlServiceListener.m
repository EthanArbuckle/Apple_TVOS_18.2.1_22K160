@interface BKSystemShellControlServiceListener
- (BKSystemShellControlServiceListener)initWithSentinel:(id)a3;
- (void)activate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation BKSystemShellControlServiceListener

- (BKSystemShellControlServiceListener)initWithSentinel:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  [v17 superclass] = [BKSystemShellControlServiceListener class];
  BKSystemShellControlServiceListener *v6 = [[BKSystemShellControlServiceListener alloc] init];
  if (v6)
  {
    v7 = [BSDispatchQueueAttributes serial];
    v8 = [v7 serviceClass:25];
    uint64_t v9 = BSDispatchQueueCreate(@"com.apple.backboard.systemshell-control", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    [v6 setSystemShellSentinel:a3];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100070DCC;
    v15[3] = &unk_1000B8190;
    v11 = v6;
    v16 = v11;
    uint64_t v12 = [BSServiceConnectionListener listenerWithConfigurator:v15];
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;
  }

  return v6;
}

- (void)activate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v7 = [v6 remoteProcess];
  id v8 = [v7 pid];
  int v9 = (int)v8;
  uint64_t v10 = BKLogSystemShell(v8);
  v11 = [os_log logWithName:v10];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v22 = v6;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "shell control connection -- %{public}@ pid:%d",  buf,  0x12u);
  }

  if (v9 <= 0)
  {
    uint64_t v14 = BKLogSystemShell(v12);
    v15 = v14;
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      [v6 invalidate];
      goto LABEL_10;
    }

    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v22 = v9;
    *(_WORD *)&v22[4] = 2114;
    *(void *)&v22[6] = v6;
    v16 = "dropping connection with junk pid (%d) -- %{public}@, ";
    objc_super v17 = (os_log_s *)v15;
    uint32_t v18 = 18;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_9;
  }

  id v13 = [v7 hasEntitlement:BKReplaceSystemAppEntitlement];
  if (!(_DWORD)v13)
  {
    uint64_t v19 = BKLogSystemShell(v13);
    v15 = v19;
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)v22 = v7;
    v16 = "'%{public}@' is not appropriately entitled";
    objc_super v17 = (os_log_s *)v15;
    uint32_t v18 = 12;
    goto LABEL_12;
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100070C98;
  v20[3] = &unk_1000B8218;
  v20[4] = self;
  [v6 configureConnection:v20];
  [v6 activate];
LABEL_10:
}

- (void).cxx_destruct
{
}

@end