@interface BKSystemShellServiceListener
- (BKSystemShellServiceListener)initWithSentinel:(id)a3;
- (BOOL)_remoteProcessIsAlreadyConnected:(id)a3;
- (BOOL)_validateConnection:(id)a3 withContext:(id)a4 forListenerLabel:(id)a5;
- (void)_activateConnection:(id)a3 withContext:(id)a4;
- (void)_dataMigrationCheckInListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)_shellListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)activate;
- (void)activateForDataMigration;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation BKSystemShellServiceListener

- (BKSystemShellServiceListener)initWithSentinel:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___BKSystemShellServiceListener;
  v6 = -[BKSystemShellServiceListener init](&v22, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](&OBJC_CLASS___BSDispatchQueueAttributes, "serial"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceClass:25]);
    uint64_t v9 = BSDispatchQueueCreate(@"com.apple.backboard.systemshell", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_systemShellSentinel, a3);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000B3BC;
    v20[3] = &unk_1000B8190;
    v11 = v6;
    v21 = v11;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v20));
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000B420;
    v18[3] = &unk_1000B8190;
    v14 = v11;
    v19 = v14;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[BSServiceConnectionListener listenerWithConfigurator:]( &OBJC_CLASS___BSServiceConnectionListener,  "listenerWithConfigurator:",  v18));
    dataMigrationCheckInListener = v14->_dataMigrationCheckInListener;
    v14->_dataMigrationCheckInListener = (BSServiceConnectionListener *)v15;
  }

  return v6;
}

- (void)activate
{
}

- (void)activateForDataMigration
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  v18 = (BSServiceConnectionListener *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_connectionListener == v18)
  {
    -[BKSystemShellServiceListener _shellListener:didReceiveConnection:withContext:]( self,  "_shellListener:didReceiveConnection:withContext:");
    goto LABEL_5;
  }

  if (self->_dataMigrationCheckInListener == v18)
  {
    -[BKSystemShellServiceListener _dataMigrationCheckInListener:didReceiveConnection:withContext:]( self,  "_dataMigrationCheckInListener:didReceiveConnection:withContext:");
LABEL_5:

    return;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"shouldn't be here"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v15 = (objc_class *)objc_opt_class(self, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138544642;
    v20 = v13;
    __int16 v21 = 2114;
    objc_super v22 = v17;
    __int16 v23 = 2048;
    v24 = self;
    __int16 v25 = 2114;
    v26 = @"BKSystemShellServiceListener.m";
    __int16 v27 = 1024;
    int v28 = 81;
    __int16 v29 = 2114;
    v30 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
  }

  _bs_set_crash_log_message([v11 UTF8String]);
  __break(0);
}

- (BOOL)_remoteProcessIsAlreadyConnected:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 auditToken]);
  id v5 = v4;
  if (v4) {
    [v4 realToken];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  BOOL v6 = -[BKSystemShellSentinel auditTokenRepresentsSystemApp:]( self->_systemShellSentinel,  "auditTokenRepresentsSystemApp:",  v8);

  return v6;
}

- (void)_activateConnection:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  uint64_t v7 = BKSSystemShellConnectionContextKeyLaunchJobLabel;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 decodeStringForKey:v7]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 decodeStringForKey:BKSSystemShellConnectionContextKeyBundlePath]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 decodeStringForKey:BKSSystemShellConnectionContextKeyBundleID]);
  [v8 decodeDoubleForKey:BKSSystemShellConnectionContextKeyIdleSleepInterval];
  uint64_t v13 = v12;
  id v14 = [v8 decodeInt64ForKey:BKSSystemShellConnectionContextKeyWatchdogType];

  if (!v9)
  {
    uint64_t v17 = BKLogSystemShell();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v19 = "missing jobLabel";
    goto LABEL_12;
  }

  if (!v10)
  {
    uint64_t v20 = BKLogSystemShell();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v19 = "missing bundlePath";
    goto LABEL_12;
  }

  if (!v11)
  {
    uint64_t v21 = BKLogSystemShell();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v19 = "missing bundleIdentifier";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_13:

    if ((unint64_t)v14 < 2)
    {
LABEL_17:
      [v6 invalidate];
      goto LABEL_18;
    }

- (BOOL)_validateConnection:(id)a3 withContext:(id)a4 forListenerLabel:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
  int v9 = [v8 pid];
  uint64_t v10 = BKLogSystemShell();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138543874;
    id v19 = v7;
    __int16 v20 = 2114;
    *(void *)uint64_t v21 = v6;
    *(_WORD *)&v21[8] = 1024;
    *(_DWORD *)&v21[10] = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[%{public}@] received connection -- %{public}@ pid:%d",  (uint8_t *)&v18,  0x1Cu);
  }

  if (v9 <= 0)
  {
    uint64_t v13 = BKLogSystemShell();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543874;
      id v19 = v7;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = v9;
      *(_WORD *)&v21[4] = 2114;
      *(void *)&v21[6] = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "[%{public}@] dropping connection with junk pid (%d) -- %{public}@, ",  (uint8_t *)&v18,  0x1Cu);
    }

    [v6 invalidate];
    goto LABEL_12;
  }

  if (([v8 hasEntitlement:BKBackBoardClientEntitlement] & 1) == 0)
  {
    uint64_t v15 = BKLogSystemShell();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543618;
      id v19 = v7;
      __int16 v20 = 2114;
      *(void *)uint64_t v21 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[%{public}@] '%{public}@' is not a system shell",  (uint8_t *)&v18,  0x16u);
    }

LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }

  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (void)_dataMigrationCheckInListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
  unsigned int v8 = -[BKSystemShellServiceListener _remoteProcessIsAlreadyConnected:](self, "_remoteProcessIsAlreadyConnected:", v7);

  if (v8)
  {
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    uint64_t v15 = sub_10000B034;
    v16 = &unk_1000B5810;
    id v9 = v6;
    id v17 = v9;
    int v18 = self;
    [v9 configureConnection:&v13];
    objc_msgSend(v9, "activate", v13, v14, v15, v16);
  }

  else
  {
    uint64_t v10 = BKLogSystemShell();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteProcess]);
      *(_DWORD *)buf = 138543362;
      __int16 v20 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[DataMigrationCheckIn] unknown system shell:'%{public}@'",  buf,  0xCu);
    }

    [v6 invalidate];
  }
}

- (void)_shellListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (-[BKSystemShellServiceListener _validateConnection:withContext:forListenerLabel:]( self,  "_validateConnection:withContext:forListenerLabel:",  v9,  v7,  @"Shell"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10000AC84;
    v10[3] = &unk_1000B5810;
    id v8 = v9;
    id v11 = v8;
    BOOL v12 = self;
    [v8 configureConnection:v10];
    -[BKSystemShellServiceListener _activateConnection:withContext:](self, "_activateConnection:withContext:", v8, v7);
  }

  else
  {
    [v9 invalidate];
  }
}

- (void).cxx_destruct
{
}

@end