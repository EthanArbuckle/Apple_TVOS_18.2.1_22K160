@interface AFSiriHeadphonesMonitor
+ (id)sharedMonitor;
- (AFSiriAudioRoute)currentAudioRoute;
- (BOOL)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3;
- (id)_init;
- (id)_settingsConnection;
- (unint64_t)_observerID;
- (void)_audioRouteDidChange:(id)a3;
- (void)_broadcastInEarDetectionStateChangesFrom:(id)a3 to:(id)a4;
- (void)_broadcastRouteAndAuthenticationCapability;
- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)_fetchInitialState;
- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3;
- (void)_recomputePrivateSessionStateAndBroadcast:(BOOL)a3;
- (void)_settingsConnectionDidDisconnect;
- (void)_stopObservingInEarDetectionStateFromSource;
- (void)_updateAnnounceNotificationsOnHearingAidSupportedStatus;
- (void)_updateInEarDetectionStateAndObserve;
- (void)_updateWirelessSplitterSessionInfoAndObserve;
- (void)addDelegate:(id)a3;
- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4;
- (void)fetchInEarDetctionStateForBTAddress:(id)a3 withCompletion:(id)a4;
- (void)fetchPrivateSessionStateWithCompletion:(id)a3;
- (void)initializeAVSystemControllerSubscriptions:(id)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)removeDelegate:(id)a3;
- (void)setCurrentAudioRoute:(id)a3;
- (void)updateAudioRouteAvailability:(id)a3;
@end

@implementation AFSiriHeadphonesMonitor

- (id)_init
{
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___AFSiriHeadphonesMonitor;
  v2 = -[AFSiriHeadphonesMonitor init](&v48, "init");
  v3 = v2;
  if (!v2) {
    return v3;
  }
  unint64_t v4 = AFBluetoothWirelessSplitterSessionStateUnknown;
  v2->_sessionState = 0LL;
  v2->_wirelessSplitterSessionActive = v4;
  v5 = -[AFBluetoothHeadphoneInEarDetectionState initWithBuilder:]( objc_alloc(&OBJC_CLASS___AFBluetoothHeadphoneInEarDetectionState),  "initWithBuilder:",  &stru_1004F1610);
  inEarDetectionState = v3->_inEarDetectionState;
  v3->_inEarDetectionState = v5;

  dispatch_queue_t v7 = dispatch_queue_create("AFSiriHeadphonesMonitor", 0LL);
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v7;

  dispatch_queue_t v9 = dispatch_queue_create("AFSiriHeadphonesMonitor.BTQueue", 0LL);
  btQueue = v3->_btQueue;
  v3->_btQueue = (OS_dispatch_queue *)v9;

  v11 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  AFBluetoothPairedDeviceInfoUpdated));
  v13 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v11,  "initWithName:options:queue:delegate:",  v12,  0LL,  v3->_queue,  v3);
  pairedInfoChangeObserver = v3->_pairedInfoChangeObserver;
  v3->_pairedInfoChangeObserver = v13;

  v15 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  AFBluetoothWirelessSplitterSessionStateChanged));
  v17 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v15,  "initWithName:options:queue:delegate:",  v16,  1LL,  v3->_queue,  v3);
  wirelessSplitterSessionObserver = v3->_wirelessSplitterSessionObserver;
  v3->_wirelessSplitterSessionObserver = v17;

  v19 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  @"com.apple.bluetooth.GuestConnected",  1LL,  v3->_queue,  v3);
  wirelessGuestConnectionObserver = v3->_wirelessGuestConnectionObserver;
  v3->_wirelessGuestConnectionObserver = v19;

  v21 = objc_alloc(&OBJC_CLASS___AFNotifyObserver);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  AFBluetoothInEarDetectionStateChanged));
  v23 = -[AFNotifyObserver initWithName:options:queue:delegate:]( v21,  "initWithName:options:queue:delegate:",  v22,  1LL,  v3->_queue,  v3);
  inEarDetectionStateObserver = v3->_inEarDetectionStateObserver;
  v3->_inEarDetectionStateObserver = v23;

  uint64_t v25 = objc_claimAutoreleasedReturnValue(+[AFDeviceRingerSwitchObserver sharedObserver](&OBJC_CLASS___AFDeviceRingerSwitchObserver, "sharedObserver"));
  ringerSwitchObserver = v3->_ringerSwitchObserver;
  v3->_ringerSwitchObserver = (AFDeviceRingerSwitchObserver *)v25;

  -[AFDeviceRingerSwitchObserver addListener:](v3->_ringerSwitchObserver, "addListener:", v3);
  v27 = (dispatch_queue_s *)v3->_queue;
  block = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472LL;
  v45 = sub_1000FF10C;
  v46 = &unk_1004FD940;
  v28 = v3;
  v47 = v28;
  dispatch_async(v27, &block);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  v30 = (void *)qword_100577D80;
  uint64_t v52 = qword_100577D80;
  if (!qword_100577D80)
  {
    v31 = sub_1000FD280();
    v30 = dlsym(v31, "AVSystemController_ServerConnectionDiedNotification");
    v50[3] = (uint64_t)v30;
    qword_100577D80 = (uint64_t)v30;
  }

  _Block_object_dispose(&v49, 8);
  if (v30)
  {
    [v29 addObserver:v28 selector:"initializeAVSystemControllerSubscriptions:" name:*v30 object:0];

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    sub_1000FE9B8();
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    [v32 addObserver:v28 selector:"updateAudioRouteAvailability:" name:v34 object:0];

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    sub_1000FEAAC();
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    [v35 addObserver:v28 selector:"updateAudioRouteAvailability:" name:v37 object:0];

    uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    delegates = v28->_delegates;
    v28->_delegates = (NSHashTable *)v38;

    -[AFSiriHeadphonesMonitor _fetchInitialState](v28, "_fetchInitialState");
    return v3;
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getAVSystemController_ServerConnectionDiedNotification(void)"));
  objc_msgSend( v41,  "handleFailureInFunction:file:lineNumber:description:",  v42,  @"AFSiriHeadphonesMonitor.m",  48,  @"%s",  dlerror(),  block,  v44,  v45,  v46);

  __break(1u);
  return result;
}

- (void)_fetchInitialState
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FF100;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
  -[AFSiriHeadphonesMonitor _updateWirelessSplitterSessionInfoAndObserve]( self,  "_updateWirelessSplitterSessionInfoAndObserve");
  -[AFSiriHeadphonesMonitor _updateInEarDetectionStateAndObserve](self, "_updateInEarDetectionStateAndObserve");
}

- (void)_updateWirelessSplitterSessionInfoAndObserve
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FEE24;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateInEarDetectionStateAndObserve
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FEBDC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateAnnounceNotificationsOnHearingAidSupportedStatus
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection"));
  [v4 updateAnnounceNotificationsOnHearingAidSupportedStatus];
  [v4 barrier];
  settingsConnection = self->_settingsConnection;
  self->_settingsConnection = 0LL;
}

- (void)updateAudioRouteAvailability:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_queue_t v9 = "-[AFSiriHeadphonesMonitor updateAudioRouteAvailability:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Updating route availability due to: %@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FEBA0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)initializeAVSystemControllerSubscriptions:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FE798;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FE78C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FE780;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_updateAudioRouteAvailabilityAndBroadcast:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self->_currentAudioRoute;
  id v6 = sub_1000FCF8C((uint64_t)-[AFDeviceRingerSwitchObserver state](self->_ringerSwitchObserver, "state"));
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[AFSiriHeadphonesMonitor setCurrentAudioRoute:](self, "setCurrentAudioRoute:", v7);
  unsigned __int8 v8 = [v7 isEqualToRoute:v5];
  if ((v8 & 1) == 0)
  {
    dispatch_queue_t v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      btAddress = self->_btAddress;
      routeName = self->_routeName;
      v12 = v9;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 routeName]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 btAddress]);
      *(_DWORD *)buf = 136316162;
      v31 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]";
      __int16 v32 = 2112;
      uint64_t v33 = routeName;
      __int16 v34 = 2112;
      v35 = btAddress;
      __int16 v36 = 2112;
      v37 = v13;
      __int16 v38 = 2112;
      v39 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Route changed from %@(%@) to %@(%@)",  buf,  0x34u);

      dispatch_queue_t v9 = (void *)AFSiriLogContextConnection;
    }

    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      v15 = v9;
      v16 = (NSString *)objc_claimAutoreleasedReturnValue([v7 avscRouteDescription]);
      *(_DWORD *)buf = 136315394;
      v31 = "-[AFSiriHeadphonesMonitor _updateAudioRouteAvailabilityAndBroadcast:]";
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Currently picked - routeDescription %@",  buf,  0x16u);
    }

    v17 = (NSString *)objc_claimAutoreleasedReturnValue([v7 btAddress]);
    v18 = self->_btAddress;
    self->_btAddress = v17;

    v19 = (NSString *)objc_claimAutoreleasedReturnValue([v7 routeName]);
    v20 = self->_routeName;
    self->_routeName = v19;

    v21 = self->_btAddress;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000FE540;
    v29[3] = &unk_1004F1660;
    v29[4] = self;
    -[AFSiriHeadphonesMonitor _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:]( self,  "_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:",  v21,  v29);
    id v22 = [v7 copy];
    btQueue = (dispatch_queue_s *)self->_btQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FE5F0;
    block[3] = &unk_1004FD968;
    id v24 = v22;
    id v27 = v24;
    v28 = self;
    dispatch_async(btQueue, block);
    if (v3) {
      -[AFSiriHeadphonesMonitor _broadcastRouteAndAuthenticationCapability]( self,  "_broadcastRouteAndAuthenticationCapability");
    }
  }

  return v8 ^ 1;
}

- (void)_fetchWirelessSplitterSessionInfoAndStartObservingFromSourceWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = sub_1000FCF18;
  v14 = sub_1000FCF28;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection"));
  [(id)v11[5] startObservingWirelessSplitterSession];
  v5 = (void *)v11[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FE440;
  v7[3] = &unk_1004F1688;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  dispatch_queue_t v9 = &v10;
  [v5 getBluetoothWirelessSplitterSessionInfoWithCompletion:v7];

  _Block_object_dispose(&v10, 8);
}

- (void)_fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  btAddress = self->_btAddress;
  if (btAddress && (id)-[NSString length](btAddress, "length") == (id)17)
  {
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    v20 = sub_1000FCF18;
    v21 = sub_1000FCF28;
    id v22 = (id)objc_claimAutoreleasedReturnValue(-[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection"));
    dispatch_queue_t v9 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AFSiriHeadphonesMonitor _observerID](self, "_observerID")));
      *(_DWORD *)buf = 136315650;
      id v24 = "-[AFSiriHeadphonesMonitor _fetchInEarDetectionStateAndStartObservingFromSourceForBTAddress:withCompletion:]";
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Start observing IED States for %@ for observerID: %@",  buf,  0x20u);
    }

    objc_msgSend( (id)v18[5],  "startObservingBluetoothInEarDetectionStateForBTAddress:forObserverID:",  v6,  -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
    id v11 = (void *)v18[5];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000FE340;
    v14[3] = &unk_1004F16B0;
    v14[4] = self;
    id v15 = v7;
    v16 = &v17;
    [v11 getInEarDetectionStateForBTAddress:v6 withCompletion:v14];

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    uint64_t v12 = objc_alloc(&OBJC_CLASS___NSError);
    v13 = -[NSError initWithDomain:code:userInfo:]( v12,  "initWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  1803LL,  0LL);
    (*((void (**)(id, void, NSError *))v7 + 2))(v7, 0LL, v13);
  }
}

- (void)_stopObservingInEarDetectionStateFromSource
{
  BOOL v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AFSiriHeadphonesMonitor _observerID](self, "_observerID")));
    int v7 = 136315394;
    id v8 = "-[AFSiriHeadphonesMonitor _stopObservingInEarDetectionStateFromSource]";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Stop observing IED States for observerID: %@",  (uint8_t *)&v7,  0x16u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AFSiriHeadphonesMonitor _settingsConnection](self, "_settingsConnection"));
  objc_msgSend( v4,  "stopObservingBluetoothInEarDetectionStateForObserverID:",  -[AFSiriHeadphonesMonitor _observerID](self, "_observerID"));
}

- (id)_settingsConnection
{
  if ((AFSupportsWirelessSplitter(self, a2) & 1) != 0)
  {
    settingsConnection = self->_settingsConnection;
    if (!settingsConnection)
    {
      id v4 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
      v5 = self->_settingsConnection;
      self->_settingsConnection = v4;

      -[AFSettingsConnection _setDelegate:](self->_settingsConnection, "_setDelegate:", self);
      settingsConnection = self->_settingsConnection;
    }

    id v6 = settingsConnection;
  }

  else
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___AFSettingsConnection);
  }

  return v6;
}

- (void)_settingsConnectionDidDisconnect
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FE1B8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000FDCC8;
  v11[3] = &unk_1004FCB88;
  id v12 = v8;
  v13 = self;
  unint64_t v14 = a4;
  unint64_t v15 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FDBD8;
  v5[3] = &unk_1004FD0A0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_broadcastRouteAndAuthenticationCapability
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FD88C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_broadcastInEarDetectionStateChangesFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FD62C;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)_recomputePrivateSessionStateAndBroadcast:(BOOL)a3
{
  if (self->_wirelessSplitterSessionActive)
  {
    unint64_t v3 = 2LL;
  }

  else
  {
    unint64_t v3 = 1LL;
    if (self->_guestConnected) {
      unint64_t v3 = 2LL;
    }
  }

  self->_sessionState = v3;
  if (a3)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FD448;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (AFSiriAudioRoute)currentAudioRoute
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000FCF18;
  id v10 = sub_1000FCF28;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000FCF30;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AFSiriAudioRoute *)v3;
}

- (void)fetchPrivateSessionStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Fetching private session state",  buf,  0xCu);
  }

  if (self->_guestConnected)
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[AFSiriHeadphonesMonitor fetchPrivateSessionStateWithCompletion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Guest connections active", buf, 0xCu);
    }

    v4[2](v4, 2LL, 0LL);
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000FCB0C;
    v8[3] = &unk_1004FD990;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
}

- (void)fetchInEarDetctionStateForBTAddress:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FCA30;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (unint64_t)_observerID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)_audioRouteDidChange:(id)a3
{
}

- (void)setCurrentAudioRoute:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FF1DC;
  block[3] = &unk_1004FCFF8;
  void block[4] = a1;
  if (qword_100577D50 != -1) {
    dispatch_once(&qword_100577D50, block);
  }
  return (id)qword_100577D58;
}

@end