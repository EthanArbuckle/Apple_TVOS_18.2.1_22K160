@interface CloudBackgroundTaskManager
+ (id)sharedTaskManager;
- (BOOL)_cellularDataAllowedForJaliscoApps;
- (BOOL)_cellularDataAllowedForJaliscoMedia;
- (CloudBackgroundTaskManager)init;
- (double)_throttledDeferredEvaluateKeepLocalTime;
- (id)_baseBtaJobForDeferredPush;
- (id)_baseBtaJobForPeriodicPollCellularDataAllowed:(BOOL)a3;
- (id)_homeSharingPrefsNumberForKey:(id)a3;
- (id)_nextEvaluateSyncRulesOperationTimeKey;
- (id)_nextEvaluateSyncRulesThrottleOperationTimeKey;
- (id)_nextJaliscoAppsPollTimeKey;
- (id)_nextJaliscoMediaPollTimeKey;
- (void)_handleJaliscoMediaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4;
- (void)_handleJaliscoMediaPeriodicPollJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4;
- (void)_handleJobNamed:(const char *)a3 satisfied:(BOOL)a4 invalid:(BOOL)a5;
- (void)_handleSagaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4;
- (void)_initializeBTAHandlers;
- (void)_scheduleJobNamed:(const char *)a3 withStartTime:(id)a4 baseBtaJob:(id)a5;
- (void)_setHomeSharingPrefsNumber:(id)a3 forKey:(id)a4;
- (void)_unscheduleJobNamed:(const char *)a3;
- (void)scheduleJaliscoMediaDeferredPushUpate;
- (void)scheduleJaliscoMediaPeriodicPoll;
- (void)scheduleSagaDeferredPushUpate;
- (void)unscheduleJaliscoMediaDeferredPushUpate;
- (void)unscheduleJaliscoMediaPeriodicPoll;
- (void)unscheduleSagaDeferredPushUpate;
@end

@implementation CloudBackgroundTaskManager

- (CloudBackgroundTaskManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CloudBackgroundTaskManager;
  v2 = -[CloudBackgroundTaskManager init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[CloudBackgroundTaskManager _initializeBTAHandlers](v2, "_initializeBTAHandlers");
  }
  return v3;
}

- (void)scheduleSagaDeferredPushUpate
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceReferenceDate];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudBackgroundTaskManager _baseBtaJobForDeferredPush](self, "_baseBtaJobForDeferredPush"));
  -[CloudBackgroundTaskManager _scheduleJobNamed:withStartTime:baseBtaJob:]( self,  "_scheduleJobNamed:withStartTime:baseBtaJob:",  "com.apple.itunescloudd.deferredPushUpdate.saga",  v3,  v4);
}

- (void)unscheduleSagaDeferredPushUpate
{
}

- (void)scheduleJaliscoMediaPeriodicPoll
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CloudBackgroundTaskManager _nextJaliscoMediaPollTimeKey](self, "_nextJaliscoMediaPollTimeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[CloudBackgroundTaskManager _homeSharingPrefsNumberForKey:]( self,  "_homeSharingPrefsNumberForKey:",  v5));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[CloudBackgroundTaskManager _baseBtaJobForPeriodicPollCellularDataAllowed:]( self,  "_baseBtaJobForPeriodicPollCellularDataAllowed:",  -[CloudBackgroundTaskManager _cellularDataAllowedForJaliscoMedia]( self,  "_cellularDataAllowedForJaliscoMedia")));
  -[CloudBackgroundTaskManager _scheduleJobNamed:withStartTime:baseBtaJob:]( self,  "_scheduleJobNamed:withStartTime:baseBtaJob:",  "com.apple.itunescloudd.periodicPoll.jaliscoMedia",  v3,  v4);
}

- (void)unscheduleJaliscoMediaPeriodicPoll
{
}

- (void)scheduleJaliscoMediaDeferredPushUpate
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceReferenceDate];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudBackgroundTaskManager _baseBtaJobForDeferredPush](self, "_baseBtaJobForDeferredPush"));
  -[CloudBackgroundTaskManager _scheduleJobNamed:withStartTime:baseBtaJob:]( self,  "_scheduleJobNamed:withStartTime:baseBtaJob:",  "com.apple.itunescloudd.deferredPushUpdate.jaliscoMedia",  v3,  v4);
}

- (void)unscheduleJaliscoMediaDeferredPushUpate
{
}

- (void)_handleSagaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Job Fired: SagaDeferredPushUpate (satisfied = %d)",  buf,  8u);
  }

  if (v4)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___ICConnectionConfiguration);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v7));
    uint64_t v10 = MSVTCCIdentityForCurrentProcess(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000F65D8;
    v14[3] = &unk_1001A6398;
    v14[4] = self;
    [v8 updateSagaLibraryWithClientIdentity:v11 forReason:1000 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:v14];
  }

  else
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Saga deferred push update job not satisfied, trying again in an hour.",  buf,  2u);
    }

    v7 = (ICConnectionConfiguration *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[ICConnectionConfiguration timeIntervalSinceReferenceDate](v7, "timeIntervalSinceReferenceDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13 + 3600.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudBackgroundTaskManager _baseBtaJobForDeferredPush](self, "_baseBtaJobForDeferredPush"));
    -[CloudBackgroundTaskManager _scheduleJobNamed:withStartTime:baseBtaJob:]( self,  "_scheduleJobNamed:withStartTime:baseBtaJob:",  "com.apple.itunescloudd.deferredPushUpdate.saga",  v8,  v11);
  }
}

- (void)_handleJaliscoMediaPeriodicPollJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Job Fired: JaliscoMediaPeriodicPoll (satisfied = %d)",  buf,  8u);
  }

  if (v4)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___ICConnectionConfiguration);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v7));
    uint64_t v10 = MSVTCCIdentityForCurrentProcess(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000F6208;
    v17[3] = &unk_1001A6398;
    v17[4] = self;
    [v8 updateJaliscoLibraryWithClientIdentity:v11 forReason:4 completionHandler:v17];
  }

  else
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Jalisco media periodic poll update job was not satisfied, trying again tomorrow.",  buf,  2u);
    }

    double v13 = objc_alloc(&OBJC_CLASS___NSNumber);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v14 timeIntervalSinceReferenceDate];
    v7 = -[NSNumber initWithDouble:](v13, "initWithDouble:", v15 + 86400.0);

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudBackgroundTaskManager _nextJaliscoMediaPollTimeKey](self, "_nextJaliscoMediaPollTimeKey"));
    -[CloudBackgroundTaskManager _setHomeSharingPrefsNumber:forKey:]( self,  "_setHomeSharingPrefsNumber:forKey:",  v7,  v16);

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[CloudBackgroundTaskManager _baseBtaJobForPeriodicPollCellularDataAllowed:]( self,  "_baseBtaJobForPeriodicPollCellularDataAllowed:",  -[CloudBackgroundTaskManager _cellularDataAllowedForJaliscoMedia]( self,  "_cellularDataAllowedForJaliscoMedia")));
    -[CloudBackgroundTaskManager _scheduleJobNamed:withStartTime:baseBtaJob:]( self,  "_scheduleJobNamed:withStartTime:baseBtaJob:",  "com.apple.itunescloudd.periodicPoll.jaliscoMedia",  v7,  v8);
  }
}

- (void)_handleJaliscoMediaDeferredPushUpdateJobSatisfied:(BOOL)a3 invalidRequest:(BOOL)a4
{
  BOOL v4 = a3;
  v6 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Job Fired: JaliscoMediaDeferredPushUpate (satisfied = %d)",  buf,  8u);
  }

  if (v4)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___ICConnectionConfiguration);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v7));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](v7, "clientIdentity"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000F60BC;
    v12[3] = &unk_1001A6398;
    v12[4] = self;
    [v8 updateJaliscoLibraryWithClientIdentity:v9 forReason:1000 completionHandler:v12];
  }

  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Jalisco media deferred push update job was not satisfied, trying again in an hour.",  buf,  2u);
    }

    v7 = (ICConnectionConfiguration *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[ICConnectionConfiguration timeIntervalSinceReferenceDate](v7, "timeIntervalSinceReferenceDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11 + 3600.0));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudBackgroundTaskManager _baseBtaJobForDeferredPush](self, "_baseBtaJobForDeferredPush"));
    -[CloudBackgroundTaskManager _scheduleJobNamed:withStartTime:baseBtaJob:]( self,  "_scheduleJobNamed:withStartTime:baseBtaJob:",  "com.apple.itunescloudd.deferredPushUpdate.jaliscoMedia",  v8,  v9);
  }
}

- (void)_initializeBTAHandlers
{
  v3 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  258LL,  7LL);
  jobNameToSelectorMap = self->_jobNameToSelectorMap;
  self->_jobNameToSelectorMap = v3;

  NSMapInsert( self->_jobNameToSelectorMap,  @"com.apple.itunescloudd.deferredPushUpdate.saga",  "_handleSagaDeferredPushUpdateJobSatisfied:invalidRequest:");
  NSMapInsert( self->_jobNameToSelectorMap,  @"com.apple.itunescloudd.periodicPoll.jaliscoMedia",  "_handleJaliscoMediaPeriodicPollJobSatisfied:invalidRequest:");
  NSMapInsert( self->_jobNameToSelectorMap,  @"com.apple.itunescloudd.deferredPushUpdate.jaliscoMedia",  "_handleJaliscoMediaDeferredPushUpdateJobSatisfied:invalidRequest:");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F5E1C;
  v6[3] = &unk_1001A63C0;
  v6[4] = self;
  id v5 = objc_retainBlock(v6);
  BackgroundTaskAgentInit("com.apple.itunescloudd", &_dispatch_main_q, v5);
}

- (void)_scheduleJobNamed:(const char *)a3 withStartTime:(id)a4 baseBtaJob:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  if (v7)
  {
    [v7 doubleValue];
    if (v11 < v12) {
      double v11 = v12;
    }
  }

  else
  {
    double v11 = v11 + 3600.0;
  }

  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowStartTime, v11);
  xpc_dictionary_set_double(v8, kBackgroundTaskAgentJobWindowEndTime, v11 + 604800.0);
  double v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = "no-name";
    if (a3) {
      BOOL v14 = a3;
    }
    int v15 = 136446466;
    BOOL v16 = v14;
    __int16 v17 = 2048;
    double v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Add Job: %{public}s -- Start time: %0.2f",  (uint8_t *)&v15,  0x16u);
  }

  BackgroundTaskAgentAddJob(a3, v8);
}

- (void)_unscheduleJobNamed:(const char *)a3
{
  BOOL v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = "no-name";
    if (a3) {
      id v5 = a3;
    }
    int v6 = 136446210;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing Job: %{public}s", (uint8_t *)&v6, 0xCu);
  }

  BackgroundTaskAgentRemoveJob(a3);
}

- (void)_handleJobNamed:(const char *)a3 satisfied:(BOOL)a4 invalid:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v9 = (const char *)NSMapGet( self->_jobNameToSelectorMap,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));
  if (v9)
  {
    objc_msgSend(self, v9, v6, v5);
  }

  else
  {
    double v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446210;
      double v12 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "No handler for BTA job named: %{public}s",  (uint8_t *)&v11,  0xCu);
    }

    -[CloudBackgroundTaskManager _unscheduleJobNamed:](self, "_unscheduleJobNamed:", a3);
  }

- (id)_baseBtaJobForDeferredPush
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v2, kBackgroundTaskAgentCellularAllowed, 0);
  return v2;
}

- (id)_baseBtaJobForPeriodicPollCellularDataAllowed:(BOOL)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v4, kBackgroundTaskAgentCellularAllowed, a3);
  xpc_dictionary_set_int64(v4, kBackgroundTaskAgentPowerPluggedinTime, 0LL);
  return v4;
}

- (void)_setHomeSharingPrefsNumber:(id)a3 forKey:(id)a4
{
}

- (id)_homeSharingPrefsNumberForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.homesharing");
}

- (double)_throttledDeferredEvaluateKeepLocalTime
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[CloudBackgroundTaskManager _nextEvaluateSyncRulesThrottleOperationTimeKey]( self,  "_nextEvaluateSyncRulesThrottleOperationTimeKey"));
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[CloudBackgroundTaskManager _homeSharingPrefsNumberForKey:]( self,  "_homeSharingPrefsNumberForKey:",  v3));

  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v7 timeIntervalSinceReferenceDate];
    double v6 = v8;
  }

  return v6;
}

- (id)_nextEvaluateSyncRulesOperationTimeKey
{
  return @"NextEvaluateSyncRulesOperationTime";
}

- (id)_nextEvaluateSyncRulesThrottleOperationTimeKey
{
  return @"NextEvaluateSyncRulesThrottleOperationTime";
}

- (id)_nextJaliscoMediaPollTimeKey
{
  return @"NextJaliscoLibraryPeriodicPollTime";
}

- (id)_nextJaliscoAppsPollTimeKey
{
  return @"NextJaliscoAppsPeriodicPollTime";
}

- (BOOL)_cellularDataAllowedForJaliscoApps
{
  xpc_object_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  char v3 = [v2 isCellularDataRestrictedForStoreApps] ^ 1;

  return v3;
}

- (BOOL)_cellularDataAllowedForJaliscoMedia
{
  xpc_object_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v3 = [v2 isCellularDataRestrictedForVideos];

  if (!v3) {
    return 1;
  }
  xpc_object_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned __int8 v5 = [v4 isCellularDataRestrictedForMusic];

  return v5 ^ 1;
}

- (void).cxx_destruct
{
}

+ (id)sharedTaskManager
{
  if (qword_1001DB840 != -1) {
    dispatch_once(&qword_1001DB840, &stru_1001A6370);
  }
  return (id)qword_1001DB838;
}

@end