@interface GKNetworkRequestManager
+ (BOOL)entityIsReleaseStateAwareForBagKey:(id)a3;
+ (BOOL)useJSONForBagKey:(id)a3;
+ (Class)networkRequestClass:(id)a3;
+ (id)commonNetworkRequestManager;
+ (id)dictionaryFromTaskDescription:(id)a3;
+ (id)makeEntityCacheProviderInMemory:(BOOL)a3;
+ (id)makeEntityIDWithRequest:(id)a3 bagKey:(id)a4;
+ (id)networkRequestFromNsurlTask:(id)a3;
+ (id)taskWithRequest:(id)a3 description:(id)a4 session:(id)a5;
+ (id)uuidFromTask:(id)a3;
- (BOOL)beforeFirstUnlock;
- (BOOL)doesCallbackListExistFor:(id)a3 parameters:(id)a4 callback:(id)a5;
- (BOOL)fairPlaySessionReady;
- (BOOL)firstUnlockedState;
- (BOOL)managerReady;
- (BOOL)reportedExessiveRequests;
- (GKEntityCacheProviderProtocol)entityCacheProvider;
- (GKFairPlaySessionProvider)fairPlaySessionProvider;
- (GKNetworkRequestManager)initWithInMemoryEntityCache:(BOOL)a3;
- (GKNetworkRequestManagerSessionDelegate)backgroundTasksSessionDelegate;
- (NSDictionary)serviceDependancyMappings;
- (NSMutableDictionary)existingTasks;
- (NSMutableDictionary)pendingCallbacks;
- (NSOperationQueue)operationQueue;
- (NSURLSession)backgroundSession;
- (NSURLSession)inProcessSession;
- (NSURLSessionConfiguration)backgroundConfig;
- (NSURLSessionConfiguration)inProcessConfig;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_queue)stateQueue;
- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)inProcessTasksSessionDelegate;
- (id)canSafelyIssueRequest:(id)a3;
- (id)contentsOfPendingStore:(id)a3;
- (id)dictionaryForBagAndPlayer:(id)a3 createIfNotPresent:(BOOL)a4 description:(id)a5;
- (id)existingWaitListDate:(id)a3;
- (id)filePathToTempFile:(id)a3 fileName:(id)a4;
- (id)pathToTempFile:(id)a3 fileName:(id)a4;
- (id)pendingLocation;
- (id)playerCredentialsForClientProxy:(id)a3;
- (id)resultsLocation;
- (id)retrieveAndClearCallbacks:(id)a3 parameters:(id)a4;
- (id)taskFromIdentifier:(id)a3;
- (id)waitListLocation;
- (int64_t)currentState;
- (int64_t)relatedTasksExistForBagKey:(id)a3;
- (os_unfair_lock_s)pendingCallbacksLock;
- (os_unfair_lock_s)waitListCallbacksLock;
- (void)_issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8;
- (void)addNetworkRequest:(id)a3 description:(id)a4 clientProxy:(id)a5;
- (void)assembleRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 handler:(id)a7;
- (void)assembleRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 playerCredential:(id)a7 handler:(id)a8;
- (void)cancelCurrentTasks;
- (void)cleanUpPendingStore:(id)a3;
- (void)createEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 clientProxy:(GKClientProxy *)a5 entityMaker:(id)a6 completionHandler:;
- (void)createEntityWithRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 completionHandler:(id)a6 entityMaker:(id)a7;
- (void)deleteEntitiesWithBagKey:(NSString *)a3 clientProxy:(GKClientProxy *)a4 completionHandler:(id)a5;
- (void)getFairPlaySession:(id)a3;
- (void)handleRetryAfter:(id)a3;
- (void)handleTaskFinished:(id)a3;
- (void)issuePending;
- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 handler:(id)a6;
- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 handler:(id)a7;
- (void)issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8;
- (void)readEntityWithRequest:(id)a3 bagKey:(id)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(id)a6 completionHandler:(id)a7 entityMaker:(id)a8;
- (void)setBackgroundConfig:(id)a3;
- (void)setBackgroundSession:(id)a3;
- (void)setBackgroundTasksSessionDelegate:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setExistingTasks:(id)a3;
- (void)setFairPlaySessionProvider:(id)a3;
- (void)setFairPlaySessionReady:(BOOL)a3;
- (void)setFirstUnlockedState:(BOOL)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setInProcessConfig:(id)a3;
- (void)setInProcessSession:(id)a3;
- (void)setInProcessTasksSessionDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingCallbacks:(id)a3;
- (void)setPendingCallbacksLock:(os_unfair_lock_s)a3;
- (void)setReportedExessiveRequests:(BOOL)a3;
- (void)setServiceDependancyMappings:(id)a3;
- (void)setWaitListCallbacksLock:(os_unfair_lock_s)a3;
- (void)setWaitPeriod:(id)a3 waitPeriod:(double)a4;
- (void)setupSessionsAsync;
- (void)writeToNetwork:(id)a3 clientProxy:(id)a4 handler:(id)a5;
- (void)writeToPendingStore:(id)a3 fileName:(id)a4;
@end

@implementation GKNetworkRequestManager

- (BOOL)doesCallbackListExistFor:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  BOOL v11 = 0;
  if (v8 && v9)
  {
    id v12 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue([a4 sortedArrayUsingSelector:"compare:"]);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        v17 = 0LL;
        v18 = v12;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          id v12 = (id)objc_claimAutoreleasedReturnValue( [v18 stringByAppendingString:*(void *)(*((void *)&v28 + 1) + 8 * (void)v17)]);

          v17 = (char *)v17 + 1;
          v18 = v12;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v15);
    }

    p_pendingCallbacksLock = &self->_pendingCallbacksLock;
    os_unfair_lock_lock(&self->_pendingCallbacksLock);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v12]);

    BOOL v11 = v21 != 0LL;
    if (!v21)
    {
      v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
      [v23 setObject:v22 forKeyedSubscript:v12];
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v12]);
    id v26 = [v10 copy];
    [v25 addObject:v26];

    os_unfair_lock_unlock(p_pendingCallbacksLock);
  }

  return v11;
}

- (id)retrieveAndClearCallbacks:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 sortedArrayUsingSelector:"compare:"]);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        v13 = 0LL;
        id v14 = v8;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v8 = (id)objc_claimAutoreleasedReturnValue( [v14 stringByAppendingString:*(void *)(*((void *)&v22 + 1) + 8 * (void)v13)]);

          v13 = (char *)v13 + 1;
          id v14 = v8;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v11);
    }

    p_pendingCallbacksLock = &self->_pendingCallbacksLock;
    os_unfair_lock_lock(&self->_pendingCallbacksLock);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v8]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v8]);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
      [v20 setObject:0 forKeyedSubscript:v8];
    }

    else
    {
      v19 = 0LL;
    }

    os_unfair_lock_unlock(p_pendingCallbacksLock);
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

+ (id)dictionaryFromTaskDescription:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 taskDescription]);
  if (v3)
  {
    v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);
    if (v4)
    {
      id v12 = 0LL;
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v4,  0LL,  &v12));
      id v6 = v12;
      v7 = v6;
      if (v6)
      {
        if (!os_log_GKGeneral) {
          id v8 = (id)GKOSLoggers(v6);
        }
        id v9 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager JSON serialization error: %@",  buf,  0xCu);
        }
      }
    }

    else
    {
      v5 = &__NSDictionary0__struct;
    }
  }

  else
  {
    v5 = &__NSDictionary0__struct;
  }

  id v10 = [v5 mutableCopy];

  return v10;
}

- (void)getFairPlaySession:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager fairPlaySessionProvider](self, "fairPlaySessionProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 storeBag]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10009D780;
  v10[3] = &unk_1002702E0;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v5 fairPlaySessionWithStoreBag:v7 reporter:v8 completionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)filePathToTempFile:(id)a3 fileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc(&OBJC_CLASS___NSURL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v5]);

  id v9 = -[NSURL initFileURLWithPath:](v7, "initFileURLWithPath:", v8);
  return v9;
}

- (id)pathToTempFile:(id)a3 fileName:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathComponent:a4]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

  return v5;
}

- (void)cleanUpPendingStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingLocation](self, "pendingLocation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager filePathToTempFile:fileName:](self, "filePathToTempFile:fileName:", v5, v4));

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v7);
  }
  id v9 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager clearing pending location: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  [v10 removeItemAtPath:v11 error:0];
}

- (id)contentsOfPendingStore:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingLocation](self, "pendingLocation"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pathToTempFile:fileName:](self, "pathToTempFile:fileName:", v6, v4));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v8));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)writeToPendingStore:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingLocation](self, "pendingLocation"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pathToTempFile:fileName:](self, "pathToTempFile:fileName:", v9, v7));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v13 = [v12 removeItemAtPath:v11 error:0];
  if ((v13 & 1) != 0)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v13);
    }
    id v15 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removed existing file", (uint8_t *)&v25, 2u);
    }

- (BOOL)beforeFirstUnlock
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[GKNetworkRequestManager firstUnlockedState](self, "firstUnlockedState"))
  {
    else {
      BOOL v4 = 0LL;
    }
    -[GKNetworkRequestManager setFirstUnlockedState:](self, "setFirstUnlockedState:", v4);
  }

  return -[GKNetworkRequestManager firstUnlockedState](self, "firstUnlockedState");
}

+ (id)commonNetworkRequestManager
{
  if (qword_1002BB528 != -1) {
    dispatch_once(&qword_1002BB528, &stru_100270300);
  }
  return (id)qword_1002BB520;
}

- (GKNetworkRequestManager)initWithInMemoryEntityCache:(BOOL)a3
{
  BOOL v3 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___GKNetworkRequestManager;
  BOOL v4 = -[GKNetworkRequestManager init](&v34, "init");
  id v5 = v4;
  if (v4)
  {
    v4->_firstUnlockedState = 1;
    -[GKNetworkRequestManager setPendingCallbacksLock:](v4, "setPendingCallbacksLock:", 0LL);
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[GKNetworkRequestManager setPendingCallbacks:](v5, "setPendingCallbacks:", v6);

    -[GKNetworkRequestManager setWaitListCallbacksLock:](v5, "setWaitListCallbacksLock:", 0LL);
    serviceDependancyMappings = v5->_serviceDependancyMappings;
    v5->_serviceDependancyMappings = (NSDictionary *)&off_100288520;

    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    existingTasks = v5->_existingTasks;
    v5->_existingTasks = v8;

    v5->_currentState = 0LL;
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.gamed.networkmanager.state", v11);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.gamed.networkmanager.handler", v15);
    handlerQueue = v5->_handlerQueue;
    v5->_handlerQueue = (OS_dispatch_queue *)v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v18;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    v5->_reportedExessiveRequests = 0;
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    inProcessConfig = v5->_inProcessConfig;
    v5->_inProcessConfig = (NSURLSessionConfiguration *)v20;

    __int128 v22 = objc_alloc_init(&OBJC_CLASS____TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate);
    inProcessTasksSessionDelegate = v5->_inProcessTasksSessionDelegate;
    v5->_inProcessTasksSessionDelegate = v22;

    id v24 = v5->_inProcessConfig;
    int v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager inProcessTasksSessionDelegate](v5, "inProcessTasksSessionDelegate"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager operationQueue](v5, "operationQueue"));
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v24,  v25,  v26));
    inProcessSession = v5->_inProcessSession;
    v5->_inProcessSession = (NSURLSession *)v27;

    __int128 v29 = -[GKFairPlaySessionProvider initWithSession:]( objc_alloc(&OBJC_CLASS___GKFairPlaySessionProvider),  "initWithSession:",  v5->_inProcessSession);
    fairPlaySessionProvider = v5->_fairPlaySessionProvider;
    v5->_fairPlaySessionProvider = v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager makeEntityCacheProviderInMemory:]( &OBJC_CLASS___GKNetworkRequestManager,  "makeEntityCacheProviderInMemory:",  v3));
    entityCacheProvider = v5->_entityCacheProvider;
    v5->_entityCacheProvider = (GKEntityCacheProviderProtocol *)v31;
  }

  return v5;
}

- (void)cancelCurrentTasks
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  BOOL v4 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager cancelling all existing tasks:",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager backgroundSession](self, "backgroundSession"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10009E178;
  v6[3] = &unk_100270328;
  v6[4] = self;
  [v5 getAllTasksWithCompletionHandler:v6];
}

- (int64_t)relatedTasksExistForBagKey:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 2LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager serviceDependancyMappings](self, "serviceDependancyMappings"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009E5A0;
    block[3] = &unk_1002702B8;
    block[4] = self;
    id v15 = v6;
    dispatch_queue_t v16 = &v17;
    dispatch_sync(v7, block);

    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(v8);
    }
    dispatch_queue_attr_t v10 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18[3]));
      *(_DWORD *)buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager the outcome of relatedTasksExistForBagKey %@ is: %@",  buf,  0x16u);
    }

    int64_t v12 = v18[3];
  }

  else
  {
    int64_t v12 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

+ (Class)networkRequestClass:(id)a3
{
  id v3 = a3;
  id v4 = &off_10026A290;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoveFriendNetworkRequest bagKey](&OBJC_CLASS___GKRemoveFriendNetworkRequest, "bagKey"));
  unsigned __int8 v6 = [v5 isEqualToString:v3];

  if ((v6 & 1) != 0) {
    goto LABEL_10;
  }
  id v4 = off_10026A288;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoveAllFriendsNetworkRequest bagKey](&OBJC_CLASS___GKRemoveAllFriendsNetworkRequest, "bagKey"));
  unsigned __int8 v9 = [v8 isEqualToString:v3];

  if ((v9 & 1) != 0) {
    goto LABEL_10;
  }
  id v4 = &off_10026A050;
  dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKChallengeNetworkRequest bagKey](&OBJC_CLASS___GKChallengeNetworkRequest, "bagKey"));
  unsigned __int8 v11 = [v10 isEqualToString:v3];

  if ((v11 & 1) != 0) {
    goto LABEL_10;
  }
  id v4 = &off_100269FB0;
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKAbortChallengeNetworkRequest bagKey](&OBJC_CLASS___GKAbortChallengeNetworkRequest, "bagKey"));
  unsigned __int8 v13 = [v12 isEqualToString:v3];

  if ((v13 & 1) != 0) {
    goto LABEL_10;
  }
  id v4 = &off_100269FE0;
  dispatch_queue_attr_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKAchievementNetworkRequest bagKey](&OBJC_CLASS___GKAchievementNetworkRequest, "bagKey"));
  unsigned __int8 v15 = [v14 isEqualToString:v3];

  if ((v15 & 1) != 0) {
    goto LABEL_10;
  }
  id v4 = &off_10026A2C0;
  dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKScoreNetworkRequest bagKey](&OBJC_CLASS___GKScoreNetworkRequest, "bagKey"));
  unsigned __int8 v17 = [v16 isEqualToString:v3];

  if ((v17 & 1) != 0) {
    goto LABEL_10;
  }
  id v4 = &off_10026A170;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKInstanceScoreNetworkRequest bagKey](&OBJC_CLASS___GKInstanceScoreNetworkRequest, "bagKey"));
  unsigned __int8 v19 = [v18 isEqualToString:v3];

  if ((v19 & 1) != 0) {
    goto LABEL_10;
  }
  id v4 = &off_10026A248;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerGameSettingsNetworkRequest bagKey]( &OBJC_CLASS___GKPlayerGameSettingsNetworkRequest,  "bagKey"));
  unsigned __int8 v21 = [v20 isEqualToString:v3];

  if ((v21 & 1) != 0
    || (id v4 = off_10026A210,
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKMultiplayerGroupRequest bagKey](&OBJC_CLASS___GKMultiplayerGroupRequest, "bagKey")),
        unsigned int v23 = [v22 isEqualToString:v3],
        v22,
        v23))
  {
LABEL_10:
    id v24 = (void *)objc_opt_class(*v4, v7);
  }

  else
  {
    id v24 = 0LL;
  }

  int v25 = v24;

  return v25;
}

+ (id)networkRequestFromNsurlTask:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BagKeyKey"]);
  unsigned __int8 v6 = +[GKNetworkRequestManager networkRequestClass:]( &OBJC_CLASS___GKNetworkRequestManager,  "networkRequestClass:",  v5);
  if (v6)
  {
    id v7 = [[v6 alloc] initWithTask:v3];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 originalRequest]);
    id v9 = [v8 mutableCopy];
    [v7 setNsurlRequest:v9];
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers(0LL);
    }
    unsigned __int8 v11 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      dispatch_queue_attr_t v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager error, unsupported class: %@",  (uint8_t *)&v13,  0xCu);
    }

    id v7 = 0LL;
  }

  return v7;
}

- (id)dictionaryForBagAndPlayer:(id)a3 createIfNotPresent:(BOOL)a4 description:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v10);

  if (v9)
  {
    id v12 = v9;
  }

  else
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 nsurlTask]);
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v13));
  }

  id v14 = objc_msgSend((id)objc_opt_class(v8, v11), "bagKey");
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"PlayerIDKey"]);
  if (v16)
  {
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
    v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v15]);

    if (v18) {
      goto LABEL_8;
    }
    if (v6)
    {
      v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
      [v19 setObject:v18 forKeyedSubscript:v15];

LABEL_8:
      uint64_t v20 = (GKNetworkRequestInfo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v18,  "objectForKeyedSubscript:",  v16));
      if (!v20)
      {
        if (!v6)
        {
          unsigned __int8 v21 = 0LL;
          goto LABEL_18;
        }

        uint64_t v20 = objc_alloc_init(&OBJC_CLASS___GKNetworkRequestInfo);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, v16);
      }

      unsigned __int8 v21 = v20;

LABEL_18:
      goto LABEL_19;
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers(0LL);
    }
    unsigned int v23 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager failed to get store due to nil playerID",  v25,  2u);
    }
  }

  unsigned __int8 v21 = 0LL;
LABEL_19:

  return v21;
}

- (BOOL)managerReady
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v5 = [v4 networkManagerStateOverride];

  if (v5 != (id)-1LL) {
    return v5 != 0LL;
  }
  if (-[GKNetworkRequestManager currentState](self, "currentState") < 2) {
    return 0;
  }
  return -[GKNetworkRequestManager fairPlaySessionReady](self, "fairPlaySessionReady");
}

- (void)addNetworkRequest:(id)a3 description:(id)a4 clientProxy:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v11);

  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v12);
  }
  id v14 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v15 = v14;
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[GKNetworkRequestManager currentState](self, "currentState")));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
    int v28 = 138412546;
    id v29 = v16;
    __int16 v30 = 2112;
    uint64_t v31 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager addNetworkRequest managerState: %@ memory state before update: %@",  (uint8_t *)&v28,  0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( -[GKNetworkRequestManager dictionaryForBagAndPlayer:createIfNotPresent:description:]( self,  "dictionaryForBagAndPlayer:createIfNotPresent:description:",  v8,  1LL,  v10));

  if (v18)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager backgroundSession](self, "backgroundSession"));
    [v8 handleNetworkRequest:v18 session:v20 clientProxy:v9];

    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers(v21);
    }
    unsigned int v23 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v24 = v23;
      int v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
      int v28 = 138412290;
      id v29 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager addNetworkRequest state after update: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v26 = (id)GKOSLoggers(v19);
    }
    uint64_t v27 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager error when trying to add to store: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)handleTaskFinished:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers(v4);
    }
    id v7 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager handleTaskFinished state before update: %@",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager networkRequestFromNsurlTask:]( &OBJC_CLASS___GKNetworkRequestManager,  "networkRequestFromNsurlTask:",  v5));
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10009F1EC;
    v15[3] = &unk_10026BDB0;
    v15[4] = self;
    id v16 = v10;
    id v12 = v10;
    dispatch_async(v11, v15);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers(0LL);
    }
    id v14 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager handleTaskFinished with nil task, skipping",  buf,  2u);
    }
  }
}

- (void)setupSessionsAsync
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009F440;
  block[3] = &unk_10026B670;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (BOOL)entityIsReleaseStateAwareForBagKey:(id)a3
{
  uint64_t v3 = qword_1002BB538;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1002BB538, &stru_100270348);
  }
  unsigned __int8 v5 = [(id)qword_1002BB530 containsObject:v4];

  return v5;
}

+ (BOOL)useJSONForBagKey:(id)a3
{
  uint64_t v3 = qword_1002BB548;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1002BB548, &stru_100270368);
  }
  unsigned __int8 v5 = [(id)qword_1002BB540 containsObject:v4];

  return v5;
}

- (id)playerCredentialsForClientProxy:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  id v5 = [v3 environment];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentGame]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryCredentialForEnvironment:v5 gameID:v7]);

  return v8;
}

- (void)assembleRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager playerCredentialsForClientProxy:](self, "playerCredentialsForClientProxy:", v14));
  -[GKNetworkRequestManager assembleRequestForPlayer:bagKey:clientProxy:sapSession:playerCredential:handler:]( self,  "assembleRequestForPlayer:bagKey:clientProxy:sapSession:playerCredential:handler:",  v16,  v15,  v14,  v13,  v17,  v12);
}

- (void)assembleRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager handlerQueue](self, "handlerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A01BC;
  block[3] = &unk_10026BF68;
  id v28 = v14;
  id v29 = v15;
  id v30 = v18;
  uint64_t v31 = self;
  id v32 = v16;
  id v33 = v17;
  id v34 = v19;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v18;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(v20, block);
}

- (void)writeToNetwork:(id)a3 clientProxy:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000A0728;
  v22[3] = &unk_10026D3C0;
  id v10 = a5;
  v22[4] = self;
  id v23 = v10;
  uint64_t v11 = objc_retainBlock(v22);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A07E8;
  block[3] = &unk_100270408;
  void block[4] = self;
  id v18 = v8;
  id v20 = v10;
  id v21 = v11;
  id v19 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v12, block);
}

- (id)waitListLocation
{
  uint64_t v2 = GKInsecureCacheRoot(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"networkWaitBeforeAllowAttempt.plist"]);

  uint64_t v6 = GKInsecureCacheRoot(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (id)gkEnsureDirectory(v7);

  return v4;
}

- (void)setWaitPeriod:(id)a3 waitPeriod:(double)a4
{
  id v6 = a3;
  p_waitListCallbacksLock = &self->_waitListCallbacksLock;
  os_unfair_lock_lock(&self->_waitListCallbacksLock);
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  id v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Attempting to update wait period: %@, %@",  (uint8_t *)&v16,  0x16u);
  }

  if (v6)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager waitListLocation](self, "waitListLocation"));
    id v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v13));
    if (!v14) {
      id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    if (a4 == 0.0)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0LL, v6);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a4));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, v6);
    }

    -[NSMutableDictionary writeToFile:atomically:](v14, "writeToFile:atomically:", v13, 1LL);
    os_unfair_lock_unlock(p_waitListCallbacksLock);
  }
}

- (void)handleRetryAfter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  v5));
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager attempting to retry after for task: %@",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager networkRequestFromNsurlTask:]( &OBJC_CLASS___GKNetworkRequestManager,  "networkRequestFromNsurlTask:",  v5));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A1180;
  block[3] = &unk_10026BEA0;
  id v16 = v10;
  id v17 = self;
  id v18 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

- (id)existingWaitListDate:(id)a3
{
  p_waitListCallbacksLock = &self->_waitListCallbacksLock;
  id v5 = a3;
  os_unfair_lock_lock(p_waitListCallbacksLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager waitListLocation](self, "waitListLocation"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v6));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);
  os_unfair_lock_unlock(p_waitListCallbacksLock);

  return v8;
}

- (id)canSafelyIssueRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingWaitListDate:](self, "existingWaitListDate:", v4));
  id v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  [v5 timeIntervalSinceNow];
  if (v7 <= 0.0)
  {
    -[GKNetworkRequestManager setWaitPeriod:waitPeriod:](self, "setWaitPeriod:waitPeriod:", v4, 0.0);
LABEL_5:
    id v10 = 0LL;
    goto LABEL_6;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A wait period is active not allowing network requests for this bag key: %@ , %@",  v4,  v6));
  NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
  id v13 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](&OBJC_CLASS___NSError, "userErrorForCode:userInfo:", 3LL, v9));

LABEL_6:
  return v10;
}

- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 handler:(id)a6
{
}

- (void)issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 storeBag]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000A159C;
  v28[3] = &unk_1002703E0;
  id v33 = v18;
  id v34 = v19;
  v28[4] = self;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  id v27 = v19;
  [v21 verifyEligibilityForBagKey:v25 replyQueue:0 client:v24 completion:v28];
}

- (void)_issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000A1710;
  v25[3] = &unk_1002704C0;
  v25[4] = self;
  id v26 = v15;
  id v30 = v17;
  id v31 = a8;
  id v27 = v14;
  id v28 = v16;
  id v29 = v18;
  id v19 = v17;
  id v20 = v18;
  id v21 = v16;
  id v22 = v14;
  id v23 = v31;
  id v24 = v15;
  -[GKNetworkRequestManager getFairPlaySession:](self, "getFairPlaySession:", v25);
}

- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 handler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager playerCredentialsForClientProxy:](self, "playerCredentialsForClientProxy:", v14));
  -[GKNetworkRequestManager issueRequestForPlayer:bagKey:clientProxy:locale:playerCredential:handler:]( self,  "issueRequestForPlayer:bagKey:clientProxy:locale:playerCredential:handler:",  v16,  v15,  v14,  v13,  v17,  v12);
}

+ (id)uuidFromTask:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager dictionaryFromTaskDescription:]( &OBJC_CLASS___GKNetworkRequestManager,  "dictionaryFromTaskDescription:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"UUIDKey"]);

  return v4;
}

+ (id)taskWithRequest:(id)a3 description:(id)a4 session:(id)a5
{
  if (!a3) {
    return 0LL;
  }
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a5 downloadTaskWithRequest:a3]);
  id v17 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  1LL,  &v17));

  id v10 = v17;
  uint64_t v11 = v10;
  if (v10)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v10);
    }
    id v13 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager JSON serialization error: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);
    if (v15) {
      [v8 setTaskDescription:v15];
    }
  }

  id v16 = v8;

  return v16;
}

- (id)resultsLocation
{
  uint64_t v2 = GKInsecureCacheRoot(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"staging"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"storeAndForwardResultsLocation"]);
  id v6 = (id)gkEnsureDirectory(v5);
  return v5;
}

- (id)pendingLocation
{
  uint64_t v2 = GKInsecureCacheRoot(self);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"staging"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"storeAndForwardPendingLocation"]);
  id v6 = (id)gkEnsureDirectory(v5);
  return v5;
}

- (id)taskFromIdentifier:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager contentsOfPendingStore:](self, "contentsOfPendingStore:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"BagKeyKey"]);
  id v5 = objc_alloc_init( +[GKNetworkRequestManager networkRequestClass:]( &OBJC_CLASS___GKNetworkRequestManager,  "networkRequestClass:",  v4));
  id v6 = [v5 updateWithTaskInfo:v3];
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers(v6);
  }
  uint64_t v8 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "GKNetworkRequestManager constructed pending request: %@",  (uint8_t *)&v10,  0xCu);
  }

  return v5;
}

- (void)issuePending
{
  id v3 = _localPlayerID();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000A2518;
    v6[3] = &unk_1002704E8;
    v6[4] = self;
    id v7 = v4;
    -[GKNetworkRequestManager getFairPlaySession:](self, "getFairPlaySession:", v6);
  }
}

- (GKEntityCacheProviderProtocol)entityCacheProvider
{
  return self->_entityCacheProvider;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSURLSessionConfiguration)backgroundConfig
{
  return self->_backgroundConfig;
}

- (void)setBackgroundConfig:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return self->_backgroundSession;
}

- (void)setBackgroundSession:(id)a3
{
}

- (GKNetworkRequestManagerSessionDelegate)backgroundTasksSessionDelegate
{
  return self->_backgroundTasksSessionDelegate;
}

- (void)setBackgroundTasksSessionDelegate:(id)a3
{
}

- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)inProcessTasksSessionDelegate
{
  return self->_inProcessTasksSessionDelegate;
}

- (void)setInProcessTasksSessionDelegate:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (BOOL)firstUnlockedState
{
  return self->_firstUnlockedState;
}

- (void)setFirstUnlockedState:(BOOL)a3
{
  self->_firstUnlockedState = a3;
}

- (NSDictionary)serviceDependancyMappings
{
  return self->_serviceDependancyMappings;
}

- (void)setServiceDependancyMappings:(id)a3
{
}

- (NSMutableDictionary)existingTasks
{
  return self->_existingTasks;
}

- (void)setExistingTasks:(id)a3
{
}

- (BOOL)reportedExessiveRequests
{
  return self->_reportedExessiveRequests;
}

- (void)setReportedExessiveRequests:(BOOL)a3
{
  self->_reportedExessiveRequests = a3;
}

- (os_unfair_lock_s)pendingCallbacksLock
{
  return self->_pendingCallbacksLock;
}

- (void)setPendingCallbacksLock:(os_unfair_lock_s)a3
{
  self->_pendingCallbacksLock = a3;
}

- (os_unfair_lock_s)waitListCallbacksLock
{
  return self->_waitListCallbacksLock;
}

- (void)setWaitListCallbacksLock:(os_unfair_lock_s)a3
{
  self->_waitListCallbacksLock = a3;
}

- (NSMutableDictionary)pendingCallbacks
{
  return self->_pendingCallbacks;
}

- (void)setPendingCallbacks:(id)a3
{
}

- (NSURLSession)inProcessSession
{
  return self->_inProcessSession;
}

- (void)setInProcessSession:(id)a3
{
}

- (NSURLSessionConfiguration)inProcessConfig
{
  return self->_inProcessConfig;
}

- (void)setInProcessConfig:(id)a3
{
}

- (BOOL)fairPlaySessionReady
{
  return self->_fairPlaySessionReady;
}

- (void)setFairPlaySessionReady:(BOOL)a3
{
  self->_fairPlaySessionReady = a3;
}

- (GKFairPlaySessionProvider)fairPlaySessionProvider
{
  return self->_fairPlaySessionProvider;
}

- (void)setFairPlaySessionProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)makeEntityCacheProviderInMemory:(BOOL)a3
{
  return v3;
}

- (void)createEntityWithRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 completionHandler:(id)a6 entityMaker:(id)a7
{
  id v12 = _Block_copy(a6);
  id v13 = _Block_copy(a7);
  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v17 = v16;
  uint64_t v18 = swift_allocObject(&unk_100274700, 24LL, 7LL);
  *(void *)(v18 + 16) = v12;
  uint64_t v19 = swift_allocObject(&unk_100274728, 24LL, 7LL);
  *(void *)(v19 + 16) = v13;
  id v20 = a5;
  id v21 = self;
  sub_100152A58(v14, v15, v17, v20, (uint64_t)sub_100158A28, v18, (uint64_t)sub_100158A2C, v19);

  swift_bridgeObjectRelease(v14, v22);
  swift_bridgeObjectRelease(v17, v23);
  swift_release(v18);
  swift_release(v19);
}

- (void)createEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 clientProxy:(GKClientProxy *)a5 entityMaker:(id)a6 completionHandler:
{
  id v7 = v6;
  id v12 = _Block_copy(a6);
  id v13 = _Block_copy(v7);
  uint64_t v14 = (void *)swift_allocObject(&unk_1002746B0, 64LL, 7LL);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v12;
  v14[6] = v13;
  v14[7] = self;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  uint64_t v18 = self;
  sub_100188AB4((uint64_t)&unk_1002B8F50, (uint64_t)v14);
}

- (void)readEntityWithRequest:(id)a3 bagKey:(id)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(id)a6 completionHandler:(id)a7 entityMaker:(id)a8
{
  uint64_t v14 = _Block_copy(a7);
  uint64_t v15 = _Block_copy(a8);
  if (a3) {
    a3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v18 = v17;
  uint64_t v19 = swift_allocObject(&unk_100274530, 24LL, 7LL);
  *(void *)(v19 + 16) = v14;
  uint64_t v20 = swift_allocObject(&unk_100274558, 24LL, 7LL);
  *(void *)(v20 + 16) = v15;
  id v21 = a6;
  uint64_t v22 = self;
  sub_100153AE8((uint64_t)a3, v16, v18, a5, v21, (uint64_t)sub_100157AA0, v19, (uint64_t)sub_100158A2C, v20);

  swift_bridgeObjectRelease(v18, v23);
  swift_release(v19);
  swift_release(v20);
  swift_bridgeObjectRelease(a3, v24);
}

- (void)deleteEntitiesWithBagKey:(NSString *)a3 clientProxy:(GKClientProxy *)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = (void *)swift_allocObject(&unk_1002743E0, 48LL, 7LL);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  int v10 = a3;
  uint64_t v11 = a4;
  id v12 = self;
  sub_100188AB4((uint64_t)&unk_1002B8EB8, (uint64_t)v9);
}

+ (id)makeEntityIDWithRequest:(id)a3 bagKey:(id)a4
{
  if (a3) {
    id v5 = (char *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    id v5 = 0LL;
  }
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v8 = v7;
  sub_1001549C0(v5, v6, v7);
  uint64_t v10 = v9;
  swift_bridgeObjectRelease(v8, v9);
  swift_bridgeObjectRelease(v5, v11);
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10, v13);
  return v12;
}

@end