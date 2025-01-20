@interface NDBackgroundSession
- (BOOL)clientIsActive;
- (BOOL)currentDiscretionaryStatus:(id)a3 withOptionalTaskInfo:(id)a4;
- (BOOL)errorIfBlockedTracker:(id)a3 url:(id)a4;
- (BOOL)finalizeTaskCompletionWithSuppressedWake:(BOOL)a3;
- (BOOL)hasConnectedClient;
- (BOOL)retryTask:(id)a3 originalError:(id)a4 transactionMetrics:(id)a5;
- (BOOL)sessionHasOutstandingTasks;
- (BOOL)trustPassesExtendedValidation:(__SecTrust *)a3;
- (NDBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11;
- (NDBackgroundSessionDelegate)delegate;
- (NSString)clientBundleID;
- (NSString)identifier;
- (NSString)monitoredAppBundleID;
- (NSString)secondaryID;
- (NSString)sharedContainerIdentifier;
- (NSUUID)uuid;
- (double)defaultWindowDurationForResourceTimeout:(double)a3;
- (id)_URLSession:(id)a3 downloadTaskNeedsDownloadDirectory:(id)a4;
- (id)adjustDiscretionaryStatusForTaskInfo:(id)a3;
- (id)clientErrorForError:(id)a3;
- (id)configurationWithClientConfiguration:(id)a3 discretionary:(BOOL)a4;
- (id)createNewTaskFromInfo:(id)a3;
- (id)descriptionForRequest:(id)a3;
- (id)descriptionForTCPConnectionWaitingReason:(int64_t)a3;
- (id)descriptionForTaskWithIdentifier:(unint64_t)a3;
- (id)getClientProxy;
- (id)getTLSSessionCachePrefix;
- (id)getTasksForReconnection;
- (id)inputStreamWithFileHandle:(id)a3 taskIdentifier:(unint64_t)a4;
- (id)invalidateReply;
- (id)makeTempUploadFile:(id)a3 withExtensionData:(id)a4;
- (id)requestWithAdjustedWindowForTaskInfo:(id)a3;
- (id)restoreCompletedTask:(id)a3;
- (id)restoreInProgressTask:(id)a3;
- (id)restoreTask:(id)a3 isOutstanding:(BOOL *)a4;
- (id)restoreTasks:(BOOL *)a3;
- (id)restoreTasksFromArchivedInfo:(id)a3;
- (id)restoreTasksFromSqliteDB:(id)a3;
- (id)sanitizeTaskProperties:(id)a3;
- (id)sessionForDiscretionaryStatus:(BOOL)a3;
- (id)setupDownloadDirectory;
- (id)tasksArchivePath;
- (int64_t)priorityForDiscretionaryStatus:(BOOL)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5;
- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_URLSession:(id)a3 downloadTask:(id)a4 didReceiveResponse:(id)a5;
- (void)_URLSession:(id)a3 openFileAtPath:(id)a4 mode:(int)a5 completionHandler:(id)a6;
- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6;
- (void)addOutstandingTaskWithIdentifier:(unint64_t)a3;
- (void)allowReconnect;
- (void)applicationWasSuspended:(id)a3 pid:(int)a4;
- (void)archiveTimerFired;
- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12;
- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15;
- (void)backgroundUpdatesEnabledForApplication:(id)a3;
- (void)cancelMonitorForTask:(unint64_t)a3;
- (void)cancelTaskWithIdentifier:(unint64_t)a3;
- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4;
- (void)cancelTasksRequiringClientConnectionAndResumeUnstartedTasks;
- (void)cleanupSessionWithCompletionHandler:(id)a3;
- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3;
- (void)clientApplicationWasReinstalled;
- (void)clientDidDisconnect;
- (void)configureAdditionalPropertiesOnTask:(id)a3 taskInfo:(id)a4;
- (void)configureTask:(id)a3 withTaskInfo:(id)a4;
- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7;
- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 downloadFilePath:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8;
- (void)downloadTaskWithResumeData:(id)a3 identifier:(unint64_t)a4 uniqueIdentifier:(id)a5 reply:(id)a6;
- (void)ensureSessionDownloadDirectoryExists;
- (void)errorOccurredDuringAuthCallbackDelivery:(id)a3 completionHandler:(id)a4;
- (void)errorOccurredDuringFinishedCallbackDelivery:(id)a3;
- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4;
- (void)fillInPropertiesForTaskInfo:(id)a3 withTaskID:(id)a4;
- (void)handleCompletionOfTask:(id)a3 identifier:(unint64_t)a4 taskInfo:(id)a5 isRecoverable:(BOOL)a6 suppressWake:(BOOL)a7;
- (void)handleEarliestBeginDateForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4;
- (void)handleWillBeginDelayedRequestForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4;
- (void)invalidateWithReply:(id)a3;
- (void)obliterate;
- (void)performCommonSetupForTask:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5 discretionaryStatus:(BOOL)a6;
- (void)pingForXPCObjectValidityWithReply:(id)a3;
- (void)queueUpdatesForTask:(id)a3 updateType:(unint64_t)a4 highPriority:(BOOL)a5;
- (void)reconnectClient:(id)a3 withCompletion:(id)a4;
- (void)removeDownloadFileForTaskInfo:(id)a3;
- (void)removeOutstandingTaskWithIdentifier:(unint64_t)a3;
- (void)removeUploadFileForTaskInfo:(id)a3;
- (void)requeueTask:(unint64_t)a3;
- (void)requeueTask:(unint64_t)a3 skipResume:(BOOL)a4;
- (void)resetStorageWithReply:(id)a3;
- (void)resumeTaskWithIdentifier:(unint64_t)a3 withProperties:(id)a4;
- (void)setBytesPerSecondLimit:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDescription:(id)a3 forTask:(unint64_t)a4;
- (void)setDiscretionaryOverride:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setExpectedProgressTarget:(unint64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setInvalidateReply:(id)a3;
- (void)setLoadingPoolPriority:(double)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setPropertyOnStreamWithIdentifier:(unint64_t)a3 propDict:(id)a4 propKey:(id)a5 withReply:(id)a6;
- (void)setSharedContainerIdentifier:(id)a3;
- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4;
- (void)setTLSSessionCachePrefix:(id)a3;
- (void)setXPCConnection:(id)a3;
- (void)setupDASPropertiesOnTask:(id)a3 taskInfo:(id)a4 discretionaryStatus:(BOOL)a5;
- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5;
- (void)storeTaskInfoUpdates:(BOOL)a3;
- (void)suspendTaskWithIdentifier:(unint64_t)a3;
- (void)taskShouldResume:(unint64_t)a3;
- (void)taskShouldSuspend:(unint64_t)a3;
- (void)triggerPowerlogPeriodicUpdate;
- (void)updateOptions:(id)a3;
- (void)updateTaskInfoBasedOnCurrentDiscretionaryStatus:(id)a3;
- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 sandboxExtensionData:(id)a6 identifier:(unint64_t)a7 uniqueIdentifier:(id)a8 potentialCredentials:(id)a9 reply:(id)a10;
- (void)uploadTaskWithResumableUploadState:(id)a3 request:(id)a4 originalRequest:(id)a5 fromFile:(id)a6 sandboxExtensionData:(id)a7 identifier:(unint64_t)a8 uniqueIdentifier:(id)a9 potentialCredentials:(id)a10 reply:(id)a11;
- (void)wakeUpClient:(int64_t)a3;
@end

@implementation NDBackgroundSession

- (void)updateOptions:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsWillSendRequestForEstablishedConnectionKey"]);
  self->_clientImplementsWillSendRequest = [v4 BOOLValue];

  v5 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsWillBeginDelayedRequestKey"]);
  self->_clientImplementsWillBeginDelayedRequest = [v5 BOOLValue];

  v6 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsSessionAuthChallengeKey"]);
  self->_clientImplementsSessionChallenge = [v6 BOOLValue];

  v7 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"NSURLSessionDelegateImplementsTaskAuthChallengeKey"]);
  self->_clientImplementsTaskChallenge = [v7 BOOLValue];
}

- (double)defaultWindowDurationForResourceTimeout:(double)a3
{
  return (double)(uint64_t)(a3 * 0.9);
}

- (id)configurationWithClientConfiguration:(id)a3 discretionary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [v6 timeoutIntervalForRequest];
  objc_msgSend(v7, "setTimeoutIntervalForRequest:");
  [v6 timeoutIntervalForResource];
  if (v8 == 0.0) {
    [v7 timeoutIntervalForResource];
  }
  objc_msgSend(v7, "setTimeoutIntervalForResource:");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 connectionProxyDictionary]);
  [v7 setConnectionProxyDictionary:v9];

  objc_msgSend(v7, "setTLSMinimumSupportedProtocol:", objc_msgSend(v6, "TLSMinimumSupportedProtocol"));
  objc_msgSend(v7, "setTLSMaximumSupportedProtocol:", objc_msgSend(v6, "TLSMaximumSupportedProtocol"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 HTTPAdditionalHeaders]);
  [v7 setHTTPAdditionalHeaders:v10];

  objc_msgSend(v7, "setHTTPMaximumConnectionsPerHost:", objc_msgSend(v6, "HTTPMaximumConnectionsPerHost"));
  objc_msgSend(v7, "setNetworkServiceType:", objc_msgSend(v6, "networkServiceType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 _authenticatorStatusCodes]);
  objc_msgSend(v7, "set_authenticatorStatusCodes:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 _atsContext]);
  objc_msgSend(v7, "set_atsContext:", v12);

  objc_msgSend(v7, "set_allowsTLSFalseStart:", objc_msgSend(v6, "_allowsTLSFalseStart"));
  objc_msgSend(v7, "set_allowsTLSFallback:", objc_msgSend(v6, "_allowsTLSFallback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 _tlsTrustPinningPolicyName]);
  objc_msgSend(v7, "set_tlsTrustPinningPolicyName:", v13);

  objc_msgSend(v7, "set_allowsTLSECH:", objc_msgSend(v6, "_allowsTLSECH"));
  objc_msgSend(v7, "set_reportsDataStalls:", objc_msgSend(v6, "_reportsDataStalls"));
  objc_msgSend(v7, "set_TCPAdaptiveReadTimeout:", objc_msgSend(v6, "_TCPAdaptiveReadTimeout"));
  objc_msgSend(v7, "set_TCPAdaptiveWriteTimeout:", objc_msgSend(v6, "_TCPAdaptiveWriteTimeout"));
  objc_msgSend(v7, "set_onBehalfOfPairedDevice:", objc_msgSend(v6, "_onBehalfOfPairedDevice"));
  objc_msgSend(v7, "set_requiresSustainedDataDelivery:", objc_msgSend(v6, "_requiresSustainedDataDelivery"));
  objc_msgSend(v7, "set_IDSMessageTimeout:", objc_msgSend(v6, "_IDSMessageTimeout"));
  objc_msgSend(v7, "set_alwaysPerformDefaultTrustEvaluation:", objc_msgSend(v6, "_alwaysPerformDefaultTrustEvaluation"));
  objc_msgSend(v7, "set_prefersInfraWiFi:", objc_msgSend(v6, "_prefersInfraWiFi"));
  if (-[NDApplication canBeSuspended](self->_clientApplication, "canBeSuspended")) {
    [v7 setNetworkServiceType:3];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 _maximumWatchCellularTransferSize]);
  objc_msgSend(v7, "set_maximumWatchCellularTransferSize:", v14);

  [v7 setHTTPCookieStorage:0];
  [v7 setURLCache:0];
  [v7 setURLCredentialStorage:self->_credentialStorage];
  objc_msgSend(v7, "setAllowsCellularAccess:", objc_msgSend(v6, "allowsCellularAccess"));
  [v7 setWaitsForConnectivity:0];
  [v7 setShouldUseExtendedBackgroundIdleMode:0];
  objc_msgSend(v7, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v6, "allowsExpensiveNetworkAccess"));
  objc_msgSend(v7, "setAllowsConstrainedNetworkAccess:", objc_msgSend(v6, "allowsConstrainedNetworkAccess"));
  objc_msgSend(v7, "_setAllowsUCA:", objc_msgSend(v6, "_allowsUCA"));
  objc_msgSend(v7, "set_allowsVirtualInterfaces:", objc_msgSend(v6, "_allowsVirtualInterfaces"));
  objc_msgSend(v7, "set_multipathAlternatePort:", objc_msgSend(v6, "_multipathAlternatePort"));
  objc_msgSend(v7, "set_allowsPowerNapScheduling:", objc_msgSend(v6, "_allowsPowerNapScheduling"));
  objc_msgSend( v7,  "set_allowsHSTSWithUntrustedRootCertificate:",  objc_msgSend(v6, "_allowsHSTSWithUntrustedRootCertificate"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v6 _connectionPoolName]);
  v16 = (void *)v15;
  if (v15) {
    v17 = (const __CFString *)v15;
  }
  else {
    v17 = @"NSURLSessionBackgroundPoolName";
  }
  objc_msgSend(v7, "set_tcpConnectionPoolName:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  if ([v18 isInSyncBubble])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 _connectionPoolName]);

    if (v19) {
      goto LABEL_12;
    }
    v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSURLSessionBackgroundPoolName-sync-%d",  geteuid());
    v18 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v7, "set_tcpConnectionPoolName:", v18);
  }

LABEL_12:
  objc_msgSend(v7, "set_connectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v7, "set_longLivedConnectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v7, "set_preventsIdleSleepOnceConnected:", 1);
  objc_msgSend(v7, "set_timingDataOptions:", objc_msgSend(v6, "_timingDataOptions"));
  objc_msgSend( v7,  "set_shouldSkipPreferredClientCertificateLookup:",  objc_msgSend(v6, "_shouldSkipPreferredClientCertificateLookup"));
  objc_msgSend(v7, "set_requiresPowerPluggedIn:", objc_msgSend(v6, "_requiresPowerPluggedIn"));
  objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", self->_monitoredAppBundleID);
  objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", self->_secondaryID);
  objc_msgSend(v7, "set_watchExtensionBundleIdentifier:", self->_watchExtensionBundleIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 _sourceApplicationAuditTokenData]);
  objc_msgSend(v7, "set_sourceApplicationAuditTokenData:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 _directoryForDownloadedFiles]);
  objc_msgSend(v7, "set_directoryForDownloadedFiles:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  unsigned int v24 = [v23 isPrivileged];

  if (v24) {
    objc_msgSend(v7, "set_requiresClientToOpenFiles:", 1);
  }
  objc_msgSend(v7, "set_duetPreauthorized:", objc_msgSend(v6, "_duetPreauthorized"));
  objc_msgSend(v7, "set_loggingPrivacyLevel:", objc_msgSend(v6, "_loggingPrivacyLevel"));
  objc_msgSend(v7, "set_duetPreClearedMode:", objc_msgSend(v6, "_duetPreClearedMode"));
  objc_msgSend(v7, "set_pidForHAR:", objc_msgSend(v6, "_pidForHAR"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  else {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  [v25 setObject:kCFBooleanTrue forKeyedSubscript:_kCFStreamPropertyLargeDownload];
  [v25 setObject:kCFBooleanTrue forKeyedSubscript:kCFStreamPropertyIndefiniteConnection];
  [v25 setObject:&off_10007B460 forKeyedSubscript:_kCFStreamPropertyWatchdogTimeout];
  [v25 setObject:&off_10007B478 forKeyedSubscript:_kCFStreamPropertyIndefiniteConnectionKickInterval];
  if (v4)
  {
    if (v26)
    {
      [v7 timeoutIntervalForResource];
      -[NDBackgroundSession defaultWindowDurationForResourceTimeout:](self, "defaultWindowDurationForResourceTimeout:");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)v27));
      [v26 setObject:v28 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDuration];

      [v26 setObject:&off_10007B490 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDelay];
      [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionIsDiscretionary];
      [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFStreamPropertyDUETConditional];
      if ([v6 isDiscretionary]
        && ([v6 _clientIsNotExplicitlyDiscretionary] & 1) == 0)
      {
        [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:kConditionalConnectionClientOptInDiscretionary];
      }

      else
      {
        objc_msgSend(v7, "set_clientIsNotExplicitlyDiscretionary:", 1);
      }

      if ([v6 _xpcActivityBudgeted])
      {
        [v26 setObject:&off_10007B4A8 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
      }

      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 _duetPreClearedMode]));
        [v26 setObject:v31 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
      }
    }

    objc_msgSend(v7, "set_forcedNetworkServiceType:", 5);
    [v7 setDiscretionary:1];
  }

  else if (v26)
  {
    [v26 setObject:&off_10007B4C0 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDuration];
    [v26 setObject:&off_10007B490 forKeyedSubscript:kConditionalConnectionRequirementTimeWindowDelay];
    [v26 setObject:&__kCFBooleanFalse forKeyedSubscript:kConditionalConnectionIsDiscretionary];
    if ([v6 _xpcActivityBudgeted])
    {
      else {
        v29 = &off_10007B4D8;
      }
      [v26 setObject:v29 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v7 _duetPreClearedMode]));
      [v26 setObject:v30 forKeyedSubscript:kConditionalConnectionRequirementDuetPreClearedMode];
    }
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  unsigned int v33 = [v32 isInSyncBubble];

  if (v33) {
    objc_msgSend(v7, "set_forcedNetworkServiceType:", 5);
  }
  if (v26) {
    [v25 setObject:v26 forKeyedSubscript:kCFStreamPropertyConditionalConnectionProperties];
  }
  objc_msgSend(v7, "set_socketStreamProperties:", v25);
  objc_msgSend(v7, "setSkip_download_unlink:", 1);

  return v7;
}

- (NDBackgroundSession)initWithConfiguration:(id)a3 bundleID:(id)a4 isSpringBoardApp:(BOOL)a5 downloadDirectory:(id)a6 options:(id)a7 clientProxy:(id)a8 delegate:(id)a9 workQueue:(id)a10 db:(id)a11
{
  BOOL v13 = a5;
  id v16 = a3;
  id v121 = a4;
  id v126 = a7;
  id v124 = a8;
  id obj = a9;
  id v122 = a10;
  id v123 = a11;
  v127.receiver = self;
  v127.super_class = (Class)&OBJC_CLASS___NDBackgroundSession;
  v17 = -[NDBackgroundSession init](&v127, "init");
  v18 = v17;
  if (!v17)
  {
LABEL_48:
    v68 = v18;
    goto LABEL_49;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  [v19 addTransaction];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v126 objectForKeyedSubscript:@"NDBackgroundSessionManagerKeySessionUUID"]);
  v21 = v20;
  if (v20)
  {
    v114 = v17 + 264;
    v22 = v20;
  }

  else
  {
    v22 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    v114 = v17 + 264;
  }

  v23 = (void *)*((void *)v17 + 33);
  *((void *)v17 + 33) = v22;

  objc_storeWeak((id *)v17 + 32, obj);
  unsigned int v24 = v17 + 280;
  objc_storeStrong((id *)v17 + 35, a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v16 _sourceApplicationBundleIdentifier]);
  if (v25)
  {
    id v26 = (id)objc_claimAutoreleasedReturnValue([v16 _sourceApplicationBundleIdentifier]);
    double v27 = (id *)(v17 + 288);
  }

  else
  {
    double v27 = (id *)(v17 + 288);
    id v26 = *((id *)v17 + 35);
  }

  v28 = (void *)*((void *)v17 + 36);
  *((void *)v17 + 36) = v26;

  v17[248] = 1;
  uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v30 = (void *)*((void *)v17 + 23);
  *((void *)v17 + 23) = v29;

  uint64_t v31 = objc_claimAutoreleasedReturnValue([v16 _sourceApplicationSecondaryIdentifier]);
  v32 = (void *)*((void *)v17 + 37);
  *((void *)v17 + 37) = v31;

  unsigned int v33 = (void *)*((void *)v17 + 4);
  if (v33)
  {
    id v34 = v33;
  }

  else
  {
    v35 = (void *)*v24;
    if (v13) {
      id v34 = (id)objc_claimAutoreleasedReturnValue( +[NDApplication springboardApplicationWithBundleIdentifier:]( &OBJC_CLASS___NDApplication,  "springboardApplicationWithBundleIdentifier:",  v35));
    }
    else {
      id v34 = (id)objc_claimAutoreleasedReturnValue( +[NDApplication applicationWithIdentifier:]( &OBJC_CLASS___NDApplication,  "applicationWithIdentifier:",  v35));
    }
  }

  v36 = (void *)*((void *)v17 + 4);
  *((void *)v17 + 4) = v34;

  location = (id *)(v17 + 216);
  if (!*((void *)v17 + 27))
  {
    if ([*v27 isEqualToString:*v24])
    {
      objc_storeStrong(location, *((id *)v17 + 4));
      v37 = (os_log_s *)(id)qword_100083990;
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
          id v40 = *v27;
          *(_DWORD *)buf = 138543618;
          id v129 = v39;
          __int16 v130 = 2112;
          id v131 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Client %@ is a SpringBoard application",  buf,  0x16u);
        }
      }

      else if (v38)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
        id v45 = *v27;
        *(_DWORD *)buf = 138543618;
        id v129 = v44;
        __int16 v130 = 2112;
        id v131 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Client %@ is a daemon or non-SpringBoard application",  buf,  0x16u);
      }
    }

    else
    {
      unsigned int v41 = +[NDApplication springBoardApplicationExistsWithIdentifier:]( &OBJC_CLASS___NDApplication,  "springBoardApplicationExistsWithIdentifier:",  *v27);
      id v42 = *v27;
      if (v41) {
        uint64_t v43 = objc_claimAutoreleasedReturnValue( +[NDApplication springboardApplicationWithBundleIdentifier:]( &OBJC_CLASS___NDApplication,  "springboardApplicationWithBundleIdentifier:",  v42));
      }
      else {
        uint64_t v43 = objc_claimAutoreleasedReturnValue( +[NDApplication applicationWithIdentifier:]( &OBJC_CLASS___NDApplication,  "applicationWithIdentifier:",  v42));
      }
      id v46 = *location;
      id *location = (id)v43;

      v37 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
        v48 = (void *)*v24;
        id v49 = *v27;
        *(_DWORD *)buf = 138544130;
        id v129 = v47;
        __int16 v130 = 2112;
        id v131 = v48;
        __int16 v132 = 2112;
        id v133 = v49;
        __int16 v134 = 1024;
        LODWORD(v135) = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Client %@ is acting on behalf of application %@, impersonatingSpringBoardApp: %d",  buf,  0x26u);
      }
    }
  }

  uint64_t v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier", v114));
  v51 = (void *)*((void *)v17 + 34);
  *((void *)v17 + 34) = v50;

  uint64_t v52 = objc_claimAutoreleasedReturnValue([v16 sharedContainerIdentifier]);
  v53 = (void *)*((void *)v17 + 39);
  *((void *)v17 + 39) = v52;

  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities sessionPath:forBundleID:]( &OBJC_CLASS___NDFileUtilities,  "sessionPath:forBundleID:",  *((void *)v17 + 34),  *((void *)v17 + 35)));
  uint64_t v55 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v54));
  v56 = (void *)*((void *)v17 + 14);
  *((void *)v17 + 14) = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue([v16 _directoryForDownloadedFiles]);
  v58 = v57;
  if (v57) {
    id v59 = v57;
  }
  else {
    id v59 = (id)objc_claimAutoreleasedReturnValue([v17 setupDownloadDirectory]);
  }
  v60 = (void *)*((void *)v17 + 15);
  *((void *)v17 + 15) = v59;

  uint64_t v61 = objc_claimAutoreleasedReturnValue([*((id *)v17 + 14) URLByAppendingPathComponent:@"Uploads"]);
  v62 = (void *)*((void *)v17 + 16);
  *((void *)v17 + 16) = v61;

  if (*((void *)v17 + 15))
  {
    objc_storeStrong((id *)v17 + 25, a10);
    objc_storeStrong((id *)v17 + 29, a8);
    v63 = -[NDCredentialStorage initWithDelegate:forBundleID:]( objc_alloc(&OBJC_CLASS___NDCredentialStorage),  "initWithDelegate:forBundleID:",  v17,  *((void *)v17 + 35));
    v64 = (void *)*((void *)v17 + 3);
    *((void *)v17 + 3) = v63;

    v65 = (id *)objc_claimAutoreleasedReturnValue([v17 configurationWithClientConfiguration:v16 discretionary:0]);
    v117 = (void *)objc_claimAutoreleasedReturnValue([v17 configurationWithClientConfiguration:v16 discretionary:1]);
    v17[142] = [v16 isDiscretionary];
    else {
      unsigned __int8 v66 = [v16 _sessionSendsLaunchOnDemandEvents];
    }
    v17[141] = v66;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
    unsigned int v70 = [v69 isInSyncBubble];

    if (v70) {
      v17[141] = 0;
    }
    v17[136] = [v16 _performsEVCertCheck];
    [v17 updateOptions:v126];
    uint64_t v71 = objc_claimAutoreleasedReturnValue( +[NSURLSession _sessionWithConfiguration:delegate:delegateDispatchQueue:]( &OBJC_CLASS___NSURLSession,  "_sessionWithConfiguration:delegate:delegateDispatchQueue:",  v65,  v17,  *((void *)v17 + 25)));
    v72 = (void *)*((void *)v17 + 1);
    *((void *)v17 + 1) = v71;

    uint64_t v73 = objc_claimAutoreleasedReturnValue( +[NSURLSession _sessionWithConfiguration:delegate:delegateDispatchQueue:]( &OBJC_CLASS___NSURLSession,  "_sessionWithConfiguration:delegate:delegateDispatchQueue:",  v117,  v17,  *((void *)v17 + 25)));
    v74 = (void *)*((void *)v17 + 2);
    *((void *)v17 + 2) = v73;

    [*((id *)v17 + 2) _useTLSSessionCacheFromSession:*((void *)v17 + 1)];
    v75 = -[NDCallbackQueue initWithDelegate:](objc_alloc(&OBJC_CLASS___NDCallbackQueue), "initWithDelegate:", v17);
    v76 = (void *)*((void *)v17 + 26);
    *((void *)v17 + 26) = v75;

    uint64_t v77 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v78 = (void *)*((void *)v17 + 6);
    *((void *)v17 + 6) = v77;

    uint64_t v79 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v80 = (void *)*((void *)v17 + 7);
    *((void *)v17 + 7) = v79;

    uint64_t v81 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v82 = (void *)*((void *)v17 + 28);
    *((void *)v17 + 28) = v81;

    uint64_t v83 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v84 = (void *)*((void *)v17 + 8);
    *((void *)v17 + 8) = v83;

    uint64_t v85 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v86 = (void *)*((void *)v17 + 9);
    *((void *)v17 + 9) = v85;

    uint64_t v87 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v88 = (void *)*((void *)v17 + 11);
    *((void *)v17 + 11) = v87;

    v17[147] = v124 != 0LL;
    v17[192] = [v16 _allowsRetryForBackgroundDataTasks];
    if (v17[146]) {
      unsigned __int8 v89 = 1;
    }
    else {
      unsigned __int8 v89 = [v16 _infersDiscretionaryFromOriginatingClient];
    }
    v17[146] = v89;
    *(_WORD *)(v17 + 143) = 0;
    *((_DWORD *)v17 + 40) = [v16 _neTrackerTCCResult];
    *((_DWORD *)v17 + 41) = -1;
    +[NDFileUtilities createDirectoryAtURL:]( &OBJC_CLASS___NDFileUtilities,  "createDirectoryAtURL:",  *((void *)v17 + 14));
    +[NDFileUtilities createDirectoryAtURL:]( &OBJC_CLASS___NDFileUtilities,  "createDirectoryAtURL:",  *((void *)v17 + 16));
    if (*((void *)v17 + 29))
    {
      id v90 = [v16 copy];
      id v91 = [v126 mutableCopy];
      [v91 setObject:*v115 forKeyedSubscript:@"NDBackgroundSessionManagerKeySessionUUID"];
      v92 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v17 + 14) URLByAppendingPathComponent:@"configuration.plist"]);
      v93 = (void *)objc_claimAutoreleasedReturnValue([v92 path]);

      v94 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v17 + 14) URLByAppendingPathComponent:@"options.plist"]);
      v95 = (void *)objc_claimAutoreleasedReturnValue([v94 path]);

      v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v90,  1LL,  0LL));
      [v96 writeToFile:v93 atomically:1];

      v97 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v91,  1LL,  0LL));
      [v97 writeToFile:v95 atomically:1];
    }

    if (*location) {
      [*location addObserver:v17];
    }
    objc_storeStrong((id *)v17 + 30, a11);
    v98 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      locationa = v65;
      id v120 = (id)objc_claimAutoreleasedReturnValue([v17 uuid]);
      uint64_t v99 = *((void *)v17 + 34);
      v100 = (void *)*((void *)v17 + 35);
      v101 = (void *)*((void *)v17 + 33);
      [v16 timeoutIntervalForResource];
      uint64_t v103 = v102;
      [v16 timeoutIntervalForRequest];
      uint64_t v105 = v104;
      unsigned int v106 = [v16 allowsCellularAccess];
      unsigned int v107 = [v16 allowsExpensiveNetworkAccess];
      v116 = (void *)objc_claimAutoreleasedReturnValue([v16 _sourceApplicationBundleIdentifier]);
      v108 = (void *)objc_claimAutoreleasedReturnValue([v16 _sourceApplicationSecondaryIdentifier]);
      int v109 = v17[248];
      unsigned int v110 = [v16 _allowsUCA];
      *(_DWORD *)buf = 138546178;
      id v129 = v120;
      __int16 v130 = 2114;
      id v131 = v101;
      __int16 v132 = 2112;
      id v133 = v100;
      __int16 v134 = 2112;
      uint64_t v135 = v99;
      __int16 v136 = 2048;
      uint64_t v137 = v103;
      __int16 v138 = 2048;
      uint64_t v139 = v105;
      __int16 v140 = 1024;
      unsigned int v141 = v106;
      __int16 v142 = 1024;
      unsigned int v143 = v107;
      __int16 v144 = 2112;
      v145 = v116;
      __int16 v146 = 2112;
      v147 = v108;
      __int16 v148 = 1024;
      int v149 = v109;
      __int16 v150 = 1024;
      unsigned int v151 = v110;
      _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Session <%{public}@> is for <%@>.<%@> using resource timeout: %f, request timeout: %f all owsCellularAccess: %d, allowsExpensiveAccess: %d, _sourceApplicationBundleIdentifier: %@, _sourceApplicationSeco ndaryIdentifier: %@, hasSqliteSupport: %u, _allowsUCA: %d",  buf,  0x6Au);

      v65 = locationa;
    }

    goto LABEL_48;
  }

  v67 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
  {
    v112 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
    v113 = (void *)*v24;
    *(_DWORD *)buf = 138543618;
    id v129 = v112;
    __int16 v130 = 2112;
    id v131 = v113;
    _os_log_error_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't find out download directory for %@. Not creating session",  buf,  0x16u);
  }

  v68 = 0LL;
LABEL_49:

  return v68;
}

- (id)sessionForDiscretionaryStatus:(BOOL)a3
{
  uint64_t v3 = 1LL;
  if (a3) {
    uint64_t v3 = 2LL;
  }
  return (&self->super.isa)[v3];
}

- (void)setXPCConnection:(id)a3
{
  id v5 = a3;
  [v5 setUserInfo:self];
  p_xpcConn = &self->_xpcConn;
  objc_storeStrong((id *)&self->_xpcConn, a3);
  self->_int clientPID = [v5 processIdentifier];
  v7 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    xpcConn = self->_xpcConn;
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    int clientPID = self->_clientPID;
    *(_DWORD *)buf = 138544386;
    double v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = xpcConn;
    __int16 v30 = 2112;
    uint64_t v31 = clientBundleID;
    __int16 v32 = 2112;
    unsigned int v33 = identifier;
    __int16 v34 = 1024;
    int v35 = clientPID;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Using XPC connection %@ for client %@ with identifier %@ and PID %d",  buf,  0x30u);
  }

  if (self->_shouldPullInitialCredentials)
  {
    self->_shouldPullInitialCredentials = 0;
    -[NDCredentialStorage populateWithInitialCredentials](self->_credentialStorage, "populateWithInitialCredentials");
  }

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](*p_xpcConn, "_xpcConnection"));
  int is_extension = xpc_connection_is_extension();

  if (is_extension)
  {
    v25 = 0LL;
    if (*p_xpcConn)
    {
      -[NSXPCConnection auditToken](*p_xpcConn, "auditToken");
    }

    else
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
    }

    CPCopyBundleIdentifierAndTeamFromAuditToken(&v23, &v25, 0LL);
    uint64_t v15 = v25;
    id v16 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      v19 = self->_identifier;
      v18 = self->_clientBundleID;
      *(_DWORD *)buf = 138544130;
      double v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      unsigned int v33 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> XPC connection is to PlugIn %@ for session <%@>.<%@>",  buf,  0x2Au);
    }

    if (v15)
    {
      v20 = (NDApplication *)objc_claimAutoreleasedReturnValue( +[NDApplication springboardApplicationWithBundleIdentifier:]( &OBJC_CLASS___NDApplication,  "springboardApplicationWithBundleIdentifier:",  v15));
      connectedExtension = self->_connectedExtension;
      self->_connectedExtension = v20;

      -[NDApplication addObserver:](self->_connectedExtension, "addObserver:", self);
    }
  }

  self->_shouldElevateDiscretionaryPriority = -[NDApplication shouldElevateDiscretionaryPriority]( self->_clientApplication,  "shouldElevateDiscretionaryPriority",  v23,  v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection"));
  [v22 removePendingWakeForClient:self->_clientBundleID sessionIdentifier:self->_identifier];
}

- (BOOL)hasConnectedClient
{
  if (self->_xpcConn) {
    BOOL v3 = self->_clientProxy != 0LL;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v6 = (void *)v5;
    if (v3) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    if (self->_xpcConn) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    if (self->_clientProxy) {
      int v11 = 89;
    }
    else {
      int v11 = 78;
    }
    int v13 = 138544642;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    id v16 = clientBundleID;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2112;
    __int128 v24 = identifier;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> client %@ connected result (%c), XPC(%c) proxy(%c) for %@",  (uint8_t *)&v13,  0x32u);
  }

  return v3;
}

- (void)applicationWasSuspended:(id)a3 pid:(int)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CF44;
  block[3] = &unk_100078F78;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)backgroundUpdatesEnabledForApplication:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002CE80;
  v7[3] = &unk_100079C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)clientApplicationWasReinstalled
{
  BOOL v3 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543618;
    __int16 v32 = v4;
    __int16 v33 = 2112;
    __int16 v34 = clientBundleID;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Application %@ was reinstalled, adjusting download paths",  buf,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession setupDownloadDirectory](self, "setupDownloadDirectory"));
  __int128 v24 = v6;
  if (v6)
  {
    int v7 = v6;
    if (([v6 isEqual:self->_downloadDirectory] & 1) == 0)
    {
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id obj = self->_identifiersToTaskInfo;
      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      if (v8)
      {
        uint64_t v9 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTaskInfo,  "objectForKeyedSubscript:",  v11));
            if (![v12 taskKind])
            {
              int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 downloadFileURL]);
              uint64_t v14 = v13;
              if (v13)
              {
                __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
                id v16 = (void *)objc_claimAutoreleasedReturnValue([v24 URLByAppendingPathComponent:v15]);
              }

              else
              {
                id v16 = 0LL;
              }

              [v12 setDownloadFileURL:v16];
              __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v12 identifier]));
              -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v17,  3LL,  0LL);

              int v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTasks,  "objectForKeyedSubscript:",  v11));
              __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
              int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 downloadFile]);
              [v20 setPath:v19];
            }
          }

          id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
        }

        while (v8);
      }

      objc_storeStrong((id *)&self->_downloadDirectory, v24);
      int v7 = v24;
    }
  }

  else
  {
    __int16 v21 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      __int16 v23 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      __int16 v32 = v22;
      __int16 v33 = 2112;
      __int16 v34 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't find out download directory for re-installed application %@. It must not have be en re-installed properly. Obliterating session",  buf,  0x16u);
    }

    int v7 = 0LL;
    -[NDBackgroundSession obliterate](self, "obliterate");
  }
}

- (id)setupDownloadDirectory
{
  if (!self->_sharedContainerIdentifier) {
    goto LABEL_14;
  }
  id v3 = [[LSApplicationExtensionRecord alloc] initWithBundleIdentifier:self->_clientBundleID error:0];
  id v4 = v3;
  if (v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 groupContainerURLs]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:self->_sharedContainerIdentifier]);
  }

  else
  {
    id v5 = [[LSApplicationRecord alloc] initWithBundleIdentifier:self->_clientBundleID allowPlaceholder:0 error:0];
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 groupContainerURLs]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_sharedContainerIdentifier]);
  }

  if (!v6)
  {
LABEL_14:
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication containerURL](self->_clientApplication, "containerURL"));
    if (!v6) {
      goto LABEL_8;
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v6 URLByAppendingPathComponent:@"Library/Caches/com.apple.nsurlsessiond/Downloads" isDirectory:1]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:self->_clientBundleID isDirectory:1]);

  if (!v9) {
LABEL_8:
  }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NDFileUtilities defaultDownloadDirectoryForBundleID:]( &OBJC_CLASS___NDFileUtilities,  "defaultDownloadDirectoryForBundleID:",  self->_clientBundleID));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  unsigned __int8 v12 = [v10 fileExistsAtPath:v11];

  if ((v12 & 1) == 0) {
    +[NDFileUtilities createDirectoryAtURL:](&OBJC_CLASS___NDFileUtilities, "createDirectoryAtURL:", v9);
  }

  return v9;
}

- (void)cleanupSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!self->_cleanedUp)
  {
    self->_cleanedUp = 1;
    id v5 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v13 = 138543362;
      uint64_t v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Cleaning up",  (uint8_t *)&v13,  0xCu);
    }

    -[NSURLSession finishTasksAndInvalidate](self->_userInitiatedSession, "finishTasksAndInvalidate");
    -[NSURLSession finishTasksAndInvalidate](self->_discretionaryPrioritySession, "finishTasksAndInvalidate");
    userInitiatedSession = self->_userInitiatedSession;
    self->_userInitiatedSession = 0LL;

    discretionaryPrioritySession = self->_discretionaryPrioritySession;
    self->_discretionaryPrioritySession = 0LL;

    +[NDFileUtilities removeItemAtURL:](&OBJC_CLASS___NDFileUtilities, "removeItemAtURL:", self->_uploadsDirectory);
    tasksDB = self->tasksDB;
    if (tasksDB)
    {
      -[NDTaskStorageDB _deleteAllTaskEntriesForSession:sessionUUID:]( tasksDB,  "_deleteAllTaskEntriesForSession:sessionUUID:",  self->_identifier,  self->_uuid);
      id v10 = self->tasksDB;
      self->tasksDB = 0LL;
    }

    +[NDFileUtilities removeItemAtURL:](&OBJC_CLASS___NDFileUtilities, "removeItemAtURL:", self->_sessionDirectory);
    -[NDApplication removeObserver:](self->_monitoredApplication, "removeObserver:", self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sessionCompleted:self withCompletionHandler:v4];

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
    [v12 releaseTransaction];
  }
}

- (void)obliterate
{
  id v3 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543874;
    int v20 = v4;
    __int16 v21 = 2112;
    int v22 = clientBundleID;
    __int16 v23 = 2112;
    __int128 v24 = identifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Obliterating session: <%@>.<%@>",  buf,  0x20u);
  }

  self->_obliterated = 1;
  clientProxy = self->_clientProxy;
  self->_clientProxy = 0LL;

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v8 = self->_outstandingTaskIDs;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTasks,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v11),  (void)v14));
        [v12 cancel];

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v9);
  }

  -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0LL);
  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection"));
  [v13 removePendingWakeForClient:self->_clientBundleID sessionIdentifier:self->_identifier];
}

- (id)tasksArchivePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_sessionDirectory,  "URLByAppendingPathComponent:",  @"tasks.plist"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);

  return v3;
}

- (void)storeTaskInfoUpdates:(BOOL)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CDB0;
  block[3] = &unk_100078FA0;
  BOOL v8 = a3;
  *(CFAbsoluteTime *)&void block[5] = Current;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)queueUpdatesForTask:(id)a3 updateType:(unint64_t)a4 highPriority:(BOOL)a5
{
  id v8 = a3;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002CC5C;
  v11[3] = &unk_100078FC8;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v11);
}

- (void)archiveTimerFired
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CC44;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (id)descriptionForTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v5));

  if (v6) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Task <?>.<%lu>", a3));
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)descriptionForRequest:(id)a3
{
  id v3 = a3;
  [v3 _timeWindowDelay];
  if (v4 == 0.0 && ([v3 _timeWindowDuration], v5 == 0.0))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ [allowsCellularAccess: %d]",  v3,  [v3 allowsCellularAccess]));
  }

  else
  {
    [v3 _timeWindowDelay];
    uint64_t v7 = v6;
    [v3 _timeWindowDuration];
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ [delay: %f, duration: %f, allowsCellularAccess: %d]",  v3,  v7,  v8,  [v3 allowsCellularAccess]));
  }

  id v10 = (void *)v9;

  return v10;
}

- (id)descriptionForTCPConnectionWaitingReason:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  else {
    double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown (%llu)",  a3));
  }
  return v4;
}

- (id)requestWithAdjustedWindowForTaskInfo:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentRequest]);
  id v6 = [v5 mutableCopy];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 originalRequest]);
  [v7 _timeWindowDuration];
  double v9 = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 originalRequest]);
  [v10 _timeWindowDelay];
  double v12 = v11;

  unsigned int v13 = [v4 isDiscretionary];
  if (v9 == 0.0) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 == 1)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession configuration](self->_discretionaryPrioritySession, "configuration"));
    [v15 timeoutIntervalForResource];
    -[NDBackgroundSession defaultWindowDurationForResourceTimeout:](self, "defaultWindowDurationForResourceTimeout:");
    double v9 = v16;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v18 = v17;
  [v4 creationTime];
  double v20 = v18 - v19;
  if (v18 - v19 < 0.0)
  {
    double v20 = 0.0;
    [v4 setCreationTime:v18];
  }

  double v21 = v12 - v20;
  double v22 = -0.0;
  if (v12 - v20 < 0.0) {
    double v22 = v12 - v20;
  }
  double v23 = v9 + v22;
  if (v9 + v22 <= 0.0)
  {
    else {
      double v23 = 0.0;
    }
  }

  double v24 = fmax(v21, 0.0);
  v25 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v4 _loggableDescription]);
    int v29 = 138544386;
    __int16 v30 = v26;
    __int16 v31 = 2114;
    __int16 v32 = v27;
    __int16 v33 = 2048;
    double v34 = v20;
    __int16 v35 = 2048;
    double v36 = v24;
    __int16 v37 = 2048;
    double v38 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ %f seconds past start time, new delay: %f, new window: %f",  (uint8_t *)&v29,  0x34u);
  }

  [v6 _setTimeWindowDuration:v23];
  [v6 _setTimeWindowDelay:v24];

  return v6;
}

- (void)updateTaskInfoBasedOnCurrentDiscretionaryStatus:(id)a3
{
  id v4 = a3;
  if (([v4 isDiscretionary] & 1) != 0
    || [v4 mayBeDemotedToDiscretionary])
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentRequest]);
    BOOL v6 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v5,  v4);

    uint64_t v7 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 _loggableDescription]);
      int v10 = 138544130;
      double v11 = v8;
      __int16 v12 = 2114;
      unsigned int v13 = v9;
      __int16 v14 = 1024;
      unsigned int v15 = [v4 isDiscretionary];
      __int16 v16 = 1024;
      BOOL v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ potentially discretionary, re-scheduling, was discretionary: %d, is now discretionary: %d",  (uint8_t *)&v10,  0x22u);
    }

    [v4 setDiscretionary:v6];
    if (([v4 basePrioritySetExplicitly] & 1) == 0) {
      objc_msgSend( v4,  "setBasePriority:",  -[NDBackgroundSession priorityForDiscretionaryStatus:](self, "priorityForDiscretionaryStatus:", v6));
    }
  }
}

- (id)adjustDiscretionaryStatusForTaskInfo:(id)a3
{
  id v4 = a3;
  -[NDBackgroundSession updateTaskInfoBasedOnCurrentDiscretionaryStatus:]( self,  "updateTaskInfoBasedOnCurrentDiscretionaryStatus:",  v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession sessionForDiscretionaryStatus:]( self,  "sessionForDiscretionaryStatus:",  [v4 isDiscretionary]));

  return v5;
}

- (id)sanitizeTaskProperties:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"effectiveConfig"]);
  uint64_t v7 = v6;
  if (v6)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _sourceApplicationBundleIdentifier]);
    if (v8)
    {
      unsigned __int8 v9 = sub_100003B08(v5, @"com.apple.private.nsurlsession.impersonate");

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", 0);
        int v10 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v46 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          id v59 = v46;
          __int16 v60 = 2112;
          uint64_t v61 = @"com.apple.private.nsurlsession.impersonate";
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement",  buf,  0x16u);
        }
      }
    }

    double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 _sourceApplicationSecondaryIdentifier]);
    if (v11)
    {
      unsigned __int8 v12 = sub_100003B08(v5, @"com.apple.private.nsurlsession.impersonate");

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", 0);
        unsigned int v13 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          id v59 = v47;
          __int16 v60 = 2112;
          uint64_t v61 = @"com.apple.private.nsurlsession.impersonate";
          _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _sourceApplicationSecondaryIdentifier but is missing the %@ entitlement",  buf,  0x16u);
        }
      }
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v7 _sourceApplicationAuditTokenData]);
    if (v14)
    {
      unsigned __int8 v15 = sub_100003B08(v5, @"com.apple.private.nsurlsession.impersonate");

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v7, "set_sourceApplicationAuditTokenData:", 0);
        __int16 v16 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          id v59 = v48;
          __int16 v60 = 2112;
          uint64_t v61 = @"com.apple.private.nsurlsession.impersonate";
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _sourceApplicationAuditTokenData but is missing the %@ entitlement",  buf,  0x16u);
        }
      }
    }

    objc_msgSend(v7, "set_attributedBundleIdentifier:", 0);
    if ([v7 _respectsAllowsCellularAccessForDiscretionaryTasks]
      && (sub_100003B08(v5, @"com.apple.private.nsurlsession.allow-discretionary-cellular") & 1) == 0)
    {
      objc_msgSend(v7, "set_respectsAllowsCellularAccessForDiscretionaryTasks:", 0);
      BOOL v17 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543618;
        id v59 = v51;
        __int16 v60 = 2112;
        uint64_t v61 = @"com.apple.private.nsurlsession.allow-discretionary-cellular";
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _respectsAllowsCellularAccessForDiscretionaryTasks but is missing t he %@ entitlement",  buf,  0x16u);
      }
    }

    if ([v7 _allowsPowerNapScheduling]
      && (sub_100003B08(v5, @"com.apple.private.dark-wake-network-reachability") & 1) == 0)
    {
      objc_msgSend(v7, "set_allowsPowerNapScheduling:", 0);
      double v18 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543618;
        id v59 = v52;
        __int16 v60 = 2112;
        uint64_t v61 = @"com.apple.private.dark-wake-network-reachability";
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _allowsPowerNapScheduling but is missing the %@ entitlement",  buf,  0x16u);
      }
    }

    double v19 = (void *)objc_claimAutoreleasedReturnValue([v7 _connectionPoolName]);
    if (v19)
    {
      unsigned __int8 v20 = sub_100003B08(v5, @"com.apple.private.nsurlsession-allow-override-connection-pool");

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v7, "set_connectionPoolName:", 0);
        double v21 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v49 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543618;
          id v59 = v49;
          __int16 v60 = 2112;
          uint64_t v61 = @"com.apple.private.nsurlsession-allow-override-connection-pool";
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _connectionPoolName but is missing the %@ entitlement",  buf,  0x16u);
        }
      }
    }

    double v22 = (void *)objc_claimAutoreleasedReturnValue([v7 _directoryForDownloadedFiles]);
    if (v22)
    {
      double v23 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
      if ([v23 isPrivileged])
      {
      }

      else
      {
        double v24 = (void *)objc_claimAutoreleasedReturnValue([v7 _directoryForDownloadedFiles]);
        id v25 = [v5 processIdentifier];
        if (v5)
        {
          [v5 auditToken];
        }

        else
        {
          __int128 v56 = 0u;
          __int128 v57 = 0u;
        }

        unsigned __int8 v26 = [v24 _isSafeDirectoryForDownloads:v25 withToken:&v56];

        if ((v26 & 1) == 0)
        {
          __int128 v27 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 _directoryForDownloadedFiles]);
            *(_DWORD *)buf = 138543618;
            id v59 = v54;
            __int16 v60 = 2112;
            uint64_t v61 = v55;
            _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _directoryForDownloadedFiles but does not have access to directory %@",  buf,  0x16u);
          }

          objc_msgSend(v7, "set_directoryForDownloadedFiles:", 0);
        }
      }
    }

    if (objc_msgSend(v7, "_duetPreauthorized", v56, v57)
      && (sub_100003B08(v5, @"com.apple.private.nsurlsession.allow-duet-preauthorization") & 1) == 0)
    {
      objc_msgSend(v7, "set_duetPreauthorized:", 0);
      __int128 v28 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543618;
        id v59 = v53;
        __int16 v60 = 2112;
        uint64_t v61 = @"com.apple.private.nsurlsession.allow-duet-preauthorization";
        _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _duetPreauthorized but is missing the %@ entitlement",  buf,  0x16u);
      }
    }

    int v29 = (void *)objc_claimAutoreleasedReturnValue([v7 _maximumWatchCellularTransferSize]);
    if (v29)
    {
      unsigned __int8 v30 = sub_100003B08(v5, @"com.apple.private.nsurlsession.set-max-watch-cell-transfer-size");

      if ((v30 & 1) == 0)
      {
        objc_msgSend(v7, "set_maximumWatchCellularTransferSize:", 0);
        __int16 v31 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543362;
          id v59 = v50;
          _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _maximumWatchCellularTransferSize but is missing the necessary entitlement",  buf,  0xCu);
        }
      }
    }

    if ((sub_100003B08(v5, @"get-task-allow") & 1) != 0
      || (sub_100003B08(v5, @"com.apple.security.get-task-allow") & 1) != 0
      || os_variant_allows_internal_security_policies("com.apple.CFNetwork"))
    {
      id v32 = [v5 processIdentifier];
    }

    else
    {
      id v32 = 0LL;
    }

    objc_msgSend(v7, "set_pidForHAR:", v32);
  }

  __int16 v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pathToDownloadTaskFile"]);
  if (v33)
  {
    double v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    unsigned __int8 v35 = sub_10003C7E0(v34, v33);

    if ((v35 & 1) == 0)
    {
      double v36 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        int v44 = *__error();
        *(_DWORD *)buf = 138543874;
        id v59 = v43;
        __int16 v60 = 2112;
        uint64_t v61 = v33;
        __int16 v62 = 1024;
        int v63 = v44;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _pathToDownloadTaskFile but is not allowed to create %@: %{errno}d",  buf,  0x1Cu);
      }

      id v37 = [v4 mutableCopy];
      [v37 setObject:0 forKeyedSubscript:@"pathToDownloadTaskFile"];

      id v4 = v37;
    }
  }

  double v38 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sourceApplicationBundleIdentifierForMobileAsset"]);
  if (v38
    && (unsigned __int8 v39 = sub_100003B08(v5, @"com.apple.private.nsurlsession.impersonate"),
        v38,
        (v39 & 1) == 0))
  {
    unsigned int v41 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      id v45 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543618;
      id v59 = v45;
      __int16 v60 = 2112;
      uint64_t v61 = @"com.apple.private.nsurlsession.impersonate";
      _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client tried to set _sourceApplicationBundleIdentifier but is missing the %@ entitlement",  buf,  0x16u);
    }

    id v40 = [v4 mutableCopy];
    [v40 setObject:0 forKeyedSubscript:@"sourceApplicationBundleIdentifierForMobileAsset"];
  }

  else
  {
    id v40 = v4;
  }

  return v40;
}

- (void)configureAdditionalPropertiesOnTask:(id)a3 taskInfo:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 additionalProperties]);

  if (v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 additionalProperties]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"effectiveConfig"]);
    if (v9)
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession configurationWithClientConfiguration:discretionary:]( self,  "configurationWithClientConfiguration:discretionary:",  v9,  [v6 isDiscretionary]));
      id v11 = [v8 mutableCopy];
      [v11 setObject:v10 forKeyedSubscript:@"effectiveConfig"];

      double v8 = v11;
    }

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 additionalProperties]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"TimeoutIntervalForResource"]);

    if (v13)
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v16 currentRequest]);
      BOOL v15 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v14,  v6);

      -[NDBackgroundSession setupDASPropertiesOnTask:taskInfo:discretionaryStatus:]( self,  "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:",  v16,  v6,  v15);
    }

    sub_10003C910(v16, v8);
  }
}

- (void)configureTask:(id)a3 withTaskInfo:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_msgSend(v14, "setTaskIdentifier:", objc_msgSend(v6, "identifier"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 taskDescription]);
  [v14 setTaskDescription:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 earliestBeginDate]);
  [v14 setEarliestBeginDate:v8];

  objc_msgSend(v14, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v6, "countOfBytesClientExpectsToSend"));
  objc_msgSend(v14, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v6, "countOfBytesClientExpectsToReceive"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  objc_msgSend(v14, "set_uniqueIdentifier:", v9);

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 storagePartitionIdentifier]);
  objc_msgSend(v14, "set_storagePartitionIdentifier:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 pathToDownloadTaskFile]);
  objc_msgSend(v14, "set_pathToDownloadTaskFile:", v11);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 taskMetrics]);
  if (v12)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 taskMetrics]);
    objc_msgSend(v14, "set_metrics:", v13);

    [v6 setTaskMetrics:0];
  }

  -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:]( self,  "configureAdditionalPropertiesOnTask:taskInfo:",  v14,  v6);
}

- (void)ensureSessionDownloadDirectoryExists
{
  if (self->_downloadDirectory)
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
    unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        identifier = self->_identifier;
        clientBundleID = self->_clientBundleID;
        int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
        int v11 = 138544130;
        unsigned __int8 v12 = v7;
        __int16 v13 = 2112;
        id v14 = clientBundleID;
        __int16 v15 = 2112;
        id v16 = identifier;
        __int16 v17 = 2112;
        double v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Session <%@>.<%@> download path %@ did not exist, recreating.",  (uint8_t *)&v11,  0x2Au);
      }

      +[NDFileUtilities createDirectoryAtURL:]( &OBJC_CLASS___NDFileUtilities,  "createDirectoryAtURL:",  self->_downloadDirectory);
    }
  }

- (id)createNewTaskFromInfo:(id)a3
{
  id v4 = a3;
  -[NDBackgroundSession removeDownloadFileForTaskInfo:](self, "removeDownloadFileForTaskInfo:", v4);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession adjustDiscretionaryStatusForTaskInfo:]( self,  "adjustDiscretionaryStatusForTaskInfo:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession requestWithAdjustedWindowForTaskInfo:]( self,  "requestWithAdjustedWindowForTaskInfo:",  v4));
  if (!v6)
  {
    id v14 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 _loggableDescription]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 currentRequest]);
      int v34 = 138543874;
      unsigned __int8 v35 = v15;
      __int16 v36 = 2114;
      id v37 = v16;
      __int16 v38 = 2112;
      id v39 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ couldn't create new task becuase adjusted request is nil, taskInfo.currentRequest = %@",  (uint8_t *)&v34,  0x20u);
    }

    id v8 = 0LL;
    goto LABEL_18;
  }

  if ([v4 taskKind])
  {
    if ([v4 taskKind] == (id)1)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 fileURL]);
      id v8 = (id)objc_claimAutoreleasedReturnValue([v5 uploadTaskWithRequest:v6 fromFile:v7]);

      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 resumableUploadData]);
      if (v9)
      {
        Class Class = objc_getClass("__NSCFResumableUploadState");
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 resumableUploadData]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 originalRequest]);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class rusWithResumeData:originalRequest:]( Class,  "rusWithResumeData:originalRequest:",  v11,  v12));

        if (v13) {
          [v8 setResumableUploadState:v13];
        }
      }
    }

    else
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v5 dataTaskWithRequest:v6]);
    }

    goto LABEL_18;
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
  if ([v18 isPrivileged])
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadFileURL]);
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);
  }

  else
  {
    unsigned __int8 v20 = 0LL;
  }

  -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v5 _downloadTaskWithRequest:v6 downloadFilePath:v20]);
  id v8 = v21;
  if (v21)
  {
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 downloadFile]);
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);

    if (v23)
    {
      double v24 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadFile]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v25));
      [v4 setDownloadFileURL:v26];

LABEL_18:
      objc_msgSend(v8, "set_suspensionThreshhold:", 0x80000);
      id v8 = v8;
      __int128 v27 = v8;
      goto LABEL_19;
    }
  }

  int v29 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v31 = (id)objc_claimAutoreleasedReturnValue([v4 _loggableDescription]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadFile]);
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 path]);
    int v34 = 138544130;
    unsigned __int8 v35 = v30;
    __int16 v36 = 2114;
    id v37 = v31;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 2112;
    unsigned int v41 = v33;
    _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ couldn't create new task. task: %@, path: %@",  (uint8_t *)&v34,  0x2Au);
  }

  __int128 v27 = 0LL;
LABEL_19:

  return v27;
}

- (id)restoreInProgressTask:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession adjustDiscretionaryStatusForTaskInfo:]( self,  "adjustDiscretionaryStatusForTaskInfo:",  v5));
  if ([v5 taskKind]) {
    goto LABEL_29;
  }
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  if (!v12) {
    goto LABEL_29;
  }
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 downloadFileURL]);

  if (!v13) {
    goto LABEL_29;
  }
  -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
  id v14 = objc_alloc(objc_getClass("__NSCFLocalDownloadTask"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultTaskGroup]);
  id v16 = [v14 initWithBackgroundTaskInfo:v5 taskGroup:v15];

  -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:]( self,  "configureAdditionalPropertiesOnTask:taskInfo:",  v16,  v5);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession requestWithAdjustedWindowForTaskInfo:]( self,  "requestWithAdjustedWindowForTaskInfo:",  v5));
  [v16 updateCurrentRequest:v17];

  double v18 = (void *)objc_claimAutoreleasedReturnValue([v5 pathToDownloadTaskFile]);
  if (v18
    || (double v19 = (void *)objc_claimAutoreleasedReturnValue([v5 additionalProperties]),
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"pathToDownloadTaskFile"]),
        v19,
        v18))
  {
    int v20 = 0;
    double v21 = v18;
  }

  else
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 downloadFileURL]);
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    double v18 = 0LL;
    int v20 = 1;
  }

  double v22 = (void *)objc_claimAutoreleasedReturnValue([v16 createResumeInformation:v21]);
  if (v20)
  {
  }

  if (v22)
  {
    double v23 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:forKey:](v23, "encodeObject:forKey:", v22, @"NSKeyedArchiveRootObjectKey");
    double v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v23, "encodedData"));
    int v10 = v24 ? (void *)objc_claimAutoreleasedReturnValue([v6 downloadTaskWithResumeData:v24]) : 0;
  }

  else
  {
    double v23 = (NSKeyedArchiver *)(id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v29 = (void *)objc_claimAutoreleasedReturnValue([v5 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      id v31 = v28;
      __int16 v32 = 2114;
      __int16 v33 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ could not create resume data. The server might not support resumable downloads . Will retry full download",  buf,  0x16u);
    }

    int v10 = 0LL;
  }

  if (v10)
  {
    id v25 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      id v31 = v26;
      __int16 v32 = 2114;
      __int16 v33 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ download created from resume data",  buf,  0x16u);
    }
  }

  else
  {
LABEL_29:
    if (![v5 taskKind])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 additionalProperties]);
      id v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"pathToDownloadTaskFile"]);
      unsigned __int8 v9 = (const char *)[v8 UTF8String];

      if (v9) {
        unlink(v9);
      }
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession createNewTaskFromInfo:](self, "createNewTaskFromInfo:", v5));
  }

  return v10;
}

- (id)restoreCompletedTask:(id)a3
{
  id v4 = a3;
  if ([v4 taskKind])
  {
    if ([v4 taskKind] == (id)1) {
      id v5 = "__NSCFLocalUploadTask";
    }
    else {
      id v5 = "__NSCFLocalDataTask";
    }
  }

  else
  {
    id v5 = "__NSCFLocalDownloadTask";
  }

  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession sessionForDiscretionaryStatus:]( self,  "sessionForDiscretionaryStatus:",  [v4 isDiscretionary]));
  id v6 = objc_alloc(objc_getClass(v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v40 defaultTaskGroup]);
  id v8 = [v6 initWithBackgroundTaskInfo:v4 taskGroup:v7];

  id v39 = v8;
  -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:]( self,  "configureAdditionalPropertiesOnTask:taskInfo:",  v8,  v4);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 pathToDownloadTaskFile]);
  if (v9
    || (int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 additionalProperties]),
        unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"pathToDownloadTaskFile"]),
        v10,
        v9))
  {
    id v11 = v9;
    id v37 = v11;
  }

  else
  {
    int v34 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadFileURL]);
    id v11 = (id)objc_claimAutoreleasedReturnValue([v34 path]);

    id v37 = 0LL;
    __int16 v38 = 0LL;
    if (!v11) {
      goto LABEL_18;
    }
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v13 = [v12 fileExistsAtPath:v11];

  if (v13)
  {
    id v14 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v4 _loggableDescription]);
      *(_DWORD *)buf = 138543874;
      int v44 = v35;
      __int16 v45 = 2114;
      id v46 = v36;
      __int16 v47 = 2112;
      id v48 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "NDSession <%{public}@> %{public}@ is being restored as completed with download file still at %@",  buf,  0x20u);
    }

    __int16 v15 = objc_alloc(&OBJC_CLASS___PendingCallback);
    id v16 = [v4 identifier];
    v42[0] = v4;
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v39 response]);
    double v18 = v17;
    if (!v17) {
      double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v42[1] = v18;
    double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL));
    int v20 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v15,  "initWithCallbackType:taskIdentifier:args:",  1LL,  v16,  v19);

    if (!v17) {
    -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->_callbackQueue,  "addPendingCallback:wakeRequirement:",  v20,  0LL);
    }
  }

  __int16 v38 = v11;
LABEL_18:
  double v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  double v22 = (void *)objc_claimAutoreleasedReturnValue([v4 _backgroundTrailers]);
  BOOL v23 = v22 == 0LL;

  if (!v23)
  {
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v4 _backgroundTrailers]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v24, @"trailers");
  }

  id v25 = objc_alloc(&OBJC_CLASS___PendingCallback);
  id v26 = [v4 identifier];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);
  __int128 v28 = v27;
  if (!v27) {
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v41[0] = v28;
  int v29 = (void *)objc_claimAutoreleasedReturnValue([v4 taskMetrics]);
  unsigned __int8 v30 = v29;
  if (!v29) {
    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v41[1] = v30;
  v41[2] = v21;
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
  __int16 v32 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v25,  "initWithCallbackType:taskIdentifier:args:",  0LL,  v26,  v31);

  if (!v29) {
  if (!v27)
  }

  -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->_callbackQueue,  "addPendingCallback:wakeRequirement:",  v32,  0LL);
  return v39;
}

- (id)restoreTask:(id)a3 isOutstanding:(BOOL *)a4
{
  id v6 = a3;
  *a4 = 1;
  if ([v6 state] == (id)2)
  {
    [v6 setState:3];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRequest]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URL]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError _web_errorWithDomain:code:URL:]( &OBJC_CLASS___NSURLError,  "_web_errorWithDomain:code:URL:",  NSURLErrorDomain,  -999LL,  v8));
    [v6 setError:v9];
  }

  if ([v6 state] == (id)3)
  {
    *a4 = 0;
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreCompletedTask:](self, "restoreCompletedTask:", v6));
  }

  else
  {
    if (![v6 hasStarted])
    {
      unsigned int v13 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        double v21 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
        *(_DWORD *)buf = 138543618;
        __int128 v27 = v20;
        __int16 v28 = 2114;
        int v29 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ not restoring, which had never been started",  buf,  0x16u);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
      unsigned int v15 = [v14 isEqualToString:@"com.apple.mobileassetd"];

      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([0 resourceTimeoutError]);
        workQueue = self->_workQueue;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10002CB34;
        v22[3] = &unk_100078FF0;
        v22[4] = self;
        id v23 = v6;
        id v24 = 0LL;
        id v25 = v16;
        id v18 = v16;
        dispatch_async((dispatch_queue_t)workQueue, v22);
      }

      goto LABEL_13;
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreInProgressTask:](self, "restoreInProgressTask:", v6));
  }

  id v11 = v10;
  if (!v10)
  {
LABEL_13:
    id v11 = 0LL;
    *a4 = 0;
    goto LABEL_14;
  }

  sub_100003998(v10, [v6 basePriority], self->_monitoredApplication);
  -[NDBackgroundSession configureTask:withTaskInfo:](self, "configureTask:withTaskInfo:", v11, v6);
  [v6 loadingPriority];
  objc_msgSend(v11, "set_loadingPriority:");
  objc_msgSend(v11, "set_bytesPerSecondLimit:", objc_msgSend(v6, "bytesPerSecondLimit"));
  objc_msgSend(v11, "set_expectedProgressTarget:", objc_msgSend(v6, "expectedProgressTarget"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 originalRequest]);
  [v11 setOriginalRequest:v12];

  [v6 creationTime];
  objc_msgSend(v11, "setStartTime:");
  objc_msgSend(v11, "set_TLSMinimumSupportedProtocolVersion:", objc_msgSend(v6, "_TLSMinimumSupportedProtocolVersion"));
  objc_msgSend(v11, "set_TLSMaximumSupportedProtocolVersion:", objc_msgSend(v6, "_TLSMaximumSupportedProtocolVersion"));
LABEL_14:

  return v11;
}

- (id)restoreTasksFromSqliteDB:(id)a3
{
  id v51 = a3;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543362;
    __int16 v62 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> restoreTasksFromSqliteDB",  buf,  0xCu);
  }

  tasksDB = self->tasksDB;
  if (tasksDB) {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NDTaskStorageDB _getAllTasksFromDBForSession:sessionUUID:]( tasksDB,  "_getAllTasksFromDBForSession:sessionUUID:",  self->_identifier,  self->_uuid));
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v52 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v8)
  {
    uint64_t v50 = 0LL;
    uint64_t v54 = *(void *)v58;
    *(void *)&__int128 v9 = 138543618LL;
    __int128 v49 = v9;
    do
    {
      int v10 = 0LL;
      uint64_t v55 = v50 + 1;
      v50 += (uint64_t)v8;
      do
      {
        if (*(void *)v58 != v54) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v10);
        if (v11)
        {
          unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v57 + 1) + 8 * (void)v10) downloadFileURL]);
          BOOL v13 = v12 == 0LL;

          if (!v13)
          {
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 downloadFileURL]);
            id v15 = (id)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
            __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
            unsigned __int8 v18 = [v16 hasPrefix:v17];

            if ((v18 & 1) == 0)
            {
              __int16 v28 = (os_log_s *)(id)qword_100083990;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                int v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
                clientBundleID = self->_clientBundleID;
                id v31 = (NSString *)(id)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_downloadDirectory, "path"));
                __int16 v32 = (NSString *)objc_claimAutoreleasedReturnValue([v14 path]);
                *(_DWORD *)buf = 138544130;
                __int16 v62 = v29;
                __int16 v63 = 2112;
                v64 = clientBundleID;
                __int16 v65 = 2112;
                unsigned __int8 v66 = v31;
                __int16 v67 = 2112;
                v68 = v32;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Download directory for bundle %@ has moved to %@, but saved download file path is %@. Need to fix download path",  buf,  0x2Au);
              }

              downloadDirectory = self->_downloadDirectory;
              int v34 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
              unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( downloadDirectory,  "URLByAppendingPathComponent:",  v34));
              [v11 setDownloadFileURL:v35];

              id v15 = (id)qword_100083990;
              if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
                id v37 = (void *)objc_claimAutoreleasedReturnValue([v11 downloadFileURL]);
                __int16 v38 = (NSString *)objc_claimAutoreleasedReturnValue([v37 path]);
                *(_DWORD *)buf = v49;
                __int16 v62 = v36;
                __int16 v63 = 2112;
                v64 = v38;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> New download path: %@",  buf,  0x16u);
              }

- (id)restoreTasksFromArchivedInfo:(id)a3
{
  id v4 = a3;
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  v14[3] = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002C370;
  v10[3] = &unk_100079018;
  v10[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = v5;
  BOOL v13 = v14;
  id v6 = v4;
  id v12 = v6;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v7 = v12;
  id v8 = v5;

  _Block_object_dispose(v14, 8);
  return v8;
}

- (id)restoreTasks:(BOOL *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (self->_hasSqliteSupport)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreTasksFromSqliteDB:](self, "restoreTasksFromSqliteDB:", v5));
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession tasksArchivePath](self, "tasksArchivePath"));
    id v8 = sub_100003BA0((uint64_t)&OBJC_CLASS___NSKeyedUnarchiver, v7);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreTasksFromArchivedInfo:](self, "restoreTasksFromArchivedInfo:", v9));
  }

  id v10 = -[NSMutableDictionary count](self->_identifiersToTaskInfo, "count");
  if (!v10) {
    -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0LL);
  }
  if (a3) {
    *a3 = v10 == 0LL;
  }
  if (v10)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v11 = self->_identifiersToTaskInfo;
    id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  14LL,  1LL,  (void)v16);
        }

        id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v12);
    }

    if ([v5 count]) {
      -[NDTaskStorageDB _deleteTaskEntriesWithIdentifiers:forSession:sessionUUID:]( self->tasksDB,  "_deleteTaskEntriesWithIdentifiers:forSession:sessionUUID:",  v5,  self->_identifier,  self->_uuid);
    }
  }

  if (-[NSMutableDictionary count](self->_identifiersToTaskInfo, "count", (void)v16)
    && !-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks")
    && self->_sendsLaunchEvents
    && !-[NDApplication canBeSuspended](self->_clientApplication, "canBeSuspended"))
  {
    -[NDBackgroundSession wakeUpClient:](self, "wakeUpClient:", 2LL);
  }

  return v6;
}

- (id)clientErrorForError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if (sub_1000038D0(v3))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      if (v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
        uint64_t v7 = (NSMutableDictionary *)[v6 mutableCopy];
      }

      else
      {
        uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }

      uint64_t v13 = sub_10000391C(v4);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (v11) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v11,  NSURLErrorBackgroundTaskCancelledReasonKey);
      }
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -999LL,  v7));
      goto LABEL_12;
    }

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSURLError);
    id v8 = v4;
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
    {
      uint64_t v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v4 domain]);
      id v10 = [v4 code];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  v7,  v10,  v11));
LABEL_12:
      id v8 = (void *)v12;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)statusMonitor:(id)a3 callbackForIdentifier:(unint64_t)a4 networkChanged:(BOOL)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C2A8;
  block[3] = &unk_100078FA0;
  block[4] = self;
  void block[5] = a4;
  BOOL v7 = a5;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (BOOL)retryTask:(id)a3 originalError:(id)a4 transactionMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession restoreInProgressTask:](self, "restoreInProgressTask:", v8));
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescription]);
    [v11 setTaskDescription:v12];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 earliestBeginDate]);
    [v11 setEarliestBeginDate:v13];

    objc_msgSend(v11, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v8, "countOfBytesClientExpectsToSend"));
    objc_msgSend(v11, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v8, "countOfBytesClientExpectsToReceive"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 originalRequest]);
    [v11 setOriginalRequest:v14];

    objc_msgSend(v11, "setTaskIdentifier:", objc_msgSend(v8, "identifier"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    objc_msgSend(v11, "set_uniqueIdentifier:", v15);

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v8 storagePartitionIdentifier]);
    objc_msgSend(v11, "set_storagePartitionIdentifier:", v16);

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 pathToDownloadTaskFile]);
    objc_msgSend(v11, "set_pathToDownloadTaskFile:", v17);

    [v11 setState:1];
    [v8 creationTime];
    objc_msgSend(v11, "setStartTime:");
    sub_100003998(v11, [v8 basePriority], self->_monitoredApplication);
    [v8 loadingPriority];
    objc_msgSend(v11, "set_loadingPriority:");
    objc_msgSend(v11, "set_bytesPerSecondLimit:", objc_msgSend(v8, "bytesPerSecondLimit"));
    objc_msgSend(v11, "set_expectedProgressTarget:", objc_msgSend(v8, "expectedProgressTarget"));
    objc_msgSend( v11,  "set_TLSMinimumSupportedProtocolVersion:",  objc_msgSend(v8, "_TLSMinimumSupportedProtocolVersion"));
    objc_msgSend( v11,  "set_TLSMaximumSupportedProtocolVersion:",  objc_msgSend(v8, "_TLSMaximumSupportedProtocolVersion"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 _extractor]);

    if (!v18)
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 _extractor]);
      objc_msgSend(v11, "set_extractor:", v19);
    }

    objc_msgSend(v11, "set_hasSZExtractor:", objc_msgSend(v8, "_hasSZExtractor"));
    objc_msgSend( v11,  "set_doesSZExtractorConsumeExtractedData:",  objc_msgSend(v8, "_doesSZExtractorConsumeExtractedData"));
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v8 taskMetrics]);
    objc_msgSend(v11, "set_metrics:", v20);

    [v8 setTaskMetrics:0];
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v8 additionalProperties]);

    if (v21) {
      -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:]( self,  "configureAdditionalPropertiesOnTask:taskInfo:",  v11,  v8);
    }
    -[NDBackgroundSession setupDASPropertiesOnTask:taskInfo:discretionaryStatus:]( self,  "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:",  v11,  v8,  [v8 isDiscretionary]);
    identifiersToTasks = self->_identifiersToTasks;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 identifier]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTasks, "setObject:forKeyedSubscript:", v11, v23);

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 identifier]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tasksToIdentifiers,  "setObject:forKeyedSubscript:",  v24,  v11);

    [v11 startResourceTimer];
    if ([v8 taskKind] == (id)2
      || [v8 taskKind] == (id)1
      && (id v26 = (void *)objc_claimAutoreleasedReturnValue([v8 fileURL]), v26, !v26))
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientErrorForError:](self, "clientErrorForError:", v9));
      -[NSXPCProxyCreating willRetryBackgroundDataTask:withError:transactionMetrics:]( self->_clientProxy,  "willRetryBackgroundDataTask:withError:transactionMetrics:",  [v8 identifier],  v25,  v10);
    }

    -[NDBackgroundSession requeueTask:skipResume:](self, "requeueTask:skipResume:", [v8 identifier], 1);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    if ([v27 isEqualToString:@"_nsurlsessiondErrorDomain"])
    {
      id v28 = [v9 code];

      if (v28 == (id)3)
      {
        int v29 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](&OBJC_CLASS___NDStatusMonitor, "sharedMonitor"));
        objc_msgSend( v29,  "performCallbackAfterNetworkChangedEvent:identifier:numberOfPreviousRetries:",  self,  objc_msgSend(v8, "identifier"),  objc_msgSend(v8, "lowThroughputTimerRetryCount"));

        objc_msgSend( v8,  "setLowThroughputTimerRetryCount:",  (char *)objc_msgSend(v8, "lowThroughputTimerRetryCount") + 1);
        goto LABEL_19;
      }
    }

    else
    {
    }

    unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    unsigned __int8 v31 = [v30 isEqualToString:@"_nsurlsessiondErrorDomain"];

    double v32 = 1.0;
    if ((v31 & 1) == 0)
    {
      __int16 v33 = (char *)objc_msgSend(v8, "retryCount", 1.0);
      [v8 setRetryCount:v33 + 1];
      double v32 = exp2((double)(unint64_t)v33);
    }

    double v34 = fmin(v32, 1800.0);
    unsigned __int8 v35 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v8 _loggableDescription]);
      int v40 = 138543874;
      unsigned int v41 = v36;
      __int16 v42 = 2114;
      uint64_t v43 = v37;
      __int16 v44 = 2048;
      uint64_t v45 = (uint64_t)v34;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ will retry after %lld seconds",  (uint8_t *)&v40,  0x20u);
    }

    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](&OBJC_CLASS___NDStatusMonitor, "sharedMonitor"));
    objc_msgSend( v38,  "performCallbackAfterNetworkChangedEvent:identifier:delay:",  self,  objc_msgSend(v8, "identifier"),  (uint64_t)v34);
  }

- (void)removeDownloadFileForTaskInfo:(id)a3
{
  id v7 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 pathToDownloadTaskFile]);
  if (v3
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 additionalProperties]),
        id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pathToDownloadTaskFile"]),
        v4,
        v3))
  {
    +[NDFileUtilities removeItemAtPath:](&OBJC_CLASS___NDFileUtilities, "removeItemAtPath:", v3);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadFileURL]);

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadFileURL]);
      +[NDFileUtilities removeItemAtURL:](&OBJC_CLASS___NDFileUtilities, "removeItemAtURL:", v6);
    }

    id v3 = 0LL;
  }
}

- (void)removeUploadFileForTaskInfo:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a3 fileURL]);
  +[NDFileUtilities removeItemAtURL:](&OBJC_CLASS___NDFileUtilities, "removeItemAtURL:");
}

- (BOOL)sessionHasOutstandingTasks
{
  id v3 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v5 = -[NSMutableArray count](self->_outstandingTaskIDs, "count");
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2048;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> has %lu outstanding tasks",  (uint8_t *)&v7,  0x16u);
  }

  return -[NSMutableArray count](self->_outstandingTaskIDs, "count") != 0LL;
}

- (BOOL)clientIsActive
{
  clientProxy = self->_clientProxy;
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v6 = (void *)v5;
    if (clientProxy) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    if (self->_xpcConn) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    if (self->_clientProxy) {
      int v11 = 89;
    }
    else {
      int v11 = 78;
    }
    int v13 = 138544642;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    __int128 v16 = clientBundleID;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2112;
    id v24 = identifier;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> client %@ is active result (%c), XPC(%c) proxy(%c) for %@",  (uint8_t *)&v13,  0x32u);
  }

  return clientProxy != 0LL;
}

- (void)handleCompletionOfTask:(id)a3 identifier:(unint64_t)a4 taskInfo:(id)a5 isRecoverable:(BOOL)a6 suppressWake:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v12 = a5;
  -[NDBackgroundSession cancelMonitorForTask:](self, "cancelMonitorForTask:", a4);
  sub_100035DF4( 3LL,  self->_clientBundleID,  self->_identifier,  self->_monitoredAppBundleID,  self->_secondaryID,  v13,  v12,  a6);
  -[NDBackgroundSession finalizeTaskCompletionWithSuppressedWake:]( self,  "finalizeTaskCompletionWithSuppressedWake:",  v7);
}

- (BOOL)finalizeTaskCompletionWithSuppressedWake:(BOOL)a3
{
  if (!-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks")
    && !-[NDBackgroundSession clientIsActive](self, "clientIsActive"))
  {
    if (!a3)
    {
      BOOL v5 = 1;
      -[NDBackgroundSession wakeUpClient:](self, "wakeUpClient:", 1LL);
      return v5;
    }

    if (!-[NDCallbackQueue count](self->_callbackQueue, "count")) {
      -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0LL);
    }
  }

  return 0;
}

- (void)cancelTasksRequiringClientConnectionAndResumeUnstartedTasks
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v3 = self->_outstandingTaskIDs;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v4)
  {
    uint64_t v6 = *(void *)v22;
    *(void *)&__int128 v5 = 138543618LL;
    __int128 v19 = v5;
    do
    {
      BOOL v7 = 0LL;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v7);
        __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTaskInfo,  "objectForKeyedSubscript:",  v8,  v19));
        if ([v9 shouldCancelOnDisconnect])
        {
          [v9 setResumedAndWaitingForEarliestBeginDate:0];
          id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTasks,  "objectForKeyedSubscript:",  v8));
          int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 error:NSURLErrorDomain code:-997]);
          objc_msgSend(v10, "cancel_with_error:", v11);
          goto LABEL_8;
        }

        if (([v9 hasStarted] & 1) == 0)
        {
          if (-[NSString isEqualToString:](self->_clientBundleID, "isEqualToString:", @"com.apple.mobileassetd"))
          {
            id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTasks,  "objectForKeyedSubscript:",  v8));
            id v12 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              int v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
              *(_DWORD *)buf = v19;
              id v26 = v20;
              __int16 v27 = 2114;
              id v28 = v17;
              _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ not resumed but client disconnected, terminating it with timeout",  buf,  0x16u);
            }

            int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resourceTimeoutError]);
            objc_msgSend(v10, "cancel_with_error:", v11);
LABEL_8:
          }

          else
          {
            id v13 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
              *(_DWORD *)buf = v19;
              id v26 = v15;
              __int16 v27 = 2114;
              id v28 = v16;
              _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ not resumed but client disconnected, resuming it implicitly",  buf,  0x16u);
            }

            id v14 = [v9 identifier];
            id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 additionalProperties]);
            -[NDBackgroundSession resumeTaskWithIdentifier:withProperties:]( self,  "resumeTaskWithIdentifier:withProperties:",  v14,  v10);
          }
        }

        BOOL v7 = (char *)v7 + 1;
      }

      while (v4 != v7);
      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
      id v4 = v18;
    }

    while (v18);
  }
}

- (void)clientDidDisconnect
{
  id v3 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int128 v5 = (void *)v4;
    if (self->_xpcConn) {
      int v6 = 89;
    }
    else {
      int v6 = 78;
    }
    if (self->_clientProxy) {
      int v7 = 89;
    }
    else {
      int v7 = 78;
    }
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    int v20 = 138544386;
    uint64_t v21 = v4;
    __int16 v22 = 2112;
    __int128 v23 = clientBundleID;
    __int16 v24 = 1024;
    int v25 = v6;
    __int16 v26 = 1024;
    int v27 = v7;
    __int16 v28 = 2112;
    int v29 = identifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> client %@ disconnected, XPC(%c) proxy(%c) for %@",  (uint8_t *)&v20,  0x2Cu);
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    self->_clientProxy = 0LL;

    self->_int clientPID = -1;
    -[NDBackgroundSession cancelTasksRequiringClientConnectionAndResumeUnstartedTasks]( self,  "cancelTasksRequiringClientConnectionAndResumeUnstartedTasks");
    if (!-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks")
      && !-[NDCallbackQueue count](self->_callbackQueue, "count"))
    {
      -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", 0LL);
    }
  }

  xpcConn = self->_xpcConn;
  self->_xpcConn = 0LL;

  connectedExtension = self->_connectedExtension;
  if (connectedExtension)
  {
    -[NDApplication removeObserver:](connectedExtension, "removeObserver:", self);
    id v13 = self->_connectedExtension;
    self->_connectedExtension = 0LL;
  }

  -[NDBackgroundSession setInvalidateReply:](self, "setInvalidateReply:", 0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_sessionDirectory,  "URLByAppendingPathComponent:",  @"options.plist"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NDSessionManager restoreOptionsFromArchivePath:]( &OBJC_CLASS___NDSessionManager,  "restoreOptionsFromArchivePath:",  v15));
  id v17 = [v16 mutableCopy];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v17 setObject:v18 forKeyedSubscript:@"NSURLSessionLastDisconnectDateKey"];

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v17,  1LL,  0LL));
  [v19 writeToFile:v15 atomically:1];
}

- (void)reconnectClient:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10002C1A8;
  v27[3] = &unk_1000797B8;
  v27[4] = self;
  id v8 = v6;
  id v28 = v8;
  id v9 = v7;
  id v29 = v9;
  id v10 = objc_retainBlock(v27);
  clientApplication = self->_clientApplication;
  identifier = self->_identifier;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
  unsigned int v14 = -[NDApplication isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:]( clientApplication,  "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:",  identifier,  v13);

  if (self->_hasBeenSignalledToDeliverPendingEvents) {
    char v15 = 0;
  }
  else {
    char v15 = v14;
  }
  __int128 v16 = (os_log_s *)(id)qword_100083990;
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) != 0)
  {
    if (v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v20 = self->_identifier;
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      unsigned __int8 v31 = v18;
      __int16 v32 = 2112;
      __int16 v33 = clientBundleID;
      __int16 v34 = 2112;
      unsigned __int8 v35 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Waiting for notification to deliver pending events for client session: <%@>.<%@>",  buf,  0x20u);
    }

    uint64_t v21 = objc_retainBlock(v10);
    id completeReconnectionBlock = self->_completeReconnectionBlock;
    self->_id completeReconnectionBlock = v21;
  }

  else
  {
    if (v17)
    {
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v25 = self->_identifier;
      __int16 v24 = self->_clientBundleID;
      BOOL hasBeenSignalledToDeliverPendingEvents = self->_hasBeenSignalledToDeliverPendingEvents;
      *(_DWORD *)buf = 138544386;
      unsigned __int8 v31 = v23;
      __int16 v32 = 2112;
      __int16 v33 = v24;
      __int16 v34 = 2112;
      unsigned __int8 v35 = v25;
      __int16 v36 = 1024;
      BOOL v37 = hasBeenSignalledToDeliverPendingEvents;
      __int16 v38 = 1024;
      unsigned int v39 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Delivering pending events immediately for client session: <%@>.<%@>. Signalled already: % d, isHandlingBackgroundSession: %d",  buf,  0x2Cu);
    }

    self->_BOOL hasBeenSignalledToDeliverPendingEvents = 0;
    ((void (*)(void *))v10[2])(v10);
  }
}

- (void)allowReconnect
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002BF00;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)fillInByteCountsForTaskInfo:(id)a3 withTaskID:(id)a4
{
  id v7 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTasks,  "objectForKeyedSubscript:",  a4));
  objc_msgSend(v7, "setCountOfBytesSent:", objc_msgSend(v6, "countOfBytesSent"));
  objc_msgSend(v7, "setCountOfBytesReceived:", objc_msgSend(v6, "countOfBytesReceived"));
  objc_msgSend(v7, "setCountOfBytesExpectedToSend:", objc_msgSend(v6, "countOfBytesExpectedToSend"));
  objc_msgSend(v7, "setCountOfBytesExpectedToReceive:", objc_msgSend(v6, "countOfBytesExpectedToReceive"));
}

- (void)fillInPropertiesForTaskInfo:(id)a3 withTaskID:(id)a4
{
  id v8 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTasks,  "objectForKeyedSubscript:",  a4));
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v8, "set_hasSZExtractor:", objc_msgSend(v6, "_hasSZExtractor"));
    objc_msgSend( v8,  "set_doesSZExtractorConsumeExtractedData:",  objc_msgSend(v7, "_doesSZExtractorConsumeExtractedData"));
  }
}

- (void)triggerPowerlogPeriodicUpdate
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = self->_outstandingTaskIDs;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTaskInfo,  "objectForKeyedSubscript:",  v7,  (void)v10));
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_identifiersToTasks,  "objectForKeyedSubscript:",  v7));
        sub_100035DF4( 6LL,  self->_clientBundleID,  self->_identifier,  self->_monitoredAppBundleID,  self->_secondaryID,  v9,  v8,  0);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v4);
  }
}

- (id)getTasksForReconnection
{
  id v3 = -[NSMutableDictionary copy](self->_identifiersToTaskInfo, "copy");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002BE88;
  v8[3] = &unk_100079040;
  v8[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  id v4 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543874;
    __int128 v10 = v5;
    __int16 v11 = 2112;
    __int128 v12 = identifier;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Session: %@ get tasks for reconnection: %@",  buf,  0x20u);
  }

  return v3;
}

- (id)getTLSSessionCachePrefix
{
  userInitiatedSession = self->_userInitiatedSession;
  if (userInitiatedSession || (userInitiatedSession = self->_discretionaryPrioritySession) != 0LL) {
    userInitiatedSession = (NSURLSession *)objc_claimAutoreleasedReturnValue( -[NSURLSession _tlsSessionCachePrefix]( userInitiatedSession,  "_tlsSessionCachePrefix"));
  }
  return userInitiatedSession;
}

- (int64_t)priorityForDiscretionaryStatus:(BOOL)a3
{
  if (a3) {
    return 600LL;
  }
  else {
    return 300LL;
  }
}

- (BOOL)currentDiscretionaryStatus:(id)a3 withOptionalTaskInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (NDApplication *)objc_claimAutoreleasedReturnValue([v6 _propertyForKey:@"_NSURLRequestIsDiscretionaryOverrideValue"]);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      unsigned int v10 = sub_100003B08(v9, @"com.apple.private.nsurlsession.set-discretionary-override-value");

      if (v10)
      {
        __int16 v11 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          if (v7) {
            __int16 v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
          }
          else {
            __int16 v13 = @"New task";
          }
          unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](self->_clientApplication, "bundleIdentifier"));
          int v40 = 138544130;
          else {
            int v36 = 78;
          }
          unsigned int v41 = v12;
          __int16 v42 = 2114;
          uint64_t v43 = v13;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v35;
          __int16 v46 = 1024;
          int v47 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for %@ is overriding discretionary status by request - forcing to %c",  (uint8_t *)&v40,  0x26u);
          if (v7) {
        }
          }

        LOBYTE(discretionary) = -[NDApplication BOOLValue](v8, "BOOLValue");
        goto LABEL_66;
      }
    }
  }

  if (!v7 || ![v7 discretionaryOverride])
  {
    id v8 = self->_clientApplication;
    if (self->_infersDiscretionary)
    {
      monitoredApplication = self->_monitoredApplication;
      if (monitoredApplication)
      {
        __int16 v22 = monitoredApplication;

        id v8 = v22;
      }
    }

    xpcConn = self->_xpcConn;
    if (xpcConn)
    {
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](xpcConn, "_xpcConnection"));
      if ((xpc_connection_is_extension() & 1) != 0)
      {
        int discretionary = self->_discretionary;

        if (!discretionary)
        {
          id v25 = (id)qword_100083990;
          if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
          {
LABEL_65:

            goto LABEL_66;
          }

          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          if (v7) {
            int v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
          }
          else {
            int v27 = @"Task <?>.<0>";
          }
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](self->_clientApplication, "bundleIdentifier"));
          int v40 = 138543874;
          unsigned int v41 = v26;
          __int16 v42 = 2114;
          uint64_t v43 = v27;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v34;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary because the conne cted client is an extension",  (uint8_t *)&v40,  0x20u);
          if (v7) {

          }
          goto LABEL_63;
        }
      }

      else
      {
      }
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
    unsigned int v29 = [v28 isInSyncBubble];

    if (v29)
    {
      id v25 = (id)qword_100083990;
      if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_64:
        LOBYTE(discretionary) = 0;
        goto LABEL_65;
      }

      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      if (v7) {
        unsigned __int8 v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
      }
      else {
        unsigned __int8 v30 = @"Task <?>.<0>";
      }
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](v8, "bundleIdentifier"));
      int v40 = 138543874;
      unsigned int v41 = v26;
      __int16 v42 = 2114;
      uint64_t v43 = v30;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v34;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary, since nsurlsessiond is running in EDU sync mode",  (uint8_t *)&v40,  0x20u);
      if (v7) {
    }
      }

    else
    {
      if (self->_discretionary
        || -[NDApplication hasForegroundBackgroundStates](v8, "hasForegroundBackgroundStates")
        && !-[NDApplication isForeground](v8, "isForeground")
        && !-[NDApplication hasBackgroundTaskCompletion](v8, "hasBackgroundTaskCompletion"))
      {
        id v25 = (id)qword_100083990;
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          if (v7) {
            __int16 v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
          }
          else {
            __int16 v32 = @"Task <?>.<0>";
          }
          BOOL v37 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](v8, "bundleIdentifier"));
          BOOL v38 = self->_discretionary;
          int v40 = 138544130;
          unsigned int v41 = v31;
          __int16 v42 = 2114;
          uint64_t v43 = v32;
          __int16 v44 = 2112;
          uint64_t v45 = (uint64_t)v37;
          __int16 v46 = 1024;
          int v47 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ current discretionary status for %@ is discretionary (opt-in: %d)",  (uint8_t *)&v40,  0x26u);
          if (v7) {
        }
          }

        LOBYTE(discretionary) = 1;
        goto LABEL_65;
      }

      id v25 = (id)qword_100083990;
      if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_64;
      }
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      if (v7) {
        __int16 v33 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
      }
      else {
        __int16 v33 = @"Task <?>.<0>";
      }
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDApplication bundleIdentifier](v8, "bundleIdentifier"));
      int v40 = 138543874;
      unsigned int v41 = v26;
      __int16 v42 = 2114;
      uint64_t v43 = v33;
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v34;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ current discretionary status for %@ is non-discretionary",  (uint8_t *)&v40,  0x20u);
      if (v7) {
    }
      }

- (void)cancelMonitorForTask:(unint64_t)a3
{
  identifiersToMonitors = self->_identifiersToMonitors;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v6));

  [v9 cancel];
  id v7 = self->_identifiersToMonitors;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v8);
}

- (void)handleEarliestBeginDateForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v11));

  if (([v12 resumedAndWaitingForEarliestBeginDate] & 1) == 0)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 earliestBeginDate]);

    id v14 = (os_log_s *)(id)qword_100083990;
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v12 _loggableDescription]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 earliestBeginDate]);
        *(_DWORD *)buf = 138543874;
        BOOL v37 = v16;
        __int16 v38 = 2114;
        unsigned int v39 = v17;
        __int16 v40 = 2112;
        unsigned int v41 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ should not begin before %@",  buf,  0x20u);
      }

      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v9 earliestBeginDate]);
      [v19 timeIntervalSinceNow];
      double v21 = v20;

      if (v21 <= 0.0)
      {
        id v28 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue([v12 _loggableDescription]);
          *(_DWORD *)buf = 138543618;
          BOOL v37 = v29;
          __int16 v38 = 2114;
          unsigned int v39 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ can begin immediately - begin date is in past",  buf,  0x16u);
        }

        v6[2](v6, 0LL);
      }

      else
      {
        [v12 setResumedAndWaitingForEarliestBeginDate:1];
        dispatch_time_t v22 = dispatch_time(0x8000000000000000LL, (uint64_t)(v21 * 1000000000.0));
        workQueue = self->_workQueue;
        dispatch_qos_class_t v24 = [v12 qos];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_10002BB8C;
        v31[3] = &unk_100079068;
        id v32 = v12;
        __int16 v33 = self;
        unint64_t v35 = a3;
        __int16 v34 = v6;
        dispatch_block_t v25 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, v24, 0, v31);
        dispatch_after(v22, (dispatch_queue_t)workQueue, v25);
      }
    }

    else
    {
      if (v15)
      {
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        int v27 = (void *)objc_claimAutoreleasedReturnValue([v12 _loggableDescription]);
        *(_DWORD *)buf = 138543618;
        BOOL v37 = v26;
        __int16 v38 = 2114;
        unsigned int v39 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ has not requested a begin delay",  buf,  0x16u);
      }

      v6[2](v6, 0LL);
    }
  }
}

- (void)handleWillBeginDelayedRequestForTaskWithIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v11));

  if (v9 && v12)
  {
    if (!self->_clientImplementsWillBeginDelayedRequest)
    {
      id v14 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v19;
        __int16 v46 = 2114;
        int v47 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ skipping delayed request callback - delegate not implemented",  buf,  0x16u);
      }

      goto LABEL_24;
    }

    unsigned int v13 = [v12 respondedToWillBeginDelayedRequestCallback];
    id v14 = (os_log_s *)(id)qword_100083990;
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v16;
        __int16 v46 = 2114;
        int v47 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ already replied to delayed request callback - not calling again",  buf,  0x16u);
      }

- (void)taskShouldResume:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  if (v7) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    __int128 v12 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v10 _loggableDescription]);
      *(_DWORD *)buf = 138544130;
      dispatch_block_t v25 = v18;
      __int16 v26 = 2114;
      int v27 = v19;
      __int16 v28 = 2112;
      uint64_t v29 = v7;
      __int16 v30 = 2112;
      unsigned __int8 v31 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ cannot resume because task: %@ or taskInfo: %@ is nil",  buf,  0x2Au);
    }
  }

  else
  {
    if ([v7 _hasSZExtractor])
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadFileURL]);

      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadFileURL]);
        +[NDFileUtilities removeStreamingZipModificationDate:]( &OBJC_CLASS___NDFileUtilities,  "removeStreamingZipModificationDate:",  v14);
      }
    }

    workQueue = self->_workQueue;
    dispatch_qos_class_t v16 = [v10 qos];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10002B17C;
    v20[3] = &unk_100079CA8;
    v20[4] = self;
    id v21 = v10;
    id v22 = v7;
    unint64_t v23 = a3;
    dispatch_block_t v17 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, v16, 0, v20);
    dispatch_async((dispatch_queue_t)workQueue, v17);
  }
}

- (void)taskShouldSuspend:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  BOOL v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    int v17 = 138543618;
    uint64_t v18 = v12;
    __int16 v19 = 2114;
    double v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ suspending",  (uint8_t *)&v17,  0x16u);
  }

  [v7 suspend];
  identifiersToMonitors = self->_identifiersToMonitors;
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  dispatch_qos_class_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToMonitors,  "objectForKeyedSubscript:",  v15));

  [v16 taskWillSuspend];
  if (([v10 resumedAndWaitingForEarliestBeginDate] & 1) == 0) {
    sub_100035DF4( 2LL,  self->_clientBundleID,  self->_identifier,  self->_monitoredAppBundleID,  self->_secondaryID,  v7,  v10,  0);
  }
  [v10 setResumedAndWaitingForEarliestBeginDate:0];
}

- (void)addOutstandingTaskWithIdentifier:(unint64_t)a3
{
  outstandingTaskIDs = self->_outstandingTaskIDs;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableArray addObject:](outstandingTaskIDs, "addObject:");
}

- (void)removeOutstandingTaskWithIdentifier:(unint64_t)a3
{
  outstandingTaskIDs = self->_outstandingTaskIDs;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableArray removeObject:](outstandingTaskIDs, "removeObject:");
}

- (void)requeueTask:(unint64_t)a3 skipResume:(BOOL)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B074;
  block[3] = &unk_100078FA0;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)requeueTask:(unint64_t)a3
{
}

- (id)makeTempUploadFile:(id)a3 withExtensionData:(id)a4
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = [v7 bytes];
  id v9 = [v7 length];
  if (v9 && !v8[(void)v9 - 1])
  {
    uint64_t v10 = sandbox_extension_consume(v8);
    unsigned __int8 v31 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      int v47 = v32;
      __int16 v48 = 2112;
      __int128 v49 = v6;
      __int16 v50 = 2048;
      uint64_t v51 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Consumed sandbox extension for file %@, extension = %lld",  buf,  0x20u);
    }

    if (v10 < 0)
    {
      __int16 v33 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543874;
        int v47 = v43;
        __int16 v48 = 2080;
        __int128 v49 = v8;
        __int16 v50 = 2112;
        uint64_t v51 = (uint64_t)v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Failed to consume sandbox extension %s for fileURL %@",  buf,  0x20u);
      }
    }
  }

  else
  {
    uint64_t v10 = -1LL;
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CFNetworkUpload_%@",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_uploadsDirectory, "URLByAppendingPathComponent:", v13));
  LODWORD(v12) = [v6 fileDescriptor];
  id v15 = v14;
  int v16 = *__error();
  if (v16 == 45 || v16 == 18)
  {
    int v17 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543362;
      int v47 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Falling back to copy",  buf,  0xCu);
    }

    id v19 = v15;
    int v20 = open((const char *)[v19 fileSystemRepresentation], 513, 384);
    if (v20 != -1)
    {
      int v21 = fcopyfile((int)[v6 fileDescriptor], v20, 0, 8u);
      close(v20);
      if (v21)
      {
        id v22 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          int v39 = *__error();
          *(_DWORD *)buf = 138543618;
          int v47 = v38;
          __int16 v48 = 1024;
          LODWORD(v49) = v39;
          _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Error copying file: %{errno}d",  buf,  0x12u);
        }

        id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        dispatch_qos_class_t v24 = 0LL;
        [v23 removeItemAtURL:v19 error:0];
        goto LABEL_39;
      }

- (id)inputStreamWithFileHandle:(id)a3 taskIdentifier:(unint64_t)a4
{
  id v6 = a3;
  CFReadStreamRef readStream = 0LL;
  CFSocketNativeHandle v7 = dup((int)[v6 fileDescriptor]);
  CFStreamCreatePairWithSocket(0LL, v7, &readStream, 0LL);
  CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543618;
    int v17 = v9;
    __int16 v18 = 1024;
    CFSocketNativeHandle v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Created stream with file descriptor: %d",  buf,  0x12u);
  }

  [v6 closeFile];
  CFReadStreamRef v10 = readStream;
  identifiersToStreams = self->_identifiersToStreams;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToStreams, "setObject:forKeyedSubscript:", v10, v12);

  CFReadStreamRef v13 = readStream;
  return v13;
}

- (BOOL)errorIfBlockedTracker:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSString UTF8String](self->_monitoredAppBundleID, "UTF8String");
  v17[1] = 0LL;
  v17[2] = 0LL;
  v17[0] = v8;
  int neTrackerTCCResult = self->_neTrackerTCCResult;
  int v18 = 0;
  int v19 = neTrackerTCCResult;
  char v20 = 0;
  id v10 = objc_claimAutoreleasedReturnValue([v7 host]);
  int v11 = ne_tracker_check_is_hostname_blocked([v10 UTF8String], v17);

  if (v11 == 1)
  {
    __int128 v12 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      id v22 = v15;
      __int16 v23 = 2114;
      dispatch_qos_class_t v24 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ is blocked due to tracker policy",  buf,  0x16u);
    }

    CFReadStreamRef v13 = (void *)objc_claimAutoreleasedReturnValue([v6 error:NSURLErrorDomain code:-1004]);
    objc_msgSend(v6, "cancel_with_error:", v13);
  }

  return v11 == 1;
}

- (id)getClientProxy
{
  return self->_clientProxy;
}

- (void)errorOccurredDuringFinishedCallbackDelivery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Encountered error %@ during task completion callback delivery",  (uint8_t *)&v8,  0x16u);
  }

  clientProxy = self->_clientProxy;
  self->_clientProxy = 0LL;

  if (!-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks")) {
    -[NDBackgroundSession wakeUpClient:](self, "wakeUpClient:", 1LL);
  }
}

- (void)errorOccurredDuringAuthCallbackDelivery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  int v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    int v11 = 138543618;
    __int128 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Encountered error %@ error delivering auth challenge to client, performing default handling",  (uint8_t *)&v11,  0x16u);
  }

  clientProxy = self->_clientProxy;
  self->_clientProxy = 0LL;

  v7[2](v7, 1LL, 0LL);
}

- (void)clientAcknowledgedTerminalCallbackForTask:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
LABEL_4:
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v10,  13LL,  0LL);

    -[NDCallbackQueue drainCallbacksForTaskIdentifier:](self->_callbackQueue, "drainCallbacksForTaskIdentifier:", a3);
    if (!-[NDCallbackQueue count](self->_callbackQueue, "count")
      && !-[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks"))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession invalidateReply](self, "invalidateReply"));

      if (v11)
      {
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession invalidateReply](self, "invalidateReply"));
        -[NDBackgroundSession setInvalidateReply:](self, "setInvalidateReply:", 0LL);
        -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", v12);
      }
    }

    goto LABEL_11;
  }

  if ([v7 state] == (id)3)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v7);
    int v8 = self->_identifiersToTasks;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    goto LABEL_4;
  }

  __int16 v13 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    int v16 = 138543618;
    int v17 = v14;
    __int16 v18 = 2114;
    int v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ skipping acknowledgement teardown since it's not actually complete",  (uint8_t *)&v16,  0x16u);
  }

LABEL_11:
}

- (void)wakeUpClient:(int64_t)a3
{
  if (a3)
  {
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
      {
        if (self->_obliterated)
        {
          uint64_t v5 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            clientBundleID = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            int v39 = v6;
            __int16 v40 = 2112;
            int v41 = clientBundleID;
            _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Not waking up client %@ since session is obliterated",  buf,  0x16u);
          }
        }

        else if (-[NDBackgroundSession clientIsActive](self, "clientIsActive"))
        {
          uint64_t v5 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            int v16 = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            int v39 = v15;
            __int16 v40 = 2112;
            int v41 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Not waking up client %@ since it's already connected",  buf,  0x16u);
          }
        }

        else if (-[NDApplication backgroundUpdatesEnabled](self->_clientApplication, "backgroundUpdatesEnabled"))
        {
          int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
          uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);

          __int16 v18 = objc_alloc(&OBJC_CLASS___PendingCallback);
          BOOL v37 = v5;
          int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v37,  1LL));
          char v20 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v18,  "initWithCallbackType:taskIdentifier:args:",  3LL,  0LL,  v19);

          int v21 = objc_alloc(&OBJC_CLASS___PendingCallback);
          id v36 = v5;
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v36,  1LL));
          __int16 v23 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v21,  "initWithCallbackType:taskIdentifier:args:",  4LL,  0LL,  v22);

          -[NDCallbackQueue addPendingCallbackToFront:](self->_callbackQueue, "addPendingCallbackToFront:", v20);
          -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->_callbackQueue,  "addPendingCallback:wakeRequirement:",  v23,  0LL);
          dispatch_qos_class_t v24 = self->_clientBundleID;
          unsigned __int8 v25 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            *(_DWORD *)buf = 138543618;
            int v39 = v26;
            __int16 v40 = 2112;
            int v41 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Waking up the client app: %@",  buf,  0x16u);
          }

          clientApplication = self->_clientApplication;
          identifier = self->_identifier;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          unsigned __int8 v30 = -[NDApplication wakeForSessionIdentifier:withSessionUUID:wakeRequirement:]( clientApplication,  "wakeForSessionIdentifier:withSessionUUID:wakeRequirement:",  identifier,  v29,  a3);

          if ((v30 & 1) == 0)
          {
            unsigned __int8 v31 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              *(_DWORD *)buf = 138543618;
              int v39 = v34;
              __int16 v40 = 2112;
              int v41 = v24;
              _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Failed to wake app: %@",  buf,  0x16u);
            }
          }
        }

        else
        {
          uint64_t v5 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            __int16 v33 = self->_clientBundleID;
            *(_DWORD *)buf = 138543618;
            int v39 = v32;
            __int16 v40 = 2112;
            int v41 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Not waking up client %@ since background updates are not enabled",  buf,  0x16u);
          }
        }
      }

      else
      {
        if (-[NDApplication maySupportWakesLater](self->_clientApplication, "maySupportWakesLater"))
        {
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NDUserEventAgentConnection sharedUserEventAgentConnection]( &OBJC_CLASS___NDUserEventAgentConnection,  "sharedUserEventAgentConnection"));
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_10002B068;
          v35[3] = &unk_100079C80;
          v35[4] = self;
          v35[5] = a3;
          [v12 performWake:v35 uponNotification:self->_clientBundleID sessionIdentifier:self->_identifier];
        }

        uint64_t v5 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          id v14 = self->_clientBundleID;
          *(_DWORD *)buf = 138543618;
          int v39 = v13;
          __int16 v40 = 2112;
          int v41 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Not waking up client %@ since it doesn't support app wakes",  buf,  0x16u);
        }
      }
    }

    else
    {
      uint64_t v5 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        int v11 = self->_clientBundleID;
        *(_DWORD *)buf = 138543618;
        int v39 = v10;
        __int16 v40 = 2112;
        int v41 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Not waking up client %@ since sessionSendsLaunchEvents is NO",  buf,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v5 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v9 = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      int v39 = v8;
      __int16 v40 = 2112;
      int v41 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Not waking up client %@ since wake request is unnecessary",  buf,  0x16u);
    }
  }
}

- (void)setupDASPropertiesOnTask:(id)a3 taskInfo:(id)a4 discretionaryStatus:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  -[NDApplication currentRequestDelay](self->_clientApplication, "currentRequestDelay");
  double v11 = v10;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 _effectiveConfiguration]);
  unsigned __int8 v13 = [v12 _duetPreauthorized];

  if ((v13 & 1) != 0)
  {
    id v14 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v8 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      id v45 = v15;
      __int16 v46 = 2114;
      int v47 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ is duet preauthorized",  buf,  0x16u);
    }
  }

  else
  {
    id v14 = (os_log_s *)[v8 _copySocketStreamProperties];
    uint64_t v43 = kCFStreamPropertyConditionalConnectionProperties;
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v14, "objectForKeyedSubscript:"));
    int v41 = v17;
    if (v17) {
      __int16 v18 = (NSMutableDictionary *)objc_msgSend(v17, "mutableCopy", v17);
    }
    else {
      __int16 v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    int v19 = v18;
    char v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_legacySocketStreamProperties", v41));
    if (v20)
    {
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 _legacySocketStreamProperties]);
      id v22 = (NSMutableDictionary *)[v21 mutableCopy];
    }

    else
    {
      id v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }

    __int16 v23 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    dispatch_qos_class_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 _loggableDescription]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v24,  kConditionalConnectionActivityName);

    if ([v9 taskKind] == (id)1
      || [v9 taskKind] == (id)2
      && (unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v8 originalRequest]),
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 HTTPBodyStream]),
          v26,
          v25,
          v26))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kConditionalConnectionIsUpload);
    }

    objc_msgSend(v8, "set_DuetActivityProperties:", v23);
    if (v5 && v11 > 0.0)
    {
      int v27 = (void *)objc_claimAutoreleasedReturnValue([v9 currentRequest]);
      [v27 _timeWindowDelay];
      double v29 = v28;

      if (v11 > v29)
      {
        unsigned __int8 v30 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
          *(_DWORD *)buf = 138543874;
          id v45 = v31;
          __int16 v46 = 2114;
          int v47 = v32;
          __int16 v48 = 2048;
          double v49 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ adding delay of %f",  buf,  0x20u);
        }

        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v33,  kConditionalConnectionRequirementTimeWindowDelay);

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kConditionalConnectionIsDiscretionary);
      }
    }

    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v8 _effectiveConfiguration]);
    unsigned int v35 = [v34 _onBehalfOfPairedDevice];

    if (v35) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kConditionalConnectionOnBehalfOfPairedDevice);
    }
    if ([v9 isDiscretionary] && objc_msgSend(v9, "startedUserInitiated"))
    {
      id v36 = self->_clientApplication;
      if (self->_infersDiscretionary)
      {
        monitoredApplication = self->_monitoredApplication;
        if (monitoredApplication)
        {
          __int16 v38 = monitoredApplication;

          id v36 = v38;
        }
      }

      if (-[NDApplication isInTransitionalDiscretionaryPeriod](v36, "isInTransitionalDiscretionaryPeriod")) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kConditionalConnectionInTransitionalDiscretionaryPeriod);
      }
    }

    if (self->_shouldElevateDiscretionaryPriority) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kConditionalConnectionRequirementDiscretionaryElevated);
    }
    int v39 = (void *)objc_claimAutoreleasedReturnValue([v9 additionalProperties]);
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"TimeoutIntervalForResource"]);

    if (v40) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v40,  kConditionalConnectionRequirementTimeWindowDuration);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v19, v43);
    objc_msgSend(v8, "set_legacySocketStreamProperties:", v22);
  }
}

- (void)performCommonSetupForTask:(id)a3 taskInfo:(id)a4 identifier:(unint64_t)a5 discretionaryStatus:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  __int128 v12 = -[NDBackgroundSession priorityForDiscretionaryStatus:](self, "priorityForDiscretionaryStatus:", v6);
  sub_100003998(v10, v12, self->_monitoredApplication);
  [v10 setTaskIdentifier:a5];
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
  objc_msgSend(v10, "set_uniqueIdentifier:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 storagePartitionIdentifier]);
  objc_msgSend(v10, "set_storagePartitionIdentifier:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 pathToDownloadTaskFile]);
  objc_msgSend(v10, "set_pathToDownloadTaskFile:", v15);

  [v11 setIdentifier:a5];
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "setCreationTime:");
  [v11 setBasePriority:v12];
  [v11 setDiscretionary:v6];
  if (-[NDApplication hasForegroundBackgroundStates](self->_monitoredApplication, "hasForegroundBackgroundStates")) {
    BOOL v16 = !self->_discretionary;
  }
  else {
    BOOL v16 = 0LL;
  }
  [v11 setMayBeDemotedToDiscretionary:v16];
  [v11 setSuspendCount:1];
  -[NDBackgroundSession setupDASPropertiesOnTask:taskInfo:discretionaryStatus:]( self,  "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:",  v10,  v11,  v6);
  -[NDBackgroundSession addOutstandingTaskWithIdentifier:](self, "addOutstandingTaskWithIdentifier:", a5);
  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tasksToIdentifiers,  "setObject:forKeyedSubscript:",  v17,  v10);

  identifiersToTasks = self->_identifiersToTasks;
  int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTasks, "setObject:forKeyedSubscript:", v10, v19);

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTaskInfo, "setObject:forKeyedSubscript:", v11, v21);

  id v22 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    dispatch_qos_class_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 _loggableDescription]);
    int v26 = 138543618;
    int v27 = v23;
    __int16 v28 = 2114;
    double v29 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ enqueueing",  (uint8_t *)&v26,  0x16u);
  }

  unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v25,  14LL,  0LL);

  -[NDBackgroundSession enqueueTaskWithIdentifier:](self, "enqueueTaskWithIdentifier:", a5);
}

- (void)pingForXPCObjectValidityWithReply:(id)a3
{
}

- (void)downloadTaskWithResumeData:(id)a3 identifier:(unint64_t)a4 uniqueIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v27 = a5;
  id v11 = (void (**)(id, uint64_t))a6;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 _requestFromResumeData]);
  unsigned __int8 v13 = v12;
  if (v12 && ([v12 _isSafeRequestForBackgroundDownload] & 1) != 0)
  {
    BOOL v14 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v13,  0LL);
    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v14));
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 downloadTaskWithResumeData:v10]);

    int v17 = -[__NSCFURLSessionTaskInfo initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:]( objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo),  "initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:",  v16,  v27,  self->_clientBundleID,  self->_identifier);
    __int16 v18 = v17;
    if (v16 && v17)
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v16 downloadFile]);
      char v20 = (void *)objc_claimAutoreleasedReturnValue([v19 path]);

      if (v20) {
        int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v20));
      }
      else {
        int v21 = 0LL;
      }
      -[__NSCFURLSessionTaskInfo setDownloadFileURL:](v18, "setDownloadFileURL:", v21);
      if (v20) {

      }
      -[__NSCFURLSessionTaskInfo setExpectingResumeCallback:](v18, "setExpectingResumeCallback:", 1LL);
      -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:]( self,  "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:",  v16,  v18,  a4,  v14);
      v11[2](v11, 1LL);
    }

    else
    {
      __int16 v23 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543874;
        double v29 = v26;
        __int16 v30 = 2112;
        unsigned __int8 v31 = (NSString *)v16;
        __int16 v32 = 2112;
        __int16 v33 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@",  buf,  0x20u);
      }

      v11[2](v11, 0LL);
    }
  }

  else
  {
    id v22 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      dispatch_qos_class_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      double v29 = v24;
      __int16 v30 = 2112;
      unsigned __int8 v31 = clientBundleID;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Received a background download request from unsafe resume data from %@",  buf,  0x16u);
    }

    v11[2](v11, 0LL);
  }
}

- (void)downloadTaskWithRequest:(id)a3 originalRequest:(id)a4 downloadFilePath:(id)a5 identifier:(unint64_t)a6 uniqueIdentifier:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v36 = a4;
  id v37 = a5;
  id v38 = a7;
  id v15 = (void (**)(id, uint64_t))a8;
  BOOL v16 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession descriptionForRequest:](self, "descriptionForRequest:", v14));
    *(_DWORD *)buf = 138544130;
    __int16 v40 = v17;
    __int16 v41 = 2114;
    id v42 = v38;
    __int16 v43 = 2048;
    unint64_t v44 = a6;
    __int16 v45 = 2112;
    __int16 v46 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Task <%{public}@>.<%lu> downloadTaskWithRequest: %@",  buf,  0x2Au);
  }

  if ([v14 _isSafeRequestForBackgroundDownload])
  {
    BOOL v19 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v14,  0LL);
    char v20 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
    unsigned int v21 = [v20 isPrivileged];
    id v22 = v37;
    if (!v21) {
      id v22 = 0LL;
    }
    id v35 = v22;

    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v19));
    dispatch_qos_class_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 _downloadTaskWithRequest:v14 downloadFilePath:v35]);

    unsigned __int8 v25 = -[__NSCFURLSessionTaskInfo initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:]( objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo),  "initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:",  v24,  v38,  self->_clientBundleID,  self->_identifier);
    int v26 = v25;
    if (v24 && v25)
    {
      [v24 setOriginalRequest:v36];
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 downloadFile]);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 path]);

      if (v28) {
        double v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v28));
      }
      else {
        double v29 = 0LL;
      }
      -[__NSCFURLSessionTaskInfo setDownloadFileURL:](v26, "setDownloadFileURL:", v29, v35);
      if (v28) {

      }
      -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:]( self,  "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:",  v24,  v26,  a6,  v19);
      v15[2](v15, 1LL);
    }

    else
    {
      unsigned __int8 v31 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543874;
        __int16 v40 = v34;
        __int16 v41 = 2112;
        id v42 = v24;
        __int16 v43 = 2112;
        unint64_t v44 = (unint64_t)v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@",  buf,  0x20u);
      }

      v15[2](v15, 0LL);
    }
  }

  else
  {
    __int16 v30 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      __int16 v40 = v32;
      __int16 v41 = 2112;
      id v42 = v14;
      __int16 v43 = 2112;
      unint64_t v44 = (unint64_t)clientBundleID;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Received an unsafe request for background download: %@ from %@",  buf,  0x20u);
    }

    v15[2](v15, 0LL);
  }
}

- (void)uploadTaskWithResumableUploadState:(id)a3 request:(id)a4 originalRequest:(id)a5 fromFile:(id)a6 sandboxExtensionData:(id)a7 identifier:(unint64_t)a8 uniqueIdentifier:(id)a9 potentialCredentials:(id)a10 reply:(id)a11
{
  id v38 = a3;
  id v40 = a4;
  id v35 = a5;
  id v16 = a6;
  id v37 = a7;
  id v39 = a9;
  id v36 = a10;
  int v17 = (void (**)(id, void))a11;
  __int16 v18 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543874;
    __int16 v43 = v19;
    __int16 v44 = 2114;
    id v45 = v39;
    __int16 v46 = 2048;
    unint64_t v47 = a8;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Task <%{public}@>.<%lu> uploadTaskWithResumableUploadState",  buf,  0x20u);
  }

  BOOL v20 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v40,  0LL);
  if (v16)
  {
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession makeTempUploadFile:withExtensionData:]( self,  "makeTempUploadFile:withExtensionData:",  v16,  v37));
    if (!v21)
    {
      v17[2](v17, 0LL);
      goto LABEL_26;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uploadTaskWithRequest:v40 fromFile:v21]);
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uploadTaskWithStreamedRequest:v40]);
    unsigned int v21 = 0LL;
  }

  if (v38) {
    [v23 setResumableUploadState:v38];
  }
  dispatch_qos_class_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "resumableUploadState", a8));
  [v24 setUploadFile:v21];

  unsigned __int8 v25 = -[__NSCFURLSessionTaskInfo initWithUploadTask:uniqueIdentifier:bundleID:sessionID:]( objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo),  "initWithUploadTask:uniqueIdentifier:bundleID:sessionID:",  v23,  v39,  self->_clientBundleID,  self->_identifier);
  int v26 = v25;
  if (v23) {
    BOOL v27 = v25 == 0LL;
  }
  else {
    BOOL v27 = 1;
  }
  uint64_t v28 = !v27;
  if (v27)
  {
    unsigned __int8 v31 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      __int16 v43 = v32;
      __int16 v44 = 2112;
      id v45 = v23;
      __int16 v46 = 2112;
      unint64_t v47 = (unint64_t)v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@",  buf,  0x20u);
    }
  }

  else
  {
    if (v36)
    {
      double v29 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
      unsigned __int8 v30 = [v29 isInSyncBubble];

      if ((v30 & 1) == 0)
      {
        if (self->_clientBundleID)
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_10002AE38;
          void v41[3] = &unk_1000790E0;
          v41[4] = self;
          [v36 enumerateKeysAndObjectsUsingBlock:v41];
        }
      }
    }

    [v23 setOriginalRequest:v35];
    -[__NSCFURLSessionTaskInfo setFileURL:](v26, "setFileURL:", v21);
    -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:]( self,  "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:",  v23,  v26,  v34,  v20);
  }

  v17[2](v17, v28);

LABEL_26:
}

- (void)uploadTaskWithRequest:(id)a3 originalRequest:(id)a4 fromFile:(id)a5 sandboxExtensionData:(id)a6 identifier:(unint64_t)a7 uniqueIdentifier:(id)a8 potentialCredentials:(id)a9 reply:(id)a10
{
  id v37 = a3;
  id v33 = a4;
  id v15 = a5;
  id v35 = a6;
  id v36 = a8;
  id v34 = a9;
  id v16 = (void (**)(id, void))a10;
  int v17 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession descriptionForRequest:](self, "descriptionForRequest:", v37));
    *(_DWORD *)buf = 138544386;
    id v40 = v18;
    __int16 v41 = 2114;
    id v42 = v36;
    __int16 v43 = 2048;
    unint64_t v44 = a7;
    __int16 v45 = 2112;
    __int16 v46 = v19;
    __int16 v47 = 2112;
    id v48 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Task <%{public}@>.<%lu> uploadTaskWithRequest: %@ fromFile: %@",  buf,  0x34u);
  }

  BOOL v20 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v37,  0LL);
  if (v15)
  {
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession makeTempUploadFile:withExtensionData:]( self,  "makeTempUploadFile:withExtensionData:",  v15,  v35));
    if (!v21)
    {
      v16[2](v16, 0LL);
      goto LABEL_24;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uploadTaskWithRequest:v37 fromFile:v21]);
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v20));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uploadTaskWithStreamedRequest:v37]);
    unsigned int v21 = 0LL;
  }

  dispatch_qos_class_t v24 = -[__NSCFURLSessionTaskInfo initWithUploadTask:uniqueIdentifier:bundleID:sessionID:]( objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo),  "initWithUploadTask:uniqueIdentifier:bundleID:sessionID:",  v23,  v36,  self->_clientBundleID,  self->_identifier);
  unsigned __int8 v25 = v24;
  if (v23) {
    BOOL v26 = v24 == 0LL;
  }
  else {
    BOOL v26 = 1;
  }
  uint64_t v27 = !v26;
  if (v26)
  {
    unsigned __int8 v30 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      id v40 = v31;
      __int16 v41 = 2112;
      id v42 = v23;
      __int16 v43 = 2112;
      unint64_t v44 = (unint64_t)v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@",  buf,  0x20u);
    }
  }

  else
  {
    if (v34)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon"));
      unsigned __int8 v29 = [v28 isInSyncBubble];

      if ((v29 & 1) == 0)
      {
        if (self->_clientBundleID)
        {
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472LL;
          v38[2] = sub_10002AC08;
          v38[3] = &unk_1000790E0;
          v38[4] = self;
          [v34 enumerateKeysAndObjectsUsingBlock:v38];
        }
      }
    }

    [v23 setOriginalRequest:v33];
    -[__NSCFURLSessionTaskInfo setFileURL:](v25, "setFileURL:", v21);
    -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:]( self,  "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:",  v23,  v25,  a7,  v20);
  }

  v16[2](v16, v27);

LABEL_24:
}

- (void)dataTaskWithRequest:(id)a3 originalRequest:(id)a4 identifier:(unint64_t)a5 uniqueIdentifier:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v27 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, uint64_t))a7;
  id v15 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession descriptionForRequest:](self, "descriptionForRequest:", v12));
    *(_DWORD *)buf = 138544130;
    unsigned __int8 v29 = v16;
    __int16 v30 = 2114;
    id v31 = v13;
    __int16 v32 = 2048;
    unint64_t v33 = a5;
    __int16 v34 = 2112;
    id v35 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Task <%{public}@>.<%lu> dataTaskWithRequest: %@",  buf,  0x2Au);
  }

  BOOL v18 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v12,  0LL);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", v18));
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 dataTaskWithRequest:v12]);

  unsigned int v21 = -[__NSCFURLSessionTaskInfo initWithDataTask:uniqueIdentifier:bundleID:sessionID:]( objc_alloc(&OBJC_CLASS_____NSCFURLSessionTaskInfo),  "initWithDataTask:uniqueIdentifier:bundleID:sessionID:",  v20,  v13,  self->_clientBundleID,  self->_identifier);
  id v22 = v21;
  if (v20) {
    BOOL v23 = v21 == 0LL;
  }
  else {
    BOOL v23 = 1;
  }
  uint64_t v24 = !v23;
  if (v23)
  {
    unsigned __int8 v25 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543874;
      unsigned __int8 v29 = v26;
      __int16 v30 = 2112;
      id v31 = v20;
      __int16 v32 = 2112;
      unint64_t v33 = (unint64_t)v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Couldn't create task or taskInfo: task = %@, taskInfo = %@",  buf,  0x20u);
    }
  }

  else
  {
    [v20 setOriginalRequest:v27];
    if (!self->_clientImplementsWillSendRequest || !self->_sendsLaunchEvents) {
      -[__NSCFURLSessionTaskInfo setShouldCancelOnDisconnect:](v22, "setShouldCancelOnDisconnect:", 1LL);
    }
    -[__NSCFURLSessionTaskInfo setDisablesRetry:](v22, "setDisablesRetry:", !self->_retryDataTasks);
    -[NDBackgroundSession performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:]( self,  "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:",  v20,  v22,  a5,  v18);
  }

  v14[2](v14, v24);
}

- (void)avAssetDownloadTaskWithDownloadToken:(unint64_t)a3 URL:(id)a4 destinationURL:(id)a5 temporaryDestinationURL:(id)a6 assetTitle:(id)a7 assetArtworkData:(id)a8 options:(id)a9 assetOptions:(id)a10 identifier:(unint64_t)a11 uniqueIdentifier:(id)a12 taskKind:(unint64_t)a13 enableSPIDelegateCallbacks:(BOOL)a14 reply:(id)a15
{
}

- (void)avAggregateAssetDownloadTaskWithDownloadToken:(unint64_t)a3 serializedMediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 assetOptions:(id)a8 childDownloadSessionIdentifier:(id)a9 identifier:(unint64_t)a10 uniqueIdentifier:(id)a11 reply:(id)a12
{
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3 byProducingResumeData:(id)a4
{
  id v6 = a4;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v11));

  [v12 setState:2];
  [v12 setResumedAndWaitingForEarliestBeginDate:0];
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSURLSessionDownloadTask);
  if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10002A9A0;
    v19[3] = &unk_100079108;
    id v14 = v19;
    v19[4] = self;
    id v15 = v9;
    v19[5] = v15;
    v19[6] = v6;
    [v15 cancelByProducingResumeData:v19];
  }

  else
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSURLSessionUploadTask);
    if ((objc_opt_isKindOfClass(v9, v16) & 1) == 0)
    {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
      goto LABEL_7;
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002AAD4;
    v18[3] = &unk_100079108;
    id v14 = v18;
    v18[4] = self;
    id v17 = v9;
    v18[5] = v17;
    v18[6] = v6;
    [v17 cancelByProducingResumeData:v18];
  }

LABEL_7:
}

- (void)cancelTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTasks = self->_identifiersToTasks;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v6));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v9));

  id v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2114;
    id v17 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ cancelTaskWithIdentifier",  (uint8_t *)&v14,  0x16u);
  }

  [v10 setState:2];
  [v10 setResumedAndWaitingForEarliestBeginDate:0];
  [v7 cancel];
}

- (void)suspendTaskWithIdentifier:(unint64_t)a3
{
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTaskInfo, "objectForKeyedSubscript:", v6));

  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    int v13 = 138543618;
    int v14 = v9;
    __int16 v15 = 2114;
    __int16 v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ suspendTaskWithIdentifier",  (uint8_t *)&v13,  0x16u);
  }

  if (v7)
  {
    id v11 = (char *)[v7 suspendCount];
    [v7 setSuspendCount:v11 + 1];
    if (!v11)
    {
      [v7 setState:1];
      -[NSXPCProxyCreating backgroundTaskDidSuspend:](self->_clientProxy, "backgroundTaskDidSuspend:", a3);
      -[NDBackgroundSession taskShouldSuspend:](self, "taskShouldSuspend:", a3);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v12,  11LL,  1LL);
  }
}

- (void)resumeTaskWithIdentifier:(unint64_t)a3 withProperties:(id)a4
{
  id v6 = a4;
  identifiersToTasks = self->_identifiersToTasks;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v11));

  int v13 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    int v24 = 138543874;
    unsigned __int8 v25 = v14;
    __int16 v26 = 2114;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ resumeTaskWithIdentifier, props %@",  (uint8_t *)&v24,  0x20u);
  }

  if (v12)
  {
    if ([v12 state] == (id)1
      && (__int16 v16 = (char *)[v12 suspendCount] - 1, objc_msgSend(v12, "setSuspendCount:", v16), !v16))
    {
      [v12 setState:0];
      [v12 setQos:qos_class_self()];
      BOOL v18 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
        unsigned int v21 = [v12 qos];
        int v24 = 138543874;
        unsigned __int8 v25 = v19;
        __int16 v26 = 2114;
        id v27 = v20;
        __int16 v28 = 1024;
        LODWORD(v29) = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ resuming, QOS(0x%x)",  (uint8_t *)&v24,  0x1Cu);
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sanitizeTaskProperties:](self, "sanitizeTaskProperties:", v6));
      [v12 setAdditionalProperties:v22];

      -[NDBackgroundSession configureAdditionalPropertiesOnTask:taskInfo:]( self,  "configureAdditionalPropertiesOnTask:taskInfo:",  v9,  v12);
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v9 currentRequest]);
      [v12 setCurrentRequest:v23];

      -[NSXPCProxyCreating backgroundTaskDidResume:](self->_clientProxy, "backgroundTaskDidResume:", a3);
      [v9 startResourceTimer];
      -[NDBackgroundSession taskShouldResume:](self, "taskShouldResume:", a3);
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v17,  11LL,  1LL);
    }
  }
}

- (void)setPropertyOnStreamWithIdentifier:(unint64_t)a3 propDict:(id)a4 propKey:(id)a5 withReply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v14));

  __int16 v16 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v15 _loggableDescription]);
    clientBundleID = self->_clientBundleID;
    int v24 = 138544130;
    unsigned __int8 v25 = v17;
    __int16 v26 = 2114;
    id v27 = v18;
    __int16 v28 = 2112;
    id v29 = clientBundleID;
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ setPropertyOnStreamWithIdentifier, client %@ property %@",  (uint8_t *)&v24,  0x2Au);
  }

  if (v10 && v11 && v12)
  {
    identifiersToStreams = self->_identifiersToStreams;
    if (identifiersToStreams)
    {
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToStreams,  "objectForKeyedSubscript:",  v21));
      id v23 = [v22 setProperty:v10 forKey:v11];
    }

    else
    {
      id v23 = 0LL;
    }

    v12[2](v12, v23);
  }
}

- (void)setDescription:(id)a3 forTask:(unint64_t)a4
{
  id v13 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v7));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v10));

  [v11 setTaskDescription:v13];
  [v8 setTaskDescription:v13];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v12,  0LL,  1LL);
}

- (void)setPriority:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v8 = sub_100003B08(v7, @"com.apple.private.nsurlsession.set-task-priority");

  if ((v8 & 1) != 0)
  {
    identifiersToTasks = self->_identifiersToTasks;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v10));

    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v13));

    __int16 v15 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v17 = (NSString *)objc_claimAutoreleasedReturnValue([v11 _loggableDescription]);
      *(_DWORD *)buf = 138543874;
      __int16 v46 = v16;
      __int16 v47 = 2114;
      id v48 = v17;
      __int16 v49 = 2048;
      __int16 v50 = (const __CFString *)a3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ setting priority to %ld",  buf,  0x20u);
    }

    unsigned __int8 v18 = [v14 hasStarted];
    if (a3 > 300) {
      char v19 = 1;
    }
    else {
      char v19 = v18;
    }
    if ((v19 & 1) == 0 && [v14 isDiscretionary])
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", 0LL));
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 configuration]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 _socketStreamProperties]);
      id v23 = [v22 mutableCopy];

      int v24 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", 0LL));
      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 configuration]);
      if ([v25 allowsCellularAccess])
      {
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v14 originalRequest]);
        unsigned int v27 = [v26 allowsCellularAccess];

        if (v27) {
          [v23 setObject:&__kCFBooleanFalse forKeyedSubscript:kCFStreamPropertyNoCellular];
        }
      }

      else
      {
      }

      [v23 setObject:&__kCFBooleanFalse forKeyedSubscript:kCFStreamPropertyDUETConditional];
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession sessionForDiscretionaryStatus:](self, "sessionForDiscretionaryStatus:", 0LL));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 configuration]);
      unsigned __int8 v32 = [v31 _duetPreauthorized];

      if ((v32 & 1) == 0)
      {
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[NDBackgroundSession sessionForDiscretionaryStatus:]( self,  "sessionForDiscretionaryStatus:",  0LL));
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 configuration]);
        unsigned int v35 = [v34 _requiresPowerPluggedIn];

        if (v35)
        {
          uint64_t v43 = kConditionalConnectionRequirementPowerPluggedIn;
          unint64_t v44 = &__kCFBooleanTrue;
          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
          [v23 setObject:v36 forKeyedSubscript:kCFStreamPropertyConditionalConnectionProperties];
        }

        else
        {
          uint64_t v41 = kConditionalConnectionIsDiscretionary;
          id v42 = &__kCFBooleanFalse;
          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
          [v23 setObject:v36 forKeyedSubscript:kCFStreamPropertyConditionalConnectionProperties];
        }
      }

      objc_msgSend(v11, "set_legacySocketStreamProperties:", v23);
      [v14 setDiscretionary:0];
    }

    [v14 setBasePriority:a3];
    [v14 setBasePrioritySetExplicitly:1];
    identifiersToMonitors = self->_identifiersToMonitors;
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    id v39 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToMonitors,  "objectForKeyedSubscript:",  v38));

    [v39 setBasePriority:a3];
    sub_100003998(v11, (id)a3, self->_monitoredApplication);
    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v40,  12LL,  0LL);
  }

  else
  {
    id v11 = (id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      __int16 v46 = v28;
      __int16 v47 = 2112;
      id v48 = clientBundleID;
      __int16 v49 = 2112;
      __int16 v50 = @"com.apple.private.nsurlsession.set-task-priority";
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %@ tried to set the priority of a task but is missing the %@ entitlement",  buf,  0x20u);
    }
  }
}

- (void)setLoadingPoolPriority:(double)a3 forTaskWithIdentifier:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v8 = sub_100003B08(v7, @"com.apple.private.nsurlsession.set-task-priority");

  if ((v8 & 1) != 0)
  {
    identifiersToTasks = self->_identifiersToTasks;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v10));

    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    int v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v13));

    __int16 v15 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v17 = (NSString *)objc_claimAutoreleasedReturnValue([v11 _loggableDescription]);
      int v21 = 138543874;
      id v22 = v16;
      __int16 v23 = 2114;
      int v24 = v17;
      __int16 v25 = 2048;
      double v26 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ setting loading priority to %f",  (uint8_t *)&v21,  0x20u);
    }

    objc_msgSend(v11, "set_loadingPriority:", a3);
    [v14 setLoadingPriority:a3];
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v18,  4LL,  0LL);
  }

  else
  {
    id v11 = (id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      char v19 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      int v21 = 138543874;
      id v22 = v19;
      __int16 v23 = 2112;
      int v24 = clientBundleID;
      __int16 v25 = 2112;
      double v26 = COERCE_DOUBLE(@"com.apple.private.nsurlsession.set-task-priority");
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %@ tried to set the loading priority of a task but is missing the %@ entitlement",  (uint8_t *)&v21,  0x20u);
    }
  }
}

- (void)setBytesPerSecondLimit:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  identifiersToTasks = self->_identifiersToTasks;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v11));

  id v13 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    int v17 = 138543874;
    unsigned __int8 v18 = v14;
    __int16 v19 = 2114;
    BOOL v20 = v15;
    __int16 v21 = 2048;
    int64_t v22 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ setting limit of %lld bytes per second",  (uint8_t *)&v17,  0x20u);
  }

  objc_msgSend(v9, "set_bytesPerSecondLimit:", a3);
  [v12 setBytesPerSecondLimit:a3];
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v16,  5LL,  0LL);
}

- (void)setExpectedProgressTarget:(unint64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  identifiersToTasks = self->_identifiersToTasks;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v10));

  objc_msgSend(v13, "set_expectedProgressTarget:", a3);
  [v11 setExpectedProgressTarget:a3];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v12,  6LL,  0LL);
}

- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4
{
  uint64_t v5 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v10));

  objc_msgSend(v13, "set_TLSMinimumSupportedProtocolVersion:", v5);
  objc_msgSend(v11, "set_TLSMinimumSupportedProtocolVersion:", v5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v12,  7LL,  0LL);
}

- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3 forTaskWithIdentifier:(unint64_t)a4
{
  uint64_t v5 = a3;
  identifiersToTasks = self->_identifiersToTasks;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v10));

  objc_msgSend(v13, "set_TLSMaximumSupportedProtocolVersion:", v5);
  objc_msgSend(v11, "set_TLSMaximumSupportedProtocolVersion:", v5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v12,  7LL,  0LL);
}

- (void)setDiscretionaryOverride:(int64_t)a3 forTaskWithIdentifier:(unint64_t)a4
{
  identifiersToTasks = self->_identifiersToTasks;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToTasks, "objectForKeyedSubscript:", v8));

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned int v14 = sub_100003B08(v13, @"com.apple.private.nsurlsession.set-discretionary-override-value");

  if (v14)
  {
    [v12 setQos:qos_class_self()];
    __int16 v15 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v17 = (id)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
      if (a3)
      {
        if (a3 == 1)
        {
          int v18 = 68;
        }

        else if (a3 == 2)
        {
          int v18 = 78;
        }

        else
        {
          int v18 = 63;
        }
      }

      else
      {
        int v18 = 45;
      }

      int v27 = 138544130;
      __int16 v28 = v16;
      __int16 v29 = 2114;
      uint64_t v30 = (uint64_t)v17;
      __int16 v31 = 1024;
      int v32 = v18;
      __int16 v33 = 1024;
      LODWORD(v34) = [v12 qos];
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ setting discretionaryOverrride to %c, QOS(0x%x)",  (uint8_t *)&v27,  0x22u);
    }

    objc_msgSend(v9, "set_discretionaryOverride:", a3);
    [v12 setDiscretionaryOverride:a3];
    [v12 setMayBeDemotedToDiscretionary:1];
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v12 currentRequest]);
    unsigned int v25 = -[NDBackgroundSession currentDiscretionaryStatus:withOptionalTaskInfo:]( self,  "currentDiscretionaryStatus:withOptionalTaskInfo:",  v24,  v12);

    if ((!sub_100003A60(v9) || ([v9 _seenFirstResume] & 1) == 0)
      && v25 != [v12 isDiscretionary])
    {
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v9 error:@"_nsurlsessiondErrorDomain" code:6]);
      objc_msgSend(v9, "cancel_with_error:", v26);
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](&OBJC_CLASS___NDStatusMonitor, "sharedMonitor"));
    [v19 simulateNetworkChangedEvent:self identifier:a4];
  }

  else
  {
    id v19 = (id)qword_100083990;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
      int64_t v22 = (void *)v21;
      if (a3)
      {
        if (a3 == 1)
        {
          int v23 = 68;
        }

        else if (a3 == 2)
        {
          int v23 = 78;
        }

        else
        {
          int v23 = 63;
        }
      }

      else
      {
        int v23 = 45;
      }

      int v27 = 138544130;
      __int16 v28 = v20;
      __int16 v29 = 2114;
      uint64_t v30 = v21;
      __int16 v31 = 1024;
      int v32 = v23;
      __int16 v33 = 2112;
      __int16 v34 = @"com.apple.private.nsurlsession.set-discretionary-override-value";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ attempted to set discretionaryOverrride to %c but lacks required entitlement %@",  (uint8_t *)&v27,  0x26u);
    }
  }
}

- (void)setTLSSessionCachePrefix:(id)a3
{
  id v4 = a3;
  -[NSURLSession set_tlsSessionCachePrefix:](self->_userInitiatedSession, "set_tlsSessionCachePrefix:");
  -[NSURLSession set_tlsSessionCachePrefix:](self->_discretionaryPrioritySession, "set_tlsSessionCachePrefix:", v4);
}

- (void)resetStorageWithReply:(id)a3
{
  id v4 = (void (**)(void))a3;
  -[NDCredentialStorage reset](self->_credentialStorage, "reset");
  v4[2]();
}

- (void)invalidateWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    identifier = self->_identifier;
    clientBundleID = self->_clientBundleID;
    int v13 = 138543874;
    unsigned int v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = identifier;
    __int16 v17 = 2112;
    int v18 = clientBundleID;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> InvalidateWithReply: for session %@ bundle ID %@",  (uint8_t *)&v13,  0x20u);
  }

  if (-[NDCallbackQueue count](self->_callbackQueue, "count")
    && -[NSMutableDictionary count](self->_identifiersToTasks, "count")
    || -[NDBackgroundSession sessionHasOutstandingTasks](self, "sessionHasOutstandingTasks"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession invalidateReply](self, "invalidateReply"));
    BOOL v10 = v9 == 0LL;

    if (v10) {
      -[NDBackgroundSession setInvalidateReply:](self, "setInvalidateReply:", v4);
    }
  }

  else
  {
    id v11 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v13 = 138543362;
      unsigned int v14 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Cleaning up and invalidating immediately since there are no tasks",  (uint8_t *)&v13,  0xCu);
    }

    -[NDBackgroundSession cleanupSessionWithCompletionHandler:](self, "cleanupSessionWithCompletionHandler:", v4);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    int v10 = 138544130;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2048;
    id v17 = [v7 code];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Session %@ didBecomeInvalidWithError: %@ [%ld]",  (uint8_t *)&v10,  0x2Au);
  }
}

- (BOOL)trustPassesExtendedValidation:(__SecTrust *)a3
{
  if (a3)
  {
    CFErrorRef error = 0LL;
    if (!SecTrustEvaluateWithError(a3, &error))
    {
      unsigned __int8 v8 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        CFErrorRef v13 = error;
        id v14 = -[__CFError code](error, "code");
        *(_DWORD *)buf = 138543618;
        int v18 = v12;
        __int16 v19 = 2048;
        id v20 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Invalid trust status: %ld",  buf,  0x16u);
      }

      BOOL v9 = 0;
      goto LABEL_15;
    }

    uint64_t v5 = (const __CFDictionary *)SecTrustCopyInfo(a3);
    id v6 = v5;
    if (v5)
    {
      Value = CFDictionaryGetValue(v5, kSecTrustInfoExtendedValidationKey);
      unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Value);
      if ((objc_opt_respondsToSelector(v8, "BOOLValue") & 1) != 0
        && (-[os_log_s BOOLValue](v8, "BOOLValue") & 1) != 0)
      {
        BOOL v9 = 1;
      }

      else
      {
        int v10 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          *(_DWORD *)buf = 138543362;
          int v18 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Extended trust validation failed",  buf,  0xCu);
        }

        BOOL v9 = 0;
      }

      CFRelease(v6);
LABEL_15:

      return v9;
    }
  }

  return 0;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v62 = a6;
  __int16 v63 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v9));
  id v61 = [v11 unsignedIntegerValue];

  __int16 v12 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    id v15 = (id)objc_claimAutoreleasedReturnValue([v10 protectionSpace]);
    clientBundleID = self->_clientBundleID;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 protectionSpace]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 authenticationMethod]);
    *(_DWORD *)buf = 138544642;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    id v72 = v10;
    __int16 v73 = 2112;
    id v74 = v15;
    __int16 v75 = 2112;
    v76 = clientBundleID;
    __int16 v77 = 2112;
    v78 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ didReceiveChallenge: %@ protection space: %@ for client %@ received auth challenge with type %@",  buf,  0x3Eu);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v72) = 0;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_10002A8B8;
  v64[3] = &unk_100079130;
  unsigned __int8 v66 = buf;
  id v19 = v62;
  id v65 = v19;
  id v20 = objc_retainBlock(v64);
  if (!self->_performsEVCertCheck
    || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 protectionSpace]),
        int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 authenticationMethod]),
        unsigned int v23 = [v22 isEqualToString:NSURLAuthenticationMethodServerTrust],
        v22,
        v21,
        !v23))
  {
    if (!sub_10002A8DC(v10)
      || self->_clientImplementsSessionChallenge
      || self->_clientImplementsTaskChallenge)
    {
      if (sub_10002A8DC(v10) || self->_clientImplementsTaskChallenge)
      {
        if (self->_clientProxy) {
          goto LABEL_36;
        }
        if (self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
        {
          if (self->_clientProxy) {
            goto LABEL_36;
          }
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v10 protectionSpace]);
          unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 authenticationMethod]);
          unsigned int v36 = [v35 isEqualToString:NSURLAuthenticationMethodServerTrust];

          if (v36)
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v10 protectionSpace]);
            id v38 = (__SecTrust *)[v37 serverTrust];

            if (!SecTrustEvaluateWithError(v38, 0LL)) {
              goto LABEL_36;
            }
            id v39 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              id v40 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
              *(_DWORD *)__int16 v67 = 138543618;
              v68 = v40;
              __int16 v69 = 2114;
              unsigned int v70 = v41;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client is not running and trust is valid, performing default handling for auth challenge",  v67,  0x16u);
            }
          }

          else
          {
            if (self->_clientProxy) {
              goto LABEL_36;
            }
            if ([v10 previousFailureCount]) {
              goto LABEL_36;
            }
            uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v10 proposedCredential]);
            BOOL v56 = v55 == 0LL;

            if (v56) {
              goto LABEL_36;
            }
            id v39 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
              __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
              *(_DWORD *)__int16 v67 = 138543618;
              v68 = v57;
              __int16 v69 = 2114;
              unsigned int v70 = v58;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client is not running and challenge has a previousFailureCount of 0 an d a proposedCredential, performing default handling for auth challenge",  v67,  0x16u);
            }
          }
        }

        else
        {
          id v39 = (os_log_s *)(id)qword_100083990;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v42 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
            *(_DWORD *)__int16 v67 = 138543618;
            v68 = v42;
            __int16 v69 = 2114;
            unsigned int v70 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client is not running and doesn't support app wakes, performing default handling for auth challenge",  v67,  0x16u);
          }
        }
      }

      else
      {
        id v39 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
          *(_DWORD *)__int16 v67 = 138543618;
          v68 = v44;
          __int16 v69 = 2114;
          unsigned int v70 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client doesn't implement task-level auth challenge delegate, performing de fault handling for auth challenge",  v67,  0x16u);
        }
      }
    }

    else
    {
      id v39 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        __int16 v47 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
        *(_DWORD *)__int16 v67 = 138543618;
        v68 = v46;
        __int16 v69 = 2114;
        unsigned int v70 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ client doesn't implement session-level or task-level auth challenge delegate , performing default handling for auth challenge",  v67,  0x16u);
      }
    }

    ((void (*)(void *))v20[2])(v20);
    goto LABEL_36;
  }

  int v24 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    double v26 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
    *(_DWORD *)__int16 v67 = 138543618;
    v68 = v25;
    __int16 v69 = 2114;
    unsigned int v70 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ performing Extended Validation Trust evaluation",  v67,  0x16u);
  }

  int v27 = (void *)objc_claimAutoreleasedReturnValue([v10 protectionSpace]);
  id v28 = [v27 serverTrust];

  LODWORD(v27) = -[NDBackgroundSession trustPassesExtendedValidation:](self, "trustPassesExtendedValidation:", v28);
  __int16 v29 = (os_log_s *)(id)qword_100083990;
  uint64_t v30 = v29;
  if ((_DWORD)v27)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      int v32 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
      *(_DWORD *)__int16 v67 = 138543618;
      v68 = v31;
      __int16 v69 = 2114;
      unsigned int v70 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ Extended Validation Trust evaluation succeeded",  v67,  0x16u);
    }

    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](&OBJC_CLASS___NSURLCredential, "credentialForTrust:", v28));
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0LL, v33);
  }

  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v63 _loggableDescription]);
      *(_DWORD *)__int16 v67 = 138543618;
      v68 = v59;
      __int16 v69 = 2114;
      unsigned int v70 = v60;
      _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ Extended Validation Trust evaluation failed",  v67,  0x16u);
    }

    (*((void (**)(id, uint64_t, void))v19 + 2))(v19, 2LL, 0LL);
  }

  *(_BYTE *)(*(void *)&buf[8] + 24LL) = 1;
LABEL_36:
  if (!*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {
    id v48 = objc_alloc(&OBJC_CLASS___PendingCallback);
    id v49 = objc_retainBlock(v19);
    id v50 = [v49 copy];
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v10, v50, 0LL));
    id v52 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v48,  "initWithCallbackType:taskIdentifier:args:",  2LL,  v61,  v51);

    [v63 _releasePreventIdleSleepAssertionIfAppropriate];
    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes")) {
        uint64_t v54 = 2LL;
      }
      else {
        uint64_t v54 = 0LL;
      }
    }

    else
    {
      uint64_t v54 = 0LL;
    }

    -[NDCallbackQueue addPendingCallback:wakeRequirement:]( callbackQueue,  "addPendingCallback:wakeRequirement:",  v52,  v54);
  }

  _Block_object_dispose(buf, 8);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v66 = a5;
  id v69 = a6;
  id v65 = a7;
  v68 = v12;
  CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v12));
  id v14 = [v13 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v14));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v16));

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_10002A62C;
  v78[3] = &unk_100079158;
  id v18 = v17;
  id v79 = v18;
  v80 = self;
  id v82 = v14;
  id v19 = v65;
  id v81 = v19;
  __int16 v67 = objc_retainBlock(v78);
  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v69 URL]);
  v64 = (void *)objc_claimAutoreleasedReturnValue([v60 host]);
  id v61 = (void *)objc_claimAutoreleasedReturnValue([v18 currentRequest]);
  id v62 = (void *)objc_claimAutoreleasedReturnValue([v61 URL]);
  __int16 v63 = (void *)objc_claimAutoreleasedReturnValue([v62 host]);
  unsigned int v20 = objc_msgSend(v64, "isEqualToString:");
  if (v20)
  {
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v69 URL]);
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v54 scheme]);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v18 currentRequest]);
    BOOL v56 = (void *)objc_claimAutoreleasedReturnValue([v55 URL]);
    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v56 scheme]);
    if (objc_msgSend(v59, "isEqualToString:"))
    {
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v69 URL]);
      __int128 v58 = (void *)objc_claimAutoreleasedReturnValue([v51 port]);
      id v52 = (void *)objc_claimAutoreleasedReturnValue([v18 currentRequest]);
      v53 = (void *)objc_claimAutoreleasedReturnValue([v52 URL]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v53 port]);
      if (v58 == v7)
      {
        int v25 = 0;
        id v7 = v58;
        goto LABEL_9;
      }

      int v21 = 1;
    }

    else
    {
      int v21 = 0;
    }
  }

  else
  {
    int v21 = 0;
  }

  int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v68 _taskGroup]);
  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 _groupConfiguration]);
  unsigned int v24 = [v23 _duetPreauthorized];

  int v25 = v24 ^ 1;
  if (!v21)
  {
    if (!v20) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", a4));
  id v11 = [v14 unsignedIntegerValue];

  identifiersToMonitors = self->_identifiersToMonitors;
  CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v13));

  if (v15) {
    [v15 taskTransferredData:a5 countOfBytesReceived:0];
  }
  -[NSXPCProxyCreating backgroundTask:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]( self->_clientProxy,  "backgroundTask:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:",  v11,  a5,  a6,  a7);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v12));

  [v13 setShouldCancelOnDisconnect:1];
  [v13 setDisablesRetry:!self->_retryDataTasks];
  id v14 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v15;
    __int16 v30 = 2114;
    uint64_t v31 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ needs new body stream",  buf,  0x16u);
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10002A45C;
    v25[3] = &unk_100079A50;
    v25[4] = self;
    id v18 = v7;
    id v26 = v18;
    id v19 = v8;
    id v27 = v19;
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:]( clientProxy,  "remoteObjectProxyWithErrorHandler:",  v25));
    uint64_t v21 = sub_100003A60(v18);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10002A5A0;
    v22[3] = &unk_1000791D0;
    v22[4] = self;
    id v24 = v10;
    id v23 = v19;
    [v20 backgroundTask:v10 needNewBodyStream:v21 withReply:v22];
  }

  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0LL);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    int v23 = 138544130;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 1024;
    unsigned int v30 = [v8 statusCode];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ didReceiveInformationalResponse: %@, status code: %d",  (uint8_t *)&v23,  0x26u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 resumableUploadState]);
  unsigned int v15 = [v14 isResumable];

  if (v15)
  {
    identifiersToTaskInfo = self->_identifiersToTaskInfo;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v17));

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 resumableUploadData]);
    LODWORD(v17) = v19 == 0LL;

    if ((_DWORD)v17)
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v7 resumableUploadState]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 createResumeDataForTaskInfo]);
      [v18 setResumableUploadData:v21];

      int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
      -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v22,  2LL,  0LL);
    }
  }

  -[NSXPCProxyCreating backgroundTask:didReceiveInformationalResponse:]( self->_clientProxy,  "backgroundTask:didReceiveInformationalResponse:",  v10,  v8);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v75 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  CFErrorRef v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 _metrics]);
  [v13 setTaskMetrics:v14];

  identifiersToStreams = self->_identifiersToStreams;
  if (identifiersToStreams)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v75));
    -[NSMutableDictionary removeObjectForKey:](identifiersToStreams, "removeObjectForKey:", v16);
  }

  if ([v7 _hasSZExtractor])
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 downloadFileURL]);
    if (v17)
    {
      unsigned __int8 v18 = [v13 _updatedStreamingZipModificationDate];

      if ((v18 & 1) == 0)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 downloadFileURL]);
        +[NDFileUtilities updateStreamingZipModificationDate:]( &OBJC_CLASS___NDFileUtilities,  "updateStreamingZipModificationDate:",  v19);
      }
    }
  }

  if (!v8
    || !sub_100003570((BOOL)v8)
    || [v13 disablesRetry] && ((sub_100003A60(v7) & 1) != 0 || !sub_1000037B0(v8))
    || [v13 state] == (id)2)
  {
    char v20 = 0;
    goto LABEL_14;
  }

  __int128 v58 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138544386;
    __int16 v85 = v59;
    __int16 v86 = 2114;
    id v87 = v60;
    __int16 v88 = 2112;
    __int16 v89 = clientBundleID;
    __int16 v90 = 2112;
    id v91 = v8;
    __int16 v92 = 2048;
    id v93 = [v8 code];
    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for client %@ will be retried after error %@ - code: %ld",  buf,  0x34u);
  }

  -[NDBackgroundSession handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:]( self,  "handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:",  v7,  v75,  v13,  1LL,  1LL);
  -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v7);
  id v62 = (void *)objc_claimAutoreleasedReturnValue([v7 _extractor]);
  objc_msgSend(v13, "set_extractor:", v62);

  objc_msgSend(v13, "set_hasSZExtractor:", objc_msgSend(v7, "_hasSZExtractor"));
  objc_msgSend( v13,  "set_doesSZExtractorConsumeExtractedData:",  objc_msgSend(v7, "_doesSZExtractorConsumeExtractedData"));
  __int16 v63 = (void *)objc_claimAutoreleasedReturnValue([v7 _metrics]);
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "_daemon_currentTransactionMetrics"));
  unsigned __int8 v65 = -[NDBackgroundSession retryTask:originalError:transactionMetrics:]( self,  "retryTask:originalError:transactionMetrics:",  v13,  v8,  v64);

  if ((v65 & 1) == 0)
  {
    id v66 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      unsigned int v70 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v71 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      __int16 v85 = v70;
      __int16 v86 = 2114;
      id v87 = v71;
      _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ failed to retry",  buf,  0x16u);
    }

    __int16 v67 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    uint64_t v68 = objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1LL,  v67));

    char v20 = 1;
    id v8 = (id)v68;
LABEL_14:
    clientProxy = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue([v8 domain]);
    char v73 = v20;
    if (-[NSXPCProxyCreating isEqualToString:]( clientProxy,  "isEqualToString:",  @"_nsurlsessiondErrorDomain"))
    {
      BOOL v22 = [v8 code] == (id)1;

      if (!v22) {
        goto LABEL_20;
      }
      int v23 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v69 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        *(_DWORD *)buf = 138543362;
        __int16 v85 = v69;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Removing client proxy due to task failure caused by app quit",  buf,  0xCu);
      }

      clientProxy = self->_clientProxy;
      self->_clientProxy = 0LL;
    }

LABEL_20:
    id v76 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession clientErrorForError:](self, "clientErrorForError:", v8));
    if (sub_100003824((BOOL)v8)) {
      unsigned int v72 = -[NDApplication canBeSuspended](self->_clientApplication, "canBeSuspended");
    }
    else {
      unsigned int v72 = 0;
    }
    [v13 setState:3];
    [v13 setError:v76];
    [v7 setError:v76];
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 _trailers]);
    objc_msgSend(v13, "set_backgroundTrailers:", v24);

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v75));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v25,  14LL,  1LL);

    id v26 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v28 = (id)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
      id v29 = [v8 code];
      if (sub_100003A60(v7))
      {
        else {
          int v30 = 78;
        }
      }

      else
      {
        int v30 = 85;
      }

      *(_DWORD *)buf = 138544386;
      __int16 v85 = v27;
      __int16 v86 = 2114;
      id v87 = v28;
      __int16 v88 = 2112;
      __int16 v89 = (NSString *)v8;
      __int16 v90 = 2048;
      id v91 = v29;
      __int16 v92 = 1024;
      LODWORD(v93) = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ completed with error %@ [%ld]. C(%c)",  buf,  0x30u);
    }

    if (!v8)
    {
      __int16 v33 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
        id v39 = self->_clientBundleID;
        *(_DWORD *)buf = 138543874;
        __int16 v85 = v37;
        __int16 v86 = 2114;
        id v87 = v38;
        __int16 v88 = 2112;
        __int16 v89 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for client %@ completed successfully",  buf,  0x20u);
      }

      goto LABEL_40;
    }

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v31 isEqualToString:NSURLErrorDomain])
    {
      BOOL v32 = [v8 code] == (id)-999;

      if (v32)
      {
        __int16 v33 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
          unsigned int v36 = self->_clientBundleID;
          *(_DWORD *)buf = 138543874;
          __int16 v85 = v34;
          __int16 v86 = 2114;
          id v87 = v35;
          __int16 v88 = 2112;
          __int16 v89 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for client %@ was cancelled",  buf,  0x20u);
        }

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v37 = (void (**)(id, uint64_t))a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v9));
  id v12 = [v11 unsignedIntegerValue];

  CFErrorRef v13 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    *(_DWORD *)buf = 138544130;
    __int16 v45 = v14;
    __int16 v46 = 2114;
    BOOL v47 = v15;
    __int16 v48 = 2112;
    id v49 = v10;
    __int16 v50 = 1024;
    unsigned int v51 = [v10 statusCode];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ didReceiveResponse: %@, status code: %d",  buf,  0x26u);
  }

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v17));

  [v18 setResponse:v10];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v19,  1LL,  0LL);

  char v20 = (void *)objc_claimAutoreleasedReturnValue([v18 resumableUploadData]);
  BOOL v21 = v20 == 0LL;

  if (!v21)
  {
    [v18 setResumableUploadData:0];
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v22,  2LL,  0LL);
  }

  id v23 = [v18 taskKind];
  clientProxy = self->_clientProxy;
  if (v23 == (id)1)
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 _metrics]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_daemon_currentTransactionMetrics"));
    -[NSXPCProxyCreating backgroundTask:didReceiveResponse:transactionMetrics:]( clientProxy,  "backgroundTask:didReceiveResponse:transactionMetrics:",  v12,  v10,  v26);

    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
    v37[2](v37, 2LL);
  }

  else if (clientProxy)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10002A118;
    void v41[3] = &unk_100079A50;
    v41[4] = self;
    id v36 = v9;
    id v27 = v9;
    id v42 = v27;
    id v28 = v37;
    id v43 = v28;
    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:]( clientProxy,  "remoteObjectProxyWithErrorHandler:",  v41));
    int v30 = (void *)objc_claimAutoreleasedReturnValue([v27 _metrics]);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_daemon_currentTransactionMetrics"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10002A294;
    v38[3] = &unk_1000791F8;
    v38[4] = self;
    id v39 = v27;
    unsigned __int8 v40 = v28;
    [v29 backgroundTask:v12 didReceiveResponse:v10 transactionMetrics:v31 reply:v38];

    id v9 = v36;
  }

  else
  {
    BOOL v32 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      __int16 v45 = v34;
      __int16 v46 = 2114;
      BOOL v47 = v35;
      _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ received data task didReceiveResponse callback and there is no connected clien t. Canceling task.",  buf,  0x16u);
    }

    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v9 error:NSURLErrorDomain code:-997]);
    objc_msgSend(v9, "cancel_with_error:", v33);
    v37[2](v37, 0LL);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v9));
  id v13 = [v12 unsignedIntegerValue];

  identifiersToMonitors = self->_identifiersToMonitors;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToMonitors,  "objectForKeyedSubscript:",  v15));

  if (v16) {
    objc_msgSend(v16, "taskTransferredData:countOfBytesReceived:", 0, objc_msgSend(v10, "length"));
  }
  id v17 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v26 = (id)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    *(_DWORD *)buf = 138544130;
    __int16 v33 = v25;
    __int16 v34 = 2114;
    id v35 = v26;
    __int16 v36 = 2048;
    id v37 = [v9 countOfBytesReceived];
    __int16 v38 = 2048;
    id v39 = [v9 countOfBytesExpectedToReceive];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "NDSession <%{public}@> %{public}@ did receive data (%lld of %lld total bytes)",  buf,  0x2Au);
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100029FCC;
    v29[3] = &unk_100079A50;
    v29[4] = self;
    id v30 = v9;
    id v19 = v11;
    id v31 = v19;
    char v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:]( clientProxy,  "remoteObjectProxyWithErrorHandler:",  v29));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10002A10C;
    v27[3] = &unk_100079768;
    id v28 = v19;
    [v20 backgroundDataTask:v13 didReceiveData:v10 withReply:v27];
  }

  else
  {
    BOOL v21 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v22;
      __int16 v34 = 2114;
      id v35 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ received data and there is no connected client. Canceling task.",  buf,  0x16u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 error:NSURLErrorDomain code:-997]);
    objc_msgSend(v9, "cancel_with_error:", v24);
    v11[2](v11);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    int v24 = 138543618;
    __int16 v25 = v12;
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ became download task",  (uint8_t *)&v24,  0x16u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_tasksToIdentifiers,  "setObject:forKeyedSubscript:",  v14,  v8);

  -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v7);
  identifiersToTasks = self->_identifiersToTasks;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](identifiersToTasks, "setObject:forKeyedSubscript:", v8, v16);

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v18));

  char v20 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadFile]);
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);

  if (v21) {
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v21));
  }
  else {
    BOOL v22 = 0LL;
  }
  [v19 setDownloadFileURL:v22];
  if (v21) {

  }
  if ([v19 taskKind] == (id)2)
  {
    -[NSXPCProxyCreating backgroundDataTaskDidBecomeDownloadTask:]( self->_clientProxy,  "backgroundDataTaskDidBecomeDownloadTask:",  v10);
    [v19 setTaskKind:0];
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v23,  14LL,  0LL);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    *(_DWORD *)buf = 138543874;
    int v24 = v12;
    __int16 v25 = 2114;
    __int16 v26 = v13;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ finished downloading to %@",  buf,  0x20u);
  }

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v15));

  if ([v7 _hasSZExtractor])
  {
    +[NDFileUtilities updateStreamingZipModificationDate:]( &OBJC_CLASS___NDFileUtilities,  "updateStreamingZipModificationDate:",  v8);
    objc_msgSend(v16, "set_updatedStreamingZipModificationDate:", 1);
  }

  id v17 = objc_alloc(&OBJC_CLASS___PendingCallback);
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "response", v16));
  id v19 = v18;
  if (!v18) {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v22[1] = v19;
  char v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  BOOL v21 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v17,  "initWithCallbackType:taskIdentifier:args:",  1LL,  v10,  v20);

  if (!v18) {
  -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->_callbackQueue,  "addPendingCallback:wakeRequirement:",  v21,  0LL);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v9));
  id v11 = [v10 unsignedIntegerValue];

  id v12 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    int v19 = 138544130;
    char v20 = v13;
    __int16 v21 = 2114;
    BOOL v22 = v14;
    __int16 v23 = 2048;
    int64_t v24 = a5;
    __int16 v25 = 2048;
    int64_t v26 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ didResumeAtOffset: %lld expectedTotalBytes: %lld",  (uint8_t *)&v19,  0x2Au);
  }

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v16));

  if ([v17 expectingResumeCallback])
  {
    -[NSXPCProxyCreating backgroundDownloadTask:didResumeAtOffset:expectedTotalBytes:]( self->_clientProxy,  "backgroundDownloadTask:didResumeAtOffset:expectedTotalBytes:",  v11,  a5,  a6);
    [v17 setExpectingResumeCallback:0];
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
    -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v18,  14LL,  0LL);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", a4));
  id v11 = [v17 unsignedIntegerValue];

  identifiersToMonitors = self->_identifiersToMonitors;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](identifiersToMonitors, "objectForKeyedSubscript:", v13));

  if (v18) {
    [v18 taskTransferredData:0 countOfBytesReceived:a5];
  }
  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v15));

  if (![v16 taskKind]) {
    -[NSXPCProxyCreating backgroundDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:]( self->_clientProxy,  "backgroundDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:",  v11,  a5,  a6,  a7);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v42 = a4;
  id v40 = a5;
  id v41 = (void (**)(id, id))a6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v42));
  id v10 = [v9 unsignedIntegerValue];

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v12));

  id v14 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    __int16 v16 = (NSString *)objc_claimAutoreleasedReturnValue([v42 _loggableDescription]);
    clientBundleID = self->_clientBundleID;
    *(_DWORD *)buf = 138543874;
    unsigned int v51 = v15;
    __int16 v52 = 2114;
    v53 = v16;
    __int16 v54 = 2112;
    uint64_t v55 = clientBundleID;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for client %@ _willSendRequestForEstablishedConnection",  buf,  0x20u);
  }

  sub_100035DF4( 1LL,  self->_clientBundleID,  self->_identifier,  self->_monitoredAppBundleID,  self->_secondaryID,  v42,  v13,  0);
  if (![v13 taskKind]) {
    -[NDBackgroundSession ensureSessionDownloadDirectoryExists](self, "ensureSessionDownloadDirectoryExists");
  }
  if (!self->_clientImplementsWillSendRequest
    && (![v13 taskKind]
     || [v13 taskKind] == (id)1 && (objc_msgSend(v13, "shouldCancelOnDisconnect") & 1) == 0))
  {
    id v28 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      *(_DWORD *)buf = 138543362;
      unsigned int v51 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Client does not implement _willSendRequestForEstablishedConnection, so using proposed request",  buf,  0xCu);
    }

- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v9 = [v8 unsignedIntegerValue];

  id v10 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    clientBundleID = self->_clientBundleID;
    int v15 = 138544130;
    __int16 v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    __int16 v19 = 2112;
    char v20 = clientBundleID;
    __int16 v21 = 2048;
    int64_t v22 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for client %@ is waiting for connection - reason: %lld",  (uint8_t *)&v15,  0x2Au);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSURLError,  "errorWithDomain:code:userInfo:",  NSTCPConnectionConditionsUnmetReasonErrorDomain,  a5,  0LL));
  -[NSXPCProxyCreating backgroundTask:hasConnectionWaitingWithError:]( self->_clientProxy,  "backgroundTask:hasConnectionWaitingWithError:",  v9,  v14);
}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    clientBundleID = self->_clientBundleID;
    int v15 = 138544130;
    __int16 v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    __int16 v19 = 2112;
    char v20 = clientBundleID;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ for client %@ conditions changed - satisfied: %d",  (uint8_t *)&v15,  0x26u);
  }

  if (!v5)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 error:@"_nsurlsessiondErrorDomain" code:5]);
    objc_msgSend(v9, "cancel_with_error:", v14);
  }
}

- (void)_URLSession:(id)a3 downloadTask:(id)a4 didReceiveResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v7));
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 _loggableDescription]);
    clientBundleID = self->_clientBundleID;
    int v22 = 138544130;
    id v23 = v12;
    __int16 v24 = 2114;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = clientBundleID;
    __int16 v28 = 1024;
    unsigned int v29 = [v8 statusCode];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ download for client %@ received response, status code: %d",  (uint8_t *)&v22,  0x26u);
  }

  identifiersToTaskInfo = self->_identifiersToTaskInfo;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( identifiersToTaskInfo,  "objectForKeyedSubscript:",  v16));

  [v17 setResponse:v8];
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  -[NDBackgroundSession queueUpdatesForTask:updateType:highPriority:]( self,  "queueUpdatesForTask:updateType:highPriority:",  v18,  1LL,  1LL);

  clientProxy = self->_clientProxy;
  char v20 = (void *)objc_claimAutoreleasedReturnValue([v7 _metrics]);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_daemon_currentTransactionMetrics"));
  -[NSXPCProxyCreating backgroundTask:didReceiveResponse:transactionMetrics:]( clientProxy,  "backgroundTask:didReceiveResponse:transactionMetrics:",  v10,  v8,  v21);
}

- (id)_URLSession:(id)a3 downloadTaskNeedsDownloadDirectory:(id)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](&OBJC_CLASS___Daemon, "sharedDaemon", a3, a4));
  else {
    downloadDirectory = self->_downloadDirectory;
  }
  id v7 = downloadDirectory;

  return v7;
}

- (void)_URLSession:(id)a3 openFileAtPath:(id)a4 mode:(int)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = (NSString *)a4;
  id v12 = a6;
  id v13 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    *(_DWORD *)buf = 138543618;
    __int16 v36 = v14;
    __int16 v37 = 2112;
    __int16 v38 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> Need file descriptor for file at path %@",  buf,  0x16u);
  }

  if (self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes")) {
    goto LABEL_9;
  }
  clientProxy = self->_clientProxy;
  __int16 v16 = (os_log_s *)(id)qword_100083990;
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (clientProxy)
  {
    if (v17)
    {
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      clientBundleID = self->_clientBundleID;
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v26;
      __int16 v37 = 2112;
      __int16 v38 = clientBundleID;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client %@ does not support app wakes, but it is still running. Will attempt to get file d escriptor for download file.",  buf,  0x16u);
    }

LABEL_9:
    unsigned int v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    BOOL v32 = sub_100029D74;
    __int16 v33 = &unk_100079248;
    id v34 = v12;
    id v18 = objc_retainBlock(&v30);
    __int16 v19 = objc_alloc(&OBJC_CLASS___PendingCallback);
    char v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    id v21 = [v18 copy];
    int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v11,  v20,  v21,  0LL,  v30,  v31,  v32,  v33));
    id v23 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v19,  "initWithCallbackType:taskIdentifier:args:",  6LL,  0LL,  v22);

    callbackQueue = self->_callbackQueue;
    if (self->_sendsLaunchEvents)
    {
      if (-[NDApplication supportsWakes](self->_clientApplication, "supportsWakes")) {
        uint64_t v25 = 2LL;
      }
      else {
        uint64_t v25 = 0LL;
      }
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    -[NDCallbackQueue addPendingCallback:wakeRequirement:]( callbackQueue,  "addPendingCallback:wakeRequirement:",  v23,  v25);

    goto LABEL_18;
  }

  if (v17)
  {
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    unsigned int v29 = self->_clientBundleID;
    *(_DWORD *)buf = 138543618;
    __int16 v36 = v28;
    __int16 v37 = 2112;
    __int16 v38 = v29;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> Client %@ does not support app wakes, cannot get file descriptor for download file!",  buf,  0x16u);
  }

  (*((void (**)(id, uint64_t))v12 + 2))(v12, 0xFFFFFFFFLL);
LABEL_18:
}

- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tasksToIdentifiers,  "objectForKeyedSubscript:",  v9));
  id v13 = [v12 unsignedIntegerValue];

  id v14 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = v11;
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
    id v16 = v10;
    id v17 = v9;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
    clientBundleID = self->_clientBundleID;
    BOOL sendsLaunchEvents = self->_sendsLaunchEvents;
    unsigned int v21 = -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes");
    int v22 = "Y";
    *(_DWORD *)buf = 138544386;
    __int16 v49 = 2114;
    __int16 v48 = v15;
    if (sendsLaunchEvents) {
      id v23 = "Y";
    }
    else {
      id v23 = "N";
    }
    __int16 v50 = v18;
    __int16 v51 = 2112;
    if (!v21) {
      int v22 = "N";
    }
    __int16 v52 = clientBundleID;
    __int16 v53 = 2080;
    __int16 v54 = v23;
    __int16 v55 = 2080;
    BOOL v56 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ getAuthHeadersForResponse for %@ _sendsLaunchEvents=%s [_clientApplication supportsWakes]=%s",  buf,  0x34u);

    id v10 = v16;
    id v11 = v40;
    id v9 = v17;
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100029A9C;
    v44[3] = &unk_100079A50;
    v44[4] = self;
    id v25 = v9;
    id v45 = v25;
    id v26 = v11;
    id v46 = v26;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:]( clientProxy,  "remoteObjectProxyWithErrorHandler:",  v44));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100029BF8;
    void v41[3] = &unk_100079270;
    v41[4] = self;
    id v42 = v25;
    id v43 = v26;
    [v27 backgroundTask:v13 getAuthHeadersForResponse:v10 reply:v41];
  }

  else if (self->_sendsLaunchEvents && -[NDApplication supportsWakes](self->_clientApplication, "supportsWakes"))
  {
    __int16 v28 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
      uint64_t v31 = self->_clientBundleID;
      *(_DWORD *)buf = 138543874;
      __int16 v48 = v29;
      __int16 v49 = 2114;
      __int16 v50 = v30;
      __int16 v51 = 2112;
      __int16 v52 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "NDSession <%{public}@> %{public}@ waking %@ for auth headers",  buf,  0x20u);
    }

    BOOL v32 = objc_alloc(&OBJC_CLASS___PendingCallback);
    id v33 = objc_retainBlock(v11);
    id v34 = [v33 copy];
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v34, v10, 0LL));
    __int16 v36 = -[PendingCallback initWithCallbackType:taskIdentifier:args:]( v32,  "initWithCallbackType:taskIdentifier:args:",  10LL,  v13,  v35);

    [v9 _releasePreventIdleSleepAssertionIfAppropriate];
    -[NDCallbackQueue addPendingCallback:wakeRequirement:]( self->_callbackQueue,  "addPendingCallback:wakeRequirement:",  v36,  2LL);
  }

  else
  {
    __int16 v37 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[NDBackgroundSession uuid](self, "uuid"));
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v9 _loggableDescription]);
      *(_DWORD *)buf = 138543618;
      __int16 v48 = v38;
      __int16 v49 = 2114;
      __int16 v50 = v39;
      _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "NDSession <%{public}@> %{public}@ getAuthHeadersForResponse does not have a remote object and does not support a pp wakes, canceling.",  buf,  0x16u);
    }

    (*((void (**)(id, void, void, void))v11 + 2))(v11, 0LL, 0LL, 0LL);
  }
}

- (NDBackgroundSessionDelegate)delegate
{
  return (NDBackgroundSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 264LL, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 280LL, 1);
}

- (NSString)monitoredAppBundleID
{
  return (NSString *)objc_getProperty(self, a2, 288LL, 1);
}

- (NSString)secondaryID
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (id)invalidateReply
{
  return objc_getProperty(self, a2, 304LL, 1);
}

- (void)setInvalidateReply:(id)a3
{
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setSharedContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end