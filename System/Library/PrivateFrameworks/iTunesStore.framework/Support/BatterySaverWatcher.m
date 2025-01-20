@interface BatterySaverWatcher
- (BOOL)batterySaverEnabled;
- (BatterySaverWatcher)initWithDelegate:(id)a3;
- (BatterySaverWatcherDelegate)delegate;
- (unint64_t)_getState;
- (void)_notifyDelegate;
- (void)_registerNotifier;
- (void)_updateStatus;
- (void)dealloc;
@end

@implementation BatterySaverWatcher

- (BatterySaverWatcher)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BatterySaverWatcher;
  v5 = -[BatterySaverWatcher init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    v5->_enabled = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[BatterySaverWatcher _registerNotifier](v6, "_registerNotifier");
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BatterySaverWatcher;
  -[BatterySaverWatcher dealloc](&v3, "dealloc");
}

- (BOOL)batterySaverEnabled
{
  v2 = self;
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x2020000000LL;
  char v7 = 0;
  notifyQueue = (dispatch_queue_s *)self->_notifyQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100021EDC;
  v5[3] = &unk_10034AFE0;
  v5[4] = v2;
  v5[5] = v6;
  dispatch_sync(notifyQueue, v5);
  LOBYTE(v2) = v2->_enabled;
  _Block_object_dispose(v6, 8);
  return (char)v2;
}

- (unint64_t)_getState
{
  uint64_t state64 = 0LL;
  int token = self->_token;
  if (!token) {
    return 0LL;
  }
  notify_get_state(token, &state64);
  return state64;
}

- (void)_notifyDelegate
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021F9C;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_registerNotifier
{
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.BatterySaverWatcher", 0LL);
  notifyQueue = self->_notifyQueue;
  self->_notifyQueue = v3;

  objc_initWeak(&location, self);
  v5 = (dispatch_queue_s *)self->_notifyQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000220FC;
  handler[3] = &unk_10034B3A8;
  handler[4] = self;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch("com.apple.system.batterysavermode.discretionary", &self->_token, v5, handler);
  v6 = (dispatch_queue_s *)self->_notifyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022144;
  v7[3] = &unk_10034AC30;
  v7[4] = self;
  dispatch_sync(v6, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_updateStatus
{
  BOOL v3 = -[BatterySaverWatcher _getState](self, "_getState") != 0;
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    -[BatterySaverWatcher _notifyDelegate](self, "_notifyDelegate");
  }

- (BatterySaverWatcherDelegate)delegate
{
  return (BatterySaverWatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
}

@end