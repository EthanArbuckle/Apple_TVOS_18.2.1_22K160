@interface IAPApplicationStateMonitor
- (BOOL)isAnyAppOpenInForeground;
- (IAPApplicationStateMonitor)init;
- (IAPApplicationStateMonitorDelegate)delegate;
- (NSMutableSet)foregroundAppBundleIDsMutable;
- (NSSet)foregroundAppBundleIDs;
- (OS_dispatch_queue)foregroundBundleIDsQueue;
- (id)applicationInfoForBundleIDSync:(id)a3;
- (id)applicationInfoForPIDSync:(int)a3;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setForegroundAppBundleIDsMutable:(id)a3;
- (void)setForegroundBundleIDsQueue:(id)a3;
- (void)sharedInit;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation IAPApplicationStateMonitor

- (void)sharedInit
{
  v3 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "sharedMonitorForDisplayType:",  0LL));
  sharedDisplayLayoutMonitor = self->_sharedDisplayLayoutMonitor;
  self->_sharedDisplayLayoutMonitor = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[IAPApplicationStateMonitor setForegroundAppBundleIDsMutable:](self, "setForegroundAppBundleIDsMutable:", v5);

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.iap.appStateMonitorQueue", 0LL);
  -[IAPApplicationStateMonitor setForegroundBundleIDsQueue:](self, "setForegroundBundleIDsQueue:", v6);

  self->_observingFBSLayoutMonitor = 0;
}

- (IAPApplicationStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IAPApplicationStateMonitor;
  v2 = -[IAPApplicationStateMonitor init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___BKSApplicationStateMonitor);
    appStateMonitor = v2->_appStateMonitor;
    v2->_appStateMonitor = v3;

    -[IAPApplicationStateMonitor sharedInit](v2, "sharedInit");
  }

  return v2;
}

- (void)dealloc
{
  if ((((int)self + 8) & 7LL) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    -[BKSApplicationStateMonitor invalidate](self->_appStateMonitor, "invalidate");
    appStateMonitor = self->_appStateMonitor;
    self->_appStateMonitor = 0LL;

    -[IAPApplicationStateMonitor setForegroundAppBundleIDsMutable:](self, "setForegroundAppBundleIDsMutable:", 0LL);
    -[IAPApplicationStateMonitor setForegroundBundleIDsQueue:](self, "setForegroundBundleIDsQueue:", 0LL);
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___IAPApplicationStateMonitor;
    -[IAPApplicationStateMonitor dealloc](&v4, "dealloc");
  }

- (void)startObserving
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472LL;
  v5 = sub_10004DB20;
  objc_super v6 = &unk_1001055C8;
  objc_copyWeak(&v7, &location);
  if (((unint64_t)&self->_appStateMonitor & 7) != 0
    || (-[BKSApplicationStateMonitor setHandler:](self->_appStateMonitor, "setHandler:", &v3),
        self->_observingFBSLayoutMonitor = 1,
        (((int)self + 16) & 7LL) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    -[FBSDisplayLayoutMonitor addObserver:](self->_sharedDisplayLayoutMonitor, "addObserver:", self, v3, v4, v5, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

- (void)stopObserving
{
  if ((((int)self + 8) & 7LL) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    -[BKSApplicationStateMonitor invalidate](self->_appStateMonitor, "invalidate");
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IAPApplicationStateMonitor foregroundBundleIDsQueue](self, "foregroundBundleIDsQueue"));
    if (v3)
    {
      uint64_t v4 = v3;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10004DE48;
      block[3] = &unk_1001055F0;
      block[4] = self;
      dispatch_sync(v3, block);

      return;
    }
  }

  __break(0x5510u);
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[IAPApplicationStateMonitor foregroundBundleIDsQueue](self, "foregroundBundleIDsQueue"));
  if (v10)
  {
    v11 = (dispatch_queue_s *)v10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004DF74;
    block[3] = &unk_100105618;
    block[4] = self;
    id v15 = v8;
    id v12 = v8;
    dispatch_sync(v11, block);
  }

  else
  {
    __break(0x5510u);
  }

- (id)applicationInfoForBundleIDSync:(id)a3
{
  id result = a3;
  if (((unint64_t)&self->_appStateMonitor & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    id v5 = result;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( -[BKSApplicationStateMonitor applicationInfoForApplication:]( self->_appStateMonitor,  "applicationInfoForApplication:",  result));

    return v6;
  }

  return result;
}

- (id)applicationInfoForPIDSync:(int)a3
{
  if (((unint64_t)&self->_appStateMonitor & 7) == 0) {
    return -[BKSApplicationStateMonitor applicationInfoForPID:]( self->_appStateMonitor,  "applicationInfoForPID:",  *(void *)&a3);
  }
  __break(0x5516u);
  return -[IAPApplicationStateMonitor applicationInfoForPID:](self, "applicationInfoForPID:", *(void *)&a3);
}

- (NSSet)foregroundAppBundleIDs
{
  uint64_t v5 = 0LL;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_10004E248;
  id v9 = sub_10004E258;
  id v10 = 0LL;
  if (((unint64_t)&self[6] & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    isa = (dispatch_queue_s *)self[6].super.isa;
    if (isa)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_10004E260;
      v4[3] = &unk_100105640;
      v4[4] = self;
      v4[5] = &v5;
      dispatch_sync(isa, v4);
      id v3 = (id)v6[5];
      _Block_object_dispose(&v5, 8);

      return (NSSet *)v3;
    }
  }

  __break(0x5510u);
  return self;
}

- (IAPApplicationStateMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IAPApplicationStateMonitorDelegate *)a3;
}

- (BOOL)isAnyAppOpenInForeground
{
  unsigned int isAnyAppOpenInForeground = self->_isAnyAppOpenInForeground;
  if (isAnyAppOpenInForeground >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = isAnyAppOpenInForeground != 0;
  }
  return (char)self;
}

- (NSMutableSet)foregroundAppBundleIDsMutable
{
  return self->_foregroundAppBundleIDsMutable;
}

- (void)setForegroundAppBundleIDsMutable:(id)a3
{
}

- (OS_dispatch_queue)foregroundBundleIDsQueue
{
  return self->_foregroundBundleIDsQueue;
}

- (void)setForegroundBundleIDsQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end