@interface APSNetworkMonitor
+ (unint64_t)powerCostForPushOnRAT:(int)a3 withLinkQuality:(int)a4;
- (APSNetworkMonitor)init;
- (APSNetworkMonitorDelegate)delegate;
- (BOOL)_checkPiggybackBudget;
- (BOOL)_wifiIsHistoricallyCheap;
- (BOOL)isPiggybacking;
- (BOOL)isWoWEnabled;
- (BOOL)serverSupportsDualMode;
- (BOOL)shouldUseDualMode;
- (double)_accumulatedAwakePercentage;
- (id)systemMonitor;
- (id)wifiManager;
- (int)secondsBetweenPiggybacks;
- (void)__toggleWiFiAutoAssociateIfNecessary;
- (void)_clearConnectionThrottleTimer;
- (void)_clearPiggybackConnectionTimer;
- (void)_connectionThrottleTimerFired;
- (void)_deregisterFromWoWNotifications;
- (void)_flushStaleElementsFrom:(id *)a3 withThreshold:(double)a4;
- (void)_flushStaleWiFiMeasurements;
- (void)_handleSignificantTimeChange;
- (void)_piggybackConnectionTimerFired;
- (void)_processSSIDChangeWithSSID:(id)a3 querySSID:(BOOL)a4;
- (void)_registerForWoWNotifications;
- (void)_reloadDualMode;
- (void)_toggleWiFiAutoAssociateIfNecessary;
- (void)closedSecondChannel:(int64_t)a3;
- (void)cutWiFiManager:(id)a3 generatedPowerReading:(id)a4;
- (void)cutWiFiManagerLinkDidChange:(id)a3 context:(id)a4;
- (void)dealloc;
- (void)decayTimerFired:(id)a3;
- (void)interfaceConstraintChanged:(id)a3;
- (void)notePushWithCost:(unint64_t)a3;
- (void)openedSecondChannel;
- (void)setCostDrivenDualChannelAttempts:(id)a3;
- (void)setCriticalReliability:(BOOL)a3;
- (void)setCurrentWiFiKeepAliveInterval:(double)a3 growAttempts:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDisableCostDrivenDualChannelAttempts:(id)a3;
- (void)setDisableDualModePiggybackTimer:(id)a3;
- (void)setIsWoWEnabled:(BOOL)a3;
- (void)setPiggybackDualChannelAttempts:(id)a3;
- (void)setServerSupportsDualMode:(BOOL)a3;
- (void)systemDidLock;
- (void)systemDidUnlock;
@end

@implementation APSNetworkMonitor

- (id)wifiManager
{
  return +[CUTWiFiManager sharedInstance](&OBJC_CLASS___CUTWiFiManager, "sharedInstance");
}

- (id)systemMonitor
{
  return +[APSSystemMonitor sharedInstance](&OBJC_CLASS___APSSystemMonitor, "sharedInstance");
}

- (void)_registerForWoWNotifications
{
  if (qword_10014EA28 != -1) {
    dispatch_once(&qword_10014EA28, &stru_100121240);
  }
  v3 = (__WiFiManagerClient *)off_10014EA20(0LL, 0LL);
  self->_wifiManager = v3;
  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v8 = 134218242;
    v9 = self;
    __int16 v10 = 2080;
    v11 = "-[APSNetworkMonitor _registerForWoWNotifications]";
    v7 = "%p %s failed to create wifi manager";
    goto LABEL_12;
  }

  if (qword_10014EA38 != -1) {
    dispatch_once(&qword_10014EA38, &stru_100121260);
  }
  off_10014EA30(self->_wifiManager, sub_1000A3D90, self);
  if (qword_10014EA48 != -1) {
    dispatch_once(&qword_10014EA48, &stru_100121280);
  }
  v4 = (void (*)(__WiFiManagerClient *, CFRunLoopRef, const CFRunLoopMode))off_10014EA40;
  wifiManager = self->_wifiManager;
  CFRunLoopRef Main = CFRunLoopGetMain();
  v4(wifiManager, Main, kCFRunLoopDefaultMode);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    v9 = self;
    __int16 v10 = 2080;
    v11 = "-[APSNetworkMonitor _registerForWoWNotifications]";
    v7 = "%p %s registered for WoW notifications";
LABEL_12:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v7,  (uint8_t *)&v8,  0x16u);
  }

- (void)_deregisterFromWoWNotifications
{
  if (self->_wifiManager)
  {
    if (qword_10014EA58 != -1) {
      dispatch_once(&qword_10014EA58, &stru_1001212A0);
    }
    off_10014EA50(self->_wifiManager, 0LL, 0LL);
    if (qword_10014EA68 != -1) {
      dispatch_once(&qword_10014EA68, &stru_1001212C0);
    }
    v3 = (void (*)(__WiFiManagerClient *, CFRunLoopRef, const CFRunLoopMode))off_10014EA60;
    wifiManager = self->_wifiManager;
    CFRunLoopRef Main = CFRunLoopGetMain();
    v3(wifiManager, Main, kCFRunLoopDefaultMode);
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134218242;
      v7 = self;
      __int16 v8 = 2080;
      v9 = "-[APSNetworkMonitor _deregisterFromWoWNotifications]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%p %s completed deregistration from WoW notifications",  (uint8_t *)&v6,  0x16u);
    }
  }

- (APSNetworkMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___APSNetworkMonitor;
  v2 = -[APSNetworkMonitor init](&v14, "init");
  v3 = (APSNetworkMonitor *)v2;
  if (v2)
  {
    v2[136] = 0;
    *(_OWORD *)(v2 + 120) = xmmword_100102CF0;
    v2[140] = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_1000A44A4,  @"SignificantTimeChangeNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v5,  v3,  (CFNotificationCallback)sub_1000A4550,  @"com.apple.aps.internalsettings.changenotification",  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor systemMonitor](v3, "systemMonitor"));
    [v6 setActive:1];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor systemMonitor](v3, "systemMonitor"));
    [v7 setWatchesSystemLockState:1];

    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor systemMonitor](v3, "systemMonitor"));
    [v8 addListener:v3];

    if (_os_feature_enabled_impl("APS", "EmperorPenguin"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( &OBJC_CLASS___PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  1LL));
      [v9 addDelegate:v3 queue:&_dispatch_main_q];
    }

    -[APSNetworkMonitor _reloadDualMode](v3, "_reloadDualMode");
    __int16 v10 = -[APSDecayTimer initWithHourlyCostThreshold:costMaximum:identifier:]( objc_alloc(&OBJC_CLASS___APSDecayTimer),  "initWithHourlyCostThreshold:costMaximum:identifier:",  1000LL,  1500LL,  @"APSNetworkMonitor");
    decayTimer = v3->_decayTimer;
    v3->_decayTimer = v10;

    -[APSDecayTimer setDelegate:](v3->_decayTimer, "setDelegate:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor wifiManager](v3, "wifiManager"));
    [v12 addDelegate:v3];

    -[APSNetworkMonitor _processSSIDChangeWithSSID:querySSID:](v3, "_processSSIDChangeWithSSID:querySSID:", 0LL, 1LL);
    -[APSNetworkMonitor _registerForWoWNotifications](v3, "_registerForWoWNotifications");
  }

  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  @"com.apple.aps.internalsettings.changenotification",  0LL);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"SignificantTimeChangeNotification", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor wifiManager](self, "wifiManager"));
  [v5 removeDelegate:self];

  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[PCPersistentInterfaceManager sharedInstance]( &OBJC_CLASS___PCPersistentInterfaceManager,  "sharedInstance"));
  [v6 enableWiFiAutoAssociation:0 forDelegate:self];

  if (_os_feature_enabled_impl("APS", "EmperorPenguin"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( &OBJC_CLASS___PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  1LL));
    [v7 removeDelegate:self];
  }

  -[APSNetworkMonitor _clearConnectionThrottleTimer](self, "_clearConnectionThrottleTimer");
  -[APSNetworkMonitor _clearPiggybackConnectionTimer](self, "_clearPiggybackConnectionTimer");
  -[APSDecayTimer setDelegate:](self->_decayTimer, "setDelegate:", 0LL);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___APSNetworkMonitor;
  -[APSNetworkMonitor dealloc](&v8, "dealloc");
}

- (APSNetworkMonitorDelegate)delegate
{
  return (APSNetworkMonitorDelegate *)-[CUTWeakReference object](self->_delegate, "object");
}

- (void)setDelegate:(id)a3
{
  id v8 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CUTWeakReference object](self->_delegate, "object"));

  v5 = v8;
  if (v4 != v8)
  {
    int v6 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue( +[CUTWeakReference weakRefWithObject:]( &OBJC_CLASS___CUTWeakReference,  "weakRefWithObject:",  v8));
    delegate = self->_delegate;
    self->_delegate = v6;

    v5 = v8;
  }
}

- (void)setServerSupportsDualMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    if (v3) {
      int v6 = @"YES";
    }
    else {
      int v6 = @"NO";
    }
    if (self->_serverSupportsDualMode) {
      v5 = @"YES";
    }
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Server supports dual mode %@  old value %@",  (uint8_t *)&v7,  0x16u);
  }

  if (self->_serverSupportsDualMode != v3)
  {
    self->_serverSupportsDualMode = v3;
    -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
  }

- (void)_reloadDualMode
{
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"DualChannelSupportOverride",  @"com.apple.aps.internalsettings",  &keyExistsAndHasValidFormat);
  if (self->_dualMode != AppIntegerValue)
  {
    self->_dualMode = AppIntegerValue;
    -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
  }

- (void)decayTimerFired:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ decay timer fired",  (uint8_t *)&v4,  0xCu);
  }

  -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
}

- (void)systemDidLock
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ systemDidLock, refreshing state",  (uint8_t *)&v4,  0xCu);
  }

  lastPiggybackConnection = self->_lastPiggybackConnection;
  self->_lastPiggybackConnection = 0LL;

  -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
}

- (void)systemDidUnlock
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    int v4 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ systemDidUnlock, refreshing state",  (uint8_t *)&v3,  0xCu);
  }

  -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
}

- (void)cutWiFiManagerLinkDidChange:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL shouldUseDualMode = self->_shouldUseDualMode;
  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (shouldUseDualMode)
  {
    if (v9)
    {
      unsigned int v10 = [v6 isWiFiAssociated];
      v11 = @"NO";
      *(_DWORD *)v16 = 138412802;
      *(void *)&v16[4] = self;
      *(_WORD *)&v16[12] = 2112;
      if (v10) {
        v11 = @"YES";
      }
      *(void *)&v16[14] = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received cutWiFiManagerLinkDidChange - alerting the delegate. isWiFiAssociated? %@ context %@",  v16,  0x20u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor delegate](self, "delegate", *(_OWORD *)v16));
    if ((objc_opt_respondsToSelector(v12, "networkMonitorWiFiBecameAssociated:") & 1) != 0) {
      [v12 networkMonitorWiFiBecameAssociated:self];
    }
  }

  else if (v9)
  {
    unsigned int v13 = [v6 isWiFiAssociated];
    objc_super v14 = @"NO";
    *(_DWORD *)v16 = 138412802;
    *(void *)&v16[4] = self;
    *(_WORD *)&v16[12] = 2112;
    if (v13) {
      objc_super v14 = @"YES";
    }
    *(void *)&v16[14] = v14;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ received cutWiFiManagerLinkDidChange - ignoring since _BOOL shouldUseDualMode = NO. isWiFiAssociated? %@ context %@",  v16,  0x20u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CUTWiFiManagerSSIDKey, *(void *)v16, *(void *)&v16[8]));
  -[APSNetworkMonitor _processSSIDChangeWithSSID:querySSID:](self, "_processSSIDChangeWithSSID:querySSID:", v15, 0LL);
  -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
}

- (void)cutWiFiManager:(id)a3 generatedPowerReading:(id)a4
{
  id v6 = a3;
  double v7 = COERCE_DOUBLE(a4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412802;
    *(void *)&v28[4] = self;
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = v6;
    *(_WORD *)&v28[22] = 2112;
    double v29 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ wifi manager %@ generated power reading %@",  v28,  0x20u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v7 objectForKey:CUTWiFiManagerSSIDKey]);
  -[APSNetworkMonitor _processSSIDChangeWithSSID:querySSID:](self, "_processSSIDChangeWithSSID:querySSID:", v8, 0LL);
  uint64_t v9 = CUTWiFiManagerPMDurationKey;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v7 objectForKey:CUTWiFiManagerPMDurationKey]);
  id v11 = [v10 unsignedIntegerValue];

  v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v7 objectForKey:CUTWiFiManagerTotalDurationKey]);
  double v13 = COERCE_DOUBLE([v12 unsignedIntegerValue]);

  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v7 objectForKey:CUTWiFiManagerMaxMeasurementErrorKey]);
  [v14 doubleValue];
  double v16 = v15;

  if ((unint64_t)v11 <= *(void *)&v13)
  {
    double v19 = 1.0 - (double)(unint64_t)v11 / (double)*(unint64_t *)&v13;
    if (v19 >= 0.05 && v16 >= 0.15)
    {
      double v20 = v19 * (1.0 - v16);
      if (v20 >= 0.05)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)v28 = 138413058;
        *(void *)&v28[4] = self;
        *(_WORD *)&v28[12] = 2048;
        *(double *)&v28[14] = v13;
        *(_WORD *)&v28[22] = 2048;
        double v29 = 1.0 - (double)(unint64_t)v11 / (double)*(unint64_t *)&v13;
        LOWORD(v30) = 2048;
        *(double *)((char *)&v30 + 2) = v16;
        __int16 v17 = "%@ ignoring measurement with duration %lu, awakePercentage %f, maxError %f";
        uint32_t v18 = 42;
        goto LABEL_6;
      }

      unint64_t v21 = (unint64_t)((1.0 - v20) * (double)*(unint64_t *)&v13);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v28 = 138412546;
        *(void *)&v28[4] = self;
        *(_WORD *)&v28[12] = 2048;
        *(void *)&v28[14] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ adjusting short measurement to remove error - new valuePmDur = %lu",  v28,  0x16u);
      }

      id v22 = [*(id *)&v7 mutableCopy];
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v21));
      [v22 setValue:v23 forKey:v9];

      double v7 = *(double *)&v22;
    }

    v24 = -[APSTimestamp initWithValue:](objc_alloc(&OBJC_CLASS___APSTimestamp), "initWithValue:", *(void *)&v7);
    wifiMeasurements = self->_wifiMeasurements;
    if (!wifiMeasurements)
    {
      v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v27 = self->_wifiMeasurements;
      self->_wifiMeasurements = v26;

      wifiMeasurements = self->_wifiMeasurements;
    }

    -[NSMutableArray addObject:](wifiMeasurements, "addObject:", v24);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412802;
    *(void *)&v28[4] = self;
    *(_WORD *)&v28[12] = 2048;
    *(void *)&v28[14] = v11;
    *(_WORD *)&v28[22] = 2048;
    double v29 = v13;
    __int16 v17 = "%@ ignoring seemingly invalid WiFi measurement pmDur %lu, totalDur %lu";
    uint32_t v18 = 32;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, v28, v18);
  }

- (void)_processSSIDChangeWithSSID:(id)a3 querySSID:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = v6;
  if (!v6)
  {
    double v7 = 0LL;
    if (v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor wifiManager](self, "wifiManager"));
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v8 currentSSID]);
    }
  }

  if (v7 && !-[NSString isEqualToString:](self->_lastSSID, "isEqualToString:", v7))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      lastSSID = self->_lastSSID;
      int v14 = 138412802;
      double v15 = self;
      __int16 v16 = 2112;
      __int16 v17 = lastSSID;
      __int16 v18 = 2112;
      double v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: ssid changed from %@ to %@, flushing wifi measurements",  (uint8_t *)&v14,  0x20u);
    }

    unsigned int v10 = (NSString *)[v7 copy];
    id v11 = self->_lastSSID;
    self->_lastSSID = v10;

    unint64_t wifiGrowAttempts = self->_wifiGrowAttempts;
    wifiMeasurements = self->_wifiMeasurements;
    self->_wifiMeasurements = 0LL;
    self->_wifiGrowAttemptsBeforeSSID = wifiGrowAttempts;
  }
}

- (void)_flushStaleWiFiMeasurements
{
}

- (double)_accumulatedAwakePercentage
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v2 = self->_wifiMeasurements;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    uint64_t v17 = *(void *)v19;
    uint64_t v7 = CUTWiFiManagerPMDurationKey;
    uint64_t v8 = CUTWiFiManagerTotalDurationKey;
    obj = v2;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(obj);
        }
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)i), "value", obj));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v7]);
        id v12 = [v11 unsignedIntegerValue];

        double v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);
        id v14 = [v13 unsignedIntegerValue];

        v6 += (unint64_t)v12;
        v5 += (unint64_t)v14;
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v4);

    if (v5) {
      return 1.0 - (double)v6 / (double)v5;
    }
  }

  else
  {
  }

  return 0.0;
}

- (BOOL)_wifiIsHistoricallyCheap
{
  double v4 = v3;
  BOOL v5 = self->_wifiGrowAttempts - self->_wifiGrowAttemptsBeforeSSID < 0xC || self->_wifiKeepAliveInterval >= 1080.0;
  BOOL v6 = v3 < 0.05 && v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v6) {
      uint64_t v7 = @"YES";
    }
    double wifiKeepAliveInterval = self->_wifiKeepAliveInterval;
    unint64_t v9 = self->_wifiGrowAttempts - self->_wifiGrowAttemptsBeforeSSID;
    int v11 = 138413314;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2048;
    double v16 = v4;
    __int16 v17 = 2048;
    unint64_t v18 = v9;
    __int16 v19 = 2048;
    double v20 = wifiKeepAliveInterval;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ wifi is historically cheap? %@  awakePercentage = %f,  wifiGrowAttemptDelta %lu  wifiKeepAliveInterval %f",  (uint8_t *)&v11,  0x34u);
  }

  return v6;
}

- (void)setCurrentWiFiKeepAliveInterval:(double)a3 growAttempts:(unint64_t)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    double v10 = a3;
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ updating wifi keepAliveInterval %f  growAttempts %lu",  (uint8_t *)&v7,  0x20u);
  }

  self->_unint64_t wifiGrowAttempts = a4;
  self->_double wifiKeepAliveInterval = a3;
  -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
}

- (void)_flushStaleElementsFrom:(id *)a3 withThreshold:(double)a4
{
  BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = *a3;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v8);
      }
      __int16 v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "date", (void)v18));
      if ([v14 compare:v7] != (id)1)
      {
        [v14 timeIntervalSinceNow];
        if (v15 < 0.0) {
          double v15 = -v15;
        }
        if (v15 <= a4) {
          -[NSMutableArray addObject:](v6, "addObject:", v13);
        }
      }

      id v16 = -[NSMutableArray count](v6, "count");

      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v17 = *a3;
  *a3 = 0LL;

  if (-[NSMutableArray count](v6, "count")) {
    objc_storeStrong(a3, v6);
  }
}

- (void)_handleSignificantTimeChange
{
}

- (void)notePushWithCost:(unint64_t)a3
{
}

- (int)secondsBetweenPiggybacks
{
  return 300;
}

- (BOOL)_checkPiggybackBudget
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor systemMonitor](self, "systemMonitor"));
  unsigned int v4 = [v3 isSystemLocked];

  lastPiggybackConnection = self->_lastPiggybackConnection;
  if (lastPiggybackConnection)
  {
    -[NSDate timeIntervalSinceNow](lastPiggybackConnection, "timeIntervalSinceNow");
    BOOL v7 = fabs(v6) < (double)-[APSNetworkMonitor secondsBetweenPiggybacks](self, "secondsBetweenPiggybacks");
  }

  else
  {
    BOOL v7 = 0;
  }

  if ((v4 | v7) == 1)
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    id v10 = @"NO";
    if (v4) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    int v21 = 138412802;
    id v22 = self;
    __int16 v23 = 2112;
    v24 = (void *)v11;
    if (v7) {
      id v10 = @"YES";
    }
    __int16 v25 = 2112;
    v26 = v10;
    uint64_t v12 = "%@ system is locked %@ or too soon since last piggyback %@ - not allowing piggybacking";
    uint32_t v13 = 32;
    goto LABEL_22;
  }

  lastPiggybackReset = self->_lastPiggybackReset;
  if (lastPiggybackReset
    && (-[NSDate timeIntervalSinceNow](lastPiggybackReset, "timeIntervalSinceNow"), fabs(v15) <= 86400.0))
  {
    unint64_t piggybackCount = self->_piggybackCount;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = self->_lastPiggybackReset;
      int v21 = 138412546;
      id v22 = self;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ last piggyback budget reset was %@, resetting now.",  (uint8_t *)&v21,  0x16u);
    }

    id v17 = objc_alloc_init(&OBJC_CLASS___NSDate);
    __int128 v18 = self->_lastPiggybackReset;
    self->_lastPiggybackReset = v17;

    unint64_t piggybackCount = 0LL;
    self->_unint64_t piggybackCount = 0LL;
  }

  if (piggybackCount < self->_maxPiggybackConnectionsPerDay) {
    return 1;
  }
  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v20)
  {
    int v21 = 138412290;
    id v22 = self;
    uint64_t v12 = "%@ We have exceeded our piggybacking limit.  Do not piggyback.";
    uint32_t v13 = 12;
LABEL_22:
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v12,  (uint8_t *)&v21,  v13);
    return 0;
  }

  return result;
}

- (void)__toggleWiFiAutoAssociateIfNecessary
{
  unint64_t v3 = -[APSDecayTimer currentCost](self->_decayTimer, "currentCost");
  unsigned int v4 = -[APSNetworkMonitor _wifiIsHistoricallyCheap](self, "_wifiIsHistoricallyCheap");
  unsigned int v5 = v4;
  BOOL shouldThrottleConnection = self->_shouldThrottleConnection;
  int64_t dualMode = self->_dualMode;
  if (dualMode == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 138412290;
      *(void *)&v37[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ forcing dual mode OFF",  v37,  0xCu);
    }

    BOOL serverSupportsDualMode = 0;
    int v8 = 0;
    goto LABEL_9;
  }

  if (dualMode != 1)
  {
    if (v3 >= 0x3E9 && ((v4 ^ 1) & 1) == 0 && !self->_shouldThrottleConnection && !self->_disableCostDrivenDualMode
      || self->_criticalReliability
      || self->_isWoWEnabled)
    {
      int v8 = 1;
LABEL_17:
      BOOL serverSupportsDualMode = self->_serverSupportsDualMode;
      goto LABEL_18;
    }

    if (-[APSNetworkMonitor _checkPiggybackBudget](self, "_checkPiggybackBudget"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor wifiManager](self, "wifiManager"));
      unsigned int v36 = [v35 isWiFiAssociated];

      if (v36)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v37 = 138412290;
          *(void *)&v37[4] = self;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ we're allowed to piggyback - we will not associate to wifi ourselves.",  v37,  0xCu);
        }

        int v8 = 0;
        self->_BOOL isPiggybacking = 1;
        goto LABEL_17;
      }
    }

    BOOL serverSupportsDualMode = 0;
    int v8 = 0;
    self->_BOOL isPiggybacking = 0;
LABEL_9:
    int v10 = 1;
    goto LABEL_21;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v37 = 138412290;
    *(void *)&v37[4] = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ forcing dual mode ON",  v37,  0xCu);
  }

  int v8 = 1;
  BOOL serverSupportsDualMode = 1;
LABEL_18:
  int v10 = !serverSupportsDualMode;
  if (v8 && serverSupportsDualMode)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PCPersistentInterfaceManager sharedInstance]( &OBJC_CLASS___PCPersistentInterfaceManager,  "sharedInstance"));
    BOOL serverSupportsDualMode = 1;
    [v11 enableWiFiAutoAssociation:1 forDelegate:self];
    int v8 = 1;
    goto LABEL_22;
  }

- (void)_toggleWiFiAutoAssociateIfNecessary
{
  if (self->_dualMode == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      unsigned int v4 = "-[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "skip %s, dual mode is forced to off",  (uint8_t *)&v3,  0xCu);
    }
  }

  else
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "__toggleWiFiAutoAssociateIfNecessary",  0LL);
    -[APSNetworkMonitor performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "__toggleWiFiAutoAssociateIfNecessary",  0LL,  5.0);
  }

- (void)_clearConnectionThrottleTimer
{
  connectionThrottleTimer = self->_connectionThrottleTimer;
  self->_connectionThrottleTimer = 0LL;
}

- (void)_connectionThrottleTimerFired
{
  self->_BOOL shouldThrottleConnection = 0;
  -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
}

- (void)_clearPiggybackConnectionTimer
{
  piggybackConnectionTimer = self->_piggybackConnectionTimer;
  self->_piggybackConnectionTimer = 0LL;
}

- (void)_piggybackConnectionTimerFired
{
}

- (BOOL)isPiggybacking
{
  return self->_shouldUseDualMode && self->_isPiggybacking;
}

- (void)openedSecondChannel
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: informed that second channel opened",  buf,  0xCu);
  }

  BOOL v3 = -[APSNetworkMonitor isPiggybacking](self, "isPiggybacking");
  if (v3)
  {
    ++self->_piggybackCount;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t piggybackCount = self->_piggybackCount;
      *(_DWORD *)buf = 138412546;
      v27 = self;
      __int16 v28 = 2048;
      unint64_t v29 = piggybackCount;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ this is a piggybacked connection. PiggybackCount %lu, starting piggyback connection timer",  buf,  0x16u);
    }

    -[APSNetworkMonitor _clearPiggybackConnectionTimer](self, "_clearPiggybackConnectionTimer");
    if (!self->_disableDualModePiggybackTimer)
    {
      unsigned int v5 = objc_alloc(&OBJC_CLASS___PCSimpleTimer);
      double v6 = (double)(0x15180 / self->_maxPiggybackConnectionsPerDay);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"APSNetworkMonitor-piggybackConnectionTimer-%@",  self));
      int v8 = -[PCSimpleTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( v5,  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  v7,  self,  "_piggybackConnectionTimerFired",  0LL,  v6);
      piggybackConnectionTimer = self->_piggybackConnectionTimer;
      self->_piggybackConnectionTimer = v8;

      -[PCSimpleTimer setDisableSystemWaking:](self->_piggybackConnectionTimer, "setDisableSystemWaking:", 1LL);
      int v10 = self->_piggybackConnectionTimer;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      -[PCSimpleTimer scheduleInRunLoop:](v10, "scheduleInRunLoop:", v11);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v12, "networkMonitor:enableWiFiAssertionForPiggybackConnection:") & 1) != 0) {
      [v12 networkMonitor:self enableWiFiAssertionForPiggybackConnection:0];
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ rescheduling our connection throttle timer",  buf,  0xCu);
    }

    -[APSNetworkMonitor _clearConnectionThrottleTimer](self, "_clearConnectionThrottleTimer");
    id v13 = objc_alloc(&OBJC_CLASS___PCSimpleTimer);
    double v14 = (double)(0x15180 / self->_maxCostDrivenConnectionsPerDay);
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"APSNetworkMonitor-connectionThrottle-%@",  self));
    id v16 = -[PCSimpleTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( v13,  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  v15,  self,  "_connectionThrottleTimerFired",  0LL,  v14);
    connectionThrottleTimer = self->_connectionThrottleTimer;
    self->_connectionThrottleTimer = v16;

    -[PCSimpleTimer setDisableSystemWaking:](self->_connectionThrottleTimer, "setDisableSystemWaking:", 1LL);
    BOOL v18 = self->_connectionThrottleTimer;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    -[PCSimpleTimer scheduleInRunLoop:](v18, "scheduleInRunLoop:", v12);
  }

  v24[0] = @"Piggybacked";
  int64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  v25[0] = v19;
  v24[1] = @"Piggyback Count";
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_piggybackCount));
  v25[1] = v20;
  v24[2] = @"Accumulated push cost";
  int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[APSDecayTimer currentCost](self->_decayTimer, "currentCost")));
  v25[2] = v21;
  v24[3] = @"WiFi awake percentage";
  -[APSNetworkMonitor _accumulatedAwakePercentage](self, "_accumulatedAwakePercentage");
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v25[3] = v22;
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));

  APSPowerLog(@"Opened Second Channel", v23);
}

- (void)closedSecondChannel:(int64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412546;
    BOOL v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: informed that second channel closed - %@",  buf,  0x16u);
  }

  unsigned int v7 = -[APSNetworkMonitor isPiggybacking](self, "isPiggybacking");
  if (a3 == 1 && v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor systemMonitor](self, "systemMonitor"));
    unsigned __int8 v9 = [v8 isSystemLocked];

    if ((v9 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v20 = self;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: This connection was piggybacked and we are unlocked - disabling piggybacking for some time (or until next lock)",  buf,  0xCu);
      }

      int v10 = objc_alloc_init(&OBJC_CLASS___NSDate);
      lastPiggybackConnection = self->_lastPiggybackConnection;
      self->_lastPiggybackConnection = v10;
LABEL_14:
    }
  }

  else
  {
    char v12 = v7 ^ 1;
    if (a3) {
      char v12 = 1;
    }
    if ((v12 & 1) == 0)
    {
      lastPiggybackConnection = (NSDate *)objc_claimAutoreleasedReturnValue(-[APSNetworkMonitor delegate](self, "delegate"));
      if ((objc_opt_respondsToSelector( lastPiggybackConnection,  "networkMonitor:enableWiFiAssertionForPiggybackConnection:") & 1) != 0) {
        -[NSDate networkMonitor:enableWiFiAssertionForPiggybackConnection:]( lastPiggybackConnection,  "networkMonitor:enableWiFiAssertionForPiggybackConnection:",  self,  1LL);
      }
      goto LABEL_14;
    }
  }

  if (!self->_shouldThrottleConnection && self->_connectionThrottleTimer)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v20 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@: Throttling second connection since we're still within the time period required between second channel attempts.",  buf,  0xCu);
    }

    self->_BOOL shouldThrottleConnection = 1;
    goto LABEL_22;
  }

  if (!self->_piggybackConnectionTimer) {
LABEL_22:
  }
    -[APSNetworkMonitor _toggleWiFiAutoAssociateIfNecessary](self, "_toggleWiFiAutoAssociateIfNecessary");
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_piggybackCount,  @"Piggyback Count"));
  v18[0] = v13;
  v17[1] = @"Accumulated push cost";
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[APSDecayTimer currentCost](self->_decayTimer, "currentCost")));
  v18[1] = v14;
  v17[2] = @"WiFi awake percentage";
  -[APSNetworkMonitor _accumulatedAwakePercentage](self, "_accumulatedAwakePercentage");
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v18[2] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  APSPowerLog(@"Closed Second Channel", v16);
}

+ (unint64_t)powerCostForPushOnRAT:(int)a3 withLinkQuality:(int)a4
{
  unsigned int v4 = 1;
  switch(a3)
  {
    case -2:
    case -1:
      BOOL v7 = a4 <= 50;
      unsigned int v4 = 6;
      int v8 = 18;
      goto LABEL_16;
    case 0:
    case 2:
    case 9:
      BOOL v6 = a4 <= 50;
      unsigned int v4 = 8;
      goto LABEL_4;
    case 3:
    case 4:
    case 5:
      BOOL v6 = a4 <= 50;
      unsigned int v4 = 18;
      goto LABEL_4;
    case 7:
    case 8:
      goto LABEL_12;
    case 10:
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( &OBJC_CLASS___PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  1LL));
      char v10 = objc_opt_respondsToSelector(v9, "interface5GMode");

      if ((v10 & 1) == 0) {
        goto LABEL_12;
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( &OBJC_CLASS___PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  1LL));
      id v12 = [v11 interface5GMode];

      if (v12 == (id)3)
      {
        BOOL v7 = a4 <= 50;
        unsigned int v4 = 3;
        int v8 = 20;
LABEL_16:
        if (!v7) {
          unsigned int v4 = v8;
        }
        return 0x3E8 / v4;
      }

      if (v12 != (id)2)
      {
LABEL_12:
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( &OBJC_CLASS___PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  1LL));
        char v14 = objc_opt_respondsToSelector(v13, "isLTEWithCDRX");

        if ((v14 & 1) != 0
          && (int v15 = (void *)objc_claimAutoreleasedReturnValue( +[PCInterfaceMonitor sharedInstanceForIdentifier:]( PCInterfaceMonitor,  "sharedInstanceForIdentifier:",  1)),  v16 = [v15 isLTEWithCDRX],  v15,  v16))
        {
          BOOL v7 = a4 <= 50;
          unsigned int v4 = 6;
          int v8 = 40;
        }

        else
        {
          BOOL v7 = a4 <= 50;
          unsigned int v4 = 6;
          int v8 = 10;
        }

        goto LABEL_16;
      }

      BOOL v6 = a4 <= 50;
      unsigned int v4 = 5;
LABEL_4:
      if (v6) {
        unsigned int v4 = 1;
      }
      return 0x3E8 / v4;
    default:
      return 0x3E8 / v4;
  }

- (void)setCriticalReliability:(BOOL)a3
{
  if (self->_criticalReliability != a3)
  {
    BOOL v3 = a3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = @"disabled";
      if (v3) {
        id v5 = @"enabled";
      }
      int v6 = 138412546;
      BOOL v7 = self;
      __int16 v8 = 2112;
      unsigned __int8 v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ critical reliability is now %@",  (uint8_t *)&v6,  0x16u);
    }

    self->_BOOL criticalReliability = v3;
    if (v3) {
      -[APSDecayTimer forceTimerFire](self->_decayTimer, "forceTimerFire");
    }
  }

- (void)setDisableCostDrivenDualChannelAttempts:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    unsigned int v6 = [v4 BOOLValue];
  }
  else {
    unsigned int v6 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = @"YES";
    BOOL disableCostDrivenDualMode = self->_disableCostDrivenDualMode;
    int v10 = 138413058;
    if (disableCostDrivenDualMode) {
      unsigned __int8 v9 = @"YES";
    }
    else {
      unsigned __int8 v9 = @"NO";
    }
    uint64_t v11 = self;
    if (!v6) {
      BOOL v7 = @"NO";
    }
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    int v15 = v7;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setDisableCostDrivenDualChannelAttempts: changing from %@ to %@ (got number %@)",  (uint8_t *)&v10,  0x2Au);
  }

  self->_BOOL disableCostDrivenDualMode = v6;
}

- (void)setCostDrivenDualChannelAttempts:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 unsignedIntegerValue];
    else {
      unint64_t v7 = (unint64_t)v6;
    }
  }

  else
  {
    unint64_t v7 = 100LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maxCostDrivenConnectionsPerDay = self->_maxCostDrivenConnectionsPerDay;
    int v9 = 138413058;
    int v10 = self;
    __int16 v11 = 2048;
    unint64_t v12 = maxCostDrivenConnectionsPerDay;
    __int16 v13 = 2048;
    unint64_t v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setCostDrivenDualChannelAttempts: changing from %lu to %lu (got number %@)",  (uint8_t *)&v9,  0x2Au);
  }

  self->_unint64_t maxCostDrivenConnectionsPerDay = v7;
}

- (void)setPiggybackDualChannelAttempts:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 unsignedIntegerValue];
    else {
      unint64_t v7 = (unint64_t)v6;
    }
  }

  else
  {
    unint64_t v7 = 50LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t maxPiggybackConnectionsPerDay = self->_maxPiggybackConnectionsPerDay;
    int v9 = 138413058;
    int v10 = self;
    __int16 v11 = 2048;
    unint64_t v12 = maxPiggybackConnectionsPerDay;
    __int16 v13 = 2048;
    unint64_t v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setPiggybackDualChannelAttempts: changing from %lu to %lu (got number %@)",  (uint8_t *)&v9,  0x2Au);
  }

  self->_unint64_t maxPiggybackConnectionsPerDay = v7;
}

- (void)setDisableDualModePiggybackTimer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    unsigned int v6 = [v4 BOOLValue];
  }
  else {
    unsigned int v6 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = @"YES";
    BOOL disableDualModePiggybackTimer = self->_disableDualModePiggybackTimer;
    int v10 = 138413058;
    if (disableDualModePiggybackTimer) {
      int v9 = @"YES";
    }
    else {
      int v9 = @"NO";
    }
    __int16 v11 = self;
    if (!v6) {
      unint64_t v7 = @"NO";
    }
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ setDisableDualModePiggybackTimer: changing from %@ to %@ (got number %@)",  (uint8_t *)&v10,  0x2Au);
  }

  self->_BOOL disableDualModePiggybackTimer = v6;
}

- (void)interfaceConstraintChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 interfaceConstraint] == (id)1 && self->_shouldUseDualMode;
  BOOL v6 = [v4 interfaceConstraint] != (id)1 && !self->_shouldUseDualMode;
  if (v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 interfaceConstraint];
      BOOL shouldUseDualMode = self->_shouldUseDualMode;
      *(_DWORD *)int v10 = 138412802;
      *(void *)&v10[4] = self;
      if (shouldUseDualMode) {
        int v9 = @"YES";
      }
      else {
        int v9 = @"NO";
      }
      *(_WORD *)&v10[12] = 2048;
      *(void *)&v10[14] = v7;
      __int16 v11 = 2112;
      __int16 v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ interfaceConstraintChanged: %ld changing current dual mode %@)",  v10,  0x20u);
    }

    -[APSDecayTimer forceTimerFire](self->_decayTimer, "forceTimerFire", *(_OWORD *)v10);
  }
}

- (BOOL)serverSupportsDualMode
{
  return self->_serverSupportsDualMode;
}

- (BOOL)shouldUseDualMode
{
  return self->_shouldUseDualMode;
}

- (BOOL)isWoWEnabled
{
  return self->_isWoWEnabled;
}

- (void)setIsWoWEnabled:(BOOL)a3
{
  self->_BOOL isWoWEnabled = a3;
}

- (void).cxx_destruct
{
}

@end