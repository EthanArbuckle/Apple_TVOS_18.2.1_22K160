@interface MRDRouteRecommendationController
- (BOOL)isRoutePlaying:(id)a3;
- (BOOL)shouldUseVideoSymbolForDevices:(id)a3 bundleIdentifier:(id)a4;
- (MRAVEndpoint)activeSystemEndpoint;
- (MRAVEndpoint)localSystemEndpoint;
- (MRAVRoutingDiscoverySession)discoverySession;
- (MRDMediaActivityManager)mediaActivityManager;
- (MRDMediaAppInFocusMonitor)focusMonitor;
- (MRDNowPlayingStateMonitor)nowPlayingStateMonitor;
- (MRDRouteRecommendationController)init;
- (MRDRoutedBackgroundActivityManager)routedBackgroundActivityManager;
- (MRRouteRecommender)recommender;
- (MRRouteRepresentable)lastDonatedPickerChoice;
- (MRRouteRepresentable)lastUnusedAutoRoute;
- (MRRouteValidator)validator;
- (MSVTimer)undoTimer;
- (NSArray)recommendedRoutes;
- (NSArray)visibleMediaApps;
- (NSMutableArray)signpostIds;
- (NSString)lastUnusedAutoRouteBundleIdentifier;
- (OS_dispatch_queue)queue;
- (id)_updateMediaControlsBlob:(id)a3 sender:(id)a4;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)_handleOutputDevicesDidChangeNotification:(id)a3;
- (void)airPlayTo:(id)a3 completion:(id)a4;
- (void)clearUnusedAutoRoute;
- (void)didReceiveNewRecommendations:(id)a3 forBundleIdentifier:(id)a4;
- (void)dismissAllBannerRequests;
- (void)donatePickerChoiceFor:(id)a3 bundleIdentifier:(id)a4 contextIdentifier:(id)a5;
- (void)handOffQueueOrAirPlay:(id)a3 sourceEndpoint:(id)a4 destinationEndpoint:(id)a5 playerPath:(id)a6 completion:(id)a7;
- (void)handleAutoRouteResult:(unint64_t)a3 forRoute:(id)a4 primaryBundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7;
- (void)handleDeltaResult:(unint64_t)a3 forRoute:(id)a4 devicesToAdd:(id)a5 sourceEndpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9;
- (void)handlePlaybackStartForEndpoint:(id)a3 bundleIdentifier:(id)a4 eligibleForRecommendationsOutsideApp:(BOOL)a5;
- (void)handleResult:(unint64_t)a3 forRoute:(id)a4 devices:(id)a5 endpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9;
- (void)ingestMockedRecommendation:(id)a3 classification:(int64_t)a4 isCallToAction:(BOOL)a5;
- (void)mediaApplicationsInFocus:(id)a3;
- (void)openRoutePickerForRouteUID:(id)a3;
- (void)performTopologyModificationToRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 requestName:(id)a6 completion:(id)a7;
- (void)remoteControl:(id)a3 completion:(id)a4;
- (void)route:(id)a3 endpoint:(id)a4 bundleIdentifier:(id)a5 emittedEvent:(unint64_t)a6;
- (void)sendEventForAutoRouteBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7;
- (void)sendEventForCallToActionForRouteCandidate:(id)a3 bundleIdentifier:(id)a4 isOutsideApp:(BOOL)a5 contextIdentifier:(id)a6;
- (void)sendEventForOneTapSuggestionBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7;
- (void)setASEToLocal;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setFocusMonitor:(id)a3;
- (void)setLastDonatedPickerChoice:(id)a3;
- (void)setLastUnusedAutoRoute:(id)a3;
- (void)setLastUnusedAutoRouteBundleIdentifier:(id)a3;
- (void)setLocalSystemEndpoint:(id)a3;
- (void)setMediaActivityManager:(id)a3;
- (void)setNowPlayingStateMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecommendedRoutes:(id)a3;
- (void)setRecommender:(id)a3;
- (void)setRoutedBackgroundActivityManager:(id)a3;
- (void)setSignpostIds:(id)a3;
- (void)setUndoTimer:(id)a3;
- (void)setValidator:(id)a3;
- (void)setVisibleMediaApps:(id)a3;
- (void)setup;
- (void)setupTimerForRoute:(id)a3 bundleIdentifier:(id)a4;
- (void)signpostEndWillShowBanner:(BOOL)a3;
- (void)stopAirPlayingAndRemoteControlling;
@end

@implementation MRDRouteRecommendationController

- (MRDRouteRecommendationController)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRDRouteRecommendationController;
  v2 = -[MRDRouteRecommendationController init](&v14, "init");
  if (v2)
  {
    v3 = -[MRDMediaAppInFocusMonitor initWithDelegate:]( objc_alloc(&OBJC_CLASS___MRDMediaAppInFocusMonitor),  "initWithDelegate:",  v2);
    -[MRDRouteRecommendationController setFocusMonitor:](v2, "setFocusMonitor:", v3);

    v4 = -[MRDNowPlayingStateMonitor initWithDelegate:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingStateMonitor),  "initWithDelegate:",  v2);
    -[MRDRouteRecommendationController setNowPlayingStateMonitor:](v2, "setNowPlayingStateMonitor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:]( &OBJC_CLASS___MRAVRoutingDiscoverySessionConfiguration,  "configurationWithEndpointFeatures:",  8LL));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:]( &OBJC_CLASS___MRAVRoutingDiscoverySession,  "discoverySessionWithConfiguration:",  v5));
    -[MRDRouteRecommendationController setDiscoverySession:](v2, "setDiscoverySession:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    -[MRDRouteRecommendationController setActiveSystemEndpoint:](v2, "setActiveSystemEndpoint:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    -[MRDRouteRecommendationController setLocalSystemEndpoint:](v2, "setLocalSystemEndpoint:", v8);

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaRemote.MRDRouteRecommendationController.queue", v10);
    -[MRDRouteRecommendationController setQueue:](v2, "setQueue:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[MRDRouteRecommendationController setSignpostIds:](v2, "setSignpostIds:", v12);

    -[MRDRouteRecommendationController setup](v2, "setup");
  }

  return v2;
}

- (void)setup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController discoverySession](self, "discoverySession"));
  [v3 setAlwaysAllowUpdates:1];

  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  [v4 addObserver:self selector:"_handleOutputDevicesDidChangeNotification:" name:MRAVEndpointDidAddOutputDeviceNotification object:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  [v6 addObserver:self selector:"_handleOutputDevicesDidChangeNotification:" name:MRAVEndpointDidChangeOutputDeviceNotification object:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
  [v8 addObserver:self selector:"_handleOutputDevicesDidChangeNotification:" name:MRAVEndpointDidRemoveOutputDeviceNotification object:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:self selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  [v11 addObserver:self selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v12];

  uint64_t v14 = _MRLogForCategory(13LL, v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController discoverySession](self, "discoverySession"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController discoverySession](self, "discoverySession"));
    *(_DWORD *)buf = 134218498;
    v33 = self;
    __int16 v34 = 2048;
    v35 = v16;
    __int16 v36 = 2112;
    v37 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] <%p> Setup RRC: discovery session (%p) = %@",  buf,  0x20u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController discoverySession](self, "discoverySession"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100146718;
  v29[3] = &unk_10039BA20;
  objc_copyWeak(&v30, &location);
  id v19 = [v18 addEndpointsAddedCallback:v29];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController discoverySession](self, "discoverySession"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100146900;
  v27[3] = &unk_10039BA20;
  objc_copyWeak(&v28, &location);
  id v21 = [v20 addEndpointsModifiedCallback:v27];

  uint64_t v23 = _MRLogForCategory(13LL, v22);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController discoverySession](self, "discoverySession"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController discoverySession](self, "discoverySession"));
    *(_DWORD *)buf = 134218498;
    v33 = self;
    __int16 v34 = 2048;
    v35 = v25;
    __int16 v36 = 2112;
    v37 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] <%p> Setup RRC: added callbacks for discovery session (%p) = %@",  buf,  0x20u);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (MRRouteRecommender)recommender
{
  v2 = self;
  objc_sync_enter(v2);
  recommender = v2->_recommender;
  if (!recommender)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MRDIRDRouteRecommender);
    v5 = v2->_recommender;
    v2->_recommender = (MRRouteRecommender *)v4;

    -[MRRouteRecommender setDelegate:](v2->_recommender, "setDelegate:", v2);
    recommender = v2->_recommender;
  }

  v6 = recommender;
  objc_sync_exit(v2);

  return v6;
}

- (MRDMediaActivityManager)mediaActivityManager
{
  return +[MRDMediaActivityManager manager](&OBJC_CLASS___MRDMediaActivityManager, "manager");
}

- (void)dismissAllBannerRequests
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController mediaActivityManager](self, "mediaActivityManager"));
  [v2 dismissAllBannerRequests];
}

- (MRRouteValidator)validator
{
  id v2 = self;
  objc_sync_enter(v2);
  validator = v2->_validator;
  if (!validator)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MRDRouteValidator);
    v5 = v2->_validator;
    v2->_validator = (MRRouteValidator *)v4;

    validator = v2->_validator;
  }

  v6 = validator;
  objc_sync_exit(v2);

  return v6;
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey]);
  unsigned int v7 = [v6 intValue];

  if (!v7)
  {
    uint64_t v9 = _MRLogForCategory(13LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] _handleActiveSystemEndpointDidChangeNotification: %@",  buf,  0xCu);
    }

    dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController queue](self, "queue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100146DA4;
    v15[3] = &unk_1003A2C20;
    v15[4] = self;
    id v16 = v12;
    id v14 = v12;
    MRAVEndpointResolveActiveSystemEndpointWithType(0LL, v13, v15, 7.0);
  }
}

- (void)_handleOutputDevicesDidChangeNotification:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint", a3));
  if ([v6 shouldDonate])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRIRRoute routeWithEndpoint:](&OBJC_CLASS___MRIRRoute, "routeWithEndpoint:", v6));
    [v4 updateRouteCandidate:v5];
  }
}

- (void)donatePickerChoiceFor:(id)a3 bundleIdentifier:(id)a4 contextIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController lastDonatedPickerChoice](self, "lastDonatedPickerChoice"));
  unsigned int v12 = [v8 isEqual:v11];

  if (v12)
  {
    uint64_t v14 = _MRLogForCategory(13LL, v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] Not dropping duplicate picker choice for %@ - picks are distributed",  (uint8_t *)&v18,  0xCu);
    }
  }

  -[MRDRouteRecommendationController setLastDonatedPickerChoice:](self, "setLastDonatedPickerChoice:", v8);
  id v16 = [[IRMediaEvent alloc] initWithEventType:0 eventSubType:0];
  [v16 setBundleID:v10];

  [v16 setContextIdentifier:v9];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
  [v17 addEvent:v16 forRouteCandidate:v8];
}

- (void)mediaApplicationsInFocus:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  -[MRDRouteRecommendationController setVisibleMediaApps:](self, "setVisibleMediaApps:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController focusMonitor](self, "focusMonitor"));
  unsigned int v7 = [v6 lockScreenVisible];

  if ([v4 count]) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  uint64_t v10 = _MRLogForCategory(13LL, v8);
  dispatch_queue_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      unsigned int v12 = @"OnEvents";
    }
    else {
      unsigned int v12 = @"Paused";
    }
    id v13 = [v4 count];
    uint64_t v14 = @"NO";
    *(_DWORD *)id v28 = 138413058;
    *(void *)&v28[4] = v12;
    *(_WORD *)&v28[12] = 2048;
    if (v7) {
      uint64_t v14 = @"YES";
    }
    *(void *)&v28[14] = v13;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] setting mode to %@: %lu media apps in focus: %@, lockscreen: %@",  v28,  0x2Au);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
  id v16 = v15;
  if (v9)
  {
    id v17 = [v15 mode];

    if (v17 == (id)1)
    {
      uint64_t v19 = _MRLogForCategory(13LL, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v28 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] mode already set to update on events - won't set again",  v28,  2u);
      }
    }

    else
    {
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
      -[os_log_s setMode:](v20, "setMode:", 1LL);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[NSMutableArray addObject:](self->_signpostIds, "addObject:", v21);
    uint64_t v23 = _MRLogForCategory(13LL, v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (char *)[v21 hash];
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v26 = (os_signpost_id_t)v25;
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)id v28 = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v26,  "RequestRouteRecommendations",  "",  v28,  2u);
      }
    }
  }

  else
  {
    [v15 setMode:0];

    -[MRDRouteRecommendationController dismissAllBannerRequests](self, "dismissAllBannerRequests");
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRouteRecommendationController routedBackgroundActivityManager]( self,  "routedBackgroundActivityManager",  *(_OWORD *)v28));
  [v27 mediaApplicationsInFocus:v4];
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRouteRecommendationController lastUnusedAutoRouteBundleIdentifier]( self,  "lastUnusedAutoRouteBundleIdentifier",  a3));
  if (!v4) {
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  if ([v5 displayOn])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 presentedBundleIdentifiers]);
    unsigned int v8 = [v7 containsObject:v4];

    if (v8)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController undoTimer](self, "undoTimer"));

      if (v9)
      {
        -[MRDRouteRecommendationController setUndoTimer:](self, "setUndoTimer:", 0LL);
        uint64_t v11 = _MRLogForCategory(13LL, v10);
        unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] cancelling timer, %@ is in focus again",  (uint8_t *)&v15,  0xCu);
        }
      }

      goto LABEL_11;
    }
  }

  else
  {
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController undoTimer](self, "undoTimer"));

  if (!v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController lastUnusedAutoRoute](self, "lastUnusedAutoRoute"));
    -[MRDRouteRecommendationController setupTimerForRoute:bundleIdentifier:]( self,  "setupTimerForRoute:bundleIdentifier:",  v14,  v4);
  }

- (void)didReceiveNewRecommendations:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(13LL, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC] %@", buf, 0xCu);
  }

  -[MRDRouteRecommendationController setRecommendedRoutes:](self, "setRecommendedRoutes:", v6);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 postNotificationName:@"MRRouteRecommenderDidReceiveNewRecommendationsNotification" object:self];

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "msv_compactMap:", &stru_1003A2C60));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v13 primaryUIApplicationBundleIdentifier]);

  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v16 = [v15 showRouteRecommendationsOutsideApps];
  if (v7) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0LL;
  }

  if ((v17 & 1) != 0)
  {
    uint64_t v19 = _MRLogForCategory(13LL, v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v14;
      __int16 v41 = 2112;
      id v42 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] overriding %@ with %@ - request outside app",  buf,  0x16u);
    }

    id v21 = v7;
    id v14 = v21;
  }

  else
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
    id v23 = [v22 mode];

    if (v23 != (id)1)
    {
      uint64_t v32 = _MRLogForCategory(13LL, v24);
      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
        id v34 = [v33 mode];
        id v35 = [v12 count];
        *(_DWORD *)buf = 134218498;
        id v40 = v34;
        __int16 v41 = 2048;
        id v42 = v35;
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] Session mode is %ld - ignoring %lu recommendations - primary: %@",  buf,  0x20u);
      }

      goto LABEL_17;
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  unsigned int v26 = [v25 lockScreenVisible];

  if (v26)
  {
    uint64_t v28 = _MRLogForCategory(13LL, v27);
    __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v12 count];
      *(_DWORD *)buf = 134217984;
      id v40 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] lockscreen is visible - ignoring %lu recommendations",  buf,  0xCu);
    }

- (void)signpostEndWillShowBanner:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController signpostIds](self, "signpostIds"));
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController signpostIds](self, "signpostIds"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController signpostIds](self, "signpostIds"));
    [v9 removeFirstObject];

    uint64_t v11 = _MRLogForCategory(13LL, v10);
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (char *)[v8 hash];
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = (os_signpost_id_t)v13;
      if (os_signpost_enabled(v12))
      {
        int v15 = @"NO";
        if (v3) {
          int v15 = @"YES";
        }
        int v16 = 138412290;
        uint64_t v17 = v15;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  v14,  "RequestRouteRecommendations",  "willShowBanner = %@",  (uint8_t *)&v16,  0xCu);
      }
    }
  }

- (BOOL)shouldUseVideoSymbolForDevices:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings")),
        unsigned int v8 = [v7 preferRoutesMatchingMediaType],
        v7,
        v8))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaBundleManager shared](&OBJC_CLASS___MRDMediaBundleManager, "shared"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cachedEligibilityOf:v6]);

    else {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = objc_msgSend(v5, "mr_containsVideoOutputDevice");
  }

  return v11;
}

- (void)setASEToLocal
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController activeSystemEndpoint](self, "activeSystemEndpoint"));
  unsigned __int8 v4 = [v3 isLocalEndpoint];

  if ((v4 & 1) == 0)
  {
    id v6 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 reason:@"Coriander setASEToLocal"];
    [v6 setChangeType:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController queue](self, "queue"));
    [v6 perform:v5 completion:&stru_1003A2DB8];
  }

- (void)stopAirPlayingAndRemoteControlling
{
  id v4 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 reason:@"Coriander Clear State"];
  [v4 setChangeType:0];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController queue](self, "queue"));
  [v4 perform:v3 completion:&stru_1003A2DD8];
}

- (void)sendEventForOneTapSuggestionBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v15 = a7;
  uint64_t v16 = 3LL;
  switch(a3)
  {
    case 0uLL:
      uint64_t v17 = _MRLogForCategory(13LL, v14);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      __int16 v25 = 0;
      uint64_t v19 = "[MRDRRC] banner not presented, no events will be sent";
      v20 = (uint8_t *)&v25;
      goto LABEL_7;
    case 2uLL:
      uint64_t v21 = _MRLogForCategory(13LL, v14);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = 0;
        uint64_t v19 = "[MRDRRC] banner long pressed, route picker will be shown, no banner events will be sent";
        v20 = (uint8_t *)&v24;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
      }

- (void)sendEventForAutoRouteBannerResult:(unint64_t)a3 routeCandidate:(id)a4 bundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v15 = a7;
  if (a3 - 3 < 2)
  {
    uint64_t v20 = 1LL;
    goto LABEL_12;
  }

  if (a3 != 2)
  {
    if (!a3)
    {
      uint64_t v16 = _MRLogForCategory(13LL, v14);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = 0;
        uint64_t v18 = "[MRDRRC] banner not presented, no events will be sent";
        uint64_t v19 = (uint8_t *)&v25;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
        goto LABEL_10;
      }

      goto LABEL_10;
    }

    uint64_t v20 = 2LL;
LABEL_12:
    id v22 = [[IRMediaEvent alloc] initWithEventType:v20 eventSubType:0];
    [v22 setBundleID:v13];
    [v22 setIsOutsideApp:v8];
    [v22 setContextIdentifier:v15];
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
    [v23 addEvent:v22 forRouteCandidate:v12];

    goto LABEL_13;
  }

  uint64_t v21 = _MRLogForCategory(13LL, v14);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v24 = 0;
    uint64_t v18 = "[MRDRRC] banner long pressed, route picker will be shown, no banner events will be sent";
    uint64_t v19 = (uint8_t *)&v24;
    goto LABEL_9;
  }

- (void)sendEventForCallToActionForRouteCandidate:(id)a3 bundleIdentifier:(id)a4 isOutsideApp:(BOOL)a5 contextIdentifier:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v14 = [[IRMediaEvent alloc] initWithEventType:11 eventSubType:0];
  [v14 setBundleID:v11];

  [v14 setIsOutsideApp:v6];
  [v14 setContextIdentifier:v10];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
  [v13 addEvent:v14 forRouteCandidate:v12];
}

- (void)airPlayTo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(13LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController localSystemEndpoint](self, "localSystemEndpoint"));
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v11;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC] Will AirPlay %@ to %@", buf, 0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController localSystemEndpoint](self, "localSystemEndpoint"));
  objc_initWeak((id *)buf, v12);

  id v13 = objc_alloc(&OBJC_CLASS___MRRequestDetails);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
  uint64_t v16 = -[MRRequestDetails initWithName:requestID:reason:]( v13,  "initWithName:requestID:reason:",  @"RouteRecommendation.AirPlay",  v15,  @"MRDRRC/AP");

  uint64_t v17 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]( objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest),  "initWithRequestDetails:type:outputDevices:",  v16,  3LL,  v6);
  -[MRGroupTopologyModificationRequest setMuteUntilFinished:](v17, "setMuteUntilFinished:", 1LL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController localSystemEndpoint](self, "localSystemEndpoint"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController queue](self, "queue"));
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  id v23 = sub_10014974C;
  __int16 v24 = &unk_1003A2E40;
  id v20 = v7;
  id v25 = v20;
  objc_copyWeak(&v26, (id *)buf);
  [v18 modifyTopologyWithRequest:v17 withReplyQueue:v19 completion:&v21];

  -[MRDRouteRecommendationController setASEToLocal](self, "setASEToLocal", v21, v22, v23, v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak((id *)buf);
}

- (void)handOffQueueOrAirPlay:(id)a3 sourceEndpoint:(id)a4 destinationEndpoint:(id)a5 playerPath:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v18 = _MRLogForCategory(13LL, v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
    *(_DWORD *)buf = 138412802;
    id v37 = v20;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] Will try to HandOff or AirPlay to %@ (%@) pp: %@",  buf,  0x20u);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v22 = [v21 enableQueueHandOffForRouteRecommendations];

  if ((v22 & 1) != 0)
  {
    id v24 = objc_alloc_init(&OBJC_CLASS___MRPlaybackSessionMigrateRequest);
    [v24 setPlayerPath:v15];
    id v25 = objc_alloc(&OBJC_CLASS___MRRequestDetails);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
    uint64_t v28 = -[MRRequestDetails initWithName:requestID:reason:]( v25,  "initWithName:requestID:reason:",  @"RouteRecommendation.HandOffQueueOrAirPlay",  v27,  @"MRDRRC/QHOFallbackToAirPlay");

    __int16 v29 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]( objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest),  "initWithRequestDetails:type:outputDevices:",  v28,  3LL,  v12);
    -[MRGroupTopologyModificationRequest setMuteUntilFinished:](v29, "setMuteUntilFinished:", 1LL);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController queue](self, "queue"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100149A9C;
    v33[3] = &unk_10039BC48;
    id v35 = v16;
    id v34 = v14;
    [v13 migrateToEndpointOrModifyTopology:v34 migrationRequest:v24 topologyModificationRequest:v29 withReplyQueue:v30 completion:v33];
  }

  else
  {
    uint64_t v31 = _MRLogForCategory(13LL, v23);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] HandOff is disabled, AirPlaying...",  buf,  2u);
    }

    -[MRDRouteRecommendationController airPlayTo:completion:](self, "airPlayTo:completion:", v12, v16);
  }
}

- (void)remoteControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___MRUpdateActiveSystemEndpointRequest);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 outputDeviceUIDs]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  id v11 = [v8 initWithOutputDeviceUID:v10 reason:@"Coriander One-Tap Recommendation accepted"];

  [v11 setChangeType:0];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100149BDC;
  v15[3] = &unk_1003A2E68;
  id v16 = v6;
  id v17 = v7;
  id v13 = v6;
  id v14 = v7;
  [v11 perform:v12 completion:v15];
}

- (void)performTopologyModificationToRoute:(id)a3 devices:(id)a4 endpoint:(id)a5 requestName:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = v12;
  id v15 = v13;
  id v16 = a7;
  id v17 = a6;
  id v18 = a3;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"MRDRRC:TM/%@", v17));

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 routeIdentifier]);
  v172 = v15;
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v15 debugName]);
  uint64_t v25 = MRAVOutputDeviceArrayDescription(v14);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"route=%@, endpoint=%@, devices=%@",  v23,  v24,  v26));

  uint64_t v28 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  v20,  v22);
  id v30 = v28;
  if (v27) {
    -[NSMutableString appendFormat:](v28, "appendFormat:", @" for %@", v27);
  }
  uint64_t v31 = _MRLogForCategory(10LL, v29);
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v188 = v30;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v181[0] = _NSConcreteStackBlock;
  v181[1] = 3221225472LL;
  v181[2] = sub_10014AE10;
  v181[3] = &unk_10039CB80;
  id v169 = v27;
  id v182 = v169;
  v176 = v20;
  v183 = v176;
  id v175 = v22;
  id v184 = v175;
  id v168 = v19;
  id v185 = v168;
  id v167 = v16;
  id v186 = v167;
  v166 = objc_retainBlock(v181);
  v33 = v172;
  if (v172) {
    unsigned int v34 = objc_msgSend(v14, "mr_any:", &stru_1003A2E88);
  }
  else {
    unsigned int v34 = 0;
  }
  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController focusMonitor](self, "focusMonitor"));
  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 bundlesInFocus]);

  v170 = v36;
  id v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "msv_filter:", &stru_1003A2EA8));
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v37));

  id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController focusMonitor](self, "focusMonitor"));
  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 mediaBundlesInFocus]);

  v171 = v40;
  id v41 = [v40 mutableCopy];
  [v41 minusSet:v38];
  v174 = v38;
  if ([v38 count]) {
    BOOL v42 = [v41 count] == 0;
  }
  else {
    BOOL v42 = 0;
  }
  id v43 = v41;
  uint64_t v44 = objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController localSystemEndpoint](self, "localSystemEndpoint"));
  v45 = self;
  uint64_t v46 = objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController activeSystemEndpoint](self, "activeSystemEndpoint"));
  uint64_t v47 = v46;
  BOOL v162 = v42;
  if (v42) {
    v48 = (void *)v46;
  }
  else {
    v48 = (void *)v44;
  }
  id v173 = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue([v173 uniqueIdentifier]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v172 uniqueIdentifier]);
  v165 = (void *)v44;
  uint64_t v149 = v44;
  v51 = (void *)v47;
  uint64_t v52 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"visible RC: %@\n visible AP: %@\n sEP: %@, dEP: %@\n ASE: %@ local: %@",  v174,  v41,  v49,  v50,  v47,  v149));

  uint64_t v54 = _MRLogForCategory(10LL, v53);
  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
  v56 = v43;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v188 = v176;
    __int16 v189 = 2114;
    id v190 = v175;
    __int16 v191 = 2112;
    v192 = (const __CFString *)v52;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v164 = (void *)v52;

  if (v34)
  {
    v156 = v14;
    v157 = v43;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 nowPlayingServer]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v173 origin]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v59 originClientForOrigin:v60]);

    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 activeNowPlayingClient]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 client]);
    uint64_t v64 = objc_claimAutoreleasedReturnValue([v63 bundleIdentifier]);

    v155 = v61;
    v65 = (void *)objc_claimAutoreleasedReturnValue([v61 activeNowPlayingClient]);
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 activePlayerClient]);
    unsigned int v67 = [v66 isPlaying];

    v68 = v51;
    v152 = v45;
    v69 = (void *)v64;
    if (v64) {
      unsigned int v159 = [v170 containsObject:v64];
    }
    else {
      unsigned int v159 = 0;
    }
    id v73 = v172;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 nowPlayingServer]);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v73 origin]);
    v77 = (void *)objc_claimAutoreleasedReturnValue([v75 originClientForOrigin:v76]);

    v78 = (void *)objc_claimAutoreleasedReturnValue([v77 activeNowPlayingClient]);
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 client]);
    uint64_t v80 = objc_claimAutoreleasedReturnValue([v79 bundleIdentifier]);

    v153 = v77;
    v81 = (void *)objc_claimAutoreleasedReturnValue([v77 activeNowPlayingClient]);
    v82 = (void *)objc_claimAutoreleasedReturnValue([v81 activePlayerClient]);
    unsigned int v83 = [v82 isPlaying];

    if (v80) {
      unsigned int v150 = [v171 containsObject:v80];
    }
    else {
      unsigned int v150 = 0;
    }
    v84 = (void *)objc_claimAutoreleasedReturnValue([v173 uniqueIdentifier]);
    id v154 = v73;
    uint64_t v85 = objc_claimAutoreleasedReturnValue([v73 uniqueIdentifier]);
    v86 = (void *)v85;
    if (v67) {
      v87 = @"YES";
    }
    else {
      v87 = @"NO";
    }
    if (v83) {
      v88 = @"YES";
    }
    else {
      v88 = @"NO";
    }
    v158 = (void *)v80;
    uint64_t v89 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sEP: %@\n dEP: %@\n sNP: %@\n dNP: %@\n sPL: %@ - dPL: %@\n",  v84,  v85,  v69,  v80,  v87,  v88));

    uint64_t v91 = _MRLogForCategory(10LL, v90);
    v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v188 = v176;
      __int16 v189 = 2114;
      id v190 = v175;
      __int16 v191 = 2112;
      v192 = (const __CFString *)v89;
      _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

    v33 = v172;
    if (((v67 ^ 1 | v159) & 1) == 0 && [v171 count])
    {
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Pausing ASE - NP: %@",  v69));
      uint64_t v96 = _MRLogForCategory(10LL, v95);
      v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v188 = v176;
        __int16 v189 = 2114;
        id v190 = v175;
        __int16 v191 = 2112;
        v192 = v94;
        _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      v177[0] = _NSConcreteStackBlock;
      v177[1] = 3221225472LL;
      v177[2] = sub_10014B088;
      v177[3] = &unk_1003A2ED0;
      id v178 = v69;
      id v179 = v175;
      v180 = v176;
      MRMediaRemoteSendCommandToPlayer(1LL, &__NSDictionary0__struct, 0LL, 0LL, 0LL, v177);
    }

    if (!v162)
    {
      v98 = (void *)v89;
      uint64_t v106 = _MRLogForCategory(10LL, v93);
      v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v188 = v176;
        __int16 v189 = 2114;
        id v190 = v175;
        __int16 v191 = 2112;
        v192 = @"Non-RC visible: AP";
        _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      id v14 = v156;
      v72 = v166;
      -[MRDRouteRecommendationController airPlayTo:completion:](v152, "airPlayTo:completion:", v156, v166);
      v56 = v157;
      v105 = v154;
      goto LABEL_75;
    }

    if (v67)
    {
      id v14 = v156;
      if ((v159 & 1) != 0)
      {
        v98 = (void *)v89;
        uint64_t v99 = _MRLogForCategory(10LL, v93);
        v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v188 = v176;
          __int16 v189 = 2114;
          id v190 = v175;
          __int16 v191 = 2112;
          v192 = @"Only RC, source playing: QHO/AP";
          _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
        }

        v101 = -[MRClient initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithBundleIdentifier:",  v69);
        v102 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
        v104 = -[MRPlayerPath initWithOrigin:client:player:](v102, "initWithOrigin:client:player:", v103, v101, 0LL);

        v105 = v154;
        v72 = v166;
        -[MRDRouteRecommendationController handOffQueueOrAirPlay:sourceEndpoint:destinationEndpoint:playerPath:completion:]( v152,  "handOffQueueOrAirPlay:sourceEndpoint:destinationEndpoint:playerPath:completion:",  v156,  v68,  v154,  v104,  v166);

        goto LABEL_74;
      }

      uint64_t v112 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only RC, source was playing %@ (not FG): Migrating",  v69));
      uint64_t v114 = _MRLogForCategory(10LL, v113);
      v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v188 = v176;
        __int16 v189 = 2114;
        id v190 = v175;
        __int16 v191 = 2112;
        v192 = (const __CFString *)v112;
        _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      id v116 = [v174 mutableCopy];
      v163 = (void *)v112;
      if (v69) {
        uint64_t v117 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v69));
      }
      else {
        uint64_t v117 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
      }
      v98 = (void *)v89;
      v151 = (void *)v117;
      [v116 minusSet:v117];
      v125 = (void *)objc_claimAutoreleasedReturnValue([v116 anyObject]);
      v160 = v116;
      uint64_t v126 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"migration candidates: %@, will try to migrate %@",  v116,  v125));
      uint64_t v128 = _MRLogForCategory(10LL, v127);
      v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v188 = v176;
        __int16 v189 = 2114;
        id v190 = v175;
        __int16 v191 = 2112;
        v192 = (const __CFString *)v126;
        _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      v130 = -[MRClient initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithBundleIdentifier:",  v125);
      v131 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
      v133 = -[MRPlayerPath initWithOrigin:client:player:](v131, "initWithOrigin:client:player:", v132, v130, 0LL);

      v105 = v154;
      v134 = (void *)v126;
      v72 = v166;
      -[MRDRouteRecommendationController handOffQueueOrAirPlay:sourceEndpoint:destinationEndpoint:playerPath:completion:]( v152,  "handOffQueueOrAirPlay:sourceEndpoint:destinationEndpoint:playerPath:completion:",  v156,  v68,  v154,  v133,  v166);
    }

    else
    {
      v56 = v157;
      if ((v150 & v83) != 0)
      {
        v98 = (void *)v89;
        v108 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only RC, source is not playing, destination is playing %@ (FG locally): RC",  v158));
        uint64_t v110 = _MRLogForCategory(10LL, v109);
        v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v188 = v176;
          __int16 v189 = 2114;
          id v190 = v175;
          __int16 v191 = 2112;
          v192 = v108;
          _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
        }

        v105 = v154;
        v72 = v166;
        -[MRDRouteRecommendationController remoteControl:completion:](v152, "remoteControl:completion:", v154, v166);

        id v14 = v156;
        goto LABEL_75;
      }

      uint64_t v118 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Only RC, source is not playing, NP: %@ dPL: %@ HIJACK/QHO/AP",  v158,  v88));
      uint64_t v120 = _MRLogForCategory(10LL, v119);
      v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v188 = v176;
        __int16 v189 = 2114;
        id v190 = v175;
        __int16 v191 = 2112;
        v192 = (const __CFString *)v118;
        _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      v163 = (void *)v118;

      id v14 = v156;
      if (v159)
      {
        id v122 = v69;
      }

      else
      {
        id v123 = [v174 mutableCopy];
        if (v69) {
          uint64_t v124 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v69));
        }
        else {
          uint64_t v124 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
        }
        v135 = (void *)v124;
        [v123 minusSet:v124];
        id v122 = (id)objc_claimAutoreleasedReturnValue([v123 anyObject]);
        v136 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"migration candidates: %@",  v123));
        uint64_t v138 = _MRLogForCategory(10LL, v137);
        v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v188 = v176;
          __int16 v189 = 2114;
          id v190 = v175;
          __int16 v191 = 2112;
          v192 = v136;
          _os_log_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
        }
      }

      v161 = v51;
      v98 = (void *)v89;
      v140 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"will try to migrate %@",  v122));
      uint64_t v142 = _MRLogForCategory(10LL, v141);
      v143 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v188 = v176;
        __int16 v189 = 2114;
        id v190 = v175;
        __int16 v191 = 2112;
        v192 = v140;
        _os_log_impl( (void *)&_mh_execute_header,  v143,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      v144 = -[MRClient initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___MRClient),  "initWithBundleIdentifier:",  v122);
      v145 = v122;
      v146 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
      v147 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
      v148 = -[MRPlayerPath initWithOrigin:client:player:](v146, "initWithOrigin:client:player:", v147, v144, 0LL);

      v105 = v154;
      v72 = v166;
      -[MRDRouteRecommendationController handOffQueueOrAirPlay:sourceEndpoint:destinationEndpoint:playerPath:completion:]( v152,  "handOffQueueOrAirPlay:sourceEndpoint:destinationEndpoint:playerPath:completion:",  v156,  v161,  v154,  v148,  v166);

      v68 = v161;
    }

    v33 = v172;
LABEL_74:
    v56 = v157;
LABEL_75:

    goto LABEL_76;
  }

  uint64_t v70 = _MRLogForCategory(10LL, v57);
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
  v68 = v51;
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v188 = v176;
    __int16 v189 = 2114;
    id v190 = v175;
    __int16 v191 = 2112;
    v192 = @"Route is not RC: AP";
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v72 = v166;
  -[MRDRouteRecommendationController airPlayTo:completion:](v45, "airPlayTo:completion:", v14, v166);
LABEL_76:
}

- (void)handleDeltaResult:(unint64_t)a3 forRoute:(id)a4 devicesToAdd:(id)a5 sourceEndpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9
{
  BOOL v9 = a8;
  id v15 = a4;
  id v47 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  -[MRDRouteRecommendationController sendEventForOneTapSuggestionBannerResult:routeCandidate:bundleIdentifier:isOutsideApp:contextIdentifier:]( self,  "sendEventForOneTapSuggestionBannerResult:routeCandidate:bundleIdentifier:isOutsideApp:contextIdentifier:",  a3,  v15,  v17,  v9,  v18);
  if (a3 == 2)
  {
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController activeSystemEndpoint](self, "activeSystemEndpoint"));
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 outputDeviceUIDs]);
    BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([v41 firstObject]);
    -[MRDRouteRecommendationController openRoutePickerForRouteUID:](self, "openRoutePickerForRouteUID:", v42);
  }

  else if (a3 == 1)
  {
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v20 = _MRLogForCategory(13LL, v19);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    unsigned __int8 v22 = (char *)[v46 hash];
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v23 = (os_signpost_id_t)v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v23,  "ApplyRouteRecommendation",  "",  buf,  2u);
      }
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUIDString]);

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v15 routeIdentifier]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v16 debugName]);
    uint64_t v28 = MRAVOutputDeviceArrayDescription(v47);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"route=%@, sourceEndpoint=%@, devicesToAdd=%@",  v26,  v27,  v29));

    uint64_t v31 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"MRDRRC:TM/DeltaOTSBannerTapped",  v25);
    v33 = v31;
    if (v30) {
      -[NSMutableString appendFormat:](v31, "appendFormat:", @" for %@", v30);
    }
    uint64_t v34 = _MRLogForCategory(10LL, v32);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v57 = v33;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v16);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10014B5C0;
    v48[3] = &unk_1003A2EF8;
    objc_copyWeak(&v55, (id *)buf);
    id v49 = v47;
    id v36 = v30;
    id v50 = v36;
    v51 = @"MRDRRC:TM/DeltaOTSBannerTapped";
    id v37 = v25;
    id v52 = v37;
    id v38 = v45;
    id v53 = v38;
    id v39 = v46;
    id v54 = v39;
    [v16 addOutputDevices:v49 initiator:@"DeltaOTSBannerTapped" withReplyQueue:0 completion:v48];

    objc_destroyWeak(&v55);
    objc_destroyWeak((id *)buf);
  }

  else if (a3 - 3 <= 1)
  {
    BOOL v43 = -[MRDRouteRecommendationController shouldUseVideoSymbolForDevices:bundleIdentifier:]( self,  "shouldUseVideoSymbolForDevices:bundleIdentifier:",  v47,  v17);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController mediaActivityManager](self, "mediaActivityManager"));
    [v44 presentControlCenterCallToActionVideo:v43 completion:0];
  }
}

- (void)handleResult:(unint64_t)a3 forRoute:(id)a4 devices:(id)a5 endpoint:(id)a6 primaryBundleIdentifier:(id)a7 isOutsideApp:(BOOL)a8 contextIdentifier:(id)a9
{
  BOOL v9 = a8;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  -[MRDRouteRecommendationController sendEventForOneTapSuggestionBannerResult:routeCandidate:bundleIdentifier:isOutsideApp:contextIdentifier:]( self,  "sendEventForOneTapSuggestionBannerResult:routeCandidate:bundleIdentifier:isOutsideApp:contextIdentifier:",  a3,  v15,  v18,  v9,  a9);
  if (a3 == 2)
  {
    id v27 = (id)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController activeSystemEndpoint](self, "activeSystemEndpoint"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 outputDeviceUIDs]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 firstObject]);
    -[MRDRouteRecommendationController openRoutePickerForRouteUID:](self, "openRoutePickerForRouteUID:", v29);

LABEL_8:
    goto LABEL_9;
  }

  if (a3 == 1)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v21 = _MRLogForCategory(13LL, v20);
    unsigned __int8 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    os_signpost_id_t v23 = (char *)[v19 hash];
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v24 = (os_signpost_id_t)v23;
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v24,  "ApplyRouteRecommendation",  "",  buf,  2u);
      }
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRouteRecommendationController routedBackgroundActivityManager]( self,  "routedBackgroundActivityManager"));
    [v25 setOptimisticDevices:v16];

    id v26 = (void *)objc_claimAutoreleasedReturnValue( -[MRDRouteRecommendationController routedBackgroundActivityManager]( self,  "routedBackgroundActivityManager"));
    [v26 setOptimisticRoute:v15];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10014BB44;
    v32[3] = &unk_1003A2CD8;
    v32[4] = self;
    id v33 = v16;
    id v34 = v19;
    id v27 = v19;
    -[MRDRouteRecommendationController performTopologyModificationToRoute:devices:endpoint:requestName:completion:]( self,  "performTopologyModificationToRoute:devices:endpoint:requestName:completion:",  v15,  v33,  v17,  @"OTSBannerTapped",  v32);

    goto LABEL_8;
  }

  if (a3 - 3 <= 1)
  {
    BOOL v30 = -[MRDRouteRecommendationController shouldUseVideoSymbolForDevices:bundleIdentifier:]( self,  "shouldUseVideoSymbolForDevices:bundleIdentifier:",  v16,  v18);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController mediaActivityManager](self, "mediaActivityManager"));
    [v31 presentControlCenterCallToActionVideo:v30 completion:0];
  }

- (void)handleAutoRouteResult:(unint64_t)a3 forRoute:(id)a4 primaryBundleIdentifier:(id)a5 isOutsideApp:(BOOL)a6 contextIdentifier:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  -[MRDRouteRecommendationController sendEventForAutoRouteBannerResult:routeCandidate:bundleIdentifier:isOutsideApp:contextIdentifier:]( self,  "sendEventForAutoRouteBannerResult:routeCandidate:bundleIdentifier:isOutsideApp:contextIdentifier:",  a3,  v12,  v13,  v8,  a7);
  if (a3 <= 1)
  {
    -[MRDRouteRecommendationController stopAirPlayingAndRemoteControlling](self, "stopAirPlayingAndRemoteControlling");
    goto LABEL_14;
  }

  if (a3 == 2)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 nodes]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 anyObject]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 avOutputDeviceIdentifier]);
    -[MRDRouteRecommendationController openRoutePickerForRouteUID:](self, "openRoutePickerForRouteUID:", v16);
  }

  -[MRDRouteRecommendationController setLastUnusedAutoRoute:](self, "setLastUnusedAutoRoute:", v12);
  -[MRDRouteRecommendationController setLastUnusedAutoRouteBundleIdentifier:]( self,  "setLastUnusedAutoRouteBundleIdentifier:",  v13);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  if ([v17 displayOn])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 presentedBundleIdentifiers]);
    unsigned int v20 = [v19 containsObject:v13];

    if (v20)
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController undoTimer](self, "undoTimer"));

      if (v21)
      {
        -[MRDRouteRecommendationController setUndoTimer:](self, "setUndoTimer:", 0LL);
        uint64_t v23 = _MRLogForCategory(13LL, v22);
        os_signpost_id_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138412290;
          id v27 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] cancelling existing timer, %@ is in focus",  (uint8_t *)&v26,  0xCu);
        }
      }

      goto LABEL_14;
    }
  }

  else
  {
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController undoTimer](self, "undoTimer"));

  if (!v25) {
    -[MRDRouteRecommendationController setupTimerForRoute:bundleIdentifier:]( self,  "setupTimerForRoute:bundleIdentifier:",  v12,  v13);
  }
LABEL_14:
}

- (void)setupTimerForRoute:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v9 = [v8 undoUnusedAutoRoutes];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v10 undoUnusedAutoRouteTimerDuration];
    double v12 = v11;

    if (v12 > 0.0)
    {
      uint64_t v14 = _MRLogForCategory(13LL, v13);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2048;
        double v30 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] Setting up timer for %@ (%@) for %f seconds",  buf,  0x20u);
      }

      -[MRDRouteRecommendationController setLastUnusedAutoRoute:](self, "setLastUnusedAutoRoute:", v6);
      objc_initWeak((id *)buf, self);
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      uint64_t v19 = sub_10014C0FC;
      unsigned int v20 = &unk_1003A2F20;
      id v21 = v7;
      uint64_t v22 = self;
      id v23 = v6;
      objc_copyWeak(&v24, (id *)buf);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:block:",  0LL,  &v17,  v12));
      -[MRDRouteRecommendationController setUndoTimer:](self, "setUndoTimer:", v16, v17, v18, v19, v20);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)isRoutePlaying:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nodes", 0));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) avOutputDeviceIdentifier]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 originClientForGroupLeaderOfDeviceUID:v10]);

        LOBYTE(v10) = [v11 isPlaying];
        if ((v10 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)clearUnusedAutoRoute
{
}

- (void)openRoutePickerForRouteUID:(id)a3
{
  id v3 = a3;
  uint64_t v5 = _MRLogForCategory(13LL, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] Long pressed - will open route picker for %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)route:(id)a3 endpoint:(id)a4 bundleIdentifier:(id)a5 emittedEvent:(unint64_t)a6
{
  uint64_t v10 = (__CFString *)a3;
  id v46 = a4;
  double v11 = (__CFString *)a5;
  uint64_t v13 = _MRLogForCategory(13LL, v12);
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v48 = v10;
    __int16 v49 = 2112;
    id v50 = v11;
    __int16 v51 = 2048;
    unint64_t v52 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] route: %@ bundleIdentifier: %@, emittedEvent: %ld",  buf,  0x20u);
  }

  unint64_t v45 = a6;

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaBundleManager shared](&OBJC_CLASS___MRDMediaBundleManager, "shared"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 cachedEligibilityOf:v11]);

  uint64_t v44 = v16;
  unsigned int v17 = [v16 isEligible];
  BOOL v43 = self;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController focusMonitor](self, "focusMonitor"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundlesInFocus]);
  unsigned __int8 v20 = [v19 containsObject:v11];

  unsigned int v21 = [v46 isLocalEndpoint];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  if ([v22 homeScreenVisible])
  {
    unsigned int v23 = 1;
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
    unsigned int v23 = [v24 controlCenterVisible];
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[MRDDisplayMonitor sharedMonitor](&OBJC_CLASS___MRDDisplayMonitor, "sharedMonitor"));
  unsigned int v26 = [v25 siriVisible];

  if ((v20 & 1) != 0) {
    int v28 = 0;
  }
  else {
    int v28 = v23 & (v26 ^ 1);
  }
  uint64_t v29 = v21 & v17 & v28;
  uint64_t v30 = _MRLogForCategory(13LL, v27);
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v29) {
      uint64_t v32 = @"YES";
    }
    else {
      uint64_t v32 = @"NO";
    }
    if (v21) {
      id v33 = @"YES";
    }
    else {
      id v33 = @"NO";
    }
    if (v17) {
      id v34 = @"YES";
    }
    else {
      id v34 = @"NO";
    }
    BOOL v42 = v11;
    if (v28) {
      id v35 = @"YES";
    }
    else {
      id v35 = @"NO";
    }
    id v36 = v10;
    if (v26) {
      id v37 = @"YES";
    }
    else {
      id v37 = @"NO";
    }
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController focusMonitor](v43, "focusMonitor"));
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 bundlesInFocus]);
    *(_DWORD *)buf = 138413570;
    v48 = v32;
    __int16 v49 = 2112;
    id v50 = v33;
    __int16 v51 = 2112;
    unint64_t v52 = (unint64_t)v34;
    __int16 v53 = 2112;
    id v54 = v35;
    double v11 = v42;
    __int16 v55 = 2112;
    v56 = v37;
    uint64_t v10 = v36;
    __int16 v57 = 2112;
    v58 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] eligible: %@, route: %@, app: %@, vis: %@ - siri: %@ - %@",  buf,  0x3Eu);
  }

  if (v45 && v45 != 2)
  {
    if (v45 == 1) {
      -[MRDRouteRecommendationController handlePlaybackStartForEndpoint:bundleIdentifier:eligibleForRecommendationsOutsideApp:]( v43,  "handlePlaybackStartForEndpoint:bundleIdentifier:eligibleForRecommendationsOutsideApp:",  v46,  v11,  v29);
    }
    id v40 = [[IRMediaEvent alloc] initWithEventType:5 eventSubType:0];
    [v40 setBundleID:v11];
    [v40 setIsOutsideApp:v29];
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](v43, "recommender"));
    [v41 addEvent:v40 forRouteCandidate:v10];
  }
}

- (void)handlePlaybackStartForEndpoint:(id)a3 bundleIdentifier:(id)a4 eligibleForRecommendationsOutsideApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRIRRoute routeWithEndpoint:](&OBJC_CLASS___MRIRRoute, "routeWithEndpoint:", v8));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController lastUnusedAutoRoute](self, "lastUnusedAutoRoute"));
  unsigned int v12 = [v11 isEqual:v10];

  uint64_t v14 = _MRLogForCategory(13LL, v13);
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v16)
    {
      int v24 = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] playbackStarted ForEndpoint: %@ bundleIdentifier: %@, invalidating timer",  (uint8_t *)&v24,  0x16u);
    }

    -[MRDRouteRecommendationController clearUnusedAutoRoute](self, "clearUnusedAutoRoute");
  }

  else
  {
    if (v16)
    {
      int v24 = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] playbackStarted forUnrelatedEndpoint: %@ bundleIdentifier: %@",  (uint8_t *)&v24,  0x16u);
    }
  }

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v18 = [v17 showRouteRecommendationsOutsideApps];

  if ((v18 & 1) == 0)
  {
    uint64_t v23 = _MRLogForCategory(13LL, v19);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] requestCurrentContextWithBundleID not enabled",  (uint8_t *)&v24,  2u);
    }

    goto LABEL_15;
  }

  if (v5)
  {
    uint64_t v20 = _MRLogForCategory(13LL, v19);
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC] playback started for %@-%@; will request context update",
        (uint8_t *)&v24,
        0x16u);
    }

    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MRDRouteRecommendationController recommender](self, "recommender"));
    -[os_log_s requestCurrentContextWithBundleID:](v22, "requestCurrentContextWithBundleID:", v9);
LABEL_15:
  }
}

- (void)ingestMockedRecommendation:(id)a3 classification:(int64_t)a4 isCallToAction:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MRIRRoute debugRouteWithDebugIdentifier:]( &OBJC_CLASS___MRIRRoute,  "debugRouteWithDebugIdentifier:",  a3));
  id v9 = objc_alloc_init(&OBJC_CLASS___MRDIRRouteRecommendation);
  -[MRDIRRouteRecommendation setRoute:](v9, "setRoute:", v8);
  -[MRDIRRouteRecommendation setClassification:](v9, "setClassification:", a4);
  -[MRDIRRouteRecommendation setCallToAction:](v9, "setCallToAction:", v5);
  double v11 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  -[MRDRouteRecommendationController didReceiveNewRecommendations:forBundleIdentifier:]( self,  "didReceiveNewRecommendations:forBundleIdentifier:",  v10,  0LL);
}

- (id)_updateMediaControlsBlob:(id)a3 sender:(id)a4
{
  return a3;
}

- (void)setRecommender:(id)a3
{
}

- (void)setValidator:(id)a3
{
}

- (MRDMediaAppInFocusMonitor)focusMonitor
{
  return self->_focusMonitor;
}

- (void)setFocusMonitor:(id)a3
{
}

- (void)setMediaActivityManager:(id)a3
{
}

- (MRDNowPlayingStateMonitor)nowPlayingStateMonitor
{
  return self->_nowPlayingStateMonitor;
}

- (void)setNowPlayingStateMonitor:(id)a3
{
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (MRDRoutedBackgroundActivityManager)routedBackgroundActivityManager
{
  return self->_routedBackgroundActivityManager;
}

- (void)setRoutedBackgroundActivityManager:(id)a3
{
}

- (NSArray)recommendedRoutes
{
  return self->_recommendedRoutes;
}

- (void)setRecommendedRoutes:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MRAVEndpoint)activeSystemEndpoint
{
  return self->_activeSystemEndpoint;
}

- (void)setActiveSystemEndpoint:(id)a3
{
}

- (MRAVEndpoint)localSystemEndpoint
{
  return self->_localSystemEndpoint;
}

- (void)setLocalSystemEndpoint:(id)a3
{
}

- (MRRouteRepresentable)lastDonatedPickerChoice
{
  return self->_lastDonatedPickerChoice;
}

- (void)setLastDonatedPickerChoice:(id)a3
{
}

- (MRRouteRepresentable)lastUnusedAutoRoute
{
  return self->_lastUnusedAutoRoute;
}

- (void)setLastUnusedAutoRoute:(id)a3
{
}

- (NSString)lastUnusedAutoRouteBundleIdentifier
{
  return self->_lastUnusedAutoRouteBundleIdentifier;
}

- (void)setLastUnusedAutoRouteBundleIdentifier:(id)a3
{
}

- (NSArray)visibleMediaApps
{
  return self->_visibleMediaApps;
}

- (void)setVisibleMediaApps:(id)a3
{
}

- (MSVTimer)undoTimer
{
  return self->_undoTimer;
}

- (void)setUndoTimer:(id)a3
{
}

- (NSMutableArray)signpostIds
{
  return self->_signpostIds;
}

- (void)setSignpostIds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end