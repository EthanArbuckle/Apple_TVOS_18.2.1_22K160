@interface PBAppDelegate
+ (id)_newApplicationInitializationContext;
+ (id)sharedApplicationDelegate;
- (BOOL)_applicationForPIDIsPlaying:(int)a3;
- (BOOL)_checkForBulletinActivationForAction:(unint64_t)a3;
- (BOOL)_cleanUpUIStackAndLaunchKioskAppWithReason:(id)a3;
- (BOOL)_handleMenuOrACHomeSingleTapEventWithYesForMenuNoForACHome:(BOOL)a3 recognizer:(id)a4;
- (BOOL)_isPurpleBuddyActiveScene;
- (BOOL)_keyboardFocusedInApp:(id)a3;
- (BOOL)_kioskRelaunchDisabled;
- (BOOL)_launchConferenceRoomDisplayAppWithReason:(unint64_t)a3;
- (BOOL)_launchTVSearch;
- (BOOL)_launchTVWatchList;
- (BOOL)_requestSleepForReason:(id)a3;
- (BOOL)_requestWakeForReason:(id)a3;
- (BOOL)_shouldOfferEnableDataSharing;
- (BOOL)_shouldShowSiri;
- (BOOL)_suggestUserEnableAssistantAndDictation;
- (BOOL)_suggestUserEnableDataSharing;
- (BOOL)_suggestUserEnableDictation;
- (BOOL)_wakeDeviceForSiriInteractionWithContext:(id)a3;
- (BOOL)appLaunchDisabled;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)awaitingSiriOptInOfferResponse;
- (BOOL)handleUnhandledMenuEvent;
- (BOOL)mediaRemoteObserverShouldShowTrackChangeBulletin:(id)a3;
- (HPSAccessorySettingService)hpsAccessoryService;
- (NSString)initialLaunchApplicationBundleID;
- (PBAppInfoController)appInfoController;
- (PBBulletinService)bulletinService;
- (PBConstantAudioOutputController)constantAudioOutputController;
- (PBInternationalizationManager)internationalizationManager;
- (PBLargeGameInstallMonitor)largeGameInstallMonitor;
- (PBRecognizeMyVoiceObserver)recognizeMyVoiceObserver;
- (PBSBulletin)powerOffBulletin;
- (PBSystemGestureCompatibilityShim)systemGestureCompatibilityShim;
- (PBSystemGestureHandle)accessibilityShortcutGesture;
- (PBSystemGestureHandle)powerOffGesture;
- (PBSystemGestureHandle)powerOffHintGesture;
- (TVSBackgroundTask)programmingGuideBackgroundTask;
- (id)AccessibilityMenuOptionsBinding;
- (void)_configureMediaRemoteCommandCenter;
- (void)_createInitialAppScene;
- (void)_handleDisableEnhanceDialogNotification:(id)a3;
- (void)_handleDisableLateNightModeNotification:(id)a3;
- (void)_handleEnableEnhanceDialogNotification:(id)a3;
- (void)_handleEnableLateNightModeNotification:(id)a3;
- (void)_handleKioskAppLaunchFailure;
- (void)_handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:(BOOL)a3 recognizer:(id)a4;
- (void)_handlePurpleBuddyExit;
- (void)_handleSetEnhanceDialogueLevelNotification:(id)a3;
- (void)_handleStoreAccountChangedNotification;
- (void)_handleThermalNotification;
- (void)_handleURLBagChangedNotification:(id)a3;
- (void)_launchPurpleBuddy;
- (void)_launchPurpleBuddyWithCompletion:(id)a3;
- (void)_launchTVSettingsWithOpenURL:(id)a3;
- (void)_pausePlaybackWithReason:(id)a3;
- (void)_performObliterationOnBootIfNeeded;
- (void)_presentSiriOptInDialogWithViewController:(id)a3 completion:(id)a4;
- (void)_registerForThermalNotifications;
- (void)_resetProgrammingGuideRefreshTaskWithTimeIntervalInSeconds:(double)a3;
- (void)_resumeActivity;
- (void)_setEnhanceDialogEnabled:(BOOL)a3;
- (void)_setLateNightModeEnabled:(BOOL)a3;
- (void)_setupPowerOffSystemGestures;
- (void)_setupWebinspector;
- (void)_showPowerOffBulletin;
- (void)_startBulletinBoardServer;
- (void)_startSteadyStateServices;
- (void)_startURLBagMonitoring;
- (void)_stopAllActivity;
- (void)_stopAllOdeonActivity;
- (void)_updateEventMaskingWindow;
- (void)_updateProgrammingGuide;
- (void)_updateTripleTapMenu;
- (void)_updateWhatsNewCheckTimeInterval;
- (void)activateDictationWithContext:(id)a3;
- (void)activateSiriWithContext:(id)a3;
- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5;
- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5;
- (void)dealloc;
- (void)disableKioskRelaunchForPPT;
- (void)enableKioskRelaunchForPPT;
- (void)handleACHomeLongPressEvent:(id)a3;
- (void)handleACHomeSingleTapEvent:(id)a3;
- (void)handleMenuLongPressEvent:(id)a3;
- (void)handleMenuSingleTapEvent:(id)a3;
- (void)handleMenuTripleTapEvent;
- (void)handlePowerOffExternalEvent;
- (void)handlePowerOnExternalEvent;
- (void)handleTVTapEvent:(id)a3;
- (void)launchPostSetupApp;
- (void)launchPostWakeDefaultApp;
- (void)mediaRemoteObserverIsPlayingDidChange:(id)a3;
- (void)mediaRemoteObserverNowPlayingAppDidChange:(id)a3;
- (void)mediaRemoteObserverNowPlayingPlayingOrInfoOrRateDidChange:(id)a3;
- (void)mediaRemoteObserverRemotePlaybackStateDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openKioskApplicationWithReason:(id)a3 options:(id)a4 completion:(id)a5;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)presentNowPlayingWithOptions:(id)a3 completion:(id)a4;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setAppLaunchDisabled:(BOOL)a3;
- (void)setAwaitingSiriOptInOfferResponse:(BOOL)a3;
- (void)setBulletinService:(id)a3;
- (void)setConstantAudioOutputController:(id)a3;
- (void)setHpsAccessoryService:(id)a3;
- (void)setPowerOffBulletin:(id)a3;
- (void)setProgrammingGuideBackgroundTask:(id)a3;
- (void)setRecognizeMyVoiceObserver:(id)a3;
- (void)set_kioskRelaunchDisabled:(BOOL)a3;
- (void)startDictationWithContext:(id)a3;
- (void)startSiriWithContext:(id)a3;
- (void)stopDictationWithContext:(id)a3;
- (void)stopSiriWithContext:(id)a3;
- (void)triggerThermalNotification;
- (void)tvs_bindAccessibilityMenuOptionsBindingToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5;
@end

@implementation PBAppDelegate

+ (id)sharedApplicationDelegate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return v3;
}

+ (id)_newApplicationInitializationContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](&OBJC_CLASS___BSPlatform, "sharedInstance"));
  id v3 = objc_alloc(&OBJC_CLASS___UISDeviceContext);
  uint64_t v10 = UISDeviceContextDeviceClassKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 deviceClass]));
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v6 = [v3 initWithDeviceInfoValues:v5];

  id v7 = [[UISMutableApplicationInitializationContext alloc] initWithMainDisplayContext:0 launchDisplayContext:0 deviceContext:v6 persistedSceneIdentifiers:0 supportAppSceneRequests:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBWorkspace defaultSceneIdentityToken](&OBJC_CLASS___PBWorkspace, "defaultSceneIdentityToken"));
  [v7 setDefaultSceneToken:v8];

  return v7;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  -[PBConstantAudioOutputController invalidate](self->_constantAudioOutputController, "invalidate");
  -[PBSystemGestureHandle invalidate](self->_powerOffHintGesture, "invalidate");
  -[PBSystemGestureHandle invalidate](self->_powerOffGesture, "invalidate");
  -[PBSystemGestureHandle invalidate](self->_accessibilityShortcutGesture, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBAppDelegate;
  -[PBAppDelegate dealloc](&v5, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046D3F8 == a6)
  {
    -[PBAppDelegate _updateEventMaskingWindow](self, "_updateEventMaskingWindow", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBAppDelegate;
    -[PBAppDelegate observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (id)AccessibilityMenuOptionsBinding
{
  if (qword_1004712E0 != -1) {
    dispatch_once(&qword_1004712E0, &stru_1003DB5D0);
  }
  return (id)qword_1004712E8;
}

- (void)tvs_bindAccessibilityMenuOptionsBindingToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppDelegate tvs_bindingAdaptor](self, "tvs_bindingAdaptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppDelegate AccessibilityMenuOptionsBinding](self, "AccessibilityMenuOptionsBinding"));
  [v11 establishBinding:v12 toObject:v10 withKeyPath:v9 bindingOptions:v8 updateHandler:&stru_1003DB610];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v197 = a4;
  uint64_t v8 = PBSBootLifecycleLog(v197, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Delegate didFinishLaunchingWithOptions",  "",  buf,  2u);
  }

  id v10 = sub_1000824FC();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "---- ======== The system app is starting to finish launching ======== ----",  buf,  2u);
  }

  -[PBAppDelegate _createInitialAppScene](self, "_createInitialAppScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));

  if (v13)
  {
    id v14 = objc_alloc(&OBJC_CLASS___AMSAutomaticDownloadKindsFetchTask);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag pb_bag](&OBJC_CLASS___AMSBag, "pb_bag"));
    id v16 = [v14 initWithAccount:v13 bag:v15];
    id v17 = [v16 perform];
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v19 registerObserver:self];

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  [v20 finishSystemAppLaunch];

  +[UIApplication tvsui_setHeadBoardStoreDemoAppOrderFilePath:]( &OBJC_CLASS___UIApplication,  "tvsui_setHeadBoardStoreDemoAppOrderFilePath:",  0LL);
  v201[0] = _NSConcreteStackBlock;
  v201[1] = 3221225472LL;
  v201[2] = sub_1001B8B50;
  v201[3] = &unk_1003CFF08;
  v201[4] = self;
  +[PBOSUpdateSwitch startWithCompletion:](&OBJC_CLASS___PBOSUpdateSwitch, "startWithCompletion:", v201);
  id v21 = sub_1000824FC();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "---- ======== The system app is setting up audio routing ======== ----",  buf,  2u);
  }

  v200[0] = _NSConcreteStackBlock;
  v200[1] = 3221225472LL;
  v200[2] = sub_1001B8CA4;
  v200[3] = &unk_1003D0580;
  v200[4] = self;
  id v23 =  [v18 addObserverForName:SSAccountStoreChangedNotification object:0 queue:0 usingBlock:v200];
  uint64_t v25 = PBSBootLifecycleLog(v23, v24);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "PowerManager Setup",  "",  buf,  2u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  [v27 addObserver:self];

  uint64_t v30 = PBSBootLifecycleLog(v28, v29);
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "PowerManager Setup",  "",  buf,  2u);
  }

  uint64_t v34 = PBSBootLifecycleLog(v32, v33);
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "User Notification Handler Setup",  "",  buf,  2u);
  }

  v36 = objc_alloc_init(&OBJC_CLASS___PBUserNotificationHandler);
  userNotificationHandler = self->_userNotificationHandler;
  self->_userNotificationHandler = v36;

  +[PBUserNotificationCenter initializeNotificationCenterWithDelegate:]( &OBJC_CLASS___PBUserNotificationCenter,  "initializeNotificationCenterWithDelegate:",  self->_userNotificationHandler);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserNotificationCenter sharedInstance](&OBJC_CLASS___PBUserNotificationCenter, "sharedInstance"));
  [v38 registerOperationClass:objc_opt_class(PBCVVVerificationOperation) forFailureType:0];

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserNotificationCenter sharedInstance](&OBJC_CLASS___PBUserNotificationCenter, "sharedInstance"));
  [v39 registerOperationClass:objc_opt_class(PB2SVerificationOperation) forFailureType:1];

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserNotificationCenter sharedInstance](&OBJC_CLASS___PBUserNotificationCenter, "sharedInstance"));
  [v40 registerOperationClass:objc_opt_class(PBCarMVerificationOperation) forFailureType:2];

  uint64_t v43 = PBSBootLifecycleLog(v41, v42);
  v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "User Notification Handler Setup",  "",  buf,  2u);
  }

  uint64_t v47 = PBSBootLifecycleLog(v45, v46);
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v48,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Hot Black Manager Setup",  "",  buf,  2u);
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[PBHotBlackManager sharedInstance](&OBJC_CLASS___PBHotBlackManager, "sharedInstance"));
  [v49 present];

  uint64_t v52 = PBSBootLifecycleLog(v50, v51);
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v53,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Hot Black Manager Setup",  "",  buf,  2u);
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
  -[PBAppDelegate tvs_bind:toObject:withKeyPath:options:]( self,  "tvs_bind:toObject:withKeyPath:options:",  @"AccessibilityMenuOptionsBinding",  v54,  @"accessibilityMenuOptions",  0LL);

  uint64_t v57 = PBSBootLifecycleLog(v55, v56);
  v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
  if (os_signpost_enabled(v58))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v58,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Profile Manager Setup",  "",  buf,  2u);
  }

  id v59 = +[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance");
  id v60 =  +[PBUserProfileApplicationManager sharedInstance]( &OBJC_CLASS___PBUserProfileApplicationManager,  "sharedInstance");
  uint64_t v62 = PBSBootLifecycleLog(v60, v61);
  v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
  if (os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v63,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Profile Manager Setup",  "",  buf,  2u);
  }

  uint64_t v66 = PBSBootLifecycleLog(v64, v65);
  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
  if (os_signpost_enabled(v67))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v67,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Window/Wallpaper Setup",  "",  buf,  2u);
  }

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[PBWallpaperManager sharedInstance](&OBJC_CLASS___PBWallpaperManager, "sharedInstance"));
  [v68 presentWallpaperAnimated:0 completion:0];

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  [v69 presentSceneLayoutWindow];

  uint64_t v72 = PBSBootLifecycleLog(v70, v71);
  v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
  if (os_signpost_enabled(v73))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v73,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Window/Wallpaper Setup",  "",  buf,  2u);
  }

  uint64_t v76 = PBSBootLifecycleLog(v74, v75);
  v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
  if (os_signpost_enabled(v77))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v77,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Triple Tap Setup",  "",  buf,  2u);
  }

  id v78 = -[PBAppDelegate _updateTripleTapMenu](self, "_updateTripleTapMenu");
  uint64_t v80 = PBSBootLifecycleLog(v78, v79);
  v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
  if (os_signpost_enabled(v81))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v81,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Triple Tap Setup",  "",  buf,  2u);
  }

  uint64_t v84 = PBSBootLifecycleLog(v82, v83);
  v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
  if (os_signpost_enabled(v85))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v85,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "PiP Setup",  "",  buf,  2u);
  }

  id v86 = +[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance");
  uint64_t v88 = PBSBootLifecycleLog(v86, v87);
  v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
  if (os_signpost_enabled(v89))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v89,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "PiP Setup",  "",  buf,  2u);
  }

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[ATVHIDSystemClient sharedInstance](&OBJC_CLASS___ATVHIDSystemClient, "sharedInstance"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  id v92 =  [v18 addObserverForName:@"ATVHIDSystemClientNotification_DidReceivePeripheralPairingRequest" object:v90 queue:v91 usingBlock:&stru_1003DB630];

  uint64_t v95 = PBSBootLifecycleLog(v93, v94);
  v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
  if (os_signpost_enabled(v96))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v96,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Internationalization Manager Setup",  "",  buf,  2u);
  }

  v97 = objc_alloc(&OBJC_CLASS___PBInternationalizationManager);
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  v101 = -[PBInternationalizationManager initWithSceneManager:userProfileManager:displayManager:]( v97,  "initWithSceneManager:userProfileManager:displayManager:",  v98,  v99,  v100);
  internationalizationManager = self->_internationalizationManager;
  self->_internationalizationManager = v101;

  uint64_t v105 = PBSBootLifecycleLog(v103, v104);
  v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
  if (os_signpost_enabled(v106))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v106,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Internationalization Manager Setup",  "",  buf,  2u);
  }

  id v107 = -[PBAppDelegate _registerForThermalNotifications](self, "_registerForThermalNotifications");
  uint64_t v109 = PBSBootLifecycleLog(v107, v108);
  v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
  if (os_signpost_enabled(v110))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v110,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "SystemAppSettings Setup",  "",  buf,  2u);
  }

  v111 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  [v111 addObserver:self forKeyPath:@"inputAllowed" options:0 context:off_10046D3F8];
  id v112 = -[PBAppDelegate _updateEventMaskingWindow](self, "_updateEventMaskingWindow");
  uint64_t v114 = PBSBootLifecycleLog(v112, v113);
  v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
  if (os_signpost_enabled(v115))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v115,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "SystemAppSettings Setup",  "",  buf,  2u);
  }

  uint64_t v118 = PBSBootLifecycleLog(v116, v117);
  v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
  if (os_signpost_enabled(v119))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v119,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "HomeAccessoryManager Setup",  "",  buf,  2u);
  }

  id v120 = +[PBHomeAccessoryManager sharedInstance](&OBJC_CLASS___PBHomeAccessoryManager, "sharedInstance");
  id v121 =  +[PBHomeMediaAccessControlManager sharedInstance]( &OBJC_CLASS___PBHomeMediaAccessControlManager,  "sharedInstance");
  uint64_t v123 = PBSBootLifecycleLog(v121, v122);
  v124 = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
  if (os_signpost_enabled(v124))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v124,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "HomeAccessoryManager Setup",  "",  buf,  2u);
  }

  uint64_t v127 = PBSBootLifecycleLog(v125, v126);
  v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
  if (os_signpost_enabled(v128))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v128,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "RMV Setup",  "",  buf,  2u);
  }

  v129 = objc_alloc_init(&OBJC_CLASS___PBRecognizeMyVoiceObserver);
  recognizeMyVoiceObserver = self->_recognizeMyVoiceObserver;
  self->_recognizeMyVoiceObserver = v129;

  uint64_t v133 = PBSBootLifecycleLog(v131, v132);
  v134 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
  if (os_signpost_enabled(v134))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v134,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "RMV Setup",  "",  buf,  2u);
  }

  uint64_t v137 = PBSBootLifecycleLog(v135, v136);
  v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
  if (os_signpost_enabled(v138))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v138,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Listening Mode Setup",  "",  buf,  2u);
  }

  v139 = -[HPSAccessorySettingService initWithDelegate:]( objc_alloc(&OBJC_CLASS___HPSAccessorySettingService),  "initWithDelegate:",  0LL);
  hpsAccessoryService = self->_hpsAccessoryService;
  self->_hpsAccessoryService = v139;

  v141 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v141 addObserver:self selector:"_handleEnableEnhanceDialogNotification:" name:@"com.apple.TVPAudioVideoSettings.enableEnhanceDialog" object:0 suspensionBehavior:4];

  v142 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v142 addObserver:self selector:"_handleDisableEnhanceDialogNotification:" name:@"com.apple.TVPAudioVideoSettings.disableEnhanceDialog" object:0 suspensionBehavior:4];

  v143 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v143 addObserver:self selector:"_handleSetEnhanceDialogueLevelNotification:" name:@"com.apple.TVPAudioVideoSettings.setEnhanceDialogueLevel" object:0 suspensionBehavior:4];

  uint64_t v146 = PBSBootLifecycleLog(v144, v145);
  v147 = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);
  if (os_signpost_enabled(v147))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v147,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Listening Mode Setup",  "",  buf,  2u);
  }

  v148 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v148 addObserver:self selector:"_handleEnableLateNightModeNotification:" name:TVPAudioVideoEnableLateNightModeNotification object:0 suspensionBehavior:4];

  v149 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v149 addObserver:self selector:"_handleDisableLateNightModeNotification:" name:TVPAudioVideoDisableLateNightModeNotification object:0 suspensionBehavior:4];

  uint64_t v152 = PBSBootLifecycleLog(v150, v151);
  v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
  if (os_signpost_enabled(v153))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v153,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Switcher/Snapshot Setup",  "",  buf,  2u);
  }

  id v154 = +[PBAppIconCache sharedAppSwitcherIconCache](&OBJC_CLASS___PBAppIconCache, "sharedAppSwitcherIconCache");
  v155 = (void *)objc_claimAutoreleasedReturnValue(+[PBSnapshotService sharedInstance](&OBJC_CLASS___PBSnapshotService, "sharedInstance"));
  [v155 ingestLaunchImages];

  uint64_t v158 = PBSBootLifecycleLog(v156, v157);
  v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
  if (os_signpost_enabled(v159))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v159,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Switcher/Snapshot Setup",  "",  buf,  2u);
  }

  v160 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v161 = [v160 BOOLForKey:@"ShowSafeArea"];

  if (v161)
  {
    v162 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    v163 = (void *)objc_claimAutoreleasedReturnValue([v162 mainWorkspace]);
    v164 = (void *)objc_claimAutoreleasedReturnValue([v163 geometry]);

    [v164 bounds];
    double v166 = v165;
    double v168 = v167;
    double v170 = v169;
    double v172 = v171;
    if (sub_1001C9E00())
    {
      [v164 fullDisplayBounds];
      double v166 = v173;
      double v168 = v174;
      double v170 = v175;
      double v172 = v176;
    }

    v177 = -[PBSafeAreaWindow initWithFrame:]( objc_alloc(&OBJC_CLASS___PBSafeAreaWindow),  "initWithFrame:",  v166,  v168,  v170,  v172);
    safeAreaWindow = self->_safeAreaWindow;
    self->_safeAreaWindow = v177;

    -[PBSafeAreaWindow setHidden:](self->_safeAreaWindow, "setHidden:", 0LL);
  }

  v179 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  [v179 prepareDebugWindows];

  v180 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned int v181 = [v180 shouldLaunchCRD];

  if (sub_1001C9BFC())
  {
    v182 = &off_1003D7548;
LABEL_69:
    v183 = *v182;
    initialLaunchApplicationBundleID = self->_initialLaunchApplicationBundleID;
    self->_initialLaunchApplicationBundleID = v183;
LABEL_70:

    goto LABEL_71;
  }

  if (v181)
  {
    v182 = &off_1003D7558;
    goto LABEL_69;
  }

  v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v194 = [v193 isKioskAppAutoLaunchEnabled];

  if (v194)
  {
    initialLaunchApplicationBundleID = (NSString *)objc_claimAutoreleasedReturnValue( +[PineBoard sharedApplication]( &OBJC_CLASS___PineBoard,  "sharedApplication"));
    v195 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSString kioskAppBundleIdentifier]( initialLaunchApplicationBundleID,  "kioskAppBundleIdentifier"));
    v196 = self->_initialLaunchApplicationBundleID;
    self->_initialLaunchApplicationBundleID = v195;

    goto LABEL_70;
  }

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, uint64_t))a5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v6));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVProfileService sharedInstance](&OBJC_CLASS___TVProfileService, "sharedInstance"));
    char v10 = objc_opt_respondsToSelector(v9, "handleCKNotification:");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVProfileService sharedInstance](&OBJC_CLASS___TVProfileService, "sharedInstance"));
      unsigned __int8 v12 = [v11 handleCKNotification:v8];

      if ((v12 & 1) != 0)
      {
        uint64_t v13 = 0LL;
        if (!v7) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

  id v14 = sub_1000824FC();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unhandled remote notification received: %{public}@",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v13 = 1LL;
  if (v7) {
LABEL_9:
  }
    v7[2](v7, v13);
LABEL_10:
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v5 = a4;
  id v6 = sub_1000824FC();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    int v16 = "-[PBAppDelegate application:openURL:options:]";
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v15, 0x16u);
  }

  if ([v5 isStoreServicesURL])
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v9 = (char *)objc_claimAutoreleasedReturnValue([v8 systemName]);

    char v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 systemVersion]);

    id v12 = sub_1000824FC();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      int v16 = v9;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "*** itms-services schemes are unsupported on %@ %@",  (uint8_t *)&v15,  0x16u);
    }
  }

  return 0;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", a3, a4));
  objc_msgSend(v4, "pb_noteMCEffectiveSettingsChanged");
}

- (void)handleMenuTripleTapEvent
{
  id v2 = sub_100082C04();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[PBAppDelegate handleMenuTripleTapEvent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  if ((sub_1001C9BFC() & 1) != 0)
  {
    if ((sub_1001C9C40() & 1) != 0) {
      return;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
    uint64_t v5 = [v4 voiceOverEnabled] ^ 1;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
    unint64_t v7 = (unint64_t)[v6 accessibilityMenuOptions];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
    [v8 setVoiceOverEnabled:v5];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAccessibilitySettings sharedInstance](&OBJC_CLASS___PBSAccessibilitySettings, "sharedInstance"));
    [v9 setAccessibilityMenuOptions:v7 & 0xFFFFFFFFFFFFFFFELL | v5];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBAXFeatureManager sharedInstance](&OBJC_CLASS___PBAXFeatureManager, "sharedInstance"));
    [v9 handleAXShortcutEvent];
  }
}

- (BOOL)_handleMenuOrACHomeSingleTapEventWithYesForMenuNoForACHome:(BOOL)a3 recognizer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unint64_t v7 = v6;
  if (v4)
  {
    int v8 = 1;
    int v9 = 1;
    if (!sub_100200238()) {
      goto LABEL_14;
    }
  }

  else
  {
    unsigned int v10 = objc_msgSend(v6, "pb_wasTriggeringPressType:fromGameController:", 101, 1);
    BOOL v11 = sub_100200238();
    int v8 = v10 ^ 1;
    if (v11 && v10)
    {
      if (-[PBAppDelegate _checkForBulletinActivationForAction:](self, "_checkForBulletinActivationForAction:", 4LL)) {
        goto LABEL_10;
      }
    }

    else if (!v11)
    {
LABEL_10:
      int v9 = 1;
      goto LABEL_14;
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  unsigned __int8 v13 = [v12 handleBackButton];

  if ((v13 & 1) != 0) {
    goto LABEL_10;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  unsigned int v15 = [v14 isPresenting];

  if (v15)
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
    [v16 cancelActivation];
  }

  int v9 = 0;
LABEL_14:
  if ((_os_feature_enabled_impl("IdleScreen", "Fizzgig") & 1) == 0)
  {
    if ((v9 & 1) != 0) {
      goto LABEL_31;
    }
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    id v18 = [v17 activeLayoutLevel];

    if (v18 == (id)6)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
      [v19 dismissScreenSaver];
LABEL_30:

      goto LABEL_31;
    }
  }

  if (((v9 | v8) & 1) == 0
    && +[PBControlCenterManager isControlCenterEnabled](&OBJC_CLASS___PBControlCenterManager, "isControlCenterEnabled"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
    if (([v19 isPresenting] & 1) == 0)
    {
      id v26 = sub_100082C04();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Game Controller HOME triggered control center presentation.",  v45,  2u);
      }

      [v19 presentControlCenterForReason:1];
      goto LABEL_30;
    }

LABEL_23:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBRestrictionPINManager sharedInstance](&OBJC_CLASS___PBRestrictionPINManager, "sharedInstance"));
    unsigned __int8 v21 = [v20 dismiss];

    if ((v21 & 1) != 0) {
      goto LABEL_31;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    unsigned __int8 v23 = [v22 dismissCRDWaitingScreen];

    if ((v23 & 1) != 0) {
      goto LABEL_31;
    }
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    unsigned int v25 = [v24 isPresenting];

    if (!v25)
    {
      char v28 = 0;
      goto LABEL_32;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    [v19 canStopCRDWithResult:&stru_1003DB6D8];
    goto LABEL_30;
  }

  if ((v9 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_31:
  char v28 = 1;
LABEL_32:
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 activeTransition]);

  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 openRequest]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 fromSceneIdentity]);

  if ((v28 & 1) != 0) {
    goto LABEL_46;
  }
  if ([v30 isRunning]
    && [v30 isTransitionStarted]
    && objc_msgSend(v32, "pb_isDefaultKioskAppSceneIdentity"))
  {
    uint64_t v48 = PBAppLaunchOptionDeactivation;
    v49 = &__kCFBooleanTrue;
    BOOL v33 = 1;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    -[PBAppDelegate openKioskApplicationWithReason:options:completion:]( self,  "openKioskApplicationWithReason:options:completion:",  @"Interrupted app launch",  v34,  0LL);

    goto LABEL_47;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  unsigned int v36 = [v35 shouldForwardSystemAppEvent];

  if (v36)
  {
    if (v4) {
      uint64_t v37 = 1LL;
    }
    else {
      uint64_t v37 = 12LL;
    }
    if (v4) {
      uint64_t v38 = 134LL;
    }
    else {
      uint64_t v38 = 547LL;
    }
    sub_1000319D8(v37, v38, (uint64_t)objc_msgSend(v7, "pb_eventSenderID"), 3uLL);
    goto LABEL_46;
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppSwitcherManager defaultManager](&OBJC_CLASS___PBAppSwitcherManager, "defaultManager"));
  unsigned __int8 v40 = [v39 dismissAppSwitcherToBundleIdentifier:0 completion:0];

  if ((v40 & 1) != 0)
  {
LABEL_46:
    BOOL v33 = 1;
    goto LABEL_47;
  }

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  unsigned int v43 = [v42 isShowingBaseUIOnly];

  if (v43)
  {
    uint64_t v46 = PBAppLaunchOptionDeactivation;
    uint64_t v47 = &__kCFBooleanTrue;
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    -[PBAppDelegate openKioskApplicationWithReason:options:completion:]( self,  "openKioskApplicationWithReason:options:completion:",  @"Unhandled MENU",  v44,  0LL);

    BOOL v33 = 1;
  }

  else
  {
    BOOL v33 = 0;
  }

- (void)handleMenuSingleTapEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[PBAppDelegate handleMenuSingleTapEvent:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v7 = -[PBAppDelegate _handleMenuOrACHomeSingleTapEventWithYesForMenuNoForACHome:recognizer:]( self,  "_handleMenuOrACHomeSingleTapEventWithYesForMenuNoForACHome:recognizer:",  1LL,  v4);
  id v8 = sub_100082C04();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    BOOL v11 = "-[PBAppDelegate handleMenuSingleTapEvent:]";
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s handled: %d", (uint8_t *)&v10, 0x12u);
  }
}

- (void)handleACHomeSingleTapEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[PBAppDelegate handleACHomeSingleTapEvent:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v7 = -[PBAppDelegate _handleMenuOrACHomeSingleTapEventWithYesForMenuNoForACHome:recognizer:]( self,  "_handleMenuOrACHomeSingleTapEventWithYesForMenuNoForACHome:recognizer:",  0LL,  v4);
  id v8 = sub_100082C04();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    BOOL v11 = "-[PBAppDelegate handleACHomeSingleTapEvent:]";
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s handled: %d", (uint8_t *)&v10, 0x12u);
  }
}

- (void)handleMenuLongPressEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PBAppDelegate handleMenuLongPressEvent:]";
    __int16 v9 = 1024;
    unsigned int v10 = [v4 state];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v7, 0x12u);
  }

  -[PBAppDelegate _handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:recognizer:]( self,  "_handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:recognizer:",  1LL,  v4);
}

- (void)handleACHomeLongPressEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PBAppDelegate handleACHomeLongPressEvent:]";
    __int16 v9 = 1024;
    unsigned int v10 = [v4 state];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v7, 0x12u);
  }

  -[PBAppDelegate _handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:recognizer:]( self,  "_handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:recognizer:",  0LL,  v4);
}

- (BOOL)_cleanUpUIStackAndLaunchKioskAppWithReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  unsigned int v6 = [v5 shouldActivateCurrentBulletinForAction:1];
  char v7 = v6;
  if (v6) {
    [v5 activateCurrentBulletin];
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
  unsigned int v9 = [v8 isPresenting];

  if (v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
    [v10 dismissControlCenter];

    char v7 = 1;
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  if ([v11 isHidden])
  {
    [v11 dismissAssistant];
    if ((v7 & 1) != 0) {
      goto LABEL_21;
    }
  }

  else if (v7 & 1) != 0 || ([v11 dismissAssistant])
  {
    goto LABEL_21;
  }

  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeUIManager sharedInstance](&OBJC_CLASS___PBHomeUIManager, "sharedInstance"));
  unsigned __int8 v13 = [v12 dismissWithCompletion:0];

  if ((v13 & 1) == 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
    unsigned __int8 v15 = [v14 dismissAirPlay];

    if ((v15 & 1) == 0)
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
      unsigned __int8 v17 = [v16 dismissScreenSaver];

      if ((v17 & 1) == 0)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBRoutingUIManager sharedInstance](&OBJC_CLASS___PBRoutingUIManager, "sharedInstance"));
        unsigned __int8 v19 = [v18 dismissRoutingUI];

        if ((v19 & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
          unsigned __int8 v21 = [v20 dismissNowPlaying];

          if ((v21 & 1) == 0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionPINManager sharedInstance]( &OBJC_CLASS___PBRestrictionPINManager,  "sharedInstance"));
            unsigned __int8 v23 = [v22 dismiss];

            if ((v23 & 1) == 0)
            {
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
              unsigned __int8 v25 = [v24 dismissActiveDialog];

              if ((v25 & 1) == 0)
              {
                id v26 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
                unsigned __int8 v27 = [v26 isPresenting];

                if ((v27 & 1) == 0)
                {
                  if (sub_1001C9BFC())
                  {
                    -[PBAppDelegate _launchPurpleBuddy](self, "_launchPurpleBuddy");
                  }

                  else
                  {
                    uint64_t v30 = PBAppLaunchOptionDeactivation;
                    v31 = &__kCFBooleanTrue;
                    char v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
                    -[PBAppDelegate openKioskApplicationWithReason:options:completion:]( self,  "openKioskApplicationWithReason:options:completion:",  v4,  v28,  0LL);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

- (void)_handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:(BOOL)a3 recognizer:(id)a4
{
  id v7 = a4;
  if (a3
    || !+[PBControlCenterManager isControlCenterEnabled](&OBJC_CLASS___PBControlCenterManager, "isControlCenterEnabled"))
  {
    unsigned int v8 = 0;
  }

  else
  {
    unsigned int v8 = objc_msgSend(v7, "pb_wasTriggeringPressType:fromGameController:", 101, 0);
  }

  +[PBDataReportingService incrementLongMenuButtonPresses:]( PBDataReportingService,  "incrementLongMenuButtonPresses:",  objc_msgSend(v7, "pb_eventRef"));
  if ([v7 state] == (id)1)
  {
    if ((v8 & 1) != 0)
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      self->_homeLongPressStartTime = v9;
      goto LABEL_25;
    }

    if (-[PBAppDelegate _cleanUpUIStackAndLaunchKioskAppWithReason:]( self,  "_cleanUpUIStackAndLaunchKioskAppWithReason:",  @"Long MENU press"))
    {
      goto LABEL_25;
    }

    id v17 = sub_100082C04();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10028D9F0((uint64_t)self, a2);
    }
LABEL_24:

    goto LABEL_25;
  }

  if ([v7 state] == (id)3) {
    unsigned int v10 = v8;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v10 == 1 && (sub_1001C9BFC() & 1) == 0)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v12 = v11 - self->_homeLongPressStartTime;
    id v13 = sub_100082C04();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12 >= 4.0)
    {
      if (v15)
      {
        int v18 = 136315394;
        unsigned __int8 v19 = "-[PBAppDelegate _handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:recognizer:]";
        __int16 v20 = 2048;
        double v21 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Long press release from controller was too long (%2.2fs).  Ignoring.",  (uint8_t *)&v18,  0x16u);
      }

      goto LABEL_24;
    }

    if (v15)
    {
      int v18 = 136315138;
      unsigned __int8 v19 = "-[PBAppDelegate _handleMenuOrACHomeLongPressEventWithYesForMenuNoForACHome:recognizer:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Long press release from controller in window.",  (uint8_t *)&v18,  0xCu);
    }

    if (!-[PBAppDelegate _cleanUpUIStackAndLaunchKioskAppWithReason:]( self,  "_cleanUpUIStackAndLaunchKioskAppWithReason:",  @"Game controller"))
    {
      id v16 = sub_100082C04();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_10028DA90((uint64_t)self, a2);
      }
      goto LABEL_24;
    }
  }

- (void)_updateTripleTapMenu
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppDelegate tvs_bindingAdaptor](self, "tvs_bindingAdaptor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForBinding:qword_1004712E8]);

  if ((objc_opt_respondsToSelector(v4, "unsignedIntegerValue") & 1) != 0 && [v4 unsignedIntegerValue]
    || sub_1001C9BFC())
  {
    accessibilityShortcutGesture = self->_accessibilityShortcutGesture;
    if (!accessibilityShortcutGesture)
    {
      objc_initWeak(&location, self);
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
      double v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472LL;
      double v11 = sub_1001BA84C;
      double v12 = &unk_1003D1020;
      objc_copyWeak(&v13, &location);
      id v7 = (PBSystemGestureHandle *)[v6 newHandleForSystemGesture:1 actionHandler:&v9];
      unsigned int v8 = self->_accessibilityShortcutGesture;
      self->_accessibilityShortcutGesture = v7;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      accessibilityShortcutGesture = self->_accessibilityShortcutGesture;
    }

    -[PBSystemGestureHandle acquire](accessibilityShortcutGesture, "acquire", v9, v10, v11, v12);
  }

  else
  {
    -[PBSystemGestureHandle relinquish](self->_accessibilityShortcutGesture, "relinquish");
  }
}

- (BOOL)handleUnhandledMenuEvent
{
  id v2 = sub_100082C04();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315138;
    v22 = "-[PBAppDelegate handleUnhandledMenuEvent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v21, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v5 = [v4 inputAllowed];

  if (!v5) {
    return 1;
  }
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  unsigned __int8 v7 = [v6 isPresenting];

  if ((v7 & 1) != 0) {
    return 1;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
  unsigned __int8 v9 = [v8 dismissAirPlay];

  if ((v9 & 1) != 0) {
    return 1;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  unsigned __int8 v11 = [v10 dismissScreenSaver];

  if ((v11 & 1) != 0) {
    return 1;
  }
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBRoutingUIManager sharedInstance](&OBJC_CLASS___PBRoutingUIManager, "sharedInstance"));
  unsigned __int8 v13 = [v12 dismissRoutingUI];

  if ((v13 & 1) != 0) {
    return 1;
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
  unsigned __int8 v15 = [v14 dismissNowPlaying];

  if ((v15 & 1) != 0) {
    return 1;
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned __int8 v17 = [v16 dismissCRDWaitingScreen];

  if ((v17 & 1) != 0) {
    return 1;
  }
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned __int8 v18 = [v20 isPresenting];

  return v18;
}

- (void)_configureMediaRemoteCommandCenter
{
  id v2 = sub_1000833FC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[PBAppDelegate _configureMediaRemoteCommandCenter]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteCommandCenter defaultCenter](&OBJC_CLASS___PBMediaRemoteCommandCenter, "defaultCenter"));
  [v4 setCommandFilter:&stru_1003DB718];
  [v4 setUnhandledCommandHandler:&stru_1003DB758];
}

- (void)handlePowerOnExternalEvent
{
  id v3 = sub_100082C04();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[PBAppDelegate handlePowerOnExternalEvent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[PBAppDelegate _requestWakeForReason:](self, "_requestWakeForReason:", PBSWakeReasonExternalDevice);
}

- (void)handlePowerOffExternalEvent
{
  id v3 = sub_100082C04();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[PBAppDelegate handlePowerOffExternalEvent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[PBAppDelegate _requestSleepForReason:](self, "_requestSleepForReason:", PBSSleepReasonExternalDevice);
}

- (void)handleTVTapEvent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v56 = "-[PBAppDelegate handleTVTapEvent:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (!sub_100200238()
    || -[PBAppDelegate _checkForBulletinActivationForAction:](self, "_checkForBulletinActivationForAction:", 2LL))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
    [v7 dismissActiveDialog];
    unsigned __int8 v8 = 1;
LABEL_6:

    goto LABEL_7;
  }

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
  unsigned __int8 v14 = [v13 dismissControlCenter];

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
  [v15 dismissActiveDialog];

  if ((v14 & 1) == 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
    unsigned __int8 v8 = [v7 dismissScreenSaver];
    goto LABEL_6;
  }

  unsigned __int8 v8 = 1;
LABEL_7:
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance"));
  uint64_t v10 = v9;
  if ((v8 & 1) == 0)
  {
    if ([v10 isEditing])
    {
      [v10 dismissEditingControlsWithReason:@"User gesture"];
      char v12 = 0;
      int v11 = 1;
      goto LABEL_16;
    }

    if ([v10 isHidden])
    {
LABEL_15:
      int v11 = 0;
      char v12 = 0;
      goto LABEL_16;
    }

    [v10 presentEditingControlsWithReason:@"User gesture"];
  }

  int v11 = 0;
  char v12 = 1;
LABEL_16:
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  unsigned __int8 v17 = v16;
  if ((v12 & 1) != 0) {
    goto LABEL_28;
  }
  unsigned __int8 v18 = [v16 isHidden];
  unsigned int v19 = [v17 dismissAssistant];
  if ((v18 & 1) == 0 && v19)
  {
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
    id v21 = [v20 visibleState];

    if (v21 == (id)2) {
      -[PBAppDelegate _launchTVWatchList](self, "_launchTVWatchList");
    }
    goto LABEL_28;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeUIManager sharedInstance](&OBJC_CLASS___PBHomeUIManager, "sharedInstance"));
  unsigned __int8 v23 = [v22 dismissWithCompletion:0];

  if ((v23 & 1) != 0) {
    goto LABEL_28;
  }
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
  unsigned __int8 v25 = [v24 dismissAirPlay];

  if ((v25 & 1) != 0) {
    goto LABEL_28;
  }
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[PBRoutingUIManager sharedInstance](&OBJC_CLASS___PBRoutingUIManager, "sharedInstance"));
  unsigned __int8 v27 = [v26 dismissRoutingUI];

  if ((v27 & 1) != 0
    || (char v28 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance")),
        unsigned __int8 v29 = [v28 dismissNowPlaying],
        v28,
        (v29 & 1) != 0)
    || (uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionPINManager sharedInstance]( PBRestrictionPINManager,  "sharedInstance")),  v31 = [v30 dismiss],  v30,  (v31 & 1) != 0))
  {
LABEL_28:
    int v35 = 1;
    goto LABEL_29;
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned int v33 = [v32 isPresenting];

  if (v33)
  {
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    [v34 canStopCRDWithResult:&stru_1003DB778];

    goto LABEL_28;
  }

  int v35 = 0;
LABEL_29:
  unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  uint64_t v37 = (uint64_t)[v36 activeLayoutLevel];

  if (v37 < 3) {
    unsigned int v38 = 1;
  }
  else {
    unsigned int v38 = v35;
  }
  if ((v35 & 1) == 0 && v37 <= 2) {
    unsigned int v38 = -[PBAppDelegate _launchTVWatchList](self, "_launchTVWatchList");
  }
  if ((v11 | v38) == 1)
  {
    if ((v38 & 1) != 0) {
      goto LABEL_48;
    }
  }

  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    unsigned int v40 = [v39 shouldForwardSystemAppEvent];

    if (v40)
    {
      uint64_t v52 = self;
      uint64_t v41 = v4;
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue([v42 focusedSceneHandle]);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 sceneIdentity]);

      unsigned int v45 = objc_msgSend(v44, "pb_isDefaultKioskAppSceneIdentity");
      unsigned int v46 = objc_msgSend(v44, "pb_isTVWatchListSceneIdentity");
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
      unsigned int v48 = objc_msgSend(v47, "pbs_watchListButtonBehaviorEnabled");

      if ((v46 & v48 & 1) != 0 || v45)
      {
        id v4 = v41;
        uint64_t v51 = sub_1001776C4((uint64_t)objc_msgSend(v41, "pb_eventRef"));
        sub_1000319D8(12LL, 96LL, v51, 3uLL);

        goto LABEL_47;
      }

      id v4 = v41;
      self = v52;
    }
  }

  if ((sub_1001C9BFC() & 1) == 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    uint64_t v50 = (uint64_t)[v49 activeLayoutLevel];

    if (v50 <= 2)
    {
      uint64_t v53 = PBAppLaunchOptionDeactivation;
      v54 = &__kCFBooleanTrue;
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      -[PBAppDelegate openKioskApplicationWithReason:options:completion:]( self,  "openKioskApplicationWithReason:options:completion:",  @"Unhandled TV button",  v42,  0LL);
LABEL_47:
    }
  }

- (void)mediaRemoteObserverRemotePlaybackStateDidChange:(id)a3
{
  id v3 = sub_1000824FC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    unsigned __int8 v7 = "-[PBAppDelegate mediaRemoteObserverRemotePlaybackStateDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  [v5 preheatIfNecessary];
}

- (BOOL)mediaRemoteObserverShouldShowTrackChangeBulletin:(id)a3
{
  id v3 = sub_1000824FC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    unsigned __int8 v15 = "-[PBAppDelegate mediaRemoteObserverShouldShowTrackChangeBulletin:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  unsigned int v6 = [v5 nowPlayingProcessPID];

  if (v6)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
    unsigned __int8 v8 = [v7 nowPlayingAppFocused];

    if ((v8 & 1) == 0)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
      unsigned int v10 = [v9 isPresenting];

      if (!v10) {
        return 1;
      }
    }
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  unsigned __int8 v12 = [v11 isPresenting];

  return v12;
}

- (void)mediaRemoteObserverIsPlayingDidChange:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000824FC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[PBAppDelegate mediaRemoteObserverIsPlayingDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  id v7 = [v3 playingMusic];
  [v6 setHoldOffForMusicEnabled:v7];
  if ([v3 playing])
  {
    if (!(_DWORD)v7)
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
      unsigned int v9 = objc_msgSend(v8, "isSiriViewServicePID:", objc_msgSend(v3, "nowPlayingProcessPID"));

      if (v9) {
        [v6 dismissScreenSaver];
      }
    }
  }
}

- (void)mediaRemoteObserverNowPlayingAppDidChange:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000824FC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[PBAppDelegate mediaRemoteObserverNowPlayingAppDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v6 = [v3 nowPlayingProcessPID];
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
    unsigned int v8 = [v7 isPresenting];

    if (v8)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
      [v9 dismissNowPlaying];
    }
  }

- (void)mediaRemoteObserverNowPlayingPlayingOrInfoOrRateDidChange:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000824FC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    unsigned int v9 = "-[PBAppDelegate mediaRemoteObserverNowPlayingPlayingOrInfoOrRateDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  unsigned int v6 = [v3 playing];
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSoftwareUpdateService sharedInstance](&OBJC_CLASS___PBSoftwareUpdateService, "sharedInstance"));
    [v7 notePlaybackStateChanged];
  }

- (void)_handleURLBagChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000824FC();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    int v11 = 138412546;
    unsigned __int8 v12 = v7;
    __int16 v13 = 2112;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "AMSBag Changed Notification. {notification=%@, userInfo=%@}",  (uint8_t *)&v11,  0x16u);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:AMSBagChangedNotificationUserInfoChangedKeys]);
}

- (void)_startURLBagMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleURLBagChangedNotification:" name:AMSBagChangedNotification object:0];
  -[PBAppDelegate _updateProgrammingGuide](self, "_updateProgrammingGuide");
  -[PBAppDelegate _updateWhatsNewCheckTimeInterval](self, "_updateWhatsNewCheckTimeInterval");
}

- (void)_updateWhatsNewCheckTimeInterval
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 whatsNewCheckTimeIntervalInSeconds];
  double v4 = v3;

  if (v4 <= 2.22044605e-16)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag pb_bag](&OBJC_CLASS___AMSBag, "pb_bag"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 integerForKey:@"atv-whatsnew-refresh-interval-in-seconds"]);
    [v6 valueWithCompletion:&stru_1003DB7B8];
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBWhatsNewService sharedInstance](&OBJC_CLASS___PBWhatsNewService, "sharedInstance"));
    [v5 setCheckTimeInterval:v4];
  }
}

- (void)_updateProgrammingGuide
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag pb_bag](&OBJC_CLASS___AMSBag, "pb_bag"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 integerForKey:@"atv-headboard-refresh-interval-seconds"]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001BBCD0;
  v5[3] = &unk_1003DB7E0;
  v5[4] = self;
  [v4 valueWithCompletion:v5];
}

- (void)setProgrammingGuideBackgroundTask:(id)a3
{
  id v5 = (TVSBackgroundTask *)a3;
  p_programmingGuideBackgroundTask = &self->_programmingGuideBackgroundTask;
  if (*p_programmingGuideBackgroundTask != v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
    [v7 unregisterBackgroundTask:*p_programmingGuideBackgroundTask];
    objc_storeStrong((id *)p_programmingGuideBackgroundTask, a3);
    [v7 registerBackgroundTask:*p_programmingGuideBackgroundTask];
  }
}

- (void)_resetProgrammingGuideRefreshTaskWithTimeIntervalInSeconds:(double)a3
{
  id v5 = (TVSBackgroundTask *)objc_claimAutoreleasedReturnValue(-[PBAppDelegate programmingGuideBackgroundTask](self, "programmingGuideBackgroundTask"));
  unsigned int v6 = v5;
  if (a3 <= 0.0)
  {

    unsigned int v6 = 0LL;
  }

  else
  {
    -[TVSBackgroundTask interval](v5, "interval");
    if (v7 != a3)
    {
      int v8 = -[TVSBackgroundTask initWithType:interval:delay:async:]( objc_alloc(&OBJC_CLASS___TVSBackgroundTask),  "initWithType:interval:delay:async:",  0LL,  0LL,  a3,  0.0);

      -[TVSBackgroundTask setPerformBlock:](v8, "setPerformBlock:", &stru_1003DB800);
      unsigned int v6 = v8;
    }
  }

  -[PBAppDelegate setProgrammingGuideBackgroundTask:](self, "setProgrammingGuideBackgroundTask:", v6);
}

- (void)_handleStoreAccountChangedNotification
{
  id v2 = sub_1000824FC();
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[PBAppDelegate _handleStoreAccountChangedNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBProgrammingGuide sharedInstance](&OBJC_CLASS___PBProgrammingGuide, "sharedInstance"));
  [v4 setNeedsReload];
}

- (void)_startBulletinBoardServer
{
  id v2 = sub_1000824FC();
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Starting BulletinBoard server",  (uint8_t *)&v11,  2u);
  }

  BBServerRun();
  id v4 = sub_1000824FC();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    uint64_t v12 = 7LL;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Setting BulletinBoard default expiration to %ld days",  (uint8_t *)&v11,  0xCu);
  }

  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v6, "setDay:", -7LL);
  BBServerSetDefaultExpirationComponents(v6);
  id v7 = sub_1000824FC();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Running UserNotification server",  (uint8_t *)&v11,  2u);
  }

  UNSUserNotificationServerRun();
  id v9 = sub_1000824FC();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Setting BulletinBoard server to allow publication",  (uint8_t *)&v11,  2u);
  }

  BBServerSetAllowsPublication();
}

- (BOOL)_checkForBulletinActivationForAction:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  unsigned int v5 = [v4 shouldActivateCurrentBulletinForAction:a3];
  if (v5)
  {
    else {
      [v4 activateCurrentBulletin];
    }
  }

  return v5;
}

- (void)_createInitialAppScene
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainWorkspace]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppearanceManager sharedInstance](&OBJC_CLASS___PBSystemAppearanceManager, "sharedInstance"));
  [v3 createWorkspaceScenesUsingSystemAppearanceManager:v4];
}

- (void)disableKioskRelaunchForPPT
{
  self->__kioskRelaunchDisabled = 1;
}

- (void)enableKioskRelaunchForPPT
{
  self->__kioskRelaunchDisabled = 0;
}

- (void)openKioskApplicationWithReason:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, void *))a5;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 kioskAppBundleIdentifier]);

  id v13 = sub_1000824FC();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138543618;
    uint64_t v37 = v12;
    __int16 v38 = 2114;
    id v39 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Request to launch kiosk app (%{public}@) for reason: %{public}@",  (uint8_t *)&v36,  0x16u);
  }

  if (!self->__kioskRelaunchDisabled && !sub_1001C9BFC())
  {
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v19 = [v18 isKioskAppAutoLaunchEnabled];

    if ((v19 & 1) == 0)
    {
      -[PBAppDelegate _handleKioskAppLaunchFailure](self, "_handleKioskAppLaunchFailure");
      if (!v10) {
        goto LABEL_9;
      }
      unsigned __int8 v15 = @"Kiosk app auto launch is off";
      goto LABEL_7;
    }

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v12]);

    if ([v17 isEnabled]
      && ([v17 isSignatureTrusted] & 1) != 0)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
      [v21 openApplication:v12 launchURL:0 options:v9 suspended:0 completion:v10];

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
      [v22 ensureTVAirPlayRunning];
      goto LABEL_29;
    }

    -[PBAppDelegate _handleKioskAppLaunchFailure](self, "_handleKioskAppLaunchFailure");
    if (v17)
    {
      if ([v17 isEnabled])
      {
        unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([v17 applicationInfo]);
        id v24 = [v23 signatureState];

        switch((unint64_t)v24)
        {
          case 0uLL:
            id v25 = sub_1000824FC();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_26;
            }
            int v36 = 138543362;
            uint64_t v37 = v12;
            unsigned __int8 v27 = "Skip launching kiosk app (%{public}@) - signature expired";
            goto LABEL_23;
          case 1uLL:
            id v33 = sub_1000824FC();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_26;
            }
            int v36 = 138543362;
            uint64_t v37 = v12;
            unsigned __int8 v27 = "Skip launching kiosk app (%{public}@) - needs trust";
            goto LABEL_23;
          case 2uLL:
            id v34 = sub_1000824FC();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_26;
            }
            int v36 = 138543362;
            uint64_t v37 = v12;
            unsigned __int8 v27 = "Skip launching kiosk app (%{public}@) - needs validation";
            goto LABEL_23;
          case 3uLL:
            id v35 = sub_1000824FC();
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_26;
            }
            int v36 = 138543362;
            uint64_t v37 = v12;
            unsigned __int8 v27 = "Skip launching kiosk app (%{public}@) - blacklisted";
            goto LABEL_23;
          default:
            goto LABEL_27;
        }

        goto LABEL_27;
      }

      id v29 = sub_1000824FC();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = PBSAppInfoDisabledReasonsValueDescription([v17 disabledReasons]);
        unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        int v36 = 138543618;
        uint64_t v37 = v12;
        __int16 v38 = 2114;
        id v39 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Skip launching kiosk app (%{public}@) - disabled for reasons %{public}@",  (uint8_t *)&v36,  0x16u);
      }
    }

    else
    {
      id v28 = sub_1000824FC();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 138543362;
        uint64_t v37 = v12;
        unsigned __int8 v27 = "Skip launching kiosk app (%{public}@) - not installed";
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v36, 0xCu);
      }
    }

- (void)_handleKioskAppLaunchFailure
{
  if ((sub_1001C9BFC() & 1) == 0)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSceneLayoutViewController sceneLayoutViewControllerForMainDisplay]( &OBJC_CLASS___PBSceneLayoutViewController,  "sceneLayoutViewControllerForMainDisplay"));
    [v2 removeApplicationLevelSceneLayoutElementForReason:@"Kiosk App Launch Failure"];
  }

- (void)launchPostWakeDefaultApp
{
  if (sub_1001C9BFC())
  {
    -[PBAppDelegate _launchPurpleBuddy](self, "_launchPurpleBuddy");
  }

  else
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    unsigned int v4 = [v3 shouldLaunchCRD];

    if (v4)
    {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
      [v5 startCRDWithReason:1];
    }

    else
    {
      -[PBAppDelegate openKioskApplicationWithReason:options:completion:]( self,  "openKioskApplicationWithReason:options:completion:",  @"Could not restore original scene on wake",  0LL,  0LL);
    }
  }

- (void)launchPostSetupApp
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 postSetupAppBundleIdentifier]);

  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
    if ([v6 isEnabled])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
      unsigned __int8 v8 = [v7 isSupervised];

      if ((v8 & 1) == 0)
      {
        id v9 = sub_1000824FC();
        int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138543362;
          uint64_t v24 = (uint64_t)v4;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Using alternate post-setup app: %{public}@",  (uint8_t *)&v23,  0xCu);
        }

        goto LABEL_11;
      }
    }

    else
    {
    }
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v12 = [v11 isKioskAppAutoLaunchEnabled];

  if (!v12) {
    goto LABEL_20;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 kioskAppBundleIdentifier]);

  id v15 = sub_1000824FC();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    uint64_t v24 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Using post-setup app: %{public}@",  (uint8_t *)&v23,  0xCu);
  }

  unsigned int v4 = (void *)v14;
LABEL_11:

  id v16 = sub_1000824FC();
  unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "We have completed set up. Now it's safe to launch the photo caching daemon....",  (uint8_t *)&v23,  2u);
  }

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  [v18 fetchInitialPhotoAssets];

  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  [v19 setupAssistantDidFinish];

  -[PBAppDelegate _startSteadyStateServices](self, "_startSteadyStateServices");
  LODWORD(v19) = -[PBAppDelegate _launchConferenceRoomDisplayAppWithReason:]( self,  "_launchConferenceRoomDisplayAppWithReason:",  0LL);
  id v20 = sub_1000824FC();
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  if ((_DWORD)v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Launching conference room display from setup",  (uint8_t *)&v23,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "---- ======== The system app is launching the post-setup app ======== ----",  (uint8_t *)&v23,  2u);
    }

    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    -[os_log_s openApplication:launchURL:options:suspended:completion:]( v22,  "openApplication:launchURL:options:suspended:completion:",  v4,  0LL,  0LL,  0LL,  &stru_1003DB820);
  }

LABEL_20:
}

- (void)presentNowPlayingWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void (**)(id, uint64_t))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v8 = [v7 systemNowPlayingAllowed];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
    [v9 activateNowPlayingForReason:0 options:v5];
  }

  if (v6) {
    v6[2](v6, 1LL);
  }
}

- (void)_startSteadyStateServices
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  [v2 ensureTVAirPlayRunning];

  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayAssistantService sharedInstance](&OBJC_CLASS___PBDisplayAssistantService, "sharedInstance"));
  [v3 startDisplayAssistantMonitoring];

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v5 = [v4 isSupervised];

  if ((v5 & 1) != 0)
  {
    id v6 = sub_1000824FC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WNLog: Device is supervised, not starting whats new monitoring",  v11,  2u);
    }
  }

  else
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBWhatsNewService sharedInstance](&OBJC_CLASS___PBWhatsNewService, "sharedInstance"));
    [v8 startWhatsNewMonitoring];

    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBUpsellManager sharedInstance](&OBJC_CLASS___PBUpsellManager, "sharedInstance"));
    -[os_log_s startUpsellMonitoringIfNeeded](v7, "startUpsellMonitoringIfNeeded");
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 systemUIServicePresenter]);

  [v10 setEnabled:1];
}

- (BOOL)_launchTVSearch
{
  if (-[PBAppDelegate appLaunchDisabled](self, "appLaunchDisabled"))
  {
    id v2 = @"com.apple.TVSearch";
  }

  else
  {
    char v3 = sub_1001C9BFC();
    id v2 = @"com.apple.TVSearch";
    if ((v3 & 1) == 0)
    {
      unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
      int v11 = @"PBUILaunchWithDeepLinking";
      unsigned int v12 = &__kCFBooleanTrue;
      BOOL v6 = 1;
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
      [v5 openApplication:v2 launchURL:0 options:v7 suspended:0 completion:0];

      goto LABEL_8;
    }
  }

  id v4 = sub_1000824FC();
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    int v10 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "#Alert #SYSTEM Inhibiting %@ launch.",  (uint8_t *)&v9,  0xCu);
  }

  BOOL v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)_launchTVWatchList
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  if (-[PBAppDelegate appLaunchDisabled](self, "appLaunchDisabled")
    || (sub_1001C9BFC() & 1) != 0
    || !objc_msgSend(v3, "pbs_watchListButtonBehaviorEnabled"))
  {
    unsigned __int8 v6 = 0;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"com.apple.TVWatchList"]);
    unsigned __int8 v6 = [v5 isEnabled];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplicationSceneHandle]);

  if ((v6 & 1) != 0)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppSwitcherManager defaultManager](&OBJC_CLASS___PBAppSwitcherManager, "defaultManager"));
    if ([v9 isActive])
    {

      int v10 = @"com.apple.TVWatchList";
LABEL_14:
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://button/tv",  v10));
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));

      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
      [v17 openApplication:v10 launchURL:v14 options:0 suspended:0 completion:0];

      BOOL v15 = 1;
      goto LABEL_15;
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProcessBundleIdentifier]);
    unsigned __int8 v12 = [v11 isEqual:@"com.apple.TVWatchList"];

    int v10 = @"com.apple.TVWatchList";
    if ((v12 & 1) == 0) {
      goto LABEL_14;
    }
  }

  else
  {
    int v10 = @"com.apple.TVWatchList";
  }

  id v13 = sub_1000824FC();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#Alert #SYSTEM Inhibiting %@ launch.",  buf,  0xCu);
  }

  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (void)_launchPurpleBuddy
{
}

- (void)_launchPurpleBuddyWithCompletion:(id)a3
{
  id v4 = a3;
  -[PBUserNotificationHandler setNotificationFilter:]( self->_userNotificationHandler,  "setNotificationFilter:",  &stru_1003DB860);
  id v5 = sub_100084680();
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PurpleBuddy is starting.", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  [v7 beginIgnoringUserProfileAccountNotificationsWithReason:@"PurpleBuddy"];

  id v8 = sub_1000824FC();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10028DB30();
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001BD2C4;
  v12[3] = &unk_1003D1688;
  id v13 = v4;
  id v11 = v4;
  [v10 openApplication:@"com.apple.purplebuddy" launchURL:0 options:0 suspended:0 completion:v12];
}

- (void)_handlePurpleBuddyExit
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeAccessoryManager sharedInstance](&OBJC_CLASS___PBHomeAccessoryManager, "sharedInstance"));
  [v3 setupAssistantDidFinish];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  [v4 setupAssistantDidFinish];

  -[PBAppDelegate _updateTripleTapMenu](self, "_updateTripleTapMenu");
  id v5 = sub_100084680();
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PurpleBuddy is finished.", v8, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  [v7 _removeAllIgnoringUserProfileAccountNotificationsWithReason:@"PurpleBuddy"];
}

- (BOOL)_isPurpleBuddyActiveScene
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentApplicationSceneHandle]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientProcessBundleIdentifier]);
  unsigned __int8 v5 = [v4 isEqual:@"com.apple.purplebuddy"];

  return v5;
}

- (BOOL)_launchConferenceRoomDisplayAppWithReason:(unint64_t)a3
{
  if ((sub_1001C9BFC() & 1) != 0) {
    return 0;
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned __int8 v4 = [v5 startCRDWithReason:a3];

  return v4;
}

- (void)_launchTVSettingsWithOpenURL:(id)a3
{
  id v4 = a3;
  if (-[PBAppDelegate appLaunchDisabled](self, "appLaunchDisabled"))
  {
    id v5 = sub_1000824FC();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#Alert #SYSTEM Inhibiting Settings launch.",  v7,  2u);
    }
  }

  else
  {
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    -[os_log_s openApplication:launchURL:options:suspended:completion:]( v6,  "openApplication:launchURL:options:suspended:completion:",  @"com.apple.TVSettings",  v4,  0LL,  0LL,  0LL);
  }
}

- (BOOL)_suggestUserEnableAssistantAndDictation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 isSiriEnabled];

  if ((v4 & 1) != 0) {
    return 0;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned int v6 = [v5 isSiriAvailable];

  if (!v6) {
    return 0;
  }
  if (-[PBAppDelegate _isPurpleBuddyActiveScene](self, "_isPurpleBuddyActiveScene")) {
    return 0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v8 = [v7 offeredEnableAssistant];

  if ((v8 & 1) != 0) {
    return 0;
  }
  uint64_t v10 = -[PBAppDelegate _shouldOfferEnableDataSharing](self, "_shouldOfferEnableDataSharing");
  id v11 = sub_100082C04();
  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    BOOL v15 = "-[PBAppDelegate _suggestUserEnableAssistantAndDictation]";
    __int16 v16 = 1024;
    unsigned int v17 = -[PBAppDelegate _shouldOfferEnableDataSharing](self, "_shouldOfferEnableDataSharing");
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s; Will offer to enable Siri. offer data sharing: %{BOOL}d",
      (uint8_t *)&v14,
      0x12u);
  }

  id v13 = -[PBSiriOptInViewController initWithMode:]( objc_alloc(&OBJC_CLASS___PBSiriOptInViewController),  "initWithMode:",  v10);
  -[PBAppDelegate _presentSiriOptInDialogWithViewController:completion:]( self,  "_presentSiriOptInDialogWithViewController:completion:",  v13,  &stru_1003DB880);

  return 1;
}

- (BOOL)_suggestUserEnableDictation
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned __int8 v4 = [v3 isDictationEnabled];

  if ((v4 & 1) != 0
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance")),
        unsigned int v6 = [v5 isSiriAvailable],
        v5,
        !v6))
  {
    unsigned int v8 = 0;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    unsigned int v8 = [v7 offeredEnableDictation] ^ 1;
  }

  id v9 = sub_100082C04();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    else {
      unsigned __int8 v12 = "NO";
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    int v22 = 136315906;
    int v23 = "-[PBAppDelegate _suggestUserEnableDictation]";
    else {
      int v14 = "NO";
    }
    if (v8) {
      BOOL v15 = "YES";
    }
    else {
      BOOL v15 = "NO";
    }
    __int16 v24 = 2080;
    id v25 = v12;
    __int16 v26 = 2080;
    unsigned __int8 v27 = v14;
    __int16 v28 = 2080;
    id v29 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s; dictation enabled: %s, is Siri available: %s, should suggest: %s",
      (uint8_t *)&v22,
      0x2Au);
  }

  if (v8)
  {
    if (-[PBAppDelegate _shouldOfferEnableDataSharing](self, "_shouldOfferEnableDataSharing")) {
      uint64_t v16 = 3LL;
    }
    else {
      uint64_t v16 = 2LL;
    }
    id v17 = sub_100082C04();
    unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = -[PBAppDelegate _shouldOfferEnableDataSharing](self, "_shouldOfferEnableDataSharing");
      int v22 = 136315394;
      int v23 = "-[PBAppDelegate _suggestUserEnableDictation]";
      __int16 v24 = 1024;
      LODWORD(v25) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s; Will offer to enable dictation. offer data sharing: %{BOOL}d",
        (uint8_t *)&v22,
        0x12u);
    }

    id v20 = -[PBSiriOptInViewController initWithMode:]( objc_alloc(&OBJC_CLASS___PBSiriOptInViewController),  "initWithMode:",  v16);
    -[PBAppDelegate _presentSiriOptInDialogWithViewController:completion:]( self,  "_presentSiriOptInDialogWithViewController:completion:",  v20,  &stru_1003DB8A0);
  }

  return v8;
}

- (BOOL)_suggestUserEnableDataSharing
{
  if (-[PBAppDelegate _shouldOfferEnableDataSharing](self, "_shouldOfferEnableDataSharing")
    && !-[PBAppDelegate _isPurpleBuddyActiveScene](self, "_isPurpleBuddyActiveScene"))
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    if ([v4 isSiriEnabled])
    {
      unsigned int v3 = 1;
    }

    else
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
      unsigned int v3 = [v5 isDictationEnabled];
    }
  }

  else
  {
    unsigned int v3 = 0;
  }

  id v6 = sub_100082C04();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = -[PBAppDelegate _shouldOfferEnableDataSharing](self, "_shouldOfferEnableDataSharing");
    unsigned int v9 = -[PBAppDelegate _isPurpleBuddyActiveScene](self, "_isPurpleBuddyActiveScene");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    unsigned int v11 = [v10 isSiriEnabled];
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
    int v17 = 136316418;
    unsigned __int8 v18 = "-[PBAppDelegate _suggestUserEnableDataSharing]";
    __int16 v19 = 1024;
    unsigned int v20 = v8;
    __int16 v21 = 1024;
    unsigned int v22 = v9;
    __int16 v23 = 1024;
    unsigned int v24 = v11;
    __int16 v25 = 1024;
    unsigned int v26 = [v12 isDictationEnabled];
    __int16 v27 = 1024;
    unsigned int v28 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s; should offer data sharing: %{BOOL}d, is buddy focused process: %{BOOL}d, is Siri enabled: %{BOOL}d, is dictati"
      "on enabled: %{BOOL}d, shouldSuggest: %{BOOL}d",
      (uint8_t *)&v17,
      0x2Au);
  }

  if (v3)
  {
    id v13 = sub_100082C04();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      unsigned __int8 v18 = "-[PBAppDelegate _suggestUserEnableDataSharing]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s; Will offer to enable data sharing",
        (uint8_t *)&v17,
        0xCu);
    }

    BOOL v15 = -[PBSiriOptInViewController initWithMode:]( objc_alloc(&OBJC_CLASS___PBSiriOptInViewController),  "initWithMode:",  4LL);
    -[PBAppDelegate _presentSiriOptInDialogWithViewController:completion:]( self,  "_presentSiriOptInDialogWithViewController:completion:",  v15,  0LL);
  }

  return v3;
}

- (BOOL)_shouldOfferEnableDataSharing
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  BOOL v3 = [v2 dataSharingOptInStatus] == 0;

  return v3;
}

- (void)_presentSiriOptInDialogWithViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && !-[PBAppDelegate awaitingSiriOptInOfferResponse](self, "awaitingSiriOptInOfferResponse"))
  {
    objc_initWeak(&location, self);
    -[PBAppDelegate setAwaitingSiriOptInOfferResponse:](self, "setAwaitingSiriOptInOfferResponse:", 1LL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001BDD40;
    v10[3] = &unk_1003D1660;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [v6 setDismissalCompletion:v10];
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBDialogContext contextWithViewController:]( &OBJC_CLASS___PBDialogContext,  "contextWithViewController:",  v6));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
    [v9 presentDialogWithContext:v8 options:0 completion:0];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)triggerThermalNotification
{
}

- (void)_registerForThermalNotifications
{
  int out_token = 0;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001BDE5C;
  v5[3] = &unk_1003DAB78;
  v5[4] = self;
  notify_register_dispatch(kOSThermalNotificationName, &out_token, v4, v5);
}

- (void)_handleThermalNotification
{
  int v3 = OSThermalNotificationCurrentLevel(self, a2);
  int v4 = dword_10046D400;
  dword_10046D400 = v3;
  int v5 = _OSThermalNotificationLevelForBehavior(8LL);
  id v6 = sub_1000824FC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v8 = v7;
  BOOL v9 = v3 < v5;
  BOOL v10 = v3 >= v5;
  if (v9)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = @"not ";
      if (v3 > v4) {
        int v17 = &stru_1003E2910;
      }
      int v24 = 138412546;
      __int16 v25 = v17;
      __int16 v26 = 1024;
      int v27 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Device is normal temperature(is %@increasing): %d",  (uint8_t *)&v24,  0x12u);
    }

    if (self->_tooHot != v10)
    {
      self->_tooHot = v10;
      id v18 = sub_1000824FC();
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "PM: *** Thermal level reduced - resuming operation ***",  (uint8_t *)&v24,  2u);
      }

      +[PBSSystemStatus _setThermalState:](&OBJC_CLASS___PBSSystemStatus, "_setThermalState:", 3LL);
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
      [v20 setEnabled:1];

      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
      [v21 resumeActivityAfterThermal];

      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBCriticalAlertManager sharedInstance](&OBJC_CLASS___PBCriticalAlertManager, "sharedInstance"));
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[PBCriticalAlertContext thermalContext](&OBJC_CLASS___PBCriticalAlertContext, "thermalContext"));
      [v22 dismissAlertWithContext:v23];
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10028DB94(v3 > v4, v3, v8);
    }

    if (self->_tooHot != v10)
    {
      self->_tooHot = v10;
      id v11 = sub_1000824FC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10028DB68();
      }

      +[PBSSystemStatus _setThermalState:](&OBJC_CLASS___PBSSystemStatus, "_setThermalState:", 1LL);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
      [v13 stopAllActivityForThermal];

      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVSWiFiInterface WiFiInterface](&OBJC_CLASS___TVSWiFiInterface, "WiFiInterface"));
      [v14 setEnabled:0];

      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBCriticalAlertManager sharedInstance](&OBJC_CLASS___PBCriticalAlertManager, "sharedInstance"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBCriticalAlertContext thermalContext](&OBJC_CLASS___PBCriticalAlertContext, "thermalContext"));
      [v15 presentAlertWithContext:v16];

      if (v3 > v4) {
        +[PBDataReportingService incrementOccurrenceCountForAction:]( &OBJC_CLASS___PBDataReportingService,  "incrementOccurrenceCountForAction:",  3LL);
      }
    }
  }

- (void)_pausePlaybackWithReason:(id)a3
{
  id v3 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteCommandCenter defaultCenter](&OBJC_CLASS___PBMediaRemoteCommandCenter, "defaultCenter"));
  [v4 pauseWithReason:v3];
}

- (void)_stopAllActivity
{
  if (sub_1001C9BFC())
  {
    -[PBAppDelegate _launchPurpleBuddy](self, "_launchPurpleBuddy");
  }

  else
  {
    uint64_t v8 = PBAppLaunchOptionDeactivation;
    BOOL v9 = &__kCFBooleanTrue;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    -[PBAppDelegate openKioskApplicationWithReason:options:completion:]( self,  "openKioskApplicationWithReason:options:completion:",  @"Stopping all activity",  v3,  0LL);
  }

  -[PBAppDelegate setAppLaunchDisabled:](self, "setAppLaunchDisabled:", 1LL);
  if (notify_post("com.apple.airplay.playbackPrevent"))
  {
    id v4 = sub_1000824FC();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10028DC58();
    }
  }

  -[PBAppDelegate _stopAllOdeonActivity](self, "_stopAllOdeonActivity");
  if (!MRMediaRemoteSendCommand(3LL, 0LL))
  {
    id v6 = sub_1000824FC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10028DC2C();
    }
  }

  if (qword_1004712F0 != -1) {
    dispatch_once(&qword_1004712F0, &stru_1003DB8C0);
  }
  if (byte_10046D404)
  {
    notify_set_state(dword_1004712F8, 1uLL);
    notify_post("com.apple.PineBoard.thermalShutdownNotification");
  }

- (void)_resumeActivity
{
  if (notify_post("com.apple.airplay.playbackAllow"))
  {
    id v3 = sub_1000824FC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10028DC84();
    }
  }

  if (byte_10046D404)
  {
    notify_set_state(dword_1004712F8, 0LL);
    notify_post("com.apple.PineBoard.thermalShutdownNotification");
  }

  -[PBAppDelegate _launchConferenceRoomDisplayAppWithReason:](self, "_launchConferenceRoomDisplayAppWithReason:", 0LL);
}

- (void)_stopAllOdeonActivity
{
  if (notify_post("com.apple.airplay.stopSenderSession"))
  {
    id v2 = sub_1000824FC();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10028DCB0();
    }
  }

- (void)_setupWebinspector
{
  if (!CFPreferencesGetAppBooleanValue(@"RemoteInspectorEnabled", @"com.apple.webinspectord", 0LL))
  {
    CFPreferencesSetAppValue(@"RemoteInspectorEnabled", kCFBooleanTrue, @"com.apple.webinspectord");
    CFPreferencesAppSynchronize(@"com.apple.webinspectord");
  }

- (BOOL)_shouldShowSiri
{
  int v28 = sub_1001C9BFC() ^ 1;
  unsigned int v3 = -[PBAppDelegate _keyboardFocusedInApp:](self, "_keyboardFocusedInApp:", @"com.apple.purplebuddy");
  unsigned int v4 = !-[PBAppDelegate appLaunchDisabled](self, "appLaunchDisabled");
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v27 = [v5 siriAndDictationAllowed];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
  unsigned int v7 = [v6 isPresenting];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedSceneHandle]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uiClientSettings]);
  unsigned int v11 = [v10 systemInputActive];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned int v13 = [v12 isDictationEnabled];

  int v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSiriSettings sharedInstance](&OBJC_CLASS___PBSSiriSettings, "sharedInstance"));
  unsigned int v15 = [v14 offeredEnableDictation] ^ 1;

  unsigned int v16 = !-[PBAppDelegate awaitingSiriOptInOfferResponse](self, "awaitingSiriOptInOfferResponse");
  int v17 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned int v18 = [v17 isPresenting] ^ 1;

  int v19 = v3 & v13 & v4;
  if ((v28 & 1) != 0) {
    int v19 = v4;
  }
  int v20 = v19 & v27;
  if ((v20 & v7 & v11) == 1) {
    int v21 = v13 | v15;
  }
  else {
    int v21 = v20 ^ v20 & v7;
  }
  int v22 = v21 & v16 & v18;
  id v23 = sub_100082C04();
  int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136317954;
    uint64_t v30 = "-[PBAppDelegate _shouldShowSiri]";
    __int16 v25 = "NO";
    int v32 = v28;
    __int16 v31 = 1024;
    if (v22) {
      __int16 v25 = "YES";
    }
    __int16 v33 = 1024;
    unsigned int v34 = v3;
    __int16 v35 = 1024;
    unsigned int v36 = v4;
    __int16 v37 = 1024;
    unsigned int v38 = v27;
    __int16 v39 = 1024;
    int v40 = v7 ^ 1;
    __int16 v41 = 1024;
    unsigned int v42 = v11;
    __int16 v43 = 1024;
    unsigned int v44 = v13;
    __int16 v45 = 1024;
    unsigned int v46 = v15;
    __int16 v47 = 1024;
    unsigned int v48 = v16;
    __int16 v49 = 1024;
    unsigned int v50 = v18;
    __int16 v51 = 2080;
    uint64_t v52 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s;  %d %d   %d %d   %d %d %d %d   %d %d  => %s",
      buf,
      0x52u);
  }

  return v22;
}

- (BOOL)_keyboardFocusedInApp:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusedSceneHandle]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uiClientSettings]);
  unsigned int v7 = [v6 systemInputActive];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedSceneHandle]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientProcessBundleIdentifier]);
    unsigned __int8 v11 = [v10 isEqual:v3];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_updateEventMaskingWindow
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v3 = [v2 inputAllowed];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBEventMaskingManager sharedInstance](&OBJC_CLASS___PBEventMaskingManager, "sharedInstance"));
  int v5 = v4;
  if (v3) {
    [v4 dismiss];
  }
  else {
    [v4 present];
  }
}

- (void)_setupPowerOffSystemGestures
{
  if (self->_powerOffHintGesture)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_powerOffHintGesture == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028DD9C(a2);
    }
LABEL_9:
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x1001BEAACLL);
  }

  if (self->_powerOffGesture)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_powerOffGesture == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028DCDC(a2);
    }
    goto LABEL_9;
  }

  objc_initWeak(&location, self);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001BEB50;
  v13[3] = &unk_1003D1020;
  objc_copyWeak(&v14, &location);
  int v5 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:23 actionHandler:v13];
  powerOffHintGesture = self->_powerOffHintGesture;
  self->_powerOffHintGesture = v5;

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001BEB7C;
  v11[3] = &unk_1003D1020;
  objc_copyWeak(&v12, &location);
  uint64_t v8 = (PBSystemGestureHandle *)[v7 newHandleForSystemGesture:24 actionHandler:v11];
  powerOffGesture = self->_powerOffGesture;
  self->_powerOffGesture = v8;

  -[PBSystemGestureHandle acquire](self->_powerOffHintGesture, "acquire");
  -[PBSystemGestureHandle acquire](self->_powerOffGesture, "acquire");
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_showPowerOffBulletin
{
  if (!self->_powerOffBulletin)
  {
    unsigned int v3 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
    unsigned int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_1003FE118, PBSSystemBulletinStyleKey);
    id v5 = sub_1001C307C(@"PowerOffBulletinTitle", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, PBSSystemBulletinTitleKey);

    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  PBSSystemBulletinImageIDPower,  PBSSystemBulletinImageIDKey);
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_1003FEC90, PBSSystemBulletinTimeoutKey);
    -[PBSBulletin setMessage:](v3, "setMessage:", v4);
    -[PBSBulletin setViewControllerClassName:]( v3,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
    -[PBSBulletin setServiceIdentifier:](v3, "setServiceIdentifier:", PBSSystemBulletinServiceName);
    powerOffBulletin = self->_powerOffBulletin;
    self->_powerOffBulletin = v3;
    uint64_t v8 = v3;

    -[PBBulletinService presentBulletin:withCompletion:]( self->_bulletinService,  "presentBulletin:withCompletion:",  v8,  0LL);
  }

- (void)bulletinService:(id)a3 didDismissBulletin:(id)a4 withReason:(unint64_t)a5
{
  id v6 = (PBSBulletin *)a4;
  unsigned int v7 = v6;
  if (self->_powerOffBulletin == v6)
  {
    self->_powerOffBulletin = 0LL;
  }
}

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v5 = (void (**)(void))a5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  [v6 dismissAssistant];

  v5[2](v5);
}

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
}

- (BOOL)_wakeDeviceForSiriInteractionWithContext:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  id v5 = [v4 powerState];

  if (v5 == (id)3
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 sourceName]),
        unsigned int v7 = [v6 isEqual:PBSMediaRemoteSiriContextSourceNameMediaRemoteService],
        v6,
        v7))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
    [v8 wakeSystemWithReason:135];

    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_performObliterationOnBootIfNeeded
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 synchronize];

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
  unsigned int v4 = objc_msgSend(v3, "pbs_shouldObliterateOnLaunch");

  id v5 = sub_1000836CC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "RESTORE: Checking obliterate on boot flag: %d",  buf,  8u);
  }

  if (v4)
  {
    uint64_t RestoreFilePath = lastRestoreFilePath();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(RestoreFilePath);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v10 = [v9 fileExistsAtPath:v8];

    if ((v10 & 1) != 0)
    {
      int v28 = v8;
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    }

    else
    {
      id v12 = sub_1000836CC();
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10028DE5C();
      }

      unsigned __int8 v11 = 0LL;
    }

    id v14 = sub_1000836CC();
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v27 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "RESTORE: Performing obliterate on boot preserving %{public}@.",  buf,  0xCu);
    }

    +[TVSBluetoothRemoteUtilities resetToFactoryDefault]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "resetToFactoryDefault");
    v24[0] = kCFUserNotificationAlertHeaderKey;
    id v16 = sub_1001C307C(@"OSUpdateRestoreWaitingTitle", 0LL);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v25[0] = v17;
    v24[1] = kCFUserNotificationAlertMessageKey;
    id v18 = sub_1001C307C(@"OSUpdateRestoreWaitingText", 0LL);
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v25[1] = v19;
    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001BF110;
    v22[3] = &unk_1003D1F08;
    id v23 = v20;
    id v21 = v20;
    +[PBOSUpdateService _obliterateDataPreservingPaths:clearAccounts:withCompletion:]( &OBJC_CLASS___PBOSUpdateService,  "_obliterateDataPreservingPaths:clearAccounts:withCompletion:",  v11,  0LL,  v22);
  }

- (void)_handleEnableEnhanceDialogNotification:(id)a3
{
}

- (void)_handleDisableEnhanceDialogNotification:(id)a3
{
}

- (void)_handleSetEnhanceDialogueLevelNotification:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  id v6 = v4;
  unsigned int v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  id v9 = v8;

  id v10 = [v9 intValue];
  id v11 = sub_100082C04();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    int v20 = "-[PBAppDelegate _handleSetEnhanceDialogueLevelNotification:]";
    __int16 v21 = 1024;
    int v22 = (int)v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s %i", (uint8_t *)&v19, 0x12u);
  }

  -[PBAppDelegate _setEnhanceDialogEnabled:](self, "_setEnhanceDialogEnabled:", (_DWORD)v10 != 0);
  id v13 = objc_alloc(&OBJC_CLASS___HPSNumberSetting);
  uint64_t v14 = HPSKeyPathEnhanceDialogueLevels;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
  id v16 = [v13 initWithKeyPath:v14 numberValue:v15];

  hpsAccessoryService = self->_hpsAccessoryService;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 keyPath]);
  -[HPSAccessorySettingService updateSettingForKeyPath:setting:completionHandler:]( hpsAccessoryService,  "updateSettingForKeyPath:setting:completionHandler:",  v18,  v16,  &stru_1003DB900);
}

- (void)_setEnhanceDialogEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = "no";
    if (v3) {
      unsigned int v7 = "yes";
    }
    int v12 = 136315394;
    id v13 = "-[PBAppDelegate _setEnhanceDialogEnabled:]";
    __int16 v14 = 2080;
    unsigned int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %s", (uint8_t *)&v12, 0x16u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___HPSBooleanSetting);
  id v9 = [v8 initWithKeyPath:HPSKeyPathEnhanceDialog BOOLeanValue:v3];
  hpsAccessoryService = self->_hpsAccessoryService;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 keyPath]);
  -[HPSAccessorySettingService updateSettingForKeyPath:setting:completionHandler:]( hpsAccessoryService,  "updateSettingForKeyPath:setting:completionHandler:",  v11,  v9,  &stru_1003DB920);
}

- (void)_handleEnableLateNightModeNotification:(id)a3
{
}

- (void)_handleDisableLateNightModeNotification:(id)a3
{
}

- (void)_setLateNightModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = "no";
    if (v3) {
      unsigned int v7 = "yes";
    }
    int v12 = 136315394;
    id v13 = "-[PBAppDelegate _setLateNightModeEnabled:]";
    __int16 v14 = 2080;
    unsigned int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %s", (uint8_t *)&v12, 0x16u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___HPSBooleanSetting);
  id v9 = [v8 initWithKeyPath:HPSKeyPathLateNightMode BOOLeanValue:v3];
  hpsAccessoryService = self->_hpsAccessoryService;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 keyPath]);
  -[HPSAccessorySettingService updateSettingForKeyPath:setting:completionHandler:]( hpsAccessoryService,  "updateSettingForKeyPath:setting:completionHandler:",  v11,  v9,  &stru_1003DB940);
}

- (void)activateDictationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    int v12 = "-[PBAppDelegate activateDictationWithContext:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  if (-[PBAppDelegate _suggestUserEnableDictation](self, "_suggestUserEnableDictation"))
  {
    int v7 = 1;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBDictationManager sharedInstance](&OBJC_CLASS___PBDictationManager, "sharedInstance"));
    int v7 = [v8 activateDictationWithContext:v4];

    if (!v7)
    {
      if (-[PBAppDelegate _launchTVSearch](self, "_launchTVSearch")) {
        int v7 = 8;
      }
      else {
        int v7 = 0;
      }
    }
  }

  id v9 = sub_100082C04();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    int v12 = "-[PBAppDelegate activateDictationWithContext:]";
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s; handled point = %d",
      (uint8_t *)&v11,
      0x12u);
  }
}

- (void)startDictationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    int v12 = "-[PBAppDelegate startDictationWithContext:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  if (-[PBAppDelegate _suggestUserEnableDictation](self, "_suggestUserEnableDictation"))
  {
    int v7 = 1;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBDictationManager sharedInstance](&OBJC_CLASS___PBDictationManager, "sharedInstance"));
    int v7 = [v8 startDictationWithContext:v4];

    if (!v7)
    {
      if (-[PBAppDelegate _launchTVSearch](self, "_launchTVSearch")) {
        int v7 = 8;
      }
      else {
        int v7 = 0;
      }
    }
  }

  id v9 = sub_100082C04();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    int v12 = "-[PBAppDelegate startDictationWithContext:]";
    __int16 v13 = 1024;
    int v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s; handled point = %d",
      (uint8_t *)&v11,
      0x12u);
  }
}

- (void)stopDictationWithContext:(id)a3
{
  id v3 = a3;
  id v4 = sub_100082C04();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[PBAppDelegate stopDictationWithContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBDictationManager sharedInstance](&OBJC_CLASS___PBDictationManager, "sharedInstance"));
  id v7 = [v6 stopDictationWithContext:v3];

  id v8 = sub_100082C04();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "-[PBAppDelegate stopDictationWithContext:]";
    __int16 v12 = 2048;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s; handled point = %ld",
      (uint8_t *)&v10,
      0x16u);
  }
}

- (void)activateSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    unsigned int v15 = "-[PBAppDelegate activateSiriWithContext:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  if (!+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
    [v7 dismissControlCenter];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  if (-[PBAppDelegate _wakeDeviceForSiriInteractionWithContext:](self, "_wakeDeviceForSiriInteractionWithContext:", v4))
  {
    int v9 = 1;
  }

  else if (-[PBAppDelegate _shouldShowSiri](self, "_shouldShowSiri"))
  {
    if (-[PBAppDelegate _suggestUserEnableDictation](self, "_suggestUserEnableDictation"))
    {
      int v9 = 3;
    }

    else if (-[PBAppDelegate _suggestUserEnableAssistantAndDictation](self, "_suggestUserEnableAssistantAndDictation"))
    {
      int v9 = 4;
    }

    else
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
      id v11 = [v10 activateSiriWithContext:v4];

      if (v11)
      {
        int v9 = 5;
      }

      else if (-[PBAppDelegate _launchTVSearch](self, "_launchTVSearch"))
      {
        int v9 = 6;
      }

      else
      {
        int v9 = 0;
      }
    }
  }

  else
  {
    int v9 = 2;
  }

  id v12 = sub_100082C04();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    unsigned int v15 = "-[PBAppDelegate activateSiriWithContext:]";
    __int16 v16 = 1024;
    int v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s; handled point = %d",
      (uint8_t *)&v14,
      0x12u);
  }
}

- (void)startSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    unsigned int v15 = "-[PBAppDelegate startSiriWithContext:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
  [v7 dismissControlCenter];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  if (-[PBAppDelegate _wakeDeviceForSiriInteractionWithContext:](self, "_wakeDeviceForSiriInteractionWithContext:", v4))
  {
    int v9 = 1;
  }

  else if (-[PBAppDelegate _shouldShowSiri](self, "_shouldShowSiri"))
  {
    if (-[PBAppDelegate _suggestUserEnableDictation](self, "_suggestUserEnableDictation"))
    {
      int v9 = 3;
    }

    else if (-[PBAppDelegate _suggestUserEnableAssistantAndDictation](self, "_suggestUserEnableAssistantAndDictation"))
    {
      int v9 = 4;
    }

    else if (-[PBAppDelegate _suggestUserEnableDataSharing](self, "_suggestUserEnableDataSharing"))
    {
      int v9 = 5;
    }

    else
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
      id v11 = [v10 startSiriWithContext:v4];

      if (v11)
      {
        int v9 = 6;
      }

      else if (-[PBAppDelegate _launchTVSearch](self, "_launchTVSearch"))
      {
        int v9 = 7;
      }

      else
      {
        int v9 = 0;
      }
    }
  }

  else
  {
    int v9 = 2;
  }

  id v12 = sub_100082C04();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    unsigned int v15 = "-[PBAppDelegate startSiriWithContext:]";
    __int16 v16 = 1024;
    int v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s; handled point = %d",
      (uint8_t *)&v14,
      0x12u);
  }
}

- (void)stopSiriWithContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[PBAppDelegate stopSiriWithContext:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  if (-[PBAppDelegate _shouldShowSiri](self, "_shouldShowSiri"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
    if ([v7 stopSiriWithContext:v4]) {
      int v8 = 5;
    }
    else {
      int v8 = 0;
    }
  }

  else
  {
    int v8 = 2;
  }

  id v9 = sub_100082C04();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[PBAppDelegate stopSiriWithContext:]";
    __int16 v13 = 1024;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s; handled point = %d",
      (uint8_t *)&v11,
      0x12u);
  }
}

- (BOOL)_requestWakeForReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  id v6 = [v5 powerState];

  if (v6 == (id)3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    [v7 wakeRequestedByClient:v9 forReason:v4];
  }

  else
  {
    id v10 = sub_1000824FC();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Wake requested but already awake.",  (uint8_t *)v14,  2u);
    }

    id v12 = (id)PBSWakeReasonUserPower;
    if (v12 == v4) {
      -[PBAppDelegate _showPowerOffBulletin](self, "_showPowerOffBulletin");
    }
  }

  return v6 == (id)3;
}

- (BOOL)_requestSleepForReason:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  id v5 = [v4 powerState];

  if (v5 == (id)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    [v6 sleepRequestedByClient:v8 forReason:v3];
  }

  else
  {
    id v9 = sub_1000824FC();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_INFO,  "Sleep requested but already asleep.",  v11,  2u);
    }
  }

  return v5 == (id)1;
}

- (BOOL)_applicationForPIDIsPlaying:(int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  id v5 = v4;
  BOOL v6 = a3 >= 1

  return v6;
}

- (BOOL)appLaunchDisabled
{
  return self->_appLaunchDisabled;
}

- (void)setAppLaunchDisabled:(BOOL)a3
{
  self->_appLaunchDisabled = a3;
}

- (TVSBackgroundTask)programmingGuideBackgroundTask
{
  return self->_programmingGuideBackgroundTask;
}

- (BOOL)awaitingSiriOptInOfferResponse
{
  return self->_awaitingSiriOptInOfferResponse;
}

- (void)setAwaitingSiriOptInOfferResponse:(BOOL)a3
{
  self->_awaitingSiriOptInOfferResponse = a3;
}

- (BOOL)_kioskRelaunchDisabled
{
  return self->__kioskRelaunchDisabled;
}

- (void)set_kioskRelaunchDisabled:(BOOL)a3
{
  self->__kioskRelaunchDisabled = a3;
}

- (PBAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (PBLargeGameInstallMonitor)largeGameInstallMonitor
{
  return self->_largeGameInstallMonitor;
}

- (PBConstantAudioOutputController)constantAudioOutputController
{
  return self->_constantAudioOutputController;
}

- (void)setConstantAudioOutputController:(id)a3
{
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (void)setBulletinService:(id)a3
{
}

- (PBSystemGestureHandle)powerOffHintGesture
{
  return self->_powerOffHintGesture;
}

- (PBSystemGestureHandle)powerOffGesture
{
  return self->_powerOffGesture;
}

- (PBSBulletin)powerOffBulletin
{
  return self->_powerOffBulletin;
}

- (void)setPowerOffBulletin:(id)a3
{
}

- (PBSystemGestureHandle)accessibilityShortcutGesture
{
  return self->_accessibilityShortcutGesture;
}

- (PBSystemGestureCompatibilityShim)systemGestureCompatibilityShim
{
  return self->_systemGestureCompatibilityShim;
}

- (PBRecognizeMyVoiceObserver)recognizeMyVoiceObserver
{
  return self->_recognizeMyVoiceObserver;
}

- (void)setRecognizeMyVoiceObserver:(id)a3
{
}

- (HPSAccessorySettingService)hpsAccessoryService
{
  return self->_hpsAccessoryService;
}

- (void)setHpsAccessoryService:(id)a3
{
}

- (NSString)initialLaunchApplicationBundleID
{
  return self->_initialLaunchApplicationBundleID;
}

- (PBInternationalizationManager)internationalizationManager
{
  return self->_internationalizationManager;
}

- (void).cxx_destruct
{
}

  ;
}

@end