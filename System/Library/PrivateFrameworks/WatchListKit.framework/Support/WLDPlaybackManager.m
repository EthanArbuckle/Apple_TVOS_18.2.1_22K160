@interface WLDPlaybackManager
+ (id)sharedManager;
- (BOOL)_getIsPrompting;
- (BOOL)_isDirectPlaybackReportingDisabled;
- (BOOL)_isDirectoryPresentAndNonEmpty:(id)a3;
- (BOOL)_offlineValidation:(id)a3;
- (BOOL)_serialize:(id)a3;
- (BOOL)_shouldPromptForBundleID:(id)a3 outAccessStatus:(unint64_t *)a4;
- (NSMutableDictionary)lastSummaryDictionary;
- (WLDPlaybackManager)init;
- (id)_getLastSummaryBySessionID:(id)a3;
- (id)_getReporterBySessionID:(id)a3 isLive:(BOOL)a4;
- (id)_getSessionReporterBySessionID:(id)a3;
- (id)_queueDir;
- (id)_queuePathForSummary:(id)a3;
- (id)nowPlayingObserver;
- (id)queue;
- (id)reporter;
- (void)_catalogSummary:(id)a3;
- (void)_cleanupSummary:(id)a3;
- (void)_endSession:(id)a3;
- (void)_enqueuePendingReports;
- (void)_enqueuePlaybackSummary:(id)a3 sessionID:(id)a4 serialize:(BOOL)a5;
- (void)_handleDirectPlaybackAppTermination:(id)a3;
- (void)_handleReporting:(id)a3 summary:(id)a4 sessionIDKey:(id)a5 isFirstParty:(BOOL)a6;
- (void)_handleReportingError:(id)a3 forSummary:(id)a4;
- (void)_networkReachabilityChanged:(id)a3;
- (void)_onlineValidation:(id)a3 completion:(id)a4;
- (void)_promptForBundleID:(id)a3 completionHandler:(id)a4;
- (void)_removeLastSummaryBySessionID:(id)a3;
- (void)_removeReporterBySessionID:(id)a3;
- (void)_scanForPendingReports;
- (void)_setIsPrompting:(BOOL)a3;
- (void)_setLastSummaryBySessionID:(id)a3 sessionID:(id)a4;
- (void)_setSessionReporter:(id)a3 sessionID:(id)a4;
- (void)checkPendingReports;
- (void)dealloc;
- (void)fetchDecoratedNowPlayingSummaries:(id)a3;
- (void)fetchNowPlayingSummaries:(id)a3;
- (void)handleDirectPlaybackSummary:(id)a3 sessionID:(id)a4;
- (void)handlePlaybackSummary:(id)a3 sessionID:(id)a4;
- (void)handleSubscriptionRegistration;
- (void)requestToPromptForBundleID:(id)a3 completionHandler:(id)a4;
- (void)setLastSummaryDictionary:(id)a3;
@end

@implementation WLDPlaybackManager

+ (id)sharedManager
{
  if (sharedManager___once != -1) {
    dispatch_once(&sharedManager___once, &__block_literal_global_5);
  }
  return (id)sharedManager___sharedManager;
}

void __35__WLDPlaybackManager_sharedManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___WLDPlaybackManager);
  v2 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v1;
}

- (WLDPlaybackManager)init
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___WLDPlaybackManager;
  v2 = -[WLDPlaybackManager init](&v31, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v4 = WLKReachabilityMonitorReachabilityDidChange;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKReachabilityMonitor sharedInstance](&OBJC_CLASS___WLKReachabilityMonitor, "sharedInstance"));
    [v3 addObserver:v2 selector:"_networkReachabilityChanged:" name:v4 object:v5];

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    reporterDictionary = v2->_reporterDictionary;
    v2->_reporterDictionary = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lastSummaryDictionary = v2->_lastSummaryDictionary;
    v2->_lastSummaryDictionary = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    directPlayClientList = v2->_directPlayClientList;
    v2->_directPlayClientList = v10;

    v12 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v13 = -[NSUserDefaults initWithSuiteName:](v12, "initWithSuiteName:", WLKDefaultsDomain);
    v2->_disableDirectPlaybackReporting = -[NSUserDefaults BOOLForKey:]( v13,  "BOOLForKey:",  @"DisableDirectPlaybackReporting");
    v14 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    uint64_t v15 = WLKTVAppBundleID();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = -[NSUserDefaults initWithSuiteName:](v14, "initWithSuiteName:", v16);

    NSInteger v18 = -[NSUserDefaults integerForKey:]( v17,  "integerForKey:",  @"PlaybackManagerUserDefaultsKeyMaximumAgeForReport");
    uint64_t v19 = 1209600LL;
    if (v18) {
      uint64_t v19 = v18;
    }
    v2->_maximumAgeForReport = v19;
    v2->_isReportScanningHappening = 0;
    -[WLDPlaybackManager _enqueuePendingReports](v2, "_enqueuePendingReports");
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x3032000000LL;
    v29[3] = __Block_byref_object_copy__1;
    v29[4] = __Block_byref_object_dispose__1;
    v20 = v2;
    v30 = v20;
    v21 = objc_alloc(&OBJC_CLASS___WLDPlaybackNowPlayingObserver);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = __26__WLDPlaybackManager_init__block_invoke;
    v26[3] = &unk_10003D310;
    v28 = v29;
    v22 = v20;
    v27 = v22;
    v23 = -[WLDPlaybackNowPlayingObserver initWithUpdateHandler:](v21, "initWithUpdateHandler:", v26);
    nowPlayingObserver = v22->_nowPlayingObserver;
    v22->_nowPlayingObserver = v23;

    _Block_object_dispose(v29, 8);
  }

  return v2;
}

void __26__WLDPlaybackManager_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
    else {
      int HasBoolValueForEntitlement = WLDBundleHasBoolValueForEntitlement(v7, WLKEntitlementPlaybackReport);
    }
    if (HasBoolValueForEntitlement
      && ([*(id *)(a1 + 32) _isDirectPlaybackReportingDisabled] & 1) == 0)
    {
      if (([*(id *)(*(void *)(a1 + 32) + 64) containsObject:v7] & 1) == 0)
      {
        NSLog( @"WLDPlaybackManager: Ignoring MediaRemote NPI updates for %@; application supports direct-reporting!",
          v7);
      }
    }

    else
    {
      v9 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPlaybackNowPlayingObserver.updateHandler");
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) handlePlaybackSummary:v10 sessionID:v5];
    }
  }
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WLDPlaybackManager;
  -[WLDPlaybackManager dealloc](&v4, "dealloc");
}

- (id)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)handleDirectPlaybackSummary:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[WLDPlaybackManager _isDirectPlaybackReportingDisabled](self, "_isDirectPlaybackReportingDisabled"))
  {
    NSLog(@"WLDPlaybackManager: Direct playback reporting is disabled by user default");
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackDirectPlayObserver bundleID](self->_directPlayObserver, "bundleID"));
      unsigned __int8 v10 = [v9 isEqualToString:v8];

      if ((v10 & 1) == 0)
      {
        NSLog(@"WLDPlaybackManager: Creating directPlay observer for %@", v8);
        v11 = -[WLDPlaybackDirectPlayObserver initWithBundleID:]( objc_alloc(&OBJC_CLASS___WLDPlaybackDirectPlayObserver),  "initWithBundleID:",  v8);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = __60__WLDPlaybackManager_handleDirectPlaybackSummary_sessionID___block_invoke;
        v15[3] = &unk_10003D338;
        v15[4] = self;
        id v16 = v8;
        -[WLDPlaybackDirectPlayObserver setUpdateHandler:](v11, "setUpdateHandler:", v15);
        directPlayObserver = self->_directPlayObserver;
        self->_directPlayObserver = v11;
        v13 = v11;
      }

      -[WLDPlaybackManager _enqueuePlaybackSummary:sessionID:serialize:]( self,  "_enqueuePlaybackSummary:sessionID:serialize:",  v6,  v7,  1LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[WLDFederatedPunchoutReporter sharedFederatedPunchoutReporter]( &OBJC_CLASS___WLDFederatedPunchoutReporter,  "sharedFederatedPunchoutReporter"));
      [v14 recordPlaybackSummary:v6];
    }
  }
}

id *__60__WLDPlaybackManager_handleDirectPlaybackSummary_sessionID___block_invoke(id *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] _handleDirectPlaybackAppTermination:result[5]];
  }
  return result;
}

- (void)handlePlaybackSummary:(id)a3 sessionID:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[WLDFederatedPunchoutReporter sharedFederatedPunchoutReporter]( &OBJC_CLASS___WLDFederatedPunchoutReporter,  "sharedFederatedPunchoutReporter"));
  [v7 recordPlaybackSummary:v23];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[WLKChannelUtilities sharedInstanceFiltered]( &OBJC_CLASS___WLKChannelUtilities,  "sharedInstanceFiltered"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleID]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 channelForBundleID:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rateLimit]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:WLKChannelDetailsKeyRateLimitRateKey]);
  id v13 = [v12 unsignedIntegerValue];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 rateLimit]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:WLKChannelDetailsKeyRateLimitBurstKey]);
  id v16 = [v15 unsignedIntegerValue];

  if (!v13) {
    goto LABEL_8;
  }
  if (!v16) {
    goto LABEL_8;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _getLastSummaryBySessionID:](self, "_getLastSummaryBySessionID:", v6));
  unsigned int v18 = [v17 isEquivalentToSummaryExcludingCursor:v23];

  if (!v18) {
    goto LABEL_8;
  }
  rateLimiter = self->_rateLimiter;
  if (rateLimiter)
  {
    -[WLDRateLimiter setRate:](rateLimiter, "setRate:", v13);
    -[WLDRateLimiter setBurst:](self->_rateLimiter, "setBurst:", v16);
  }

  else
  {
    v20 = -[WLDRateLimiter initWithRate:burst:]( objc_alloc(&OBJC_CLASS___WLDRateLimiter),  "initWithRate:burst:",  v13,  v16);
    v21 = self->_rateLimiter;
    self->_rateLimiter = v20;
  }

  if (!-[WLDRateLimiter doOperation](self->_rateLimiter, "doOperation"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v10 rateLimit]);
    NSLog(@"WLDPlaybackManager: dropping report. Exceeded rate limit %@ %@", v22, v23);
  }

  else
  {
LABEL_8:
    -[WLDPlaybackManager _enqueuePlaybackSummary:sessionID:serialize:]( self,  "_enqueuePlaybackSummary:sessionID:serialize:",  v23,  v6,  1LL);
  }
}

- (void)fetchNowPlayingSummaries:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __47__WLDPlaybackManager_fetchNowPlayingSummaries___block_invoke;
  v8[3] = &unk_10003CF50;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __47__WLDPlaybackManager_fetchNowPlayingSummaries___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nowPlayingObserver]);
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 nowPlayingSummaries]);

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)fetchDecoratedNowPlayingSummaries:(id)a3
{
  id v19 = a3;
  id v4 = self->_lastSummaryDictionary;
  objc_sync_enter(v4);
  id v21 = -[NSMutableDictionary mutableCopy](self->_lastSummaryDictionary, "mutableCopy");
  objc_sync_exit(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager nowPlayingObserver](self, "nowPlayingObserver"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingSummaries]);

  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = __Block_byref_object_copy__1;
  v39 = __Block_byref_object_dispose__1;
  id v40 = 0LL;
  if (v20 && [v20 count])
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v6 = v20;
    id v7 = [v6 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v32;
      uint64_t v9 = 1LL;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke;
          v30[3] = &unk_10003D360;
          v30[4] = v11;
          v30[5] = &v35;
          [v21 enumerateKeysAndObjectsUsingBlock:v30];
          if (!v36[5])
          {
            NSLog(@"WLDPlaybackManager: Found untracked NPI. Will fetch canonical");
            v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Untracked NPI %ld>",  v9));
            [v21 setObject:v11 forKeyedSubscript:v12];

            ++v9;
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }

      while (v7);
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v21 count]));
  NSLog(@"WLDPlaybackManager: begin decorating (%@) summaries", v13);

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_group_t v16 = dispatch_group_create();
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x3032000000LL;
  v28[3] = __Block_byref_object_copy__1;
  v28[4] = __Block_byref_object_dispose__1;
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_2;
  v25[3] = &unk_10003D3B0;
  v25[4] = self;
  v17 = v16;
  v26 = v17;
  v27 = v28;
  [v21 enumerateKeysAndObjectsUsingBlock:v25];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_4;
  block[3] = &unk_10003D418;
  id v23 = v19;
  v24 = v28;
  id v18 = v19;
  dispatch_group_notify(v17, v15, block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v35, 8);
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v8 = a2;
  if ([a3 isEquivalentToSummaryExcludingCursor:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 playbackState])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getSessionReporterBySessionID:v5]);
    if (v7)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      NSLog(@"WLDPlaybackManager: Found cached reporter");
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_3;
      v10[3] = &unk_10003D388;
      id v8 = v6;
      uint64_t v9 = *(void *)(a1 + 48);
      id v11 = v8;
      uint64_t v14 = v9;
      id v12 = v5;
      id v13 = *(id *)(a1 + 40);
      [v7 getCachedCanonicalIDForSummary:v8 completionHandler:v10];
    }

    else
    {
      NSLog(@"WLDPlaybackManager: Found untracked NPI");
    }
  }

  else
  {
    NSLog(@"WLDPlaybackManager: Skipping stopped summary.");
  }
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    NSLog(@"WLDPlaybackManager: Found cached canonical id using cached reporter");
    id v6 = -[WLKDecoratedPlaybackSummary initWithSummary:canonicalID:]( objc_alloc(&OBJC_CLASS___WLKDecoratedPlaybackSummary),  "initWithSummary:canonicalID:",  *(void *)(a1 + 32),  v8);
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    objc_sync_enter(v7);
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v6 forKey:*(void *)(a1 + 40)];
    objc_sync_exit(v7);
  }

  else
  {
    NSLog(@"WLDPlaybackManager: Canonical id is not cached");
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_4(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    [*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_147];
    NSLog(@"WLDPlaybackManager: done decorating summaries");
    uint64_t v2 = *(void *)(v1 + 32);
    if ([*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) count]) {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 40LL);
    }
    else {
      uint64_t v3 = 0LL;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }

  return result;
}

void __56__WLDPlaybackManager_fetchDecoratedNowPlayingSummaries___block_invoke_5( id a1,  NSString *a2,  WLKDecoratedPlaybackSummary *a3,  BOOL *a4)
{
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[WLKDecoratedPlaybackSummary canonicalID](a3, "canonicalID"));
  NSLog(@"WLDPlaybackManager: Decorated [%@] : %@", v5, v6);
}

- (void)handleSubscriptionRegistration
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __52__WLDPlaybackManager_handleSubscriptionRegistration__block_invoke;
  v5[3] = &unk_10003D480;
  v5[4] = self;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[WLDTransactionBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___WLDTransactionBlockOperation,  "blockOperationWithBlock:",  v5));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager queue](self, "queue"));
  [v4 addOperation:v3];
}

void __52__WLDPlaybackManager_handleSubscriptionRegistration__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 refresh]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:WLKAppLibraryDidChangeNotificationSubscribedChangesKey]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:WLKArrayAdditionsKey]);

  if (!v8)
  {
    NSLog(@"WLDPlaybackManager: handleSubscriptionRegistration: No sbid diff, considering all sbids");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[WLKAppLibrary defaultAppLibrary](&OBJC_CLASS___WLKAppLibrary, "defaultAppLibrary"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 subscribedAppBundleIdentifiers]);
  }

  unsigned int v6 = [*(id *)(a1 + 32) _offlineValidation:0];
  if ([v8 count] && (v6 & 1) != 0)
  {
    NSLog(&CFSTR("WLDPlaybackManager: handleSubscriptionRegistration: done refreshing library. Will request init/config with de"
                 "fault cache policy").isa);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[WLKConfigurationManager sharedInstance](&OBJC_CLASS___WLKConfigurationManager, "sharedInstance"));
    [v7 fetchConfigurationWithCompletionHandler:&__block_literal_global_164];
  }

  else
  {
    NSLog( @"WLDPlaybackManager: handleSubscriptionRegistration: Not continuing. sbids:%@ validation:%d",  v8,  v6);
  }
}

void __52__WLDPlaybackManager_handleSubscriptionRegistration__block_invoke_2( id a1,  WLKServerConfigurationResponse *a2,  NSError *a3)
{
}

- (void)checkPendingReports
{
}

- (void)requestToPromptForBundleID:(id)a3 completionHandler:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __67__WLDPlaybackManager_requestToPromptForBundleID_completionHandler___block_invoke;
  v10[3] = &unk_10003CE60;
  void v10[4] = self;
  id v11 = a3;
  id v12 = a4;
  id v6 = v12;
  id v7 = v11;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[WLDTransactionBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___WLDTransactionBlockOperation,  "blockOperationWithBlock:",  v10));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager queue](self, "queue"));
  [v9 addOperation:v8];
}

id __67__WLDPlaybackManager_requestToPromptForBundleID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptForBundleID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (id)queue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (!queue)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    id v5 = v2->_queue;
    v2->_queue = v4;

    -[NSOperationQueue setName:](v2->_queue, "setName:", @"com.apple.watchlistd.PlaybackManagerQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1LL);
    queue = v2->_queue;
  }

  id v6 = queue;
  objc_sync_exit(v2);

  return v6;
}

- (id)reporter
{
  return -[WLDPlaybackManager _getReporterBySessionID:isLive:]( self,  "_getReporterBySessionID:isLive:",  @"DefaultPlaybackSessionID",  0LL);
}

- (id)_getLastSummaryBySessionID:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = self->_lastSummaryDictionary;
  objc_sync_enter(v5);
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = @"DefaultPlaybackSessionID";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lastSummaryDictionary, "objectForKey:", v6));
  objc_sync_exit(v5);

  return v7;
}

- (void)_removeLastSummaryBySessionID:(id)a3
{
  id v6 = (__CFString *)a3;
  id v4 = self->_lastSummaryDictionary;
  objc_sync_enter(v4);
  if (v6) {
    id v5 = v6;
  }
  else {
    id v5 = @"DefaultPlaybackSessionID";
  }
  -[NSMutableDictionary removeObjectForKey:](self->_lastSummaryDictionary, "removeObjectForKey:", v5);
  objc_sync_exit(v4);
}

- (void)_setSessionReporter:(id)a3 sessionID:(id)a4
{
  id v9 = a3;
  id v6 = (__CFString *)a4;
  if (v9)
  {
    id v7 = self->_reporterDictionary;
    objc_sync_enter(v7);
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = @"DefaultPlaybackSessionID";
    }
    -[NSMutableDictionary setObject:forKey:](self->_reporterDictionary, "setObject:forKey:", v9, v8);
    objc_sync_exit(v7);
  }
}

- (void)_setLastSummaryBySessionID:(id)a3 sessionID:(id)a4
{
  id v9 = a3;
  id v6 = (__CFString *)a4;
  id v7 = self->_lastSummaryDictionary;
  objc_sync_enter(v7);
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = @"DefaultPlaybackSessionID";
  }
  -[NSMutableDictionary setObject:forKey:](self->_lastSummaryDictionary, "setObject:forKey:", v9, v8);
  objc_sync_exit(v7);
}

- (id)_getSessionReporterBySessionID:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = self->_reporterDictionary;
  objc_sync_enter(v5);
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = @"DefaultPlaybackSessionID";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_reporterDictionary, "objectForKey:", v6));
  objc_sync_exit(v5);

  return v7;
}

- (id)_getReporterBySessionID:(id)a3 isLive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  id v7 = v6;
  id v8 = @"DefaultPlaybackSessionID";
  if (v6) {
    id v8 = v6;
  }
  id v9 = v8;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _getSessionReporterBySessionID:](self, "_getSessionReporterBySessionID:", v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _getLastSummaryBySessionID:](self, "_getLastSummaryBySessionID:", v9));
  if (![v11 playbackType] && !v4)
  {
    id v13 = &off_10003C268;
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___WLDPlaybackReporter, v12);
    if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
    {
      NSLog(@"WLDPlaybackManager: Returning a previously created WLDPlaybackReporter");
      goto LABEL_16;
    }

    NSLog(@"WLDPlaybackManager: Creating a WLDPlaybackReporter");
LABEL_15:
    [v10 invalidate];
    id v17 = [objc_alloc(*v13) initWithSessionID:v9];

    -[WLDPlaybackManager _setSessionReporter:sessionID:](self, "_setSessionReporter:sessionID:", v17, v9);
    unsigned __int8 v10 = v17;
    goto LABEL_16;
  }

  if ([v11 playbackType] == (id)2 || objc_msgSend(v11, "playbackType") == (id)1 || v4)
  {
    id v13 = off_10003C260;
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___WLDLivePlaybackReporter, v15);
    if ((objc_opt_isKindOfClass(v10, v16) & 1) != 0)
    {
      NSLog(@"WLDPlaybackManager: Returning a previously created WLDLivePlaybackReporter");
      goto LABEL_16;
    }

    NSLog(@"WLDPlaybackManager: Creating a WLDLivePlaybackReporter");
    goto LABEL_15;
  }

- (void)_removeReporterBySessionID:(id)a3
{
  id v8 = (__CFString *)a3;
  BOOL v4 = self->_reporterDictionary;
  objc_sync_enter(v4);
  id v5 = @"DefaultPlaybackSessionID";
  if (v8) {
    id v5 = v8;
  }
  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_reporterDictionary, "objectForKey:", v6));
  [v7 invalidate];
  -[NSMutableDictionary removeObjectForKey:](self->_reporterDictionary, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)_endSession:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = __34__WLDPlaybackManager__endSession___block_invoke;
  unsigned __int8 v10 = &unk_10003CDC0;
  id v11 = a3;
  uint64_t v12 = self;
  id v4 = v11;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v7));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager queue](self, "queue", v7, v8, v9, v10));
  [v6 addOperation:v5];
}

id __34__WLDPlaybackManager__endSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _removeLastSummaryBySessionID:*(void *)(a1 + 32)];
}

- (void)_handleDirectPlaybackAppTermination:(id)a3
{
  id v4 = a3;
  id v5 = self->_lastSummaryDictionary;
  objc_sync_enter(v5);
  lastSummaryDictionary = self->_lastSummaryDictionary;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __58__WLDPlaybackManager__handleDirectPlaybackAppTermination___block_invoke;
  v8[3] = &unk_10003D4A8;
  id v7 = v4;
  id v9 = v7;
  unsigned __int8 v10 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( lastSummaryDictionary,  "enumerateKeysAndObjectsUsingBlock:",  v8);

  objc_sync_exit(v5);
}

void __58__WLDPlaybackManager__handleDirectPlaybackAppTermination___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleID]);
  unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  id v7 = v10;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _getLastSummaryBySessionID:v10]);
    if ([v8 playbackState] == (id)1)
    {
      NSLog(@"WLDPlaybackManager: Generating stopped playback event due to app termination.");
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 elapsedTimeSummaryWithPlaybackState:0 timerDerived:0]);
      [*(id *)(a1 + 40) _enqueuePlaybackSummary:v9 sessionID:v10 serialize:1];
    }

    else if (v8)
    {
      [*(id *)(a1 + 40) endDirectPlaybackSession:v10];
    }

    id v7 = v10;
  }
}

- (BOOL)_getIsPrompting
{
  return self->_isPrompting;
}

- (void)_setIsPrompting:(BOOL)a3
{
  self->_isPrompting = a3;
}

- (void)_enqueuePlaybackSummary:(id)a3 sessionID:(id)a4 serialize:(BOOL)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  if ((+[WLKNetworkRequestUtilities isGDPRAccepted]( &OBJC_CLASS___WLKNetworkRequestUtilities,  "isGDPRAccepted") & 1) != 0)
  {
    id v10 = @"DefaultPlaybackSessionID";
    if (v9) {
      id v10 = v9;
    }
    id v11 = v10;
    -[WLDPlaybackManager _setLastSummaryBySessionID:sessionID:](self, "_setLastSummaryBySessionID:sessionID:", v8, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[WLDPlaybackManager _getReporterBySessionID:isLive:]( self,  "_getReporterBySessionID:isLive:",  v11,  [v8 isLiveType]));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 shortDescription]);
    NSLog(@"WLDPlaybackManager: enqueue: %@ for sessionID %@", v13, v11);

    objc_initWeak(&location, self);
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___WLDTransactionBlockOperation);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke;
    v18[3] = &unk_10003D520;
    objc_copyWeak(&v22, &location);
    id v19 = v8;
    BOOL v23 = a5;
    id v15 = v12;
    id v20 = v15;
    uint64_t v16 = v11;
    id v21 = v16;
    -[WLDTransactionBlockOperation addExecutionBlock:](v14, "addExecutionBlock:", v18);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager queue](self, "queue"));
    [v17 addOperation:v14];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  else
  {
    NSLog(@"WLDPlaybackManager: GDPR not yet accepted, returning early");
  }
}

void __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained _offlineValidation:*(void *)(a1 + 32)])
  {
    if (*(_BYTE *)(a1 + 64) && ![*(id *)(a1 + 32) playbackType]) {
      [WeakRetained _serialize:*(void *)(a1 + 32)];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_2;
    v5[3] = &unk_10003D4F8;
    objc_copyWeak(&v10, v2);
    id v6 = *(id *)(a1 + 32);
    id v7 = WeakRetained;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    [WeakRetained _onlineValidation:v4 completion:v5];

    objc_destroyWeak(&v10);
  }
}

void __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_2( uint64_t a1,  char a2,  void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[WLKChannelUtilities sharedInstanceFiltered]( &OBJC_CLASS___WLKChannelUtilities,  "sharedInstanceFiltered"));
    unsigned __int8 v10 = [v9 isItunesOrFirstPartyBundleID:v8];

    if ((v10 & 1) != 0)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = v7;
      uint64_t v15 = 1LL;
    }

    else
    {
      uint64_t v24 = 0LL;
      if ([v7 _shouldPromptForBundleID:v8 outAccessStatus:&v24])
      {
        uint64_t v16 = *(void **)(a1 + 40);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_3;
        v17[3] = &unk_10003D4D0;
        id v18 = v8;
        id v19 = v7;
        id v20 = *(id *)(a1 + 32);
        id v21 = *(id *)(a1 + 48);
        id v22 = *(id *)(a1 + 56);
        unsigned __int8 v23 = v10;
        [v16 _promptForBundleID:v18 completionHandler:v17];

LABEL_10:
        goto LABEL_11;
      }

      if ((v24 & 0xFFFFFFFFFFFFFFFDLL) == 0)
      {
        NSLog(@"WLDPlaybackManager: User has not granted access (2) for: %@", v8);
        [v7 _cleanupSummary:*(void *)(a1 + 32)];
        goto LABEL_10;
      }

      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = v7;
      uint64_t v15 = 0LL;
    }

    [v14 _handleReporting:v12 summary:v11 sessionIDKey:v13 isFirstParty:v15];
    goto LABEL_10;
  }

  [WeakRetained _handleReportingError:v5 forSummary:*(void *)(a1 + 32)];
LABEL_11:
}

id __66__WLDPlaybackManager__enqueuePlaybackSummary_sessionID_serialize___block_invoke_3( uint64_t a1,  char a2)
{
  if ((a2 & 1) != 0) {
    return [*(id *)(a1 + 40) _handleReporting:*(void *)(a1 + 56) summary:*(void *)(a1 + 48) sessionIDKey:*(void *)(a1 + 64) isFirstParty:*(unsigned __int8 *)(a1 + 72)];
  }
  NSLog(@"WLDPlaybackManager: User has not granted access (1) for: %@", *(void *)(a1 + 32));
  return [*(id *)(a1 + 40) _cleanupSummary:*(void *)(a1 + 48)];
}

- (void)_handleReporting:(id)a3 summary:(id)a4 sessionIDKey:(id)a5 isFirstParty:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = __73__WLDPlaybackManager__handleReporting_summary_sessionIDKey_isFirstParty___block_invoke;
  id v19 = &unk_10003D548;
  objc_copyWeak(&v22, &location);
  id v13 = v11;
  id v20 = v13;
  id v14 = v12;
  id v21 = v14;
  [v10 reportPlayback:v13 completion:&v16];
  if (!a6 && (objc_msgSend(v13, "isFromActivePlayerPath", v16, v17, v18, v19, v20) & 1) == 0)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
    +[VSMetricsManagerObjC recordNowPlayingBrokenEventWithBundleID:]( &OBJC_CLASS___VSMetricsManagerObjC,  "recordNowPlayingBrokenEventWithBundleID:",  v15);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __73__WLDPlaybackManager__handleReporting_summary_sessionIDKey_isFirstParty___block_invoke( uint64_t a1,  char a2,  void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) shortDescription]);
    NSLog(@"WLDPlaybackManager: Successful playback report %@", v7);

    [v6 _catalogSummary:*(void *)(a1 + 32)];
    [v6 _cleanupSummary:*(void *)(a1 + 32)];
    if (![*(id *)(a1 + 32) playbackState])
    {
      NSLog(@"WLDPlaybackManager: Session %@ has PlaybackStateStopped", *(void *)(a1 + 40));
      [v6 _endSession:*(void *)(a1 + 40)];
    }
  }

  else
  {
    [WeakRetained _handleReportingError:v8 forSummary:*(void *)(a1 + 32)];
  }
}

- (void)_handleReportingError:(id)a3 forSummary:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
  unsigned __int8 v8 = [v7 isEqualToString:WLKErrorDomain];

  if ((v8 & 1) != 0
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]),
        unsigned int v10 = [v9 isEqualToString:AMSErrorDomain],
        v9,
        v10)
    && (unint64_t)(WLKHTTPStatusCodeForAMSError(v14) - 400) <= 0xC7)
  {
    NSLog(@"WLDPlaybackManager: ErrorHandler: Fatal error. Cleaning up summary: %@", v14);
    -[WLDPlaybackManager _cleanupSummary:](self, "_cleanupSummary:", v6);
  }

  else
  {
    NSLog( @"WLDPlaybackManager: ErrorHandler: Non-fatal error. Will attempt report again on reachability change and/or app launch. %@",  v14);
    id v11 = self;
    objc_sync_enter(v11);
    if (!v11->_pendingReportsTransaction)
    {
      id v12 = -[WLKTransactionScope initWithIdentifier:]( objc_alloc(&OBJC_CLASS___WLKTransactionScope),  "initWithIdentifier:",  @"WLDPlaybackManager._handleReportingError");
      pendingReportsTransaction = v11->_pendingReportsTransaction;
      v11->_pendingReportsTransaction = v12;
    }

    objc_sync_exit(v11);
  }
}

- (BOOL)_offlineValidation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  uint64_t v5 = WLKTVAppBundleID();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationState]);
  unsigned __int8 v9 = [v8 isInstalled];

  if ((v9 & 1) != 0)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[WLKSystemPreferencesStore sharedPreferences]( &OBJC_CLASS___WLKSystemPreferencesStore,  "sharedPreferences"));
    if ([v10 privateModeEnabled])
    {
      NSLog(@"WLDPlaybackManager: User has private mode enabled");
      BOOL v11 = 0;
LABEL_18:

      goto LABEL_19;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));

    if (v3)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 accountID]);
      id v15 = [v14 length];

      if (!v15)
      {
        NSLog(@"WLDPlaybackManager: Error: DSID missing.");
        goto LABEL_16;
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleID]);

      if (!v16)
      {
        NSLog(@"WLDPlaybackManager: Error: bundleIdentifier is required.");
        goto LABEL_16;
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIDAsNumber]);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ams_iTunesAccountWithDSID:", v18));

      id v13 = (void *)v19;
    }

    if (v13)
    {
      if (!objc_msgSend(v13, "ams_isManagedAppleID"))
      {
        BOOL v11 = 1;
LABEL_17:

        goto LABEL_18;
      }

      NSLog(@"WLDPlaybackManager: Feature disabled for Managed Apple IDs.");
    }

    else
    {
      NSLog(@"WLDPlaybackManager: An active iTunes account is required to report play activity events.");
    }

- (void)_onlineValidation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v8 = (void *)objc_opt_class(&OBJC_CLASS___WLKURLBagUtilities, v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __51__WLDPlaybackManager__onlineValidation_completion___block_invoke;
  v11[3] = &unk_10003D598;
  id v12 = v5;
  id v13 = v6;
  id v9 = v5;
  id v10 = v6;
  [v8 isFullTVAppEnabledWithCompletion:v11];
}

void __51__WLDPlaybackManager__onlineValidation_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    NSLog(@"WLDPlaybackManager: Error fetching Now playing from URL bag.");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else if ((a2 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_2;
    v9[3] = &unk_10003D598;
    id v11 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    +[WLKSettingsCloudUtilities synchronizeSettingsFromCloudIfNeededWithCompletion:]( &OBJC_CLASS___WLKSettingsCloudUtilities,  "synchronizeSettingsFromCloudIfNeededWithCompletion:",  v9);
  }

  else
  {
    NSLog(@"WLDPlaybackManager: Error: Now playing not enabled in URL bag.");
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = WLKError(301LL, 0LL, @"Now playing not enabled in URL bag");
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0LL, v8);
  }
}

void __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
    unsigned __int8 v7 = [v6 optedIn];

    if ((v7 & 1) != 0)
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[WLKChannelUtilities sharedInstanceFiltered]( &OBJC_CLASS___WLKChannelUtilities,  "sharedInstanceFiltered"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_3;
      v13[3] = &unk_10003D570;
      id v16 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 32);
      id v15 = v8;
      id v9 = v8;
      [v9 loadIfNeededWithCompletion:v13];
    }

    else
    {
      NSLog(@"WLDPlaybackManager: User has not opted into feature");
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = WLKError(300LL, 0LL, @"User has not opted into feature");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0LL, v12);
    }
  }

  else
  {
    NSLog(@"WLDPlaybackManager: Settings sync failed");
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __51__WLDPlaybackManager__onlineValidation_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v15 = a3;
  if ((a2 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleID]);
    if ([*(id *)(a1 + 40) isItunesOrFirstPartyBundleID:v5])
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_15:

      goto LABEL_16;
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) channelID]);
    if (!v6)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) channelIDForBundleID:v5]);
      if (!v6)
      {
        NSLog(@"WLDPlaybackManager: No channel associated with channel ID: %@. Ignoring report", 0LL);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = WLKError(0LL, 0LL, @"channel lookup failed");
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
        (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0LL, v6);
        goto LABEL_14;
      }
    }

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) channelForID:v6]);
    if ([v7 isWatchListEnabled])
    {
      if ([v7 shouldTrackPlayActivity])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }

      NSLog( @"WLDPlaybackManager: Channel with ID %@ does not have playback tracking enabled. Ignoring report.",  v6);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Channel %@ does not have playback tracking enabled",  v6);
    }

    else
    {
      NSLog(@"WLDPlaybackManager: Channel with ID %@ is not watchlist enabled. Ignoring report.", v6);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Channel %@ is not watchlist enabled",  v6);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = WLKError(0LL, 0LL, v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0LL, v12);

    goto LABEL_13;
  }

  NSLog(@"WLDPlaybackManager: Failed to load channel utils");
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_16:
}

- (BOOL)_shouldPromptForBundleID:(id)a3 outAccessStatus:(unint64_t *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[WLKChannelUtilities sharedInstanceFiltered]( &OBJC_CLASS___WLKChannelUtilities,  "sharedInstanceFiltered"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 channelForBundleID:v6]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 channelID]);
  uint64_t v10 = WLKSubscriptionIdentifierForBundleID(v6);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 settingsForChannelID:v9 externalID:v11]);

  if (a4) {
    *a4 = (unint64_t)[v13 accessStatus];
  }
  if (self->_isPrompting)
  {
    NSLog(@"WLDPlaybackManager: should not prompt because we are already prompting");
LABEL_5:
    BOOL v14 = 0;
    goto LABEL_6;
  }

  if (!v8)
  {
    NSLog(@"WLDPlaybackManager: No channel found for: %@", v6);
    goto LABEL_5;
  }

  if ([v13 accessStatus] == (id)2)
  {
    NSLog(@"WLDPlaybackManager: User has denied access for: %@ %@", v6, v9);
    goto LABEL_5;
  }

  if ([v13 accessStatus] == (id)1)
  {
    NSLog(@"WLDPlaybackManager: User has allowed access for: %@ %@", v6, v9);
    goto LABEL_5;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[WLKReachabilityMonitor sharedInstance](&OBJC_CLASS___WLKReachabilityMonitor, "sharedInstance"));
  unsigned __int8 v17 = [v16 isNetworkReachable];

  if ((v17 & 1) == 0)
  {
    NSLog(@"WLDPlaybackManager: Will not prompt due to network being unavailable");
    goto LABEL_5;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v6));
  id v23 = 0LL;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v18,  &v23));
  id v20 = v23;

  if (v19)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 currentState]);
    unsigned int v22 = [v21 taskState];
    BOOL v14 = v22 == 4;
    if (v22 != 4) {
      NSLog(@"WLDPlaybackManager: Will not prompt because application is not foregrounded");
    }
  }

  else
  {
    NSLog(@"WLDPlaybackManager: Could not get process handle %@", v20);
    BOOL v14 = 0;
  }

LABEL_6:
  return v14;
}

- (void)_promptForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSLog(@"WLDPlaybackManager: promptForBundleID: %@", v6);
  self->_isPrompting = 1;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_activeiTunesAccount"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 username]);

  v28[0] = PBSUPRDialogTypeKey;
  v28[1] = PBSUPRDialogCustomViewServiceNameKey;
  v29[0] = PBSUPRDialogTypeCustom;
  v29[1] = @"com.apple.TVAccessViewService";
  v28[2] = PBSUPRDialogCustomViewControllerClassNameKey;
  v28[3] = WLKViewServiceAccountNameKey;
  v29[2] = @"TVAccessViewServiceViewController";
  v29[3] = v10;
  v28[4] = WLKViewServiceAppBundlesKey;
  id v27 = v6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  v29[4] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  5LL));

  id v13 = [[PBSUserPresentationRequest alloc] initWithType:0 options:v12];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userPresentationServiceProxy]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __59__WLDPlaybackManager__promptForBundleID_completionHandler___block_invoke;
  v22[3] = &unk_10003D5C0;
  id v16 = dispatch_semaphore_create(0LL);
  id v23 = v16;
  uint64_t v24 = v25;
  [v15 presentUIWithRequest:v13 completion:v22];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](&OBJC_CLASS___WLKSettingsStore, "sharedSettings"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __59__WLDPlaybackManager__promptForBundleID_completionHandler___block_invoke_2;
  v19[3] = &unk_10003D5E8;
  v19[4] = self;
  id v18 = v7;
  id v20 = v18;
  id v21 = v25;
  [v17 refreshWithCompletion:v19];

  _Block_object_dispose(v25, 8);
}

void __59__WLDPlaybackManager__promptForBundleID_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  uint64_t a4)
{
  id v10 = a3;
  NSLog(@"WLDPlaybackManager PBSUserPresentationRequest done %lu result: %@, error: %@", a2, v10, a4);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  BOOL v9 = (objc_opt_isKindOfClass(v10, v8) & 1) != 0 && [v10 unsignedIntegerValue] == (id)1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v9;
}

uint64_t __59__WLDPlaybackManager__promptForBundleID_completionHandler___block_invoke_2(void *a1)
{
  *(_BYTE *)(a1[4] + 48LL) = 0;
  return (*(uint64_t (**)(void, void))(a1[5] + 16LL))( a1[5],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL));
}

- (void)_enqueuePendingReports
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __44__WLDPlaybackManager__enqueuePendingReports__block_invoke;
  v5[3] = &unk_10003D480;
  void v5[4] = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[WLDTransactionBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___WLDTransactionBlockOperation,  "blockOperationWithBlock:",  v5));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager queue](self, "queue"));
  [v4 addOperation:v3];
}

id __44__WLDPlaybackManager__enqueuePendingReports__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scanForPendingReports];
}

- (void)_scanForPendingReports
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isReportScanningHappening)
  {
    NSLog(@"WLDPlaybackManager: _scanForPendingReports currently happening. Will skip.");
    objc_sync_exit(obj);

    return;
  }

  obj->_isReportScanningHappening = 1;
  objc_sync_exit(obj);

  NSLog(@"WLDPlaybackManager: scanning for pending reports");
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _queueDir](obj, "_queueDir"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v3 = [v2 fileExistsAtPath:v51];

  if ((v3 & 1) == 0)
  {
    v49 = obj;
    objc_sync_enter(v49);
    obj->_isReportScanningHappening = 0;
    objc_sync_exit(v49);

    goto LABEL_48;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v51));
  v82[0] = NSURLNameKey;
  v82[1] = NSURLIsDirectoryKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 2LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [v4 enumeratorAtURL:v5 includingPropertiesForKeys:v6 options:4 errorHandler:&__block_literal_global_290]);

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id v59 = v7;
  id v8 = [v59 countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (!v8) {
    goto LABEL_30;
  }
  uint64_t v9 = *(void *)v76;
  do
  {
    id v10 = 0LL;
    do
    {
      if (*(void *)v76 != v9) {
        objc_enumerationMutation(v59);
      }
      uint64_t v11 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)v10);
      id v74 = 0LL;
      [v11 getResourceValue:&v74 forKey:NSURLIsDirectoryKey error:0];
      id v12 = v74;
      if (([v12 BOOLValue] & 1) == 0)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        id v73 = 0LL;
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 attributesOfItemAtPath:v14 error:&v73]);
        id v16 = v73;

        if (v16)
        {
          NSLog(@"WLDPlaybackManager: _scanForPendingReports attributesOfItemAtPath error: %@", v16);

LABEL_12:
          goto LABEL_13;
        }

        if (!v15)
        {
          NSLog(@"WLDPlaybackManager: _scanForPendingReports attributesOfItemAtPath error: %@", 0LL);
          goto LABEL_12;
        }

        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:NSFileModificationDate]);
        [v17 timeIntervalSinceDate:v18];
        double v20 = v19;

        if (obj->_maximumAgeForReport < (uint64_t)v20)
        {
          NSLog( @"WLDPlaybackManager: The last modified time (%f) is greater than max age (%lu). Will delete report.",  *(void *)&v20,  obj->_maximumAgeForReport);
          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
          [v21 removeItemAtPath:v22 error:0];

          goto LABEL_12;
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v23));

        v25 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
        id v72 = 0LL;
        char v26 = -[NSKeyedUnarchiver initForReadingFromData:error:](v25, "initForReadingFromData:error:", v24, &v72);
        id v27 = v72;
        v58 = v27;
        if (v27)
        {
          NSLog(@"WLDPlaybackManager: _scanForPendingReports secure unarchiver error: %@", v27);
          goto LABEL_27;
        }

        id v29 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v26,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___WLKPlaybackSummary, v28),  NSKeyedArchiveRootObjectKey);
        v57 = (void *)objc_claimAutoreleasedReturnValue(v29);
        if (v57)
        {
          uint64_t v31 = objc_opt_class(&OBJC_CLASS___WLKPlaybackSummary, v30);
          if ((objc_opt_isKindOfClass(v57, v31) & 1) != 0)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
            v53 = (void *)objc_claimAutoreleasedReturnValue([v57 accountIDAsNumber]);
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "ams_iTunesAccountWithDSID:", v53));

            if (v52)
            {
              [v50 addObject:v57];

              goto LABEL_28;
            }

            v55 = (void *)objc_claimAutoreleasedReturnValue([v57 accountIDAsNumber]);
            NSLog(@"WLDPlaybackManager: _scanForPendingReports no iTunes account for ID: %@", v55);
          }
        }

LABEL_27:
        [v56 addObject:v11];
LABEL_28:

        goto LABEL_12;
      }

BOOL __44__WLDPlaybackManager__scanForPendingReports__block_invoke(id a1, NSURL *a2, NSError *a3)
{
  if (a3) {
    NSLog(@"WLDPlaybackManager: [Error] scanning for pending reports %@ (%@)", a3, a2);
  }
  return a3 == 0LL;
}

void __44__WLDPlaybackManager__scanForPendingReports__block_invoke_2(uint64_t a1)
{
  id obj = objc_loadWeakRetained((id *)(a1 + 40));
  objc_sync_enter(obj);
  NSLog(@"WLDPlaybackManager: Releasing pending reports transaction.");
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned __int8 v3 = *(void **)(v2 + 40);
  if (v3)
  {
    *(void *)(v2 + 40) = 0LL;
  }

  objc_sync_exit(obj);
}

- (void)_networkReachabilityChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[WLKReachabilityMonitor sharedInstance](&OBJC_CLASS___WLKReachabilityMonitor, "sharedInstance", a3));
  unsigned int v5 = [v4 isNetworkReachable];

  NSLog(@"WLDPlaybackManager: Network reachability changed. Network is reachable:%d", v5);
  if (v5) {
    -[WLDPlaybackManager _enqueuePendingReports](self, "_enqueuePendingReports");
  }
}

- (BOOL)_serialize:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _queuePathForSummary:](self, "_queuePathForSummary:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) != 0)
  {
    id v9 = 0LL;
    goto LABEL_4;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v27 = 0LL;
  unsigned int v11 = [v10 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v27];
  id v9 = v27;

  if (v11)
  {
LABEL_4:
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned int v13 = [v12 fileExistsAtPath:v5];

    if (v13)
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v5));
      id v26 = 0LL;
      id v15 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v14,  &v26);
      id v16 = v26;
      id v18 = v16;
      if (v16)
      {
        NSLog(@"WLDPlaybackManager: _serialize: secure unarchiver error: %@", v16);
      }

      else
      {
        id v20 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v15,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___WLKPlaybackSummary, v17),  NSKeyedArchiveRootObjectKey);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        unsigned __int8 v22 = [v4 isEqualToSummary:v21];

        if ((v22 & 1) != 0)
        {
          unsigned __int8 v19 = 1;
          id v23 = v9;
          goto LABEL_13;
        }
      }
    }

    id v25 = v9;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v25));
    id v23 = v25;

    if (!v14)
    {
      unsigned __int8 v19 = 0;
      goto LABEL_15;
    }

    id v15 = (NSKeyedUnarchiver *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _queuePathForSummary:](self, "_queuePathForSummary:", v4));
    unsigned __int8 v19 = [v14 writeToFile:v15 atomically:1];
LABEL_13:

LABEL_15:
    id v9 = v23;
    goto LABEL_16;
  }

  unsigned __int8 v19 = 0;
LABEL_16:

  return v19;
}

- (void)_cleanupSummary:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _queuePathForSummary:](self, "_queuePathForSummary:", a3));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v3 removeItemAtPath:v4 error:0];
}

- (BOOL)_isDirectoryPresentAndNonEmpty:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v4 fileExistsAtPath:v3])
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v3));
    v16[0] = NSURLNameKey;
    v16[1] = NSURLIsDirectoryKey;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:4 errorHandler:&__block_literal_global_317]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
    id v10 = [v9 count];
    BOOL v11 = v10 != 0LL;

    if (v10)
    {
      NSLog(@"WLDPlaybackManager: _checkIfUserDirectoryIsEmpty old path is not empty.");
    }

    else
    {
      NSLog(@"WLDPlaybackManager: _checkIfUserDirectoryIsEmpty found empty directory. Will delete it to use group container one.");
      id v15 = 0LL;
      [v4 removeItemAtPath:v3 error:&v15];
      id v12 = v15;
      unsigned int v13 = v12;
      if (v12) {
        NSLog(@"WLDPlaybackManager: [Error] failed to remove user directory with error: %@.", v12);
      }
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

BOOL __53__WLDPlaybackManager__isDirectoryPresentAndNonEmpty___block_invoke(id a1, NSURL *a2, NSError *a3)
{
  if (a3) {
    NSLog(@"WLDPlaybackManager: [Error] enumerating for pending reports %@ (%@)", a3, a2);
  }
  return a3 == 0LL;
}

- (id)_queueDir
{
  id v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:@"com.apple.watchlistd"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"pending"]);

  if (-[WLDPlaybackManager _isDirectoryPresentAndNonEmpty:](self, "_isDirectoryPresentAndNonEmpty:", v7))
  {
    id v8 = v7;
  }

  else
  {
    uint64_t v9 = WLKDefaultSupportPath();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"com.apple.watchlistd"]);

    id v8 = (id)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:@"pending"]);
    NSLog(@"WLDPlaybackManager: _queueDir using path %@ for pending reports.", v8);
  }

  return v8;
}

- (id)_queuePathForSummary:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[WLDPlaybackManager _queueDir](self, "_queueDir"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v6]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 contentID]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v8, v9));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v10));
  id v12 = [v11 length];
  objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, v12);
  objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @":", @"_", 0, 0, v12);
  id v13 = [v11 copy];
  if ((unint64_t)v12 >= 0x100)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", 0, 255));

    id v13 = (id)v14;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v13]);

  return v15;
}

- (void)_catalogSummary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 sanitizedCopy]);
  id v9 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v9));
  id v5 = v9;

  if (v4)
  {
    uint64_t v10 = WLKDidReportPlaybackDistributedNotificationUserInfoDataKey;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);
    BOOL v11 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v8 postNotificationName:WLKDidReportPlaybackDistributedNotification object:0 userInfo:v7];
  }

  else
  {
    NSLog(@"WLDPlaybackManager: Error serializing summary for notification: %@", v5);
  }

  +[WLKTopShelfCacheManager requestInvalidation](&OBJC_CLASS___WLKTopShelfCacheManager, "requestInvalidation");
}

- (BOOL)_isDirectPlaybackReportingDisabled
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL disableDirectPlaybackReporting = v2->_disableDirectPlaybackReporting;
  objc_sync_exit(v2);

  return disableDirectPlaybackReporting;
}

- (NSMutableDictionary)lastSummaryDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLastSummaryDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end