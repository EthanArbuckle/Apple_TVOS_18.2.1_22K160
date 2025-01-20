@interface ADMediaPlaybackContextProvider
- (ADMediaPlaybackContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5;
- (BOOL)nowPlayingObserver:(id)a3 isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:(id)a4;
- (id)_initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5 allowInitialUpdate:(BOOL)a6;
- (void)_donateMediaPlaybackContextWithSnapshot:(id)a3 date:(id)a4;
- (void)_fetchStateForReason:(id)a3;
- (void)_handlePlaybackStateDidChangeToState:(int64_t)a3 fromState:(int64_t)a4 onDate:(id)a5 lastPlayingDate:(id)a6 completion:(id)a7;
- (void)_handleProxyGroupPlayerDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_updateExpirationDateForMediaPlaybackSnapshotBasedOnDate:(id)a3;
- (void)_updateProximityObservationsForPlayState:(int64_t)a3 afterDelay:(double)a4;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6;
- (void)nowPlayingObserver:(id)a3 proxyGroupPlayerStateDidChangeFrom:(BOOL)a4 to:(BOOL)a5;
- (void)nowPlayingObserverAirPlayGroupChanged:(id)a3;
- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3;
- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
@end

@implementation ADMediaPlaybackContextProvider

- (ADMediaPlaybackContextProvider)initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5
{
  return (ADMediaPlaybackContextProvider *)-[ADMediaPlaybackContextProvider _initWithDonationService:instanceContext:queue:allowInitialUpdate:]( self,  "_initWithDonationService:instanceContext:queue:allowInitialUpdate:",  a3,  a4,  a5,  1LL);
}

- (id)_initWithDonationService:(id)a3 instanceContext:(id)a4 queue:(id)a5 allowInitialUpdate:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ADMediaPlaybackContextProvider;
  v13 = -[ADMediaPlaybackContextProvider init](&v28, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_donationService, v10);
    if (v11) {
      v15 = (AFInstanceContext *)v11;
    }
    else {
      v15 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v14->_instanceContext;
    v14->_instanceContext = v15;

    objc_storeStrong((id *)&v14->_queue, a5);
    v17 = -[SOMediaNowPlayingObserver initWithQueue:instanceContext:]( objc_alloc(&OBJC_CLASS___SOMediaNowPlayingObserver),  "initWithQueue:instanceContext:",  v12,  v14->_instanceContext);
    observer = v14->_observer;
    v14->_observer = v17;

    -[SOMediaNowPlayingObserver addListener:](v14->_observer, "addListener:", v14);
    v19 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
    v20 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.client-state-changed");
    uint64_t EffectiveNotificationName = AFNotifyGetEffectiveNotificationName(v20, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue(EffectiveNotificationName);
    v23 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v19,  "initWithName:options:queue:delegate:",  v22,  1LL,  v14->_queue,  0LL);
    clientStateObserver = v14->_clientStateObserver;
    v14->_clientStateObserver = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[AFPineBoardSystemStateObserver defaultObserver]( &OBJC_CLASS___AFPineBoardSystemStateObserver,  "defaultObserver"));
    [v25 addListener:v14];

    id WeakRetained = objc_loadWeakRetained((id *)&v14->_donationService);
    [WeakRetained registerContextTransformer:v14 forType:AFDeviceContextKeyPlaybackState];

    if (v6) {
      -[ADMediaPlaybackContextProvider _fetchStateForReason:](v14, "_fetchStateForReason:", @"init");
    }
  }

  return v14;
}

- (void)_fetchStateForReason:(id)a3
{
  id v4 = a3;
  observer = self->_observer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100143D64;
  v9[3] = &unk_1004FBA60;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  -[SOMediaNowPlayingObserver getPlaybackStateWithCompletion:](observer, "getPlaybackStateWithCompletion:", v9);
  v7 = self->_observer;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100143DE0;
  v8[3] = &unk_1004FB0E0;
  v8[4] = self;
  -[SOMediaNowPlayingObserver getProxyGroupPlayerStateWithCompletion:]( v7,  "getProxyGroupPlayerStateWithCompletion:",  v8);
}

- (void)pineBoardSystemStateObserver:(id)a3 pineBoardStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7 = a3;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    v14 = "-[ADMediaPlaybackContextProvider pineBoardSystemStateObserver:pineBoardStateDidChangeFrom:to:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v13, 0xCu);
  }

  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      v14 = "-[ADMediaPlaybackContextProvider pineBoardSystemStateObserver:pineBoardStateDidChangeFrom:to:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s #hal setting AppleTV playstate to unspecified while sleeping",  (uint8_t *)&v13,  0xCu);
    }

    id v10 = -[AFMediaPlaybackStateSnapshot playbackState](self->_previousState, "playbackState");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFMediaPlaybackStateSnapshot nowPlayingTimestamp](self->_previousState, "nowPlayingTimestamp"));
    -[ADMediaPlaybackContextProvider _handlePlaybackStateDidChangeToState:fromState:onDate:lastPlayingDate:completion:]( self,  "_handlePlaybackStateDidChangeToState:fromState:onDate:lastPlayingDate:completion:",  0LL,  v10,  v11,  v12,  0LL);
  }

  else if (a5 == 8 || a5 == 1)
  {
    -[ADMediaPlaybackContextProvider _fetchStateForReason:](self, "_fetchStateForReason:", @"awaking");
  }
}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  id v9 = a6;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[ADMediaPlaybackContextProvider nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100143CFC;
  v13[3] = &unk_1004FCB88;
  int64_t v15 = a5;
  int64_t v16 = a4;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[ADMediaPlaybackContextProvider nowPlayingObserverNowPlayingInfoDidChange:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }

  observer = self->_observer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100143C00;
  v6[3] = &unk_1004F2CC8;
  v6[4] = self;
  -[SOMediaNowPlayingObserver getPlaybackStateAndLastPlayingDateWithCompletion:]( observer,  "getPlaybackStateAndLastPlayingDateWithCompletion:",  v6);
}

- (void)nowPlayingObserverAirPlayGroupChanged:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[ADMediaPlaybackContextProvider nowPlayingObserverAirPlayGroupChanged:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
  }

  observer = self->_observer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100143B04;
  v6[3] = &unk_1004F2CC8;
  v6[4] = self;
  -[SOMediaNowPlayingObserver getPlaybackStateAndLastPlayingDateWithCompletion:]( observer,  "getPlaybackStateAndLastPlayingDateWithCompletion:",  v6);
}

- (void)nowPlayingObserver:(id)a3 proxyGroupPlayerStateDidChangeFrom:(BOOL)a4 to:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[ADMediaPlaybackContextProvider nowPlayingObserver:proxyGroupPlayerStateDidChangeFrom:to:]";
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal %d -> %d", buf, 0x18u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100143AF0;
  v10[3] = &unk_1004F5068;
  v10[4] = self;
  BOOL v11 = v6;
  BOOL v12 = v5;
  dispatch_async(queue, v10);
}

- (BOOL)nowPlayingObserver:(id)a3 isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFMediaPlaybackStateSnapshot groupIdentifier](self->_previousState, "groupIdentifier"));
  id v7 = [v6 isEqualToString:v5];
  v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v8;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
    int v12 = 136315906;
    int v13 = "-[ADMediaPlaybackContextProvider nowPlayingObserver:isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:]";
    __int16 v14 = 2112;
    __int16 v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s #hal groupIdentifier in _previousState: %@, from mediaRemoteActiveDeviceInfoUpdate: %@, same: %@",  (uint8_t *)&v12,  0x2Au);
  }

  return (char)v7;
}

- (void)_donateMediaPlaybackContextWithSnapshot:(id)a3 date:(id)a4
{
  BOOL v6 = (AFMediaPlaybackStateSnapshot *)a3;
  id v7 = a4;
  v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315394;
    v22 = "-[ADMediaPlaybackContextProvider _donateMediaPlaybackContextWithSnapshot:date:]";
    __int16 v23 = 2112;
    v24 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s #hal snapshot = %@",  (uint8_t *)&v21,  0x16u);
  }

  id v9 = (NSDate *)v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:", 86400.0));
  id v11 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  id v12 = [v11 initWithType:AFDeviceContextKeyPlaybackState deliveryDate:v9 expirationDate:v10 redactedKeyPaths:0 historyConfiguration:0];
  uint64_t v14 = AFIsATV(v12, v13);
  if ((v14 & 1) != 0) {
    uint64_t v16 = 1LL;
  }
  else {
    uint64_t v16 = AFIsHorseman(v14, v15);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_donationService);
  [WeakRetained donateContext:v6 withMetadata:v12 pushToRemote:v16];

  previousState = self->_previousState;
  self->_previousState = v6;
  v19 = v6;

  lastSnapshotExpirationDateRenewal = self->_lastSnapshotExpirationDateRenewal;
  self->_lastSnapshotExpirationDateRenewal = v9;
}

- (void)_handleProxyGroupPlayerDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4 || self->_isProxyGroupPlayer != a4)
  {
    self->_isProxyGroupPlayer = a4;
    previousState = self->_previousState;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100143AD8;
    v12[3] = &unk_1004F2CE8;
    BOOL v13 = a4;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[AFMediaPlaybackStateSnapshot mutatedCopyWithMutator:](previousState, "mutatedCopyWithMutator:", v12));
    if (!v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100143AE4;
      v10[3] = &unk_1004F2CE8;
      BOOL v11 = a4;
      id v7 = +[AFMediaPlaybackStateSnapshot newWithBuilder:]( &OBJC_CLASS___AFMediaPlaybackStateSnapshot,  "newWithBuilder:",  v10);
    }

    id v9 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[ADMediaPlaybackContextProvider _donateMediaPlaybackContextWithSnapshot:date:]( self,  "_donateMediaPlaybackContextWithSnapshot:date:",  v9,  v8);
  }

- (void)_handlePlaybackStateDidChangeToState:(int64_t)a3 fromState:(int64_t)a4 onDate:(id)a5 lastPlayingDate:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v43 = a7;
  uint64_t v14 = mach_absolute_time();
  uint64_t v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v38 = v15;
    uint64_t Name = AFMediaPlaybackStateGetName(a3);
    v40 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(Name);
    uint64_t v41 = AFMediaPlaybackStateGetName(a4);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ADMediaPlaybackContextProvider _handlePlaybackStateDidChangeToState:fromState:onDate:lastPlay"
                         "ingDate:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v89 = v40;
    *(_WORD *)v90 = 2112;
    *(void *)&v90[2] = v42;
    *(_WORD *)&v90[10] = 2112;
    *(void *)&v90[12] = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "%s #hal %llu toState = %@, fromState = %@, lastPlayingDate = %@",  buf,  0x34u);
  }

  uint64_t v80 = 0LL;
  v81 = &v80;
  uint64_t v82 = 0x2020000000LL;
  int64_t v83 = a3;
  uint64_t v76 = 0LL;
  v77 = &v76;
  uint64_t v78 = 0x2020000000LL;
  BOOL v79 = a3 != a4;
  uint64_t v16 = dispatch_group_create();
  id v17 = v16;
  if (*((_BYTE *)v77 + 24) && v81[3] == 4)
  {
    dispatch_group_enter(v16);
    clientStateObserver = self->_clientStateObserver;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_100142FEC;
    v70[3] = &unk_1004F2D10;
    v70[4] = self;
    v72 = &v76;
    v73 = &v80;
    uint64_t v74 = v14;
    int64_t v75 = a4;
    v71 = v17;
    -[AFNotifyObserver getStateWithCompletion:](clientStateObserver, "getStateWithCompletion:", v70);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v89 = sub_10014313C;
  *(void *)v90 = sub_10014314C;
  *(void *)&v90[8] = 0LL;
  dispatch_group_enter(v17);
  observer = self->_observer;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_100143154;
  v66[3] = &unk_1004F2D38;
  v68 = buf;
  uint64_t v69 = v14;
  v20 = v17;
  v67 = v20;
  -[SOMediaNowPlayingObserver getNowPlayingInfoForCurrentItemWithCompletion:]( observer,  "getNowPlayingInfoForCurrentItemWithCompletion:",  v66);
  v64[0] = 0LL;
  v64[1] = v64;
  v64[2] = 0x3032000000LL;
  v64[3] = sub_10014313C;
  v64[4] = sub_10014314C;
  id v65 = 0LL;
  dispatch_group_enter(v20);
  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFMediaRemoteDeviceInfo currentDevice](&OBJC_CLASS___AFMediaRemoteDeviceInfo, "currentDevice"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_100143300;
  v60[3] = &unk_1004F2D60;
  v62 = v64;
  uint64_t v63 = v14;
  v22 = v20;
  v61 = v22;
  [v21 getGroupIdentifierWithCompletion:v60];

  __int16 v23 = self->_donation;
  v24 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100143404;
  v49[3] = &unk_1004F2D88;
  v25 = v23;
  v50 = v25;
  uint64_t v59 = v14;
  id v26 = v43;
  id v54 = v26;
  v51 = self;
  id v27 = v13;
  id v52 = v27;
  v55 = &v80;
  v56 = &v76;
  v57 = buf;
  v58 = v64;
  id v28 = v12;
  id v53 = v28;
  v29 = -[AFSafetyBlock initWithBlock:](v24, "initWithBlock:", v49);
  objc_storeStrong((id *)&self->_donation, v29);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v31 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v84 = 136315394;
    v85 = "-[ADMediaPlaybackContextProvider _handlePlaybackStateDidChangeToState:fromState:onDate:lastPlayingDate:completion:]";
    __int16 v86 = 2048;
    uint64_t v87 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%s #hal %llu Waiting for aggregation to finish...",  v84,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001438B0;
  block[3] = &unk_1004FCB88;
  uint64_t v47 = v14;
  CFAbsoluteTime v48 = Current;
  v33 = v29;
  v45 = v33;
  v46 = self;
  dispatch_group_notify(v22, queue, block);
  if (*((_BYTE *)v77 + 24))
  {
    uint64_t v36 = AFIsATV(v34, v35);
    if ((v36 & 1) != 0 || AFIsHorseman(v36, v37)) {
      -[ADMediaPlaybackContextProvider _updateProximityObservationsForPlayState:afterDelay:]( self,  "_updateProximityObservationsForPlayState:afterDelay:",  v81[3],  5.0);
    }
  }

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
}

- (void)_updateProximityObservationsForPlayState:(int64_t)a3 afterDelay:(double)a4
{
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v7;
    uint64_t Name = AFMediaPlaybackStateGetName(a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[ADMediaPlaybackContextProvider _updateProximityObservationsForPlayState:afterDelay:]";
    __int16 v16 = 2112;
    id v17 = v12;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal %@, delay: %f", buf, 0x20u);
  }

  dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100142E10;
  v13[3] = &unk_1004FD0A0;
  v13[4] = self;
  void v13[5] = a3;
  dispatch_after(v8, queue, v13);
}

- (void)_updateExpirationDateForMediaPlaybackSnapshotBasedOnDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_lastSnapshotExpirationDateRenewal || (objc_msgSend(v4, "timeIntervalSinceDate:"), v6 > 7200.0))
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      lastSnapshotExpirationDateRenewal = self->_lastSnapshotExpirationDateRenewal;
      int v9 = 136315394;
      id v10 = "-[ADMediaPlaybackContextProvider _updateExpirationDateForMediaPlaybackSnapshotBasedOnDate:]";
      __int16 v11 = 2112;
      id v12 = lastSnapshotExpirationDateRenewal;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s #hal renewing media playback expiration (last renewed: %@)",  (uint8_t *)&v9,  0x16u);
    }

    -[ADMediaPlaybackContextProvider _donateMediaPlaybackContextWithSnapshot:date:]( self,  "_donateMediaPlaybackContextWithSnapshot:date:",  self->_previousState,  v5);
  }
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v13 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, id, id))a6;
  uint64_t v11 = AFIsATV(v9, v10);
  else {
    v9[2](v9, 0LL, 0LL);
  }
}

- (void).cxx_destruct
{
}

@end