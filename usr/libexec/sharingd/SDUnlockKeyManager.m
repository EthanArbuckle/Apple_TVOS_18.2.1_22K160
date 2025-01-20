@interface SDUnlockKeyManager
+ (id)sharedKeyManager;
- (BOOL)autoUnlockEnabledUpdatedAfterFirstUnlock;
- (BOOL)initiateStashBagCreationWithManifest:(id)a3;
- (BOOL)ltkWaitingForUnlock;
- (BOOL)needsOffWristBeforePairedUnlock;
- (BOOL)outstandingStartLTK;
- (BOOL)pairedWatchSupportsRelock;
- (BOOL)remoteDeviceLocked;
- (BOOL)shouldStartUnlock;
- (BOOL)shouldUseTwoPartPill;
- (BOOL)startUnlockIfNeeded;
- (BOOL)unlockEnabled;
- (BOOL)unlockingForKeybagUnlock;
- (BOOL)updateLongTermKey:(id)a3;
- (BOOL)useEscrowRecord;
- (BOOL)waitingForAutoUnlockStateUpdateToStartPairedUnlock;
- (BOOL)wasInLockScreen;
- (NSDate)deviceSwitchUnlockRetryDate;
- (NSTimer)stashTimer;
- (OS_dispatch_source)delayedStartTimer;
- (OS_dispatch_source)longTermKeyTimer;
- (OS_dispatch_source)stateTimer;
- (SDUnlockKeyManager)init;
- (SDUnlockKeyMetricDates)metricDates;
- (SDUnlockSessionRecord)sessionRecord;
- (id)generateDebugInfo;
- (id)getWatchNameForTesting;
- (id)keybagAssertion;
- (id)stashHandler;
- (id)stateHandler;
- (id)stringForState:(int64_t)a3;
- (int64_t)unlockingState;
- (void)addObservers;
- (void)bannerDidDismiss;
- (void)bannerLockButtonWasTapped;
- (void)beginUnlockIfNotOnLockScreen;
- (void)checkDevicePairingState;
- (void)consolidateLatencies:(id)a3;
- (void)debugInfoRequested:(id)a3;
- (void)deviceDidEnterConfigurationState:(id)a3;
- (void)devicesDidFailToPair:(id)a3;
- (void)devicesDidUnpair:(id)a3;
- (void)disableUnlockPairing;
- (void)disableUnlockPairingForSecurityManager:(id)a3;
- (void)establishStashBagWithCompletionHandler:(id)a3;
- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4;
- (void)handleActiveDeviceUpdated;
- (void)handleAutoUnlockEnabledStateUpdated;
- (void)handleClassALongTermKeyRequest:(id)a3;
- (void)handleConfigState;
- (void)handleCreateEscrowSecret:(id)a3;
- (void)handleEscrowSessionRequest:(unsigned int)a3 withUpdatedLongTermKey:(BOOL)a4;
- (void)handleLongTermKeyRequest:(id)a3;
- (void)handlePairedWatchWristStateChanged;
- (void)handleRemoteLockStateChanged:(id)a3;
- (void)handleResetState:(id)a3;
- (void)handleSessionKeyExchangeResponse:(id)a3;
- (void)handleSetupRequest:(id)a3;
- (void)handleStashConfirmation:(id)a3;
- (void)handleStashKeyExchangeResponse:(id)a3;
- (void)handleSystemUIChanged;
- (void)handleUILockStateChange;
- (void)handleUnlockConfirmation:(id)a3;
- (void)handleUnlockStateResponse:(id)a3;
- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5;
- (void)idsControllerNearbyStateChanged:(id)a3;
- (void)initializeMetrics;
- (void)initiateRemoteUnlock;
- (void)invalidateDelayedStartTimer;
- (void)invalidateLongTermKeyTimer;
- (void)invalidateStashTimer;
- (void)invalidateStateTimer;
- (void)keyBagLockStateChange:(id)a3;
- (void)newDeviceBecameActive:(id)a3;
- (void)notifyStashStateWithError:(id)a3;
- (void)notifyUnlockStateWithState:(id)a3 error:(id)a4;
- (void)releaseKeyBagAssertion;
- (void)resetAndClearState;
- (void)resetSetupState;
- (void)resetState;
- (void)restartDelayedStartTimer:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)restartLongTermKeyTimer:(unint64_t)a3;
- (void)restartStashTimer;
- (void)restartStateTimer;
- (void)sendClassALongTermKeyResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(unsigned int)a5;
- (void)sendLongTermKeyResponse:(id)a3 requestID:(id)a4;
- (void)sendRelockRequestWithReset:(BOOL)a3;
- (void)sendSessionAuthenticationToken:(id)a3 sessionID:(unsigned int)a4;
- (void)sendSessionKeyExchangeRequest:(id)a3 usedEscrow:(BOOL)a4 sessionID:(unsigned int)a5;
- (void)sendSetupCreateEscrowRecordWithSessionID:(unsigned int)a3 stepData:(id)a4 errorCode:(int64_t)a5;
- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 sessionID:(unsigned int)a5 errorCode:(int64_t)a6;
- (void)sendStartLTKTransfer;
- (void)sendStashKeyRequest:(id)a3 sessionID:(unsigned int)a4;
- (void)sendStashToken:(id)a3 sessionID:(unsigned int)a4;
- (void)sendStateRequest;
- (void)setAutoUnlockEnabledUpdatedAfterFirstUnlock:(BOOL)a3;
- (void)setDelayedStartTimer:(id)a3;
- (void)setDeviceSwitchUnlockRetryDate:(id)a3;
- (void)setKeybagAssertion:(id)a3;
- (void)setLongTermKeyTimer:(id)a3;
- (void)setLtkWaitingForUnlock:(BOOL)a3;
- (void)setMetricDates:(id)a3;
- (void)setNeedsOffWristBeforePairedUnlock:(BOOL)a3;
- (void)setOutstandingStartLTK:(BOOL)a3;
- (void)setRemoteDeviceLocked:(BOOL)a3;
- (void)setSessionRecord:(id)a3;
- (void)setStashHandler:(id)a3;
- (void)setStashTimer:(id)a3;
- (void)setStateHandler:(id)a3;
- (void)setStateTimer:(id)a3;
- (void)setUnlockingForKeybagUnlock:(BOOL)a3;
- (void)setUnlockingState:(int64_t)a3;
- (void)setUseEscrowRecord:(BOOL)a3;
- (void)setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:(BOOL)a3;
- (void)setWasInLockScreen:(BOOL)a3;
- (void)startLTKExchange;
- (void)stashTimerFired:(id)a3;
- (void)syncUnlockEnabled:(BOOL)a3;
- (void)takeMobileKeybagAssertion;
- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4;
@end

@implementation SDUnlockKeyManager

+ (id)sharedKeyManager
{
  if (qword_100657200 != -1) {
    dispatch_once(&qword_100657200, &stru_1005CF810);
  }
  return (id)qword_1006571F8;
}

- (SDUnlockKeyManager)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
  v2 = -[SDUnlockSessionManager init](&v26, "init");
  v3 = v2;
  if (v2)
  {
    stateTimer = v2->_stateTimer;
    v2->_stateTimer = 0LL;

    id stashHandler = v3->_stashHandler;
    v3->_id stashHandler = 0LL;

    id stateHandler = v3->_stateHandler;
    v3->_id stateHandler = 0LL;

    sessionRecord = v3->_sessionRecord;
    v3->_sessionRecord = 0LL;

    v3->_useEscrowRecord = 1;
    v3->_remoteDeviceLocked = 1;
    v3->_unlockingState = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    v3->_wasInLockScreen = [v8 deviceKeyBagLocked];

    v9 = objc_alloc_init(&OBJC_CLASS___SDUnlockKeyMetricDates);
    metricDates = v3->_metricDates;
    v3->_metricDates = v9;

    -[SDUnlockKeyManager addObservers](v3, "addObservers");
    id v11 = -[SDUnlockKeyManager checkDevicePairingState](v3, "checkDevicePairingState");
    uint64_t v13 = paired_unlock_log(v11, v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = -[SDUnlockSessionManager pairingCompatibilityState](v3, "pairingCompatibilityState");
      unsigned int v16 = -[SDUnlockSessionManager deviceIsPaired](v3, "deviceIsPaired");
      v17 = @"NO";
      if (v16) {
        v17 = @"YES";
      }
      *(_DWORD *)buf = 67109378;
      unsigned int v28 = v15;
      __int16 v29 = 2112;
      v30 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Key loading NanoRegitry, (compatibility state = %d, is paired = %@)",  buf,  0x12u);
    }

    if (-[SDUnlockSessionManager inConfigureState](v3, "inConfigureState"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](v3, "securityManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localLongTermKey]);
      if (v19)
      {
      }

      else
      {
        unsigned __int8 v20 = -[SDUnlockSessionManager deviceIsPaired](v3, "deviceIsPaired");

        if ((v20 & 1) == 0)
        {
          uint64_t v23 = paired_unlock_log(v21, v22);
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "NanoRegistry is already in the configure state",  buf,  2u);
          }

          -[SDUnlockKeyManager handleConfigState](v3, "handleConfigState");
        }
      }
    }

    if (_os_feature_enabled_impl("Sharing", "pu_lock_button_all")) {
      -[SDUnlockKeyManager setAutoUnlockEnabledUpdatedAfterFirstUnlock:]( v3,  "setAutoUnlockEnabledUpdatedAfterFirstUnlock:",  1LL);
    }
  }

  return v3;
}

- (void)addObservers
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
  -[SDUnlockSessionManager addObservers](&v13, "addObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"handleUILockStateChange" name:@"com.apple.sharingd.UILockStatusChanged" object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"keyBagLockStateChange:" name:@"com.apple.sharingd.KeyBagLockStatusChanged" object:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"handlePairedWatchWristStateChanged" name:@"com.apple.sharingd.PairedWatchWristStateChanged" object:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"bannerDidDismiss" name:@"SDUnlockBannerCouldNotBeDisplayed" object:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"bannerLockButtonWasTapped" name:@"SDUnlockBannerButtonTapped" object:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"bannerDidDismiss" name:@"SDUnlockBannerDismissed" object:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 addObserver:self selector:"handleAutoUnlockEnabledStateUpdated" name:@"SDAutoUnlockAKSManagerDynamicStoreUpdatedAfterFirstUnlockNotification" object:0];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:self selector:"devicesDidUnpair:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 addObserver:self selector:"newDeviceBecameActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v12 addObserver:self selector:"deviceDidEnterConfigurationState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  -[SDUnlockKeyManager addObserversForTests](self, "addObserversForTests");
}

- (void)debugInfoRequested:(id)a3
{
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager generateDebugInfo](self, "generateDebugInfo"));
  sub_10002FC8C(v7, (uint64_t)v6);
}

- (id)generateDebugInfo
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
  id v4 = -[SDUnlockSessionManager generateDebugInfo](&v17, "generateDebugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  else {
    id v7 = @"NO";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Escrow Secret Exists:%@",  v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  if (-[SDUnlockKeyManager remoteDeviceLocked](self, "remoteDeviceLocked")) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Remote Device Locked:%@",  v9));
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDUnlockKeyManager stringForState:]( self,  "stringForState:",  -[SDUnlockKeyManager unlockingState](self, "unlockingState")));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unlocking State:%@",  v11));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeychainItems]);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Keychain Items:%@",  v14));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  return v3;
}

- (id)getWatchNameForTesting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"PairedUnlockWatchName"]);
  id v4 = v3;
  if (v3) {
    v5 = v3;
  }
  else {
    v5 = @"Nobody's Apple Watch";
  }

  return v5;
}

- (void)deviceDidEnterConfigurationState:(id)a3
{
  uint64_t v4 = paired_unlock_log(self, a2);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received config state notification", v10, 2u);
  }

  BOOL v6 = -[SDUnlockSessionManager inConfigureState](self, "inConfigureState");
  if (v6 && !(BOOL v6 = -[SDUnlockSessionManager deviceIsPaired](self, "deviceIsPaired")))
  {
    -[SDUnlockKeyManager handleConfigState](self, "handleConfigState");
  }

  else
  {
    uint64_t v8 = paired_unlock_log(v6, v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10014AF20();
    }
  }

- (void)handleConfigState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if ([v3 deviceKeyBagUnlocked])
  {
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v5 = [v4 deviceKeyBagDisabled];

    if (!v5)
    {
      BOOL v6 = 1;
      goto LABEL_6;
    }
  }

  -[SDUnlockKeyManager startLTKExchange](self, "startLTKExchange");
  BOOL v6 = 0;
LABEL_6:
  self->_ltkWaitingForUnlock = v6;
}

- (void)handleAutoUnlockEnabledStateUpdated
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100143AB4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)startLTKExchange
{
}

- (void)keyBagLockStateChange:(id)a3
{
  uint64_t v6 = paired_unlock_log(v4, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    v9 = sub_100112D38((unint64_t)[v8 deviceKeyBagState]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
    int v30 = 138412290;
    v31 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Keybag state changed to %@",  (uint8_t *)&v30,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v12 = [v11 deviceKeyBagUnlocked];

  if (!self->_ltkWaitingForUnlock || (v12 & 1) != 0)
  {
    if (!self->_ltkWaitingForUnlock) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v14 = [v13 deviceKeyBagDisabled];

  if ((v14 & 1) != 0)
  {
LABEL_8:
    -[SDUnlockKeyManager startLTKExchange](self, "startLTKExchange");
    self->_ltkWaitingForUnlock = 0;
  }

- (void)handleUILockStateChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 deviceUIUnlocked];

  uint64_t v7 = paired_unlock_log(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"NO";
    if (v4) {
      v9 = @"YES";
    }
    int v19 = 138412290;
    unsigned __int8 v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Key manager received UI lock state changed (UI unlocked: %@)",  (uint8_t *)&v19,  0xCu);
  }

  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    [v10 migrateEscrowDataIfNeeded];

    BOOL v11 = -[SDUnlockKeyManager autoUnlockEnabledUpdatedAfterFirstUnlock]( self,  "autoUnlockEnabledUpdatedAfterFirstUnlock");
    if (v11)
    {
      if (self->_unlockingForKeybagUnlock) {
        goto LABEL_8;
      }
      BOOL v11 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill");
      if (v11)
      {
        if (!self->_unlockingForKeybagUnlock)
        {
          uint64_t v18 = paired_unlock_log(v11, v12);
          unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_11;
          }
          LOWORD(v19) = 0;
          BOOL v15 = "Ignoring. Needs updated pill.";
          goto LABEL_10;
        }

- (void)handleSystemUIChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014423C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)beginUnlockIfNotOnLockScreen
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v4 = [v3 systemUIFlags];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v6 = [v5 deviceKeyBagUnlocked];

  if ((v4 & 2) != 0
    || (BOOL v7 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill"), !(v7 & v6))
    || self->_unlockingForKeybagUnlock)
  {
    uint64_t v9 = paired_unlock_log(v7, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((v4 & 2) != 0) {
        BOOL v11 = @"YES";
      }
      else {
        BOOL v11 = @"NO";
      }
      unsigned int v12 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill");
      BOOL unlockingForKeybagUnlock = self->_unlockingForKeybagUnlock;
      if (v12) {
        unsigned __int8 v14 = @"YES";
      }
      else {
        unsigned __int8 v14 = @"NO";
      }
      int v26 = 138413058;
      if (v6) {
        BOOL v15 = @"YES";
      }
      else {
        BOOL v15 = @"NO";
      }
      v27 = v11;
      if (unlockingForKeybagUnlock) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      __int16 v28 = 2112;
      __int16 v29 = v14;
      __int16 v30 = 2112;
      v31 = v15;
      __int16 v32 = 2112;
      v33 = v16;
      BOOL v17 = "Ignoring begin attempt. lock screen: %@, should use updated pill: %@, device unlocked: %@, ongoing watch unlock: %@";
      uint64_t v18 = v10;
      uint32_t v19 = 42;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v26, v19);
    }
  }

  else
  {
    uint64_t v20 = paired_unlock_log(v7, v8);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Starting Paired Unlock if needed",  (uint8_t *)&v26,  2u);
    }

    BOOL v22 = -[SDUnlockKeyManager startUnlockIfNeeded](self, "startUnlockIfNeeded");
    self->_BOOL unlockingForKeybagUnlock = v22;
    uint64_t v24 = paired_unlock_log(v22, v23);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_unlockingForKeybagUnlock) {
        uint64_t v25 = @"YES";
      }
      else {
        uint64_t v25 = @"NO";
      }
      int v26 = 138412290;
      v27 = v25;
      BOOL v17 = "Paired Unlock started: %@";
      uint64_t v18 = v10;
      uint32_t v19 = 12;
      goto LABEL_18;
    }
  }
}

- (void)handlePairedWatchWristStateChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100144624;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)bannerDidDismiss
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100144798;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)bannerLockButtonWasTapped
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001449B0;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)devicesDidUnpair:(id)a3
{
  id v4 = a3;
  uint64_t v6 = paired_unlock_log(v4, v5);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138477827;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received devices unpaired notification: %{private}@",  (uint8_t *)&v19,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NRPairedDeviceRegistryDevice]);

  uint64_t v12 = paired_unlock_log(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  unsigned __int8 v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Device from notification %{private}@",  (uint8_t *)&v19,  0xCu);
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:NRDevicePropertyPairingID]);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:NRDevicePropertyLocalPairingDataStorePath]);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:NRDevicePropertyDeviceNameString]);
    if (v14)
    {
      uint64_t v18 = -[SDUnlockSecurityManager initWithPairingID:pairingStorePath:deviceName:]( objc_alloc(&OBJC_CLASS___SDUnlockSecurityManager),  "initWithPairingID:pairingStorePath:deviceName:",  v14,  v16,  v17);
      -[SDUnlockKeyManager disableUnlockPairingForSecurityManager:]( self,  "disableUnlockPairingForSecurityManager:",  v18);
    }
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_10014AFC4();
  }

  self->_outstandingStartLTK = 0;
  -[SDUnlockKeyManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
  -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");
}

- (void)devicesDidFailToPair:(id)a3
{
  id v4 = a3;
  uint64_t v6 = paired_unlock_log(v4, v5);
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138477827;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received devices failed to pair notification: %{private}@",  (uint8_t *)&v19,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NRPairedDeviceRegistryDevice]);

  uint64_t v12 = paired_unlock_log(v10, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  unsigned __int8 v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138477827;
      id v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Device from notification %{private}@",  (uint8_t *)&v19,  0xCu);
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:NRDevicePropertyPairingID]);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:NRDevicePropertyLocalPairingDataStorePath]);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:NRDevicePropertyDeviceNameString]);
    if (v14)
    {
      uint64_t v18 = -[SDUnlockSecurityManager initWithPairingID:pairingStorePath:deviceName:]( objc_alloc(&OBJC_CLASS___SDUnlockSecurityManager),  "initWithPairingID:pairingStorePath:deviceName:",  v14,  v16,  v17);
      -[SDUnlockKeyManager disableUnlockPairingForSecurityManager:]( self,  "disableUnlockPairingForSecurityManager:",  v18);
    }
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_10014AFF0();
  }

  self->_outstandingStartLTK = 0;
  -[SDUnlockKeyManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
  -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");
}

- (void)newDeviceBecameActive:(id)a3
{
  uint64_t v4 = paired_unlock_log(self, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceDescription](self, "activeDeviceDescription"));
    int v7 = 138477827;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Device became active %{private}@",  (uint8_t *)&v7,  0xCu);
  }

  -[SDUnlockKeyManager handleActiveDeviceUpdated](self, "handleActiveDeviceUpdated");
}

- (void)restartDelayedStartTimer:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v8 = paired_unlock_log(v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restarting delayed start timer", buf, 2u);
  }

  delayedStartTimer = self->_delayedStartTimer;
  if (!delayedStartTimer)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100145154;
    v14[3] = &unk_1005CC1B0;
    v14[4] = self;
    id v15 = v6;
    uint64_t v11 = sub_100114598(0, &_dispatch_main_q, v14);
    uint64_t v12 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = self->_delayedStartTimer;
    self->_delayedStartTimer = v12;

    dispatch_resume((dispatch_object_t)self->_delayedStartTimer);
    delayedStartTimer = self->_delayedStartTimer;
  }

  sub_100114638((dispatch_source_s *)delayedStartTimer, a3);
}

- (void)invalidateDelayedStartTimer
{
  uint64_t v3 = paired_unlock_log(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating delayed start timer", v7, 2u);
  }

  delayedStartTimer = self->_delayedStartTimer;
  if (delayedStartTimer)
  {
    dispatch_source_cancel((dispatch_source_t)delayedStartTimer);
    id v6 = self->_delayedStartTimer;
    self->_delayedStartTimer = 0LL;
  }

- (void)restartLongTermKeyTimer:(unint64_t)a3
{
  uint64_t v5 = paired_unlock_log(self, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting long-term key timer", buf, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (!longTermKeyTimer)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100145344;
    v11[3] = &unk_1005CB2F8;
    v11[4] = self;
    uint64_t v8 = sub_100114598(0, &_dispatch_main_q, v11);
    uint64_t v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = v9;

    dispatch_resume((dispatch_object_t)self->_longTermKeyTimer);
    longTermKeyTimer = self->_longTermKeyTimer;
  }

  sub_100114638((dispatch_source_s *)longTermKeyTimer, a3);
}

- (void)invalidateLongTermKeyTimer
{
  uint64_t v3 = paired_unlock_log(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating long-term key timer", v7, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (longTermKeyTimer)
  {
    dispatch_source_cancel((dispatch_source_t)longTermKeyTimer);
    id v6 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = 0LL;
  }

- (void)takeMobileKeybagAssertion
{
  uint64_t v3 = paired_unlock_log(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Taking keybag assertion", (uint8_t *)&v8, 2u);
  }

  if (!self->_keybagAssertion)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)75LL + 45.0 + 10.0,  0LL,  @"MKBAssertionKey",  @"MKBAssertionTimeout",  @"RemoteProfile"));
    v10[1] = v5;
    id v6 = (void *)MKBDeviceLockAssertion( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  &v9,  2LL),  &v8);
    id keybagAssertion = self->_keybagAssertion;
    self->_id keybagAssertion = v6;
  }

- (void)releaseKeyBagAssertion
{
  uint64_t v3 = paired_unlock_log(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing keybag assertion", v6, 2u);
  }

  id keybagAssertion = self->_keybagAssertion;
  self->_id keybagAssertion = 0LL;
}

- (void)handleActiveDeviceUpdated
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100145670;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)checkDevicePairingState
{
  BOOL v3 = -[SDUnlockSessionManager deviceIsPaired](self, "deviceIsPaired");
  if (v3 || (BOOL v3 = -[SDUnlockSessionManager inConfigureState](self, "inConfigureState")))
  {
    uint64_t v5 = paired_unlock_log(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Devices paired/pairing (state = %d)",  (uint8_t *)v9,  8u);
    }
  }

  else
  {
    uint64_t v7 = paired_unlock_log(v3, v4);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Devices unpaired, disabling Paired Unlock",  (uint8_t *)v9,  2u);
    }

    -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  }

- (void)disableUnlockPairing
{
}

- (void)disableUnlockPairingForSecurityManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 deleteEscrowData];
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
    -[SDUnlockSessionManager disableUnlockPairingForSecManager:](&v8, "disableUnlockPairingForSecManager:", v5);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    [v6 deleteEscrowData];

    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
    -[SDUnlockSessionManager disableUnlockPairing](&v7, "disableUnlockPairing");
  }
}

- (BOOL)unlockEnabled
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
  unsigned __int8 v3 = -[SDUnlockSessionManager unlockEnabled](&v7, "unlockEnabled");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  unsigned __int8 v5 = [v4 checkForEscrowData];

  return v3 & v5;
}

- (void)syncUnlockEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = -[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled");
  if (v3)
  {
    if (!v5)
    {
      uint64_t v7 = paired_unlock_log(v5, v6);
      objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Local unlock disabled, remote enabled. Sending disable message",  buf,  2u);
      }

      -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    }
  }

  else if (v5)
  {
    uint64_t v9 = paired_unlock_log(v5, v6);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Remote unlock disabled, local enabled. Disabling local unlock",  v11,  2u);
    }

    -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  }

- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v5 = objc_msgSend(a4, "copy", a3);
    id stateHandler = self->_stateHandler;
    self->_id stateHandler = v5;

    -[SDUnlockKeyManager sendStateRequest](self, "sendStateRequest");
  }

  else
  {
    uint64_t v7 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    uint64_t v11 = @"No completion handler";
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v7,  112LL,  v8));
    -[SDUnlockKeyManager notifyUnlockStateWithState:error:](self, "notifyUnlockStateWithState:error:", 0LL, v9);
  }

- (void)notifyUnlockStateWithState:(id)a3 error:(id)a4
{
  id stateHandler = (void (**)(id, id, id))self->_stateHandler;
  if (stateHandler)
  {
    stateHandler[2](stateHandler, a3, a4);
    id v6 = self->_stateHandler;
    self->_id stateHandler = 0LL;
  }

  -[SDUnlockKeyManager invalidateStateTimer](self, "invalidateStateTimer", a3, a4);
}

- (void)restartStateTimer
{
  uint64_t v3 = paired_unlock_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting state request key timer", buf, 2u);
  }

  stateTimer = self->_stateTimer;
  if (!stateTimer)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    void v10[2] = sub_100145CDC;
    v10[3] = &unk_1005CB2F8;
    v10[4] = self;
    id v6 = sub_100114598(0, &_dispatch_main_q, v10);
    uint64_t v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v6);
    objc_super v8 = self->_stateTimer;
    self->_stateTimer = v7;

    dispatch_resume((dispatch_object_t)self->_stateTimer);
    stateTimer = self->_stateTimer;
  }

  dispatch_time_t v9 = sub_100114580(10.0 * 2.0 + 5.0);
  sub_100114638((dispatch_source_s *)stateTimer, v9);
}

- (void)invalidateStateTimer
{
  uint64_t v3 = paired_unlock_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating state timer", v7, 2u);
  }

  stateTimer = self->_stateTimer;
  if (stateTimer)
  {
    dispatch_source_cancel((dispatch_source_t)stateTimer);
    id v6 = self->_stateTimer;
    self->_stateTimer = 0LL;
  }

- (void)restartStashTimer
{
  stashTimer = self->_stashTimer;
  if (stashTimer) {
    -[NSTimer invalidate](stashTimer, "invalidate");
  }
  id v4 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "stashTimerFired:",  0LL,  0LL,  20.0));
  id v5 = self->_stashTimer;
  self->_stashTimer = v4;
}

- (void)stashTimerFired:(id)a3
{
  stashTimer = self->_stashTimer;
  self->_stashTimer = 0LL;

  uint64_t v5 = SFUnlockErrorDomian;
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  dispatch_time_t v9 = @"Other side never responded";
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  107LL,  v6));
  -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v7);
}

- (void)invalidateStashTimer
{
  stashTimer = self->_stashTimer;
  if (stashTimer)
  {
    -[NSTimer invalidate](stashTimer, "invalidate");
    id v4 = self->_stashTimer;
    self->_stashTimer = 0LL;
  }

- (void)establishStashBagWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10014608C;
  v4[3] = &unk_1005CC1B0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001462E4;
  block[3] = &unk_1005CF838;
  id v9 = a3;
  id v10 = a4;
  block[4] = self;
  id v6 = v9;
  id v7 = v10;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)notifyStashStateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v6 = paired_unlock_log(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Calling stash handler with error = %@",  (uint8_t *)&v10,  0xCu);
  }

  id stashHandler = (void (**)(id, BOOL, id))self->_stashHandler;
  if (stashHandler)
  {
    stashHandler[2](stashHandler, v4 == 0LL, v4);
    id v9 = self->_stashHandler;
    self->_id stashHandler = 0LL;
  }

  -[SDUnlockSessionManager resetStashState](self, "resetStashState");
  -[SDUnlockKeyManager invalidateStashTimer](self, "invalidateStashTimer");
}

- (void)resetSetupState
{
  self->_useEscrowRecord = 1;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
  -[SDUnlockSessionManager resetSetupState](&v2, "resetSetupState");
}

- (void)resetAndClearState
{
  self->_useEscrowRecord = 1;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
  -[SDUnlockSessionManager resetAndClearState](&v2, "resetAndClearState");
}

- (void)resetState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

  if (v3)
  {
    uint64_t v6 = paired_unlock_log(v4, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSErrorUserInfoKey v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      id v9 = sub_10014CDC0([v8 failureReason]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting key manager. Reason: %@", buf, 0xCu);
    }

    if (-[SDUnlockKeyManager unlockingState](self, "unlockingState") >= 1)
    {
      int64_t v11 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      [v12 setPhoneState:v11];
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
    -[SDUnlockKeyManager consolidateLatencies:](self, "consolidateLatencies:", v13);

    unsigned __int8 v14 = objc_alloc_init(&OBJC_CLASS___SDUnlockKeyMetricDates);
    -[SDUnlockKeyManager setMetricDates:](self, "setMetricDates:", v14);
  }

  sessionRecord = self->_sessionRecord;
  self->_sessionRecord = 0LL;

  self->_BOOL unlockingForKeybagUnlock = 0;
  -[SDUnlockKeyManager setUnlockingState:](self, "setUnlockingState:", 0LL);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SDUnlockKeyManager;
  -[SDUnlockSessionManager resetState](&v16, "resetState");
}

- (int64_t)unlockingState
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  int64_t unlockingState = v2->_unlockingState;
  objc_sync_exit(v2);

  return unlockingState;
}

- (void)setUnlockingState:(int64_t)a3
{
  uint64_t v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v4->_int64_t unlockingState = a3;
  uint64_t v7 = paired_unlock_log(v5, v6);
  NSErrorUserInfoKey v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager stringForState:](v4, "stringForState:", v4->_unlockingState));
    int v10 = 138412290;
    int64_t v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting unlocking state to %@",  (uint8_t *)&v10,  0xCu);
  }

  objc_sync_exit(v4);
}

- (id)stringForState:(int64_t)a3
{
  else {
    return off_1005CF878[a3];
  }
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5
{
  int v5 = a5;
  id v10 = a3;
  id v8 = a4;
  if (v5 <= 1000)
  {
    switch(v5)
    {
      case 1:
        -[SDUnlockKeyManager handleResetState:](self, "handleResetState:", v8);
        break;
      case 2:
        id v9 = -[SDUnlockDisable initWithData:](objc_alloc(&OBJC_CLASS___SDUnlockDisable), "initWithData:", v8);
        -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v9);

        -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
        break;
      case 4:
        -[SDUnlockKeyManager invalidateStateTimer](self, "invalidateStateTimer");
        -[SDUnlockKeyManager handleUnlockStateResponse:](self, "handleUnlockStateResponse:", v8);
        break;
    }
  }

  else
  {
    switch(v5)
    {
      case 1001:
        -[SDUnlockKeyManager handleRemoteLockStateChanged:](self, "handleRemoteLockStateChanged:", v8);
        break;
      case 1002:
        -[SDUnlockKeyManager handleSetupRequest:](self, "handleSetupRequest:", v8);
        break;
      case 1003:
        -[SDUnlockKeyManager handleCreateEscrowSecret:](self, "handleCreateEscrowSecret:", v8);
        break;
      case 1004:
        -[SDUnlockSessionManager invalidateUnlockTimer](self, "invalidateUnlockTimer");
        -[SDUnlockKeyManager handleSessionKeyExchangeResponse:](self, "handleSessionKeyExchangeResponse:", v8);
        break;
      case 1005:
        -[SDUnlockSessionManager invalidateUnlockTimer](self, "invalidateUnlockTimer");
        -[SDUnlockKeyManager handleUnlockConfirmation:](self, "handleUnlockConfirmation:", v8);
        break;
      case 1006:
        -[SDUnlockKeyManager invalidateStashTimer](self, "invalidateStashTimer");
        -[SDUnlockKeyManager handleStashKeyExchangeResponse:](self, "handleStashKeyExchangeResponse:", v8);
        break;
      case 1007:
        -[SDUnlockKeyManager invalidateStashTimer](self, "invalidateStashTimer");
        -[SDUnlockKeyManager handleStashConfirmation:](self, "handleStashConfirmation:", v8);
        break;
      case 1008:
        -[SDUnlockKeyManager handleLongTermKeyRequest:](self, "handleLongTermKeyRequest:", v8);
        -[SDUnlockKeyManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
        break;
      case 1009:
        -[SDUnlockKeyManager handleClassALongTermKeyRequest:](self, "handleClassALongTermKeyRequest:", v8);
        break;
      default:
        break;
    }
  }
}

- (void)idsControllerNearbyStateChanged:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController", a3));
  unsigned __int8 v5 = [v4 isDefaultPairedDeviceNearby];

  if ((v5 & 1) == 0) {
    -[SDUnlockKeyManager setRemoteDeviceLocked:](self, "setRemoteDeviceLocked:", 1LL);
  }
}

- (void)handleRemoteLockStateChanged:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  unsigned __int8 v5 = -[SDUnlockLockStateUpdated initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockLockStateUpdated),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (v5 && -[SDUnlockLockStateUpdated hasUnlocked](v5, "hasUnlocked"))
  {
    if (-[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled"))
    {
      BOOL v6 = -[SDUnlockLockStateUpdated unlocked](v5, "unlocked");
      BOOL v7 = v6;
      uint64_t v9 = paired_unlock_log(v6, v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Lock device is unlocked", buf, 2u);
        }

        if (self->_delayedStartTimer || (id)-[SDUnlockKeyManager unlockingState](self, "unlockingState") == (id)1)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

          if (v12)
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
            [v13 setFailureReason:15];
          }
        }

        -[SDUnlockKeyManager setRemoteDeviceLocked:](self, "setRemoteDeviceLocked:", 0LL);
        -[SDUnlockKeyManager resetState](self, "resetState");
      }

      else
      {
        if (v11)
        {
          v23[0] = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Lock device is locked",  (uint8_t *)v23,  2u);
        }

        -[SDUnlockKeyManager setRemoteDeviceLocked:](self, "setRemoteDeviceLocked:", 1LL);
      }
    }

    else
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      if (v14)
      {
        id v15 = (void *)v14;
        objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pairingID]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingID](self, "pairingID"));
        if ([v17 isEqualToString:v18])
        {
          int v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairingStorePath]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingStorePath](self, "pairingStorePath"));
          unsigned int v22 = [v20 isEqualToString:v21];

          if (v22) {
            -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
          }
        }

        else
        {
        }
      }
    }
  }
}

- (void)handleLongTermKeyRequest:(id)a3
{
  self->_outstandingStartLTK = 0;
  id v4 = a3;
  unsigned __int8 v5 = -[SDUnlockLongTermKeyRequest initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockLongTermKeyRequest),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  BOOL v6 = -[SDUnlockSessionManager inConfigureState](self, "inConfigureState");
  if (!v6)
  {
    uint64_t v15 = paired_unlock_log(v6, v7);
    objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10014B0C8(self, v16);
    }

    goto LABEL_14;
  }

  -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
  BOOL v8 = -[SDUnlockLongTermKeyRequest hasLongTermKey](v5, "hasLongTermKey");
  if (!v8
    || (id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest longTermKey](v5, "longTermKey")),
        unsigned int v11 = -[SDUnlockKeyManager updateLongTermKey:](self, "updateLongTermKey:", v10),
        v10,
        !v11))
  {
    uint64_t v17 = paired_unlock_log(v8, v9);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10014B01C();
    }

    if (-[SDUnlockLongTermKeyRequest hasLongTermKey](v5, "hasLongTermKey")) {
      int v19 = &off_1005CF8C0;
    }
    else {
      int v19 = &off_1005CF8B8;
    }
    -[SDUnlockSessionManager abortDevicePairingWithReason:](self, "abortDevicePairingWithReason:", *v19);
LABEL_14:
    -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest requestID](v5, "requestID"));
    -[SDUnlockKeyManager sendLongTermKeyResponse:requestID:](self, "sendLongTermKeyResponse:requestID:", 0LL, v20);

    goto LABEL_15;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localLongTermKey]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest requestID](v5, "requestID"));
  -[SDUnlockKeyManager sendLongTermKeyResponse:requestID:](self, "sendLongTermKeyResponse:requestID:", v13, v14);

  -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");
LABEL_15:
}

- (void)handleClassALongTermKeyRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[SDUnlockClassALongTermKeyRequest initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockClassALongTermKeyRequest),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v7 = [v6 deviceKeyBagUnlocked];

  if (v7)
  {
    BOOL v8 = -[SDUnlockClassALongTermKeyRequest hasLongTermKey](v5, "hasLongTermKey");
    if (v8)
    {
      -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockClassALongTermKeyRequest longTermKey](v5, "longTermKey"));
      unsigned __int8 v11 = -[SDUnlockKeyManager updateLongTermKey:](self, "updateLongTermKey:", v10);

      if ((v11 & 1) != 0)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 localLongTermKey]);
        -[SDUnlockKeyManager sendClassALongTermKeyResponse:sessionID:errorCode:]( self,  "sendClassALongTermKeyResponse:sessionID:errorCode:",  v13,  -[SDUnlockClassALongTermKeyRequest sessionID](v5, "sessionID"),  0LL);

        goto LABEL_13;
      }

      uint64_t v16 = 101LL;
    }

    else
    {
      uint64_t v16 = 103LL;
    }
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v15 = [v14 deviceKeyBagDisabled];

    if (v15) {
      uint64_t v16 = 108LL;
    }
    else {
      uint64_t v16 = 102LL;
    }
  }

  uint64_t v17 = paired_unlock_log(v8, v9);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10014B144();
  }

  -[SDUnlockKeyManager sendClassALongTermKeyResponse:sessionID:errorCode:]( self,  "sendClassALongTermKeyResponse:sessionID:errorCode:",  0LL,  -[SDUnlockClassALongTermKeyRequest sessionID](v5, "sessionID"),  v16);
  -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
LABEL_13:
}

- (BOOL)updateLongTermKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 generateLocalLongTermKey:1]);

    if (v6)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 signRemoteKey:v4 withLocalKey:v6 localKeyClass:1 remoteKeyClass:3]);

      BOOL v9 = v8 != 0LL;
      if (v8)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        [v10 updateLocalLongTermKey:v6 remoteLongTermKey:v8];
      }
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)handleSetupRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[SDUnlockSetupRequest initWithData:](objc_alloc(&OBJC_CLASS___SDUnlockSetupRequest), "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v7 = [v6 deviceKeyBagUnlocked];

  if (v7)
  {
    if (v5)
    {
      if (!-[SDUnlockSetupRequest hasLongTermKey](v5, "hasLongTermKey"))
      {
        id v12 = (id)-[SDUnlockSetupRequest sessionID](v5, "sessionID");
        uint64_t v13 = self;
        uint64_t v14 = 0LL;
        goto LABEL_11;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupRequest longTermKey](v5, "longTermKey"));
      unsigned int v11 = -[SDUnlockKeyManager updateLongTermKey:](self, "updateLongTermKey:", v10);

      if (v11)
      {
        id v12 = (id)-[SDUnlockSetupRequest sessionID](v5, "sessionID");
        uint64_t v13 = self;
        uint64_t v14 = 1LL;
LABEL_11:
        -[SDUnlockKeyManager handleEscrowSessionRequest:withUpdatedLongTermKey:]( v13,  "handleEscrowSessionRequest:withUpdatedLongTermKey:",  v12,  v14);
        goto LABEL_16;
      }

      uint64_t v17 = 101LL;
    }

    else
    {
      uint64_t v17 = 103LL;
    }
  }

  else
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v16 = [v15 deviceKeyBagDisabled];

    if (v16) {
      uint64_t v17 = 108LL;
    }
    else {
      uint64_t v17 = 102LL;
    }
  }

  uint64_t v18 = paired_unlock_log(v8, v9);
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10014B1A4();
  }

  -[SDUnlockKeyManager sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:]( self,  "sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:",  0LL,  0LL,  -[SDUnlockSetupRequest sessionID](v5, "sessionID"),  v17);
  -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  -[SDUnlockKeyManager resetSetupState](self, "resetSetupState");
LABEL_16:
}

- (void)handleEscrowSessionRequest:(unsigned int)a3 withUpdatedLongTermKey:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 localLongTermKey]);
  if (!v8)
  {

    goto LABEL_8;
  }

  uint64_t v9 = (void *)v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteLongTermKey]);

  if (!v11)
  {
LABEL_8:
    uint64_t v19 = 187LL;
    goto LABEL_9;
  }

  int v22 = 0;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setSetupAuthSession:]( self,  "setSetupAuthSession:",  [v14 escrowCreationSessionAsOriginator:1 errorCode:&v22]);

  int64_t v12 = -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession");
  if (v12 < 0)
  {
    uint64_t v19 = 188LL;
    if (v22 != -536870174 && v22 != -536362984)
    {
      if (v22 == -536362989) {
        uint64_t v19 = 188LL;
      }
      else {
        uint64_t v19 = 101LL;
      }
    }
  }

  else
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "stepWithAuthSession:data:",  -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession"),  0));

    if (v16)
    {
      if (a4)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 localLongTermKey]);
        -[SDUnlockKeyManager sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:]( self,  "sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:",  v18,  v16,  v5,  0LL);
      }

      else
      {
        -[SDUnlockKeyManager sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:]( self,  "sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:",  0LL,  v16,  v5,  0LL);
      }

      return;
    }

    uint64_t v19 = 101LL;
  }

- (void)handleCreateEscrowSecret:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SDUnlockSetupCreateSecret initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSetupCreateSecret),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v7 = [v6 deviceKeyBagUnlocked];

  if (v7)
  {
    if (v5 && (BOOL v8 = -[SDUnlockSetupCreateSecret hasToken](v5, "hasToken")))
    {
      uint64_t v29 = 0LL;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      int64_t v11 = -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession");
      int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateSecret token](v5, "token"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stepWithAuthSession:v11 data:v12 authStep:0 errorCode:&v29]);

      if (!v13)
      {
        if (v29 == -536363002)
        {
          uint64_t v22 = paired_unlock_log(v8, v9);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Bad signature, deleting bad LTKs",  buf,  2u);
          }

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
          [v24 deleteLongTermKeys];

          uint64_t v19 = 188LL;
        }

        else
        {
          uint64_t v19 = 101LL;
        }

        uint64_t v18 = @"Could not complete step";
        goto LABEL_11;
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "escrowSecretWithAuthSession:",  -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession")));

      if (v15)
      {
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        unsigned __int8 v17 = [v16 storeEscrowData:v15];

        if ((v17 & 1) != 0)
        {
          -[SDUnlockKeyManager sendSetupCreateEscrowRecordWithSessionID:stepData:errorCode:]( self,  "sendSetupCreateEscrowRecordWithSessionID:stepData:errorCode:",  -[SDUnlockSetupCreateSecret sessionID](v5, "sessionID"),  v13,  0LL);
          -[SDUnlockSessionManager enableUnlockPairing](self, "enableUnlockPairing");
          -[SDUnlockKeyManager resetSetupState](self, "resetSetupState");

          goto LABEL_14;
        }

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
        unsigned int v26 = [v25 deviceKeyBagLocked];
        v27 = @"NO";
        if (v26) {
          v27 = @"YES";
        }
        uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to store escrow secret (locked = %@)",  v27));
      }

      else
      {
        uint64_t v18 = @"Failed to create escrow secret";
      }
    }

    else
    {
      uint64_t v18 = @"No remote step data in message";
    }

    uint64_t v19 = 101LL;
  }

  else
  {
    uint64_t v18 = @"Device locked";
    uint64_t v19 = 102LL;
  }

- (void)handleSessionKeyExchangeResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SDUnlockSessionKeyExchangeResponse initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSessionKeyExchangeResponse),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
  [v7 setKeyExchangeResponseReceived:v6];

  if ((id)-[SDUnlockKeyManager unlockingState](self, "unlockingState") == (id)1
    && -[SDUnlockSessionKeyExchangeResponse hasKey](v5, "hasKey"))
  {
    int64_t v8 = -[SDUnlockSessionKeyExchangeResponse hasSessionID](v5, "hasSessionID");
    if ((_DWORD)v8
      && (unsigned int v10 = -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"),
          int64_t v8 = -[SDUnlockSessionRecord unlockSessionID](self->_sessionRecord, "unlockSessionID"),
          v8 == v10))
    {
      *(void *)v47 = 0LL;
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      int64_t v12 = -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeResponse key](v5, "key"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 stepWithAuthSession:v12 data:v13 authStep:0 errorCode:v47]);

      if (v14)
      {
        if (!-[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill"))
        {
          unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 keyExchangeResponseReceived]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
          [v19 setPillUpdated:v18];

          -[SDUnlockKeyManager sendSessionAuthenticationToken:sessionID:]( self,  "sendSessionAuthenticationToken:sessionID:",  v14,  -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"));
        }
      }

      else
      {
        uint64_t v36 = paired_unlock_log(v15, v16);
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10014B290();
        }

        if (*(void *)v47 == -536363002LL)
        {
          uint64_t v40 = paired_unlock_log(v38, v39);
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_10014B264();
          }

          -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
          -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
          [v42 deleteLongTermKeys];

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          if (v43)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
            [v44 setFailureReason:22];
          }
        }

        else
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

          if (v45)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
            [v46 setFailureReason:3];
          }

          -[SDUnlockSessionManager sendResetMessage:reason:]( self,  "sendResetMessage:reason:",  -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"),  3LL);
        }
      }
    }

    else
    {
      uint64_t v33 = paired_unlock_log(v8, v9);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v35 = -[SDUnlockSessionRecord unlockSessionID](self->_sessionRecord, "unlockSessionID");
        *(_DWORD *)v47 = 134218240;
        *(void *)&v47[4] = v35;
        __int16 v48 = 2048;
        uint64_t v49 = -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID");
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Incorrect session ID (key ID: %ld, lock ID: %ld)",  v47,  0x16u);
      }

      -[SDUnlockSessionManager restartUnlockTimer:](self, "restartUnlockTimer:", sub_100114580((double)45LL));
    }
  }

  else
  {
    BOOL v20 = -[SDUnlockSessionKeyExchangeResponse hasKeyFailed](v5, "hasKeyFailed");
    if (v20 && (BOOL v20 = -[SDUnlockSessionKeyExchangeResponse keyFailed](v5, "keyFailed")))
    {
      id v22 = -[SDUnlockKeyManager resetState](self, "resetState");
      if (!self->_useEscrowRecord)
      {
        self->_useEscrowRecord = 1;
        uint64_t v24 = paired_unlock_log(v22, v23);
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10014B2BC();
        }

        self->_BOOL unlockingForKeybagUnlock = 1;
        unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          [v27 setRetriedWithEscrowRecord:1];
        }

        -[SDUnlockKeyManager initiateRemoteUnlock](self, "initiateRemoteUnlock");
      }
    }

    else
    {
      uint64_t v28 = paired_unlock_log(v20, v21);
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10014B2E8(self, v5);
      }

      if ((id)-[SDUnlockKeyManager unlockingState](self, "unlockingState") == (id)1) {
        uint64_t v30 = 2LL;
      }
      else {
        uint64_t v30 = 9LL;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

      if (v31)
      {
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        [v32 setFailureReason:v30];
      }

      -[SDUnlockSessionManager sendResetMessage:reason:]( self,  "sendResetMessage:reason:",  -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"),  v30);
    }
  }
}

- (void)handleUnlockConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SDUnlockSessionConfirmation initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockSessionConfirmation),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
  [v7 setConfirmationReceived:v6];

  int64_t v8 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
  if (v8 == 2
    && (int64_t v8 = -[SDUnlockSessionConfirmation hasSuccess](v5, "hasSuccess"), (_DWORD)v8)
    && (int64_t v8 = -[SDUnlockSessionConfirmation success](v5, "success"), (_DWORD)v8)
    && (unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager")),
        unsigned int v11 = objc_msgSend( v10,  "confirmUnlockWithAuthSession:",  -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession")),  v10,  v11))
  {
    self->_BOOL useEscrowRecord = 0;
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

    if (v12)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      [v13 setSucceeded:1];
    }

    id v14 = -[SDUnlockKeyManager resetState](self, "resetState");
    uint64_t v16 = paired_unlock_log(v14, v15);
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UNLOCK CONFIRMED!", (uint8_t *)&v29, 2u);
    }
  }

  else
  {
    BOOL useEscrowRecord = self->_useEscrowRecord;
    uint64_t v19 = paired_unlock_log(v8, v9);
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (useEscrowRecord)
    {
      if (v21)
      {
        LOWORD(v29) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Confirmation failed, resetting state",  (uint8_t *)&v29,  2u);
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      if (v22)
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        [v23 setFailureReason:25];
      }

      -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
    }

    else
    {
      if (v21)
      {
        unsigned int v24 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
        if (-[SDUnlockSessionConfirmation hasSuccess](v5, "hasSuccess")) {
          uint64_t v25 = @"YES";
        }
        else {
          uint64_t v25 = @"NO";
        }
        LODWORD(v29) = 67109634;
        if (-[SDUnlockSessionConfirmation success](v5, "success")) {
          unsigned int v26 = @"YES";
        }
        else {
          unsigned int v26 = @"NO";
        }
        HIDWORD(v29) = v24;
        __int16 v30 = 2112;
        v31 = v25;
        __int16 v32 = 2112;
        uint64_t v33 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Token unlock failed, retrying (state = %d, confirmation has success = %@, confirmation success = %@)",  (uint8_t *)&v29,  0x1Cu);
      }

      -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
      self->_BOOL unlockingForKeybagUnlock = 1;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

      if (v27)
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        [v28 setRetriedWithEscrowRecord:1];
      }

      -[SDUnlockKeyManager initiateRemoteUnlock](self, "initiateRemoteUnlock", v29);
    }
  }
}

- (void)handleResetState:(id)a3
{
  id v4 = a3;
  unsigned int v10 = -[SDUnlockReset initWithData:](objc_alloc(&OBJC_CLASS___SDUnlockReset), "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v10);
  if (-[SDUnlockReset hasResetReason](v10, "hasResetReason"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

    if (v5)
    {
      unsigned __int16 v6 = (unsigned __int16)-[SDUnlockReset resetReason](v10, "resetReason");
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      [v7 setFailureReason:v6];
    }
  }

  sessionRecord = self->_sessionRecord;
  if (!sessionRecord
    || (unsigned int v9 = -[SDUnlockSessionRecord unlockSessionID](sessionRecord, "unlockSessionID"),
        -[SDUnlockReset sessionID](v10, "sessionID") == v9))
  {
    -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
  }
}

- (void)handleStashKeyExchangeResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SDUnlockStashKeyExchangeResponse initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockStashKeyExchangeResponse),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (-[SDUnlockStashKeyExchangeResponse hasKey](v5, "hasKey"))
  {
    unsigned __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    int64_t v7 = -[SDUnlockSessionManager stashBagSession](self, "stashBagSession");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashKeyExchangeResponse key](v5, "key"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 stepWithAuthSession:v7 data:v8]);

    if (v9)
    {
      -[SDUnlockKeyManager sendStashToken:sessionID:]( self,  "sendStashToken:sessionID:",  v9,  -[SDUnlockStashKeyExchangeResponse sessionID](v5, "sessionID"));
    }

    else
    {
      uint64_t v21 = paired_unlock_log(v10, v11);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10014B390();
      }

      uint64_t v23 = SFUnlockErrorDomian;
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      uint64_t v29 = @"Error creating stash token";
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  101LL,  v24));
      -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v25);
    }
  }

  else
  {
    id v12 = (id)-[SDUnlockStashKeyExchangeResponse hasErrorCode](v5, "hasErrorCode");
    if ((_DWORD)v12)
    {
      id v12 = (id)-[SDUnlockStashKeyExchangeResponse errorCode](v5, "errorCode");
      unsigned int v14 = v12;
    }

    else
    {
      unsigned int v14 = 103;
    }

    uint64_t v15 = paired_unlock_log(v12, v13);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10014B3BC(v14, v16, v17);
    }

    uint64_t v18 = SFUnlockErrorDomian;
    uint64_t v19 = v14;
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v27 = @"Error getting repsonse key";
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  v19,  v9));
    -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v20);
  }
}

- (void)handleStashConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SDUnlockStashConfirmation initWithData:]( objc_alloc(&OBJC_CLASS___SDUnlockStashConfirmation),  "initWithData:",  v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (-[SDUnlockStashConfirmation hasSuccess](v5, "hasSuccess") && -[SDUnlockStashConfirmation success](v5, "success"))
  {
    -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", 0LL);
  }

  else
  {
    uint64_t v6 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    uint64_t v10 = @"Other device failed to confirm stash setup";
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  101LL,  v7));
    -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v8);
  }
}

- (void)handleUnlockStateResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SDUnlockStateResponse initWithData:](objc_alloc(&OBJC_CLASS___SDUnlockStateResponse), "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  BOOL v6 = -[SDUnlockStateResponse hasUnlockEnabled](v5, "hasUnlockEnabled");
  if (v6 && (BOOL v6 = -[SDUnlockStateResponse hasPasscodeEnabled](v5, "hasPasscodeEnabled")))
  {
    -[SDUnlockKeyManager syncUnlockEnabled:]( self,  "syncUnlockEnabled:",  -[SDUnlockStateResponse unlockEnabled](v5, "unlockEnabled"));
    id v8 = objc_alloc(&OBJC_CLASS___SFUnlockState);
    NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled")));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SDUnlockStateResponse passcodeEnabled](v5, "passcodeEnabled")));
    id v11 = [v8 initWithUnlockEnabled:v9 remotePasscodeEnabled:v10];

    -[SDUnlockKeyManager notifyUnlockStateWithState:error:](self, "notifyUnlockStateWithState:error:", v11, 0LL);
  }

  else
  {
    uint64_t v12 = paired_unlock_log(v6, v7);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10014B424();
    }

    uint64_t v14 = SFUnlockErrorDomian;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    uint64_t v18 = @"Response is missing information";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v14,  103LL,  v15));
    -[SDUnlockKeyManager notifyUnlockStateWithState:error:](self, "notifyUnlockStateWithState:error:", 0LL, v16);
  }
}

- (void)sendStartLTKTransfer
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SDUnlockStartLTKTransfer);
  -[SDUnlockStartLTKTransfer setVersion:](v3, "setVersion:", 1LL);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v3);
  self->_outstandingStartLTK = 1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStartLTKTransfer data](v3, "data"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 75LL));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100148880;
  v7[3] = &unk_1005CB3E8;
  v7[4] = self;
  [v4 sendProtocolBufferData:v5 withType:108 timeout:v6 option:0 errorHandler:v7];

  -[SDUnlockKeyManager restartLongTermKeyTimer:]( self,  "restartLongTermKeyTimer:",  sub_100114580((double)75LL + 45.0 + 10.0));
}

- (void)sendLongTermKeyResponse:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___SDUnlockLongTermKeyResponse);
  -[SDUnlockLongTermKeyResponse setVersion:](v8, "setVersion:", 1LL);
  -[SDUnlockLongTermKeyResponse setRequestID:](v8, "setRequestID:", v7);

  if (v6) {
    -[SDUnlockLongTermKeyResponse setLongTermKey:](v8, "setLongTermKey:", v6);
  }
  else {
    -[SDUnlockLongTermKeyResponse setKeyFailed:](v8, "setKeyFailed:", 1LL);
  }
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v8);
  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyResponse data](v8, "data"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100148A3C;
  v12[3] = &unk_1005CB3E8;
  v12[4] = self;
  [v9 sendProtocolBufferData:v10 withType:107 timeout:v11 option:0 errorHandler:v12];
}

- (void)sendClassALongTermKeyResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  NSErrorUserInfoKey v9 = objc_alloc_init(&OBJC_CLASS___SDUnlockClassALongTermKeyResponse);
  -[SDUnlockClassALongTermKeyResponse setVersion:](v9, "setVersion:", 1LL);
  -[SDUnlockClassALongTermKeyResponse setSessionID:](v9, "setSessionID:", v6);
  if (v8) {
    -[SDUnlockClassALongTermKeyResponse setLongTermKey:](v9, "setLongTermKey:", v8);
  }
  else {
    -[SDUnlockClassALongTermKeyResponse setErrorCode:](v9, "setErrorCode:", v5);
  }
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockClassALongTermKeyResponse data](v9, "data"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v13[1] = 3221225472LL;
  v13[2] = sub_100148BCC;
  v13[3] = &unk_1005CB3E8;
  v13[4] = self;
  v13[0] = _NSConcreteStackBlock;
  [v10 sendProtocolBufferData:v11 withType:109 timeout:v12 option:0 dataClass:2 queueOneID:0 errorHandler:v13];
}

- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 sessionID:(unsigned int)a5 errorCode:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___SDUnlockSetupSessionCreated);
  -[SDUnlockSetupSessionCreated setVersion:](v12, "setVersion:", 1LL);
  -[SDUnlockSetupSessionCreated setSessionID:](v12, "setSessionID:", v7);
  if (v10) {
    -[SDUnlockSetupSessionCreated setLongTermKey:](v12, "setLongTermKey:", v10);
  }
  if (v11) {
    -[SDUnlockSetupSessionCreated setToken:](v12, "setToken:", v11);
  }
  if (a6) {
    -[SDUnlockSetupSessionCreated setErrorCode:](v12, "setErrorCode:", a6);
  }
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated data](v12, "data"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100148D30;
  v16[3] = &unk_1005CB3E8;
  v16[4] = self;
  [v13 sendProtocolBufferData:v14 withType:101 timeout:v15 option:0 errorHandler:v16];
}

- (void)sendSetupCreateEscrowRecordWithSessionID:(unsigned int)a3 stepData:(id)a4 errorCode:(int64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  NSErrorUserInfoKey v9 = objc_alloc_init(&OBJC_CLASS___SDUnlockSetupCreateRecord);
  -[SDUnlockSetupCreateRecord setVersion:](v9, "setVersion:", 1LL);
  -[SDUnlockSetupCreateRecord setSessionID:](v9, "setSessionID:", v6);
  if (v8) {
    -[SDUnlockSetupCreateRecord setToken:](v9, "setToken:", v8);
  }
  if (a5) {
    -[SDUnlockSetupCreateRecord setErrorCode:](v9, "setErrorCode:", a5);
  }
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateRecord data](v9, "data"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100148E6C;
  v13[3] = &unk_1005CB3E8;
  v13[4] = self;
  [v10 sendProtocolBufferData:v11 withType:102 timeout:v12 option:0 errorHandler:v13];
}

- (void)sendSessionKeyExchangeRequest:(id)a3 usedEscrow:(BOOL)a4 sessionID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  NSErrorUserInfoKey v9 = objc_alloc_init(&OBJC_CLASS___SDUnlockSessionKeyExchangeRequest);
  -[SDUnlockSessionKeyExchangeRequest setVersion:](v9, "setVersion:", 1LL);
  -[SDUnlockSessionKeyExchangeRequest setSessionID:](v9, "setSessionID:", v5);
  -[SDUnlockSessionKeyExchangeRequest setUsingRecord:](v9, "setUsingRecord:", v6);
  -[SDUnlockSessionKeyExchangeRequest setKey:](v9, "setKey:", v8);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v9, "data"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100148FBC;
  v13[3] = &unk_1005CB3E8;
  v13[4] = self;
  [v10 sendProtocolBufferData:v11 withType:103 timeout:v12 option:0 errorHandler:v13];

  -[SDUnlockKeyManager setUnlockingState:](self, "setUnlockingState:", 1LL);
}

- (void)sendSessionAuthenticationToken:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SDUnlockSessionAuthToken);
  -[SDUnlockSessionAuthToken setVersion:](v7, "setVersion:", 1LL);
  -[SDUnlockSessionAuthToken setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockSessionAuthToken setAuthToken:](v7, "setAuthToken:", v6);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionAuthToken data](v7, "data"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100149168;
  v11[3] = &unk_1005CB3E8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:104 timeout:v10 option:1 errorHandler:v11];

  -[SDUnlockSessionManager restartUnlockTimer:](self, "restartUnlockTimer:", sub_100114580((double)45LL));
  -[SDUnlockKeyManager setUnlockingState:](self, "setUnlockingState:", 2LL);
}

- (void)sendStashKeyRequest:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SDUnlockStashKeyExchangeRequest);
  -[SDUnlockStashKeyExchangeRequest setVersion:](v7, "setVersion:", 1LL);
  -[SDUnlockStashKeyExchangeRequest setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockStashKeyExchangeRequest setKey:](v7, "setKey:", v6);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashKeyExchangeRequest data](v7, "data"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100149380;
  v11[3] = &unk_1005CB3E8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:105 timeout:v10 option:1 errorHandler:v11];

  -[SDUnlockKeyManager restartStashTimer](self, "restartStashTimer");
}

- (void)sendStashToken:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SDUnlockStashToken);
  -[SDUnlockStashToken setVersion:](v7, "setVersion:", 1LL);
  -[SDUnlockStashToken setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockStashToken setStashToken:](v7, "setStashToken:", v6);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashToken data](v7, "data"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10014957C;
  v11[3] = &unk_1005CB3E8;
  v11[4] = self;
  [v8 sendProtocolBufferData:v9 withType:106 timeout:v10 option:1 errorHandler:v11];

  -[SDUnlockKeyManager restartStashTimer](self, "restartStashTimer");
}

- (void)sendStateRequest
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SDUnlockStateRequest);
  -[SDUnlockStateRequest setVersion:](v3, "setVersion:", 1LL);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStateRequest data](v3, "data"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 10.0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014974C;
  v7[3] = &unk_1005CB3E8;
  v7[4] = self;
  [v4 sendProtocolBufferData:v5 withType:3 timeout:v6 option:1 errorHandler:v7];

  -[SDUnlockKeyManager restartStateTimer](self, "restartStateTimer");
}

- (void)sendRelockRequestWithReset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SDUnlockRelockRequest);
  id v6 = -[SDUnlockRelockRequest setVersion:](v5, "setVersion:", 1LL);
  uint64_t v8 = paired_unlock_log(v6, v7);
  NSErrorUserInfoKey v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending relock request", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockRelockRequest data](v5, "data"));
  [v10 sendProtocolBufferData:v11 withType:111 timeout:0 option:1 errorHandler:&stru_1005CF858];

  if (v3)
  {
    uint64_t v14 = paired_unlock_log(v12, v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cancelling session", v16, 2u);
    }

    -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
  }
}

- (BOOL)pairedWatchSupportsRelock
{
  uint64_t v3 = _os_feature_enabled_impl("Sharing", "pu_new_pill");
  if ((v3 & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeIDSDevice]);

    if (v6)
    {
      [v6 operatingSystemVersion];
      uint64_t v7 = v12;
      [v6 operatingSystemVersion];
    }

    else
    {
      uint64_t v7 = 0LL;
      uint64_t v11 = 0LL;
    }

    BOOL v9 = v7 == qword_100643AE0 && v11 >= qword_100643AE8 || v7 > qword_100643AE0;
  }

  else
  {
    uint64_t v8 = paired_unlock_log(v3, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Using old behavior", buf, 2u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldUseTwoPartPill
{
  if ((_os_feature_enabled_impl("Sharing", "pu_lock_button_all") & 1) != 0
    || (unsigned int v3 = +[SFAutoUnlockManager autoUnlockEnabled]( &OBJC_CLASS___SFAutoUnlockManager,  "autoUnlockEnabled")) != 0)
  {
    LOBYTE(v3) = -[SDUnlockKeyManager pairedWatchSupportsRelock](self, "pairedWatchSupportsRelock");
  }

  return v3;
}

- (BOOL)shouldStartUnlock
{
  BOOL v3 = -[SDUnlockKeyManager remoteDeviceLocked](self, "remoteDeviceLocked");
  if (v3)
  {
    if (self->_unlockingForKeybagUnlock)
    {
      uint64_t v5 = paired_unlock_log(v3, v4);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = 0;
        uint64_t v7 = "Ongoing unlock. Not starting";
        uint64_t v8 = (uint8_t *)&v15;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }

    else
    {
      if (!-[SDUnlockKeyManager pairedWatchSupportsRelock](self, "pairedWatchSupportsRelock")) {
        return 1;
      }
      BOOL v11 = -[SDUnlockKeyManager needsOffWristBeforePairedUnlock](self, "needsOffWristBeforePairedUnlock");
      if (!v11) {
        return 1;
      }
      uint64_t v13 = paired_unlock_log(v11, v12);
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        uint64_t v7 = "Due to previous relock request, Paired Unlock disabled until watch goes off wrist";
        uint64_t v8 = (uint8_t *)&v14;
        goto LABEL_7;
      }
    }
  }

  else
  {
    uint64_t v9 = paired_unlock_log(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Not initiating, remote unlocked";
      uint64_t v8 = buf;
      goto LABEL_7;
    }
  }

  return 0;
}

- (BOOL)startUnlockIfNeeded
{
  BOOL v3 = -[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled");
  if (v3)
  {
    BOOL v5 = -[SDUnlockKeyManager shouldStartUnlock](self, "shouldStartUnlock");
    if (v5)
    {
      -[SDUnlockKeyManager initializeMetrics](self, "initializeMetrics");
      -[SDUnlockKeyManager initiateRemoteUnlock](self, "initiateRemoteUnlock");
      LOBYTE(v5) = 1;
    }
  }

  else
  {
    uint64_t v6 = paired_unlock_log(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not initiating, not enabled", v9, 2u);
    }

    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)initiateRemoteUnlock
{
  uint64_t v5 = paired_unlock_log(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initiating unlock", v75, 2u);
  }

  if (-[SDUnlockKeyManager unlockingState](self, "unlockingState"))
  {
    int64_t v7 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
    if (v7 == 1 && self->_sessionRecord)
    {
      uint64_t v9 = paired_unlock_log(1LL, v8);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        sessionRecord = self->_sessionRecord;
        *(_DWORD *)v75 = 138412290;
        *(void *)&v75[4] = sessionRecord;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unlock already in progress with record = %@",  v75,  0xCu);
      }

      -[SDUnlockSessionRecord setExpireTime:]( self->_sessionRecord,  "setExpireTime:",  dispatch_time(-[SDUnlockSessionRecord expireTime](self->_sessionRecord, "expireTime"), 45000000000LL));
      -[SDUnlockSessionManager restartUnlockTimer:]( self,  "restartUnlockTimer:",  -[SDUnlockSessionRecord expireTime](self->_sessionRecord, "expireTime"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionRecord keyData](self->_sessionRecord, "keyData"));
      BOOL useEscrowRecord = self->_useEscrowRecord;
      __int16 v14 = self->_sessionRecord;
      goto LABEL_45;
    }

    uint64_t v15 = paired_unlock_log(v7, v8);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10014B79C();
    }

    NSErrorUserInfoKey v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (v17)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      [v18 setFailureReason:20];
    }

    -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
    return;
  }

  -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
  BOOL v19 = -[SDUnlockSessionManager activeDevicesMatch](self, "activeDevicesMatch");
  if (!v19)
  {
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v37 = (NSDate *)objc_claimAutoreleasedReturnValue([v36 dateByAddingTimeInterval:(double)qword_100643AF0]);

    uint64_t v40 = paired_unlock_log(v38, v39);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_10014B73C();
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      [v43 setFailureReason:18];
    }

    -[SDUnlockKeyManager resetState](self, "resetState");
    deviceSwitchUnlockRetryDate = self->_deviceSwitchUnlockRetryDate;
    self->_deviceSwitchUnlockRetryDate = v37;

    return;
  }

  uint64_t v21 = paired_unlock_log(v19, v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Active devices match", v75, 2u);
  }

  uint64_t v25 = paired_unlock_log(v23, v24);
  NSErrorUserInfoKey v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_useEscrowRecord) {
      v27 = @"YES";
    }
    else {
      v27 = @"NO";
    }
    *(_DWORD *)v75 = 138412290;
    *(void *)&v75[4] = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using escrow record = %@", v75, 0xCu);
  }

  NSErrorUserInfoKey v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  if (v28)
  {
    BOOL v29 = self->_useEscrowRecord;
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    [v30 setUsingEscrowRecord:v29];
  }

  if (self->_useEscrowRecord) {
    goto LABEL_25;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setUnlockAuthSession:]( self,  "setUnlockAuthSession:",  [v45 unlockSessionAsOriginator:1 usingEscrow:0 escrowSecret:0]);

  int64_t v46 = -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession");
  if (v46 < 0)
  {
    uint64_t v73 = paired_unlock_log(v46, v47);
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Falling back to escrow record", v75, 2u);
    }

    self->_BOOL useEscrowRecord = 1;
LABEL_25:
    *(_DWORD *)v75 = 0;
    goto LABEL_26;
  }

  BOOL v48 = self->_useEscrowRecord;
  *(_DWORD *)v75 = 0;
  if (!v48) {
    goto LABEL_42;
  }
LABEL_26:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager", *(void *)v75));
  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 escrowData]);

  if (v32)
  {
    int64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    -[SDUnlockSessionManager setUnlockAuthSession:]( self,  "setUnlockAuthSession:",  [v35 unlockSessionAsOriginator:1 usingEscrow:1 escrowSecret:v32 errorCode:v75]);
  }

  else
  {
    uint64_t v49 = paired_unlock_log(v33, v34);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_10014B710();
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (!v51) {
      goto LABEL_41;
    }
    int64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    [v35 setFailureReason:23];
  }

LABEL_41:
LABEL_42:
  int64_t v52 = -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession", *(void *)v75);
  if ((v52 & 0x8000000000000000LL) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v54,  "stepWithAuthSession:data:",  -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession"),  0));

    if (!v12)
    {
      uint64_t v69 = paired_unlock_log(v55, v56);
      v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_10014B640();
      }

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      if (v71)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        [v72 setFailureReason:21];
      }

      -[SDUnlockKeyManager resetState](self, "resetState");
      goto LABEL_46;
    }

    v57 = objc_alloc_init(&OBJC_CLASS___SDUnlockSessionRecord);
    v58 = self->_sessionRecord;
    self->_sessionRecord = v57;

    -[SDUnlockSessionRecord setKeyData:](self->_sessionRecord, "setKeyData:", v12);
    -[SDUnlockSessionRecord setUnlockSessionID:]( self->_sessionRecord,  "setUnlockSessionID:",  -[SDUnlockSessionManager generateSessionID](self, "generateSessionID"));
    -[SDUnlockSessionRecord setExpireTime:](self->_sessionRecord, "setExpireTime:", sub_100114580((double)65LL));
    -[SDUnlockSessionManager restartUnlockTimer:]( self,  "restartUnlockTimer:",  -[SDUnlockSessionRecord expireTime](self->_sessionRecord, "expireTime"));
    BOOL useEscrowRecord = self->_useEscrowRecord;
    __int16 v14 = self->_sessionRecord;
LABEL_45:
    -[SDUnlockKeyManager sendSessionKeyExchangeRequest:usedEscrow:sessionID:]( self,  "sendSessionKeyExchangeRequest:usedEscrow:sessionID:",  v12,  useEscrowRecord,  -[SDUnlockSessionRecord unlockSessionID](v14, "unlockSessionID"));
LABEL_46:

    return;
  }

  uint64_t v59 = paired_unlock_log(v52, v53);
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
    sub_10014B6A4((int *)v75, v60, v61);
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    [v63 setFailureReason:21];
  }

  id v64 = -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
  if (*(_DWORD *)v75 == -536870174 || *(_DWORD *)v75 == -536362984 || *(_DWORD *)v75 == -536362989)
  {
    uint64_t v65 = auto_unlock_log(v64);
    v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
      sub_10014B66C();
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (v67)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      [v68 setFailureReason:22];
    }

    -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    [v12 deleteLongTermKeys];
    goto LABEL_46;
  }

- (BOOL)initiateStashBagCreationWithManifest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 escrowData]);

  if (!v6)
  {
    uint64_t v15 = paired_unlock_log(v7, v8);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10014B828();
    }
    goto LABEL_10;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setStashBagSession:]( self,  "setStashBagSession:",  [v9 stashBagSessionAsOriginator:1 escrowSecret:v6 manifest:v4]);

  int64_t v10 = -[SDUnlockSessionManager stashBagSession](self, "stashBagSession");
  if (v10 < 0)
  {
    uint64_t v17 = paired_unlock_log(v10, v11);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10014B854();
    }
LABEL_10:

    BOOL v14 = 0;
    goto LABEL_11;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "stepWithAuthSession:data:",  -[SDUnlockSessionManager stashBagSession](self, "stashBagSession"),  0));

  BOOL v14 = v13 != 0LL;
  if (v13) {
    -[SDUnlockKeyManager sendStashKeyRequest:sessionID:]( self,  "sendStashKeyRequest:sessionID:",  v13,  -[SDUnlockSessionManager generateSessionID](self, "generateSessionID"));
  }

LABEL_11:
  return v14;
}

- (void)initializeMetrics
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SFPairedUnlockEvent);
  -[SDUnlockSessionManager setMetrics:](self, "setMetrics:", v3);

  id v4 = +[SFAutoUnlockManager autoUnlockEnabled](&OBJC_CLASS___SFAutoUnlockManager, "autoUnlockEnabled");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  [v5 setPhoneAutoUnlockEnabled:v4];

  BOOL v6 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  [v7 setCanRelock:v6];

  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 components:32 fromDate:v23]);
  int64_t v10 = [v9 hour];
  uint64_t v11 = [v8 maximumRangeOfUnit:32];
  uint64_t v13 = (uint64_t)((double)(unint64_t)(v10 - v11) / (double)v12 * 24.0);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  [v14 setAttemptHourLocal:(unsigned __int16)v13];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeIDSDevice]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 productBuildVersion]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  [v18 setWatchSoftwareVersion:v17];

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v16 modelIdentifier]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  [v20 setWatchHardwareModel:v19];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
  [v22 setStarted:v21];
}

- (void)consolidateLatencies:(id)a3
{
  id v50 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (v50)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v50 started]);
    if (v5)
    {
      BOOL v6 = (void *)v5;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

      if (v7)
      {
        dispatch_assert_queue_V2(&_dispatch_main_q);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v50 keyExchangeResponseReceived]);

        if (v8)
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v50 keyExchangeResponseReceived]);
          int64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v50 started]);
          [v9 timeIntervalSinceDate:v10];
          double v12 = v11;

          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          [v13 setKeyExchangeDuration:(v12 * 1000.0)];
        }

        else
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v50 started]);
          [v4 timeIntervalSinceDate:v13];
          uint64_t v15 = (v14 * 1000.0);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          [v16 setKeyExchangeDuration:v15];
        }

        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v50 keyExchangeResponseReceived]);
        uint64_t v18 = v50;
        if (v17
          && (BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v50 pillUpdated]),
              v19,
              v17,
              uint64_t v18 = v50,
              v19))
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v50 pillUpdated]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v50 keyExchangeResponseReceived]);
          [v20 timeIntervalSinceDate:v21];
          uint64_t v23 = (v22 * 1000.0);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          [v24 setPillDelay:v23];
        }

        else
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v18 keyExchangeResponseReceived]);

          NSErrorUserInfoKey v26 = v50;
          if (!v25)
          {
LABEL_13:
            uint64_t v29 = objc_claimAutoreleasedReturnValue([v26 pillUpdated]);
            if (v29
              && (__int16 v30 = (void *)v29,
                  v31 = (void *)objc_claimAutoreleasedReturnValue([v50 confirmationReceived]),
                  v31,
                  v30,
                  v31))
            {
              __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v50 confirmationReceived]);
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v50 pillUpdated]);
              [v32 timeIntervalSinceDate:v33];
              double v35 = v34;

              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
              [v36 setConfirmationDuration:(v35 * 1000.0)];
            }

            else
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue([v50 pillUpdated]);

              uint64_t v38 = v50;
              if (!v37)
              {
LABEL_19:
                v42 = (void *)objc_claimAutoreleasedReturnValue([v38 started]);
                [v4 timeIntervalSinceDate:v42];
                uint64_t v44 = (v43 * 1000.0);
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                [v45 setTotalUnlockDuration:v44];

                int64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                LODWORD(v44) = [v46 keyExchangeDuration];
                uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                uint64_t v48 = [v47 confirmationDuration] + v44;
                uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                [v49 setTotalUnlockProcessDuration:v48];

                goto LABEL_20;
              }

              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v50 pillUpdated]);
              [v4 timeIntervalSinceDate:v36];
              uint64_t v40 = (v39 * 1000.0);
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
              [v41 setConfirmationDuration:v40];
            }

            uint64_t v38 = v50;
            goto LABEL_19;
          }

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v50 keyExchangeResponseReceived]);
          [v4 timeIntervalSinceDate:v20];
          uint64_t v28 = (v27 * 1000.0);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          [v21 setPillDelay:v28];
        }

        NSErrorUserInfoKey v26 = v50;
        goto LABEL_13;
      }
    }
  }

- (BOOL)useEscrowRecord
{
  return self->_useEscrowRecord;
}

- (void)setUseEscrowRecord:(BOOL)a3
{
  self->_BOOL useEscrowRecord = a3;
}

- (NSTimer)stashTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setStashTimer:(id)a3
{
}

- (BOOL)remoteDeviceLocked
{
  return self->_remoteDeviceLocked;
}

- (void)setRemoteDeviceLocked:(BOOL)a3
{
  self->_remoteDeviceLocked = a3;
}

- (BOOL)ltkWaitingForUnlock
{
  return self->_ltkWaitingForUnlock;
}

- (void)setLtkWaitingForUnlock:(BOOL)a3
{
  self->_ltkWaitingForUnlock = a3;
}

- (BOOL)outstandingStartLTK
{
  return self->_outstandingStartLTK;
}

- (void)setOutstandingStartLTK:(BOOL)a3
{
  self->_outstandingStartLTK = a3;
}

- (BOOL)unlockingForKeybagUnlock
{
  return self->_unlockingForKeybagUnlock;
}

- (void)setUnlockingForKeybagUnlock:(BOOL)a3
{
  self->_BOOL unlockingForKeybagUnlock = a3;
}

- (BOOL)needsOffWristBeforePairedUnlock
{
  return self->_needsOffWristBeforePairedUnlock;
}

- (void)setNeedsOffWristBeforePairedUnlock:(BOOL)a3
{
  self->_needsOffWristBeforePairedUnlock = a3;
}

- (BOOL)wasInLockScreen
{
  return self->_wasInLockScreen;
}

- (void)setWasInLockScreen:(BOOL)a3
{
  self->_wasInLockScreen = a3;
}

- (BOOL)autoUnlockEnabledUpdatedAfterFirstUnlock
{
  return self->_autoUnlockEnabledUpdatedAfterFirstUnlock;
}

- (void)setAutoUnlockEnabledUpdatedAfterFirstUnlock:(BOOL)a3
{
  self->_autoUnlockEnabledUpdatedAfterFirstUnlock = a3;
}

- (BOOL)waitingForAutoUnlockStateUpdateToStartPairedUnlock
{
  return self->_waitingForAutoUnlockStateUpdateToStartPairedUnlock;
}

- (void)setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:(BOOL)a3
{
  self->_waitingForAutoUnlockStateUpdateToStartPairedUnlock = a3;
}

- (NSDate)deviceSwitchUnlockRetryDate
{
  return (NSDate *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDeviceSwitchUnlockRetryDate:(id)a3
{
}

- (OS_dispatch_source)delayedStartTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setDelayedStartTimer:(id)a3
{
}

- (OS_dispatch_source)stateTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setStateTimer:(id)a3
{
}

- (OS_dispatch_source)longTermKeyTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setLongTermKeyTimer:(id)a3
{
}

- (SDUnlockSessionRecord)sessionRecord
{
  return (SDUnlockSessionRecord *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setSessionRecord:(id)a3
{
}

- (SDUnlockKeyMetricDates)metricDates
{
  return (SDUnlockKeyMetricDates *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setMetricDates:(id)a3
{
}

- (id)stashHandler
{
  return objc_getProperty(self, a2, 144LL, 1);
}

- (void)setStashHandler:(id)a3
{
}

- (id)stateHandler
{
  return objc_getProperty(self, a2, 152LL, 1);
}

- (void)setStateHandler:(id)a3
{
}

- (id)keybagAssertion
{
  return objc_getProperty(self, a2, 160LL, 1);
}

- (void)setKeybagAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end