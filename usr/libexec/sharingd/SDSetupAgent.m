@interface SDSetupAgent
+ (SDSetupAgent)sharedSetupAgent;
- (BOOL)_deviceHandlesDovePeaceSetup;
- (BOOL)_screenLocked;
- (BOOL)_shouldOfferPassword:(id)a3;
- (BOOL)_uiShowing;
- (BOOL)_useSymptomsReport;
- (BOOL)preventRepair;
- (BOOL)reenableProxCardType:(unsigned __int8)a3;
- (OS_dispatch_queue)dispatchQueue;
- (SDSetupAgent)init;
- (id)_watchMigrating:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)extractParameter:(id)a3 inString:(id)a4;
- (unint64_t)problemFlags;
- (void)_activate;
- (void)_appleAccountSignIn:(id)a3;
- (void)_deviceFound:(id)a3;
- (void)_deviceLost:(id)a3;
- (void)_ensureClientStarted;
- (void)_ensureClientStopped;
- (void)_ensureServerStarted;
- (void)_ensureServerStopped;
- (void)_fetchSymptomsReport;
- (void)_iTunesAccountsChanged;
- (void)_invalidate;
- (void)_launchAppWithMachServiceName:(id)a3;
- (void)_openSetupURL:(id)a3;
- (void)_pinPairHandleHidePIN;
- (void)_pinPairHandleRequest:(id)a3;
- (void)_pinPairHandleShowPIN:(id)a3;
- (void)_postDeviceSetupNotificationForDevice:(id)a3 present:(BOOL)a4;
- (void)_primaryAccountChanged;
- (void)_pwsHandleProgressEvent:(unsigned int)a3 info:(id)a4;
- (void)_pwsHandleUserResponse:(int)a3 device:(id)a4 info:(id)a5;
- (void)_renewAccountIfNecessaryForCFUItems:(id)a3 completion:(id)a4;
- (void)_repairEnsuredStarted;
- (void)_repairEnsuredStopped;
- (void)_repairHandleCFUItems:(id)a3;
- (void)_repairHandleCFUItemsChanged;
- (void)_repairHandleCNSStateChanged;
- (void)_repairHandleCompletion;
- (void)_repairHandleManateeChanged;
- (void)_repairProblemCheck;
- (void)_repairProblemFlagsChanged;
- (void)_repairSilentProgress:(unsigned int)a3 info:(id)a4;
- (void)_repairSilentStart:(id)a3;
- (void)_repairUpdateIDSCache;
- (void)_repairVPNError:(id)a3;
- (void)_resetTriggers;
- (void)_scanTimerFired;
- (void)_screenStateChanged;
- (void)_uiLockStatusChanged;
- (void)_uiStartAppleTVSetup:(id)a3 extraInfo:(id)a4;
- (void)_uiStartAuthenticateAccounts:(id)a3;
- (void)_uiStartForMacWithDevice:(id)a3 label:(id)a4 extraInfo:(id)a5;
- (void)_uiStartHomeKitDeviceDetectedWithURL:(id)a3;
- (void)_uiStartPair:(id)a3 extraInfo:(id)a4;
- (void)_uiStartProxCardKitTest:(id)a3 extraInfo:(id)a4;
- (void)_uiStartRepair:(id)a3 flags:(unsigned int)a4;
- (void)_uiStartSetupB238:(id)a3 extraInfo:(id)a4;
- (void)_uiStartSetupDovePeace:(id)a3 autoStart:(BOOL)a4;
- (void)_uiStartSetupWHA:(id)a3;
- (void)_uiStartSetupWatch:(id)a3;
- (void)_uiStartSetupiOS:(id)a3 autoStart:(BOOL)a4;
- (void)_uiStartTVLatencyBanner:(id)a3 forActionType:(unsigned __int8)a4;
- (void)_uiStartTVLatencySetup:(id)a3 extraInfo:(id)a4 forActionType:(unsigned __int8)a5;
- (void)_uiStartTVLatencySetup:(id)a3 forActionType:(unsigned __int8)a4 withBLEDevice:(id)a5;
- (void)_uiStartWiFiPasswordSharing:(id)a3;
- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 label:(id)a5 unlessApps:(id)a6 extraInfo:(id)a7;
- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 extraInfo:(id)a7;
- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 unlessApps:(id)a7 extraInfo:(id)a8;
- (void)_uiStopIfNeededWithDevice:(id)a3;
- (void)_update;
- (void)_watchFastScanStartIfAllowed:(id)a3;
- (void)_watchFastScanStop;
- (void)_watchFound:(id)a3;
- (void)_watchStartMigration:(id)a3;
- (void)_wifiStateChanged;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openSetupURL:(id)a3;
- (void)prefsChanged;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)retriggerProximitySetup:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventRepair:(BOOL)a3;
- (void)setProblemFlags:(unint64_t)a3;
- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5;
- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4;
- (void)testHomeKitDeviceDetected:(id)a3;
- (void)testNFCUI:(id)a3;
- (void)testPINHide;
- (void)testPINShow:(id)a3;
- (void)testPairUI:(id)a3;
- (void)testProxCardKit:(id)a3;
- (void)testRepairUI:(id)a3;
- (void)testSetupUIB238:(id)a3;
- (void)testSetupUIPasswordSharing:(id)a3;
- (void)testSetupUIWHA:(id)a3;
- (void)testSetupUIWatch:(id)a3;
- (void)testSetupUIiOS:(id)a3;
- (void)testUIAppleTVSetup:(id)a3;
- (void)testUITVLatencyColorimeterSetup:(id)a3;
- (void)testUITVLatencySetup:(id)a3;
- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4;
@end

@implementation SDSetupAgent

+ (SDSetupAgent)sharedSetupAgent
{
  if (qword_100656D40 != -1) {
    dispatch_once(&qword_100656D40, &stru_1005CB790);
  }
  return (SDSetupAgent *)gSDSetupAgent;
}

- (SDSetupAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDSetupAgent;
  v2 = -[SDSetupAgent init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)*((void *)v2 + 47);
    *((void *)v2 + 47) = v4;

    *(void *)(v2 + 260) = -1LL;
    *((_DWORD *)v2 + 22) = -1;
    *((_DWORD *)v2 + 71) = -1;
    *((_DWORD *)v2 + 87) = -1;
  }

  return (SDSetupAgent *)v2;
}

- (void)dealloc
{
  if (self->_deviceDiscovery)
  {
    FatalErrorF("Discovery still active during dealloc", a2);
    goto LABEL_6;
  }

  if (self->_scanTimer)
  {
LABEL_6:
    FatalErrorF("Scan timer still active during dealloc", a2);
    goto LABEL_7;
  }

  if (!self->_pinPairService)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___SDSetupAgent;
    -[SDSetupAgent dealloc](&v5, "dealloc");
    return;
  }

- (void)setPreventRepair:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_preventRepair != v3)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      objc_super v5 = "yes";
      if (v3) {
        v6 = "no";
      }
      else {
        v6 = "yes";
      }
      if (!v3) {
        objc_super v5 = "no";
      }
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent setPreventRepair:]",  30LL,  "Prevent repair changed: %s -> %s\n",  v6,  v5);
    }

    self->_preventRepair = v3;
    -[SDSetupAgent _update](self, "_update");
  }

- (id)description
{
  return -[SDSetupAgent descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v146 = 0LL;
  NSAppendPrintF(&v146, "-- SDSetupAgent --\n");
  id v4 = v146;
  id v145 = v4;
  if (self->_deviceDiscovery) {
    deviceDiscovery = self->_deviceDiscovery;
  }
  else {
    deviceDiscovery = (SFDeviceDiscovery *)@"off";
  }
  p_triggeredDevices = &self->_triggeredDevices;
  NSAppendPrintF( &v145,  "Discovery: %@, %ld needSetup, %ld triggered\n",  deviceDiscovery,  -[NSMutableDictionary count](self->_devices, "count"),  -[NSMutableDictionary count](self->_triggeredDevices, "count"));
  id v7 = v145;

  int scanSeconds = self->_scanSeconds;
  if (scanSeconds >= 1)
  {
    id v144 = v7;
    if (self->_scanTimer) {
      v9 = "on";
    }
    else {
      v9 = "off";
    }
    NSAppendPrintF(&v144, "ScanTimer: %s, %d seconds\n", v9, scanSeconds);
    id v10 = v144;

    id v7 = v10;
  }

  v98 = self;
  if (-[NSMutableDictionary count](self->_devices, "count")) {
    p_devices = &self->_devices;
  }
  else {
    p_devices = &self->_triggeredDevices;
  }
  v12 = *p_devices;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  obj = v12;
  id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v140,  v152,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v141;
    do
    {
      v16 = 0LL;
      v17 = v7;
      do
      {
        if (*(void *)v141 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v140 + 1) + 8LL * (void)v16);
        id v139 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( *p_triggeredDevices,  "objectForKeyedSubscript:",  v18));
        if (v19) {
          v20 = "TRIG";
        }
        else {
          v20 = "----";
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v18));
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 description]);
        NSAppendPrintF(&v139, "    %s %@\n", v20, v22);
        id v7 = v139;

        v16 = (char *)v16 + 1;
        v17 = v7;
      }

      while (v14 != v16);
      id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v140,  v152,  16LL);
    }

    while (v14);
  }

  v23 = v98;
  pinPairService = v98->_pinPairService;
  if (pinPairService)
  {
    id v138 = v7;
    NSAppendPrintF(&v138, "PINPair service: %@\n", pinPairService);
    id v25 = v138;

    id v7 = v25;
  }

  pinPairSession = v98->_pinPairSession;
  if (pinPairSession)
  {
    id v137 = v7;
    NSAppendPrintF(&v137, "PINPair session: %@, UUID %@\n", pinPairSession, v98->_pinPairUUID);
    id v27 = v137;

    id v7 = v27;
  }

  if (v98->_pinPairDialogToken)
  {
    id v136 = v7;
    NSAppendPrintF(&v136, "PINPair dialog: %s\n", "yes");
    id v28 = v136;

    id v7 = v28;
  }

  if (v98->_repairEnabled)
  {
    id v135 = v7;
    NSAppendPrintF(&v135, "Problems: %#ll{flags}", v98->_problemFlags, &unk_1004CAB56);
    id v29 = v135;

    if (v98->_repairService)
    {
      id v134 = v29;
      NSAppendPrintF(&v134, ", RepairService On");
      id v30 = v134;

      id v29 = v30;
    }

    wifiHealthMonitor = v98->_wifiHealthMonitor;
    if (wifiHealthMonitor)
    {
      id v133 = v29;
      NSAppendPrintF(&v133, ", %@", wifiHealthMonitor);
      id v32 = v133;

      id v29 = v32;
    }

    id v132 = v29;
    NSAppendPrintF(&v132, "\n");
    id v7 = v132;
  }

  repairSession = v98->_repairSession;
  if (repairSession)
  {
    id v131 = v7;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession peerDevice](repairSession, "peerDevice"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 identifier]);
    NSAppendPrintF(&v131, "RepairSession: Yes, %@\n", v35);
    id v36 = v131;

    id v7 = v36;
  }

  watchSetupScanner = v98->_watchSetupScanner;
  if (watchSetupScanner)
  {
    id v130 = v7;
    NSAppendPrintF(&v130, "WatchScanner: %@\n", watchSetupScanner);
    id v38 = v130;

    id v7 = v38;
  }

  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  v39 = v98->_watchSetupDevices;
  id v40 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v126,  v151,  16LL);
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v127;
    do
    {
      v43 = 0LL;
      v44 = v7;
      do
      {
        if (*(void *)v127 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v45 = *(void *)(*((void *)&v126 + 1) + 8LL * (void)v43);
        id v125 = v44;
        v46 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v98->_watchSetupDevices,  "objectForKeyedSubscript:",  v45));
        NSAppendPrintF(&v125, "    %@\n", v46);
        id v7 = v125;

        v43 = (char *)v43 + 1;
        v44 = v7;
      }

      while (v41 != v43);
      id v41 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v126,  v151,  16LL);
    }

    while (v41);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v48 = [v47 wifiPasswordSharingAvailability];

  id v124 = v7;
  if (v98->_pwsGrantingEnabled) {
    v49 = "enabled";
  }
  else {
    v49 = "disabled";
  }
  NSAppendPrintF( &v124,  "Wi-Fi Password Sharing: granting %s, requesting availability: %#{flags}\n",  v49,  v48,  &unk_1004CAC6E);
  id v50 = v124;

  if (a3 <= 10)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v51 myAccount]);
    v97 = (void *)objc_claimAutoreleasedReturnValue([v52 validationRecord]);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDPhoneHash](v98->_statusMonitor, "myAppleIDPhoneHash"));
    v54 = (void *)objc_claimAutoreleasedReturnValue([v53 componentsSeparatedByString:@","]);

    if ([v54 count])
    {
      id v123 = v50;
      NSAppendPrintF(&v123, "Status Monitor Phone Hashes:\n");
      id v55 = v123;

      __int128 v121 = 0u;
      __int128 v122 = 0u;
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      id v56 = v54;
      id v57 = [v56 countByEnumeratingWithState:&v119 objects:v150 count:16];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = *(void *)v120;
        do
        {
          v60 = 0LL;
          v61 = v55;
          do
          {
            if (*(void *)v120 != v59) {
              objc_enumerationMutation(v56);
            }
            uint64_t v62 = *(void *)(*((void *)&v119 + 1) + 8LL * (void)v60);
            id v118 = v61;
            uint64_t v63 = SFHexStringForBase64EncodedString(v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            NSAppendPrintF(&v118, "    %@\n", v64);
            id v55 = v118;

            v60 = (char *)v60 + 1;
            v61 = v55;
          }

          while (v58 != v60);
          id v58 = [v56 countByEnumeratingWithState:&v119 objects:v150 count:16];
        }

        while (v58);
      }

      id v50 = v55;
      v23 = v98;
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue([v97 validatedPhoneHashes]);

    if ([v65 count])
    {
      id v117 = v50;
      NSAppendPrintF(&v117, "Validation Record Phone Hashes:\n");
      id v66 = v117;

      __int128 v115 = 0u;
      __int128 v116 = 0u;
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      id v67 = v65;
      id v68 = [v67 countByEnumeratingWithState:&v113 objects:v149 count:16];
      if (v68)
      {
        id v69 = v68;
        uint64_t v70 = *(void *)v114;
        do
        {
          v71 = 0LL;
          v72 = v66;
          do
          {
            if (*(void *)v114 != v70) {
              objc_enumerationMutation(v67);
            }
            uint64_t v73 = *(void *)(*((void *)&v113 + 1) + 8LL * (void)v71);
            id v112 = v72;
            NSAppendPrintF(&v112, "    %@\n", v73);
            id v66 = v112;

            v71 = (char *)v71 + 1;
            v72 = v66;
          }

          while (v69 != v71);
          id v69 = [v67 countByEnumeratingWithState:&v113 objects:v149 count:16];
        }

        while (v69);
      }

      id v50 = v66;
    }

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDEmailHash](v23->_statusMonitor, "myAppleIDEmailHash"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 componentsSeparatedByString:@","]);

    if ([v75 count])
    {
      id v111 = v50;
      NSAppendPrintF(&v111, "Status Monitor Email Hashes:\n");
      id v76 = v111;

      __int128 v110 = 0u;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      __int128 v107 = 0u;
      id v77 = v75;
      id v78 = [v77 countByEnumeratingWithState:&v107 objects:v148 count:16];
      if (v78)
      {
        id v79 = v78;
        uint64_t v80 = *(void *)v108;
        do
        {
          v81 = 0LL;
          v82 = v76;
          do
          {
            if (*(void *)v108 != v80) {
              objc_enumerationMutation(v77);
            }
            uint64_t v83 = *(void *)(*((void *)&v107 + 1) + 8LL * (void)v81);
            id v106 = v82;
            uint64_t v84 = SFHexStringForBase64EncodedString(v83);
            v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
            NSAppendPrintF(&v106, "    %@\n", v85);
            id v76 = v106;

            v81 = (char *)v81 + 1;
            v82 = v76;
          }

          while (v79 != v81);
          id v79 = [v77 countByEnumeratingWithState:&v107 objects:v148 count:16];
        }

        while (v79);
      }

      id v50 = v76;
    }

    v86 = (void *)objc_claimAutoreleasedReturnValue([v97 validatedEmailHashes]);

    if ([v86 count])
    {
      id v105 = v50;
      NSAppendPrintF(&v105, "Validation Record Email Hashes:\n");
      id v87 = v105;

      __int128 v103 = 0u;
      __int128 v104 = 0u;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      id v88 = v86;
      id v89 = [v88 countByEnumeratingWithState:&v101 objects:v147 count:16];
      if (v89)
      {
        id v90 = v89;
        uint64_t v91 = *(void *)v102;
        do
        {
          v92 = 0LL;
          v93 = v87;
          do
          {
            if (*(void *)v102 != v91) {
              objc_enumerationMutation(v88);
            }
            uint64_t v94 = *(void *)(*((void *)&v101 + 1) + 8LL * (void)v92);
            id v100 = v93;
            NSAppendPrintF(&v100, "    %@\n", v94);
            id v87 = v100;

            v92 = (char *)v92 + 1;
            v93 = v87;
          }

          while (v90 != v92);
          id v90 = [v88 countByEnumeratingWithState:&v101 objects:v147 count:16];
        }

        while (v90);
      }

      id v50 = v87;
    }
  }

  return v50;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039B28;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (self->_profilesNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100039C08;
    handler[3] = &unk_1005CB7B8;
    handler[4] = self;
    notify_register_dispatch( "com.apple.ManagedConfiguration.profileListChanged",  &self->_profilesNotifyToken,  dispatchQueue,  handler);
  }

  -[SDSetupAgent prefsChanged](self, "prefsChanged");
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100039CEC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  int profilesNotifyToken = self->_profilesNotifyToken;
  if (profilesNotifyToken != -1)
  {
    notify_cancel(profilesNotifyToken);
    self->_int profilesNotifyToken = -1;
  }

  -[SDSetupAgent _ensureClientStopped](self, "_ensureClientStopped");
  -[SDSetupAgent _ensureServerStopped](self, "_ensureServerStopped");
}

- (void)nfcTagReaderUIActivateWithEndpoint:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100039E60;
  v15[3] = &unk_1005CB7E0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

- (void)openSetupURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1006417A0 <= 30
    && ((v6 = v3, dword_1006417A0 != -1) || (v5 = _LogCategory_Initialize(&dword_1006417A0, 30LL), id v4 = v6, v5)))
  {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent openSetupURL:]",  30LL,  "openSetupURL not supported on current platform\n");
  }

  else
  {
  }

- (void)_openSetupURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_1006417A0 <= 30
    && ((v6 = v3, dword_1006417A0 != -1) || (v5 = _LogCategory_Initialize(&dword_1006417A0, 30LL), id v4 = v6, v5)))
  {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _openSetupURL:]",  30LL,  "_openSetupURL not supported on current platform\n");
  }

  else
  {
  }

- (void)prefsChanged
{
  int v63 = 0;
  uint64_t v64 = 0LL;
  uint64_t v62 = 0LL;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  CFPrefs_GetData(@"com.apple.Sharing", @"nearbyAuthTagFilter", &v64, 8LL, &v62, &v63);
  id v3 = 0LL;
  if (!v63)
  {
    id v4 = objc_alloc(&OBJC_CLASS___NSData);
    id v3 = -[NSData initWithBytes:length:](v4, "initWithBytes:length:", &v64, v62);
  }

  bleAuthTagFilter = self->_bleAuthTagFilter;
  v6 = v3;
  id v7 = bleAuthTagFilter;
  if (v6 == v7)
  {

    id v10 = v6;
LABEL_14:

    goto LABEL_15;
  }

  id v8 = v7;
  if ((v6 == 0LL) == (v7 != 0LL))
  {

LABEL_9:
    if (dword_1006417A0 <= 40
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 40LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent prefsChanged]",  40LL,  "AuthTag filter: %@ -> %@\n",  self->_bleAuthTagFilter,  v6);
    }

    v11 = v6;
    id v10 = self->_bleAuthTagFilter;
    self->_bleAuthTagFilter = v11;
    goto LABEL_14;
  }

  unsigned __int8 v9 = -[NSData isEqual:](v6, "isEqual:", v7);

  if ((v9 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_15:
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"saCDP", &v63);
  if (v63) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = Int64 == 0;
  }
  BOOL v14 = !v13;
  if (self->_cdpEnabled != v14)
  {
    if (dword_1006417A0 <= 40
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 40LL)))
    {
      uint64_t v15 = "yes";
      if (v14) {
        id v16 = "no";
      }
      else {
        id v16 = "yes";
      }
      if (!v14) {
        uint64_t v15 = "no";
      }
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent prefsChanged]", 40LL, "Repair CDP enabled: %s -> %s\n", v16, v15);
    }

    self->_cdpEnabled = v14;
  }

  uint64_t v17 = CFPrefs_GetInt64(@"com.apple.Sharing", @"saClientEnabled", &v63);
  BOOL v18 = v17 != 0;
  if (v63)
  {
    uint64_t v19 = v17;
    int v20 = ((uint64_t (*)(void))SFIsDeviceAudioAccessory)() ^ 1;
    if (v19) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v20;
    }
  }

  if (self->_clientEnabled != v18)
  {
    if (dword_1006417A0 <= 40
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 40LL)))
    {
      v21 = "yes";
      if (v18) {
        v22 = "no";
      }
      else {
        v22 = "yes";
      }
      if (!v18) {
        v21 = "no";
      }
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent prefsChanged]", 40LL, "Client enabled: %s -> %s\n", v22, v21);
    }

    self->_clientEnabled = v18;
  }

  uint64_t v23 = CFPrefs_GetInt64(@"com.apple.Sharing", @"pwsAutoGrant", &v63);
  if (self->_pwsAutoGrantingEnabled != v24)
  {
    if (dword_1006417A0 <= 40
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 40LL)))
    {
      id v25 = "yes";
      if (v24) {
        v26 = "no";
      }
      else {
        v26 = "yes";
      }
      if (!v24) {
        id v25 = "no";
      }
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent prefsChanged]",  40LL,  "Wi-Fi password sharing autoGranting enabled: %s -> %s\n",  v26,  v25);
    }

    self->_pwsAutoGrantingEnabled = v24;
  }

  uint64_t v27 = CFPrefs_GetInt64(@"com.apple.Sharing", @"pwsGrantingEnabled", &v63);
  BOOL v28 = v27 != 0;
  if (self->_pwsGrantingEnabled != v28)
  {
    if (dword_1006417A0 <= 40)
    {
      uint64_t v29 = v27;
      if (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 40LL))
      {
        id v30 = "yes";
        if (v29) {
          v31 = "no";
        }
        else {
          v31 = "yes";
        }
        if (!v29) {
          id v30 = "no";
        }
        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent prefsChanged]",  40LL,  "Wi-Fi password sharing granting enabled: %s -> %s\n",  v31,  v30);
      }
    }

    self->_pwsGrantingEnabled = v28;
  }

  uint64_t v32 = CFPrefs_GetInt64(@"com.apple.Sharing", @"saRepairEnabled", &v63);
  if (v63) {
    BOOL v33 = 0;
  }
  else {
    BOOL v33 = v32 == 0;
  }
  BOOL v34 = !v33;
  if (self->_repairEnabled != v34)
  {
    if (dword_1006417A0 <= 40)
    {
      if (dword_1006417A0 != -1 || (uint64_t v32 = _LogCategory_Initialize(&dword_1006417A0, 40LL), (_DWORD)v32))
      {
        v35 = "yes";
        if (v34) {
          id v36 = "no";
        }
        else {
          id v36 = "yes";
        }
        if (!v34) {
          v35 = "no";
        }
        uint64_t v32 = LogPrintF(&dword_1006417A0, "-[SDSetupAgent prefsChanged]", 40LL, "Repair enabled: %s -> %s\n", v36, v35);
      }
    }

    self->_repairEnabled = v34;
  }

  *(_WORD *)&self->_prefRepairAccounts = 257;
  char v37 = SFIsDeviceAudioAccessory(v32);
  self->_prefRepairVPN = v37;
  self->_prefRepairWiFi = v37;
  uint64_t v38 = CFPrefs_GetInt64(@"com.apple.Sharing", @"saRepairSilent", &v63);
  BOOL v39 = v38 != 0;
  if (self->_repairSilent != v39)
  {
    if (dword_1006417A0 <= 40)
    {
      uint64_t v40 = v38;
      if (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 40LL))
      {
        id v41 = "yes";
        if (v40) {
          uint64_t v42 = "no";
        }
        else {
          uint64_t v42 = "yes";
        }
        if (!v40) {
          id v41 = "no";
        }
        LogPrintF(&dword_1006417A0, "-[SDSetupAgent prefsChanged]", 40LL, "Repair silent: %s -> %s\n", v42, v41);
      }
    }

    self->_repairSilent = v39;
  }

  uint64_t v43 = CFPrefs_GetInt64(@"com.apple.Sharing", @"saScanSeconds", &v63);
  if (v43 < 0) {
    uint64_t v44 = -1LL;
  }
  else {
    uint64_t v44 = v43;
  }
  if (v44 >= 100000) {
    uint64_t v44 = 100000LL;
  }
  if (v63) {
    uint64_t v45 = -1LL;
  }
  else {
    uint64_t v45 = v44;
  }
  uint64_t scanSeconds = self->_scanSeconds;
  if (v45 != scanSeconds)
  {
    if (dword_1006417A0 <= 40)
    {
      if (dword_1006417A0 == -1)
      {
        LODWORD(scanSeconds) = self->_scanSeconds;
      }

      LogPrintF(&dword_1006417A0, "-[SDSetupAgent prefsChanged]", 40LL, "Scan seconds: %d -> %lld\n", scanSeconds, v45);
    }

- (BOOL)reenableProxCardType:(unsigned __int8)a3
{
  int v3 = a3;
  BOOL result = 0;
  if ((int)a3 > 24)
  {
    switch(a3)
    {
      case 0x19u:
      case 0x1Eu:
        uint64_t v6 = 166LL;
        goto LABEL_18;
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Fu:
      case 0x22u:
      case 0x23u:
        return result;
      case 0x20u:
        goto LABEL_12;
      case 0x21u:
LABEL_11:
        uint64_t v6 = 163LL;
        goto LABEL_18;
      case 0x24u:
        uint64_t v6 = 178LL;
        goto LABEL_18;
      default:
        if (a3 == 43)
        {
LABEL_12:
          uint64_t v6 = 179LL;
LABEL_18:
          *((_BYTE *)&self->super.isa + v6) = 0;
          if (dword_1006417A0 <= 30
            && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
          {
            id v7 = sub_10003AAD4(v3);
            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent reenableProxCardType:]",  30LL,  "Re-enabled prox card type %s\n",  v7);
          }

          BOOL result = 1;
        }

        else if (a3 == 100)
        {
          if (dword_1006417A0 <= 30
            && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
          {
            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent reenableProxCardType:]",  30LL,  "Re-enable B238Setup after WiFi Connects\n");
          }

          BOOL result = 1;
          self->_renableB238SetupAfterWiFi = 1;
        }

        break;
    }
  }

  else
  {
    uint64_t v6 = 160LL;
    switch(a3)
    {
      case 1u:
        uint64_t v6 = 161LL;
        goto LABEL_18;
      case 5u:
        uint64_t v6 = 176LL;
        goto LABEL_18;
      case 6u:
        goto LABEL_18;
      case 9u:
        uint64_t v6 = 164LL;
        goto LABEL_18;
      case 0xAu:
        uint64_t v6 = 165LL;
        goto LABEL_18;
      case 0xBu:
        goto LABEL_11;
      case 0xDu:
        uint64_t v6 = 177LL;
        goto LABEL_18;
      default:
        return result;
    }
  }

  return result;
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003AD78;
  v13[3] = &unk_1005CB808;
  v13[4] = self;
  id v14 = v8;
  unsigned int v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)retriggerProximitySetup:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003AE2C;
  v7[3] = &unk_1005CB830;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B20C;
  block[3] = &unk_1005CB858;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B2F0;
  block[3] = &unk_1005CB880;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B510;
  block[3] = &unk_1005CB880;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  if (self->_clientEnabled) {
    -[SDSetupAgent _ensureClientStarted](self, "_ensureClientStarted");
  }
  else {
    -[SDSetupAgent _ensureClientStopped](self, "_ensureClientStopped");
  }
  if (self->_serverEnabled) {
    -[SDSetupAgent _ensureServerStarted](self, "_ensureServerStarted");
  }
  else {
    -[SDSetupAgent _ensureServerStopped](self, "_ensureServerStopped");
  }
  if (self->_repairEnabled && !self->_preventRepair) {
    -[SDSetupAgent _repairEnsuredStarted](self, "_repairEnsuredStarted");
  }
  else {
    -[SDSetupAgent _repairEnsuredStopped](self, "_repairEnsuredStopped");
  }
}

- (void)_ensureClientStarted
{
  if (self->_iTunesNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003BFB4;
    handler[3] = &unk_1005CB7B8;
    handler[4] = self;
    notify_register_dispatch( "com.apple.itunesstored.accountschanged",  &self->_iTunesNotifyToken,  dispatchQueue,  handler);
  }

  if (!self->_statusMonitor)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:self selector:"_appleAccountSignIn:" name:@"com.apple.sharingd.AppleAccountSignIn" object:0];
    [v4 addObserver:self selector:"_screenStateChanged" name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    int v5 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v5;
  }

  if (!self->_systemMonitor)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v7;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_10003C040;
    v51[3] = &unk_1005CB2F8;
    v51[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v51);
    -[CUSystemMonitor setCallChangedHandler:](self->_systemMonitor, "setCallChangedHandler:", &stru_1005CB8A0);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_10003C04C;
    v50[3] = &unk_1005CB2F8;
    v50[4] = self;
    -[CUSystemMonitor setScreenLockedChangedHandler:](self->_systemMonitor, "setScreenLockedChangedHandler:", v50);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10003C054;
    v49[3] = &unk_1005CB2F8;
    v49[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v49);
    id v9 = self->_systemMonitor;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10003C05C;
    v48[3] = &unk_1005CB2F8;
    v48[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v9, "activateWithCompletion:", v48);
  }

  unsigned int scanEligible = self->_scanEligible;
  unsigned int v11 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
  self->_unsigned int scanEligible = v11;
  unsigned int v12 = scanEligible;
  if (scanEligible != v11)
  {
    if (dword_1006417A0 <= 30)
    {
      if (dword_1006417A0 == -1)
      {
        unsigned int v11 = self->_scanEligible;
      }

      id v13 = "yes";
      if (scanEligible) {
        id v14 = "yes";
      }
      else {
        id v14 = "no";
      }
      if (!v11) {
        id v13 = "no";
      }
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _ensureClientStarted]", 30LL, "ScanEligible: %s -> %s\n", v14, v13);
LABEL_26:
      if (!self->_scanEligible) {
        goto LABEL_27;
      }
      goto LABEL_18;
    }

    unsigned int v12 = v11;
  }

  if (!v12)
  {
LABEL_27:
    self->_shouldScan = 0;
    goto LABEL_30;
  }

- (void)_ensureClientStopped
{
  int iTunesNotifyToken = self->_iTunesNotifyToken;
  if (iTunesNotifyToken != -1)
  {
    notify_cancel(iTunesNotifyToken);
    self->_int iTunesNotifyToken = -1;
  }

  if (self->_statusMonitor)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:@"com.apple.sharingd.AppleAccountSignIn" object:0];
    [v4 removeObserver:self name:@"com.apple.sharingd.ScreenStateChanged" object:0];
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0LL;
  }

  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0LL;

  if (self->_deviceDiscovery)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _ensureClientStopped]", 30LL, "Discovery stop (stopped)\n");
    }

    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0LL;
  }

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0LL;

  self->_unsigned int scanEligible = 0;
  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    id v10 = scanTimer;
    dispatch_source_cancel(v10);
    unsigned int v11 = self->_scanTimer;
    self->_scanTimer = 0LL;
  }

  self->_shouldScan = 0;
  -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
  -[SFDeviceRepairSession invalidate](self->_repairSession, "invalidate");
  repairSession = self->_repairSession;
  self->_repairSession = 0LL;

  setupURL = self->_setupURL;
  self->_setupURL = 0LL;

  -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
  unoteTVLatencySetup = self->_unoteTVLatencySetup;
  self->_unoteTVLatencySetup = 0LL;

  watchFastScanTimer = self->_watchFastScanTimer;
  if (watchFastScanTimer)
  {
    unsigned int v16 = watchFastScanTimer;
    dispatch_source_cancel(v16);
    uint64_t v17 = self->_watchFastScanTimer;
    self->_watchFastScanTimer = 0LL;
  }

  if (self->_watchSetupScanner)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _ensureClientStopped]", 30LL, "WatchScan stop (stopped)\n");
    }

    -[SFBLEScanner invalidate](self->_watchSetupScanner, "invalidate");
    watchSetupScanner = self->_watchSetupScanner;
    self->_watchSetupScanner = 0LL;
  }

  -[NSMutableDictionary removeAllObjects](self->_watchSetupDevices, "removeAllObjects");
  watchSetupDevices = self->_watchSetupDevices;
  self->_watchSetupDevices = 0LL;

  self->_triggeredUIWatchSetup = 0;
}

- (void)_deviceFound:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceActionType];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v8 = 0LL;
  if (self->_deviceDiscovery && v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v7));
    if ([v4 needsSetup])
    {
      devices = self->_devices;
      if (!devices)
      {
        id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        unsigned int v11 = self->_devices;
        self->_devices = v10;

        devices = self->_devices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v4, v7);
      if (!gSDProxCardsSuppressed && !-[SDSetupAgent _uiShowing](self, "_uiShowing"))
      {
        if ((_DWORD)v5 == 30 || (_DWORD)v5 == 25)
        {
          if ((-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C808) != 0) {
            goto LABEL_172;
          }
        }

        else
        {
          if ((-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) != 0) {
            goto LABEL_172;
          }
          if (v5 <= 0x11 && ((1 << (char)v5) & 0x21100) != 0)
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggeredDevices,  "objectForKeyedSubscript:",  v7));

            if (v17) {
              goto LABEL_172;
            }
          }
        }

        if ([v6 triggered])
        {
          if (dword_1006417A0 <= 50
            && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
          {
            unsigned int v18 = [v4 deviceActionType];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "#ni_estimator SDSetupAgent trigger launched with actiontype: %d for device: %@",  v18,  v19);
          }

          if ((_DWORD)v5 != 33 && (_DWORD)v5 != 11
            || !-[CUSystemMonitor activeCallCount](self->_systemMonitor, "activeCallCount"))
          {
            if ((unsigned __int8 v20 = -[SDSetupAgent _screenLocked](self, "_screenLocked"), v5 <= 0x24)
              && ((1LL << (char)v5) & 0x1042000200LL) != 0
              || (v20 & 1) == 0)
            {
              if (self->_bleAuthTagFilter)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue([v6 advertisementFields]);
                CFTypeID TypeID = CFDataGetTypeID();
                uint64_t TypedValue = CFDictionaryGetTypedValue(v21, @"at", TypeID, 0LL);
                dispatch_time_t v24 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

                bleAuthTagFilter = self->_bleAuthTagFilter;
                v26 = v24;
                uint64_t v27 = bleAuthTagFilter;
                if (v26 == v27)
                {
                }

                else
                {
                  BOOL v28 = v27;
                  if ((v26 == 0LL) == (v27 != 0LL))
                  {

                    goto LABEL_172;
                  }

                  unsigned int v29 = -[NSData isEqual:](v26, "isEqual:", v27);

                  if (!v29) {
                    goto LABEL_172;
                  }
                }
              }

              uint64_t v30 = SFStoreDemoMode();
              if ((v30 & 1) == 0 && (SFLostMode(v30, v31) & 1) == 0)
              {
                triggeredDevices = self->_triggeredDevices;
                if (!triggeredDevices)
                {
                  BOOL v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                  BOOL v34 = self->_triggeredDevices;
                  self->_triggeredDevices = v33;

                  triggeredDevices = self->_triggeredDevices;
                }

                -[NSMutableDictionary setObject:forKeyedSubscript:]( triggeredDevices,  "setObject:forKeyedSubscript:",  v4,  v7);
                -[SDSetupAgent _postDeviceSetupNotificationForDevice:present:]( self,  "_postDeviceSetupNotificationForDevice:present:",  v4,  1LL);
                -[SFDeviceDiscovery fastScanCancel:](self->_deviceDiscovery, "fastScanCancel:", @"Triggered");
                switch((int)v5)
                {
                  case 6:
                    if (self->_triggeredUIAppleTVPair)
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity AppleTVPair with another %@\n",  v6);
                      }
                    }

                    else
                    {
                      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
                      unsigned __int8 v40 = [v39 isProximitySetupToNewDeviceAllowed];

                      if ((v40 & 1) != 0)
                      {
                        self->_triggeredUIAppleTVPair = 1;
                        if (dword_1006417A0 <= 50
                          && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                        {
                          LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity AppleTVPair with %@\n",  v6);
                        }

                        -[SDSetupAgent _uiStartPair:extraInfo:](self, "_uiStartPair:extraInfo:", v4, 0LL);
                        goto LABEL_170;
                      }

                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity AppleTVPair when not allowed for %@\n",  v6);
                      }
                    }

                    break;
                  case 7:
                  case 14:
                  case 15:
                  case 16:
                  case 18:
                  case 19:
                  case 20:
                  case 21:
                  case 22:
                  case 23:
                  case 24:
                  case 26:
                  case 27:
                  case 28:
                  case 29:
                  case 31:
                  case 34:
                  case 35:
                    break;
                  case 8:
                    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
                    unsigned __int8 v42 = [v41 isWiFiPasswordSharingAllowed];

                    if ((v42 & 1) != 0)
                    {
                      if (self->_pwsGrantingEnabled
                        && -[SDSetupAgent _shouldOfferPassword:](self, "_shouldOfferPassword:", v4))
                      {
                        if (dword_1006417A0 <= 50
                          && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                        {
                          LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "WPS: Triggering Wi-Fi Password Sharing with %@\n",  v6);
                        }

                        -[SDSetupAgent _uiStartWiFiPasswordSharing:](self, "_uiStartWiFiPasswordSharing:", v4);
                      }

                      else if (dword_1006417A0 <= 30 {
                             && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
                      }
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  30LL,  "WPS: Shouldn't offer password, ignoring triggered device: %@\n",  v6);
                      }

                      goto LABEL_170;
                    }

                    if (dword_1006417A0 <= 50
                      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                    {
                      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "WPS: Ignoring Wi-Fi Password Sharing request when not allowed for %@",  v6);
                    }

                    break;
                  case 9:
                    if (self->_triggeredUIiOSSetup)
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity iOSSetup with another %@\n",  v6);
                      }
                    }

                    else
                    {
                      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
                      unsigned __int8 v44 = [v43 isProximitySetupToNewDeviceAllowed];

                      if ((v44 & 1) != 0)
                      {
                        if (([v4 deviceFlags] & 0x100) == 0)
                        {
                          if (-[SDStatusMonitor eduModeEnabled](self->_statusMonitor, "eduModeEnabled"))
                          {
                            if (dword_1006417A0 <= 50
                              && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                            {
                              uint64_t v45 = "Ignoring proximity iOSSetup in EDU mode\n";
                              goto LABEL_126;
                            }
                          }

                          else
                          {
                            if (dword_1006417A0 <= 50
                              && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                            {
                              LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity iOSSetup with %@\n",  v6);
                            }

                            self->_triggeredUIiOSSetup = 1;
                            -[SDSetupAgent _uiStartSetupiOS:autoStart:](self, "_uiStartSetupiOS:autoStart:", v4, 0LL);
                          }

                          goto LABEL_170;
                        }

                        if (dword_1006417A0 <= 50
                          && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                        {
                          LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity iOSSetup during resume: %@\n",  v6);
                        }
                      }

                      else if (dword_1006417A0 <= 50 {
                             && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      }
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity iOSSetup when not allowed for %@\n",  v6);
                      }
                    }

                    break;
                  case 10:
                    if (self->_triggeredUIRepair)
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity Repair with another %@\n",  v6);
                      }
                    }

                    else
                    {
                      v46 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
                      unsigned __int8 v47 = [v46 isProximitySetupToNewDeviceAllowed];

                      if ((v47 & 1) != 0)
                      {
                        if (([v4 paired] & 1) != 0
                          || [v4 systemPairState] > 0x13)
                        {
                          self->_triggeredUIRepair = 1;
                          if (self->_repairSilent)
                          {
                            if (dword_1006417A0 <= 50
                              && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                            {
                              LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity Repair silent with %@\n",  v6);
                            }

                            -[SDSetupAgent _repairSilentStart:](self, "_repairSilentStart:", v4);
                          }

                          goto LABEL_170;
                        }

                        if (dword_1006417A0 <= 50
                          && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                        {
                          LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring unpaired proximity Repair with %@\n",  v6);
                        }
                      }

                      else if (dword_1006417A0 <= 50 {
                             && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      }
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity Repair when not allowed for %@\n",  v6);
                      }
                    }

                    break;
                  case 11:
                  case 33:
                    if (self->_triggeredUIB238Setup)
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity HomePodSetup with another %@\n",  v6);
                      }
                    }

                    else
                    {
                      v35 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
                      unsigned __int8 v36 = [v35 isProximitySetupToNewDeviceAllowed];

                      if ((v36 & 1) != 0)
                      {
                        self->_triggeredUIB238Setup = 1;
                        if (dword_1006417A0 <= 50)
                        {
                          if (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)) {
                            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity HomePodSetup with %@\n",  v6);
                          }
                          if (dword_1006417A0 <= 50
                            && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                          {
                            BOOL v57 = sub_10003AAD4((int)v5);
                            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "HomePodSetup action type is %s\n",  v57);
                          }
                        }

                        -[SDSetupAgent _uiStartSetupB238:extraInfo:](self, "_uiStartSetupB238:extraInfo:", v4, 0LL);
                        goto LABEL_170;
                      }

                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity HomePodSetup when not allowed for %@\n",  v6);
                      }
                    }

                    break;
                  case 12:
                    if (dword_1006417A0 <= 50
                      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                    {
                      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity ApplePay with %@\n",  v6);
                    }

                    notify_post("com.apple.applepay.proximity");
                    goto LABEL_170;
                  case 13:
                    if (self->_triggeredUIWHASetup)
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity WHASetup with another %@\n",  v6);
                      }
                    }

                    else
                    {
                      BOOL v48 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
                      unsigned __int8 v49 = [v48 isProximitySetupToNewDeviceAllowed];

                      if ((v49 & 1) != 0)
                      {
                        self->_triggeredUIWHASetup = 1;
                        if (dword_1006417A0 <= 50
                          && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                        {
                          LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity WHASetup with %@\n",  v6);
                        }

                        -[SDSetupAgent _uiStartSetupWHA:](self, "_uiStartSetupWHA:", v4);
                        goto LABEL_170;
                      }

                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity WHASetup when not allowed for %@\n",  v6);
                      }
                    }

                    break;
                  case 17:
                    if (dword_1006417A0 <= 50
                      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                    {
                      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity DeviceDiagnostics with %@\n",  v6);
                    }

                    -[SDSetupAgent _launchAppWithMachServiceName:]( self,  "_launchAppWithMachServiceName:",  @"com.apple.diagnosticextensionsd.sharing-wakeup");
                    goto LABEL_170;
                  case 25:
                    if (!self->_triggeredUITVLatencySetup)
                    {
                      id v50 = self;
                      id v51 = v4;
                      uint64_t v52 = 25LL;
                      goto LABEL_102;
                    }

                    if (dword_1006417A0 <= 50
                      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                    {
                      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity TVLatency with another %@\n",  v6);
                    }

                    break;
                  case 30:
                    if (self->_triggeredUITVLatencySetup)
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity TVColorCalibration with another %@\n",  v6);
                      }

                      break;
                    }

                    id v50 = self;
                    id v51 = v4;
                    uint64_t v52 = 30LL;
LABEL_102:
                    -[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]( v50,  "_uiStartTVLatencySetup:forActionType:withBLEDevice:",  v51,  v52,  v6);
                    goto LABEL_170;
                  case 32:
                    goto LABEL_57;
                  case 36:
                    if (!-[SDSetupAgent _deviceHandlesDovePeaceSetup](self, "_deviceHandlesDovePeaceSetup"))
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        uint64_t v45 = "Ignoring proximity dovePeace setup on this type of device\n";
                        goto LABEL_126;
                      }

                      goto LABEL_170;
                    }

                    if (self->_triggeredUIDovePeace)
                    {
                      if (dword_1006417A0 <= 50
                        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                      {
                        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Ignoring proximity dovePeace setup with another %@\n",  v6);
                      }
                    }

                    else
                    {
                      BOOL v53 = (void *)objc_claimAutoreleasedReturnValue( +[MCProfileConnection sharedConnection]( &OBJC_CLASS___MCProfileConnection,  "sharedConnection"));
                      unsigned __int8 v54 = [v53 isProximitySetupToNewDeviceAllowed];

                      if ((v54 & 1) != 0)
                      {
                        if (([v4 deviceFlags] & 0x100) == 0)
                        {
                          if (-[SDStatusMonitor eduModeEnabled](self->_statusMonitor, "eduModeEnabled"))
                          {
                            if (dword_1006417A0 <= 50
                              && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                            {
                              uint64_t v45 = "Ignoring proximity dovePeace setup in EDU mode\n";
LABEL_126:
                              LogPrintF(&dword_1006417A0, "-[SDSetupAgent _deviceFound:]", 50LL, v45, v64);
                            }
                          }

                          else if (_os_feature_enabled_impl("TDGSharingViewService", "Setup"))
                          {
                            if (dword_1006417A0 <= 50
                              && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
                            {
                              LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _deviceFound:]",  50LL,  "Triggering proximity dovePeace setup with %@\n",  v6);
                            }

                            self->_triggeredUIDovePeace = 1;
                            -[SDSetupAgent _uiStartSetupDovePeace:autoStart:]( self,  "_uiStartSetupDovePeace:autoStart:",  v4,  0LL);
                          }

- (void)_deviceLost:(id)a3
{
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v4 = v12;
  if (v12)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v12));
    id v4 = v12;
    if (v5)
    {
      id v6 = (void *)v5;
      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v12);
      unoteTVLatencySetup = self->_unoteTVLatencySetup;
      if (unoteTVLatencySetup)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](unoteTVLatencySetup, "identifier"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
        unsigned int v10 = [v8 isEqual:v9];

        if (v10)
        {
          -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
          unsigned int v11 = self->_unoteTVLatencySetup;
          self->_unoteTVLatencySetup = 0LL;
        }
      }

      -[SDSetupAgent _postDeviceSetupNotificationForDevice:present:]( self,  "_postDeviceSetupNotificationForDevice:present:",  v6,  0LL);

      id v4 = v12;
    }
  }
}

- (void)_launchAppWithMachServiceName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v6 = (const char *)[v5 UTF8String];
  if (v6)
  {
    mach_service = xpc_connection_create_mach_service(v6, (dispatch_queue_t)self->_dispatchQueue, 0LL);
    xpc_connection_set_event_handler(mach_service, &stru_1005CBA20);
    xpc_connection_activate(mach_service);
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v8, "SharingXPCLaunch", 1);
    xpc_connection_send_message(mach_service, v8);
    barrier[0] = _NSConcreteStackBlock;
    barrier[1] = 3221225472LL;
    barrier[2] = sub_10003DD8C;
    barrier[3] = &unk_1005CB480;
    unsigned int v11 = mach_service;
    id v12 = v5;
    id v9 = mach_service;
    xpc_connection_send_barrier(v9, barrier);
  }
}

- (void)_postDeviceSetupNotificationForDevice:(id)a3 present:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  if (v7)
  {
    v11[0] = @"deviceID";
    v11[1] = @"needsSetup";
    v12[0] = v7;
    xpc_object_t v8 = &__kCFBooleanFalse;
    v12[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v10 postNotificationName:@"com.apple.sharing.DeviceSetup" object:@"com.apple.sharingd" userInfo:v9 deliverImmediately:1];
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _postDeviceSetupNotificationForDevice:present:]",  50LL,  "Posted %@: %##@\n",  @"com.apple.sharing.DeviceSetup",  v9);
    }
  }
}

- (void)_appleAccountSignIn:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003DFE8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_primaryAccountChanged
{
  systemMonitor = self->_systemMonitor;
  if (systemMonitor)
  {
    id v4 = -[CUSystemMonitor manateeAvailable](systemMonitor, "manateeAvailable");
    if (self->_d2dEncryptionAvailable != (_DWORD)v4)
    {
      id v5 = v4;
      self->_d2dEncryptionAvailable = (char)v4;
      if (dword_1006417A0 <= 30
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
      {
        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _primaryAccountChanged]",  30LL,  "D2D Encryption availability changed to %{BOOL}\n",  v5);
      }

      -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
    }
  }

- (void)_iTunesAccountsChanged
{
  if (self->_triggeredUIB238Setup || self->_triggeredUIRepair)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _iTunesAccountsChanged]",  30LL,  "Resetting prox card triggers on iTunes\n");
    }

    -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
  }

- (void)_resetTriggers
{
  triggeredDevices = self->_triggeredDevices;
  self->_triggeredDevices = 0LL;

  *(_WORD *)&self->_triggeredUIWHASetup = 0;
  self->_triggeredUIAuthenticateAccounts = 0;
  *(_DWORD *)&self->_triggeredUIAppleTVPair = 0;
  *(_DWORD *)&self->_triggeredUIB238Setup = 0;
}

- (void)_scanTimerFired
{
  scanTimer = self->_scanTimer;
  if (scanTimer)
  {
    id v4 = scanTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_scanTimer;
    self->_scanTimer = 0LL;
  }

  self->_shouldScan = 0;
  -[SDSetupAgent _update](self, "_update");
}

- (BOOL)_screenLocked
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned __int8 v3 = [v2 deviceKeyBagLocked];

  return v3;
}

- (void)_screenStateChanged
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E324;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_shouldOfferPassword:(id)a3
{
  id v3 = a3;
  unsigned int v29 = 0;
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 requestSSID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 contactIdentifier]);

  if (!v5)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _shouldOfferPassword:]",  30LL,  "WPS: Ignoring pw request from non-contact peer\n");
    }

    goto LABEL_34;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 contactIdentifier]);
  unsigned int v8 = [v6 contactIdentifierIsBlocked:v7];

  if (v8)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _shouldOfferPassword:]",  30LL,  "WPS: Ignoring pw request from blocked-contact peer\n");
    }

    goto LABEL_34;
  }

  if (!v4)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _shouldOfferPassword:]",  30LL,  "WPS: Ignoring pw request without requestSSID\n");
    }

- (void)_uiLockStatusChanged
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E8D8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_uiShowing
{
  return 0;
}

- (void)_uiStartAppleTVSetup:(id)a3 extraInfo:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    id v8 = [a4 mutableCopy];
  }

  else
  {
    id v9 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  id v12 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [a3 deviceModelCode]));
  [v12 setObject:v10 forKeyedSubscript:@"deviceModelCode"];

  id v11 = [v12 copy];
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  a3,  @"TVSetupUIService.TVSetupAlertViewController",  @"AppleTVSetupUI",  0LL,  v11);
}

- (void)_uiStartHomeKitDeviceDetectedWithURL:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[SFDevice setIdentifier:](v5, "setIdentifier:", v6);

    id v8 = @"urlStr";
    id v9 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  v5,  @"HomeKitDeviceDetectedMainController",  @"HomeKitDeviceDetected",  0LL,  v7);
  }
}

- (void)_uiStartPair:(id)a3 extraInfo:(id)a4
{
}

- (void)_uiStartRepair:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = @"repairFlags";
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  uint64_t v10 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  v6,  @"RepairMainController",  @"RepairUI",  0LL,  v8);
}

- (void)_uiStartSetupB238:(id)a3 extraInfo:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    id v8 = (NSMutableDictionary *)[a4 mutableCopy];
  }

  else
  {
    id v9 = a3;
    id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  id v12 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [a3 deviceModelCode]));
  -[NSMutableDictionary setValue:forKey:](v12, "setValue:forKey:", v10, @"deviceModelCode");

  [a3 setDeviceActionType:33];
  id v11 = -[NSMutableDictionary copy](v12, "copy");
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  a3,  @"HDSViewService.HomePodSetupFlowViewController",  @"B238SetupUI",  0LL,  v11);
}

- (void)_uiStartSetupiOS:(id)a3 autoStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl("Sharing", "DeviceToDeviceSetup_PRX");
  id v8 = @"iOSSetupMainController";
  if (v7) {
    id v8 = @"SharingViewService.D2DSetupFlowViewController";
  }
  v14[0] = @"autoStart";
  id v9 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v15[0] = v10;
  v14[1] = @"deviceClassCode";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v6 deviceClassCode]));
  v15[1] = v11;
  v14[2] = @"deviceModelCode";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v6 deviceModelCode]));
  v15[2] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  v6,  v9,  @"iOSSetupUI",  0LL,  v13);
}

- (void)_uiStartSetupDovePeace:(id)a3 autoStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[SDSetupAgent _deviceHandlesDovePeaceSetup](self, "_deviceHandlesDovePeaceSetup"))
  {
    v11[0] = @"autoStart";
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    v12[0] = v7;
    v11[1] = @"deviceClassCode";
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v6 deviceClassCode]));
    v12[1] = v8;
    void v11[2] = @"deviceModelCode";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v6 deviceModelCode]));
    void v12[2] = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
    -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  v6,  @"BYDovePeaceRemoteViewController",  @"dovePeaceSetupUI",  0LL,  v10);
  }
}

- (BOOL)_deviceHandlesDovePeaceSetup
{
  uint64_t v2 = SFDeviceClassCodeGet(self, a2);
  if ((_DWORD)v2 == 3)
  {
    LOBYTE(v4) = 1;
  }

  else
  {
    uint64_t v4 = SFDeviceClassCodeGet(v2, v3);
    if ((_DWORD)v4 != 1) {
      LOBYTE(v4) = SFDeviceClassCodeGet(v4, v5) == 2;
    }
  }

  return v4;
}

- (void)_uiStartSetupWatch:(id)a3
{
  id v11 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (_os_feature_enabled_impl("Bridge", "ModernProxCardFlow"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v11 bleDevice]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 advertisementFields]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"wd"]);

    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:@"watchData"];
    }
  }

  else
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:@"advertisingName"];
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 bleDevice]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 advertisementFields]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"wpv"]);

    if (v10) {
      [v4 setObject:v10 forKeyedSubscript:@"pairingVersion"];
    }
  }

  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  v11,  @"WatchSetupViewControllerProxy",  @"WatchSetupUI",  &off_1005FAD48,  v4);
}

- (void)_uiStartSetupWHA:(id)a3
{
}

- (void)_uiStartProxCardKitTest:(id)a3 extraInfo:(id)a4
{
}

- (void)_uiStartAuthenticateAccounts:(id)a3
{
  id v5 = a3;
  uint64_t v4 = @"SharingViewService.AuthenticateAccountsFlowViewController";
  if (_os_feature_enabled_impl("AppleIDSetup", "Sandstone")
    && [v5 osVersion] > 0xC)
  {
    uint64_t v4 = @"AppleIDSetupUIService.SetupAlertViewController";
  }

  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  v5,  v4,  @"AuthenticateAccountsUI",  0LL,  0LL);
}

- (void)_uiStartTVLatencySetup:(id)a3 forActionType:(unsigned __int8)a4 withBLEDevice:(id)a5
{
  uint64_t v6 = a4;
  id v16 = a3;
  id v8 = a5;
  int DeviceClass = GestaltGetDeviceClass(v8, v9);
  id v11 = @"ColorCalibration";
  if ((_DWORD)v6 == 25) {
    id v11 = &stru_1005E3958;
  }
  id v12 = v11;
  if ((DeviceClass - 3) <= 0xFFFFFFFD)
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]",  50LL,  "Ignoring proximity TVLatency%@Setup: unsupported, %@\n",  v8,  v12);
    }
  }

  else if (-[SDSetupAgent _screenLocked](self, "_screenLocked") {
         || (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor")),
  }
             unsigned __int8 v14 = [v13 deviceUIUnlocked],
             v13,
             (v14 & 1) == 0))
  {
    if (self->_triggeredUITVLatencySetup || self->_unoteTVLatencySetup)
    {
      if (dword_1006417A0 <= 50
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
      {
        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]",  50LL,  "Ignoring proximity TVLatency%@Setup with another %@\n",  v12,  v8);
      }
    }

    else
    {
      -[SDSetupAgent _uiStartTVLatencyBanner:forActionType:](self, "_uiStartTVLatencyBanner:forActionType:", v16, v6);
    }
  }

  else if (self->_triggeredUITVLatencySetup)
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]",  50LL,  "Ignoring proximity TVLatency%@ with another %@\n",  v12,  v8);
    }
  }

  else
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartTVLatencySetup:forActionType:withBLEDevice:]",  50LL,  "Triggering proximity TVLatency%@ with %@\n",  v12,  v8);
    }

    self->_triggeredUITVLatencySetup = 1;
    -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
    unoteTVLatencySetup = self->_unoteTVLatencySetup;
    self->_unoteTVLatencySetup = 0LL;

    -[SDSetupAgent _uiStartTVLatencySetup:extraInfo:forActionType:]( self,  "_uiStartTVLatencySetup:extraInfo:forActionType:",  v16,  0LL,  v6);
  }
}

- (void)_uiStartTVLatencyBanner:(id)a3 forActionType:(unsigned __int8)a4
{
  int v4 = a4;
  id v7 = a3;
  unoteTVLatencySetup = self->_unoteTVLatencySetup;
  if (!unoteTVLatencySetup
    || (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUUserNotificationSession identifier](unoteTVLatencySetup, "identifier")),
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]),
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]),
        unsigned __int8 v12 = [v9 isEqual:v11],
        v11,
        v10,
        v9,
        (v12 & 1) == 0))
  {
    if (GestaltGetDeviceClass(unoteTVLatencySetup, v6) == 1
      && MGIsQuestionValid(@"8S7ydMJ4DlCUF38/hI/fJA"))
    {
      int v13 = MGGetBoolAnswer(@"8S7ydMJ4DlCUF38/hI/fJA") ^ 1;
    }

    else
    {
      int v13 = 1;
    }

    if (v4 == 30 && v13)
    {
      if (dword_1006417A0 <= 50
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
      {
        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartTVLatencyBanner:forActionType:]",  50LL,  "Unsupported device for ColorCalibration");
      }
    }

    else
    {
      -[CUUserNotificationSession invalidate](self->_unoteTVLatencySetup, "invalidate");
      unsigned __int8 v14 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
      objc_storeStrong((id *)&self->_unoteTVLatencySetup, v14);
      -[CUUserNotificationSession setBundleID:](v14, "setBundleID:", @"com.apple.SFUserNotificationTVLatency");
      -[CUUserNotificationSession setCategoryID:](v14, "setCategoryID:", @"SFUserNotificationTVLatency");
      -[CUUserNotificationSession setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
      uint64_t v16 = SFLocalizedStringForKey(@"Apple TV", v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[CUUserNotificationSession setHeader:](v14, "setHeader:", v17);

      -[CUUserNotificationSession setFlags:](v14, "setFlags:", 1LL);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
      -[CUUserNotificationSession setIdentifier:](v14, "setIdentifier:", v19);

      if (v4 == 25)
      {
        -[CUUserNotificationSession setTitleKey:](v14, "setTitleKey:", @"TV_LATENCY_TITLE");
        uint64_t v20 = SFAddSuffixForCurrentDeviceClass(@"TV_LATENCY_BODY");
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        -[CUUserNotificationSession setBodyKey:](v14, "setBodyKey:", v21);
      }

      else
      {
        uint64_t v22 = SFLocalizedStringForKeyInStringsFileNamed(@"ADJUST_DISPLAY_TITLE", @"Localizable-Colorimeter");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        -[CUUserNotificationSession setTitleKey:](v14, "setTitleKey:", v23);

        uint64_t v24 = SFAddSuffixForCurrentDeviceClass(@"ADJUST_DISPLAY_BODY");
        v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
        uint64_t v25 = SFLocalizedStringForKeyInStringsFileNamed(v21, @"Localizable-Colorimeter");
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        -[CUUserNotificationSession setBodyKey:](v14, "setBodyKey:", v26);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10003F7EC;
      v27[3] = &unk_1005CBA48;
      v27[4] = self;
      id v28 = v7;
      char v29 = v4;
      -[CUUserNotificationSession setActionHandler:](v14, "setActionHandler:", v27);
      -[CUUserNotificationSession activate](v14, "activate");
    }
  }
}

- (void)_uiStartTVLatencySetup:(id)a3 extraInfo:(id)a4 forActionType:(unsigned __int8)a5
{
  if (a5 == 25) {
    uint64_t v6 = @"TVLatencySetupMainController";
  }
  else {
    uint64_t v6 = @"TVLatencyColorimeterSetupMainController";
  }
  -[SDSetupAgent _uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:label:unlessApps:extraInfo:",  a3,  v6,  @"TVLatencySetupUI",  0LL,  a4);
}

- (void)_uiStartWiFiPasswordSharing:(id)a3
{
  id v14 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v14 contactIdentifier]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v14 requestSSID]);
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor computerName](self->_statusMonitor, "computerName"));
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDEmailHash](self->_statusMonitor, "myAppleIDEmailHash"));
      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myAppleIDPhoneHash](self->_statusMonitor, "myAppleIDPhoneHash"));
      if (!(v9 | v10)
        && dword_1006417A0 <= 60
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 60LL)))
      {
        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartWiFiPasswordSharing:]",  60LL,  "### WPS: Neither email nor phone hashes found\n");
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v4, @"cid");
      if (v8) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, @"dn");
      }
      if (v9) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"eh");
      }
      if (v10) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, @"ph");
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, @"nw");
      int v11 = _os_feature_enabled_impl("Sharing", "PasswordSharing_PRX");
      unsigned __int8 v12 = @"PasswordSharingViewControllerProxy";
      if (v11) {
        unsigned __int8 v12 = @"SharingViewService.PasswordSharingFlowViewController";
      }
      int v13 = v12;
      -[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:]( self,  "_uiStartWithDevice:viewControllerName:xpcEndpoint:label:extraInfo:",  v14,  v13,  0LL,  @"WiFiPasswordSharing",  v7);
    }

    else if (dword_1006417A0 <= 60 {
           && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 60LL)))
    }
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartWiFiPasswordSharing:]",  60LL,  "### WPS: Not showing UI, no request SSID\n");
    }
  }

  else if (dword_1006417A0 <= 50 {
         && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
  }
  {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartWiFiPasswordSharing:]",  50LL,  "WPS: Not showing UI for non-contact peer\n");
  }
}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 label:(id)a5 unlessApps:(id)a6 extraInfo:(id)a7
{
}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 unlessApps:(id)a7 extraInfo:(id)a8
{
  id v18 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (dword_1006417A0 <= 30 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartWithDevice:viewControllerName:xpcEndpoint:label:unlessApps:extraInfo:]",  30LL,  "%@ not supported\n",  v13,  v18);
  }
}

- (void)_uiStartWithDevice:(id)a3 viewControllerName:(id)a4 xpcEndpoint:(id)a5 label:(id)a6 extraInfo:(id)a7
{
}

- (void)_uiStartForMacWithDevice:(id)a3 label:(id)a4 extraInfo:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  if (dword_1006417A0 <= 30 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _uiStartForMacWithDevice:label:extraInfo:]",  30LL,  "%@ not supported\n",  v7,  v9);
  }
}

- (void)_uiStopIfNeededWithDevice:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (dword_1006417A0 <= 30
    && ((v6 = v3, dword_1006417A0 != -1) || (v5 = _LogCategory_Initialize(&dword_1006417A0, 30LL), int v4 = v6, v5)))
  {
    LogPrintF(&dword_1006417A0, "-[SDSetupAgent _uiStopIfNeededWithDevice:]", 30LL, "Stop UI not supported\n");
  }

  else
  {
  }

- (void)_watchFastScanStartIfAllowed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  if ((unint64_t)UpTicksToSeconds(v5 - self->_watchFastScanLastEndTicks) >= 0x64
    && -[SFBLEScanner scanRate](self->_watchSetupScanner, "scanRate") != (id)50)
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _watchFastScanStartIfAllowed:]",  50LL,  "Fast scan rate start for %@\n",  v4);
    }

    -[SFBLEScanner setScanRate:](self->_watchSetupScanner, "setScanRate:", 50LL);
    if (!self->_watchFastScanTimer)
    {
      uint64_t v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
      watchFastScanTimer = self->_watchFastScanTimer;
      self->_watchFastScanTimer = v6;

      id v8 = self->_watchFastScanTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10003FEE0;
      handler[3] = &unk_1005CB2F8;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
      SFDispatchTimerSet(self->_watchFastScanTimer, 10.0, -1.0, -10.0);
      dispatch_resume((dispatch_object_t)self->_watchFastScanTimer);
    }
  }
}

- (void)_watchFastScanStop
{
  if (-[SFBLEScanner scanRate](self->_watchSetupScanner, "scanRate") != (id)20)
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _watchFastScanStop]", 50LL, "Fast scan rate stop\n");
    }

    -[SFBLEScanner setScanRate:](self->_watchSetupScanner, "setScanRate:", 20LL);
    self->_watchFastScanLastEndTicks = mach_absolute_time();
    watchFastScanTimer = self->_watchFastScanTimer;
    if (watchFastScanTimer)
    {
      uint64_t v5 = watchFastScanTimer;
      dispatch_source_cancel(v5);
      id v4 = self->_watchFastScanTimer;
      self->_watchFastScanTimer = 0LL;
    }
  }

- (void)_watchFound:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_watchSetupScanner) {
    BOOL v6 = gSDProxCardsSuppressed == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6
    || -[SDSetupAgent _uiShowing](self, "_uiShowing")
    || (-[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags") & 0x7C809) != 0)
  {
    goto LABEL_48;
  }

  id v7 = 0LL;
  id v8 = 0LL;
  id v9 = 0LL;
  if (-[SDSetupAgent _screenLocked](self, "_screenLocked") || !v5) {
    goto LABEL_47;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_watchSetupDevices,  "objectForKeyedSubscript:",  v5));

  if (v10)
  {
LABEL_48:
    id v7 = 0LL;
    id v8 = 0LL;
LABEL_42:
    id v9 = 0LL;
    goto LABEL_47;
  }

  -[SDSetupAgent _watchFastScanStartIfAllowed:](self, "_watchFastScanStartIfAllowed:", v4);
  id v7 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  -[SFDevice updateWithBLEDevice:](v7, "updateWithBLEDevice:", v4);
  -[SFDevice setDeviceActionType:](v7, "setDeviceActionType:", 5LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 setupProximityEstimator]);
  if (!v8)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 bleProximityEstimatorForActionType:5 device:v7]);

    [v4 setSetupProximityEstimator:v8];
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v5));

  if (!v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v7, v5);
  }
  unint64_t v13 = -[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v7);
  if (v13 == 2
    && dword_1006417A0 <= 50
    && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
  {
    LogPrintF(&dword_1006417A0, "-[SDSetupAgent _watchFound:]", 50LL, "#ni_estimator watch triggered");
  }

  else {
    [v8 updateWithSFBLEDevice:v4];
  }
  uint64_t v14 = SFStoreDemoMode();
  if ((v14 & 1) != 0 || (SFLostMode(v14, v15) & 1) != 0) {
    goto LABEL_42;
  }
  watchSetupDevices = self->_watchSetupDevices;
  if (!watchSetupDevices)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v18 = self->_watchSetupDevices;
    self->_watchSetupDevices = v17;

    watchSetupDevices = self->_watchSetupDevices;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](watchSetupDevices, "setObject:forKeyedSubscript:", v4, v5);
  if (self->_triggeredUIWatchSetup)
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _watchFound:]",  50LL,  "Ignoring proximity WatchSetup with another %@\n",  v4);
    }

    goto LABEL_42;
  }

  self->_triggeredUIWatchSetup = 1;
  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[SDSetupAgent _watchMigrating:](self, "_watchMigrating:", v5));
  if (!v19)
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _watchFound:]", 50LL, "Triggering proximity WatchSetup with %@\n", v4);
    }

    -[SDSetupAgent _watchFastScanStop](self, "_watchFastScanStop");
    -[SDSetupAgent _uiStartSetupWatch:](self, "_uiStartSetupWatch:", v7);
    v25[0] = @"_cat";
    v25[1] = @"_op";
    v26[0] = @"WatchSetup";
    v26[1] = @"Triggered";
    v25[2] = @"rssi";
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v8 estimatedRSSI]));
    v26[2] = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  3LL));
    SFDashboardLogJSON();

    goto LABEL_42;
  }

  id v9 = (void *)v19;
  uint64_t v20 = mach_absolute_time();
  unint64_t v21 = v20 - self->_watchMigrationLastTicks;
  if (v21 >= SecondsToUpTicks(14400LL))
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _watchFound:]",  50LL,  "Triggering proximity WatchMigration with %@\n",  v4);
    }

    -[SDSetupAgent _watchFastScanStop](self, "_watchFastScanStop");
    self->_watchMigrationLastTicks = v20;
    -[SDSetupAgent _watchStartMigration:](self, "_watchStartMigration:", v9);
  }

  else if (dword_1006417A0 <= 50 {
         && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
  }
  {
    uint64_t v22 = UpTicksToSeconds(v21);
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _watchFound:]",  50LL,  "Ignoring WatchMigration...too soon (%llu < %d secs)\n",  v22,  14400);
  }

- (id)_watchMigrating:(id)a3
{
  id v4 = a3;
  if (self->_watchMigrationEnabled)
  {
    uint64_t v5 = -[objc_class sharedInstance](off_100641810(), "sharedInstance");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getDevicesMatching:&stru_1005CBA88]);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          uint64_t v13 = off_100641828();
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", v14, (void)v17));

          if ([v15 isEqual:v4])
          {
            id v9 = v12;

            goto LABEL_12;
          }
        }

        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)_watchStartMigration:(id)a3
{
  id v3 = a3;
  id v4 = -[objc_class sharedMigrator](off_100641830(), "sharedMigrator");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000407A8;
  v7[3] = &unk_1005CB3E8;
  id v8 = v3;
  id v6 = v3;
  [v5 beginMigrationWithDevice:v6 withCompletion:v7];
}

- (void)_wifiStateChanged
{
  if (-[CUSystemMonitor wifiState](self->_systemMonitor, "wifiState") == 40
    && (self->_renableB238SetupAfterWiFi || self->_triggeredUIRepair))
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _wifiStateChanged]",  30LL,  "Resetting prox card triggers now that WiFi is connected\n");
    }

    -[SDSetupAgent _resetTriggers](self, "_resetTriggers");
  }

- (void)_ensureServerStarted
{
  if (!self->_pinPairService)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _ensureServerStarted]", 30LL, "PINPair start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___SFService);
    pinPairService = self->_pinPairService;
    self->_pinPairService = v3;

    -[SFService setIdentifier:](self->_pinPairService, "setIdentifier:", SFServiceIdentifierPINPair);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100040A84;
    v8[3] = &unk_1005CB3E8;
    v8[4] = self;
    -[SFService setErrorHandler:](self->_pinPairService, "setErrorHandler:", v8);
    -[SFService setInvalidationHandler:](self->_pinPairService, "setInvalidationHandler:", &stru_1005CBAA8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100040B94;
    v7[3] = &unk_1005CBAD0;
    void v7[4] = self;
    -[SFService setRequestMessageHandler:](self->_pinPairService, "setRequestMessageHandler:", v7);
    uint64_t v5 = self->_pinPairService;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100040C2C;
    v6[3] = &unk_1005CB3E8;
    v6[4] = self;
    -[SFService activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_ensureServerStopped
{
  if (self->_pinPairDialogToken)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _ensureServerStopped]", 30LL, "PINPair hide PIN on stop\n");
    }

    -[PBSMediaRemoteServiceInterface dismissPinDialogWithToken:]( self->_pbsMediaService,  "dismissPinDialogWithToken:",  self->_pinPairDialogToken);
    id pinPairDialogToken = self->_pinPairDialogToken;
    self->_id pinPairDialogToken = 0LL;
  }

  pbsMediaService = self->_pbsMediaService;
  self->_pbsMediaService = 0LL;

  if (self->_pinPairService)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _ensureServerStopped]", 30LL, "PINPair service stop\n");
    }

    -[SFService invalidate](self->_pinPairService, "invalidate");
    pinPairService = self->_pinPairService;
    self->_pinPairService = 0LL;
  }

  if (self->_pinPairSession)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _ensureServerStopped]", 30LL, "PINPair session stop\n");
    }

    -[SFPINPairSession invalidate](self->_pinPairSession, "invalidate");
    pinPairSession = self->_pinPairSession;
    self->_pinPairSession = 0LL;
  }

  pinPairUUID = self->_pinPairUUID;
  self->_pinPairUUID = 0LL;
}

- (void)_pinPairHandleRequest:(id)a3
{
  id v4 = a3;
  v16[0] = 0LL;
  v16[1] = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 headerFields]);
  uint64_t UUIDEx = CFDictionaryGetUUIDEx(v5, @"sid", 0LL, v16);

  if ((_DWORD)UUIDEx)
  {
    if (dword_1006417A0 <= 60
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 60LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _pinPairHandleRequest:]",  60LL,  "### PINPair request no UUID: %#m\n",  UUIDEx);
    }
  }

  else
  {
    id v7 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v16);
    if (v7)
    {
      id v8 = v7;
      if ((-[NSUUID isEqual:](self->_pinPairUUID, "isEqual:", v7) & 1) == 0 && self->_pinPairSession)
      {
        if (dword_1006417A0 <= 30
          && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
        {
          LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _pinPairHandleRequest:]",  30LL,  "PINPair session %@ ending for %@\n",  self->_pinPairUUID,  v8);
        }

        -[SFPINPairSession invalidate](self->_pinPairSession, "invalidate");
        pinPairSession = self->_pinPairSession;
        self->_pinPairSession = 0LL;
      }

      uint64_t v10 = self->_pinPairSession;
      if (!v10)
      {
        if (dword_1006417A0 <= 30
          && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
        {
          LogPrintF(&dword_1006417A0, "-[SDSetupAgent _pinPairHandleRequest:]", 30LL, "PINPair session create %@\n", v8);
        }

        objc_storeStrong((id *)&self->_pinPairUUID, v8);
        int v11 = objc_alloc_init(&OBJC_CLASS___SFPINPairSession);
        unsigned __int8 v12 = self->_pinPairSession;
        self->_pinPairSession = v11;

        -[SFPINPairSession setDispatchQueue:](self->_pinPairSession, "setDispatchQueue:", self->_dispatchQueue);
        -[SFPINPairSession setSfService:](self->_pinPairSession, "setSfService:", self->_pinPairService);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1000411BC;
        void v15[3] = &unk_1005CB3E8;
        v15[4] = self;
        -[SFPINPairSession setCompletionHandler:](self->_pinPairSession, "setCompletionHandler:", v15);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100041268;
        void v14[3] = &unk_1005CBAF8;
        v14[4] = self;
        -[SFPINPairSession setShowPINHandler:](self->_pinPairSession, "setShowPINHandler:", v14);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100041270;
        v13[3] = &unk_1005CB2F8;
        v13[4] = self;
        -[SFPINPairSession setHidePINHandler:](self->_pinPairSession, "setHidePINHandler:", v13);
        -[SFPINPairSession activate](self->_pinPairSession, "activate");
        uint64_t v10 = self->_pinPairSession;
      }

      -[SFPINPairSession handleServerRequest:](v10, "handleServerRequest:", v4);
    }

    else if (dword_1006417A0 <= 60 {
           && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 60LL)))
    }
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _pinPairHandleRequest:]", 60LL, "### PINPair request UUID failed\n");
    }
  }
}

- (void)_pinPairHandleShowPIN:(id)a3
{
  id v4 = (__CFString *)a3;
  if (dword_1006417A0 <= 30 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
  {
    int v5 = IsAppleInternalBuild();
    id v6 = @"*";
    if (v5) {
      id v6 = v4;
    }
    LogPrintF(&dword_1006417A0, "-[SDSetupAgent _pinPairHandleShowPIN:]", 30LL, "PINPair show PIN '%@'\n", v6);
  }

  if (!self->_pbsMediaService)
  {
    id v7 = -[objc_class sharedConnection](off_100641838(), "sharedConnection");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (PBSMediaRemoteServiceInterface *)objc_claimAutoreleasedReturnValue([v8 mediaRemoteServiceProxy]);
    pbsMediaService = self->_pbsMediaService;
    self->_pbsMediaService = v9;

    if (!self->_pbsMediaService
      && dword_1006417A0 <= 90
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 90LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _pinPairHandleShowPIN:]", 90LL, "### PINPair PBS proxy failed\n");
    }
  }

  if (self->_pinPairDialogToken)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _pinPairHandleShowPIN:]", 30LL, "PINPair hide old PIN\n");
    }

    -[PBSMediaRemoteServiceInterface dismissPinDialogWithToken:]( self->_pbsMediaService,  "dismissPinDialogWithToken:",  self->_pinPairDialogToken);
    id pinPairDialogToken = self->_pinPairDialogToken;
    self->_id pinPairDialogToken = 0LL;
  }

  id v12 = off_100641840();
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v29[0] = v13;
  uint64_t v15 = SFLocalizedStringForKey(@"PIN_PAIR_DIALOG_MESSAGE", v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v30[0] = v16;
  id v17 = off_100641848();
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v29[1] = v18;
  v30[1] = v4;
  id v19 = off_100641850();
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v29[2] = v20;
  v30[2] = &off_1005F74B0;
  id v21 = off_100641858();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v29[3] = v22;
  uint64_t v24 = SFLocalizedStringForKey(@"PIN_PAIR_DIALOG_TITLE", v23);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v30[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  4LL));

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[PBSMediaRemoteServiceInterface showPinDialogWithOptions:completion:]( self->_pbsMediaService,  "showPinDialogWithOptions:completion:",  v26,  &stru_1005CBB18));
  id v28 = self->_pinPairDialogToken;
  self->_id pinPairDialogToken = v27;

  if (!self->_pinPairDialogToken
    && dword_1006417A0 <= 90
    && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 90LL)))
  {
    LogPrintF(&dword_1006417A0, "-[SDSetupAgent _pinPairHandleShowPIN:]", 90LL, "### PINPair dialog failed\n");
  }
}

- (void)_pinPairHandleHidePIN
{
  if (self->_pinPairDialogToken)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _pinPairHandleHidePIN]", 30LL, "PINPair hide PIN\n");
    }

    -[PBSMediaRemoteServiceInterface dismissPinDialogWithToken:]( self->_pbsMediaService,  "dismissPinDialogWithToken:",  self->_pinPairDialogToken);
    id pinPairDialogToken = self->_pinPairDialogToken;
    self->_id pinPairDialogToken = 0LL;
  }

  pbsMediaService = self->_pbsMediaService;
  self->_pbsMediaService = 0LL;
}

- (void)_pwsHandleUserResponse:(int)a3 device:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v6 = a5;
  if (dword_1006417A0 <= 60 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 60LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _pwsHandleUserResponse:device:info:]",  60LL,  "### pwsHandleUserResponse not supported on current platform\n");
  }
}

- (void)_pwsHandleProgressEvent:(unsigned int)a3 info:(id)a4
{
  int v5 = (__CFString *)a4;
  id v6 = v5;
  if (dword_1006417A0 > 30) {
    goto LABEL_38;
  }
  uint64_t v10 = v5;
  if (dword_1006417A0 == -1)
  {
    int v8 = _LogCategory_Initialize(&dword_1006417A0, 30LL);
    id v6 = v10;
    if (!v8) {
      goto LABEL_38;
    }
  }

  if ((int)a3 <= 49)
  {
    if ((int)a3 > 29)
    {
      switch(a3)
      {
        case 0x1Eu:
          id v7 = "Error";
          break;
        case 0x1Fu:
          id v7 = "SessionStarted";
          break;
        case 0x20u:
          id v7 = "SessionEnded";
          break;
        case 0x21u:
          id v7 = "SessionSecured";
          break;
        case 0x28u:
          id v7 = "PreAuthStart";
          break;
        default:
          goto LABEL_34;
      }

      goto LABEL_35;
    }

    switch(a3)
    {
      case 0u:
        id v7 = "Invalid";
        goto LABEL_35;
      case 0xAu:
        id v7 = "Start";
        goto LABEL_35;
      case 0x14u:
        id v7 = "Final";
        goto LABEL_35;
    }

- (void)_repairEnsuredStarted
{
  uint64_t v2 = self;
  if (self->_problemNotifyToken == -1)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairEnsuredStarted]", 30LL, "TTF: Problem monitoring start\n");
    }

    self = (SDSetupAgent *)notify_register_check("com.apple.sharing.problems", &v2->_problemNotifyToken);
  }

  if (v2->_cfuNotifyToken == -1 && (v2->_prefRepairAccounts || v2->_prefRepairHomeKit))
  {
    dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100041EB0;
    handler[3] = &unk_1005CB7B8;
    handler[4] = v2;
    notify_register_dispatch("com.apple.corefollowup.items_changed", &v2->_cfuNotifyToken, dispatchQueue, handler);
    self = (SDSetupAgent *)-[SDSetupAgent _repairHandleCFUItemsChanged](v2, "_repairHandleCFUItemsChanged");
  }

  if (!v2->_manateeMonitor && v2->_cdpEnabled)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    manateeMonitor = v2->_manateeMonitor;
    v2->_manateeMonitor = v4;

    -[CUSystemMonitor setDispatchQueue:](v2->_manateeMonitor, "setDispatchQueue:", v2->_dispatchQueue);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100041F3C;
    void v26[3] = &unk_1005CB2F8;
    v26[4] = v2;
    -[CUSystemMonitor setManateeChangedHandler:](v2->_manateeMonitor, "setManateeChangedHandler:", v26);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100041F44;
    void v25[3] = &unk_1005CB2F8;
    v25[4] = v2;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](v2->_manateeMonitor, "setPrimaryAppleIDChangedHandler:", v25);
    id v6 = v2->_manateeMonitor;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100041F4C;
    v24[3] = &unk_1005CB2F8;
    v24[4] = v2;
    self = (SDSetupAgent *)-[CUSystemMonitor activateWithCompletion:](v6, "activateWithCompletion:", v24);
  }

  if (!v2->_vpnCnx && v2->_prefRepairVPN)
  {
    id v7 = (NEVPNConnection *)-[objc_class createConnectionForEnabledEnterpriseConfiguration]( off_100641860(),  "createConnectionForEnabledEnterpriseConfiguration");
    vpnCnx = v2->_vpnCnx;
    v2->_vpnCnx = v7;

    -[NEVPNConnection addObserver:forKeyPath:options:context:]( v2->_vpnCnx,  "addObserver:forKeyPath:options:context:",  v2,  @"lastDisconnectError",  0LL,  0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NEVPNConnection lastDisconnectError](v2->_vpnCnx, "lastDisconnectError"));
    if (dword_1006417A0 <= 40
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 40LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairEnsuredStarted]", 40LL, "TTF: VPN initial: %{error}\n", v9);
    }

    -[SDSetupAgent _repairVPNError:](v2, "_repairVPNError:", v9);
  }

  if (!v2->_wifiHealthMonitor && v2->_prefRepairWiFi)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___SFWiFiHealthMonitor);
    wifiHealthMonitor = v2->_wifiHealthMonitor;
    v2->_wifiHealthMonitor = v10;

    -[SFWiFiHealthMonitor setDispatchQueue:](v2->_wifiHealthMonitor, "setDispatchQueue:", v2->_dispatchQueue);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100041F54;
    v23[3] = &unk_1005CBB40;
    v23[4] = v2;
    -[SFWiFiHealthMonitor setStatusHandler:](v2->_wifiHealthMonitor, "setStatusHandler:", v23);
    self = (SDSetupAgent *)-[SFWiFiHealthMonitor activate](v2->_wifiHealthMonitor, "activate");
  }

  if (SFDeviceClassCodeGet(self, a2) == 4 && v2->_cnsNotifyToken == -1)
  {
    id v12 = (dispatch_queue_s *)v2->_dispatchQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10004207C;
    v22[3] = &unk_1005CB7B8;
    v22[4] = v2;
    notify_register_dispatch(kCNUserInteractionRequirementNotifyKey, &v2->_cnsNotifyToken, v12, v22);
    -[SDSetupAgent _repairHandleCNSStateChanged](v2, "_repairHandleCNSStateChanged");
  }

  if (!v2->_repairService)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairEnsuredStarted]", 30LL, "TTF: RepairService start\n");
    }

    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___SFDeviceRepairService);
    repairService = v2->_repairService;
    v2->_repairService = v13;

    -[SFDeviceRepairService setDispatchQueue:](v2->_repairService, "setDispatchQueue:", v2->_dispatchQueue);
    -[SFDeviceRepairService setProblemFlags:](v2->_repairService, "setProblemFlags:", 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 myAltDSID]);
    -[SFDeviceRepairService setAltDSID:](v2->_repairService, "setAltDSID:", v16);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100042108;
    v21[3] = &unk_1005CBB68;
    v21[4] = v2;
    -[SFDeviceRepairService setProgressHandler:](v2->_repairService, "setProgressHandler:", v21);
    -[SFDeviceRepairService activate](v2->_repairService, "activate");
  }

  if (!v2->_repairTimer)
  {
    dispatch_source_t v17 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v2->_dispatchQueue);
    repairTimer = v2->_repairTimer;
    v2->_repairTimer = (OS_dispatch_source *)v17;

    id v19 = (dispatch_source_s *)v2->_repairTimer;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100042944;
    v20[3] = &unk_1005CB2F8;
    v20[4] = v2;
    dispatch_source_set_event_handler(v19, v20);
    SFDispatchTimerSet(v2->_repairTimer, 300.0, 300.0, -4.0);
    dispatch_activate((dispatch_object_t)v2->_repairTimer);
  }

  -[SDSetupAgent _repairProblemFlagsChanged](v2, "_repairProblemFlagsChanged");
}

- (void)_repairEnsuredStopped
{
  int cfuNotifyToken = self->_cfuNotifyToken;
  if (cfuNotifyToken != -1)
  {
    notify_cancel(cfuNotifyToken);
    self->_int cfuNotifyToken = -1;
  }

  -[CUSystemMonitor invalidate](self->_manateeMonitor, "invalidate");
  manateeMonitor = self->_manateeMonitor;
  self->_manateeMonitor = 0LL;

  self->_manateeProblem = 0;
  repairTimer = self->_repairTimer;
  if (repairTimer)
  {
    id v6 = repairTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_repairTimer;
    self->_repairTimer = 0LL;
  }

  vpnCnx = self->_vpnCnx;
  if (vpnCnx)
  {
    -[NEVPNConnection removeObserver:forKeyPath:]( vpnCnx,  "removeObserver:forKeyPath:",  self,  @"lastDisconnectError");
    id v9 = self->_vpnCnx;
    self->_vpnCnx = 0LL;
  }

  -[SFWiFiHealthMonitor invalidate](self->_wifiHealthMonitor, "invalidate");
  wifiHealthMonitor = self->_wifiHealthMonitor;
  self->_wifiHealthMonitor = 0LL;

  *(_WORD *)&self->_wifiBad = 0;
  int cnsNotifyToken = self->_cnsNotifyToken;
  if (cnsNotifyToken != -1)
  {
    notify_cancel(cnsNotifyToken);
    self->_int cnsNotifyToken = -1;
  }

  self->_cnsNeedsUI = 0;
  self->_problemFlags = 0LL;
  -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  if (self->_repairService)
  {
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairEnsuredStopped]", 30LL, "TTF: RepairService stop\n");
    }

    -[SFDeviceRepairService invalidateWithFlags:](self->_repairService, "invalidateWithFlags:", 1LL);
    repairService = self->_repairService;
    self->_repairService = 0LL;
  }

  int problemNotifyToken = self->_problemNotifyToken;
  if (problemNotifyToken != -1)
  {
    notify_cancel(problemNotifyToken);
    self->_int problemNotifyToken = -1;
    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairEnsuredStopped]", 30LL, "TTF: Problem monitoring stop\n");
    }
  }

- (void)_renewAccountIfNecessaryForCFUItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void (**)(void, void))v7;
  if (self->_prefRepairAccounts)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 indexesOfObjectsPassingTest:&stru_1005CBBA8]);
    if ([v9 count])
    {
      if (!self->_lastRenewalAttempt) {
        goto LABEL_6;
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v10 timeIntervalSinceDate:self->_lastRenewalAttempt];
      double v12 = v11;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v13 timeIntervalSinceDate:self->_lastRenewalAttempt];
      double v15 = v14;

      if (v12 >= 0.0)
      {
        if (v15 >= 86400.0)
        {
LABEL_6:
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
          id v17 = sub_100114D1C(v16);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          id v19 = v18;
          if (v18)
          {
            if (![v18 isWarmingUp])
            {
              if (dword_1006417A0 <= 30
                && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
              {
                LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]",  30LL,  "Attempting to renew accounts instead of posting a problem\n");
              }

              __int128 v20 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
              lastRenewalAttempt = self->_lastRenewalAttempt;
              self->_lastRenewalAttempt = v20;

              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472LL;
              v22[2] = sub_100042FA4;
              v22[3] = &unk_1005CBBD0;
              uint64_t v25 = v8;
              id v23 = v6;
              id v24 = v9;
              [v16 renewCredentialsForAccount:v19 completion:v22];

              goto LABEL_30;
            }

            if (dword_1006417A0 <= 30
              && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
            {
              LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]",  30LL,  "Primary account is warming up, not renewing credentials\n");
            }
          }

          else if (dword_1006417A0 <= 90 {
                 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 90LL)))
          }
          {
            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]",  90LL,  "No primary account found to renew\n");
          }

          ((void (**)(void, id))v8)[2](v8, v6);
LABEL_30:

          goto LABEL_31;
        }
      }

      else if (v15 <= -86400.0)
      {
        goto LABEL_6;
      }

      if (dword_1006417A0 <= 30
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
      {
        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _renewAccountIfNecessaryForCFUItems:completion:]",  30LL,  "Already attempted a repair today\n");
      }
    }

    ((void (**)(void, id))v8)[2](v8, v6);
LABEL_31:

    goto LABEL_32;
  }

  (*((void (**)(id, id))v7 + 2))(v7, v6);
LABEL_32:
}

- (void)_repairHandleCFUItemsChanged
{
  id v3 = [objc_alloc(off_100641868()) initWithClientIdentifier:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100043150;
  v4[3] = &unk_1005CBC48;
  v4[4] = self;
  [v3 pendingFollowUpItemsWithCompletion:v4];
}

- (void)_repairHandleCFUItems:(id)a3
{
  id v4 = a3;
  unint64_t problemFlags = self->_problemFlags;
  if (-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
  {
    uint64_t v6 = problemFlags & 0xFFBAFFA7;
  }

  else
  {
    uint64_t v6 = problemFlags & 0xFFB8FFA1;
    if (self->_manateeProblem) {
      uint64_t v6 = problemFlags & 0xFFB8FFA1 | 0x20000LL;
    }
  }

  if (self->_wifiBad || self->_cnsNeedsUI) {
    v6 |= 0x10uLL;
  }
  if (self->_wifiBad8021x) {
    unint64_t v7 = v6 | 0x10000;
  }
  else {
    unint64_t v7 = v6;
  }
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      double v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);
        if (v13)
        {
          if (dword_1006417A0 <= 50
            && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
          {
            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairHandleCFUItems:]",  50LL,  "TTF: CFU item reported: '%@'\n",  v13);
          }

          if (self->_prefRepairHomeKit)
          {
            id v14 = off_100641870();
            double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            unsigned int v16 = [v13 isEqual:v15];

            if (v16)
            {
LABEL_26:
              v7 |= 8uLL;
              goto LABEL_58;
            }
          }

          if ([v13 isEqual:@"com.apple.homekit.PrimaryResident"])
          {
            v7 |= 0x400000uLL;
            goto LABEL_58;
          }

          if (self->_prefRepairAccounts)
          {
            if (sub_100042E28(v12) && !-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
            {
              -[CUSystemMonitor forceManateeStateRefresh](self->_manateeMonitor, "forceManateeStateRefresh");
              if ((SFIsDeviceAppleTV(-[SDSetupAgent _fetchSymptomsReport](self, "_fetchSymptomsReport")) & 1) != 0)
              {
                __int128 v18 = 0LL;
              }

              else
              {
                id v19 = -[objc_class defaultStore](off_100641878(), "defaultStore");
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v20 activeAccount]);
              }

              uint64_t v21 = 6LL;
              if (!v18) {
                uint64_t v21 = 2LL;
              }
              v7 |= v21;
              goto LABEL_58;
            }

            if (self->_prefRepairAccounts
              && [v13 isEqual:@"com.apple.SSFollowUpIdentifier.RenewCredentials"]
              && !-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
            {
              goto LABEL_57;
            }
          }

          if ([v13 isEqual:@"RepairCDPState"])
          {
            dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10004391C;
            block[3] = &unk_1005CB2F8;
            block[4] = self;
            dispatch_async(dispatchQueue, block);
            goto LABEL_58;
          }

          if ([v13 isEqual:@"x-bt"])
          {
            v7 |= 0x200uLL;
            goto LABEL_58;
          }

          if ([v13 isEqual:@"x-cdp"])
          {
            v7 |= 0x20000uLL;
            goto LABEL_58;
          }

          if ([v13 isEqual:@"x-hw"])
          {
            v7 |= 0x100uLL;
            goto LABEL_58;
          }

          if ([v13 isEqual:@"x-icloud"])
          {
            v7 |= 2uLL;
            goto LABEL_58;
          }

          if ([v13 isEqual:@"x-inet"])
          {
            v7 |= 0x80uLL;
            goto LABEL_58;
          }

          if ([v13 isEqual:@"x-itunes"])
          {
LABEL_57:
            v7 |= 4uLL;
            goto LABEL_58;
          }

          if ([v13 isEqual:@"x-profile"])
          {
            v7 |= 0x40000uLL;
          }

          else if ([v13 isEqual:@"x-recovery"])
          {
            v7 |= 0x800uLL;
          }

          else if ([v13 isEqual:@"x-StereoError"])
          {
            v7 |= 0x4000uLL;
          }

          else if ([v13 isEqual:@"x-StereoNotFound"])
          {
            v7 |= 0x1000uLL;
          }

          else if ([v13 isEqual:@"x-StereoVersion"])
          {
            v7 |= 0x2000uLL;
          }

          else if ([v13 isEqual:@"x-thermal"])
          {
            v7 |= 0x400uLL;
          }

          else if ([v13 isEqual:@"x-wifi"])
          {
            v7 |= 0x10uLL;
          }

          else if ([v13 isEqual:@"x-wifi8021x"])
          {
            v7 |= 0x10000uLL;
          }

          else if ([v13 isEqual:@"x-wifiperf"])
          {
            v7 |= 0x40uLL;
          }

          else if ([v13 isEqual:@"x-vpn"])
          {
            v7 |= 0x8000uLL;
          }

          else if ([v13 isEqual:@"x-netnoshare"])
          {
            v7 |= 0x80000uLL;
          }

          else if ([v13 isEqual:@"x-netneedprofile"])
          {
            v7 |= 0x100000uLL;
          }

          else if ([v13 isEqual:@"x-captivenetwork"])
          {
            v7 |= 0x200000uLL;
          }

          else if ([v13 isEqual:@"x-hkprimary"])
          {
            v7 |= 0x400000uLL;
          }
        }

        else if (dword_1006417A0 <= 60 {
               && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 60LL)))
        }
        {
          LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairHandleCFUItems:]",  60LL,  "TTF: ### CFU item without identifier: %@\n",  v12);
        }

- (BOOL)_useSymptomsReport
{
  uint64_t v2 = _os_feature_enabled_impl("AppleIDSetup", "SandstoneRepair");
  if ((_DWORD)v2) {
    LOBYTE(v2) = SFDeviceClassCodeGet(v2, v3) == 6;
  }
  return v2;
}

- (void)_fetchSymptomsReport
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 myAltDSID]);

  if (v4)
  {
    if (!self->_repairController)
    {
      int v5 = (AISRepairController *)objc_alloc_init(off_100641880());
      repairController = self->_repairController;
      self->_repairController = v5;
    }

    if (dword_1006417A0 <= 30
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
    {
      LogPrintF(&dword_1006417A0, "-[SDSetupAgent _fetchSymptomsReport]", 30LL, "TTF: Fetching symptoms report\n");
    }

    id v7 = [objc_alloc(off_100641888()) initWithAltDSID:v4];
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  AIDAServiceTypeCloud,  AIDAServiceTypeStore,  0LL));
    [v7 setRequiredServiceTypes:v8];

    id v9 = self->_repairController;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100043B18;
    v10[3] = &unk_1005CBC70;
    v10[4] = self;
    -[AISRepairController generateSymptomReportWithContext:completionHandler:]( v9,  "generateSymptomReportWithContext:completionHandler:",  v7,  v10);
  }

  else if (dword_1006417A0 <= 30 {
         && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
  }
  {
    LogPrintF(&dword_1006417A0, "-[SDSetupAgent _fetchSymptomsReport]", 30LL, "No altDSID\n");
  }
}

- (void)_repairHandleCompletion
{
  repairTimer = self->_repairTimer;
  if (repairTimer) {
    SFDispatchTimerSet(repairTimer, 300.0, 300.0, -4.0);
  }
  self->_unint64_t problemFlags = 0LL;
  -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  -[SFWiFiHealthMonitor reset](self->_wifiHealthMonitor, "reset");
}

- (void)_repairHandleManateeChanged
{
  manateeMonitor = self->_manateeMonitor;
  if (manateeMonitor && -[CUSystemMonitor primaryAppleIDIsHSA2](manateeMonitor, "primaryAppleIDIsHSA2"))
  {
    if (-[SDSetupAgent _useSymptomsReport](self, "_useSymptomsReport"))
    {
      -[SDSetupAgent _fetchSymptomsReport](self, "_fetchSymptomsReport");
    }

    else
    {
      unsigned int v4 = -[CUSystemMonitor manateeState](self->_manateeMonitor, "manateeState");
      self->_manateeProblem = v4 == 1;
      unint64_t problemFlags = self->_problemFlags;
      unint64_t v6 = problemFlags | 0x20000;
      if (v4 != 1) {
        unint64_t v6 = self->_problemFlags & 0xFFFDFFFF;
      }
      if (v6 != problemFlags)
      {
        self->_unint64_t problemFlags = v6;
        -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
      }
    }
  }

- (void)_repairHandleCNSStateChanged
{
  unint64_t problemFlags = self->_problemFlags;
  int IsRequired = CNUserInteractionIsRequired();
  if (dword_1006417A0 <= 30 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairHandleCNSStateChanged]",  30LL,  "TTF: Captive state changed (needsUI: %d -> %d)",  self->_cnsNeedsUI,  IsRequired != 0);
  }
  if (IsRequired)
  {
    self->_cnsNeedsUI = 1;
    problemFlags |= 0x10uLL;
  }

  else if (self->_cnsNeedsUI)
  {
    self->_cnsNeedsUI = 0;
    if (self->_wifiBad) {
      problemFlags |= 0x10uLL;
    }
    else {
      unint64_t problemFlags = problemFlags & 0xFFFFFFEF;
    }
  }

  if (problemFlags != self->_problemFlags)
  {
    self->_unint64_t problemFlags = problemFlags;
    -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  }

- (void)_repairProblemCheck
{
  if (dword_1006417A0 <= 30 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
  {
    unsigned int v3 = -[CUSystemMonitor manateeState](self->_manateeMonitor, "manateeState");
    if (v3 > 2) {
      unsigned int v4 = "?";
    }
    else {
      unsigned int v4 = off_1005CBDC0[v3];
    }
    LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairProblemCheck]", 30LL, "Repair periodic check: CDP %s\n", v4);
  }

  -[SDSetupAgent _repairHandleManateeChanged](self, "_repairHandleManateeChanged");
}

- (void)_repairProblemFlagsChanged
{
  unint64_t problemFlags = self->_problemFlags;
  if (dword_1006417A0 <= 30 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairProblemFlagsChanged]",  30LL,  "TTF: Problem flags changed: %#ll{flags}\n",  problemFlags,  &unk_1004CAB56);
  }
  if (problemFlags) {
    uint64_t v4 = problemFlags | 1;
  }
  else {
    uint64_t v4 = 0LL;
  }
  -[SFDeviceRepairService setProblemFlags:](self->_repairService, "setProblemFlags:", v4);
  int problemNotifyToken = self->_problemNotifyToken;
  if (problemNotifyToken != -1)
  {
    notify_set_state(problemNotifyToken, v4);
    notify_post("com.apple.sharing.problems");
  }

- (void)_repairSilentStart:(id)a3
{
  id v4 = a3;
  if (([v4 problemFlags] & 0x10000) != 0)
  {
    if (dword_1006417A0 <= 50
      && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
    {
      LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairSilentStart:]",  50LL,  "Ignoring proximity repair for WiFi 802.1x (needs user)\n");
    }
  }

  else
  {
    if (([v4 problemFlags] & 0x10) != 0)
    {
      int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
      unsigned int v6 = [v5 hasPrefix:@"AudioAccessory"];

      if (v6)
      {
        id v7 = (void *)WiFiCopyCurrentNetworkInfo(0LL);
        if (CFDictionaryGetInt64(v7, @"likelyCaptive", 0LL))
        {
          if (dword_1006417A0 <= 50
            && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL)))
          {
            LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairSilentStart:]",  50LL,  "Ignoring proximity repair for captive WiFi (needs user)\n");
          }

- (void)_repairSilentProgress:(unsigned int)a3 info:(id)a4
{
  id v13 = (__CFString *)a4;
  if (dword_1006417A0 <= 30 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
  {
    unsigned int v6 = sub_1000421BC(a3);
    id v7 = &stru_1005E3958;
    if (v13) {
      id v7 = v13;
    }
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairSilentProgress:info:]",  30LL,  "Repair silent progress: %s %##@\n",  v6,  v7);
  }

  switch(a3)
  {
    case 0x14u:
      if (dword_1006417A0 <= 30
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
      {
        LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairSilentProgress:info:]", 30LL, "Repair Finalized\n");
      }

      break;
    case 0x60u:
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession peerDevice](self->_repairSession, "peerDevice"));
      if (dword_1006417A0 <= 30
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
      {
        LogPrintF(&dword_1006417A0, "-[SDSetupAgent _repairSilentProgress:info:]", 30LL, "Repair completed: %@\n", v10);
      }

      -[SFDeviceRepairSession invalidate](self->_repairSession, "invalidate");
      repairSession = self->_repairSession;
      self->_repairSession = 0LL;

      self->_triggeredUIRepair = 0;
      goto LABEL_25;
    case 0x1Eu:
      CFTypeID TypeID = CFErrorGetTypeID();
      uint64_t TypedValue = CFDictionaryGetTypedValue(v13, @"eo", TypeID, 0LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
      -[SDSetupAgent _repairUpdateIDSCache](self, "_repairUpdateIDSCache");
      -[SFDeviceRepairSession invalidate](self->_repairSession, "invalidate");
      double v11 = self->_repairSession;
      self->_repairSession = 0LL;

      if (dword_1006417A0 <= 30
        && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 30LL)))
      {
        LogPrintF( &dword_1006417A0,  "-[SDSetupAgent _repairSilentProgress:info:]",  30LL,  "Repair silent done: %{error}\n",  v10);
      }

- (void)_repairUpdateIDSCache
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession idsIdentifier](self->_repairSession, "idsIdentifier"));
  if (v3)
  {
    id v6 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFDeviceRepairSession peerDevice](self->_repairSession, "peerDevice"));
    if (v4)
    {
      int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      [v5 idsAddCachedIDSIdentifier:v6 device:v4];
    }

    unsigned int v3 = v6;
  }
}

- (void)_repairVPNError:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  unsigned __int8 v5 = [v4 isEqual:@"NEVPNConnectionErrorDomainIPSec"];

  if ((v5 & 1) != 0)
  {
    id v6 = [v9 code];
    unint64_t problemFlags = self->_problemFlags;
    unint64_t v8 = problemFlags | 0x8000;
    if (v6 != (id)21) {
      unint64_t v8 = self->_problemFlags & 0xFFFF7FFF;
    }
  }

  else
  {
    unint64_t problemFlags = self->_problemFlags;
    unint64_t v8 = problemFlags & 0xFFFF7FFF;
  }

  if (v8 != problemFlags)
  {
    self->_unint64_t problemFlags = v8;
    -[SDSetupAgent _repairProblemFlagsChanged](self, "_repairProblemFlagsChanged");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"lastDisconnectError", a4, a5, a6))
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004473C;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100044870;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)testHomeKitDeviceDetected:(id)a3
{
  id v4 = a3;
  if (dword_1006417A0 <= 50 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent testHomeKitDeviceDetected:]",  50LL,  "Testing HomeKit Device Detected (%@)\n",  v4);
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044B68;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testNFCUI:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044C80;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testPairUI:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v6 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000001");
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v6);

  id v7 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v7);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044E5C;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  double v12 = v5;
  id v13 = v4;
  id v9 = v4;
  uint64_t v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testPINShow:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100044F84;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)testPINHide
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044FE8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)testRepairUI:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v6 = objc_alloc(&OBJC_CLASS___NSUUID);
  if ([v4 isEqual:@"-fail"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000002";
  }

  else if ([v4 isEqual:@"-nowifi"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000003";
  }

  else if ([v4 isEqual:@"-badwifi"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000004";
  }

  else
  {
    id v7 = @"00000000-0000-0000-0000-000000000001";
  }

  id v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v8);

  -[SFDevice setName:](v5, "setName:", @"Living Room");
  id v9 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v9);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000451AC;
  block[3] = &unk_1005CB480;
  block[4] = self;
  id v13 = v5;
  double v11 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIB238:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v6 = objc_alloc(&OBJC_CLASS___NSUUID);
  if ([v4 isEqual:@"-fail"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000002";
  }

  else if ([v4 isEqual:@"-code"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000003";
  }

  else if ([v4 isEqual:@"-nowifi"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000004";
  }

  else if ([v4 isEqual:@"-badwifi"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000005";
  }

  else if ([v4 isEqual:@"-noicloud"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000006";
  }

  else if ([v4 isEqual:@"-nohsa2"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000007";
  }

  else if ([v4 isEqual:@"-noitunes"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000008";
  }

  else if ([v4 isEqual:@"-nohome"])
  {
    id v7 = @"00000000-0000-0000-0000-000000000009";
  }

  else if ([v4 isEqual:@"-nokeychain"])
  {
    id v7 = @"00000000-0000-0000-0000-00000000000A";
  }

  else if ([v4 isEqual:@"-sharesplit"])
  {
    id v7 = @"00000000-0000-0000-0000-00000000000B";
  }

  else if ([v4 isEqual:@"-audio"])
  {
    id v7 = @"00000000-0000-0000-0000-00000000000C";
  }

  else if ([v4 isEqual:@"-siri"])
  {
    id v7 = @"00000000-0000-0000-0000-00000000000D";
  }

  else if ([v4 isEqual:@"-AppleMusic"])
  {
    id v7 = @"00000000-0000-0000-0000-00000000000E";
  }

  else if ([v4 isEqual:@"-WiFiBadEnterprise"])
  {
    id v7 = @"00000000-0000-0000-0000-00000000000F";
  }

  else
  {
    id v7 = @"00000000-0000-0000-0000-000000000001";
  }

  id v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v8);

  -[SFDevice setOsVersion:](v5, "setOsVersion:", 13LL);
  id v9 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v9);
  -[SFDevice setDeviceClassCode:](v5, "setDeviceClassCode:", 4LL);
  unsigned __int8 v10 = -[SDSetupAgent extractParameter:inString:]( self,  "extractParameter:inString:",  @"device",  v4);
  -[SFDevice setDeviceModelCode:](v5, "setDeviceModelCode:", v10);
  int64_t v11 = -[SDSetupAgent extractParameter:inString:](self, "extractParameter:inString:", @"color", v4);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 2LL;
  }
  -[SFDevice setDeviceActionType:](v5, "setDeviceActionType:", 33LL);
  uint64_t v21 = @"cc";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
  id v22 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  -[SFBLEDevice setAdvertisementFields:](v9, "setAdvertisementFields:", v14);

  if (dword_1006417A0 <= 50 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent testSetupUIB238:]",  50LL,  "Testing Setup UI HomePod action=%d device=%d color=%d\n",  -[SFDevice deviceActionType](v5, "deviceActionType"),  v10,  v12);
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045640;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  id v19 = v5;
  id v20 = v4;
  id v16 = v4;
  uint64_t v17 = v5;
  dispatch_async(dispatchQueue, block);
}

- (int64_t)extractParameter:(id)a3 inString:(id)a4
{
  id v5 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a4 componentsSeparatedByString:@","]);
  int64_t v7 = (int64_t)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPrefix:", v5, (void)v14))
        {
          int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"="]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);
          int64_t v7 = (int)[v12 intValue];

          goto LABEL_11;
        }
      }

      int64_t v7 = (int64_t)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)testSetupUIiOS:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  if ([v4 hasSuffix:@"-ipad"])
  {
    uint64_t v6 = 3LL;
LABEL_9:
    uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", (char *)objc_msgSend(v4, "length") - 5));

    id v4 = (id)v7;
    goto LABEL_11;
  }

  if ([v4 hasSuffix:@"-ipod"])
  {
    uint64_t v6 = 2LL;
    goto LABEL_9;
  }

  uint64_t v6 = 1LL;
LABEL_11:
  -[SFDevice setDeviceClassCode:](v5, "setDeviceClassCode:", v6);
  uint64_t v8 = objc_alloc(&OBJC_CLASS___NSUUID);
  else {
    id v9 = @"00000000-0000-0000-0000-000000000001";
  }
  unsigned __int8 v10 = -[NSUUID initWithUUIDString:](v8, "initWithUUIDString:", v9);
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v10);

  int64_t v11 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v11);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045A24;
  block[3] = &unk_1005CB480;
  block[4] = self;
  __int128 v15 = v5;
  id v13 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIPasswordSharing:(id)a3
{
  id v4 = a3;
  if (dword_1006417A0 <= 50 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent testSetupUIPasswordSharing:]",  50LL,  "WPS: Testing Setup UI Password Sharing (%@)\n",  v4);
  }
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  -[SFDevice setContactIdentifier:](v5, "setContactIdentifier:", @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setRequestSSID:](v5, "setRequestSSID:", @"WiFiNetwork");
  uint64_t v6 = objc_alloc(&OBJC_CLASS___NSUUID);
  if ([v4 isEqual:@"-rich"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000002";
  }

  else if ([v4 isEqual:@"-fail"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000003";
  }

  else if ([v4 isEqual:@"-hs"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000004";
  }

  else if ([v4 isEqual:@"-hsfail"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000005";
  }

  else if ([v4 isEqual:@"-device"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000006";
  }

  else if ([v4 isEqual:@"-long"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000007";
  }

  else
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000001";
  }

  uint64_t v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v8);

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045C34;
  block[3] = &unk_1005CB480;
  block[4] = self;
  uint64_t v12 = v5;
  unsigned __int8 v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIWatch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v6 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000001");
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v6);

  -[SFDevice setName:](v5, "setName:", @"05938CDC");
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045D6C;
  block[3] = &unk_1005CB480;
  block[4] = self;
  unsigned __int8 v10 = v5;
  uint64_t v8 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testSetupUIWHA:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___NSUUID);
  if ([v4 isEqual:@"-fail"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000002";
  }

  else if ([v4 isEqual:@"-code"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000003";
  }

  else if ([v4 isEqual:@"-nowifi"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000004";
  }

  else if ([v4 isEqual:@"-badwifi"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000005";
  }

  else if ([v4 isEqual:@"-noicloud"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000006";
  }

  else if ([v4 isEqual:@"-nohsa2"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000007";
  }

  else if ([v4 isEqual:@"-noitunes"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000008";
  }

  else if ([v4 isEqual:@"-nohome"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000009";
  }

  else if ([v4 isEqual:@"-mismatch"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-00000000000A";
  }

  else if ([v4 isEqual:@"-keychain"])
  {
    uint64_t v7 = @"00000000-0000-0000-0000-00000000000B";
  }

  else
  {
    uint64_t v7 = @"00000000-0000-0000-0000-000000000001";
  }

  uint64_t v8 = -[NSUUID initWithUUIDString:](v6, "initWithUUIDString:", v7);
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v8);

  id v9 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v9);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046004;
  block[3] = &unk_1005CB480;
  block[4] = self;
  id v13 = v5;
  int64_t v11 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testUIAppleTVSetup:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v6 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000001");
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v6);

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v7);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046168;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  uint64_t v12 = v5;
  id v13 = v4;
  id v9 = v4;
  unsigned __int8 v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testUITVLatencySetup:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v6 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000001");
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v6);

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v7);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004636C;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  uint64_t v12 = v5;
  id v13 = v4;
  id v9 = v4;
  unsigned __int8 v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testUITVLatencyColorimeterSetup:(id)a3
{
  id v4 = a3;
  if (dword_1006417A0 <= 50 && (dword_1006417A0 != -1 || _LogCategory_Initialize(&dword_1006417A0, 50LL))) {
    LogPrintF( &dword_1006417A0,  "-[SDSetupAgent testUITVLatencyColorimeterSetup:]",  50LL,  "Testing TVLatencySetup UI (%@)\n",  v4);
  }
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v6 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000001");
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v6);

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v5, "setBleDevice:", v7);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046574;
  block[3] = &unk_1005CBC20;
  block[4] = self;
  uint64_t v12 = v5;
  id v13 = v4;
  id v9 = v4;
  unsigned __int8 v10 = v5;
  dispatch_async(dispatchQueue, block);
}

- (void)testProxCardKit:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v5 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000001");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v5);

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___SFBLEDevice);
  -[SFDevice setBleDevice:](v4, "setBleDevice:", v6);
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100046700;
  v9[3] = &unk_1005CB480;
  v9[4] = self;
  unsigned __int8 v10 = v4;
  uint64_t v8 = v4;
  dispatch_async(dispatchQueue, v9);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)preventRepair
{
  return self->_preventRepair;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (void)setProblemFlags:(unint64_t)a3
{
  self->_unint64_t problemFlags = a3;
}

- (void).cxx_destruct
{
}

@end