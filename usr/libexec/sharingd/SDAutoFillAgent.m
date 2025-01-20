@interface SDAutoFillAgent
- (BOOL)_serviceShouldRequestAutoFill;
- (BOOL)_uiShowing;
- (BOOL)preventNotifications;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDAutoFillAgent)init;
- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3;
- (int)helper:(id)a3 didPickUsername:(id)a4 password:(id)a5 error:(id)a6;
- (int)helper:(id)a3 tryPIN:(id)a4;
- (int)helper:(id)a3 userNotificationDidActivate:(id)a4;
- (int)helper:(id)a3 userNotificationDidDismiss:(id)a4;
- (int)helperStart:(id)a3;
- (void)_activate;
- (void)_activateUIDelayTimer;
- (void)_bulletinsEnsureStarted;
- (void)_bulletinsEnsureStopped;
- (void)_clientClinkDeviceChanged:(id)a3;
- (void)_clientClinkDeviceFound:(id)a3;
- (void)_clientClinkDeviceLost:(id)a3;
- (void)_commonEnsureStarted;
- (void)_commonEnsureStopped;
- (void)_deactivateUIDelayTimer;
- (void)_deviceChanged:(id)a3;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_deviceStoppedRequesting:(id)a3;
- (void)_discoveryEnsureStarted;
- (void)_discoveryEnsureStopped;
- (void)_ensureKeychainCleaned:(BOOL)a3;
- (void)_helpersClientPairingSucceeded:(BOOL)a3 completion:(id)a4;
- (void)_helpersClientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)_invalidate;
- (void)_postSetupNotificationForDevice:(id)a3;
- (void)_proximityChanged:(id)a3;
- (void)_proximityEnsureStarted;
- (void)_proximityEnsureStopped;
- (void)_proximityFound:(id)a3;
- (void)_proximityLost:(id)a3;
- (void)_rtiEnsureStarted;
- (void)_rtiEnsureStopped;
- (void)_screenStateChanged:(id)a3;
- (void)_serviceEnsureStarted;
- (void)_serviceEnsureStopped;
- (void)_serviceHandleError:(id)a3;
- (void)_serviceHandleUsername:(id)a3 password:(id)a4 error:(id)a5;
- (void)_serviceStartRequestingAutoFillIfReady;
- (void)_serviceStopRequestingAutoFill;
- (void)_serviceTimeoutStart;
- (void)_serviceTimeoutStop;
- (void)_sessionHandlePairingSucceededResponse:(id)a3;
- (void)_sessionStart:(id)a3;
- (void)_sessionStop:(id)a3;
- (void)_siriRemoteMonitorEnsureStarted;
- (void)_siriRemoteMonitorEnsureStopped;
- (void)_uiLockStatusChanged:(id)a3;
- (void)_uiStart:(id)a3 extraInfo:(id)a4;
- (void)_uiStartIfNeeded:(id)a3 extraInfo:(id)a4;
- (void)_uiStop:(id)a3;
- (void)_update;
- (void)activate;
- (void)dealloc;
- (void)handleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)handleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)helperStop:(id)a3;
- (void)invalidate;
- (void)notificiationDidDismiss:(id)a3;
- (void)prefsChanged;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventNotifications:(BOOL)a3;
- (void)testKeychain:(id)a3;
- (void)testRemote:(id)a3;
- (void)testService:(id)a3;
- (void)testUI:(id)a3;
- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4;
@end

@implementation SDAutoFillAgent

- (SDAutoFillAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDAutoFillAgent;
  v2 = -[SDAutoFillAgent init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAutoFillAgent;
  -[SDAutoFillAgent dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"-- SDAutoFillAgent --\n");
  uint64_t v4 = "enabled";
  if (self->_prefGrantingEnabled) {
    v5 = "enabled";
  }
  else {
    v5 = "disabled";
  }
  if (self->_prefRequestingEnabled) {
    v6 = "enabled";
  }
  else {
    v6 = "disabled";
  }
  if (!self->_scanningEnabled) {
    uint64_t v4 = "disabled";
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"Granting: %s, Requesting: %s, Scanning: %s\n",  v5,  v6,  v4);
  if (self->_deviceDiscovery) {
    deviceDiscovery = self->_deviceDiscovery;
  }
  else {
    deviceDiscovery = (SFDeviceDiscovery *)@"off";
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"Device Discovery: %@, %ld devices\n",  deviceDiscovery,  -[NSMutableDictionary count](self->_devices, "count"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  v8 = self->_devices;
  id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v13));
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"    %@", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggeredDevices,  "objectForKeyedSubscript:",  v13));
        if (v15) {
          -[NSMutableString appendString:](v3, "appendString:", @", TRIG");
        }
        -[NSMutableString appendString:](v3, "appendString:", @"\n");
      }

      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v41,  v47,  16LL);
    }

    while (v10);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v16 = self->_triggeredDevices;
  id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v37,  v46,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v21));

        if (!v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggeredDevices,  "objectForKeyedSubscript:",  v21));
          -[NSMutableString appendFormat:](v3, "appendFormat:", @"    Orphaned triggered device: %@", v23);
        }
      }

      id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v37,  v46,  16LL);
    }

    while (v18);
  }

  if (self->_proximityDiscovery) {
    proximityDiscovery = self->_proximityDiscovery;
  }
  else {
    proximityDiscovery = (SFBLEScanner *)@"off";
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"Proximity discovery: %@, %ld devices\n",  proximityDiscovery,  -[NSMutableDictionary count](self->_proximityDevices, "count"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v25 = self->_proximityDevices;
  id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v33,  v45,  16LL);
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (k = 0LL; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_devices,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)k)));
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"    %@\n", v30);
      }

      id v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v33,  v45,  16LL);
    }

    while (v27);
  }

  requestingService = self->_requestingService;
  if (!requestingService) {
    requestingService = (SFRemoteAutoFillService *)@"off";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Requesting service: %@\n", requestingService);
  if (self->_siriRemoteMonitor) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"SiriRemoteMonitor: %@\n", self->_siriRemoteMonitor);
  }
  return (NSString *)v3;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068658;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068730;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
}

- (void)prefsChanged
{
  int v33 = 0;
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"rafGrantingEnabled", &v33);
  BOOL v5 = Int64 != 0;
  if (v33) {
    BOOL v5 = SFDeviceClassCodeGet(Int64, v4) == 1;
  }
  if (self->_prefGrantingEnabled != v5)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      v6 = "yes";
      if (v5) {
        objc_super v7 = "no";
      }
      else {
        objc_super v7 = "yes";
      }
      if (!v5) {
        v6 = "no";
      }
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent prefsChanged]", 30LL, "Enabled: %s -> %s\n", v7, v6);
    }

    self->_prefGrantingEnabled = v5;
    if (!v5
      && dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent prefsChanged]", 30LL, "### Granting disabled via default\n");
    }
  }

  uint64_t v8 = CFPrefs_GetInt64(@"com.apple.Sharing", @"rafRateLimitDisabled", &v33);
  if (v33) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  BOOL v10 = !v9;
  if (self->_prefRateLimitDisabled != v10)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      uint64_t v11 = "yes";
      if (v10) {
        v12 = "no";
      }
      else {
        v12 = "yes";
      }
      if (!v10) {
        uint64_t v11 = "no";
      }
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent prefsChanged]",  30LL,  "Rate limiting disabled: %s -> %s\n",  v12,  v11);
    }

    self->_prefRateLimitDisabled = v10;
  }

  uint64_t v13 = CFPrefs_GetInt64(@"com.apple.Sharing", @"rafRequestingEnabled", &v33);
  if (v33) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v13 == 0;
  }
  BOOL v15 = !v14;
  if (self->_prefRequestingEnabled != v15)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      v16 = "yes";
      if (v15) {
        id v17 = "no";
      }
      else {
        id v17 = "yes";
      }
      if (!v15) {
        v16 = "no";
      }
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent prefsChanged]", 30LL, "Requesting enabled: %s -> %s\n", v17, v16);
    }

    self->_prefRequestingEnabled = v15;
  }

  uint64_t v18 = CFPrefs_GetInt64(@"com.apple.Sharing", @"rafRequiresProx", &v33);
  if (v33) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v18 == 0;
  }
  BOOL v20 = !v19;
  if (self->_prefRequiresProx != v20)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      uint64_t v21 = "yes";
      if (v20) {
        v22 = "no";
      }
      else {
        v22 = "yes";
      }
      if (!v20) {
        uint64_t v21 = "no";
      }
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent prefsChanged]", 30LL, "Requires prox: %s -> %s\n", v22, v21);
    }

    self->_prefRequiresProx = v20;
  }

  uint64_t v23 = CFPrefs_GetInt64(@"com.apple.Sharing", @"rafAllowPairedTV", &v33);
  if (v33) {
    BOOL v24 = 0;
  }
  else {
    BOOL v24 = v23 == 0;
  }
  BOOL v25 = !v24;
  if (self->_prefPairedTVAllowed != v25)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      id v26 = "yes";
      if (v25) {
        id v27 = "no";
      }
      else {
        id v27 = "yes";
      }
      if (!v25) {
        id v26 = "no";
      }
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent prefsChanged]", 30LL, "Paired TVs allowed: %s -> %s\n", v27, v26);
    }

    self->_prefPairedTVAllowed = v25;
  }

  uint64_t v28 = CFPrefs_GetInt64(@"com.apple.Sharing", @"saClientEnabled", &v33);
  if (v33) {
    BOOL v29 = 1;
  }
  else {
    BOOL v29 = v28 == 0;
  }
  BOOL v30 = !v29;
  if (self->_proximityEnabled != v30)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      v31 = "yes";
      if (v30) {
        v32 = "no";
      }
      else {
        v32 = "yes";
      }
      if (!v30) {
        v31 = "no";
      }
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent prefsChanged]",  30LL,  "Proximity monitoring enabled: %s -> %s\n",  v32,  v31);
    }

    self->_proximityEnabled = v30;
  }

  if (!self->_remoteMonitoringEnabled)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent prefsChanged]",  30LL,  "Siri remote monitoring enabled: %s -> %s\n",  "no",  "yes");
    }

    self->_remoteMonitoringEnabled = 1;
  }

  if (self->_scanningEnabled)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent prefsChanged]", 30LL, "Scanning enabled: %s -> %s\n", "yes", "no");
    }

    self->_scanningEnabled = 0;
  }

  -[SDAutoFillAgent _update](self, "_update");
}

- (void)setPreventNotifications:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100068D88;
  v4[3] = &unk_1005CC3A8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_update
{
  if (self->_prefGrantingEnabled || self->_prefRequestingEnabled || self->_scanningEnabled) {
    -[SDAutoFillAgent _commonEnsureStarted](self, "_commonEnsureStarted");
  }
  else {
    -[SDAutoFillAgent _commonEnsureStopped](self, "_commonEnsureStopped");
  }
  BOOL v3 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn")
    && -[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked")
    && self->_scanningEnabled;
  if (-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
  {
    if (!v3)
    {
      if (self->_scanningEnabled) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }

- (void)_commonEnsureStarted
{
  if (!self->_statusMonitor)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"_screenStateChanged:" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v5 addObserver:self selector:"_uiLockStatusChanged:" name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    BOOL v3 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v3;
  }

- (void)_commonEnsureStopped
{
  if (self->_statusMonitor)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    [v3 removeObserver:self name:@"com.apple.sharingd.UILockStatusChanged" object:0];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0LL;
  }

  self->_cleanKeysState = 0;
}

- (void)_ensureKeychainCleaned:(BOOL)a3
{
  BOOL v3 = a3;
  CFTypeRef result = 0LL;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (self->_cleanKeysState) {
    BOOL v6 = !v3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {

    goto LABEL_48;
  }

  self->_cleanKeysState = 1;
  v67[0] = kSecAttrAccessGroup;
  v67[1] = kSecClass;
  v68[0] = @"com.apple.sharing.safaripasswordsharing";
  v68[1] = kSecClassKey;
  v67[2] = kSecMatchLimit;
  v67[3] = kSecReturnAttributes;
  v68[2] = kSecMatchLimitAll;
  v68[3] = &__kCFBooleanTrue;
  v67[4] = kSecReturnPersistentRef;
  v68[4] = &__kCFBooleanTrue;
  uint64_t v7 = SecItemCopyMatching( (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  5LL),  &result);
  if ((_DWORD)v7)
  {
    if (dword_100641EA0 > 60
      || (uint64_t v42 = v7, dword_100641EA0 == -1) && !_LogCategory_Initialize(&dword_100641EA0, 60LL))
    {
      id obj = 0LL;
      int v41 = 3;
      goto LABEL_45;
    }

    uint64_t v43 = (int)v42;
    NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
    __int128 v44 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v42, 0LL, 0LL));
    uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
    v22 = (NSMutableArray *)v45;
    v46 = @"?";
    if (v45) {
      v46 = (const __CFString *)v45;
    }
    v66 = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v43,  v47));
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _ensureKeychainCleaned:]", 60LL, "### Error fetching keys: %@", v48);

    id obj = 0LL;
    int v41 = 3;
    goto LABEL_44;
  }

  v50 = self;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = (id)result;
  id v8 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v57;
    uint64_t v12 = kSecAttrEndDate;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)i);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          id v16 = v14;
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v12]);
          if (v17)
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
            id v19 = [v18 compare:v17];

            if (v19 == (id)1)
            {
              uint64_t v20 = objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSecValuePersistentRef]);
              if (v20)
              {
                uint64_t v21 = (void *)v20;
                -[NSMutableArray addObject:](v5, "addObject:", v20);
                if (dword_100641EA0 <= 10
                  && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 10LL)))
                {
                  LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _ensureKeychainCleaned:]",  10LL,  "Should delete item with end date: %@ and persistent ref: %@",  v17,  v21);
                }
              }
            }
          }
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    }

    while (v10);
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  v22 = v5;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v52,  v63,  16LL);
  if (!v23)
  {
    int v41 = 4;
    self = v50;
LABEL_44:

    goto LABEL_45;
  }

  id v24 = v23;
  v49 = v5;
  uint64_t v25 = *(void *)v53;
  id v26 = (const __CFDictionary *)&__NSDictionary0__struct;
  p_weak_ivar_lyt = &SDAirDropAgentClient.weak_ivar_lyt;
  do
  {
    for (j = 0LL; j != v24; j = (char *)j + 1)
    {
      if (*(void *)v53 != v25) {
        objc_enumerationMutation(v22);
      }
      uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)j);
      uint64_t v30 = SecItemDelete(v26);
      if ((_DWORD)v30)
      {
        int v31 = *((_DWORD *)p_weak_ivar_lyt + 936);
        if (v31 <= 60 && (v31 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
        {
          NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
          v32 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v30, 0LL, 0LL));
          uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
          __int128 v34 = (void *)v33;
          __int128 v35 = @"?";
          if (v33) {
            __int128 v35 = (const __CFString *)v33;
          }
          v62 = v35;
          uint64_t v36 = v25;
          __int128 v37 = v26;
          __int128 v38 = v22;
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
          __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  (int)v30,  v39));
          LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _ensureKeychainCleaned:]",  60LL,  "### Deleting %@ error: %@",  v29,  v40);

          p_weak_ivar_lyt = (void **)(&SDAirDropAgentClient + 56);
          v22 = v38;
          id v26 = v37;
          uint64_t v25 = v36;
        }
      }
    }

    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v52,  v63,  16LL);
  }

  while (v24);

  self = v50;
  v50->_cleanKeysState = 4;
  if (!(_DWORD)v30)
  {
    id v5 = v49;
    goto LABEL_47;
  }

  int v41 = 3;
  id v5 = v49;
LABEL_45:
  self->_cleanKeysState = v41;
LABEL_47:

LABEL_48:
}

- (void)_postSetupNotificationForDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    v10[0] = @"deviceID";
    v10[1] = @"needsSetup";
    v11[0] = v5;
    unsigned int v6 = [v3 needsSetup];
    uint64_t v7 = &__kCFBooleanFalse;
    if (v6) {
      uint64_t v7 = &__kCFBooleanTrue;
    }
    v11[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v9 postNotificationName:@"com.apple.sharing.ProxAutoFill" object:@"com.apple.sharingd" userInfo:v8 deliverImmediately:1];
    if (dword_100641EA0 <= 50
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 50LL)))
    {
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _postSetupNotificationForDevice:]",  50LL,  "Posted %@: %##@\n",  @"com.apple.sharing.ProxAutoFill",  v8);
    }
  }
}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v6,  0LL);
  uint64_t v9 = v8;
  if (v8)
  {
    __int128 v38 = self;
    __int128 v39 = v8;
    __int128 v40 = v7;
    id v41 = v6;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v8, "queryItems"));
    id v11 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v11)
    {
      uint64_t v13 = 0LL;
      BOOL v14 = 0LL;
      goto LABEL_23;
    }

    id v12 = v11;
    uint64_t v13 = 0LL;
    BOOL v14 = 0LL;
    uint64_t v15 = *(void *)v43;
    while (1)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        uint64_t v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v17 name]);
        if (v18 == @"bt"
          || (id v19 = v18) != 0LL
          && (unsigned int v20 = -[__CFString isEqual:](v18, "isEqual:", @"bt"),
              v19,
              v19,
              v20))
        {
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v17 value]);
          v22 = v13;
          uint64_t v13 = (void *)v21;
LABEL_15:

          continue;
        }

        id v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v17 name]);
        if (v23 != @"pin")
        {
          id v24 = v23;
          if (!v23) {
            continue;
          }
          unsigned int v25 = -[__CFString isEqual:](v23, "isEqual:", @"pin");

          if (!v25) {
            continue;
          }
        }

        uint64_t v26 = objc_claimAutoreleasedReturnValue([v17 value]);
        v22 = v14;
        BOOL v14 = (void *)v26;
        goto LABEL_15;
      }

      id v12 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (!v12)
      {
LABEL_23:

        id v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v28 = v27;
        if (v14) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v14, @"pin");
        }
        uint64_t v7 = v40;
        if (v13)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v13,  @"deviceAddress");
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v38->_btDevices,  "objectForKeyedSubscript:",  v13));
          uint64_t v30 = v29;
          if (v29)
          {
            int v31 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);

            if (v31)
            {
              if (dword_100641EA0 <= 10
                && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 10LL)))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
                LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:]",  10LL,  "Already found device, adding identifier to extra info: %@\n",  v32);
              }

              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
              __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 UUIDString]);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  v37,  @"deviceIdentifier");
            }
          }
        }

        else
        {
          uint64_t v30 = 0LL;
        }

        id v6 = v41;
        if (dword_100641EA0 <= 30
          && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
        {
          LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:]",  30LL,  "Triggering AutoFill from URL: %@",  v41);
        }

        -[SDAutoFillAgent _uiStart:extraInfo:](v38, "_uiStart:extraInfo:", 0LL, v28);
        if (v40) {
          v40[2](v40, 0LL);
        }

        uint64_t v9 = v39;
        goto LABEL_46;
      }
    }
  }

  if (dword_100641EA0 <= 60 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent triggerProximityAutoFillDetectedWithURL:completion:]",  60LL,  "### Failed to get components from url: %@\n",  v6);
  }
  if (v7)
  {
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    uint64_t v33 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    uint64_t v13 = (void *)v34;
    __int128 v35 = @"?";
    if (v34) {
      __int128 v35 = (const __CFString *)v34;
    }
    v48 = v35;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  v30));
    v7[2](v7, v14);
LABEL_46:
  }
}

- (void)_screenStateChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069DD4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_uiLockStatusChanged:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069F10;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_bulletinsEnsureStarted
{
  if (!self->_notificationManager)
  {
    id v3 = (SDNotificationManager *)objc_claimAutoreleasedReturnValue( +[SDNotificationManager sharedManager]( &OBJC_CLASS___SDNotificationManager,  "sharedManager"));
    notificationManager = self->_notificationManager;
    self->_notificationManager = v3;

    -[SDNotificationManager activate](self->_notificationManager, "activate");
  }

- (void)_bulletinsEnsureStopped
{
  notificationManager = self->_notificationManager;
  self->_notificationManager = 0LL;
}

- (void)notificiationDidDismiss:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    grantingSession = self->_grantingSession;
    if (grantingSession)
    {
      id v10 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](grantingSession, "peerDevice"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      unsigned int v9 = [v8 isEqual:v10];

      id v4 = v10;
      if (v9)
      {
        -[SDAutoFillAgent _sessionStop:](self, "_sessionStop:", 0LL);
        id v4 = v10;
      }
    }
  }
}

- (void)_discoveryEnsureStarted
{
  if (!self->_deviceDiscovery)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _discoveryEnsureStarted]", 30LL, "Discovery start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 13LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 8208LL);
    -[SFDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](self->_deviceDiscovery, "setPurpose:", @"AutoFill");
    -[SFDeviceDiscovery setRssiThreshold:](self->_deviceDiscovery, "setRssiThreshold:", -60LL);
    -[SFDeviceDiscovery setScanRate:](self->_deviceDiscovery, "setScanRate:", 20LL);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006A3D0;
    v14[3] = &unk_1005CB8C8;
    v14[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10006A3DC;
    v13[3] = &unk_1005CB8C8;
    v13[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10006A3E8;
    v12[3] = &unk_1005CB8F0;
    v12[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v12);
    id v5 = self->_deviceDiscovery;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    void v11[2] = sub_10006A3F4;
    v11[3] = &unk_1005CB3E8;
    v11[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v11);
    if (!self->_clinkClient)
    {
      if (dword_100641EA0 <= 30
        && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
      {
        LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _discoveryEnsureStarted]", 30LL, "CompanionLink start\n");
      }

      id v6 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
      clinkClient = self->_clinkClient;
      self->_clinkClient = v6;

      -[RPCompanionLinkClient setControlFlags:]( self->_clinkClient,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](self->_clinkClient, "controlFlags") | 0x2004);
      -[RPCompanionLinkClient setDispatchQueue:](self->_clinkClient, "setDispatchQueue:", self->_dispatchQueue);
      -[RPCompanionLinkClient setInterruptionHandler:](self->_clinkClient, "setInterruptionHandler:", &stru_1005CC550);
      -[RPCompanionLinkClient setInvalidationHandler:](self->_clinkClient, "setInvalidationHandler:", &stru_1005CC570);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      void v10[2] = sub_10006A590;
      v10[3] = &unk_1005CC598;
      v10[4] = self;
      -[RPCompanionLinkClient setDeviceFoundHandler:](self->_clinkClient, "setDeviceFoundHandler:", v10);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10006A59C;
      v9[3] = &unk_1005CC598;
      v9[4] = self;
      -[RPCompanionLinkClient setDeviceLostHandler:](self->_clinkClient, "setDeviceLostHandler:", v9);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_10006A5A8;
      v8[3] = &unk_1005CC5C0;
      v8[4] = self;
      -[RPCompanionLinkClient setDeviceChangedHandler:](self->_clinkClient, "setDeviceChangedHandler:", v8);
      -[RPCompanionLinkClient activateWithCompletion:](self->_clinkClient, "activateWithCompletion:", &stru_1005CC5E0);
    }
  }

- (void)_discoveryEnsureStopped
{
  if (self->_deviceDiscovery)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _discoveryEnsureStopped]", 30LL, "Discovery stop\n");
    }

    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0LL;
  }

  -[NSMutableDictionary removeAllObjects](self->_btDevices, "removeAllObjects");
  btDevices = self->_btDevices;
  self->_btDevices = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_grantedDevices, "removeAllObjects");
  grantedDevices = self->_grantedDevices;
  self->_grantedDevices = 0LL;

  -[NSMutableSet removeAllObjects](self->_ignoredTVs, "removeAllObjects");
  ignoredTVs = self->_ignoredTVs;
  self->_ignoredTVs = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_triggeredDevices, "removeAllObjects");
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0LL;

  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    -[RPCompanionLinkClient invalidate](clinkClient, "invalidate");
    id v10 = self->_clinkClient;
    self->_clinkClient = 0LL;
  }

- (void)_deviceChanged:(id)a3
{
  id v16 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v4 || !self->_deviceDiscovery) {
    goto LABEL_30;
  }
  unsigned int v5 = [v16 deviceActionType];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsBluetoothDeviceIDsForRIServers]);
  unsigned int v8 = [v7 containsObject:v4];

  if (v5 == 19 && v8 && !self->_prefPairedTVAllowed)
  {
    if ((-[NSMutableSet containsObject:](self->_ignoredTVs, "containsObject:", v4) & 1) == 0)
    {
      if (dword_100641EA0 <= 10
        && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 10LL)))
      {
        LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _deviceChanged:]", 10LL, "Ignoring paired TV\n");
      }

      ignoredTVs = self->_ignoredTVs;
      if (!ignoredTVs)
      {
        BOOL v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        uint64_t v15 = self->_ignoredTVs;
        self->_ignoredTVs = v14;

        ignoredTVs = self->_ignoredTVs;
      }

      -[NSMutableSet addObject:](ignoredTVs, "addObject:", v4);
    }

    goto LABEL_30;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggeredDevices,  "objectForKeyedSubscript:",  v4));
  if (!v9)
  {
    if (!gSDProxCardsSuppressed)
    {
LABEL_14:
      if (!-[SDAutoFillAgent _uiShowing](self, "_uiShowing")
        && (-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) == 0
        && [v16 needsSetup]
        && v5 == 19)
      {
        triggeredDevices = self->_triggeredDevices;
        if (!triggeredDevices)
        {
          id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v12 = self->_triggeredDevices;
          self->_triggeredDevices = v11;

          triggeredDevices = self->_triggeredDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](triggeredDevices, "setObject:forKeyedSubscript:", v16, v4);
        -[SDAutoFillAgent _uiStartIfEnabled:extraInfo:](self, "_uiStartIfEnabled:extraInfo:", v16, 0LL);
      }

      goto LABEL_31;
    }

- (void)_deviceFound:(id)a3
{
  id v19 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_deviceDiscovery) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && [v19 deviceActionType] == 19)
  {
    if (dword_100641EA0 <= 10
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 10LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _deviceFound:]", 10LL, "Found device: %@\n", v19);
    }

    devices = self->_devices;
    if (!devices)
    {
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      unsigned int v8 = self->_devices;
      self->_devices = v7;

      devices = self->_devices;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v19, v4);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v19 bleDevice]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 advertisementFields]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"bdAddr"]);

    if (v11)
    {
      uint64_t v12 = SFHexStringForData(v11);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet symbolCharacterSet](&OBJC_CLASS___NSCharacterSet, "symbolCharacterSet"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByTrimmingCharactersInSet:v14]);

      btDevices = self->_btDevices;
      if (!btDevices)
      {
        id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v18 = self->_btDevices;
        self->_btDevices = v17;

        btDevices = self->_btDevices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](btDevices, "setObject:forKeyedSubscript:", v19, v15);
    }

    -[SDAutoFillAgent _update](self, "_update");
    -[SDAutoFillAgent _deviceChanged:](self, "_deviceChanged:", v19);
  }
}

- (void)_deviceLost:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
    -[SDAutoFillAgent _deviceStoppedRequesting:](self, "_deviceStoppedRequesting:", v12);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v12 bleDevice]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 advertisementFields]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bdAddr"]);

    if (v7)
    {
      uint64_t v8 = SFHexStringForData(v7);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet symbolCharacterSet](&OBJC_CLASS___NSCharacterSet, "symbolCharacterSet"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByTrimmingCharactersInSet:v10]);

      -[NSMutableDictionary removeObjectForKey:](self->_btDevices, "removeObjectForKey:", v11);
    }

    -[SDAutoFillAgent _update](self, "_update");
  }
}

- (void)_deviceStoppedRequesting:(id)a3
{
  id v6 = a3;
  if (dword_100641EA0 <= 30 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _deviceStoppedRequesting:]",  30LL,  "Device stopped requesting %@",  v6);
  }
  -[SDAutoFillAgent _uiStop:](self, "_uiStop:", v6);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_grantedDevices,  "objectForKeyedSubscript:",  v4));

    if (v5)
    {
      if (dword_100641EA0 <= 50
        && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 50LL)))
      {
        LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _deviceStoppedRequesting:]", 50LL, "Untriggering %@", v6);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v4);
      -[NSMutableDictionary removeObjectForKey:](self->_grantedDevices, "removeObjectForKey:", v4);
    }
  }
}

- (void)_clientClinkDeviceFound:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100641EA0 <= 30
    && ((v6 = v3, dword_100641EA0 != -1) || (v5 = _LogCategory_Initialize(&dword_100641EA0, 30LL), id v4 = v6, v5)))
  {
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _clientClinkDeviceFound:]", 30LL, "Clink Found: %@\n", v4);
  }

  else
  {
  }

- (void)_clientClinkDeviceLost:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100641EA0 <= 30
    && ((v6 = v3, dword_100641EA0 != -1) || (v5 = _LogCategory_Initialize(&dword_100641EA0, 30LL), id v4 = v6, v5)))
  {
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _clientClinkDeviceLost:]", 30LL, "Clink Lost: %@\n", v4);
  }

  else
  {
  }

- (void)_clientClinkDeviceChanged:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100641EA0 <= 30
    && ((v6 = v3, dword_100641EA0 != -1) || (v5 = _LogCategory_Initialize(&dword_100641EA0, 30LL), id v4 = v6, v5)))
  {
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _clientClinkDeviceChanged:]", 30LL, "Clink Changed: %@\n", v4);
  }

  else
  {
  }

- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaRouteID]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    id v22 = v4;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceIdentifier]);
        unsigned __int8 v14 = [v13 isEqualToString:v6];

        if ((v14 & 1) != 0) {
          goto LABEL_20;
        }
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaRouteIdentifier]);
        unsigned __int8 v16 = [v15 isEqualToString:v7];

        if ((v16 & 1) != 0) {
          goto LABEL_20;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
        if ([v17 isEqualToString:v5])
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 model]);
          unsigned int v19 = [v18 isEqualToString:v23];

          if (v19)
          {
            if (dword_100641EA0 <= 90
              && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 90LL)))
            {
              LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _rpCompanionLinkDeviceForSFDevice:]",  90LL,  "### No IDS or route identifier match between %@ and %@ \n",  v22,  v12);
            }

- (int)helperStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v4 setDispatchQueue:self->_dispatchQueue];
  [v4 setAgent:self];
  helpers = self->_helpers;
  if (!helpers)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v7 = self->_helpers;
    self->_helpers = v6;

    helpers = self->_helpers;
  }

  -[NSMutableSet addObject:](helpers, "addObject:", v4);
  [v4 activateWithCompletion:0];
  -[SDAutoFillAgent _update](self, "_update");

  return 0;
}

- (void)helperStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableSet removeObject:](self->_helpers, "removeObject:", v4);
  -[SDAutoFillAgent _sessionStop:](self, "_sessionStop:", 0LL);
  -[SDAutoFillAgent _update](self, "_update");
}

- (int)helper:(id)a3 didPickUsername:(id)a4 password:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100641EA0 <= 30 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:didPickUsername:password:error:]",  30LL,  "Helper: DidPickUsernamePassword");
  }
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v10) & 1) == 0
    && dword_100641EA0 <= 60
    && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
  {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:didPickUsername:password:error:]",  60LL,  "### Message from unrecognized helper\n");
  }

  credentialsHandler = (void (**)(id, id, id, id))self->_credentialsHandler;
  if (credentialsHandler)
  {
    credentialsHandler[2](credentialsHandler, v11, v12, v13);
  }

  else if (dword_100641EA0 <= 60 {
         && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
  }
  {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:didPickUsername:password:error:]",  60LL,  "### Helper passing credential, but no handler?");
  }

  if (!v13)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](self->_grantingSession, "peerDevice"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 identifier]);
    id v17 = (void *)v16;
    if (v15 && v16)
    {
      if (dword_100641EA0 <= 30
        && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
      {
        LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:didPickUsername:password:error:]",  30LL,  "Adding %@ to granted devices\n",  v17);
      }

      grantedDevices = self->_grantedDevices;
      if (!grantedDevices)
      {
        unsigned int v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v20 = self->_grantedDevices;
        self->_grantedDevices = v19;

        grantedDevices = self->_grantedDevices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](grantedDevices, "setObject:forKeyedSubscript:", v15, v17);
    }
  }

  return 0;
}

- (int)helper:(id)a3 tryPIN:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v6) & 1) == 0
    && dword_100641EA0 <= 60
    && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
  {
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent helper:tryPIN:]", 60LL, "### Message from unrecognized helper\n");
  }

  -[SFRemoteAutoFillSession tryPIN:](self->_grantingSession, "tryPIN:", v7);

  return 0;
}

- (int)helper:(id)a3 userNotificationDidActivate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100641EA0 <= 30 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:userNotificationDidActivate:]",  30LL,  "Helper: NotificationDidActivate");
  }
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v6) & 1) == 0
    && dword_100641EA0 <= 60
    && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
  {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:userNotificationDidActivate:]",  60LL,  "### Message from unrecognized helper\n");
  }

  -[SDAutoFillAgent _sessionStart:](self, "_sessionStart:", v7);

  return 0;
}

- (int)helper:(id)a3 userNotificationDidDismiss:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100641EA0 <= 30 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:userNotificationDidDismiss:]",  30LL,  "Helper: NotificationDidDismiss");
  }
  if ((-[NSMutableSet containsObject:](self->_helpers, "containsObject:", v6) & 1) == 0
    && dword_100641EA0 <= 60
    && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
  {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent helper:userNotificationDidDismiss:]",  60LL,  "### Message from unrecognized helper\n");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  -[SDAutoFillAgent notificiationDidDismiss:](self, "notificiationDidDismiss:", v8);

  return 0;
}

- (void)_helpersClientPairingSucceeded:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = self->_helpers;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "clientPairingSucceeded:completion:") & 1) != 0) {
          objc_msgSend(v12, "clientPairingSucceeded:completion:", v4, v6, (void)v13);
        }
      }

      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v9);
  }
}

- (void)_helpersClientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = self->_helpers;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "clientPromptForPIN:throttleSeconds:") & 1) != 0) {
          objc_msgSend(v11, "clientPromptForPIN:throttleSeconds:", v5, v4, (void)v12);
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }
}

- (void)_proximityEnsureStarted
{
  if (!self->_proximityDiscovery)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _proximityEnsureStarted]", 30LL, "Proximity discovery start\n");
    }

    id v3 = -[SFBLEScanner initWithType:](objc_alloc(&OBJC_CLASS___SFBLEScanner), "initWithType:", 7LL);
    proximityDiscovery = self->_proximityDiscovery;
    self->_proximityDiscovery = v3;

    -[SFBLEScanner setChangeFlags:](self->_proximityDiscovery, "setChangeFlags:", 13LL);
    -[SFBLEScanner setDispatchQueue:](self->_proximityDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFBLEScanner setRssiThreshold:](self->_proximityDiscovery, "setRssiThreshold:", -60LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006BD10;
    v9[3] = &unk_1005CB958;
    v9[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_proximityDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006BD1C;
    v8[3] = &unk_1005CB958;
    v8[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_proximityDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006BD28;
    v7[3] = &unk_1005CB9C0;
    v7[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_proximityDiscovery, "setDeviceChangedHandler:", v7);
    -[SFBLEScanner activateWithCompletion:](self->_proximityDiscovery, "activateWithCompletion:", &stru_1005CC600);
    if (!self->_proximityController)
    {
      uint64_t v5 = (SDProximityController *)objc_claimAutoreleasedReturnValue( +[SDProximityController sharedController]( &OBJC_CLASS___SDProximityController,  "sharedController"));
      proximityController = self->_proximityController;
      self->_proximityController = v5;
    }
  }

- (void)_proximityEnsureStopped
{
  if (self->_proximityDiscovery)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _proximityEnsureStopped]", 30LL, "Proximity discovery stop\n");
    }

    -[SFBLEScanner invalidate](self->_proximityDiscovery, "invalidate");
    proximityDiscovery = self->_proximityDiscovery;
    self->_proximityDiscovery = 0LL;
  }

  -[NSMutableDictionary removeAllObjects](self->_proximityDevices, "removeAllObjects");
  proximityDevices = self->_proximityDevices;
  self->_proximityDevices = 0LL;
}

- (void)_proximityChanged:(id)a3
{
  id v19 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!v4 || !self->_proximityDiscovery)
  {
    id v6 = 0LL;
    __int128 v13 = 0LL;
    uint64_t v5 = 0LL;
LABEL_34:
    id v7 = 0LL;
    goto LABEL_31;
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  -[SFDevice updateWithBLEDevice:](v5, "updateWithBLEDevice:", v19);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFDevice model](v5, "model"));
  if (![&off_1005FADA8 containsObject:v6])
  {
    __int128 v13 = 0LL;
    goto LABEL_34;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v19 proxPairProximityEstimator]);
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bleProximityInfoForType:@"rafp" device:v5]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SFProximityEstimator proximityEstimatorWithProximityInfo:]( &OBJC_CLASS___SFProximityEstimator,  "proximityEstimatorWithProximityInfo:",  v9));
    [v19 setProxPairProximityEstimator:v7];
  }

  [v7 updateWithSFBLEDevice:v19];
  unsigned int v10 = [v19 triggered];
  -[SDProximityController sender:notifyBluetoothSample:]( self->_proximityController,  "sender:notifyBluetoothSample:",  self,  v5);
  unint64_t v11 = -[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v5);
  if (v11 == 2
    && dword_100641EA0 <= 50
    && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 50LL)))
  {
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _proximityChanged:]", 50LL, "#ni_estimator autofill triggered");
  }

  BOOL v12 = v11 == 2;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_proximityDevices,  "objectForKeyedSubscript:",  v4));
  if (!v13)
  {
    if (!v12)
    {
      __int128 v13 = 0LL;
      goto LABEL_31;
    }

    __int128 v14 = v19;
    if (dword_100641EA0 <= 30)
    {
      if (dword_100641EA0 != -1 || (v15 = _LogCategory_Initialize(&dword_100641EA0, 30LL), __int128 v14 = v19, v15))
      {
        LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _proximityChanged:]",  30,  "Proximity remote %@ entered at %d\n",  v4,  [v14 rssiEstimate]);
        __int128 v14 = v19;
      }
    }

    proximityDevices = self->_proximityDevices;
    if (!proximityDevices)
    {
      id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v18 = self->_proximityDevices;
      self->_proximityDevices = v17;

      __int128 v14 = v19;
      proximityDevices = self->_proximityDevices;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](proximityDevices, "setObject:forKeyedSubscript:", v14, v4);
LABEL_30:
    -[SDAutoFillAgent _update](self, "_update");
    goto LABEL_31;
  }

  if (!v12)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _proximityChanged:]",  30,  "Proximity remote %@ exited at %d\n",  v4,  [v19 rssiEstimate]);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_proximityDevices, "removeObjectForKey:", v4);
    goto LABEL_30;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_proximityDevices, "setObject:forKeyedSubscript:", v19, v4);
LABEL_31:
}

- (void)_proximityFound:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (dword_100641EA0 <= 10
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 10LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _proximityFound:]", 10LL, "Found proximity device: %@\n", v6);
    }

    -[SDAutoFillAgent _proximityChanged:](self, "_proximityChanged:", v6);
  }
}

- (void)_proximityLost:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_proximityDiscovery) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (dword_100641EA0 <= 10
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 10LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _proximityLost:]", 10LL, "Lost proximity device: %@\n", v6);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_proximityDevices, "removeObjectForKey:", v4);
    -[SDAutoFillAgent _update](self, "_update");
  }
}

- (void)_rtiEnsureStarted
{
  if (!self->_rtiActivated)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
    [v3 addDelegate:self];

    self->_rtiActivated = 1;
  }

- (void)_rtiEnsureStopped
{
  if (self->_rtiActivated)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
    [v3 removeDelegate:self];

    self->_rtiActivated = 0;
  }

- (void)handleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  int v4 = a3;
  id v19 = a4;
  if (dword_100641EA0 <= 30 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent handleInputDidBeginWithFlags:sessionInfo:]",  30LL,  "RTI: input did begin with flags: %d",  v4);
  }
  BOOL v6 = v4 & 1;
  if (v6 != self->_autoFillContext)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      id v7 = "no";
      if (v6) {
        id v8 = "no";
      }
      else {
        id v8 = "yes";
      }
      if (v6) {
        id v7 = "yes";
      }
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent handleInputDidBeginWithFlags:sessionInfo:]",  30LL,  "In AutoFill context: %s -> %s",  v8,  v7);
    }

    uint64_t v9 = (NSData *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"remoteAppIconData"]);
    appIconData = self->_appIconData;
    self->_appIconData = v9;

    self->_autoFillContext = v6;
    unint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"remoteLocalizedAppName"]);
    requestingAppLocalizedName = self->_requestingAppLocalizedName;
    self->_requestingAppLocalizedName = v11;

    __int128 v13 = (NSString *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"remoteUnlocalizedAppName"]);
    requestingAppUnlocalizedName = self->_requestingAppUnlocalizedName;
    self->_requestingAppUnlocalizedName = v13;

    int v15 = (NSArray *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"remoteAssociatedDomains"]);
    requestingAssociatedDomains = self->_requestingAssociatedDomains;
    self->_requestingAssociatedDomains = v15;

    id v17 = (NSString *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"remoteBundleID"]);
    requestingBundleID = self->_requestingBundleID;
    self->_requestingBundleID = v17;
  }

  -[SDAutoFillAgent _update](self, "_update");
}

- (void)handleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  int v4 = a3;
  id v12 = a4;
  if (dword_100641EA0 <= 30)
  {
    if (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)) {
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent handleInputDidEndWithFlags:sessionInfo:]",  30LL,  "RTI: input did end with flags: %d",  v4);
    }
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      if (self->_autoFillContext) {
        BOOL v6 = "yes";
      }
      else {
        BOOL v6 = "no";
      }
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent handleInputDidEndWithFlags:sessionInfo:]",  30LL,  "In AutoFill context: %s -> %s",  v6,  "no");
    }
  }

  appIconData = self->_appIconData;
  self->_appIconData = 0LL;

  self->_autoFillContext = 0;
  requestingBundleID = self->_requestingBundleID;
  self->_requestingBundleID = 0LL;

  requestingAppLocalizedName = self->_requestingAppLocalizedName;
  self->_requestingAppLocalizedName = 0LL;

  requestingAppUnlocalizedName = self->_requestingAppUnlocalizedName;
  self->_requestingAppUnlocalizedName = 0LL;

  requestingAssociatedDomains = self->_requestingAssociatedDomains;
  self->_requestingAssociatedDomains = 0LL;

  -[SDAutoFillAgent _update](self, "_update");
}

- (void)_siriRemoteMonitorEnsureStarted
{
  if (!self->_siriRemoteMonitor)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _siriRemoteMonitorEnsureStarted]",  30LL,  "SiriRemoteMonitor start\n");
    }

    self->_siriRemoteMonitorState = 1;
    id v3 = objc_alloc_init(&OBJC_CLASS___SFSiriRemoteMonitor);
    siriRemoteMonitor = self->_siriRemoteMonitor;
    self->_siriRemoteMonitor = v3;

    BOOL v5 = self->_siriRemoteMonitor;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10006C7E0;
    v6[3] = &unk_1005CB3E8;
    v6[4] = self;
    -[SFSiriRemoteMonitor activate:](v5, "activate:", v6);
  }

- (void)_siriRemoteMonitorEnsureStopped
{
  if (self->_siriRemoteMonitor)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _siriRemoteMonitorEnsureStopped]",  30LL,  "SiriRemoteMonitor stop\n");
    }

    -[SFSiriRemoteMonitor invalidate](self->_siriRemoteMonitor, "invalidate");
    siriRemoteMonitor = self->_siriRemoteMonitor;
    self->_siriRemoteMonitor = 0LL;

    self->_siriRemoteMonitorState = 0;
  }

- (void)_serviceEnsureStarted
{
  if (!self->_requestingService)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _serviceEnsureStarted]", 30LL, "Requesting service start\n");
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    self->_requestingServiceState = 1;
    id v3 = objc_alloc_init(&OBJC_CLASS___SFRemoteAutoFillService);
    requestingService = self->_requestingService;
    self->_requestingService = v3;

    -[SFRemoteAutoFillService setAppIconData:](self->_requestingService, "setAppIconData:", self->_appIconData);
    -[SFRemoteAutoFillService setAssociatedDomains:]( self->_requestingService,  "setAssociatedDomains:",  self->_requestingAssociatedDomains);
    -[SFRemoteAutoFillService setBundleID:](self->_requestingService, "setBundleID:", self->_requestingBundleID);
    -[SFRemoteAutoFillService setDispatchQueue:](self->_requestingService, "setDispatchQueue:", self->_dispatchQueue);
    -[SFRemoteAutoFillService setLocalizedAppName:]( self->_requestingService,  "setLocalizedAppName:",  self->_requestingAppLocalizedName);
    -[SFRemoteAutoFillService setUnlocalizedAppName:]( self->_requestingService,  "setUnlocalizedAppName:",  self->_requestingAppUnlocalizedName);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006CB14;
    v8[3] = &unk_1005CB3E8;
    v8[4] = self;
    -[SFRemoteAutoFillService setErrorHandler:](self->_requestingService, "setErrorHandler:", v8);
    -[SFRemoteAutoFillService setHidePINHandler:](self->_requestingService, "setHidePINHandler:", &stru_1005CC620);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10006CB80;
    v7[3] = &unk_1005CC648;
    v7[4] = self;
    -[SFRemoteAutoFillService setReceivedCredentialsHandler:]( self->_requestingService,  "setReceivedCredentialsHandler:",  v7);
    BOOL v5 = self->_requestingService;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10006CB94;
    v6[3] = &unk_1005CB3E8;
    v6[4] = self;
    -[SFRemoteAutoFillService activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serviceEnsureStopped
{
  if (self->_requestingService)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _serviceEnsureStopped]", 30LL, "Requesting service stop\n");
    }

    -[SDAutoFillAgent _serviceStopRequestingAutoFill](self, "_serviceStopRequestingAutoFill");
    -[SFRemoteAutoFillService invalidate](self->_requestingService, "invalidate");
    requestingService = self->_requestingService;
    self->_requestingService = 0LL;

    self->_requestingServiceState = 0;
  }

- (void)_serviceHandleError:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (dword_100641EA0 <= 60
    && ((v6 = v3, dword_100641EA0 != -1) || (v5 = _LogCategory_Initialize(&dword_100641EA0, 60LL), int v4 = v6, v5)))
  {
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _serviceHandleError:]", 60LL, "### Requesting service error: %@", v4);
  }

  else
  {
  }

- (void)_serviceHandleUsername:(id)a3 password:(id)a4 error:(id)a5
{
  unint64_t v12 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  id v8 = a5;
  if (v8
    && dword_100641EA0 <= 60
    && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
  {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _serviceHandleUsername:password:error:]",  60LL,  "### Received credentials error: %@\n",  v8);
  }

  if (v12 | v7)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      uint64_t v9 = "yes";
      if (v12) {
        unsigned int v10 = "yes";
      }
      else {
        unsigned int v10 = "no";
      }
      if (!v7) {
        uint64_t v9 = "no";
      }
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _serviceHandleUsername:password:error:]",  30LL,  "Received username: %s, password: %s",  v10,  v9);
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
    [v11 handleUsername:v12 password:v7];
  }

  else if (dword_100641EA0 <= 30 {
         && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
  }
  {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _serviceHandleUsername:password:error:]",  30LL,  "Received no credentials to handle");
  }
}

- (BOOL)_serviceShouldRequestAutoFill
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v4 = [v3 isPasswordProximityAutoFillRequestingAllowed];

  if (self->_testingService) {
    return 1;
  }
  if (self->_prefRequestingEnabled) {
    unsigned int v6 = v4;
  }
  else {
    unsigned int v6 = 0;
  }
  return v6 == 1 && !self->_requestingServiceTimedOut && self->_autoFillContext;
}

- (void)_serviceStartRequestingAutoFillIfReady
{
  if (self->_siriRemoteMonitorState != 4)
  {
    id v3 = "Siri remote not yet ready for advertising commands\n";
LABEL_14:
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _serviceStartRequestingAutoFillIfReady]", 30LL, v3);
    return;
  }

  if (self->_requestingServiceState != 4)
  {
    id v3 = "Requesting service not yet ready for advertising commands\n";
    goto LABEL_14;
  }

  if (dword_100641EA0 <= 30 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _serviceStartRequestingAutoFillIfReady]",  30LL,  "Start requesting AutoFill\n");
  }
  -[SFRemoteAutoFillService startRequestingAutoFill](self->_requestingService, "startRequestingAutoFill");
  -[SFSiriRemoteMonitor advertiseNonConnectable:](self->_siriRemoteMonitor, "advertiseNonConnectable:", 1LL);
  -[SDAutoFillAgent _serviceTimeoutStart](self, "_serviceTimeoutStart");
}

- (void)_serviceStopRequestingAutoFill
{
}

- (void)_serviceTimeoutStart
{
  requestingServiceTimer = self->_requestingServiceTimer;
  if (requestingServiceTimer)
  {
    unsigned int v4 = requestingServiceTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_requestingServiceTimer;
    self->_requestingServiceTimer = 0LL;
  }

  self->_requestingServiceTimedOut = 0;
  unsigned int v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  unint64_t v7 = self->_requestingServiceTimer;
  self->_requestingServiceTimer = v6;

  id v8 = self->_requestingServiceTimer;
  dispatch_time_t v9 = dispatch_time(0LL, 3600000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  unsigned int v10 = self->_requestingServiceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10006D2C0;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v10, handler);
  dispatch_resume((dispatch_object_t)self->_requestingServiceTimer);
}

- (void)_serviceTimeoutStop
{
  requestingServiceTimer = self->_requestingServiceTimer;
  if (requestingServiceTimer)
  {
    unsigned int v4 = requestingServiceTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_requestingServiceTimer;
    self->_requestingServiceTimer = 0LL;
  }

  self->_requestingServiceTimedOut = 0;
}

- (void)_sessionStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _sessionStart:]", 30LL, "Granting session start\n");
    }

    int v5 = (SFDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));
    if (!v5)
    {
      int v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
      -[SFDevice setIdentifier:](v5, "setIdentifier:", v4);
    }

    grantingSession = self->_grantingSession;
    if (grantingSession) {
      -[SFRemoteAutoFillSession invalidate](grantingSession, "invalidate");
    }
    unint64_t v7 = objc_alloc_init(&OBJC_CLASS___SFRemoteAutoFillSession);
    id v8 = self->_grantingSession;
    self->_grantingSession = v7;

    -[SFRemoteAutoFillSession setDispatchQueue:](self->_grantingSession, "setDispatchQueue:", self->_dispatchQueue);
    -[SFRemoteAutoFillSession setPeerDevice:](self->_grantingSession, "setPeerDevice:", v5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10006D70C;
    v18[3] = &unk_1005CB3E8;
    v18[4] = self;
    -[SFRemoteAutoFillSession setCompletedHandler:](self->_grantingSession, "setCompletedHandler:", v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10006D718;
    v16[3] = &unk_1005CB480;
    v16[4] = self;
    id v17 = v4;
    -[SFRemoteAutoFillSession setPairingFinishedHandler:](self->_grantingSession, "setPairingFinishedHandler:", v16);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10006D82C;
    v15[3] = &unk_1005CC670;
    v15[4] = self;
    -[SFRemoteAutoFillSession setPromptForPickerHandler:](self->_grantingSession, "setPromptForPickerHandler:", v15);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006D958;
    v14[3] = &unk_1005CC698;
    v14[4] = self;
    -[SFRemoteAutoFillSession setPromptForPINHandler:](self->_grantingSession, "setPromptForPINHandler:", v14);
    -[SFRemoteAutoFillSession activate](self->_grantingSession, "activate");
LABEL_11:

    goto LABEL_12;
  }

  if (dword_100641EA0 <= 60 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    dispatch_time_t v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960591LL, 0LL, 0LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    int v5 = (SFDevice *)v10;
    unint64_t v11 = @"?";
    if (v10) {
      unint64_t v11 = (const __CFString *)v10;
    }
    id v20 = v11;
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  v12));
    LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _sessionStart:]", 60LL, "### Granting session start: %@\n", v13);

    goto LABEL_11;
  }

- (void)_sessionStop:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](self->_grantingSession, "peerDevice"));
    if (v5 && ([v4 code] == (id)-6723 || objc_msgSend(v4, "code") == (id)-71160))
    {
      -[SDAutoFillAgent _uiStop:](self, "_uiStop:", v5);
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      unsigned int v6 = self->_helpers;
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) clientDismissUserNotification];
          }

          id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
        }

        while (v8);
      }
    }

    if (dword_100641EA0 <= 60
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 60LL)))
    {
      LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _sessionStop:]",  60LL,  "### Session completed with error: %{error}\n",  v4);
    }
  }

  -[SFRemoteAutoFillSession invalidate](self->_grantingSession, "invalidate");
  grantingSession = self->_grantingSession;
  self->_grantingSession = 0LL;
}

- (void)_sessionHandlePairingSucceededResponse:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100641EA0 <= 30
    && ((v6 = v3, dword_100641EA0 != -1) || (v5 = _LogCategory_Initialize(&dword_100641EA0, 30LL), id v4 = v6, v5)))
  {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _sessionHandlePairingSucceededResponse:]",  30LL,  "Client handled pairing succeeded response: %@\n",  v4);
  }

  else
  {
  }

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4 = a3;
  if (dword_100641EA0 <= 50 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 50LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent proximityDeviceDidTrigger:]",  50LL,  "#ni_estimator autofill delegate triggered for device: %@",  v4);
  }
  int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_proximityDevices,  "objectForKeyedSubscript:",  v4));

  if (v5)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006DCEC;
    block[3] = &unk_1005CB480;
    block[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)testKeychain:(id)a3
{
  id v4 = a3;
  -[SDAutoFillAgent _ensureKeychainCleaned:](self, "_ensureKeychainCleaned:", 1LL);
}

- (void)testRemote:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (dword_100641EA0 <= 50)
  {
    if (dword_100641EA0 != -1 || (v5 = _LogCategory_Initialize(&dword_100641EA0, 50LL), id v4 = v10, v5))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent testRemote:]", 50LL, "Testing AutoFill Siri Remote (%@)\n", v4);
      id v4 = v10;
    }
  }

  if ([v4 isEqualToIgnoringCase:@"-advStart"])
  {
    siriRemoteMonitor = self->_siriRemoteMonitor;
    uint64_t v7 = 1LL;
  }

  else
  {
    if (![v10 isEqualToIgnoringCase:@"-advStop"])
    {
      if ([v10 isEqualToIgnoringCase:@"-advStartDebug"])
      {
        id v8 = self->_siriRemoteMonitor;
        uint64_t v9 = 1LL;
      }

      else
      {
        id v8 = self->_siriRemoteMonitor;
        uint64_t v9 = 0LL;
      }

      -[SFSiriRemoteMonitor advertiseNonConnectableDebug:](v8, "advertiseNonConnectableDebug:", v9);
      goto LABEL_15;
    }

    siriRemoteMonitor = self->_siriRemoteMonitor;
    uint64_t v7 = 0LL;
  }

  -[SFSiriRemoteMonitor advertiseNonConnectable:](siriRemoteMonitor, "advertiseNonConnectable:", v7);
LABEL_15:
}

- (void)testService:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100641EA0 <= 50)
  {
    if (dword_100641EA0 != -1 || (v5 = _LogCategory_Initialize(&dword_100641EA0, 50LL), id v4 = v7, v5))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent testService:]", 50LL, "Testing AutoFill Service (%@)\n", v4);
      id v4 = v7;
    }
  }

  if ([v4 isEqualToIgnoringCase:@"-start"])
  {
    BOOL v6 = 1;
LABEL_9:
    self->_testingService = v6;
    -[SDAutoFillAgent _update](self, "_update");
    goto LABEL_10;
  }

  if ([v7 isEqualToIgnoringCase:@"-stop"])
  {
    BOOL v6 = 0;
    goto LABEL_9;
  }

- (void)testUI:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  BOOL v6 = objc_alloc(&OBJC_CLASS___NSUUID);
  else {
    id v7 = @"00000000-0000-0000-0000-000000000001";
  }
  id v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v8);

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006E104;
  block[3] = &unk_1005CBC20;
  id v13 = v4;
  __int128 v14 = self;
  __int128 v15 = v5;
  id v10 = v5;
  id v11 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateUIDelayTimer
{
  if (!self->_uiDelayTimer)
  {
    if (dword_100641EA0 <= 30
      && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
    {
      LogPrintF(&dword_100641EA0, "-[SDAutoFillAgent _activateUIDelayTimer]", 30LL, "Activate UI delay timer\n");
    }

    id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    uiDelayTimer = self->_uiDelayTimer;
    self->_uiDelayTimer = v3;

    int v5 = self->_uiDelayTimer;
    dispatch_time_t v6 = dispatch_time(0LL, 500000000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    id v7 = self->_uiDelayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006E33C;
    handler[3] = &unk_1005CB2F8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    dispatch_resume((dispatch_object_t)self->_uiDelayTimer);
  }

- (void)_deactivateUIDelayTimer
{
  uiDelayTimer = self->_uiDelayTimer;
  if (uiDelayTimer)
  {
    id v4 = uiDelayTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_uiDelayTimer;
    self->_uiDelayTimer = 0LL;
  }

  self->_uiDelayActive = 0;
  uiDelayDevice = self->_uiDelayDevice;
  self->_uiDelayDevice = 0LL;
}

- (void)_uiStartIfNeeded:(id)a3 extraInfo:(id)a4
{
  id v21 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gSDProxCardsSuppressed
    || self->_preventNotifications
    || -[SDAutoFillAgent _uiShowing](self, "_uiShowing")
    || (-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) != 0)
  {
    goto LABEL_36;
  }

  if (self->_prefRequiresProx)
  {
    if (!-[NSMutableDictionary count](self->_proximityDevices, "count"))
    {
      if (dword_100641EA0 <= 10
        && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 10LL)))
      {
        LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]",  10LL,  "No proximity devices, un-triggering TV device %@\n",  v8);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_triggeredDevices, "removeObjectForKey:", v8);
      goto LABEL_36;
    }

    goto LABEL_15;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
  uint64_t v10 = SFDeviceToRPCompanionLinkDevice(v21, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (!v11)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SDAutoFillAgent _rpCompanionLinkDeviceForSFDevice:]( self,  "_rpCompanionLinkDeviceForSFDevice:",  v21));
    if (!v11)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue([v18 idsBluetoothDeviceIDsForSharing]);
      unsigned __int8 v20 = [v19 containsObject:v8];

      if ((v20 & 1) == 0) {
        goto LABEL_36;
      }
      goto LABEL_15;
    }
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeUserAltDSID]);
  id v13 = objc_alloc_init(off_100641F10());
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_primaryAppleAccount"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aa_altDSID"));
  if ([v15 isEqualToString:v12])
  {

LABEL_15:
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[SDNotificationManager activeTVAutoFillPrompts]( self->_notificationManager,  "activeTVAutoFillPrompts"));
    unsigned __int8 v17 = [v16 containsObject:v8];

    if ((v17 & 1) == 0)
    {
      if (self->_uiDelayActive)
      {
        if (dword_100641EA0 <= 30
          && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL)))
        {
          LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]",  30LL,  "UI delay timer active, deferring notification for %@",  v21);
        }

        objc_storeStrong((id *)&self->_uiDelayDevice, a3);
      }

      else
      {
        if (dword_100641EA0 <= 50
          && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 50LL)))
        {
          LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]",  50LL,  "Triggering ProximityAutoFill with %@",  v21);
        }

        -[SDAutoFillAgent _uiStart:extraInfo:](self, "_uiStart:extraInfo:", v21, v7);
      }
    }

    goto LABEL_36;
  }

  if (dword_100641EA0 <= 30 && (dword_100641EA0 != -1 || _LogCategory_Initialize(&dword_100641EA0, 30LL))) {
    LogPrintF( &dword_100641EA0,  "-[SDAutoFillAgent _uiStartIfNeeded:extraInfo:]",  30LL,  "### Active user profiles do not match \n");
  }

LABEL_36:
}

- (void)_uiStart:(id)a3 extraInfo:(id)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v5 = v6;
  if (v6)
  {
    -[SDNotificationManager tvAutoFillPostIfNeeded:](self->_notificationManager, "tvAutoFillPostIfNeeded:", v6);
    int v5 = v6;
  }
}

- (void)_uiStop:(id)a3
{
  id v4 = a3;
  grantingSession = self->_grantingSession;
  __int128 v14 = v4;
  if (!grantingSession)
  {
LABEL_8:
    -[SDNotificationManager tvAutoFillRemove:](self->_notificationManager, "tvAutoFillRemove:", v14);
    goto LABEL_9;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFRemoteAutoFillSession peerDevice](grantingSession, "peerDevice"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
  id v9 = v7;
  id v10 = v8;
  if (v9 != v10)
  {
    id v11 = v10;
    if ((v9 == 0LL) == (v10 != 0LL))
    {
    }

    else
    {
      unsigned __int8 v12 = [v9 isEqual:v10];

      id v13 = v14;
      if ((v12 & 1) != 0) {
        goto LABEL_10;
      }
    }

    goto LABEL_8;
  }

LABEL_9:
  id v13 = v14;
LABEL_10:
}

- (BOOL)_uiShowing
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager activeTVAutoFillPrompts](self->_notificationManager, "activeTVAutoFillPrompts"));
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
}

@end