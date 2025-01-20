@interface DownloadPipeline
- (BOOL)_downloadIsForLegacyClientWithIdentifier:(id)a3;
- (BOOL)_hasAutomaticUpdateTasks;
- (BOOL)_isPodcast:(id)a3;
- (DownloadPipeline)initWithDownloadsDatabase:(id)a3;
- (id)_applicationBundleIdentifierForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4;
- (id)_applicationHandleForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4;
- (id)_authenticationChallengeQueue;
- (id)_downloadSessionPropertiesWithPhase:(id)a3 taskState:(id)a4 databaseSession:(id)a5;
- (id)restartDownloadsWithIdentifiers:(id)a3;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didCompleteForMediaSelection:(id)a5;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8;
- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 willDownloadToURL:(id)a5;
- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7;
- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didReceiveAVAssetDownloadToken:(unint64_t)a5;
- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_attemptRecoveryForDownloadWithTaskState:(id)a3 databaseSession:(id)a4;
- (void)_commitProgressTimer;
- (void)_disavowDownloadHandlerSession:(id)a3 withTaskState:(id)a4;
- (void)_failDownloadWithIdentifier:(id)a3 error:(id)a4 transaction:(id)a5;
- (void)_finishDownloadWithOperation:(id)a3 response:(id)a4;
- (void)_finishRecoveryWithOperation:(id)a3 response:(id)a4;
- (void)_logDownloadEvent:(id)a3 forTaskWithState:(id)a4 session:(id)a5;
- (void)_performDefaultHandlingForAuthenticationChallenge:(id)a3 withSessionProperties:(id)a4 completionHandler:(id)a5;
- (void)_performDownloadOperation:(id)a3;
- (void)_prepareDownloadsMatchingPredicate:(id)a3 ignoreDownloadHandlers:(BOOL)a4 filtersExistingTasks:(BOOL)a5;
- (void)_processDownloadFailureWithTaskState:(id)a3 cancelReason:(int64_t)a4;
- (void)_processDownloadWithTaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5;
- (void)_queueFinishDownloadWithtaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5;
- (void)_releaseDownloadHandlerSession:(id)a3 withTaskState:(id)a4;
- (void)_reloadKeepAliveAssertion;
- (void)_reportTVAppDownloadQOSMetricsIfAppropriateForKind:(id)a3 adamID:(id)a4 rentalID:(id)a5 error:(id)a6 cancelReason:(int64_t)a7;
- (void)_scheduleReconnect;
- (void)_setDownloadPhase:(id)a3 forDownloadIdentifier:(int64_t)a4 databaseTransaction:(id)a5;
- (void)_startProgressTimer;
- (void)_taskReceived:(id)a3 persistAVAssetDownloadToken:(unint64_t)a4;
- (void)addDownloadsWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)downloadAssetFairPlayStreamingKeyLoader:(id)a3 didFailWithError:(id)a4;
- (void)operation:(id)a3 updatedProgress:(id)a4;
- (void)prioritizeDownloadWithIdentifier:(id)a3;
- (void)reconnectWithURLSessionTasks;
- (void)stopDownloadsWithIdentifiers:(id)a3 reason:(int64_t)a4;
- (void)updateAfterSessionsChanged:(id)a3;
@end

@implementation DownloadPipeline

- (DownloadPipeline)initWithDownloadsDatabase:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___DownloadPipeline;
  v6 = -[DownloadPipeline init](&v35, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  0LL,  0LL);
    aggregateDownloadProgress = v7->_aggregateDownloadProgress;
    v7->_aggregateDownloadProgress = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    backgroundOperationQueue = v7->_backgroundOperationQueue;
    v7->_backgroundOperationQueue = v10;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v7->_backgroundOperationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:]( v7->_backgroundOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    -[ISOperationQueue setName:]( v7->_backgroundOperationQueue,  "setName:",  @"com.apple.itunesstored.DownloadPipeline.background");
    v12 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    preparationOperationQueue = v7->_preparationOperationQueue;
    v7->_preparationOperationQueue = v12;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v7->_preparationOperationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:]( v7->_preparationOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    -[ISOperationQueue setName:]( v7->_preparationOperationQueue,  "setName:",  @"com.apple.itunesstored.DownloadPipeline.prepare");
    v14 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    processingOperationQueue = v7->_processingOperationQueue;
    v7->_processingOperationQueue = v14;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v7->_processingOperationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:]( v7->_processingOperationQueue,  "setMaxConcurrentOperationCount:",  3LL);
    -[ISOperationQueue setName:]( v7->_processingOperationQueue,  "setName:",  @"com.apple.itunesstored.DownloadPipeline.processing");
    v16 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    discretionaryDownloadOperationQueue = v7->_discretionaryDownloadOperationQueue;
    v7->_discretionaryDownloadOperationQueue = v16;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v7->_discretionaryDownloadOperationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:]( v7->_discretionaryDownloadOperationQueue,  "setMaxConcurrentOperationCount:",  3LL);
    -[ISOperationQueue setName:]( v7->_discretionaryDownloadOperationQueue,  "setName:",  @"com.apple.itunesstored.DownloadPipeline.discretionaryDownloads");
    v18 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    nonDiscretionaryDownloadOperationQueue = v7->_nonDiscretionaryDownloadOperationQueue;
    v7->_nonDiscretionaryDownloadOperationQueue = v18;

    -[ISOperationQueue setAdjustsMaxConcurrentOperationCount:]( v7->_nonDiscretionaryDownloadOperationQueue,  "setAdjustsMaxConcurrentOperationCount:",  0LL);
    -[ISOperationQueue setMaxConcurrentOperationCount:]( v7->_nonDiscretionaryDownloadOperationQueue,  "setMaxConcurrentOperationCount:",  3LL);
    -[ISOperationQueue setName:]( v7->_nonDiscretionaryDownloadOperationQueue,  "setName:",  @"com.apple.itunesstored.DownloadPipeline.nonDiscretionaryDownloads");
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    dirtyTaskStates = v7->_dirtyTaskStates;
    v7->_dirtyTaskStates = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    downloadHandlerSessions = v7->_downloadHandlerSessions;
    v7->_downloadHandlerSessions = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    preparationDownloadIDs = v7->_preparationDownloadIDs;
    v7->_preparationDownloadIDs = v24;

    v26 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  0LL,  0LL);
    resourceLoaders = v7->_resourceLoaders;
    v7->_resourceLoaders = v26;

    v28 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  0LL,  0LL);
    taskStates = v7->_taskStates;
    v7->_taskStates = v28;

    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    urlSessions = v7->_urlSessions;
    v7->_urlSessions = v30;

    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    downloadOperationsByTask = v7->_downloadOperationsByTask;
    v7->_downloadOperationsByTask = v32;
  }

  return v7;
}

- (void)dealloc
{
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressTimer);
    v4 = self->_progressTimer;
    self->_progressTimer = 0LL;
  }

  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    dispatch_source_cancel((dispatch_source_t)reconnectTimer);
    v6 = self->_reconnectTimer;
    self->_reconnectTimer = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DownloadPipeline;
  -[DownloadPipeline dealloc](&v7, "dealloc");
}

- (void)addDownloadsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)i);
        if ((-[NSMutableOrderedSet containsObject:]( self->_preparationDownloadIDs,  "containsObject:",  v11) & 1) == 0) {
          -[NSMutableOrderedSet addObject:](v5, "addObject:", v11);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }

    while (v8);
  }

  if (-[NSMutableOrderedSet count](v5, "count"))
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v12 = self->_taskStates;
    id v13 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_taskStates,  "objectForKey:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)j)));
          v18 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v17 downloadIdentifier]);
          -[NSMutableOrderedSet removeObject:](v5, "removeObject:", v18);
        }

        id v14 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v40,  16LL);
      }

      while (v14);
    }
  }

  if (-[NSMutableOrderedSet count](v5, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v20 = [v19 shouldLog];
    else {
      LODWORD(v21) = v20;
    }
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = v21;
    }
    else {
      v21 &= 2u;
    }
    if ((_DWORD)v21)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v5, "array"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", @", "));
      int v38 = 138543362;
      v39 = v24;
      v25 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[Download]: Adding download(s): %{public}@",  &v38,  12);

      if (!v25)
      {
LABEL_32:

        uint64_t v26 = objc_opt_class(self);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v5, "array"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsJoinedByString:", @", "));
        SSDebugLog(1LL, @"[%@]: Adding download(s): %@");

        v28 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteContainsPredicate containsPredicateWithProperty:values:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "containsPredicateWithProperty:values:",  SSSQLEntityPropertyPersistentID,  v5,  v26,  v29));
        -[DownloadPipeline _prepareDownloadsMatchingPredicate:ignoreDownloadHandlers:filtersExistingTasks:]( self,  "_prepareDownloadsMatchingPredicate:ignoreDownloadHandlers:filtersExistingTasks:",  v28,  0LL,  0LL);

        goto LABEL_33;
      }

      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      SSFileLog(v19, @"%@");
    }

    goto LABEL_32;
  }

- (void)reconnectWithURLSessionTasks
{
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    dispatch_source_cancel((dispatch_source_t)reconnectTimer);
    id v4 = self->_reconnectTimer;
    self->_reconnectTimer = 0LL;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(download_state.blocked_reason, 0)",  &off_10036D818));
  v13[0] = SSDownloadPhaseFinished;
  v13[1] = SSDownloadPhaseFailed;
  v13[2] = SSDownloadPhasePaused;
  v13[3] = SSDownloadPhaseCanceled;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteContainsPredicate doesNotContainPredicateWithProperty:values:]( &OBJC_CLASS___SSSQLiteContainsPredicate,  "doesNotContainPredicateWithProperty:values:",  @"IFNULL(download_state.phase, SSDownloadPhaseWaiting)",  v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"is_purchase",  &__kCFBooleanFalse));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToValue:",  @"IFNULL(download_state.is_restricted, 0)",  &__kCFBooleanFalse));
  v12[0] = v5;
  v12[1] = v9;
  v12[2] = v8;
  v12[3] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:]( &OBJC_CLASS___SSSQLiteCompoundPredicate,  "predicateMatchingAllPredicates:",  v10));

  -[DownloadPipeline _prepareDownloadsMatchingPredicate:ignoreDownloadHandlers:filtersExistingTasks:]( self,  "_prepareDownloadsMatchingPredicate:ignoreDownloadHandlers:filtersExistingTasks:",  v11,  0LL,  1LL);
}

- (void)prioritizeDownloadWithIdentifier:(id)a3
{
  id v4 = (NSNumber *)a3;
  id v5 = &ACSLocateCachingServer_ptr;
  v57 = v4;
  if (-[DownloadPipeline _downloadIsForLegacyClientWithIdentifier:]( self,  "_downloadIsForLegacyClientWithIdentifier:",  v4))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      unsigned int v8 = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v8 & 2;
    }
    if ((_DWORD)v10)
    {
      int v67 = 138412546;
      v68 = (NSNumber *)objc_opt_class(self);
      __int16 v69 = 2112;
      v70 = v4;
      uint64_t v11 = v68;
      v12 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Ignoring request to reprioritize download %@ for legacy client.",  &v67,  22);

      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
        free(v12);
        SSFileLog(v6, @"%@");
      }

      id v4 = v57;
    }

    else
    {
    }

    goto LABEL_82;
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v14 = self->_taskStates;
  id v15 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v63,  v73,  16LL);
  if (!v15)
  {

    goto LABEL_70;
  }

  id v16 = v15;
  char v58 = 0;
  uint64_t v17 = *(void *)v64;
  v62 = self;
  uint64_t v59 = *(void *)v64;
  v60 = v14;
  do
  {
    v18 = 0LL;
    id v61 = v16;
    do
    {
      if (*(void *)v64 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v18);
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSURLSessionTask);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_taskStates, "objectForKey:", v19));
        v22 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v21 downloadIdentifier]);
        if (-[NSNumber isEqualToNumber:](v4, "isEqualToNumber:", v22))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedDaemonConfig]);
          if (!v23) {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedConfig]);
          }
          unsigned int v24 = objc_msgSend(v23, "shouldLog", v55);
          else {
            unsigned int v25 = v24;
          }
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v27 = v25;
          }
          else {
            uint64_t v27 = v25 & 2;
          }
          if ((_DWORD)v27)
          {
            v28 = (NSNumber *)[v19 taskIdentifier];
            int v67 = 134218242;
            v68 = v28;
            __int16 v69 = 2112;
            v70 = v22;
            LODWORD(v56) = 22;
            v29 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[Download]: Reprioritizing to high task: %lu for download: %@",  &v67,  v56);

            id v5 = &ACSLocateCachingServer_ptr;
            if (v29)
            {
              uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
              free(v29);
              v55 = v26;
              SSFileLog(v23, @"%@");
              goto LABEL_55;
            }
          }

          else
          {
            id v5 = &ACSLocateCachingServer_ptr;
LABEL_55:
          }

          *(float *)&double v48 = NSURLSessionTaskPriorityHigh;
          [v19 setPriority:v48];
          char v58 = 1;
LABEL_63:

          id v16 = v61;
          self = v62;
          uint64_t v17 = v59;
          id v14 = v60;
          goto LABEL_64;
        }

        unsigned int v30 = [v21 isLegacyClient];
        uint64_t v31 = objc_claimAutoreleasedReturnValue([v5[459] sharedDaemonConfig]);
        __int128 v32 = (void *)v31;
        if (v30)
        {
          if (!v31) {
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedConfig]);
          }
          unsigned int v33 = objc_msgSend(v32, "shouldLog", v55);
          else {
            unsigned int v34 = v33;
          }
          __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
            uint64_t v36 = v34;
          }
          else {
            uint64_t v36 = v34 & 2;
          }
          if ((_DWORD)v36)
          {
            __int128 v37 = (NSNumber *)objc_opt_class(v62);
            int v38 = v37;
            v39 = (NSNumber *)[v19 taskIdentifier];
            int v67 = 138412802;
            v68 = v37;
            __int16 v69 = 2048;
            v70 = v39;
            __int16 v71 = 2112;
            v72 = v22;
            LODWORD(v56) = 32;
            v40 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  1LL,  "%@: Not reprioritizing task for legacy client: %lu for download: %@",  &v67,  v56);

            id v4 = v57;
            id v5 = &ACSLocateCachingServer_ptr;
            if (v40)
            {
              __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
              free(v40);
              v55 = v35;
              SSFileLog(v32, @"%@");
              goto LABEL_58;
            }
          }

          else
          {
            id v5 = &ACSLocateCachingServer_ptr;
LABEL_58:
          }

          goto LABEL_63;
        }

        if (!v31) {
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v5[459] sharedConfig]);
        }
        unsigned int v41 = objc_msgSend(v32, "shouldLog", v55);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
          uint64_t v43 = v41;
        }
        else {
          uint64_t v43 = v41 & 2;
        }
        if ((_DWORD)v43)
        {
          v44 = (NSNumber *)objc_opt_class(v62);
          v45 = v44;
          v46 = (NSNumber *)[v19 taskIdentifier];
          int v67 = 138412802;
          v68 = v44;
          __int16 v69 = 2048;
          v70 = v46;
          __int16 v71 = 2112;
          v72 = v22;
          LODWORD(v56) = 32;
          v47 = (void *)_os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  1LL,  "%@: Reprioritizing to default task: %lu to restart download: %@",  &v67,  v56);

          id v4 = v57;
          id v5 = &ACSLocateCachingServer_ptr;
          if (v47)
          {
            v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v47,  4LL));
            free(v47);
            v55 = v42;
            SSFileLog(v32, @"%@");
            goto LABEL_61;
          }
        }

        else
        {
          id v5 = &ACSLocateCachingServer_ptr;
LABEL_61:
        }

        *(float *)&double v49 = NSURLSessionTaskPriorityDefault;
        [v19 setPriority:v49];
        goto LABEL_63;
      }

- (id)restartDownloadsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v5 = self;
  id v6 = self->_taskStates;
  id v7 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    uint64_t v10 = &ACSLocateCachingServer_ptr;
    uint64_t v11 = &ACSLocateCachingServer_ptr;
    uint64_t v28 = *(void *)v34;
    v29 = v5;
    do
    {
      v12 = 0LL;
      id v31 = v8;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v12);
        uint64_t v14 = objc_opt_class(v10[414]);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v5->_taskStates, "objectForKey:", v13));
          id v15 = objc_msgSend(objc_alloc((Class)v11[390]), "initWithLongLong:", objc_msgSend(v32, "downloadIdentifier"));
          if ([v4 containsObject:v15])
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v16) {
              id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            LODWORD(v17) = objc_msgSend(v16, "shouldLog", v26);
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v17 = v17;
            }
            else {
              v17 &= 2u;
            }
            if ((_DWORD)v17)
            {
              v19 = v6;
              id v20 = v4;
              uint64_t v21 = (void *)objc_opt_class(v5);
              id v22 = v21;
              id v23 = [v13 taskIdentifier];
              int v37 = 138412802;
              int v38 = v21;
              id v4 = v20;
              id v6 = v19;
              uint64_t v9 = v28;
              __int16 v39 = 2048;
              id v40 = v23;
              __int16 v41 = 2112;
              id v42 = v15;
              LODWORD(v27) = 32;
              unsigned int v24 = (void *)_os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Cancel task: %lu to restart download: %@",  &v37,  v27);

              id v5 = v29;
              if (v24)
              {
                v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
                free(v24);
                uint64_t v26 = v18;
                SSFileLog(v16, @"%@");
                goto LABEL_18;
              }
            }

            else
            {
LABEL_18:
            }

            [v13 cancelWithITunesStoreReason:3 error:0];
            [v30 addObject:v15];
            uint64_t v10 = &ACSLocateCachingServer_ptr;
            uint64_t v11 = &ACSLocateCachingServer_ptr;
          }

          id v8 = v31;
        }

        v12 = (char *)v12 + 1;
      }

      while (v8 != v12);
      id v8 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
    }

    while (v8);
  }

  return v30;
}

- (void)stopDownloadsWithIdentifiers:(id)a3 reason:(int64_t)a4
{
  id v76 = a3;
  v77 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ISOperationQueue operations](self->_preparationOperationQueue, "operations"));
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v86 objects:v98 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v87;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v87 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
        uint64_t v11 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v10 downloadIdentifier]);
        if ([v76 containsObject:v11])
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v12) {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v13 = objc_msgSend(v12, "shouldLog", v67);
          else {
            unsigned int v14 = v13;
          }
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
            uint64_t v16 = v14;
          }
          else {
            uint64_t v16 = v14 & 2;
          }
          if ((_DWORD)v16)
          {
            uint64_t v17 = (void *)objc_opt_class(v77);
            int v91 = 138412546;
            v92 = v17;
            __int16 v93 = 2112;
            v94 = v11;
            id v18 = v17;
            LODWORD(v69) = 22;
            v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Stop preparation operation for download: %@",  &v91,  v69);

            if (v19)
            {
              id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
              free(v19);
              int v67 = v15;
              SSFileLog(v12, @"%@");
              goto LABEL_18;
            }
          }

          else
          {
LABEL_18:
          }

          [v10 cancel];
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
    }

    while (v7);
  }

  id v20 = v76;
  -[NSMutableOrderedSet minusOrderedSet:](v77->_preparationDownloadIDs, "minusOrderedSet:", v76, v67);
  id v21 = -[NSMutableSet copy](v77->_downloadHandlerSessions, "copy");
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id v74 = v21;
  id v22 = [v74 countByEnumeratingWithState:&v82 objects:v97 count:16];
  if (!v22) {
    goto LABEL_45;
  }
  id v23 = v22;
  uint64_t v24 = *(void *)v83;
  do
  {
    for (j = 0LL; j != v23; j = (char *)j + 1)
    {
      if (*(void *)v83 != v24) {
        objc_enumerationMutation(v74);
      }
      uint64_t v26 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)j);
      uint64_t v27 = objc_alloc(&OBJC_CLASS___NSNumber);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 sessionProperties]);
      v29 = -[NSNumber initWithLongLong:](v27, "initWithLongLong:", [v28 downloadIdentifier]);

      if ([v20 containsObject:v29])
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
        if (!v30) {
          id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        LODWORD(v31) = objc_msgSend(v30, "shouldLog", v68);
        __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
          uint64_t v31 = v31;
        }
        else {
          v31 &= 2u;
        }
        if ((_DWORD)v31)
        {
          __int128 v33 = (void *)objc_opt_class(v77);
          id v34 = v33;
          __int128 v35 = (NSNumber *)[v26 sessionID];
          int v91 = 138412802;
          v92 = v33;
          id v20 = v76;
          __int16 v93 = 2048;
          v94 = v35;
          __int16 v95 = 2112;
          v96 = v29;
          LODWORD(v69) = 32;
          __int128 v36 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  1LL,  "%@: Stop session: %lld for download: %@",  &v91,  v69);

          if (v36)
          {
            __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
            free(v36);
            v68 = v32;
            SSFileLog(v30, @"%@");
            goto LABEL_38;
          }
        }

        else
        {
LABEL_38:
        }

        int v37 = (void *)objc_claimAutoreleasedReturnValue(+[DownloadHandlerManager handlerManager](&OBJC_CLASS___DownloadHandlerManager, "handlerManager"));
        id v38 = [v26 sessionID];
        if (a4 == 1) {
          [v37 pauseSessionWithID:v38];
        }
        else {
          [v37 cancelSessionWithID:v38];
        }

        -[NSMutableSet removeObject:](v77->_downloadHandlerSessions, "removeObject:", v26);
        -[NSMapTable removeObjectForKey:](v77->_taskStates, "removeObjectForKey:", v26);
      }
    }

    id v23 = [v74 countByEnumeratingWithState:&v82 objects:v97 count:16];
  }

  while (v23);
LABEL_45:

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  v72 = v77->_taskStates;
  id v39 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v72,  "countByEnumeratingWithState:objects:count:",  &v78,  v90,  16LL);
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v79;
    uint64_t v70 = *(void *)v79;
    do
    {
      id v42 = 0LL;
      id v71 = v40;
      do
      {
        if (*(void *)v79 != v41) {
          objc_enumerationMutation(v72);
        }
        uint64_t v43 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v77->_taskStates, "objectForKey:", v43, v68));
        v45 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v44 downloadIdentifier]);
        if ([v20 containsObject:v45])
        {
          uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSURLSessionTask);
          if ((objc_opt_isKindOfClass(v43, v46) & 1) != 0)
          {
            id v47 = v43;
            double v48 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v48) {
              double v48 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            unsigned int v49 = [v48 shouldLog];
            else {
              unsigned int v50 = v49;
            }
            unsigned int v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 OSLogObject]);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO)) {
              uint64_t v52 = v50;
            }
            else {
              uint64_t v52 = v50 & 2;
            }
            if ((_DWORD)v52)
            {
              uint64_t v53 = (void *)objc_opt_class(v77);
              id v54 = v53;
              v55 = (NSNumber *)[v47 taskIdentifier];
              int v91 = 138412802;
              v92 = v53;
              id v20 = v76;
              __int16 v93 = 2048;
              v94 = v55;
              __int16 v95 = 2112;
              v96 = v45;
              LODWORD(v69) = 32;
              uint64_t v56 = (void *)_os_log_send_and_compose_impl( v52,  0LL,  0LL,  0LL,  &_mh_execute_header,  v51,  1LL,  "%@: Stop task: %lu for download: %@",  &v91,  v69);

              uint64_t v41 = v70;
              if (v56)
              {
                unsigned int v51 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v56,  4LL));
                free(v56);
                v68 = v51;
                SSFileLog(v48, @"%@");
                goto LABEL_76;
              }
            }

            else
            {
              uint64_t v41 = v70;
LABEL_76:
            }

            [v47 cancelWithITunesStoreReason:2 error:0];
            goto LABEL_81;
          }

          uint64_t v57 = objc_opt_class(&OBJC_CLASS___FinishDownloadOperation);
          char isKindOfClass = objc_opt_isKindOfClass(v43, v57);
          if (a4 != 1 && (isKindOfClass & 1) != 0)
          {
            uint64_t v59 = v43;
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
            if (!v60) {
              v60 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            unsigned int v61 = [v60 shouldLog];
            v62 = (os_log_s *)objc_claimAutoreleasedReturnValue([v60 OSLogObject]);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO)) {
              uint64_t v63 = v61;
            }
            else {
              uint64_t v63 = v61 & 2;
            }
            if ((_DWORD)v63)
            {
              __int128 v64 = (void *)objc_opt_class(v77);
              int v91 = 138412802;
              v92 = v64;
              __int16 v93 = 2112;
              v94 = v59;
              __int16 v95 = 2112;
              v96 = v45;
              id v65 = v64;
              LODWORD(v69) = 32;
              __int128 v66 = (void *)_os_log_send_and_compose_impl( v63,  0LL,  0LL,  0LL,  &_mh_execute_header,  v62,  1LL,  "%@: Cancel operation: %@ for download: %@",  &v91,  v69);

              uint64_t v41 = v70;
              if (v66)
              {
                v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v66,  4LL));
                free(v66);
                v68 = v62;
                SSFileLog(v60, @"%@");
                goto LABEL_79;
              }
            }

            else
            {
              uint64_t v41 = v70;
LABEL_79:
            }

            -[NSNumber stopWithFinishResult:](v59, "stopWithFinishResult:", 2LL);
LABEL_81:

            id v40 = v71;
          }
        }

        id v42 = (char *)v42 + 1;
      }

      while (v40 != v42);
      id v40 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v72,  "countByEnumeratingWithState:objects:count:",  &v78,  v90,  16LL);
    }

    while (v40);
  }

  -[DownloadPipeline _reloadKeepAliveAssertion](v77, "_reloadKeepAliveAssertion");
}

- (void)updateAfterSessionsChanged:(id)a3
{
  id v4 = a3;
  id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    uint64_t v21 = SSDownloadPhaseDownloading;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet member:](self->_downloadHandlerSessions, "member:", v10, v21));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_taskStates, "objectForKey:", v11));
        if (v12)
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionProperties]);
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 downloadPhase]);

          switch((unint64_t)[v10 sessionState])
          {
            case 0uLL:
              if ([v14 isEqualToString:v21])
              {
                [v10 percentComplete];
                [v12 setTransferProgress:v15];
                -[NSMutableSet addObject:](self->_dirtyTaskStates, "addObject:", v12);
                -[DownloadPipeline _startProgressTimer](self, "_startProgressTimer");
              }

              goto LABEL_17;
            case 6uLL:
              -[DownloadPipeline _disavowDownloadHandlerSession:withTaskState:]( self,  "_disavowDownloadHandlerSession:withTaskState:",  v10,  v12);
              break;
            case 7uLL:
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 downloadIdentifier]));
              -[NSMutableOrderedSet addObject:](v22, "addObject:", v16);

              break;
            case 8uLL:
              database = self->_database;
              v27[0] = _NSConcreteStackBlock;
              v27[1] = 3221225472LL;
              v27[2] = sub_1000E6B48;
              v27[3] = &unk_10034C668;
              id v28 = v12;
              v29 = v10;
              id v30 = self;
              id v18 = -[DownloadsDatabase modifyUsingTransactionBlock:](database, "modifyUsingTransactionBlock:", v27);
              v19 = v28;
              goto LABEL_15;
            case 9uLL:
              id v20 = self->_database;
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472LL;
              v23[2] = sub_1000E6DB0;
              v23[3] = &unk_10034CE40;
              id v24 = v14;
              unsigned int v25 = self;
              id v26 = v12;
              -[DownloadsDatabase readUsingTransactionBlock:](v20, "readUsingTransactionBlock:", v23);

              v19 = v24;
LABEL_15:

              break;
            case 0xAuLL:
              -[DownloadPipeline _releaseDownloadHandlerSession:withTaskState:]( self,  "_releaseDownloadHandlerSession:withTaskState:",  v10,  v12);
              break;
            default:
              break;
          }

          -[NSMutableSet removeObject:](self->_downloadHandlerSessions, "removeObject:", v11);
          -[NSMapTable removeObjectForKey:](self->_taskStates, "removeObjectForKey:", v11);
LABEL_17:
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v7);
  }

  if (-[NSMutableOrderedSet count](v22, "count")) {
    -[DownloadPipeline addDownloadsWithIdentifiers:](self, "addDownloadsWithIdentifiers:", v22);
  }
  -[DownloadPipeline _reloadKeepAliveAssertion](self, "_reloadKeepAliveAssertion");
}

- (void)operation:(id)a3 updatedProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E70A8;
  v11[3] = &unk_10034BCE8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[DownloadsDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v11);
}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didReceiveAVAssetDownloadToken:(unint64_t)a5
{
}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v10 = a4;
  uint64_t v11 = v10;
  if (a7 >= 1)
  {
    database = self->_database;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000E71DC;
    v13[3] = &unk_10034BE98;
    void v13[4] = self;
    id v14 = v10;
    int64_t v15 = a6;
    int64_t v16 = a7;
    -[DownloadsDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v13);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 ITunesStoreDataConsumer]);
  id v34 = 0LL;
  unsigned __int8 v10 = [v9 consumeData:v8 error:&v34];

  id v11 = v34;
  if ((v10 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_taskStates, "objectForKey:", v7));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v20) {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = [v20 shouldLog];
    else {
      LODWORD(v22) = v21;
    }
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      id v24 = [v7 taskIdentifier];
      id v25 = [v19 downloadIdentifier];
      int v35 = 134218498;
      id v36 = v24;
      __int16 v37 = 2048;
      id v38 = v25;
      __int16 v39 = 2112;
      id v40 = v11;
      id v26 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[Download]: Consumer failed for task: %lu for download: %lld with error: %@",  &v35,  32);

      if (!v26)
      {
LABEL_15:

        [v7 cancelWithITunesStoreReason:1 error:v11];
        goto LABEL_16;
      }

      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      SSFileLog(v20, @"%@");
    }

    goto LABEL_15;
  }

  id v12 = [v7 countOfBytesReceived];
  unsigned __int8 v13 = [v9 overrideProgress];
  [v9 percentComplete];
  uint64_t v15 = v14;
  id v16 = [v9 resumptionOffset];
  id v17 = [v7 countOfBytesExpectedToReceive];
  database = self->_database;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000E7504;
  v27[3] = &unk_10034E410;
  void v27[4] = self;
  id v28 = v7;
  id v29 = v17;
  id v30 = v12;
  id v31 = v16;
  unsigned __int8 v33 = v13;
  uint64_t v32 = v15;
  -[DownloadsDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v27);

LABEL_16:
}

- (void)URLSession:(id)a3 assetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v31 = 0LL;
  uint64_t v32 = (double *)&v31;
  uint64_t v33 = 0x2020000000LL;
  uint64_t v34 = 0LL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000E789C;
  v30[3] = &unk_10034E438;
  v30[4] = &v31;
  [v13 enumerateObjectsUsingBlock:v30];
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a7->var1;
  uint64_t v14 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *))ISWeakLinkedSymbolForString("CMTimeGetSeconds", 15LL);
  if (v14)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v35 = var1;
    v14(&v35);
  }

  else
  {
    double v15 = 0.0;
  }

  double v16 = v32[3] / v15;
  database = self->_database;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000E7928;
  v26[3] = &unk_10034C200;
  v26[4] = self;
  id v18 = v12;
  id v27 = v18;
  double v28 = v16;
  -[DownloadsDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v19) {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v20) = [v19 shouldLog];
  unsigned int v21 = [v19 shouldLogToDisk];
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
  id v23 = v22;
  if (v21) {
    LODWORD(v20) = v20 | 2;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    uint64_t v20 = v20;
  }
  else {
    v20 &= 2u;
  }
  if (!(_DWORD)v20) {
    goto LABEL_14;
  }
  id v24 = [v18 taskIdentifier];
  LODWORD(v35.var0) = 134218240;
  *(double *)((char *)&v35.var0 + 4) = v16;
  LOWORD(v35.var2) = 2048;
  *(void *)((char *)&v35.var2 + 2) = v24;
  id v25 = (void *)_os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  2LL,  "[Download]: Progress set to %0.2f for %lu",  COERCE_DOUBLE(&v35),  22);

  if (v25)
  {
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
    free(v25);
    SSFileLog(v19, @"%@");
LABEL_14:
  }

  _Block_object_dispose(&v31, 8);
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLAsset]);
  id v8 = objc_alloc_init(&OBJC_CLASS___DownloadAssetProgress);
  id v9 = [v7 downloadToken];
  -[NSMapTable setObject:forKey:](self->_aggregateDownloadProgress, "setObject:forKey:", v8, v6);
  -[DownloadPipeline _taskReceived:persistAVAssetDownloadToken:]( self,  "_taskReceived:persistAVAssetDownloadToken:",  v6,  v9);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_12;
  }
  int v15 = 134217984;
  id v16 = [v6 taskIdentifier];
  uint64_t v14 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  2LL,  "[Download]: Will download task identifier %lu",  &v15);

  if (v14)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    SSFileLog(v10, @"%@");
LABEL_12:
  }
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didCompleteForMediaSelection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_aggregateDownloadProgress, "objectForKey:", v7));
  unsigned __int8 v10 = v9;
  if (v9)
  {
    [v9 setProgress:v8 forMediaSelection:1.0];
    [v10 setMediaSelectionDidComplete:v8];
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v12 = [v11 shouldLog];
  else {
    LODWORD(v13) = v12;
  }
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v13 = v13;
  }
  else {
    v13 &= 2u;
  }
  if (!(_DWORD)v13) {
    goto LABEL_14;
  }
  id v15 = [v10 numMediaSelectionsCompleted];
  [v10 progress];
  int v18 = 138413058;
  id v19 = v7;
  __int16 v20 = 2112;
  id v21 = v8;
  __int16 v22 = 2048;
  id v23 = v15;
  __int16 v24 = 2048;
  double v25 = v16 * 100.0;
  id v17 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[Download]: Download task [%@] did complete media selection [%@] %lu media selections have completed. Loaded %.1f%% overall",  &v18,  42);

  if (v17)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
    free(v17);
    SSFileLog(v11, @"%@");
LABEL_14:
  }
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8
{
  id v41 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  uint64_t v51 = 0LL;
  uint64_t v52 = (double *)&v51;
  uint64_t v53 = 0x2020000000LL;
  uint64_t v54 = 0LL;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000E8190;
  v50[3] = &unk_10034E438;
  v50[4] = &v51;
  [v14 enumerateObjectsUsingBlock:v50];
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a7->var1;
  double v16 = (void (*)($3CC8671D27C23BF42ADDB32F2B5E48AE *))ISWeakLinkedSymbolForString("CMTimeGetSeconds", 15LL);
  if (v16)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v55 = var1;
    v16(&v55);
  }

  else
  {
    double v17 = 0.0;
  }

  double v18 = v52[3] / v17;
  if (v18 <= 1.0) {
    double v19 = v18;
  }
  else {
    double v19 = 1.0;
  }
  __int16 v20 = (DownloadAssetProgress *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_aggregateDownloadProgress, "objectForKey:", v13));
  if (!v20)
  {
    __int16 v20 = objc_alloc_init(&OBJC_CLASS___DownloadAssetProgress);
    -[NSMapTable setObject:forKey:](self->_aggregateDownloadProgress, "setObject:forKey:", v20, v13);
  }

  if (!-[DownloadAssetProgress numAudioSelectionsToBeDownloaded](v20, "numAudioSelectionsToBeDownloaded"))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_downloadOperationsByTask, "objectForKey:", v13));
    __int16 v22 = v21;
    if (v21)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 response]);
      id v24 = [v23 numAudioSelectionsToBeDownloaded];

      double v25 = (void *)objc_claimAutoreleasedReturnValue([v22 response]);
      id v26 = [v25 numSubtitleSelectionsToBeDownloaded];

      else {
        uint64_t v27 = (uint64_t)v24;
      }
      -[DownloadAssetProgress setNumAudioSelectionsToBeDownloaded:](v20, "setNumAudioSelectionsToBeDownloaded:", v27);
      -[DownloadAssetProgress setNumSubtitleSelectionsToBeDownloaded:]( v20,  "setNumSubtitleSelectionsToBeDownloaded:",  v26);
    }
  }

  -[DownloadAssetProgress setProgress:forMediaSelection:](v20, "setProgress:forMediaSelection:", v15, v19);
  -[DownloadAssetProgress progress](v20, "progress");
  uint64_t v29 = v28;
  database = self->_database;
  id v42 = _NSConcreteStackBlock;
  uint64_t v43 = 3221225472LL;
  v44 = sub_1000E821C;
  v45 = &unk_10034C200;
  uint64_t v46 = self;
  id v31 = v13;
  id v47 = v31;
  uint64_t v48 = v29;
  -[DownloadsDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", &v42);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v32) {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v33 = [v32 shouldLog];
  unsigned int v34 = [v32 shouldLogToDisk];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
  id v36 = v35;
  if (v34) {
    unsigned int v37 = v33 | 2;
  }
  else {
    unsigned int v37 = v33;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = v37 & 2;
  }
  if (!(_DWORD)v38) {
    goto LABEL_27;
  }
  -[DownloadAssetProgress progress](v20, "progress");
  LODWORD(v55.var0) = 138413058;
  *(int64_t *)((char *)&v55.var0 + 4) = (int64_t)v31;
  LOWORD(v55.var2) = 2112;
  *(void *)((char *)&v55.var2 + 2) = v15;
  HIWORD(v55.var3) = 2048;
  double v56 = v19 * 100.0;
  __int16 v57 = 2048;
  double v58 = v39 * 100.0;
  id v40 = (void *)_os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v36,  2LL,  "[Download]: Download task [%@] did receive progress for media selection [%@].  Loaded %.1f%% of select ion, %.1f%% overall",  &v55,  42,  v41,  v42,  v43,  v44,  v45,  v46);

  if (v40)
  {
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
    free(v40);
    SSFileLog(v32, @"%@");
LABEL_27:
  }

  _Block_object_dispose(&v51, 8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void (**)(id, uint64_t))a6;
  uint64_t v12 = (uint64_t)objc_msgSend(v10, "itunes_statusCode");
  uint64_t v13 = v12;
  if (v12 <= 399)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 ITunesStoreDataConsumer]);
    id v15 = [v14 resumptionOffset];
    if (v13 == 206 || !v15) {
      goto LABEL_17;
    }
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      double v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      __int16 v20 = (void *)objc_opt_class(self);
      id v21 = v20;
      int v65 = 138412546;
      __int128 v66 = v20;
      __int16 v67 = 2048;
      id v68 = [v9 taskIdentifier];
      __int16 v22 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Did not receive partial content response for task: %lu",  &v65,  22);

      if (!v22)
      {
LABEL_16:

        [v14 truncate];
LABEL_17:
        v11[2](v11, 1LL);

        goto LABEL_69;
      }

      double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      SSFileLog(v16, @"%@");
    }

    goto LABEL_16;
  }

  if (v12 == 416)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v30) {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v31 = [v30 shouldLog];
    else {
      LODWORD(v32) = v31;
    }
    unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 OSLogObject]);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v32 = v32;
    }
    else {
      v32 &= 2u;
    }
    if ((_DWORD)v32)
    {
      unsigned int v34 = (void *)objc_opt_class(self);
      id v35 = v34;
      int v65 = 138412546;
      __int128 v66 = v34;
      __int16 v67 = 2048;
      id v68 = [v9 taskIdentifier];
      id v36 = (void *)_os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%@: Truncate and restart task: %lu after 416 response",  &v65,  22);

      if (!v36)
      {
LABEL_45:

        unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v9 ITunesStoreDataConsumer]);
        [v37 truncate];

        goto LABEL_46;
      }

      unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL));
      free(v36);
      __int128 v64 = v33;
      SSFileLog(v30, @"%@");
    }

    goto LABEL_45;
  }

  if (v12 == 408)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v23) {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v24 = [v23 shouldLog];
    else {
      LODWORD(v25) = v24;
    }
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v25 = v25;
    }
    else {
      v25 &= 2u;
    }
    if ((_DWORD)v25)
    {
      uint64_t v27 = (void *)objc_opt_class(self);
      id v28 = v27;
      int v65 = 138412546;
      __int128 v66 = v27;
      __int16 v67 = 2048;
      id v68 = [v9 taskIdentifier];
      uint64_t v29 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: Restart task: %lu after 408 response",  &v65,  22);

      if (!v29)
      {
LABEL_32:

LABEL_46:
        objc_msgSend(v9, "cancelWithITunesStoreReason:error:", 3, 0, v64);
        v11[2](v11, 0LL);
        goto LABEL_69;
      }

      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
      free(v29);
      __int128 v64 = v26;
      SSFileLog(v23, @"%@");
    }

    goto LABEL_32;
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v38) {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v39 = [v38 shouldLog];
  else {
    LODWORD(v40) = v39;
  }
  id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 OSLogObject]);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v40 = v40;
  }
  else {
    v40 &= 2u;
  }
  if (!(_DWORD)v40) {
    goto LABEL_58;
  }
  id v42 = (void *)objc_opt_class(self);
  id v43 = v42;
  int v65 = 138412802;
  __int128 v66 = v42;
  __int16 v67 = 2048;
  id v68 = [v9 taskIdentifier];
  __int16 v69 = 2048;
  uint64_t v70 = v13;
  v44 = (void *)_os_log_send_and_compose_impl( v40,  0LL,  0LL,  0LL,  &_mh_execute_header,  v41,  0LL,  "%@: Cancel download task: %lu for invalid HTTP status code: %ld",  &v65,  32);

  if (v44)
  {
    id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
    free(v44);
    __int128 v64 = v41;
    SSFileLog(v38, @"%@");
LABEL_58:
  }

  if (v13 == 403) {
    uint64_t v45 = -1102LL;
  }
  else {
    uint64_t v45 = 3LL;
  }
  uint64_t v46 = &NSURLErrorDomain;
  if (v13 != 403) {
    uint64_t v46 = (const NSErrorDomain *)&SSErrorDomain;
  }
  uint64_t v47 = SSError(*v46, v45, 0LL, 0LL);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  uint64_t v49 = SSErrorHTTPStatusCodeKey;
  unsigned int v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
  uint64_t v51 = SSErrorBySettingUserInfoValue(v48, v49, v50);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itunes_allHeaderFields"));
  uint64_t v54 = ISDictionaryValueForCaseInsensitiveString(v53, @"X-Apple-JADownloadQueue-Token");
  $3CC8671D27C23BF42ADDB32F2B5E48AE v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
  uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v55, v56) & 1) != 0)
  {
    uint64_t v57 = SSErrorBySettingUserInfoValue(v52, SSDownloadErrorKeyJADownloadQueueToken, v55);
    uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);

    uint64_t v52 = (void *)v58;
  }

  uint64_t v59 = ISDictionaryValueForCaseInsensitiveString(v53, @"Retry-After");
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);

  uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v60, v61) & 1) != 0)
  {
    uint64_t v62 = SSErrorBySettingUserInfoValue(v52, SSDownloadErrorKeyRetryInterval, v60);
    uint64_t v63 = objc_claimAutoreleasedReturnValue(v62);

    uint64_t v52 = (void *)v63;
  }

  objc_msgSend(v9, "cancelWithITunesStoreReason:error:", 1, v52, v64);
  v11[2](v11, 0LL);

LABEL_69:
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    unsigned int v11 = v10;
  }
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 & 2;
  }
  if ((_DWORD)v13)
  {
    int v28 = 138412290;
    id v29 = v7;
    id v14 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[Download] URLSession task complete. task=%@",  &v28,  12);

    if (!v14) {
      goto LABEL_13;
    }
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    __int16 v22 = v12;
    SSFileLog(v9, @"%@");
  }

LABEL_13:
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_downloadOperationsByTask, "objectForKey:", v7));
  if (v15)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_downloadOperationsByTask, "removeObjectForKey:", v7);
    [v15 signalDownloadCompletion];
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ITunesStoreDataConsumer", v22));
  unsigned int v17 = v16;
  if (v8)
  {
    [v16 suspend];
    unsigned __int8 v18 = 0;
  }

  else if (v16)
  {
    id v27 = 0LL;
    unsigned __int8 v18 = [v16 finish:&v27];
    id v8 = v27;
  }

  else
  {
    id v8 = 0LL;
    unsigned __int8 v18 = 1;
  }

  [v7 setITunesStoreDataConsumer:0];
  database = self->_database;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000E8C84;
  v23[3] = &unk_10034E460;
  void v23[4] = self;
  id v24 = v7;
  id v25 = v8;
  unsigned __int8 v26 = v18;
  id v20 = v8;
  id v21 = v7;
  -[DownloadsDatabase modifyAsyncUsingTransactionBlock:](database, "modifyAsyncUsingTransactionBlock:", v23);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  database = self->_database;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000E9E14;
  v16[3] = &unk_10034E4B0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  -[DownloadsDatabase modifyAsyncUsingTransactionBlock:](database, "modifyAsyncUsingTransactionBlock:", v16);
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  database = self->_database;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000EA0CC;
  v12[3] = &unk_10034C668;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  -[DownloadsDatabase modifyAsyncUsingTransactionBlock:](database, "modifyAsyncUsingTransactionBlock:", v12);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v41 = (void (**)(id, id))a6;
  id v11 = v10;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 ITunesStoreDataConsumer]);
  id v13 = [v12 resumptionOffset];
  if ([v12 hasConsumedData])
  {
    [v12 reset];
    id v13 = [v12 resumptionOffset];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v14) {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      unsigned int v16 = v15;
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v16 & 2;
    }
    if ((_DWORD)v18)
    {
      int v44 = 134218240;
      id v45 = [v9 taskIdentifier];
      __int16 v46 = 2048;
      id v47 = v13;
      id v19 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[Download]: Reset data consumer for task: %lu, with resumption offset: %llu",  &v44,  22);

      if (!v19)
      {
LABEL_14:

        goto LABEL_15;
      }

      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      unsigned int v39 = v17;
      SSFileLog(v14, @"%@");
    }

    goto LABEL_14;
  }

- (void)downloadAssetFairPlayStreamingKeyLoader:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000EAB24;
  v11[3] = &unk_10034BCE8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[DownloadsDatabase dispatchBlockAsync:](database, "dispatchBlockAsync:", v11);
}

- (id)_applicationBundleIdentifierForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(&OBJC_CLASS___DownloadEntity);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
  id v8 = -[DownloadEntity initWithPersistentID:inDatabase:](v6, "initWithPersistentID:inDatabase:", a3, v7);

  v14[0] = @"bundle_id";
  v14[1] = @"kind";
  id v12 = 0LL;
  uint64_t v13 = 0LL;
  -[DownloadEntity getValues:forProperties:count:](v8, "getValues:forProperties:count:", &v12, v14, 2LL);
  id v9 = 0LL;
  for (uint64_t i = 1LL; i != -1; --i)

  return v9;
}

- (id)_applicationHandleForDownloadIdentifier:(int64_t)a3 databaseTransaction:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc(&OBJC_CLASS___DownloadEntity);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 database]);
  id v8 = -[DownloadEntity initWithPersistentID:inDatabase:](v6, "initWithPersistentID:inDatabase:", a3, v7);

  v17[0] = @"bundle_id";
  v17[1] = @"kind";
  v17[2] = @"transaction_id";
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = 0LL;
  -[DownloadEntity getValues:forProperties:count:](v8, "getValues:forProperties:count:", &v14, v17, 3LL);
  id v9 = 0LL;
  if (SSDownloadKindIsSoftwareKind(v15) && v14)
  {
    if (v16)
    {
      id v10 = objc_alloc(&OBJC_CLASS___ApplicationHandle);
      id v11 = [v16 longLongValue];
      id v9 = -[ApplicationHandle initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:]( v10,  "initWithTransactionIdentifier:downloadIdentifier:bundleIdentifier:",  v11,  a3,  v14);
    }

    else
    {
      id v9 = 0LL;
    }
  }

  for (uint64_t i = 2LL; i != -1; --i)

  return v9;
}

- (void)_attemptRecoveryForDownloadWithTaskState:(id)a3 databaseSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[ExpiredDownloadRecoveryOperation initWithDownloadIdentifier:databaseSession:]( [ExpiredDownloadRecoveryOperation alloc],  "initWithDownloadIdentifier:databaseSession:",  [v6 downloadIdentifier],  v7);
  objc_initWeak(&location, self);
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_1000EB1C0;
  id v12 = &unk_10034E4D8;
  objc_copyWeak(&v13, &location);
  -[ExpiredDownloadRecoveryOperation setOutputBlock:](v8, "setOutputBlock:", &v9);
  -[NSMapTable setObject:forKey:](self->_taskStates, "setObject:forKey:", v6, v8, v9, v10, v11, v12);
  -[ISOperationQueue addOperation:](self->_processingOperationQueue, "addOperation:", v8);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_authenticationChallengeQueue
{
  authenticationChallengeQueue = self->_authenticationChallengeQueue;
  if (!authenticationChallengeQueue)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    id v5 = self->_authenticationChallengeQueue;
    self->_authenticationChallengeQueue = v4;

    -[ISOperationQueue setMaxConcurrentOperationCount:]( self->_authenticationChallengeQueue,  "setMaxConcurrentOperationCount:",  1LL);
    -[ISOperationQueue setName:]( self->_authenticationChallengeQueue,  "setName:",  @"com.apple.itunesstored.DownloadPipeline.auth");
    authenticationChallengeQueue = self->_authenticationChallengeQueue;
  }

  return authenticationChallengeQueue;
}

- (void)_commitProgressTimer
{
  if (-[NSMutableSet count](self->_dirtyTaskStates, "count"))
  {
    database = self->_database;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000EB314;
    v7[3] = &unk_10034CEB8;
    v7[4] = self;
    id v4 = -[DownloadsDatabase modifyUsingTransactionBlock:](database, "modifyUsingTransactionBlock:", v7);
    -[NSMutableSet removeAllObjects](self->_dirtyTaskStates, "removeAllObjects");
  }

  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel((dispatch_source_t)progressTimer);
    id v6 = self->_progressTimer;
    self->_progressTimer = 0LL;
  }

- (void)_disavowDownloadHandlerSession:(id)a3 withTaskState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 requiresDownloadHandler])
  {
    database = self->_database;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000EBA0C;
    v10[3] = &unk_10034C668;
    id v11 = v7;
    id v12 = self;
    id v13 = v6;
    id v9 = -[DownloadsDatabase modifyUsingTransactionBlock:](database, "modifyUsingTransactionBlock:", v10);
  }

  -[DownloadPipeline _releaseDownloadHandlerSession:withTaskState:]( self,  "_releaseDownloadHandlerSession:withTaskState:",  v6,  v7);
}

- (BOOL)_downloadIsForLegacyClientWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = self->_taskStates;
  id v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSURLSessionTask);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_taskStates, "objectForKey:", v10, (void)v17));
          if ([v12 isLegacyClient])
          {
            id v13 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [v12 downloadIdentifier]);
            unsigned __int8 v14 = [v4 isEqualToNumber:v13];

            if ((v14 & 1) != 0)
            {

              BOOL v15 = 1;
              goto LABEL_14;
            }
          }
        }
      }

      id v7 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (id)_downloadSessionPropertiesWithPhase:(id)a3 taskState:(id)a4 databaseSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___DownloadEntity);
  id v11 = [v8 downloadIdentifier];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 database]);
  id v13 = -[DownloadEntity initWithPersistentID:inDatabase:](v10, "initWithPersistentID:inDatabase:", v11, v12);

  v20[0] = @"client_id";
  v20[1] = @"handler_id";
  v20[2] = @"is_from_store";
  v20[3] = @"suppress_error_dialogs";
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  -[DownloadEntity getValues:forProperties:count:](v13, "getValues:forProperties:count:", &v18, v20, 4LL);
  unsigned __int8 v14 = objc_alloc(&OBJC_CLASS___DownloadSessionProperties);
  BOOL v15 = -[DownloadSessionProperties initWithClientIdentifier:handlerIdentifier:]( v14,  "initWithClientIdentifier:handlerIdentifier:",  (void)v18,  [*((id *)&v18 + 1) longLongValue]);
  -[DownloadSessionProperties setAssetIdentifier:](v15, "setAssetIdentifier:", [v8 mediaAssetIdentifier]);
  -[DownloadSessionProperties setDownloadIdentifier:]( v15,  "setDownloadIdentifier:",  [v8 downloadIdentifier]);
  -[DownloadSessionProperties setDownloadPhase:](v15, "setDownloadPhase:", v7);
  -[DownloadSessionProperties setStoreDownload:](v15, "setStoreDownload:", [(id)v19 BOOLValue]);
  -[DownloadSessionProperties setShouldSupressErrorDialogs:]( v15,  "setShouldSupressErrorDialogs:",  [*((id *)&v19 + 1) BOOLValue]);
  for (uint64_t i = 3LL; i != -1; --i)

  return v15;
}

- (void)_failDownloadWithIdentifier:(id)a3 error:(id)a4 transaction:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___DownloadEntity);
  id v11 = [v9 longLongValue];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 database]);
  unsigned __int8 v14 = -[DownloadEntity initWithPersistentID:inDatabase:](v10, "initWithPersistentID:inDatabase:", v11, v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadEntity failWithError:](v14, "failWithError:", v8));
  [v7 unionChangeset:v13];
}

- (void)_finishDownloadWithOperation:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000EC194;
  v11[3] = &unk_10034C668;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[DownloadsDatabase modifyAsyncUsingTransactionBlock:](database, "modifyAsyncUsingTransactionBlock:", v11);
}

- (void)_taskReceived:(id)a3 persistAVAssetDownloadToken:(unint64_t)a4
{
  id v6 = a3;
  database = self->_database;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000ECFC8;
  v9[3] = &unk_10034E500;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  -[DownloadsDatabase modifyAsyncUsingTransactionBlock:](database, "modifyAsyncUsingTransactionBlock:", v9);
}

- (void)_performDownloadOperation:(id)a3
{
  id v82 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v82 response]);
  id v5 = [v4 downloadIdentifier];
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v7 & 2;
    }
    if ((_DWORD)v9)
    {
      *(_WORD *)v112 = 0;
      id v10 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[Download]: Finshing prepare with 0 download ID",  v112,  2);

      if (v10)
      {
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
        free(v10);
        v77 = v11;
        SSFileLog(v6, @"%@");
      }
    }

    else
    {
    }
  }

  id v12 = objc_msgSend(v4, "result", v77);
  if (sub_10012E820((uint64_t)v12))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 kind]);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[ScratchManager directoryPathForDownloadID:kind:createIfNeeded:]( &OBJC_CLASS___ScratchManager,  "directoryPathForDownloadID:kind:createIfNeeded:",  v5,  v13,  1LL));

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    BOOL v16 = [v15 length] == 0;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    __int128 v18 = (void *)v17;
    if (v16)
    {
      if (!v17) {
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v24 = [v18 shouldLog];
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = v24 & 2;
      }
      if (!(_DWORD)v25) {
        goto LABEL_36;
      }
      *(_DWORD *)v112 = 138412546;
      *(void *)&v112[4] = v14;
      *(_WORD *)&v112[12] = 2048;
      *(void *)&v112[14] = v5;
      LODWORD(v79) = 22;
      unsigned int v26 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "[Download]: Created Scratch directory: %@ for download: %lld",  v112,  v79);

      if (v26)
      {
        __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
        free(v26);
        __int128 v78 = v20;
        SSFileLog(v18, @"%@");
        goto LABEL_36;
      }
    }

    else
    {
      if (!v17) {
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v19 = [v18 shouldLog];
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v19 & 2;
      }
      if (!(_DWORD)v21) {
        goto LABEL_36;
      }
      id v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
      *(_DWORD *)v112 = 138412802;
      *(void *)&v112[4] = v14;
      *(_WORD *)&v112[12] = 2048;
      *(void *)&v112[14] = v5;
      *(_WORD *)&v112[22] = 2112;
      v113 = v22;
      LODWORD(v79) = 32;
      id v23 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v20,  1LL,  "[Download]: Created Scratch directory: %@ for download: %lld bundleIdentifier: %@",  v112,  v79);

      if (v23)
      {
        __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v23,  4LL));
        free(v23);
        __int128 v78 = v20;
        SSFileLog(v18, @"%@");
LABEL_36:
      }
    }
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLSessionIdentifier", v78));
  *(void *)v112 = 0LL;
  *(void *)&v112[8] = v112;
  *(void *)&v112[16] = 0x3032000000LL;
  v113 = sub_1000EE078;
  v114 = sub_1000EE088;
  id v115 = 0LL;
  database = self->_database;
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472LL;
  v100[2] = sub_1000EE090;
  v100[3] = &unk_10034CDF0;
  id v29 = v4;
  v102 = self;
  v103 = v112;
  id v101 = v29;
  -[DownloadsDatabase dispatchBlockSync:](database, "dispatchBlockSync:", v100);
  uint64_t v94 = 0LL;
  __int16 v95 = &v94;
  uint64_t v96 = 0x3032000000LL;
  v97 = sub_1000EE078;
  v98 = sub_1000EE088;
  id v99 = 0LL;
  unsigned int v30 = [v29 isHLS];
  uint64_t v31 = *(void *)(*(void *)&v112[8] + 40LL);
  if (v30)
  {
    if (v31) {
      goto LABEL_44;
    }
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionConfiguration]);
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[AVAssetDownloadURLSession sessionWithConfiguration:assetDownloadDelegate:delegateQueue:]( &OBJC_CLASS___AVAssetDownloadURLSession,  "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:",  v32,  self,  0LL));
  }

  else
  {
    if (v31) {
      goto LABEL_44;
    }
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionConfiguration]);
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v32,  self,  0LL));
  }

  unsigned int v34 = *(void **)(*(void *)&v112[8] + 40LL);
  *(void *)(*(void *)&v112[8] + 40LL) = v33;

LABEL_44:
  if (v12)
  {
    id v35 = 0LL;
    id v36 = 0LL;
  }

  else
  {
    uint64_t v37 = *(void *)(*(void *)&v112[8] + 40LL);
    id v93 = 0LL;
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionTaskWithSession:v37 error:&v93]);
    id v35 = v93;
  }

  id v38 = self->_database;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472LL;
  v83[2] = sub_1000EE0F0;
  v83[3] = &unk_10034E528;
  id v39 = v29;
  id v84 = v39;
  __int128 v85 = self;
  __int128 v89 = v112;
  id v40 = v27;
  id v86 = v40;
  v90 = &v94;
  id v91 = v12;
  id v92 = v5;
  id v41 = v36;
  id v87 = v41;
  id v42 = v35;
  id v88 = v42;
  id v43 = -[DownloadsDatabase modifyUsingTransactionBlock:](v38, "modifyUsingTransactionBlock:", v83);
  if (!v95[5])
  {
    if (!v41) {
      goto LABEL_92;
    }
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v54) {
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v55 = [v54 shouldLog];
    unsigned int v56 = [v54 shouldLogToDisk];
    uint64_t v57 = (os_log_s *)objc_claimAutoreleasedReturnValue([v54 OSLogObject]);
    uint64_t v58 = v57;
    if (v56) {
      unsigned int v59 = v55 | 2;
    }
    else {
      unsigned int v59 = v55;
    }
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v60 = v59;
    }
    else {
      uint64_t v60 = v59 & 2;
    }
    if ((_DWORD)v60)
    {
      id v61 = [v41 taskIdentifier];
      id v62 = [v41 _priority];
      int v104 = 134218754;
      id v105 = v61;
      __int16 v106 = 2048;
      id v107 = v62;
      __int16 v108 = 2048;
      id v109 = v5;
      __int16 v110 = 2114;
      id v111 = v40;
      LODWORD(v79) = 42;
      uint64_t v63 = (void *)_os_log_send_and_compose_impl( v60,  0LL,  0LL,  0LL,  &_mh_execute_header,  v58,  0LL,  "[Download]: Starting task: %lu with priority: %ld for download: %lld in session: %{public}@",  &v104,  v79);

      if (!v63) {
        goto LABEL_74;
      }
      uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v63,  4LL));
      free(v63);
      SSFileLog(v54, @"%@");
    }

LABEL_74:
    uint64_t v64 = objc_opt_class(self);
    id v65 = [v41 taskIdentifier];
    id v81 = [v41 _priority];
    SSDebugLog(1LL, @"[%@]: Starting task: %lu with priority: %ld for download: %lld in session: %@");
    objc_msgSend(v41, "resume", v64, v65, v81, v5, v40);
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue([v39 kind]);
    if (([v66 isEqualToString:SSDownloadKindMusic] & 1) == 0)
    {
      __int16 v67 = (void *)objc_claimAutoreleasedReturnValue([v39 kind]);
      if (![v67 isEqualToString:SSDownloadKindMusicVideo])
      {
        unsigned __int8 v76 = [v39 isHLS];

        if ((v76 & 1) == 0)
        {
LABEL_79:
          id v68 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
          if (!v68) {
            id v68 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v69 = [v68 shouldLog];
          unsigned int v70 = [v68 shouldLogToDisk];
          id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue([v68 OSLogObject]);
          v72 = v71;
          if (v70) {
            unsigned int v73 = v69 | 2;
          }
          else {
            unsigned int v73 = v69;
          }
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO)) {
            uint64_t v74 = v73;
          }
          else {
            uint64_t v74 = v73 & 2;
          }
          if ((_DWORD)v74)
          {
            int v104 = 138412290;
            id v105 = v41;
            LODWORD(v80) = 12;
            v75 = (void *)_os_log_send_and_compose_impl( v74,  0LL,  0LL,  0LL,  &_mh_execute_header,  v72,  1LL,  "[Download]: download task creation complete task=%@",  &v104,  v80);

            if (!v75)
            {
LABEL_91:

              goto LABEL_92;
            }

            v72 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v75,  4LL));
            free(v75);
            SSFileLog(v68, @"%@");
          }

          goto LABEL_91;
        }

- (void)_finishRecoveryWithOperation:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000EF020;
  v11[3] = &unk_10034C668;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[DownloadsDatabase modifyAsyncUsingTransactionBlock:](database, "modifyAsyncUsingTransactionBlock:", v11);
}

- (BOOL)_hasAutomaticUpdateTasks
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_taskStates;
  id v4 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMapTable objectForKey:]( self->_taskStates,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)i),  (void)v12));
        id v9 = [v8 automaticType];

        if (v9 == (id)2)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }

      id v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)_logDownloadEvent:(id)a3 forTaskWithState:(id)a4 session:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 downloadIdentifier];
  id v11 = [v8 mediaAssetIdentifier];

  id v13 = [v7 newEventDictionaryWithDownloadIdentifier:v10 assetIdentifier:v11];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[EventDispatcher eventDispatcher](&OBJC_CLASS___EventDispatcher, "eventDispatcher"));
  [v12 postEventWithName:v9 userInfo:v13];
}

- (void)_performDefaultHandlingForAuthenticationChallenge:(id)a3 withSessionProperties:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 protectionSpace]);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authenticationMethod]);
  if (![v12 isEqualToString:NSURLAuthenticationMethodClientCertificate])
  {
    if ([v12 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialForTrust:]( NSURLCredential,  "credentialForTrust:",  [v11 serverTrust]));
      v10[2](v10, 0LL, v13);

      goto LABEL_31;
    }

    if ([v9 isStoreDownload])
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v14) {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v15 = [v14 shouldLog];
      else {
        LODWORD(v16) = v15;
      }
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v16 = v16;
      }
      else {
        v16 &= 2u;
      }
      if (!(_DWORD)v16) {
        goto LABEL_29;
      }
      int v28 = 134217984;
      id v29 = [v9 downloadIdentifier];
      uint64_t v18 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "[Download]: Ignoring authentication challenge for download %lld",  &v28);
    }

    else
    {
      if (![v9 shouldSupressErrorDialogs])
      {
        id v22 = [[ISURLAuthenticationChallenge alloc] initWithAuthenticationChallenge:v8];
        id v23 = -[ISDialog initWithAuthenticationChallege:]( objc_alloc(&OBJC_CLASS___ISDialog),  "initWithAuthenticationChallege:",  v22);
        unsigned int v24 = -[DaemonDialogOperation initWithDialog:]( objc_alloc(&OBJC_CLASS___DaemonDialogOperation),  "initWithDialog:",  v23);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_1000EF960;
        v26[3] = &unk_10034E550;
        id v27 = v10;
        -[DaemonDialogOperation setOutputBlock:](v24, "setOutputBlock:", v26);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadPipeline _authenticationChallengeQueue](self, "_authenticationChallengeQueue"));
        [v25 addOperation:v24];

        goto LABEL_31;
      }

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v14) {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v19 = [v14 shouldLog];
      else {
        LODWORD(v20) = v19;
      }
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        uint64_t v20 = v20;
      }
      else {
        v20 &= 2u;
      }
      if (!(_DWORD)v20) {
        goto LABEL_29;
      }
      int v28 = 134217984;
      id v29 = [v9 downloadIdentifier];
      uint64_t v18 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  16LL,  "[Download]: Supressing authentication challenge for download %lld",  &v28);
    }

    uint64_t v21 = (void *)v18;

    if (!v21)
    {
LABEL_30:

      v10[2](v10, 2LL, 0LL);
      goto LABEL_31;
    }

    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
    free(v21);
    SSFileLog(v14, @"%@");
LABEL_29:

    goto LABEL_30;
  }

  v10[2](v10, 1LL, 0LL);
LABEL_31:
}

- (void)_prepareDownloadsMatchingPredicate:(id)a3 ignoreDownloadHandlers:(BOOL)a4 filtersExistingTasks:(BOOL)a5
{
  id v8 = a3;
  database = self->_database;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000EFB34;
  v11[3] = &unk_10034E5C8;
  BOOL v13 = a5;
  v11[4] = self;
  id v12 = v8;
  BOOL v14 = a4;
  id v10 = v8;
  -[DownloadsDatabase readUsingTransactionBlock:](database, "readUsingTransactionBlock:", v11);
}

- (void)_processDownloadWithTaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 setTransferProgress:1.0];
  -[NSMutableSet addObject:](self->_dirtyTaskStates, "addObject:", v10);
  -[DownloadPipeline _startProgressTimer](self, "_startProgressTimer");
  -[DownloadPipeline _queueFinishDownloadWithtaskState:databaseSession:setupBlock:]( self,  "_queueFinishDownloadWithtaskState:databaseSession:setupBlock:",  v10,  v9,  v8);
}

- (void)_queueFinishDownloadWithtaskState:(id)a3 databaseSession:(id)a4 setupBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, FinishDownloadOperation *))a5;
  id v11 = -[FinishDownloadOperation initWithDownloadIdentifier:databaseSession:]( [FinishDownloadOperation alloc],  "initWithDownloadIdentifier:databaseSession:",  [v8 downloadIdentifier],  v9);
  -[FinishDownloadOperation setDelegate:](v11, "setDelegate:", self);
  -[FinishDownloadOperation setShouldRunWithBackgroundPriority:](v11, "setShouldRunWithBackgroundPriority:", 1LL);
  objc_initWeak(&location, self);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  BOOL v14 = sub_1000F010C;
  unsigned int v15 = &unk_10034E5F0;
  objc_copyWeak(&v16, &location);
  -[FinishDownloadOperation setOutputBlock:](v11, "setOutputBlock:", &v12);
  if (v10) {
    v10[2](v10, v11);
  }
  -[NSMapTable setObject:forKey:](self->_taskStates, "setObject:forKey:", v8, v11, v12, v13, v14, v15);
  -[ISOperationQueue addOperation:](self->_processingOperationQueue, "addOperation:", v11);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_processDownloadFailureWithTaskState:(id)a3 cancelReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  if (a4 == 1) {
    id v8 = @"Unrecoverable Error";
  }
  else {
    id v8 = @"Download Error";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v9) {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v10 = [v9 shouldLog];
  else {
    LODWORD(v11) = v10;
  }
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v11 = v11;
  }
  else {
    v11 &= 2u;
  }
  if (!(_DWORD)v11) {
    goto LABEL_17;
  }
  id v13 = [v6 downloadIdentifier];
  BOOL v14 = @"User Stopped";
  if (a4 != 2) {
    BOOL v14 = v8;
  }
  int v24 = 134218242;
  id v25 = v13;
  __int16 v26 = 2112;
  id v27 = v14;
  unsigned int v15 = (void *)_os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[Download]: Download Failed for download: %lld reason: %@",  &v24,  22);

  if (v15)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    id v23 = v12;
    SSFileLog(v9, @"%@");
LABEL_17:
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 kind]);
  uint64_t v17 = (void *)v16;
  if (v16 && SSDownloadKindIsSoftwareKind(v16) && [v7 length])
  {
    uint64_t v18 = objc_alloc(&OBJC_CLASS___ApplicationHandle);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadHandle]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    uint64_t v21 = -[ApplicationHandle initWithDownloadHandle:bundleIdentifier:]( v18,  "initWithDownloadHandle:bundleIdentifier:",  v19,  v20);

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationWorkspace defaultWorkspace](&OBJC_CLASS___ApplicationWorkspace, "defaultWorkspace"));
    [v22 restorePlaceholderForApplicationHandle:v21];
  }

  objc_msgSend(v6, "setTransferProgress:", 1.0, v23);
  -[NSMutableSet addObject:](self->_dirtyTaskStates, "addObject:", v6);
}

- (void)_releaseDownloadHandlerSession:(id)a3 withTaskState:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 sessionProperties]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadPhase]);

  if ([v8 isEqualToString:SSDownloadPhaseDownloading])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:]( SSSQLiteComparisonPredicate,  "predicateWithProperty:equalToLongLong:",  SSSQLEntityPropertyPersistentID,  [v6 downloadIdentifier]));
    -[DownloadPipeline _prepareDownloadsMatchingPredicate:ignoreDownloadHandlers:filtersExistingTasks:]( self,  "_prepareDownloadsMatchingPredicate:ignoreDownloadHandlers:filtersExistingTasks:",  v9,  1LL,  0LL);
  }

  else
  {
    database = self->_database;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000F0530;
    v11[3] = &unk_10034CE40;
    v11[4] = self;
    id v12 = v6;
    id v13 = v8;
    -[DownloadsDatabase readUsingTransactionBlock:](database, "readUsingTransactionBlock:", v11);
  }
}

- (void)_reloadKeepAliveAssertion
{
  if (-[NSMutableOrderedSet count](self->_preparationDownloadIDs, "count"))
  {
    if (self->_holdingKeepAliveAssertion) {
      return;
    }
    self->_holdingKeepAliveAssertion = 1;
    goto LABEL_16;
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = self->_taskStates;
  id v4 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)i);
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSOperation);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          LODWORD(v4) = 1;
          goto LABEL_14;
        }
      }

      id v4 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)_scheduleReconnect
{
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    dispatch_time_t v3 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)reconnectTimer, v3, 0LL, 0LL);
  }

  else
  {
    uint64_t v5 = -[DownloadsDatabase newDispatchSourceWithType:]( self->_database,  "newDispatchSourceWithType:",  &_dispatch_source_type_timer);
    id v6 = self->_reconnectTimer;
    self->_reconnectTimer = v5;

    uint64_t v7 = self->_reconnectTimer;
    dispatch_time_t v8 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v7, v8, 0LL, 0LL);
    objc_initWeak(&location, self);
    id v9 = self->_reconnectTimer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000F08B4;
    v10[3] = &unk_10034BC98;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
    dispatch_resume((dispatch_object_t)self->_reconnectTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

- (void)_setDownloadPhase:(id)a3 forDownloadIdentifier:(int64_t)a4 databaseTransaction:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (!a4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      unsigned int v11 = v10;
    }
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v11 & 2;
    }
    if ((_DWORD)v13)
    {
      v22[0] = 0;
      BOOL v14 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[Download]: Setting phase with download ID of 0",  v22,  2);

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }

      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v9, @"%@");
    }

    goto LABEL_14;
  }

- (void)_startProgressTimer
{
  if (!self->_progressTimer)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v3 = -[DownloadsDatabase newDispatchSourceWithType:]( self->_database,  "newDispatchSourceWithType:",  &_dispatch_source_type_timer);
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;

    uint64_t v5 = self->_progressTimer;
    dispatch_time_t v6 = dispatch_time(0LL, 500000000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    id v7 = self->_progressTimer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000F0D70;
    v8[3] = &unk_10034BC98;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
    dispatch_resume((dispatch_object_t)self->_progressTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (BOOL)_isPodcast:(id)a3
{
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForProperty:@"kind"]);
  char IsPodcastKind = SSDownloadKindIsPodcastKind(v3);

  return IsPodcastKind;
}

- (void)_reportTVAppDownloadQOSMetricsIfAppropriateForKind:(id)a3 adamID:(id)a4 rentalID:(id)a5 error:(id)a6 cancelReason:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  BOOL v14 = (NSError *)a6;
  if (SSDownloadKindIsVideosAppKind(v11))
  {
    if (a7 == 2)
    {
      int v15 = 300;
    }

    else if (v14 || a7 == 1)
    {
      if (!v14)
      {
        uint64_t v16 = objc_alloc(&OBJC_CLASS___NSError);
        BOOL v14 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", SSErrorDomain, 100LL, 0LL);
      }

      int v15 = 500;
    }

    else
    {
      BOOL v14 = 0LL;
      int v15 = 200;
    }

    unsigned int v100 = v15;
    uint64_t v17 = ISWeakLinkedStringConstantForString("kRTCReportingUserInfoServiceName", 41LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = ISWeakLinkedStringConstantForString("kRTCReportingUserInfoClientName", 41LL);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = ISWeakLinkedStringConstantForString("kRTCReportingSessionInfoClientType", 41LL);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = ISWeakLinkedStringConstantForString("kRTCReportingSessionInfoClientVersion", 41LL);
    int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = ISWeakLinkedStringConstantForString("kRTCReportingSessionInfoSessionID", 41LL);
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = ISWeakLinkedStringConstantForString("kRTCReportingSessionInfoBatchEvent", 41LL);
    id v109 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v28 = ISWeakLinkedStringConstantForString("kRTCReportingSessionInfoContainsRealtimeEvents", 41LL);
    __int16 v108 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v29 = ISWeakLinkedStringConstantForString("kRTCReportingSessionInfoClientBundleID", 41LL);
    id v107 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v30 = ISWeakLinkedStringConstantForString("kRTCReportingMessageParametersCategory", 41LL);
    __int16 v106 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v31 = ISWeakLinkedStringConstantForString("kRTCReportingMessageParametersType", 41LL);
    id v105 = (void *)objc_claimAutoreleasedReturnValue(v31);
    uint64_t v32 = ISWeakLinkedStringConstantForString("kRTCReportingMessageParametersFlag", 41LL);
    int v104 = (void *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v33 = ISWeakLinkedStringConstantForString("kRTCReportingMessageParametersPayload", 41LL);
    v103 = (void *)objc_claimAutoreleasedReturnValue(v33);
    uint64_t v34 = ISWeakLinkedClassForString(@"RTCReporting", 41LL);
    if (!v34 || !v18 || !v20 || !v22 || !v24 || !v26 || !v109 || !v108 || !v107 || !v106 || !v105 || !v104 || !v103) {
      goto LABEL_98;
    }
    id v35 = (objc_class *)v34;
    id v93 = v24;
    uint64_t v94 = v22;
    v115[0] = v22;
    v115[1] = v24;
    v116[0] = &off_10036D848;
    v116[1] = &off_10036D860;
    v98 = v26;
    v115[2] = v26;
    id v36 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", arc4random());
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v116[2] = v37;
    v116[3] = &__kCFBooleanFalse;
    v115[3] = v109;
    v115[4] = v108;
    v115[5] = v107;
    v116[4] = &__kCFBooleanTrue;
    v116[5] = @"com.apple.tv";
    v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v116,  v115,  6LL));

    id v91 = v20;
    v113[0] = v20;
    v113[1] = @"ContentProvider";
    v114[0] = @"AppleTV";
    v114[1] = @"tvs.sbd.9001";
    v113[2] = @"iTunesServiceMonitoringKey";
    v114[2] = &__kCFBooleanTrue;
    id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v114,  v113,  3LL));
    id v39 = [v38 mutableCopy];

    id v101 = v39;
    if (v13
      && (uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v13, v40) & 1) != 0)
      && [v13 longLongValue])
    {
      id v41 = @"com.apple.videos.movies.rental.cloud";
    }

    else
    {
      if (([v11 isEqualToString:SSDownloadKindMovie] & 1) == 0)
      {
        if (![v11 isEqualToString:SSDownloadKindTelevisionEpisode])
        {
          id v42 = 0LL;
          char v43 = 0;
          if (!v12) {
            goto LABEL_40;
          }
LABEL_35:
          uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v12, v44) & 1) != 0)
          {
            id v45 = [v12 longLongValue];
            char v46 = v43 ^ 1;
            if (!v45) {
              char v46 = 1;
            }
            if ((v46 & 1) == 0)
            {
              id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"a=%@:s=%@:e=%@",  v12,  @"tvs.sbd.9001",  v42));
              [v101 setObject:v47 forKey:@"MediaIdentifier"];
            }
          }

- (void).cxx_destruct
{
}

@end