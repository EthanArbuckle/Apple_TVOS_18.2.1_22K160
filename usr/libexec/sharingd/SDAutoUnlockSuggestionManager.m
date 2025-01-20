@interface SDAutoUnlockSuggestionManager
- (BOOL)alwaysShowSetupRetry;
- (BOOL)canSuggestForDeviceID:(id)a3;
- (BOOL)featureSuggestedForDeviceID:(id)a3;
- (BOOL)foundFirstPeer;
- (BOOL)ignoreBackOff;
- (BOOL)retriedSetup;
- (BOOL)shouldSendRequestsForDeviceID:(id)a3;
- (BOOL)suggestionsEnabled;
- (NSArray)currentBluetoothIDs;
- (NSMutableArray)foundPeers;
- (NSMutableArray)suggestedPeers;
- (NSString)setupRetryDeviceID;
- (NSString)suggestedDeviceID;
- (NSUUID)suggestionManagerSessionID;
- (OS_dispatch_queue)suggestionManagerQueue;
- (OS_dispatch_source)deviceTimer;
- (OS_dispatch_source)scanTimer;
- (OS_dispatch_source)serviceTimer;
- (OS_dispatch_source)setupRetryDeviceTimer;
- (SDAutoUnlockSuggestionManager)init;
- (SFAutoUnlockDevice)lastSuccessfulDevice;
- (SFAutoUnlockDevice)setupRetryDevice;
- (SFAutoUnlockDevice)suggestedPeer;
- (SFBLEScanner)scanner;
- (id)testDeviceID;
- (void)_systemHasPoweredOn;
- (void)_systemWillSleep;
- (void)addObservers;
- (void)handleFoundPeer:(id)a3;
- (void)handleTestSuggestion;
- (void)invalidateScanTimer;
- (void)invalidateScanner;
- (void)invalidateServiceTimer;
- (void)invalidateSetupRetryDeviceTimer;
- (void)invalidateSuggestedDeviceTimer;
- (void)invalidateSuggestionService;
- (void)loadSuggestedPeers;
- (void)postNotificationIfNeeded;
- (void)postSuggestionNotification;
- (void)restartScanTimer:(unint64_t)a3;
- (void)restartServiceTimer:(unint64_t)a3;
- (void)restartSetupRetryDeviceTimer:(int64_t)a3;
- (void)restartSuggestedDeviceTimer:(int64_t)a3;
- (void)screenLockUnlocked:(id)a3;
- (void)sendStartAdvertisingToDeviceID:(id)a3;
- (void)setCurrentBluetoothIDs:(id)a3;
- (void)setDeviceTimer:(id)a3;
- (void)setFeatureSuggestedForDeviceID:(id)a3;
- (void)setFoundFirstPeer:(BOOL)a3;
- (void)setFoundPeers:(id)a3;
- (void)setLastSuccessfulDevice:(id)a3;
- (void)setRetriedSetup;
- (void)setScanTimer:(id)a3;
- (void)setScanner:(id)a3;
- (void)setServiceTimer:(id)a3;
- (void)setSetupRetryDevice:(id)a3;
- (void)setSetupRetryDeviceID:(id)a3;
- (void)setSetupRetryDeviceTimer:(id)a3;
- (void)setSuggestedDeviceID:(id)a3;
- (void)setSuggestedPeer:(id)a3;
- (void)setSuggestedPeers:(id)a3;
- (void)setSuggestionManagerQueue:(id)a3;
- (void)setSuggestionManagerSessionID:(id)a3;
- (void)setupRetryIfNeeded;
- (void)setupRetryNotificationDismissed;
- (void)startScanningForIDSDeviceIDs:(id)a3;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
- (void)updateDefaultsForDeviceID:(id)a3;
- (void)updateSuggestionService;
- (void)watchAvailableForUnlockWithCompletionHandler:(id)a3;
@end

@implementation SDAutoUnlockSuggestionManager

- (SDAutoUnlockSuggestionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SDAutoUnlockSuggestionManager;
  v2 = -[SDAutoUnlockSuggestionManager init](&v11, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharingd.auto-unlock.suggestion-manager-queue", 0LL);
    suggestionManagerQueue = v2->_suggestionManagerQueue;
    v2->_suggestionManagerQueue = (OS_dispatch_queue *)v3;

    v5 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"C42094B4-B936-4673-8034-4EEFD437BEB0");
    suggestionManagerSessionID = v2->_suggestionManagerSessionID;
    v2->_suggestionManagerSessionID = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    foundPeers = v2->_foundPeers;
    v2->_foundPeers = v7;

    -[SDAutoUnlockSuggestionManager loadSuggestedPeers](v2, "loadSuggestedPeers");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    [v9 addClient:v2 forIdentifer:@"C42094B4-B936-4673-8034-4EEFD437BEB0"];

    -[SDAutoUnlockSuggestionManager addObservers](v2, "addObservers");
  }

  return v2;
}

- (void)addObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_systemWillSleep" name:@"com.apple.sharingd.SystemWillSleep" object:0];
  [v3 addObserver:self selector:"_systemHasPoweredOn" name:@"com.apple.sharingd.SystemHasPoweredOn" object:0];
}

- (void)handleTestSuggestion
{
  if (IsAppleInternalBuild(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager testDeviceID](self, "testDeviceID"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 autoUnlockDeviceForDeviceID:v4]);

    if (v6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
      [v5 setObject:v6 atIndexedSubscript:0];

      -[SDAutoUnlockSuggestionManager postSuggestionNotification](self, "postSuggestionNotification");
    }
  }

- (void)screenLockUnlocked:(id)a3
{
  uint64_t v4 = auto_unlock_log(self);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received screen lock unlocked notification",  v7,  2u);
  }

  -[SDAutoUnlockSuggestionManager triggerDevicesIfNeeded](self, "triggerDevicesIfNeeded");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  [v6 updateDynamicStoreEnabled];

  -[SDAutoUnlockSuggestionManager setupRetryIfNeeded](self, "setupRetryIfNeeded");
}

- (void)setupRetryIfNeeded
{
  if (IsAppleInternalBuild(self, a2))
  {
    unsigned int v3 = -[SDAutoUnlockSuggestionManager retriedSetup](self, "retriedSetup");
    BOOL v4 = -[SDAutoUnlockSuggestionManager alwaysShowSetupRetry](self, "alwaysShowSetupRetry");
    BOOL v5 = v4;
    if ((!v3 || v4)
      && (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager lastSuccessfulDevice](self, "lastSuccessfulDevice")),
          v6,
          v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager lastSuccessfulDevice](self, "lastSuccessfulDevice"));
      -[SDAutoUnlockSuggestionManager setSetupRetryDevice:](self, "setSetupRetryDevice:", v7);

      -[SDAutoUnlockSuggestionManager setLastSuccessfulDevice:](self, "setLastSuccessfulDevice:", 0LL);
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDevice](self, "setupRetryDevice"));
      [v14 showSetupRetryNotificationWithDevice:v8];
    }

    else
    {
      uint64_t v9 = auto_unlock_log(v4);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v3) {
          objc_super v11 = @"YES";
        }
        else {
          objc_super v11 = @"NO";
        }
        if (v5) {
          v12 = @"YES";
        }
        else {
          v12 = @"NO";
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager lastSuccessfulDevice](self, "lastSuccessfulDevice"));
        *(_DWORD *)buf = 138412802;
        v16 = v11;
        __int16 v17 = 2112;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not initiating setup retry (already retried: %@, always show: %@, lastSuccessfulDevice: %@)",  buf,  0x20u);
      }
    }
  }

- (void)setupRetryNotificationDismissed
{
}

- (void)setSetupRetryDeviceID:(id)a3
{
  if (!self->_setupRetryDeviceID)
  {
    uint64_t v5 = auto_unlock_log(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Retry setup device ID cleared", v7, 2u);
    }

    -[SDAutoUnlockSuggestionManager invalidateSuggestedDeviceTimer](self, "invalidateSuggestedDeviceTimer");
  }

- (void)restartSetupRetryDeviceTimer:(int64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting retry setup device timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
  if (!v7)
  {
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100133E40;
    v14[3] = &unk_1005CB2F8;
    v14[4] = self;
    uint64_t v9 = sub_100114598(0, v8, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSuggestionManager setSetupRetryDeviceTimer:](self, "setSetupRetryDeviceTimer:", v10);

    objc_super v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
    dispatch_resume(v11);
  }

  v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
  dispatch_time_t v13 = sub_100114580((double)a3);
  sub_100114638(v12, v13);
}

- (void)invalidateSetupRetryDeviceTimer
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding setup device device timer", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setSetupRetryDeviceTimer:](self, "setSetupRetryDeviceTimer:", 0LL);
  }

- (void)postNotificationIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
    [v5 sortUsingComparator:&stru_1005CF3F0];

    uint64_t v7 = auto_unlock_log(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
      int v10 = 138412290;
      objc_super v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Suggestion Found Peers %@",  (uint8_t *)&v10,  0xCu);
    }

    -[SDAutoUnlockSuggestionManager postSuggestionNotification](self, "postSuggestionNotification");
  }

- (void)postSuggestionNotification
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
  -[SDAutoUnlockSuggestionManager setSuggestedPeer:](self, "setSuggestedPeer:", v4);

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[SDAutoUnlockNotificationsManager sharedManager]( &OBJC_CLASS___SDAutoUnlockNotificationsManager,  "sharedManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeer](self, "suggestedPeer"));
  [v6 showSuggestionNotificationWithDevice:v5];
}

- (void)setSuggestedDeviceID:(id)a3
{
  if (!self->_suggestedDeviceID)
  {
    uint64_t v5 = auto_unlock_log(v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Suggested device ID cleared", v7, 2u);
    }

    -[SDAutoUnlockSuggestionManager invalidateSuggestedDeviceTimer](self, "invalidateSuggestedDeviceTimer");
  }

- (void)restartSuggestedDeviceTimer:(int64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting suggested device timer", buf, 2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
  if (!v7)
  {
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100134334;
    v14[3] = &unk_1005CB2F8;
    v14[4] = self;
    uint64_t v9 = sub_100114598(0, v8, v14);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSuggestionManager setDeviceTimer:](self, "setDeviceTimer:", v10);

    objc_super v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
    dispatch_resume(v11);
  }

  v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
  dispatch_time_t v13 = sub_100114580((double)a3);
  sub_100114638(v12, v13);
}

- (void)invalidateSuggestedDeviceTimer
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggested device timer", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setDeviceTimer:](self, "setDeviceTimer:", 0LL);
  }

- (void)updateSuggestionService
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v3 addServiceClientForIdentifier:@"com.apple.sharing.auto-unlock-suggestion-manager"];

  dispatch_time_t v4 = sub_100114580(30.0);
  -[SDAutoUnlockSuggestionManager restartServiceTimer:](self, "restartServiceTimer:", v4);
}

- (void)invalidateSuggestionService
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](&OBJC_CLASS___SDAutoUnlockSessionManager, "sharedManager"));
  [v3 removeServiceClientForIdentifier:@"com.apple.sharing.auto-unlock-suggestion-manager"];

  -[SDAutoUnlockSuggestionManager invalidateServiceTimer](self, "invalidateServiceTimer");
}

- (void)restartServiceTimer:(unint64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting suggestion service timer", buf, 2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
  if (!v7)
  {
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100134618;
    v13[3] = &unk_1005CB2F8;
    v13[4] = self;
    uint64_t v9 = sub_100114598(0, v8, v13);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSuggestionManager setServiceTimer:](self, "setServiceTimer:", v10);

    objc_super v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
    dispatch_resume(v11);
  }

  v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
  sub_100114638(v12, a3);
}

- (void)invalidateServiceTimer
{
  uint64_t v3 = auto_unlock_log(self);
  dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion service timer", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setServiceTimer:](self, "setServiceTimer:", 0LL);
  }

- (void)startScanningForIDSDeviceIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));

  if (v5)
  {
    uint64_t v7 = auto_unlock_log(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Already scanning for suggestions", buf, 2u);
    }

- (void)handleFoundPeer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v28 = 138412290;
    *(void *)&v28[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Suggestion manager found peer: %@", v28, 0xCu);
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 identifier]);
  if (v7
    && (v8 = (void *)v7,
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager currentBluetoothIDs](self, "currentBluetoothIDs")),
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]),
        unsigned int v11 = [v9 containsObject:v10],
        v10,
        v9,
        v8,
        v11))
  {
    BOOL v12 = sub_10008A0A0(v4);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 autoUnlockDeviceForBluetoothID:v14]);

    if (v15)
    {
      id v16 = [v15 supportsAdvertisingUnlocked];
      unsigned int v17 = v16 ^ 1 | v12;
    }

    else
    {
      unsigned int v17 = 0;
    }

    uint64_t v21 = auto_unlock_log(v16);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v15) {
        v23 = @"YES";
      }
      else {
        v23 = @"NO";
      }
      else {
        v24 = @"NO";
      }
      *(_DWORD *)uint64_t v28 = 138412802;
      *(void *)&v28[4] = v23;
      if (v12) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      *(_WORD *)&v28[12] = 2112;
      *(void *)&v28[14] = v24;
      __int16 v29 = 2112;
      v30 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Suggestion manager peer (device: %@, supports advertising unlocked: %@, unlocked on wrist: %@)",  v28,  0x20u);
    }

    if (v17)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
      if ([v26 containsObject:v4])
      {
LABEL_27:

        goto LABEL_28;
      }

      unsigned __int8 v27 = [v15 unlockEnabled];

      if ((v27 & 1) == 0)
      {
        if (!-[SDAutoUnlockSuggestionManager foundFirstPeer](self, "foundFirstPeer"))
        {
          -[SDAutoUnlockSuggestionManager setFoundFirstPeer:](self, "setFoundFirstPeer:", 1LL);
          -[SDAutoUnlockSuggestionManager restartScanTimer:](self, "restartScanTimer:", sub_100114580(3.0));
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers", *(_OWORD *)v28));
        [v26 addObject:v15];
        goto LABEL_27;
      }
    }
  }

  else
  {
    uint64_t v18 = auto_unlock_log(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
      *(_DWORD *)uint64_t v28 = 138412290;
      *(void *)&v28[4] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "Not looking for peer, ignoring: %@",  v28,  0xCu);
    }
  }

- (void)invalidateScanner
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));

  if (v3)
  {
    uint64_t v5 = auto_unlock_log(v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating suggestion scanner", v9, 2u);
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
    [v7 invalidate];

    -[SDAutoUnlockSuggestionManager setScanner:](self, "setScanner:", 0LL);
    -[SDAutoUnlockSuggestionManager setCurrentBluetoothIDs:](self, "setCurrentBluetoothIDs:", 0LL);
    -[SDAutoUnlockSuggestionManager setFoundFirstPeer:](self, "setFoundFirstPeer:", 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
    [v8 removeAllObjects];

    -[SDAutoUnlockSuggestionManager invalidateScanTimer](self, "invalidateScanTimer");
  }

- (void)restartScanTimer:(unint64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting suggestion scan timer", buf, 2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
  if (!v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100135250;
    v12[3] = &unk_1005CB2F8;
    v12[4] = self;
    v8 = sub_100114598(0, &_dispatch_main_q, v12);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[SDAutoUnlockSuggestionManager setScanTimer:](self, "setScanTimer:", v9);

    int v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
    dispatch_resume(v10);
  }

  unsigned int v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
  sub_100114638(v11, a3);
}

- (void)invalidateScanTimer
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion scan timer", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
  if (v5)
  {
    uint64_t v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setScanTimer:](self, "setScanTimer:", 0LL);
  }

- (void)sendStartAdvertisingToDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockStartAdvertising);
  -[SDAutoUnlockStartAdvertising setVersion:](v5, "setVersion:", 2LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockStartAdvertising data](v5, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerSessionID](self, "suggestionManagerSessionID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 15LL));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10013548C;
  v11[3] = &unk_1005CB3E8;
  id v12 = v4;
  id v10 = v4;
  [v6 sendPayload:v7 toDevice:v10 type:401 sessionID:v8 timeout:v9 errorHandler:v11];
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  unsigned int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001355A0;
  v14[3] = &unk_1005CB248;
  unsigned __int16 v18 = a5;
  id v15 = v10;
  id v16 = v9;
  unsigned int v17 = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, v14);
}

- (void)watchAvailableForUnlockWithCompletionHandler:(id)a3
{
}

- (BOOL)shouldSendRequestsForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  unsigned int v6 = [v5 deviceEnabledAsKey:v4];

  uint64_t v8 = auto_unlock_log(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (v6) {
      id v10 = @"YES";
    }
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Should send request (device: %@ enabled: %@)",  (uint8_t *)&v13,  0x16u);
  }

  if ((v6 & 1) != 0) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = -[SDAutoUnlockSuggestionManager canSuggestForDeviceID:](self, "canSuggestForDeviceID:", v4);
  }

  return v11;
}

- (BOOL)canSuggestForDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AutoUnlockPeerRetries"]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v3]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AutoUnlockRetryDate"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AutoUnlockRetryMultiplier"]);
  uint64_t v9 = (uint64_t)[v8 integerValue];
  if (v9 > 2048)
  {
    uint64_t v17 = auto_unlock_log(v9);
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v3;
      __int16 v22 = 2048;
      id v23 = [v8 integerValue];
      id v16 = "Reached limit of suggestions (device %@, multiplier: %ld)";
      goto LABEL_8;
    }
  }

  else
  {
    if (!v7
      || (id v10 = objc_opt_new(&OBJC_CLASS___NSDate),
          -[NSDate timeIntervalSinceDate:](v10, "timeIntervalSinceDate:", v7),
          double v12 = v11,
          v10,
          v12 >= 0.0))
    {
      BOOL v18 = 1;
      goto LABEL_11;
    }

    uint64_t v14 = auto_unlock_log(v13);
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v3;
      __int16 v22 = 2112;
      id v23 = v7;
      id v16 = "Suggestions still backing off (device %@, retry date %@)";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x16u);
    }
  }

  BOOL v18 = 0;
LABEL_11:

  return v18;
}

- (void)updateDefaultsForDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AutoUnlockPeerRetries"]);
  unsigned int v6 = (NSMutableDictionary *)[v5 mutableCopy];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v3));
  uint64_t v8 = (NSMutableDictionary *)[v7 mutableCopy];

  uint64_t v9 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  @"AutoUnlockRetryMultiplier"));
  if (v9) {
    id v10 = (_UNKNOWN **)v9;
  }
  else {
    id v10 = &off_1005F7A68;
  }
  if ((uint64_t)[v10 integerValue] > 128)
  {
    double v12 = 604800.0;
  }

  else
  {
    uint64_t v11 = (uint64_t)[v10 integerValue];
    if (v11 >= 24) {
      double v12 = (double)(3600 * v11);
    }
    else {
      double v12 = 86400.0;
    }
  }

  uint64_t v13 = objc_opt_new(&OBJC_CLASS___NSDate);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v13, "dateByAddingTimeInterval:", v12));

  uint64_t v16 = auto_unlock_log(v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    id v21 = v3;
    __int16 v22 = 2048;
    id v23 = [v10 integerValue];
    __int16 v24 = 2048;
    uint64_t v25 = (uint64_t)v12;
    __int16 v26 = 2112;
    unsigned __int8 v27 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Next suggestion (device: %@, multiplier: %ld, seconds: %ld, retry date %@)",  (uint8_t *)&v20,  0x2Au);
  }

  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  2 * (void)[v10 integerValue]));
  if (!v8)
  {
    uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    if (v6) {
      goto LABEL_13;
    }
LABEL_15:
    unsigned int v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    goto LABEL_13;
  }

  if (!v6) {
    goto LABEL_15;
  }
LABEL_13:
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v14,  @"AutoUnlockRetryDate");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v18,  @"AutoUnlockRetryMultiplier");
  id v19 = -[NSMutableDictionary copy](v8, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v19, v3);

  [v4 setObject:v6 forKey:@"AutoUnlockPeerRetries"];
  [v4 synchronize];
}

- (BOOL)featureSuggestedForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setFeatureSuggestedForDeviceID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting feature suggested for device: %@",  (uint8_t *)&v12,  0xCu);
  }

  if (v4)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
    unsigned __int8 v8 = [v7 containsObject:v4];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
      [v9 addObject:v4];

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
      [v10 setObject:v11 forKey:@"AutoUnlockSuggestedPeers"];

      [v10 synchronize];
    }
  }
}

- (void)loadSuggestedPeers
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"AutoUnlockSuggestedPeers"]);
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    uint64_t v5 = (NSMutableArray *)[v3 mutableCopy];
  }
  else {
    uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  }
  unsigned __int8 v6 = v5;
  -[SDAutoUnlockSuggestionManager setSuggestedPeers:](self, "setSuggestedPeers:", v5);
}

- (BOOL)retriedSetup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 integerForKey:@"AutoUnlockSetupRetryVersion"];
  uint64_t v4 = auto_unlock_log(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retry version: %ld", (uint8_t *)&v7, 0xCu);
  }

  return (uint64_t)v3 > 0;
}

- (void)setRetriedSetup
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 setInteger:1 forKey:@"AutoUnlockSetupRetryVersion"];
}

- (BOOL)suggestionsEnabled
{
  return sub_10008E24C(@"AUSuggestionsEnabled", 1LL) != 0;
}

- (BOOL)ignoreBackOff
{
  return sub_10008E24C(@"AUSuggestionsIgnoreBackoff", 0LL) != 0;
}

- (id)testDeviceID
{
  return (id)(id)sub_10008E36C(@"AUSuggestionsTestDeviceID");
}

- (BOOL)alwaysShowSetupRetry
{
  return sub_10008E24C(@"AUAlwaysShowSetupRetry", 0LL) != 0;
}

- (void)_systemWillSleep
{
  suggestionManagerQueue = (dispatch_queue_s *)self->_suggestionManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013619C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(suggestionManagerQueue, block);
}

- (void)_systemHasPoweredOn
{
  suggestionManagerQueue = (dispatch_queue_s *)self->_suggestionManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001361FC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(suggestionManagerQueue, block);
}

- (NSString)suggestedDeviceID
{
  return self->_suggestedDeviceID;
}

- (NSString)setupRetryDeviceID
{
  return self->_setupRetryDeviceID;
}

- (SFAutoUnlockDevice)lastSuccessfulDevice
{
  return self->_lastSuccessfulDevice;
}

- (void)setLastSuccessfulDevice:(id)a3
{
}

- (BOOL)foundFirstPeer
{
  return self->_foundFirstPeer;
}

- (void)setFoundFirstPeer:(BOOL)a3
{
  self->_foundFirstPeer = a3;
}

- (SFBLEScanner)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (NSMutableArray)foundPeers
{
  return self->_foundPeers;
}

- (void)setFoundPeers:(id)a3
{
}

- (OS_dispatch_source)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
}

- (NSArray)currentBluetoothIDs
{
  return self->_currentBluetoothIDs;
}

- (void)setCurrentBluetoothIDs:(id)a3
{
}

- (OS_dispatch_source)serviceTimer
{
  return self->_serviceTimer;
}

- (void)setServiceTimer:(id)a3
{
}

- (OS_dispatch_source)deviceTimer
{
  return self->_deviceTimer;
}

- (void)setDeviceTimer:(id)a3
{
}

- (OS_dispatch_source)setupRetryDeviceTimer
{
  return self->_setupRetryDeviceTimer;
}

- (void)setSetupRetryDeviceTimer:(id)a3
{
}

- (NSMutableArray)suggestedPeers
{
  return self->_suggestedPeers;
}

- (void)setSuggestedPeers:(id)a3
{
}

- (SFAutoUnlockDevice)suggestedPeer
{
  return self->_suggestedPeer;
}

- (void)setSuggestedPeer:(id)a3
{
}

- (NSUUID)suggestionManagerSessionID
{
  return self->_suggestionManagerSessionID;
}

- (void)setSuggestionManagerSessionID:(id)a3
{
}

- (SFAutoUnlockDevice)setupRetryDevice
{
  return self->_setupRetryDevice;
}

- (void)setSetupRetryDevice:(id)a3
{
}

- (OS_dispatch_queue)suggestionManagerQueue
{
  return self->_suggestionManagerQueue;
}

- (void)setSuggestionManagerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end