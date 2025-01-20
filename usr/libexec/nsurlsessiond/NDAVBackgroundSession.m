@interface NDAVBackgroundSession
- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads;
- (BOOL)ensureAVAssetDownloadSessionWrapperForTaskIdentifier:(unint64_t)a3;
- (BOOL)hasEntitlementToSpecifyDownloadDestinationURL;
- (BOOL)retryTask:(id)a3 originalError:(id)a4;
- (NDAVBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11;
- (id)avAssetDownloadsDirectory;
- (id)avAssetForURL:(id)a3 downloadToken:(unint64_t)a4;
- (id)destinationURLToUseForTask:(id)a3;
- (id)downloadDirectoryToUse:(id)a3;
- (id)newAVAssetDownloadSessionWrapperForTaskInfo:(id)a3;
- (id)restoreTasksFromArchivedInfo:(id)a3;
- (id)restoreTasksFromSqliteDB:(id)a3;
- (int64_t)adjustedTCPConnectionPriorityForTaskPriority:(int64_t)a3;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didCompleteWithError:(id)a4;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didResolveMediaSelectionPropertyList:(id)a4;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didUpdateProgressWithLastBytesWritten:(unint64_t)a4 totalBytesWritten:(unint64_t)a5 totalBytesExpectedToWrite:(unint64_t)a6;
- (void)NDAVAssetDownloadSessionWrapper:(id)a3 willDownloadVariants:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)applicationWasQuitFromAppSwitcher:(id)a3;
- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12;
- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15;
- (void)cancelAVDownloadAndFailTaskWithIdentifier:(unint64_t)a3 withError:(id)a4;
- (void)cancelDelayedCompletionWakeTimer;
- (void)cancelTCPConnectionForTask:(unint64_t)a3 withError:(id)a4;
- (void)cancelTaskWithIdentifier:(unint64_t)a3;
- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4;
- (void)cancelThroughputMonitorForWrapper:(unint64_t)a3;
- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3;
- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 pipeHandle:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8;
- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7;
- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4;
- (void)resetStorageWithReply:(id)a3;
- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setupDelayedCompletionWakeTimer;
- (void)setupThroughputMonitorForWrapper:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5;
- (void)startAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3;
- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5;
- (void)stopAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3;
- (void)taskShouldResume:(unint64_t)a3;
- (void)taskShouldSuspend:(unint64_t)a3;
- (void)taskWithIdentifier:(unint64_t)a3 didCompleteWithError:(id)a4;
- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8;
@end

@implementation NDAVBackgroundSession

- (NDAVBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11
{
  BOOL v14 = a5;
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
  v25 = -[NDBackgroundSession initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:]( &v39,  "initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:",  v17,  v18,  v14,  v19,  v20,  v21,  v22,  v23,  v24);
  if (v25)
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    identifiersToAVWrappers = v25->_identifiersToAVWrappers;
    v25->_identifiersToAVWrappers = (NSMutableDictionary *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    identifiersToThroughputMonitors = v25->_identifiersToThroughputMonitors;
    v25->_identifiersToThroughputMonitors = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    identifiersToTCPConnections = v25->_identifiersToTCPConnections;
    v25->_identifiersToTCPConnections = (NSMutableDictionary *)v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    identifiersToDASActivities = v25->_identifiersToDASActivities;
    v25->_identifiersToDASActivities = (NSMutableDictionary *)v32;

    v34 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  5LL,  0LL);
    assetDownloadTokensToAssets = v25->_assetDownloadTokensToAssets;
    v25->_assetDownloadTokensToAssets = v34;

    objc_storeStrong((id *)&v25->_clientConfig, a3);
    delayedWakeTimer = v25->_delayedWakeTimer;
    v25->_delayedWakeTimer = 0LL;
  }

  return v25;
}

- (void)setupDelayedCompletionWakeTimer
{
  if (!self->_delayedWakeTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->super._workQueue);
    delayedWakeTimer = self->_delayedWakeTimer;
    self->_delayedWakeTimer = v3;

    v5 = self->_delayedWakeTimer;
    if (v5)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100048A5C;
      handler[3] = &unk_100079BE0;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
      v6 = self->_delayedWakeTimer;
      dispatch_time_t v7 = dispatch_time(0LL, 120000000000LL);
      dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_delayedWakeTimer);
      v8 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
        *(_DWORD *)buf = 138412546;
        v13 = v9;
        __int16 v14 = 2112;
        v15 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Scheduled delayed wake for session <%@>.<%@>",  buf,  0x16u);
      }
    }
  }

- (void)cancelDelayedCompletionWakeTimer
{
  if (self->_delayedWakeTimer)
  {
    v3 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      int v7 = 138412546;
      v8 = v4;
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Canceling delayed wake for session <%@>.<%@>",  (uint8_t *)&v7,  0x16u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_delayedWakeTimer);
    delayedWakeTimer = self->_delayedWakeTimer;
    self->_delayedWakeTimer = 0LL;
  }

- (void)setupThroughputMonitorForWrapper:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  unsigned int v9 = [v8 isDiscretionary];
  if (self->super._discretionary) {
    uint64_t v10 = v9 | 2LL;
  }
  else {
    uint64_t v10 = v9;
  }
  if (self->super._infersDiscretionary
    || -[NDApplication canBeSuspended](self->super._clientApplication, "canBeSuspended"))
  {
    v10 |= 4uLL;
  }

  v11 = -[NDAVThroughputMonitor initWithWrapper:monitoredApplication:priority:options:queue:]( [NDAVThroughputMonitor alloc],  "initWithWrapper:monitoredApplication:priority:options:queue:",  v14,  self->super._monitoredApplication,  [v8 basePriority],  v10,  self->super._workQueue);
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( identifiersToThroughputMonitors,  "setObject:forKeyedSubscript:",  v11,  v13);
}

- (void)cancelThroughputMonitorForWrapper:(unint64_t)a3
{
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToThroughputMonitors,  "objectForKeyedSubscript:",  v6));

  [v9 cancel];
  int v7 = self->_identifiersToThroughputMonitors;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v8);
}

- (id)restoreTasksFromSqliteDB:(id)a3
{
  id v48 = a3;
  tasksDB = self->super.tasksDB;
  if (tasksDB)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    tasksDB = (NDTaskStorageDB *)objc_claimAutoreleasedReturnValue( -[NDTaskStorageDB _getAllTasksFromDBForSession:sessionUUID:]( tasksDB,  "_getAllTasksFromDBForSession:sessionUUID:",  v5,  v6));
  }

  id v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v53 = self;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  obj = tasksDB;
  id v7 = -[NDTaskStorageDB countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v55,  v67,  16LL);
  if (v7)
  {
    uint64_t v51 = *(void *)v56;
    *(void *)&__int128 v8 = 138543618LL;
    __int128 v47 = v8;
    do
    {
      id v52 = v7;
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v56 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v10, "identifier", v47)));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 _destinationURLToUse]);
        v13 = v12;
        if (v12)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByDeletingLastPathComponent]);
          id v54 = 0LL;
          unsigned __int8 v15 = [v14 checkResourceIsReachableAndReturnError:&v54];
          id v16 = v54;

          if ((v15 & 1) == 0)
          {
            id v17 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 _loggableDescription]);
              *(_DWORD *)buf = 138543874;
              id v62 = v18;
              __int16 v63 = 2112;
              id v64 = v13;
              __int16 v65 = 2112;
              id v66 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ not restoring task due to unreachable destination folder %@ (%@)",  buf,  0x20u);
            }

            [v10 setState:3];
            id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:failingURL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:failingURL:",  NSURLErrorDomain,  -3000LL,  0LL));
            [v10 setError:v19];

            id v20 = objc_alloc(&OBJC_CLASS___PendingCallback);
            id v21 = [v10 identifier];
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
            v60[0] = v22;
            id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            v60[1] = v23;
            v60[2] = &__NSDictionary0__struct;
            id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v60,  3LL));
            v25 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v20,  "initWithCallbackType:taskIdentifier:args:",  0LL,  v21,  v24);

            -[NDCallbackQueue addPendingCallback:wakeRequirement:]( v53->super._callbackQueue,  "addPendingCallback:wakeRequirement:",  v25,  0LL);
          }
        }

        if ([v10 initializedWithAVAsset] && (uint64_t)objc_msgSend(v10, "state") <= 2)
        {
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v10 AVAssetURL]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v10 assetOptionsPlist]);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[AVURLAsset assetForNSURLSessionWithURL:propertyList:]( &OBJC_CLASS___AVURLAsset,  "assetForNSURLSessionWithURL:propertyList:",  v26,  v27));

          [v10 setAVURLAsset:v28];
          objc_msgSend(v10, "setAVAssetDownloadToken:", objc_msgSend(v28, "downloadToken"));
          if (!v28
            || (v29 = (void *)objc_claimAutoreleasedReturnValue([v28 URL]),
                BOOL v30 = v29 == 0LL,
                v29,
                v30))
          {
            v34 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              id v44 = (id)objc_claimAutoreleasedReturnValue([v10 _loggableDescription]);
              id v45 = [v10 AVAssetDownloadToken];
              *(_DWORD *)buf = v47;
              id v62 = v44;
              __int16 v63 = 2048;
              id v64 = v45;
              _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to re-instantiate AVURLAsset with token %llu",  buf,  0x16u);
            }

            [v10 setState:3];
            v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:failingURL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:failingURL:",  NSURLErrorDomain,  -1LL,  0LL));
            [v10 setError:v35];

            v36 = objc_alloc(&OBJC_CLASS___PendingCallback);
            id v37 = [v10 identifier];
            v38 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
            v59[0] = v38;
            objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            v59[1] = v39;
            v59[2] = &__NSDictionary0__struct;
            v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v59,  3LL));
            v31 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v36,  "initWithCallbackType:taskIdentifier:args:",  0LL,  v37,  v40);

            -[NDCallbackQueue addPendingCallback:wakeRequirement:]( v53->super._callbackQueue,  "addPendingCallback:wakeRequirement:",  v31,  0LL);
          }

          else
          {
            v31 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              id v32 = (id)objc_claimAutoreleasedReturnValue([v10 _loggableDescription]);
              id v33 = [v10 AVAssetDownloadToken];
              *(_DWORD *)buf = v47;
              id v62 = v32;
              __int16 v63 = 2048;
              id v64 = v33;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@ restored asset with token %llu from sqlite",  buf,  0x16u);
            }
          }
        }

        if ((uint64_t)[v10 state] <= 2)
        {
          if ([v10 hasStarted])
          {
            v41 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue([v10 _loggableDescription]);
              *(_DWORD *)buf = 138543362;
              id v62 = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@ adding to outstanding tasks list",  buf,  0xCu);
            }

            -[NDBackgroundSession addOutstandingTaskWithIdentifier:]( v53,  "addOutstandingTaskWithIdentifier:",  [v11 unsignedIntegerValue]);
            [v49 addObject:v10];
          }

          else
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 identifier]));
            [v48 addObject:v43];
          }
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v53->super._identifiersToTaskInfo,  "setObject:forKeyedSubscript:",  v10,  v11);
      }

      id v7 = -[NDTaskStorageDB countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v55,  v67,  16LL);
    }

    while (v7);
  }

  return v49;
}

- (id)restoreTasksFromArchivedInfo:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004841C;
  v9[3] = &unk_100079C08;
  v9[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4
{
  id v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToAVWrappers,  "objectForKeyedSubscript:",  a4));
  [v7 setCountOfBytesSent:0];
  objc_msgSend(v7, "setCountOfBytesReceived:", objc_msgSend(v6, "countOfBytesWritten"));
  [v7 setCountOfBytesExpectedToSend:0];
  objc_msgSend(v7, "setCountOfBytesExpectedToReceive:", objc_msgSend(v6, "countOfBytesExpectedToWrite"));
}

- (id)avAssetDownloadsDirectory
{
  if (!-[NDApplication usesContainerManagerForAVAsset]( self->super._clientApplication,  "usesContainerManagerForAVAsset")) {
    return (id)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession setupDownloadDirectory]( self,  "setupDownloadDirectory"));
  }
  uint64_t v29 = 1LL;
  id v3 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
  id v4 = (void *)container_create_or_lookup_path_for_current_user( 2,  [v3 UTF8String],  0,  0,  0,  &v29);

  if (!v4)
  {
    id v5 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error getting container path: %llu",  buf,  0xCu);
    }
  }

  id v6 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
  id v7 = (void *)container_user_managed_assets_relative_path([v6 UTF8String], &v29);

  if (!v7)
  {
    id v19 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Error getting User managed assets path: %llu",  buf,  0xCu);
    }

    return 0LL;
  }

  if (!v4) {
    return 0LL;
  }
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v4,  1LL,  0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v7,  1LL,  v8));
  free(v4);
  free(v7);

  if (v9)
  {
    char v28 = 0;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    unsigned int v12 = [v10 fileExistsAtPath:v11 isDirectory:&v28];

    if (v28) {
      unsigned int v13 = 0;
    }
    else {
      unsigned int v13 = v12;
    }
    if (v13 == 1)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v27 = 0LL;
      unsigned __int8 v15 = [v14 removeItemAtURL:v9 error:&v27];
      id v16 = v27;

      if ((v15 & 1) == 0)
      {
        id v17 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v25 = [v16 code];
          *(_DWORD *)buf = 138412546;
          uint64_t v31 = (uint64_t)v16;
          __int16 v32 = 2048;
          id v33 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Error removing file at location of asset downloads directory: %@ [%ld]",  buf,  0x16u);
        }
      }
    }

    else
    {
      id v16 = 0LL;
      id v20 = 0LL;
      if ((v12 & 1) != 0)
      {
LABEL_25:

        return v9;
      }
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v26 = v16;
    unsigned __int8 v22 = [v21 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v26];
    id v20 = v26;

    if ((v22 & 1) == 0)
    {
      id v23 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = [v20 code];
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = (uint64_t)v20;
        __int16 v32 = 2048;
        id v33 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Error creating asset downloads directory: %@ [%ld]",  buf,  0x16u);
      }
    }

    goto LABEL_25;
  }

  return v9;
}

- (id)downloadDirectoryToUse:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 URLByDeletingLastPathComponent]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession avAssetDownloadsDirectory](self, "avAssetDownloadsDirectory"));
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)destinationURLToUseForTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationURL]);
  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
    if (v6)
    {
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadConfig]);

      if (!v7)
      {
        id v5 = 0LL;
        goto LABEL_22;
      }
    }

    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 URL]);
    unsigned int v10 = [v9 isFileURL];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 URL]);
LABEL_21:

      goto LABEL_22;
    }

    if ([v4 AVAssetDownloadToken])
    {
      id v12 = [v4 AVAssetDownloadToken];
      if (!v12) {
        goto LABEL_11;
      }
    }

    else
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
      id v12 = [v13 downloadToken];

      if (!v12) {
LABEL_11:
      }
        id v12 = (id)arc4random();
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet URLPathAllowedCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "URLPathAllowedCharacterSet"));
    id v15 = [v14 mutableCopy];

    id v32 = v15;
    [v15 removeCharactersInString:@"/"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 assetTitle]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAddingPercentEncodingWithAllowedCharacters:v15]);

    if ((unint64_t)[v17 length] >= 0xE8)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringWithRange:", 0, 231));

      id v17 = (void *)v18;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v12));
    uint64_t v21 = destinationURLFragment(v19, v20);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (v17) {
      unsigned __int8 v22 = @"_";
    }
    else {
      unsigned __int8 v22 = &stru_10007B108;
    }
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 URL]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 pathExtension]);
    id v26 = [(id)objc_opt_class(AVURLAsset) performSelector:"_figFilePathExtensions"];
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    else {
      char v28 = @"movpkg";
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@.%@",  v17,  v22,  v33,  v28));
    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession avAssetDownloadsDirectory](self, "avAssetDownloadsDirectory"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v30 URLByAppendingPathComponent:v29 isDirectory:0]);

    v11 = v32;
    goto LABEL_21;
  }

- (void)applicationNoLongerInForeground:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100048178;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)applicationEnteredForeground:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100047ED4;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100047BE4;
  v7[3] = &unk_100079C30;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3
{
  id v4 = a3;
  workQueue = self->super._workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000478EC;
  v7[3] = &unk_100079C30;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7
{
}

- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
}

- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 pipeHandle:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
}

- (BOOL)hasEntitlementToSpecifyDownloadDestinationURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v3 = sub_100003B08( v2,  @"com.apple.private.nsurlsession.media-asset-download.can-specify-destination-url");

  return v3;
}

- (id)avAssetForURL:(id)a3 downloadToken:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    assetDownloadTokensToAssets = self->_assetDownloadTokensToAssets;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](assetDownloadTokensToAssets, "objectForKey:", v8));

    if (!v9)
    {
      if (v6)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AVURLAsset URLAssetWithURL:options:]( &OBJC_CLASS___AVURLAsset,  "URLAssetWithURL:options:",  v6,  0LL));
      }

      else
      {
        uint64_t v15 = AVURLAssetDownloadTokenKey;
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a4));
        id v16 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AVURLAsset URLAssetWithURL:options:]( &OBJC_CLASS___AVURLAsset,  "URLAssetWithURL:options:",  0LL,  v11));
      }

      id v12 = self->_assetDownloadTokensToAssets;
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
      -[NSMapTable setObject:forKey:](v12, "setObject:forKey:", v9, v13);
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  return objc_opt_respondsToSelector( &OBJC_CLASS___AVAssetDownloadSession,  "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:") & 1;
}

- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15
{
  id v20 = a4;
  id v21 = a5;
  id v68 = a6;
  id v70 = a7;
  id v71 = a8;
  id v22 = a9;
  id v65 = a10;
  id v69 = a12;
  id v23 = (void (**)(id, void))a15;
  id v24 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138545410;
    id v77 = v69;
    __int16 v78 = 2048;
    unint64_t v79 = a11;
    __int16 v80 = 2048;
    unint64_t v81 = a3;
    __int16 v82 = 2112;
    id v83 = v20;
    __int16 v84 = 2112;
    id v85 = v21;
    __int16 v86 = 2112;
    id v87 = v68;
    __int16 v88 = 2112;
    id v89 = v70;
    __int16 v90 = 2112;
    id v91 = v71;
    __int16 v92 = 2112;
    id v93 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Task <%{public}@>.<%lu> avAssetDownloadTaskWithDownloadToken: %llu, URL: %@, destinationURL: %@, temporaryDestinat ionURL: %@, assetTitle: %@, assetArtworkData: %@, options: %@",  buf,  0x5Cu);
  }

  id v66 = v21;
  id v64 = (id)objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession downloadDirectoryToUse:](self, "downloadDirectoryToUse:", v21));
  xpcConn = self->super._xpcConn;
  if (xpcConn) {
    -[NSXPCConnection auditToken](xpcConn, "auditToken");
  }
  else {
    memset(v75, 0, sizeof(v75));
  }
  id v26 = v64;
  id v58 = [v26 fileSystemRepresentation];
  if (!sandbox_check_by_audit_token(v75, "file-write-data", SANDBOX_CHECK_POSIX_WRITEABLE | 1u))
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate", v58);
    double v29 = v28;
    if (v22) {
      id v61 = [v22 mutableCopy];
    }
    else {
      id v61 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    uint64_t v62 = objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"]);
    [v61 setObject:0 forKeyedSubscript:@"AVAssetDownloadTaskDownloadConfigurationKey"];
    id v67 = v61;

    unsigned int v30 = !-[NDAVBackgroundSession doesAVAssetDownloadSessionSupportMultipleDownloads]( self,  "doesAVAssetDownloadSessionSupportMultipleDownloads");
    if (a13 != 5) {
      LOBYTE(v30) = 1;
    }
    if ((v30 & 1) != 0)
    {
      v35 = objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      v34 = -[__NSCFURLSessionTaskInfo initWithAVAssetDownloadURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:downloadConfig:]( v35,  "initWithAVAssetDownloadURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentif ier:bundleID:sessionID:downloadConfig:",  v20,  v66,  v70,  v71,  v67,  a11,  v69,  v32,  v33,  v62);
    }

    else
    {
      uint64_t v31 = objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      LOBYTE(v59) = a14;
      v34 = -[__NSCFURLSessionTaskInfo initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:enableSPIDelegateCallbacks:]( v31,  "initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:destinationURL:assetTitle:assetArtworkData:options:t askIdentifier:uniqueIdentifier:bundleID:sessionID:enableSPIDelegateCallbacks:",  v20,  v66,  v70,  v71,  v67,  a11,  v69,  v32,  v33,  v59);
    }

    v36 = v34;

    if (-[NDApplication hasForegroundBackgroundStates]( self->super._monitoredApplication,  "hasForegroundBackgroundStates"))
    {
      BOOL v37 = !self->super._discretionary;
    }

    else
    {
      BOOL v37 = 0LL;
    }

    -[__NSCFURLSessionTaskInfo setMayBeDemotedToDiscretionary:](v36, "setMayBeDemotedToDiscretionary:", v37);
    v74.receiver = self;
    v74.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
    -[__NSCFURLSessionTaskInfo setDiscretionary:]( v36,  "setDiscretionary:",  -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( &v74,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  0LL,  v36));
    v73.receiver = self;
    v73.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
    -[__NSCFURLSessionTaskInfo setBasePriority:]( v36,  "setBasePriority:",  -[NDBackgroundSession priorityForDiscretionaryStatus:]( &v73,  "priorityForDiscretionaryStatus:",  -[__NSCFURLSessionTaskInfo isDiscretionary](v36, "isDiscretionary")));
    -[__NSCFURLSessionTaskInfo setState:](v36, "setState:", 1LL);
    -[__NSCFURLSessionTaskInfo setSuspendCount:](v36, "setSuspendCount:", 1LL);
    -[__NSCFURLSessionTaskInfo setCreationTime:](v36, "setCreationTime:", v29);
    -[__NSCFURLSessionTaskInfo setAVAssetDownloadToken:](v36, "setAVAssetDownloadToken:", a3);
    -[__NSCFURLSessionTaskInfo setInitializedWithAVAsset:](v36, "setInitializedWithAVAsset:", a3 != 0);
    if (-[__NSCFURLSessionTaskInfo initializedWithAVAsset](v36, "initializedWithAVAsset"))
    {
      uint64_t v38 = objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession avAssetForURL:downloadToken:](self, "avAssetForURL:downloadToken:", v20, a3));
      -[__NSCFURLSessionTaskInfo setAVURLAsset:](v36, "setAVURLAsset:", v38);
    }

    else
    {
      uint64_t v38 = 0LL;
    }

    -[__NSCFURLSessionTaskInfo setTemporaryDestinationURL:](v36, "setTemporaryDestinationURL:", v68);
    -[__NSCFURLSessionTaskInfo setAssetTitle:](v36, "setAssetTitle:", v70);
    -[__NSCFURLSessionTaskInfo setAssetArtworkData:](v36, "setAssetArtworkData:", v71);
    -[__NSCFURLSessionTaskInfo setAssetOptionsPlist:](v36, "setAssetOptionsPlist:", v65);
    if (v38 | v62)
    {
      objc_super v39 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVBackgroundSession destinationURLToUseForTask:](self, "destinationURLToUseForTask:", v36));
      -[__NSCFURLSessionTaskInfo setDestinationURL:](v36, "setDestinationURL:", v39);

      if (v38)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([(id)v38 URL]);
        -[__NSCFURLSessionTaskInfo setAVAssetURL:](v36, "setAVAssetURL:", v40);

LABEL_31:
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo destinationURL](v36, "destinationURL"));
        BOOL v44 = v43 == 0LL;

        if (!v44)
        {
          id v45 = -[NDAVBackgroundSession newAVAssetDownloadSessionWrapperForTaskInfo:]( self,  "newAVAssetDownloadSessionWrapperForTaskInfo:",  v36);
          BOOL v60 = v45 != 0LL;
          v46 = (os_log_s *)(id)qword_100083990;
          __int128 v47 = v46;
          if (v45)
          {
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              id v48 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo _loggableDescription](v36, "_loggableDescription"));
              *(_DWORD *)buf = 138543874;
              id v77 = v48;
              __int16 v78 = 2112;
              unint64_t v79 = (unint64_t)v45;
              __int16 v80 = 2048;
              unint64_t v81 = a3;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%{public}@ new AVAssetDownloadSession %@ with token %llu",  buf,  0x20u);
            }

            identifiersToTaskInfo = self->super._identifiersToTaskInfo;
            v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a11));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( identifiersToTaskInfo,  "setObject:forKeyedSubscript:",  v36,  v50);

            identifiersToAVWrappers = self->_identifiersToAVWrappers;
            id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a11));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( identifiersToAVWrappers,  "setObject:forKeyedSubscript:",  v45,  v52);

            [v45 setTaskIdentifier:a11];
            -[NDAVBackgroundSession setupThroughputMonitorForWrapper:taskInfo:identifier:]( self,  "setupThroughputMonitorForWrapper:taskInfo:identifier:",  v45,  v36,  a11);
            v72.receiver = self;
            v72.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
            -[NDBackgroundSession addOutstandingTaskWithIdentifier:](&v72, "addOutstandingTaskWithIdentifier:", a11);
            v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a11));
            -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v53,  14LL,  1LL);

            clientProxy = self->super._clientProxy;
            __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo destinationURL](v36, "destinationURL"));
            -[NSXPCProxyCreating backgroundAVAssetDownloadTask:willDownloadToURL:]( clientProxy,  "backgroundAVAssetDownloadTask:willDownloadToURL:",  a11,  v47);
          }

          else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo _loggableDescription](v36, "_loggableDescription"));
            *(_DWORD *)buf = 138543362;
            id v77 = v57;
            _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to instantiate AVAssetDownloadSession",  buf,  0xCu);
          }

LABEL_42:
          ((void (**)(id, BOOL))v23)[2](v23, v60);

          goto LABEL_43;
        }

- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12
{
  id v37 = a4;
  id v40 = a5;
  id v41 = a6;
  id v42 = a7;
  id v38 = a8;
  id v39 = a9;
  id v43 = a11;
  uint64_t v18 = (void (**)(id, BOOL))a12;
  id v19 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544898;
    id v50 = v43;
    __int16 v51 = 2048;
    unint64_t v52 = a10;
    __int16 v53 = 2048;
    unint64_t v54 = a3;
    __int16 v55 = 2112;
    id v56 = v37;
    __int16 v57 = 2112;
    id v58 = v40;
    __int16 v59 = 2112;
    id v60 = v41;
    __int16 v61 = 2112;
    id v62 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Task <%{public}@>.<%lu> avAggregateAssetDownloadTaskWithDownloadToken: %llu, serializedMediaSelections: %@, assetT itle: %@, assetArtworkData: %@, options: %@",  buf,  0x48u);
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v21 = v20;
  id v22 = objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
  id v25 = -[__NSCFURLSessionTaskInfo initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:]( v22,  "initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:assetTitle:assetArtworkData:options:taskIdentif ier:uniqueIdentifier:bundleID:sessionID:",  v39,  v40,  v41,  v42,  a10,  v43,  v23,  v24);

  if (-[NDApplication hasForegroundBackgroundStates]( self->super._monitoredApplication,  "hasForegroundBackgroundStates"))
  {
    BOOL v26 = !self->super._discretionary;
  }

  else
  {
    BOOL v26 = 0LL;
  }

  -[__NSCFURLSessionTaskInfo setMayBeDemotedToDiscretionary:](v25, "setMayBeDemotedToDiscretionary:", v26);
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
  -[__NSCFURLSessionTaskInfo setDiscretionary:]( v25,  "setDiscretionary:",  -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( &v46,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  0LL,  v25));
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
  -[__NSCFURLSessionTaskInfo setBasePriority:]( v25,  "setBasePriority:",  -[NDBackgroundSession priorityForDiscretionaryStatus:]( &v45,  "priorityForDiscretionaryStatus:",  -[__NSCFURLSessionTaskInfo isDiscretionary](v25, "isDiscretionary")));
  -[__NSCFURLSessionTaskInfo setState:](v25, "setState:", 1LL);
  -[__NSCFURLSessionTaskInfo setSuspendCount:](v25, "setSuspendCount:", 1LL);
  -[__NSCFURLSessionTaskInfo setCreationTime:](v25, "setCreationTime:", v21);
  -[__NSCFURLSessionTaskInfo setInitializedWithAVAsset:](v25, "setInitializedWithAVAsset:", 1LL);
  -[__NSCFURLSessionTaskInfo setAVAssetDownloadToken:](v25, "setAVAssetDownloadToken:", a3);
  uint64_t v47 = AVURLAssetDownloadTokenKey;
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v48 = v27;
  double v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
  double v29 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset URLAssetWithURL:options:](&OBJC_CLASS___AVURLAsset, "URLAssetWithURL:options:", 0LL, v28));

  -[__NSCFURLSessionTaskInfo setAVURLAsset:](v25, "setAVURLAsset:", v29);
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 URL]);
  -[__NSCFURLSessionTaskInfo setAVAssetURL:](v25, "setAVAssetURL:", v30);

  -[__NSCFURLSessionTaskInfo setAssetOptionsPlist:](v25, "setAssetOptionsPlist:", v38);
  uint64_t v31 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo _loggableDescription](v25, "_loggableDescription"));
    *(_DWORD *)buf = 138543618;
    id v50 = v32;
    __int16 v51 = 2112;
    unint64_t v52 = (unint64_t)v29;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@ new AVAggregateAssetDownloadTask asset: %@",  buf,  0x16u);
  }

  if (v29)
  {
    identifiersToTaskInfo = self->super._identifiersToTaskInfo;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a10));
    -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTaskInfo, "setObject:forKeyedSubscript:", v25, v34);

    v44.receiver = self;
    v44.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
    -[NDBackgroundSession addOutstandingTaskWithIdentifier:](&v44, "addOutstandingTaskWithIdentifier:", a10);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a10));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v35,  14LL,  1LL);
  }

  else
  {
    v35 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo _loggableDescription](v25, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      id v50 = v36;
      __int16 v51 = 2048;
      unint64_t v52 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to instantiate AVAsset, token %llu",  buf,  0x16u);
    }
  }

  v18[2](v18, v29 != 0LL);
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v6));

  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    int v12 = 138543362;
    unsigned int v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ cancelTaskWithIdentifier",  (uint8_t *)&v12,  0xCu);
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 _URLToUse]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  NSURLErrorDomain,  -999LL,  v10));

  -[NDAVBackgroundSession cancelAVDownloadAndFailTaskWithIdentifier:withError:]( self,  "cancelAVDownloadAndFailTaskWithIdentifier:withError:",  a3,  v11);
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  -[NDAVBackgroundSession cancelTaskWithIdentifier:](self, "cancelTaskWithIdentifier:", a3);
  v6[2](v6, 0LL);
}

- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
  -[NDBackgroundSession setPriority:forTaskWithIdentifier:](&v10, "setPriority:forTaskWithIdentifier:", a3, a4);
  identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToThroughputMonitors,  "objectForKeyedSubscript:",  v8));

  [v9 setBasePriority:a3];
}

- (void)cancelAVDownloadAndFailTaskWithIdentifier:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v8));

  [v9 setResumedAndWaitingForEarliestBeginDate:0];
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToAVWrappers,  "objectForKeyedSubscript:",  v11));

  [v12 cancel];
  -[NDAVBackgroundSession cancelTCPConnectionForTask:withError:](self, "cancelTCPConnectionForTask:withError:", a3, v6);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047860;
  block[3] = &unk_100079C58;
  id v17 = v6;
  unint64_t v18 = a3;
  block[4] = self;
  id v15 = v6;
  dispatch_async(v14, block);
}

- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5
{
  workQueue = self->super._workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100047828;
  v6[3] = &unk_100079C80;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async((dispatch_queue_t)workQueue, v6);
}

- (BOOL)retryTask:(id)a3 originalError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
    int v47 = 138543362;
    id v48 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ retrying AVAssetDownloadTask",  (uint8_t *)&v47,  0xCu);
  }

  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 identifier]));
  int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToAVWrappers,  "objectForKeyedSubscript:",  v11));

  if (v12)
  {
    unsigned int v13 = self->_identifiersToAVWrappers;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 identifier]));
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);
  }

  -[NDBackgroundSession updateTaskInfoBasedOnCurrentDiscretionaryStatus:]( self,  "updateTaskInfoBasedOnCurrentDiscretionaryStatus:",  v6);
  [v6 setRetryError:v7];
  if (!v7) {
    goto LABEL_20;
  }
  id v15 = (id)objc_claimAutoreleasedReturnValue([v7 domain]);
  if ([v15 isEqualToString:AVFoundationErrorDomain])
  {
    BOOL v16 = [v7 code] == (id)-11819;

    if (!v16) {
      goto LABEL_13;
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 AVAssetURL]);
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 assetOptionsPlist]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AVURLAsset assetForNSURLSessionWithURL:propertyList:]( &OBJC_CLASS___AVURLAsset,  "assetForNSURLSessionWithURL:propertyList:",  v17,  v18));
    [v6 setAVURLAsset:v19];

    double v20 = (void *)objc_claimAutoreleasedReturnValue([v6 AVURLAsset]);
    objc_msgSend(v6, "setAVAssetDownloadToken:", objc_msgSend(v20, "downloadToken"));

    if ([v6 AVAssetDownloadToken])
    {
      assetDownloadTokensToAssets = self->_assetDownloadTokensToAssets;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 AVURLAsset]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 AVAssetDownloadToken]));
      -[NSMapTable setObject:forKey:](assetDownloadTokensToAssets, "setObject:forKey:", v22, v23);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 identifier]));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v24,  14LL,  1LL);

    id v15 = (id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = (id)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
      id v26 = [v7 code];
      id v27 = [v6 retryCount];
      double v28 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
      int v47 = 138544386;
      id v48 = v25;
      __int16 v49 = 2112;
      double v50 = *(double *)&v7;
      __int16 v51 = 2048;
      id v52 = v26;
      __int16 v53 = 2048;
      id v54 = v27;
      __int16 v55 = 2112;
      id v56 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ recreated asset after error %@ [%ld] retry count %lu options = %@",  (uint8_t *)&v47,  0x34u);
    }
  }

LABEL_13:
  double v29 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  unsigned int v30 = [v29 isEqualToString:AVFoundationErrorDomain];

  if (!v30)
  {
LABEL_20:
    unsigned int v35 = 0;
    goto LABEL_21;
  }

  id v31 = [v7 code];
  if (v31 == (id)-11903LL || v31 == (id)-11900LL) {
    goto LABEL_16;
  }
  objc_super v45 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:NSUnderlyingErrorKey]);

  if ([v34 code] != (id)-12540)
  {
    unsigned int v35 = 0;
LABEL_19:

    goto LABEL_21;
  }

  objc_super v46 = (void *)objc_claimAutoreleasedReturnValue([v34 domain]);
  unsigned int v35 = [v46 isEqualToString:NSOSStatusErrorDomain];

  if (v35)
  {
LABEL_16:
    id v32 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
      int v47 = 138543362;
      id v48 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ removing destination file for AVAssetDownloadTask in order to retry",  (uint8_t *)&v47,  0xCu);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v6 _destinationURLToUse]);
    +[NDFileUtilities removeItemAtURL:](&OBJC_CLASS___NDFileUtilities, "removeItemAtURL:", v34);
    unsigned int v35 = 1;
    goto LABEL_19;
  }

- (void)taskShouldSuspend:(unint64_t)a3
{
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v24 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v6));

  if ([v24 taskKind] == (id)3 || objc_msgSend(v24, "taskKind") == (id)5)
  {
    identifiersToAVWrappers = self->_identifiersToAVWrappers;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToAVWrappers,  "objectForKeyedSubscript:",  v8));

    identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToThroughputMonitors,  "objectForKeyedSubscript:",  v11));

    [v9 suspend];
    [v12 wrapperWillSuspend];
    if (([v24 resumedAndWaitingForEarliestBeginDate] & 1) == 0)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
      sub_100035394( 2,  v13,  v14,  v15,  v16,  v24,  0,  0,  0,  [v24 isDiscretionary],  0,  0,  0,  0);
    }

    [v24 setResumedAndWaitingForEarliestBeginDate:0];
    identifiersToDASActivities = self->_identifiersToDASActivities;
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToDASActivities,  "objectForKeyedSubscript:",  v18));

    if (v19)
    {
      double v20 = self->_identifiersToDASActivities;
      double v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", 0LL, v21);

      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](&OBJC_CLASS____DASScheduler, "sharedScheduler"));
      [v22 activityCanceled:v19];
    }
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v23,  11LL,  1LL);
}

- (void)taskShouldResume:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._identifiersToTaskInfo,  "objectForKeyedSubscript:",  v5));
  if ([v6 taskKind] == (id)3 || objc_msgSend(v6, "taskKind") == (id)5)
  {
    identifiersToAVWrappers = self->_identifiersToAVWrappers;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToAVWrappers,  "objectForKeyedSubscript:",  v8));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000464F8;
    v12[3] = &unk_100079D48;
    id v13 = v6;
    id v14 = self;
    unint64_t v17 = a3;
    id v15 = v9;
    id v16 = v5;
    id v10 = v9;
    -[NDBackgroundSession handleEarliestBeginDateForTaskWithIdentifier:completionHandler:]( self,  "handleEarliestBeginDateForTaskWithIdentifier:completionHandler:",  a3,  v12);
  }

  if (([v6 hasStarted] & 1) == 0
    && ([v6 isDiscretionary] & 1) == 0)
  {
    [v6 setStartedUserInitiated:1];
  }

  [v6 setHasStarted:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v11,  14LL,  1LL);
}

- (int64_t)adjustedTCPConnectionPriorityForTaskPriority:(int64_t)a3
{
  monitoredApplication = self->super._monitoredApplication;
  if (!monitoredApplication || -[NDApplication isForeground](monitoredApplication, "isForeground"))
  {
    if (a3 > 399)
    {
      if (a3 > 499)
      {
        if (a3 != 500)
        {
          if (a3 == 600) {
            return a3;
          }
LABEL_12:
          if (a3 == 650) {
            return 650LL;
          }
          return 300LL;
        }

        return 500LL;
      }

      if (a3 == 400) {
        return a3;
      }
LABEL_25:
      if (a3 != 450) {
        return 300LL;
      }
      return 450LL;
    }

    if (a3 > 299)
    {
      if (a3 == 300) {
        return a3;
      }
LABEL_28:
      if (a3 != 350) {
        return 300LL;
      }
      return 350LL;
    }

    goto LABEL_20;
  }

  if (a3 <= 399)
  {
    if (a3 > 299)
    {
      if (a3 == 300) {
        return 350LL;
      }
      goto LABEL_28;
    }

- (id)newAVAssetDownloadSessionWrapperForTaskInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
  if (v5)
  {

LABEL_4:
    id v7 = objc_alloc(&OBJC_CLASS___NDAVAssetDownloadSessionWrapper);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 _destinationURLToUse]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    clientConfig = self->_clientConfig;
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 _AVAssetDownloadSessionOptions:v10 config:clientConfig asset:v12]);
    id v14 = -[NDAVAssetDownloadSessionWrapper initWithURLAsset:destinationURL:options:delegate:queue:]( v7,  "initWithURLAsset:destinationURL:options:delegate:queue:",  v8,  v9,  v13,  self,  self->super._workQueue);
    goto LABEL_5;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadConfig]);

  if (v6) {
    goto LABEL_4;
  }
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v4 _URLToUse]);

  if (!v20)
  {
    id v15 = 0LL;
    goto LABEL_9;
  }

  double v21 = objc_alloc(&OBJC_CLASS___NDAVAssetDownloadSessionWrapper);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 _URLToUse]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 _destinationURLToUse]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
  id v22 = self->_clientConfig;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 AVURLAsset]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 _AVAssetDownloadSessionOptions:v10 config:v22 asset:v12]);
  id v14 = -[NDAVAssetDownloadSessionWrapper initWithURL:destinationURL:options:delegate:queue:]( v21,  "initWithURL:destinationURL:options:delegate:queue:",  v8,  v9,  v13,  self,  self->super._workQueue);
LABEL_5:
  id v15 = v14;

  if (v15)
  {
    id v16 = -[NDAVAssetDownloadSessionWrapper downloadToken](v15, "downloadToken");
    unint64_t v17 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 _loggableDescription]);
      int v23 = 138543618;
      id v24 = v18;
      __int16 v25 = 2048;
      id v26 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ created AVAssetDownloadSession with token %llu",  (uint8_t *)&v23,  0x16u);
    }

    -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didReceiveDownloadToken:]( self->super._clientProxy,  "backgroundAVAssetDownloadTask:didReceiveDownloadToken:",  [v4 identifier],  v16);
  }

- (BOOL)ensureAVAssetDownloadSessionWrapperForTaskIdentifier:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._identifiersToTaskInfo,  "objectForKeyedSubscript:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiersToAVWrappers, "objectForKey:", v5));

  if (v7)
  {
    BOOL v8 = 1;
  }

  else
  {
    id v9 = -[NDAVBackgroundSession newAVAssetDownloadSessionWrapperForTaskInfo:]( self,  "newAVAssetDownloadSessionWrapperForTaskInfo:",  v6);
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 downloadToken];
      [v6 setAVAssetDownloadToken:v11];
      int v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        int v18 = 138543618;
        id v19 = v13;
        __int16 v20 = 2048;
        id v21 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ created AVAssetDownloadSession with token %llu",  (uint8_t *)&v18,  0x16u);
      }

      -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didReceiveDownloadToken:]( self->super._clientProxy,  "backgroundAVAssetDownloadTask:didReceiveDownloadToken:",  a3,  v11);
      [v10 setTaskIdentifier:a3];
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_identifiersToAVWrappers,  "setObject:forKeyedSubscript:",  v10,  v5);
      BOOL v8 = 1;
      id v14 = v10;
    }

    else
    {
      id v15 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        int v18 = 138543362;
        id v19 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ couldn't create AVAssetDownloadSession; returning an error",
          (uint8_t *)&v18,
          0xCu);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1LL,  0LL));
      -[NDAVBackgroundSession taskWithIdentifier:didCompleteWithError:]( self,  "taskWithIdentifier:didCompleteWithError:",  a3,  v14);
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)startAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._identifiersToTaskInfo,  "objectForKeyedSubscript:",  v5));
  id v7 = v6;
  if (v6
    && [v6 state] != (id)3
    && -[NDAVBackgroundSession ensureAVAssetDownloadSessionWrapperForTaskIdentifier:]( self,  "ensureAVAssetDownloadSessionWrapperForTaskIdentifier:",  a3))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToAVWrappers,  "objectForKeyedSubscript:",  v5));
    id v9 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
      *(_DWORD *)buf = 138543874;
      id v16 = v10;
      __int16 v17 = 2112;
      int v18 = v8;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ startAVAssetDownloadSessionWithTaskIdentifier wrapper: %@ taskIdentifier: %lu",  buf,  0x20u);
    }

    [v8 resume];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
    sub_100035394( 1,  v11,  v12,  v13,  v14,  v7,  0,  0,  0,  [v7 isDiscretionary],  0,  0,  0,  0);
  }
}

- (void)stopAVAssetDownloadSessionWithTaskIdentifier:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  @"_nsurlsessiondErrorDomain",  5LL,  0LL));
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToAVWrappers,  "objectForKeyedSubscript:",  v6));

  [v7 cancelAndDeliverError:v8];
}

- (void)resetStorageWithReply:(id)a3
{
}

- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3
{
  identifiersToAVWrappers = self->_identifiersToAVWrappers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToAVWrappers,  "objectForKeyedSubscript:",  v6));

  if (v7)
  {
    id v8 = self->_identifiersToAVWrappers;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
  -[NDBackgroundSession clientAcknowledgedTerminalCallbackForTask:]( &v10,  "clientAcknowledgedTerminalCallbackForTask:",  a3);
}

- (void)cancelTCPConnectionForTask:(unint64_t)a3 withError:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._identifiersToTaskInfo,  "objectForKeyedSubscript:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTCPConnections,  "objectForKeyedSubscript:",  v5));
  if (v7)
  {
    id v8 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
      int v14 = 138543362;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ canceling tcp_connection",  (uint8_t *)&v14,  0xCu);
    }

    tcp_connection_cancel(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToTCPConnections, "removeObjectForKey:", v5);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToDASActivities,  "objectForKeyedSubscript:",  v5));
  if (v10)
  {
    id v11 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ completing _DASActivity %@",  (uint8_t *)&v14,  0x16u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](&OBJC_CLASS____DASScheduler, "sharedScheduler"));
    [v13 activityCompleted:v10];

    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToDASActivities, "removeObjectForKey:", v5);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    *(_DWORD *)buf = 138543618;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ finished downloading to %@",  buf,  0x16u);
  }

  id v13 = objc_alloc(&OBJC_CLASS___PendingCallback);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v8));
  v17[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  __int16 v16 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v13,  "initWithCallbackType:taskIdentifier:args:",  1LL,  v10,  v15);

  -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->super._callbackQueue,  "addPendingCallback:wakeRequirement:",  v16,  0LL);
}

- (void)taskWithIdentifier:(unint64_t)a3 didCompleteWithError:(id)a4
{
  id v41 = a4;
  double v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->super._identifiersToTaskInfo,  "objectForKeyedSubscript:"));
  if (v6)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientErrorForError:](self, "clientErrorForError:", v41));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToAVWrappers,  "objectForKeyedSubscript:",  v40));
    double v38 = v7;
    if (v7) {
      id v8 = [v7 countOfBytesWritten];
    }
    else {
      id v8 = 0LL;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
    sub_100035394( 3,  v9,  v10,  v11,  v12,  v6,  0,  (uint64_t)v8,  0,  [v6 isDiscretionary],  0,  1,  0,  v41);

    [v6 setState:3];
    [v6 setError:v39];
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v13,  14LL,  1LL);

    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToAVWrappers, "removeObjectForKey:", v40);
    [v6 setAVURLAsset:0];
    if (sub_100003824((BOOL)v41)) {
      unsigned int v14 = -[NDApplication canBeSuspended](self->super._clientApplication, "canBeSuspended");
    }
    else {
      unsigned int v14 = 0;
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 _destinationURLToUse]);
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
    unsigned int v18 = [v15 fileExistsAtPath:v17];

    if (v18)
    {
      __int16 v19 = objc_alloc(&OBJC_CLASS___PendingCallback);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 _destinationURLToUse]);
      v49[0] = v20;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v49[1] = v21;
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
      int v23 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v19,  "initWithCallbackType:taskIdentifier:args:",  1LL,  a3,  v22);

      -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->super._callbackQueue,  "addPendingCallback:wakeRequirement:",  v23,  0LL);
    }

    id v24 = objc_alloc(&OBJC_CLASS___PendingCallback);
    __int16 v25 = v39;
    if (!v39) {
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v48[0] = v25;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v48[1] = v26;
    v48[2] = &__NSDictionary0__struct;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 3LL));
    double v28 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v24,  "initWithCallbackType:taskIdentifier:args:",  0LL,  a3,  v27);

    if (!v39) {
    -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->super._callbackQueue,  "addPendingCallback:wakeRequirement:",  v28,  0LL);
    }
    v43.receiver = self;
    v43.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
    -[NDBackgroundSession removeOutstandingTaskWithIdentifier:](&v43, "removeOutstandingTaskWithIdentifier:", a3);
    -[NDAVBackgroundSession cancelThroughputMonitorForWrapper:](self, "cancelThroughputMonitorForWrapper:", a3);
    v42.receiver = self;
    v42.super_class = (Class)&OBJC_CLASS___NDAVBackgroundSession;
    unsigned int v29 = -[NDBackgroundSession finalizeTaskCompletionWithSuppressedWake:]( &v42,  "finalizeTaskCompletionWithSuppressedWake:",  v14);
    unsigned int v30 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
      id v32 = (void *)v31;
      if (v29) {
        int v33 = 89;
      }
      else {
        int v33 = 78;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v31;
      __int16 v46 = 1024;
      int v47 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ completion woke client: %c",  buf,  0x12u);
    }

    if ((v29 & 1) != 0 || -[NDBackgroundSession clientIsActive](self, "clientIsActive"))
    {
      v34 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = (uint64_t)v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}@ completion woke client or client is active - not requesting delayed wake",  buf,  0xCu);
      }

      -[NDAVBackgroundSession cancelDelayedCompletionWakeTimer](self, "cancelDelayedCompletionWakeTimer");
    }

    else
    {
      v36 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = (uint64_t)v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ completion did not wake client and client is not active - requesting delayed wake",  buf,  0xCu);
      }

      -[NDAVBackgroundSession setupDelayedCompletionWakeTimer](self, "setupDelayedCompletionWakeTimer");
    }

    -[NDAVBackgroundSession cancelTCPConnectionForTask:withError:]( self,  "cancelTCPConnectionForTask:withError:",  a3,  v41);
  }
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didUpdateProgressWithLastBytesWritten:(unint64_t)a4 totalBytesWritten:(unint64_t)a5 totalBytesExpectedToWrite:(unint64_t)a6
{
  id v14 = a3;
  id v10 = [v14 taskIdentifier];
  if (a4)
  {
    identifiersToThroughputMonitors = self->_identifiersToThroughputMonitors;
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToThroughputMonitors,  "objectForKeyedSubscript:",  v12));

    [v13 wrapperTransferredData:a4];
  }

  -[NSXPCProxyCreating backgroundAVAssetDownloadTaskDidUpdateProgress:totalBytesWritten:totalBytesExpectedToWrite:]( self->super._clientProxy,  "backgroundAVAssetDownloadTaskDidUpdateProgress:totalBytesWritten:totalBytesExpectedToWrite:",  v10,  a5,  a6);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 willDownloadVariants:(id)a4
{
  id v6 = a4;
  id v7 = [a3 taskIdentifier];
  id v8 = objc_alloc(&OBJC_CLASS___PendingCallback);
  if (v6)
  {
    id v11 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  }

  else
  {
    id v9 = &__NSArray0__struct;
  }

  id v10 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v8,  "initWithCallbackType:taskIdentifier:args:",  11LL,  v7,  v9);
  if (v6) {

  }
  -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->super._callbackQueue,  "addPendingCallback:wakeRequirement:",  v10,  0LL);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didLoadTimeRange:(id)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id)a6 forMediaSelectionPropertyList:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:]( self->super._clientProxy,  "backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:",  [v16 taskIdentifier],  v12,  v13,  v14,  v15);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didFinishDownloadForMediaSelectionPropertyList:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  -[NSXPCProxyCreating backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:]( self->super._clientProxy,  "backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:",  [v7 taskIdentifier],  v6);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didResolveMediaSelectionPropertyList:(id)a4
{
  id v6 = a4;
  id v7 = [a3 taskIdentifier];
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  [v10 setResolvedMediaSelectionPlist:v6];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v11,  14LL,  1LL);

  id v12 = objc_alloc(&OBJC_CLASS___PendingCallback);
  if (v6)
  {
    id v15 = v6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
  }

  else
  {
    id v13 = &__NSArray0__struct;
  }

  id v14 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v12,  "initWithCallbackType:taskIdentifier:args:",  8LL,  v7,  v13);
  if (v6) {

  }
  -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->super._callbackQueue,  "addPendingCallback:wakeRequirement:",  v14,  0LL);
}

- (void)NDAVAssetDownloadSessionWrapper:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 taskIdentifier];
  identifiersToTaskInfo = self->super._identifiersToTaskInfo;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v10));

  objc_msgSend(v11, "setCountOfBytesReceived:", objc_msgSend(v6, "countOfBytesWritten"));
  objc_msgSend(v11, "setCountOfBytesExpectedToReceive:", objc_msgSend(v6, "countOfBytesExpectedToWrite"));
  id v12 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _loggableDescription]);
    *(_DWORD *)buf = 138543874;
    __int16 v19 = v13;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2048;
    id v23 = [v7 code];
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ AVAssetDownloadSession did complete with error %@ [%ld]",  buf,  0x20u);
  }

  if (sub_100003570((BOOL)v7))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientBundleID](self, "clientBundleID"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession identifier](self, "identifier"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession monitoredAppBundleID](self, "monitoredAppBundleID"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession secondaryID](self, "secondaryID"));
    sub_100035394( 3,  v14,  v15,  v16,  v17,  v11,  0,  (uint64_t)[v6 countOfBytesWritten],  0,  objc_msgSend(v11, "isDiscretionary"),  0,  1,  1,  v7);

    -[NDBackgroundSession finalizeTaskCompletionWithSuppressedWake:]( self,  "finalizeTaskCompletionWithSuppressedWake:",  1LL);
    -[NDAVBackgroundSession cancelThroughputMonitorForWrapper:](self, "cancelThroughputMonitorForWrapper:", v8);
    -[NDAVBackgroundSession cancelTCPConnectionForTask:withError:]( self,  "cancelTCPConnectionForTask:withError:",  v8,  v7);
    -[NDAVBackgroundSession retryTask:originalError:](self, "retryTask:originalError:", v11, v7);
  }

  else
  {
    -[NDAVBackgroundSession taskWithIdentifier:didCompleteWithError:]( self,  "taskWithIdentifier:didCompleteWithError:",  v8,  v7);
  }
}

- (void).cxx_destruct
{
}

@end