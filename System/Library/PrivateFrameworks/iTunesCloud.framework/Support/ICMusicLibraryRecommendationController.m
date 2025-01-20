@interface ICMusicLibraryRecommendationController
+ (ICMusicLibraryRecommendationController)sharedLibraryRecommendationController;
- (BOOL)_setupCacheDirectoryStructureWithPath:(id)a3;
- (ICMusicLibraryRecommendationController)init;
- (id)_cacheDirectoryPath;
- (id)_createLocalNotificationDictionaryForRecommendationResult:(id)a3 storePlatformMetadata:(id)a4 recommendationID:(id)a5 identifier:(id)a6;
- (id)_getNetworkConstraints;
- (id)_optInMessageContentForPriorityMessageContent:(id)a3;
- (id)_retrievePreviousRecommendationMatchesFromCache;
- (id)_storeRequestContext;
- (id)_wrapAndCacheResponseModelWithCompiledMLModel:(id)a3;
- (void)_cacheMatchedRecommendations:(id)a3;
- (void)_cleanupExpiredApplicationMessages;
- (void)_clearMLModelCache;
- (void)_clearRecommendationsData;
- (void)_computeLibraryRecommendationWithResponse:(id)a3 completionHandler:(id)a4;
- (void)_createApplicationMessagesForResult:(id)a3 artistNewContentResponse:(id)a4 completion:(id)a5;
- (void)_fetchRecommendationsSetAndModelWithCompletionHandler:(id)a3;
- (void)_handleNewArtistContentResponseNotification:(id)a3;
- (void)_handleRecommendationsResponseModel:(id)a3 completion:(id)a4;
- (void)_optInMessageForPriorityMessage:(id)a3 completion:(id)a4;
- (void)_performRecommendationsRequest;
- (void)_performRecommendationsUpdate;
- (void)_updateOptInIfNecessary;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
- (void)handleAccountStateChange:(id)a3;
- (void)scheduleRecommendationsRefreshTimer;
- (void)startSystemService;
- (void)stopSystemService;
@end

@implementation ICMusicLibraryRecommendationController

- (ICMusicLibraryRecommendationController)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ICMusicLibraryRecommendationController;
  v2 = -[ICMusicLibraryRecommendationController init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isSystemService = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentityStore defaultIdentityStore]( &OBJC_CLASS___ICUserIdentityStore,  "defaultIdentityStore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 DSIDForUserIdentity:v5 outError:0]);
    lastSeenDSID = v3->_lastSeenDSID;
    v3->_lastSeenDSID = (NSNumber *)v6;

    subscriptionObservationToken = v3->_subscriptionObservationToken;
    v3->_subscriptionObservationToken = 0LL;

    v3->_failedToPerformAnalysis = 0;
    v3->_lastTimePeriodicXPCFired = 0.0;
    v3->_refreshIntervalFromBag = 0.0;
    v9 = objc_alloc_init(&OBJC_CLASS___ICMusicLibraryArtistAffinityAnalyzer);
    affinityAnalyzer = v3->_affinityAnalyzer;
    v3->_affinityAnalyzer = v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.itunescloud.ICMusicLibraryRecommendationController.accessQueue", 0LL);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v11;

    *(_WORD *)&v3->_userHasOptedIn = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v13 addObserver:v3 selector:"_handleNewArtistContentResponseNotification:" name:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsHandleNewArtistContentResponseNotification" object:0];
    [v13 addObserver:v3 selector:"_clearRecommendationsData" name:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsClearCacheNotification" object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsHandleNewArtistContentResponseNotification"];
  [v3 removeObserver:@"com.apple.itunescloudd.ICMusicLibraryRecommendationsClearCacheNotification"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ICMusicLibraryRecommendationController;
  -[ICMusicLibraryRecommendationController dealloc](&v4, "dealloc");
}

- (void)startSystemService
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting system service...",  buf,  0xCu);
  }

  if (!self->_isSystemService)
  {
    self->_isSystemService = 1;
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
    [v4 registerObserver:self];

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity autoupdatingActiveAccount]( &OBJC_CLASS___ICUserIdentity,  "autoupdatingActiveAccount"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:]( &OBJC_CLASS___ICMusicSubscriptionStatusMonitor,  "sharedMonitorForIdentity:",  v5));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000B0DF8;
    v9[3] = &unk_1001A4858;
    v9[4] = self;
    v7 = (NSCopying *)objc_claimAutoreleasedReturnValue([v6 beginObservingSubscriptionStatusWithHandler:v9]);
    subscriptionObservationToken = self->_subscriptionObservationToken;
    self->_subscriptionObservationToken = v7;
  }

- (void)stopSystemService
{
  if (self->_isSystemService)
  {
    v3 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Stopping system service...",  (uint8_t *)&v8,  0xCu);
    }

    self->_isSystemService = 0;
    self->_refreshIntervalFromBag = 0.0;
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
    [v4 unregisterObserver:self];

    xpc_activity_unregister((const char *)[@"com.apple.itunescloud.library_recommendations_refresh" UTF8String]);
    if (self->_subscriptionObservationToken)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity autoupdatingActiveAccount]( &OBJC_CLASS___ICUserIdentity,  "autoupdatingActiveAccount"));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusMonitor sharedMonitorForIdentity:]( &OBJC_CLASS___ICMusicSubscriptionStatusMonitor,  "sharedMonitorForIdentity:",  v5));

      [v6 endObservingSubscriptionStatusWithToken:self->_subscriptionObservationToken];
      subscriptionObservationToken = self->_subscriptionObservationToken;
      self->_subscriptionObservationToken = 0LL;
    }

    -[ICMusicLibraryRecommendationController _cleanupExpiredApplicationMessages]( self,  "_cleanupExpiredApplicationMessages");
  }

- (void)scheduleRecommendationsRefreshTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  if ([v3 shouldReduceLibraryRecommendationsXPCInterval])
  {

LABEL_7:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _storeRequestContext](self, "_storeRequestContext"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000B0B54;
    v9[3] = &unk_1001A48A8;
    v9[4] = self;
    [v7 getBagForRequestContext:v8 forceRefetch:0 withCompletionHandler:v9];

    return;
  }

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  unsigned int v5 = [v4 shouldForceLibraryRecommendationAnalysis];

  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Forcing library recommendation analysis without a timer.",  buf,  0xCu);
  }

  -[ICMusicLibraryRecommendationController _performRecommendationsUpdate](self, "_performRecommendationsUpdate");
}

- (void)handleAccountStateChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentityStore]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);

  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue([v5 DSIDForUserIdentity:v6 outError:0]);
  if (v7)
  {
    -[ICMusicLibraryRecommendationController startSystemService](self, "startSystemService");
  }

  else
  {
    -[ICMusicLibraryRecommendationController _clearRecommendationsData](self, "_clearRecommendationsData");
    -[ICMusicLibraryRecommendationController stopSystemService](self, "stopSystemService");
  }

  lastSeenDSID = self->_lastSeenDSID;
  self->_lastSeenDSID = v7;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _getNetworkConstraints](self, "_getNetworkConstraints"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 timeIntervalSince1970];
  if (self->_failedToPerformAnalysis)
  {
    double v7 = v6;
    double lastTimePeriodicXPCFired = self->_lastTimePeriodicXPCFired;
    if (((uint64_t)[v9 networkType] > 999
       || [v4 shouldAllowDataForCellularNetworkTypes])
      && v7 - lastTimePeriodicXPCFired >= self->_refreshIntervalFromBag * 0.7)
    {
      -[ICMusicLibraryRecommendationController _performRecommendationsUpdate]( self,  "_performRecommendationsUpdate",  v7 - lastTimePeriodicXPCFired);
    }
  }
}

- (void)_handleNewArtistContentResponseNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"ICMusicLibraryRecommendationsHandleNewArtistContentFilePath"]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v6 fileExistsAtPath:v5])
  {
    id v12 = 0LL;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v5,  4LL,  &v12));
    id v8 = v12;
    id v9 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v7,  1LL);
    if (!v9 || v8)
    {
      v10 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v14 = self;
        __int16 v15 = 2114;
        v16 = v5;
        __int16 v17 = 2114;
        id v18 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to create NSData blob from filePath=%{public}@ err=%{public}@",  buf,  0x20u);
      }
    }

    else
    {
      v10 = -[AMPMusicArtistNewContentResponse initWithData:]( objc_alloc(&OBJC_CLASS___AMPMusicArtistNewContentResponse),  "initWithData:",  v9);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000B0AA4;
      v11[3] = &unk_1001A6398;
      v11[4] = self;
      -[ICMusicLibraryRecommendationController _handleRecommendationsResponseModel:completion:]( self,  "_handleRecommendationsResponseModel:completion:",  v10,  v11);
    }
  }
}

- (void)_clearRecommendationsData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _cacheDirectoryPath](self, "_cacheDirectoryPath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  unsigned int v5 = v4;
  if (v4)
  {
    os_log_t v6 = (os_log_t)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"serializedRecommendationsResponse"]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"compiledMLModel.mlmodelc"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"musicRecommendationsData"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v6, "path"));
    id v18 = 0LL;
    [v9 removeItemAtPath:v10 error:&v18];
    id v11 = v18;

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    id v17 = v11;
    [v9 removeItemAtPath:v12 error:&v17];
    id v13 = v17;

    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    id v16 = v13;
    [v9 removeItemAtPath:v14 error:&v16];
    id v15 = v16;
  }

  else
  {
    os_log_t v6 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = self;
      __int16 v21 = 2114;
      v22 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%{public}@ Cache Directory URL is nil failed to clear cached recommendations data with path received: %{public}@",  buf,  0x16u);
    }

    id v15 = 0LL;
  }
}

- (void)_cacheMatchedRecommendations:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B075C;
  block[3] = &unk_1001A6C30;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
}

- (void)_performRecommendationsUpdate
{
  self->_failedToPerformAnalysis = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _getNetworkConstraints](self, "_getNetworkConstraints"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
  if ([v4 isWiFiAssociated])
  {
  }

  else
  {
    unsigned __int8 v5 = [v3 shouldAllowDataForCellularNetworkTypes];

    if ((v5 & 1) == 0)
    {
LABEL_8:
      self->_failedToPerformAnalysis = 1;
      goto LABEL_19;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICPrivacyInfo sharedPrivacyInfo](&OBJC_CLASS___ICPrivacyInfo, "sharedPrivacyInfo"));
  unsigned int v7 = [v6 privacyAcknowledgementRequiredForMusic];

  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skipping recommendations update because the user needs to accept the privacy notice",  buf,  0xCu);
    }

    goto LABEL_8;
  }

  if (CFPreferencesGetAppBooleanValue(@"UserRequestedSubscriptionHidden", @"com.apple.mobileipod", 0LL))
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Will not perform recommendations update. The user has disabled Apple Music.",  buf,  0xCu);
    }
  }

  else
  {
    if ([v3 shouldAllowDataForCellularNetworkTypes])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
      unsigned __int8 v11 = [v10 isWiFiAssociated];

      if ((v11 & 1) == 0)
      {
        id v12 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v15 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Performing recommendations update on cellular network",  buf,  0xCu);
        }
      }
    }

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[ICMusicAccountNotificationsSettingsManager sharedManager]( &OBJC_CLASS___ICMusicAccountNotificationsSettingsManager,  "sharedManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000B0574;
    v13[3] = &unk_1001A48D0;
    v13[4] = self;
    -[os_log_s getAccountNotificationsWithCompletionHandler:](v9, "getAccountNotificationsWithCompletionHandler:", v13);
  }

LABEL_19:
}

- (void)_performRecommendationsRequest
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating recommendations", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B0070;
  v6[3] = &unk_1001A4948;
  v6[4] = self;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v6];
}

- (void)_handleRecommendationsResponseModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 artistContentsCount];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 recoId]);
    *(_DWORD *)buf = 138543874;
    id v16 = self;
    __int16 v17 = 2048;
    id v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received New Release Recommendations response, %lu new release albums, recoID: %@.",  buf,  0x20u);
  }

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( -[ICMusicLibraryRecommendationController _wrapAndCacheResponseModelWithCompiledMLModel:]( self,  "_wrapAndCacheResponseModelWithCompiledMLModel:",  v6));
  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000AFA20;
    v12[3] = &unk_1001A4998;
    v12[4] = self;
    id v14 = v7;
    id v13 = v6;
    -[ICMusicLibraryRecommendationController _computeLibraryRecommendationWithResponse:completionHandler:]( self,  "_computeLibraryRecommendationWithResponse:completionHandler:",  v11,  v12);
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)_computeLibraryRecommendationWithResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 responseModel]);
  id v9 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Beginning Affininity Analysis using MLModel.",  buf,  0xCu);
  }

  affinityAnalyzer = self->_affinityAnalyzer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000AF49C;
  v14[3] = &unk_1001A49C0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  -[ICMusicLibraryArtistAffinityAnalyzer performLibraryAnalysisFromResponse:withCompletionHandler:]( affinityAnalyzer,  "performLibraryAnalysisFromResponse:withCompletionHandler:",  v11,  v14);
}

- (void)_fetchRecommendationsSetAndModelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc(&OBJC_CLASS___ICMusicLibraryRecommendationsRequest);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _storeRequestContext](self, "_storeRequestContext"));
  id v7 = -[ICMusicLibraryRecommendationsRequest initWithStoreRequestContext:params:]( v5,  "initWithStoreRequestContext:params:",  v6,  &off_1001B4C78);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000AF3A8;
  v9[3] = &unk_1001A49E8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  -[ICMusicLibraryRecommendationsRequest performRequestWithResponseHandler:]( v7,  "performRequestWithResponseHandler:",  v9);
}

- (void)_clearMLModelCache
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _cacheDirectoryPath](self, "_cacheDirectoryPath"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"compiledMLModel.mlmodelc"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned int v8 = [v3 fileExistsAtPath:v7];

  if (v8)
  {
    id v11 = 0LL;
    [v3 removeItemAtURL:v6 error:&v11];
    id v9 = v11;
    if (v9)
    {
      id v10 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v13 = self;
        __int16 v14 = 2114;
        id v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to remove cached MLModel. err=%{public}@",  buf,  0x16u);
      }
    }
  }
}

- (BOOL)_setupCacheDirectoryStructureWithPath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v16 = 0;
  unsigned int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v16];
  if (v6) {
    BOOL v7 = v16 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v15 = 0LL;
    [v5 removeItemAtPath:v4 error:&v15];
    id v9 = v15;
  }

  else
  {
    if (v6) {
      BOOL v8 = v16 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      BOOL v12 = 1;
      goto LABEL_16;
    }

    id v9 = 0LL;
  }

  id v14 = v9;
  BOOL v12 = 1;
  [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v10 = v14;

  if (v10)
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@ failed to create cache directory structure err=%{public}@",  buf,  0x16u);
    }

    BOOL v12 = 0;
  }

- (id)_wrapAndCacheResponseModelWithCompiledMLModel:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4 && [v4 hasModel])
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _cacheDirectoryPath](self, "_cacheDirectoryPath"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v7));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"serializedRecommendationsResponse"]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"compiledMLModel.mlmodelc"]);
    v38 = (void *)v7;
    unsigned int v37 = -[ICMusicLibraryRecommendationController _setupCacheDirectoryStructureWithPath:]( self,  "_setupCacheDirectoryStructureWithPath:",  v7);
    if ((v37 & 1) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v5 model]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:@"modelDataBlob.bin"]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      unsigned int v11 = [v6 fileExistsAtPath:v10];

      if (v11)
      {
        v48[0] = 0LL;
        [v6 removeItemAtURL:v9 error:v48];
        id v12 = v48[0];
      }

      else
      {
        id v12 = 0LL;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      id v47 = v12;
      [v35 writeToFile:v17 options:1 error:&v47];
      id v18 = v47;

      id v46 = v18;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel compileModelAtURL:error:](&OBJC_CLASS___MLModel, "compileModelAtURL:error:", v9, &v46));
      id v19 = v46;

      if (v19) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"MLModel compileModelAtURL failed with error %@",  v19);
      }
      id v45 = v19;
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[MLModel modelWithContentsOfURL:error:]( &OBJC_CLASS___MLModel,  "modelWithContentsOfURL:error:",  v36,  &v45));
      id v20 = v45;

      __int16 v21 = v20;
      if (v20) {
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"MLModel modelWithContentsOfURL failed with error %@",  v20);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
      unsigned int v23 = [v6 fileExistsAtPath:v22];

      if (v23)
      {
        v44 = v21;
        v24 = &v44;
        [v6 replaceItemAtURL:v39 withItemAtURL:v36 backupItemName:0 options:1 resultingItemURL:0 error:&v44];
      }

      else
      {
        v43 = v21;
        v24 = &v43;
        [v6 copyItemAtURL:v36 toURL:v39 error:&v43];
      }

      id v25 = *v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
      unsigned int v27 = [v6 fileExistsAtPath:v26];

      if (v27)
      {
        id v42 = v25;
        [v6 removeItemAtURL:v40 error:&v42];
        id v13 = v42;
      }

      else
      {
        id v13 = v25;
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue([v40 path]);
      [v34 writeToFile:v28 atomically:1];

      v29 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      unsigned int v30 = [v6 fileExistsAtPath:v29];

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
        id v41 = v13;
        [v6 removeItemAtPath:v31 error:&v41];
        id v32 = v41;

        id v13 = v32;
      }

      id v14 = -[ICMusicLibraryRecommendationsResponse initWithNewArtistContentResponseModel:andMLModel:]( objc_alloc(&OBJC_CLASS___ICMusicLibraryRecommendationsResponse),  "initWithNewArtistContentResponseModel:andMLModel:",  v5,  v33);
    }

    else
    {
      id v13 = 0LL;
      id v14 = 0LL;
    }

    if (v37)
    {
      id v14 = v14;
      id v15 = v14;
      goto LABEL_8;
    }
  }

  else
  {
    id v13 = 0LL;
    id v14 = 0LL;
  }

  id v15 = 0LL;
LABEL_8:

  return v15;
}

- (id)_storeRequestContext
{
  return  -[ICStoreRequestContext initWithBlock:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithBlock:",  &stru_1001A4A08);
}

- (id)_getNetworkConstraints
{
  uint64_t v2 = ICBundleIdentifierForSystemApplicationType(0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [[ICNetworkConstraints alloc] initWithBundleIdentifier:v3];

  return v4;
}

- (id)_cacheDirectoryPath
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByAppendingPathComponent:@"Caches/com.apple.iTunesCloud/LibraryRecommendations/ResourceCache"]);
  return v5;
}

- (id)_retrievePreviousRecommendationMatchesFromCache
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  unsigned int v11 = sub_1000AF1B0;
  id v12 = sub_1000AF1C0;
  id v13 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AF1C8;
  v7[3] = &unk_1001A65D8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  unsigned __int8 v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_cleanupExpiredApplicationMessages
{
  uint64_t v3 = ICBundleIdentifierForSystemApplicationType(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICInAppMessageManager sharedManager](&OBJC_CLASS___ICInAppMessageManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AEE94;
  v7[3] = &unk_1001A5F00;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 messageEntriesForBundleIdentifier:v6 completion:v7];
}

- (void)_createApplicationMessagesForResult:(id)a3 artistNewContentResponse:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___ICStorePlatformRequest);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryRecommendationController _storeRequestContext](self, "_storeRequestContext"));
  [v11 setRequestContext:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 adamID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);

  v26 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  [v11 setItemIdentifiers:v15];

  [v11 setPersonalizationStyle:1];
  [v11 setKeyProfile:ICStorePlatformKeyProfilePlaylistProduct];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000AD6CC;
  v21[3] = &unk_1001A4AA0;
  id v24 = v9;
  id v25 = v10;
  v21[4] = self;
  id v22 = v14;
  id v23 = v8;
  id v16 = v9;
  id v17 = v8;
  id v18 = v14;
  id v19 = v10;
  id v20 = [v11 performWithResponseHandler:v21];
}

- (id)_optInMessageContentForPriorityMessageContent:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___ICIAMMessageContent);
  [v4 setIdentifier:@"album-lockup"];
  id v5 = objc_alloc_init(&OBJC_CLASS___ICIAMParameter);
  [v5 setKey:@"albumTitle"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  [v5 setValue:v6];

  id v7 = objc_alloc_init(&OBJC_CLASS___ICIAMParameter);
  [v7 setKey:@"artistName"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 subtitle]);
  [v7 setValue:v8];

  [v4 addContentParameters:v5];
  [v4 addContentParameters:v7];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 images]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  [v4 addImages:v10];

  return v4;
}

- (void)_optInMessageForPriorityMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICInAppMessageManager sharedManager](&OBJC_CLASS___ICInAppMessageManager, "sharedManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000AD4C8;
  v11[3] = &unk_1001A4AC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 messageEntryWithIdentifier:@"non-subscriber-notification-content-opt-in" bundleIdentifier:@"com.apple.amp.inappmessages.private" completion:v11];
}

- (void)_updateOptInIfNecessary
{
  uint64_t v3 = ICBundleIdentifierForSystemApplicationType(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICInAppMessageManager sharedManager](&OBJC_CLASS___ICInAppMessageManager, "sharedManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AC8EC;
  v7[3] = &unk_1001A5F00;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 messageEntriesForBundleIdentifier:v6 completion:v7];
}

- (id)_createLocalNotificationDictionaryForRecommendationResult:(id)a3 storePlatformMetadata:(id)a4 recommendationID:(id)a5 identifier:(id)a6
{
  id v8 = a4;
  id v65 = a5;
  id v66 = a6;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v9 = [v8 storeAdamID];
  uint64_t v10 = ICBundleIdentifierForSystemApplicationType(0LL);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"NEW_ALBUM_NOTIFICATION_TITLE" value:&stru_1001A7960 table:@"MediaPlayer"]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"NEW_ALBUM_NOTIFICATION_BODY_FORMAT" value:&stru_1001A7960 table:@"MediaPlayer"]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  v60 = v8;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 artistName]);
  v63 = (void *)v14;
  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v15, v16));

  v77[0] = @"title";
  v77[1] = @"body";
  v64 = (void *)v12;
  v78[0] = v12;
  v78[1] = v17;
  v62 = (void *)v17;
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  2LL));
  objc_msgSend(v55, "setObject:forKey:");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v76[0] = &off_1001B40A8;
  v75[0] = @"_tp";
  v75[1] = @"_url";
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100",  v9));
  v76[1] = v19;
  v75[2] = @"_mt";
  v74[0] = @"tap";
  v73[0] = @"actionType";
  v73[1] = @"actionUrl";
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100",  v9));
  v74[1] = v20;
  v74[2] = @"notificationAction";
  v73[2] = @"eventType";
  v73[3] = @"eventVersion";
  v74[3] = &off_1001B40A8;
  v74[4] = v66;
  v73[4] = @"notificationId";
  v73[5] = @"targetType";
  v74[5] = @"notification";
  v74[6] = v65;
  v73[6] = @"recoId";
  v73[7] = @"topic";
  v74[7] = @"xp_amp_notifications";
  v74[8] = v56;
  v73[8] = @"app";
  v73[9] = @"notificationType";
  v73[10] = @"details";
  v74[9] = @"Content";
  v74[10] = &off_1001B4CA0;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  11LL));
  v76[2] = v21;
  uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v76,  v75,  3LL));

  v59 = (void *)v22;
  [v18 addObject:v22];
  v71[0] = @"_tl";
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mediaPlayerBundle](&OBJC_CLASS___NSBundle, "mediaPlayerBundle"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"NEW_ALBUM_NOTIFICATION_GOTO_BUTTON_TITLE" value:&stru_1001A7960 table:@"MediaPlayer"]);
  v72[0] = v24;
  v71[1] = @"_url";
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100",  v9));
  v72[1] = v25;
  v71[2] = @"_mt";
  v70[0] = @"goToAlbum";
  v69[0] = @"actionType";
  v69[1] = @"actionUrl";
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"https://itunes.apple.com/album/id%lld?itsct=NonSubsNewContentRelease&itscg=10100",  v9));
  v70[1] = v26;
  v70[2] = @"notificationAction";
  v69[2] = @"eventType";
  v69[3] = @"eventVersion";
  v70[3] = &off_1001B40A8;
  v70[4] = v66;
  v69[4] = @"notificationId";
  v69[5] = @"targetId";
  v70[5] = @"AmpMusic.Notifications.NewRelease.Buttons.GoToAlbum";
  v70[6] = @"button";
  v69[6] = @"targetType";
  v69[7] = @"recoId";
  v70[7] = v65;
  v70[8] = @"xp_amp_notifications";
  v69[8] = @"topic";
  v69[9] = @"app";
  v70[9] = v56;
  v70[10] = @"Content";
  v69[10] = @"notificationType";
  v69[11] = @"details";
  v70[11] = &off_1001B4CC8;
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v70,  v69,  12LL));
  v72[2] = v27;
  uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  3LL));

  v58 = (void *)v28;
  [v18 addObject:v28];
  [v55 setObject:v18 forKey:@"_ba"];
  [v55 setObject:&off_1001B40A8 forKey:@"content-available"];
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v29 DSIDForUserIdentity:v30 outError:0]);

  if (v31)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 stringValue]);
    [v55 setObject:v32 forKey:@"_ds"];
  }

  else
  {
    [v55 setObject:@"0" forKey:@"_ds"];
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v60 artworkInfos]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 firstObject]);

  v57 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v34,  "artworkURLWithSize:cropStyle:format:",  ICStoreArtworkInfoCropStyleBoundedBox,  ICStoreArtworkInfoImageFormatJPEG,  210.0,  210.0));
  v36 = v35;
  if (v35)
  {
    unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v35 absoluteString]);
    [v55 setObject:v37 forKey:@"_au"];
  }

  [v55 setObject:&off_1001B40C0 forKey:@"_it"];
  else {
    v38 = @"false";
  }
  [v55 setObject:v38 forKey:@"_ex"];
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ams_%@", v66));
  [v55 setObject:v39 forKey:@"_id"];

  [v55 setObject:v56 forKey:@"_bid"];
  v40 = (void *)objc_claimAutoreleasedReturnValue([v60 releaseDate]);
  if (v40)
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v42 = [v40 compare:v41];

    if (v42 == (id)1)
    {
      v43 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setDateFormat:](v43, "setDateFormat:", @"yyyy-MM-dd'T'HH:mm:ssZ");
      v44 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US_POSIX");
      -[NSDateFormatter setLocale:](v43, "setLocale:", v44);

      id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneForSecondsFromGMT:]( &OBJC_CLASS___NSTimeZone,  "timeZoneForSecondsFromGMT:",  0LL));
      -[NSDateFormatter setTimeZone:](v43, "setTimeZone:", v45);

      id v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v43, "stringFromDate:", v40));
      [v55 setObject:v46 forKey:@"_st"];
    }
  }

  v67[0] = @"eventType";
  v67[1] = @"eventVersion";
  v68[0] = @"notificationRequest";
  v68[1] = &off_1001B40A8;
  v67[2] = @"isExplicit";
  unsigned int v47 = [v60 isExplicit];
  v48 = @"0";
  if (v47) {
    v48 = @"1";
  }
  v68[2] = v48;
  v67[3] = @"language";
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  uint64_t v50 = objc_claimAutoreleasedReturnValue([v49 currentLocale]);
  v51 = (void *)v50;
  v52 = &stru_1001A7960;
  if (v50) {
    v52 = (const __CFString *)v50;
  }
  v68[3] = v52;
  v68[4] = v66;
  v67[4] = @"notificationId";
  v67[5] = @"notificationType";
  v68[5] = @"Content";
  v68[6] = @"29";
  v67[6] = @"platformId";
  v67[7] = @"platformName";
  v68[7] = @"P84";
  v68[8] = v65;
  v67[8] = @"recoId";
  v67[9] = @"topic";
  v68[9] = @"xp_amp_notifications";
  v68[10] = v56;
  v67[10] = @"app";
  v67[11] = @"details";
  v68[11] = &off_1001B4CF0;
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  12LL));

  [v55 setObject:v53 forKey:@"_mt"];
  return v55;
}

- (void).cxx_destruct
{
}

+ (ICMusicLibraryRecommendationController)sharedLibraryRecommendationController
{
  if (qword_1001DB710 != -1) {
    dispatch_once(&qword_1001DB710, &stru_1001A4830);
  }
  return (ICMusicLibraryRecommendationController *)(id)qword_1001DB718;
}

@end