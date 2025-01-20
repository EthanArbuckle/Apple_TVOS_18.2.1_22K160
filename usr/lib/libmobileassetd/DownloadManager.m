@interface DownloadManager
+ (BOOL)isDeviceBeforeFirstUnlock;
+ (id)_extractCheckedNSErrorFromDict:(id)a3 withKey:(id)a4;
+ (id)getPallasUrl:(BOOL)a3 assetType:(id)a4;
+ (id)pathToCatalogLookupServer:(id)a3 usingDownloadOptions:(id)a4;
- (BOOL)_isAutoAsset:(id)a3;
- (BOOL)_shouldLogAssetDetails:(id)a3 extraServerOptions:(id)a4;
- (BOOL)addInFailedJobs:(id)a3 finalEvents:(id)a4;
- (BOOL)checkAssetDownloadIsSkipped:(id)a3 connection:(id)a4 with:(id)a5 autoAssetJob:(id)a6;
- (BOOL)checkCatalogDownloadIsSkipped:(id)a3 connection:(id)a4 with:(id)a5 autoAssetJob:(id)a6;
- (BOOL)checkDownloadIsSyncing:(id)a3 using:(id)a4 with:(id)a5 autoAssetJob:(id)a6;
- (BOOL)checkMadeForBeforeFirstUnlock;
- (BOOL)checkPmvDownloadIsSkipped:(id)a3 connection:(id)a4 with:(id)a5;
- (BOOL)currentlyBatchingSplunk;
- (BOOL)deviceBeforeFirstUnlock;
- (BOOL)downloadNeedsSSO:(id)a3 taskDescriptor:(id)a4 url:(id)a5;
- (BOOL)forceDaemonBusy;
- (BOOL)getPallasEnabledForAssetType:(id)a3;
- (BOOL)haveSyncedSplunkData;
- (BOOL)haveSyncedSplunkState;
- (BOOL)pallasRequestRequiresAuthentication:(id)a3 serverParams:(id)a4;
- (BOOL)performingNSURLSessionSync;
- (BOOL)timerRunning;
- (DownloadManager)init;
- (MABAACertManager)authPallasBAACertManager;
- (MADAnalyticsManager)analytics;
- (MAKeyManagerDownloadSessionDelegate)authPallasSessionDelegate;
- (NSDate)previousTimeEstimatePoint;
- (NSDateFormatter)dateFormatter;
- (NSMutableDictionary)cachedMetaDataForAssetType;
- (NSMutableDictionary)currentSplunkEvent;
- (NSMutableDictionary)downloadTasksInFlight;
- (NSOperationQueue)operationQueue;
- (NSOperationQueue)splunkOperationQueue;
- (NSString)brainVersion;
- (NSString)trainName;
- (NSURL)splunkUrl;
- (NSURLSession)authPallasSession;
- (NSURLSession)backgroundSession;
- (NSURLSession)inProcessSession;
- (NSURLSession)pallasSession;
- (NSURLSession)splunkSession;
- (NSURLSessionConfiguration)backgroundDiscretionaryConfiguration;
- (NSURLSessionConfiguration)inProcessConfig;
- (NSURLSessionDelegate)delegate;
- (NSURLSessionDelegate)splunkDelegate;
- (OS_dispatch_queue)dedupNSURLSessionSyncQueue;
- (OS_dispatch_queue)deviceStatusQueue;
- (OS_dispatch_queue)downloadStateQueue;
- (OS_dispatch_queue)splunkStateQueue;
- (OS_dispatch_queue)ssoQueue;
- (OS_dispatch_source)timer;
- (PallasResponseVerifier)pallasVerifier;
- (id)MACopyDawToken:(id)a3;
- (id)_getKeysNotLoggedForAutoResponse;
- (id)_getKeysNotLoggedForV2Response;
- (id)_parseForAssetDetailsToLog:(id)a3;
- (id)addSUOptions:(id)a3 options:(id)a4;
- (id)clientIdentifierWithName:(id)a3;
- (id)currentConfig;
- (id)currentSession;
- (id)getUserAgentStringForClient:(id)a3 withAssetType:(id)a4;
- (id)lastModifiedDateFromResponse:(id)a3;
- (id)newAssetAudience:(BOOL)a3 assetType:(id)a4;
- (id)newDefaultEventDictionary:(id)a3 sessionId:(id)a4 nonce:(id)a5 url:(id)a6 statusCode:(int64_t)a7 assetAudience:(id)a8 uuid:(id)a9 assetType:(id)a10 version:(id)a11 receiptResults:(id)a12 baseUrl:(id)a13 discretionary:(BOOL)a14 deviceCheck:(id)a15;
- (id)startDownloadTask:(id)a3 downloadSize:(int64_t)a4 for:(id)a5 startingAt:(id)a6 withLength:(id)a7 extractWith:(id)a8 options:(id)a9 modified:(id)a10 session:(id)a11;
- (id)startDownloadTask:(id)a3 downloadSize:(int64_t)a4 for:(id)a5 startingAt:(id)a6 withLength:(id)a7 extractWith:(id)a8 options:(id)a9 modified:(id)a10 session:(id)a11 isCachingServer:(BOOL)a12;
- (id)timerHandler;
- (int)triggerVPN;
- (int64_t)currentState;
- (int64_t)decryptContentEncryptedAssetAtPathIfRequired:(id)a3;
- (int64_t)massagePmvAndPersist:(id)a3 from:(id)a4 to:(id)a5 postedDate:(id)a6;
- (int64_t)massageXmlAndPersist:(id)a3 catalogInfo:(id)a4 descriptor:(id)a5 assets:(id)a6 transformations:(id)a7 to:(id)a8 postedDate:(id)a9 receiptResults:(id *)a10 assetSetId:(id)a11 pallasUrl:(id)a12 considerCaching:(BOOL)a13;
- (int64_t)massageXmlAndPersist:(id)a3 from:(id)a4 to:(id)a5 with:(id)a6 postedDate:(id)a7 considerCaching:(BOOL)a8;
- (int64_t)processAssetDownload:(id)a3 with:(id)a4 and:(id)a5 shouldMove:(BOOL)a6 extractorExists:(BOOL)a7;
- (void)_logResponseBody:(id)a3 nonce:(id)a4 extraServerOptions:(id)a5;
- (void)activityNotification:(id)a3 ofStatusChange:(unint64_t)a4 withReason:(id)a5;
- (void)addLiveServerRequest:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 audience:(id)a6 pallasUrl:(id)a7 using:(id)a8 with:(id)a9 clientName:(id)a10 autoAssetJobID:(id)a11 task:(id)a12 options:(id)a13;
- (void)allDownloading:(id)a3;
- (void)applyTransforms:(id)a3 toAssets:(id)a4;
- (void)applyTransformsAndCheckReceipts:(id)a3 transformations:(id)a4 assetType:(id)a5 assets:(id)a6 receiptResults:(id *)a7;
- (void)assessDownloadCompletion:(id)a3 originalUrl:(id)a4 taskDescription:(id)a5 taskId:(id)a6 error:(id)a7 moveFile:(BOOL)a8 extractorExists:(BOOL)a9;
- (void)augmentSplunkEvent:(id)a3 withResultForHTTPStatusCode:(int64_t)a4;
- (void)cancelAllDownloading:(id)a3 withPurpose:(id)a4 includingAssets:(BOOL)a5 includingCatalog:(BOOL)a6 includingOther:(BOOL)a7 clientName:(id)a8 then:(id)a9;
- (void)cancelAssetDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 matchingAssetId:(id)a6 forAutoAssetName:(id)a7;
- (void)cancelAssetDownloadTask:(id)a3;
- (void)checkSplunkStatus:(id)a3 failureReason:(id)a4 productVersion:(id)a5 sessionId:(id)a6 nonce:(id)a7 url:(id)a8 statusCode:(int64_t)a9 assetAudience:(id)a10 version:(id)a11 receiptResults:(id)a12 baseUrl:(id)a13 discretionary:(BOOL)a14 deviceCheck:(id)a15;
- (void)configAssetDownload:(id)a3 withPurpose:(id)a4 matchingAssetId:(id)a5 usingDownloadConfig:(id)a6 usingXPCConnection:(id)a7 withXPCMessage:(id)a8 performingAutoAssetJob:(id)a9 asClientName:(id)a10;
- (void)configAssetDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 matchingAssetId:(id)a6 usingDownloadConfig:(id)a7 forAutoAssetName:(id)a8;
- (void)configDownload:(id)a3 clientName:(id)a4 using:(id)a5 with:(id)a6;
- (void)getCurrentInflightDownloads:(id)a3;
- (void)handleSplunkReportFinished:(id)a3 result:(BOOL)a4;
- (void)handleSuccessfulDownload:(id)a3 task:(id)a4 taskId:(id)a5 shouldMove:(BOOL)a6 extractorExists:(BOOL)a7 postedDate:(id)a8 notModified:(BOOL)a9;
- (void)indicateDownloadJobFinished:(int)a3 usingXPCConnection:(id)a4 withXPCMessage:(id)a5 performingAutoAssetJob:(id)a6 ofJobType:(id)a7;
- (void)initializeSessionsAsync;
- (void)isDownloading:(id)a3 then:(id)a4;
- (void)pallasRequestV2:(id)a3 normalizedType:(id)a4 withPurpose:(id)a5 options:(id)a6 using:(id)a7 with:(id)a8 autoAssetJob:(id)a9 clientName:(id)a10 then:(id)a11;
- (void)queryNSUrlSessiondAndUpdateState;
- (void)registerAssetDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 clientName:(id)a6 usingDownloadOptions:(id)a7 forAssetId:(id)a8 withCatalogMetadata:(id)a9 withSpaceCheckedUUID:(id)a10;
- (void)registerAssetDownloadJob:(id)a3 forThis:(id)a4 withBase:(id)a5 relativeTo:(id)a6 startingAt:(id)a7 withLength:(id)a8 extractWith:(id)a9 allocateExtractorIfNecessary:(BOOL)a10 connection:(id)a11 message:(id)a12 clientName:(id)a13 notify:(unint64_t)a14 withCatalogMetadata:(id)a15 withSpaceCheckedUUID:(id)a16;
- (void)registerAssetDownloadJob:(id)a3 withPurpose:(id)a4 usingDownloadOptions:(id)a5 forAssetId:(id)a6 withBase:(id)a7 relativeTo:(id)a8 startingAt:(id)a9 withLength:(id)a10 extractWith:(id)a11 allocateExtractorIfNecessary:(BOOL)a12 usingXPCConnection:(id)a13 withXPCMessage:(id)a14 clientName:(id)a15 performingAutoAssetJob:(id)a16 notify:(unint64_t)a17 withCatalogMetadata:(id)a18 withSpaceCheckedUUID:(id)a19;
- (void)registerCatalogDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 usingDownloadOptions:(id)a6 forAutoAssetName:(id)a7;
- (void)registerCatalogDownloadJob:(id)a3 withPurpose:(id)a4 usingDownloadOptions:(id)a5 usingXPCConnection:(id)a6 withXPCMessage:(id)a7 performingAutoAssetJob:(id)a8 asClientName:(id)a9;
- (void)registerPmvDownloadJob:(id)a3 using:(id)a4 with:(id)a5 clientName:(id)a6;
- (void)registerXmlDownloadJob:(id)a3 using:(id)a4 with:(id)a5 clientName:(id)a6;
- (void)reportDownloadAttemptResult:(id)a3 with:(int64_t)a4;
- (void)retryTask:(id)a3 retryUrl:(id)a4 modified:(id)a5 clientName:(id)a6;
- (void)sendDownloadCannotStartResult:(int64_t)a3 assetType:(id)a4 connection:(id)a5 requestMessage:(id)a6 clientName:(id)a7 autoAssetJobID:(id)a8 ofJobType:(id)a9 underlyingError:(id)a10;
- (void)sendDownloadResult:(id)a3 with:(int64_t)a4 extraInfo:(id)a5;
- (void)sendEvents:(id)a3 sessionId:(id)a4;
- (void)sendNotification:(id)a3;
- (void)sendNotification:(id)a3 suffix:(id)a4;
- (void)setAuthPallasBAACertManager:(id)a3;
- (void)setAuthPallasSession:(id)a3;
- (void)setAuthPallasSessionDelegate:(id)a3;
- (void)setBackgroundDiscretionaryConfiguration:(id)a3;
- (void)setBackgroundSession:(id)a3;
- (void)setBrainVersion:(id)a3;
- (void)setCachedMetaDataForAssetType:(id)a3;
- (void)setCheckMadeForBeforeFirstUnlock:(BOOL)a3;
- (void)setCurrentSplunkEvent:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setCurrentlyBatchingSplunk:(BOOL)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDedupNSURLSessionSyncQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceBeforeFirstUnlock:(BOOL)a3;
- (void)setDeviceStatusQueue:(id)a3;
- (void)setDownloadStateQueue:(id)a3;
- (void)setDownloadTasksInFlight:(id)a3;
- (void)setForceDaemonBusy:(BOOL)a3;
- (void)setHaveSyncedSplunkData:(BOOL)a3;
- (void)setHaveSyncedSplunkState:(BOOL)a3;
- (void)setInProcessConfig:(id)a3;
- (void)setInProcessSession:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPallasSession:(id)a3;
- (void)setPallasVerifier:(id)a3;
- (void)setPerformingNSURLSessionSync:(BOOL)a3;
- (void)setPreviousBatchedFailureEvent:(id)a3 inSendEventsByUUID:(id)a4;
- (void)setPreviousTimeEstimatePoint:(id)a3;
- (void)setSplunkDelegate:(id)a3;
- (void)setSplunkOperationQueue:(id)a3;
- (void)setSplunkSession:(id)a3;
- (void)setSplunkStateQueue:(id)a3;
- (void)setSplunkUrl:(id)a3;
- (void)setSsoQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerHandler:(id)a3;
- (void)setTimerRunning:(BOOL)a3;
- (void)setTrainName:(id)a3;
- (void)startDownloadAndUpdateState:(id)a3 for:(id)a4 modified:(id)a5 options:(id)a6 using:(id)a7 with:(id)a8 clientName:(id)a9 autoAssetJob:(id)a10 ofJobType:(id)a11;
- (void)startDownloadAndUpdateState:(id)a3 for:(id)a4 startingAt:(id)a5 withLength:(id)a6 extractWith:(id)a7 modified:(id)a8 options:(id)a9 downloadSize:(int64_t)a10 using:(id)a11 with:(id)a12 clientName:(id)a13 autoAssetJob:(id)a14 ofJobType:(id)a15 notify:(unint64_t)a16 spaceCheckedUUID:(id)a17;
- (void)startDownloadTimer;
- (void)stopTimerIfNoDownloadsInProgress;
- (void)syncSplunkTasks;
- (void)taskFinishedUpdateState:(id)a3 with:(int64_t)a4;
- (void)taskFinishedUpdateState:(id)a3 with:(int64_t)a4 extraInfo:(id)a5;
- (void)updateEstimateInfo:(double)a3;
- (void)updateProgressIfRequired:(id)a3 totalWritten:(int64_t)a4 totalExpected:(int64_t)a5 notify:(BOOL)a6;
- (void)updateStateAndNotifyIfRequired;
@end

@implementation DownloadManager

void __37__DownloadManager_startDownloadTimer__block_invoke_2(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) previousTimeEstimatePoint]);

  if (v2)
  {
    [v8 timeIntervalSinceReferenceDate];
    double v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) previousTimeEstimatePoint]);
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v4 - v6;

    [*(id *)(a1 + 32) updateEstimateInfo:v7];
  }

  [*(id *)(a1 + 32) setPreviousTimeEstimatePoint:v8];
  [*(id *)(a1 + 32) stopTimerIfNoDownloadsInProgress];
}

- (NSDate)previousTimeEstimatePoint
{
  return self->_previousTimeEstimatePoint;
}

- (void)updateEstimateInfo:(double)a3
{
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __38__DownloadManager_updateEstimateInfo___block_invoke;
  v4[3] = &unk_34E648;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(downloadStateQueue, v4);
}

- (void)setPreviousTimeEstimatePoint:(id)a3
{
}

- (void)stopTimerIfNoDownloadsInProgress
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_downloadTasksInFlight, "allKeys"));
  id v4 = [v3 count];

  if (!v4)
  {
    self->_timerRunning = 0;
    if (self->_timer)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager stopTimerIfNoDownloadsInProgress]",  @"Stopping timer as there are no more downloads in flight",  v5,  v6,  v7,  v8,  v9);
      dispatch_suspend((dispatch_object_t)self->_timer);
    }
  }

void __38__DownloadManager_updateEstimateInfo___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);

  if (v10)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadTasksInFlight", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allValues]);

    id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        v20 = 0LL;
        do
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v20);
          v22 = objc_autoreleasePoolPush();
          if (*(double *)(a1 + 40) > 0.0) {
            objc_msgSend( v21,  "addNewRateDataPoint:",  (double)(uint64_t)objc_msgSend(v21, "totalBytesThisSlice") / *(double *)(a1 + 40));
          }
          v23 = *(void **)(a1 + 32);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v21 taskDescriptor]);
          objc_msgSend( v23,  "updateProgressIfRequired:totalWritten:totalExpected:notify:",  v24,  objc_msgSend(v21, "currentTotalWritten"),  objc_msgSend(v21, "totalExpectedBytes"),  1);

          objc_autoreleasePoolPop(v22);
          v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v18);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager updateEstimateInfo:]_block_invoke",  @"Cannot process interval data",  v11,  v12,  v13,  v14,  a9);
  }

- (NSMutableDictionary)downloadTasksInFlight
{
  return self->_downloadTasksInFlight;
}

- (void)updateProgressIfRequired:(id)a3 totalWritten:(int64_t)a4 totalExpected:(int64_t)a5 notify:(BOOL)a6
{
  id v10 = a3;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __78__DownloadManager_updateProgressIfRequired_totalWritten_totalExpected_notify___block_invoke;
  block[3] = &unk_34EF10;
  block[4] = self;
  id v14 = v10;
  int64_t v15 = a5;
  int64_t v16 = a4;
  BOOL v17 = a6;
  id v12 = v10;
  dispatch_async(downloadStateQueue, block);
}

void __78__DownloadManager_updateProgressIfRequired_totalWritten_totalExpected_notify___block_invoke( uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (v3)
  {
    [v3 currentEstimate];
    double v5 = v4;
    [v3 setTotalExpectedBytes:*(void *)(a1 + 48)];
    [v3 updateDownloadData:*(void *)(a1 + 56)];
    if (*(_BYTE *)(a1 + 64))
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v3 callbacks]);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v24;
        uint64_t v20 = *(void *)v24;
        do
        {
          uint64_t v9 = 0LL;
          id v21 = v7;
          do
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(obj);
            }
            id v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v9);
            uint64_t v11 = objc_autoreleasePoolPush();
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 safeStringForKey:@"downloadManagerAutoAssetJobIDKey"]);
            if (v12)
            {
              uint64_t v13 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetProgress);
              -[MAAutoAssetProgress setTotalExpectedBytes:](v13, "setTotalExpectedBytes:", *(void *)(a1 + 48));
              -[MAAutoAssetProgress setTotalWrittenBytes:](v13, "setTotalWrittenBytes:", *(void *)(a1 + 56));
              -[MAAutoAssetProgress setIsStalled:](v13, "setIsStalled:", [v3 isStalled]);
              -[MAAutoAssetProgress setExpectedTimeRemainingSecs:](v13, "setExpectedTimeRemainingSecs:", v5);
              +[MADAutoAssetControlManager assetDownloadJob:progressReport:]( &OBJC_CLASS___MADAutoAssetControlManager,  "assetDownloadJob:progressReport:",  v12,  v13);
            }

            else
            {
              uint64_t v13 = (MAAutoAssetProgress *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"downloadManagerConnectionKey"]);
              xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
              int64_t v15 = *(void **)(a1 + 40);
              if (v15) {
                xpc_dictionary_set_string( v14, "taskDescriptor", (const char *)[v15 UTF8String]);
              }
              xpc_dictionary_set_int64(v14, "totalWritten", *(void *)(a1 + 56));
              xpc_dictionary_set_int64(v14, "TotalExpected", *(void *)(a1 + 48));
              xpc_dictionary_set_double(v14, "TimeEstimate", v5);
              xpc_dictionary_set_BOOL(v14, "IsStalled", (BOOL)[v3 isStalled]);
              xpc_dictionary_set_int64(v14, "messageAction", 11LL);
              int64_t v16 = v3;
              BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v3 task]);
              id v18 = objc_claimAutoreleasedReturnValue([v17 description]);
              uint64_t v19 = (const char *)[v18 cStringUsingEncoding:1];

              if (v19) {
                xpc_dictionary_set_string(v14, "TaskID", v19);
              }
              xpc_connection_send_message(v13, v14);

              double v3 = v16;
              uint64_t v8 = v20;
              id v7 = v21;
            }

            objc_autoreleasePoolPop(v11);
            uint64_t v9 = (char *)v9 + 1;
          }

          while (v7 != v9);
          id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v7);
      }
    }
  }
}

- (id)newAssetAudience:(BOOL)a3 assetType:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5)
  {
    unsigned int v6 = [&off_38FB38 containsObject:v5];
    if (v6) {
      id v7 = @"MobileAssetAssetAudience";
    }
    else {
      id v7 = @"MobileAssetAssetAudienceGeneric";
    }
  }

  else
  {
    unsigned int v6 = 0;
    id v7 = @"MobileAssetAssetAudience";
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0
    && ([v5 isEqualToString:&stru_355768] & 1) == 0)
  {
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"MobileAssetAssetAudience",  v5));
    id v26 = _MAPreferencesCopyValue(v25);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v26);

    if (v9)
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v9, v27) & 1) != 0)
      {
LABEL_11:
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0) {
          goto LABEL_31;
        }
        if (v4) {
          goto LABEL_13;
        }
LABEL_21:
        int v24 = MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL);

        if (v24 == 7)
        {
          if (v6) {
            uint64_t v9 = @"0322D49D-D558-4DDF-BDFF-C0443D0E6FAC";
          }
          else {
            uint64_t v9 = @"33c017cc-b820-4b88-8917-6776d7f42b66";
          }
        }

        else if (v6)
        {
          uint64_t v9 = @"356d9da0-eee4-4c6c-bbe5-99b60eadddf0";
        }

        else
        {
          uint64_t v9 = @"fe6f26f9-ec98-46d2-8faf-565375a83ba7";
        }

        goto LABEL_31;
      }
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = _MAPreferencesCopyValue(v7);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    uint64_t v9 = (__CFString *)v11;
    goto LABEL_11;
  }

  uint64_t v9 = 0LL;
  if (!v4) {
    goto LABEL_21;
  }
LABEL_13:
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "$RC_PALLAS_ID"));
  id v18 = v17;
  if (!v17
    || ([v17 isEqualToString:&stru_355768] & 1) != 0
    || ([v18 isEqualToString:@"$RC_PALLAS_ID"] & 1) != 0)
  {
    int v23 = isExternalPreReleaseAssetType(v5);

    if (v23) {
      uint64_t v9 = @"0206c249-b301-46e0-9d6a-23ce9c5d875d";
    }
    else {
      uint64_t v9 = @"ce9c2203-903b-4fb3-9f03-040dc2202694";
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager newAssetAudience:assetType:]",  @"Override of asset audience due to build variable: %@",  v19,  v20,  v21,  v22,  (uint64_t)v18);
    v29 = v18;

    uint64_t v9 = v29;
  }

LABEL_31:
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager newAssetAudience:assetType:]",  @"Using asset audience '%@' via selection '%@' for asset type '%@'",  v13,  v14,  v15,  v16,  (uint64_t)v9);

  return v9;
}

+ (BOOL)isDeviceBeforeFirstUnlock
{
  id DownloadManager = getDownloadManager();
  double v3 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 deviceStatusQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__DownloadManager_isDeviceBeforeFirstUnlock__block_invoke;
  block[3] = &unk_34F088;
  id v5 = v3;
  id v14 = v5;
  uint64_t v15 = &v17;
  uint64_t v16 = &v21;
  dispatch_sync(v4, block);

  if (*((_BYTE *)v18 + 24))
  {
    _MobileAssetLog( 0LL,  5,  (uint64_t)"+[DownloadManager isDeviceBeforeFirstUnlock]",  @"{isDeviceBeforeFirstUnlock} Performing initial NSURLSession sync on first detection of device not before first-unlock | MA_MILESTONE",  v6,  v7,  v8,  v9,  v12);
    [v5 queryNSUrlSessiondAndUpdateState];
    [v5 syncSplunkTasks];
  }

  char v10 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

- (OS_dispatch_queue)deviceStatusQueue
{
  return self->_deviceStatusQueue;
}

id __44__DownloadManager_isDeviceBeforeFirstUnlock__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) deviceBeforeFirstUnlock])
  {
    if (!_MAPreferencesIsInternalAllowed()
      || (char v4 = 0,
          _MAPreferencesSync( @"isDeviceBeforeFirstUnlock",  @"have not detected first-unlock since MA daemon startup"),  unsigned int AppBooleanValue = _MAPreferencesGetAppBooleanValue(@"ForceBeforeFirstUnlock", &v4),  !v4)
      || !AppBooleanValue)
    {
      if (!MKBDeviceFormattedForContentProtection() || MKBDeviceUnlockedSinceBoot() == 1)
      {
        [*(id *)(a1 + 32) setDeviceBeforeFirstUnlock:0];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      }
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) deviceBeforeFirstUnlock];
  if (([*(id *)(a1 + 32) checkMadeForBeforeFirstUnlock] & 1) == 0
    && ([*(id *)(a1 + 32) deviceBeforeFirstUnlock] & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  return [*(id *)(a1 + 32) setCheckMadeForBeforeFirstUnlock:1];
}

- (BOOL)deviceBeforeFirstUnlock
{
  return self->_deviceBeforeFirstUnlock;
}

- (BOOL)checkMadeForBeforeFirstUnlock
{
  return self->_checkMadeForBeforeFirstUnlock;
}

- (void)setCheckMadeForBeforeFirstUnlock:(BOOL)a3
{
  self->_checkMadeForBeforeFirstUnlock = a3;
}

- (void)allDownloading:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DownloadManager downloadStateQueue](self, "downloadStateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __34__DownloadManager_allDownloading___block_invoke;
  v7[3] = &unk_34ED80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)downloadStateQueue
{
  return self->_downloadStateQueue;
}

void __34__DownloadManager_allDownloading___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadTasksInFlight", 0));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7);
        uint64_t v9 = objc_autoreleasePoolPush();
        if (isAssetTaskDescriptor(v8))
        {
          char v10 = (void *)objc_claimAutoreleasedReturnValue([v8 pathExtension]);
          -[NSMutableSet addObject:](v2, "addObject:", v10);
        }

        objc_autoreleasePoolPop(v9);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)cancelAllDownloading:(id)a3 withPurpose:(id)a4 includingAssets:(BOOL)a5 includingCatalog:(BOOL)a6 includingOther:(BOOL)a7 clientName:(id)a8 then:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = (void (**)(id, void))a9;
  int64_t v23 = -[DownloadManager currentState](self, "currentState");
  if (v23 != 1)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager cancelAllDownloading:withPurpose:includingAssets:includingCatalog:includingOther:clientName:then:]",  @"%@ proceeding before cancel happens. Cannot get in-flight downloads state: %ld for %@ with purpose: %@",  v19,  v20,  v21,  v22,  (uint64_t)v17);
    v18[2](v18, 0LL);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __116__DownloadManager_cancelAllDownloading_withPurpose_includingAssets_includingCatalog_includingOther_clientName_then___block_invoke;
  v28[3] = &unk_34EDA8;
  BOOL v33 = v23 != 1;
  id v29 = v17;
  id v30 = v15;
  BOOL v34 = a6;
  BOOL v35 = a5;
  BOOL v36 = a7;
  id v31 = v16;
  id v32 = v18;
  char v24 = v18;
  id v25 = v16;
  id v26 = v15;
  id v27 = v17;
  -[DownloadManager getCurrentInflightDownloads:](self, "getCurrentInflightDownloads:", v28);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)getCurrentInflightDownloads:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]",  @"[%s] Attempting to fetch current inflight downloads",  v5,  v6,  v7,  v8,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]");
  if ((backgroundDownloadsPossibleWithInfo(0LL) & 1) != 0)
  {
    backgroundSession = self->_backgroundSession;
    if (!backgroundSession)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]",  @"[%s] No background session present for fetching inflight downloads",  v9,  v10,  v11,  v12,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]");
      v4[2](v4, 0LL);
      goto LABEL_7;
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __47__DownloadManager_getCurrentInflightDownloads___block_invoke_2;
    v16[3] = &unk_34EE48;
    v16[4] = self;
    id v17 = v4;
    -[NSURLSession getAllTasksWithCompletionHandler:](backgroundSession, "getAllTasksWithCompletionHandler:", v16);
    __int128 v14 = v17;
  }

  else
  {
    downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __47__DownloadManager_getCurrentInflightDownloads___block_invoke;
    block[3] = &unk_34ED80;
    void block[4] = self;
    uint64_t v19 = v4;
    dispatch_async(downloadStateQueue, block);
    __int128 v14 = v19;
  }

LABEL_7:
}

void __47__DownloadManager_getCurrentInflightDownloads___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 count];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke_2",  @"[%s] Sync with NSURLSession is complete and found %lu tasks",  v4,  v5,  v6,  v7,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke_2");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(dispatch_queue_s **)(v8 + 120);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __47__DownloadManager_getCurrentInflightDownloads___block_invoke_3;
  block[3] = &unk_34DBC0;
  void block[4] = v8;
  dispatch_async(v9, block);
}

void __47__DownloadManager_getCurrentInflightDownloads___block_invoke_3(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) allKeys]);
  [v2 count];

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke_3",  @"[%s] Size of _downloadTasksInFlight: %ld",  v3,  v4,  v5,  v6,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke_3");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 24LL);
  uint64_t v8 = (char *)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    __int128 v13 = v8;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v7);
        }
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke_3",  @"[%s] Downloading: %@",  v9,  v10,  v11,  v12,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke_3");
        ++v15;
      }

      while (v13 != v15);
      __int128 v13 = (char *)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

- (int)triggerVPN
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __29__DownloadManager_triggerVPN__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  if (triggerVPN_once != -1) {
    dispatch_once(&triggerVPN_once, block);
  }
  return triggerVPN_status;
}

void __29__DownloadManager_triggerVPN__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/private/var/run/MobileAssetCritialDomainsUpdated.plist"));
  id v45 = 0LL;
  uint64_t v3 = -[NSMutableDictionary initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfURL:error:",  v2,  &v45);
  id v4 = v45;
  uint64_t v9 = v4;
  if (v3) {
    BOOL v10 = v4 == 0LL;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"BrainVersion"));
    if (v12)
    {
      __int128 v13 = (void *)v12;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"BrainVersion"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) brainVersion]);
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) != 0)
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager triggerVPN]_block_invoke",  @"Not updating CriticalDomains(already updated since boot)",  v17,  v18,  v19,  v20,  v42);
        triggerVPN_status = 0;
        goto LABEL_16;
      }
    }

    uint64_t v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) brainVersion]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"BrainVersion"));
    if (v25)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v3,  "objectForKeyedSubscript:",  @"BrainVersion"));
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager triggerVPN]_block_invoke",  @"Updating CriticalDomains(Brain version changed: Current: %@ previous: %@)",  v26,  v27,  v28,  v29,  (uint64_t)v11);
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager triggerVPN]_block_invoke",  @"Updating CriticalDomains(Brain version changed: Current: %@ previous: %@)",  v21,  v22,  v23,  v24,  (uint64_t)v11);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager triggerVPN]_block_invoke",  @"Updating CriticalDomains(first launch since boot)",  v5,  v6,  v7,  v8,  v42);
    uint64_t v11 = v3;
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) brainVersion]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v30, @"BrainVersion");

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager triggerVPN]_block_invoke",  @"Writing CriticalDomains cookie file : %@",  v31,  v32,  v33,  v34,  (uint64_t)v3);
  id v44 = 0LL;
  -[NSMutableDictionary writeToURL:error:](v3, "writeToURL:error:", v2, &v44);
  id v35 = v44;
  v40 = v35;
  if (v35) {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager triggerVPN]_block_invoke",  @"Could not write back CriticalDomainsCookie file: %@",  v36,  v37,  v38,  v39,  (uint64_t)v35);
  }
  xpc_object_t v41 = xpc_array_create(0LL, 0LL);
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "cheeserolling.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "woolyjumper.sd.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "basejumper.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "basejumper-vip.sd.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "basejumper.sd.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "locksmith.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "gdmf-staging-int.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "pallas-uat.rno.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "pr2-pallas-staging-int-prz.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "livability-api.swe.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "wkms.sd.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "wkms-uat.sd.apple.com");
  xpc_array_set_string(v41, 0xFFFFFFFFFFFFFFFFLL, "knox.sd.apple.com");
  triggerVPN_status = NEHelperSettingsSetArray("CriticalDomains", v41);

LABEL_16:
}

- (DownloadManager)init
{
  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS___DownloadManager;
  v2 = -[DownloadManager init](&v73, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_timerRunning = 0;
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    currentSplunkEvent = v3->_currentSplunkEvent;
    v3->_currentSplunkEvent = v4;

    *(_WORD *)&v3->_haveSyncedSplunkData = 0;
    BOOL v72 = 0;
    uint64_t v6 = backgroundDownloadsPossibleWithInfo(&v72);
    if ((_DWORD)v6)
    {
      v3->_haveSyncedSplunkState = 0;
      if (v72) {
        uint64_t v11 = @"should have been forced inProc";
      }
      else {
        uint64_t v11 = &stru_355768;
      }
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager init]",  @"backgroundDownloadsPossible: 1 %@",  v7,  v8,  v9,  v10,  (uint64_t)v11);
    }

    else
    {
      v3->_haveSyncedSplunkState = 1;
      _MobileAssetLog( v6,  6,  (uint64_t)"-[DownloadManager init]",  @"backgroundDownloadsPossible: 1 forced inProc: %d",  v7,  v8,  v9,  v10,  v72);
    }

    uint64_t v12 = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://xp.apple.com/report/2/psr_ota");
    splunkUrl = v3->_splunkUrl;
    v3->_splunkUrl = v12;

    uint64_t v14 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
    id v15 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v15;

    -[NSDateFormatter setDateFormat:](v3->_dateFormatter, "setDateFormat:", @"yyyy-MM-dd");
    -[NSDateFormatter setLocale:](v3->_dateFormatter, "setLocale:", v14);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneForSecondsFromGMT:]( &OBJC_CLASS___NSTimeZone,  "timeZoneForSecondsFromGMT:",  0LL));
    -[NSDateFormatter setTimeZone:](v3->_dateFormatter, "setTimeZone:", v17);

    uint64_t v18 = objc_opt_new(&OBJC_CLASS___PallasResponseVerifier);
    pallasVerifier = v3->_pallasVerifier;
    v3->_pallasVerifier = v18;

    v3->_currentState = 0LL;
    v3->_forceDaemonBusy = 0;
    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.MobileAsset.daemon.download.deviceStatus", v21);
    deviceStatusQueue = v3->_deviceStatusQueue;
    v3->_deviceStatusQueue = (OS_dispatch_queue *)v22;

    dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.MobileAsset.daemon.download.state", v25);
    downloadStateQueue = v3->_downloadStateQueue;
    v3->_downloadStateQueue = (OS_dispatch_queue *)v26;

    dispatch_queue_attr_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v29 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v28);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.MobileAsset.daemon.download.dedupNSURLSessionSync", v29);
    dedupNSURLSessionSyncQueue = v3->_dedupNSURLSessionSyncQueue;
    v3->_dedupNSURLSessionSyncQueue = (OS_dispatch_queue *)v30;

    dispatch_queue_attr_t v32 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v33 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v32);
    dispatch_queue_t v34 = dispatch_queue_create("com.apple.MobileAsset.daemon.sso", v33);
    ssoQueue = v3->_ssoQueue;
    v3->_ssoQueue = (OS_dispatch_queue *)v34;

    dispatch_queue_attr_t v36 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v37 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v36);
    dispatch_queue_t v38 = dispatch_queue_create("com.apple.MobileAsset.daemon.splunk.state", v37);
    splunkStateQueue = v3->_splunkStateQueue;
    v3->_splunkStateQueue = (OS_dispatch_queue *)v38;

    v40 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    downloadTasksInFlight = v3->_downloadTasksInFlight;
    v3->_downloadTasksInFlight = v40;

    cachedMetaDataForAssetType = v3->_cachedMetaDataForAssetType;
    v3->_cachedMetaDataForAssetType = 0LL;

    backgroundDiscretionaryConfiguration = v3->_backgroundDiscretionaryConfiguration;
    v3->_backgroundDiscretionaryConfiguration = 0LL;

    inProcessConfig = v3->_inProcessConfig;
    v3->_inProcessConfig = 0LL;

    delegate = v3->_delegate;
    v3->_delegate = 0LL;

    splunkDelegate = v3->_splunkDelegate;
    v3->_splunkDelegate = 0LL;

    pallasSession = v3->_pallasSession;
    v3->_pallasSession = 0LL;

    inProcessSession = v3->_inProcessSession;
    v3->_inProcessSession = 0LL;

    backgroundSession = v3->_backgroundSession;
    v3->_backgroundSession = 0LL;

    splunkSession = v3->_splunkSession;
    v3->_splunkSession = 0LL;

    timer = v3->_timer;
    v3->_timer = 0LL;

    id timerHandler = v3->_timerHandler;
    v3->_id timerHandler = 0LL;

    previousTimeEstimatePoint = v3->_previousTimeEstimatePoint;
    v3->_previousTimeEstimatePoint = 0LL;

    v54 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v54;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    v56 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    splunkOperationQueue = v3->_splunkOperationQueue;
    v3->_splunkOperationQueue = v56;

    -[NSOperationQueue setMaxConcurrentOperationCount:]( v3->_splunkOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    if (_MAPreferencesIsInternalAllowed())
    {
      id v58 = _MAPreferencesCopyValue(@"MABrainForceStartupBusy");
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      if (v59)
      {
        uint64_t v60 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0 && (int)[v59 intValue] >= 1)
        {
          id v61 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Forcing MA Brain to be busy during startup for %@ seconds", v59));
          id v62 = [v61 UTF8String];
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager init]",  @"[MAB] %s",  v63,  v64,  v65,  v66,  (uint64_t)v62);

          v3->_forceDaemonBusy = 1;
          dispatch_time_t v67 = dispatch_time(0, 1000000000 * (void)[v59 unsignedLongValue]);
          v68 = (dispatch_queue_s *)v3->_downloadStateQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = __23__DownloadManager_init__block_invoke;
          block[3] = &unk_34DBC0;
          v71 = v3;
          dispatch_after(v67, v68, block);
        }
      }
    }

    *(_WORD *)&v3->_checkMadeForBeforeFirstUnlock = 256;
    v3->_performingNSURLSessionSync = 0;
  }

  return v3;
}

void *__23__DownloadManager_init__block_invoke(uint64_t a1)
{
  id v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"MA Brain force busy timer fired - allowing downloads now (%ld)", *(void *)(*(void *)(a1 + 32) + 144LL)));
  id v3 = [v2 UTF8String];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager init]_block_invoke",  @"[MAB] %s",  v4,  v5,  v6,  v7,  (uint64_t)v3);

  *(_BYTE *)(*(void *)(a1 + 32) + 15LL) = 0;
  result = *(void **)(a1 + 32);
  if (result[18] == 3LL) {
    return [result updateStateAndNotifyIfRequired];
  }
  return result;
}

- (id)getUserAgentStringForClient:(id)a3 withAssetType:(id)a4
{
  uint64_t v6 = (__CFString *)a4;
  uint64_t v7 = (__CFString *)a3;
  uint64_t v8 = (__CFString *)MGCopyAnswer(@"BuildVersion", 0LL);
  brainVersion = (const __CFString *)self->_brainVersion;
  if (!brainVersion) {
    brainVersion = @"unknownVersion";
  }
  uint64_t v10 = @"unknownClient";
  if (v7) {
    uint64_t v10 = v7;
  }
  uint64_t v11 = @"unknownAssetType";
  if (v6) {
    uint64_t v11 = v6;
  }
  uint64_t v12 = @"unknownBuildVersion";
  if (v8) {
    uint64_t v12 = v8;
  }
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAsset/%s MAClient/%@ MABrain/%@ MAAssetType/%@ BuildVersion/%@",  "1",  v10,  brainVersion,  v11,  v12));

  return v13;
}

- (void)startDownloadTimer
{
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __37__DownloadManager_startDownloadTimer__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  dispatch_async(downloadStateQueue, block);
}

void __37__DownloadManager_startDownloadTimer__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);

  if (v2)
  {
    if (([*(id *)(a1 + 32) timerRunning] & 1) == 0)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTimer]_block_invoke",  @"Starting Download Timer",  v7,  v8,  v9,  v10,  (uint64_t)v21);
      [*(id *)(a1 + 32) setTimerRunning:1];
      uint64_t v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
      dispatch_source_set_timer(v11, 0LL, 0x3B9ACA00uLL, 0LL);

      [*(id *)(a1 + 32) updateEstimateInfo:0.0];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [*(id *)(a1 + 32) setPreviousTimeEstimatePoint:v12];

      [*(id *)(a1 + 32) setTimerRunning:1];
      dispatch_queue_t v22 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
      dispatch_resume(v22);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTimer]_block_invoke",  @"Creating Download Timer",  v3,  v4,  v5,  v6,  (uint64_t)v21);
    __int128 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadStateQueue]);
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v13);
    [*(id *)(a1 + 32) setTimer:v14];

    id v15 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
    dispatch_source_set_timer(v15, 0LL, 0x3B9ACA00uLL, 0LL);

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __37__DownloadManager_startDownloadTimer__block_invoke_2;
    v23[3] = &unk_34DBC0;
    v23[4] = *(void *)(a1 + 32);
    unsigned __int8 v16 = objc_retainBlock(v23);
    id v17 = [v16 copy];
    [*(id *)(a1 + 32) setTimerHandler:v17];

    uint64_t v18 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timerHandler]);
    dispatch_source_set_event_handler(v18, v19);

    [*(id *)(a1 + 32) updateEstimateInfo:0.0];
    [*(id *)(a1 + 32) setTimerRunning:1];
    dispatch_queue_attr_t v20 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) timer]);
    dispatch_activate(v20);
  }

- (void)initializeSessionsAsync
{
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __42__DownloadManager_initializeSessionsAsync__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  dispatch_async(downloadStateQueue, block);
}

void __42__DownloadManager_initializeSessionsAsync__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  v52 = -[DownloaderSessionDelegate initWithDownloadManager:]( objc_alloc(&OBJC_CLASS___DownloaderSessionDelegate),  "initWithDownloadManager:",  *(void *)(a1 + 32));
  -[DownloaderSessionDelegate invalidateStaleBackgroundSessionsIfNeeded]( v52,  "invalidateStaleBackgroundSessionsIfNeeded");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [*(id *)(a1 + 32) setInProcessConfig:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessConfig]);
  [v10 setTimeoutIntervalForRequest:300.0];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessConfig]);
  objc_msgSend(v11, "set_downloadFileProtectionType:", NSFileProtectionNone);

  uint64_t v12 = -[SplunkSessionDelegate initWithDownloadManager:]( objc_alloc(&OBJC_CLASS___SplunkSessionDelegate),  "initWithDownloadManager:",  *(void *)(a1 + 32));
  [*(id *)(a1 + 32) setSplunkDelegate:v12];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessConfig]);
  dispatch_source_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v13));
  [*(id *)(a1 + 32) setPallasSession:v14];

  id v15 = -[MAKeyManagerDownloadSessionDelegate initWithName:]( objc_alloc(&OBJC_CLASS___MAKeyManagerDownloadSessionDelegate),  "initWithName:",  @"AuthPallasSession");
  [*(id *)(a1 + 32) setAuthPallasSessionDelegate:v15];

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessConfig]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authPallasSessionDelegate]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authPallasSessionDelegate]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 queue]);
  dispatch_queue_attr_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v16,  v17,  v19));
  [*(id *)(a1 + 32) setAuthPallasSession:v20];

  id v21 = -[MABAACertManager initWithCertType:](objc_alloc(&OBJC_CLASS___MABAACertManager), "initWithCertType:", 0LL);
  [*(id *)(a1 + 32) setAuthPallasBAACertManager:v21];

  dispatch_queue_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessConfig]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) splunkDelegate]);
  dispatch_queue_attr_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) splunkOperationQueue]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v22,  v23,  v24));
  [*(id *)(a1 + 32) setSplunkSession:v25];

  [*(id *)(a1 + 32) setDelegate:v52];
  dispatch_queue_t v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  [*(id *)(a1 + 32) setCachedMetaDataForAssetType:v26];

  if (backgroundDownloadsPossibleWithInfo(0LL))
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[DownloaderSessionDelegate backgroundSessionID](v52, "backgroundSessionID"));
    dispatch_queue_attr_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v27));
    [*(id *)(a1 + 32) setBackgroundDiscretionaryConfiguration:v28];

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) backgroundDiscretionaryConfiguration]);
    [v29 setDiscretionary:1];

    dispatch_queue_t v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) backgroundDiscretionaryConfiguration]);
    [v30 setTimeoutIntervalForRequest:300.0];

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) backgroundDiscretionaryConfiguration]);
    objc_msgSend(v31, "set_downloadFileProtectionType:", NSFileProtectionNone);

    dispatch_queue_attr_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) backgroundDiscretionaryConfiguration]);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    dispatch_queue_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) operationQueue]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v32,  v33,  v34));
    [*(id *)(a1 + 32) setBackgroundSession:v35];

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager initializeSessionsAsync]_block_invoke",  @"Notifying clients we are not ready for download",  v36,  v37,  v38,  v39,  v50);
    notify_post("com.apple.MobileAsset.DownloadsNotReady");
    uint64_t v40 = +[DownloadManager isDeviceBeforeFirstUnlock](&OBJC_CLASS___DownloadManager, "isDeviceBeforeFirstUnlock");
    if ((_DWORD)v40)
    {
      _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager initializeSessionsAsync]_block_invoke",  @"{initializeSessionsAsync} Not performing initial NSURLSession sync since device is before first-unlock | MA_MILESTONE",  v41,  v42,  v43,  v44,  v51);
    }

    else
    {
      _MobileAssetLog( v40,  5,  (uint64_t)"-[DownloadManager initializeSessionsAsync]_block_invoke",  @"{initializeSessionsAsync} Performing initial NSURLSession sync since device is not before first-unlock | MA_MILESTONE",  v41,  v42,  v43,  v44,  v51);
      [*(id *)(a1 + 32) queryNSUrlSessiondAndUpdateState];
      [*(id *)(a1 + 32) syncSplunkTasks];
    }
  }

  else
  {
    id v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) inProcessConfig]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) operationQueue]);
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v45,  v46,  v47));
    [*(id *)(a1 + 32) setInProcessSession:v48];
  }
}

- (MADAnalyticsManager)analytics
{
  id ControlManager = getControlManager();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 analytics]);

  return (MADAnalyticsManager *)v4;
}

- (void)handleSplunkReportFinished:(id)a3 result:(BOOL)a4
{
  id v6 = a3;
  uint64_t v11 = v6;
  if (v6)
  {
    splunkStateQueue = (dispatch_queue_s *)self->_splunkStateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __53__DownloadManager_handleSplunkReportFinished_result___block_invoke;
    block[3] = &unk_34E380;
    id v15 = v6;
    unsigned __int8 v16 = self;
    BOOL v17 = a4;
    dispatch_async(splunkStateQueue, block);
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager handleSplunkReportFinished:result:]",  @"Nil fileId in splunk report",  v7,  v8,  v9,  v10,  v13);
  }
}

void __53__DownloadManager_handleSplunkReportFinished_result___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isEqualToString:@"bathFileForSendingEvents"];
  char v3 = v2;
  if (v2)
  {
    [*(id *)(a1 + 40) setCurrentlyBatchingSplunk:0];
    if (*(_BYTE *)(a1 + 48))
    {
      uint64_t v4 = @"/private/var/MobileSoftwareUpdate/MobileAsset/AssetsV2/SplunkRecords/SplunkRetry";
LABEL_6:
      id RepositoryPath = getRepositoryPath(v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
      id v25 = (id)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:*(void *)(a1 + 32)]);

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v8 = [v7 removeItemAtPath:v25 error:0];

      if ((v8 & 1) == 0) {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager handleSplunkReportFinished:result:]_block_invoke",  @"Could not remove Splunk file: %@",  v9,  v10,  v11,  v12,  (uint64_t)v25);
      }

      return;
    }
  }

  else if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v4 = @"/private/var/MobileSoftwareUpdate/MobileAsset/AssetsV2/SplunkRecords";
    goto LABEL_6;
  }

  id PathToSplunkData = getPathToSplunkData(*(void **)(a1 + 32));
  dispatch_source_t v14 = (void *)objc_claimAutoreleasedReturnValue(PathToSplunkData);
  id PathToSplunkRetry = getPathToSplunkRetry(*(void **)(a1 + 32));
  uint64_t v16 = objc_claimAutoreleasedReturnValue(PathToSplunkRetry);
  BOOL v17 = (void *)v16;
  if ((v3 & 1) == 0 && v14 && v16)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v26 = 0LL;
    unsigned __int8 v19 = [v18 moveItemAtURL:v14 toURL:v17 error:&v26];
    id v20 = v26;

    if ((v19 & 1) == 0) {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager handleSplunkReportFinished:result:]_block_invoke",  @"Could not move Splunk file: %@ to: %@ error: %@",  v21,  v22,  v23,  v24,  (uint64_t)v14);
    }
  }
}

- (BOOL)addInFailedJobs:(id)a3 finalEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v80 = v6;
  if (!v5 || !v6)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"incoming and final events cannot be nil, skipping",  v7,  v8,  v9,  v10,  v79);
LABEL_41:
    int v75 = 0;
    goto LABEL_44;
  }

  id RepositoryPath = getRepositoryPath(@"/private/var/MobileSoftwareUpdate/MobileAsset/AssetsV2/SplunkRecords/SplunkRetry");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  FailedSplunkFiles = getFailedSplunkFiles(v12);
  dispatch_source_t v14 = (void *)objc_claimAutoreleasedReturnValue(FailedSplunkFiles);

  if (![v14 count])
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"Nothing to batch",  v15,  v16,  v17,  v18,  v79);

    goto LABEL_41;
  }

  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id v19 = v14;
  id v20 = [v19 countByEnumeratingWithState:&v96 objects:v101 count:16];
  if (v20)
  {
    id v21 = v20;
    int v85 = 0;
    uint64_t v22 = *(void *)v97;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v81 = *(void *)v97;
    id v82 = v19;
    do
    {
      id v24 = 0LL;
      id v83 = v21;
      do
      {
        if (*(void *)v97 != v22) {
          objc_enumerationMutation(v19);
        }
        v89 = (char *)v24;
        uint64_t v25 = *(void *)(*((void *)&v96 + 1) + 8LL * (void)v24);
        v88 = objc_autoreleasePoolPush();
        id v26 = getRepositoryPath(@"/private/var/MobileSoftwareUpdate/MobileAsset/AssetsV2/SplunkRecords/SplunkRetry");
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        dispatch_queue_attr_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v25]);

        uint64_t v29 = v28;
        id v30 = dictionaryFromJsonFile(v28);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
        v87 = (void *)v31;
        if (v31)
        {
          uint64_t v36 = (void *)v31;
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_ivar_list defaultManager](p_ivars[187], "defaultManager"));
          uint64_t v38 = v29;
          uint64_t v39 = v37;
          v86 = v38;
          unsigned int v40 = objc_msgSend(v37, "removeItemAtPath:error:");

          if (v40)
          {
            id v45 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"events"]);
            uint64_t v50 = v45;
            if (v45)
            {
              __int128 v94 = 0u;
              __int128 v95 = 0u;
              __int128 v92 = 0u;
              __int128 v93 = 0u;
              v84 = v45;
              id obj = v45;
              id v51 = [obj countByEnumeratingWithState:&v92 objects:v100 count:16];
              v52 = &MobileAssetKeyManager__metaData.ivars;
              if (v51)
              {
                id v53 = v51;
                uint64_t v54 = *(void *)v93;
                do
                {
                  v55 = 0LL;
                  id v90 = v53;
                  do
                  {
                    if (*(void *)v93 != v54) {
                      objc_enumerationMutation(obj);
                    }
                    v56 = (NSMutableDictionary *)*(id *)(*((void *)&v92 + 1) + 8LL * (void)v55);
                    v57 = objc_autoreleasePoolPush();
                    uint64_t v58 = objc_opt_class(v52[140]);
                    if ((objc_opt_isKindOfClass(v56, v58) & 1) != 0)
                    {
                      v59 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v56);

                      v56 = v59;
                    }

                    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v56, "objectForKey:", @"eventUuid"));
                    if (v64)
                    {
                      v69 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v64]);
                      if (v69)
                      {
                        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"The event with uuid of: %@ exists already, keeping one with higher error count",  v65,  v66,  v67,  v68,  (uint64_t)v64);
                        v70 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"splunkErrorCount"]);
                        if (v70)
                        {
                          id v71 = v5;
                          BOOL v72 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v56,  "objectForKey:",  @"splunkErrorCount"));
                          ensureAndIncrementNumberAtKey(v69, @"splunkErrorCount", v72);

                          id v5 = v71;
                        }

                        else
                        {
                          ensureAndIncrementNumberAtKey(v56, @"splunkErrorCount", 0LL);
                          [v5 setObject:v56 forKey:v64];
                        }

                        v52 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
                        id v53 = v90;
                      }

                      else
                      {
                        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"adding event %@",  v65,  v66,  v67,  v68,  (uint64_t)v64);
                        [v5 setObject:v56 forKey:v64];
                      }
                    }

                    else
                    {
                      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"Skipping event, no uuid",  v60,  v61,  v62,  v63,  v79);
                    }

                    objc_autoreleasePoolPop(v57);
                    v55 = (char *)v55 + 1;
                  }

                  while (v53 != v55);
                  id v53 = [obj countByEnumeratingWithState:&v92 objects:v100 count:16];
                }

                while (v53);
              }

              ++v85;
              id v19 = v82;
              id v21 = v83;
              uint64_t v22 = v81;
              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              uint64_t v50 = v84;
            }

            else
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"Skipping file: %@ as events was nil",  v46,  v47,  v48,  v49,  v25);
            }
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"Skipping file: %@ as we could not delete it",  v41,  v42,  v43,  v44,  v25);
          }

          v74 = v88;
          objc_super v73 = v89;
          dispatch_queue_attr_t v28 = v86;
        }

        else
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addInFailedJobs:finalEvents:]",  @"Skipping file: %@ as allData was nil",  v32,  v33,  v34,  v35,  (uint64_t)v28);
          v74 = v88;
          objc_super v73 = v89;
        }

        objc_autoreleasePoolPop(v74);
        id v24 = v73 + 1;
      }

      while (v24 != v21);
      id v21 = [v19 countByEnumeratingWithState:&v96 objects:v101 count:16];
    }

    while (v21);
  }

  else
  {
    int v85 = 0;
  }

  int v75 = v85;
LABEL_44:
  BOOL v76 = v75 > 0;
  v77 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  [v80 addObjectsFromArray:v77];

  return v76;
}

- (void)sendEvents:(id)a3 sessionId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (+[DownloadManager isDeviceBeforeFirstUnlock](&OBJC_CLASS___DownloadManager, "isDeviceBeforeFirstUnlock"))
    {
      _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager sendEvents:sessionId:]",  @"{sendEvents} unable to send SPLUNK events since device is before first-unlock",  v8,  v9,  v10,  v11,  v64);
      goto LABEL_33;
    }

    uint64_t v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    if (self->_currentlyBatchingSplunk)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendEvents:sessionId:]",  @"already batching",  v12,  v13,  v14,  v15,  v64);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
      -[NSMutableArray addObjectsFromArray:](v16, "addObjectsFromArray:", v17);

      unsigned int v18 = 0;
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendEvents:sessionId:]",  @"Doing batching",  v12,  v13,  v14,  v15,  v64);
      unsigned int v18 = -[DownloadManager addInFailedJobs:finalEvents:](self, "addInFailedJobs:finalEvents:", v6, v16);
    }

    v68[0] = @"clientId";
    v68[1] = @"events";
    v69[0] = v7;
    v69[1] = v16;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  2LL));
    if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v19))
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v19,  0LL,  0LL));
      if (v24)
      {
        uint64_t v29 = (void *)v24;
        id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);

        uint64_t v66 = v31;
        if (v18)
        {
          self->_currentlyBatchingSplunk = 1;
          id PathToSplunkRetry = getPathToSplunkRetry(@"bathFileForSendingEvents");
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(PathToSplunkRetry);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 absoluteString]);
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v34));

          goto LABEL_18;
        }

        if (self->_haveSyncedSplunkState) {
          id PathToSplunkData = getPathToSplunkData(v31);
        }
        else {
          id PathToSplunkData = getPathToSplunkRetry(v31);
        }
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(PathToSplunkData);
        if (v35)
        {
LABEL_18:
          id v67 = 0LL;
          unsigned __int8 v42 = [v29 writeToURL:v35 options:1 error:&v67];
          id v36 = v67;
          if ((v42 & 1) != 0)
          {
            if (self->_haveSyncedSplunkState)
            {
              if (self->_splunkSession && self->_splunkUrl)
              {
                uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:"));
                if (v47)
                {
                  uint64_t v48 = v47;
                  [v47 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                  [v48 setValue:@"MobileAsset/1.1" forHTTPHeaderField:@"User-Agent"];
                  [v48 setHTTPMethod:@"POST"];
                  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSession uploadTaskWithRequest:fromFile:]( self->_splunkSession,  "uploadTaskWithRequest:fromFile:",  v48,  v35));
                  if (v49)
                  {
                    uint64_t v54 = v49;
                    if (v18) {
                      v55 = @"bathFileForSendingEvents";
                    }
                    else {
                      v55 = v66;
                    }
                    [v49 setTaskDescription:v55];
                    uint64_t PreferenceLong = getPreferenceLong(@"SplunkTimeout");
                    if ((PreferenceLong & 0x8000000000000000LL) == 0)
                    {
                      uint64_t v62 = v48;
                      uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  PreferenceLong));
                      [v63 doubleValue];
                      objc_msgSend(v54, "set_timeoutIntervalForResource:");

                      uint64_t v48 = v62;
                    }

                    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendEvents:sessionId:]",  @"Sending splunk event:%@",  v58,  v59,  v60,  v61,  (uint64_t)v19);
                    [v54 resume];
                  }

                  else
                  {
                    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendEvents:sessionId:]",  @"SPLUNK Failed when creating task",  v50,  v51,  v52,  v53,  v65);
                  }

                  goto LABEL_31;
                }

                v56 = @"SPLUNK Failed when creating request";
              }

              else
              {
                v56 = @"SPLUNK Failed due to nil session or url";
              }
            }

            else
            {
              v56 = @"Have not synced splunk, skipping networking";
            }

            _MobileAssetLog(0LL, 6, (uint64_t)"-[DownloadManager sendEvents:sessionId:]", v56, v43, v44, v45, v46, v65);
          }

          else
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendEvents:sessionId:]",  @"SPLUNK Failed due to writing data to file:%@ isBatch: %d with: %@",  v43,  v44,  v45,  v46,  (uint64_t)v35);
          }

- (void)configDownload:(id)a3 clientName:(id)a4 using:(id)a5 with:(id)a6
{
  id v40 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager configDownload:clientName:using:with:]",  @"In configDownload for client: %@",  v13,  v14,  v15,  v16,  (uint64_t)v10);
  id v17 = downloadManagerDecodeClasses();
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id ObjectFromMessage = getObjectFromMessage(v12, "downloadConfigLength", "downloadConfig", v18);
  uint64_t v20 = (MADownloadConfig *)objc_claimAutoreleasedReturnValue(ObjectFromMessage);

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
  {
    uint64_t v22 = -[MADownloadConfig initWithPlist:](objc_opt_new(&OBJC_CLASS___MADownloadConfig), "initWithPlist:", v20);

    -[MADownloadConfig logConfig](v22, "logConfig");
    uint64_t v20 = v22;
    if (!v22) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }

  if (v20)
  {
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___MADownloadConfig);
    if ((objc_opt_isKindOfClass(v20, v27) & 1) == 0)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager configDownload:clientName:using:with:]",  @"No options specified for download config, wrong class, skipping configDownload for: %@",  v28,  v29,  v30,  v31,  (uint64_t)v10);
      -[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]( self,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:",  2LL,  v11,  v12,  0LL,  @"config_job");
      goto LABEL_16;
    }

    -[MADownloadConfig logConfig](v20, "logConfig");
LABEL_7:
    string = xpc_dictionary_get_string(v12, "Purpose");
    if (string)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
      if (!isWellFormedPurpose(v33))
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager configDownload:clientName:using:with:]",  @"Supplied purpose for download config is not well formed, skipping configDownload for: %@",  v34,  v35,  v36,  v37,  (uint64_t)v10);
        -[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]( self,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:",  2LL,  v11,  v12,  0LL,  @"config_job");
LABEL_14:

LABEL_16:
        goto LABEL_17;
      }
    }

    else
    {
      uint64_t v33 = 0LL;
    }

    uint64_t v38 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v12, "AssetId"));
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    -[DownloadManager configAssetDownload:withPurpose:matchingAssetId:usingDownloadConfig:usingXPCConnection:withXPCMessage:performingAutoAssetJob:asClientName:]( self,  "configAssetDownload:withPurpose:matchingAssetId:usingDownloadConfig:usingXPCConnection:withXPCMessage:performingAu toAssetJob:asClientName:",  v40,  v33,  v39,  v20,  v11,  v12,  0LL,  v10);

    goto LABEL_14;
  }

  [0 logConfig];
LABEL_11:
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager configDownload:clientName:using:with:]",  @"No options specified for download config, skipping configDownload for: %@",  v23,  v24,  v25,  v26,  (uint64_t)v10);
  -[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]( self,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:",  2LL,  v11,  v12,  0LL,  @"config_job");
LABEL_17:
}

- (void)configAssetDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 matchingAssetId:(id)a6 usingDownloadConfig:(id)a7 forAutoAssetName:(id)a8
{
}

- (void)configAssetDownload:(id)a3 withPurpose:(id)a4 matchingAssetId:(id)a5 usingDownloadConfig:(id)a6 usingXPCConnection:(id)a7 withXPCMessage:(id)a8 performingAutoAssetJob:(id)a9 asClientName:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v53[0] = 0LL;
  v53[1] = v53;
  v53[2] = 0x2020000000LL;
  v53[3] = 2LL;
  uint64_t v43 = v15;
  id v30 = normalizedAssetType((uint64_t)v15, v23, v24, v25, v26, v27, v28, v29);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v41 = v16;
  id v32 = assembleTaskDescriptorWithPurposeAndAutoAssetJobID((uint64_t)v31, (uint64_t)v17, v16, v21);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __157__DownloadManager_configAssetDownload_withPurpose_matchingAssetId_usingDownloadConfig_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName___block_invoke;
  block[3] = &unk_34ECB8;
  id v45 = v33;
  uint64_t v46 = self;
  id v47 = v22;
  id v48 = v18;
  id v49 = v19;
  id v50 = v20;
  id v51 = v21;
  uint64_t v52 = v53;
  id v35 = v21;
  id v36 = v20;
  id v37 = v19;
  id v38 = v18;
  id v39 = v22;
  id v40 = v33;
  dispatch_async(downloadStateQueue, block);

  _Block_object_dispose(v53, 8);
}

id __157__DownloadManager_configAssetDownload_withPurpose_matchingAssetId_usingDownloadConfig_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName___block_invoke( uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) downloadTasksInFlight]);
    char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 32)]);

    if (v3)
    {
      [v3 changingConfig];
      else {
        uint64_t v8 = 2LL;
      }
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 task]);
      objc_msgSend(v9, "set_discretionaryOverride:", v8);

      *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0LL;
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager configAssetDownload:withPurpose:matchingAssetId:usingDownloadConfig:usingXPCConnectio n:withXPCMessage:performingAutoAssetJob:asClientName:]_block_invoke",  @"Config for client: %@ and descriptor: %@ failed as task could not be found",  v4,  v5,  v6,  v7,  *(void *)(a1 + 48));
    }
  }

  return [*(id *)(a1 + 40) indicateDownloadJobFinished:*(unsigned int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) usingXPCConnection:*(void *)(a1 + 64) withXPCMessage:*(void *)(a1 + 72) performingAutoAssetJob:*(void *)(a1 + 80) ofJobType:@"config_job"];
}

- (void)cancelAssetDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 matchingAssetId:(id)a6 forAutoAssetName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v24 = normalizedAssetType((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = assembleTaskDescriptorWithPurposeAndAutoAssetJobID((uint64_t)v25, (uint64_t)v15, v14, v12);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __100__DownloadManager_cancelAssetDownloadJob_forAssetType_withPurpose_matchingAssetId_forAutoAssetName___block_invoke;
  block[3] = &unk_34ECE0;
  id v36 = v27;
  id v37 = v12;
  id v38 = v13;
  id v39 = v14;
  id v40 = v15;
  id v41 = v16;
  unsigned __int8 v42 = self;
  id v29 = v16;
  id v30 = v15;
  id v31 = v14;
  id v32 = v13;
  id v33 = v12;
  id v34 = v27;
  dispatch_async(downloadStateQueue, block);
}

void __100__DownloadManager_cancelAssetDownloadJob_forAssetType_withPurpose_matchingAssetId_forAutoAssetName___block_invoke( uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 80) downloadTasksInFlight]);
    char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 32)]);

    uint64_t v4 = *(void *)(a1 + 40);
    if (v3)
    {
      id v5 = errorStringForMACancelDownloadResult(0LL);
      id v35 = (void *)objc_claimAutoreleasedReturnValue(v5);
      _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager cancelAssetDownloadJob:forAssetType:withPurpose:matchingAssetId:forAutoAssetName:]_block_invoke",  @"{cancelAssetDownloadJob} cancel of overallJobInfo in downloadTasksInFlight | autoAssetJobID:%@, assetType:%@, purpose:%@, assetId:%@, autoAssetName:%@ | taskDescriptor:%@ | result:%ld(%@)",  v6,  v7,  v8,  v9,  v4);

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 task]);
      [v10 cancel];

      uint64_t v37 = 0LL;
    }

    else
    {
      id v23 = errorStringForMACancelDownloadResult(3uLL);
      id v36 = (void *)objc_claimAutoreleasedReturnValue(v23);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager cancelAssetDownloadJob:forAssetType:withPurpose:matchingAssetId:forAutoAssetName:]_block_invoke",  @"{cancelAssetDownloadJob} unable to locate overallJobInfo in downloadTasksInFlight | autoAssetJobID:%@, assetType:%@, purpose:%@, assetId:%@, autoAssetName:%@ | taskDescriptor:%@ | result:%ld(%@)",  v24,  v25,  v26,  v27,  v4);

      id v33 = MAErrorForCancelDownloadResultWithUnderlying( 3uLL,  0LL,  @"cancel requested when no active download task | autoAssetJobID:%@, assetType:%@, purpose:%@, assetId:%@, autoAssetName:%@",  v28,  v29,  v30,  v31,  v32,  *(void *)(a1 + 40));
      uint64_t v37 = objc_claimAutoreleasedReturnValue(v33);
    }

    uint64_t v22 = (void *)v37;
  }

  else
  {
    *(_OWORD *)id v38 = *(_OWORD *)(a1 + 40);
    id v11 = errorStringForMACancelDownloadResult(4uLL);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v11);
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager cancelAssetDownloadJob:forAssetType:withPurpose:matchingAssetId:forAutoAssetName:]_block_invoke",  @"{cancelAssetDownloadJob} unable to assemble taskDescriptor | autoAssetJobID:%@, assetType:%@, purpose:%@, assetId:%@, autoAssetName:%@ | result:%ld(%@)",  v12,  v13,  v14,  v15,  (uint64_t)v38[0]);

    id v21 = MAErrorForCancelDownloadResultWithUnderlying( 4uLL,  0LL,  @"cancel requested with invalid parameters | autoAssetJobID:%@, assetType:%@, purpose:%@, assetId:%@, autoAssetName:%@",  v16,  v17,  v18,  v19,  v20,  *(void *)(a1 + 40));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }
}

- (void)cancelAssetDownloadTask:(id)a3
{
  id v4 = a3;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __43__DownloadManager_cancelAssetDownloadTask___block_invoke;
  v7[3] = &unk_34DB98;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(downloadStateQueue, v7);
}

void __43__DownloadManager_cancelAssetDownloadTask___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (*(void *)(a1 + 32))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) downloadTasksInFlight]);
    id v16 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:*(void *)(a1 + 32)]);

    if (v16)
    {
      _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager cancelAssetDownloadTask:]_block_invoke",  @"{cancelAssetDownloadTask} cancel of overallJobInfo in downloadTasksInFlight | taskDescriptor:%@",  v11,  v12,  v13,  v14,  *(void *)(a1 + 32));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v16 task]);
      [v15 cancel];
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager cancelAssetDownloadTask:]_block_invoke",  @"{cancelAssetDownloadTask} unable to locate overallJobInfo in downloadTasksInFlight | taskDescriptor:%@",  v11,  v12,  v13,  v14,  *(void *)(a1 + 32));
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager cancelAssetDownloadTask:]_block_invoke",  @"{cancelAssetDownloadTask} nil taskDescriptor provided",  a5,  a6,  a7,  a8,  a9);
  }

+ (id)pathToCatalogLookupServer:(id)a3 usingDownloadOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id DownloadManager = getDownloadManager();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  uint64_t IsInternalAllowed = _MAPreferencesIsInternalAllowed();
  if ([v8 getPallasEnabledForAssetType:v5])
  {
    _MAPreferencesSync(@"pathToCatalogLookupServer", v5);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[DownloadManager getPallasUrl:assetType:]( &OBJC_CLASS___DownloadManager,  "getPallasUrl:assetType:",  IsInternalAllowed,  v5));
  }

  else if (v6 && ([v6 liveServerCatalogOnly] & 1) != 0)
  {
    uint64_t v17 = 0LL;
  }

  else
  {
    id v18 = normalizedAssetType((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id StandardUrl = getStandardUrl(v5, v19);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(StandardUrl);
  }

  return v17;
}

- (void)sendDownloadCannotStartResult:(int64_t)a3 assetType:(id)a4 connection:(id)a5 requestMessage:(id)a6 clientName:(id)a7 autoAssetJobID:(id)a8 ofJobType:(id)a9 underlyingError:(id)a10
{
  id v73 = a4;
  uint64_t v16 = (_xpc_connection_s *)a5;
  xpc_object_t original = a6;
  id v71 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  BOOL v72 = self;
  v70 = self->_brainVersion;
  int64_t value = a3;
  if (a3)
  {
    uint64_t v24 = v19;
    else {
      uint64_t v25 = @"asset";
    }
    id v26 = errorStringForMADownloadResult(a3);
    uint64_t v27 = v16;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v68 = v25;
    id v19 = v24;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot start %@ download: %@(%ld)",  v68,  v28,  a3));

    uint64_t v16 = v27;
    id v35 = MAErrorForDownloadResultWithUnderlying(a3, v24, @"%@", v30, v31, v32, v33, v34, (uint64_t)v29);
    a3 = objc_claimAutoreleasedReturnValue(v35);

    if (v17) {
      goto LABEL_6;
    }
  }

  else if (v17)
  {
LABEL_6:
    if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v18, @"catalog_job"))
    {
      +[MADAutoAssetControlManager catalogDownloadJobFinished:withCatalog:error:]( &OBJC_CLASS___MADAutoAssetControlManager,  "catalogDownloadJobFinished:withCatalog:error:",  v17,  0LL,  a3);
      id v36 = @"XML";
    }

    else
    {
      +[MADAutoAssetControlManager assetDownloadJobFinished:error:]( &OBJC_CLASS___MADAutoAssetControlManager,  "assetDownloadJobFinished:error:",  v17,  a3);
      if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v18, @"PMV_job") & 1) != 0)
      {
        id v36 = @"PMV";
      }

      else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v18,  @"asset_job") & 1) != 0)
      {
        id v36 = @"ZIP";
      }

      else
      {
        unsigned int v44 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v18,  @"config_job");
        id v36 = @"CFG";
        if (!v44) {
          id v36 = 0LL;
        }
      }
    }

    v69 = v36;
    goto LABEL_22;
  }

  if (!v16)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJ obID:ofJobType:underlyingError:]",  @"Skipping due to no connection",  v20,  v21,  v22,  v23,  v67);
    v69 = 0LL;
LABEL_22:
    int64_t v43 = value;
    goto LABEL_23;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(original);
  unsigned __int8 v42 = reply;
  int64_t v43 = value;
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "Result", value);
    xpc_connection_send_message(v16, v42);
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJ obID:ofJobType:underlyingError:]",  @"Skipping due to no reply",  v38,  v39,  v40,  v41,  v67);
  }

  v69 = 0LL;
LABEL_23:
  int v75 = v18;
  BOOL v76 = v17;
  v77 = v16;
  v74 = v19;
  if (!a3)
  {
    v55 = 0LL;
    v56 = 0LL;
    v57 = 0LL;
LABEL_38:
    id v48 = @"No underlying errors";
    goto LABEL_39;
  }

  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  id v45 = (void *)objc_claimAutoreleasedReturnValue([(id)a3 underlyingErrors]);
  id v46 = [v45 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v46)
  {
    id v47 = v46;
    id v48 = 0LL;
    uint64_t v49 = *(void *)v89;
    do
    {
      for (i = 0LL; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v89 != v49) {
          objc_enumerationMutation(v45);
        }
        id v51 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)i);
        if (v48)
        {
          uint64_t v52 = objc_alloc(&OBJC_CLASS___NSString);
          uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v51 checkedDescription]);
          uint64_t v54 = -[NSString initWithFormat:](v52, "initWithFormat:", @"%@\n%@", v48, v53);

          id v48 = v54;
        }

        else
        {
          id v48 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v88 + 1)
                                                                                   + 8LL * (void)i), "checkedDescription"));
        }
      }

      id v47 = [v45 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }

    while (v47);
  }

  else
  {
    id v48 = 0LL;
  }

  v55 = -[NSNumber initWithInteger:]( [NSNumber alloc],  "initWithInteger:",  [(id)a3 checkedCode]);
  v57 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)a3 checkedDomain]);
  v56 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)a3 checkedDescription]);
  int64_t v43 = value;
  if (!v48) {
    goto LABEL_38;
  }
LABEL_39:
  uint64_t v58 = (NSNumber *)&off_38EEF0;
  if (v55) {
    uint64_t v58 = v55;
  }
  v92[0] = @"FailureErrorCode";
  v92[1] = @"FailureErrorDomain";
  uint64_t v59 = @"com.apple.MobileAssetError.Download";
  if (v57) {
    uint64_t v59 = v57;
  }
  v93[0] = v58;
  v93[1] = v59;
  v92[2] = @"FailureErrorMessage";
  v92[3] = @"FailureErrorUnderlying";
  uint64_t v60 = @"Unknown error starting download";
  if (v56) {
    uint64_t v60 = v56;
  }
  v93[2] = v60;
  v93[3] = v48;
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v93,  v92,  4LL));
  splunkStateQueue = (dispatch_queue_s *)v72->_splunkStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __137__DownloadManager_sendDownloadCannotStartResult_assetType_connection_requestMessage_clientName_autoAssetJobID_ofJobType_underlyingError___block_invoke;
  block[3] = &unk_34ED08;
  void block[4] = v72;
  id v81 = v73;
  id v85 = v61;
  int64_t v86 = v43;
  id v82 = v71;
  id v83 = (__CFString *)v69;
  BOOL v87 = v76 != 0LL;
  v84 = v70;
  id v63 = v61;
  uint64_t v64 = v70;
  id v65 = v71;
  id v66 = v73;
  dispatch_async(splunkStateQueue, block);
}

void __137__DownloadManager_sendDownloadCannotStartResult_assetType_connection_requestMessage_clientName_autoAssetJobID_ofJobType_underlyingError___block_invoke( uint64_t a1)
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) analytics]);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = stringForMADownloadResult(*(void *)(a1 + 80));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  LOBYTE(v7) = 0;
  LOWORD(v6) = *(unsigned __int8 *)(a1 + 88);
  objc_msgSend( v8,  "recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:result:analyticsFileType:isAutoDownload:is Pallas:pallasAssetAudience:isUserPriority:bytesWritten:bytesTransferredEst:brainVersion:additionalData:",  v2,  v3,  0,  0,  0,  v5,  *(void *)(a1 + 56),  v6,  0,  v7,  0,  0,  *(void *)(a1 + 64),  *(void *)(a1 + 72));
}

- (void)reportDownloadAttemptResult:(id)a3 with:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 taskDescriptor]);
  id v8 = disassembleTaskDescriptor(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"normalizedAssetType"]);
  v74 = v10;
  if (v10)
  {
    id v11 = assetTypeFromNormalized(v10);
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    v55 = &stru_355768;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Purpose"]);
  dispatch_queue_t queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue([v6 firstClientName]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 baseUrlNoACS]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 relativePath]);
  uint64_t v15 = stringForMADownloadResult(a4);
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"isXml"]);
  unsigned int v18 = [v17 intValue];
  BOOL v72 = (void *)v12;
  id v73 = v17;
  v69 = (void *)v16;
  id v71 = (void *)v13;
  if (v18 >= 6) {
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Unknown%d",  [v17 intValue]));
  }
  else {
    uint64_t v60 = *(&off_34F0A8 + (int)v18);
  }
  id v19 = [v6 currentTotalWritten];
  uint64_t v20 = (uint64_t)[v6 transferredBytesEst];
  uint64_t v67 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", v19);
  id v65 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", v20 & ~(v20 >> 63));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadStartTime]);
  id v76 = [v21 copy];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 nonDiscretionaryUpgradeTime]);
  id v23 = [v22 copy];

  unsigned __int8 v56 = [v6 isDiscretionary];
  unsigned __int8 v24 = [v6 isPallas];
  unsigned __int8 v54 = [v6 isAutoDownload];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 assetAudience]);
  id v26 = [v25 copy];

  uint64_t v27 = self;
  uint64_t v28 = self->_brainVersion;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 analyticsData]);

  int v75 = v9;
  uint64_t v62 = v28;
  uint64_t v64 = v6;
  if (!v29)
  {
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v6 options]);
    if (v38)
    {
      uint64_t v39 = (void *)v38;
      id v53 = v26;
      uint64_t v30 = v23;
      uint64_t v31 = (void *)v14;
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 analyticsData]);

      if (v41)
      {
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 options]);
        unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue([v32 analyticsData]);
        id v33 = [v42 mutableCopy];

        dispatch_queue_t v34 = queue;
        id v26 = v53;
        goto LABEL_9;
      }

      id v33 = 0LL;
      dispatch_queue_t v34 = queue;
      id v26 = v53;
    }

    else
    {
      uint64_t v30 = v23;
      uint64_t v31 = (void *)v14;
      id v33 = 0LL;
      dispatch_queue_t v34 = queue;
    }

    unsigned __int8 v35 = v24;
    unsigned __int8 v36 = v56;
    unsigned __int8 v37 = v54;
    goto LABEL_16;
  }

  uint64_t v30 = v23;
  uint64_t v31 = (void *)v14;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v6 analyticsData]);
  id v33 = [v32 copy];
  dispatch_queue_t v34 = queue;
LABEL_9:
  unsigned __int8 v35 = v24;
  unsigned __int8 v36 = v56;
  unsigned __int8 v37 = v54;

LABEL_16:
  queuea = (dispatch_queue_s *)v27->_splunkStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __52__DownloadManager_reportDownloadAttemptResult_with___block_invoke;
  block[3] = &unk_34ED30;
  v57 = v33;
  id v78 = v33;
  id v79 = v76;
  unsigned __int8 v93 = v36;
  id v80 = v30;
  id v81 = v27;
  id v82 = v55;
  dispatch_queue_t v83 = v34;
  dispatch_queue_t v43 = v34;
  id v84 = v71;
  id v85 = v31;
  id v86 = v72;
  id v87 = v69;
  unsigned __int8 v94 = v37;
  unsigned __int8 v95 = v35;
  id v88 = v60;
  id v89 = v26;
  __int128 v90 = v67;
  __int128 v91 = v65;
  __int128 v92 = v62;
  id v63 = v62;
  id v66 = v65;
  uint64_t v68 = v67;
  id v44 = v26;
  id v61 = v60;
  id v70 = v69;
  id v45 = v72;
  id v46 = v31;
  id v47 = v71;
  id v48 = v43;
  uint64_t v49 = v55;
  id v50 = v30;
  id v51 = v76;
  id v52 = v57;
  dispatch_async(queuea, block);
}

void __52__DownloadManager_reportDownloadAttemptResult_with___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v3 = (NSMutableDictionary *)[v2 mutableCopy];
  }
  else {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v31 = v3;
  if (v3)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSDate);
    uint64_t v13 = v8;
    if (*(void *)(a1 + 40))
    {
      -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v14,  @"DownloadTime");
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager reportDownloadAttemptResult:with:]_block_invoke",  @"Download start time not found in downloadInfo",  v9,  v10,  v11,  v12,  v28);
    }

    if (*(void *)(a1 + 40) && *(void *)(a1 + 48))
    {
      -[NSDate timeIntervalSinceDate:](v13, "timeIntervalSinceDate:");
      double v16 = v15;
      [*(id *)(a1 + 48) timeIntervalSinceDate:*(void *)(a1 + 40)];
      *(float *)&double v16 = v17 / v16 * 100.0;
      unsigned int v18 = objc_alloc(&OBJC_CLASS___NSNumber);
      LODWORD(v19) = LODWORD(v16);
      uint64_t v20 = -[NSNumber initWithFloat:](v18, "initWithFloat:", v19);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v20,  @"DiscretionaryBreakdown");

      else {
        uint64_t v21 = @"YES";
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v21,  @"DiscretionaryConfigChanged");
    }

    if (!*(void *)(a1 + 48))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  @"NO",  @"DiscretionaryConfigChanged");
      int v22 = *(unsigned __int8 *)(a1 + 152);
      id v23 = objc_alloc(&OBJC_CLASS___NSNumber);
      LODWORD(v24) = 1.0;
      if (!v22) {
        *(float *)&double v24 = 0.0;
      }
      uint64_t v25 = -[NSNumber initWithFloat:](v23, "initWithFloat:", v24);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v25,  @"DiscretionaryBreakdown");
    }

    if (*(_BYTE *)(a1 + 152)) {
      id v26 = @"YES";
    }
    else {
      id v26 = @"NO";
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v26,  @"IsDiscretionary");
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager reportDownloadAttemptResult:with:]_block_invoke",  @"Could not allocate dictionary to hold additional data for analytics",  v4,  v5,  v6,  v7,  v28);
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) analytics]);
  LOBYTE(v30) = *(_BYTE *)(a1 + 152) == 0;
  LOWORD(v29) = *(_WORD *)(a1 + 153);
  objc_msgSend( v27,  "recordDownloadAttemptForAssetType:clientName:baseUrl:relativePath:purpose:result:analyticsFileType:isAutoDownload:is Pallas:pallasAssetAudience:isUserPriority:bytesWritten:bytesTransferredEst:brainVersion:additionalData:",  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void *)(a1 + 96),  *(void *)(a1 + 104),  *(void *)(a1 + 112),  v29,  *(void *)(a1 + 120),  v30,  *(void *)(a1 + 128),  *(void *)(a1 + 136),  *(void *)(a1 + 144),  v31);
}

+ (id)_extractCheckedNSErrorFromDict:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = v6;
  if (!v5) {
    goto LABEL_7;
  }
  if (!v6)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"+[DownloadManager _extractCheckedNSErrorFromDict:withKey:]",  @"Can't extract NSError at nil key from dictionary: %@",  v7,  v8,  v9,  v10,  (uint64_t)v5);
LABEL_7:
    double v19 = 0LL;
    goto LABEL_12;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSError);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", v12));
    double v19 = v14;
    if (v14) {
      id v20 = v14;
    }
    else {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"+[DownloadManager _extractCheckedNSErrorFromDict:withKey:]",  @"buildCheckedError returned nil for the given the NSError (may not be safe to log)",  v15,  v16,  v17,  v18,  v22);
    }
  }

  else
  {
    double v19 = 0LL;
  }

LABEL_12:
  return v19;
}

- (void)sendDownloadResult:(id)a3 with:(int64_t)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (isDownloadResultFailure(a4)) {
    int v10 = 3;
  }
  else {
    int v10 = 6;
  }
  uint64_t v11 = stringForMADownloadResult(a4);
  v120 = (void *)objc_claimAutoreleasedReturnValue(v11);
  int64_t value = a4;
  _MobileAssetLog( 0LL,  v10,  (uint64_t)"-[DownloadManager sendDownloadResult:with:extraInfo:]",  @"Sending download result %ld (%@) for %@",  v12,  v13,  v14,  v15,  a4);

  v124 = v9;
  id v16 = [(id)objc_opt_class(self) _extractCheckedNSErrorFromDict:v9 withKey:@"CFNetworkError"];
  uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
  if (v8)
  {
    v127 = (__CFString *)v17;
    v122 = self;
    __int128 v134 = 0u;
    __int128 v135 = 0u;
    __int128 v132 = 0u;
    __int128 v133 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v8 callbacks]);
    id v131 = [obj countByEnumeratingWithState:&v132 objects:v140 count:16];
    if (!v131)
    {
      v126 = 0LL;
      goto LABEL_85;
    }

    v126 = 0LL;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v130 = *(void *)v133;
    v128 = v8;
    while (1)
    {
      for (i = 0LL; i != v131; i = (char *)i + 1)
      {
        if (*(void *)v133 != v130) {
          objc_enumerationMutation(obj);
        }
        double v24 = *(void **)(*((void *)&v132 + 1) + 8LL * (void)i);
        uint64_t v25 = objc_autoreleasePoolPush();
        id v26 = [v24 safeObjectForKey:@"downloadManagerAutoAssetJobIDKey" ofClass:objc_opt_class(p_ivars[137])];
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        if (!v27)
        {
          uint64_t v29 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"downloadManagerConnectionKey"]);
          if (!v29)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendDownloadResult:with:extraInfo:]",  @"Skipping due to no connection",  v40,  v41,  v42,  v43,  v119);
            id v51 = 0LL;
            id v61 = 0LL;
            id v52 = 0LL;
            goto LABEL_80;
          }

          id v44 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"downloadManagerReplyKey"]);
          uint64_t v38 = v44;
          if (v44)
          {
            xpc_dictionary_set_int64(v44, "Result", value);
            if (v124)
            {
              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v124 objectForKey:@"productMarketingVersions"]);
              uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v49, v50) & 1) != 0) {
                addObjectToMessage(v49, v38, "productMarketingVersionsLength", "productMarketingVersions");
              }
              id v51 = v127;
              if (v127)
              {
                v123 = v49;
                addObjectToMessage(v127, v38, "CFNetworkErrorLen", "CFNetworkError");
                if (-[__CFString code](v127, "code")) {
                  id v52 = -[NSNumber initWithInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithInteger:",  -[__CFString checkedCode](v127, "checkedCode"));
                }
                else {
                  id v52 = (NSNumber *)&off_38EEF0;
                }
                v107 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString checkedDomain](v127, "checkedDomain"));
                if (v107) {
                  id v61 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString checkedDomain](v127, "checkedDomain"));
                }
                else {
                  id v61 = @"com.apple.MobileAssetError.Download";
                }

                v108 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString checkedDescription](v127, "checkedDescription"));
                if (v108) {
                  id v51 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString checkedDescription](v127, "checkedDescription"));
                }
                else {
                  id v51 = @"Unknown error starting download";
                }

                v109 = (void *)objc_claimAutoreleasedReturnValue([v8 analyticsData]);
                if (v109)
                {
                  v110 = (void *)objc_claimAutoreleasedReturnValue([v8 analyticsData]);
                  id v111 = [v110 mutableCopy];

                  [v111 setObject:v52 forKeyedSubscript:@"FailureErrorCode"];
                  [v111 setObject:v61 forKeyedSubscript:@"FailureErrorDomain"];
                  [v111 setObject:v51 forKeyedSubscript:@"FailureErrorMessage"];
                  [v128 setAnalyticsData:v111];
                  v126 = v111;
                  id v8 = v128;
                }

                else
                {
                  v138[0] = @"FailureErrorCode";
                  v138[1] = @"FailureErrorDomain";
                  v139[0] = v52;
                  v139[1] = v61;
                  v138[2] = @"FailureErrorMessage";
                  v139[2] = v51;
                  v112 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v139,  v138,  3LL));
                  [v8 setAnalyticsData:v112];
                }

                uint64_t v49 = v123;
              }

              else
              {
                id v61 = 0LL;
                id v52 = 0LL;
              }
            }

            else
            {
              id v51 = 0LL;
              id v61 = 0LL;
              id v52 = 0LL;
            }

            xpc_connection_send_message(v29, v38);
            goto LABEL_79;
          }

          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendDownloadResult:with:extraInfo:]",  @"Skipping due to no reply",  v45,  v46,  v47,  v48,  v119);
          goto LABEL_58;
        }

        id v28 = [v24 safeObjectForKey:@"downloadManagerJobTypeKey" ofClass:objc_opt_class(p_ivars[137])];
        uint64_t v29 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v28);
        if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v29,  @"catalog_job"))
        {
          if (value)
          {
            id v30 = errorStringForMADownloadResult(value);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            id v37 = MAErrorForDownloadResultWithUnderlying( value,  v127,  @"Catalog download failed: %@(%ld)",  v32,  v33,  v34,  v35,  v36,  (uint64_t)v31);
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
            uint64_t v39 = 0LL;
            goto LABEL_46;
          }

          uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescriptor]);
          id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(v62);
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);

          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescriptor]);
          id PurposeFromTaskDescriptor = getPurposeFromTaskDescriptor(v64);
          id v66 = (void *)objc_claimAutoreleasedReturnValue(PurposeFromTaskDescriptor);

          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescriptor]);
          id AutoAssetJobIDFromTaskDescriptor = getAutoAssetJobIDFromTaskDescriptor(v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue(AutoAssetJobIDFromTaskDescriptor);

          if (v31 && v66 && v69)
          {
            if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v27, v69) & 1) == 0) {
              _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager sendDownloadResult:with:extraInfo:]",  @"{sendDownloadResult} [SUCCESS] ANOMALY | jobID != autoAssetJobID:%@ | assetType:%@, purpose:%@, jobID:%@ | downloadInfo:%@",  v74,  v75,  v76,  v77,  (uint64_t)v27);
            }
            int64_t value = 0LL;
LABEL_40:
            id PathToAssetFileWithPurpose = getPathToAssetFileWithPurpose(v31, v66);
            id v87 = (void *)objc_claimAutoreleasedReturnValue(PathToAssetFileWithPurpose);
            if (v87
              && (id v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
                  unsigned int v89 = [v88 fileExistsAtPath:v87],
                  v88,
                  v89))
            {
              uint64_t v39 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  v87);
              uint64_t v38 = 0LL;
            }

            else
            {
              id v90 = errorStringForMADownloadResult(3uLL);
              v121 = (void *)objc_claimAutoreleasedReturnValue(v90);
              id v96 = MAErrorForDownloadResultWithUnderlying( 3uLL,  v127,  @"No catalog at filesystem location:%@ | %@(%ld)",  v91,  v92,  v93,  v94,  v95,  (uint64_t)v87);
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v96);

              uint64_t v39 = 0LL;
            }
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager sendDownloadResult:with:extraInfo:]",  @"{sendDownloadResult} catalog download success yet incomplete information | [session] assetType:%@, purpose:%@, jobID:%@ | autoAssetJobID:%@ | downloadInfo:%@",  v70,  v71,  v72,  v73,  (uint64_t)v31);
            id v78 = errorStringForMADownloadResult(0x1EuLL);
            id v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
            id v85 = MAErrorForDownloadResultWithUnderlying( 0x1EuLL,  v127,  @"Catalog download success with incomplete information: %@(%ld)",  v80,  v81,  v82,  v83,  v84,  (uint64_t)v79);
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v85);

            if (!v38)
            {
              int64_t value = 30LL;
              goto LABEL_40;
            }

            uint64_t v39 = 0LL;
            int64_t value = 30LL;
          }

          id v8 = v128;
LABEL_46:

          +[MADAutoAssetControlManager catalogDownloadJobFinished:withCatalog:error:]( &OBJC_CLASS___MADAutoAssetControlManager,  "catalogDownloadJobFinished:withCatalog:error:",  v27,  v39,  v38);
          if (v38) {
            goto LABEL_47;
          }
          goto LABEL_58;
        }

        if (value)
        {
          id v53 = errorStringForMADownloadResult(value);
          unsigned __int8 v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          id v60 = MAErrorForDownloadResultWithUnderlying( value,  v127,  @"Asset download failed: %@(%ld)",  v55,  v56,  v57,  v58,  v59,  (uint64_t)v54);
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v60);
        }

        else
        {
          uint64_t v38 = 0LL;
        }

        +[MADAutoAssetControlManager assetDownloadJobFinished:error:]( &OBJC_CLASS___MADAutoAssetControlManager,  "assetDownloadJobFinished:error:",  v27,  v38);
        if (v38)
        {
LABEL_47:
          id v52 = -[NSNumber initWithInteger:]( [NSNumber alloc],  "initWithInteger:",  [v38 checkedCode]);
          id v61 = (__CFString *)objc_claimAutoreleasedReturnValue([v38 checkedDomain]);
          id v51 = (__CFString *)objc_claimAutoreleasedReturnValue([v38 checkedDescription]);
          __int128 v97 = (void *)objc_claimAutoreleasedReturnValue([v8 analyticsData]);

          if (v97)
          {
            __int128 v98 = (void *)objc_claimAutoreleasedReturnValue([v8 analyticsData]);
            id v99 = [v98 mutableCopy];

            if (v52) {
              v100 = v52;
            }
            else {
              v100 = (NSNumber *)&off_38EEF0;
            }
            [v99 setObject:v100 forKeyedSubscript:@"FailureErrorCode"];
            if (v61) {
              v101 = v61;
            }
            else {
              v101 = @"com.apple.MobileAssetError.Download";
            }
            [v99 setObject:v101 forKeyedSubscript:@"FailureErrorDomain"];
            if (v51) {
              v102 = v51;
            }
            else {
              v102 = @"Unknown error during download";
            }
            [v99 setObject:v102 forKeyedSubscript:@"FailureErrorMessage"];
            [v128 setAnalyticsData:v99];
            v126 = v99;
            id v8 = v128;
          }

          else
          {
            v103 = (NSNumber *)&off_38EEF0;
            if (v52) {
              v103 = v52;
            }
            v136[0] = @"FailureErrorCode";
            v136[1] = @"FailureErrorDomain";
            v104 = @"com.apple.MobileAssetError.Download";
            if (v61) {
              v104 = v61;
            }
            v137[0] = v103;
            v137[1] = v104;
            v136[2] = @"FailureErrorMessage";
            v105 = @"Unknown error during download";
            if (v51) {
              v105 = v51;
            }
            v137[2] = v105;
            v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v137,  v136,  3LL));
            [v8 setAnalyticsData:v106];
          }

          goto LABEL_79;
        }

- (void)updateStateAndNotifyIfRequired
{
  if (self->_forceDaemonBusy)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager updateStateAndNotifyIfRequired]",  @"MA Brain not busy, but going into artificial delayed sync mode",  v2,  v3,  v4,  v5,  v8);
    int64_t v7 = 3LL;
  }

  else
  {
    if (self->_currentState)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager updateStateAndNotifyIfRequired]",  @"No need to notify, current state is: %ld",  v2,  v3,  v4,  v5,  self->_currentState);
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager updateStateAndNotifyIfRequired]",  @"Notifying clients we are ready for download",  v2,  v3,  v4,  v5,  v8);
      notify_post("com.apple.MobileAsset.DownloadsReady");
    }

    int64_t v7 = 1LL;
  }

  self->_currentState = v7;
}

- (void)queryNSUrlSessiondAndUpdateState
{
  BOOL v26 = 0;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  if (!+[DownloadManager isDeviceBeforeFirstUnlock](&OBJC_CLASS___DownloadManager, "isDeviceBeforeFirstUnlock"))
  {
    if ((backgroundDownloadsPossibleWithInfo(&v26) & 1) != 0)
    {
      uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DownloadManager dedupNSURLSessionSyncQueue](self, "dedupNSURLSessionSyncQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke_2;
      block[3] = &unk_34DB48;
      void block[4] = self;
      void block[5] = &v22;
      dispatch_sync(v11, block);

      if (*((_BYTE *)v23 + 24))
      {
        _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]",  @"{queryNSUrlSessiondAndUpdateState} Already performing NSURLSession sync - duplicate trigger ignored",  v12,  v13,  v14,  v15,  v18);
        goto LABEL_9;
      }

      downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke_3;
      v19[3] = &unk_34DBC0;
      v19[4] = self;
      uint64_t v17 = v19;
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]",  @"We are in foreground mode (forced: %d) so skipping sync with nsurlsession",  v7,  v8,  v9,  v10,  v26);
      downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke;
      v21[3] = &unk_34DBC0;
      v21[4] = self;
      uint64_t v17 = v21;
    }

    dispatch_async(downloadStateQueue, v17);
    goto LABEL_9;
  }

  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]",  @"{queryNSUrlSessiondAndUpdateState} Not performing NSURLSession sync since device is before first-unlock",  v3,  v4,  v5,  v6,  v18);
LABEL_9:
  _Block_object_dispose(&v22, 8);
}

id __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateStateAndNotifyIfRequired];
}

id __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke_2(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) performingNSURLSessionSync];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return [*(id *)(a1 + 32) setPerformingNSURLSessionSync:1];
  }
  return result;
}

id __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadStateQueue]);
  dispatch_suspend(v2);

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_3",  @"_downloadStateQueue suspended",  v3,  v4,  v5,  v6,  v9);
  uint64_t v7 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke_4;
  v10[3] = &unk_34ED58;
  v10[4] = v7;
  return [v7 getCurrentInflightDownloads:v10];
}

void __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v113 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v106 = v2;
  if (v2)
  {
    uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    id v8 = v2;
    id v9 = [v8 countByEnumeratingWithState:&v125 objects:v133 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v126;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v126 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v125 + 1) + 8LL * (void)i);
          uint64_t v14 = objc_autoreleasePoolPush();
          if (v13)
          {
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSURLSessionDownloadTask);
            if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
            {
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 taskDescription]);
              if (v16) {
                -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, v16);
              }
              else {
                [v13 cancel];
              }
            }
          }

          objc_autoreleasePoolPop(v14);
        }

        id v10 = [v8 countByEnumeratingWithState:&v125 objects:v133 count:16];
      }

      while (v10);
    }

    uint64_t v17 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v7, "allKeys"));
    uint64_t v19 = -[NSSet initWithArray:](v17, "initWithArray:", v18);

    __int128 v123 = 0u;
    __int128 v124 = 0u;
    __int128 v121 = 0u;
    __int128 v122 = 0u;
    uint64_t v20 = a1;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);
    id v22 = [v21 countByEnumeratingWithState:&v121 objects:v132 count:16];
    uint64_t v114 = v19;
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v122;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v122 != v24) {
            objc_enumerationMutation(v21);
          }
          BOOL v26 = *(void **)(*((void *)&v121 + 1) + 8LL * (void)j);
          uint64_t v27 = objc_autoreleasePoolPush();
          if (-[NSSet containsObject:](v19, "containsObject:", v26))
          {
            id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v20 + 32) downloadTasksInFlight]);
            id v29 = [v28 safeObjectForKey:v26 ofClass:objc_opt_class(DownloadInfo)];
            id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v26));
            if (v30)
            {
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v30 task]);

              if (v36)
              {
                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_4",  @"Keeping task: %@ info: %@",  v37,  v38,  v39,  v40,  (uint64_t)v26);
                -[NSMutableDictionary setSafeObject:forKey:](v113, "setSafeObject:forKey:", v30, v26);
                -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v26);
              }

              else
              {
                _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_4",  @"Found download information but the NSURLSessionDownload task is nil, for task descriptor: %@",  v37,  v38,  v39,  v40,  (uint64_t)v26);
                [v35 cancel];
              }

              uint64_t v20 = a1;
            }

            else
            {
              _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_4",  @"Found download information from a task descriptor not in correct format with task descriptor: %@",  v31,  v32,  v33,  v34,  (uint64_t)v26);
              [v35 cancel];
            }

            goto LABEL_36;
          }

          if (![v26 containsString:@".auto."])
          {
            id v53 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v20 + 32) downloadTasksInFlight]);
            id v54 = [v53 safeObjectForKey:v26 ofClass:objc_opt_class(DownloadInfo)];
            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

            if (v55)
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_4",  @"Lost task: %@ info: %@",  v56,  v57,  v58,  v59,  (uint64_t)v26);
              [*(id *)(v20 + 32) sendDownloadResult:v55 with:28 extraInfo:0];
            }

            else
            {
              id v60 = (void *)objc_claimAutoreleasedReturnValue([0 description]);
              _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_4",  @"Found a lost task download information not in correct format with info: %@ with task descriptor: %@",  v61,  v62,  v63,  v64,  (uint64_t)v60);
            }

LABEL_36:
            uint64_t v19 = v114;
            goto LABEL_37;
          }

          uint64_t v41 = isCatalogTaskDescriptor(v26);
          if ((_DWORD)v41)
          {
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v20 + 32) downloadTasksInFlight]);
            id v47 = [v46 safeObjectForKey:v26 ofClass:objc_opt_class(DownloadInfo)];
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

            uint64_t v19 = v114;
            -[NSMutableDictionary setSafeObject:forKey:](v113, "setSafeObject:forKey:", v48, v26);
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_4",  @"Keeping task: %@ info: %@",  v49,  v50,  v51,  v52,  (uint64_t)v26);
          }

          else
          {
            _MobileAssetLog( v41,  6,  (uint64_t)"-[DownloadManager queryNSUrlSessiondAndUpdateState]_block_invoke_4",  @"auto-asset task finished downloading during MA downtime: %@",  v42,  v43,  v44,  v45,  (uint64_t)v26);
          }

id __51__DownloadManager_queryNSUrlSessiondAndUpdateState__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPerformingNSURLSessionSync:0];
}

void __116__DownloadManager_cancelAllDownloading_withPurpose_includingAssets_includingCatalog_includingOther_clientName_then___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 64)) {
    uint64_t v4 = @"async";
  }
  else {
    uint64_t v4 = @"sync";
  }
  uint64_t v31 = v4;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager cancelAllDownloading:withPurpose:includingAssets:includingCatalog:includingOther:clientNa me:then:]_block_invoke",  @"%@ cancel being applied: %@ for %@ with purpose: %@",  v5,  v6,  v7,  v8,  *(void *)(a1 + 32));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v13);
        uint64_t v15 = objc_autoreleasePoolPush();
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 taskDescription]);
        if (v16)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
          {
            id v18 = v9;
            id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(v16);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);
            id PurposeFromTaskDescriptor = getPurposeFromTaskDescriptor(v16);
            id v22 = (void *)objc_claimAutoreleasedReturnValue(PurposeFromTaskDescriptor);
            id v23 = v22;
            if (*(void *)(a1 + 48))
            {
              if (!v22) {
                goto LABEL_24;
              }
LABEL_20:
              if ([*(id *)(a1 + 40) containsObject:v20])
              {
                if (isCatalogTaskDescriptor(v16))
                {
                  id v29 = @"%@ canceling task: %@ (catalog)";
                  if (*(_BYTE *)(a1 + 65)) {
                    goto LABEL_23;
                  }
                }

                else
                {
                  if (isAssetTaskDescriptor(v16))
                  {
                    id v29 = @"%@ canceling task: %@ (asset)";
                    if (!*(_BYTE *)(a1 + 66)) {
                      goto LABEL_24;
                    }
                  }

                  else if (isPmvTaskDescriptor(v16))
                  {
                    id v29 = @"%@ canceling task: %@ (pmv)";
                    if (!*(_BYTE *)(a1 + 65)) {
                      goto LABEL_24;
                    }
                  }

                  else
                  {
                    id v29 = @"%@ canceling task: %@ (other)";
                    if (!*(_BYTE *)(a1 + 67)) {
                      goto LABEL_24;
                    }
                  }

- (void)isDownloading:(id)a3 then:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __38__DownloadManager_isDownloading_then___block_invoke;
  block[3] = &unk_34E028;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(downloadStateQueue, block);
}

uint64_t __38__DownloadManager_isDownloading_then___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (id)newDefaultEventDictionary:(id)a3 sessionId:(id)a4 nonce:(id)a5 url:(id)a6 statusCode:(int64_t)a7 assetAudience:(id)a8 uuid:(id)a9 assetType:(id)a10 version:(id)a11 receiptResults:(id)a12 baseUrl:(id)a13 discretionary:(BOOL)a14 deviceCheck:(id)a15
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = v21;
  id v117 = v22;
  id v24 = a8;
  uint64_t v25 = v20;
  id v26 = a9;
  id v27 = a10;
  id v28 = a11;
  id v29 = v19;
  id v119 = a12;
  id v30 = a13;
  id v31 = a15;
  __int128 v32 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (v32)
  {
    v113 = v24;
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
    uint64_t v114 = v23;
    uint64_t v115 = v25;
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 buildVersion]);
    __int128 v35 = ensureNSStringFromData(v34);
    uint64_t v116 = v29;
    uint64_t v36 = v27;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v35);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v37, @"BuildVersion");

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v33 hwModelString]);
    uint64_t v39 = ensureNSStringFromData(v38);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v40, @"HWModelStr");

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v33 releaseType]);
    uint64_t v42 = ensureNSStringFromData(v41);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v43, @"ReleaseType");

    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceClass]);
    uint64_t v45 = ensureNSStringFromData(v44);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v46, @"DeviceClass");

    CurrentOSType = getCurrentOSType();
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(CurrentOSType);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v48, @"currentOSType");

    uint64_t v49 = (void *)MGCopyAnswer(@"DiskUsage", 0LL);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:kMGQDiskUsageTotalDiskCapacity]);
    -[NSMutableDictionary setSafeObject:forKey:](v32, "setSafeObject:forKey:", v50, @"diskCapacity");

    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:kMGQDiskUsageTotalSystemCapacity]);
    -[NSMutableDictionary setSafeObject:forKey:](v32, "setSafeObject:forKey:", v51, @"systemCapacity");

    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:kMGQDiskUsageTotalDataCapacity]);
    -[NSMutableDictionary setSafeObject:forKey:](v32, "setSafeObject:forKey:", v52, @"dataCapacity");

    v107 = v49;
    id v53 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:kMGQDiskUsageTotalDataAvailable]);
    -[NSMutableDictionary setSafeObject:forKey:](v32, "setSafeObject:forKey:", v53, @"dataAvailableSpace");

    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", @"catalogLookup", @"event");
    id v111 = v36;
    id v54 = ensureNSStringFromData(v36);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v55, @"assetType");

    else {
      uint64_t v56 = @"inProcess";
    }
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v56, @"type");
    if (a14) {
      uint64_t v57 = @"true";
    }
    else {
      uint64_t v57 = @"false";
    }
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v57, @"discretionary");
    id v109 = v30;
    uint64_t v58 = ensureNSStringFromData(v30);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v59, @"baseUrl");

    id v60 = ensureNSStringFromData(v26);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v61, @"eventUuid");

    id v110 = v28;
    uint64_t v62 = ensureNSStringFromData(v28);
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v63, @"reportVersion");

    uint64_t v64 = _currentTimeInMilliseconds();
    id v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    id v66 = ensureNSStringFromData(v65);
    id v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v67, @"eventTime");

    uint64_t v68 = ensureNSStringFromData(v115);
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v69, @"SessionId");

    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);
    uint64_t v71 = ensureNSStringFromData(v70);
    uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v72, @"pallasClientNonce");

    uint64_t v73 = ensureNSStringFromData(v116);
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v74, @"currentOSVersion");

    uint64_t v75 = ensureNSStringFromData(v113);
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v76, @"MobileAssetAssetAudience");

    id v108 = v31;
    uint64_t v77 = ensureNSStringFromData(v31);
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v78, @"DeviceCheck");

    if ((objc_opt_respondsToSelector(v33, "hasSplat") & 1) != 0 && [v33 hasSplat])
    {
      if ((objc_opt_respondsToSelector(v33, "hasSplat") & 1) != 0)
      {
        else {
          id v79 = @"false";
        }
        -[NSMutableDictionary setSafeObject:forKey:](v32, "setSafeObject:forKey:", v79, @"SplatSupported");
      }

      if ((objc_opt_respondsToSelector(v33, "splatCryptex1BuildVersion") & 1) != 0)
      {
        uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v33 splatCryptex1BuildVersion]);
        -[NSMutableDictionary setSafeObject:forKey:](v32, "setSafeObject:forKey:", v80, @"SplatBuildVersion");
      }
    }

    __int128 v118 = v32;
    if (v119)
    {
      __int128 v120 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if (v120)
      {
        uint64_t v105 = v33;
        id v106 = v26;
        __int128 v124 = 0u;
        __int128 v125 = 0u;
        __int128 v122 = 0u;
        __int128 v123 = 0u;
        id v81 = v119;
        id v82 = [v81 countByEnumeratingWithState:&v122 objects:v126 count:16];
        if (v82)
        {
          id v83 = v82;
          uint64_t v84 = 0LL;
          uint64_t v85 = 0LL;
          uint64_t v86 = 0LL;
          uint64_t v121 = 0LL;
          uint64_t v87 = 0LL;
          uint64_t v88 = *(void *)v123;
          do
          {
            for (i = 0LL; i != v83; i = (char *)i + 1)
            {
              if (*(void *)v123 != v88) {
                objc_enumerationMutation(v81);
              }
              uint64_t v90 = *(void **)(*((void *)&v122 + 1) + 8LL * (void)i);
              if (v90)
              {
                uint64_t v91 = objc_autoreleasePoolPush();
                uint64_t v92 = (uint32_t *)[v90 integerValue];
                if (v92 == (uint32_t *)((char *)&stru_20.flags + 1))
                {
                  uint64_t v85 = (v85 + 1);
                }

                else if (v92 == &stru_20.flags)
                {
                  uint64_t v121 = (v121 + 1);
                }

                else if (v92)
                {
                  uint64_t v84 = (v84 + 1);
                  -[NSMutableArray addObject:](v120, "addObject:", v90);
                }

                else
                {
                  uint64_t v86 = (v86 + 1);
                }

                uint64_t v87 = (v87 + 1);
                objc_autoreleasePoolPop(v91);
              }
            }

            id v83 = [v81 countByEnumeratingWithState:&v122 objects:v126 count:16];
          }

          while (v83);
        }

        else
        {
          uint64_t v84 = 0LL;
          uint64_t v85 = 0LL;
          uint64_t v86 = 0LL;
          uint64_t v121 = 0LL;
          uint64_t v87 = 0LL;
        }

        uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Total: %d (Missing: %d Valid: %d Expired: %d Errors: %d) ErrorCodes: %@",  v87,  v121,  v86,  v85,  v84,  v120));
        if (v93) {
          -[NSMutableDictionary setObject:forKey:](v118, "setObject:forKey:", v93, @"assetReceiptData");
        }

        __int128 v33 = v105;
        id v26 = v106;
      }
    }

    uint64_t v94 = v33;
    uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a7));
    if (v95) {
      -[NSMutableDictionary setObject:forKey:](v118, "setObject:forKey:", v95, @"httpCode");
    }
    id v96 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
    __int128 v97 = (void *)objc_claimAutoreleasedReturnValue([v96 info]);
    __int128 v98 = (void *)objc_claimAutoreleasedReturnValue([v97 objectForKeyedSubscript:@"MobileAssetProperties"]);
    uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKeyedSubscript:@"Build"]);

    uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
    uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue([v100 info]);
    uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue([v101 objectForKeyedSubscript:@"MobileAssetProperties"]);
    v103 = (void *)objc_claimAutoreleasedReturnValue([v102 objectForKeyedSubscript:@"RestoreVersion"]);

    if (v99) {
      -[NSMutableDictionary setObject:forKey:](v118, "setObject:forKey:", v99, @"MABrainBuildVersion");
    }
    id v24 = v113;
    id v23 = v114;
    id v27 = v111;
    if (v103) {
      -[NSMutableDictionary setObject:forKey:](v118, "setObject:forKey:", v103, @"MABrainRestoreVersion");
    }

    __int128 v32 = v118;
    id v30 = v109;
    id v28 = v110;
    id v31 = v108;
    uint64_t v25 = v115;
    id v29 = v116;
  }

  return v32;
}

- (void)checkSplunkStatus:(id)a3 failureReason:(id)a4 productVersion:(id)a5 sessionId:(id)a6 nonce:(id)a7 url:(id)a8 statusCode:(int64_t)a9 assetAudience:(id)a10 version:(id)a11 receiptResults:(id)a12 baseUrl:(id)a13 discretionary:(BOOL)a14 deviceCheck:(id)a15
{
  id v20 = a3;
  id v40 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v29 = a15;
  dispatch_queue_t queue = (dispatch_queue_s *)self->_splunkStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __168__DownloadManager_checkSplunkStatus_failureReason_productVersion_sessionId_nonce_url_statusCode_assetAudience_version_receiptResults_baseUrl_discretionary_deviceCheck___block_invoke;
  block[3] = &unk_34EDD0;
  id v45 = v20;
  uint64_t v46 = self;
  id v47 = v22;
  id v48 = v21;
  id v49 = v23;
  id v50 = v24;
  id v51 = v25;
  id v52 = v26;
  id v53 = v27;
  id v54 = v28;
  BOOL v58 = a14;
  id v55 = v29;
  id v56 = v40;
  int64_t v57 = a9;
  id v43 = v40;
  id v42 = v29;
  id v41 = v28;
  id v38 = v27;
  id v30 = v26;
  id v31 = v25;
  id v32 = v24;
  id v33 = v23;
  id v34 = v21;
  id v35 = v22;
  id v36 = v20;
  dispatch_async(queue, block);
}

void __168__DownloadManager_checkSplunkStatus_failureReason_productVersion_sessionId_nonce_url_statusCode_assetAudience_version_receiptResults_baseUrl_discretionary_deviceCheck___block_invoke( uint64_t a1)
{
  id v52 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentSplunkEvent]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 32)]);
  }

  else
  {
    id v3 = 0LL;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  id v10 = *(const __CFString **)(a1 + 32);
  if (!v10)
  {
    id v10 = @"N";
LABEL_22:
    uint64_t v50 = (uint64_t)v10;
    id v18 = @"{checkSplunkStatus} Unable to create base-level event requirements - not sending event | assetType:%@, sessionId:%@, events:%@, uuid:%@";
    goto LABEL_23;
  }

  if (!*(void *)(a1 + 48) || !v52 || !v5) {
    goto LABEL_22;
  }
  if (v3)
  {
    uint64_t v11 = *(void *)(a1 + 128);
    if (v11 != 304 && v11 != 200)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SessionId"]);
      if (!v14) {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:asset Audience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} No session ID for previously sent failure event",  v21,  v22,  v23,  v24,  v49);
      }
      id v25 = [*(id *)(a1 + 48) isEqualToString:v14];
      if ((_DWORD)v25)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"httpCode"]);
        id v30 = [v15 longValue];
        uint64_t v34 = *(void *)(a1 + 128);
        if (v30 == (id)v34)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:ass etAudience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Previous failure indication, same session, status the same, incrementing count - not sending additional event [no change to status code]",  v31,  v32,  v34,  v33,  v49);
          ensureAndIncrementNumberAtKey(v3, @"splunkErrorCount", 0LL);
        }

        else
        {
          id v43 = objc_msgSend( *(id *)(a1 + 40),  "newDefaultEventDictionary:sessionId:nonce:url:statusCode:assetAudience:uuid:assetType:version:receiptR esults:baseUrl:discretionary:deviceCheck:",  *(void *)(a1 + 56),  *(void *)(a1 + 48),  *(void *)(a1 + 64),  *(void *)(a1 + 72));
          if (v43)
          {
            id v13 = v43;
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:a ssetAudience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Previous failure indication, same session, status codes different - sending event with latest failure statusCode [optionally also sending event for batched previous failures]",  v44,  v45,  v46,  v47,  (uint64_t)v5);
            [*(id *)(a1 + 40) augmentSplunkEvent:v13 withResultForHTTPStatusCode:*(void *)(a1 + 128)];
            uint64_t v48 = *(void *)(a1 + 120);
            if (v48) {
              [v13 setObject:v48 forKey:@"failureReason"];
            }
            -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v13, v5);
            [*(id *)(a1 + 40) setPreviousBatchedFailureEvent:v3 inSendEventsByUUID:v52];
            id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentSplunkEvent]);
            [v16 setObject:v13 forKey:*(void *)(a1 + 32)];
            goto LABEL_19;
          }

          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:ass etAudience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Unable to create event dictionary [for different status code] - unable to send event",  v44,  v45,  v46,  v47,  (uint64_t)v5);
        }
      }

      else
      {
        _MobileAssetLog( (uint64_t)v25,  6,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:asset Audience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Current event, different session - send both events",  v26,  v27,  v28,  v29,  v49);
        id v35 = objc_msgSend( *(id *)(a1 + 40),  "newDefaultEventDictionary:sessionId:nonce:url:statusCode:assetAudience:uuid:assetType:version:receiptRes ults:baseUrl:discretionary:deviceCheck:",  *(void *)(a1 + 56),  *(void *)(a1 + 48),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 128),  *(void *)(a1 + 80));
        if (v35)
        {
          id v13 = v35;
          [*(id *)(a1 + 40) augmentSplunkEvent:v35 withResultForHTTPStatusCode:*(void *)(a1 + 128)];
          uint64_t v40 = *(void *)(a1 + 120);
          if (v40) {
            [v13 setObject:v40 forKey:@"failureReason"];
          }
          -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v13, v5);
          [*(id *)(a1 + 40) setPreviousBatchedFailureEvent:v3 inSendEventsByUUID:v52];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentSplunkEvent]);
          [v15 setObject:v13 forKey:*(void *)(a1 + 32)];
          goto LABEL_20;
        }

        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:asset Audience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Unable to create event dictionary [different sessions] - unable to send event or track latest failure indication",  v36,  v37,  v38,  v39,  (uint64_t)v5);
      }

      goto LABEL_24;
    }

    LOBYTE(v51) = *(_BYTE *)(a1 + 136);
    id v12 = objc_msgSend( *(id *)(a1 + 40),  "newDefaultEventDictionary:sessionId:nonce:url:statusCode:assetAudience:uuid:assetType:version:receiptResults :baseUrl:discretionary:deviceCheck:",  *(void *)(a1 + 56),  v5,  v10,  *(void *)(a1 + 88),  *(void *)(a1 + 96),  *(void *)(a1 + 104),  v51,  *(void *)(a1 + 112));
    if (v12)
    {
      id v13 = v12;
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:assetAu dience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Success with a previous failure event, augment the success with the previous failure event information and send | statusCode:%ld",  v6,  v7,  v8,  v9,  *(void *)(a1 + 128));
      [v13 setObject:@"success" forKey:@"splunkResultKey"];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"failureReason"]);
      if (v14) {
        [v13 setObject:v14 forKey:@"priorFailureReason"];
      }
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"splunkErrorCount"]);
      if (v15) {
        [v13 setObject:v15 forKey:@"priorErrorCount"];
      }
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"httpCode"]);
      if (v16) {
        [v13 setObject:v16 forKey:@"priorHttpCode"];
      }
      -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v13, v5);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentSplunkEvent]);
      [v17 removeObjectForKey:*(void *)(a1 + 32)];

LABEL_19:
LABEL_20:

LABEL_44:
      [*(id *)(a1 + 40) sendEvents:v52 sessionId:*(void *)(a1 + 48)];

      goto LABEL_24;
    }

    id v18 = @"{checkSplunkStatus} Unable to create event dictionary [for different status code] - unable to send event";
  }

  else
  {
    uint64_t v50 = (uint64_t)v5;
    id v19 = objc_msgSend( *(id *)(a1 + 40),  "newDefaultEventDictionary:sessionId:nonce:url:statusCode:assetAudience:uuid:assetType:version:receiptResults :baseUrl:discretionary:deviceCheck:",  *(void *)(a1 + 56));
    if (v19)
    {
      id v13 = v19;
      uint64_t v20 = *(void *)(a1 + 128);
      if (v20 == 200 || v20 == 304)
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:asset Audience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Sending success indication when no previous failure indication",  v6,  v7,  v8,  v9,  (uint64_t)v5);
        [v13 setObject:@"success" forKey:@"splunkResultKey"];
      }

      else
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager checkSplunkStatus:failureReason:productVersion:sessionId:nonce:url:statusCode:asset Audience:version:receiptResults:baseUrl:discretionary:deviceCheck:]_block_invoke",  @"{checkSplunkStatus} Sending failure indication when no previous failure indication",  v6,  v7,  v8,  v9,  (uint64_t)v5);
        [*(id *)(a1 + 40) augmentSplunkEvent:v13 withResultForHTTPStatusCode:*(void *)(a1 + 128)];
        uint64_t v41 = *(void *)(a1 + 120);
        if (v41) {
          [v13 setObject:v41 forKey:@"failureReason"];
        }
        ensureAndIncrementNumberAtKey(v13, @"splunkErrorCount", 0LL);
        id v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentSplunkEvent]);
        [v42 setObject:v13 forKey:*(void *)(a1 + 32)];
      }

      -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v13, v5);
      goto LABEL_44;
    }

    id v18 = @"{checkSplunkStatus} Unable to create event dictionary [no previous failure indication] - unable to send event [or track any latest failure indication]";
  }

- (void)augmentSplunkEvent:(id)a3 withResultForHTTPStatusCode:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"HTTP-%ld", a4);
  if (v6) {
    uint64_t v7 = (const __CFString *)v6;
  }
  else {
    uint64_t v7 = @"fail";
  }
  uint64_t v8 = (__CFString *)v7;
  objc_msgSend(v5, "setObject:forKey:");
}

- (void)setPreviousBatchedFailureEvent:(id)a3 inSendEventsByUUID:(id)a4
{
  id v19 = a3;
  id v9 = a4;
  if (v19 && v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"splunkErrorCount"]);
    if (v10)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && (uint64_t)[v10 longValue] >= 1)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"eventUuid"]);
        if (v16) {
          [v9 setObject:v19 forKey:v16];
        }
        else {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager setPreviousBatchedFailureEvent:inSendEventsByUUID:]",  @"{setPreviousBatchedFailureEvent} Previous failure indication event without UUID - unable to [re-]send event for previous status code",  v12,  v13,  v14,  v15,  v18);
        }
      }
    }
  }

  else
  {
    if (v19) {
      uint64_t v17 = @"Y";
    }
    else {
      uint64_t v17 = @"N";
    }
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager setPreviousBatchedFailureEvent:inSendEventsByUUID:]",  @"{setPreviousBatchedFailureEvent} Missing required paarameter - not considering re-sending previous failure indication | previousEvent:%@, sendEvents:%@",  v5,  v6,  v7,  v8,  (uint64_t)v17);
  }
}

+ (id)getPallasUrl:(BOOL)a3 assetType:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    && ([v5 isEqualToString:&stru_355768] & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"PallasUrlOverrideV2",  v5));
    id v18 = _MAPreferencesCopyValue(v17);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v7)
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v7, v19) & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v8 = _MAPreferencesCopyValue(@"PallasUrlOverrideV2");
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

  if (!v9)
  {
    uint64_t v7 = 0LL;
    goto LABEL_11;
  }

  uint64_t v7 = (void *)v9;
LABEL_7:
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7)),
        _MobileAssetLog( 0LL,  6,  (uint64_t)"+[DownloadManager getPallasUrl:assetType:]",  @"%@ was in preferences (%@) and was not false ('%@'), pallasURL=%@ assetType=%@",  v12,  v13,  v14,  v15,  (uint64_t)@"PallasUrlOverrideV2"),  !v11))
  {
LABEL_11:
    if (v4)
    {
      if (isExternalPreReleaseAssetType(v5)
        && isAppleDynamicOverridesSupportedAssetType(v5))
      {
        goto LABEL_16;
      }

      if (!isExternalPreReleaseAssetType(v5))
      {
        id v16 = @"https://gdmf-staging-int.apple.com/v2/assets";
        goto LABEL_23;
      }
    }

    else if (isAppleDynamicOverridesSupportedAssetType(v5))
    {
LABEL_16:
      id v16 = @"https://gdmf-ados.apple.com/v2/assets";
LABEL_23:
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));
      goto LABEL_24;
    }

    id v16 = @"https://gdmf.apple.com/v2/assets";
    goto LABEL_23;
  }

- (BOOL)getPallasEnabledForAssetType:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && isXMLAssetType(v3))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getPallasEnabledForAssetType:]",  @"Pallas not enabled by default for XML asset types, pallasEnabled=%@ assetType=%@",  v5,  v6,  v7,  v8,  (uint64_t)@"NO");
    BOOL v9 = 0;
    uint64_t v10 = @"Asset Type XML";
  }

  else
  {
    BOOL v9 = 1;
    uint64_t v10 = @"None";
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0
    && ([v4 isEqualToString:&stru_355768] & 1) == 0)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"EnableLiveAssetServerV2",  v4));
    uint64_t v26 = _MAPreferencesCopyNSStringValue(v25);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v26);

    if (v12)
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v10 = @"Asset Type Specific";
      if ((objc_opt_isKindOfClass(v12, v27) & 1) != 0) {
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t v13 = _MAPreferencesCopyNSStringValue(@"EnableLiveAssetServerV2");
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

  if (!v14)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getPallasEnabledForAssetType:]",  @"EnableLiveAssetServerV2 was not in preferences (%@), pallasEnabled=%@ assetType=%@",  v15,  v16,  v17,  v18,  (uint64_t)v10);
    goto LABEL_17;
  }

  uint64_t v12 = (void *)v14;
LABEL_10:
  if (([v12 isEqual:@"off"] & 1) != 0
    || ([v12 isEqual:@"false"] & 1) != 0
    || ([v12 isEqual:@"NO"] & 1) != 0
    || ([v12 isEqual:&__kCFBooleanFalse] & 1) != 0
    || (id v23 = [v12 isEqual:@"0"], (_DWORD)v23))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getPallasEnabledForAssetType:]",  @"%@ was in preferences (%@) and was false ('%@'), pallasEnabled=%@ assetType=%@",  v19,  v20,  v21,  v22,  (uint64_t)@"EnableLiveAssetServerV2");

    BOOL v9 = 0;
  }

  else
  {
    _MobileAssetLog( (uint64_t)v23,  6,  (uint64_t)"-[DownloadManager getPallasEnabledForAssetType:]",  @"%@ was in preferences (%@) and was not false ('%@'), pallasEnabled=%@ assetType=%@",  v19,  v20,  v21,  v22,  (uint64_t)@"EnableLiveAssetServerV2");

    BOOL v9 = 1;
  }

- (id)addSUOptions:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v5 setObject:v8 forKey:@"DeviceClass"];

  [v5 setObject:@"true" forKey:@"IsUIBuild"];
  BOOL v9 = pallasStringParams();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10) {
    [v5 addEntriesFromDictionary:v10];
  }
  uint64_t v11 = (void *)MGGetStringAnswer(@"ProductVersion");
  else {
    uint64_t v12 = @"false";
  }
  [v5 setObject:v12 forKey:@"SigningFuse"];
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___MAMsuDownloadOptions);
  if ((objc_opt_isKindOfClass(v6, v13) & 1) == 0)
  {
    [v5 setObject:@"false" forKey:@"DelayRequested"];
    uint64_t v27 = @"Supervised";
    uint64_t v28 = v5;
    uint64_t v29 = @"false";
LABEL_28:
    [v28 setObject:v29 forKey:v27];
    goto LABEL_29;
  }

  id v14 = v6;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 requestedProductVersion]);

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 requestedProductVersion]);
    [v5 setObject:v16 forKey:@"RequestedProductVersion"];
  }

  id v17 = [v14 delayPeriod];
  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v14 delayPeriod]));
    [v5 setObject:v18 forKey:@"DelayPeriod"];
  }

  unsigned int v19 = [v14 supervised];
  unsigned int v20 = [v14 allowSameVersion];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 prerequisiteBuildVersion]);

  if (v21)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 prerequisiteBuildVersion]);
    [v5 setObject:v22 forKey:@"BuildVersion"];
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 prerequisiteProductVersion]);

  if (v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 prerequisiteProductVersion]);
    [v5 setObject:v24 forKey:@"ProductVersion"];
  }

  if ([v14 prerequisiteReleaseTypeIsOverridden])
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 prerequisiteReleaseType]);

    if (v25)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v14 prerequisiteReleaseType]);
      [v5 setObject:v26 forKey:@"ReleaseType"];
    }

    else
    {
      [v5 removeObjectForKey:@"ReleaseType"];
    }
  }

  if (v17) {
    id v30 = @"true";
  }
  else {
    id v30 = @"false";
  }
  [v5 setObject:v30 forKey:@"DelayRequested"];
  if (v19) {
    uint64_t v31 = @"true";
  }
  else {
    uint64_t v31 = @"false";
  }
  [v5 setObject:v31 forKey:@"Supervised"];
  if (v20)
  {
    uint64_t v29 = @"true";
    uint64_t v27 = @"InternalBuild";
    uint64_t v28 = v5;
    goto LABEL_28;
  }

- (BOOL)pallasRequestRequiresAuthentication:(id)a3 serverParams:(id)a4
{
  id v4 = a3;
  int v9 = urlSupportsAuthenticatedPallas(v4);
  if (v9) {
    uint64_t v10 = @"[AuthenticatedPallas]: Pallas server(%@) requires authentication";
  }
  else {
    uint64_t v10 = @"[AuthenticatedPallas]: Pallas server(%@) does *NOT* require authentication";
  }
  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager pallasRequestRequiresAuthentication:serverParams:]",  v10,  v5,  v6,  v7,  v8,  (uint64_t)v4);

  return v9;
}

- (void)pallasRequestV2:(id)a3 normalizedType:(id)a4 withPurpose:(id)a5 options:(id)a6 using:(id)a7 with:(id)a8 autoAssetJob:(id)a9 clientName:(id)a10 then:(id)a11
{
  id v17 = a3;
  id v179 = a4;
  id v18 = a5;
  id v183 = a6;
  id v19 = a7;
  id v20 = a8;
  id v178 = a9;
  id v21 = a10;
  id v177 = a11;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"In pallasRequestV2",  v22,  v23,  v24,  v25,  v151);
  v182 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadStateQueue);
  uint64_t v26 = objc_autoreleasePoolPush();
  _MAPreferencesSync(@"pallasRequestV2", v17);
  uint64_t v203 = 0LL;
  v204 = &v203;
  uint64_t v205 = 0x2020000000LL;
  uint64_t v206 = 1LL;
  uint64_t IsInternalAllowed = _MAPreferencesIsInternalAllowed();
  uint64_t v28 = objc_claimAutoreleasedReturnValue( +[DownloadManager getPallasUrl:assetType:]( &OBJC_CLASS___DownloadManager,  "getPallasUrl:assetType:",  IsInternalAllowed,  v17));
  v180 = (void *)v28;
  if (v28)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Pallas Server url is: %@",  v29,  v30,  v31,  v32,  v28);
    v165 = v26;
    id v166 = v18;
    id v171 = v20;
    id v172 = v19;
    v181 = v17;
    uint64_t v33 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[ASAssetMetadataUpdatePolicy policy](&OBJC_CLASS___ASAssetMetadataUpdatePolicy, "policy"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 serverURLForAssetType:v181]);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 absoluteString]);

    if (v36)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Sending base url: %@",  v37,  v38,  v39,  v40,  (uint64_t)v36);
      -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v36, @"BaseUrl");
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[ASAssetMetadataUpdatePolicy policy](&OBJC_CLASS___ASAssetMetadataUpdatePolicy, "policy"));
    id v42 = [v41 trainName];

    if (v42)
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v42));
      if (v43) {
        -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v43, @"TrainName");
      }
    }

    if ((_DWORD)IsInternalAllowed) {
      uint64_t v44 = @"true";
    }
    else {
      uint64_t v44 = @"false";
    }
    uint64_t v45 = v44;
    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v45, @"InternalBuild");

    id v174 = -[DownloadManager newAssetAudience:assetType:](self, "newAssetAudience:assetType:", IsInternalAllowed, v181);
    uint64_t v46 = objc_opt_class(&OBJC_CLASS___MAMsuDownloadOptions);
    if ((objc_opt_isKindOfClass(v183, v46) & 1) != 0)
    {
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v183 liveAssetAudienceUUID]);

      if (v47)
      {
        -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v174, @"OriginalAssetAudience");
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v183 liveAssetAudienceUUID]);
        id v49 = [v48 copy];

        id v174 = v49;
      }
    }

    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v174, @"AssetAudience");
    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v181, @"AssetType");
    uint64_t v50 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", v21, @"DeviceAccessClient");
    else {
      uint64_t v51 = @"false";
    }
    id v52 = v51;
    -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", v52, @"AllowXmlFallback");

    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v50, @"ClientData");
    id v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v53, @"ClientVersion");
    v162 = v50;
    id v176 = v21;

    id v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 UUIDString]);
    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v55, @"Nonce");

    uint64_t v56 = objc_claimAutoreleasedReturnValue([v183 sessionId]);
    if (!v56)
    {
      int64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v58 = objc_claimAutoreleasedReturnValue([v57 UUIDString]);

      uint64_t v56 = v58;
    }

    v169 = (void *)v56;
    -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:");
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager addSUOptions:options:](self, "addSUOptions:options:", v33, v183));
    if ([v183 liveServerCatalogOnlyIsOverridden])
    {
      else {
        uint64_t v59 = @"false";
      }
      id v60 = v59;
      -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v60, @"NoFallback");
    }

    if (os_variant_has_internal_content("com.apple.MobileAsset"))
    {
      id v61 = _MAPreferencesCopyValue(@"TimeTravelDate");
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      id v63 = _MAPreferencesCopyValue(@"TimeTravelDateDiff");
      uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      if (v62)
      {
        if ([v62 rangeOfString:@"^\\d{4}-\\d{2}-\\d{2}$" options:1024] == (id)0x7FFFFFFFFFFFFFFFLL) {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"TimeTravelDate '%@' is not in the correct YYYY-MM-DD format, ignoring",  v65,  v66,  v67,  v68,  (uint64_t)v62);
        }
        else {
          -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v62, @"TimeTravelDate");
        }
      }

      if (v64)
      {
        if ([v62 rangeOfString:@"^\\d{3}$" options:1024] == (id)0x7FFFFFFFFFFFFFFFLL
          || (uint64_t)[v62 integerValue] > 365)
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"TimeTravelDateDiff '%@' is not in the correct format (should just be numbers at max 365 and only numbers)",  v71,  v72,  v73,  v74,  (uint64_t)v62);
        }

        else
        {
          -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v64, @"TimeTravelDateDiff");
        }
      }
    }

    id v79 = (void *)objc_claimAutoreleasedReturnValue([v183 additionalServerParams]);
    if (v79 && (uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v79, v80) & 1) != 0))
    {
      addAdditionalParams(v33, v79);
      uint64_t v81 = objc_claimAutoreleasedReturnValue([v79 objectForKey:@"DeviceCheck"]);
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"No extra options specified by client",  v75,  v76,  v77,  v78,  v153);
      uint64_t v81 = 0LL;
    }

    id v82 = pallasStringParams();
    uint64_t v83 = objc_claimAutoreleasedReturnValue(v82);
    if (v83) {
      -[NSMutableDictionary setSafeObject:forKey:](v33, "setSafeObject:forKey:", v83, @"DeviceOSData");
    }
    -[PallasResponseVerifier issuanceDate](self->_pallasVerifier, "issuanceDate");
    uint64_t v85 = *(void *)&v84;
    if (v84 != 0.0)
    {
      uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v84));
      if (v92)
      {
        uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v92));
        if (v99) {
          -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v99, @"CertIssuanceDay");
        }
        else {
          _MobileAssetFault( (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Cannot format CertIssuanceDay. %f %@",  v93,  v94,  v95,  v96,  v97,  v98,  v85);
        }
      }

      else
      {
        _MobileAssetFault( (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Cannot format CertIssuanceDay. %f nil",  v86,  v87,  v88,  v89,  v90,  v91,  v85);
      }
    }

    uint64_t v100 = +[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v33);
    if ((_DWORD)v100) {
      _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Params being sent to the server are: %@",  v101,  v102,  v103,  v104,  (uint64_t)v33);
    }
    else {
      _MobileAssetLog( v100,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Params are not valid",  v101,  v102,  v103,  v104,  v153);
    }
    v160 = (void *)v81;
    uint64_t v105 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v33,  1LL,  0LL));
    id v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v180));
    v173 = (void *)objc_claimAutoreleasedReturnValue( -[DownloadManager getUserAgentStringForClient:withAssetType:]( v182,  "getUserAgentStringForClient:withAssetType:",  v176,  v179));
    [v106 setCachePolicy:4];
    [v106 setHTTPMethod:@"POST"];
    [v106 setValue:v173 forHTTPHeaderField:@"User-Agent"];
    [v106 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [v106 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    v107 = (void *)objc_claimAutoreleasedReturnValue([v54 UUIDString]);
    [v106 setValue:v107 forHTTPHeaderField:@"Nonce"];

    [v106 setHTTPBody:v105];
    if (_MAPreferencesIsVerboseLoggingEnabled()) {
      _MobileAssetLog( 0LL,  7,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"User Agent String is: %@",  v108,  v109,  v110,  v111,  (uint64_t)v173);
    }
    uint64_t v112 = objc_opt_class(&OBJC_CLASS___MAMsuDownloadOptions);
    if ((objc_opt_isKindOfClass(v183, v112) & 1) != 0)
    {
      id v113 = v183;
      uint64_t v114 = (void *)objc_claimAutoreleasedReturnValue([v113 purpose]);
      uint64_t v115 = normalizePurpose(v114);
      uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue(v115);

      if (!isWellFormedPurpose(v116)) {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"The purpose for pallas v2 is: '%@' which is not well formed, and type is: %@",  v117,  v118,  v119,  v120,  (uint64_t)v116);
      }
    }

    else
    {
      uint64_t v116 = 0LL;
    }

    v158 = (void *)v105;
    v159 = (void *)v83;
    id v121 = assembleTaskDescriptorWithPurposeAndAutoAssetJobID((uint64_t)v179, (uint64_t)@"xml", v116, v178);
    __int128 v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"The task descriptor for pallas v2 is: %@ and type is: %@",  v123,  v124,  v125,  v126,  (uint64_t)v122);
    v185[0] = _NSConcreteStackBlock;
    v185[1] = 3221225472LL;
    v185[2] = __110__DownloadManager_pallasRequestV2_normalizedType_withPurpose_options_using_with_autoAssetJob_clientName_then___block_invoke;
    v185[3] = &unk_34EE20;
    v202 = &v203;
    id v156 = v54;
    id v186 = v156;
    v187 = v182;
    id v155 = v79;
    id v188 = v155;
    id v127 = v180;
    id v189 = v127;
    id v157 = v178;
    id v190 = v157;
    id v128 = v181;
    id v191 = v128;
    id v168 = v122;
    id v192 = v168;
    id v193 = v179;
    id v167 = v116;
    id v194 = v167;
    id v201 = v177;
    id v70 = v163;
    id v195 = v70;
    id v164 = v169;
    id v196 = v164;
    id v170 = v174;
    id v197 = v170;
    id v154 = v36;
    id v198 = v154;
    id v129 = v183;
    id v199 = v129;
    id v161 = v160;
    id v200 = v161;
    v175 = objc_retainBlock(v185);
    uint64_t v130 = -[DownloadManager pallasRequestRequiresAuthentication:serverParams:]( v182,  "pallasRequestRequiresAuthentication:serverParams:",  v127,  v33);
    if ((_DWORD)v130)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Using auth pallas session for %@",  v131,  v132,  v133,  v134,  (uint64_t)v128);
      uint64_t v184 = 0LL;
      __int128 v135 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager authPallasBAACertManager](v182, "authPallasBAACertManager"));
      v136 = (void *)objc_claimAutoreleasedReturnValue([v135 issueAndCopyCerts:&v184]);

      if (v136)
      {
        v137 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager authPallasSessionDelegate](v182, "authPallasSessionDelegate"));
        [v137 setCertArray:v136];

        uint64_t v138 = v184;
        v139 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager authPallasSessionDelegate](v182, "authPallasSessionDelegate"));
        [v139 setRefKey:v138];
      }

      v140 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSession dataTaskWithRequest:completionHandler:]( v182->_authPallasSession,  "dataTaskWithRequest:completionHandler:",  v106,  v175));
    }

    else
    {
      _MobileAssetLog( v130,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Using legacy pallas session for %@",  v131,  v132,  v133,  v134,  (uint64_t)v128);
      v140 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLSession dataTaskWithRequest:completionHandler:]( v182->_pallasSession,  "dataTaskWithRequest:completionHandler:",  v106,  v175));
    }

    uint64_t PreferenceLong = getPreferenceLong(@"PallasTimeout");
    if (PreferenceLong < 0)
    {
      else {
        uint64_t PreferenceLong = (uint64_t)[v129 timeoutIntervalForResource];
      }
    }

    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", PreferenceLong));
    [v142 doubleValue];
    double v144 = v143;

    LOBYTE(v184) = 0;
    if ((backgroundDownloadsPossibleWithInfo((BOOL *)&v184) & 1) != 0)
    {
      id v149 = 0LL;
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Download foreground download, timeout: %ld forced in-proc: %d",  v145,  v146,  v147,  v148,  PreferenceLong);
      v150 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager currentConfig](v182, "currentConfig"));
      id v149 = [v150 copy];

      [v149 setTimeoutIntervalForResource:v144];
      objc_msgSend(v149, "set_socketStreamProperties:", &off_38FC78);
      [v140 _adoptEffectiveConfiguration:v149];
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Setting pallas time out to: %ld",  v145,  v146,  v147,  v148,  PreferenceLong);
    objc_msgSend(v140, "set_timeoutIntervalForResource:", v144);
    -[DownloadManager addLiveServerRequest:forAssetType:withPurpose:audience:pallasUrl:using:with:clientName:autoAssetJobID:task:options:]( v182,  "addLiveServerRequest:forAssetType:withPurpose:audience:pallasUrl:using:with:clientName:autoAssetJobID:task:options:",  v168,  v128,  v167,  v170,  v127,  v172,  v171,  v176,  v157,  v140,  v129);

    id v17 = v181;
    uint64_t v26 = v165;
    id v18 = v166;
    id v20 = v171;
    id v19 = v172;
    id v21 = v176;
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:then:]",  @"Skipping live asset due to nil server url",  v29,  v30,  v31,  v32,  v152);
    id StandardUrl = getStandardUrl(v17, v179);
    id v70 = (id)objc_claimAutoreleasedReturnValue(StandardUrl);
    (*((void (**)(id, id, uint64_t, uint64_t))v177 + 2))(v177, v70, v204[3], 27LL);
  }

  _Block_object_dispose(&v203, 8);
  objc_autoreleasePoolPop(v26);
}

void __110__DownloadManager_pallasRequestV2_normalizedType_withPurpose_options_using_with_autoAssetJob_clientName_then___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v207 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v213 = a1;
  *(void *)(*(void *)(*(void *)(a1 + 160) + 8LL) + 24LL) = 2LL;
  id v196 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v220[0] = 0LL;
  v220[1] = v220;
  v220[2] = 0x3032000000LL;
  v220[3] = __Block_byref_object_copy__11;
  v220[4] = __Block_byref_object_dispose__11;
  id v221 = 0LL;
  id v188 = v7;
  v211 = v8;
  if (!v7)
  {
    unint64_t v25 = downloadResultForNetworkFailure(-16, v8, 0LL);
    uint64_t v26 = stringForMADownloadResult(v25);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v212 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"V2 networking issue - %ld %@",  v25,  v27));

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:t hen:]_block_invoke",  @"There was a Pallas networking failure: %@ error: %@",  v28,  v29,  v30,  v31,  (uint64_t)v212);
    id v24 = 0LL;
    id v186 = 0LL;
    id v208 = 0LL;
    id v209 = 0LL;
    v202 = 0LL;
    uint64_t v203 = 0LL;
    id v200 = 0LL;
    id v201 = 0LL;
    id v198 = 0LL;
    id v199 = 0LL;
    uint64_t v206 = 0LL;
    id v189 = 0LL;
    id v190 = 0LL;
    id v191 = 0LL;
    id v193 = 0LL;
    id v195 = 0LL;
    id v197 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v33 = -16LL;
LABEL_39:
    uint64_t v82 = v213;
    goto LABEL_40;
  }

  uint64_t v204 = (uint64_t)[v7 statusCode];
  if (v8)
  {
    unint64_t v13 = downloadResultForNetworkFailure(v204, v8, 0LL);
    id v14 = stringForMADownloadResult(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v212 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"V2 networking issue error - %ld %@",  v13,  v15));

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:t hen:]_block_invoke",  @"There was a Pallas networking failure: %@ error: %@ for the request with nonce: %@",  v16,  v17,  v18,  v19,  (uint64_t)v212);
    id v24 = 0LL;
    id v186 = 0LL;
    id v208 = 0LL;
    uint64_t v203 = 0LL;
    id v201 = 0LL;
    id v199 = 0LL;
LABEL_36:
    uint64_t v206 = 0LL;
    id v200 = 0LL;
    v202 = 0LL;
LABEL_37:
    id v189 = 0LL;
    id v190 = 0LL;
    id v191 = 0LL;
    id v193 = 0LL;
    id v197 = 0LL;
    id v198 = 0LL;
    id v195 = 0LL;
    uint64_t v32 = 0LL;
    id v209 = 0LL;
LABEL_38:
    uint64_t v33 = v204;
    goto LABEL_39;
  }

  if ((unint64_t)(v204 - 200) < 2)
  {
    v212 = 0LL;
    char v34 = 0;
  }

  else if (v204 == 422)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:t hen:]_block_invoke",  @"There was no match for the requested product marketing version",  v9,  v10,  v11,  v12,  v180);
    *(void *)(*(void *)(*(void *)(a1 + 160) + 8LL) + 24LL) = 3LL;
    uint64_t v204 = -17LL;
    char v34 = 1;
    v212 = @"No match for the requested product marketing version";
  }

  else if (v204 == 304)
  {
    *(void *)(*(void *)(*(void *)(a1 + 160) + 8LL) + 24LL) = 4LL;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:t hen:]_block_invoke",  @"Asset set id matched so received 304 response",  v9,  v10,  v11,  v12,  v180);
    v212 = 0LL;
    char v34 = 1;
    uint64_t v204 = 304LL;
  }

  else
  {
    unint64_t v35 = downloadResultForNetworkFailure(v204, 0LL, 0LL);
    uint64_t v36 = stringForMADownloadResult(v35);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v212 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"V2 networking issue status - %ld %@",  v35,  v37));

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:t hen:]_block_invoke",  @"There was a Pallas networking failure: %@ statusCode: %ld",  v38,  v39,  v40,  v41,  (uint64_t)v212);
    char v34 = 1;
  }

  id v42 = objc_autoreleasePoolPush();
  id v43 = v207;
  uint64_t v44 = [v43 bytes];
  BOOL v45 = 0;
  uint64_t v46 = 0LL;
  unint64_t v47 = 0LL;
  uint64_t v225 = 0LL;
  uint64_t v227 = 0LL;
  uint64_t v228 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v229 = 0LL;
  uint64_t v226 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v224 = 0LL;
  uint64_t v48 = 4LL;
  while (v47 < (unint64_t)[v43 length])
  {
    BOOL v53 = v44[v47] == 46;
    if (v44[v47] == 46)
    {
      if (++v46 == 3) {
        goto LABEL_26;
      }
    }

    else
    {
      if (v45) {
        *(&v224 + 2 * v46) = v47;
      }
      ++*(&v224 + 2 * v46 + 1);
    }

    ++v47;
    BOOL v45 = v53;
  }

  uint64_t v48 = v46 + 1;
  if (v46 != 2)
  {
LABEL_26:
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager pallasRequestV2:normalizedType:withPurpose:options:using:with:autoAssetJob:clientName:t hen:]_block_invoke",  @"Pallas JWS parsing did not yield 3 elements, elements: %lu bytes: %s",  v49,  v50,  v51,  v52,  v48);
    char v59 = v34;
    uint64_t v203 = 0LL;
    if ((v34 & 1) == 0)
    {
      uint64_t v204 = -1LL;
      uint64_t v71 = @"V2 JWS parsing did not yield 3 elements";
LABEL_29:
      id v201 = 0LL;
      goto LABEL_30;
    }

id __110__DownloadManager_pallasRequestV2_normalizedType_withPurpose_options_using_with_autoAssetJob_clientName_then___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)syncSplunkTasks
{
  splunkSession = self->_splunkSession;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __34__DownloadManager_syncSplunkTasks__block_invoke;
  v9[3] = &unk_34ED58;
  v9[4] = self;
  -[NSURLSession getAllTasksWithCompletionHandler:](splunkSession, "getAllTasksWithCompletionHandler:", v9);
}

void __34__DownloadManager_syncSplunkTasks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) splunkStateQueue]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __34__DownloadManager_syncSplunkTasks__block_invoke_2;
  v7[3] = &unk_34DB98;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __34__DownloadManager_syncSplunkTasks__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        id v14 = 0LL;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v14);
          uint64_t v16 = objc_autoreleasePoolPush();
          if (v15)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 taskDescription]);
            uint64_t v22 = v17;
            if (v17 && [v17 isEqualToString:@"bathFileForSendingEvents"])
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager syncSplunkTasks]_block_invoke_2",  @"We are batching",  v18,  v19,  v20,  v21,  v27);
              [*(id *)(a1 + 40) setCurrentlyBatchingSplunk:1];
            }

            else
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager syncSplunkTasks]_block_invoke_2",  @"Not batching",  v18,  v19,  v20,  v21,  v27);
            }
          }

          objc_autoreleasePoolPop(v16);
          id v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v12);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setHaveSyncedSplunkState:", 1, (void)v27);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager syncSplunkTasks]_block_invoke_2",  @"Syncing splunk complete",  v23,  v24,  v25,  v26,  v27);
}

void __47__DownloadManager_getCurrentInflightDownloads___block_invoke(uint64_t a1)
{
  uint64_t v25 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);
  id v3 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v27;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);
        id v9 = [v8 safeObjectForKey:v7 ofClass:objc_opt_class(DownloadInfo)];
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

        if (v10)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 task]);

          if (v15)
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 task]);
            -[NSMutableArray addObject:](v25, "addObject:", v20);
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke",  @"[%s] We should not have nil NSUrlSessionTask for a valid DownloadInfo for taskDescriptor:%@, skipping.",  v16,  v17,  v18,  v19,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke");
          }
        }

        else
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke",  @"[%s] We should not have nil DownloadInfo for a task descriptor for taskDescriptor:%@, skipping.",  v11,  v12,  v13,  v14,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke");
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v4);
  }

  -[NSMutableArray count](v25, "count");
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke",  @"[%s] Sync with NSURLSession is not possible; in-process downloads found %lu tasks",
    v21,
    v22,
    v23,
    v24,
    (uint64_t)"-[DownloadManager getCurrentInflightDownloads:]_block_invoke");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)startDownloadTask:(id)a3 downloadSize:(int64_t)a4 for:(id)a5 startingAt:(id)a6 withLength:(id)a7 extractWith:(id)a8 options:(id)a9 modified:(id)a10 session:(id)a11 isCachingServer:(BOOL)a12
{
  id v18 = a3;
  id v19 = a5;
  id v164 = a6;
  id v162 = a7;
  id v159 = a8;
  id v20 = a9;
  id v160 = a10;
  id v21 = a11;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager currentConfig](self, "currentConfig"));
  id v163 = [v22 copy];

  BOOL v166 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadStateQueue);
  uint64_t v161 = v21;
  uint64_t v157 = v18;
  uint64_t v158 = v19;
  id v156 = v20;
  if (v21)
  {
    if (v18)
    {
      int64_t v149 = a4;
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v18));
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_downloadTasksInFlight, "objectForKey:", v19));
      id v154 = v28;
      if (v28) {
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 firstClientName]);
      }
      else {
        uint64_t v29 = 0LL;
      }
      id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(v19);
      unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);
      uint64_t v39 = repositoryPath(v35);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      id v41 = ensureDirectory(v40);

      id v49 = normalizedAssetType((uint64_t)v35, v42, v43, v44, v45, v46, v47, v48);
      uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
      uint64_t v150 = (void *)v29;
      uint64_t v51 = objc_claimAutoreleasedReturnValue( -[DownloadManager getUserAgentStringForClient:withAssetType:]( self,  "getUserAgentStringForClient:withAssetType:",  v29,  v50));
      [v27 setValue:v51 forHTTPHeaderField:@"User-Agent"];
      if (_MAPreferencesIsVerboseLoggingEnabled()) {
        _MobileAssetLog( 0LL,  7,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modifi ed:session:isCachingServer:]",  @"User Agent String is: %@",  v52,  v53,  v54,  v55,  v51);
      }
      uint64_t v152 = (void *)v51;
      id PathToStagedFile = getPathToStagedFile(v35, v19, 0);
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(PathToStagedFile);
      removeItem(v57);
      uint64_t v62 = 0LL;
      if (v164 && v162)
      {
        id v144 = [v164 intValue];
        uint64_t v62 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"bytes=%d-%d",  v144,  v144 + [v162 intValue] - 1));
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modifi ed:session:isCachingServer:]",  @"Range string is: %@",  v63,  v64,  v65,  v66,  v62);
        [v27 setValue:v62 forHTTPHeaderField:@"Range"];
      }

      uint64_t v153 = (void *)v50;
      uint64_t v151 = (void *)v62;
      if (v160)
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modifi ed:session:isCachingServer:]",  @"Setting ifModified header to: %@",  v58,  v59,  v60,  v61,  (uint64_t)v160);
        id v67 = ASHTTPDateStringForDate(v160);
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        [v27 setValue:v68 forHTTPHeaderField:@"If-Modified-Since"];
      }

      else
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modifi ed:session:isCachingServer:]",  @"IfModified empty",  v58,  v59,  v60,  v61,  v143);
      }

      id v21 = (id)objc_claimAutoreleasedReturnValue([v20 downloadAuthorizationHeader]);
      if ([v21 length])
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modifi ed:session:isCachingServer:]",  @"Attaching downloadAuthorizationHeader to the request",  v69,  v70,  v71,  v72,  v145);
        [v27 setValue:v21 forHTTPHeaderField:@"Authorization"];
        if (!v20) {
          goto LABEL_20;
        }
      }

      else
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modifi ed:session:isCachingServer:]",  @"No downloadAuthorizationHeader provided",  v69,  v70,  v71,  v72,  v145);
        if (!v20)
        {
LABEL_20:
          uint64_t v73 = objc_claimAutoreleasedReturnValue([v161 downloadTaskWithRequest:v27]);
          if (!v73)
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:mo dified:session:isCachingServer:]",  @"Cannot start download with nil DownloadTask",  v77,  v78,  v79,  v80,  v146);
            id v155 = 0LL;
            uint64_t v37 = 0LL;
            id v18 = v57;
            uint64_t v32 = v150;
            uint64_t v33 = v153;
            uint64_t v31 = v154;
            uint64_t v36 = v27;
            char v34 = v152;
LABEL_60:
            __int128 v30 = v151;
            goto LABEL_61;
          }

          uint64_t v81 = (void *)v73;
          uint64_t v82 = v27;
          uint64_t v83 = calculateTimeout(v149, v74, v75, v76, v77, v78, v79, v80);
          uint64_t v84 = v83;
          uint64_t v148 = v57;
          if (v20)
          {
            else {
              uint64_t v85 = 2LL;
            }
            objc_msgSend(v81, "set_discretionaryOverride:", v85);
            if (a12)
            {
              uint64_t v93 = calculateTimeout(v149, v86, v87, v88, v89, v90, v91, v92);
              if (v93 >= 3600) {
                uint64_t v94 = 3600LL;
              }
              else {
                uint64_t v94 = v93;
              }
              uint64_t v95 = v81;
              uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v94));
              [v96 doubleValue];
              objc_msgSend(v95, "set_timeoutIntervalForResource:");

              uint64_t v81 = v95;
              uint64_t v32 = v150;
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options: modified:session:isCachingServer:]",  @"Setting the time out on: %@ to: %ld due to caching server",  v97,  v98,  v99,  v100,  (uint64_t)v19);
            }

            else
            {
              uint64_t v32 = v150;
              if ((uint64_t)[v20 timeoutIntervalForResource] < 1)
              {
                objc_msgSend(v81, "set_timeoutIntervalForResource:", (double)v84);
                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:option s:modified:session:isCachingServer:]",  @"Setting the time out on: %@ to: %ld due to options specifying to use default",  v112,  v113,  v114,  v115,  (uint64_t)v19);
              }

              else
              {
                uint64_t v106 = v81;
                uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v20 timeoutIntervalForResource]));
                [v107 doubleValue];
                objc_msgSend(v106, "set_timeoutIntervalForResource:");

                uint64_t v81 = v106;
                uint64_t v32 = v150;
                [v20 timeoutIntervalForResource];
                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:option s:modified:session:isCachingServer:]",  @"Setting the time out on: %@ to: %ld due to options",  v108,  v109,  v110,  v111,  (uint64_t)v19);
              }
            }

            uint64_t v105 = v159;
          }

          else
          {
            objc_msgSend(v81, "set_timeoutIntervalForResource:", (double)v83);
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:mo dified:session:isCachingServer:]",  @"Setting the time out on: %@ to: %ld due to nil options",  v101,  v102,  v103,  v104,  (uint64_t)v19);
            uint64_t v105 = v159;
            uint64_t v32 = v150;
          }

          if (_MAPreferencesIsInternalAllowed())
          {
            char v165 = 0;
            unsigned int AppBooleanValue = _MAPreferencesGetAppBooleanValue( @"ForceNonDiscretionaryDownload",  &v165);
            if (v165)
            {
              if (AppBooleanValue)
              {
                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:option s:modified:session:isCachingServer:]",  @"Forcing non-discretionary download",  v117,  v118,  v119,  v120,  v147);
                objc_msgSend(v81, "set_discretionaryOverride:", 2);
              }
            }
          }

          if (v105)
          {
            uint64_t v121 = objc_opt_class(&OBJC_CLASS___STRemoteExtractor);
            char isKindOfClass = objc_opt_isKindOfClass(v105, v121);
            if (v19 && (isKindOfClass & 1) != 0) {
              [v105 setSessionID:v19];
            }
            objc_msgSend(v81, "set_extractor:", v105);
          }

          [v81 setTaskDescription:v19];
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modi fied:session:isCachingServer:]",  @"The download size is: %llu",  v123,  v124,  v125,  v126,  v149);
          if (v149 >= 1) {
            [v81 setCountOfBytesClientExpectsToReceive:v149];
          }
          [v163 setDiscretionary:1];
          objc_msgSend(v163, "set_allowsExpensiveAccess:", objc_msgSend(v20, "allowsExpensiveAccess"));
          objc_msgSend(v163, "set_requiresPowerPluggedIn:", objc_msgSend(v20, "requiresPowerPluggedIn"));
          if ((backgroundDownloadsPossibleWithInfo(&v166) & 1) == 0)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:mo dified:session:isCachingServer:]",  @"Downloading in foreground: %@, removing timeout. (forced inProc: %d)",  v127,  v128,  v129,  v130,  (uint64_t)v19);
            objc_msgSend(v163, "set_socketStreamProperties:", &off_38FCA0);
          }

          id PathToTempDownloadFile = getPathToTempDownloadFile(v35, v19, 1);
          id v132 = (void *)objc_claimAutoreleasedReturnValue(PathToTempDownloadFile);
          id v155 = v132;
          if (v132)
          {
            int v133 = v132;
            if ((removeItem(v132) & 1) == 0)
            {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options: modified:session:isCachingServer:]",  @"Download failed for: %@, could not remove temp file before starting",  v134,  v135,  v136,  v137,  (uint64_t)v19);

              uint64_t v37 = 0LL;
              uint64_t v33 = v153;
              uint64_t v31 = v154;
              uint64_t v36 = v27;
LABEL_59:
              char v34 = v152;
              id v18 = v148;
              goto LABEL_60;
            }

            uint64_t v138 = v81;
            uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue([v133 path]);
            objc_msgSend(v138, "set_pathToDownloadTaskFile:", v139);

            uint64_t v81 = v138;
          }

          [v81 _adoptEffectiveConfiguration:v163];
          if (__isPlatformVersionAtLeast(3, 17, 0, 0)
            && (objc_opt_respondsToSelector(v81, "set_sourceApplicationBundleIdentifierForMobileAsset:") & 1) != 0)
          {
            uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager clientIdentifierWithName:](self, "clientIdentifierWithName:", v32));
            objc_msgSend(v81, "set_sourceApplicationBundleIdentifierForMobileAsset:", v140);
          }

          [v81 resume];
          uint64_t v37 = v81;
          uint64_t v33 = v153;
          uint64_t v31 = v154;
          uint64_t v36 = v82;
          goto LABEL_59;
        }
      }

      [v20 logOptions];
      objc_msgSend(v27, "setAllowsCellularAccess:", objc_msgSend(v20, "allowsCellularAccess"));
      goto LABEL_20;
    }

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modified:s ession:isCachingServer:]",  @"Cannot start download with nil URL",  v23,  v24,  v25,  v26,  v143);
    id v155 = 0LL;
    __int128 v30 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
    char v34 = 0LL;
    id v21 = 0LL;
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modified:s ession:isCachingServer:]",  @"Cannot download without a valid session",  v23,  v24,  v25,  v26,  v143);
    id v18 = 0LL;
    id v155 = 0LL;
    __int128 v30 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
    char v34 = 0LL;
  }

  unint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
LABEL_61:
  id v141 = v37;

  return v141;
}

- (id)startDownloadTask:(id)a3 downloadSize:(int64_t)a4 for:(id)a5 startingAt:(id)a6 withLength:(id)a7 extractWith:(id)a8 options:(id)a9 modified:(id)a10 session:(id)a11
{
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager currentSession](self, "currentSession"));
  LOBYTE(v28) = 0;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[DownloadManager startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modified:session:isCachingServer:]( self,  "startDownloadTask:downloadSize:for:startingAt:withLength:extractWith:options:modified:session:isCachingServer:",  v24,  a4,  v23,  v22,  v21,  v20,  v19,  v18,  v25,  v28));

  return v26;
}

- (void)applyTransforms:(id)a3 toAssets:(id)a4
{
  id v5 = a3;
  id v34 = a4;
  if (v5)
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 allKeys]);
    id v36 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v47;
      id v33 = v5;
      do
      {
        id v6 = 0LL;
        do
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)v6);
          id v8 = objc_autoreleasePoolPush();
          uint64_t v40 = v7;
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v7]);
          uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0
            && ([@"data" isEqualToString:v9] & 1) == 0)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransforms:toAssets:]",  @"Invalid transform, skipping: %@",  v11,  v12,  v13,  v14,  (uint64_t)v9);
          }

          else
          {
            uint64_t v37 = v9;
            uint64_t v38 = v8;
            uint64_t v39 = v6;
            __int128 v44 = 0u;
            __int128 v45 = 0u;
            __int128 v42 = 0u;
            __int128 v43 = 0u;
            id v41 = v34;
            id v15 = [v41 countByEnumeratingWithState:&v42 objects:v50 count:16];
            uint64_t v16 = v40;
            if (v15)
            {
              id v17 = v15;
              uint64_t v18 = *(void *)v43;
              do
              {
                id v19 = 0LL;
                do
                {
                  if (*(void *)v43 != v18) {
                    objc_enumerationMutation(v41);
                  }
                  id v20 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v19);
                  id v21 = objc_autoreleasePoolPush();
                  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
                  if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
                  {
                    uint64_t v27 = v18;
                    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v16]);
                    if (v28)
                    {
                      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
                      if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0)
                      {
                        __int128 v30 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v28,  0LL);
                        [v20 setObject:v30 forKey:v40];

                        uint64_t v16 = v40;
                      }
                    }

                    uint64_t v18 = v27;
                  }

                  else
                  {
                    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransforms:toAssets:]",  @"Skipping asset as it isn't a dict",  v23,  v24,  v25,  v26,  v31);
                  }

                  objc_autoreleasePoolPop(v21);
                  id v19 = (char *)v19 + 1;
                }

                while (v17 != v19);
                id v17 = [v41 countByEnumeratingWithState:&v42 objects:v50 count:16];
              }

              while (v17);
            }

            id v5 = v33;
            id v8 = v38;
            id v6 = v39;
            id v9 = v37;
          }

          objc_autoreleasePoolPop(v8);
          id v6 = (char *)v6 + 1;
        }

        while (v6 != v36);
        id v36 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }

      while (v36);
    }
  }
}

- (void)applyTransformsAndCheckReceipts:(id)a3 transformations:(id)a4 assetType:(id)a5 assets:(id)a6 receiptResults:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v79 = a5;
  id v13 = a6;
  uint64_t v80 = v12;
  -[DownloadManager applyTransforms:toAssets:](self, "applyTransforms:toAssets:", v12, v13);
  uint64_t v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id v15 = v13;
  id v92 = [v15 countByEnumeratingWithState:&v93 objects:v97 count:16];
  if (v92)
  {
    int v82 = 0;
    int v83 = 0;
    int v16 = 0;
    LODWORD(v17) = 0;
    uint64_t v91 = *(void *)v94;
    id v89 = v15;
    do
    {
      int v85 = v17;
      for (i = 0LL; i != v92; i = (char *)i + 1)
      {
        if (*(void *)v94 != v91) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(void **)(*((void *)&v93 + 1) + 8LL * (void)i);
        id v20 = objc_autoreleasePoolPush();
        id v21 = [v11 count];
        if (v21 != -[NSMutableArray count](v14, "count"))
        {
          id v22 = -[NSMutableArray count](v14, "count");
          [v11 count];
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"Wrong number of receipt results %ld vs %ld",  v23,  v24,  v25,  v26,  (uint64_t)v22);
        }

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"_AssetReceipt"]);
        [v11 addObject:v19];
        if (v27)
        {
          uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
          {
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AssetReceipt"]);
            uint64_t v30 = objc_claimAutoreleasedReturnValue([v27 objectForKey:@"AssetSignature"]);
            uint64_t v31 = (void *)v30;
            if (v29 && v30)
            {
              int v90 = v16;
              int64_t v32 = +[PallasResponseVerifier verifyReceipt:withSignature:]( &OBJC_CLASS___PallasResponseVerifier,  "verifyReceipt:withSignature:",  v29,  v30);
              uint64_t v33 = v32;
              if (v32 && v32 != 101)
              {
                uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v32));
                -[NSMutableArray addObject:](v14, "addObject:", v52);

                _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"Asset failed receipt check with error %ld: %@",  v53,  v54,  v55,  v56,  v33);
                id v15 = v89;
              }

              else
              {
                id v34 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v29,  0LL);
                if (v34)
                {
                  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v34,  0LL,  0LL));
                  uint64_t v88 = v35;
                  if (v35)
                  {
                    uint64_t v86 = v34;
                    uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 objectForKey:@"Measurement"]);
                    uint64_t v87 = (void *)v36;
                    if (v36)
                    {
                      uint64_t v37 = v36;
                      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"_Measurement"]);
                      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v84 base64EncodedStringWithOptions:0]);
                      if ([v38 isEqualToString:v37])
                      {
                        -[NSMutableArray addObject:](v14, "addObject:", &off_38EFB0);
                        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"Asset passed receipt validation",  v39,  v40,  v41,  v42,  v78);
                        if (v33 == 101) {
                          int v43 = v82 + 1;
                        }
                        else {
                          int v43 = v82;
                        }
                        int v82 = v43;
                        ++v83;
                      }

                      else
                      {
                        -[NSMutableArray addObject:](v14, "addObject:", &off_38EF98);
                        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"Asset failed receipt check as measurements are not equal",  v69,  v70,  v71,  v72,  v78);
                      }

                      id v15 = v89;
                      id v34 = v86;
                    }

                    else
                    {
                      -[NSMutableArray addObject:](v14, "addObject:", &off_38EF80);
                      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"Asset failed receipt due to nil receiptMeasurement",  v65,  v66,  v67,  v68,  v78);
                      id v15 = v89;
                    }
                  }

                  else
                  {
                    -[NSMutableArray addObject:](v14, "addObject:", &off_38EF68);
                    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"Asset failed receipt due to nil receiptFields",  v61,  v62,  v63,  v64,  v78);
                    id v15 = v89;
                  }
                }

                else
                {
                  -[NSMutableArray addObject:](v14, "addObject:", &off_38EF50);
                  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"Asset failed receipt due to nil receiptFieldData",  v57,  v58,  v59,  v60,  v78);
                  id v15 = v89;
                }
              }

              int v16 = v90;
            }

            else
            {
              -[NSMutableArray addObject:](v14, "addObject:", &off_38EF38);
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"The content or signature is null, skipping",  v48,  v49,  v50,  v51,  v78);
            }

            ++v16;
          }

          else
          {
            -[NSMutableArray addObject:](v14, "addObject:", &off_38EF20);
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"The receipt is not a dictionary",  v44,  v45,  v46,  v47,  v78);
          }
        }

        else
        {
          -[NSMutableArray addObject:](v14, "addObject:", &off_38EF08);
        }

        objc_autoreleasePoolPop(v20);
      }

      uint64_t v17 = (v85 + (_DWORD)v92);
      id v92 = [v15 countByEnumeratingWithState:&v93 objects:v97 count:16];
    }

    while (v92);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]",  @"MobileAsset receipt results: Total: %d With Receipt: %d Valid: %d Valid But Expired: %d",  v73,  v74,  v75,  v76,  v17);
  uint64_t v77 = v14;
  *a7 = v77;
}

- (int64_t)massageXmlAndPersist:(id)a3 catalogInfo:(id)a4 descriptor:(id)a5 assets:(id)a6 transformations:(id)a7 to:(id)a8 postedDate:(id)a9 receiptResults:(id *)a10 assetSetId:(id)a11 pallasUrl:(id)a12 considerCaching:(BOOL)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a11;
  uint64_t v27 = v24;
  id v91 = a12;
  if (!v24)
  {
    uint64_t v58 = @"Cannot persist xml as there is no target location";
LABEL_20:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:receip tResults:assetSetId:pallasUrl:considerCaching:]",  v58,  v28,  v29,  v30,  v31,  v82);
LABEL_21:
    int64_t v59 = 5LL;
    goto LABEL_22;
  }

  if (!v22)
  {
    uint64_t v58 = @"massageXmlAndPersist called with no assets ";
    goto LABEL_20;
  }

  [v22 count];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:receiptR esults:assetSetId:pallasUrl:considerCaching:]",  @"Catalog download for: %@ got: %ld assets",  v32,  v33,  v34,  v35,  (uint64_t)v19);
  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v22, v36) & 1) == 0)
  {
    uint64_t v58 = @"massageXmlAndPersist asset contents were not an array";
    goto LABEL_20;
  }

  if (v23)
  {
    uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v23, v37) & 1) == 0)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:rece iptResults:assetSetId:pallasUrl:considerCaching:]",  @"Skipping transformations due to object being incorrect type",  v38,  v39,  v40,  v41,  v82);
      int64_t v59 = 17LL;
      goto LABEL_22;
    }
  }

  id v89 = self;
  uint64_t v42 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v19, @"AssetType");
  if (v26)
  {
    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v26, @"CachedAssetSetId");
    if (a13)
    {
      downloadStateQueue = (dispatch_queue_s *)v89->_downloadStateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __152__DownloadManager_massageXmlAndPersist_catalogInfo_descriptor_assets_transformations_to_postedDate_receiptResults_assetSetId_pallasUrl_considerCaching___block_invoke;
      block[3] = &unk_34DB70;
      void block[4] = v89;
      id v97 = v26;
      id v98 = v19;
      dispatch_async(downloadStateQueue, block);
    }
  }

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v44, @"lastTimeChecked");

  if (v20) {
    uint64_t v45 = v20;
  }
  else {
    uint64_t v45 = &__NSDictionary0__struct;
  }
  -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v45, @"catalogInfo");
  if (v91)
  {
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v91 absoluteString]);
    -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v46, @"DownloadedFromLive");
  }

  uint64_t v88 = v42;
  if (v25)
  {
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v89->_dateFormatter, "dateFromString:", v25));
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:receip tResults:assetSetId:pallasUrl:considerCaching:]",  @"The live asset server posting date is: %@",  v48,  v49,  v50,  v51,  (uint64_t)v47);
    if (v47) {
      -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v47, @"postedDate");
    }
    else {
      _MobileAssetFault( (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:rece iptResults:assetSetId:pallasUrl:considerCaching:]",  @"Cannot parse posting date: '%@'",  v52,  v53,  v54,  v55,  v56,  v57,  (uint64_t)v25);
    }
  }

  uint64_t v61 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  -[NSMutableDictionary setObject:forKey:](v88, "setObject:forKey:", v61, @"Assets");
  if ([v22 count]) {
    -[DownloadManager applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:]( v89,  "applyTransformsAndCheckReceipts:transformations:assetType:assets:receiptResults:",  v61,  v23,  v19,  v22,  a10);
  }
  else {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:receip tResults:assetSetId:pallasUrl:considerCaching:]",  @"massageXmlAndPersist called with no assets ",  v62,  v63,  v64,  v65,  v82);
  }
  id ControlManager = getControlManager();
  int v90 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
  if (!v90 || !v88)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate:receip tResults:assetSetId:pallasUrl:considerCaching:]",  @"Cannot write xml as control manager is nil",  v67,  v68,  v69,  v70,  v82);

    goto LABEL_21;
  }

  int v83 = v61;
  uint64_t v84 = v27;
  id v85 = v23;
  id v87 = v20;
  unsigned int updated = isSoftwareUpdateType(v19);
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  id v86 = v22;
  id v72 = v22;
  id v73 = [v72 countByEnumeratingWithState:&v92 objects:v99 count:16];
  if (v73)
  {
    id v74 = v73;
    uint64_t v75 = *(void *)v93;
    do
    {
      for (i = 0LL; i != v74; i = (char *)i + 1)
      {
        if (*(void *)v93 != v75) {
          objc_enumerationMutation(v72);
        }
        [*(id *)(*((void *)&v92 + 1) + 8 * (void)i) removeObjectForKey:@"_AssetReceipt"];
        if (updated) {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:catalogInfo:descriptor:assets:transformations:to:postedDate: receiptResults:assetSetId:pallasUrl:considerCaching:]",  @"assetType: %@ asset: %@",  v77,  v78,  v79,  v80,  (uint64_t)v19);
        }
      }

      id v74 = [v72 countByEnumeratingWithState:&v92 objects:v99 count:16];
    }

    while (v74);
  }

  [v90 ensureSUDownloadTempDir];
  uint64_t v27 = v84;
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v84 path]);
  [v90 writeDictionaryToFile:v88 to:v81 with:v21];

  int64_t v59 = 31LL;
  id v20 = v87;
  id v23 = v85;
  id v22 = v86;
LABEL_22:

  return v59;
}

void __152__DownloadManager_massageXmlAndPersist_catalogInfo_descriptor_assets_transformations_to_postedDate_receiptResults_assetSetId_pallasUrl_considerCaching___block_invoke( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedMetaDataForAssetType]);
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (int64_t)massageXmlAndPersist:(id)a3 from:(id)a4 to:(id)a5 with:(id)a6 postedDate:(id)a7 considerCaching:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v76 = v17;
  id PathToStagedFile = getPathToStagedFile(v14, v17, 0);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(PathToStagedFile);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"The staging path is: %@ from %@ target %@",  v21,  v22,  v23,  v24,  (uint64_t)v20);
  if (!v16 || !v20)
  {
    uint64_t v45 = v18;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"Cannot persist xml as there is no target location for copying %@ to %@ for %@",  v25,  v26,  v27,  v28,  (uint64_t)v20);
    uint64_t v46 = 0LL;
    uint64_t v47 = 0LL;
    uint64_t v48 = 0LL;
    uint64_t v29 = 0LL;
LABEL_14:
    int64_t v53 = 5LL;
    goto LABEL_15;
  }

  BOOL v75 = v8;
  id v79 = 0LL;
  uint64_t v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfURL:error:",  v20,  &v79));
  id v30 = v79;
  uint64_t v35 = v30;
  if (v30 || !v29)
  {
    uint64_t v45 = v18;
    if (v30)
    {
      id v73 = (void *)objc_claimAutoreleasedReturnValue([v30 checkedDescription]);
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"could not load xml file after download: %@ from %@.  Error: %@",  v49,  v50,  v51,  v52,  (uint64_t)v20);
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"could not load xml file after download: %@ from %@.  Error: %@",  v31,  v32,  v33,  v34,  (uint64_t)v20);
    }

    goto LABEL_13;
  }

  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  if ((objc_opt_isKindOfClass(v29, v36) & 1) == 0)
  {
    uint64_t v45 = v18;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"xml file contents were not a dictionary: %@ from %@",  v37,  v38,  v39,  v40,  (uint64_t)v20);
    goto LABEL_13;
  }

  if (_MobileAssetVerifyAssetMapSignature(v29))
  {
    uint64_t v45 = v18;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"xml file failed signature check: %@ from %@",  v41,  v42,  v43,  v44,  (uint64_t)v16);
LABEL_13:
    uint64_t v46 = 0LL;
    uint64_t v47 = 0LL;
    uint64_t v48 = 0LL;
    goto LABEL_14;
  }

  id v74 = self;
  if (v15)
  {
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v15 absoluteString]);
    -[__CFDictionary setObject:forKey:](v29, "setObject:forKey:", v55, @"DownloadedFromXml");

    if ((objc_opt_respondsToSelector(v15, "URLByDeletingLastPathComponent") & 1) != 0)
    {
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v15 URLByDeletingLastPathComponent]);
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 URLByDeletingLastPathComponent]);
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 absoluteString]);

      if (v58) {
        -[__CFDictionary setObject:forKey:](v29, "setObject:forKey:", v58, @"DownloadedFrom");
      }
    }
  }

  -[__CFDictionary setObject:forKey:](v29, "setObject:forKey:", v14, @"AssetType");
  int64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[__CFDictionary setObject:forKey:](v29, "setObject:forKey:", v59, @"lastTimeChecked");

  if (v18)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"The xml posting date is: %@ for %@ from %@",  v60,  v61,  v62,  v63,  (uint64_t)v18);
    -[__CFDictionary setObject:forKey:](v29, "setObject:forKey:", v18, @"postedDate");
  }

  uint64_t v45 = v18;
  uint64_t v80 = @"isLiveServer";
  uint64_t v81 = &__kCFBooleanFalse;
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v81,  &v80,  1LL));
  -[__CFDictionary setObject:forKey:](v29, "setObject:forKey:", v46, @"catalogInfo");
  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v16 URLByDeletingLastPathComponent]);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v64 path]);

  id v65 = ensureDirectory(v47);
  id ControlManager = getControlManager();
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
  if (!v48)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]",  @"Cannot write xml for %@ as control manager is nil",  v67,  v68,  v69,  v70,  (uint64_t)v14);
    goto LABEL_14;
  }

  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
  [v48 writeDictionaryToFile:v29 to:v71 with:v76];

  if (v75)
  {
    downloadStateQueue = (dispatch_queue_s *)v74->_downloadStateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __80__DownloadManager_massageXmlAndPersist_from_to_with_postedDate_considerCaching___block_invoke;
    block[3] = &unk_34DB98;
    void block[4] = v74;
    id v78 = v14;
    dispatch_async(downloadStateQueue, block);
  }

  int64_t v53 = 31LL;
LABEL_15:

  return v53;
}

void __80__DownloadManager_massageXmlAndPersist_from_to_with_postedDate_considerCaching___block_invoke( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedMetaDataForAssetType]);
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)startDownloadAndUpdateState:(id)a3 for:(id)a4 modified:(id)a5 options:(id)a6 using:(id)a7 with:(id)a8 clientName:(id)a9 autoAssetJob:(id)a10 ofJobType:(id)a11
{
  id v26 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  if (v21) {

  }
    int64_t int64 = xpc_dictionary_get_int64(v21, "downloadSize");
  else {
    int64_t int64 = 0LL;
  }
  -[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:downloadSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]( self,  "startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:downloadSize:using:with:clientNam e:autoAssetJob:ofJobType:notify:spaceCheckedUUID:",  v26,  v17,  0LL,  0LL,  0LL,  v18,  v19,  int64,  v20,  v21,  v22,  v23,  v24,  0LL,  0LL);
}

- (void)addLiveServerRequest:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 audience:(id)a6 pallasUrl:(id)a7 using:(id)a8 with:(id)a9 clientName:(id)a10 autoAssetJobID:(id)a11 task:(id)a12 options:(id)a13
{
  id v60 = a3;
  id v19 = a4;
  id v55 = a5;
  id v20 = a6;
  id v58 = a7;
  id v21 = a8;
  id v22 = a9;
  id v59 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadStateQueue);
  uint64_t v27 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v32 = v27;
  uint64_t v56 = v23;
  uint64_t v57 = v21;
  if (v21 && v22)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v22);
    if (reply)
    {
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", reply, @"downloadManagerReplyKey");
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v57, @"downloadManagerConnectionKey");
    }
  }

  else if (v23)
  {
    -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v23, @"downloadManagerAutoAssetJobIDKey");
    -[NSMutableDictionary setObject:forKey:]( v32,  "setObject:forKey:",  @"catalog_job",  @"downloadManagerJobTypeKey");
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager addLiveServerRequest:forAssetType:withPurpose:audience:pallasUrl:using:with:clientName: autoAssetJobID:task:options:]",  @"{addLiveServerRequest} no reply or auto-job",  v28,  v29,  v30,  v31,  v54);
  }

  uint64_t v34 = v19;
  uint64_t v35 = v20;
  uint64_t v36 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v26->_downloadTasksInFlight, "objectForKey:", v60));
  uint64_t v41 = v55;
  if (v36)
  {
    id v42 = (id)v36;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addLiveServerRequest:forAssetType:withPurpose:audience:pallasUrl:using:with:clientName: autoAssetJobID:task:options:]",  @"Download already started for: %@",  v37,  v38,  v39,  v40,  (uint64_t)v60);
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addLiveServerRequest:forAssetType:withPurpose:audience:pallasUrl:using:with:clientName: autoAssetJobID:task:options:]",  @"Creating live asset download task for: %@",  v37,  v38,  v39,  v40,  (uint64_t)v60);
    id v42 = -[DownloadInfo initForAssetType:withPurpose:clientName:options:]( objc_alloc(&OBJC_CLASS___DownloadInfo),  "initForAssetType:withPurpose:clientName:options:",  v19,  v55,  v59,  v25);
    [v42 setIsPallas:1];
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v58 absoluteString]);
    [v42 setPallasUrl:v43];

    [v42 setAssetAudience:v35];
    [v42 setTaskDescriptor:v60];
    uint64_t v44 = objc_alloc_init(&OBJC_CLASS___NSDate);
    [v42 setDownloadStartTime:v44];

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v25 analyticsData]);
    if (v45)
    {
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v25 analyticsData]);
      [v42 setAnalyticsData:v46];

      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v42 analyticsData]);
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager addLiveServerRequest:forAssetType:withPurpose:audience:pallasUrl:using:with:clientNam e:autoAssetJobID:task:options:]",  @"{addLiveServerRequest} Additional AnalyticsInfo for task : %@",  v48,  v49,  v50,  v51,  (uint64_t)v47);
    }

    -[NSMutableDictionary setObject:forKey:](v26->_downloadTasksInFlight, "setObject:forKey:", v42, v60);
    uint64_t v41 = v55;
  }

  [v42 addNewDownloadInfo:v32];
  if (__isPlatformVersionAtLeast(3, 17, 0, 0)
    && (objc_opt_respondsToSelector(v24, "set_sourceApplicationBundleIdentifierForMobileAsset:") & 1) != 0)
  {
    uint64_t v52 = v41;
    int64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadManager clientIdentifierWithName:](v26, "clientIdentifierWithName:", v59));
    objc_msgSend(v24, "set_sourceApplicationBundleIdentifierForMobileAsset:", v53);

    uint64_t v41 = v52;
  }

  [v24 resume];
}

- (void)assessDownloadCompletion:(id)a3 originalUrl:(id)a4 taskDescription:(id)a5 taskId:(id)a6 error:(id)a7 moveFile:(BOOL)a8 extractorExists:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __110__DownloadManager_assessDownloadCompletion_originalUrl_taskDescription_taskId_error_moveFile_extractorExists___block_invoke;
  block[3] = &unk_34EE70;
  id v27 = v15;
  id v28 = v17;
  id v29 = v18;
  id v30 = v19;
  uint64_t v31 = self;
  id v32 = v16;
  BOOL v33 = a8;
  BOOL v34 = a9;
  id v21 = v16;
  id v22 = v19;
  id v23 = v18;
  id v24 = v17;
  id v25 = v15;
  dispatch_async(downloadStateQueue, block);
}

void __110__DownloadManager_assessDownloadCompletion_originalUrl_taskDescription_taskId_error_moveFile_extractorExists___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v9 = *(void **)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = (char *)[v9 statusCode];
    *(void *)&__int128 v40 = v10;
    *((void *)&v40 + 1) = *(void *)(a1 + 48);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extractorExi sts:]_block_invoke",  @"Download process complete for: %@, with %ld. task %@",  v11,  v12,  v13,  v14,  *(void *)(a1 + 40));
    if ((v10 == stru_B8.segname || v10 == (char *)&stru_108.size || v10 == &stru_B8.segname[6])
      && !*(void *)(a1 + 56))
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) lastModifiedDateFromResponse:*(void *)(a1 + 32)]);
      id v23 = (id)v19;
      id v42 = (id)v19;
      if (v10 != (char *)&stru_108.size && !v19)
      {
        uint64_t v41 = *(void *)(a1 + 72);
        __int128 v40 = *(_OWORD *)(a1 + 40);
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extracto rExists:]_block_invoke",  @"Server didn't return Last-Modified header on statusCode %lld for %@ download. task %@ downloaded from %@",  v20,  v21,  v22,  0LL,  (uint64_t)v10);
        id v23 = v42;
      }

      LOBYTE(v39) = v10 == (char *)&stru_108.size;
      objc_msgSend( *(id *)(a1 + 64),  "handleSuccessfulDownload:task:taskId:shouldMove:extractorExists:postedDate:notModified:",  *(void *)(a1 + 72),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 80),  *(unsigned __int8 *)(a1 + 81),  v23,  v39,  v40,  v41);

      return;
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extractorExi sts:]_block_invoke",  @"task: %@ completed with no response. task %@",  a5,  a6,  a7,  a8,  *(void *)(a1 + 40));
    uint64_t v10 = (_BYTE *)(&stru_158 + 56);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extractorExi sts:]_block_invoke",  @"Download process complete for: %@, with %ld. task %@",  v24,  v25,  v26,  v27,  *(void *)(a1 + 40));
  }

  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extractorExist s:]_block_invoke",  @"Error code is: %ld descriptor:%@ with %@ . task %@",  v15,  v16,  v17,  v18,  (uint64_t)v10);
  id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(*(void **)(a1 + 40));
  id v29 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);
  id PathToTempDownloadFile = getPathToTempDownloadFile(v29, *(void **)(a1 + 40), 0);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(PathToTempDownloadFile);
  id v32 = v31;
  if (v31) {
    removeItem(v31);
  }
  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) downloadTasksInFlight]);
  BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:*(void *)(a1 + 40)]);

  uint64_t v35 = downloadResultForNetworkFailure((int)v10, *(void **)(a1 + 56), v34);
  uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSError buildCheckedError:](&OBJC_CLASS___NSError, "buildCheckedError:", *(void *)(a1 + 56)));
  uint64_t v37 = (void *)v36;
  if (v36)
  {
    uint64_t v43 = @"CFNetworkError";
    uint64_t v44 = v36;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
  }

  else
  {
    uint64_t v38 = 0LL;
  }

  [*(id *)(a1 + 64) taskFinishedUpdateState:*(void *)(a1 + 40) with:v35 extraInfo:v38];
}

- (BOOL)downloadNeedsSSO:(id)a3 taskDescriptor:(id)a4 url:(id)a5
{
  return 0;
}

- (id)MACopyDawToken:(id)a3
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DownloadManager ssoQueue](self, "ssoQueue", a3));
  dispatch_assert_queue_V2(v3);

  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager MACopyDawToken:]",  @"%s called in an unsupported environment",  v4,  v5,  v6,  v7,  (uint64_t)"-[DownloadManager MACopyDawToken:]");
  return 0LL;
}

- (void)startDownloadAndUpdateState:(id)a3 for:(id)a4 startingAt:(id)a5 withLength:(id)a6 extractWith:(id)a7 modified:(id)a8 options:(id)a9 downloadSize:(int64_t)a10 using:(id)a11 with:(id)a12 clientName:(id)a13 autoAssetJob:(id)a14 ofJobType:(id)a15 notify:(unint64_t)a16 spaceCheckedUUID:(id)a17
{
  id v22 = a3;
  id v23 = a4;
  id v67 = a5;
  id v66 = a6;
  dispatch_queue_t v62 = (dispatch_queue_t)a7;
  id v64 = a8;
  id v24 = a9;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a17;
  id v72 = v22;
  id v74 = v23;
  unsigned int v31 = -[DownloadManager downloadNeedsSSO:taskDescriptor:url:]( self,  "downloadNeedsSSO:taskDescriptor:url:",  v24,  v23,  v22);
  if (v24 && v31)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:down loadSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]",  @"Download will be re-attempted after DAW token is obtained",  v32,  v33,  v34,  v35,  v58);
    dispatch_queue_t queue = (dispatch_queue_s *)self->_ssoQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __184__DownloadManager_startDownloadAndUpdateState_for_startingAt_withLength_extractWith_modified_options_downloadSize_using_with_clientName_autoAssetJob_ofJobType_notify_spaceCheckedUUID___block_invoke;
    block[3] = &unk_34EE98;
    void block[4] = self;
    id v89 = v24;
    id v90 = v23;
    uint64_t v36 = v25;
    id v91 = v25;
    id v92 = v26;
    id v93 = v27;
    id v94 = v28;
    id v95 = v29;
    id v96 = v22;
    id v97 = v67;
    id v98 = v66;
    uint64_t v37 = v29;
    dispatch_queue_t v99 = v62;
    id v100 = v64;
    int64_t v102 = a10;
    unint64_t v103 = a16;
    id v101 = v30;
    uint64_t v69 = (dispatch_queue_s *)v64;
    uint64_t v38 = v62;
    id v39 = v66;
    id v40 = v67;
    id v71 = v27;
    uint64_t v41 = v26;
    id v73 = v72;
    id v42 = v28;
    id v43 = v101;
    uint64_t v44 = (NSMutableDictionary *)v24;
    id v45 = v74;
    uint64_t v46 = v42;
    dispatch_async(queue, block);

    uint64_t v47 = v69;
  }

  else
  {
    id v61 = v25;
    id v60 = v29;
    if (v28)
    {
      id v48 = v29;
      dispatch_queue_t v49 = v62;
      uint64_t v50 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setSafeObject:forKey:]( v50,  "setSafeObject:forKey:",  v28,  @"downloadManagerAutoAssetJobIDKey");
      -[NSMutableDictionary setSafeObject:forKey:]( v50,  "setSafeObject:forKey:",  v48,  @"downloadManagerJobTypeKey");
      -[NSMutableDictionary setSafeObject:forKey:](v50, "setSafeObject:forKey:", v27, @"firstClientName");
    }

    else
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v26);
      if (reply)
      {
        uint64_t v50 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", reply, @"downloadManagerReplyKey");
        -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", v25, @"downloadManagerConnectionKey");
        -[NSMutableDictionary setSafeObject:forKey:](v50, "setSafeObject:forKey:", v27, @"firstClientName");
        xpc_object_t v52 = reply;
        int64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a16));
        -[NSMutableDictionary setObject:forKey:]( v50,  "setObject:forKey:",  v53,  @"downloadManagerNotificationInterval");

        xpc_object_t reply = v52;
      }

      else
      {
        uint64_t v50 = 0LL;
      }

      dispatch_queue_t v49 = v62;
    }

    downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = __184__DownloadManager_startDownloadAndUpdateState_for_startingAt_withLength_extractWith_modified_options_downloadSize_using_with_clientName_autoAssetJob_ofJobType_notify_spaceCheckedUUID___block_invoke_2;
    v75[3] = &unk_34EEE8;
    v75[4] = self;
    id v76 = v74;
    uint64_t v77 = v50;
    id v78 = v24;
    id v79 = v30;
    id v80 = v28;
    id v81 = v72;
    id v82 = v27;
    uint64_t v54 = v27;
    id v55 = v30;
    id v83 = v67;
    id v84 = v66;
    dispatch_queue_t v85 = v49;
    id v86 = v64;
    int64_t v87 = a10;
    id v65 = v64;
    uint64_t v70 = v49;
    uint64_t v38 = (dispatch_queue_s *)v66;
    id v39 = v67;
    id v40 = v54;
    id v71 = v72;
    id v73 = v28;
    id v56 = v55;
    id v43 = v24;
    uint64_t v46 = v56;
    uint64_t v44 = v50;
    id v57 = v74;
    dispatch_async(downloadStateQueue, v75);

    uint64_t v47 = v70;
    uint64_t v41 = v26;
    uint64_t v36 = v61;
    uint64_t v37 = v60;
  }
}

void __184__DownloadManager_startDownloadAndUpdateState_for_startingAt_withLength_extractWith_modified_options_downloadSize_using_with_clientName_autoAssetJob_ofJobType_notify_spaceCheckedUUID___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) MACopyDawToken:*(void *)(a1 + 40)]);
  if (v17)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:down loadSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]_block_invoke",  @"Successfully obtained SSO token..Relaunching download",  v9,  v10,  v11,  v12,  v16);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Bearer %@", v17));
    [*(id *)(a1 + 40) setDownloadAuthorizationHeader:v13];
    [*(id *)(a1 + 32) startDownloadAndUpdateState:*(void *)(a1 + 96) for:*(void *)(a1 + 48) startingAt:*(void *)(a1 + 104) withLength:*(void *)(a1 + 112) extractWith:*(void *)(a1 + 120) modified:*(void *)(a1 + 128) options:*(void *)(a1 + 40) downloadSize:*(void *)(a1 + 144) using:*(void *)(a1 + 56) with:*(void *)(a1 + 64) clientN ame:*(void *)(a1 + 72) autoAssetJob:*(void *)(a1 + 80) ofJobType:*(void *)(a1 + 88) notify:*(void *)(a1 + 152) spaceCheckedUUID:*(void *)(a1 + 136)];
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:down loadSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]_block_invoke",  @"Failed to acquire required SSO token for task(%@)",  v9,  v10,  v11,  v12,  *(void *)(a1 + 48));
    id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(*(void **)(a1 + 48));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);
    [*(id *)(a1 + 32) sendDownloadCannotStartResult:75 assetType:v13 connection:*(void *)(a1 + 56) requestMessage:*(void *)(a1 + 64) clientName:*(void *)(a1 + 72) autoAssetJobID:*(void *)(a1 + 80) ofJobType:*(void *)(a1 + 88) underlyingError:0];
  }
}

void __184__DownloadManager_startDownloadAndUpdateState_for_startingAt_withLength_extractWith_modified_options_downloadSize_using_with_clientName_autoAssetJob_ofJobType_notify_spaceCheckedUUID___block_invoke_2( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);
  id v3 = (DownloadInfo *)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (v3)
  {
    -[DownloadInfo addNewDownloadInfo:](v3, "addNewDownloadInfo:", *(void *)(a1 + 48));
    if (([*(id *)(a1 + 56) discretionary] & 1) == 0)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo task](v3, "task"));
      uint64_t v9 = (char *)[v8 _discretionaryOverride];

      if (v9 != (_BYTE *)&dword_0 + 2)
      {
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo task](v3, "task"));
        objc_msgSend(v35, "set_discretionaryOverride:", 2);

        -[DownloadInfo setIsDiscretionary:](v3, "setIsDiscretionary:", [*(id *)(a1 + 56) discretionary]);
        uint64_t v36 = objc_alloc_init(&OBJC_CLASS___NSDate);
        -[DownloadInfo setNonDiscretionaryUpgradeTime:](v3, "setNonDiscretionaryUpgradeTime:", v36);
      }
    }

    -[DownloadInfo isPallas](v3, "isPallas");
    -[DownloadInfo setSpaceCheckedUUID:](v3, "setSpaceCheckedUUID:", *(void *)(a1 + 64));
    -[DownloadInfo setIsAutoDownload:](v3, "setIsAutoDownload:", *(void *)(a1 + 72) != 0LL);
    uint64_t v37 = *(void *)(a1 + 80);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo task](v3, "task"));
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:down loadSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]_block_invoke_2",  @"Download already started for: %@ and %@. task %@ %@ %@",  v38,  v39,  v40,  v41,  v37);
LABEL_16:

    goto LABEL_17;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:downlo adSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]_block_invoke_2",  @"Creating asset download task for: %@, %@",  v4,  v5,  v6,  v7,  *(void *)(a1 + 40));
  id v3 = -[DownloadInfo initWithUrl:clientName:options:]( objc_alloc(&OBJC_CLASS___DownloadInfo),  "initWithUrl:clientName:options:",  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(void *)(a1 + 56));
  -[DownloadInfo addNewDownloadInfo:](v3, "addNewDownloadInfo:", *(void *)(a1 + 48));
  -[DownloadInfo setTaskDescriptor:](v3, "setTaskDescriptor:", *(void *)(a1 + 40));
  -[DownloadInfo setStartingAt:](v3, "setStartingAt:", *(void *)(a1 + 96));
  -[DownloadInfo setLengthOfRange:](v3, "setLengthOfRange:", *(void *)(a1 + 104));
  -[DownloadInfo setExtractor:](v3, "setExtractor:", *(void *)(a1 + 112));
  -[DownloadInfo setDate:](v3, "setDate:", *(void *)(a1 + 120));
  -[DownloadInfo setDownloadSize:](v3, "setDownloadSize:", *(void *)(a1 + 128));
  -[DownloadInfo setSpaceCheckedUUID:](v3, "setSpaceCheckedUUID:", *(void *)(a1 + 64));
  -[DownloadInfo setIsAutoDownload:](v3, "setIsAutoDownload:", *(void *)(a1 + 72) != 0LL);
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSDate);
  -[DownloadInfo setDownloadStartTime:](v3, "setDownloadStartTime:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) analyticsData]);
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) analyticsData]);
    -[DownloadInfo setAnalyticsData:](v3, "setAnalyticsData:", v12);
  }

  if (([*(id *)(a1 + 56) discretionary] & 1) == 0)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:down loadSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]_block_invoke_2",  @"Non discretionary download. Setting nonDiscretionaryUpgradeTime to downloadStartTime",  v13,  v14,  v15,  v16,  v42);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo downloadStartTime](v3, "downloadStartTime"));
    -[DownloadInfo setNonDiscretionaryUpgradeTime:](v3, "setNonDiscretionaryUpgradeTime:", v17);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v3 forKey:*(void *)(a1 + 40)];
  char v18 = backgroundDownloadsPossibleWithInfo(0LL);
  uint64_t v19 = *(void **)(a1 + 32);
  if ((v18 & 1) == 0)
  {
    uint64_t v23 = *(void *)(a1 + 120);
    uint64_t v43 = *(void *)(a1 + 128);
    uint64_t v44 = *(void *)(a1 + 80);
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 96);
    uint64_t v26 = *(void *)(a1 + 104);
    uint64_t v27 = *(void *)(a1 + 56);
    uint64_t v28 = *(void *)(a1 + 112);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v19 currentSession]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue( [v19 startDownloadTask:v44 downloadSize:v43 for:v24 startingAt:v25 withLength:v26 extractWith:v28 options:v27 modified:v23 session:v29]);

    if (!v30) {
      [*(id *)(a1 + 32) taskFinishedUpdateState:*(void *)(a1 + 40) with:30];
    }
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:down loadSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]_block_invoke_2",  @"The in process download url is: %@ and %@. task %@ options %@",  v31,  v32,  v33,  v34,  *(void *)(a1 + 80));
    -[DownloadInfo setTask:](v3, "setTask:", v30);
    goto LABEL_16;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadStateQueue]);
  v45[0] = _NSConcreteStackBlock;
  v45[2] = __184__DownloadManager_startDownloadAndUpdateState_for_startingAt_withLength_extractWith_modified_options_downloadSize_using_with_clientName_autoAssetJob_ofJobType_notify_spaceCheckedUUID___block_invoke_3;
  v45[3] = &unk_34EEC0;
  uint64_t v21 = *(void *)(a1 + 128);
  id v22 = *(void **)(a1 + 40);
  v45[4] = *(void *)(a1 + 32);
  uint64_t v53 = v21;
  v45[1] = 3221225472LL;
  id v46 = v22;
  id v47 = *(id *)(a1 + 96);
  id v48 = *(id *)(a1 + 104);
  id v49 = *(id *)(a1 + 112);
  id v50 = *(id *)(a1 + 56);
  id v51 = *(id *)(a1 + 120);
  id v3 = v3;
  xpc_object_t v52 = v3;
  -[DownloadInfo determineDownloadUrl:callback:](v3, "determineDownloadUrl:callback:", v20, v45);

LABEL_17:
  [*(id *)(a1 + 32) startDownloadTimer];
}

void __184__DownloadManager_startDownloadAndUpdateState_for_startingAt_withLength_extractWith_modified_options_downloadSize_using_with_clientName_autoAssetJob_ofJobType_notify_spaceCheckedUUID___block_invoke_3( uint64_t a1,  void *a2,  char a3)
{
  id v20 = a2;
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 currentSession]);
  LOBYTE(v18) = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v5 startDownloadTask:v20 downloadSize:v4 for:v6 startingAt:v7 withLength:v8 extractWith:v9 options:v10 modified:v11 session:v12 isCachingServer:v18]);

  if (!v13) {
    [*(id *)(a1 + 32) taskFinishedUpdateState:*(void *)(a1 + 40) with:30];
  }
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager startDownloadAndUpdateState:for:startingAt:withLength:extractWith:modified:options:downlo adSize:using:with:clientName:autoAssetJob:ofJobType:notify:spaceCheckedUUID:]_block_invoke_3",  @"The background download url is: %@ and %@. task %@ options %@",  v14,  v15,  v16,  v17,  (uint64_t)v20);
  [*(id *)(a1 + 88) setTask:v13];
}

- (BOOL)checkDownloadIsSyncing:(id)a3 using:(id)a4 with:(id)a5 autoAssetJob:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v17 = a6;
  int64_t currentState = self->_currentState;
  if (currentState == 3 || currentState == 0)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager checkDownloadIsSyncing:using:with:autoAssetJob:]",  @"%@ | Daemon not ready for download",  v13,  v14,  v15,  v16,  (uint64_t)v10);
    -[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]( self,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:",  13LL,  v11,  v12,  v17,  @"asset_job");
    BOOL v20 = 1;
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)checkAssetDownloadIsSkipped:(id)a3 connection:(id)a4 with:(id)a5 autoAssetJob:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v23 = 3LL;
  BOOL v14 = isForcedResultPreferenceSetForAssetType(@"ForceAssetDownloadResult", v10, &v23);
  if (v14)
  {
    unint64_t v15 = v23;
    uint64_t v16 = stringForMADownloadResult(v23);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v16);
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager checkAssetDownloadIsSkipped:connection:with:autoAssetJob:]",  @"Skipping asset download for %@ due to preferences, giving result %ld (%@)",  v17,  v18,  v19,  v20,  (uint64_t)v10);

    -[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]( self,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:",  v15,  v11,  v12,  v13,  @"asset_job");
  }

  return v14;
}

- (BOOL)checkCatalogDownloadIsSkipped:(id)a3 connection:(id)a4 with:(id)a5 autoAssetJob:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v23 = 3LL;
  BOOL v14 = isForcedResultPreferenceSetForAssetType(@"ForceCatalogDownloadResult", v10, &v23);
  if (v14)
  {
    unint64_t v15 = v23;
    uint64_t v16 = stringForMADownloadResult(v23);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v16);
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager checkCatalogDownloadIsSkipped:connection:with:autoAssetJob:]",  @"Skipping catalog download for %@ due to preferences, giving result %ld (%@)",  v17,  v18,  v19,  v20,  (uint64_t)v10);

    -[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]( self,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:",  v15,  v11,  v12,  v13,  @"catalog_job");
  }

  return v14;
}

- (BOOL)checkPmvDownloadIsSkipped:(id)a3 connection:(id)a4 with:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v20 = 3LL;
  BOOL v11 = isForcedResultPreferenceSetForAssetType(@"ForcePmvDownloadResult", v8, &v20);
  if (v11)
  {
    unint64_t v12 = v20;
    id v13 = stringForMADownloadResult(v20);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager checkPmvDownloadIsSkipped:connection:with:]",  @"Skipping catalog download for %@ due to preferences, giving result %ld (%@)",  v14,  v15,  v16,  v17,  (uint64_t)v8);

    -[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]( self,  "indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:",  v12,  v9,  v10,  0LL,  @"asset_job");
  }

  return v11;
}

- (void)registerAssetDownloadJob:(id)a3 forThis:(id)a4 withBase:(id)a5 relativeTo:(id)a6 startingAt:(id)a7 withLength:(id)a8 extractWith:(id)a9 allocateExtractorIfNecessary:(BOOL)a10 connection:(id)a11 message:(id)a12 clientName:(id)a13 notify:(unint64_t)a14 withCatalogMetadata:(id)a15 withSpaceCheckedUUID:(id)a16
{
  id v74 = a3;
  id v72 = a4;
  id v67 = a5;
  id v66 = a6;
  id v73 = a7;
  id v70 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a12;
  id v69 = a13;
  id v25 = a15;
  id v26 = a16;
  _MAPreferencesSync(@"registerAssetDownloadJob", v74);
  id v68 = v25;
  id v71 = v26;
  if (backgroundDownloadsPossibleWithInfo(0LL)
    && -[DownloadManager checkDownloadIsSyncing:using:with:autoAssetJob:]( self,  "checkDownloadIsSyncing:using:with:autoAssetJob:",  @"registerAssetDownloadJob",  v23,  v24,  0LL))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:forThis:withBase:relativeTo:startingAt:withLength:extractWith: allocateExtractorIfNecessary:connection:message:clientName:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Trying to create an asset download job while background sync is ongoing, bailing, %@",  v27,  v28,  v29,  v30,  (uint64_t)v74);
    uint64_t v31 = self;
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
    id v34 = v72;
    id v35 = v73;
    uint64_t v37 = v66;
    uint64_t v36 = v67;
    id v38 = v70;
    uint64_t v39 = v22;
    id v40 = v74;
LABEL_11:
    uint64_t v58 = v68;
    id v64 = v24;
    LOBYTE(v63) = a10;
    dispatch_queue_t v62 = v31;
    id v59 = v24;
    id v61 = v38;
    -[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:clientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]( v62,  "registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeTo:startingAt:withLength:ext ractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:clientName:performingAutoAssetJob:notify:w ithCatalogMetadata:withSpaceCheckedUUID:",  v40,  v32,  v33,  v34,  v36,  v37,  v35,  v38,  v39,  v63,  v23,  v64,  v69,  0LL,  a14,  v68,  v71);

    id v57 = v69;
    id v60 = v71;
    goto LABEL_12;
  }

  unsigned __int8 v41 = -[DownloadManager checkAssetDownloadIsSkipped:connection:with:autoAssetJob:]( self,  "checkAssetDownloadIsSkipped:connection:with:autoAssetJob:",  v74,  v23,  v24,  0LL);
  uint64_t v31 = self;
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  id v34 = v72;
  id v35 = v73;
  uint64_t v37 = v66;
  uint64_t v36 = v67;
  id v38 = v70;
  uint64_t v39 = v22;
  id v40 = v74;
  if ((v41 & 1) != 0) {
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v24, "Purpose");
  uint64_t v43 = normalizePurposeFromUtf8((uint64_t)string);
  id v65 = (void *)objc_claimAutoreleasedReturnValue(v43);
  if (isWellFormedPurpose(v65))
  {
    id v48 = downloadManagerDecodeClasses();
    id v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    id ObjectFromMessage = getObjectFromMessage(v24, "downloadOptionsLength", "downloadOptions", v49);
    id v51 = (void *)objc_claimAutoreleasedReturnValue(ObjectFromMessage);

    uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v51, v52) & 1) != 0)
    {
      uint64_t v33 = -[MAMsuDownloadOptions initWithPlist:]( objc_opt_new(&OBJC_CLASS___MAMsuDownloadOptions),  "initWithPlist:",  v51);

      id v40 = v74;
      id v34 = v72;
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:forThis:withBase:relativeTo:startingAt:withLength:extractWit h:allocateExtractorIfNecessary:connection:message:clientName:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"The asset download options for %@ and %@ were not a valid class, failing",  v53,  v54,  v55,  v56,  (uint64_t)v74);
      -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( v31,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  22LL,  v74,  v23,  v24,  v69,  0LL,  @"asset_job",  0LL);

      id v34 = v72;
      id v40 = v74;
      uint64_t v33 = 0LL;
    }

    id v35 = v73;
    id v38 = v70;
    uint64_t v39 = v22;
    uint64_t v32 = v65;
    goto LABEL_11;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:forThis:withBase:relativeTo:startingAt:withLength:extractWith:al locateExtractorIfNecessary:connection:message:clientName:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Trying to create a download job without a well formed purpose, bailing, %@",  v44,  v45,  v46,  v47,  (uint64_t)v74);
  id v57 = v69;
  -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( self,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  3LL,  v74,  v23,  v24,  v69,  0LL,  @"asset_job",  0LL);
  uint64_t v58 = v68;
  id v59 = v24;
  uint64_t v39 = v22;
  uint64_t v32 = v65;
  id v61 = v70;
  id v60 = v71;
LABEL_12:
}

- (void)registerAssetDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 clientName:(id)a6 usingDownloadOptions:(id)a7 forAssetId:(id)a8 withCatalogMetadata:(id)a9 withSpaceCheckedUUID:(id)a10
{
  id v35 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v21 = a8;
  id v22 = a5;
  id v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 safeStringForKey:@"__BaseURL"]);
  uint64_t v24 = objc_claimAutoreleasedReturnValue([v19 safeStringForKey:@"__RelativePath"]);
  uint64_t v29 = (void *)v24;
  if (v23 && v24)
  {
    LOBYTE(v32) = 1;
    -[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:clientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]( self,  "registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeTo:startingAt:withLength:ext ractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:clientName:performingAutoAssetJob:notify:w ithCatalogMetadata:withSpaceCheckedUUID:",  v16,  v22,  v18,  v21,  v23,  v24,  0LL,  0LL,  0LL,  v32,  0LL,  0LL,  v17,  v35,  0LL,  v19,  v20);
  }

  else
  {
    uint64_t v30 = @"MISSING";
    if (v23) {
      uint64_t v31 = v23;
    }
    else {
      uint64_t v31 = @"MISSING";
    }
    if (v24) {
      uint64_t v30 = (const __CFString *)v24;
    }
    uint64_t v33 = v31;
    id v34 = v30;
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:forAssetType:withPurpose:clientName:usingDownloadOptions:forAs setId:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Unable to register asset download job (catalog missing URLs) | autoAssetJobID:%@, assetType:%@, purpose:%@, assetId:%@ | baseURL:%@, relativeURL:%@",  v25,  v26,  v27,  v28,  (uint64_t)v35);

    -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( self,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  5LL,  v16,  0LL,  0LL,  v17,  v35,  @"asset_job",  0LL,  v22,  v21,  v33,  v34);
  }
}

- (void)registerAssetDownloadJob:(id)a3 withPurpose:(id)a4 usingDownloadOptions:(id)a5 forAssetId:(id)a6 withBase:(id)a7 relativeTo:(id)a8 startingAt:(id)a9 withLength:(id)a10 extractWith:(id)a11 allocateExtractorIfNecessary:(BOOL)a12 usingXPCConnection:(id)a13 withXPCMessage:(id)a14 clientName:(id)a15 performingAutoAssetJob:(id)a16 notify:(unint64_t)a17 withCatalogMetadata:(id)a18 withSpaceCheckedUUID:(id)a19
{
  id v24 = a3;
  id v90 = a4;
  id v84 = a5;
  id v91 = a6;
  id v83 = a7;
  id v82 = a8;
  id v80 = a9;
  id v79 = a10;
  id v85 = a11;
  id v88 = a13;
  id v87 = a14;
  id v86 = a15;
  id v25 = a16;
  id v89 = a18;
  id v78 = a19;
  uint64_t v131 = 0LL;
  id v132 = &v131;
  uint64_t v133 = 0x3032000000LL;
  uint64_t v134 = __Block_byref_object_copy__11;
  uint64_t v135 = __Block_byref_object_dispose__11;
  id v136 = 0LL;
  id v33 = normalizedAssetType((uint64_t)v24, v26, v27, v28, v29, v30, v31, v32);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  id v35 = assembleTaskDescriptorWithPurposeAndAutoAssetJobID((uint64_t)v34, (uint64_t)v91, v90, v25);
  uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
  uint64_t v37 = (void *)v132[5];
  v132[5] = v36;

  if (!v132[5])
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeT o:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:client Name:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Trying to create a download job with nil task descriptor, bailing, %@",  v38,  v39,  v40,  v41,  (uint64_t)v24);
    id v55 = 0LL;
    uint64_t v47 = 0LL;
    uint64_t v56 = 3LL;
    goto LABEL_6;
  }

  uint64_t v42 = objc_claimAutoreleasedReturnValue([v89 safeDictionaryForKey:@"RequiredFeatures"]);
  uint64_t v47 = (void *)v42;
  if (v42)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeT o:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:client Name:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Asset requires features: %@",  v43,  v44,  v45,  v46,  v42);
    id v129 = 0LL;
    id v130 = 0LL;
    unsigned __int8 v48 = [v47 areRequirementsMetByBrain:&v130 error:&v129];
    id v49 = v130;
    id v50 = v129;
    if (v50)
    {
      id v55 = v50;
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativ eTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:cl ientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Got an error trying to determine if brain has features required by asset: %@",  v51,  v52,  v53,  v54,  (uint64_t)v50);

      uint64_t v56 = 78LL;
LABEL_6:
      -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( self,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  v56,  v24,  v88,  v87,  v86,  v25,  @"asset_job",  v55,  v73,  v74,  v75,  v76,  v77);
      goto LABEL_21;
    }

    if ((v48 & 1) == 0)
    {
      _MobileAssetLog( 0LL,  4,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativ eTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:cl ientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Asset requires new features - need to look for a new brain that supports these features: %@",  v51,  v52,  v53,  v54,  (uint64_t)v49);
      id v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v69 setObject:v47 forKeyedSubscript:@"requiredFeatures"];
      [v69 setObject:&__kCFBooleanTrue forKeyedSubscript:@"relaunchBrain"];
      id v70 = &__kCFBooleanFalse;
      [v69 setObject:v70 forKeyedSubscript:@"nonDiscetionary"];
      id v71 = (void *)objc_claimAutoreleasedReturnValue([v84 downloadAuthorizationHeader]);
      [v69 setObject:v71 forKeyedSubscript:@"dawHeader"];

      id v72 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainUpdater sharedInstance](&OBJC_CLASS___MABrainUpdater, "sharedInstance"));
      v123[0] = _NSConcreteStackBlock;
      v123[1] = 3221225472LL;
      v123[2] = __287__DownloadManager_registerAssetDownloadJob_withPurpose_usingDownloadOptions_forAssetId_withBase_relativeTo_startingAt_withLength_extractWith_allocateExtractorIfNecessary_usingXPCConnection_withXPCMessage_clientName_performingAutoAssetJob_notify_withCatalogMetadata_withSpaceCheckedUUID___block_invoke;
      v123[3] = &unk_34EF38;
      v123[4] = self;
      id v124 = v24;
      id v125 = v88;
      id v126 = v87;
      id v127 = v86;
      id v128 = v25;
      [v72 update:v69 completion:v123];

      id v55 = 0LL;
      goto LABEL_21;
    }
  }

  id v55 = 0LL;
  if (v85 || !a12)
  {
    id v60 = v85;
  }

  else
  {
    id ControlManager = getControlManager();
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
    uint64_t v59 = v132[5];
    id v122 = 0LL;
    id v60 = [v58 newExtractor:v89 downloadOptions:v84 sessionID:v59 error:&v122];
    id v55 = v122;

    if (!v60)
    {
      id v76 = v82;
      id v77 = v55;
      id v74 = v91;
      id v75 = v83;
      id v73 = v90;
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativ eTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:cl ientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]",  @"Unable to register asset download job (unable to create catalog-based extractor) | autoAssetJobID:%@, assetType:%@, purpose:%@, assetId:%@ | baseURL:%@, relativeURL:%@ error:%@",  v61,  v62,  v63,  v64,  (uint64_t)v25);
      uint64_t v56 = 5LL;
      goto LABEL_6;
    }
  }

  uint64_t v116 = 0LL;
  uint64_t v117 = (id *)&v116;
  uint64_t v118 = 0x3032000000LL;
  uint64_t v119 = __Block_byref_object_copy__11;
  uint64_t v120 = __Block_byref_object_dispose__11;
  id v121 = 0LL;
  uint64_t v112 = 0LL;
  uint64_t v113 = &v112;
  uint64_t v114 = 0x2020000000LL;
  uint64_t v115 = 0LL;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472LL;
  v92[2] = __287__DownloadManager_registerAssetDownloadJob_withPurpose_usingDownloadOptions_forAssetId_withBase_relativeTo_startingAt_withLength_extractWith_allocateExtractorIfNecessary_usingXPCConnection_withXPCMessage_clientName_performingAutoAssetJob_notify_withCatalogMetadata_withSpaceCheckedUUID___block_invoke_2;
  v92[3] = &unk_34EF60;
  id v65 = v89;
  id v93 = v65;
  id v66 = v60;
  id v94 = v66;
  id v95 = v24;
  id v96 = v91;
  id v97 = v83;
  id v98 = v82;
  id v99 = v84;
  id v100 = v90;
  id v101 = self;
  uint64_t v108 = &v131;
  id v102 = v80;
  id v103 = v79;
  uint64_t v109 = &v112;
  id v104 = v88;
  id v105 = v87;
  id v106 = v86;
  id v107 = v25;
  uint64_t v110 = &v116;
  unint64_t v111 = a17;
  id v67 = objc_retainBlock(v92);
  id v68 = [v65 safeULLForKey:@"_DownloadSize"];
  id v85 = v66;
  v113[3] = (uint64_t)v68;
  if (v78) {
    objc_storeStrong(v117 + 5, a19);
  }
  dispatch_async((dispatch_queue_t)self->_downloadStateQueue, v67);

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v116, 8);

LABEL_21:
  _Block_object_dispose(&v131, 8);
}

void __287__DownloadManager_registerAssetDownloadJob_withPurpose_usingDownloadOptions_forAssetId_withBase_relativeTo_startingAt_withLength_extractWith_allocateExtractorIfNecessary_usingXPCConnection_withXPCMessage_clientName_performingAutoAssetJob_notify_withCatalogMetadata_withSpaceCheckedUUID___block_invoke( uint64_t a1,  void *a2)
{
  if (a2)
  {
    id v7 = a2;
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeT o:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:client Name:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke",  @"Failed to find or update brain with new features: %@",  v3,  v4,  v5,  v6,  (uint64_t)v7);
    [*(id *)(a1 + 32) sendDownloadCannotStartResult:78 assetType:*(void *)(a1 + 40) connection:*(void *)(a1 + 48) requestMessage:*(void *)(a1 + 56) clientName:*(void *)(a1 + 64) autoAssetJobID:*(void *)(a1 + 72) ofJobType:@"asset_job" underlyingError:v7];
  }

void __287__DownloadManager_registerAssetDownloadJob_withPurpose_usingDownloadOptions_forAssetId_withBase_relativeTo_startingAt_withLength_extractWith_allocateExtractorIfNecessary_usingXPCConnection_withXPCMessage_clientName_performingAutoAssetJob_notify_withCatalogMetadata_withSpaceCheckedUUID___block_invoke_2( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"__KnoxURL"]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___STRemoteExtractor);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 symmetricDecryptionKey]);
    if ([v6 length])
    {
      BOOL v7 = 1;
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 asymmetricDecryptionKey]);
      BOOL v7 = [v8 length] != 0;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  if (os_variant_has_internal_content("com.apple.MobileAsset"))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"DownloadServerBaseURLOverride",  *(void *)(a1 + 48)));
    id v14 = _MAPreferencesCopyValue(v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    if (v15)
    {
      id v20 = (void *)v15;
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativ eTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:cl ientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke_2",  @"Using value set in asset specific default(%@) for baseURL(%@)",  v16,  v17,  v18,  v19,  (uint64_t)v13);
    }

    else
    {
      id v21 = _MAPreferencesCopyValue(@"DownloadServerBaseURLOverride");
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (v20) {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relat iveTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessag e:clientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke_2",  @"Using value set in global default(%@) for baseURL(%@) for asset %@",  v22,  v23,  v24,  v25,  (uint64_t)@"DownloadServerBaseURLOverride");
      }
    }
  }

  else
  {
    id v20 = 0LL;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeTo: startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:clientName :performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke_2",  @"Determining URL for Asset(Type: %@ ID: %@): KnoxURL: %@ DecryptionKey: %@ BaseURL: %@ relativeURL: %@",  v9,  v10,  v11,  v12,  *(void *)(a1 + 48));
  if (v20)
  {
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v20, v26) & 1) != 0)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativ eTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:cl ientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke_2",  @"Using base url from default: %@",  v27,  v28,  v29,  v30,  (uint64_t)v20);
      uint64_t v31 = v20;
LABEL_21:
      unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v31));
      id v59 = (id)objc_claimAutoreleasedReturnValue([v48 URLByAppendingPathComponent:*(void *)(a1 + 72)]);

      goto LABEL_27;
    }
  }

  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v32) & v7) == 1)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeT o:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:client Name:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke_2",  @"Using Knox url from asset: %@",  v33,  v34,  v35,  v36,  (uint64_t)v2);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v2));
    id v59 = (id)objc_claimAutoreleasedReturnValue([v37 URLByAppendingPathComponent:@"data"]);

    [*(id *)(a1 + 80) setDownloadAuthorizationHeader:0];
  }

  else
  {
    uint64_t v42 = *(void *)(a1 + 64);
    uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v42, v43) & 1) != 0)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativ eTo:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:cl ientName:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke_2",  @"Using base url from request: %@",  v44,  v45,  v46,  v47,  *(void *)(a1 + 64));
      uint64_t v31 = *(void **)(a1 + 64);
      goto LABEL_21;
    }

    id ControlManager = getControlManager();
    id v50 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( [v50 getMetadataFromCatalog:*(void *)(a1 + 48) key:@"DownloadedFrom" withPurpose:*(void *)(a1 + 88)]);

    if (v51 && (uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v51, v52) & 1) != 0))
    {
      id v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v51));
    }

    else
    {
      uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(+[ASAssetMetadataUpdatePolicy policy](&OBJC_CLASS___ASAssetMetadataUpdatePolicy, "policy"));
      id v57 = (void *)objc_claimAutoreleasedReturnValue([v58 serverURLForAssetType:*(void *)(a1 + 48)]);
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerAssetDownloadJob:withPurpose:usingDownloadOptions:forAssetId:withBase:relativeT o:startingAt:withLength:extractWith:allocateExtractorIfNecessary:usingXPCConnection:withXPCMessage:client Name:performingAutoAssetJob:notify:withCatalogMetadata:withSpaceCheckedUUID:]_block_invoke_2",  @"The base url is empty in the request, using default: %@",  v53,  v54,  v55,  v56,  (uint64_t)v57);
    id v59 = (id)objc_claimAutoreleasedReturnValue([v57 URLByAppendingPathComponent:*(void *)(a1 + 72)]);
  }

- (void)registerPmvDownloadJob:(id)a3 using:(id)a4 with:(id)a5 clientName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __64__DownloadManager_registerPmvDownloadJob_using_with_clientName___block_invoke;
  v23[3] = &unk_34EF88;
  id v14 = v10;
  id v24 = v14;
  id v15 = v12;
  id v25 = v15;
  uint64_t v26 = self;
  id v16 = v11;
  id v27 = v16;
  id v17 = v13;
  id v28 = v17;
  uint64_t v18 = objc_retainBlock(v23);
  if (backgroundDownloadsPossibleWithInfo(0LL)
    && -[DownloadManager checkDownloadIsSyncing:using:with:autoAssetJob:]( self,  "checkDownloadIsSyncing:using:with:autoAssetJob:",  @"registerPmvDownloadJob",  v16,  v15,  0LL))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerPmvDownloadJob:using:with:clientName:]",  @"Trying to create a PMV download job while background sync is ongoing, bailing, %@",  v19,  v20,  v21,  v22,  (uint64_t)v14);
  }

  else if (!-[DownloadManager checkPmvDownloadIsSkipped:connection:with:]( self,  "checkPmvDownloadIsSkipped:connection:with:",  v14,  v16,  v15))
  {
    dispatch_async((dispatch_queue_t)self->_downloadStateQueue, v18);
    goto LABEL_7;
  }

  -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( self,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  3LL,  v14,  v16,  v15,  v17,  0LL,  @"PMV_job",  0LL);
LABEL_7:
}

void __64__DownloadManager_registerPmvDownloadJob_using_with_clientName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v9 = normalizedAssetType((uint64_t)@"com.apple.MobileAsset.SoftwareUpdate", a2, a3, a4, a5, a6, a7, a8);
  id v50 = (id)objc_claimAutoreleasedReturnValue(v9);
  _MAPreferencesSync(@"registerPmvDownloadJob", *(void **)(a1 + 32));
  id v10 = *(void **)(a1 + 40);
  id v11 = downloadManagerDecodeClasses();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id ObjectFromMessage = getObjectFromMessage(v10, "downloadOptionsLength", "downloadOptions", v12);
  id v14 = (MAMsuDownloadOptions *)objc_claimAutoreleasedReturnValue(ObjectFromMessage);

  if (!v14) {
    goto LABEL_9;
  }
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___MADownloadOptions);
  if ((objc_opt_isKindOfClass(v14, v19) & 1) == 0)
  {
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v20) & 1) == 0)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerPmvDownloadJob:using:with:clientName:]_block_invoke",  @"The asset download options for %@ PMV were not a valid class, failing",  v21,  v22,  v23,  v24,  (uint64_t)@"com.apple.MobileAsset.SoftwareUpdate");
      [*(id *)(a1 + 48) sendDownloadCannotStartResult:22 assetType:@"com.apple.MobileAsset.SoftwareUpdate" connection:*(void *)(a1 + 56) requestMessage:*(void *)(a1 + 40) clientName:*(void *)(a1 + 64) autoAssetJobID:0 ofJobType:@"PMV_job" underlyingError:0];
      goto LABEL_15;
    }

    id v25 = -[MAMsuDownloadOptions initWithPlist:]( objc_opt_new(&OBJC_CLASS___MAMsuDownloadOptions),  "initWithPlist:",  v14);

    id v14 = v25;
    if (!v25) {
      goto LABEL_9;
    }
  }

  uint64_t v26 = objc_opt_class(&OBJC_CLASS___MADownloadOptions);
  if ((objc_opt_isKindOfClass(v14, v26) & 1) == 0)
  {
LABEL_9:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerPmvDownloadJob:using:with:clientName:]_block_invoke",  @"registerPmvDownloadJob options are nil",  v15,  v16,  v17,  v18,  v49);
    uint64_t v30 = 0LL;
    uint64_t v31 = v14;
    id v14 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
    goto LABEL_10;
  }

  -[MAMsuDownloadOptions logOptions](v14, "logOptions");
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___MAMsuDownloadOptions);
  if ((objc_opt_isKindOfClass(v14, v27) & 1) == 0)
  {
    uint64_t v30 = 0LL;
    goto LABEL_11;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions purpose](v14, "purpose"));
  uint64_t v29 = normalizePurpose(v28);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  if (!isWellFormedPurpose(v30))
  {
    uint64_t v31 = (MAMsuDownloadOptions *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions purpose](v14, "purpose"));
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerPmvDownloadJob:using:with:clientName:]_block_invoke",  @"The purpose for PMV is: '%@' which is not well formed, and type is: %@",  v32,  v33,  v34,  v35,  (uint64_t)v31);
LABEL_10:
  }

- (void)registerXmlDownloadJob:(id)a3 using:(id)a4 with:(id)a5 clientName:(id)a6
{
  id v39 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = downloadManagerDecodeClasses();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id ObjectFromMessage = getObjectFromMessage(v11, "downloadOptionsLength", "downloadOptions", v14);
  uint64_t v16 = (MAMsuDownloadOptions *)objc_claimAutoreleasedReturnValue(ObjectFromMessage);

  _MAPreferencesSync(@"registerXmlDownloadJob", v39);
  if (!v16) {
    goto LABEL_7;
  }
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___MADownloadOptions);
  if ((objc_opt_isKindOfClass(v16, v21) & 1) == 0)
  {
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v16, v22) & 1) == 0)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerXmlDownloadJob:using:with:clientName:]",  @"The asset download options for %@ catalog were not a valid class, failing: %@",  v23,  v24,  v25,  v26,  (uint64_t)v39);
      -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( self,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  22LL,  v39,  v10,  v11,  v12,  0LL,  @"catalog_job",  0LL);
      goto LABEL_14;
    }

    uint64_t v27 = -[MAMsuDownloadOptions initWithPlist:]( objc_opt_new(&OBJC_CLASS___MAMsuDownloadOptions),  "initWithPlist:",  v16);

    uint64_t v16 = v27;
    if (!v27) {
      goto LABEL_7;
    }
  }

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___MADownloadOptions);
  if ((objc_opt_isKindOfClass(v16, v28) & 1) != 0)
  {
    -[MAMsuDownloadOptions logOptions](v16, "logOptions");
  }

  else
  {
LABEL_7:
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerXmlDownloadJob:using:with:clientName:]",  @"registerXmlDownloadJob options are nil",  v17,  v18,  v19,  v20,  v38);
    uint64_t v29 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);

    uint64_t v16 = v29;
  }

  uint64_t v30 = objc_opt_class(&OBJC_CLASS___MAMsuDownloadOptions);
  if ((objc_opt_isKindOfClass(v16, v30) & 1) == 0)
  {
    uint64_t v33 = 0LL;
    goto LABEL_12;
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions purpose](v16, "purpose"));
  uint64_t v32 = normalizePurpose(v31);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  if (isWellFormedPurpose(v33))
  {
LABEL_12:
    -[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXPCMessage:performingAutoAssetJob:asClientName:]( self,  "registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXPCMessage:performingAutoAssetJ ob:asClientName:",  v39,  v33,  v16,  v10,  v11,  0LL,  v12);
    goto LABEL_13;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerXmlDownloadJob:using:with:clientName:]",  @"The purpose for XML is: '%@' which is not well formed, and type is: %@, bailing",  v34,  v35,  v36,  v37,  (uint64_t)v33);
  -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( self,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  74LL,  v39,  v10,  v11,  v12,  0LL,  @"catalog_job",  0LL);
LABEL_13:

LABEL_14:
}

- (void)registerCatalogDownloadJob:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 usingDownloadOptions:(id)a6 forAutoAssetName:(id)a7
{
}

- (void)registerCatalogDownloadJob:(id)a3 withPurpose:(id)a4 usingDownloadOptions:(id)a5 usingXPCConnection:(id)a6 withXPCMessage:(id)a7 performingAutoAssetJob:(id)a8 asClientName:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x3032000000LL;
  v45[3] = __Block_byref_object_copy__11;
  v45[4] = __Block_byref_object_dispose__11;
  id v46 = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = __149__DownloadManager_registerCatalogDownloadJob_withPurpose_usingDownloadOptions_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName___block_invoke;
  v35[3] = &unk_34EFD8;
  id v22 = v15;
  id v36 = v22;
  id v23 = v16;
  id v37 = v23;
  id v24 = v20;
  id v38 = v24;
  id v39 = self;
  id v25 = v18;
  id v40 = v25;
  id v26 = v19;
  id v41 = v26;
  id v27 = v21;
  id v42 = v27;
  id v28 = v17;
  id v43 = v28;
  uint64_t v44 = v45;
  uint64_t v29 = objc_retainBlock(v35);
  if (backgroundDownloadsPossibleWithInfo(0LL)
    && -[DownloadManager checkDownloadIsSyncing:using:with:autoAssetJob:]( self,  "checkDownloadIsSyncing:using:with:autoAssetJob:",  @"registerXmlDownloadJob",  v25,  v26,  v24))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXPCM essage:performingAutoAssetJob:asClientName:]",  @"Trying to create a catalog download job while background sync is ongoing, bailing, %@",  v30,  v31,  v32,  v33,  (uint64_t)v22);
    uint64_t v34 = 13LL;
  }

  else
  {
    if (!-[DownloadManager checkCatalogDownloadIsSkipped:connection:with:autoAssetJob:]( self,  "checkCatalogDownloadIsSkipped:connection:with:autoAssetJob:",  v22,  v25,  v26,  v24))
    {
      dispatch_async((dispatch_queue_t)self->_downloadStateQueue, v29);
      goto LABEL_8;
    }

    uint64_t v34 = 3LL;
  }

  -[DownloadManager sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:]( self,  "sendDownloadCannotStartResult:assetType:connection:requestMessage:clientName:autoAssetJobID:ofJobType:underlyingError:",  v34,  v22,  v25,  v26,  v27,  v24,  @"catalog_job",  0LL);
LABEL_8:

  _Block_object_dispose(v45, 8);
}

void __149__DownloadManager_registerCatalogDownloadJob_withPurpose_usingDownloadOptions_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v9 = normalizedAssetType(*(void *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = assembleTaskDescriptorWithPurposeAndAutoAssetJobID( (uint64_t)v10,  (uint64_t)@"xml",  *(void **)(a1 + 40),  *(void **)(a1 + 48));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v16)
  {
    if (!*(void *)(a1 + 48))
    {
      id v17 = *(void **)(a1 + 72);
      id v18 = downloadManagerDecodeClasses();
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id ObjectFromMessage = getObjectFromMessage(v17, "downloadOptionsLength", "downloadOptions", v19);
      id v21 = (MAMsuDownloadOptions *)objc_claimAutoreleasedReturnValue(ObjectFromMessage);

      if (!v21) {
        goto LABEL_10;
      }
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___MADownloadOptions);
      if ((objc_opt_isKindOfClass(v21, v26) & 1) == 0)
      {
        uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v21, v27) & 1) == 0)
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:wi thXPCMessage:performingAutoAssetJob:asClientName:]_block_invoke",  @"The asset download options for %@ catalog were not a valid class, failing: %@",  v28,  v29,  v30,  v31,  *(void *)(a1 + 32));
          [*(id *)(a1 + 56) indicateDownloadJobFinished:22 usingXPCConnection:*(void *)(a1 + 64) withXPCMessage:*(void *)(a1 + 72) performingAutoAssetJob:*(void *)(a1 + 48) ofJobType:@"catalog_job"];

          goto LABEL_21;
        }

        uint64_t v32 = -[MAMsuDownloadOptions initWithPlist:]( objc_opt_new(&OBJC_CLASS___MAMsuDownloadOptions),  "initWithPlist:",  v21);

        id v21 = v32;
        if (!v32) {
          goto LABEL_10;
        }
      }

      uint64_t v33 = objc_opt_class(&OBJC_CLASS___MADownloadOptions);
      if ((objc_opt_isKindOfClass(v21, v33) & 1) != 0)
      {
        -[MAMsuDownloadOptions logOptions](v21, "logOptions");
      }

      else
      {
LABEL_10:
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:with XPCMessage:performingAutoAssetJob:asClientName:]_block_invoke",  @"registerXmlDownloadJob options are nil",  v22,  v23,  v24,  v25,  v67);
        uint64_t v34 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);

        id v21 = v34;
      }
    }

    id v35 = [*(id *)(a1 + 56) getPallasEnabledForAssetType:*(void *)(a1 + 32)];
    if (!(_DWORD)v35)
    {
      _MobileAssetLog( (uint64_t)v35,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXP CMessage:performingAutoAssetJob:asClientName:]_block_invoke",  @"Skipping pallas route for %@ client: %@",  v36,  v37,  v38,  v39,  *(void *)(a1 + 32));
      id StandardUrl = getStandardUrl(*(void **)(a1 + 32), v10);
      uint64_t v50 = objc_claimAutoreleasedReturnValue(StandardUrl);
      uint64_t v51 = *(void *)(*(void *)(a1 + 96) + 8LL);
      uint64_t v52 = *(void **)(v51 + 40);
      *(void *)(v51 + 40) = v50;

      if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL))
      {
        uint64_t v53 = *(void **)(a1 + 88);
        if (!v53 || ![v53 liveServerCatalogOnly])
        {
          id ControlManager = getControlManager();
          id v59 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
          id v60 = (void *)objc_claimAutoreleasedReturnValue( [v59 getCatalogLastModifiedDate:*(void *)(a1 + 32) ifFromXmlUrl:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) withPurpose:*(void *)(a1 + 40)]);

          [*(id *)(a1 + 56) startDownloadAndUpdateState:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) for:v16 modified:v60 options:*(void *)(a1 + 88) using:*(void *)(a1 + 64) with:*(void *)(a1 + 72) clientName:*(void *)(a1 + 80) autoAssetJob:*(void *)(a1 + 48) ofJobType:@"catalog_job"];
          goto LABEL_21;
        }

        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:with XPCMessage:performingAutoAssetJob:asClientName:]_block_invoke",  @"XML catalog failed as client asked for liveServerCatalogOnly to disable fallback. Would have attempted %@ after skipping on pallas for %@ client: %@",  v54,  v55,  v56,  v57,  *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL));
      }

      else
      {
        uint64_t v61 = stringForMADownloadResult(0x19uLL);
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:with XPCMessage:performingAutoAssetJob:asClientName:]_block_invoke",  @"Sending download result %ld (%@) for assetType: %@ XML download did not have a catalog URL. This could be for a type where liveServerCatalogOnly was set to disable XML fallback, or a lookup error for the build of SystemApps. Would have attempted the fallback URL after skipping on pallas for %@ client: %@",  v63,  v64,  v65,  v66,  25LL);
      }

      [*(id *)(a1 + 56) indicateDownloadJobFinished:25 usingXPCConnection:*(void *)(a1 + 64) withXPCMessage:*(void *)(a1 + 72) performingAutoAssetJob:*(void *)(a1 + 48) ofJobType:@"catalog_job"];
      goto LABEL_21;
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXPCM essage:performingAutoAssetJob:asClientName:]_block_invoke",  @"Going pallas route for %@ client: %@",  v36,  v37,  v38,  v39,  *(void *)(a1 + 32));
    id DownloadManager = getDownloadManager();
    id v41 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    id v42 = *(void **)(a1 + 32);
    uint64_t v43 = *(void *)(a1 + 72);
    uint64_t v68 = *(void *)(a1 + 64);
    uint64_t v69 = *(void *)(a1 + 40);
    uint64_t v44 = *(void *)(a1 + 48);
    uint64_t v45 = *(void *)(a1 + 80);
    uint64_t v46 = *(void *)(a1 + 88);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = __149__DownloadManager_registerCatalogDownloadJob_withPurpose_usingDownloadOptions_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName___block_invoke_2;
    v70[3] = &unk_34EFB0;
    id v71 = v42;
    id v47 = *(id *)(a1 + 80);
    uint64_t v48 = *(void *)(a1 + 56);
    id v72 = v47;
    uint64_t v73 = v48;
    id v74 = v16;
    id v75 = v10;
    id v76 = *(id *)(a1 + 40);
    id v77 = *(id *)(a1 + 88);
    id v78 = *(id *)(a1 + 64);
    id v79 = *(id *)(a1 + 72);
    id v80 = *(id *)(a1 + 48);
    [v41 pallasRequestV2:v71 normalizedType:v75 withPurpose:v69 options:v46 using:v68 with:v43 autoAssetJob:v44 clientName:v45 then:v70];
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXPCM essage:performingAutoAssetJob:asClientName:]_block_invoke",  @"Trying to create a download job with nil task descriptor, bailing, %@",  v12,  v13,  v14,  v15,  *(void *)(a1 + 32));
    [*(id *)(a1 + 56) sendDownloadCannotStartResult:3 assetType:*(void *)(a1 + 32) connection:*(void *)(a1 + 64) requestMessage:*(void *)(a1 + 72) clientName:*(void *)(a1 + 80) autoAssetJobID:*(void *)(a1 + 48) ofJobType:@"catalog_job" underlyingError:0];
  }

void __149__DownloadManager_registerCatalogDownloadJob_withPurpose_usingDownloadOptions_usingXPCConnection_withXPCMessage_performingAutoAssetJob_asClientName___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  unint64_t a4)
{
  id v7 = a2;
  id v51 = v7;
  switch(a3)
  {
    case 0LL:
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXP CMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Pallas call succeeded on pallas for %@ client: %@",  v8,  v9,  v10,  v11,  *(void *)(a1 + 32));
      goto LABEL_26;
    case 1LL:
      uint64_t v17 = (uint64_t)v7;
      id v18 = *(void **)(a1 + 32);
      if (!v17)
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:with XPCMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Failed MAPallasFailedRetryNew and had no url on pallas for %@ client: %@",  v8,  v9,  v10,  v11,  *(void *)(a1 + 32));
        uint64_t v12 = *(void **)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 88);
        uint64_t v14 = *(void *)(a1 + 96);
        uint64_t v15 = *(void *)(a1 + 104);
        uint64_t v16 = 27LL;
        goto LABEL_20;
      }

      if (v18)
      {
        unsigned __int8 v19 = isXMLAssetType(v18);
        uint64_t v17 = (uint64_t)v51;
        if ((v19 & 1) == 0)
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:wi thXPCMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Failed MAPallasFailedRetryNew but asset type does not support XML fallback. Would have attempted with: %@ after failing on pallas for %@ client: %@",  v8,  v9,  v10,  v11,  (uint64_t)v51);
          goto LABEL_24;
        }
      }

      id v20 = *(void **)(a1 + 80);
      if (v20)
      {
        if ([v20 liveServerCatalogOnly])
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:wi thXPCMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Failed MAPallasFailedRetryNew but client used liveServerCatalogOnly to disable XML fallback. Would have attempted with: %@ after failing on pallas for %@ client: %@",  v8,  v9,  v10,  v11,  (uint64_t)v51);
          id v21 = *(void **)(a1 + 48);
          uint64_t v22 = *(void *)(a1 + 56);
          uint64_t v23 = 72LL;
          goto LABEL_25;
        }

        uint64_t v17 = (uint64_t)v51;
      }

      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXP CMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Falling back to XML: %@ after failure before pallas response for %@ client: %@",  v8,  v9,  v10,  v11,  v17);
      id ControlManager = getControlManager();
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [v50 getCatalogLastModifiedDate:*(void *)(a1 + 32) ifFromXmlUrl:v51 withPurpose:*(void *)(a1 + 72)]);

      [*(id *)(a1 + 48) startDownloadAndUpdateState:v51 for:*(void *)(a1 + 56) modified:v43 options:*(void *)(a1 + 80) using:*(void *)(a1 + 88) with:*(void *)(a1 + 96) clientName:*(void *)(a1 + 40) autoAssetJob:*(void *)(a1 + 104) ofJobType:@"catalog_job"];
      goto LABEL_31;
    case 2LL:
      uint64_t v24 = *(void **)(a1 + 32);
      if (v24 && (isXMLAssetType(v24) & 1) == 0)
      {
        uint64_t v44 = stringForMADownloadResult(a4);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v44);
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:with XPCMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Failed MAPallasFailedRetrySame but asset type does not support XML fallback. Would have attempted retry with: %@ after failing on pallas for %@ client: %@ with failure: %ld %@",  v45,  v46,  v47,  v48,  (uint64_t)v51);
LABEL_22:

LABEL_24:
        id v21 = *(void **)(a1 + 48);
        uint64_t v22 = *(void *)(a1 + 56);
        uint64_t v23 = a4;
        goto LABEL_25;
      }

      uint64_t v25 = *(void **)(a1 + 80);
      if (v25 && [v25 liveServerCatalogOnly])
      {
        uint64_t v26 = stringForMADownloadResult(a4);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:with XPCMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Failed MAPallasFailedRetrySame but client used liveServerCatalogOnly to disable XML fallback. Would have attempted retry with: %@ after failing on pallas for %@ client: %@ with failure: %ld %@",  v28,  v29,  v30,  v31,  (uint64_t)v51);
        goto LABEL_22;
      }

      uint64_t v34 = *(void *)(a1 + 32);
      id v35 = stringForMADownloadResult(a4);
      id v40 = (void *)objc_claimAutoreleasedReturnValue(v35);
      if (!v51)
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:with XPCMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Had no fallback XML url to retry with: (nil) after failure on pallas for %@ client: %@ with failure: %ld %@",  v36,  v37,  v38,  v39,  v34);

        id v21 = *(void **)(a1 + 48);
        uint64_t v22 = *(void *)(a1 + 56);
        uint64_t v23 = 27LL;
LABEL_25:
        [v21 taskFinishedUpdateState:v22 with:v23];
        goto LABEL_26;
      }

      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXP CMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Falling back to XML. Retry with: %@ after failure on pallas for %@ client: %@ with failure: %ld %@",  v36,  v37,  v38,  v39,  (uint64_t)v51);

      id v41 = getControlManager();
      id v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [v42 getCatalogLastModifiedDate:*(void *)(a1 + 32) ifFromXmlUrl:v51 withPurpose:*(void *)(a1 + 72)]);

      [*(id *)(a1 + 48) retryTask:*(void *)(a1 + 56) retryUrl:v51 modified:v43 clientName:*(void *)(a1 + 40)];
LABEL_31:

LABEL_26:
      return;
    case 3LL:
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXP CMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Failed with no retry on pallas for %@ client: %@",  v8,  v9,  v10,  v11,  *(void *)(a1 + 32));
      id v21 = *(void **)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = 18LL;
      goto LABEL_25;
    case 4LL:
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXP CMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"Succeeded with not modified on pallas for %@ client: %@",  v8,  v9,  v10,  v11,  *(void *)(a1 + 32));
      id v32 = getControlManager();
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      [v33 updateLastFetchedDate:*(void *)(a1 + 64) assetType:*(void *)(a1 + 32) withPurpose:*(void *)(a1 + 72) with:*(void *)(a1 + 56)];

      id v21 = *(void **)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = 14LL;
      goto LABEL_25;
    default:
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager registerCatalogDownloadJob:withPurpose:usingDownloadOptions:usingXPCConnection:withXP CMessage:performingAutoAssetJob:asClientName:]_block_invoke_2",  @"MADownloadFailed: Pallas result unknown! %ld on pallas for %@ client: %@",  v8,  v9,  v10,  v11,  a3);
      uint64_t v12 = *(void **)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 88);
      uint64_t v14 = *(void *)(a1 + 96);
      uint64_t v15 = *(void *)(a1 + 104);
      uint64_t v16 = 3LL;
LABEL_20:
      [v12 indicateDownloadJobFinished:v16 usingXPCConnection:v13 withXPCMessage:v14 performingAutoAssetJob:v15 ofJobType:@"catalog_job"];
      goto LABEL_26;
  }

- (void)sendNotification:(id)a3
{
  uint64_t v4 = disassembleTaskDescriptor(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"isXml"]);
    uint64_t v8 = v7;
    if (v7)
    {
      unsigned int v9 = [v7 intValue];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"normalizedAssetType"]);
      id v11 = assetTypeFromNormalized(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      if (v12)
      {
        switch(v9)
        {
          case 1u:
            char v13 = 0;
            uint64_t v14 = @"XML";
            uint64_t v15 = @".ma.cached-metadata-updated";
            break;
          case 2u:
            char v13 = 0;
            uint64_t v14 = @"ZIP";
            uint64_t v15 = @".ma.new-asset-installed";
            break;
          case 3u:
            char v13 = 0;
            uint64_t v14 = @"PMV";
            uint64_t v15 = @".ma.pmv-updated";
            break;
          case 4u:
            char v13 = 0;
            uint64_t v14 = @"XML";
            uint64_t v15 = @".ma.auto-catalog";
            break;
          case 5u:
            char v13 = 0;
            uint64_t v14 = @"ZIP";
            uint64_t v15 = @".ma.new-auto-asset-installed";
            break;
          default:
            uint64_t v15 = 0LL;
            uint64_t v14 = 0LL;
            char v13 = 1;
            break;
        }

        splunkStateQueue = (dispatch_queue_s *)self->_splunkStateQueue;
        id v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472LL;
        id v20 = __36__DownloadManager_sendNotification___block_invoke;
        id v21 = &unk_34E358;
        uint64_t v22 = self;
        id v17 = v12;
        id v23 = v17;
        uint64_t v24 = (__CFString *)v15;
        uint64_t v25 = (__CFString *)v14;
        dispatch_async(splunkStateQueue, &v18);
        if ((v13 & 1) == 0) {
          -[DownloadManager sendNotification:suffix:]( self,  "sendNotification:suffix:",  v17,  v15,  v18,  v19,  v20,  v21,  v22);
        }
      }
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }
}

void __36__DownloadManager_sendNotification___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) analytics]);
  [v2 recordDownloadSuccessForAssetType:*(void *)(a1 + 40) notificationSuffix:*(void *)(a1 + 48) fileType:*(void *)(a1 + 56)];
}

- (void)sendNotification:(id)a3 suffix:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingString:a4]);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager sendNotification:suffix:]",  @"MA Notifying: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  id v9 = v4;
  notify_post((const char *)[v9 UTF8String]);
}

- (id)clientIdentifierWithName:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.mobileassetd.client.%@",  a3);
}

- (id)currentSession
{
  int v3 = backgroundDownloadsPossibleWithInfo(0LL);
  uint64_t v4 = 14LL;
  if (v3) {
    uint64_t v4 = 11LL;
  }
  return (&self->super.isa)[v4];
}

- (id)currentConfig
{
  int v3 = backgroundDownloadsPossibleWithInfo(0LL);
  uint64_t v4 = 6LL;
  if (v3) {
    uint64_t v4 = 5LL;
  }
  return (&self->super.isa)[v4];
}

- (void)retryTask:(id)a3 retryUrl:(id)a4 modified:(id)a5 clientName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__DownloadManager_retryTask_retryUrl_modified_clientName___block_invoke;
  block[3] = &unk_34EF88;
  void block[4] = self;
  id v20 = v10;
  id v21 = v13;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(downloadStateQueue, block);
}

void __58__DownloadManager_retryTask_retryUrl_modified_clientName___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);
  id v26 = (id)objc_claimAutoreleasedReturnValue([v2 objectForKey:*(void *)(a1 + 40)]);

  if (!v26)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager retryTask:retryUrl:modified:clientName:]_block_invoke",  @"We have no info about this task, cannot retry: %@",  v3,  v4,  v5,  v6,  *(void *)(a1 + 40));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) downloadTasksInFlight]);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager retryTask:retryUrl:modified:clientName:]_block_invoke",  @"The downloads in flight are: %@",  v22,  v23,  v24,  v25,  (uint64_t)v21);

LABEL_10:
    [*(id *)(a1 + 32) taskFinishedUpdateState:*(void *)(a1 + 40) with:30];
    goto LABEL_11;
  }

  if (([v26 shouldRetry] & 1) == 0)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager retryTask:retryUrl:modified:clientName:]_block_invoke",  @"We have already retried this task, skipping: %@",  v7,  v8,  v9,  v10,  *(void *)(a1 + 40));
    goto LABEL_10;
  }

  [v26 setShouldRetry:0];
  [v26 setIsPallas:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v26 options]);
  objc_msgSend(v26, "setIsDiscretionary:", objc_msgSend(v11, "discretionary"));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v26 firstClientName]);
  if (!v12) {
    [v26 setFirstClientName:*(void *)(a1 + 48)];
  }
  id v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 56);
  id v15 = [v26 downloadSize];
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v26 options]);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentSession]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue( [v13 startDownloadTask:v14 downloadSize:v15 for:v16 startingAt:0 withLength:0 extractWith:0 options:v17 modified:v18 session:v19]);

  if (!v20) {
    [*(id *)(a1 + 32) taskFinishedUpdateState:*(void *)(a1 + 40) with:30];
  }
  [v26 setTask:v20];

LABEL_11:
}

- (void)taskFinishedUpdateState:(id)a3 with:(int64_t)a4 extraInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager taskFinishedUpdateState:with:extraInfo:]",  @"Download manager notified of finished task: %@",  v10,  v11,  v12,  v13,  (uint64_t)v8);
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  v26[3] = a4;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  downloadStateQueue = (dispatch_queue_s *)self->_downloadStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__DownloadManager_taskFinishedUpdateState_with_extraInfo___block_invoke;
  block[3] = &unk_34F000;
  id v18 = v8;
  uint64_t v19 = self;
  uint64_t v22 = v24;
  int64_t v23 = a4;
  id v20 = v9;
  id v21 = v26;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(downloadStateQueue, block);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

void __58__DownloadManager_taskFinishedUpdateState_with_extraInfo___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (!*(void *)(a1 + 32))
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager taskFinishedUpdateState:with:extraInfo:]_block_invoke",  @"Task finished without a task descriptor, syncing with nsurlsession",  a5,  a6,  a7,  a8,  v45);
    [*(id *)(a1 + 40) queryNSUrlSessiondAndUpdateState];
    goto LABEL_20;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) downloadTasksInFlight]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:*(void *)(a1 + 32)]);

  if (v10)
  {
    if (*(void *)(a1 + 72) == 14LL) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0LL;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 cacheServerUrl]);
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 originalUrl]);

        if (v13)
        {
          [v10 clearCacheServerUrl];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 extractor]);

          if (v14)
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 originalUrl]);
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager taskFinishedUpdateState:with:extraInfo:]_block_invoke",  @"Download failed however we are going to retry at original url: %@",  v20,  v21,  v22,  v23,  (uint64_t)v19);

            uint64_t v24 = *(void **)(a1 + 40);
            uint64_t v25 = objc_claimAutoreleasedReturnValue([v10 originalUrl]);
            id v26 = [v10 downloadSize];
            uint64_t v47 = *(void *)(a1 + 32);
            id v48 = v26;
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v10 startingAt]);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v10 lengthOfRange]);
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 extractor]);
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v10 options]);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v10 date]);
            id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentSession]);
            uint64_t v33 = v24;
            uint64_t v34 = (void *)v25;
            id v35 = (void *)objc_claimAutoreleasedReturnValue( [v33 startDownloadTask:v25 downloadSize:v48 for:v47 startingAt:v27 withLength:v28 extractWith:v29 options:v30 modified:v31 session:v32]);

            if (v35) {
              *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
            }
            [v10 setTask:v35];

            goto LABEL_19;
          }

          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager taskFinishedUpdateState:with:extraInfo:]_block_invoke",  @"Download failed and there is no extractor to retry so failing",  v15,  v16,  v17,  v18,  v45);
        }
      }
    }

    [*(id *)(a1 + 40) sendDownloadResult:v10 with:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) extraInfo:*(void *)(a1 + 48)];
    if (*(void *)(a1 + 72)) {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager taskFinishedUpdateState:with:extraInfo:]_block_invoke",  @"Skipping notification because of failure or no change",  v41,  v42,  v43,  v44,  v45);
    }
    else {
      [*(id *)(a1 + 40) sendNotification:*(void *)(a1 + 32)];
    }
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v36 = *(void *)(a1 + 32);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) downloadTasksInFlight]);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager taskFinishedUpdateState:with:extraInfo:]_block_invoke",  @"We have no info about this task, cannot reply: %@  The downloads in flight are: %@",  v37,  v38,  v39,  v40,  v36);

  if (!*(void *)(a1 + 72)) {
    [*(id *)(a1 + 40) sendNotification:*(void *)(a1 + 32)];
  }
LABEL_20:
  if (*(void *)(a1 + 32))
  {
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
    {
      id v49 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) downloadTasksInFlight]);
      [v49 removeObjectForKey:*(void *)(a1 + 32)];
    }
  }

- (void)taskFinishedUpdateState:(id)a3 with:(int64_t)a4
{
}

- (int64_t)massagePmvAndPersist:(id)a3 from:(id)a4 to:(id)a5 postedDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = objc_autoreleasePoolPush();
  id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(v9);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);
  id PathToStagedFile = getPathToStagedFile(v15, v9, 0);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(PathToStagedFile);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"The PMV staging path is: %@ from %@",  v18,  v19,  v20,  v21,  (uint64_t)v17);
  if (v11 && v17)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v26));

    if (v27)
    {
      id v55 = 0LL;
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v27,  0LL,  &v55));
      id v33 = v55;
      if (v33)
      {
        uint64_t v38 = v33;
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"could not load PMV JSON after download: %@ from %@ error %@",  v34,  v35,  v36,  v37,  (uint64_t)v17);
      }

      else
      {
        if (v32)
        {
          uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v32, v41) & 1) != 0)
          {
            if (v12) {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"The PMV posting date is: %@ from %@",  v42,  v43,  v44,  v45,  (uint64_t)v12);
            }
            id ControlManager = getControlManager();
            uint64_t v47 = objc_claimAutoreleasedReturnValue(ControlManager);
            if (v47)
            {
              uint64_t v52 = (void *)v47;
              uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
              [v52 writeJsonDictionaryToFile:v32 to:v54 with:v9];

              int64_t v39 = 31LL;
              goto LABEL_9;
            }

            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"Cannot write PMV as control manager is nil",  v48,  v49,  v50,  v51,  v53);
          }

          else
          {
            _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"PMV file contents were not JSON dictionary: %@ from %@",  v42,  v43,  v44,  v45,  (uint64_t)v17);
          }
        }

        else
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"could not load PMV JSON after download: %@ from %@",  v34,  v35,  v36,  v37,  (uint64_t)v17);
        }
      }
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"could not load PMV file after download: %@ from %@",  v28,  v29,  v30,  v31,  (uint64_t)v17);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager massagePmvAndPersist:from:to:postedDate:]",  @"Cannot persist PMV as there is no target location for copying %@ to %@ for %@",  v22,  v23,  v24,  v25,  (uint64_t)v17);
  }

  int64_t v39 = 5LL;
LABEL_9:

  objc_autoreleasePoolPop(v13);
  return v39;
}

- (int64_t)decryptContentEncryptedAssetAtPathIfRequired:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && ([v3 isFileURL] & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"Info.plist" isDirectory:0]);
    id v47 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v5,  &v47));
    id v7 = v47;
    id v12 = v7;
    if (!v6 || v7)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Info plist does not exist under location %@: %@",  v8,  v9,  v10,  v11,  (uint64_t)v4);
    }

    else
    {
      if (decryptContentEncryptedAssetAtPathIfRequired__keyManagerDispatchOnce != -1) {
        dispatch_once( &decryptContentEncryptedAssetAtPathIfRequired__keyManagerDispatchOnce,  &__block_literal_global_2057);
      }
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"_ContentEncryption"]);
      if (!v12 || (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v12, v17) & 1) == 0))
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Asset at path %@ does not support content encryption. Nothing to do",  v13,  v14,  v15,  v16,  (uint64_t)v4);

LABEL_21:
        id v22 = &loc_7530;
        goto LABEL_19;
      }

      if ([v12 isEqualToString:@"DSME"])
      {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Attempting decryption of content encrypted asset at path %@",  v18,  v19,  v20,  v21,  (uint64_t)v4);
        id v46 = 0LL;
        id v22 = [(id)decryptContentEncryptedAssetAtPathIfRequired__keyManager decryptContentEncryptedAssetAtURL:v4 assetAttributes:v6 error:&v46];
        id v23 = v46;
        uint64_t v28 = v23;
        if (v22 != &loc_7530 || v23)
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Failed to decrypt ContentEncrypted asset at %@ : retval: %ld error: %@",  v24,  v25,  v26,  v27,  (uint64_t)v4);

          goto LABEL_19;
        }

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( [v4 URLByAppendingPathComponent:@"ContentProtection.plist" isDirectory:0]);
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Successfully decrypted ContentEncrypted asset. Deleting ContentProtection plist at location %@",  v30,  v31,  v32,  v33,  (uint64_t)v29);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        id v45 = 0LL;
        [v34 removeItemAtURL:v29 error:&v45];
        id v35 = v45;

        if (v35) {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Failed to delete contentmanifest plist: %@",  v36,  v37,  v38,  v39,  (uint64_t)v35);
        }

        goto LABEL_21;
      }

      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Content encryption method %@ is unsupported for asset at path %@",  v18,  v19,  v20,  v21,  (uint64_t)v12);
    }
  }

  else
  {
    [v4 isFileURL];
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]",  @"Invalid value(expected valid file url) passed in for assetPath: %@ isFileURL: %@",  v40,  v41,  v42,  v43,  (uint64_t)v4);
  }

  id v22 = &loc_7530 + 1;
LABEL_19:

  return (int64_t)v22;
}

void __64__DownloadManager_decryptContentEncryptedAssetAtPathIfRequired___block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MobileAssetKeyManager);
  id v2 = (void *)decryptContentEncryptedAssetAtPathIfRequired__keyManager;
  decryptContentEncryptedAssetAtPathIfRequired__keyManager = (uint64_t)v1;
}

- (int64_t)processAssetDownload:(id)a3 with:(id)a4 and:(id)a5 shouldMove:(BOOL)a6 extractorExists:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v18 = a5;
  if (!a7)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager processAssetDownload:with:and:shouldMove:extractorExists:]",  @"Error, download failed due to nil extractor",  v14,  v15,  v16,  v17,  v43);
    uint64_t v38 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v27 = 0LL;
    int64_t v41 = 16LL;
    goto LABEL_12;
  }

  id v19 = assetTypeFromNormalized(v12);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id PathToStagedFile = getPathToStagedFile(v20, v18, 0);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(PathToStagedFile);
  uint64_t v27 = v22;
  if (!v22)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloadManager processAssetDownload:with:and:shouldMove:extractorExists:]",  @"Error, download failed due to invalid staging path",  v23,  v24,  v25,  v26,  v43);
    uint64_t v38 = 0LL;
    int64_t v41 = 33LL;
    goto LABEL_12;
  }

  id v28 = objc_claimAutoreleasedReturnValue([v22 path]);
  aks_migrate_path((const char *)[v28 UTF8String], 20, 3, 4);

  if ((_UNKNOWN *)-[DownloadManager decryptContentEncryptedAssetAtPathIfRequired:]( self,  "decryptContentEncryptedAssetAtPathIfRequired:",  v27) != &loc_7530)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager processAssetDownload:with:and:shouldMove:extractorExists:]",  @"Failed to decrypt asset content",  v29,  v30,  v31,  v32,  v43);
    uint64_t v38 = 0LL;
    int64_t v41 = 85LL;
    goto LABEL_12;
  }

  id ControlManager = getControlManager();
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
  if (!v38)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager processAssetDownload:with:and:shouldMove:extractorExists:]",  @"Cannot move file as control manager is nil",  v34,  v35,  v36,  v37,  v43);
    goto LABEL_11;
  }

  if (!v8)
  {
LABEL_11:
    int64_t v41 = 0LL;
    goto LABEL_12;
  }

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v39));
  [v38 moveAssetIntoRepo:v40 forType:v12 forAsset:v13 cleanUp:v27 with:v18];

  int64_t v41 = 31LL;
LABEL_12:

  return v41;
}

- (void)handleSuccessfulDownload:(id)a3 task:(id)a4 taskId:(id)a5 shouldMove:(BOOL)a6 extractorExists:(BOOL)a7 postedDate:(id)a8 notModified:(BOOL)a9
{
  id v76 = a3;
  id v13 = a4;
  id v14 = a5;
  id v74 = v14;
  id v75 = a8;
  if (!v13)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager handleSuccessfulDownload:task:taskId:shouldMove:extractorExists:postedDate:notModified:]",  @"Task descriptor is nil, skipping. task %@",  v15,  v16,  v17,  v18,  (uint64_t)v14);
    -[DownloadManager queryNSUrlSessiondAndUpdateState](self, "queryNSUrlSessiondAndUpdateState");
    uint64_t v39 = 0LL;
    uint64_t v49 = 0LL;
    uint64_t v25 = 0LL;
LABEL_14:
    uint64_t v50 = 0LL;
    uint64_t v32 = 0LL;
    uint64_t v43 = 0LL;
    uint64_t v44 = 0LL;
    uint64_t v51 = 0LL;
    goto LABEL_18;
  }

  id v19 = disassembleTaskDescriptor(v13);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v25 = v20;
  if (!v20)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager handleSuccessfulDownload:task:taskId:shouldMove:extractorExists:postedDate:notModified:]",  @"Task info is nil, skipping. task %@",  v21,  v22,  v23,  v24,  (uint64_t)v14);
    -[DownloadManager queryNSUrlSessiondAndUpdateState](self, "queryNSUrlSessiondAndUpdateState");
    uint64_t v39 = 0LL;
    uint64_t v49 = 0LL;
    goto LABEL_14;
  }

  id v70 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"isXml"]);
  id v26 = [v70 intValue];
  if (!(_DWORD)v26)
  {
    _MobileAssetLog( (uint64_t)v26,  3,  (uint64_t)"-[DownloadManager handleSuccessfulDownload:task:taskId:shouldMove:extractorExists:postedDate:notModified:]",  @"Could not parse the taskDescriptor of: %@. task %@",  v27,  v28,  v29,  v30,  (uint64_t)v13);
    -[DownloadManager queryNSUrlSessiondAndUpdateState](self, "queryNSUrlSessiondAndUpdateState");
    uint64_t v39 = 0LL;
    uint64_t v49 = 0LL;
    uint64_t v32 = 0LL;
LABEL_17:
    uint64_t v43 = 0LL;
    uint64_t v44 = 0LL;
    uint64_t v51 = 0LL;
    uint64_t v50 = v70;
    goto LABEL_18;
  }

  int v31 = (int)v26;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"normalizedAssetType"]);
  id v33 = assetTypeFromNormalized(v32);
  uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
  uint64_t v39 = (void *)v34;
  if (!v32 || !v34)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager handleSuccessfulDownload:task:taskId:shouldMove:extractorExists:postedDate:notModified:]",  @"Could not create asset type from: %@. task %@",  v35,  v36,  v37,  v38,  (uint64_t)v13);
    uint64_t v49 = 0LL;
    goto LABEL_17;
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"Purpose"]);
  int64_t v41 = normalizePurpose(v40);
  uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(v41);

  uint64_t v42 = repositoryPath(v39);
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(v42);
  switch(v31)
  {
    case 4:
      goto LABEL_9;
    case 3:
      id PathToPmvFile = getPathToPmvFile((uint64_t)v39);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(PathToPmvFile);
      uint64_t v48 = -[DownloadManager massagePmvAndPersist:from:to:postedDate:]( self,  "massagePmvAndPersist:from:to:postedDate:",  v13,  v76,  v51,  v75);
      uint64_t v73 = 0LL;
      break;
    case 1:
LABEL_9:
      uint64_t v43 = v68;
      uint64_t v44 = v69;
      id v45 = assembleXmlPathWithPurpose((uint64_t)v39, v32, v68, v69);
      uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);
      if (a9)
      {
        uint64_t v67 = (void *)v46;
        id v47 = (void *)objc_claimAutoreleasedReturnValue([v25 safeStringForKey:@"AutoAssetJob"]);
        if (v47)
        {
          uint64_t v48 = (_BYTE *)(&dword_C + 2);
        }

        else
        {
          id ControlManager = getControlManager();
          uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(ControlManager);
          uint64_t v48 = (char *)[v66 updateLastFetchedDate:v32 assetType:v39 withPurpose:v69 with:v13];
        }

        uint64_t v50 = v70;

        uint64_t v73 = 0LL;
        uint64_t v51 = v67;
      }

      else
      {
        BOOL v64 = v31 == 1;
        uint64_t v51 = (void *)v46;
        uint64_t v48 = -[DownloadManager massageXmlAndPersist:from:to:with:postedDate:considerCaching:]( self,  "massageXmlAndPersist:from:to:with:postedDate:considerCaching:",  v39,  v76,  v46,  v13,  v75,  v64);
        uint64_t v73 = 0LL;
        uint64_t v50 = v70;
      }

      goto LABEL_28;
    default:
      uint64_t v73 = objc_claimAutoreleasedReturnValue([v25 objectForKey:@"assetIdentifier"]);
      uint64_t v48 = -[DownloadManager processAssetDownload:with:and:shouldMove:extractorExists:]( self,  "processAssetDownload:with:and:shouldMove:extractorExists:",  v32);
      uint64_t v51 = 0LL;
      break;
  }

  uint64_t v44 = v69;
  uint64_t v50 = v70;
  uint64_t v43 = v68;
LABEL_28:
  if (v48 == (_BYTE *)&dword_1C + 3)
  {
    uint64_t v49 = (void *)v73;
    goto LABEL_21;
  }

  -[DownloadManager taskFinishedUpdateState:with:](self, "taskFinishedUpdateState:with:", v13, v48);
  uint64_t v49 = (void *)v73;
  if (!v48) {
    goto LABEL_21;
  }
LABEL_18:
  id PathToStagedFile = getPathToStagedFile(v39, v13, 0);
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(PathToStagedFile);
  if (v53)
  {
    id v72 = v49;
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v71 = v13;
    id v55 = v51;
    uint64_t v56 = v25;
    uint64_t v57 = v39;
    uint64_t v58 = v43;
    id v59 = v32;
    id v60 = v44;
    uint64_t v61 = v50;
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v53 path]);
    [v54 removeItemAtPath:v62 error:0];

    uint64_t v50 = v61;
    uint64_t v44 = v60;
    uint64_t v32 = v59;
    uint64_t v43 = v58;
    uint64_t v39 = v57;
    uint64_t v25 = v56;
    uint64_t v51 = v55;
    id v13 = v71;

    uint64_t v49 = v72;
  }

LABEL_21:
}

- (void)indicateDownloadJobFinished:(int)a3 usingXPCConnection:(id)a4 withXPCMessage:(id)a5 performingAutoAssetJob:(id)a6 ofJobType:(id)a7
{
  id v50 = a6;
  id v11 = a7;
  id v12 = v11;
  if (v50)
  {
    if (!+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v11,  @"catalog_job"))
    {
      if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v12, @"asset_job"))
      {
        if (a3)
        {
          uint64_t v22 = stringForMADownloadResult(a3);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          id v29 = MAErrorForDownloadResultWithUnderlying( a3,  0LL,  @"Asset download failed: %@(%ld)",  v24,  v25,  v26,  v27,  v28,  (uint64_t)v23);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        }

        else
        {
          uint64_t v30 = 0LL;
        }

        +[MADAutoAssetControlManager assetDownloadJobFinished:error:]( &OBJC_CLASS___MADAutoAssetControlManager,  "assetDownloadJobFinished:error:",  v50,  v30);
      }

      else
      {
        if (!+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v12,  @"config_job"))
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager indicateDownloadJobFinished:usingXPCConnection:withXPCMessage:performingAutoAssetJob:ofJobType:]",  @"{indicateDownloadJobFinished} unknown job-type(%@) for autoAssetJobID:%@",  v31,  v32,  v33,  v34,  (uint64_t)v12);
          goto LABEL_20;
        }

        if (a3)
        {
          uint64_t v35 = stringForMAOperationResult(a3);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          id v42 = MAErrorForDownloadResultWithUnderlying( a3,  0LL,  @"Configuration change for download failed: %@(%ld)",  v37,  v38,  v39,  v40,  v41,  (uint64_t)v36);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v42);
        }

        else
        {
          uint64_t v30 = 0LL;
        }

        +[MADAutoAssetControlManager assetConfigJobFinished:error:]( &OBJC_CLASS___MADAutoAssetControlManager,  "assetConfigJobFinished:error:",  v50,  v30);
      }

      goto LABEL_20;
    }

    if (a3)
    {
      unint64_t v13 = a3;
      id v14 = stringForMADownloadResult(a3);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v21 = MAErrorForDownloadResultWithUnderlying( v13,  0LL,  @"Catalog download failed: %@(%ld)",  v16,  v17,  v18,  v19,  v20,  (uint64_t)v15);
    }

    else
    {
      uint64_t v43 = stringForMADownloadResult(3uLL);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v43);
      id v21 = MAErrorForDownloadResultWithUnderlying( 3uLL,  0LL,  @"Catalog download finished indication at unexpected point - reporting as: %@(%ld)",  v44,  v45,  v46,  v47,  v48,  (uint64_t)v15);
    }

    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v21);

    +[MADAutoAssetControlManager catalogDownloadJobFinished:withCatalog:error:]( &OBJC_CLASS___MADAutoAssetControlManager,  "catalogDownloadJobFinished:withCatalog:error:",  v50,  0LL,  v49);
  }

  else
  {
    sendClientResponse(a4, a5, a3);
  }

- (id)lastModifiedDateFromResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allHeaderFields]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6)
  {
    BOOL v8 = 0LL;
LABEL_13:
    id v14 = 0LL;
    goto LABEL_14;
  }

  id v7 = v6;
  BOOL v8 = 0LL;
  uint64_t v9 = *(void *)v17;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
      if (![@"Last-Modified" caseInsensitiveCompare:v11])
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v11]);

        BOOL v8 = (void *)v12;
      }
    }

    id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }

  while (v7);
  if (!v8) {
    goto LABEL_13;
  }
  id v13 = ASDateForHTTPDateString(v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
LABEL_14:

  return v14;
}

- (void)activityNotification:(id)a3 ofStatusChange:(unint64_t)a4 withReason:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___NSString);
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[MADActivityTracker nameOfStatus:](&OBJC_CLASS___MADActivityTracker, "nameOfStatus:", a4));
  uint64_t v10 = -[NSString initWithFormat:](v9, "initWithFormat:", @"unexpected statusChange(%@)", v11);
  +[MADActivityManager warningForActivity:fromMethod:leaderNote:warning:]( &OBJC_CLASS___MADActivityManager,  "warningForActivity:fromMethod:leaderNote:warning:",  v8,  @"activityNotification",  v10,  v7);
}

- (BOOL)_isAutoAsset:(id)a3
{
  return [a3 safeBooleanForKey:@"_IsMAAutoAsset"];
}

- (BOOL)_shouldLogAssetDetails:(id)a3 extraServerOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v10 = 1;
  if (!-[DownloadManager _isAutoAsset:](self, "_isAutoAsset:", v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AssetType"]);
    unsigned __int8 updated = isSoftwareUpdateType(v8);

    if ((updated & 1) == 0 && (!v7 || ![v7 count])) {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)_getKeysNotLoggedForV2Response
{
  if (_getKeysNotLoggedForV2Response_v2NotLoggedKeysOnce != -1) {
    dispatch_once(&_getKeysNotLoggedForV2Response_v2NotLoggedKeysOnce, &__block_literal_global_2105);
  }
  return (id)_getKeysNotLoggedForV2Response_v2NotLoggedKeys;
}

void __49__DownloadManager__getKeysNotLoggedForV2Response__block_invoke(id a1)
{
  v1 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v5 = @"_AssetReceipt";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  id v3 = -[NSSet initWithArray:](v1, "initWithArray:", v2);
  uint64_t v4 = (void *)_getKeysNotLoggedForV2Response_v2NotLoggedKeys;
  _getKeysNotLoggedForV2Response_v2NotLoggedKeys = (uint64_t)v3;
}

- (id)_getKeysNotLoggedForAutoResponse
{
  if (_getKeysNotLoggedForAutoResponse_autoNotLoggedKeysOnce != -1) {
    dispatch_once(&_getKeysNotLoggedForAutoResponse_autoNotLoggedKeysOnce, &__block_literal_global_2106);
  }
  return (id)_getKeysNotLoggedForAutoResponse_autoNotLoggedKeys;
}

void __51__DownloadManager__getKeysNotLoggedForAutoResponse__block_invoke(id a1)
{
  v1 = objc_alloc(&OBJC_CLASS___NSSet);
  v5[0] = @"_AssetReceipt";
  v5[1] = @"SupportedDeviceNames";
  v5[2] = @"SupportedDevices";
  v5[3] = @"UnsupportedDevices";
  v5[4] = @"_Measurement";
  v5[5] = @"_MeasurementAlgorithm";
  v5[6] = @"_OSVersionCompatibilities";
  v5[7] = @"version";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 8LL));
  id v3 = -[NSSet initWithArray:](v1, "initWithArray:", v2);
  uint64_t v4 = (void *)_getKeysNotLoggedForAutoResponse_autoNotLoggedKeys;
  _getKeysNotLoggedForAutoResponse_autoNotLoggedKeys = (uint64_t)v3;
}

- (id)_parseForAssetDetailsToLog:(id)a3
{
  id v4 = a3;
  if (-[DownloadManager _isAutoAsset:](self, "_isAutoAsset:", v4)) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DownloadManager _getKeysNotLoggedForAutoResponse](self, "_getKeysNotLoggedForAutoResponse"));
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DownloadManager _getKeysNotLoggedForV2Response](self, "_getKeysNotLoggedForV2Response"));
  }
  id v6 = (void *)v5;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v6, "containsObject:", v13, (void)v16) & 1) == 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);
          -[NSMutableDictionary setSafeObject:forKey:](v7, "setSafeObject:forKey:", v14, v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  return v7;
}

- (void)_logResponseBody:(id)a3 nonce:(id)a4 extraServerOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v56 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v12 = v8;
  id v58 = [v12 countByEnumeratingWithState:&v64 objects:v69 count:16];
  LOBYTE(v13) = 0;
  uint64_t v14 = 0LL;
  if (v58)
  {
    uint64_t v57 = *(void *)v65;
    uint64_t v54 = v10;
    id v55 = v9;
    id v53 = v12;
    do
    {
      for (id i = 0LL; i != v58; id i = v23 + 1)
      {
        if (*(void *)v65 != v57) {
          objc_enumerationMutation(v12);
        }
        id v59 = (char *)i;
        __int128 v16 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
        if (![v16 isEqualToString:@"Assets"])
        {
          if ([v16 isEqualToString:@"Transformations"])
          {
            uint64_t v23 = v59;
            continue;
          }

          id v17 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v16]);
          -[NSMutableDictionary setSafeObject:forKey:](v10, "setSafeObject:forKey:", v17, v16);
          goto LABEL_26;
        }

        id v17 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Assets"]);
        if (!v17) {
          goto LABEL_26;
        }
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
        uint64_t v23 = v59;
        if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
        {
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager _logResponseBody:nonce:extraServerOptions:]",  @"{_logResponseBody} ANOLMALY: list of assets is not of type NSArray",  v19,  v20,  v21,  v22,  v51);
          goto LABEL_28;
        }

        if ([v17 count])
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
          unsigned int v13 = -[DownloadManager _shouldLogAssetDetails:extraServerOptions:]( self,  "_shouldLogAssetDetails:extraServerOptions:",  v24,  v56);

          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          id v17 = v17;
          id v25 = [v17 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v61;
            do
            {
              for (j = 0LL; j != v26; j = (char *)j + 1)
              {
                if (*(void *)v61 != v27) {
                  objc_enumerationMutation(v17);
                }
                if (v13)
                {
                  uint64_t v29 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)j);
                  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[DownloadManager _parseForAssetDetailsToLog:]( self,  "_parseForAssetDetailsToLog:",  v29));
                  if (v34) {
                    -[NSMutableArray addObject:](v11, "addObject:", v34);
                  }
                  else {
                    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadManager _logResponseBody:nonce:extraServerOptions:]",  @"{_logResponseBody} ANOLMALY:_parseForAssetDetailsToLog returned nil for detailsToLog for the following asset meta data: %@",  v30,  v31,  v32,  v33,  v29);
                  }
                }
              }

              v14 += (uint64_t)v26;
              id v26 = [v17 countByEnumeratingWithState:&v60 objects:v68 count:16];
            }

            while (v26);
          }

          id v10 = v54;
          id v9 = v55;
          id v12 = v53;
LABEL_26:
          uint64_t v23 = v59;
        }

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (void)setBrainVersion:(id)a3
{
}

- (void)setDownloadTasksInFlight:(id)a3
{
}

- (NSMutableDictionary)cachedMetaDataForAssetType
{
  return self->_cachedMetaDataForAssetType;
}

- (void)setCachedMetaDataForAssetType:(id)a3
{
}

- (NSURLSessionConfiguration)backgroundDiscretionaryConfiguration
{
  return self->_backgroundDiscretionaryConfiguration;
}

- (void)setBackgroundDiscretionaryConfiguration:(id)a3
{
}

- (NSURLSessionConfiguration)inProcessConfig
{
  return self->_inProcessConfig;
}

- (void)setInProcessConfig:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)splunkOperationQueue
{
  return self->_splunkOperationQueue;
}

- (void)setSplunkOperationQueue:(id)a3
{
}

- (NSURLSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSURLSessionDelegate)splunkDelegate
{
  return self->_splunkDelegate;
}

- (void)setSplunkDelegate:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return self->_backgroundSession;
}

- (void)setBackgroundSession:(id)a3
{
}

- (NSURLSession)splunkSession
{
  return self->_splunkSession;
}

- (void)setSplunkSession:(id)a3
{
}

- (NSURLSession)pallasSession
{
  return self->_pallasSession;
}

- (void)setPallasSession:(id)a3
{
}

- (NSURLSession)inProcessSession
{
  return self->_inProcessSession;
}

- (void)setInProcessSession:(id)a3
{
}

- (void)setDownloadStateQueue:(id)a3
{
}

- (OS_dispatch_queue)splunkStateQueue
{
  return self->_splunkStateQueue;
}

- (void)setSplunkStateQueue:(id)a3
{
}

- (OS_dispatch_queue)ssoQueue
{
  return self->_ssoQueue;
}

- (void)setSsoQueue:(id)a3
{
}

- (void)setCurrentState:(int64_t)a3
{
  self->_int64_t currentState = a3;
}

- (BOOL)haveSyncedSplunkData
{
  return self->_haveSyncedSplunkData;
}

- (void)setHaveSyncedSplunkData:(BOOL)a3
{
  self->_haveSyncedSplunkData = a3;
}

- (BOOL)currentlyBatchingSplunk
{
  return self->_currentlyBatchingSplunk;
}

- (void)setCurrentlyBatchingSplunk:(BOOL)a3
{
  self->_currentlyBatchingSplunk = a3;
}

- (BOOL)haveSyncedSplunkState
{
  return self->_haveSyncedSplunkState;
}

- (void)setHaveSyncedSplunkState:(BOOL)a3
{
  self->_haveSyncedSplunkState = a3;
}

- (PallasResponseVerifier)pallasVerifier
{
  return self->_pallasVerifier;
}

- (void)setPallasVerifier:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSURL)splunkUrl
{
  return self->_splunkUrl;
}

- (void)setSplunkUrl:(id)a3
{
}

- (NSMutableDictionary)currentSplunkEvent
{
  return self->_currentSplunkEvent;
}

- (void)setCurrentSplunkEvent:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)timerRunning
{
  return self->_timerRunning;
}

- (void)setTimerRunning:(BOOL)a3
{
  self->_timerRunning = a3;
}

- (id)timerHandler
{
  return self->_timerHandler;
}

- (void)setTimerHandler:(id)a3
{
}

- (NSString)trainName
{
  return self->_trainName;
}

- (void)setTrainName:(id)a3
{
}

- (NSURLSession)authPallasSession
{
  return self->_authPallasSession;
}

- (void)setAuthPallasSession:(id)a3
{
}

- (MAKeyManagerDownloadSessionDelegate)authPallasSessionDelegate
{
  return self->_authPallasSessionDelegate;
}

- (void)setAuthPallasSessionDelegate:(id)a3
{
}

- (MABAACertManager)authPallasBAACertManager
{
  return self->_authPallasBAACertManager;
}

- (void)setAuthPallasBAACertManager:(id)a3
{
}

- (void)setDeviceStatusQueue:(id)a3
{
}

- (OS_dispatch_queue)dedupNSURLSessionSyncQueue
{
  return self->_dedupNSURLSessionSyncQueue;
}

- (void)setDedupNSURLSessionSyncQueue:(id)a3
{
}

- (void)setDeviceBeforeFirstUnlock:(BOOL)a3
{
  self->_deviceBeforeFirstUnlock = a3;
}

- (BOOL)performingNSURLSessionSync
{
  return self->_performingNSURLSessionSync;
}

- (void)setPerformingNSURLSessionSync:(BOOL)a3
{
  self->_performingNSURLSessionSync = a3;
}

- (BOOL)forceDaemonBusy
{
  return self->_forceDaemonBusy;
}

- (void)setForceDaemonBusy:(BOOL)a3
{
  self->_forceDaemonBusy = a3;
}

- (void).cxx_destruct
{
}

@end