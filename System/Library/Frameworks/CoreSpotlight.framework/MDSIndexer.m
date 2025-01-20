@interface MDSIndexer
- (BOOL)blocklistCheck:(id)a3 withOptions:(int64_t)a4;
- (BOOL)deviceFirstUnlockedInMKB;
- (BOOL)deviceFirstUnlockedInSB;
- (BOOL)deviceUnlocked;
- (BOOL)disableABCReporting:(id)a3;
- (BOOL)indexingEnabled;
- (BOOL)managedIndex;
- (BOOL)privateIndex;
- (BOOL)setupHasComplete;
- (BOOL)unlockedSinceBoot;
- (MDSIndexer)init;
- (OS_dispatch_queue)firstUnlockQueue;
- (OS_dispatch_queue)indexQueue;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_source)firstUnlockTimer;
- (SPCoreSpotlightIndexer)indexer;
- (_MDIndexExtensionManager)extensionDelegate;
- (id)disabledBundleSet;
- (id)extraTTRInfo;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)indexDirectory;
- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 resultsHandler:(id)a5 completionHandler:(id)a6;
- (int)keybagLockStateNotifyToken;
- (void)didReceiveMemoryPressureNotification:(unint64_t)a3;
- (void)didReceiveSignal:(unint64_t)a3;
- (void)setDeviceFirstUnlockedInMKB:(BOOL)a3;
- (void)setExtensionDelegate:(id)a3;
- (void)setFirstUnlockQueue:(id)a3;
- (void)setFirstUnlockTimer:(id)a3;
- (void)setIndexQueue:(id)a3;
- (void)setIndexer:(id)a3;
- (void)setKeybagLockStateNotifyToken:(int)a3;
- (void)setNotificationQueue:(id)a3;
- (void)shutdown;
- (void)updateApplicationsWithCompletion:(id)a3 clean:(BOOL)a4;
@end

@implementation MDSIndexer

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ((objc_opt_respondsToSelector(self->_indexer, a3) & 1) != 0) {
    v4 = self->_indexer;
  }
  else {
    v4 = 0LL;
  }
  return v4;
}

- (MDSIndexer)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MDSIndexer;
  id v2 = -[MDSIndexer init](&v30, "init");
  if (v2)
  {
    dispatch_queue_attr_t initially_inactive = dispatch_queue_attr_make_initially_inactive(0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(initially_inactive);
    uint64_t v5 = dispatch_queue_attr_make_with_overcommit(v4, 1LL);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.spotlight.index", v10);
    v12 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_BACKGROUND, 0);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.spotlight.locknotification", v16);
    v18 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v17;

    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_initially_inactive(0LL);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_t v23 = dispatch_queue_create_with_target_V2( "com.apple.spotlight.index.firstUnlock",  v22,  *((dispatch_queue_t *)v2 + 4));
    v24 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v23;

    +[SPCoreSpotlightIndexer setIndexerDelegate:](&OBJC_CLASS___SPCoreSpotlightIndexer, "setIndexerDelegate:", v2);
    dispatch_activate(*((dispatch_object_t *)v2 + 6));
    *((_BYTE *)v2 + 8) = 1;
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[SPCoreSpotlightIndexer sharedInstance](&OBJC_CLASS___SPCoreSpotlightIndexer, "sharedInstance"));
    v26 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v25;

    +[SDSignalHandler setDelegate:memoryStatusFlags:]( &OBJC_CLASS___SDSignalHandler,  "setDelegate:memoryStatusFlags:",  v2,  55LL);
    uint64_t v27 = logForCSLogCategoryIndex(+[SDSignalHandler setupHandlers](&OBJC_CLASS___SDSignalHandler, "setupHandlers"));
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "com.apple.spotlight.index";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Activating %s queue", buf, 0xCu);
    }

    dispatch_activate(*((dispatch_object_t *)v2 + 4));
    [*((id *)v2 + 3) start];
  }

  return (MDSIndexer *)v2;
}

- (void)shutdown
{
}

- (OS_dispatch_queue)indexQueue
{
  return self->_indexQueue;
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return self->_firstUnlockQueue;
}

- (BOOL)privateIndex
{
  return 0;
}

- (BOOL)managedIndex
{
  return 0;
}

- (BOOL)unlockedSinceBoot
{
  return 1;
}

- (BOOL)deviceFirstUnlockedInMKB
{
  return self->_deviceFirstUnlockedInMKB;
}

- (BOOL)deviceFirstUnlockedInSB
{
  return self->_deviceFirstUnlockedInMKB;
}

- (BOOL)deviceUnlocked
{
  return 1;
}

- (BOOL)indexingEnabled
{
  return 1;
}

- (BOOL)setupHasComplete
{
  return 1;
}

- (void)updateApplicationsWithCompletion:(id)a3 clean:(BOOL)a4
{
}

- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 resultsHandler:(id)a5 completionHandler:(id)a6
{
  return 0LL;
}

- (BOOL)blocklistCheck:(id)a3 withOptions:(int64_t)a4
{
  return 0;
}

- (id)disabledBundleSet
{
  return 0LL;
}

- (id)indexDirectory
{
  id v2 = NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"/Library/Spotlight/CoreSpotlight"]);

  return v4;
}

- (id)extraTTRInfo
{
  return 0LL;
}

- (BOOL)disableABCReporting:(id)a3
{
  return 0;
}

- (void)didReceiveSignal:(unint64_t)a3
{
  if (a3 == 1)
  {
    +[SPCoreSpotlightIndexer sync](&OBJC_CLASS___SPCoreSpotlightIndexer, "sync");
  }

  else if (a3 == 15)
  {
    +[SPCoreSpotlightIndexer shutdown](&OBJC_CLASS___SPCoreSpotlightIndexer, "shutdown");
  }

- (void)didReceiveMemoryPressureNotification:(unint64_t)a3
{
  if (a3 != 1) {
    +[SPCoreSpotlightIndexer shrink:](&OBJC_CLASS___SPCoreSpotlightIndexer, "shrink:", a3);
  }
}

- (_MDIndexExtensionManager)extensionDelegate
{
  return (_MDIndexExtensionManager *)objc_loadWeakRetained((id *)&self->_extensionDelegate);
}

- (void)setExtensionDelegate:(id)a3
{
}

- (SPCoreSpotlightIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
}

- (void)setIndexQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (void)setFirstUnlockQueue:(id)a3
{
}

- (OS_dispatch_source)firstUnlockTimer
{
  return self->_firstUnlockTimer;
}

- (void)setFirstUnlockTimer:(id)a3
{
}

- (int)keybagLockStateNotifyToken
{
  return self->_keybagLockStateNotifyToken;
}

- (void)setKeybagLockStateNotifyToken:(int)a3
{
  self->_keybagLockStateNotifyToken = a3;
}

- (void)setDeviceFirstUnlockedInMKB:(BOOL)a3
{
  self->_deviceFirstUnlockedInMKB = a3;
}

- (void).cxx_destruct
{
}

@end