@interface HNDRuntimeManager
- (AXEventProcessor)eventProcessor;
- (BOOL)_urlMatchesLoadableCode:(id)a3;
- (BOOL)setupRuntime;
- (BOOL)shouldStop;
- (BOOL)systemAppReady;
- (HNDRuntimeManager)init;
- (HNDRuntimeManagerDelegate)delegate;
- (void)_assistAppValidationMode;
- (void)_assistiveTouchEnabledChange;
- (void)_assistiveTouchSettingsChanged;
- (void)_attemptStopAfterDelay;
- (void)_languageChanged:(id)a3;
- (void)_scannerEnabledChange;
- (void)_springBoardDied:(id)a3;
- (void)cleanupRuntime;
- (void)dealloc;
- (void)initializeSystemSettings;
- (void)setDelegate:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setSystemAppReady:(BOOL)a3;
- (void)startRuntime;
- (void)stop;
- (void)stopIfAllowed;
@end

@implementation HNDRuntimeManager

- (HNDRuntimeManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___HNDRuntimeManager;
  v2 = -[HNDRuntimeManager init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = ASTLogCommon(v2);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Observing notifications at startup.", v11, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_100089294,  AXSystemAppServerReadyNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:v3 selector:"_springBoardDied:" name:AXSystemAppServerDiedNotification object:0];

    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v8,  v3,  (CFNotificationCallback)sub_1000892E4,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v9,  v3,  (CFNotificationCallback)sub_1000892E4,  @"com.apple.purplebuddy.LanguageResetReady",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v3;
}

- (BOOL)setupRuntime
{
  if (AXIsInternalInstall(self, a2))
  {
    objc_initWeak(location, self);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_10008997C;
    v68[3] = &unk_100121EE8;
    objc_copyWeak(&v69, location);
    v3 = objc_retainBlock(v68);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v5 = [v4 appValidationTestingMode];

    if (v5)
    {
      AXPerformBlockOnMainThreadAfterDelay(v3, v6, 5.0);
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v7 registerUpdateBlock:v3 forRetrieveSelector:"appValidationTestingMode" withListener:self];
    }

    objc_destroyWeak(&v69);
    objc_destroyWeak(location);
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v66 environment]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"AX_DEBUG_SCAT"]);

  if (v9)
  {
    uint64_t v12 = ASTLogCommon(v10);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Launched via external tool.",  (uint8_t *)location,  2u);
    }

    _AXSAssistiveTouchScannerSetEnabled(1LL);
  }

  else if (_AXSAssistiveTouchScannerEnabled(v10, v11))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v32 = [v31 switchControlIsEnabledAsReceiver];

    if (v32)
    {
      uint64_t v34 = ASTLogCommon(v33);
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Switch Control was only enabled because it was a receiver. We should disable it now.",  (uint8_t *)location,  2u);
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v36 setSwitchControlIsEnabledAsReceiver:0];

      _AXSAssistiveTouchScannerSetEnabled(0LL);
      goto LABEL_52;
    }
  }

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_1000899A8;
  v67[3] = &unk_100121D18;
  v67[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v67, v14, 10.0);
  uint64_t v15 = AXInPreboardScenario(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  int v16 = v15;
  uint64_t v17 = ASTLogCommon(v15);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v19)
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "In PreBoard, so not bothering to wait for SpringBoard server.  Registering for notification when PreBoard status changes...",  (uint8_t *)location,  2u);
    }

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver( LocalCenter,  0LL,  (CFNotificationCallback)sub_100089A18,  AXInPreBoardScenarioUpdatedNotification,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    goto LABEL_48;
  }

  if (v19)
  {
    LOWORD(location[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Checking in with system app.",  (uint8_t *)location,  2u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
  int v22 = [v21 pid];

  if (v22 <= 0)
  {
    BOOL v30 = 0;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  else
  {
    uint64_t v24 = ((uint64_t (*)(void))-[HNDHandManager screenFrame:]_0)();
    double v23 = -[HNDHandManager screenFrame:]_0(v24, v25);
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    BOOL v30 = v29 != height || v26 != CGSizeZero.width;
  }

  self->_systemAppReady = v30;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v23));
  *(void *)&__int128 v38 = 67109120LL;
  __int128 v65 = v38;
  while (!-[HNDRuntimeManager systemAppReady](self, "systemAppReady", v65))
  {
    BOOL v39 = -[HNDRuntimeManager shouldStop](self, "shouldStop");
    if (v39)
    {
      uint64_t v54 = ASTLogCommon(v39);
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_1000AF9F0(v56);
      }
      goto LABEL_45;
    }

    if (v22 <= 0) {
      double v40 = 1.0;
    }
    else {
      double v40 = 0.0500000007;
    }
    uint64_t v41 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, v40, 0);
    if (v22 <= 0
      && (v42 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server")),
          int v22 = [v42 pid],
          v42,
          v22 < 1))
    {
      BOOL v46 = 0;
    }

    else
    {
      uint64_t v43 = -[HNDHandManager screenFrame:]_0(v41);
      -[HNDHandManager screenFrame:]_0(v43, v44);
      BOOL v46 = v45 != width;
      if (v47 != height) {
        BOOL v46 = 1;
      }
    }

    self->_systemAppReady = v46;
    uint64_t v48 = ASTLogCommon(v41);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      location[0] = (id)__PAIR64__(v22, v65);
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "Waiting on screen bounds and system app: %d.",  (uint8_t *)location,  8u);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v50 timeIntervalSinceDate:v37];
    BOOL v52 = v51 > 180.0;

    if (v52)
    {
      uint64_t v55 = ASTLogCommon(v53);
      v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for system app.",  (uint8_t *)location,  2u);
      }

- (void)initializeSystemSettings
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver( LocalCenter,  self,  (CFNotificationCallback)sub_100089B60,  kAXSAssistiveTouchEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver( v4,  self,  (CFNotificationCallback)sub_100089B60,  kAXSAssistiveTouchScannerEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  unsigned int v5 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver( v5,  self,  (CFNotificationCallback)sub_100089B60,  kAXSAssistiveTouchSettingsChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  -[HNDRuntimeManager _assistiveTouchSettingsChanged](self, "_assistiveTouchSettingsChanged");
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  [v6 registerAssistiveTouchPID:getpid()];
}

- (void)startRuntime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v2 setupNonSceneUI:0];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v3 systemServerConnected];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDeviceManager sharedManager](&OBJC_CLASS___HNDDeviceManager, "sharedManager"));
  [v4 setDetectDevices:1];

  id v5 = +[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager");
}

- (void)cleanupRuntime
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v2 unloadScanner];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HNDRuntimeManager;
  -[HNDRuntimeManager dealloc](&v4, "dealloc");
}

- (void)_languageChanged:(id)a3
{
  uint64_t v3 = ASTLogCommon(a3);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "*** Detected language change. Will restart now",  v5,  2u);
  }

  exit(1);
}

- (void)_springBoardDied:(id)a3
{
  uint64_t v3 = ASTLogCommon(a3);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SpringBoard died. Terminating.", v5, 2u);
  }

  exit(0);
}

- (void)_attemptStopAfterDelay
{
  uint64_t v3 = ASTLogCommon(self);
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will attempt stop after delay.", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100089EF0;
  v6[3] = &unk_100121D18;
  v6[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v6, v5, 0.25);
}

- (void)_assistiveTouchEnabledChange
{
  uint64_t v4 = _AXSAssistiveTouchEnabled(self, a2);
  if ((_DWORD)v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDeviceManager sharedManager](&OBJC_CLASS___HNDDeviceManager, "sharedManager"));
    [v6 restartDeviceDetection];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    [v7 restartEverything];
  }

  else if (!_AXSAssistiveTouchEnabled(v4, v5))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10008A094;
    v9[3] = &unk_1001224F8;
    v9[4] = a2;
    [v8 enumerateDisplayManagersWithBlock:v9];

    -[HNDRuntimeManager _attemptStopAfterDelay](self, "_attemptStopAfterDelay");
  }

  -[HNDRuntimeManager _sendASTEnabledTipSignal](self, "_sendASTEnabledTipSignal");
}

- (void)_scannerEnabledChange
{
  if (_AXSAssistiveTouchScannerEnabled(self, a2))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDeviceManager sharedManager](&OBJC_CLASS___HNDDeviceManager, "sharedManager"));
    [v3 restartDeviceDetection];

    id v4 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    [v4 enumerateDisplayManagersWithBlock:&stru_1001245F0];
  }

  else
  {
    AXPerformBlockAsynchronouslyOnMainThread(&stru_100124650);
    -[HNDRuntimeManager _attemptStopAfterDelay](self, "_attemptStopAfterDelay");
  }

- (void)_assistiveTouchSettingsChanged
{
  uint64_t v2 = ASTLogCommon(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AST settings changed", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v4 updateAllSettings];
}

- (void)stop
{
  uint64_t v3 = ASTLogCommon(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping now.", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  [v5 resetEventManager];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  [v6 setDisableSystemGesturesAssertion:0];

  if (_AXSApplicationAccessibilityEnabled(v7, v8)
    && _AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0LL);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](&OBJC_CLASS___NSOperationQueue, "currentQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10008A444;
  v12[3] = &unk_100124678;
  v12[4] = self;
  id v11 = [v9 addObserverForName:@"HNDEventManagerReset" object:0 queue:v10 usingBlock:v12];
}

- (void)stopIfAllowed
{
  uint64_t v3 = _AXSAssistiveTouchEnabled(self, a2);
  if ((_DWORD)v3
    || (uint64_t v3 = _AXSAssistiveTouchScannerEnabled(v3, v4), (_DWORD)v3)
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager")),
        unsigned __int8 v6 = [v5 isHandlingInterDeviceCommunication],
        v5,
        (v6 & 1) != 0))
  {
    uint64_t v7 = ASTLogCommon(v3);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      uint64_t v11 = _AXSAssistiveTouchEnabled(v9, v10);
      int v12 = v11;
      int v14 = _AXSAssistiveTouchScannerEnabled(v11, v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      v19[0] = 67109632;
      v19[1] = v12;
      __int16 v20 = 1024;
      int v21 = v14;
      __int16 v22 = 1024;
      unsigned int v23 = [v15 isHandlingInterDeviceCommunication];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not allowed to stop. AST: %i, Switch Control: %i, inter device communication: %i",  (uint8_t *)v19,  0x14u);
    }
  }

  else
  {
    _AXSAssistiveTouchSetEnabled(0LL);
    uint64_t v16 = _AXSAssistiveTouchScannerSetEnabled(0LL);
    uint64_t v17 = ASTLogCommon(v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "AssistiveTouch preference was not enabled. Shutting down",  (uint8_t *)v19,  2u);
    }

    -[HNDRuntimeManager stop](self, "stop");
  }

- (BOOL)_urlMatchesLoadableCode:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 absoluteString]);
  if (([v3 containsString:@"AccessibilityBundles"] & 1) != 0
    || ([v3 containsString:@"Accessibility.framework"] & 1) != 0
    || [v3 containsString:@"AX"]
    && ([v3 containsString:@"ServerInstance"] & 1) != 0)
  {
LABEL_5:
    unsigned __int8 v4 = 0;
    goto LABEL_6;
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = [&off_10012F670 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_9:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(&off_10012F670);
      }
      if (v7 == (id)++v9)
      {
        id v7 = [&off_10012F670 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_9;
        }
        break;
      }
    }
  }

  else {
    unsigned __int8 v4 = [v3 hasSuffix:@"framework/"];
  }
LABEL_6:

  return v4;
}

- (void)_assistAppValidationMode
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 appValidationTestingMode];

  if ((v4 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    [v6 setPreference:&__kCFBooleanTrue forKey:@"AppValidationAssistanceInProgress"];

    uint64_t v8 = ASTLogCommon(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Assisting app validation by loading everything on the system",  buf,  2u);
    }

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/System/Library"));
    NSURLResourceKey v32 = NSURLIsDirectoryKey;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( [v10 enumeratorAtURL:v11 includingPropertiesForKeys:v12 options:0 errorHandler:&stru_1001246B8]);

    NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)nullsub_6);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          BOOL v19 = -[HNDRuntimeManager _urlMatchesLoadableCode:](self, "_urlMatchesLoadableCode:", v18);
          if (v19)
          {
            uint64_t v20 = ASTLogCommon(v19);
            int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v30 = v18;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Loading: %@", buf, 0xCu);
            }

            __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v18));
            [v22 load];
          }
        }

        id v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }

      while (v15);
    }

    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
    [v23 setPreference:&__kCFBooleanFalse forKey:@"AppValidationAssistanceInProgress"];
  }

  else
  {
    uint64_t v24 = ASTLogCommon(v5);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_INFO,  "App validation mode not enabled, not loading code",  buf,  2u);
    }
  }
}

- (HNDRuntimeManagerDelegate)delegate
{
  return (HNDRuntimeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)systemAppReady
{
  return self->_systemAppReady;
}

- (void)setSystemAppReady:(BOOL)a3
{
  self->_systemAppReady = a3;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end