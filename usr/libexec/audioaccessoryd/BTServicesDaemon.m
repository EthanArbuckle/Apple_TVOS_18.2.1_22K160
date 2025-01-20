@interface BTServicesDaemon
+ (id)sharedBTServicesDaemon;
- (BOOL)ignoreBTRestart;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BTServicesDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_cbConnectedDiscoveryEnsureStarted;
- (void)_cbConnectedDiscoveryEnsureStopped;
- (void)_fileRadar:(id)a3;
- (void)_fileRadarForFWCrash:(id)a3;
- (void)_fileRadarForHIDLag:(id)a3;
- (void)_prefsChanged;
- (void)_scheduleUpdate;
- (void)_shareAudioActionScannerDeviceFound:(id)a3;
- (void)_shareAudioActionScannerDeviceLost:(id)a3;
- (void)_shareAudioActionScannerEnsureStarted;
- (void)_shareAudioActionScannerEnsureStopped;
- (void)_shareAudioConnectedDeviceFound:(id)a3;
- (void)_shareAudioConnectedDeviceLost:(id)a3;
- (void)_shareAudioConnectedMonitorEnsureStarted;
- (void)_shareAudioConnectedMonitorEnsureStopped;
- (void)_shareAudioSessionEnded:(id)a3;
- (void)_shareAudioSessionProgressEvent:(int)a3 info:(id)a4;
- (void)_shareAudioSessionStartWithDarwinDevice:(id)a3 wxDevice:(id)a4;
- (void)_shareAudioShowConnectBanner:(id)a3;
- (void)_showConnectBannerIfEnabled:(id)a3;
- (void)_showHIDIntervalBannerIfEnabled:(id)a3;
- (void)_showHIDLagBannerIfEnabled:(id)a3;
- (void)_update;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setIgnoreBTRestart:(BOOL)a3;
- (void)showCrashBannerIfNeeded:(id)a3;
@end

@implementation BTServicesDaemon

+ (id)sharedBTServicesDaemon
{
  if (qword_1002372A8[0] != -1) {
    dispatch_once(qword_1002372A8, &stru_1002090A8);
  }
  return (id)qword_1002372A0;
}

- (BTServicesDaemon)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BTServicesDaemon;
  v2 = -[BTServicesDaemon init](&v9, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("BTServicesDaemon", v4);
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    *((_DWORD *)v2 + 2) = -1;
    *(void *)(v2 + 44) = -1LL;
    v7 = v2;
  }

  return (BTServicesDaemon *)v2;
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v85 = 0LL;
  v86 = &v85;
  uint64_t v87 = 0x3032000000LL;
  v88 = sub_10008A900;
  v89 = sub_10008A910;
  id v90 = 0LL;
  id obj = 0LL;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[BTIdentityDaemon sharedBTIdentityDaemon](&OBJC_CLASS___BTIdentityDaemon, "sharedBTIdentityDaemon"));
  uint64_t v6 = CUDescriptionWithLevel(v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  NSAppendPrintF(&obj, "%@", v7);
  objc_storeStrong(&v90, obj);

  v8 = (id *)(v86 + 5);
  id v83 = (id)v86[5];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
  uint64_t v10 = CUDescriptionWithLevel(v9, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  NSAppendPrintF(&v83, "%@", v11);
  objc_storeStrong(v8, v83);

  v12 = (id *)(v86 + 5);
  id v82 = (id)v86[5];
  NSAppendPrintF( &v82,  "-- BTShareAudioTV (trig %d)--\n",  -[NSMutableDictionary count](self->_shareAudioActionTriggeredDevices, "count"));
  objc_storeStrong(v12, v82);
  v13 = self->_shareAudioActionScanner;
  v14 = v13;
  if (v13)
  {
    v15 = (id *)(v86 + 5);
    id v81 = (id)v86[5];
    uint64_t v16 = CUDescriptionWithLevel(v13, v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    NSAppendPrintF(&v81, "%@\n", v17);
    objc_storeStrong(v15, v81);
  }

  shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_10008A918;
  v80[3] = &unk_100206A98;
  v80[4] = &v85;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( shareAudioActionTriggeredDevices,  "enumerateKeysAndObjectsUsingBlock:",  v80);
  v19 = self->_shareAudioConnectedDeviceMonitor;
  v20 = v19;
  if (v19)
  {
    v21 = (id *)(v86 + 5);
    id v79 = (id)v86[5];
    uint64_t v22 = CUDescriptionWithLevel(v19, v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    NSAppendPrintF(&v79, "%@\n", v23);
    objc_storeStrong(v21, v79);
  }

  v24 = self->_shareAudioActionUINoteSession;
  v25 = v24;
  if (v24)
  {
    v26 = (id *)(v86 + 5);
    id v78 = (id)v86[5];
    uint64_t v27 = CUDescriptionWithLevel(v24, v3);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    NSAppendPrintF(&v78, "%@\n", v28);
    objc_storeStrong(v26, v78);
  }

  v29 = (id *)(v86 + 5);
  id v77 = (id)v86[5];
  NSAppendPrintF(&v77, "\n");
  objc_storeStrong(v29, v77);
  id v30 = -[NSMutableSet count](self->_xpcConnections, "count");
  if (v30)
  {
    v31 = (id *)(v86 + 5);
    id v76 = (id)v86[5];
    NSAppendPrintF(&v76, "XPC Cnx: %d\n", (_DWORD)v30);
    objc_storeStrong(v31, v76);
  }

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  v61 = self->_xpcConnections;
  id v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v72,  v92,  16LL);
  if (v32)
  {
    uint64_t v33 = *(void *)v73;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v73 != v33) {
          objc_enumerationMutation(v61);
        }
        v35 = *(void **)(*((void *)&v72 + 1) + 8LL * (void)i);
        v36 = (id *)(v86 + 5);
        id v71 = (id)v86[5];
        v37 = (void *)objc_claimAutoreleasedReturnValue([v35 xpcCnx]);
        id v38 = [v37 processIdentifier];
        unsigned int v39 = [v35 entitled];
        v40 = "no";
        if (v39) {
          v40 = "yes";
        }
        NSAppendPrintF(&v71, "    %#{pid}, entitled %s", v38, v40);
        objc_storeStrong(v36, v71);

        uint64_t v41 = objc_claimAutoreleasedReturnValue([v35 audioSession]);
        v42 = (void *)v41;
        if (v41)
        {
          v43 = (id *)(v86 + 5);
          id v70 = (id)v86[5];
          NSAppendPrintF(&v70, ", %@", v41);
          objc_storeStrong(v43, v70);
        }

        uint64_t v44 = objc_claimAutoreleasedReturnValue([v35 shareAudioSession]);
        v45 = (void *)v44;
        if (v44)
        {
          v46 = (id *)(v86 + 5);
          id v69 = (id)v86[5];
          NSAppendPrintF(&v69, ", %@", v44);
          objc_storeStrong(v46, v69);
        }

        v47 = (id *)(v86 + 5);
        id v68 = (id)v86[5];
        NSAppendPrintF(&v68, "\n");
        objc_storeStrong(v47, v68);
      }

      id v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v72,  v92,  16LL);
    }

    while (v32);
  }

  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  v48 = (void *)CFPrefs_CopyKeys(@"com.apple.bluetooth", 0LL);
  id v49 = [v48 countByEnumeratingWithState:&v64 objects:v91 count:16];
  if (!v49) {
    goto LABEL_33;
  }
  int v50 = 0;
  uint64_t v51 = *(void *)v65;
  do
  {
    for (j = 0LL; j != v49; j = (char *)j + 1)
    {
      if (*(void *)v65 != v51) {
        objc_enumerationMutation(v48);
      }
      uint64_t v53 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)j);
      uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0)
      {
        v55 = (void *)CFPrefs_CopyTypedValue(@"com.apple.bluetooth", v53, 0LL, 0LL);
        v56 = (id *)(v86 + 5);
        id v63 = (id)v86[5];
        NSAppendPrintF(&v63, "Pref: '%@' = '%##@'\n", v53, v55);
        objc_storeStrong(v56, v63);

        ++v50;
      }
    }

    id v49 = [v48 countByEnumeratingWithState:&v64 objects:v91 count:16];
  }

  while (v49);

  if (v50 >= 1)
  {
    v57 = v86;
    id v62 = (id)v86[5];
    NSAppendPrintF(&v62, "\n");
    id v58 = v62;
    v48 = (void *)v57[5];
    v57[5] = (uint64_t)v58;
LABEL_33:
  }

  id v59 = (id)v86[5];
  _Block_object_dispose(&v85, 8);

  return v59;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008A9DC;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  v2 = self;
  if (!self->_xpcListener)
  {
    unsigned __int8 v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.BluetoothServices");
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v3;

    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_xpcListener, "_setQueue:", v2->_dispatchQueue);
    self = (BTServicesDaemon *)-[NSXPCListener resume](v2->_xpcListener, "resume");
  }

  if (v2->_prefsChangedNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10008AD74;
    handler[3] = &unk_100206308;
    handler[4] = v2;
    self = (BTServicesDaemon *)notify_register_dispatch( "com.apple.bluetooth.prefsChanged",  &v2->_prefsChangedNotifyToken,  dispatchQueue,  handler);
  }

  if (v2->_ignoreResetNotifyToken == -1)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      LogPrintF(&dword_100234918, "-[BTServicesDaemon _activate]", 30LL, "Register for Ignore BT Reset");
    }

    uint64_t v6 = (dispatch_queue_s *)v2->_dispatchQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10008ADE4;
    v15[3] = &unk_100206308;
    v15[4] = v2;
    self = (BTServicesDaemon *)notify_register_dispatch( "com.apple.bluetooth.ignoreReset",  &v2->_ignoreResetNotifyToken,  v6,  v15);
  }

  if (IsAppleInternalBuild(self) && v2->_audioQualityNotifyToken == -1)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      LogPrintF(&dword_100234918, "-[BTServicesDaemon _activate]", 30LL, "audioQuality register _audioQualityNotify");
    }

    notify_register_dispatch( "com.apple.bluetooth.audioQuality",  &v2->_audioQualityNotifyToken,  (dispatch_queue_t)v2->_dispatchQueue,  &stru_1002090E8);
  }

  if (!v2->_stateHandle)
  {
    v7 = v2->_dispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10008AEBC;
    v14[3] = &unk_1002066F8;
    v14[4] = v2;
    v2->_stateHandle = os_state_add_handler(v7, v14);
  }

  v8 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.ShareAudioNotifications");
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v8, "setWantsNotificationResponsesDelivered");
  -[BTServicesDaemon _prefsChanged](v2, "_prefsChanged");
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesDaemon _activate]",  30LL,  "Initializing CB Controller and registering for interrupt");
  }
  objc_super v9 = objc_alloc_init(&OBJC_CLASS___CBController);
  cbController = v2->_cbController;
  v2->_cbController = v9;

  -[CBController setDispatchQueue:](v2->_cbController, "setDispatchQueue:", v2->_dispatchQueue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10008AED8;
  v13[3] = &unk_100206058;
  v13[4] = v2;
  -[CBController setInterruptionHandler:](v2->_cbController, "setInterruptionHandler:", v13);
  v11 = v2->_cbController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10008AF64;
  v12[3] = &unk_100206080;
  v12[4] = v2;
  -[CBController activateWithCompletion:](v11, "activateWithCompletion:", v12);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008B054;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_prefsChanged
{
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"shaTV", &v29);
  BOOL v4 = Int64 != 0;
  if (v29)
  {
    uint64_t v5 = Int64;
    BOOL v4 = GestaltGetDeviceClass(Int64) - 1 < 3 || v5 != 0;
  }

  if (self->_prefShareAudioTV != v4)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      v7 = "yes";
      if (v4) {
        v8 = "no";
      }
      else {
        v8 = "yes";
      }
      if (!v4) {
        v7 = "no";
      }
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _prefsChanged]",  30LL,  "ShareAudioActionScanner: %s -> %s",  v8,  v7);
    }

    self->_prefShareAudioTV = v4;
  }

  uint64_t v9 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"disableConnectNotification", &v29);
  if (v29) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  BOOL v11 = !v10;
  if (self->_dontShowConnectBanner != v11)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      v12 = "yes";
      if (v11) {
        v13 = "no";
      }
      else {
        v13 = "yes";
      }
      if (!v11) {
        v12 = "no";
      }
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _prefsChanged]",  30LL,  "DisableConnectNotification: %s -> %s",  v13,  v12);
    }

    self->_dontShowConnectBanner = v11;
  }

  uint64_t v14 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"disableCrashNotification", &v29);
  if (v29) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v14 == 0;
  }
  BOOL v16 = !v15;
  if (self->_dontShowCrashBanner != v16)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      v17 = "yes";
      if (v16) {
        v18 = "no";
      }
      else {
        v18 = "yes";
      }
      if (!v16) {
        v17 = "no";
      }
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _prefsChanged]",  30LL,  "DisableCrashNotification: %s -> %s",  v18,  v17);
    }

    self->_dontShowCrashBanner = v16;
  }

  uint64_t v19 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"disableHIDLagNotification", &v29);
  if (v29) {
    BOOL v20 = 0;
  }
  else {
    BOOL v20 = v19 == 0;
  }
  BOOL v21 = !v20;
  if (self->_dontShowHIDLagBanner != v21)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      uint64_t v22 = "yes";
      if (v21) {
        v23 = "no";
      }
      else {
        v23 = "yes";
      }
      if (!v21) {
        uint64_t v22 = "no";
      }
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _prefsChanged]",  30LL,  "DisableHIDLagNotification: %s -> %s",  v23,  v22);
    }

    self->_dontShowHIDLagBanner = v21;
  }

  uint64_t v24 = CFPrefs_GetInt64(@"com.apple.bluetooth", @"enableHIDIntervalNotification", &v29);
  if (v29) {
    BOOL v25 = 1;
  }
  else {
    BOOL v25 = v24 == 0;
  }
  BOOL v26 = !v25;
  if (self->_doesShowHIDIntervalBanner != v26)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      uint64_t v27 = "yes";
      if (v26) {
        v28 = "no";
      }
      else {
        v28 = "yes";
      }
      if (!v26) {
        uint64_t v27 = "no";
      }
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _prefsChanged]",  30LL,  "EnableHIDIntervalNotification: %s -> %s",  v28,  v27);
    }

    self->_doesShowHIDIntervalBanner = v26;
  }

  -[BTServicesDaemon _scheduleUpdate](self, "_scheduleUpdate");
}

- (void)_scheduleUpdate
{
  if (!self->_updatePending)
  {
    self->_updatePending = 1;
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008B570;
    block[3] = &unk_100206058;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)_update
{
  self->_updatePending = 0;
  if (self->_dontShowConnectBanner) {
    -[BTServicesDaemon _cbConnectedDiscoveryEnsureStopped](self, "_cbConnectedDiscoveryEnsureStopped");
  }
  else {
    -[BTServicesDaemon _cbConnectedDiscoveryEnsureStarted](self, "_cbConnectedDiscoveryEnsureStarted");
  }
  if (self->_prefShareAudioTV) {
    -[BTServicesDaemon _shareAudioActionScannerEnsureStarted](self, "_shareAudioActionScannerEnsureStarted");
  }
  else {
    -[BTServicesDaemon _shareAudioActionScannerEnsureStopped](self, "_shareAudioActionScannerEnsureStopped");
  }
  if (self->_prefShareAudioTV) {
    -[BTServicesDaemon _shareAudioConnectedMonitorEnsureStarted](self, "_shareAudioConnectedMonitorEnsureStarted");
  }
  else {
    -[BTServicesDaemon _shareAudioConnectedMonitorEnsureStopped](self, "_shareAudioConnectedMonitorEnsureStopped");
  }
}

- (void)showCrashBannerIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  unint64_t v6 = UpTicksToSeconds(v5 - self->_showFirmwareCrashLastTicks);
  if (!self->_showFirmwareCrashLastTicks || (unint64_t v7 = v6, v6 >= 0x3C))
  {
    uint64_t v8 = mach_absolute_time();
    self->_showFirmwareCrashLastTicks = v8;
    if (IsAppleInternalBuild(v8) && !self->_dontShowCrashBanner)
    {
      if (self->_uiNoteSession)
      {
        if (dword_100234918 <= 30
          && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
        {
          LogPrintF( &dword_100234918,  "-[BTServicesDaemon showCrashBannerIfNeeded:]",  30LL,  "Diag: Removing old crash banner");
        }

        -[CUUserNotificationSession removeAllActions](self->_uiNoteSession, "removeAllActions");
        -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"_input"]);
      unsigned int v10 = [v9 isEqual:@"HostCrashed"];

      if (v10) {
        BOOL v11 = @"Bluetooth host has crashed";
      }
      else {
        BOOL v11 = @"Bluetooth firmware has crashed";
      }
      if (dword_100234918 <= 30
        && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
      {
        LogPrintF( &dword_100234918,  "-[BTServicesDaemon showCrashBannerIfNeeded:]",  30LL,  "Diag: Bluetooth crash banner");
      }

      v12 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
      uiNoteSession = self->_uiNoteSession;
      self->_uiNoteSession = v12;
      uint64_t v14 = v12;

      -[CUUserNotificationSession setBundleID:](v14, "setBundleID:", @"com.apple.BTUserNotifications");
      -[CUUserNotificationSession setCategoryID:](v14, "setCategoryID:", @"BTUserNotifications");
      -[CUUserNotificationSession setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
      -[CUUserNotificationSession setIconName:](v14, "setIconName:", @"Bluetooth.icns");
      -[CUUserNotificationSession setTitleKey:](v14, "setTitleKey:", v11);
      -[CUUserNotificationSession setBodyKey:](v14, "setBodyKey:", @"Please file a radar");
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10008B964;
      v19[3] = &unk_100209110;
      v19[4] = v14;
      -[CUUserNotificationSession setActionHandler:](v14, "setActionHandler:", v19);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10008BA18;
      v17[3] = &unk_100206490;
      v17[4] = v14;
      v17[5] = self;
      id v18 = v4;
      -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]( v14,  "addActionWithIdentifier:title:flags:handler:",  @"FileRadarAction",  @"File Radar",  0LL,  v17);
      -[CUUserNotificationSession activate](v14, "activate");
    }

    goto LABEL_25;
  }

  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesDaemon showCrashBannerIfNeeded:]",  30LL,  "Diag: Bluetooth firmware crash banner not shown due to throttle");
  }
  if (v7 >= 0xA)
  {
LABEL_25:
    BOOL v20 = @"CrashType";
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"_input", TypeID, 0LL);
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &TypedValue,  &v20,  1LL));
    CUMetricsLog(@"com.apple.Bluetooth.Crashes", v16);
  }
}

- (void)_fileRadarForFWCrash:(id)a3
{
  id v4 = a3;
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesDaemon _fileRadarForFWCrash:]",  30LL,  "Diag: Bluetooth firmware crash - File Radar");
  }
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, @"FWErrorType", TypeID, 0LL);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  uint64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Bluetooth Crashed: %@",  v7);
  v10[0] = @"Classification";
  v10[1] = @"ComponentID";
  v11[0] = @"Crash/Hang/Data Loss";
  v11[1] = @"161045";
  v10[2] = @"ComponentName";
  v10[3] = @"ComponentVersion";
  v11[2] = @"Bluetooth (New Bugs)";
  v11[3] = @"macOS";
  v10[4] = @"ExtensionIdentifiers";
  v10[5] = @"Reproducibility";
  v11[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v11[5] = @"I Didn't Try";
  v10[6] = @"Title";
  v11[6] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  7LL));
  -[BTServicesDaemon _fileRadar:](self, "_fileRadar:", v9);
}

- (void)_fileRadarForHIDLag:(id)a3
{
  id v4 = a3;
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesDaemon _fileRadarForHIDLag:]",  30LL,  "Diag: Bluetooth HID Lag Detected - File Radar");
  }
  uint64_t v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Bluetooth HID Lag Detected");
  v7[0] = @"Classification";
  v7[1] = @"ComponentID";
  v8[0] = @"Crash/Hang/Data Loss";
  v8[1] = @"183565";
  v7[2] = @"ComponentName";
  v7[3] = @"ComponentVersion";
  v8[2] = @"CoreBluetooth - HID Lag";
  v8[3] = @"macOS";
  v7[4] = @"ExtensionIdentifiers";
  v7[5] = @"Reproducibility";
  v8[4] = @"com.apple.DiagnosticExtensions.Bluetooth";
  v8[5] = @"I Didn't Try";
  v7[6] = @"Title";
  v8[6] = v5;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  7LL));
  -[BTServicesDaemon _fileRadar:](self, "_fileRadar:", v6);
}

- (void)_fileRadar:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v10,  v11));
        [v4 addObject:v12];
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithString:]( &OBJC_CLASS___NSURLComponents,  "componentsWithString:",  @"rdar://new"));
  [v13 setQueryItems:v4];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 URL]);
  [v14 openURL:v15 configuration:0 completionHandler:0];
}

- (void)_showConnectBannerIfEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  unint64_t v6 = UpTicksToSeconds(v5 - self->_showConnectBannerLastTicks);
  if (self->_showConnectBannerLastTicks) {
    BOOL v7 = v6 >= 0xA;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = mach_absolute_time();
    self->_showConnectBannerLastTicks = v8;
    if (IsAppleInternalBuild(v8))
    {
      if (!self->_dontShowConnectBanner)
      {
        uint64_t v9 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue([v4 name]);
        if (!-[NSDateFormatter length](v9, "length"))
        {
LABEL_21:

          goto LABEL_22;
        }

        unsigned int v10 = [v4 connectedServices];

        if (v10 && ([v4 connectedServices] & 0x1000000) == 0)
        {
          if (dword_100234918 <= 30
            && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
          {
            LogPrintF( &dword_100234918,  "-[BTServicesDaemon _showConnectBannerIfEnabled:]",  30,  "Diag: Show Connect Banner %d",  [v4 connectedServices]);
          }

          uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
          -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", @"hh:mm:ss a");
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v9, "stringFromDate:", v11));

          v13 = (void *)objc_claimAutoreleasedReturnValue([v4 btAddressData]);
          uint64_t v14 = CUPrintNSDataAddress(v13);
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", (char *)objc_msgSend(v15, "length") - 5));
          if (([v4 connectedServices] & 0x400000) != 0)
          {
            __int128 v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"LE Connection at %@",  v12);
          }

          else if (([v4 connectedServices] & 0x800000) != 0)
          {
            __int128 v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Classic Connection at %@",  v12);
          }

          else
          {
            __int128 v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Connected at %@",  v12);
          }

          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          __int128 v19 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
          -[CUUserNotificationSession setBundleID:](v19, "setBundleID:", @"com.apple.BTUserNotifications");
          -[CUUserNotificationSession setCategoryID:](v19, "setCategoryID:", @"BTUserNotifications");
          -[CUUserNotificationSession setDispatchQueue:](v19, "setDispatchQueue:", self->_dispatchQueue);
          -[CUUserNotificationSession setIconName:](v19, "setIconName:", @"Bluetooth.icns");
          BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@%@",  v20,  @" ("),  v16,  @""));
          -[CUUserNotificationSession setTitleKey:](v19, "setTitleKey:", v21);

          -[CUUserNotificationSession setSubtitleKey:](v19, "setSubtitleKey:", v18);
          -[CUUserNotificationSession activate](v19, "activate");
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_10008C258;
          v22[3] = &unk_100209110;
          v22[4] = v19;
          -[CUUserNotificationSession setActionHandler:](v19, "setActionHandler:", v22);

          goto LABEL_21;
        }
      }
    }
  }

- (void)_showHIDLagBannerIfEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  unint64_t v6 = UpTicksToSeconds(v5 - self->_showHIDLagBannerLastTicks);
  if (self->_showHIDLagBannerLastTicks && v6 < 0x3C)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _showHIDLagBannerIfEnabled:]",  30LL,  "Diag: Bluetooth HID lag banner not shown due to throttle");
    }
  }

  else
  {
    uint64_t v7 = mach_absolute_time();
    self->_showHIDLagBannerLastTicks = v7;
    if (IsAppleInternalBuild(v7) && !self->_dontShowHIDLagBanner)
    {
      if (self->_uiNoteSession)
      {
        if (dword_100234918 <= 30
          && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
        {
          LogPrintF( &dword_100234918,  "-[BTServicesDaemon _showHIDLagBannerIfEnabled:]",  30LL,  "Diag: Removing old HID Lag banner");
        }

        -[CUUserNotificationSession removeAllActions](self->_uiNoteSession, "removeAllActions");
        -[CUUserNotificationSession invalidate](self->_uiNoteSession, "invalidate");
      }

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"_input"]);
      unsigned int v9 = [v8 isEqual:@"HIDLagDetected"];

      if (v9) {
        unsigned int v10 = @"Bluetooth HID Lag Detected";
      }
      else {
        unsigned int v10 = @"Bluetooth HID Lag detected";
      }
      if (dword_100234918 <= 30
        && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
      {
        LogPrintF( &dword_100234918,  "-[BTServicesDaemon _showHIDLagBannerIfEnabled:]",  30LL,  "Diag: Bluetooth HID Lag Detected");
      }

      BOOL v11 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
      uiNoteSession = self->_uiNoteSession;
      self->_uiNoteSession = v11;
      v13 = v11;

      -[CUUserNotificationSession setBundleID:](v13, "setBundleID:", @"com.apple.BTUserNotifications");
      -[CUUserNotificationSession setCategoryID:](v13, "setCategoryID:", @"BTUserNotifications");
      -[CUUserNotificationSession setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
      -[CUUserNotificationSession setIconName:](v13, "setIconName:", @"Bluetooth.icns");
      -[CUUserNotificationSession setTitleKey:](v13, "setTitleKey:", v10);
      -[CUUserNotificationSession setBodyKey:](v13, "setBodyKey:", @"Please file a radar");
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10008C5EC;
      v21[3] = &unk_100209110;
      v21[4] = v13;
      -[CUUserNotificationSession setActionHandler:](v13, "setActionHandler:", v21);
      uint64_t v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472LL;
      __int128 v16 = sub_10008C6A0;
      __int128 v17 = &unk_100206490;
      __int128 v18 = v13;
      __int128 v19 = self;
      id v20 = v4;
      -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]( v13,  "addActionWithIdentifier:title:flags:handler:",  @"FileRadarAction",  @"File Radar",  0LL,  &v14);
      -[CUUserNotificationSession activate](v13, "activate", v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_showHIDIntervalBannerIfEnabled:(id)a3
{
  id v9 = a3;
  if (IsAppleInternalBuild(v9) && self->_doesShowHIDIntervalBanner)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _showHIDIntervalBannerIfEnabled:]",  30LL,  "Diag: Show HID Interval Banner");
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"DeviceName"]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Intervalms"]);
    [v5 doubleValue];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is %.2f ms",  v4,  v6));
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
    -[CUUserNotificationSession setBundleID:](v8, "setBundleID:", @"com.apple.BTUserNotifications");
    -[CUUserNotificationSession setCategoryID:](v8, "setCategoryID:", @"BTUserNotifications");
    -[CUUserNotificationSession setFlags:](v8, "setFlags:", 8LL);
    -[CUUserNotificationSession setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
    -[CUUserNotificationSession setIconName:](v8, "setIconName:", @"Bluetooth.icns");
    -[CUUserNotificationSession setTimeoutSeconds:](v8, "setTimeoutSeconds:", 5.0);
    -[CUUserNotificationSession setTitleKey:](v8, "setTitleKey:", @"Update HID interval");
    -[CUUserNotificationSession setSubtitleKey:](v8, "setSubtitleKey:", v7);
    -[CUUserNotificationSession activate](v8, "activate");
  }
}

- (void)_cbConnectedDiscoveryEnsureStarted
{
  if (!self->_cbConnectedDiscovery)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _cbConnectedDiscoveryEnsureStarted]",  30LL,  "CB Connected Discovery monitor start");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CBDiscovery);
    cbConnectedDiscovery = self->_cbConnectedDiscovery;
    self->_cbConnectedDiscovery = v3;

    -[CBDiscovery setDispatchQueue:](self->_cbConnectedDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[CBDiscovery setDiscoveryFlags:]( self->_cbConnectedDiscovery,  "setDiscoveryFlags:",  (unint64_t)-[CBDiscovery discoveryFlags](self->_cbConnectedDiscovery, "discoveryFlags") | 0x200000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008C980;
    v7[3] = &unk_100206E70;
    v7[4] = self;
    -[CBDiscovery setDeviceFoundHandler:](self->_cbConnectedDiscovery, "setDeviceFoundHandler:", v7);
    uint64_t v5 = self->_cbConnectedDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10008C98C;
    v6[3] = &unk_100206080;
    v6[4] = self;
    -[CBDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_cbConnectedDiscoveryEnsureStopped
{
  if (self->_cbConnectedDiscovery)
  {
    if (dword_100234918 <= 30
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _cbConnectedDiscoveryEnsureStopped]",  30LL,  "CB Connected Discovery monitor stop");
    }

    -[CBDiscovery invalidate](self->_cbConnectedDiscovery, "invalidate");
    cbConnectedDiscovery = self->_cbConnectedDiscovery;
    self->_cbConnectedDiscovery = 0LL;
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___BTServicesXPCConnection);
  -[BTServicesXPCConnection setDaemon:](v6, "setDaemon:", self);
  -[BTServicesXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[BTServicesXPCConnection setXpcCnx:](v6, "setXpcCnx:", v5);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___BTServicesXPCClientInterface));
  BOOL v21 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSError);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNull);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
  __int128 v17 = -[NSSet initWithObjects:]( v21,  "initWithObjects:",  v20,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
  [v22 setClasses:v17 forSelector:"shareAudioProgressEvent:info:" argumentIndex:1 ofReply:0];
  [v5 _setQueue:self->_dispatchQueue];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___BTServicesXPCDaemonInterface));
  [v5 setExportedInterface:v18];

  [v5 setExportedObject:v6];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10008CD64;
  v23[3] = &unk_100206358;
  v23[4] = self;
  v23[5] = v6;
  [v5 setInvalidationHandler:v23];
  [v5 setRemoteObjectInterface:v22];
  [v5 resume];
  if (dword_100234918 <= 20 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 20LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started: %#{pid}",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100234918 <= 20)
  {
    if (dword_100234918 != -1 || (int v6 = _LogCategory_Initialize(&dword_100234918, 20LL), v4 = v7, v6))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 xpcCnx]);
      LogPrintF( &dword_100234918,  "-[BTServicesDaemon _xpcConnectionInvalidated:]",  20,  "XPC connection ended: %#{pid}",  [v5 processIdentifier]);

      id v4 = v7;
    }
  }

  [v4 xpcConnectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
}

- (void)_shareAudioActionScannerEnsureStarted
{
  p_shareAudioActionScanner = &self->_shareAudioActionScanner;
  if (!self->_shareAudioActionScanner)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
    objc_storeStrong((id *)p_shareAudioActionScanner, v4);
    -[SFDeviceDiscovery setChangeFlags:](v4, "setChangeFlags:", 5LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](v4, "setDiscoveryFlags:", 16LL);
    -[SFDeviceDiscovery setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setPurpose:](v4, "setPurpose:", @"ShareAudio");
    -[SFDeviceDiscovery setRssiThreshold:](v4, "setRssiThreshold:", -70LL);
    -[SFDeviceDiscovery setScanRate:](v4, "setScanRate:", 20LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10008CFE8;
    v8[3] = &unk_100206FF8;
    v8[4] = self;
    v8[5] = v4;
    -[SFDeviceDiscovery setDeviceFoundHandler:](v4, "setDeviceFoundHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008D00C;
    v7[3] = &unk_100206FF8;
    v7[4] = self;
    void v7[5] = v4;
    -[SFDeviceDiscovery setDeviceLostHandler:](v4, "setDeviceLostHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10008D030;
    v6[3] = &unk_100207020;
    v6[4] = self;
    void v6[5] = v4;
    -[SFDeviceDiscovery setDeviceChangedHandler:](v4, "setDeviceChangedHandler:", v6);
    if (dword_100234A48 <= 30
      && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
    {
      LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerEnsureStarted]",  30LL,  "Action scanner start");
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10008D054;
    v5[3] = &unk_100206380;
    v5[4] = self;
    v5[5] = v4;
    -[SFDeviceDiscovery activateWithCompletion:](v4, "activateWithCompletion:", v5);
  }

- (void)_shareAudioActionScannerEnsureStopped
{
  if (self->_shareAudioActionScanner)
  {
    if (dword_100234A48 <= 30
      && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
    {
      LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerEnsureStopped]",  30LL,  "Action scanner stop");
    }

    -[SFDeviceDiscovery invalidate](self->_shareAudioActionScanner, "invalidate");
    shareAudioActionScanner = self->_shareAudioActionScanner;
    self->_shareAudioActionScanner = 0LL;
  }

- (void)_shareAudioActionScannerDeviceFound:(id)a3
{
  id v16 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    if ([v16 deviceActionType] == 31)
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v16 bleDevice]);
      if (self->_shareAudioActionUINoteSession)
      {
        if (dword_100234A48 <= 10
          && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 10LL)))
        {
          LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]",  10LL,  "Action scanner ignoring: already prompted, %@",  v6);
        }
      }

      else if (self->_shareAudioSession)
      {
        if (dword_100234A48 <= 10
          && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 10LL)))
        {
          LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]",  10LL,  "Action scanner ignoring: already in-progress, %@",  v6);
        }
      }

      else
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shareAudioActionTriggeredDevices,  "objectForKeyedSubscript:",  v5));

        if (v7)
        {
          if (dword_100234A48 <= 10
            && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 10LL)))
          {
            LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]",  10LL,  "Action scanner ignoring: triggered, %@",  v6);
          }
        }

        else
        {
          uint64_t v8 = (uint64_t)[v6 smoothedRSSI];
          if (v8 <= -71)
          {
            if (dword_100234A48 <= 10)
            {
              uint64_t v15 = v8;
              if (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 10LL)) {
                LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]",  10LL,  "Action scanner ignoring: weak RSSI %d, %@",  v15,  v6);
              }
            }
          }

          else if ((-[CUBluetoothClient statusFlags]( self->_shareAudioConnectedDeviceMonitor,  "statusFlags") & 8) != 0)
          {
            if (dword_100234A48 <= 30
              && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
            {
              LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]",  30LL,  "Action scanner triggering connect banner: %@",  v6);
            }

            shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
            id v10 = v16;
            if (!shareAudioActionTriggeredDevices)
            {
              uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              uint64_t v12 = self->_shareAudioActionTriggeredDevices;
              self->_shareAudioActionTriggeredDevices = v11;

              id v10 = v16;
              shareAudioActionTriggeredDevices = self->_shareAudioActionTriggeredDevices;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( shareAudioActionTriggeredDevices,  "setObject:forKeyedSubscript:",  v10,  v5);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_shareAudioConnectedDeviceMap, "allValues"));
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

            if (v14 && ([v16 deviceFlags] & 8) != 0) {
              -[BTServicesDaemon _shareAudioSessionStartWithDarwinDevice:wxDevice:]( self,  "_shareAudioSessionStartWithDarwinDevice:wxDevice:",  v16,  v14);
            }
            else {
              -[BTServicesDaemon _shareAudioShowConnectBanner:](self, "_shareAudioShowConnectBanner:", v16);
            }
          }

          else if (dword_100234A48 <= 10 {
                 && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 10LL)))
          }
          {
            LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceFound:]",  10LL,  "Action scanner ignoring: no self ShareAudio, %@",  v6);
          }
        }
      }
    }

    else
    {
      -[BTServicesDaemon _shareAudioActionScannerDeviceLost:](self, "_shareAudioActionScannerDeviceLost:", v16);
    }
  }
}

- (void)_shareAudioActionScannerDeviceLost:(id)a3
{
  id v12 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shareAudioActionTriggeredDevices,  "objectForKeyedSubscript:",  v5));

    if (v6)
    {
      if (dword_100234A48 <= 30
        && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 bleDevice]);
        LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceLost:]",  30LL,  "Action scanner lost: %@",  v7);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_shareAudioActionTriggeredDevices,  "setObject:forKeyedSubscript:",  0LL,  v5);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](self->_shareAudioActionUINoteSession, "identifier"));
    unsigned int v9 = [v8 isEqual:v5];

    if (v9)
    {
      if (dword_100234A48 <= 30
        && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 bleDevice]);
        LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioActionScannerDeviceLost:]",  30LL,  "Action scanner canceling banner: lost, %@",  v10);
      }

      -[CUUserNotificationSession invalidate](self->_shareAudioActionUINoteSession, "invalidate");
      shareAudioActionUINoteSession = self->_shareAudioActionUINoteSession;
      self->_shareAudioActionUINoteSession = 0LL;
    }
  }
}

- (void)_shareAudioConnectedMonitorEnsureStarted
{
  if (!self->_shareAudioConnectedDeviceMonitor)
  {
    if (dword_100234A48 <= 30
      && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
    {
      LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioConnectedMonitorEnsureStarted]",  30LL,  "Connected monitor start");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUBluetoothClient);
    shareAudioConnectedDeviceMonitor = self->_shareAudioConnectedDeviceMonitor;
    self->_shareAudioConnectedDeviceMonitor = v3;
    id v5 = v3;

    -[CUBluetoothClient setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBluetoothClient setFlags:](v5, "setFlags:", 24LL);
    -[CUBluetoothClient setLabel:](v5, "setLabel:", @"ShareAudio");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008D7C0;
    v7[3] = &unk_100209138;
    v7[4] = v5;
    void v7[5] = self;
    -[CUBluetoothClient setDeviceConnectedHandler:](v5, "setDeviceConnectedHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10008D7DC;
    v6[3] = &unk_100209138;
    v6[4] = v5;
    void v6[5] = self;
    -[CUBluetoothClient setDeviceDisconnectedHandler:](v5, "setDeviceDisconnectedHandler:", v6);
    -[CUBluetoothClient activate](v5, "activate");
  }

- (void)_shareAudioConnectedMonitorEnsureStopped
{
  if (self->_shareAudioConnectedDeviceMonitor)
  {
    if (dword_100234A48 <= 30
      && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
    {
      LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioConnectedMonitorEnsureStopped]",  30LL,  "Connected monitor start");
    }

    -[CUBluetoothClient invalidate](self->_shareAudioConnectedDeviceMonitor, "invalidate");
    shareAudioConnectedDeviceMonitor = self->_shareAudioConnectedDeviceMonitor;
    self->_shareAudioConnectedDeviceMonitor = 0LL;
  }

- (void)_shareAudioConnectedDeviceFound:(id)a3
{
  id v11 = a3;
  unsigned __int8 v4 = [v11 deviceFlags];
  id v5 = v11;
  if ((v4 & 1) != 0)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    if (v7)
    {
      if (dword_100234A48 <= 30
        && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
      {
        LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioConnectedDeviceFound:]",  30LL,  "Connected device: %@",  v11);
      }

      shareAudioConnectedDeviceMap = self->_shareAudioConnectedDeviceMap;
      if (!shareAudioConnectedDeviceMap)
      {
        unsigned int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v10 = self->_shareAudioConnectedDeviceMap;
        self->_shareAudioConnectedDeviceMap = v9;

        shareAudioConnectedDeviceMap = self->_shareAudioConnectedDeviceMap;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( shareAudioConnectedDeviceMap,  "setObject:forKeyedSubscript:",  v11,  v7);
    }

    id v5 = v11;
  }
}

- (void)_shareAudioConnectedDeviceLost:(id)a3
{
  id v7 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  if (v5)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shareAudioConnectedDeviceMap,  "objectForKeyedSubscript:",  v5));

    if (v6)
    {
      if (dword_100234A48 <= 30
        && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
      {
        LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioConnectedDeviceLost:]",  30LL,  "Disconnected device: %@",  v7);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_shareAudioConnectedDeviceMap,  "setObject:forKeyedSubscript:",  0LL,  v5);
    }
  }
}

- (void)_shareAudioShowConnectBanner:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_shareAudioConnectedDeviceMap, "allValues"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    if (![v7 length])
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/UserNotifications/Bundles/com.apple.ShareAudioNotifications.bundle"));
      uint64_t v9 = CULocalizedStringEx(v8, @"Localizable", @"APPLETV");
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

      id v7 = (void *)v10;
    }

    id v11 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
    shareAudioActionUINoteSession = self->_shareAudioActionUINoteSession;
    self->_shareAudioActionUINoteSession = v11;
    uint64_t v13 = v11;

    -[CUUserNotificationSession setBundleID:](v13, "setBundleID:", @"com.apple.ShareAudioNotifications");
    -[CUUserNotificationSession setCategoryID:](v13, "setCategoryID:", @"ShareAudioCategoryID");
    -[CUUserNotificationSession setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
    -[CUUserNotificationSession setFlags:](v13, "setFlags:", 9LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    -[CUUserNotificationSession setIdentifier:](v13, "setIdentifier:", v15);

    -[CUUserNotificationSession setLabel:](v13, "setLabel:", @"ShareAudio");
    -[CUUserNotificationSession setTitleKey:](v13, "setTitleKey:", v7);
    -[CUUserNotificationSession setBodyKey:](v13, "setBodyKey:", @"SHARE_AUDIO_BODY_FORMAT");
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 name]);
    __int128 v17 = (void *)v16;
    __int128 v18 = @"?";
    if (v16) {
      __int128 v18 = (const __CFString *)v16;
    }
    int v29 = v18;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    -[CUUserNotificationSession setBodyArguments:](v13, "setBodyArguments:", v19);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10008DD64;
    v28[3] = &unk_100206770;
    v28[4] = v13;
    v28[5] = self;
    -[CUUserNotificationSession setActionHandler:](v13, "setActionHandler:", v28);
    uint64_t v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    uint64_t v22 = sub_10008DE3C;
    v23 = &unk_100209160;
    uint64_t v24 = v13;
    BOOL v25 = self;
    id v26 = v4;
    id v27 = v6;
    -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]( v13,  "addActionWithIdentifier:title:flags:handler:",  @"ShareAudioActionIDConnect",  @"SHARE_AUDIO_BUTTON",  0LL,  &v20);
    -[CUUserNotificationSession activate](v13, "activate", v20, v21, v22, v23, v24, v25);
  }

  else if (dword_100234A48 <= 30 {
         && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
  }
  {
    LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioShowConnectBanner:]",  30LL,  "No connected ShareAudio device");
  }
}

- (void)_shareAudioSessionStartWithDarwinDevice:(id)a3 wxDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_shareAudioSession)
  {
    if (dword_100234A48 <= 30
      && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL)))
    {
      LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioSessionStartWithDarwinDevice:wxDevice:]",  30LL,  "Aborting previous session to start new one: %@",  v6);
    }

    -[BTShareAudioSessionDaemon invalidate](self->_shareAudioSession, "invalidate");
  }

  if (dword_100234A48 <= 30 && (dword_100234A48 != -1 || _LogCategory_Initialize(&dword_100234A48, 30LL))) {
    LogPrintF( &dword_100234A48,  "-[BTServicesDaemon _shareAudioSessionStartWithDarwinDevice:wxDevice:]",  30LL,  "Session start: Darwin %@, Wx %@",  v6,  v7);
  }
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___BTShareAudioSessionDaemon);
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = v8;
  uint64_t v10 = v8;

  -[BTShareAudioSessionDaemon setDarwinDevice:](v10, "setDarwinDevice:", v6);
  -[BTShareAudioSessionDaemon setDispatchQueue:](v10, "setDispatchQueue:", self->_dispatchQueue);
  -[BTShareAudioSessionDaemon setMode:](v10, "setMode:", 1LL);
  -[BTShareAudioSessionDaemon setWxDevice:](v10, "setWxDevice:", v7);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10008E080;
  v11[3] = &unk_100209188;
  v11[4] = v10;
  v11[5] = self;
  -[BTShareAudioSessionDaemon setProgressHandler:](v10, "setProgressHandler:", v11);
  -[BTShareAudioSessionDaemon activate](v10, "activate");
}

- (void)_shareAudioSessionEnded:(id)a3
{
  id v5 = a3;
  -[BTShareAudioSessionDaemon invalidate](self->_shareAudioSession, "invalidate");
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0LL;
}

- (void)_shareAudioSessionProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v13 = (__CFString *)a4;
  if (a3 > 119)
  {
    if (a3 <= 219)
    {
      switch(a3)
      {
        case 120:
          id v6 = "ShowPairInstructions";
          goto LABEL_39;
        case 200:
          id v6 = "GuestiOSConnecting";
          goto LABEL_39;
        case 210:
          id v6 = "GuestiOSAuthenticated";
          goto LABEL_39;
      }
    }

    else if (a3 > 309)
    {
      if (a3 == 310)
      {
        id v6 = "GuestHeadphonesConnected";
        goto LABEL_39;
      }

      if (a3 == 320)
      {
        id v6 = "GuestHeadphonesWaitForRoute";
        goto LABEL_39;
      }
    }

    else
    {
      if (a3 == 220)
      {
        id v6 = "GuestiOSWaitingForAccept";
        goto LABEL_39;
      }

      if (a3 == 300)
      {
        id v6 = "GuestHeadphonesConnecting";
        goto LABEL_39;
      }
    }

- (BOOL)ignoreBTRestart
{
  return self->_ignoreBTRestart;
}

- (void)setIgnoreBTRestart:(BOOL)a3
{
  self->_ignoreBTRestart = a3;
}

- (void).cxx_destruct
{
}

@end