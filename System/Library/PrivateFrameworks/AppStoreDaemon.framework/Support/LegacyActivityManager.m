@interface LegacyActivityManager
- (LegacyActivityManager)init;
@end

@implementation LegacyActivityManager

- (LegacyActivityManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___LegacyActivityManager;
  v2 = -[LegacyActivityManager init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    backgroundTaskObservers = v2->_backgroundTaskObservers;
    v2->_backgroundTaskObservers = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.LegacyActivityManager.dispatch", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v2->_observerLock._os_unfair_lock_opaque = 0;
    v9 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100198B1C;
    block[3] = &unk_1003E9880;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end