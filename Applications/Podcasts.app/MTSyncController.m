@interface MTSyncController
+ (BOOL)hasAccountChangedSinceLastSync;
+ (BOOL)isUserLoggedIn;
+ (id)accountIdentifierForLastSync;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)playlistSyncVersion;
+ (id)sharedInstance;
+ (int64_t)syncFlagsForSyncType:(int64_t)a3;
+ (void)didUpdateSubscriptionsSyncVersionForSyncType:(int64_t)a3;
+ (void)resetAccountIdentifierForLastSync;
+ (void)resetAllSubscriptionSyncVersion;
+ (void)resetMetadataToInitialState;
+ (void)resetPlaylistSyncVersion;
+ (void)setAccountIdentifierForLastSync:(id)a3;
+ (void)setPlaylistSyncVersion:(id)a3;
- (AMSPromise)UPPEnabled;
- (BOOL)canScheduleSyncRequest;
- (BOOL)checkViabilityOfSyncLibraryAndUPP;
- (BOOL)hasAccountChangedSinceLastSync;
- (BOOL)hasInterestSyncVersion;
- (BOOL)hasPlaylistSyncVersion;
- (BOOL)hasPodcastSyncV3Version;
- (BOOL)hasPodcastSyncVersion;
- (BOOL)isRunning;
- (BOOL)isSyncing;
- (BOOL)isUserLoggedIn;
- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5;
- (BOOL)resetToInitialStateForced:(BOOL)a3;
- (BOOL)resetToInitialStateForced:(BOOL)a3 completion:(id)a4;
- (BOOL)resetToInitialStateIfIncomplete;
- (BOOL)resetToInitialStateIfNeeded;
- (BOOL)resettingToInitialState;
- (BOOL)resyncWhenDone;
- (BOOL)uppSyncDirtyFlag;
- (MTEpisodeSyncStorage)episodeSyncStorage;
- (MTKeyProcessorPairProvider)keyProcessorPairProvider;
- (MTSyncController)init;
- (MTUniversalPlaybackPositionDataSource)uppDataSource;
- (MZKeyValueStoreController)cloudSyncController;
- (MZUniversalPlaybackPositionStore)UPPStore;
- (NSMutableArray)episodeObservers;
- (NSOperationQueue)queue;
- (NSString)playlistSyncVersion;
- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter;
- (id)addEpisodeObserverUsingBlock:(id)a3;
- (id)expandFeedUrls:(id)a3;
- (id)operationInQueueWithType:(int64_t)a3;
- (int64_t)syncVersionFlags;
- (int64_t)timedOperationTypeForBookmarksSyncType:(int64_t)a3;
- (int64_t)timedOperationTypeForSyncType:(int64_t)a3;
- (unint64_t)backgroundTask;
- (void)_finaliseResetToInitial:(id)a3;
- (void)_setupUPP;
- (void)_synchronousResetToInitialStateDatabase;
- (void)_synchronousResetToInitialStateMetadata;
- (void)addOperation:(id)a3;
- (void)applicationDidEnterBackground;
- (void)dealloc;
- (void)endBackgroundTask;
- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5;
- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4;
- (void)operationFinished:(id)a3;
- (void)performUniversalPlaybackPositionSync;
- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4;
- (void)removeEpisodeObserver:(id)a3;
- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3;
- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3 priority:(int64_t)a4;
- (void)scheduleEpisodeStatePutWithFeedUrls:(id)a3;
- (void)scheduleVeryHighPriorityEpisodeStateGetWithFeedUrls:(id)a3;
- (void)setBackgroundTask:(unint64_t)a3;
- (void)setCloudSyncBugReporter:(id)a3;
- (void)setCloudSyncController:(id)a3;
- (void)setEpisodeObservers:(id)a3;
- (void)setEpisodeSyncStorage:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setKeyProcessorPairProvider:(id)a3;
- (void)setPlaylistSyncVersion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResettingToInitialState:(BOOL)a3;
- (void)setResyncWhenDone:(BOOL)a3;
- (void)setSyncVersionFlags:(int64_t)a3;
- (void)setUPPStore:(id)a3;
- (void)setUppDataSource:(id)a3;
- (void)setUppSyncDirtyFlag:(BOOL)a3;
- (void)start;
- (void)startBackgroundTask;
- (void)startUPPSyncTimerAfterPrivacy;
- (void)syncAllBookkeeperKeys;
- (void)syncCoreKeysIfDirty;
- (void)syncCriticalBookkeeperKeysShouldSyncCleanKeys:(BOOL)a3;
- (void)syncEverything;
- (void)syncMultipleKeysAndProcessors:(id)a3 shouldSyncCleanKeys:(BOOL)a4;
- (void)syncNonFollowedShows;
- (void)syncNonFollowedShowsIfSyncDirty;
- (void)syncSubscriptions;
- (void)syncTermsVersion;
- (void)updateAccountForLastSync;
@end

@implementation MTSyncController

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000891D0;
  block[3] = &unk_100240300;
  block[4] = a1;
  if (qword_1002B6A78 != -1) {
    dispatch_once(&qword_1002B6A78, block);
  }
  return (id)qword_1002B6A70;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance", a3));
}

- (MTSyncController)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MTSyncController;
  v2 = -[MTSyncController init](&v20, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MTSyncController.syncQueue", 0LL);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    episodeObservers = v2->_episodeObservers;
    v2->_episodeObservers = (NSMutableArray *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS____TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v2->_cloudSyncBugReporter;
    v2->_cloudSyncBugReporter = (_TtP8Podcasts21CloudSyncBugReporting_ *)v9;

    v11 = -[MTKeyProcessorPairProvider initWithCloudSyncBugReporter:]( objc_alloc(&OBJC_CLASS___MTKeyProcessorPairProvider),  "initWithCloudSyncBugReporter:",  v2->_cloudSyncBugReporter);
    keyProcessorPairProvider = v2->_keyProcessorPairProvider;
    v2->_keyProcessorPairProvider = v11;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1LL);
    v2->_lastOperation = 0.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v2 selector:"operationFinished:" name:@"MTTimedOperationFinished" object:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"syncCoreKeysIfDirty" name:@"MTFeedUpdateDidEndUpdatingAllFeeds" object:0];

    v15 = objc_opt_new(&OBJC_CLASS___MTEpisodeSyncStorage);
    episodeSyncStorage = v2->_episodeSyncStorage;
    v2->_episodeSyncStorage = v15;

    unint64_t v17 = (unint64_t)[(id)objc_opt_class(v2) syncFlagsForSyncType:0];
    v2->_syncVersionFlags = (unint64_t)[(id)objc_opt_class(v2) syncFlagsForSyncType:1] | v17;
    -[MTSyncController resetToInitialStateIfIncomplete](v2, "resetToInitialStateIfIncomplete");
    v18 = v2;
  }

  return v2;
}

- (void)start
{
  if (!sub_1000895B0())
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](&OBJC_CLASS___IMURLBag, "sharedInstance"));
    v4 = self->_syncQueue;
    BOOL v5 = -[MTSyncController isRunning](self, "isRunning");
    if (v5)
    {
      uint64_t v6 = _MTLogCategoryCloudSync(v5);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "MTSyncController start called, but the controller is already running.";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      }
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
      [v9 addObserver:self];

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
      unsigned __int8 v11 = [v10 isReachable];

      uint64_t v13 = _MTLogCategoryCloudSync(v12);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) != 0)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "MTSyncController start is requesting bag keys",  buf,  2u);
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([v3 URLForKey:kMTSyncGetAll]);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100089610;
        v16[3] = &unk_100242C80;
        unint64_t v17 = v3;
        v18 = v4;
        v19 = self;
        [v15 asyncValueOnQueue:v18 withCompletion:v16];

        uint64_t v7 = v17;
        goto LABEL_12;
      }

      if (v14)
      {
        *(_WORD *)buf = 0;
        v8 = "Cannot start sync controller - Network is not reachable";
        goto LABEL_11;
      }
    }

- (id)addEpisodeObserverUsingBlock:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTSyncedEpisodeObserver observerWithBlock:]( &OBJC_CLASS___MTSyncedEpisodeObserver,  "observerWithBlock:",  a3));
  -[NSMutableArray addObject:](self->_episodeObservers, "addObject:", v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
  [v5 addEpisodeObserver:v4];

  return v4;
}

- (void)removeEpisodeObserver:(id)a3
{
  episodeObservers = self->_episodeObservers;
  id v5 = a3;
  -[NSMutableArray removeObject:](episodeObservers, "removeObject:", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
  [v6 removeEpisodeObserver:v5];
}

- (void)_setupUPP
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  [v3 setDataSource:0];

  v4 = objc_alloc_init(&OBJC_CLASS___MZUniversalPlaybackPositionStore);
  -[MTSyncController setUPPStore:](self, "setUPPStore:", v4);

  id v5 = objc_alloc_init(&OBJC_CLASS___MTUniversalPlaybackPositionDataSource);
  -[MTSyncController setUppDataSource:](self, "setUppDataSource:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
  [v6 setDataSource:v7];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController episodeObservers](self, "episodeObservers", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v12);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController uppDataSource](self, "uppDataSource"));
        [v14 addEpisodeObserver:v13];

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }
}

- (void)startUPPSyncTimerAfterPrivacy
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  [v2 startUPPSyncTimer];
}

- (void)operationFinished:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSOperationQueue operationCount](self->_queue, "operationCount");
  uint64_t v6 = _MTLogCategoryCloudSync(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134217984;
    v25[0] = v5 - 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "MTSyncController operation completed: Count is %lld",  (uint8_t *)&v24,  0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  unsigned int v9 = -[MTSyncController resettingToInitialState](v8, "resettingToInitialState");
  objc_sync_exit(v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"MTTimedOperationIsCancelledKey"]);
  unsigned int v12 = [v11 BOOLValue];

  if (((v9 | v12) & 1) != 0)
  {
    uint64_t v14 = _MTLogCategoryCloudSync(v13);
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 67109376;
      LODWORD(v25[0]) = v9;
      WORD2(v25[0]) = 1024;
      *(_DWORD *)((char *)v25 + 6) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Didn't updateAccountForLastSync because resettingToInitialState = %d or operationIsCancelled = %d",  (uint8_t *)&v24,  0xEu);
    }
  }

  else
  {
    -[MTSyncController updateAccountForLastSync](v8, "updateAccountForLastSync");
  }

  if ((id)-[NSOperationQueue operationCount](self->_queue, "operationCount") == (id)1)
  {
    uint64_t v16 = _MTLogCategoryCloudSync(1LL);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Sync Operations Completed",  (uint8_t *)&v24,  2u);
    }

    -[MTSyncController enableAssetDeletionIfPossible:](v8, "enableAssetDeletionIfPossible:", 1LL);
    -[MTSyncController endBackgroundTask](v8, "endBackgroundTask");
    dispatch_async(&_dispatch_main_q, &stru_100242CA0);
    __int128 v18 = v8;
    objc_sync_enter(v18);
    BOOL v19 = -[MTSyncController resyncWhenDone](v18, "resyncWhenDone");
    if (v19)
    {
      uint64_t v20 = _MTLogCategoryCloudSync(v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Syncing Content for New Account (previous sync completed)",  (uint8_t *)&v24,  2u);
      }

      -[MTSyncController syncEverything](v18, "syncEverything");
      -[MTSyncController setResyncWhenDone:](v18, "setResyncWhenDone:", 0LL);
    }

    objc_sync_exit(v18);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v22 timeIntervalSince1970];
  v8->_lastOperation = v23;
}

- (void)applicationDidEnterBackground
{
  if (-[NSOperationQueue operationCount](self->_queue, "operationCount"))
  {
    dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](&OBJC_CLASS___PodcastsApplicationStateMonitor, "shared"));
    unsigned int v4 = [v3 isActive];

    if (v4) {
      -[MTSyncController startBackgroundTask](self, "startBackgroundTask");
    }
  }

- (void)endBackgroundTask
{
  unint64_t v3 = -[MTSyncController backgroundTask](self, "backgroundTask");
  if (v3 != UIBackgroundTaskInvalid)
  {
    uint64_t v4 = _MTLogCategoryCloudSync(v3);
    NSUInteger v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "*** Ending background task", v7, 2u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    objc_msgSend(v6, "endBackgroundTask:", -[MTSyncController backgroundTask](self, "backgroundTask"));

    -[MTSyncController setBackgroundTask:](self, "setBackgroundTask:", UIBackgroundTaskInvalid);
  }

- (void)startBackgroundTask
{
  id v2 = self;
  objc_sync_enter(v2);
  -[MTSyncController endBackgroundTask](v2, "endBackgroundTask");
  objc_initWeak(&location, v2);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_10008A45C;
  uint64_t v14 = &unk_100240290;
  objc_copyWeak(&v15, &location);
  id v4 = [v3 beginBackgroundTaskWithName:@"MTSyncController" expirationHandler:&v11];
  -[MTSyncController setBackgroundTask:](v2, "setBackgroundTask:", v4, v11, v12, v13, v14);

  unint64_t v5 = -[MTSyncController backgroundTask](v2, "backgroundTask");
  id v6 = +[PodcastsApplicationStateMonitor remainingBackgroundTime]( &OBJC_CLASS___PodcastsApplicationStateMonitor,  "remainingBackgroundTime");
  uint64_t v8 = v7;
  uint64_t v9 = _MTLogCategoryCloudSync(v6);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "*** Start background task with id=%lu timeout=%f",  buf,  0x16u);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTSyncController operationInQueueWithType:]( v5,  "operationInQueueWithType:",  [v4 operationType]));
  if (!v6
    || [v4 operationType] == (id)6
    || [v4 operationType] == (id)7
    || (id v7 = [v4 operationType], v7 == (id)12))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](&OBJC_CLASS___PodcastsApplicationStateMonitor, "shared"));
    if ([v8 isActive])
    {
      id v9 = -[MTSyncController backgroundTask](v5, "backgroundTask");

      if (v9 == (id)UIBackgroundTaskInvalid) {
        -[MTSyncController startBackgroundTask](v5, "startBackgroundTask");
      }
    }

    else
    {
    }

    if ([v4 requiresStartDelayToAvoidClampErrors])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v10 timeIntervalSince1970];
      double v12 = v11;

      double lastOperation = v5->_lastOperation;
      if (lastOperation != 0.0)
      {
        uint64_t v15 = _MTLogCategoryCloudSync(v13);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          double v17 = v12 - v5->_lastOperation;
          int v32 = 134217984;
          double v33 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Time since last operation %f",  (uint8_t *)&v32,  0xCu);
        }

        double lastOperation = v5->_lastOperation;
      }

      if ((lastOperation == 0.0 || v12 - lastOperation >= 6.0)
        && !-[NSOperationQueue operationCount](v5->_queue, "operationCount"))
      {
        double v18 = 0.5;
      }

      else
      {
        double v18 = 6.0;
      }

      [v4 setStartDelay:v18];
    }

    uint64_t v19 = _MTLogCategoryCloudSync(-[NSOperationQueue addOperation:](v5->_queue, "addOperation:", v4));
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v4 operationType];
      [v4 startDelay];
      uint64_t v23 = v22;
      NSUInteger v24 = -[NSOperationQueue operationCount](v5->_queue, "operationCount");
      int v32 = 134218754;
      double v33 = *(double *)&v21;
      __int16 v34 = 2048;
      *(void *)v35 = v23;
      *(_WORD *)&v35[8] = 2048;
      NSUInteger v36 = v24;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Add operation with type: %ld with a timeout of %f. Total operation count is %li op=%@",  (uint8_t *)&v32,  0x2Au);
    }
  }

  else
  {
    uint64_t v25 = _MTLogCategoryCloudSync(v7);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 134218496;
      double v33 = COERCE_DOUBLE([v6 operationType]);
      __int16 v34 = 1024;
      *(_DWORD *)v35 = [v6 isExecuting];
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = [v6 isFinished];
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Dropping operation with type %ld as it's in the queue. isExecuting = %d, isFinished = %d",  (uint8_t *)&v32,  0x18u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController queue](v5, "queue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 operations]);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 firstObject]);

    if ((-[os_log_s isFinished](v20, "isFinished") & 1) == 0)
    {
      if (-[os_log_s isCancelled](v20, "isCancelled"))
      {
        id v29 = -[os_log_s isExecuting](v20, "isExecuting");
        if ((v29 & 1) == 0)
        {
          uint64_t v30 = _MTLogCategoryCloudSync(v29);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v32) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Sync is probably stalled :(",  (uint8_t *)&v32,  2u);
          }
        }
      }
    }
  }

  objc_sync_exit(v5);
}

- (BOOL)isRunning
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL isRunning = v2->_isRunning;
  objc_sync_exit(v2);

  return isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isRunning = a3;
  objc_sync_exit(obj);
}

- (void)setResettingToInitialState:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_resettingToInitialState = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  [v4 setObject:v5 forKey:@"kMTSyncControllerResettingToInitialState"];

  objc_sync_exit(obj);
}

- (BOOL)isSyncing
{
  return -[NSOperationQueue operationCount](self->_queue, "operationCount") != 0;
}

- (id)operationInQueueWithType:(int64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->_queue, "operations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 operationType] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = _MTLogCategoryCloudSync(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "<%p>", buf, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController UPPStore](self, "UPPStore"));
  [v5 setDataSource:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTSyncController;
  -[MTSyncController dealloc](&v7, "dealloc");
}

- (int64_t)timedOperationTypeForSyncType:(int64_t)a3
{
  if (a3 == 1) {
    return 13LL;
  }
  else {
    return 1LL;
  }
}

- (int64_t)timedOperationTypeForBookmarksSyncType:(int64_t)a3
{
  if (a3 == 1) {
    return 14LL;
  }
  else {
    return 11LL;
  }
}

- (void)performUniversalPlaybackPositionSync
{
  BOOL v3 = -[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP");
  if (!v3)
  {
    uint64_t v8 = _MTLogCategoryCloudSync(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v7 = "Cannot sync library and UPP. Skipping UPP sync.";
      goto LABEL_7;
    }

- (AMSPromise)UPPEnabled
{
  UPPEnabled = self->_UPPEnabled;
  if (!UPPEnabled)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](&OBJC_CLASS___IMURLBag, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForKey:kMTUPPDisabled]);
    dispatch_queue_t v6 = dispatch_queue_create("UPPEnabled", 0LL);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 asyncValuePromiseOnQueue:v6]);
    uint64_t v8 = (AMSPromise *)objc_claimAutoreleasedReturnValue([v7 thenWithBlock:&stru_100242D08]);
    id v9 = self->_UPPEnabled;
    self->_UPPEnabled = v8;

    UPPEnabled = self->_UPPEnabled;
  }

  return UPPEnabled;
}

- (BOOL)isUserLoggedIn
{
  return [(id)objc_opt_class(self) isUserLoggedIn];
}

+ (BOOL)isUserLoggedIn
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeAccount]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  unsigned __int8 v5 = [v4 isUserLoggedIn];

  return v5;
}

- (BOOL)canScheduleSyncRequest
{
  BOOL v3 = -[MTSyncController isRunning](self, "isRunning");
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
    unsigned __int8 v5 = [v4 isReachable];

    if ((v5 & 1) != 0)
    {
      BOOL v7 = -[MTSyncController isUserLoggedIn](self, "isUserLoggedIn");
      if (v7)
      {
        BOOL v8 = +[MTPrivacyUtil privacyAcknowledgementNeeded](&OBJC_CLASS___MTPrivacyUtil, "privacyAcknowledgementNeeded");
        if (v8)
        {
          uint64_t v9 = _MTLogCategoryCloudSync(v8);
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v23 = 0;
            double v11 = "Cannot schedule sync request - Need privacy acknoweldgement";
            __int128 v12 = (uint8_t *)&v23;
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
          }
        }

        else
        {
          BOOL v17 = -[MTSyncController hasAccountChangedSinceLastSync](self, "hasAccountChangedSinceLastSync");
          if (v17)
          {
            uint64_t v18 = _MTLogCategoryCloudSync(v17);
            id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_14;
            }
            __int16 v22 = 0;
            double v11 = "Cannot schedule sync request - Account has changed since last sync";
            __int128 v12 = (uint8_t *)&v22;
            goto LABEL_13;
          }

          BOOL v19 = -[MTSyncController resettingToInitialState](self, "resettingToInitialState");
          if (!v19) {
            return !sub_1000895B0();
          }
          uint64_t v20 = _MTLogCategoryCloudSync(v19);
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v21 = 0;
            double v11 = "Cannot schedule sync request - We are in the process of resetting to initial state";
            __int128 v12 = (uint8_t *)&v21;
            goto LABEL_13;
          }
        }
      }

      else
      {
        uint64_t v15 = _MTLogCategoryCloudSync(v7);
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          double v11 = "Cannot schedule sync request - User is not logged in";
          __int128 v12 = buf;
          goto LABEL_13;
        }
      }
    }

    else
    {
      uint64_t v14 = _MTLogCategoryCloudSync(v6);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = 0;
        double v11 = "Cannot schedule sync request - Network is not reachable";
        __int128 v12 = (uint8_t *)&v25;
        goto LABEL_13;
      }
    }
  }

  else
  {
    uint64_t v13 = _MTLogCategoryCloudSync(v3);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = 0;
      double v11 = "Cannot schedule sync request - Sync controller should be started before syncing.";
      __int128 v12 = (uint8_t *)&v26;
      goto LABEL_13;
    }
  }

- (void)syncEverything
{
}

- (void)syncAllBookkeeperKeys
{
  if (-[MTSyncController canScheduleSyncRequest](self, "canScheduleSyncRequest"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController keyProcessorPairProvider](self, "keyProcessorPairProvider"));
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 keysAndProcessorsForAllBookkeeperKeys]);

    -[MTSyncController syncMultipleKeysAndProcessors:shouldSyncCleanKeys:]( self,  "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:",  v4,  1LL);
  }

  else
  {
    -[MTSyncController resetToInitialStateForced:](self, "resetToInitialStateForced:", 0LL);
  }

- (void)syncCoreKeysIfDirty
{
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008B558;
    block[3] = &unk_10023FF98;
    block[4] = self;
    dispatch_async(v4, block);
  }

- (void)syncSubscriptions
{
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController keyProcessorPairProvider](self, "keyProcessorPairProvider"));
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 keysAndProcessorsForSubscriptionsAndStationsSync]);

    -[MTSyncController syncMultipleKeysAndProcessors:shouldSyncCleanKeys:]( self,  "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:",  v4,  1LL);
  }

- (BOOL)checkViabilityOfSyncLibraryAndUPP
{
  if (-[MTSyncController canScheduleSyncRequest](self, "canScheduleSyncRequest"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    unsigned __int8 v4 = [v3 isLibrarySyncEnabled];

    return v4;
  }

  else
  {
    -[MTSyncController resetToInitialStateIfNeeded](self, "resetToInitialStateIfNeeded");
    return 0;
  }

- (void)syncTermsVersion
{
  if (-[MTSyncController canScheduleSyncRequest](self, "canScheduleSyncRequest"))
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___MTTimedOperation);
    -[MTTimedOperation setOperationType:](v3, "setOperationType:", 8LL);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10008B708;
    v4[3] = &unk_10023FF98;
    v4[4] = self;
    -[MTTimedOperation setMainBlock:](v3, "setMainBlock:", v4);
    -[MTSyncController addOperation:](self, "addOperation:", v3);
  }

  else
  {
    -[MTSyncController resetToInitialStateIfNeeded](self, "resetToInitialStateIfNeeded");
  }

- (void)syncNonFollowedShowsIfSyncDirty
{
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS____TtC8Podcasts29NonFollowedShowsSyncProcessor);
    if (-[NonFollowedShowsSyncProcessor hasLocalChanges](v3, "hasLocalChanges")) {
      -[MTSyncController syncNonFollowedShows](self, "syncNonFollowedShows");
    }
  }

- (void)syncNonFollowedShows
{
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    objc_initWeak(&location, self);
    BOOL v3 = objc_opt_new(&OBJC_CLASS___MTTimedOperation);
    -[MTTimedOperation setOperationType:](v3, "setOperationType:", 15LL);
    unsigned __int8 v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472LL;
    uint64_t v6 = sub_10008B9B4;
    BOOL v7 = &unk_100240290;
    objc_copyWeak(&v8, &location);
    -[MTTimedOperation setMainBlock:](v3, "setMainBlock:", &v4);
    -[MTSyncController addOperation:](self, "addOperation:", v3, v4, v5, v6, v7);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 code];
  if (v9 != (id)-1001LL)
  {
    uint64_t v10 = _MTLogCategoryCloudSync(v9);
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "transaction did fail with error: %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  if ([v8 isAccountsChangedError])
  {
    -[MTSyncController resetToInitialStateIfNeeded](self, "resetToInitialStateIfNeeded");
    -[MTSyncController syncEverything](self, "syncEverything");
LABEL_8:
    -[MTSyncController enableAssetDeletionIfPossible](self, "enableAssetDeletionIfPossible");
    BOOL v13 = 0;
    goto LABEL_12;
  }

  id v12 = [v8 isRecoverableError];
  uint64_t v14 = _MTLogCategoryCloudSync(v12);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@ Did fail with unrecoverable error. Cancelling all transactions",  (uint8_t *)&v18,  0xCu);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController cloudSyncController](self, "cloudSyncController"));
  [v16 cancelAllTransactions];

  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
  id v6 = a5;
  uint64_t v7 = _MTLogCategoryCloudSync(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    int v10 = 138412290;
    double v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
  }

  -[MTSyncController enableAssetDeletionIfPossible](self, "enableAssetDeletionIfPossible");
}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "processor", a3));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MTSubscriptionSyncProcessor);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    [v8 cleanUpOldHiddenPodcasts];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 postNotificationName:@"MTSyncControllerSubscriptionSyncCompleted" object:0];
  }

  -[MTSyncController enableAssetDeletionIfPossible](self, "enableAssetDeletionIfPossible");
}

- (void)scheduleEpisodeStatePutWithFeedUrls:(id)a3
{
  id v4 = a3;
  id v5 = +[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod");
  if ((_DWORD)v5)
  {
    uint64_t v6 = _MTLogCategoryCloudSync(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not scheduling episode sync PUT on HomePod.",  buf,  2u);
    }

    goto LABEL_7;
  }

  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP")
    && [v4 count])
  {
    uint64_t v7 = objc_opt_new(&OBJC_CLASS___MTTimedOperation);
    -[os_log_s setOperationType:](v7, "setOperationType:", 7LL);
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    int v10 = sub_10008BF8C;
    double v11 = &unk_100240240;
    id v12 = self;
    id v13 = v4;
    -[os_log_s setMainBlock:](v7, "setMainBlock:", &v8);
    -[MTSyncController addOperation:](self, "addOperation:", v7, v8, v9, v10, v11, v12);

LABEL_7:
  }
}

- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3
{
}

- (void)scheduleVeryHighPriorityEpisodeStateGetWithFeedUrls:(id)a3
{
}

- (void)scheduleEpisodeStateGetWithFeedUrls:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod");
  if ((_DWORD)v7)
  {
    uint64_t v8 = _MTLogCategoryCloudSync(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not scheduling episode sync GET on HomePod.",  buf,  2u);
    }

    goto LABEL_7;
  }

  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP")
    && [v6 count])
  {
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___MTTimedOperation);
    -[os_log_s setOperationType:](v9, "setOperationType:", 6LL);
    -[os_log_s setQueuePriority:](v9, "setQueuePriority:", a4);
    int v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = sub_10008C1BC;
    id v13 = &unk_100240240;
    id v14 = v6;
    uint64_t v15 = self;
    -[os_log_s setMainBlock:](v9, "setMainBlock:", &v10);
    -[MTSyncController addOperation:](self, "addOperation:", v9, v10, v11, v12, v13);

LABEL_7:
  }
}

- (id)expandFeedUrls:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v4 count]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      int v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController episodeSyncStorage](self, "episodeSyncStorage", (void)v15));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 modernKeyFromFeedUrl:v11]);
        -[NSMutableSet addObject:](v5, "addObject:", v13);

        int v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v5;
}

- (void)syncCriticalBookkeeperKeysShouldSyncCleanKeys:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MTSyncController checkViabilityOfSyncLibraryAndUPP](self, "checkViabilityOfSyncLibraryAndUPP"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController keyProcessorPairProvider](self, "keyProcessorPairProvider"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 keysAndProcessorsForCriticalBookkeeperKeys]);

    -[MTSyncController syncMultipleKeysAndProcessors:shouldSyncCleanKeys:]( self,  "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:",  v6,  v3);
  }

- (void)syncMultipleKeysAndProcessors:(id)a3 shouldSyncCleanKeys:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = -[MTMultiKeySyncProcessor initWithKeysAndProcessors:]( objc_alloc(&OBJC_CLASS___MTMultiKeySyncProcessor),  "initWithKeysAndProcessors:",  v6);
  objc_initWeak(&location, self);
  if (v4)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___MTTimedOperation);
    -[MTTimedOperation setOperationType:](v8, "setOperationType:", 16LL);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10008C680;
    v16[3] = &unk_100242908;
    __int128 v17 = v7;
    objc_copyWeak(&v18, &location);
    -[MTTimedOperation setMainBlock:](v8, "setMainBlock:", v16);
    -[MTSyncController addOperation:](self, "addOperation:", v8);
    objc_destroyWeak(&v18);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10008C7C0;
  v12[3] = &unk_100242D30;
  id v13 = v7;
  uint64_t v11 = v7;
  objc_copyWeak(&v15, &location);
  id v14 = self;
  dispatch_async(v10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BOOL)resetToInitialStateIfIncomplete
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"kMTSyncControllerResettingToInitialState"]);
  id v5 = (void *)v4;
  id v6 = &__kCFBooleanFalse;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  unsigned int v8 = [v7 BOOLValue];
  if (!v8) {
    return 0;
  }
  uint64_t v10 = _MTLogCategoryCloudSync(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Reset to initial state was incomplete. Will retry.",  v13,  2u);
  }

  return -[MTSyncController resetToInitialStateForced:](self, "resetToInitialStateForced:", 1LL);
}

+ (void)resetMetadataToInitialState
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___MTEpisodeSyncStorage);
  -[MTEpisodeSyncStorage resetVersionForAllFeedUrls](v3, "resetVersionForAllFeedUrls");

  [a1 resetAllSubscriptionSyncVersion];
  [a1 resetPlaylistSyncVersion];
  +[MTBookmarksSyncStorage resetBookmarksSync](&OBJC_CLASS___MTBookmarksSyncStorage, "resetBookmarksSync");
  +[MTUniversalPlaybackPositionDataSource resetUppLastSyncTimeAndDomainVersion]( &OBJC_CLASS___MTUniversalPlaybackPositionDataSource,  "resetUppLastSyncTimeAndDomainVersion");
  +[NonFollowedShowsSyncStorage resetNonFollowedShowsSync]( &OBJC_CLASS____TtC8Podcasts27NonFollowedShowsSyncStorage,  "resetNonFollowedShowsSync");
  +[InterestSyncStorage resetInterestSync](&OBJC_CLASS____TtC8Podcasts19InterestSyncStorage, "resetInterestSync");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPrivacyUtil cloudSyncVersion](&OBJC_CLASS___MTPrivacyUtil, "cloudSyncVersion"));

  if (v4) {
    +[MTPrivacyUtil resetToInitialState](&OBJC_CLASS___MTPrivacyUtil, "resetToInitialState");
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 podcastsDomainVersion]);

  if (v6)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    [v8 setPodcastsDomainVersion:0];
  }

  uint64_t v9 = _MTLogCategoryCloudSync(v7);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Clearing account identifier for last sync",  v11,  2u);
  }

  [a1 resetAccountIdentifierForLastSync];
}

- (BOOL)resetToInitialStateIfNeeded
{
  return -[MTSyncController resetToInitialStateForced:](self, "resetToInitialStateForced:", 0LL);
}

- (BOOL)resetToInitialStateForced:(BOOL)a3
{
  return -[MTSyncController resetToInitialStateForced:completion:]( self,  "resetToInitialStateForced:completion:",  a3,  0LL);
}

- (BOOL)resetToInitialStateForced:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = +[MTApplication localLibraryUpdatesDisabled](&OBJC_CLASS___MTApplication, "localLibraryUpdatesDisabled");
  if (!v7)
  {
    uint64_t v11 = self;
    objc_sync_enter(v11);
    BOOL v12 = -[MTSyncController resettingToInitialState](v11, "resettingToInitialState");
    if (v12)
    {
      uint64_t v13 = _MTLogCategoryCloudSync(v12);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v15 = "Reset to initial state in progress";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      }
    }

    else
    {
      BOOL v16 = -[MTSyncController isRunning](v11, "isRunning");
      if (v16 || v4)
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
        char v18 = [v17 hasFetchedInitialAccount] | v4;

        if ((v18 & 1) != 0)
        {
          if (!-[MTSyncController hasPodcastSyncVersion](v11, "hasPodcastSyncVersion")
            && !-[MTSyncController hasPodcastSyncV3Version](v11, "hasPodcastSyncV3Version"))
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTPrivacyUtil cloudSyncVersion](&OBJC_CLASS___MTPrivacyUtil, "cloudSyncVersion"));
            if (v20 || -[MTSyncController hasPlaylistSyncVersion](v11, "hasPlaylistSyncVersion"))
            {
            }

            else if (!+[MTBookmarksSyncStorage hasBookmarksSync]( &OBJC_CLASS___MTBookmarksSyncStorage,  "hasBookmarksSync"))
            {
              int v32 = (void *)objc_claimAutoreleasedReturnValue( +[MTSyncController accountIdentifierForLastSync]( &OBJC_CLASS___MTSyncController,  "accountIdentifierForLastSync"));

              if (!v32)
              {
                uint64_t v34 = _MTLogCategoryCloudSync(v33);
                id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_27;
                }
                *(_WORD *)buf = 0;
                id v15 = "Already in Initial State";
                goto LABEL_26;
              }
            }
          }

          if (-[MTSyncController isUserLoggedIn](v11, "isUserLoggedIn"))
          {
            BOOL v21 = -[MTSyncController hasAccountChangedSinceLastSync](v11, "hasAccountChangedSinceLastSync");
            if (!v21 && !v4)
            {
              uint64_t v31 = _MTLogCategoryCloudSync(v21);
              id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_27;
              }
              *(_WORD *)buf = 0;
              id v15 = "Already in Initial State, account didn't change";
              goto LABEL_26;
            }
          }

          BOOL v22 = +[MTPrivacyUtil privacyAcknowledgementNeeded]( &OBJC_CLASS___MTPrivacyUtil,  "privacyAcknowledgementNeeded");
          if (!v22)
          {
            uint64_t v27 = _MTLogCategoryCloudSync(-[MTSyncController setResettingToInitialState:](v11, "setResettingToInitialState:", 1LL));
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Reset to Initial State - Started",  buf,  2u);
            }

            id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController cloudSyncController](v11, "cloudSyncController"));
            [v29 cancelAllTransactions];

            -[NSOperationQueue cancelAllOperations](v11->_queue, "cancelAllOperations");
            uint64_t v30 = objc_opt_new(&OBJC_CLASS___MTTimedOperation);
            -[MTTimedOperation setOperationType:](v30, "setOperationType:", 10LL);
            -[MTTimedOperation setStartDelay:](v30, "setStartDelay:", 0.0);
            v35 = _NSConcreteStackBlock;
            uint64_t v36 = 3221225472LL;
            __int16 v37 = sub_10008D12C;
            id v38 = &unk_100240138;
            v39 = v11;
            id v40 = v6;
            -[MTTimedOperation setMainBlock:](v30, "setMainBlock:", &v35);
            -[MTSyncController addOperation:](v11, "addOperation:", v30, v35, v36, v37, v38, v39);

            BOOL v10 = 1;
            goto LABEL_31;
          }

          uint64_t v23 = _MTLogCategoryCloudSync(v22);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            id v15 = "No reset - missing privacy ACK";
            goto LABEL_26;
          }
        }

        else
        {
          uint64_t v25 = _MTLogCategoryCloudSync(v19);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            id v15 = "Can't reset because the account isn't available yet";
            goto LABEL_26;
          }
        }
      }

      else
      {
        uint64_t v24 = _MTLogCategoryCloudSync(v16);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v15 = "Shouldn't reset because the sync controller didn't complete starting yet.";
          goto LABEL_26;
        }
      }
    }

- (void)_synchronousResetToInitialStateDatabase
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 importContext]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10008D1F8;
  v6[3] = &unk_100240240;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

- (void)_synchronousResetToInitialStateMetadata
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPrivacyUtil cloudSyncVersion](&OBJC_CLASS___MTPrivacyUtil, "cloudSyncVersion"));

  if (v3) {
    +[MTPrivacyUtil resetToInitialState](&OBJC_CLASS___MTPrivacyUtil, "resetToInitialState");
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastsDomainVersion]);

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    [v7 setPodcastsDomainVersion:0];
  }

  uint64_t v8 = _MTLogCategoryCloudSync(v6);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Clearing account identifier for last sync",  v10,  2u);
  }

  [(id)objc_opt_class(self) resetAccountIdentifierForLastSync];
}

- (void)_finaliseResetToInitial:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = _MTLogCategoryCloudSync(-[MTSyncController setResettingToInitialState:](v5, "setResettingToInitialState:", 0LL));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset to Initial State - Completed", buf, 2u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 postNotificationName:@"MTSyncControllerResetToInitialStateCompleted" object:0];

  objc_sync_exit(v5);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  BOOL v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10008D7D0;
  v12[3] = &unk_1002405F8;
  void v12[4] = v5;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(v10, v12);
}

+ (int64_t)syncFlagsForSyncType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subscriptionsSyncVersionFor:a3]);

  if (v5) {
    int64_t v6 = 1 << a3;
  }
  else {
    int64_t v6 = 0LL;
  }

  return v6;
}

+ (void)didUpdateSubscriptionsSyncVersionForSyncType:(int64_t)a3
{
  char v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  unint64_t v6 = (unint64_t)[v5 syncVersionFlags];

  if (v6 != 3)
  {
    unint64_t v7 = v6 | (1 << v3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
    [v8 setSyncVersionFlags:v7];

    uint64_t v10 = _MTLogCategoryCloudSync(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      unint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting MTSyncController syncVersionFlags to %lld",  (uint8_t *)&v12,  0xCu);
    }
  }

+ (void)resetAllSubscriptionSyncVersion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v2 resetSubscriptionsSyncVersionFor:0];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v3 resetSubscriptionsSyncVersionFor:1];
}

- (BOOL)hasPodcastSyncVersion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subscriptionsSyncVersionFor:0]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)hasPodcastSyncV3Version
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subscriptionsSyncVersionFor:1]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)hasInterestSyncVersion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 interestSyncVersion]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (NSString)playlistSyncVersion
{
  return (NSString *)[(id)objc_opt_class(self) playlistSyncVersion];
}

+ (id)playlistSyncVersion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:kMTPlaylistsKey]);

  return v3;
}

- (void)setPlaylistSyncVersion:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class(self) setPlaylistSyncVersion:v4];
}

+ (void)setPlaylistSyncVersion:(id)a3
{
  id v6 = a3;
  id v3 = [v6 length];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v5 = v4;
  if (v3) {
    [v4 setObject:v6 forKey:kMTPlaylistsKey];
  }
  else {
    [v4 removeObjectForKey:kMTPlaylistsKey];
  }
}

- (BOOL)hasPlaylistSyncVersion
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSyncController playlistSyncVersion](self, "playlistSyncVersion"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

+ (void)resetPlaylistSyncVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](&OBJC_CLASS____TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
  [v2 setIsPlaylistSyncDirty:1];
}

+ (id)accountIdentifierForLastSync
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"SSAccountIdentifier"]);

  return v3;
}

+ (void)setAccountIdentifierForLastSync:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 accountIdentifierForLastSync]);
  unint64_t v7 = v6;
  if (v6 != v4)
  {
    id v8 = [v6 isEqualToString:v4];
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = _MTLogCategoryCloudSync(v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Changing account identifier to %@ from %@",  (uint8_t *)&v12,  0x16u);
      }

      if ([v4 length])
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v11 setObject:v4 forKey:@"SSAccountIdentifier"];
      }

      else
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v11 removeObjectForKey:@"SSAccountIdentifier"];
      }
    }
  }

  objc_sync_exit(v5);
}

+ (void)resetAccountIdentifierForLastSync
{
}

+ (BOOL)hasAccountChangedSinceLastSync
{
  id v2 = a1;
  objc_sync_enter(v2);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 accountIdentifierForLastSync]);
  if (!-[os_log_s length](v3, "length"))
  {
    uint64_t v8 = _MTLogCategoryCloudSync(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "hasAccountChangedSinceLastSync = NO since there was previously no account",  buf,  2u);
    }

    goto LABEL_10;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeDsid]);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 stringValue]);

  if (!-[os_log_s length](v6, "length"))
  {
    uint64_t v9 = _MTLogCategoryCloudSync(0LL);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "hasAccountChangedSinceLastSync = NO since there is currently no account",  v12,  2u);
    }

    goto LABEL_10;
  }

  if (v3 == v6)
  {
LABEL_10:
    LOBYTE(v7) = 0;
    goto LABEL_11;
  }

  unsigned int v7 = -[os_log_s isEqualToString:](v3, "isEqualToString:", v6) ^ 1;
LABEL_11:

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)hasAccountChangedSinceLastSync
{
  return [(id)objc_opt_class(self) hasAccountChangedSinceLastSync];
}

- (void)updateAccountForLastSync
{
  id v2 = self;
  uint64_t v3 = objc_sync_enter(v2);
  uint64_t v4 = _MTLogCategoryCloudSync(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating account for last sync", v9, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeDsid]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);

  [(id)objc_opt_class(v2) setAccountIdentifierForLastSync:v8];
  objc_sync_exit(v2);
}

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a4 && !a3)
  {
    if (-[MTSyncController isRunning](self, "isRunning")) {
      -[MTSyncController syncCriticalBookkeeperKeysShouldSyncCleanKeys:]( self,  "syncCriticalBookkeeperKeysShouldSyncCleanKeys:",  1LL);
    }
    else {
      -[MTSyncController start](self, "start");
    }
  }

- (MZUniversalPlaybackPositionStore)UPPStore
{
  return self->_UPPStore;
}

- (void)setUPPStore:(id)a3
{
}

- (BOOL)uppSyncDirtyFlag
{
  return self->_uppSyncDirtyFlag;
}

- (void)setUppSyncDirtyFlag:(BOOL)a3
{
  self->_uppSyncDirtyFlag = a3;
}

- (int64_t)syncVersionFlags
{
  return self->_syncVersionFlags;
}

- (void)setSyncVersionFlags:(int64_t)a3
{
  self->_syncVersionFlags = a3;
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MZKeyValueStoreController)cloudSyncController
{
  return self->_cloudSyncController;
}

- (void)setCloudSyncController:(id)a3
{
}

- (MTEpisodeSyncStorage)episodeSyncStorage
{
  return self->_episodeSyncStorage;
}

- (void)setEpisodeSyncStorage:(id)a3
{
}

- (MTKeyProcessorPairProvider)keyProcessorPairProvider
{
  return self->_keyProcessorPairProvider;
}

- (void)setKeyProcessorPairProvider:(id)a3
{
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
}

- (MTUniversalPlaybackPositionDataSource)uppDataSource
{
  return self->_uppDataSource;
}

- (void)setUppDataSource:(id)a3
{
}

- (BOOL)resyncWhenDone
{
  return self->_resyncWhenDone;
}

- (void)setResyncWhenDone:(BOOL)a3
{
  self->_resyncWhenDone = a3;
}

- (BOOL)resettingToInitialState
{
  return self->_resettingToInitialState;
}

- (NSMutableArray)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end