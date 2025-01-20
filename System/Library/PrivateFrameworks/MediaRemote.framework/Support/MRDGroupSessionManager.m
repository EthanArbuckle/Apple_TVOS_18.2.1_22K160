@interface MRDGroupSessionManager
- (BOOL)advertisingPreferenceEnabled;
- (BOOL)automaticSharePlayPreferenceEnabled;
- (BOOL)canDiscoverGroupSessions;
- (BOOL)checkCanJoinGroupSessionWithError:(id *)a3;
- (BOOL)hasGuestParticipants;
- (BOOL)isAdvertising;
- (BOOL)isProxyAdvertising;
- (BOOL)sessionManagementScreenVisible;
- (BOOL)shouldNotifyForSessionIdentifier:(id)a3;
- (MRDGroupSession)session;
- (MRDGroupSessionAdvertiser)advertiser;
- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor;
- (MRDGroupSessionHomeObserver)homeObserver;
- (MRDGroupSessionListener)homePodListener;
- (MRDGroupSessionListener)listener;
- (MRDGroupSessionManager)initWithEligibilityMonitor:(id)a3;
- (MRDGroupSessionProxyAuthorizationListener)proxyAuthorizationListener;
- (MRGroupSessionAssertion)playbackAssertion;
- (MRGroupSessionAssertion)sessionRemoteParticipantsAssertion;
- (MRGroupSessionToken)airPlayLeaderGroupSessionToken;
- (MSVTimer)playbackTimeoutTimer;
- (NSDate)lastSessionEventDate;
- (NSHashTable)observers;
- (NSMapTable)pendingCompletions;
- (NSMutableDictionary)acknowledgeResetTimers;
- (NSMutableDictionary)notifiedPendingParticipants;
- (NSMutableOrderedSet)acknowledgedSessionIdentifiers;
- (NSMutableSet)discoveredSessions;
- (NSMutableSet)notificationSuppressIDs;
- (NSString)notAdvertisingReason;
- (NSString)notProxyAdvertisingReason;
- (NSUserDefaults)sharePlayDefaults;
- (OS_dispatch_queue)notificationQueue;
- (OS_dispatch_queue)queue;
- (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_)uiManager;
- (id)assertSessionManagementScreenVisible;
- (id)listenerForSessionWithIdentifier:(id)a3;
- (int64_t)sessionManagementScreenVisibleCount;
- (void)_joinGroupSessionWithToken:(id)a3 completion:(id)a4;
- (void)acknowledgeSession:(id)a3;
- (void)addObserver:(id)a3;
- (void)advertiser:(id)a3 didReceiveInvitationRequest:(id)a4 accessHandler:(id)a5;
- (void)advertiser:(id)a3 didReceiveJoinRequest:(id)a4 accessHandler:(id)a5;
- (void)cancelAcknowledgeResetTimerForSessionIdentifier:(id)a3;
- (void)cleanupExistingSessionIfNeeded;
- (void)clearDiscoveredSessions;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)dismissAllDiscoveredSessions;
- (void)displayJoinRequest:(id)a3 handler:(id)a4;
- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4;
- (void)fetchUserIdentity:(id)a3;
- (void)finishRemoteControlGroupSession:(id)a3;
- (void)groupSessionProxyAuthorizationListener:(id)a3 didCancelJoinRequest:(id)a4 withSessionToken:(id)a5;
- (void)groupSessionProxyAuthorizationListener:(id)a3 didReceiveJoinRequest:(id)a4 withSessionToken:(id)a5 handler:(id)a6;
- (void)handleBoopAdvertisementEnabledChangeNotification:(id)a3;
- (void)handleDeviceInfoChangeNotification:(id)a3;
- (void)handleGroupSessionEvent:(int64_t)a3 withOptions:(id)a4 completion:(id)a5;
- (void)handleGroupSessionSelectionEvent:(id)a3 forDiscoveredSession:(id)a4 completion:(id)a5;
- (void)handleLocalMusicStateUpdateNotification:(id)a3;
- (void)handleNearbyDiscoveryPreferenceChangedNotification:(id)a3;
- (void)handleNowPlayingApplicationDidChangeNotification:(id)a3;
- (void)handlePlaybackStateDidChangeNotification:(id)a3;
- (void)invalidatePlaybackTimeoutTimerWithReason:(id)a3;
- (void)joinGroupSessionWithNearbyGroup:(id)a3 hostSigningKey:(id)a4 joinToken:(id)a5 completion:(id)a6;
- (void)joinGroupSessionWithToken:(id)a3 completion:(id)a4;
- (void)leaveRemoteControlGroupSession:(id)a3;
- (void)listener:(id)a3 didDiscoverSession:(id)a4;
- (void)listener:(id)a3 didLoseSession:(id)a4;
- (void)notifyObserversWithBlock:(id)a3;
- (void)reevaluateAdvertisement;
- (void)reevaluateDiscoveryMode;
- (void)reevaluatePlaybackState;
- (void)reevaluateProxyAdvertisement;
- (void)releaseSessionManagementScreenVisibleAssertion;
- (void)removeObserver:(id)a3;
- (void)resetAcknowledgementForSessionIdentifier:(id)a3;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)setAcknowledgeResetTimers:(id)a3;
- (void)setAcknowledgedSessionIdentifiers:(id)a3;
- (void)setAdvertisingPreferenceEnabled:(BOOL)a3;
- (void)setDiscoveredSessions:(id)a3;
- (void)setDiscoveryEnabled:(BOOL)a3;
- (void)setHasGuestParticipants:(BOOL)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setIsProxyAdvertising:(BOOL)a3;
- (void)setLastSessionEventDate:(id)a3;
- (void)setNotAdvertisingReason:(id)a3;
- (void)setNotProxyAdvertisingReason:(id)a3;
- (void)setNotifiedPendingParticipants:(id)a3;
- (void)setPlaybackAssertion:(id)a3;
- (void)setPlaybackTimeoutTimer:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionManagementScreenVisibleCount:(int64_t)a3;
- (void)setSessionRemoteParticipantsAssertion:(id)a3;
- (void)startAcknowledgeResetTimerForSessionIdentifier:(id)a3;
- (void)startRemoteControlGroupSessionWithRouteType:(unsigned __int8)a3 completion:(id)a4;
- (void)updateAdvertisementPreferences;
@end

@implementation MRDGroupSessionManager

- (MRDGroupSessionManager)initWithEligibilityMonitor:(id)a3
{
  id v5 = a3;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS___MRDGroupSessionManager;
  v6 = -[MRDGroupSessionManager init](&v58, "init");
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
  observers = v6->_observers;
  v6->_observers = (NSHashTable *)v7;

  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.amp.MediaRemote.MRDGroupSessionManager.queue", v10);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v11;

  dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t NotificationQueue = MRGroupSessionSubsystemGetNotificationQueue(v14, v15);
  v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(NotificationQueue);
  dispatch_queue_t v18 = dispatch_queue_create_with_target_V2( "com.apple.amp.MediaRemote.MRDGroupSessionManager.notificationQueue",  v14,  v17);
  v19 = v6->_notificationQueue;
  v6->_notificationQueue = (OS_dispatch_queue *)v18;

  uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  pendingCompletions = v6->_pendingCompletions;
  v6->_pendingCompletions = (NSMapTable *)v20;

  v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  discoveredSessions = v6->_discoveredSessions;
  v6->_discoveredSessions = v22;

  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  notificationSuppressIDs = v6->_notificationSuppressIDs;
  v6->_notificationSuppressIDs = v24;

  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  acknowledgedSessionIdentifiers = v6->_acknowledgedSessionIdentifiers;
  v6->_acknowledgedSessionIdentifiers = v26;

  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  acknowledgeResetTimers = v6->_acknowledgeResetTimers;
  v6->_acknowledgeResetTimers = v28;

  v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  notifiedPendingParticipants = v6->_notifiedPendingParticipants;
  v6->_notifiedPendingParticipants = v30;

  objc_storeStrong((id *)&v6->_eligibilityMonitor, a3);
  v6->_advertisingPreferenceEnabled = MRGroupSessionNearbyContactDiscoveryEnabled();
  uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NearbySessionsAdvertiser createWithDelegate:]( &OBJC_CLASS____TtC12mediaremoted24NearbySessionsAdvertiser,  "createWithDelegate:",  v6));
  advertiser = v6->_advertiser;
  v6->_advertiser = (MRDGroupSessionAdvertiser *)v32;

  if (MSVDeviceIsAudioAccessory())
  {
    v34 = objc_alloc_init(&OBJC_CLASS____TtC12mediaremoted16HomePodUIManager);
    uiManager = v6->_uiManager;
    v6->_uiManager = (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_ *)v34;

    uint64_t v36 = objc_claimAutoreleasedReturnValue(+[MRDGroupSessionHomeObserver shared](&OBJC_CLASS___MRDGroupSessionHomeObserver, "shared"));
    homeObserver = v6->_homeObserver;
    v6->_homeObserver = (MRDGroupSessionHomeObserver *)v36;
LABEL_6:

    goto LABEL_7;
  }

  uint64_t v38 = objc_claimAutoreleasedReturnValue(+[MRDGroupSessionUIManager create](&OBJC_CLASS___MRDGroupSessionUIManager, "create"));
  v39 = v6->_uiManager;
  v6->_uiManager = (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_ *)v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v41 = [v40 groupSessionListenForProxyJoinRequests];

  if (v41)
  {
    v42 = -[MRDGroupSessionProxyAuthorizationListener initWithDelegate:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionProxyAuthorizationListener),  "initWithDelegate:",  v6);
    homeObserver = v6->_proxyAuthorizationListener;
    v6->_proxyAuthorizationListener = v42;
    goto LABEL_6;
  }

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  uint64_t v5 = _MRLogForCategory(12LL, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionManager] Dealloc", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRDGroupSessionManager;
  -[MRDGroupSessionManager dealloc](&v7, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000742EC;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000743C4;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)startRemoteControlGroupSessionWithRouteType:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007454C;
  v19[3] = &unk_10039B718;
  objc_super v7 =  -[MRDGroupSessionCreateTimingEvents initWithRouteType:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionCreateTimingEvents),  "initWithRouteType:",  v4);
  uint64_t v20 = v7;
  v21 = self;
  id v8 = v6;
  id v22 = v8;
  dispatch_queue_attr_t v9 = objc_retainBlock(v19);
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100074614;
  v14[3] = &unk_10039CEC0;
  v14[4] = self;
  uint64_t v15 = v7;
  char v18 = v4;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  v12 = v7;
  dispatch_queue_attr_t v13 = v9;
  dispatch_async(v10, v14);
}

- (void)leaveRemoteControlGroupSession:(id)a3
{
  id v3 = a3;
  if ([v3 isHosted])
  {
    uint64_t v5 = _MRLogForCategory(12LL, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002B6944();
    }
  }

  else
  {
    [v3 finish];
  }
}

- (void)finishRemoteControlGroupSession:(id)a3
{
  id v3 = a3;
  if ([v3 isHosted])
  {
    [v3 finish];
  }

  else
  {
    uint64_t v5 = _MRLogForCategory(12LL, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002B69A4();
    }
  }
}

- (void)joinGroupSessionWithToken:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000756EC;
  v8[3] = &unk_10039CF10;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[MRDGroupSessionManager _joinGroupSessionWithToken:completion:]( self,  "_joinGroupSessionWithToken:completion:",  v6,  v8);
}

- (id)listenerForSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager homePodListener](self, "homePodListener")),
        unsigned int v6 = [v5 hasDiscoveredSessionForIdentifier:v4],
        v5,
        v6))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager homePodListener](self, "homePodListener"));
  }

  else
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager listener](self, "listener"));
  }

  id v8 = (void *)v7;

  return v8;
}

- (void)_joinGroupSessionWithToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100075BCC;
  v17[3] = &unk_10039BAB8;
  v17[4] = self;
  id v7 = a4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100075C88;
  v13[3] = &unk_1003999C0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);
}

- (id)assertSessionManagementScreenVisible
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100076668;
  id v11 = sub_100076678;
  id v12 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100076680;
  v6[3] = &unk_100398EC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)releaseSessionManagementScreenVisibleAssertion
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100076758;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)sessionManagementScreenVisible
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100076828;
  v5[3] = &unk_100399278;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)handleGroupSessionEvent:(int64_t)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (a3 == 1)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRGroupSessionEventOptionDiscoveredSessionIdentifier]);
    if (v11)
    {
      -[MRDGroupSessionManager handleGroupSessionSelectionEvent:forDiscoveredSession:completion:]( self,  "handleGroupSessionSelectionEvent:forDiscoveredSession:completion:",  v8,  v11,  v10);
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  2LL,  @"No identifier provided."));
      v10[2](v10, v14);
    }
  }

  else
  {
    uint64_t v12 = _MRLogForCategory(12LL, v9);
    dispatch_queue_attr_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002B6B58();
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  2LL,  @"Unknown event type: %ld",  a3));
    v10[2](v10, v11);
  }
}

- (void)handleGroupSessionSelectionEvent:(id)a3 forDiscoveredSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100076A6C;
  v15[3] = &unk_10039B630;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)cleanupExistingSessionIfNeeded
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = self->_session;
  session = self->_session;
  self->_session = 0LL;

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  notifiedPendingParticipants = self->_notifiedPendingParticipants;
  self->_notifiedPendingParticipants = v6;

  self->_hasGuestParticipants = 0;
  if (v4)
  {
    unsigned __int8 v8 = -[MRDGroupSession isHosted](v4, "isHosted");
    unsigned int v9 = -[MRDGroupSession isHosted](v4, "isHosted");
    -[MRDGroupSession removeObserver:](v4, "removeObserver:", self);
    if (v9)
    {
      uint64_t v11 = _MRLogForCategory(12LL, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v41 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Implicitly ending %{public}@ because of new session.",  buf,  0xCu);
      }

      -[MRDGroupSessionManager finishRemoteControlGroupSession:](self, "finishRemoteControlGroupSession:", v4);
    }

    if ((v8 & 1) == 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 routingServer]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 systemEndpointController]);
      id v16 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 reason:@"MRGroupSession.implicit.leave"];
      [v15 updateSystemEndpointForRequest:v16];

      uint64_t v18 = _MRLogForCategory(12LL, v17);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v41 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Implicitly leaving %{public}@ because of new session.",  buf,  0xCu);
      }

      -[MRDGroupSessionManager leaveRemoteControlGroupSession:](self, "leaveRemoteControlGroupSession:", v4);
    }
  }

  else
  {
    [0 removeObserver:self];
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager pendingCompletions](self, "pendingCompletions"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSession identifier](v4, "identifier"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v21]);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager pendingCompletions](self, "pendingCompletions"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSession identifier](v4, "identifier"));
    [v23 removeObjectForKey:v24];

    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager notificationQueue](self, "notificationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100077048;
    block[3] = &unk_100399EC0;
    id v39 = v22;
    dispatch_async(v25, block);

    id v26 = v39;
LABEL_17:

    goto LABEL_18;
  }

  if (v4)
  {
    if (-[MRDGroupSession isHosted](v4, "isHosted"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager advertiser](self, "advertiser"));
      [v27 setActiveSession:0 identity:0];

      -[MRDGroupSessionManager reevaluateAdvertisement](self, "reevaluateAdvertisement");
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager observers](self, "observers"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allObjects]);

    v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager notificationQueue](self, "notificationQueue"));
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_1000770B0;
    v34 = &unk_100398F40;
    id v35 = v29;
    uint64_t v36 = v4;
    v37 = self;
    id v26 = v29;
    dispatch_async(v30, &v31);

    goto LABEL_17;
  }

- (void)fetchUserIdentity:(id)a3
{
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = sub_100076668;
  uint64_t v36 = sub_100076678;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100076668;
  v30 = sub_100076678;
  id v31 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100077478;
  v22[3] = &unk_10039D000;
  v24 = &v32;
  v25 = &v26;
  v22[4] = self;
  id v4 = a3;
  id v23 = v4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100077570;
  v20[3] = &unk_100399EC0;
  uint64_t v5 = objc_retainBlock(v22);
  id v21 = v5;
  uint64_t v6 = objc_retainBlock(v20);
  id v7 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100077610;
  v18[3] = &unk_100399530;
  id v9 = v4;
  id v19 = v9;
  id v10 = [v7 initWithTimeout:@"Wait for user identity" reason:v8 queue:v18 handler:10.0];
  uint64_t v11 = (void *)v33[5];
  v33[5] = (uint64_t)v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100077678;
  v16[3] = &unk_10039D028;
  id v13 = v6;
  id v17 = v13;
  uint64_t v14 = objc_claimAutoreleasedReturnValue( [v12 addObserverForName:@"MRDMusicUserStateCenterCloudStateDidUpdateNotification" object:0 queue:0 usingBlock:v16]);
  id v15 = (void *)v27[5];
  v27[5] = v14;

  v13[2](v13);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

- (void)joinGroupSessionWithNearbyGroup:(id)a3 hostSigningKey:(id)a4 joinToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v14);

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100077938;
  v39[3] = &unk_10039BAB8;
  v39[4] = self;
  id v15 = v13;
  id v40 = v15;
  id v16 = objc_retainBlock(v39);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localActiveIdentity]);

  if (!v18)
  {
    uint64_t v31 = _MRLogForCategory(12LL, v19);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1002B6BB8();
    }

    uint64_t v33 = MRGroupSessionError;
    uint64_t v34 = @"Cannot join session without identity.";
    goto LABEL_10;
  }

  if ([v18 type] != (id)1)
  {
    uint64_t v35 = _MRLogForCategory(12LL, v20);
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1002B6BE4();
    }

    uint64_t v33 = MRGroupSessionError;
    uint64_t v34 = @"Cannot join session without resolvable identity.";
LABEL_10:
    id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  v33,  4LL,  v34));
    ((void (*)(void *, void *))v16[2])(v16, v37);

    goto LABEL_11;
  }

  id v21 = (MRDGroupSession *)objc_claimAutoreleasedReturnValue( +[MRDGroupSessionProvider remoteControlSessionForExistingSessionWithNearbyGroup:identity:hostSigningKey:joinToken:]( &OBJC_CLASS___MRDGroupSessionProvider,  "remoteControlSessionForExistingSessionWithNearbyGroup:identity:hostSigningKey:joinToken:",  v10,  v18,  v11,  v12));
  id v38 = v12;
  id v22 = v11;
  id v23 = v10;
  session = self->_session;
  self->_session = v21;
  v25 = v21;

  uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  notifiedPendingParticipants = self->_notifiedPendingParticipants;
  self->_notifiedPendingParticipants = v26;

  self->_hasGuestParticipants = 0;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager pendingCompletions](self, "pendingCompletions"));
  id v29 = objc_retainBlock(v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSession identifier](v25, "identifier"));
  [v28 setObject:v29 forKey:v30];

  id v10 = v23;
  id v11 = v22;
  id v12 = v38;

  -[MRDGroupSession addObserver:](v25, "addObserver:", self);
  -[MRDGroupSession start](v25, "start");

  -[MRDGroupSessionManager reevaluateDiscoveryMode](self, "reevaluateDiscoveryMode");
LABEL_11:
}

- (BOOL)checkCanJoinGroupSessionWithError:(id *)a3
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100076668;
  id v12 = sub_100076678;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100077ADC;
  v7[3] = &unk_10039BCC0;
  v7[4] = self;
  void v7[5] = &v8;
  id v4 = objc_retainBlock(v7);
  char v5 = ((uint64_t (*)(void))v4[2])();
  if (a3) {
    *a3 = (id) v9[5];
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)dismissAllDiscoveredSessions
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = -[NSMutableSet copy](self->_discoveredSessions, "copy");
  uint64_t v6 = _MRLogForCategory(12LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Dismissing all discovered sessions",  buf,  2u);
  }

  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager notificationQueue](self, "notificationQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100077D28;
  v10[3] = &unk_100398E60;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)reevaluateAdvertisement
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = self->_session;
  unint64_t v5 = (unint64_t)-[MRDGroupSession state](v4, "state") & 0xFFFFFFFFFFFFFFFELL;
  if (v4) {
    BOOL v6 = v5 == 2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager pendingCompletions](self, "pendingCompletions"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSession identifier](v4, "identifier"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);
    BOOL v7 = v10 != 0LL;
  }

  else
  {
    BOOL v7 = 1;
  }

  unsigned int v11 = -[MRDGroupSession isHosted](v4, "isHosted");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 nowPlayingServer]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 originClientForOrigin:v14]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeNowPlayingClient]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activePlayerClient]);

  if ([v17 isPlaying])
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 playerPath]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 client]);
    unsigned int v20 = [v19 isSystemMediaApplication] ^ 1;
  }

  else
  {
    unsigned int v20 = 0;
  }

  airPlayLeaderGroupSessionToken = self->_airPlayLeaderGroupSessionToken;
  if (-[MRDGroupSessionManager advertisingPreferenceEnabled](self, "advertisingPreferenceEnabled"))
  {
    if ((MSVDeviceIsAppleTV() & 1) != 0)
    {
      id v22 = @"Platform not supported";
    }

    else if (MSVDeviceIsAudioAccessory() {
           && (uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings")),
    }
               unsigned int v32 = [v31 supportGroupSessionHomePodBoop],
               v31,
               !v32))
    {
      id v22 = @"Feature not enabled";
    }

    else if (MSVDeviceIsAudioAccessory() {
           && (uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings")),
    }
               unsigned int v34 = [v33 groupSessionBoopAdvertisementEnabled],
               v33,
               !v34))
    {
      id v22 = @"Disabled by user";
    }

    else
    {
      if (v4) {
        char v35 = v7;
      }
      else {
        char v35 = 1;
      }
      if (v4) {
        id v22 = @"Session not ready";
      }
      else {
        id v22 = @"No session";
      }
      if ((v35 & 1) == 0)
      {
        if (!v11)
        {
          id v22 = @"Session is not hosted.";
          if (!-[MRDGroupSessionManager isAdvertising](self, "isAdvertising")) {
            goto LABEL_22;
          }
          goto LABEL_15;
        }

        if (airPlayLeaderGroupSessionToken) {
          char v36 = 1;
        }
        else {
          char v36 = v20;
        }
        if (v20) {
          id v22 = @"Another app is now playing.";
        }
        else {
          id v22 = @"Leader token available";
        }
        if ((v36 & 1) == 0)
        {
          if (-[MRDGroupSessionManager isAdvertising](self, "isAdvertising"))
          {
            id v22 = 0LL;
            goto LABEL_22;
          }

          -[MRDGroupSessionManager setIsAdvertising:](self, "setIsAdvertising:", 1LL);
          uint64_t v39 = _MRLogForCategory(12LL, v38);
          id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            int v41 = 138543362;
            v42 = v4;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Begin advertising for session: %{public}@",  (uint8_t *)&v41,  0xCu);
          }

          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager advertiser](self, "advertiser"));
          [v26 beginAdvertising];
          id v22 = 0LL;
          goto LABEL_18;
        }
      }
    }
  }

  else
  {
    id v22 = @"Setting disabled";
  }

  if (-[MRDGroupSessionManager isAdvertising](self, "isAdvertising"))
  {
LABEL_15:
    -[MRDGroupSessionManager setIsAdvertising:](self, "setIsAdvertising:", 0LL);
    uint64_t v24 = _MRLogForCategory(12LL, v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v41 = 138543362;
      v42 = (void *)v22;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Stopping advertisement because: %{public}@",  (uint8_t *)&v41,  0xCu);
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager advertiser](self, "advertiser"));
    [v26 endAdvertising];
LABEL_18:

    goto LABEL_22;
  }

  if (v11)
  {
    v27 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager notAdvertisingReason](self, "notAdvertisingReason"));
    if (v27 != v22)
    {
      uint64_t v28 = v27;
      unsigned __int8 v29 = -[__CFString isEqual:](v27, "isEqual:", v22);

      if ((v29 & 1) == 0)
      {
        uint64_t v37 = _MRLogForCategory(12LL, v30);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_INFO))
        {
          int v41 = 138543362;
          v42 = (void *)v22;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionManager] Not advertising hosted session because: %{public}@",  (uint8_t *)&v41,  0xCu);
        }

        goto LABEL_18;
      }
    }
  }

- (void)reevaluateProxyAdvertisement
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = self->_airPlayLeaderGroupSessionToken;
  if (!-[MRDGroupSessionManager advertisingPreferenceEnabled](self, "advertisingPreferenceEnabled"))
  {
    unint64_t v5 = @"Setting disabled";
    goto LABEL_5;
  }

  if ((MSVDeviceIsAppleTV() & 1) != 0)
  {
    unint64_t v5 = @"Platform not supported";
LABEL_5:
    if (-[MRDGroupSessionManager isProxyAdvertising](self, "isProxyAdvertising"))
    {
LABEL_6:
      -[MRDGroupSessionManager setIsProxyAdvertising:](self, "setIsProxyAdvertising:", 0LL);
      uint64_t v7 = _MRLogForCategory(12LL, v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138543362;
        uint64_t v24 = (void *)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Stopping proxy advertisement because: %{public}@",  (uint8_t *)&v23,  0xCu);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager advertiser](self, "advertiser"));
      [v9 endProxyAdvertising];

      -[MRDGroupSessionManager reevaluateAdvertisement](self, "reevaluateAdvertisement");
      goto LABEL_24;
    }

    if (v4)
    {
      uint64_t v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionManager notProxyAdvertisingReason]( self,  "notProxyAdvertisingReason"));
      if (v10 != v5)
      {
        unsigned int v11 = v10;
        unsigned __int8 v12 = -[__CFString isEqual:](v10, "isEqual:", v5);

        if ((v12 & 1) == 0)
        {
          uint64_t v14 = _MRLogForCategory(12LL, v13);
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v23 = 138543362;
            uint64_t v24 = (void *)v5;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionManager] Not advertising proxy session because: %{public}@",  (uint8_t *)&v23,  0xCu);
          }
        }
      }
    }

    goto LABEL_24;
  }

  if (MSVDeviceIsAudioAccessory())
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v17 = [v16 groupSessionBoopAdvertisementEnabled];

    if (!v17)
    {
      unint64_t v5 = @"Disabled by user";
      goto LABEL_5;
    }
  }

  unsigned int v18 = -[MRDGroupSessionManager isProxyAdvertising](self, "isProxyAdvertising");
  if (!v4)
  {
    unint64_t v5 = @"Leader token not available";
    if (!v18) {
      goto LABEL_24;
    }
    goto LABEL_6;
  }

  if ((v18 & 1) == 0)
  {
    -[MRDGroupSessionManager reevaluateAdvertisement](self, "reevaluateAdvertisement");
    -[MRDGroupSessionManager setIsProxyAdvertising:](self, "setIsProxyAdvertising:", 1LL);
    uint64_t v20 = _MRLogForCategory(12LL, v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      uint64_t v24 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Begin proxy advertising for token: %{public}@",  (uint8_t *)&v23,  0xCu);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager advertiser](self, "advertiser"));
    [v22 beginProxyAdvertisingWithToken:v4];
  }

  unint64_t v5 = 0LL;
LABEL_24:
  -[MRDGroupSessionManager setNotProxyAdvertisingReason:](self, "setNotProxyAdvertisingReason:", v5);
}

- (void)updateAdvertisementPreferences
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000785D4;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)canDiscoverGroupSessions
{
  return 0;
}

- (void)reevaluateDiscoveryMode
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  -[MRDGroupSessionManager setDiscoveryEnabled:]( self,  "setDiscoveryEnabled:",  -[MRDGroupSessionManager canDiscoverGroupSessions](self, "canDiscoverGroupSessions"));
}

- (void)setDiscoveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  listener = self->_listener;
  if (v3)
  {
    if (!listener)
    {
      uint64_t v8 = _MRLogForCategory(12LL, v6);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Start listening for nearby sessions",  buf,  2u);
      }

      uint64_t v10 = (MRDGroupSessionListener *)objc_claimAutoreleasedReturnValue( +[NearbySessionsListener createWithDelegate:]( &OBJC_CLASS____TtC12mediaremoted22NearbySessionsListener,  "createWithDelegate:",  self));
      unsigned int v11 = self->_listener;
      self->_listener = v10;

      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
      unsigned int v13 = [v12 supportGroupSessionHomePodBoop];

      if (v13)
      {
        uint64_t v14 = (MRDGroupSessionListener *)objc_claimAutoreleasedReturnValue( +[NearbySessionsListener createForHomePodWithDelegate:]( &OBJC_CLASS____TtC12mediaremoted22NearbySessionsListener,  "createForHomePodWithDelegate:",  self));
        homePodListener = self->_homePodListener;
        self->_homePodListener = v14;
      }
    }
  }

  else if (listener)
  {
    uint64_t v16 = _MRLogForCategory(12LL, v6);
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Stop listening for nearby sessions",  v20,  2u);
    }

    unsigned int v18 = self->_listener;
    self->_listener = 0LL;

    uint64_t v19 = self->_homePodListener;
    self->_homePodListener = 0LL;

    -[MRDGroupSessionManager clearDiscoveredSessions](self, "clearDiscoveredSessions");
  }

- (BOOL)shouldNotifyForSessionIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  LOBYTE(self) = -[NSMutableOrderedSet containsObject:]( self->_acknowledgedSessionIdentifiers,  "containsObject:",  v4);
  return self ^ 1;
}

- (BOOL)automaticSharePlayPreferenceEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_sharePlayDefaults,  "objectForKey:",  @"CPAppPolicy.AutoSharePlayToggle"));
  BOOL v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)startAcknowledgeResetTimerForSessionIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000789A0;
  v9[3] = &unk_10039D050;
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v11, &location);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:queue:block:",  0LL,  v6,  v9,  480.0));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_acknowledgeResetTimers,  "setObject:forKeyedSubscript:",  v8,  v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)cancelAcknowledgeResetTimerForSessionIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_acknowledgeResetTimers,  "objectForKeyedSubscript:",  v6));
  [v5 invalidate];

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_acknowledgeResetTimers,  "setObject:forKeyedSubscript:",  0LL,  v6);
}

- (void)resetAcknowledgementForSessionIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  -[NSMutableOrderedSet removeObject:](self->_acknowledgedSessionIdentifiers, "removeObject:", v5);
}

- (void)clearDiscoveredSessions
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = -[NSMutableSet copy](self->_discoveredSessions, "copy");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager notificationQueue](self, "notificationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100078C14;
  block[3] = &unk_100398E60;
  id v9 = v4;
  id v10 = self;
  id v6 = v4;
  dispatch_async(v5, block);

  -[NSMutableSet removeAllObjects](self->_discoveredSessions, "removeAllObjects");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100078D38;
  v7[3] = &unk_10039D078;
  v7[4] = self;
  -[MRDGroupSessionManager notifyObserversWithBlock:](self, "notifyObserversWithBlock:", v7);
}

- (void)reevaluatePlaybackState
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 originClientForOrigin:v6]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeNowPlayingClient]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activePlayerClient]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
  if ([v11 isSystemMediaApplication])
  {
    unsigned int v12 = [v9 isPlaying];

    if (v12)
    {
      if (!self->_playbackAssertion)
      {
        unsigned int v13 = (MRGroupSessionAssertion *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionAssertion groupSessionServer](v13, "groupSessionServer"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assertionManager]);
        uint64_t v16 = (MRGroupSessionAssertion *)objc_claimAutoreleasedReturnValue([v15 createAssertionWithReason:@"Music Playback"]);
        playbackAssertion = self->_playbackAssertion;
        self->_playbackAssertion = v16;

LABEL_8:
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else
  {
  }

  unsigned int v13 = self->_playbackAssertion;
  if (v13)
  {
    self->_playbackAssertion = 0LL;
    goto LABEL_8;
  }

- (void)invalidatePlaybackTimeoutTimerWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager playbackTimeoutTimer](self, "playbackTimeoutTimer"));
  if (v6)
  {
    uint64_t v8 = _MRLogForCategory(12LL, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Invalidating timeout timer because: %@",  (uint8_t *)&v11,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager playbackTimeoutTimer](self, "playbackTimeoutTimer"));
    [v10 invalidate];

    -[MRDGroupSessionManager setPlaybackTimeoutTimer:](self, "setPlaybackTimeoutTimer:", 0LL);
  }
}

- (void)displayJoinRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[MRDGroupSessionManager sessionManagementScreenVisible](self, "sessionManagementScreenVisible"))
  {
    uint64_t v9 = _MRLogForCategory(12LL, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Suppressing join request because session management UI is visible",  v11,  2u);
    }
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager uiManager](self, "uiManager"));
    -[os_log_s displayJoinRequest:handler:](v10, "displayJoinRequest:handler:", v6, v7);
  }
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  uint64_t v8 = _MRLogForCategory(12LL, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = sub_10014CE64(a4);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543618;
    unsigned int v18 = v11;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionManager] Processing state change to: %{public}@ for session: %{public}@.",  buf,  0x16u);
  }

  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100079554;
  block[3] = &unk_100399030;
  id v15 = v6;
  int64_t v16 = a4;
  void block[4] = self;
  id v13 = v6;
  dispatch_async(v12, block);
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100079FE0;
  block[3] = &unk_100398F40;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isHosted] & 1) == 0)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007A344;
    block[3] = &unk_100398F40;
    id v10 = v7;
    int v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

- (void)handleNearbyDiscoveryPreferenceChangedNotification:(id)a3
{
}

- (void)acknowledgeSession:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if (v4 && ![v4 source])
  {
    acknowledgedSessionIdentifiers = self->_acknowledgedSessionIdentifiers;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableOrderedSet addObject:](acknowledgedSessionIdentifiers, "addObject:", v7);

    uint64_t v9 = _MRLogForCategory(12LL, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Acknowledged session: %{public}@",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (NSMutableSet)discoveredSessions
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100076668;
  int v11 = sub_100076678;
  id v12 = 0LL;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007AD88;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableSet *)v4;
}

- (MRDGroupSession)session
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100076668;
  int v11 = sub_100076678;
  id v12 = 0LL;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007AEA0;
  v6[3] = &unk_100399278;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MRDGroupSession *)v4;
}

- (void)handleNowPlayingApplicationDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 origin]);
  unsigned int v7 = [v6 isLocal];

  if (v7)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007AF7C;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)handlePlaybackStateDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 origin]);
  unsigned int v7 = [v6 isLocal];

  if (v7)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007B04C;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_async(v8, block);
  }
}

- (void)handleLocalMusicStateUpdateNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007B0E0;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleDeviceInfoChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = MRGetDeviceInfoFromUserInfo(v5, v6);
  id v16 = (id)objc_claimAutoreleasedReturnValue(v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v9 = MRGetOriginFromUserInfo(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if ([v10 isLocal])
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v16 leaderDeviceInfo]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 groupSessionToken]);
    id v13 = [v12 copy];

    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007B20C;
    block[3] = &unk_100398E60;
    void block[4] = self;
    id v18 = v13;
    id v15 = v13;
    dispatch_sync(v14, block);
  }
}

- (void)handleBoopAdvertisementEnabledChangeNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007B3B8;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)advertiser:(id)a3 didReceiveJoinRequest:(id)a4 accessHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v10 = _MRLogForCategory(12LL, v9);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Received join request: %{public}@",  buf,  0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007B544;
  v15[3] = &unk_10039D278;
  v15[4] = self;
  id v16 = v7;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager session](self, "session"));
  id v18 = v8;
  id v12 = v8;
  id v13 = v17;
  id v14 = v7;
  +[MRDGroupSessionApprovalManager shouldAutoApproveRequest:withSession:completion:]( &OBJC_CLASS___MRDGroupSessionApprovalManager,  "shouldAutoApproveRequest:withSession:completion:",  v14,  v13,  v15);
}

- (void)advertiser:(id)a3 didReceiveInvitationRequest:(id)a4 accessHandler:(id)a5
{
}

- (void)groupSessionProxyAuthorizationListener:(id)a3 didReceiveJoinRequest:(id)a4 withSessionToken:(id)a5 handler:(id)a6
{
  id v33 = a3;
  id v34 = a4;
  id v10 = a5;
  id v11 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 equivalentMediaIdentifier]);
  if (v13)
  {
    id v14 = dispatch_group_create();
    v49[0] = 0LL;
    v49[1] = v49;
    v49[2] = 0x3032000000LL;
    v49[3] = sub_100076668;
    v49[4] = sub_100076678;
    id v50 = 0LL;
    uint64_t v16 = _MRLogForCategory(12LL, v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
      *(_DWORD *)buf = 138412546;
      id v52 = v18;
      __int16 v53 = 2112;
      v54 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] %@ - Attempting to discover target device via WHA: %@",  buf,  0x16u);
    }

    id v32 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
    dispatch_group_enter(v14);
    __int16 v19 = (objc_class *)objc_opt_class(self);
    id v20 = NSStringFromClass(v19);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager notificationQueue](self, "notificationQueue"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10007BF04;
    v44[3] = &unk_10039D2A0;
    id v23 = v34;
    id v45 = v23;
    v48 = v49;
    id v24 = v13;
    id v46 = v24;
    v25 = v14;
    v47 = v25;
    [v32 searchEndpointsForOutputDeviceUID:v24 timeout:v21 reason:v22 queue:v44 completion:15.0];

    uint64_t v27 = _MRLogForCategory(12LL, v26);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionManager] Displaying proxy authorization request: %@",  buf,  0xCu);
    }

    MRAnalyticsSendEvent(kMREventGroupSessionJoinRequestReceived, 0LL, &stru_10039D2E0);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10007C0D8;
    v35[3] = &unk_10039D308;
    id v41 = v11;
    id v36 = v23;
    id v37 = v24;
    uint64_t v38 = self;
    id v39 = v10;
    unsigned __int8 v29 = v25;
    id v40 = v29;
    v42 = v49;
    uint64_t v43 = 0x402E000000000000LL;
    -[MRDGroupSessionManager displayJoinRequest:handler:](self, "displayJoinRequest:handler:", v36, v35);

    _Block_object_dispose(v49, 8);
  }

  else
  {
    uint64_t v30 = _MRLogForCategory(12LL, v12);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1002B6C84();
    }

    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0LL);
    }
  }
}

- (void)groupSessionProxyAuthorizationListener:(id)a3 didCancelJoinRequest:(id)a4 withSessionToken:(id)a5
{
}

- (void)listener:(id)a3 didDiscoverSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C540;
  block[3] = &unk_100398F40;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)listener:(id)a3 didLoseSession:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007CC24;
  v8[3] = &unk_100398E60;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)notifyObserversWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager observers](self, "observers"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager notificationQueue](self, "notificationQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10007CECC;
  v11[3] = &unk_100399F10;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, v11);
}

- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue", a3, a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007D02C;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007D0CC;
  block[3] = &unk_100398E60;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);
}

- (void)setDiscoveredSessions:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (MRGroupSessionToken)airPlayLeaderGroupSessionToken
{
  return self->_airPlayLeaderGroupSessionToken;
}

- (NSMutableOrderedSet)acknowledgedSessionIdentifiers
{
  return self->_acknowledgedSessionIdentifiers;
}

- (void)setAcknowledgedSessionIdentifiers:(id)a3
{
}

- (NSMutableDictionary)acknowledgeResetTimers
{
  return self->_acknowledgeResetTimers;
}

- (void)setAcknowledgeResetTimers:(id)a3
{
}

- (MSVTimer)playbackTimeoutTimer
{
  return self->_playbackTimeoutTimer;
}

- (void)setPlaybackTimeoutTimer:(id)a3
{
}

- (NSMutableDictionary)notifiedPendingParticipants
{
  return self->_notifiedPendingParticipants;
}

- (void)setNotifiedPendingParticipants:(id)a3
{
}

- (MRDGroupSessionAdvertiser)advertiser
{
  return self->_advertiser;
}

- (NSMutableSet)notificationSuppressIDs
{
  return self->_notificationSuppressIDs;
}

- (BOOL)advertisingPreferenceEnabled
{
  return self->_advertisingPreferenceEnabled;
}

- (void)setAdvertisingPreferenceEnabled:(BOOL)a3
{
  self->_advertisingPreferenceEnabled = a3;
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (NSString)notAdvertisingReason
{
  return self->_notAdvertisingReason;
}

- (void)setNotAdvertisingReason:(id)a3
{
}

- (NSString)notProxyAdvertisingReason
{
  return self->_notProxyAdvertisingReason;
}

- (void)setNotProxyAdvertisingReason:(id)a3
{
}

- (BOOL)isProxyAdvertising
{
  return self->_isProxyAdvertising;
}

- (void)setIsProxyAdvertising:(BOOL)a3
{
  self->_isProxyAdvertising = a3;
}

- (BOOL)hasGuestParticipants
{
  return self->_hasGuestParticipants;
}

- (void)setHasGuestParticipants:(BOOL)a3
{
  self->_hasGuestParticipants = a3;
}

- (MRGroupSessionAssertion)sessionRemoteParticipantsAssertion
{
  return self->_sessionRemoteParticipantsAssertion;
}

- (void)setSessionRemoteParticipantsAssertion:(id)a3
{
}

- (MRGroupSessionAssertion)playbackAssertion
{
  return self->_playbackAssertion;
}

- (void)setPlaybackAssertion:(id)a3
{
}

- (MRDGroupSessionListener)listener
{
  return self->_listener;
}

- (MRDGroupSessionListener)homePodListener
{
  return self->_homePodListener;
}

- (_TtP12mediaremoted33MRDGroupSessionUIManagerInterface_)uiManager
{
  return self->_uiManager;
}

- (MRDGroupSessionHomeObserver)homeObserver
{
  return self->_homeObserver;
}

- (MRDGroupSessionProxyAuthorizationListener)proxyAuthorizationListener
{
  return self->_proxyAuthorizationListener;
}

- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor
{
  return self->_eligibilityMonitor;
}

- (NSUserDefaults)sharePlayDefaults
{
  return self->_sharePlayDefaults;
}

- (NSMapTable)pendingCompletions
{
  return self->_pendingCompletions;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSDate)lastSessionEventDate
{
  return self->_lastSessionEventDate;
}

- (void)setLastSessionEventDate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)sessionManagementScreenVisibleCount
{
  return self->_sessionManagementScreenVisibleCount;
}

- (void)setSessionManagementScreenVisibleCount:(int64_t)a3
{
  self->_sessionManagementScreenVisibleCount = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end