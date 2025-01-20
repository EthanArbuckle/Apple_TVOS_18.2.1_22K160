@interface SDUnlockSessionManager
- (BOOL)activeDevicesMatch;
- (BOOL)deviceIsPaired;
- (BOOL)inConfigureState;
- (BOOL)shouldAbort;
- (BOOL)unlockEnabled;
- (OS_dispatch_source)unlockTimer;
- (SDUnlockIDSController)idsController;
- (SDUnlockSecurityManager)securityManager;
- (SDUnlockSessionManager)init;
- (SFPairedUnlockEvent)metrics;
- (id)activeDevice;
- (id)activeDeviceDescription;
- (id)activeDeviceName;
- (id)generateDebugInfo;
- (id)pairingID;
- (id)pairingStorePath;
- (int64_t)setupAuthSession;
- (int64_t)stashBagSession;
- (int64_t)unlockAuthSession;
- (unsigned)generateSessionID;
- (unsigned)pairingCompatibilityState;
- (void)abortDevicePairingWithReason:(id)a3;
- (void)addObservers;
- (void)dealloc;
- (void)deviceDidEnterConfigState:(id)a3;
- (void)devicesDidFailToPair:(id)a3;
- (void)disableUnlockPairing;
- (void)disableUnlockPairingForSecManager:(id)a3;
- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4;
- (void)enableUnlockPairing;
- (void)handleDevicesDidFailToPair;
- (void)invalidateUnlockTimer;
- (void)logMetrics;
- (void)logProtoBufReceived:(id)a3;
- (void)logProtoBufSend:(id)a3;
- (void)pairingDidBegin:(id)a3;
- (void)pairingStatusChanged:(id)a3;
- (void)preventExitForLocaleIfNeeded;
- (void)removeObservers;
- (void)resetAll;
- (void)resetSetupState;
- (void)resetStashState;
- (void)resetState;
- (void)restartUnlockTimer:(unint64_t)a3;
- (void)sendDisableMessage;
- (void)sendResetMessage:(unsigned int)a3 reason:(unsigned __int16)a4;
- (void)setIdsController:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setSecurityManager:(id)a3;
- (void)setSetupAuthSession:(int64_t)a3;
- (void)setStashBagSession:(int64_t)a3;
- (void)setUnlockAuthSession:(int64_t)a3;
- (void)setUnlockTimer:(id)a3;
- (void)updateSecurityManager;
- (void)updateSecurityManagerIfNeeded;
@end

@implementation SDUnlockSessionManager

- (SDUnlockSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDUnlockSessionManager;
  v2 = -[SDUnlockSessionManager init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    unlockTimer = v2->_unlockTimer;
    v2->_unlockTimer = 0LL;

    v3->_unlockAuthSession = -1LL;
    v3->_stashBagSession = -1LL;
    v3->_setupAuthSession = -1LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](&OBJC_CLASS___SDUnlockIDSController, "sharedController"));
    objc_storeWeak((id *)&v3->_idsController, v5);

    id WeakRetained = objc_loadWeakRetained((id *)&v3->_idsController);
    [WeakRetained addDelegate:v3];

    -[SDUnlockSessionManager updateSecurityManager](v3, "updateSecurityManager");
    -[SDUnlockSessionManager preventExitForLocaleIfNeeded](v3, "preventExitForLocaleIfNeeded");
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDUnlockSessionManager;
  -[SDUnlockSessionManager dealloc](&v3, "dealloc");
}

- (void)updateSecurityManagerIfNeeded
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));

  if (!v3) {
    -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
  }
}

- (void)updateSecurityManager
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingID](self, "pairingID"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingStorePath](self, "pairingStorePath"));
  v6 = (void *)v4;
  if (!v3 || !v4)
  {
    uint64_t v15 = paired_unlock_log(v4, v5);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceDescription](self, "activeDeviceDescription"));
    int v16 = 138412803;
    v17 = v3;
    __int16 v18 = 2112;
    v19 = v6;
    __int16 v20 = 2113;
    v21 = v14;
    _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Unable to create security manager (pairing id %@, pairing store path %@, active device %{private}@)",  (uint8_t *)&v16,  0x20u);
    goto LABEL_5;
  }

  v7 = objc_alloc(&OBJC_CLASS___SDUnlockSecurityManager);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceName](self, "activeDeviceName"));
  v9 = -[SDUnlockSecurityManager initWithPairingID:pairingStorePath:deviceName:]( v7,  "initWithPairingID:pairingStorePath:deviceName:",  v3,  v6,  v8);
  -[SDUnlockSessionManager setSecurityManager:](self, "setSecurityManager:", v9);

  uint64_t v12 = paired_unlock_log(v10, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceName](self, "activeDeviceName"));
    int v16 = 138412802;
    v17 = v3;
    __int16 v18 = 2112;
    v19 = v6;
    __int16 v20 = 2112;
    v21 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Created new security manager (pairing id %@, store path %@, device name %@)",  (uint8_t *)&v16,  0x20u);
LABEL_5:
  }

- (void)preventExitForLocaleIfNeeded
{
  uint64_t v2 = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
  int v3 = v2;
  uint64_t v5 = paired_unlock_log(v2, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing state on launch %d", (uint8_t *)v7, 8u);
  }
}

- (void)addObservers
{
  uint64_t v3 = paired_unlock_log(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session manager adding observers", v10, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"debugInfoRequested:" name:@"com.apple.sharingd.DebugInfoRequested" object:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"devicesDidFailToPair:" name:NRPairedDeviceRegistryDeviceDidFailToPairNotification object:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"pairingStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"pairingDidBegin:" name:NRPairedDeviceRegistryDeviceDidBeginPairingNotification object:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 addObserver:self selector:"deviceDidEnterConfigState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];
}

- (void)removeObservers
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (id)generateDebugInfo
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (-[SDUnlockSessionManager unlockEnabled](self, "unlockEnabled")) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unlock Enabled:%@",  v4));
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localLongTermKey]);
  if (v7) {
    objc_super v8 = @"YES";
  }
  else {
    objc_super v8 = @"NO";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Local Long Term Key Exists:%@",  v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteLongTermKey]);
  if (v11) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Remote Long Term Key Exists:%@",  v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Device Key Bag State:%ld",  [v14 deviceKeyBagState]));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"AKS Key Bag State:%d",  [v16 lockState]));
  -[NSMutableArray addObject:](v3, "addObject:", v17);

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  else {
    v19 = @"NO";
  }
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Device Nearby:%@",  v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Setup AKS Session ID:%ld",  -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession")));
  -[NSMutableArray addObject:](v3, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unlock AKS Session ID:%ld",  -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession")));
  -[NSMutableArray addObject:](v3, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Stash AKS Session ID:%ld",  -[SDUnlockSessionManager stashBagSession](self, "stashBagSession")));
  -[NSMutableArray addObject:](v3, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Nano Registry State:%d",  -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState")));
  -[NSMutableArray addObject:](v3, "addObject:", v24);

  if (-[SDUnlockSessionManager deviceIsPaired](self, "deviceIsPaired")) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Device Paired:%@",  v25));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  return v3;
}

- (void)devicesDidFailToPair:(id)a3
{
}

- (void)handleDevicesDidFailToPair
{
  uint64_t v3 = paired_unlock_log(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Device pairing failed, throwing away anything that was setup",  v5,  2u);
  }

  -[SDUnlockSessionManager disableUnlockPairing](self, "disableUnlockPairing");
}

- (void)pairingStatusChanged:(id)a3
{
  uint64_t v4 = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState", a3);
  int v5 = v4;
  uint64_t v7 = paired_unlock_log(v4, v6);
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pairing status changed %d", (uint8_t *)v9, 8u);
  }

  -[SDUnlockSessionManager updateExitPrevention](self, "updateExitPrevention");
}

- (void)pairingDidBegin:(id)a3
{
  uint64_t v4 = paired_unlock_log(self, a2);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing did begin %d", (uint8_t *)v6, 8u);
  }

  -[SDUnlockSessionManager updateExitPrevention](self, "updateExitPrevention");
}

- (void)deviceDidEnterConfigState:(id)a3
{
  uint64_t v4 = paired_unlock_log(self, a2);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Device entered config state %d",  (uint8_t *)v6,  8u);
  }

  -[SDUnlockSessionManager updateExitPrevention](self, "updateExitPrevention");
}

- (void)enableUnlockPairing
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, SFPairedUnlockStateChangedNotification, 0LL, 0LL, 1u);
  uint64_t v5 = paired_unlock_log(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", v7, 2u);
  }
}

- (void)disableUnlockPairing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014DA54;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)disableUnlockPairingForSecManager:(id)a3
{
  id v3 = a3;
  uint64_t v5 = paired_unlock_log(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 pairingID]);
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing Disabled: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)unlockEnabled
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  unsigned __int8 v3 = [v2 ltksExist];

  return v3;
}

- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10014DC2C;
  v5[3] = &unk_1005CB830;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)resetAll
{
}

- (void)resetSetupState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v3, "clearStateForSession:", -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession"));

  -[SDUnlockSessionManager setSetupAuthSession:](self, "setSetupAuthSession:", -1LL);
}

- (void)resetState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v3, "clearStateForSession:", -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession"));

  -[SDUnlockSessionManager setUnlockAuthSession:](self, "setUnlockAuthSession:", -1LL);
  -[SDUnlockSessionManager invalidateUnlockTimer](self, "invalidateUnlockTimer");
}

- (void)resetStashState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v3, "clearStateForSession:", -[SDUnlockSessionManager stashBagSession](self, "stashBagSession"));

  -[SDUnlockSessionManager setStashBagSession:](self, "setStashBagSession:", -1LL);
}

- (void)restartUnlockTimer:(unint64_t)a3
{
  uint64_t v5 = paired_unlock_log(self, a2);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "restartUnlockTimer", buf, 2u);
  }

  unlockTimer = self->_unlockTimer;
  if (!unlockTimer)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10014DE68;
    v11[3] = &unk_1005CB2F8;
    v11[4] = self;
    int v8 = sub_100114598(0, &_dispatch_main_q, v11);
    v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = self->_unlockTimer;
    self->_unlockTimer = v9;

    dispatch_resume((dispatch_object_t)self->_unlockTimer);
    unlockTimer = self->_unlockTimer;
  }

  sub_100114638((dispatch_source_s *)unlockTimer, a3);
}

- (void)invalidateUnlockTimer
{
  uint64_t v3 = paired_unlock_log(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidateUnlockTimer", v7, 2u);
  }

  unlockTimer = self->_unlockTimer;
  if (unlockTimer)
  {
    dispatch_source_cancel((dispatch_source_t)unlockTimer);
    id v6 = self->_unlockTimer;
    self->_unlockTimer = 0LL;
  }

- (void)sendResetMessage:(unsigned int)a3 reason:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v9 = objc_alloc_init(&OBJC_CLASS___SDUnlockReset);
  -[SDUnlockReset setVersion:](v9, "setVersion:", 1LL);
  -[SDUnlockReset setSessionID:](v9, "setSessionID:", v5);
  -[SDUnlockReset setResetReason:](v9, "setResetReason:", v4);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsController);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockReset data](v9, "data"));
  [WeakRetained sendProtocolBufferData:v8 withType:1 timeout:0 option:1 errorHandler:&stru_1005CF8E0];

  -[SDUnlockSessionManager resetAndClearState](self, "resetAndClearState");
}

- (void)sendDisableMessage
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SDUnlockDisable);
  -[SDUnlockDisable setVersion:](v5, "setVersion:", 1LL);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsController);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockDisable data](v5, "data"));
  [WeakRetained sendProtocolBufferData:v4 withType:2 timeout:0 option:2 errorHandler:&stru_1005CF900];
}

- (void)abortDevicePairingWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  if (([v5 bypassLTKeyAbort] & 1) != 0
    || !-[SDUnlockSessionManager inConfigureState](self, "inConfigureState"))
  {
  }

  else
  {
    unsigned int v6 = -[SDUnlockSessionManager shouldAbort](self, "shouldAbort");

    if (v6)
    {
      uint64_t v9 = paired_unlock_log(v7, v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10014EADC();
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      [v11 deleteLongTermKeys];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](&OBJC_CLASS___NRPairedDeviceRegistry, "sharedInstance"));
      [v12 abortPairingWithReason:v4];
    }
  }
}

- (BOOL)shouldAbort
{
  return 1;
}

- (BOOL)inConfigureState
{
  return -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState") == 3;
}

- (unsigned)pairingCompatibilityState
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](&OBJC_CLASS___NRPairedDeviceRegistry, "sharedInstance"));
  unsigned __int16 v3 = (unsigned __int16)[v2 compatibilityState];

  return v3;
}

- (BOOL)deviceIsPaired
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForProperty:NRDevicePropertyIsPaired]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)pairingID
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForProperty:NRDevicePropertyPairingID]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  return v4;
}

- (id)pairingStorePath
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForProperty:NRDevicePropertyLocalPairingDataStorePath]);

  return v3;
}

- (id)activeDeviceName
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForProperty:NRDevicePropertyDeviceNameString]);

  return v3;
}

- (id)activeDeviceDescription
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (id)activeDevice
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](&OBJC_CLASS___NRPairedDeviceRegistry, "sharedInstance", 0LL));
  unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getAllDevicesWithArchivedDevices]);

  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = NRDevicePropertyIsActive;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForProperty:v7]);
        unsigned int v11 = [v10 BOOLValue];

        if (v11)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v12 = 0LL;
LABEL_11:

  return v12;
}

- (BOOL)activeDevicesMatch
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 activeIDSDevice]);

    if (v6)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](&OBJC_CLASS___NRPairedDeviceRegistry, "sharedInstance"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceForIDSDevice:v6]);

      if (v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 pairingID]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v10 pairingID]);
        unsigned __int8 v15 = [v13 isEqual:v14];

        if ((v15 & 1) != 0)
        {
          BOOL v18 = 1;
LABEL_17:

          goto LABEL_18;
        }

        uint64_t v23 = paired_unlock_log(v16, v17);
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10014EB8C();
        }
      }

      else
      {
        uint64_t v21 = paired_unlock_log(v11, v12);
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10014EB60();
        }
      }
    }

    else
    {
      uint64_t v20 = paired_unlock_log(v7, v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        sub_10014EB34();
      }
    }

    BOOL v18 = 0;
    goto LABEL_17;
  }

  uint64_t v19 = paired_unlock_log(0LL, v3);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10014EB08();
  }
  BOOL v18 = 0;
LABEL_18:

  return v18;
}

- (unsigned)generateSessionID
{
  return arc4random_uniform(0x7FFFFFFFu);
}

- (void)logProtoBufSend:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = paired_unlock_log(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class(v5, v8);
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v16 = 138412290;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v14 = paired_unlock_log(v12, v13);
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Message Contents %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)logProtoBufReceived:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (v3)
  {
    uint64_t v6 = paired_unlock_log(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class(v5, v8);
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v16 = 138412290;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v14 = paired_unlock_log(v12, v13);
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Message Contents %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)logMetrics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

  if (v3)
  {
    uint64_t v6 = paired_unlock_log(v4, v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Submitting metrics", v9, 2u);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    [v8 submitEvent];
  }

  -[SDUnlockSessionManager setMetrics:](self, "setMetrics:", 0LL);
}

- (int64_t)setupAuthSession
{
  return self->_setupAuthSession;
}

- (void)setSetupAuthSession:(int64_t)a3
{
  self->_setupAuthSession = a3;
}

- (int64_t)unlockAuthSession
{
  return self->_unlockAuthSession;
}

- (void)setUnlockAuthSession:(int64_t)a3
{
  self->_unlockAuthSession = a3;
}

- (int64_t)stashBagSession
{
  return self->_stashBagSession;
}

- (void)setStashBagSession:(int64_t)a3
{
  self->_stashBagSession = a3;
}

- (SDUnlockIDSController)idsController
{
  return (SDUnlockIDSController *)objc_loadWeakRetained((id *)&self->_idsController);
}

- (void)setIdsController:(id)a3
{
}

- (SDUnlockSecurityManager)securityManager
{
  return (SDUnlockSecurityManager *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSecurityManager:(id)a3
{
}

- (SFPairedUnlockEvent)metrics
{
  return (SFPairedUnlockEvent *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setMetrics:(id)a3
{
}

- (OS_dispatch_source)unlockTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setUnlockTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end