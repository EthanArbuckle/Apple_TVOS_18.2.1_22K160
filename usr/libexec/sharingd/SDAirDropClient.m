@interface SDAirDropClient
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)connectionOverP2P:(__CFData *)a3;
- (BOOL)parseAskResponse:(__CFError *)a3;
- (BOOL)parseDiscoverResponse:(__CFError *)a3;
- (BOOL)receiverDeviceModelNameSuggestsMacPlatform;
- (BOOL)requireAWDL;
- (BOOL)send;
- (BOOL)shouldCancelTransferForError:(id)a3;
- (BOOL)shouldPublishProgress;
- (BOOL)splitOutFileURLs;
- (NSDictionary)discoveryMetrics;
- (NSString)clientBundleID;
- (NSString)personID;
- (SDAirDropClient)initWithPerson:(__SFNode *)a3 items:(id)a4 forDiscovery:(BOOL)a5;
- (SDAirDropClientDelegate)delegate;
- (__SecTrust)secTrustRef;
- (double)getTransferRate;
- (double)getTransferSize;
- (id)askBodyDataInFormat:(int64_t)a3;
- (id)askRequestClientBundleID;
- (id)discoverBodyDataInFormat:(int64_t)a3;
- (id)receiverMediaCapabilities;
- (id)whereFromInfo;
- (int)clientPid;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)activate;
- (void)addHashesAndValidationRecordToRequest:(id)a3;
- (void)addObservers;
- (void)appendFileURL:(id)a3 withBase:(id)a4 toItems:(id)a5;
- (void)bonjourResolverDidChange:(id)a3;
- (void)cancelSendingClassroom;
- (void)convertMediaItemsWithCompletionHandler:(id)a3;
- (void)createSession;
- (void)dealloc;
- (void)didFail:(id)a3;
- (void)didFinishLoading;
- (void)didFinishSendingAskBodyData;
- (void)didStartSendingAskBodyData;
- (void)evaluateReceiverTrust:(__SecTrust *)a3 completion:(id)a4;
- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5;
- (void)finishOperation;
- (void)invalidate;
- (void)logInterfaceUsedForSending:(id)a3;
- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4;
- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4;
- (void)releaseIdleSleepAssertion;
- (void)releasePeerToPeerIfPossible:(id)a3;
- (void)removeFileIconsFromProperties;
- (void)removeObservers;
- (void)resolve;
- (void)retryRequestForError:(id)a3;
- (void)sendRequest:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryMetrics:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setShouldPublishProgress:(BOOL)a3;
- (void)startPublishingProgress;
- (void)startSending;
- (void)startSendingClassroom;
- (void)startZipping;
- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storePropertyValue:(void *)a3 forKey:(__CFString *)a4;
- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)systemWillSleep:(id)a3;
- (void)validateAirDropItemsWithCompletionHandler:(id)a3;
- (void)wirelessPowerChanged:(id)a3;
@end

@implementation SDAirDropClient

- (SDAirDropClient)initWithPerson:(__SFNode *)a3 items:(id)a4 forDiscovery:(BOOL)a5
{
  id v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___SDAirDropClient;
  v10 = -[SDAirDropClient init](&v56, "init");
  v11 = v10;
  if (v10)
  {
    askResponse = v10->_askResponse;
    v10->_askResponse = 0LL;

    askTask = v11->_askTask;
    v11->_askTask = 0LL;

    clientBundleID = v11->_clientBundleID;
    v11->_clientBundleID = 0LL;

    v11->_clientPid = 0;
    connectionKey = v11->_connectionKey;
    v11->_connectionKey = 0LL;

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  0LL));
    conversionProgress = v11->_conversionProgress;
    v11->_conversionProgress = (NSProgress *)v16;

    objc_storeWeak((id *)&v11->_delegate, 0LL);
    v11->_discover = a5;
    discoveryMetrics = v11->_discoveryMetrics;
    v11->_discoveryMetrics = (NSDictionary *)&__NSDictionary0__struct;

    discoverResponse = v11->_discoverResponse;
    v11->_discoverResponse = 0LL;

    discoverTask = v11->_discoverTask;
    v11->_discoverTask = 0LL;

    v11->_failCount = 0;
    v11->_fileIcon = 0LL;
    v21 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    filesToCleanup = v11->_filesToCleanup;
    v11->_filesToCleanup = v21;

    v23 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    fileURLs = v11->_fileURLs;
    v11->_fileURLs = v23;

    v25 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    fileURLToConversionNeeded = v11->_fileURLToConversionNeeded;
    v11->_fileURLToConversionNeeded = v25;

    v27 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    generatedFiles = v11->_generatedFiles;
    v11->_generatedFiles = v27;

    v11->_identity = 0LL;
    objc_storeStrong((id *)&v11->_items, a4);
    v11->_lastEvent = 1LL;
    v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    mediaFormatConversionDestinations = v11->_mediaFormatConversionDestinations;
    v11->_mediaFormatConversionDestinations = v29;

    id AssociatedObject = objc_getAssociatedObject(a3, @"SDAirDropPeerMetric");
    uint64_t v32 = objc_claimAutoreleasedReturnValue(AssociatedObject);
    metric = v11->_metric;
    v11->_metric = (SDAirDropPeerMetric *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v11->_monitor;
    v11->_monitor = (SDStatusMonitor *)v34;

    v36 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    otherStuff = v11->_otherStuff;
    v11->_otherStuff = v36;

    v11->_p2pRetained = 0;
    v11->_person = (__SFNode *)SFNodeCreateCopy(0LL, a3);
    v11->_personAdded = 0;
    v11->_powerAssertionID = 0;
    progress = v11->_progress;
    v11->_progress = 0LL;

    v39 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v11->_properties;
    v11->_properties = v39;

    v11->_providedStream = 0;
    objc_storeStrong((id *)&v11->_queue, &_dispatch_main_q);
    v11->_queueSuspended = 0;
    v41 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    receiverData = v11->_receiverData;
    v11->_receiverData = v41;

    resolver = v11->_resolver;
    v11->_resolver = 0LL;

    serverURL = v11->_serverURL;
    *(_OWORD *)&v11->_serverTrust = 0u;

    v11->_shouldPublishProgress = 1;
    v11->_transactionStarted = 0;
    *(_OWORD *)&v11->_smallFileIcon = 0u;
    v45 = objc_alloc_init(&OBJC_CLASS___NSProgress);
    transferProgress = v11->_transferProgress;
    v11->_transferProgress = v45;

    v11->_uploadFinished = 0;
    uploadResponse = v11->_uploadResponse;
    v11->_uploadResponse = 0LL;

    uploadTask = v11->_uploadTask;
    v11->_uploadTask = 0LL;

    zipper = v11->_zipper;
    v11->_zipper = 0LL;

    v11->_zipperFinished = 0;
    -[SDAirDropClient addObservers](v11, "addObservers");
    v50 = -[SDXPCHelperConnection initWithQueue:]( objc_alloc(&OBJC_CLASS___SDXPCHelperConnection),  "initWithQueue:",  0LL);
    xpcHelperConnection = v11->_xpcHelperConnection;
    v11->_xpcHelperConnection = v50;

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100047450;
    v55[3] = &unk_1005CB2F8;
    v55[4] = v11;
    v52 = v11->_xpcHelperConnection;
    v53 = v11;
    -[SDXPCHelperConnection setInvalidationHandler:](v52, "setInvalidationHandler:", v55);
  }

  return v11;
}

- (void)dealloc
{
  xpcHelperConnection = self->_xpcHelperConnection;
  self->_xpcHelperConnection = 0LL;

  if (self->_shouldPublishProgress) {
    -[NSProgress _unpublish](self->_progress, "_unpublish");
  }
  if (self->_conversionObserver) {
    -[NSProgress removeObserver:forKeyPath:]( self->_conversionProgress,  "removeObserver:forKeyPath:",  self,  @"fractionCompleted");
  }
  -[SDAirDropClient removeObservers](self, "removeObservers");
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  fileIcon = self->_fileIcon;
  if (fileIcon) {
    CFRelease(fileIcon);
  }
  serverTrust = self->_serverTrust;
  if (serverTrust) {
    CFRelease(serverTrust);
  }
  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon) {
    CFRelease(smallFileIcon);
  }
  tmpDirectoryToCleanUp = self->_tmpDirectoryToCleanUp;
  if (tmpDirectoryToCleanUp) {
    sub_100115580(tmpDirectoryToCleanUp);
  }
  CFRelease(self->_person);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAirDropClient;
  -[SDAirDropClient dealloc](&v9, "dealloc");
}

- (void)systemWillSleep:(id)a3
{
  id v4 = sub_100036584(-8, 0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v5);
}

- (void)wirelessPowerChanged:(id)a3
{
  if (!-[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled", a3))
  {
    id v4 = sub_100036584(-7, 0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v5);
  }

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"systemWillSleep:" name:@"com.apple.sharingd.SystemWillSleep" object:0];
  [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (BOOL)requireAWDL
{
  if (-[SDStatusMonitor forceAWDL](self->_monitor, "forceAWDL")) {
    return 1;
  }
  else {
    return !-[SDStatusMonitor browseAllInterfaces](self->_monitor, "browseAllInterfaces");
  }
}

- (void)createSession
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (!sub_1001164C4() && !-[SDStatusMonitor enableDemoMode](self->_monitor, "enableDemoMode"))
  {
    if (-[SDAirDropClient requireAWDL](self, "requireAWDL"))
    {
      id v5 = @"awdl0";
      uint64_t v6 = kCFStreamPropertyBoundInterfaceIdentifier;
    }

    else
    {
      uint64_t v6 = _kCFStreamPropertyProhibitInfraWiFi;
      id v5 = (const __CFString *)&__kCFBooleanTrue;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  _kCFStreamPropertyDNSIncludeAWDL);
  }

  if (!self->_discover) {
    objc_msgSend(v3, "set_sourceApplicationSecondaryIdentifier:", @"com.apple.airdrop");
  }
  objc_msgSend(v3, "set_socketStreamProperties:", v4);
  double v7 = 120.0;
  if (self->_discover) {
    double v7 = 15.0;
  }
  [v3 setTimeoutIntervalForRequest:v7];
  [v3 setRequestCachePolicy:1];
  objc_msgSend(v3, "set_connectionCachePurgeTimeout:", 86400.0);
  [v3 setConnectionProxyDictionary:&__NSDictionary0__struct];
  if (!-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining") && sub_100035FEC())
  {
    [v3 setHTTPMaximumConnectionsPerHost:1];
    [v3 setHTTPShouldUsePipelining:1];
  }

  objc_msgSend(v3, "set_allowsTCPFastOpen:", 0);
  [v3 setTLSMaximumSupportedProtocol:10];
  v12 = @"User-Agent";
  v13 = @"AirDrop/1.0";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  [v3 setHTTPAdditionalHeaders:v8];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v10 = (NSURLSession *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v3,  self,  v9));
  session = self->_session;
  self->_session = v10;
}

- (double)getTransferRate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey));
  id v4 = v3;
  if (v3)
  {
    double v5 = (double)(uint64_t)[v3 longLongValue];
    double v6 = v5 / (CFAbsoluteTimeGetCurrent() - self->_startTime);
  }

  else
  {
    double v6 = -1.0;
  }

  return v6;
}

- (double)getTransferSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey));
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }

  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    uint64_t v3 = airdrop_log(self);
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int powerAssertionID = self->_powerAssertionID;
      *(_DWORD *)buf = 67109120;
      unsigned int v13 = powerAssertionID;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Power assertion released (%d)", buf, 8u);
    }

    unsigned int v6 = self->_powerAssertionID;
    self->_unsigned int powerAssertionID = 0;
    dispatch_time_t v7 = sub_100114580(3.0);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100047B2C;
    block[3] = &unk_1005CBDD8;
    unsigned int v11 = v6;
    dispatch_after(v7, queue, block);
  }

  transaction = self->_transaction;
  self->_transaction = 0LL;
}

- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4
{
  unint64_t lastEvent = self->_lastEvent;
  BOOL v5 = lastEvent > 0xA;
  uint64_t v6 = (1LL << lastEvent) & 0x610;
  if (v5 || v6 == 0)
  {
    unsigned int v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v12 = v11;
    switch(a3)
    {
      case 3LL:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2LL);
          double v13 = 0.0;
          v14 = self;
          uint64_t v15 = 3LL;
          goto LABEL_35;
        }

        break;
      case 4LL:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 4LL);
          -[SDAirDropClient postNotificationForTransferStatus:progress:]( self,  "postNotificationForTransferStatus:progress:",  4LL,  0.0);
        }

        uint64_t v16 = (void *)SFNodeCopyKinds(self->_person);
        else {
          -[SDAirDropClient invalidate](self, "invalidate");
        }

        break;
      case 5LL:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 3LL);
          v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey));
          -[NSProgress setTotalUnitCount:]( self->_transferProgress,  "setTotalUnitCount:",  [v17 longLongValue]);

          transferProgress = self->_transferProgress;
          goto LABEL_38;
        }

        break;
      case 7LL:
        uint64_t v19 = kSFOperationBytesCopiedKey;
        -[SDAirDropClient storePropertyValue:forKey:]( self,  "storePropertyValue:forKey:",  a4,  kSFOperationBytesCopiedKey);
        uint64_t v20 = kSFOperationTimeRemainingKey;
        -[SDAirDropClient storePropertyValue:forKey:]( self,  "storePropertyValue:forKey:",  a4,  kSFOperationTimeRemainingKey);
        if (a4) {
          sub_10003603C((__CFDictionary *)self->_properties, (CFDictionaryRef)a4);
        }
        -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v19));
          -[NSProgress setCompletedUnitCount:]( self->_transferProgress,  "setCompletedUnitCount:",  [v21 longLongValue]);

          LODWORD(v21) = self->_conversionNotified;
          -[NSProgress fractionCompleted](self->_transferProgress, "fractionCompleted");
          double v23 = v22 * 100.0;
          if ((_DWORD)v21) {
            double v23 = v23 * 0.8 + 20.0;
          }
          -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)v23);
          progress = self->_progress;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v20));
          -[NSProgress setUserInfoObject:forKey:]( progress,  "setUserInfoObject:forKey:",  v25,  NSProgressEstimatedTimeRemainingKey);

          double v13 = (double)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
          v14 = self;
          uint64_t v15 = 7LL;
          goto LABEL_35;
        }

        break;
      case 9LL:
        -[SDAirDropClient setSpotlightMetadata:](self, "setSpotlightMetadata:", self->_fileURLs);
        -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", self->_properties);
        if (!self->_discover)
        {
          -[SDAirDropClient donateTransferInteractionToDuet](self, "donateTransferInteractionToDuet");
          clientBundleID = self->_clientBundleID;
          v27 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationReceiverModelNameKey));
          -[SDAirDropClient getTransferRate](self, "getTransferRate");
          double v29 = v28;
          -[SDAirDropClient getTransferSize](self, "getTransferSize");
          double v31 = v30;
          uint64_t v32 = -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel");
          v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFromShareSheet));
          sub_10002EAC4( clientBundleID,  v27,  1,  v32,  (uint64_t)[v33 BOOLValueSafe],  self->_discoveryMetrics,  v29,  v31);

          sub_10002F1DC(1LL, -[NSArray count](self->_items, "count"));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
          [v34 incrementTransfersCompleted];
        }

        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 6LL);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSProgress sf_personRealName](self->_progress, "sf_personRealName"));

          if (v35)
          {
            double v13 = 0.0;
            v14 = self;
            uint64_t v15 = 9LL;
            goto LABEL_35;
          }
        }

        break;
      case 10LL:
        if (!self->_discover)
        {
          v36 = self->_clientBundleID;
          v37 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationReceiverModelNameKey));
          -[SDAirDropClient getTransferSize](self, "getTransferSize");
          double v39 = v38;
          uint64_t v40 = -[SDStatusMonitor discoverableLevel](self->_monitor, "discoverableLevel");
          v41 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFromShareSheet));
          sub_10002EE68( v36,  v37,  1,  (__CFError *)a4,  v40,  [v41 BOOLValueSafe],  self->_discoveryMetrics,  v39);
        }

        uint64_t v42 = airdrop_log(v11);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_10004D268();
        }

        v44 = (const void *)kCFErrorDomainSFOperation;
        CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)a4);
        if (CFEqual(v44, Domain))
        {
          uint64_t v46 = kSFOperationErrorKey;
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  a4,  kSFOperationErrorKey);
        }

        else
        {
          id v47 = sub_100036584(-1, a4);
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          uint64_t v46 = kSFOperationErrorKey;
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v48,  kSFOperationErrorKey);
        }

        -[NSMutableDictionary addEntriesFromDictionary:](v12, "addEntriesFromDictionary:", self->_properties);
        if (self->_shouldPublishProgress)
        {
          v49 = self->_progress;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v46));
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 localizedDescription]);
          -[NSProgress sf_failedWithError:](v49, "sf_failedWithError:", v51);

          -[SDAirDropClient postNotificationForTransferStatus:progress:]( self,  "postNotificationForTransferStatus:progress:",  10LL,  0.0);
        }

        -[SDAirDropClient invalidate](self, "invalidate");
        break;
      case 11LL:
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2LL);
          double v13 = 0.0;
          v14 = self;
          uint64_t v15 = 11LL;
LABEL_35:
          -[SDAirDropClient postNotificationForTransferStatus:progress:]( v14,  "postNotificationForTransferStatus:progress:",  v15,  v13);
        }

        break;
      case 14LL:
        break;
      case 15LL:
        if (self->_shouldPublishProgress)
        {
          -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 1LL);
          transferProgress = self->_progress;
LABEL_38:
          -[NSProgress setCompletedUnitCount:](transferProgress, "setCompletedUnitCount:", 0LL);
        }

        break;
      default:
        -[NSMutableDictionary addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", self->_properties);
        break;
    }

    self->_unint64_t lastEvent = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained airDropClient:self event:a3 withResults:v12];
  }

- (void)didStartSendingAskBodyData
{
  if (-[SDStatusMonitor disableTLS](self->_monitor, "disableTLS")) {
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 3LL, 0LL);
  }
  if (-[NSMutableArray count](self->_fileURLs, "count")
    && !-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining"))
  {
  }

- (void)didFinishSendingAskBodyData
{
  if (!-[NSMutableArray count](self->_fileURLs, "count")) {
    -[SDAirDropClient releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
  }
}

- (id)whereFromInfo
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  double v4 = (void *)SFNodeCopyDisplayName(self->_person);
  BOOL v5 = (void *)SFNodeCopyComputerName(self->_person);
  if (v4) {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  }

  return v3;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  v10 = (void (**)(id, uint64_t))a6;
  uint64_t v11 = (uint64_t)[v9 statusCode];
  uint64_t v12 = v11;
  if (v11 <= 400)
  {
    if (v11 != 200 && v11 != 204)
    {
      if (v11 != 400) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }

    uint64_t v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v9 URL]);
    CFStringRef v16 = CFURLCopyStrictPath(v15, 0LL);

    if (!v16)
    {
      uint64_t v28 = airdrop_log(v17);
      double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10004D328();
      }

LABEL_26:
      NSErrorDomain v24 = NSPOSIXErrorDomain;
      uint64_t v25 = 94LL;
      goto LABEL_27;
    }

    uint64_t v18 = CFEqual(v16, @"Discover");
    if ((_DWORD)v18)
    {
      if (v12 == 200)
      {
        objc_storeStrong((id *)&self->_discoverResponse, a5);
        uint64_t v20 = airdrop_log(v19);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          double v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          LODWORD(v41) = 138412290;
          *(void *)((char *)&v41 + 4) = v22;
          double v23 = "Got Discover response from %@";
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v41, 0xCu);

          goto LABEL_40;
        }

        goto LABEL_40;
      }

      uint64_t v34 = airdrop_log(v18);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10004D3AC();
      }
    }

    else
    {
      uint64_t v31 = CFEqual(v16, @"Ask");
      if ((_DWORD)v31)
      {
        if (v12 == 200)
        {
          -[SDAirDropClient logInterfaceUsedForSending:](self, "logInterfaceUsedForSending:", v9);
          objc_storeStrong((id *)&self->_askResponse, a5);
          uint64_t v33 = airdrop_log(v32);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            double v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
            LODWORD(v41) = 138412290;
            *(void *)((char *)&v41 + 4) = v22;
            double v23 = "Got Ask response from %@";
            goto LABEL_39;
          }

- (void)setProperty:(id)a3 forKey:(id)a4
{
}

- (void)storePropertyValue:(void *)a3 forKey:(__CFString *)a4
{
  CFTypeID v7 = CFGetTypeID(a3);
  if (CFHTTPMessageGetTypeID() == v7)
  {
    v8 = CFHTTPMessageCopyHeaderFieldValue((CFHTTPMessageRef)a3, a4);
    properties = self->_properties;
    if (v8)
    {
      v10 = v8;
      CFStringRef v11 = CFURLCreateStringByReplacingPercentEscapes(0LL, v8, &stru_1005E3958);
      sub_1001146A0((__CFDictionary *)properties, a4, v11);
      CFRelease(v10);
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", 0LL, a4);
    }
  }

  else
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == v7)
    {
      -[SDAirDropClient setProperty:forKey:]( self,  "setProperty:forKey:",  CFDictionaryGetValue((CFDictionaryRef)a3, a4),  a4);
    }

    else
    {
      uint64_t v13 = airdrop_log(TypeID);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10004D3D8();
      }
    }
  }

- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFDataGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    uint64_t v9 = airdrop_log(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004D438();
    }
  }

  else
  {
    -[SDAirDropClient setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }

- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFStringGetTypeID(), v8 = CFGetTypeID(Value), TypeID != v8))
  {
    uint64_t v9 = airdrop_log(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004D498();
    }
  }

  else
  {
    -[SDAirDropClient setProperty:forKey:](self, "setProperty:forKey:", Value, a4);
  }

- (BOOL)parseAskResponse:(__CFError *)a3
{
  CFTypeID v3 = (CFTypeID)a3;
  CFPropertyListRef v5 = CFPropertyListCreateWithData(0LL, (CFDataRef)self->_receiverData, 0LL, 0LL, a3);
  if (v5)
  {
    uint64_t v6 = v5;
    CFTypeID v3 = CFGetTypeID(v5);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    LOBYTE(v3) = v3 == TypeID;
    if ((_BYTE)v3)
    {
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverIconKey);
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverRecordDataKey);
      -[SDAirDropClient storeStringValue:forKey:](self, "storeStringValue:forKey:", v6, kSFOperationReceiverIconHashKey);
      -[SDAirDropClient storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v6,  kSFOperationReceiverModelNameKey);
      -[SDAirDropClient storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v6,  kSFOperationReceiverComputerNameKey);
    }

    else
    {
      uint64_t v16 = airdrop_log(TypeID);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10004D560();
      }
    }

    CFRelease(v6);
  }

  else if (v3)
  {
    uint64_t v8 = airdrop_log(0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004D4F8(v3, v9, v10, v11, v12, v13, v14, v15);
    }

    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)parseDiscoverResponse:(__CFError *)a3
{
  CFTypeID v3 = (CFTypeID)a3;
  CFPropertyListRef v5 = CFPropertyListCreateWithData(0LL, (CFDataRef)self->_receiverData, 0LL, 0LL, a3);
  if (v5)
  {
    uint64_t v6 = v5;
    CFTypeID v3 = CFGetTypeID(v5);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    LOBYTE(v3) = v3 == TypeID;
    if ((_BYTE)v3)
    {
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverRecordDataKey);
      -[SDAirDropClient storeDataValue:forKey:]( self,  "storeDataValue:forKey:",  v6,  kSFOperationReceiverMediaCapabilitiesKey);
      -[SDAirDropClient storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v6,  kSFOperationReceiverModelNameKey);
      -[SDAirDropClient storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v6,  kSFOperationReceiverComputerNameKey);
      -[SDAirDropClient storeDataValue:forKey:]( self,  "storeDataValue:forKey:",  v6,  kSFOperationReceiverDeviceIRKDataKey);
      -[SDAirDropClient storeDataValue:forKey:](self, "storeDataValue:forKey:", v6, kSFOperationReceiverEdPKDataKey);
      -[SDAirDropClient storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v6,  kSFOperationReceiverIDSDeviceIDKey);
      -[SDAirDropClient storeStringValue:forKey:]( self,  "storeStringValue:forKey:",  v6,  kSFOperationSendersKnownAliasKey);
    }

    else
    {
      uint64_t v16 = airdrop_log(TypeID);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10004D560();
      }
    }

    CFRelease(v6);
  }

  else if (v3)
  {
    uint64_t v8 = airdrop_log(0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004D58C(v3, v9, v10, v11, v12, v13, v14, v15);
    }

    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  usleep(0x186A0u);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100048C6C;
  block[3] = &unk_1005CBC20;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)finishOperation
{
  dispatch_queue_global_t v3 = sub_100114658();
  double v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100048D4C;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)retryRequestForError:(id)a3
{
  id v4 = a3;
  int v5 = self->_failCount + 1;
  self->_failCount = v5;
  if (v5 == 10 || self->_cancelled)
  {
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v4);
  }

  else
  {
    double v6 = exp((double)v5);
    dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(v6 * 0.125 * 1000000000.0));
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100049078;
    block[3] = &unk_1005CB2F8;
    void block[4] = self;
    dispatch_after(v7, queue, block);
  }
}

- (void)didFinishLoading
{
  CFTypeRef cf = 0LL;
  if (self->_askResponse)
  {
    if (-[SDAirDropClient parseAskResponse:](self, "parseAskResponse:", &cf))
    {
      -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 6LL, 0LL);
      if (-[NSMutableArray count](self->_fileURLs, "count"))
      {
        if (-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining") || !sub_100035FEC())
        {
          -[SDAirDropClient startZipping](self, "startZipping");
        }

        else if (!self->_zipperFinished)
        {
          self->_startTime = CFAbsoluteTimeGetCurrent();
          -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 5LL, 0LL);
        }
      }

      else
      {
        -[SDAirDropClient finishOperation](self, "finishOperation");
      }
    }

    else
    {
      -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", cf);
      CFRelease(cf);
    }

    askResponse = self->_askResponse;
    self->_askResponse = 0LL;
    goto LABEL_21;
  }

  if (self->_discoverResponse)
  {
    if (-[SDAirDropClient parseDiscoverResponse:](self, "parseDiscoverResponse:", &cf))
    {
      -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 9LL, 0LL);
    }

    else
    {
      -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", cf);
      CFRelease(cf);
    }

    askResponse = self->_discoverResponse;
    self->_discoverResponse = 0LL;
LABEL_21:

    return;
  }

  if (self->_uploadResponse)
  {
    self->_uploadFinished = 1;
    if (self->_zipperFinished)
    {
      if (self->_startTime == 0.0) {
        -[SDAirDropClient finishOperation](self, "finishOperation");
      }
      else {
        -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 9LL, 0LL);
      }
    }

    uploadResponse = self->_uploadResponse;
    self->_uploadResponse = 0LL;
  }

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  if (-[NSMutableData length](self->_receiverData, "length") > 0x100000)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  27LL,  0LL));
    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v6);
  }

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v13 = a3;
  id v12 = (NSURLSessionUploadTask *)a4;
  if (self->_askTask == v12)
  {
    if (a5 == a6)
    {
      -[SDAirDropClient didStartSendingAskBodyData](self, "didStartSendingAskBodyData");
    }

    else if (a6 >= a7)
    {
      -[SDAirDropClient didFinishSendingAskBodyData](self, "didFinishSendingAskBodyData");
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    if ([v11 isEqual:NSURLErrorDomain])
    {
      id v12 = [v10 code];

      if (v12 == (id)-999LL) {
        goto LABEL_8;
      }
    }

    else
    {
    }

    -[SDAirDropClient didFail:](self, "didFail:", v10);
  }

  else
  {
    -[SDAirDropClient didFinishLoading](self, "didFinishLoading");
  }

- (BOOL)shouldCancelTransferForError:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 code];
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);

  if ([v5 isEqual:kCFErrorDomainCFNetwork])
  {
    BOOL v6 = v4 == 303 || v4 == -1017LL;
    goto LABEL_7;
  }

  if ([v5 isEqual:NSURLErrorDomain])
  {
    BOOL v6 = (v4 & 0xFFFFFFFFFFFFFFEFLL) == -1021LL;
LABEL_7:
    BOOL v7 = v6;
    goto LABEL_13;
  }

  unsigned __int8 v8 = [v5 isEqual:NSPOSIXErrorDomain];
  if (v4 == 54) {
    BOOL v7 = v8;
  }
  else {
    BOOL v7 = 0;
  }
LABEL_13:

  return v7;
}

- (void)didFail:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SFNodeCopyServiceName(self->_person);
  BOOL v6 = (void *)v5;
  if (self->_discover
    || (uint64_t v5 = -[SDAirDropClient shouldCancelTransferForError:](self, "shouldCancelTransferForError:", v4), !(_DWORD)v5))
  {
    uint64_t v9 = airdrop_log(v5);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004D5F4();
    }

    if (self->_discover)
    {
      -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", v4);
      goto LABEL_20;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if (([v11 isEqual:kCFErrorDomainCFNetwork] & 1) != 0
      || [v11 isEqual:NSURLErrorDomain])
    {
      id v12 = [v4 code];
      if (v12 == (id)-1004LL)
      {
        -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", v4);
        goto LABEL_19;
      }

      if (v12 == (id)-1202LL)
      {
        id v13 = (void *)SFNodeCopySecondaryName(self->_person);
        if (!v13) {
          id v13 = (void *)SFNodeCopyDisplayName(self->_person);
        }
        id v14 = sub_100036584(-3, v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v15);

        goto LABEL_19;
      }
    }

    -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10LL, v4);
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v7 = airdrop_log(v5);
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Connection to %@ canceled (%@)",  (uint8_t *)&v16,  0x16u);
  }

  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 4LL, 0LL);
LABEL_20:
}

- (void)evaluateReceiverTrust:(__SecTrust *)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    uint64_t v7 = (void *)SFNodeCopyAppleID(self->_person);
    if (v7 && (unsigned __int8 v8 = sub_100035290(a3)) != 0LL)
    {
      uint64_t v9 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor verifiedIdentityForAppleID:](self->_monitor, "verifiedIdentityForAppleID:", v7));
      queue = self->_queue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100049870;
      v12[3] = &unk_1005CBE00;
      id v13 = v6;
      sub_100171DFC(v9, v10, queue, v12);
    }

    else
    {
      (*((void (**)(id, BOOL))v6 + 2))(v6, v7 == 0LL);
    }
  }
}

- (BOOL)connectionOverP2P:(__CFData *)a3
{
  BytePtr = CFDataGetBytePtr(a3);
  if (BytePtr[1] != 30)
  {
    uint64_t v12 = airdrop_log(BytePtr);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
      int v16 = 138412290;
      uint64_t v17 = v13;
      id v14 = "AirDrop sending to %@ over IPv4";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    }

- (void)releasePeerToPeerIfPossible:(id)a3
{
  id v4 = a3;
  if (self->_p2pRetained)
  {
    id v6 = v4;
    unsigned int v5 = (const void *)CFURLResponseCopyPeerAddress([v4 _CFURLResponse]);
    id v4 = v6;
    if (v5)
    {
      if (!-[SDAirDropClient connectionOverP2P:](self, "connectionOverP2P:", v5))
      {
        sub_100114664();
        self->_p2pRetained = 0;
      }

      CFRelease(v5);
      id v4 = v6;
    }
  }
}

- (void)logInterfaceUsedForSending:(id)a3
{
  uint64_t v4 = CFURLResponseCopyPeerAddress([a3 _CFURLResponse]);
  if (v4)
  {
    unsigned int v5 = (const void *)v4;
    -[SDAirDropClient connectionOverP2P:](self, "connectionOverP2P:", v4);
    CFRelease(v5);
  }

- (__SecTrust)secTrustRef
{
  return self->_serverTrust;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6 = a5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionMetrics]);
  id v8 = [v7 count];

  if (v8 != (id)1)
  {
    uint64_t v10 = airdrop_log(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v31 = 134217984;
      id v32 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "NSURLSessionTaskTransactionMetrics count %lu is not expected, expecting 1",  (uint8_t *)&v31,  0xCu);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 transactionMetrics]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _remoteAddressAndPort]);
    if (v14)
    {
    }

    else
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 _localAddressAndPort]);

      if (!v16)
      {
LABEL_12:
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v13 secureConnectionStartDate]);
        double v23 = (void *)objc_claimAutoreleasedReturnValue([v13 fetchStartDate]);
        [v22 timeIntervalSinceDate:v23];
        NSErrorDomain v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        -[SDAirDropPeerMetric setTcpConnectionComplete:](self->_metric, "setTcpConnectionComplete:", v24);

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 secureConnectionEndDate]);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v13 secureConnectionStartDate]);
        [v25 timeIntervalSinceDate:v26];
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        -[SDAirDropPeerMetric setTlsHandshakeComplete:](self->_metric, "setTlsHandshakeComplete:", v27);

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v13 responseEndDate]);
        double v29 = (void *)objc_claimAutoreleasedReturnValue([v13 secureConnectionEndDate]);
        [v28 timeIntervalSinceDate:v29];
        double v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        -[SDAirDropPeerMetric setIdentityQueryComplete:](self->_metric, "setIdentityQueryComplete:", v30);

        goto LABEL_13;
      }
    }

    uint64_t v17 = airdrop_log(v15);
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v13 _localAddressAndPort]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 _remoteAddressAndPort]);
      int v31 = 138412802;
      id v32 = v19;
      __int16 v33 = 2112;
      uint64_t v34 = v20;
      __int16 v35 = 2112;
      uint64_t v36 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Connected to %@ from [%@] => [%@]",  (uint8_t *)&v31,  0x20u);
    }

    goto LABEL_12;
  }

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 protectionSpace]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 authenticationMethod]);
  if ([v9 isEqual:NSURLAuthenticationMethodServerTrust])
  {
    id v10 = [v8 serverTrust];
    if (v10)
    {
      serverTrust = self->_serverTrust;
      if (serverTrust) {
        CFRelease(serverTrust);
      }
      self->_serverTrust = (__SecTrust *)CFRetain(v10);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10004A1A4;
    v29[3] = &unk_1005CBE28;
    v29[4] = self;
    id v30 = v7;
    id v31 = v10;
    -[SDAirDropClient evaluateReceiverTrust:completion:](self, "evaluateReceiverTrust:completion:", v10, v29);

    goto LABEL_21;
  }

  id v12 = [v9 isEqual:NSURLAuthenticationMethodClientCertificate];
  if ((_DWORD)v12)
  {
    if (self->_identity)
    {
      id v13 = -[SDStatusMonitor copyMyAppleIDIntermediateCertificate]( self->_monitor,  "copyMyAppleIDIntermediateCertificate");
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = airdrop_log(v13);
        int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "SDAirDropClient: sending client certificate to %@",  buf,  0xCu);
        }

        identity = self->_identity;
        id v32 = v14;
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLCredential credentialWithIdentity:certificates:persistence:]( &OBJC_CLASS___NSURLCredential,  "credentialWithIdentity:certificates:persistence:",  identity,  v19,  1LL));

        (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v20);
        CFRelease(v14);

        goto LABEL_21;
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleID](self->_monitor, "myAppleID"));
      SFMetricsLogUnexpectedEvent(7LL, 0LL, v26);

      uint64_t v28 = airdrop_log(v27);
      NSErrorDomain v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10004D6F0(self, v24);
      }
    }

    else
    {
      uint64_t v23 = airdrop_log(v12);
      NSErrorDomain v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "SDAirDropClient: identity not available. Sending to %@ with no Apple ID certificate",  buf,  0xCu);
      }
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    goto LABEL_21;
  }

  uint64_t v21 = airdrop_log(v12);
  double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10004D770();
  }

  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 3LL, 0LL);
LABEL_21:
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (NSURLSessionUploadTask *)a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void))v10;
  if (self->_providedStream) {
    goto LABEL_6;
  }
  if (self->_uploadTask != v9)
  {
    uint64_t v12 = airdrop_log(v10);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SDAirDropClient: needNewBodyStream invoked for task %@",  (uint8_t *)&v16,  0xCu);
    }

    goto LABEL_6;
  }

  zipper = self->_zipper;
  if (!zipper)
  {
LABEL_6:
    v11[2](v11, 0LL);
    goto LABEL_7;
  }

  uint64_t v15 = -[SDAirDropFileZipper copyReadStream](zipper, "copyReadStream");
  self->_providedStream = 1;
  ((void (**)(void, __CFReadStream *))v11)[2](v11, v15);
  if (v15) {
    CFRelease(v15);
  }
LABEL_7:
}

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5
{
  id v8 = a3;
  uint64_t v9 = v8;
  switch(a4)
  {
    case 5LL:
      id v14 = v8;
      -[SDAirDropClient storePropertyValue:forKey:](self, "storePropertyValue:forKey:", a5, kSFOperationTotalBytesKey);
      -[SDAirDropClient sendRequest:](self, "sendRequest:", @"Upload");
      if (-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining")
        || (v10 = sub_100035FEC(), uint64_t v9 = v14, (v10 & 1) == 0))
      {
        self->_startTime = CFAbsoluteTimeGetCurrent();
        uint64_t v11 = self;
        uint64_t v12 = 5LL;
        id v13 = 0LL;
        goto LABEL_12;
      }

      break;
    case 7LL:
      if (self->_startTime != 0.0)
      {
        uint64_t v11 = self;
        uint64_t v12 = 7LL;
        goto LABEL_11;
      }

      break;
    case 9LL:
      id v14 = v8;
      self->_zipperFinished = 1;
      if (self->_uploadFinished)
      {
        if (self->_startTime == 0.0) {
          -[SDAirDropClient finishOperation](self, "finishOperation");
        }
        else {
          -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 9LL, a5);
        }
      }

      -[SDAirDropClient releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
      goto LABEL_15;
    case 10LL:
      uint64_t v11 = self;
      uint64_t v12 = 10LL;
LABEL_11:
      id v13 = a5;
      id v14 = v9;
LABEL_12:
      -[SDAirDropClient notifyClientForEvent:withProperty:](v11, "notifyClientForEvent:withProperty:", v12, v13);
LABEL_15:
      uint64_t v9 = v14;
      break;
    default:
      break;
  }
}

- (void)bonjourResolverDidChange:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 error];
  if (v5 == -65568)
  {
    NSErrorDomain v30 = NSPOSIXErrorDomain;
    uint64_t v31 = 60LL;
  }

  else
  {
    if (!v5)
    {
      id v6 = (NSURL *)objc_claimAutoreleasedReturnValue([v4 url]);
      serverURL = self->_serverURL;
      self->_serverURL = v6;

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL host](self->_serverURL, "host"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL port](self->_serverURL, "port"));
      char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@:%@]",  v8,  v9));

      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropPeerMetric bonjourResolveComplete](self->_metric, "bonjourResolveComplete"));
      [v12 doubleValue];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current - v13));
      -[SDAirDropPeerMetric setBonjourResolveComplete:](self->_metric, "setBonjourResolveComplete:", v14);

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropPeerMetric bonjourResolveComplete](self->_metric, "bonjourResolveComplete"));
      [v15 doubleValue];
      double v17 = v16;

      uint64_t v19 = airdrop_log(v18);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
        *(_DWORD *)buf = 138412546;
        __int16 v35 = v21;
        __int16 v36 = 1024;
        LODWORD(v37) = (int)(v17 * 1000.0);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Bonjour resolved %@ in %d ms", buf, 0x12u);
      }

      uint64_t v23 = airdrop_log(v22);
      NSErrorDomain v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_discover) {
          uint64_t v25 = "Connecting to";
        }
        else {
          uint64_t v25 = "Sending to";
        }
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
        *(_DWORD *)buf = 136315650;
        __int16 v35 = v25;
        __int16 v36 = 2112;
        uint64_t v37 = v26;
        __int16 v38 = 2112;
        uint64_t v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s %@ at %@", buf, 0x20u);
      }

      uint64_t v27 = &off_1005CB6E0;
      if (!self->_discover) {
        uint64_t v27 = &off_1005CB6D0;
      }
      -[SDAirDropClient sendRequest:](self, "sendRequest:", *v27);
      resolver = self->_resolver;
      if (resolver)
      {
        -[SDBonjourResolver setDelegate:](resolver, "setDelegate:", 0LL);
        -[SDBonjourResolver cancel](self->_resolver, "cancel");
        double v29 = self->_resolver;
        self->_resolver = 0LL;
      }

      goto LABEL_19;
    }

    NSErrorDomain v30 = NSOSStatusErrorDomain;
    uint64_t v31 = v5;
  }

  char v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  v31,  0LL));
  uint64_t v32 = airdrop_log(v10);
  __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_10004D8E0(v4, (uint64_t)v10, v33);
  }

  -[SDAirDropClient retryRequestForError:](self, "retryRequestForError:", v10);
LABEL_19:
}

- (void)addHashesAndValidationRecordToRequest:(id)a3
{
  id v7 = a3;
  id v4 = -[SDStatusMonitor copyMyAppleIDSecIdentity](self->_monitor, "copyMyAppleIDSecIdentity");
  self->_identity = v4;
  if (v4)
  {
    signed int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDValidationRecord](self->_monitor, "myAppleIDValidationRecord"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"]);
    if (v6) {
      [v7 setObject:v6 forKeyedSubscript:kSFOperationSenderRecordDataKey];
    }
  }
}

- (id)askRequestClientBundleID
{
  v2 = self->_clientBundleID;
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", @"com.apple.Passwords.remoteservice"))
  {

    uint64_t v4 = airdrop_log(v3);
    signed int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = @"com.apple.Preferences";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Ask request sender bundle ID: %@",  (uint8_t *)&v7,  0xCu);
    }

    v2 = @"com.apple.Preferences";
  }

  return v2;
}

- (id)askBodyDataInFormat:(int64_t)a3
{
  signed int v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[SDAirDropClient addHashesAndValidationRecordToRequest:](self, "addHashesAndValidationRecordToRequest:", v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  self->_otherStuff,  kSFOperationItemsKey);
  uint64_t v6 = kSFOperationFilesKey;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFilesKey));
  if (v7) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, v6);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor modelName](self->_monitor, "modelName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v8,  kSFOperationSenderModelNameKey);

  uint64_t v9 = kSFOperationItemsDescriptionKey;
  char v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsDescriptionKey));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient askRequestClientBundleID](self, "askRequestClientBundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, kSFOperationBundleIDKey);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor someComputerName](self->_monitor, "someComputerName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v12,  kSFOperationSenderComputerNameKey);

  double v13 = (__CFString *)sub_100033FB8(0LL, 0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, kSFOperationSenderIDKey);

  if (v10) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, v9);
  }
  fileIcon = self->_fileIcon;
  if (fileIcon)
  {
    uint64_t v15 = sub_10008E058(fileIcon, 0LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v15,  kSFOperationFileIconKey);
  }

  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon)
  {
    double v17 = sub_10008E058(smallFileIcon, 0LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v17,  kSFOperationSmallFileIconKey);
  }

  uint64_t v18 = kSFOperationConvertMediaFormatsKey;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationConvertMediaFormatsKey));
  if (v19) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, v18);
  }
  CFDataRef Data = CFPropertyListCreateData(0LL, v5, (CFPropertyListFormat)a3, 0LL, 0LL);

  return Data;
}

- (id)discoverBodyDataInFormat:(int64_t)a3
{
  signed int v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[SDAirDropClient addHashesAndValidationRecordToRequest:](self, "addHashesAndValidationRecordToRequest:", v5);
  CFDataRef Data = CFPropertyListCreateData(0LL, v5, (CFPropertyListFormat)a3, 0LL, 0LL);

  return Data;
}

- (void)sendRequest:(id)a3
{
  id v4 = a3;
  signed int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( self->_serverURL,  "URLByAppendingPathComponent:isDirectory:",  v4,  0LL));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v6));
  [v7 setHTTPMethod:@"POST"];
  if ([v4 isEqual:@"Discover"])
  {
    unsigned int v8 = -[SDStatusMonitor enableXML](self->_monitor, "enableXML");
    if (v8) {
      uint64_t v9 = 100LL;
    }
    else {
      uint64_t v9 = 200LL;
    }
    char v10 = off_1005CEA58;
    if (!v8) {
      char v10 = off_1005CEA50;
    }
    [v7 setValue:*v10 forHTTPHeaderField:@"Content-Type"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SDAirDropClient discoverBodyDataInFormat:](self, "discoverBodyDataInFormat:", v9));

    [v7 setValue:@"close" forHTTPHeaderField:@"Connection"];
    goto LABEL_18;
  }

  if ([v4 isEqual:@"Ask"])
  {
    if (-[SDStatusMonitor enableXML](self->_monitor, "enableXML"))
    {
      [v7 setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
      uint64_t v12 = self;
      uint64_t v13 = 100LL;
    }

    else
    {
      [v7 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
      uint64_t v12 = self;
      uint64_t v13 = 200LL;
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SDAirDropClient askBodyDataInFormat:](v12, "askBodyDataInFormat:", v13));

LABEL_18:
    signed int v5 = (void *)v11;
    goto LABEL_19;
  }

  if ([v4 isEqual:@"Upload"])
  {
    uint64_t v14 = kSFOperationTotalBytesKey;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationTotalBytesKey));
    double v16 = v15;
    if (v15)
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
      [v7 setValue:v17 forHTTPHeaderField:v14];
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropFileZipper zipCompressionType](self->_zipper, "zipCompressionType"));
    if ([v18 isEqualToString:@"pkzip"])
    {
      uint64_t v19 = off_1005CEA38;
    }

    else if ([v18 isEqualToString:@"dvzip"])
    {
      uint64_t v19 = off_1005CEA48;
    }

    else
    {
      id v28 = [v18 isEqualToString:@"gzip"];
      if (!(_DWORD)v28)
      {
        uint64_t v29 = airdrop_log(v28);
        NSErrorDomain v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          sub_10004D98C();
        }
      }

      uint64_t v19 = off_1005CEA40;
    }

    [v7 setValue:*v19 forHTTPHeaderField:@"Content-Type"];
    if (-[SDStatusMonitor disablePipelining](self->_monitor, "disablePipelining") || (sub_100035FEC() & 1) == 0) {
      [v7 setValue:@"100-continue" forHTTPHeaderField:@"Expect"];
    }
    [v7 setValue:@"close" forHTTPHeaderField:@"Connection"];
  }

- (void)startZipping
{
  if (!self->_zipper)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SDAirDropFileZipper);
    zipper = self->_zipper;
    self->_zipper = v3;

    __int128 v5 = *(_OWORD *)&self->_auditToken.val[4];
    v6[0] = *(_OWORD *)self->_auditToken.val;
    v6[1] = v5;
    -[SDAirDropFileZipper setAuditToken:](self->_zipper, "setAuditToken:", v6);
    -[SDAirDropFileZipper setSkipReadableCheckFiles:]( self->_zipper,  "setSkipReadableCheckFiles:",  self->_generatedFiles);
    -[SDAirDropFileZipper setDisableAdaptiveCompressionForZipping:]( self->_zipper,  "setDisableAdaptiveCompressionForZipping:",  !self->_receiverSupportsDVZip);
    -[SDAirDropFileZipper setSourceFiles:](self->_zipper, "setSourceFiles:", self->_fileURLs);
    -[SDAirDropFileZipper setClientPid:](self->_zipper, "setClientPid:", self->_clientPid);
    -[SDAirDropFileZipper setDelegate:](self->_zipper, "setDelegate:", self);
    -[SDAirDropFileZipper zip](self->_zipper, "zip");
  }

- (BOOL)splitOutFileURLs
{
  unint64_t v3 = sub_100035F8C();
  __int128 v5 = (void *)SFNodeCopyRealName(self->_person, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SDAirDropLegacyHelper preprocessItems:forClientBundleID:receiverIdentifier:receiverSupportsURLs:receiverIsUnknown:]( &OBJC_CLASS___SDAirDropLegacyHelper,  "preprocessItems:forClientBundleID:receiverIdentifier:receiverSupportsURLs:receiverIsUnknown:",  self->_items,  self->_clientBundleID,  v5,  v3,  0LL));
  if ([v6 success])
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 files]);

    if (v7)
    {
      fileURLs = self->_fileURLs;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 files]);
      -[NSMutableArray addObjectsFromArray:](fileURLs, "addObjectsFromArray:", v9);
    }

    char v10 = (void *)objc_claimAutoreleasedReturnValue([v6 otherStuff]);

    if (v10)
    {
      otherStuff = self->_otherStuff;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 otherStuff]);
      -[NSMutableArray addObjectsFromArray:](otherStuff, "addObjectsFromArray:", v12);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 filesToCleanup]);

    if (v13)
    {
      filesToCleanup = self->_filesToCleanup;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 filesToCleanup]);
      -[NSMutableArray addObjectsFromArray:](filesToCleanup, "addObjectsFromArray:", v15);
    }
  }

  unsigned __int8 v16 = [v6 success];

  return v16;
}

- (void)validateAirDropItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = -[NSArray count](self->_items, "count");
  if (v5 && self->_items)
  {
    uint64_t v6 = airdrop_log(v5);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSUInteger v8 = -[NSArray count](self->_items, "count");
      items = self->_items;
      *(_DWORD *)buf = 134218242;
      NSUInteger v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = items;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Validating %lu items to send: %@", buf, 0x16u);
    }
  }

  else
  {
    uint64_t v10 = airdrop_log(v5);
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10004D9F8();
    }
  }

  if (-[NSMutableArray count](self->_fileURLs, "count"))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004B4D8;
    v13[3] = &unk_1005CB830;
    v13[4] = self;
    id v14 = v4;
    -[SDAirDropClient convertMediaItemsWithCompletionHandler:](self, "convertMediaItemsWithCompletionHandler:", v13);
  }

  else if (-[NSMutableArray count](self->_otherStuff, "count"))
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0LL);
  }

  else
  {
    id v11 = sub_100036584(-4, 0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

- (void)appendFileURL:(id)a3 withBase:(id)a4 toItems:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (const __CFURL *)a4;
  id v10 = a5;
  id v34 = 0LL;
  id v33 = 0LL;
  unsigned int v11 = [v8 getResourceValue:&v34 forKey:NSURLNameKey error:&v33];
  id v12 = v34;
  id v13 = v33;
  id v14 = v13;
  if (v11)
  {
    uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    NSUInteger v16 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1001144B0((const __CFURL *)v8));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v17,  kSFOperationFileIsDirectoryKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v12,  kSFOperationFileNameKey);
    id v32 = 0LL;
    id v31 = 0LL;
    unsigned int v18 = [v8 getResourceValue:&v32 forKey:NSURLTypeIdentifierKey error:&v31];
    uint64_t v19 = (__CFString *)v32;
    id v20 = v31;

    if (v18)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v19,  kSFOperationFileTypeKey);
      if ((-[__CFString isEqual:](v19, "isEqual:", kUTTypeLivePhoto) & 1) != 0
        || UTTypeConformsTo(v19, kUTTypeLivePhoto))
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  @"public.heic",  kSFOperationtFileSubTypeKey);
      }
    }

    else
    {
      uint64_t v23 = airdrop_log(v21);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10004DA84();
      }
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_fileURLToConversionNeeded,  "objectForKeyedSubscript:",  v8));
    uint64_t v26 = (void *)v25;
    if (v25) {
      uint64_t v27 = (void *)v25;
    }
    else {
      uint64_t v27 = &__kCFBooleanFalse;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v27,  kSFOperationConvertMediaFormatsKey);

    id v28 = sub_1001149DC(v8, v9);
    if (v28)
    {
      uint64_t v29 = v28;
      NSErrorDomain v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v28));
      if (v30) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v30,  kSFOperationFileBomPathKey);
      }
      free(v29);
    }

    [v10 addObject:v15];
  }

  else
  {
    uint64_t v22 = airdrop_log(v13);
    uint64_t v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_10004DAE4();
    }
    id v20 = v14;
  }
}

- (void)removeFileIconsFromProperties
{
  uint64_t v3 = kSFOperationFileIconKey;
  id v4 = (CGImage *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFileIconKey));
  self->_fileIcon = v4;

  uint64_t v5 = kSFOperationSmallFileIconKey;
  uint64_t v6 = (CGImage *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSmallFileIconKey));
  self->_smallFileIcon = v6;

  fileIcon = self->_fileIcon;
  if (fileIcon)
  {
    CFRetain(fileIcon);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0LL, v3);
  }

  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon)
  {
    CFRetain(smallFileIcon);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", 0LL, v5);
  }

- (void)startPublishingProgress
{
  if (!self->_progress)
  {
    if (self->_clientBundleID)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));

      if (v3)
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
        if (v4)
        {
          id location = 0LL;
          objc_initWeak(&location, self);
          uint64_t v5 = objc_alloc(&OBJC_CLASS___NSProgress);
          clientBundleID = self->_clientBundleID;
          int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          id v8 = (NSProgress *)objc_claimAutoreleasedReturnValue( -[NSProgress sf_initWithAppBundle:sessionID:andPersonRealName:]( v5,  "sf_initWithAppBundle:sessionID:andPersonRealName:",  clientBundleID,  v4,  v7));
          progress = self->_progress;
          self->_progress = v8;

          -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 100LL);
          id v12 = _NSConcreteStackBlock;
          uint64_t v13 = 3221225472LL;
          id v14 = sub_10004BD04;
          uint64_t v15 = &unk_1005CB220;
          objc_copyWeak(&v16, &location);
          -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", &v12);
          -[NSProgress _publish](self->_progress, "_publish", v12, v13, v14, v15);
          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }

        else
        {
          uint64_t v10 = airdrop_log(0LL);
          unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_10004DB44();
          }
        }
      }
    }
  }

- (void)startSendingClassroom
{
  fileIcon = self->_fileIcon;
  properties = self->_properties;
  uint64_t v5 = kSFOperationFileIconKey;
  if (fileIcon)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( properties,  "setObject:forKeyedSubscript:",  fileIcon,  kSFOperationFileIconKey);
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( properties,  "objectForKeyedSubscript:",  kSFOperationFileIconKey));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v6, v5);
  }

  uint64_t v7 = kSFOperationSessionIDKey;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
  if (v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v8, v7);
  }

  else
  {
    uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSUUID);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v9, "UUIDString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v10, v7);
  }

  id v11 = -[NSMutableArray count](self->_otherStuff, "count");
  uint64_t v12 = 22LL;
  if (!v11) {
    uint64_t v12 = 13LL;
  }
  uint64_t v13 = (&self->super.isa)[v12];
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[SDClassroomBrowser sharedBrowser](&OBJC_CLASS___SDClassroomBrowser, "sharedBrowser"));
  id v14 = self->_properties;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
  clientBundleID = self->_clientBundleID;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v18 startSendingItems:v13 withProperties:v14 toPersonWithID:v15 clientBundleID:clientBundleID airDropClientDelegate:WeakRetained];
}

- (void)cancelSendingClassroom
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDClassroomBrowser sharedBrowser](&OBJC_CLASS___SDClassroomBrowser, "sharedBrowser"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
  [v3 cancelSendingItemsToPersonWithID:v4 sessionID:v5 clientBundleID:self->_clientBundleID];
}

- (void)startSending
{
  uint64_t v3 = (void *)SFNodeCopyKinds(self->_person);
  unsigned __int8 v4 = [v3 containsObject:kSFNodeKindClassroom];
  unsigned __int8 v5 = v4;
  if (!self->_shouldPublishProgress || (v4 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained startProgress];
  }

  else
  {
    -[SDAirDropClient startPublishingProgress](self, "startPublishingProgress");
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004BFF0;
  v7[3] = &unk_1005CBE50;
  v7[4] = self;
  unsigned __int8 v8 = v5;
  -[SDAirDropClient validateAirDropItemsWithCompletionHandler:](self, "validateAirDropItemsWithCompletionHandler:", v7);
}

- (void)activate
{
  if (self->_discover)
  {
    -[SDAirDropClient resolve](self, "resolve");
  }

  else
  {
    BOOL v3 = -[SDAirDropClient splitOutFileURLs](self, "splitOutFileURLs");
    if (v3)
    {
      if (-[NSMutableArray count](self->_fileURLs, "count"))
      {
        unsigned __int8 v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_fileURLs, "count"));
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        unsigned __int8 v5 = self->_fileURLs;
        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            for (i = 0LL; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileAccessIntent readingIntentWithURL:options:]( &OBJC_CLASS___NSFileAccessIntent,  "readingIntentWithURL:options:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)i),  131074LL));
              -[NSMutableArray addObject:](v4, "addObject:", v10);
            }

            id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v23,  v29,  16LL);
          }

          while (v7);
        }

        uint64_t v12 = airdrop_log(v11);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropClient personID](self, "personID"));
          *(_DWORD *)buf = 138412290;
          id v28 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Starting file coordination for %@",  buf,  0xCu);
        }

        uint64_t v15 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  0LL);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10004C694;
        v20[3] = &unk_1005CBE78;
        uint64_t v21 = v4;
        uint64_t v22 = self;
        __int16 v17 = v4;
        -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:]( v15,  "coordinateAccessWithIntents:queue:byAccessor:",  v17,  v16,  v20);
      }

      else
      {
        -[SDAirDropClient startSending](self, "startSending");
      }
    }

    else
    {
      uint64_t v18 = airdrop_log(v3);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10004DBE4();
      }
    }
  }

- (void)resolve
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v9 = (id)SFNodeCopyDomain(self->_person);
    unsigned __int8 v4 = (void *)SFNodeCopyServiceName(self->_person);
    unsigned __int8 v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[SDAirDropPeerMetric setBonjourResolveComplete:](self->_metric, "setBonjourResolveComplete:", v6);

    id v7 = -[SDBonjourResolver initWithName:type:domain:path:timeout:]( objc_alloc(&OBJC_CLASS___SDBonjourResolver),  "initWithName:type:domain:path:timeout:",  v4,  sub_10008E590(),  v9,  0LL,  1LL);
    resolver = self->_resolver;
    self->_resolver = v7;

    -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", self);
    -[SDBonjourResolver resolve](self->_resolver, "resolve");
  }

- (BOOL)send
{
  if (self->_transactionStarted || self->_cancelled) {
    return 0;
  }
  unsigned __int8 v4 = (void *)SFNodeCopyComputerName(self->_person);
  uint64_t v5 = airdrop_log(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    uint64_t v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Start transaction to \"%@\"",  (uint8_t *)&v14,  0xCu);
  }

  self->_transactionStarted = 1;
  -[SDStatusMonitor airDropTransactionBegin:](self->_monitor, "airDropTransactionBegin:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser"));
  [v7 incrementTransfersInitiated];

  uint64_t v8 = (OS_os_transaction *)os_transaction_create("SDAirDropClient");
  transaction = self->_transaction;
  self->_transaction = v8;

  uint64_t v10 = sub_10003617C();
  self->_unsigned int powerAssertionID = v10;
  uint64_t v11 = airdrop_log(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int powerAssertionID = self->_powerAssertionID;
    int v14 = 67109120;
    LODWORD(v15) = powerAssertionID;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Power assertion retained (%d)",  (uint8_t *)&v14,  8u);
  }

  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 11LL, 0LL);
  -[SDAirDropClient resolve](self, "resolve");

  return 1;
}

- (NSString)personID
{
  return (NSString *)(id)SFNodeCopyRealName(self->_person, a2);
}

- (void)invalidate
{
  self->_cancelled = 1;
  -[NSURLSessionUploadTask cancel](self->_askTask, "cancel");
  askTask = self->_askTask;
  self->_askTask = 0LL;

  -[NSURLSessionUploadTask cancel](self->_uploadTask, "cancel");
  uploadTask = self->_uploadTask;
  self->_uploadTask = 0LL;

  -[NSURLSessionUploadTask cancel](self->_discoverTask, "cancel");
  discoverTask = self->_discoverTask;
  self->_discoverTask = 0LL;

  -[NSURLSession finishTasksAndInvalidate](self->_session, "finishTasksAndInvalidate");
  session = self->_session;
  self->_session = 0LL;

  -[SDAirDropFileZipper setDelegate:](self->_zipper, "setDelegate:", 0LL);
  -[SDAirDropFileZipper stop](self->_zipper, "stop");
  zipper = self->_zipper;
  self->_zipper = 0LL;

  -[SDBonjourResolver setDelegate:](self->_resolver, "setDelegate:", 0LL);
  -[SDBonjourResolver cancel](self->_resolver, "cancel");
  resolver = self->_resolver;
  self->_resolver = 0LL;

  -[SDXPCHelperConnection invalidate](self->_xpcHelperConnection, "invalidate");
  xpcHelperConnection = self->_xpcHelperConnection;
  self->_xpcHelperConnection = 0LL;

  if (self->_personAdded)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDConnectedBrowser sharedBrowser](&OBJC_CLASS___SDConnectedBrowser, "sharedBrowser"));
    [v10 removeAirDropPerson:self->_person];

    self->_personAdded = 0;
  }

  filesToCleanup = self->_filesToCleanup;
  if (filesToCleanup)
  {
    __int128 v40 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v37 = 0u;
    uint64_t v12 = filesToCleanup;
    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v37,  v45,  16LL);
    if (v13)
    {
      id v15 = v13;
      id v16 = 0LL;
      uint64_t v17 = *(void *)v38;
      *(void *)&__int128 v14 = 138412546LL;
      __int128 v33 = v14;
      do
      {
        uint64_t v18 = 0LL;
        uint64_t v19 = v16;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v12);
          }
          id v20 = *(const __CFURL **)(*((void *)&v37 + 1) + 8LL * (void)v18);
          id v36 = v19;
          BOOL v21 = sub_1001155D4(v20, &v36);
          id v16 = v36;

          if (!v21)
          {
            uint64_t v23 = airdrop_log(v22);
            __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v33;
              uint64_t v42 = v20;
              __int16 v43 = 2112;
              id v44 = v16;
              _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "SDAirDropClient: removeObjectAtURL(%@) failed %@",  buf,  0x16u);
            }
          }

          uint64_t v18 = (char *)v18 + 1;
          uint64_t v19 = v16;
        }

        while (v15 != v18);
        id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v37,  v45,  16LL);
      }

      while (v15);
    }

    else
    {
      id v16 = 0LL;
    }

    __int128 v25 = self->_filesToCleanup;
    self->_filesToCleanup = 0LL;
  }

  if (self->_p2pRetained)
  {
    double v26 = 1.5;
    dispatch_time_t v27 = sub_100114580(1.5);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004CDD0;
    block[3] = &unk_1005CB2F8;
    void block[4] = self;
    dispatch_after(v27, queue, block);
    self->_p2pRetained = 0;
  }

  else
  {
    double v26 = 0.0;
    if (!self->_queueSuspended) {
      goto LABEL_23;
    }
    sub_100034400(self);
    id v29 = sub_100033F4C();
    NSErrorDomain v30 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(v29);
    dispatch_resume(v30);
  }

  self->_queueSuspended = 0;
LABEL_23:
  if (self->_transactionStarted)
  {
    self->_transactionStarted = 0;
    dispatch_time_t v31 = sub_100114580(v26);
    id v32 = (dispatch_queue_s *)self->_queue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10004CE14;
    v34[3] = &unk_1005CB2F8;
    v34[4] = self;
    dispatch_after(v31, v32, v34);
  }

  -[SDAirDropClient releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion", v33);
}

- (void)convertMediaItemsWithCompletionHandler:(id)a3
{
}

- (id)receiverMediaCapabilities
{
  BOOL v3 = (void *)SFNodeCopyMediaCapabilities(self->_person, a2);
  if (v3)
  {
    id v4 = [[PFMediaCapabilities alloc] initWithOpaqueRepresentation:v3];
    if (-[SDAirDropClient receiverDeviceModelNameSuggestsMacPlatform]( self,  "receiverDeviceModelNameSuggestsMacPlatform"))
    {
      uint64_t v7 = PFMediaCapabilitiesOutOfBandHintsPlatformKey;
      uint64_t v8 = &off_1005F74F8;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
      [v4 setOutOfBandHints:v5];
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (BOOL)receiverDeviceModelNameSuggestsMacPlatform
{
  v2 = (void *)SFNodeCopyModel(self->_person, a2);
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 lowercaseString]);
    unsigned __int8 v5 = [v4 containsString:@"mac"];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (NSDictionary)discoveryMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 416LL, 1);
}

- (void)setDiscoveryMetrics:(id)a3
{
}

- (BOOL)shouldPublishProgress
{
  return self->_shouldPublishProgress;
}

- (void)setShouldPublishProgress:(BOOL)a3
{
  self->_shouldPublishProgress = a3;
}

- (SDAirDropClientDelegate)delegate
{
  return (SDAirDropClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end