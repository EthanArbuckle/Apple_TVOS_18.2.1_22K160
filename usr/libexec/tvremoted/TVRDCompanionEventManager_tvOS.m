@interface TVRDCompanionEventManager_tvOS
- (BOOL)_foregroundAppSupportsGuideButton;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (NSDictionary)siriStatusDict;
- (RPCompanionLinkClient)companionLinkClient;
- (TVRCUpNextController)upNextController;
- (TVRDAppServicesUpNextController)appServicesUpNextController;
- (TVRDAppleTVSystemMonitor)tvSystemMonitor;
- (TVRDCompanionEventManagerDelegate)delegate;
- (TVRDCompanionEventManager_tvOS)init;
- (TVRDMediaRemoteCommandCenter)mediaRemoteCommandCenter;
- (TVRDNowPlayingMonitor_tvOS)nowPlayingMonitor;
- (TVRDSiriRemoteMonitor)remoteMonitor;
- (id)_currentSiriRemoteInfoDictionary;
- (id)_fetchLaunchableApplications;
- (id)_fetchUserAccounts;
- (id)_foregroundAppBundleID;
- (id)systemMonitorNotificationToken;
- (void)_currentSiriRemoteInfoDictionary;
- (void)_enableFindingMode:(BOOL)a3;
- (void)_enableReduceLoudSounds:(BOOL)a3;
- (void)_foregroundAppSupportsGuideButton;
- (void)_pushSiriRemoteInfo;
- (void)_sendNowPlayingInfo;
- (void)_sendNowPlayingInfo:(id)a3;
- (void)_sendSiriStatus:(id)a3;
- (void)_sendSupportedActions;
- (void)_setupEventHandlers;
- (void)_startMonitoringTVStatus;
- (void)_switchSystemAppearenceMode:(BOOL)a3;
- (void)_switchToUserAccountWithAltDSID:(id)a3;
- (void)_switchToUserAccountWithID:(id)a3;
- (void)_toggleCaptionsIfNeeded:(BOOL)a3;
- (void)broadcastEventToInterestedDevices:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCompanionLinkClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaRemoteCommandCenter:(id)a3;
- (void)setRemoteMonitor:(id)a3;
- (void)setSiriStatusDict:(id)a3;
- (void)setSystemMonitorNotificationToken:(id)a3;
- (void)setTvSystemMonitor:(id)a3;
- (void)tearDown;
@end

@implementation TVRDCompanionEventManager_tvOS

- (TVRDCompanionEventManager_tvOS)init
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___TVRDCompanionEventManager_tvOS;
  v2 = -[TVRDCompanionEventManager_tvOS init](&v39, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    companionLinkClient = v2->_companionLinkClient;
    v2->_companionLinkClient = v3;

    -[RPCompanionLinkClient setRssiThreshold:](v2->_companionLinkClient, "setRssiThreshold:", TVRCRSSIThreshold);
    -[RPCompanionLinkClient setControlFlags:]( v2->_companionLinkClient,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v2->_companionLinkClient, "controlFlags") | 0x4000000000000LL);
    -[TVRDCompanionEventManager_tvOS _setupEventHandlers](v2, "_setupEventHandlers");
    objc_initWeak(&location, v2);
    v5 = v2->_companionLinkClient;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke;
    v36[3] = &unk_100020E18;
    objc_copyWeak(&v37, &location);
    -[RPCompanionLinkClient activateWithCompletion:](v5, "activateWithCompletion:", v36);
    v6 = v2->_companionLinkClient;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke_86;
    v34[3] = &unk_100020BF0;
    objc_copyWeak(&v35, &location);
    -[RPCompanionLinkClient setInvalidationHandler:](v6, "setInvalidationHandler:", v34);
    v7 = v2->_companionLinkClient;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke_88;
    v32[3] = &unk_100020BF0;
    objc_copyWeak(&v33, &location);
    -[RPCompanionLinkClient setInterruptionHandler:](v7, "setInterruptionHandler:", v32);
    v8 = objc_alloc_init(&OBJC_CLASS___TVRDMediaRemoteCommandCenter);
    mediaRemoteCommandCenter = v2->_mediaRemoteCommandCenter;
    v2->_mediaRemoteCommandCenter = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___TVRDSiriRemoteMonitor);
    remoteMonitor = v2->_remoteMonitor;
    v2->_remoteMonitor = v10;

    -[TVRDSiriRemoteMonitor addObserver:forKeyPath:options:context:]( v2->_remoteMonitor,  "addObserver:forKeyPath:options:context:",  v2,  @"siriRemoteInfo",  0LL,  TVRemoteSiriRemoteObserverContext);
    -[TVRDSiriRemoteMonitor activate](v2->_remoteMonitor, "activate");
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor]( &OBJC_CLASS___FBSDisplayLayoutMonitorConfiguration,  "configurationForDefaultMainDisplayMonitor"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke_94;
    v30[3] = &unk_100020E40;
    objc_copyWeak(&v31, &location);
    [v12 setTransitionHandler:v30];
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitor monitorWithConfiguration:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "monitorWithConfiguration:",  v12));
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v13;

    v15 = objc_alloc(&OBJC_CLASS___TVRDNowPlayingMonitor_tvOS);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke_2;
    v28[3] = &unk_100020BC8;
    objc_copyWeak(&v29, &location);
    v16 = -[TVRDNowPlayingMonitor_tvOS initWithUpdateHandler:](v15, "initWithUpdateHandler:", v28);
    nowPlayingMonitor = v2->_nowPlayingMonitor;
    v2->_nowPlayingMonitor = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___TVRDAppServicesUpNextController);
    appServicesUpNextController = v2->_appServicesUpNextController;
    v2->_appServicesUpNextController = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___TVRCUpNextController);
    upNextController = v2->_upNextController;
    v2->_upNextController = v20;

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke_3;
    v26[3] = &unk_100020E90;
    objc_copyWeak(&v27, &location);
    -[TVRCUpNextController setFetchUpNextInfosImpl:](v2->_upNextController, "setFetchUpNextInfosImpl:", v26);
    v22 = v2->_companionLinkClient;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = __38__TVRDCompanionEventManager_tvOS_init__block_invoke_5;
    v24[3] = &unk_100020EB8;
    objc_copyWeak(&v25, &location);
    -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](v22, "setLocalDeviceUpdatedHandler:", v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0LL;

  -[TVRDSiriRemoteMonitor removeObserver:forKeyPath:context:]( self->_remoteMonitor,  "removeObserver:forKeyPath:context:",  self,  @"siriRemoteInfo",  TVRemoteSiriRemoteObserverContext);
  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVRDCompanionEventManager_tvOS;
  -[TVRDCompanionEventManager_tvOS dealloc](&v4, "dealloc");
}

- (void)broadcastEventToInterestedDevices:(id)a3
{
}

- (void)_startMonitoringTVStatus
{
  if (!self->_tvSystemMonitor)
  {
    id v3 = _TVRDXPCLog();
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Started Monitoring TV Status", buf, 2u);
    }

    v5 = objc_alloc_init(&OBJC_CLASS___TVRDAppleTVSystemMonitor);
    tvSystemMonitor = self->_tvSystemMonitor;
    self->_tvSystemMonitor = v5;
  }

  if (!self->_systemMonitorNotificationToken)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __58__TVRDCompanionEventManager_tvOS__startMonitoringTVStatus__block_invoke;
    v10[3] = &unk_100020F20;
    v10[4] = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 addObserverForName:@"TVRDAppleTVSystemMonitorAttentionStateChangedNotification" object:0 queue:0 usingBlock:v10]);
    id systemMonitorNotificationToken = self->_systemMonitorNotificationToken;
    self->_id systemMonitorNotificationToken = v8;
  }

- (void)_setupEventHandlers
{
  companionLinkClient = self->_companionLinkClient;
  uint64_t v4 = TVRCFetchLaunchableApplicationsEvent;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_120;
  v71[3] = &unk_100020FA8;
  objc_copyWeak(&v72, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:]( companionLinkClient,  "registerRequestID:options:handler:",  v4,  0LL,  v71);
  v5 = self->_companionLinkClient;
  uint64_t v6 = TVRCFetchUserAccountsEvent;
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_121;
  v69[3] = &unk_100020FA8;
  objc_copyWeak(&v70, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v5, "registerRequestID:options:handler:", v6, 0LL, v69);
  v7 = self->_companionLinkClient;
  uint64_t v8 = TVRCSwitchUserAccountEvent;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_122;
  v67[3] = &unk_100020FA8;
  objc_copyWeak(&v68, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v7, "registerRequestID:options:handler:", v8, 0LL, v67);
  v9 = self->_companionLinkClient;
  uint64_t v10 = TVRCToggleCaptions;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_123;
  v65[3] = &unk_100020FA8;
  objc_copyWeak(&v66, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v9, "registerRequestID:options:handler:", v10, 0LL, v65);
  v11 = self->_companionLinkClient;
  uint64_t v12 = TVRCToggleReduceLoudSounds;
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_125;
  v63[3] = &unk_100020FA8;
  objc_copyWeak(&v64, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v11, "registerRequestID:options:handler:", v12, 0LL, v63);
  uint64_t v13 = self->_companionLinkClient;
  uint64_t v14 = TVRCToggleSystemAppearance;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_126;
  v61[3] = &unk_100020FA8;
  objc_copyWeak(&v62, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v13, "registerRequestID:options:handler:", v14, 0LL, v61);
  v15 = self->_companionLinkClient;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_127;
  v60[3] = &unk_100020FD0;
  v60[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:]( v15,  "registerRequestID:options:handler:",  TVRCFetchAttentionState,  0LL,  v60);
  v16 = self->_companionLinkClient;
  uint64_t v17 = TVRCSwitchActiveUserAccountEvent;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_128;
  v58[3] = &unk_100020FA8;
  objc_copyWeak(&v59, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v16, "registerRequestID:options:handler:", v17, 0LL, v58);
  v18 = self->_companionLinkClient;
  uint64_t v19 = TVRCFetchSiriRemoteInfo;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_129;
  v56[3] = &unk_100020FA8;
  objc_copyWeak(&v57, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v18, "registerRequestID:options:handler:", v19, 0LL, v56);
  v20 = self->_companionLinkClient;
  uint64_t v21 = TVRCToggleFindingMode;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_130;
  v54[3] = &unk_100020FA8;
  objc_copyWeak(&v55, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v20, "registerRequestID:options:handler:", v21, 0LL, v54);
  v22 = self->_companionLinkClient;
  uint64_t v23 = TVRCFetchSiriStatus;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_131;
  v52[3] = &unk_100020FA8;
  objc_copyWeak(&v53, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v22, "registerRequestID:options:handler:", v23, 0LL, v52);
  v24 = self->_companionLinkClient;
  uint64_t v25 = TVRCFetchCurrentNowPlayingInfoEvent;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_132;
  v50[3] = &unk_100020FA8;
  objc_copyWeak(&v51, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v24, "registerRequestID:options:handler:", v25, 0LL, v50);
  v26 = self->_companionLinkClient;
  uint64_t v27 = TVRCFetchSupportedActionsEvent;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_133;
  v48[3] = &unk_100020FA8;
  objc_copyWeak(&v49, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v26, "registerRequestID:options:handler:", v27, 0LL, v48);
  v28 = self->_companionLinkClient;
  uint64_t v29 = TVRCFetchUpNextInfoEvent;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_134;
  v46[3] = &unk_100020FA8;
  objc_copyWeak(&v47, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v28, "registerRequestID:options:handler:", v29, 0LL, v46);
  v30 = self->_companionLinkClient;
  uint64_t v31 = TVRCAddToUpNextEvent;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_138;
  v44[3] = &unk_100020FA8;
  objc_copyWeak(&v45, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v30, "registerRequestID:options:handler:", v31, 0LL, v44);
  v32 = self->_companionLinkClient;
  uint64_t v33 = TVRCRemoveFromUpNextEvent;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_140;
  v42[3] = &unk_100020FA8;
  objc_copyWeak(&v43, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v32, "registerRequestID:options:handler:", v33, 0LL, v42);
  v34 = self->_companionLinkClient;
  uint64_t v35 = TVRCMarkAsWatchedEvent;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_142;
  v40[3] = &unk_100020FA8;
  objc_copyWeak(&v41, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v34, "registerRequestID:options:handler:", v35, 0LL, v40);
  v36 = self->_companionLinkClient;
  uint64_t v37 = TVRCPlayMediaEvent;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = __53__TVRDCompanionEventManager_tvOS__setupEventHandlers__block_invoke_144;
  v38[3] = &unk_100020FA8;
  objc_copyWeak(&v39, location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](v36, "registerRequestID:options:handler:", v37, 0LL, v38);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&v70);
  objc_destroyWeak(&v72);
  objc_destroyWeak(location);
}

- (void)_pushSiriRemoteInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVRDCompanionEventManager_tvOS _currentSiriRemoteInfoDictionary]( self,  "_currentSiriRemoteInfoDictionary"));
  if (v3)
  {
    id v4 = _TVRDXPCLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending remote info to peer", v6, 2u);
    }

    -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( self->_companionLinkClient,  "sendEventID:event:destinationID:options:completion:",  TVRCPushSiriRemoteInfo,  v3,  RPDestinationIdentifierInterestedPeers,  0LL,  &__block_literal_global_147);
  }
}

- (id)_currentSiriRemoteInfoDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS remoteMonitor](self, "remoteMonitor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 siriRemoteInfo]);

  if (v3)
  {
    id v11 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v11));
    v5 = (os_log_s *)v11;
    if (v5)
    {
      id v6 = _TVRDXPCLog();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[TVRDCompanionEventManager_tvOS _currentSiriRemoteInfoDictionary].cold.2();
      }

      uint64_t v8 = 0LL;
    }

    else
    {
      uint64_t v12 = TVRCSiriRemoteInfoKey;
      uint64_t v13 = v4;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    }
  }

  else
  {
    id v9 = _TVRDXPCLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[TVRDCompanionEventManager_tvOS _currentSiriRemoteInfoDictionary].cold.1();
    }
    uint64_t v8 = &__NSDictionary0__struct;
  }

  return v8;
}

- (void)_sendNowPlayingInfo
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __53__TVRDCompanionEventManager_tvOS__sendNowPlayingInfo__block_invoke;
  block[3] = &unk_100020BA0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_sendNowPlayingInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _TVRDXPCLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending now playing info: %{public}@",  buf,  0xCu);
    }

    id v11 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v11));
    id v8 = v11;
    if (v8)
    {
      id v9 = _TVRDXPCLog();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[TVRDCompanionEventManager_tvOS _sendNowPlayingInfo:].cold.1();
      }
    }

    else
    {
      uint64_t v12 = TVRCNowPlayingInfoKey;
      uint64_t v13 = v7;
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( self->_companionLinkClient,  "sendEventID:event:destinationID:options:completion:",  TVRCNowPlayingInfoEvent,  v10,  RPDestinationIdentifierInterestedPeers,  0LL,  &__block_literal_global_148);
    }
  }
}

- (void)_sendSupportedActions
{
  uint64_t v9 = TVRCGuideSupportedKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TVRDCompanionEventManager_tvOS _foregroundAppSupportsGuideButton]( self,  "_foregroundAppSupportsGuideButton")));
  uint64_t v10 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  id v5 = _TVRDXPCLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending supported actions: %@",  (uint8_t *)&v7,  0xCu);
  }

  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( self->_companionLinkClient,  "sendEventID:event:destinationID:options:completion:",  TVRCSupportedActions,  v4,  RPDestinationIdentifierInterestedPeers,  0LL,  &__block_literal_global_149);
}

- (void)_sendSiriStatus:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending Siri info", v7, 2u);
  }

  -[RPCompanionLinkClient sendEventID:event:options:completion:]( self->_companionLinkClient,  "sendEventID:event:options:completion:",  TVRCSiriStatus,  v4,  0LL,  &__block_literal_global_150);
}

- (id)_foregroundAppBundleID
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 elements]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ([v7 isUIApplicationElement] && objc_msgSend(v7, "level") == (id)1)
        {
          id v4 = (id)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
          goto LABEL_12;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)_foregroundAppSupportsGuideButton
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS _foregroundAppBundleID](self, "_foregroundAppBundleID"));
  id v9 = 0LL;
  id v3 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = _TVRDXPCLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TVRDCompanionEventManager_tvOS _foregroundAppSupportsGuideButton].cold.1();
    }
    unsigned __int8 v7 = 0;
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 userActivityTypes]);
    unsigned __int8 v7 = -[os_log_s containsObject:](v6, "containsObject:", TVUserActivityTypeBrowsingChannelGuide);
  }

  return v7;
}

- (void)tearDown
{
  id v3 = _TVRDXPCLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[TVRDCompanionEventManager_tvOS tearDown]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (self->_systemMonitorNotificationToken)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 removeObserver:self->_systemMonitorNotificationToken];

    id systemMonitorNotificationToken = self->_systemMonitorNotificationToken;
    self->_id systemMonitorNotificationToken = 0LL;
  }

  tvSystemMonitor = self->_tvSystemMonitor;
  self->_tvSystemMonitor = 0LL;

  -[TVRDCompanionEventManager_tvOS _enableFindingMode:](self, "_enableFindingMode:", 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (TVRemoteSiriRemoteObserverContext == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __81__TVRDCompanionEventManager_tvOS_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_100020BA0;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVRDCompanionEventManager_tvOS;
    -[TVRDCompanionEventManager_tvOS observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)_fetchLaunchableApplications
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appInfos]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues", 0));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 localizedName]);
        if (v11)
        {
          __int128 v12 = (void *)v11;
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);

          if (v13)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedName]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
            -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v14, v15);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v2));
  return v16;
}

- (id)_fetchUserAccounts
{
  id v2 = _TVRDXPCLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching user profiles", buf, 2u);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userProfilesSnapshot]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfiles]);
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = __52__TVRDCompanionEventManager_tvOS__fetchUserAccounts__block_invoke;
  v16 = &unk_1000210A0;
  uint64_t v17 = v4;
  __int128 v18 = v5;
  id v9 = v5;
  __int128 v10 = v4;
  [v8 enumerateKeysAndObjectsUsingBlock:&v13];

  id v11 = -[NSMutableDictionary copy](v9, "copy", v13, v14, v15, v16);
  return v11;
}

- (void)_switchToUserAccountWithID:(id)a3
{
  id v3 = a3;
  id v4 = _TVRDXPCLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending select user profile request. {identifier=%@}",  buf,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __61__TVRDCompanionEventManager_tvOS__switchToUserAccountWithID___block_invoke;
  v8[3] = &unk_1000210C8;
  id v9 = v3;
  id v7 = v3;
  [v6 selectUserProfileWithIdentifier:v7 completionHandler:v8];
}

- (void)_switchToUserAccountWithAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempting to switch to user profile with {identifier=%@}",  (uint8_t *)&buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userProfilesSnapshot]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedUserProfile]);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 iCloudAltDSID]);
  unsigned int v11 = [v10 isEqualToString:v4];

  if (v11)
  {
    id v12 = objc_alloc(&OBJC_CLASS___PBSUserProfileAccountInfo);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 selectedUserProfile]);
    id v14 = [v12 initWithUserProfile:v13];

    id v15 = _TVRDXPCLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 formattedFullName]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Requested user profile is already the active profile {name=%@}",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000LL;
    v30 = __Block_byref_object_copy_;
    uint64_t v31 = __Block_byref_object_dispose_;
    id v32 = 0LL;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 userProfilesSnapshot]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 userProfiles]);
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    v24 = __66__TVRDCompanionEventManager_tvOS__switchToUserAccountWithAltDSID___block_invoke;
    uint64_t v25 = &unk_1000210F0;
    id v26 = v4;
    p___int128 buf = &buf;
    [v20 enumerateKeysAndObjectsUsingBlock:&v22];

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "identifier", v22, v23, v24, v25));
    -[TVRDCompanionEventManager_tvOS _switchToUserAccountWithID:](self, "_switchToUserAccountWithID:", v21);

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_toggleCaptionsIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    MACaptionAppearanceDisplayType v5 = kMACaptionAppearanceDisplayTypeAlwaysOn;
  }
  else {
    MACaptionAppearanceDisplayType v5 = kMACaptionAppearanceDisplayTypeForcedOnly;
  }
  MACaptionAppearanceSetDisplayType(kMACaptionAppearanceDomainUser, v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS nowPlayingMonitor](self, "nowPlayingMonitor"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentCaptionsTrack]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS nowPlayingMonitor](self, "nowPlayingMonitor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 preferredCaptionTrack]);

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS nowPlayingMonitor](self, "nowPlayingMonitor"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredOnlyForcedCaptionTrack]);

  if (v3 && !v7 && v9)
  {
    id v12 = _TVRDXPCLog();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543362;
      *(void *)v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Requesting MediaRemote enable %{public}@",  (uint8_t *)&v21,  0xCu);
    }

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS mediaRemoteCommandCenter](self, "mediaRemoteCommandCenter"));
    id v15 = v14;
    v16 = v9;
LABEL_15:
    -[os_log_s enableLanguageOption:](v14, "enableLanguageOption:", v16);
    goto LABEL_16;
  }

  if (!v3 && v11)
  {
    id v17 = _TVRDXPCLog();
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543362;
      *(void *)v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Told to disable, and forced-only track is available; requesting MediaRemote enable %{public}@",
        (uint8_t *)&v21,
        0xCu);
    }

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS mediaRemoteCommandCenter](self, "mediaRemoteCommandCenter"));
    id v15 = v14;
    v16 = v11;
    goto LABEL_15;
  }

  id v19 = _TVRDXPCLog();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v20 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v3 || !v7)
  {
    if (v20)
    {
      int v21 = 67240706;
      *(_DWORD *)v22 = v3;
      *(_WORD *)&v22[4] = 2114;
      *(void *)&v22[6] = v7;
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Not handling captions toggle request because: enable: %{public,BOOL}d, currentCaptionsTrack: %{public}@, preferr edCaptionsTrack: %{public}@",  (uint8_t *)&v21,  0x1Cu);
    }
  }

  else
  {
    if (v20)
    {
      LOWORD(v21) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Requesting MediaRemote disable captions",  (uint8_t *)&v21,  2u);
    }

    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVRDCompanionEventManager_tvOS mediaRemoteCommandCenter](self, "mediaRemoteCommandCenter"));
    -[os_log_s disableCaptions](v15, "disableCaptions");
  }

- (void)_enableReduceLoudSounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[TVPAudioVideoSettings sharedInstance](&OBJC_CLASS___TVPAudioVideoSettings, "sharedInstance"));
  [v4 setLateNightModeEnabled:v3];
}

- (void)_switchSystemAppearenceMode:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v4 setSystemAppearance:v3];
}

- (void)_enableFindingMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TVSBluetoothRemoteUtilities, "setAdvertiseNonConnectableMode:") & 1) != 0)
  {
    if (v3) {
      uint64_t v4 = 2LL;
    }
    else {
      uint64_t v4 = 0LL;
    }
    +[TVSBluetoothRemoteUtilities setAdvertiseNonConnectableMode:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "setAdvertiseNonConnectableMode:",  v4);
  }

- (TVRDCompanionEventManagerDelegate)delegate
{
  return (TVRDCompanionEventManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVRDNowPlayingMonitor_tvOS)nowPlayingMonitor
{
  return self->_nowPlayingMonitor;
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
}

- (TVRDAppleTVSystemMonitor)tvSystemMonitor
{
  return self->_tvSystemMonitor;
}

- (void)setTvSystemMonitor:(id)a3
{
}

- (id)systemMonitorNotificationToken
{
  return self->_systemMonitorNotificationToken;
}

- (void)setSystemMonitorNotificationToken:(id)a3
{
}

- (TVRDMediaRemoteCommandCenter)mediaRemoteCommandCenter
{
  return self->_mediaRemoteCommandCenter;
}

- (void)setMediaRemoteCommandCenter:(id)a3
{
}

- (TVRDSiriRemoteMonitor)remoteMonitor
{
  return self->_remoteMonitor;
}

- (void)setRemoteMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (TVRCUpNextController)upNextController
{
  return self->_upNextController;
}

- (TVRDAppServicesUpNextController)appServicesUpNextController
{
  return self->_appServicesUpNextController;
}

- (NSDictionary)siriStatusDict
{
  return self->_siriStatusDict;
}

- (void)setSiriStatusDict:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_currentSiriRemoteInfoDictionary
{
}

- (void)_sendNowPlayingInfo:.cold.1()
{
}

- (void)_foregroundAppSupportsGuideButton
{
}

@end