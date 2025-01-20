@interface PBEARCDeprecatedConfigurator
- (BSWatchdog)watchdog;
- (OS_dispatch_queue)watchdogQueue;
- (PBEARCDeprecatedConfigurator)init;
- (id)completionBlock;
- (void)_stopAndCallCompletionWithStatus:(int64_t)a3 error:(id)a4;
- (void)_toggleFeatureState:(unint64_t)a3 completion:(id)a4;
- (void)dealloc;
- (void)eARCStatusChanged:(int64_t)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)setWatchdogQueue:(id)a3;
@end

@implementation PBEARCDeprecatedConfigurator

- (PBEARCDeprecatedConfigurator)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBEARCDeprecatedConfigurator;
  v2 = -[PBEARCDeprecatedConfigurator init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.PineBoard.eARC.legacy.callback", v4);
    watchdogQueue = v2->_watchdogQueue;
    v2->_watchdogQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
    [v7 addEARCObserver:v2];

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
  [v3 removeEARCObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBEARCDeprecatedConfigurator;
  -[PBEARCDeprecatedConfigurator dealloc](&v4, "dealloc");
}

- (void)_toggleFeatureState:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  if (self->_completionBlock)
  {
    v7 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    v31 = @"Failed to toggle (e)ARC, existing operation in progress";
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    v9 = -[NSError initWithDomain:code:userInfo:]( v7,  "initWithDomain:code:userInfo:",  PBSDisplayManagerErrorDomain,  832004LL,  v8);

    if (v6) {
      v6[2](v6, -1LL, v9);
    }
  }

  else
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 earcClient]);
    BOOL v12 = v11 == 0LL;

    if (v12)
    {
      v21 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v22 = PBSEARCConfiguratorErrorDomain;
      NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
      v29 = @"(e)ARC is not supported on this Apple TV.";
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      v9 = -[NSError initWithDomain:code:userInfo:](v21, "initWithDomain:code:userInfo:", v22, 12000LL, v23);

      if (v6) {
        v6[2](v6, 0LL, v9);
      }
    }

    else
    {
      if (v6)
      {
        id v13 = [v6 copy];
        id completionBlock = self->_completionBlock;
        self->_id completionBlock = v13;

        objc_initWeak(&location, self);
        v15 = objc_alloc(&OBJC_CLASS___BSWatchdog);
        watchdogQueue = self->_watchdogQueue;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = sub_1000FECA8;
        v25[3] = &unk_1003D1228;
        objc_copyWeak(&v26, &location);
        v17 = -[BSWatchdog initWithTimeout:queue:completion:]( v15,  "initWithTimeout:queue:completion:",  watchdogQueue,  v25,  10.0);
        watchdog = self->_watchdog;
        self->_watchdog = v17;

        -[BSWatchdog start](self->_watchdog, "start");
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBEARCConfigurator sharedInstance](&OBJC_CLASS___PBEARCConfigurator, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 earcClient]);
      id v24 = 0LL;
      [v20 setFeatureState:a3 error:&v24];
      v9 = (NSError *)v24;

      if (v9) {
        -[PBEARCDeprecatedConfigurator _stopAndCallCompletionWithStatus:error:]( self,  "_stopAndCallCompletionWithStatus:error:",  -1LL,  v9);
      }
    }
  }
}

- (void)_stopAndCallCompletionWithStatus:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  watchdogQueue = (dispatch_queue_s *)self->_watchdogQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FEE44;
  block[3] = &unk_1003D1718;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(watchdogQueue, block);
}

- (void)eARCStatusChanged:(int64_t)a3
{
  if (a3 != 1) {
    -[PBEARCDeprecatedConfigurator _stopAndCallCompletionWithStatus:error:]( self,  "_stopAndCallCompletionWithStatus:error:",  a3,  0LL,  v3,  v4);
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (OS_dispatch_queue)watchdogQueue
{
  return self->_watchdogQueue;
}

- (void)setWatchdogQueue:(id)a3
{
}

- (BSWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setWatchdog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end