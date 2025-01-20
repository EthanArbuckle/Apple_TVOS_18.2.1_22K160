@interface PBAppInfoStateDataSource
- (BBObserver)bbObserver;
- (BOOL)isAnyTerminationAssertionInEffectForApplication:(id)a3;
- (BOOL)isApplicationRecentlyUpdated:(id)a3;
- (BOOL)isBadgeEnabledForApplication:(id)a3;
- (FBSApplicationDataStoreMonitor)monitor;
- (NSMutableDictionary)queue_appStateByBundleIdentifier;
- (NSMutableSet)queue_bundleIdentifiersWithTerminationAssertions;
- (OS_dispatch_queue)accessQueue;
- (PBAppInfoStateDataSource)init;
- (UISApplicationStateService)uiAppStateService;
- (id)_queueAppStateForBundleIdentifier:(id)a3;
- (id)_queueDeleteStateForBundleIdentifier:(id)a3;
- (id)badgeValueForApplication:(id)a3;
- (id)dataSourceForApplicationBundleIdentifier:(id)a3;
- (void)_updateBadgeEnabledWithInfos:(id)a3;
- (void)dataStoreMonitor:(id)a3 didUpdateApplication:(id)a4 forKey:(id)a5;
- (void)dealloc;
- (void)invalidateStateForApplicationWithBundleIdentifier:(id)a3;
- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)setAnyTerminationAssertionInEffect:(BOOL)a3 forApplicationWithBundleIdentifier:(id)a4;
- (void)setBadgeEnabled:(BOOL)a3 forApplicationWithBundleIdentifier:(id)a4;
- (void)setBadgeValue:(id)a3 forApplicationWithBundleIdentifier:(id)a4;
- (void)setNeedsUpdate;
- (void)setRecentlyUpdated:(BOOL)a3 forApplicationWithBundleIdentifier:(id)a4;
@end

@implementation PBAppInfoStateDataSource

- (PBAppInfoStateDataSource)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBAppInfoStateDataSource;
  v2 = -[PBAppInfoStateDataSource init](&v18, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PineBoard.PBAppInfoStateDataSource.access", 0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    queue_bundleIdentifiersWithTerminationAssertions = v2->_queue_bundleIdentifiersWithTerminationAssertions;
    v2->_queue_bundleIdentifiersWithTerminationAssertions = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queue_appStateByBundleIdentifier = v2->_queue_appStateByBundleIdentifier;
    v2->_queue_appStateByBundleIdentifier = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___FBSApplicationDataStoreMonitor);
    monitor = v2->_monitor;
    v2->_monitor = v9;

    -[FBSApplicationDataStoreMonitor addObserver:](v2->_monitor, "addObserver:", v2);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PineBoard.PBAppInfoStateDataSource.BBObserver", 0LL);
    v12 = -[BBObserver initWithQueue:](objc_alloc(&OBJC_CLASS___BBObserver), "initWithQueue:", v11);
    bbObserver = v2->_bbObserver;
    v2->_bbObserver = v12;

    -[BBObserver setDelegate:](v2->_bbObserver, "setDelegate:", v2);
    -[BBObserver setObserverFeed:](v2->_bbObserver, "setObserverFeed:", 512LL);
    v14 = (dispatch_queue_s *)v2->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001B6020;
    block[3] = &unk_1003CFF08;
    v17 = v2;
    dispatch_sync(v14, block);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBAppInfoStateDataSource;
  -[PBAppInfoStateDataSource dealloc](&v3, "dealloc");
}

- (id)badgeValueForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1001B61D4;
  v16 = sub_1001B61E4;
  id v17 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B61FC;
  block[3] = &unk_1003D0AD8;
  id v10 = v4;
  dispatch_queue_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)isBadgeEnabledForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B6318;
  block[3] = &unk_1003D0AD8;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (BOOL)isApplicationRecentlyUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B6428;
  block[3] = &unk_1003D0AD8;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (BOOL)isAnyTerminationAssertionInEffectForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B6538;
  block[3] = &unk_1003D0AD8;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (void)setBadgeValue:(id)a3 forApplicationWithBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001B6664;
  v11[3] = &unk_1003D0378;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(accessQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)setBadgeEnabled:(BOOL)a3 forApplicationWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001B67B4;
  v9[3] = &unk_1003D96D0;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_sync(accessQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setRecentlyUpdated:(BOOL)a3 forApplicationWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001B68CC;
  v9[3] = &unk_1003D96D0;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_sync(accessQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setAnyTerminationAssertionInEffect:(BOOL)a3 forApplicationWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0LL;
  objc_super v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_1001B6A0C;
  BOOL v12 = &unk_1003DB5B0;
  id v13 = self;
  id v8 = v6;
  BOOL v16 = a3;
  id v14 = v8;
  v15 = &v17;
  dispatch_sync(accessQueue, &v9);
  if (*((_BYTE *)v18 + 24)) {
    -[PBAppInfoStateDataSource setNeedsUpdate](self, "setNeedsUpdate", v9, v10, v11, v12, v13);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)invalidateStateForApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B6AE4;
  v7[3] = &unk_1003CFEB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)_updateBadgeEnabledWithInfos:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B6BC0;
  block[3] = &unk_1003D0418;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v5 = a4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

    -[PBAppInfoStateDataSource _updateBadgeEnabledWithInfos:](self, "_updateBadgeEnabledWithInfos:", v6, v7);
  }

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001B6E6C;
    v7[3] = &unk_1003D0A60;
    objc_copyWeak(&v8, &location);
    [v6 getSectionInfoWithCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)dataStoreMonitor:(id)a3 didUpdateApplication:(id)a4 forKey:(id)a5
{
}

- (id)dataSourceForApplicationBundleIdentifier:(id)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppInfoStateDataSource _queueAppStateForBundleIdentifier:]( self,  "_queueAppStateForBundleIdentifier:",  v5));

  return v6;
}

- (void)setNeedsUpdate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B6F98;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)_queueAppStateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v5 = (_PBSAppState *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_queue_appStateByBundleIdentifier,  "objectForKey:",  v4));
  if (!v5)
  {
    id v5 = -[_PBSAppState initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS____PBSAppState),  "initWithBundleIdentifier:",  v4);
    -[NSMutableDictionary setObject:forKey:](self->_queue_appStateByBundleIdentifier, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)_queueDeleteStateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_queue_appStateByBundleIdentifier, "objectForKey:", v4));
  id v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    -[NSMutableDictionary removeObjectForKey:](self->_queue_appStateByBundleIdentifier, "removeObjectForKey:", v4);
    id v7 = sub_100082574();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Invalidated app state for application: %@",  (uint8_t *)&v10,  0xCu);
    }
  }

  return v6;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableSet)queue_bundleIdentifiersWithTerminationAssertions
{
  return self->_queue_bundleIdentifiersWithTerminationAssertions;
}

- (NSMutableDictionary)queue_appStateByBundleIdentifier
{
  return self->_queue_appStateByBundleIdentifier;
}

- (FBSApplicationDataStoreMonitor)monitor
{
  return self->_monitor;
}

- (BBObserver)bbObserver
{
  return self->_bbObserver;
}

- (UISApplicationStateService)uiAppStateService
{
  return self->_uiAppStateService;
}

- (void).cxx_destruct
{
}

@end