@interface SCATScannerManager
+ (id)sharedManager;
+ (void)updateElementCacheScheme;
- (AXDispatchTimer)beginScanningTimer;
- (AXOutputManager)outputManager;
- (AXSSInterDeviceCommunicator)interDeviceCommunicator;
- (AXSwitchRecipe)currentRecipe;
- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer;
- (BOOL)_isPostScanningMenu:(id)a3;
- (BOOL)_isScannerControlledByDriver:(id)a3;
- (BOOL)_shouldIgnoreAllScannerControlMessages;
- (BOOL)_userHasDisabledUSBRM;
- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4;
- (BOOL)activateElement:(id)a3;
- (BOOL)areSoundEffectsEnabled;
- (BOOL)canAdvertise;
- (BOOL)canReturnControlToForwarderDevice:(id)a3;
- (BOOL)canSearchForControllableDevicesWithMenu:(id)a3;
- (BOOL)candidateBarManager:(id)a3 hasValidTypingCandidates:(id)a4;
- (BOOL)cursorManagerShouldHideMenuCursor:(id)a3;
- (BOOL)didPauseForReasonsToDisableScanning;
- (BOOL)didSetFocusContextForResume;
- (BOOL)forceDisableScreenLock;
- (BOOL)isActive;
- (BOOL)isAutoscanEnabled;
- (BOOL)isControllingOtherDevice;
- (BOOL)isExternalDisplayConnected;
- (BOOL)isGroupingEnabled;
- (BOOL)isHandlingInterDeviceCommunication;
- (BOOL)isInactive;
- (BOOL)isLandscape;
- (BOOL)isLoaded;
- (BOOL)isPaused;
- (BOOL)isSpeechEnabled;
- (BOOL)isSwitchWithSource:(id)a3;
- (BOOL)isSystemSleeping;
- (BOOL)isUIContextHidden;
- (BOOL)isUsingPointMode;
- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4;
- (BOOL)shouldAddItemSpecificMenuOptionsToMenu:(id)a3;
- (BOOL)shouldBypassShowingMenuForElement:(id)a3;
- (BOOL)shouldShowAppWideScrollActionsInMenu:(id)a3;
- (BOOL)shouldUseCameraPointPicker;
- (CGPoint)_startingPointForGesturesForPointPicker:(id)a3;
- (CGRect)menu:(id)a3 rectToClearForFingersWithGestureSheet:(BOOL)a4;
- (HNDAccessibilityManager)testAxManager;
- (HNDScannerAutoscroller)autoscroller;
- (NSArray)recentSpeechOutputStrings;
- (NSMutableSet)reasonsToDisableScanning;
- (NSMutableSet)scannerObservers;
- (NSString)description;
- (OS_dispatch_queue)managedConfigurationQueue;
- (SCATActionHandler)activateActionHandler;
- (SCATActionHandler)selectActionHandler;
- (SCATActionHandler)selectAndResumeAutoscanningActionHandler;
- (SCATActionItem)currentAction;
- (SCATAlternateKeysManager)alternateKeysManager;
- (SCATAppleTVRemote)appleTVRemote;
- (SCATAutomaticDriver)autoScanningDriver;
- (SCATCandidateBarManager)candidateBarManager;
- (SCATCursorManager)cursorManager;
- (SCATDriver)activeScannerDriver;
- (SCATDwellDriver)dwellScanningDriver;
- (SCATElement)cachedPickerElement;
- (SCATElement)currentElement;
- (SCATElementManager)activeElementManager;
- (SCATElementNavigationController)elementNavController;
- (SCATFocusContext)currentFocusContext;
- (SCATFocusContext)focusContextForResume;
- (SCATGestureProvider)gestureProvider;
- (SCATInputController)inputController;
- (SCATManualDriver)manualScanningDriver;
- (SCATMenu)menu;
- (SCATPointPicker)pointPicker;
- (SCATScannerManager)init;
- (SCATScannerManagerDelegate)delegate;
- (SCATScrollViewPickerManager)scrollViewPickerManager;
- (id)_driverForScannerState;
- (id)_elementManagerForScannerState;
- (id)_focusContextAtPoint:(CGPoint)a3;
- (id)_primaryElementManagerForScannerState;
- (id)_typingCandidates;
- (id)axManager;
- (id)contentViewForGestureProvider:(id)a3;
- (id)exitActionElementForFingersInMenu:(id)a3;
- (id)focusContextForActionHandler:(id)a3;
- (id)gesturesSheetForMenu:(id)a3;
- (id)scatBackCursorUIContext;
- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatFrontCursorUIContext;
- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatUIContext;
- (id)scatUIContextForDisplayID:(unsigned int)a3;
- (id)userInterfaceClientForInputController:(id)a3;
- (int)_validatedSelectBehaviorForCurrentSelectBehavior:(int)a3 replacementElement:(id)a4;
- (int64_t)_dwellSwitchAssignedAction;
- (int64_t)itemMenuState;
- (int64_t)scanningMode;
- (unint64_t)immediateSelectActionCount;
- (unint64_t)minimumPointPickerNumberOfCyclesForDriver:(id)a3;
- (unsigned)currentDisplayID;
- (unsigned)lockedToDisplayID;
- (void)_applyLaunchRecipeUUID;
- (void)_beginOrContinueScanningWithFocusContext:(id)a3 shouldBegin:(BOOL)a4 foundNewElements:(BOOL)a5;
- (void)_deactivateAudioSession;
- (void)_disableUserInterfaceClientForPotentialReceiver;
- (void)_driver:(id)a3 outputAudioForContext:(id)a4;
- (void)_exitRecipeOnTimeout;
- (void)_handleAppSwitcherAction;
- (void)_handleCameraButton;
- (void)_handleCameraButtonDoubleLightPress;
- (void)_handleCameraButtonLightPress;
- (void)_handleControlCenterAction;
- (void)_handleDictationAction;
- (void)_handleEscapeAction;
- (void)_handleForceTouchAction;
- (void)_handleHomeAction;
- (void)_handleNotificationCenterAction;
- (void)_handleSiriAction;
- (void)_handleTripleClickAction;
- (void)_handleVisualIntelligence;
- (void)_handleVolumeDownAction;
- (void)_handleVolumeUpAction;
- (void)_notifyObserversScannerDidBecomeActive;
- (void)_notifyObserversScannerDidBecomeInactive;
- (void)_notifyObserversScannerDidFocusOnContext:(id)a3 oldContext:(id)a4;
- (void)_notifyObserversScannerDidPause;
- (void)_notifyObserversScannerWillFocusOnContext:(id)a3;
- (void)_notifyObserversScannerWillUnfocusFromContext:(id)a3;
- (void)_overrideScanningModeAtStartupIfNecessary;
- (void)_resetRecipeTimeoutIfApplicable;
- (void)_scanningModePreferenceDidChange;
- (void)_setCurrentRecipe:(id)a3 shouldShowAlert:(BOOL)a4;
- (void)_setUSBRMPreferenceDisabled;
- (void)_showSimpleBannerWithText:(id)a3;
- (void)_updateActiveElementManager;
- (void)_updateActiveElementManager:(id)a3;
- (void)_updateAudioSessionState;
- (void)_updateElementVisuals;
- (void)_updateMenuAfterElementFetchFoundNewElements:(BOOL)a3;
- (void)_updateScanningStyle;
- (void)_waitForApplication:(id)a3;
- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4;
- (void)accessibilityManager:(id)a3 didFetchElementsForEvent:(int64_t)a4 foundNewElements:(BOOL)a5;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)accessibilityManager:(id)a3 nativeFocusElementDidChange:(id)a4;
- (void)accessibilityManager:(id)a3 screenWillChange:(__CFData *)a4;
- (void)accessibilityManager:(id)a3 updateElementVisuals:(id)a4;
- (void)accessibilityManagerShouldPauseScanning:(id)a3;
- (void)accessibilityManagerShouldResumeScanning:(id)a3;
- (void)actionHandlerDidCancelPendingAction:(id)a3;
- (void)actionHandlerDidFireAction:(id)a3;
- (void)actionHandlerForUI:(id)a3 willPerformDelayedActionOnContext:(id)a4 withCount:(unint64_t)a5;
- (void)actionHandlerForUIDidCancelPendingAction:(id)a3;
- (void)actionHandlerForUIWillFireAction:(id)a3;
- (void)addObserver:(id)a3;
- (void)addReasonToDisableScanning:(id)a3;
- (void)alternateKeysManager:(id)a3 didSelectAlternateKey:(id)a4;
- (void)beginScanningWithFocusContext:(id)a3;
- (void)clearRecentSpeech;
- (void)continueScanningWithFocusContext:(id)a3 foundNewElements:(BOOL)a4;
- (void)dealloc;
- (void)didBecomeIdle;
- (void)didBeginLongPressForInputController:(id)a3;
- (void)didChooseCreateCustomGestureFromGestureProvider:(id)a3;
- (void)didConnectAsForwarderToDeviceWithName:(id)a3;
- (void)didConnectAsReceiverWithSettings:(id)a3;
- (void)didDisconnectAsForwarderFromDeviceWithName:(id)a3;
- (void)didDisconnectAsReceiver;
- (void)didEndLongPressForInputController:(id)a3;
- (void)didPressScreenChangingButtonInMenu:(id)a3;
- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5;
- (void)driver:(id)a3 indicateDwellScanningWillAbort:(BOOL)a4;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)driver:(id)a3 willUnfocusFromContext:(id)a4;
- (void)driverDidBecomeActive:(id)a3 didChange:(BOOL)a4;
- (void)driverDidBecomeInactive:(id)a3;
- (void)driverDidPause:(id)a3;
- (void)endScanning;
- (void)gestureProvider:(id)a3 shouldResetScanningFromElement:(id)a4;
- (void)handleAlertDidAppear:(id)a3;
- (void)handleAnnouncement:(id)a3;
- (void)handleScreenChange:(id)a3;
- (void)handleStopSpeaking:(id)a3;
- (void)handleUSBMFiDeviceConnected;
- (void)hideUIContext:(BOOL)a3;
- (void)highlightAsPotentialReceiverForDeviceWithName:(id)a3;
- (void)inputController:(id)a3 didReceiveAction:(id)a4;
- (void)inputController:(id)a3 didReceivePoint:(CGPoint)a4;
- (void)inputController:(id)a3 didReceiveRecipeActionForMappingAtIndex:(unint64_t)a4 isLongPressAction:(BOOL)a5;
- (void)inputController:(id)a3 didReceiveRecipeHoldAtPoint:(CGPoint)a4 isDown:(BOOL)a5;
- (void)loadScanner;
- (void)menu:(id)a3 activateRecipe:(id)a4;
- (void)menu:(id)a3 playSoundEffect:(int)a4;
- (void)menu:(id)a3 setItemMenuState:(int64_t)a4;
- (void)menu:(id)a3 showAlternateKeysForKey:(id)a4;
- (void)menu:(id)a3 showScrollViewPickerForScrollViews:(id)a4 elementsToScroll:(id)a5 scrollAction:(int)a6;
- (void)menu:(id)a3 showSysdiagnoseDisplayString:(id)a4;
- (void)menu:(id)a3 showTypingCandidates:(id)a4;
- (void)menu:(id)a3 speakAnnouncement:(id)a4 completionBlock:(id)a5;
- (void)menuDidDisappear:(id)a3;
- (void)menuDidFinishTransition:(id)a3;
- (void)menuWillBeginTransition:(id)a3;
- (void)pauseScanning;
- (void)pauseScanningWithScreenLockDisabled:(BOOL)a3;
- (void)performSysdiagnoseForInputController:(id)a3;
- (void)pointPicker:(id)a3 didFinishDwellingOnPoint:(CGPoint)a4;
- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4;
- (void)pointPicker:(id)a3 didSweepIntoFocusContext:(id)a4 isRefiningPoint:(BOOL)a5;
- (void)pointPicker:(id)a3 didSweepOutOfFocusContext:(id)a4 isRefiningPoint:(BOOL)a5;
- (void)presentPostScanningMenuForElementNavigationController:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeReasonToDisableScanning:(id)a3;
- (void)resumeScanning;
- (void)returnControlToForwarderDevice:(id)a3;
- (void)searchForControllableDevicesWithMenu:(id)a3;
- (void)selectElement:(id)a3;
- (void)selectElementAtPoint:(CGPoint)a3;
- (void)setActivateActionHandler:(id)a3;
- (void)setActiveElementManager:(id)a3;
- (void)setActiveElementManager:(id)a3 completion:(id)a4;
- (void)setActiveScannerDriver:(id)a3;
- (void)setAlternateKeysManager:(id)a3;
- (void)setAppleTVRemote:(id)a3;
- (void)setAutoScanningDriver:(id)a3;
- (void)setAutoscroller:(id)a3;
- (void)setBeginScanningTimer:(id)a3;
- (void)setCachedPickerElement:(id)a3;
- (void)setCandidateBarManager:(id)a3;
- (void)setCurrentAction:(id)a3;
- (void)setCurrentRecipe:(id)a3;
- (void)setCursorManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPauseForReasonsToDisableScanning:(BOOL)a3;
- (void)setDidSetFocusContextForResume:(BOOL)a3;
- (void)setDwellScanningDriver:(id)a3;
- (void)setElementNavController:(id)a3;
- (void)setFocusContextForResume:(id)a3;
- (void)setForceDisableScreenLock:(BOOL)a3;
- (void)setGestureProvider:(id)a3;
- (void)setInputController:(id)a3;
- (void)setInterDeviceCommunicator:(id)a3;
- (void)setItemMenuState:(int64_t)a3;
- (void)setLockedToDisplayID:(unsigned int)a3;
- (void)setManagedConfigurationQueue:(id)a3;
- (void)setManualScanningDriver:(id)a3;
- (void)setMenu:(id)a3;
- (void)setOutputManager:(id)a3;
- (void)setPointPicker:(id)a3;
- (void)setReasonsToDisableScanning:(id)a3;
- (void)setRecentSpeechOutputStrings:(id)a3;
- (void)setScannerObservers:(id)a3;
- (void)setScrollViewPickerManager:(id)a3;
- (void)setSelectActionHandler:(id)a3;
- (void)setSelectAndResumeAutoscanningActionHandler:(id)a3;
- (void)setTestAxManager:(id)a3;
- (void)setUpdateElementVisualsCoalescer:(id)a3;
- (void)shouldEndScanningGestureProvider:(id)a3;
- (void)shouldStartScanningGestureProvider:(id)a3;
- (void)showUIContext:(BOOL)a3;
- (void)switchCurrentDisplayContext;
- (void)unloadScanner;
- (void)useFocusContextOnResume:(id)a3;
@end

@implementation SCATScannerManager

+ (id)sharedManager
{
  if (qword_1001577C8[0] != -1) {
    dispatch_once(qword_1001577C8, &stru_100124AD0);
  }
  return (id)qword_1001577C0;
}

+ (void)updateElementCacheScheme
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 switchControlTapBehavior];

  if (v3 == (id)2) {
    uint64_t v4 = 3LL;
  }
  else {
    uint64_t v4 = 2LL;
  }
  +[AXUIElement applyElementAttributeCacheScheme:](&OBJC_CLASS___AXUIElement, "applyElementAttributeCacheScheme:", v4);
}

- (SCATScannerManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATScannerManager;
  v2 = -[SCATScannerManager init](&v12, "init");
  id v3 = v2;
  if (v2)
  {
    -[SCATScannerManager _performAccessibilityValidations](v2, "_performAccessibilityValidations");
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___AXSSInterDeviceCommunicator);
    interDeviceCommunicator = v3->_interDeviceCommunicator;
    v3->_interDeviceCommunicator = v4;

    -[AXSSInterDeviceCommunicator setConnectionListener:](v3->_interDeviceCommunicator, "setConnectionListener:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v6 warm];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessibility.SC.MC", 0LL);
    managedConfigurationQueue = v3->_managedConfigurationQueue;
    v3->_managedConfigurationQueue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    scannerObservers = v3->_scannerObservers;
    v3->_scannerObservers = v9;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATScannerManager;
  -[SCATScannerManager dealloc](&v3, "dealloc");
}

- (BOOL)_userHasDisabledUSBRM
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 userBoolValueForSetting:MCFeatureUSBRestrictedModeAllowed] == 2;

  return v3;
}

- (void)_setUSBRMPreferenceDisabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v2 setBoolValue:0 forSetting:MCFeatureUSBRestrictedModeAllowed];

  int v3 = _AXSGetUSBRMDisablers();
  _AXSSetUSBRMDisablers(v3 | 2u);
}

- (void)handleUSBMFiDeviceConnected
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 switchControlUserDidReadUSBRestrictedModeAlert];

  LODWORD(self) = -[SCATScannerManager _userHasDisabledUSBRM](self, "_userHasDisabledUSBRM");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v6 = [v5 switchControlShouldDisallowUSBRestrictedMode];

  if ((v4 | self) != 1 || v6 != 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v8 setSwitchControlShouldDisallowUSBRestrictedMode:0];
  }

- (void)loadScanner
{
  if (!self->_isLoaded)
  {
    _UIAccessibilityBlockPostingOfNotification(UIAccessibilityScreenChangedNotification, a2);
    _UIAccessibilityBlockPostingOfNotification(UIAccessibilityLayoutChangedNotification, v3);
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    [v4 addObserver:self];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainDisplayManager]);
    [v6 addUserInterfaceClientEnabler:@"Scanner"];

    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 displayManagers]);
    [v7 displaysDidChange:v9];

    v10 = objc_alloc_init(&OBJC_CLASS___AXOutputManager);
    -[SCATScannerManager setOutputManager:](self, "setOutputManager:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    -[AXOutputManager setSpeechEnabled:]( v10,  "setSpeechEnabled:",  [v11 assistiveTouchScannerSpeechEnabled]);

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v59 = v10;
    -[AXOutputManager setSoundEffectsEnabled:]( v10,  "setSoundEffectsEnabled:",  [v12 assistiveTouchScannerSoundEnabled]);

    -[SCATScannerManager _updateAudioSessionState](self, "_updateAudioSessionState");
    v13 = -[SCATCursorManager initWithDisplaySource:]( objc_alloc(&OBJC_CLASS___SCATCursorManager),  "initWithDisplaySource:",  self);
    -[SCATScannerManager setCursorManager:](self, "setCursorManager:", v13);
    -[SCATCursorManager setDelegate:](v13, "setDelegate:", self);
    v14 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[SCATScannerManager setBeginScanningTimer:](self, "setBeginScanningTimer:", v14);
    v15 = objc_alloc(&OBJC_CLASS___SCATInputController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager interDeviceCommunicator](self, "interDeviceCommunicator"));
    v17 = -[SCATInputController initWithInterDeviceCommunicator:](v15, "initWithInterDeviceCommunicator:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATInputController setDelegate:queue:](v17, "setDelegate:queue:", self, v18);

    -[SCATScannerManager setInputController:](self, "setInputController:", v17);
    v19 = -[SCATMenu initWithDelegate:](objc_alloc(&OBJC_CLASS___SCATMenu), "initWithDelegate:", self);
    -[SCATScannerManager setMenu:](self, "setMenu:", v19);
    -[SCATMenu registerMenuObserver:](v19, "registerMenuObserver:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v20 switchControlAutoTapTimeout];
    double v22 = v21;

    v23 = -[SCATActionHandler initWithAction:timeoutDuration:]( objc_alloc(&OBJC_CLASS___SCATActionHandler),  "initWithAction:timeoutDuration:",  103LL,  v22);
    -[SCATActionHandler setUiDelegate:](v23, "setUiDelegate:", self);
    -[SCATScannerManager setSelectActionHandler:](self, "setSelectActionHandler:", v23);
    v24 = -[SCATActionHandler initWithAction:timeoutDuration:]( objc_alloc(&OBJC_CLASS___SCATActionHandler),  "initWithAction:timeoutDuration:",  109LL,  v22);
    -[SCATActionHandler setUiDelegate:](v24, "setUiDelegate:", self);
    v58 = v24;
    -[SCATScannerManager setSelectAndResumeAutoscanningActionHandler:]( self,  "setSelectAndResumeAutoscanningActionHandler:",  v24);
    v25 = -[SCATActionHandler initWithAction:timeoutDuration:]( objc_alloc(&OBJC_CLASS___SCATActionHandler),  "initWithAction:timeoutDuration:",  100LL,  0.0);
    -[SCATActionHandler setUiDelegate:](v25, "setUiDelegate:", self);
    v57 = v25;
    -[SCATScannerManager setActivateActionHandler:](self, "setActivateActionHandler:", v25);
    v56 = objc_alloc_init(&OBJC_CLASS___HNDScannerAutoscroller);
    -[SCATScannerManager setAutoscroller:](self, "setAutoscroller:");
    v26 = objc_alloc(&OBJC_CLASS___SCATGestureProvider);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    v28 = -[SCATGestureProvider initWithMenu:](v26, "initWithMenu:", v27);

    -[SCATGestureProvider setDelegate:](v28, "setDelegate:", self);
    v55 = v28;
    -[SCATScannerManager setGestureProvider:](self, "setGestureProvider:", v28);
    v29 = objc_alloc_init(&OBJC_CLASS___SCATAppleTVRemote);
    -[SCATScannerManager setAppleTVRemote:](self, "setAppleTVRemote:", v29);
    v54 = v29;
    -[SCATAppleTVRemote setDelegate:](v29, "setDelegate:", self);
    objc_initWeak(location, self);
    v30 = objc_alloc_init(&OBJC_CLASS___AXUpdateElementVisualsCoalescer);
    -[SCATScannerManager setUpdateElementVisualsCoalescer:](self, "setUpdateElementVisualsCoalescer:", v30);
    -[AXUpdateElementVisualsCoalescer setThreshold:](v30, "setThreshold:", 0.2);
    -[AXUpdateElementVisualsCoalescer setProgressInterval:](v30, "setProgressInterval:", 0.01);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472LL;
    v79[2] = sub_10009D1AC;
    v79[3] = &unk_100121EE8;
    objc_copyWeak(&v80, location);
    -[AXUpdateElementVisualsCoalescer setUpdateVisualsSequenceDidBeginHandler:]( v30,  "setUpdateVisualsSequenceDidBeginHandler:",  v79);
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_10009D1FC;
    v77[3] = &unk_100121EE8;
    objc_copyWeak(&v78, location);
    -[AXUpdateElementVisualsCoalescer setUpdateVisualsSequenceInProgressHandler:]( v30,  "setUpdateVisualsSequenceInProgressHandler:",  v77);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = sub_10009D228;
    v75[3] = &unk_100121EE8;
    objc_copyWeak(&v76, location);
    -[AXUpdateElementVisualsCoalescer setUpdateVisualsSequenceDidFinishHandler:]( v30,  "setUpdateVisualsSequenceDidFinishHandler:",  v75);
    -[SCATScannerManager _overrideScanningModeAtStartupIfNecessary](self, "_overrideScanningModeAtStartupIfNecessary");
    v60 = objc_alloc_init(&OBJC_CLASS___SCATElementNavigationController);
    -[SCATElementNavigationController setDelegate:](v60, "setDelegate:", self);
    -[SCATScannerManager setElementNavController:](self, "setElementNavController:", v60);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v31 setAssistiveTouchPreferredPointPicker:1];
    v52 = v19;
    v53 = v17;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[SCATPointPicker pointPickerWithMode:menu:]( &OBJC_CLASS___SCATPointPicker,  "pointPickerWithMode:menu:",  1LL,  v32));

    [v33 setDelegate:self];
    -[SCATScannerManager setPointPicker:](self, "setPointPicker:", v33);
    v51 = v14;
    v34 = objc_alloc_init(&OBJC_CLASS___SCATAlternateKeysManager);
    -[SCATAlternateKeysManager setDelegate:](v34, "setDelegate:", self);
    -[SCATScannerManager setAlternateKeysManager:](self, "setAlternateKeysManager:", v34);
    v35 = objc_alloc_init(&OBJC_CLASS___SCATCandidateBarManager);
    -[SCATCandidateBarManager setDelegate:](v35, "setDelegate:", self);
    -[SCATScannerManager setCandidateBarManager:](self, "setCandidateBarManager:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _elementManagerForScannerState](self, "_elementManagerForScannerState"));
    -[SCATScannerManager setActiveElementManager:](self, "setActiveElementManager:", v36);

    v37 = -[SCATAutomaticDriver initWithDelegate:]( objc_alloc(&OBJC_CLASS___SCATAutomaticDriver),  "initWithDelegate:",  self);
    -[SCATScannerManager setAutoScanningDriver:](self, "setAutoScanningDriver:", v37);

    v38 = -[SCATDriver initWithDelegate:](objc_alloc(&OBJC_CLASS___SCATManualDriver), "initWithDelegate:", self);
    -[SCATScannerManager setManualScanningDriver:](self, "setManualScanningDriver:", v38);

    v39 = -[SCATDriver initWithDelegate:](objc_alloc(&OBJC_CLASS___SCATDwellDriver), "initWithDelegate:", self);
    -[SCATScannerManager setDwellScanningDriver:](self, "setDwellScanningDriver:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _driverForScannerState](self, "_driverForScannerState"));
    -[SCATScannerManager setActiveScannerDriver:](self, "setActiveScannerDriver:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_10009D310;
    v73[3] = &unk_100121EE8;
    objc_copyWeak(&v74, location);
    [v41 registerUpdateBlock:v73 forRetrieveSelector:"switchControlAutoTapTimeout" withListener:self];

    objc_destroyWeak(&v74);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_10009D384;
    v71[3] = &unk_100121EE8;
    objc_copyWeak(&v72, location);
    [v42 registerUpdateBlock:v71 forRetrieveSelector:"assistiveTouchGroupElementsEnabled" withListener:self];

    objc_destroyWeak(&v72);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_10009D43C;
    v69[3] = &unk_100121EE8;
    objc_copyWeak(&v70, location);
    [v43 registerUpdateBlock:v69 forRetrieveSelector:"switchControlScanningStyle" withListener:self];

    objc_destroyWeak(&v70);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_10009D498;
    v67[3] = &unk_100121EE8;
    objc_copyWeak(&v68, location);
    [v44 registerUpdateBlock:v67 forRetrieveSelector:"assistiveTouchScanningMode" withListener:self];

    objc_destroyWeak(&v68);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_10009D4C4;
    v64[3] = &unk_100124AF8;
    v46 = v59;
    v65 = v46;
    objc_copyWeak(&v66, location);
    [v45 registerUpdateBlock:v64 forRetrieveSelector:"assistiveTouchScannerSpeechEnabled" withListener:self];

    objc_destroyWeak(&v66);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_10009D540;
    v61[3] = &unk_100124AF8;
    v48 = v46;
    v62 = v48;
    objc_copyWeak(&v63, location);
    [v47 registerUpdateBlock:v61 forRetrieveSelector:"assistiveTouchScannerSoundEnabled" withListener:self];

    objc_destroyWeak(&v63);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v49 registerUpdateBlock:&stru_100124B18 forRetrieveSelector:"switchControlTapBehavior" withListener:self];

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    [v50 manipulateDimTimer:1];

    -[SCATScannerManager _applyLaunchRecipeUUID](self, "_applyLaunchRecipeUUID");
    -[SCATScannerManager hideUIContext:](self, "hideUIContext:", 0LL);
    self->_isLoaded = 1;

    objc_destroyWeak(&v76);
    objc_destroyWeak(&v78);
    objc_destroyWeak(&v80);

    objc_destroyWeak(location);
  }

- (void)unloadScanner
{
  if (self->_isLoaded)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    [v3 removeObserver:self];

    _UIAccessibilityUnblockPostingOfAllNotifications(-[SCATScannerManager endScanning](self, "endScanning"));
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager inputController](self, "inputController"));
    [v4 setDelegate:0 queue:0];

    -[SCATScannerManager setInputController:](self, "setInputController:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v5 setDelegate:0];

    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v6 unregisterMenuObserver:self];

    -[SCATScannerManager setMenu:](self, "setMenu:", 0LL);
    -[SCATScannerManager setAutoscroller:](self, "setAutoscroller:", 0LL);
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
    [v7 setDelegate:0];

    -[SCATScannerManager setGestureProvider:](self, "setGestureProvider:", 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager appleTVRemote](self, "appleTVRemote"));
    [v8 setDelegate:0];

    -[SCATScannerManager setAppleTVRemote:](self, "setAppleTVRemote:", 0LL);
    -[SCATScannerManager setUpdateElementVisualsCoalescer:](self, "setUpdateElementVisualsCoalescer:", 0LL);
    -[SCATScannerManager setAutoScanningDriver:](self, "setAutoScanningDriver:", 0LL);
    -[SCATScannerManager setManualScanningDriver:](self, "setManualScanningDriver:", 0LL);
    -[SCATScannerManager setActiveScannerDriver:](self, "setActiveScannerDriver:", 0LL);
    -[SCATScannerManager setElementNavController:](self, "setElementNavController:", 0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
    [v9 setDelegate:0];

    -[SCATScannerManager setPointPicker:](self, "setPointPicker:", 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager alternateKeysManager](self, "alternateKeysManager"));
    [v10 setDelegate:0];

    -[SCATScannerManager setAlternateKeysManager:](self, "setAlternateKeysManager:", 0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager candidateBarManager](self, "candidateBarManager"));
    [v11 setDelegate:0];

    -[SCATScannerManager setCandidateBarManager:](self, "setCandidateBarManager:", 0LL);
    -[SCATScannerManager setScrollViewPickerManager:](self, "setScrollViewPickerManager:", 0LL);
    -[SCATScannerManager setActiveElementManager:](self, "setActiveElementManager:", 0LL);
    -[SCATScannerManager setBeginScanningTimer:](self, "setBeginScanningTimer:", 0LL);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
    [v12 setDelegate:0];

    -[SCATScannerManager setCursorManager:](self, "setCursorManager:", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
    [v13 setDelegate:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
    [v14 setUiDelegate:0];

    -[SCATScannerManager setSelectActionHandler:](self, "setSelectActionHandler:", 0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activateActionHandler](self, "activateActionHandler"));
    [v15 setDelegate:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activateActionHandler](self, "activateActionHandler"));
    [v16 setUiDelegate:0];

    -[SCATScannerManager setActivateActionHandler:](self, "setActivateActionHandler:", 0LL);
    -[SCATScannerManager setOutputManager:](self, "setOutputManager:", 0LL);
    -[SCATScannerManager setFocusContextForResume:](self, "setFocusContextForResume:", 0LL);
    -[SCATScannerManager setReasonsToDisableScanning:](self, "setReasonsToDisableScanning:", 0LL);
    -[SCATScannerManager _setCurrentRecipe:shouldShowAlert:](self, "_setCurrentRecipe:shouldShowAlert:", 0LL, 0LL);
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v17 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchGroupElementsEnabled" withListenerID:v25];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v18 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchPreferredPointPicker" withListenerID:v25];

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v19 unregisterUpdateBlockForRetrieveSelector:"switchControlScanningStyle" withListenerID:v25];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v20 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchStepInterval" withListenerID:v25];

    double v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v21 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchScanningMode" withListenerID:v25];

    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    [v22 manipulateDimTimer:0];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 mainDisplayManager]);
    [v24 removeUserInterfaceClientEnabler:@"Scanner"];

    self->_isLoaded = 0;
  }

- (NSString)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATScannerManager isActive](self, "isActive")));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATScannerManager isPaused](self, "isPaused")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SCATScannerManager<%p>. Active:%@ Paused:%@ ActiveDriver:%@. ActiveElementManager:%@.",  self,  v3,  v4,  v5,  v6));

  return (NSString *)v7;
}

- (void)_overrideScanningModeAtStartupIfNecessary
{
  if (!self->_isLoaded)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v2 = [v4 switchControlFirstLaunchScanningMode];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v3 setAssistiveTouchScanningMode:v2];
  }

- (void)_scanningModePreferenceDidChange
{
  id v21 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v21 assistiveTouchScanningMode];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v5 = [v4 switchControlFirstLaunchScanningMode];

  if (v5 != v3)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v6 setSwitchControlFirstLaunchScanningMode:v3];
  }

  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SCATScannerManager elementNavController](self, "elementNavController"));
  if (v7 == (void *)v8)
  {
  }

  else
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));

    if (v10 != v11) {
      goto LABEL_16;
    }
  }

  if (v3 == (id)1)
  {
    [v21 setAssistiveTouchPreferredPointPicker:1];
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[SCATPointPicker mostSuitablePointPickerWithMenu:]( &OBJC_CLASS___SCATPointPicker,  "mostSuitablePointPickerWithMenu:",  v12));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
      objc_opt_class(v14, v15);
      uint64_t v17 = v16;
      objc_opt_class(v13, v18);
      uint64_t v20 = v19;

      if (v17 != v20)
      {
        [v13 setDelegate:self];
        -[SCATScannerManager setPointPicker:](self, "setPointPicker:", v13);
      }
    }
  }

  else
  {
    v13 = 0LL;
  }

  if (-[SCATScannerManager isActive](self, "isActive")) {
    -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
  }
  else {
    -[SCATScannerManager _updateActiveElementManager](self, "_updateActiveElementManager");
  }

LABEL_16:
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (BOOL)isHandlingInterDeviceCommunication
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager interDeviceCommunicator](self, "interDeviceCommunicator"));
  char v3 = [v2 isIdle] ^ 1;

  return v3;
}

- (BOOL)isControllingOtherDevice
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager interDeviceCommunicator](self, "interDeviceCommunicator"));
  unsigned __int8 v3 = [v2 isForwardingSwitchEvents];

  return v3;
}

- (void)setActiveScannerDriver:(id)a3
{
  id v4 = (SCATDriver *)a3;
  activeScannerDriver = self->_activeScannerDriver;
  v10 = v4;
  if (activeScannerDriver != v4)
  {
    -[SCATDriver willFinishAsScannerDriver](activeScannerDriver, "willFinishAsScannerDriver");
    -[SCATDriver willBecomeScannerDriver](v10, "willBecomeScannerDriver");
    unsigned int v6 = self->_activeScannerDriver;
    dispatch_queue_t v7 = v10;
    uint64_t v8 = self->_activeScannerDriver;
    self->_activeScannerDriver = v7;
    v9 = v6;

    -[SCATDriver didFinishAsScannerDriver](v9, "didFinishAsScannerDriver");
    -[SCATDriver didBecomeScannerDriver](v7, "didBecomeScannerDriver");
  }
}

- (id)_driverForScannerState
{
  if (-[SCATScannerManager isAutoscanEnabled](self, "isAutoscanEnabled"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager autoScanningDriver](self, "autoScanningDriver"));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v5 = [v4 switchControlScanningStyle];

    if (v5 == (id)1) {
      unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager manualScanningDriver](self, "manualScanningDriver"));
    }
    else {
      unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager dwellScanningDriver](self, "dwellScanningDriver"));
    }
  }

  return v3;
}

- (void)setActiveElementManager:(id)a3
{
}

- (void)setActiveElementManager:(id)a3 completion:(id)a4
{
  dispatch_queue_t v7 = (SCATElementManager *)a3;
  uint64_t v8 = (void (**)(void))a4;
  activeElementManager = self->_activeElementManager;
  if (activeElementManager == v7) {
    goto LABEL_7;
  }
  -[SCATElementManager scannerWillMakeManagerInactive:activeElementManager:]( activeElementManager,  "scannerWillMakeManagerInactive:activeElementManager:",  self,  v7);
  -[SCATElementManager scannerWillMakeManagerActive:forDisplayID:]( v7,  "scannerWillMakeManagerActive:forDisplayID:",  self,  -[SCATScannerManager currentDisplayID](self, "currentDisplayID"));
  objc_storeStrong((id *)&self->_activeElementManager, a3);
  if (!-[SCATScannerManager isSpeechEnabled](self, "isSpeechEnabled")) {
    goto LABEL_7;
  }
  v10 = (SCATElementManager *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));

  if (v10 != v7) {
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
  objc_opt_class(&OBJC_CLASS___SCATXYAxisPointPicker, v12);
  char isKindOfClass = objc_opt_isKindOfClass(v11, v13);

  if ((isKindOfClass & 1) != 0
    && (id v15 = sub_10002B014(@"ENTERED_GLIDING_CURSOR_MODE"), (v16 = objc_claimAutoreleasedReturnValue(v15)) != 0))
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _driverForScannerState](self, "_driverForScannerState"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    [v18 outputManager:v19 willSpeakFocusContext:0];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    objc_initWeak(&location, v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10009E08C;
    v23[3] = &unk_100124B68;
    v23[4] = self;
    objc_copyWeak(&v25, &location);
    v24 = v8;
    [v21 outputScannerAnnouncement:v17 completionBlock:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

    int v22 = 0;
  }

  else
  {
LABEL_7:
    int v22 = 1;
  }

  if (v8 && v22) {
    v8[2](v8);
  }
}

- (id)_elementManagerForScannerState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager alternateKeysManager](self, "alternateKeysManager"));
  unsigned int v4 = [v3 canBeActiveElementManager];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager alternateKeysManager](self, "alternateKeysManager"));
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager candidateBarManager](self, "candidateBarManager"));
    unsigned int v7 = [v6 canBeActiveElementManager];

    if (v7)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager candidateBarManager](self, "candidateBarManager"));
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scrollViewPickerManager](self, "scrollViewPickerManager"));
      unsigned int v9 = [v8 canBeActiveElementManager];

      if (v9)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scrollViewPickerManager](self, "scrollViewPickerManager"));
      }

      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
        unsigned int v11 = [v10 canBeActiveElementManager];

        if (v11)
        {
          id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
        }

        else
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
          unsigned int v13 = [v12 canBeActiveElementManager];

          if (v13) {
            id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
          }
          else {
            id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager _primaryElementManagerForScannerState]( self,  "_primaryElementManagerForScannerState"));
          }
        }
      }
    }
  }

  return v5;
}

- (id)_primaryElementManagerForScannerState
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 assistiveTouchScannerPointPickerModeEnabled];

  int64_t v5 = -[SCATScannerManager scanningMode](self, "scanningMode");
  if (v4) {
    BOOL v6 = v5 == 1;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
  }

  else
  {
    if (v5 == 2)
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
      unsigned __int8 v8 = [v7 isTransitioning];

      if ((v8 & 1) == 0) {
        goto LABEL_20;
      }
      return 0LL;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager axManager](self, "axManager"));
    unsigned int v11 = [v10 hasZeroElements];

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager axManager](self, "axManager"));
      unsigned int v13 = [v12 frontmostAppMayBeLoading];

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
      unsigned __int8 v15 = [v14 ignoreLogging];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v18 = AXLoggerForFacility(v16, v17);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

        os_log_type_t v20 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = AXColorizeFormatLog(3LL, @"*** Zero elements found. Frontmost app may be loading %i");
          int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          uint64_t v29 = v13;
          uint64_t v23 = _AXStringForArgs(v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v19, v20))
          {
            *(_DWORD *)buf = 138543362;
            v31 = v24;
            _os_log_impl((void *)&_mh_execute_header, v19, v20, "%{public}@", buf, 0xCu);
          }
        }
      }

      if ((v13 & 1) != 0) {
        return 0LL;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
      [v26 updateWithFocusContext:0 animated:0 options:0];

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
      unsigned __int8 v28 = [v27 isTransitioning];

      unsigned int v9 = 0LL;
      if ((v28 & 1) == 0) {
LABEL_20:
      }
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager appleTVRemote](self, "appleTVRemote", v29));
    }

    else
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager elementNavController](self, "elementNavController"));
    }
  }

  return v9;
}

- (void)_updateActiveElementManager
{
}

- (void)_updateActiveElementManager:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _elementManagerForScannerState](self, "_elementManagerForScannerState"));
  -[SCATScannerManager setActiveElementManager:completion:](self, "setActiveElementManager:completion:", v5, v4);
}

- (BOOL)_isScannerControlledByDriver:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  unsigned __int8 v6 = [v5 isEqual:v4];

  return v6;
}

- (void)_deactivateAudioSession
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  [v3 setSoundAudioSessionActive:0];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  [v4 setSpeechAudioSessionActive:0];
}

- (void)_updateAudioSessionState
{
  if (-[SCATScannerManager isActive](self, "isActive"))
  {
    if (-[SCATScannerManager isSpeechEnabled](self, "isSpeechEnabled"))
    {
      unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
      [v3 setSpeechAudioSessionActive:1];
    }

    if (-[SCATScannerManager areSoundEffectsEnabled](self, "areSoundEffectsEnabled"))
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
      [v5 setSoundAudioSessionActive:1];
    }
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    [v4 cancelSpeech];

    -[SCATScannerManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_deactivateAudioSession",  0LL,  2.0);
  }

- (BOOL)isAutoscanEnabled
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentRecipe](self, "currentRecipe"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentRecipe](self, "currentRecipe"));
    unsigned __int8 v5 = [v4 shouldContinueScanning];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if (![v6 switchControlScanningStyle]) {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)isGroupingEnabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (int64_t)scanningMode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 assistiveTouchScanningMode];

  return (int64_t)v3;
}

- (BOOL)areSoundEffectsEnabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  unsigned __int8 v3 = [v2 areSoundEffectsEnabled];

  return v3;
}

- (BOOL)isSpeechEnabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  unsigned __int8 v3 = [v2 isSpeechEnabled];

  return v3;
}

- (BOOL)isSwitchWithSource:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager inputController](self, "inputController"));
  unsigned __int8 v6 = [v5 isSwitchWithSource:v4];

  return v6;
}

- (BOOL)isUsingPointMode
{
  id v2 = self;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager _primaryElementManagerForScannerState]( self,  "_primaryElementManagerForScannerState"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](v2, "pointPicker"));
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (unint64_t)immediateSelectActionCount
{
  return 2LL;
}

- (BOOL)isLandscape
{
  uint64_t v2 = -[SCATScannerManager currentDisplayID](self, "currentDisplayID");
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayManagerForDisplayId:v2]);

  if ([v4 isMainDisplay])
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainDisplayManager]);
    unsigned int v7 = [v6 orientation];

    BOOL v8 = v7 - 3 < 2;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isSystemSleeping
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
  unsigned __int8 v3 = [v2 isSystemSleeping];

  return v3;
}

- (SCATFocusContext)currentFocusContext
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 focusContext]);

  return (SCATFocusContext *)v3;
}

- (SCATElement)currentElement
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentFocusContext](self, "currentFocusContext"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 element]);

  return (SCATElement *)v3;
}

- (unsigned)currentDisplayID
{
  if (!-[SCATScannerManager lockedToDisplayID](self, "lockedToDisplayID")) {
    goto LABEL_6;
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayManagers]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10009EC5C;
  v16[3] = &unk_100124B90;
  v16[4] = self;
  v16[5] = &v17;
  [v4 enumerateObjectsUsingBlock:v16];

  int v5 = *((unsigned __int8 *)v18 + 24);
  if (*((_BYTE *)v18 + 24)) {
    LODWORD(v3) = self->_lockedToDisplayID;
  }
  else {
    -[SCATScannerManager setLockedToDisplayID:](self, "setLockedToDisplayID:", 0LL);
  }
  _Block_object_dispose(&v17, 8);
  if (!v5)
  {
LABEL_6:
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));

    if (v6 == v7)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      unsigned int v12 = [v11 currentDisplayID];
    }

    else
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 element]);
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 element]);
      }

      else
      {
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentElement](self, "currentElement"));
      }

      if (![v11 scatDisplayId])
      {
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mainDisplayManager]);
        LODWORD(v3) = [v14 displayID];

        goto LABEL_15;
      }

      unsigned int v12 = [v11 scatDisplayId];
    }

    LODWORD(v3) = v12;
LABEL_15:
  }

  return v3;
}

- (BOOL)isExternalDisplayConnected
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 displayManagers]);
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)switchCurrentDisplayContext
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  unsigned int v12 = -[SCATScannerManager lockedToDisplayID](self, "lockedToDisplayID");
  int v3 = *((_DWORD *)v10 + 6);
  if (!v3)
  {
    int v3 = 1;
    *((_DWORD *)v10 + 6) = 1;
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayManagers]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009EE48;
  v8[3] = &unk_100124BB8;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  if (v3 != *((_DWORD *)v10 + 6))
  {
    -[SCATScannerManager setLockedToDisplayID:](self, "setLockedToDisplayID:");
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager scatUIContextForDisplayID:]( self,  "scatUIContextForDisplayID:",  *((unsigned int *)v10 + 6)));
    [v6 presentWithDisplayContext:v7 animated:1];
  }

  _Block_object_dispose(&v9, 8);
}

- (id)axManager
{
  if (_AXSInUnitTestMode(self, a2)
    && (int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager testAxManager](self, "testAxManager")),
        v3,
        v3))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager testAxManager](self, "testAxManager"));
  }

  else
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  }

  return v4;
}

- (NSArray)recentSpeechOutputStrings
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 recentSpeechOutputStrings]);

  return (NSArray *)v3;
}

- (void)clearRecentSpeech
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  [v2 clearRecentSpeech];
}

- (BOOL)isActive
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (BOOL)isPaused
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  unsigned __int8 v3 = [v2 isPaused];

  return v3;
}

- (BOOL)isInactive
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  unsigned __int8 v3 = [v2 isInactive];

  return v3;
}

- (void)beginScanningWithFocusContext:(id)a3
{
}

- (void)continueScanningWithFocusContext:(id)a3 foundNewElements:(BOOL)a4
{
}

- (void)_beginOrContinueScanningWithFocusContext:(id)a3 shouldBegin:(BOOL)a4 foundNewElements:(BOOL)a5
{
  id v8 = a3;
  if (!-[SCATScannerManager _shouldIgnoreAllScannerControlMessages](self, "_shouldIgnoreAllScannerControlMessages"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    unsigned int v10 = [v9 isVisible];

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 element]);
      [v8 setMenuElement:v12];
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10009F12C;
    v14[3] = &unk_100122040;
    BOOL v16 = a5;
    v14[4] = self;
    BOOL v17 = a4;
    id v15 = v8;
    unsigned int v13 = objc_retainBlock(v14);
    -[SCATScannerManager _updateActiveElementManager:](self, "_updateActiveElementManager:", v13);
  }
}

- (void)resumeScanning
{
  if (!-[SCATScannerManager _shouldIgnoreAllScannerControlMessages](self, "_shouldIgnoreAllScannerControlMessages"))
  {
    if (-[SCATScannerManager didSetFocusContextForResume](self, "didSetFocusContextForResume"))
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager focusContextForResume](self, "focusContextForResume"));
      -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", v6);
LABEL_6:

      return;
    }

    -[SCATScannerManager _updateActiveElementManager](self, "_updateActiveElementManager");
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));

    if (v3)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
      [v6 resumeScanning];
      goto LABEL_6;
    }

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager beginScanningTimer](self, "beginScanningTimer"));
    [v4 cancel];

    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager beginScanningTimer](self, "beginScanningTimer"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009F3E8;
    v7[3] = &unk_100121D18;
    v7[4] = self;
    [v5 afterDelay:v7 processBlock:1.0];
  }

- (void)endScanning
{
  if (!-[SCATScannerManager _shouldIgnoreAllScannerControlMessages](self, "_shouldIgnoreAllScannerControlMessages"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager beginScanningTimer](self, "beginScanningTimer"));
    [v3 cancel];

    id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
    [v4 endScanning];
  }

- (void)pauseScanning
{
}

- (void)pauseScanningWithScreenLockDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[SCATScannerManager _shouldIgnoreAllScannerControlMessages](self, "_shouldIgnoreAllScannerControlMessages"))
  {
    -[SCATScannerManager setForceDisableScreenLock:](self, "setForceDisableScreenLock:", v3);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager beginScanningTimer](self, "beginScanningTimer"));
    [v5 cancel];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
    [v6 pauseScanning];

    -[SCATScannerManager setForceDisableScreenLock:](self, "setForceDisableScreenLock:", 0LL);
  }

- (void)addReasonToDisableScanning:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[SCATScannerManager setReasonsToDisableScanning:](self, "setReasonsToDisableScanning:", v6);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));
  unsigned __int8 v8 = [v7 containsObject:v4];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));
    id v10 = [v9 count];

    if (!v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
      id v12 = [v11 isActive];

      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCPauseResume sharedInstance]( &OBJC_CLASS___AXSubsystemSCPauseResume,  "sharedInstance"));
      unsigned __int8 v14 = [v13 ignoreLogging];

      if ((_DWORD)v12)
      {
        if ((v14 & 1) == 0)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
          uint64_t v17 = AXLoggerForFacility(v15, v16);
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);

          os_log_type_t v19 = AXOSLogLevelFromAXLogLevel(3LL);
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = AXColorizeFormatLog(3LL, @"Paused when reason to disable scanning came in.");
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            uint64_t v22 = _AXStringForArgs(v21);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v18, v19))
            {
              int v34 = 138543362;
              v35 = v23;
              _os_log_impl((void *)&_mh_execute_header, v18, v19, "%{public}@", (uint8_t *)&v34, 0xCu);
            }
          }
        }

        -[SCATScannerManager pauseScanning](self, "pauseScanning");
      }

      else if ((v14 & 1) == 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
        uint64_t v26 = AXLoggerForFacility(v24, v25);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

        os_log_type_t v28 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = AXColorizeFormatLog( 3LL,  @"Did not pause when reason to disable scanning came in, because we were not scanning.");
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          uint64_t v31 = _AXStringForArgs(v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v27, v28))
          {
            int v34 = 138543362;
            v35 = v32;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "%{public}@", (uint8_t *)&v34, 0xCu);
          }
        }
      }

      -[SCATScannerManager setDidPauseForReasonsToDisableScanning:]( self,  "setDidPauseForReasonsToDisableScanning:",  v12);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));
    [v33 addObject:v4];
  }
}

- (void)removeReasonToDisableScanning:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));
    [v7 removeObject:v4];

    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume sharedInstance](&OBJC_CLASS___AXSubsystemSCPauseResume, "sharedInstance"));
    unsigned __int8 v9 = [v8 ignoreLogging];

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCPauseResume identifier](&OBJC_CLASS___AXSubsystemSCPauseResume, "identifier"));
      uint64_t v12 = AXLoggerForFacility(v10, v11);
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

      os_log_type_t v14 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = AXColorizeFormatLog(3LL, @"Reasons to disable scanning count: %lu.  Did pause: %i");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));
        id v22 = [v17 count];
        uint64_t v23 = -[SCATScannerManager didPauseForReasonsToDisableScanning](self, "didPauseForReasonsToDisableScanning");
        uint64_t v18 = _AXStringForArgs(v16);
        os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (os_log_type_enabled(v13, v14))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v25 = v19;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}@", buf, 0xCu);
        }
      }
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning", v22, v23));
    if ([v20 count])
    {
    }

    else
    {
      unsigned int v21 = -[SCATScannerManager didPauseForReasonsToDisableScanning](self, "didPauseForReasonsToDisableScanning");

      if (v21) {
        -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
      }
    }
  }
}

- (BOOL)_shouldIgnoreAllScannerControlMessages
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager reasonsToDisableScanning](self, "reasonsToDisableScanning"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)useFocusContextOnResume:(id)a3
{
}

- (BOOL)activateElement:(id)a3
{
  id v4 = a3;
  if ([v4 isGroup])
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager elementNavController](self, "elementNavController"));
    [v5 handleDrillInOnGroup:v4 elementManager:v6];

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 focusContext]);
    unsigned __int8 v9 = 1;
    [v8 setShouldResumeFromMenuDismissal:1];
  }

  else
  {
    unsigned __int8 v9 = [v4 scatPerformAction:2010];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  [v10 playSound:1001];

  -[SCATScannerManager _updateActiveElementManager](self, "_updateActiveElementManager");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  [v11 scannerManager:self didActivateElement:v4];

  if ([v4 scatBeginScanningFromSelfAfterActivation])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v4,  v12,  0LL,  0LL));
    -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", v13);
  }

  if ((objc_opt_respondsToSelector(v4, "scatUpdateValue") & 1) != 0) {
    [v4 scatUpdateValue];
  }

  return v9;
}

- (void)selectElement:(id)a3
{
}

- (void)selectElementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture tapGestureAtPoint:]( &OBJC_CLASS___AXNamedReplayableGesture,  "tapGestureAtPoint:",  x,  y));
  [v6 replayGesture:v5];
}

- (BOOL)shouldBypassShowingMenuForElement:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v6 = [v5 switchControlTapBehavior];

  BOOL v8 = v6 == (id)2
  return v8;
}

- (void)_updateScanningStyle
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _driverForScannerState](self, "_driverForScannerState"));
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));

  id v4 = v5;
  if (v3 != v5)
  {
    -[SCATScannerManager setActiveScannerDriver:](self, "setActiveScannerDriver:", v5);
    -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
    id v4 = v5;
  }
}

- (void)_showSimpleBannerWithText:(id)a3
{
  id v3 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 mainDisplayManager]);
  id v5 = sub_10002B014(@"SWITCH_CONTROL_TITLE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 showSimpleBannerWithTitle:v6 text:v3];
}

- (void)_resetRecipeTimeoutIfApplicable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread"));

  if (v3 != v4) {
    *(void *)&double v5 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScannerManager.m",  1518LL,  "-[SCATScannerManager _resetRecipeTimeoutIfApplicable]",  @"Expected this only to be called from the main thread").n128_u64[0];
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_exitRecipeOnTimeout",  0LL,  v5);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentRecipe](self, "currentRecipe"));
  if (v6)
  {
    id v7 = (void *)v6;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentRecipe](self, "currentRecipe"));
    [v8 timeout];
    double v10 = v9;
    double v11 = AXSwitchRecipeTimeoutNone;

    if (v10 != v11)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentRecipe](self, "currentRecipe"));
      [v12 timeout];
      -[SCATScannerManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_exitRecipeOnTimeout",  0LL);
    }
  }

- (void)_exitRecipeOnTimeout
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentRecipe](self, "currentRecipe"));

  if (!v3) {
    *(void *)&double v4 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScannerManager.m",  1529LL,  "-[SCATScannerManager _exitRecipeOnTimeout]",  @"Should not have been able to get here if we weren't in the middle of a recipe.").n128_u64[0];
  }
  -[SCATScannerManager setCurrentRecipe:](self, "setCurrentRecipe:", 0LL, v4);
  -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
}

- (void)_applyLaunchRecipeUUID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 switchControlLaunchRecipeUUID]);

  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 switchControlRecipes]);

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid", (void)v16));
          os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 switchControlLaunchRecipeUUID]);
          unsigned int v15 = [v13 isEqual:v14];

          if (v15)
          {
            -[SCATScannerManager setCurrentRecipe:](self, "setCurrentRecipe:", v12);
            goto LABEL_12;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (void)_setCurrentRecipe:(id)a3 shouldShowAlert:(BOOL)a4
{
  v24 = (AXSwitchRecipe *)a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread"));

  if (v6 != v7) {
    *(void *)&double v8 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScannerManager.m",  1554LL,  "-[SCATScannerManager _setCurrentRecipe:shouldShowAlert:]",  @"Expected this only to be called from the main thread").n128_u64[0];
  }
  id v9 = v24;
  if (v24)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", v8));
    unsigned __int8 v11 = [v10 validateAndUpdateRecipeIfNeeded:v24];

    if ((v11 & 1) != 0)
    {
      id v9 = v24;
    }

    else
    {
      id v12 = sub_10002B014(@"RECIPE_VALIDATION_FAILED_FORMAT");
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AXSwitchRecipe name](v24, "name"));
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v14));
      -[SCATScannerManager _showSimpleBannerWithText:](self, "_showSimpleBannerWithText:", v15);

      id v9 = 0LL;
    }
  }

  if (self->_currentRecipe != v9)
  {
    uint64_t v25 = v9;
    objc_storeStrong((id *)&self->_currentRecipe, v9);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager inputController](self, "inputController"));
    [v16 setRecipe:v25];

    if (v25 && !-[AXSwitchRecipe shouldContinueScanning](v25, "shouldContinueScanning"))
    {
      -[SCATScannerManager addReasonToDisableScanning:](self, "addReasonToDisableScanning:", @"Recipe");
      -[SCATScannerManager _updateScanningStyle](self, "_updateScanningStyle");
      if (a4) {
        goto LABEL_14;
      }
    }

    else
    {
      -[SCATScannerManager removeReasonToDisableScanning:](self, "removeReasonToDisableScanning:", @"Recipe");
      -[SCATScannerManager _updateScanningStyle](self, "_updateScanningStyle");
      if (a4)
      {
        if (!v25)
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 mainDisplayManager]);
          id v19 = sub_10002B014(@"RECIPE_DEACTIVATED");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          [v18 showSimpleAlertWithText:v20];
LABEL_15:

          goto LABEL_16;
        }

- (void)setCurrentRecipe:(id)a3
{
}

- (void)_handleAppSwitcherAction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleAppSwitcher];
}

- (void)_handleHomeAction
{
  if ((sub_10002ADF4() & 1) == 0)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v2 activateHomeButton];
  }

- (void)_handleNotificationCenterAction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleNotificationCenter];
}

- (void)_handleControlCenterAction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  [v2 systemLongPressTVHomeButton];
}

- (void)_handleSiriAction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateSiri];
}

- (void)_handleVolumeDownAction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 decreaseVolume];
}

- (void)_handleForceTouchAction
{
  double y = CGPointZero.y;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  unsigned int v5 = [v4 isVisible];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
    [v6 startingScreenPointForGestures];
    double x = v7;
    double v10 = v9;

    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v11 hideWithCompletion:0];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 focusContext]);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v13 element]);

    if (v11)
    {
      [v11 scatScreenPointForOperations];
      double x = v14;
      double v10 = v15;
    }

    else
    {
      double x = CGPointZero.x;
      double v10 = y;
    }
  }

  if (x != CGPointZero.x || v10 != y)
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture forceTouchGestureAtPoint:]( &OBJC_CLASS___AXNamedReplayableGesture,  "forceTouchGestureAtPoint:",  x,  v10));
    [v18 replayGesture:v17];
  }

- (void)_handleDictationAction
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 keyboardApplication]);
  [v2 scatPerformAction:2049];
}

- (void)_handleTripleClickAction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateTripleClick];
}

- (void)_handleVolumeUpAction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 increaseVolume];
}

- (void)_handleEscapeAction
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  unsigned int v4 = [v3 isVisible];

  if (v4)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v8 hideWithCompletion:0];
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 elementsForMatchingBlock:&stru_100124BD8]);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    double v7 = v6;
    if (v6) {
      [v6 performAction:2013];
    }
  }
}

- (void)_handleCameraButton
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 pressCameraButton];
}

- (void)_handleCameraButtonLightPress
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 lightPressCameraButton];
}

- (void)_handleCameraButtonDoubleLightPress
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 doubleLightPressCameraButton];
}

- (void)_handleVisualIntelligence
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 openVisualIntelligence];
}

- (BOOL)canAdvertise
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 switchControlDeviceMenuItems]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = AXSSwitchControlMenuItemEnabledKey;
    uint64_t v9 = AXSSwitchControlMenuItemTypeKey;
    uint64_t v10 = AXSSwitchControlMenuItemDeviceInterDevice;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);
        unsigned int v14 = [v13 BOOLValue];

        double v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]);
        __int128 v16 = v15;
        if (v14) {
          v6 |= [v15 isEqualToString:v10];
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v5);
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (void)didConnectAsForwarderToDeviceWithName:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002B014(@"CONNECTED_TO_RECEIVER_FORMAT");
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));

  -[SCATScannerManager _showSimpleBannerWithText:](self, "_showSimpleBannerWithText:", v7);
  -[SCATScannerManager addReasonToDisableScanning:](self, "addReasonToDisableScanning:", @"ForwardingActions");
  if ((CPSetPowerAssertionWithIdentifier(1LL, @"com.apple.Accessibility.SwitchControl") & 1) == 0)
  {
    uint64_t v10 = AXSSLogForCategory(1LL, v8, v9);
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000AFD9C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

- (void)didConnectAsReceiverWithSettings:(id)a3
{
  id v3 = a3;
  if (!_AXSAssistiveTouchScannerEnabled(v3, v4))
  {
    _AXSAssistiveTouchScannerSetEnabled(1LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v5 setSwitchControlIsEnabledAsReceiver:1];
    if (([v5 assistiveTouchSwitchUsageConfirmed] & 1) == 0)
    {
      uint64_t v8 = AXSSLogForCategory(1LL, v6, v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Applying forwarder device settings %@",  (uint8_t *)&v12,  0xCu);
      }

      sub_10002C460(v3);
      [v5 setAssistiveTouchSwitchUsageConfirmed:1];
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v10 resetElementFetcher];

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  [v11 wakeDeviceFromSleepIfNecessary];
}

- (void)didDisconnectAsForwarderFromDeviceWithName:(id)a3
{
  id v4 = a3;
  if (_AXSAssistiveTouchScannerEnabled(v4, v5))
  {
    id v6 = sub_10002B014(@"DISCONNECTED_FROM_RECEIVER_FORMAT");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4));
    -[SCATScannerManager _showSimpleBannerWithText:](self, "_showSimpleBannerWithText:", v8);
  }

  -[SCATScannerManager removeReasonToDisableScanning:]( self,  "removeReasonToDisableScanning:",  @"ForwardingActions");
  if ((CPSetPowerAssertionWithIdentifier(0LL, @"com.apple.Accessibility.SwitchControl") & 1) == 0)
  {
    uint64_t v11 = AXSSLogForCategory(1LL, v9, v10);
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000AFDD0(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)didDisconnectAsReceiver
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v3 = [v2 switchControlIsEnabledAsReceiver];

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v4 setSwitchControlIsEnabledAsReceiver:0];

    _AXSAssistiveTouchScannerSetEnabled(0LL);
  }

- (void)didBecomeIdle
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager delegate](self, "delegate"));
  [v2 stopIfAllowed];
}

- (void)_disableUserInterfaceClientForPotentialReceiver
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 mainDisplayManager]);
  [v2 removeUserInterfaceClientEnabler:@"PotentialReceiver"];
}

- (void)highlightAsPotentialReceiverForDeviceWithName:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_disableUserInterfaceClientForPotentialReceiver",  0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainDisplayManager]);
  [v6 addUserInterfaceClientEnabler:@"PotentialReceiver"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  [v7 wakeDeviceFromSleepIfNecessary];

  id v8 = sub_10002B014(@"POTENTIAL_RECEIVER_MESSAGE_FORMAT");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v4));

  -[SCATScannerManager _showSimpleBannerWithText:](self, "_showSimpleBannerWithText:", v10);
  -[SCATScannerManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_disableUserInterfaceClientForPotentialReceiver",  0LL,  15.0);
}

- (void)_driver:(id)a3 outputAudioForContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = -[SCATScannerManager areSoundEffectsEnabled](self, "areSoundEffectsEnabled");
  if (v7 && v8 && ([v7 shouldSuppressAudioOutput] & 1) == 0)
  {
    unsigned int v9 = [v7 shouldPlayMenuSoundOnFocus];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    uint64_t v11 = v10;
    if (v9) {
      uint64_t v12 = 1002LL;
    }
    else {
      uint64_t v12 = 1000LL;
    }
    [v10 playSound:v12];
  }

  if (-[SCATScannerManager isSpeechEnabled](self, "isSpeechEnabled")
    && ([v7 shouldSuppressAudioOutput] & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 scatSpeakableDescription]);

    if ([v14 length])
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
      unsigned int v16 = [v15 scanningInterruptsSpeech];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
      uint64_t v18 = v17;
      if (v16)
      {
        [v17 outputScannerFocusContext:v7 completion:0];
      }

      else
      {
        [v6 outputManager:v17 willSpeakFocusContext:v7];

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
        objc_initWeak(&location, v19);

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1000A10E4;
        v21[3] = &unk_100124C28;
        id v22 = v6;
        objc_copyWeak(&v24, &location);
        id v23 = v7;
        [v20 outputScannerFocusContext:v23 completion:v21];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
}

- (void)driver:(id)a3 didFocusOnContext:(id)a4 oldContext:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  else {
    int v10 = 0;
  }
  uint64_t v11 = v10 | -[SCATScannerManager isGroupingEnabled](self, "isGroupingEnabled") ^ 1;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  unsigned int v13 = [v12 isVisible];

  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 element]);
    [v8 setMenuElement:v15];
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
  [v16 updateWithFocusContext:v8 animated:0 options:v11];

  if (-[SCATScannerManager isActive](self, "isActive")) {
    -[SCATScannerManager _driver:outputAudioForContext:](self, "_driver:outputAudioForContext:", v17, v8);
  }
  -[SCATScannerManager setFocusContextForResume:](self, "setFocusContextForResume:", 0LL);
  -[SCATScannerManager setDidSetFocusContextForResume:](self, "setDidSetFocusContextForResume:", 0LL);
  -[SCATScannerManager _notifyObserversScannerDidFocusOnContext:oldContext:]( self,  "_notifyObserversScannerDidFocusOnContext:oldContext:",  v8,  v9);
}

- (void)driver:(id)a3 willUnfocusFromContext:(id)a4
{
}

- (void)driverDidPause:(id)a3
{
  if (-[SCATScannerManager _isScannerControlledByDriver:](self, "_isScannerControlledByDriver:", a3))
  {
    -[SCATScannerManager hideUIContext:](self, "hideUIContext:", 1LL);
    -[SCATScannerManager _updateAudioSessionState](self, "_updateAudioSessionState");
  }

  -[SCATScannerManager _notifyObserversScannerDidPause](self, "_notifyObserversScannerDidPause");
}

- (void)driverDidBecomeInactive:(id)a3
{
  if (-[SCATScannerManager _isScannerControlledByDriver:](self, "_isScannerControlledByDriver:", a3))
  {
    -[SCATScannerManager hideUIContext:](self, "hideUIContext:", 1LL);
    -[SCATScannerManager _updateAudioSessionState](self, "_updateAudioSessionState");
  }

  -[SCATScannerManager _notifyObserversScannerDidBecomeInactive](self, "_notifyObserversScannerDidBecomeInactive");
}

- (void)driverDidBecomeActive:(id)a3 didChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (-[SCATScannerManager _isScannerControlledByDriver:](self, "_isScannerControlledByDriver:"))
  {
    -[SCATScannerManager showUIContext:](self, "showUIContext:", 1LL);
    -[SCATScannerManager _updateAudioSessionState](self, "_updateAudioSessionState");
    if (v4)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentFocusContext](self, "currentFocusContext"));
      -[SCATScannerManager _driver:outputAudioForContext:](self, "_driver:outputAudioForContext:", v7, v6);

      -[SCATScannerManager _notifyObserversScannerDidBecomeActive](self, "_notifyObserversScannerDidBecomeActive");
    }
  }
}

- (void)driver:(id)a3 indicateDwellScanningWillAbort:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (-[SCATScannerManager _isScannerControlledByDriver:](self, "_isScannerControlledByDriver:"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 focusContext]);
    if (v4) {
      uint64_t v8 = 8LL;
    }
    else {
      uint64_t v8 = 0LL;
    }
    [v6 updateWithFocusContext:v7 animated:0 options:v8];
  }
}

- (unint64_t)minimumPointPickerNumberOfCyclesForDriver:(id)a3
{
  return +[SCATXYAxisPointPicker minimumNumberOfCycles]( &OBJC_CLASS___SCATXYAxisPointPicker,  "minimumNumberOfCycles",  a3);
}

- (void)actionHandlerForUIDidCancelPendingAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
    [v7 cancelSelectTimeoutAnimationIfNeeded];

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager autoScanningDriver](self, "autoScanningDriver"));
    [v8 resumeAutoscanning:1];
  }

- (void)actionHandlerForUIWillFireAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
    [v7 cancelSelectTimeoutAnimationIfNeeded];

    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager autoScanningDriver](self, "autoScanningDriver"));
    [v8 resumeAutoscanning:1];
  }

- (void)actionHandlerForUI:(id)a3 willPerformDelayedActionOnContext:(id)a4 withCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
  unsigned int v9 = [v7 isEqual:v8];

  if (a5 == 1)
  {
    if (v9)
    {
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      [v10 hideIfNeeded:0];

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager autoScanningDriver](self, "autoScanningDriver"));
      [v11 pauseAutoscanning];

      id v13 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
      [v12 timeoutDuration];
      objc_msgSend(v13, "beginSelectTimeoutAnimation:");
    }
  }

- (BOOL)cursorManagerShouldHideMenuCursor:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu", a3));
  unsigned __int8 v4 = [v3 shouldHideMenuCursor];

  return v4;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  id v17 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 1LL:
      -[SCATScannerManager handleScreenChange:](self, "handleScreenChange:", v8);
      goto LABEL_14;
    case 2LL:
      -[SCATScannerManager handleAlertDidAppear:](self, "handleAlertDidAppear:", v8);
      goto LABEL_14;
    case 4LL:
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      [v9 appTransitionDidOccur:self];
      goto LABEL_8;
    case 5LL:
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      [v9 firstResponderDidChange:self];
      goto LABEL_8;
    case 6LL:
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
      [v10 orientationDidChange:self];

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      [v11 orientationDidChange:self];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));

      if (v12 == v13) {
        goto LABEL_14;
      }
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
      [v9 orientationDidChange:self];
LABEL_8:

LABEL_14:
      return;
    case 7LL:
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
      unsigned int v15 = [v14 areSoundEffectsEnabled];

      if (v15)
      {
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
        [v16 playSound:1006];
      }

      -[SCATScannerManager _setCurrentRecipe:shouldShowAlert:](self, "_setCurrentRecipe:shouldShowAlert:", 0LL, 0LL);
      -[SCATScannerManager endScanning](self, "endScanning");
      goto LABEL_14;
    case 10LL:
      -[SCATScannerManager handleAnnouncement:](self, "handleAnnouncement:", v8);
      goto LABEL_14;
    case 11LL:
      -[SCATScannerManager handleStopSpeaking:](self, "handleStopSpeaking:", v8);
      goto LABEL_14;
    default:
      goto LABEL_14;
  }

- (void)accessibilityManager:(id)a3 screenWillChange:(__CFData *)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager", a3, a4));
  [v5 screenWillChange:self];
}

- (int)_validatedSelectBehaviorForCurrentSelectBehavior:(int)a3 replacementElement:(id)a4
{
  int v4 = a3;
  return v4;
}

- (void)handleAnnouncement:(id)a3
{
  id v9 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  unsigned int v5 = [v4 isSpeechEnabled];

  if (v5)
  {
    objc_opt_class(&OBJC_CLASS___NSString, v6);
    if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0
      && ([v9 hasPrefix:@"AXAnnouncementType"] & 1) == 0
      && ([v9 isEqualToString:kAXAnnouncementCollaborationOccurredSound] & 1) == 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
      [v8 outputScannerAnnouncement:v9 completionBlock:0];
    }
  }
}

- (void)handleAlertDidAppear:(id)a3
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager", a3));
  [v4 alertDidAppear:self];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  unsigned int v6 = [v5 areSoundEffectsEnabled];

  if (v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    [v7 playSound:1003];
  }

- (void)handleScreenChange:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  unsigned int v6 = [v5 areSoundEffectsEnabled];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    [v7 playSound:1005];
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  [v8 screenDidChange:self data:v4];
}

- (void)handleStopSpeaking:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager", a3));
  unsigned int v5 = [v4 isSpeechEnabled];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    [v6 cancelSpeech];
  }

- (void)_updateMenuAfterElementFetchFoundNewElements:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SCATScannerManager isActive](self, "isActive")
    && (unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu")),
        v6,
        v5,
        v5 == v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentElement](self, "currentElement"));
  }

  else
  {
    id v7 = 0LL;
  }

  unsigned int v18 = 0;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 updateAfterFetchWithCurrentlyScannedElement:v7 options:&v18]);

  if (v9)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentFocusContext](self, "currentFocusContext"));
    uint64_t v11 = -[SCATScannerManager _validatedSelectBehaviorForCurrentSelectBehavior:replacementElement:]( self,  "_validatedSelectBehaviorForCurrentSelectBehavior:replacementElement:",  [v10 selectBehavior],  v9);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v9,  v12,  v11,  v18));
    -[SCATScannerManager continueScanningWithFocusContext:foundNewElements:]( self,  "continueScanningWithFocusContext:foundNewElements:",  v13,  v3);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentFocusContext](self, "currentFocusContext"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 element]);
  [v14 setMenuElement:v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
  [v17 updateWithFocusContext:v14 animated:0 options:0];
}

- (void)accessibilityManager:(id)a3 didFetchElementsForEvent:(int64_t)a4 foundNewElements:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (!_AXSInUnitTestMode(v7, v8)
    || (id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager testAxManager](self, "testAxManager")),
        v9,
        v9 == v7))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
    -[SCATScannerManager _updateActiveElementManager](self, "_updateActiveElementManager");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentFocusContext](self, "currentFocusContext"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
      [v12 didFetchElements:self foundNewElements:v5 currentFocusContext:v13 didChangeActiveElementManager:v10 != v14];
    }

    else
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager beginScanningTimer](self, "beginScanningTimer"));
      [v15 cancel];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager beginScanningTimer](self, "beginScanningTimer"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1000A1FF4;
      v28[3] = &unk_100121D18;
      v28[4] = self;
      [v12 afterDelay:v28 processBlock:1.0];
    }

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    unsigned int v17 = [v16 isVisible];

    if (v17)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 element]);

      if (([v20 scatUpdatesMenu] & 1) != 0
        || (unint64_t v21 = (unint64_t)[v20 scatTraits], (kAXCausesPageTurnTrait & ~v21) == 0)
        && (id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager axManager](self, "axManager")),
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 scannerElementMatchingElement:v20]),
            v23,
            v22,
            !v23))
      {
        -[SCATScannerManager _updateMenuAfterElementFetchFoundNewElements:]( self,  "_updateMenuAfterElementFetchFoundNewElements:",  v5);
      }
    }

    if (AXInPreboardScenario(v18))
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager axManager](self, "axManager"));
      unsigned int v25 = [v24 hasZeroElements];

      if (v25)
      {
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_1000A2000;
        v27[3] = &unk_100121D18;
        v27[4] = self;
        AXPerformBlockOnMainThreadAfterDelay(v27, v26, 1.0);
      }
    }
  }
}

- (void)accessibilityManager:(id)a3 nativeFocusElementDidChange:(id)a4
{
  id v14 = a4;
  [a3 refreshElements];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  unsigned int v7 = [v6 isWaitingToBePresented];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v8 presentWithElement:v14];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v9 setIsWaitingToBePresented:0];
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));

  if (v10 == v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v12 nativeFocusElementDidChange:v14];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
    [v13 tickleIdleTimer];
  }
}

- (void)accessibilityManager:(id)a3 updateElementVisuals:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager updateElementVisualsCoalescer](self, "updateElementVisualsCoalescer", a3, a4));
  [v4 notifyUpdateElementVisualsEventDidOccur];
}

- (void)accessibilityManager:(id)a3 applicationWasActivated:(id)a4
{
  id v6 = a4;
  [a3 refreshElements];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));

  if (v7 == v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    [v9 hideWithCompletion:0];

    -[SCATScannerManager endScanning](self, "endScanning");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000A2258;
    v12[3] = &unk_100122168;
    v12[4] = self;
    id v13 = v6;
    dispatch_async(v11, v12);
  }
}

- (void)_waitForApplication:(id)a3
{
  id v3 = a3;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = 0LL;
  while (1)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleId]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"bundleID"]);
    unsigned __int8 v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) != 0) {
      break;
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 systemApplication]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentApplications]);

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      unsigned int v25 = v4;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned int v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleId]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"bundleID"]);
          unsigned int v19 = [v17 isEqualToString:v18];

          if (v19)
          {
            id v4 = v16;

            goto LABEL_13;
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }

      id v4 = v25;
    }

- (void)_updateElementVisuals
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v13 focusContext]);
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 elementManager]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    if (v5 == v6) {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 menuElement]);
    }
    else {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 element]);
    }
    uint64_t v8 = (void *)v7;

    objc_opt_class(&OBJC_CLASS___AXElement, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      id v11 = v8;
      [v11 clearCachedFrame:1 cachedVisibleFrame:1];
      [v11 updateCache:2003];
      [v11 updateCache:2042];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
    [v12 updateWithFocusContext:v4 animated:0 options:0];
  }
}

- (void)accessibilityManagerShouldPauseScanning:(id)a3
{
}

- (void)accessibilityManagerShouldResumeScanning:(id)a3
{
}

- (void)didBeginLongPressForInputController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  unsigned int v5 = [v4 assistiveTouchLongPressPauseScanningEnabled];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager autoScanningDriver](self, "autoScanningDriver"));
    [v6 pauseAutoscanning];
  }

- (void)didEndLongPressForInputController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  unsigned int v5 = [v4 assistiveTouchLongPressPauseScanningEnabled];

  if (v5)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager autoScanningDriver](self, "autoScanningDriver"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
    objc_msgSend(v7, "resumeAutoscanning:", objc_msgSend(v6, "isPending") ^ 1);
  }

- (void)inputController:(id)a3 didReceiveAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SCATScannerManager setCurrentAction:](self, "setCurrentAction:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v8 notifyUserEventOccurred];

  if (!-[SCATScannerManager isSystemSleeping](self, "isSystemSleeping"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 delegate]);
    if ([v11 isEqual:self])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
      id v13 = [v12 actionCount];

      if (v13)
      {
        if ([v7 action] == (id)103)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
          unsigned int v15 = v14;
        }

        else
        {
          id v19 = [v7 action];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
          unsigned int v15 = v14;
          if (v19 != (id)109)
          {
            [v14 cancelPendingAction];
            goto LABEL_23;
          }
        }

        [v14 notifyDidReceiveAction:self];
LABEL_23:

        goto LABEL_24;
      }
    }

    else
    {
    }

    if (!-[SCATScannerManager isInactive](self, "isInactive"))
    {
      if (!-[SCATScannerManager isPaused](self, "isPaused"))
      {
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
        if ((objc_opt_respondsToSelector(v16, "handleInputAction:") & 1) != 0)
        {
          unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
          unsigned __int8 v18 = [v17 handleInputAction:v7];

          if ((v18 & 1) != 0) {
            goto LABEL_24;
          }
        }

        else
        {
        }

        double v20 = (void *)objc_claimAutoreleasedReturnValue([v7 shortcutIdentifier]);

        if (!v20)
        {
          id v21 = [v7 action];
          switch((unint64_t)v21)
          {
            case 0xC8uLL:
              -[SCATScannerManager _handleAppSwitcherAction](self, "_handleAppSwitcherAction");
              break;
            case 0xC9uLL:
              -[SCATScannerManager _handleHomeAction](self, "_handleHomeAction");
              break;
            case 0xCAuLL:
              -[SCATScannerManager _handleNotificationCenterAction](self, "_handleNotificationCenterAction");
              break;
            case 0xCBuLL:
              -[SCATScannerManager _handleSiriAction](self, "_handleSiriAction");
              break;
            case 0xCCuLL:
              -[SCATScannerManager _handleVolumeDownAction](self, "_handleVolumeDownAction");
              break;
            case 0xCDuLL:
              -[SCATScannerManager _handleVolumeUpAction](self, "_handleVolumeUpAction");
              break;
            case 0xCEuLL:
              -[SCATScannerManager _handleForceTouchAction](self, "_handleForceTouchAction");
              break;
            case 0xCFuLL:
              -[SCATScannerManager _handleDictationAction](self, "_handleDictationAction");
              break;
            case 0xD0uLL:
              -[SCATScannerManager _handleTripleClickAction](self, "_handleTripleClickAction");
              break;
            case 0xD1uLL:
              -[SCATScannerManager _handleControlCenterAction](self, "_handleControlCenterAction");
              break;
            case 0xD2uLL:
              -[SCATScannerManager _handleEscapeAction](self, "_handleEscapeAction");
              break;
            case 0xD3uLL:
              -[SCATScannerManager _handleCameraButton](self, "_handleCameraButton");
              break;
            case 0xD4uLL:
              -[SCATScannerManager _handleCameraButtonLightPress](self, "_handleCameraButtonLightPress");
              break;
            case 0xD5uLL:
              -[SCATScannerManager _handleCameraButtonDoubleLightPress](self, "_handleCameraButtonDoubleLightPress");
              break;
            default:
              switch((unint64_t)v21)
              {
                case 'd':
                case 'g':
                case 'm':
                  -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
                  goto LABEL_24;
                case 'e':
                  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
                  unsigned int v25 = [v24 switchControlHasEmptyTopLevelMenu];

                  if (v25)
                  {
                    v44[0] = _NSConcreteStackBlock;
                    v44[1] = 3221225472LL;
                    v44[2] = sub_1000A2F28;
                    v44[3] = &unk_100122168;
                    v44[4] = self;
                    id v45 = v6;
                    AXPerformBlockAsynchronouslyOnMainThread(v44);

                    goto LABEL_24;
                  }

                  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
                  unsigned int v39 = [v38 isVisible];

                  if (!v39)
                  {
                    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
                    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v40 focusContext]);

                    v41 = (void *)objc_claimAutoreleasedReturnValue([v15 element]);
                    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
                    if (v41)
                    {
                      v43 = (void *)objc_claimAutoreleasedReturnValue([v15 element]);
                      [v42 presentWithElement:v43];
                    }

                    else
                    {
                      v43 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
                      [v42 presentWithPointPicker:v43];
                    }

                    goto LABEL_23;
                  }

                  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
                  [v22 hideWithCompletion:&stru_100124C48];
LABEL_61:

                  break;
                case 'f':
                  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 focusContext]);

                  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager autoScanningDriver](self, "autoScanningDriver"));
                  -[SCATScannerManager setActiveScannerDriver:](self, "setActiveScannerDriver:", v28);

                  -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", v27);
                  goto LABEL_24;
                case 'h':
                  _AXLogWithFacility( 3LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Forcibly switched to manual scanning");
                  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
                  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v29 focusContext]);

                  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
                  __int128 v31 = v30;
                  v32 = v15;
                  uint64_t v33 = 0LL;
                  goto LABEL_36;
                case 'i':
                  _AXLogWithFacility( 3LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Forcibly switched to manual scanning");
                  int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
                  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v34 focusContext]);

                  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
                  __int128 v31 = v30;
                  v32 = v15;
                  uint64_t v33 = 1LL;
LABEL_36:
                  v35 = (void *)objc_claimAutoreleasedReturnValue([v30 nextFocusContextFromContext:v32 inDirection:v33 didWrap:0]);

                  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager manualScanningDriver](self, "manualScanningDriver"));
                  -[SCATScannerManager setActiveScannerDriver:](self, "setActiveScannerDriver:", v36);

                  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
                  [v37 beginScanningWithFocusContext:v35];

                  goto LABEL_23;
                case 'j':
                  -[SCATScannerManager endScanning](self, "endScanning");
                  goto LABEL_24;
                case 'k':
                  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
                  [v22 presentSiriShortcutsMenu];
                  goto LABEL_61;
                case 'l':
LABEL_30:
                  uint64_t v23 = SCATActionDescription([v7 action]);
                  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v23);
                  _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Unable to handle unknown action: %@ (%@). manager:%@");
                  goto LABEL_23;
                default:
                  switch((unint64_t)v21)
                  {
                    case 0x12CuLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVSelectButton];
                      goto LABEL_61;
                    case 0x12DuLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVMenuButton];
                      goto LABEL_61;
                    case 0x12EuLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVHomeButton];
                      goto LABEL_61;
                    case 0x12FuLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVPlayPauseButton];
                      goto LABEL_61;
                    case 0x130uLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVUpButton];
                      goto LABEL_61;
                    case 0x131uLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVDownButton];
                      goto LABEL_61;
                    case 0x132uLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVLeftButton];
                      goto LABEL_61;
                    case 0x133uLL:
                      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
                      [v22 systemPressTVRightButton];
                      goto LABEL_61;
                    default:
                      goto LABEL_30;
                  }
              }

              break;
          }
        }

        goto LABEL_24;
      }

      -[SCATScannerManager resumeScanning](self, "resumeScanning");
LABEL_24:
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
      [v9 userDidPerformSwitchAction];
      goto LABEL_25;
    }

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _driverForScannerState](self, "_driverForScannerState"));
    -[SCATScannerManager setActiveScannerDriver:](self, "setActiveScannerDriver:", v15);
    -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
    goto LABEL_23;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  [v9 wakeDeviceFromSleepIfNecessary];
LABEL_25:
}

- (void)inputController:(id)a3 didReceiveRecipeActionForMappingAtIndex:(unint64_t)a4 isLongPressAction:(BOOL)a5
{
  BOOL v5 = a5;
  id v28 = a3;
  -[SCATScannerManager _resetRecipeTimeoutIfApplicable](self, "_resetRecipeTimeoutIfApplicable");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v28 recipe]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mappings]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:a4]);

  if (v5) {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 longPressAction]);
  }
  else {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 action]);
  }
  id v13 = (void *)v11;
  if (!v11)
  {
    unint64_t v26 = a4;
    BOOL v27 = v5;
    *(void *)&double v12 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATScannerManager.m",  2641LL,  "-[SCATScannerManager inputController:didReceiveRecipeActionForMappingAtIndex:isLongPressAction:]",  @"Should not have been able to receive a recipe action for an invalid action. Mapping index %lu, is long press %i").n128_u64[0];
  }

  if (objc_msgSend(v13, "isEqualToString:", AXSwitchRecipeMappingActionSelect, v12, v26, v27))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SCATActionItem fromAction:](&OBJC_CLASS___SCATActionItem, "fromAction:", 103LL));
    -[SCATScannerManager inputController:didReceiveAction:](self, "inputController:didReceiveAction:", v28, v14);
LABEL_16:

    goto LABEL_17;
  }

  if (![v13 isEqualToString:AXSwitchRecipeMappingActionExit])
  {
    if ([v13 isEqualToString:AXSwitchRecipeMappingActionCenterTap])
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___AXCenterTapReplayableGesture);
    }

    else
    {
      unsigned __int8 v16 = [v13 isEqualToString:AXSwitchRecipeMappingActionRightToLeftSwipe];
      uint64_t v17 = AXSwitchRecipeMappingActionLeftToRightSwipe;
      if ((v16 & 1) != 0
        || [v13 isEqualToString:AXSwitchRecipeMappingActionLeftToRightSwipe])
      {
        id v15 = objc_msgSend( [AXPageTurningReplayableGesture alloc],  "initForLeftToRightSwipe:",  objc_msgSend(v13, "isEqualToString:", v17));
      }

      else
      {
        if ([v13 isEqualToString:AXSwitchRecipeMappingGameControlButtonPress])
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 gameControlButtonPress]);
          double v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 systemApplication]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 currentApplications]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uiElement]);
          unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v19 dictionaryRepresentation]);
          [v24 performAXAction:7000 withValue:v25];

          goto LABEL_17;
        }

        if (v5) {
          id v15 = (id)objc_claimAutoreleasedReturnValue([v10 longPressGesture]);
        }
        else {
          id v15 = (id)objc_claimAutoreleasedReturnValue([v10 gesture]);
        }
      }
    }

    uint64_t v14 = v15;
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
    [v18 replayGesture:v14];

    goto LABEL_16;
  }

  -[SCATScannerManager setCurrentRecipe:](self, "setCurrentRecipe:", 0LL);
  -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
LABEL_17:
}

- (void)inputController:(id)a3 didReceiveRecipeHoldAtPoint:(CGPoint)a4 isDown:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  -[SCATScannerManager _resetRecipeTimeoutIfApplicable](self, "_resetRecipeTimeoutIfApplicable", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
  objc_msgSend(v9, "performHoldAtPoint:isDown:", v5, x, y);
}

- (id)userInterfaceClientForInputController:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainDisplayManager]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInterfaceClient]);

  return v5;
}

- (void)performSysdiagnoseForInputController:(id)a3
{
  uint64_t v3 = AXSSLogForCategory(1LL, a2, a3);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Performing sysdiagnose.", v5, 2u);
  }

  +[Libsysdiagnose sysdiagnoseWithMetadata:onCompletion:]( &OBJC_CLASS___Libsysdiagnose,  "sysdiagnoseWithMetadata:onCompletion:",  &off_10012FD38,  &stru_100124C88);
}

- (void)inputController:(id)a3 didReceivePoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker", a3));
  objc_msgSend(v6, "moveToPoint:", x, y);
}

- (void)menu:(id)a3 showAlternateKeysForKey:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager alternateKeysManager](self, "alternateKeysManager"));
  [v6 showAlternateKeysForKey:v5];
}

- (void)menu:(id)a3 showTypingCandidates:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager candidateBarManager](self, "candidateBarManager"));
  [v6 setTypingCandidates:v5];
}

- (CGRect)menu:(id)a3 rectToClearForFingersWithGestureSheet:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider", a3));
  [v5 rectToClearForFingersWithGestureSheet:v4];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)gesturesSheetForMenu:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 gesturesSheet]);

  return v4;
}

- (void)didPressScreenChangingButtonInMenu:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager", a3));
  [v4 screenChangingButtonWasPressed:self];
}

- (id)exitActionElementForFingersInMenu:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementForFingers]);

  return v4;
}

- (void)menu:(id)a3 activateRecipe:(id)a4
{
}

- (BOOL)_isPostScanningMenu:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 screenPoint]);
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (BOOL)shouldAddItemSpecificMenuOptionsToMenu:(id)a3
{
  return -[SCATScannerManager _isPostScanningMenu:](self, "_isPostScanningMenu:", a3);
}

- (void)menu:(id)a3 setItemMenuState:(int64_t)a4
{
}

- (BOOL)shouldShowAppWideScrollActionsInMenu:(id)a3
{
  return -[SCATScannerManager _isPostScanningMenu:](self, "_isPostScanningMenu:", a3);
}

- (void)menu:(id)a3 showScrollViewPickerForScrollViews:(id)a4 elementsToScroll:(id)a5 scrollAction:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a4;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scrollViewPickerManager](self, "scrollViewPickerManager"));

  if (!v11)
  {
    double v12 = objc_alloc_init(&OBJC_CLASS___SCATScrollViewPickerManager);
    -[SCATScannerManager setScrollViewPickerManager:](self, "setScrollViewPickerManager:", v12);
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scrollViewPickerManager](self, "scrollViewPickerManager"));
  [v13 setScrollViews:v10];

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scrollViewPickerManager](self, "scrollViewPickerManager"));
  [v14 setElementsToScroll:v9];

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scrollViewPickerManager](self, "scrollViewPickerManager"));
  [v15 setScrollAction:v6];
}

- (BOOL)canSearchForControllableDevicesWithMenu:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager interDeviceCommunicator](self, "interDeviceCommunicator", a3));
  unsigned __int8 v4 = [v3 canSearch];

  return v4;
}

- (void)searchForControllableDevicesWithMenu:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager interDeviceCommunicator](self, "interDeviceCommunicator", a3));
  [v3 search];
}

- (BOOL)canReturnControlToForwarderDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager interDeviceCommunicator](self, "interDeviceCommunicator", a3));
  unsigned __int8 v4 = [v3 isReceivingSwitchEvents];

  return v4;
}

- (void)returnControlToForwarderDevice:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager interDeviceCommunicator](self, "interDeviceCommunicator", a3));
  [v3 stop];
}

- (void)menu:(id)a3 showSysdiagnoseDisplayString:(id)a4
{
}

- (void)menu:(id)a3 speakAnnouncement:(id)a4 completionBlock:(id)a5
{
  id v9 = a4;
  double v7 = (void (**)(id, void))a5;
  if (-[SCATScannerManager isSpeechEnabled](self, "isSpeechEnabled"))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    [v8 outputScannerAnnouncement:v9 completionBlock:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL);
  }
}

- (void)menu:(id)a3 playSoundEffect:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (-[SCATScannerManager areSoundEffectsEnabled](self, "areSoundEffectsEnabled", a3))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
    [v6 playSound:v4];
  }

- (void)menuDidDisappear:(id)a3
{
  id v15 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusContext]);

  -[SCATScannerManager _updateActiveElementManager](self, "_updateActiveElementManager");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v9 = [v8 switchControlScanAfterTapLocation];

  if (v9 && [v5 shouldResumeFromMenuDismissal] && v6 != v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 element]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v10,  v11,  0LL,  0LL));
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v15 element]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 nextFocusContextAfterDismissingMenuForElement:v11]);
  }

  double v13 = (void *)v12;

  -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", v13);
  if (-[SCATScannerManager itemMenuState](self, "itemMenuState"))
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v15 element]);

    if (v14)
    {
      if ((id)-[SCATScannerManager itemMenuState](self, "itemMenuState") == (id)1) {
        -[SCATScannerManager setItemMenuState:](self, "setItemMenuState:", 0LL);
      }
    }
  }
}

- (void)menuWillBeginTransition:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager", a3));
  [v3 hideCursor:1 animated:0];
}

- (void)menuDidFinishTransition:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
  [v4 hideCursor:0 animated:0];
}

- (void)shouldStartScanningGestureProvider:(id)a3
{
  if (-[SCATScannerManager isActive](self, "isActive", a3)) {
    -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
  }
}

- (void)shouldEndScanningGestureProvider:(id)a3
{
  if (-[SCATScannerManager isActive](self, "isActive", a3)) {
    -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
  }
}

- (id)contentViewForGestureProvider:(id)a3
{
  return -[SCATScannerManager scatUIContextForDisplayID:]( self,  "scatUIContextForDisplayID:",  -[SCATScannerManager currentDisplayID](self, "currentDisplayID", a3));
}

- (void)gestureProvider:(id)a3 shouldResetScanningFromElement:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));

  if (v7 == v9)
  {
    if (v6)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v6,  v9,  0LL,  0LL));
      -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", v8);
    }

    else
    {
      -[SCATScannerManager beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", 0LL);
    }
  }
}

- (void)didChooseCreateCustomGestureFromGestureProvider:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager", a3));
  [v4 openCreateCustomGestureForSCAT];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  [v5 hideWithCompletion:0];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  [v6 screenChangingButtonWasPressed:self];
}

- (void)pointPicker:(id)a3 didPickPoint:(CGPoint)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
  [v6 pickedPointInDeviceCoordinates];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _focusContextAtPoint:](self, "_focusContextAtPoint:"));

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
  unsigned int v9 = [v8 isVisible];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 element]);
    [v7 setMenuElement:v11];
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
  [v12 updateWithFocusContext:v7 animated:0 options:1];

  if (!v7)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v13 switchControlAutoTapTimeout];
    double v15 = v14;

    if (v15 != 0.0)
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 fingerController]);

      -[SCATScannerManager _startingPointForGesturesForPointPicker:]( self,  "_startingPointForGesturesForPointPicker:",  v5);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerModel fingerModelForLocation:]( &OBJC_CLASS___AXPIFingerModel,  "fingerModelForLocation:"));
      unsigned int v25 = v18;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      objc_msgSend(v17, "showFingerModels:animated:startPointForAnimation:", v19, 0, CGPointZero.x, CGPointZero.y);

      double v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v20 switchControlAutoTapTimeout];
      objc_msgSend(v17, "animateToTapWithDuration:");
    }
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager currentAction](self, "currentAction"));
  id v22 = [v21 action];

  if (v22 == (id)100) {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activateActionHandler](self, "activateActionHandler"));
  }
  else {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
  }
  id v24 = v23;
  [v23 notifyDidReceiveAction:self];
}

- (void)pointPicker:(id)a3 didSweepIntoFocusContext:(id)a4 isRefiningPoint:(BOOL)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
  [v7 updateWithFocusContext:v6 animated:1 options:3];

  if (v6)
  {
    if (-[SCATScannerManager areSoundEffectsEnabled](self, "areSoundEffectsEnabled"))
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
      [v8 playSound:1000];
    }
  }

- (void)pointPicker:(id)a3 didSweepOutOfFocusContext:(id)a4 isRefiningPoint:(BOOL)a5
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager", a3, a4, a5));
  [v5 updateWithFocusContext:0 animated:1 options:0];
}

- (BOOL)pointPicker:(id)a3 pauseForNumberOfCycles:(unint64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeScannerDriver](self, "activeScannerDriver", a3));
  LOBYTE(a4) = [v5 pauseScanningForPointPickerNumberOfCycles:a4];

  return a4;
}

- (void)pointPicker:(id)a3 didFinishDwellingOnPoint:(CGPoint)a4
{
  int64_t v5 = -[SCATScannerManager _dwellSwitchAssignedAction](self, "_dwellSwitchAssignedAction", a3, a4.x, a4.y);
  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[SCATActionItem fromAction:](&OBJC_CLASS___SCATActionItem, "fromAction:", v5));
    -[SCATScannerManager inputController:didReceiveAction:](self, "inputController:didReceiveAction:", 0LL, v6);
  }

- (int64_t)_dwellSwitchAssignedAction
{
  return 0LL;
}

- (id)_focusContextAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "elementAtPoint:displayID:",  -[SCATScannerManager currentDisplayID](self, "currentDisplayID"),  x,  y));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager elementNavController](self, "elementNavController"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v7,  v8,  0LL,  0LL));
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  return v9;
}

- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
  unsigned int v8 = [v6 isEqual:v7];

  return !v8 || -[SCATScannerManager immediateSelectActionCount](self, "immediateSelectActionCount") == a4;
}

- (void)actionHandlerDidFireAction:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
  [v5 pickedPointInDeviceCoordinates];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _focusContextAtPoint:](self, "_focusContextAtPoint:"));

  id v7 = [v4 actionCount];
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activateActionHandler](self, "activateActionHandler"));
  unsigned __int8 v9 = [v4 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager selectActionHandler](self, "selectActionHandler"));
    unsigned int v20 = [v4 isEqual:v19];

    if (!v20) {
      goto LABEL_18;
    }
    if (v7 != (id)1 || [v4 shouldShowMenuOnFirstSelectAction])
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
      [v21 presentWithPointPicker:v22];

      goto LABEL_18;
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
  [v10 resetRefinedSelectedPoint];

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 element]);
  if (!v11) {
    goto LABEL_15;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
  if (v13)
  {
    double v14 = (void *)v13;
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
    if (([v15 scatIsAXElement] & 1) == 0)
    {

      goto LABEL_15;
    }

    double v16 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uiElement]);
    unsigned int v18 = [v17 BOOLWithAXAttribute:2150];

    if (!v18) {
      goto LABEL_15;
    }
  }

  else
  {
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
  unsigned __int8 v24 = -[SCATScannerManager activateElement:](self, "activateElement:", v23);

  if ((v24 & 1) == 0)
  {
LABEL_15:
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
    -[SCATScannerManager _startingPointForGesturesForPointPicker:]( self,  "_startingPointForGesturesForPointPicker:",  v26);
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture tapGestureAtPoint:]( &OBJC_CLASS___AXNamedReplayableGesture,  "tapGestureAtPoint:"));
    [v25 replayGesture:v27];
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker"));
  unsigned int v29 = [v28 shouldRescanAfterTap];

  if (v29)
  {
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager cursorManager](self, "cursorManager"));
    [v30 updateWithFocusContext:0 animated:0 options:0];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000A4510;
    v32[3] = &unk_100121D18;
    v32[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v32, v31, 0.5);
  }

- (void)actionHandlerDidCancelPendingAction:(id)a3
{
}

- (id)focusContextForActionHandler:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager pointPicker](self, "pointPicker", a3));
  [v4 pickedPointInDeviceCoordinates];
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _focusContextAtPoint:](self, "_focusContextAtPoint:"));

  return v5;
}

- (void)alternateKeysManager:(id)a3 didSelectAlternateKey:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager outputManager](self, "outputManager"));
  [v6 playSound:1001];

  -[SCATScannerManager _updateActiveElementManager](self, "_updateActiveElementManager");
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager activeElementManager](self, "activeElementManager"));
  [v7 scannerManager:self didActivateElement:v5];
}

- (id)_typingCandidates
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstResponder]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementForAttribute:2017]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 typingCandidates]);

  return v5;
}

- (BOOL)candidateBarManager:(id)a3 hasValidTypingCandidates:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager _typingCandidates](self, "_typingCandidates"));
  unsigned __int8 v7 = [v6 isEqualToArray:v5];

  return v7;
}

- (void)presentPostScanningMenuForElementNavigationController:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager menu](self, "menu", a3));
  [v3 presentWithRootLevelSheet:0 useCurrentElementAndPoint:0];
}

- (id)scatUIContext
{
  uint64_t v2 = -[SCATScannerManager currentDisplayID](self, "currentDisplayID");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayManagerForDisplayId:v2]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scannerContentView]);

  return v5;
}

- (id)scatBackCursorUIContext
{
  uint64_t v2 = -[SCATScannerManager currentDisplayID](self, "currentDisplayID");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayManagerForDisplayId:v2]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scannerBackCursorView]);

  return v5;
}

- (id)scatFrontCursorUIContext
{
  uint64_t v2 = -[SCATScannerManager currentDisplayID](self, "currentDisplayID");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayManagerForDisplayId:v2]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scannerFrontCursorView]);

  return v5;
}

- (id)scatUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayManagerForDisplayId:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scannerContentView]);

  return v6;
}

- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayManagerForDisplayId:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scannerFrontCursorView]);

  return v6;
}

- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayManagerForDisplayId:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scannerBackCursorView]);

  return v6;
}

- (BOOL)isUIContextHidden
{
  uint64_t v3 = -[SCATScannerManager currentDisplayID](self, "currentDisplayID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scatUIContextForDisplayID:](self, "scatUIContextForDisplayID:", v3));
  if ([v4 isHidden])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager scatBackCursorUIContextForDisplayID:]( self,  "scatBackCursorUIContextForDisplayID:",  v3));
    if ([v5 isHidden])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager scatFrontCursorUIContextForDisplayID:]( self,  "scatFrontCursorUIContextForDisplayID:",  v3));
      unsigned __int8 v7 = [v6 isHidden];
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)hideUIContext:(BOOL)a3
{
  uint64_t v5 = -[SCATScannerManager currentDisplayID](self, "currentDisplayID");
  if (!-[SCATScannerManager isUIContextHidden](self, "isUIContextHidden"))
  {
    if (!a3)
    {
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 postNotificationName:off_100156CB8 object:self];

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scatUIContextForDisplayID:](self, "scatUIContextForDisplayID:", v5));
    [v7 setHidden:1];

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager scatBackCursorUIContextForDisplayID:]( self,  "scatBackCursorUIContextForDisplayID:",  v5));
    [v8 setHidden:1];

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager scatFrontCursorUIContextForDisplayID:]( self,  "scatFrontCursorUIContextForDisplayID:",  v5));
    [v9 setHidden:1];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
    [v10 setHidden:1];

    if (!a3) {
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }
    if (!-[SCATScannerManager forceDisableScreenLock](self, "forceDisableScreenLock"))
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
      [v11 manipulateDimTimer:0];
    }
  }

- (void)showUIContext:(BOOL)a3
{
  uint64_t v5 = -[SCATScannerManager currentDisplayID](self, "currentDisplayID");
  if (-[SCATScannerManager isUIContextHidden](self, "isUIContextHidden"))
  {
    if (!a3)
    {
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 postNotificationName:off_100156CC0 object:self];

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scatUIContextForDisplayID:](self, "scatUIContextForDisplayID:", v5));
    [v7 setHidden:0];

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager scatBackCursorUIContextForDisplayID:]( self,  "scatBackCursorUIContextForDisplayID:",  v5));
    [v8 setHidden:0];

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScannerManager scatFrontCursorUIContextForDisplayID:]( self,  "scatFrontCursorUIContextForDisplayID:",  v5));
    [v9 setHidden:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager gestureProvider](self, "gestureProvider"));
    [v10 setHidden:0];

    if (!a3) {
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
    }
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    [v11 manipulateDimTimer:1];
  }

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers"));
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers"));
  [v5 removeObject:v4];
}

- (void)_notifyObserversScannerWillFocusOnContext:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "scannerManager:willFocusOnContext:") & 1) != 0) {
          [v10 scannerManager:self willFocusOnContext:v4];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversScannerDidFocusOnContext:(id)a3 oldContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "scannerManager:didFocusOnContext:oldContext:") & 1) != 0) {
          [v13 scannerManager:self didFocusOnContext:v6 oldContext:v7];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }
}

- (void)_notifyObserversScannerWillUnfocusFromContext:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v10, "driver:willUnfocusFromContext:") & 1) != 0) {
          [v10 scannerManager:self willUnfocusFromContext:v4];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_notifyObserversScannerDidBecomeActive
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "scannerManagerDidBecomeActive:") & 1) != 0) {
          [v8 scannerManagerDidBecomeActive:self];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)_notifyObserversScannerDidBecomeInactive
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "scannerManagerDidBecomeInactive:") & 1) != 0) {
          [v8 scannerManagerDidBecomeInactive:self];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)_notifyObserversScannerDidPause
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScannerManager scannerObservers](self, "scannerObservers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v8, "scannerManagerDidPause:") & 1) != 0) {
          [v8 scannerManagerDidPause:self];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (CGPoint)_startingPointForGesturesForPointPicker:(id)a3
{
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (AXOutputManager)outputManager
{
  return self->_outputManager;
}

- (void)setOutputManager:(id)a3
{
}

- (SCATCursorManager)cursorManager
{
  return self->_cursorManager;
}

- (void)setCursorManager:(id)a3
{
}

- (AXDispatchTimer)beginScanningTimer
{
  return self->_beginScanningTimer;
}

- (void)setBeginScanningTimer:(id)a3
{
}

- (HNDScannerAutoscroller)autoscroller
{
  return self->_autoscroller;
}

- (void)setAutoscroller:(id)a3
{
}

- (SCATInputController)inputController
{
  return self->_inputController;
}

- (void)setInputController:(id)a3
{
}

- (SCATGestureProvider)gestureProvider
{
  return self->_gestureProvider;
}

- (void)setGestureProvider:(id)a3
{
}

- (SCATAppleTVRemote)appleTVRemote
{
  return self->_appleTVRemote;
}

- (void)setAppleTVRemote:(id)a3
{
}

- (SCATMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (SCATPointPicker)pointPicker
{
  return self->_pointPicker;
}

- (void)setPointPicker:(id)a3
{
}

- (SCATElementNavigationController)elementNavController
{
  return self->_elementNavController;
}

- (void)setElementNavController:(id)a3
{
}

- (SCATManualDriver)manualScanningDriver
{
  return self->_manualScanningDriver;
}

- (void)setManualScanningDriver:(id)a3
{
}

- (SCATAutomaticDriver)autoScanningDriver
{
  return self->_autoScanningDriver;
}

- (void)setAutoScanningDriver:(id)a3
{
}

- (SCATDriver)activeScannerDriver
{
  return self->_activeScannerDriver;
}

- (SCATElementManager)activeElementManager
{
  return self->_activeElementManager;
}

- (SCATScannerManagerDelegate)delegate
{
  return (SCATScannerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATActionHandler)selectActionHandler
{
  return self->_selectActionHandler;
}

- (void)setSelectActionHandler:(id)a3
{
}

- (SCATActionHandler)selectAndResumeAutoscanningActionHandler
{
  return self->_selectAndResumeAutoscanningActionHandler;
}

- (void)setSelectAndResumeAutoscanningActionHandler:(id)a3
{
}

- (BOOL)shouldUseCameraPointPicker
{
  return self->_shouldUseCameraPointPicker;
}

- (HNDAccessibilityManager)testAxManager
{
  return self->_testAxManager;
}

- (void)setTestAxManager:(id)a3
{
}

- (void)setRecentSpeechOutputStrings:(id)a3
{
}

- (SCATAlternateKeysManager)alternateKeysManager
{
  return self->_alternateKeysManager;
}

- (void)setAlternateKeysManager:(id)a3
{
}

- (SCATScrollViewPickerManager)scrollViewPickerManager
{
  return self->_scrollViewPickerManager;
}

- (void)setScrollViewPickerManager:(id)a3
{
}

- (SCATCandidateBarManager)candidateBarManager
{
  return self->_candidateBarManager;
}

- (void)setCandidateBarManager:(id)a3
{
}

- (SCATDwellDriver)dwellScanningDriver
{
  return self->_dwellScanningDriver;
}

- (void)setDwellScanningDriver:(id)a3
{
}

- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer
{
  return self->_updateElementVisualsCoalescer;
}

- (void)setUpdateElementVisualsCoalescer:(id)a3
{
}

- (SCATActionHandler)activateActionHandler
{
  return self->_activateActionHandler;
}

- (void)setActivateActionHandler:(id)a3
{
}

- (BOOL)forceDisableScreenLock
{
  return self->_forceDisableScreenLock;
}

- (void)setForceDisableScreenLock:(BOOL)a3
{
  self->_forceDisableScreenLock = a3;
}

- (SCATFocusContext)focusContextForResume
{
  return self->_focusContextForResume;
}

- (void)setFocusContextForResume:(id)a3
{
}

- (BOOL)didSetFocusContextForResume
{
  return self->_didSetFocusContextForResume;
}

- (void)setDidSetFocusContextForResume:(BOOL)a3
{
  self->_didSetFocusContextForResume = a3;
}

- (NSMutableSet)reasonsToDisableScanning
{
  return self->_reasonsToDisableScanning;
}

- (void)setReasonsToDisableScanning:(id)a3
{
}

- (BOOL)didPauseForReasonsToDisableScanning
{
  return self->_didPauseForReasonsToDisableScanning;
}

- (void)setDidPauseForReasonsToDisableScanning:(BOOL)a3
{
  self->_didPauseForReasonsToDisableScanning = a3;
}

- (AXSwitchRecipe)currentRecipe
{
  return self->_currentRecipe;
}

- (int64_t)itemMenuState
{
  return self->_itemMenuState;
}

- (void)setItemMenuState:(int64_t)a3
{
  self->_itemMenuState = a3;
}

- (SCATActionItem)currentAction
{
  return self->_currentAction;
}

- (void)setCurrentAction:(id)a3
{
}

- (AXSSInterDeviceCommunicator)interDeviceCommunicator
{
  return self->_interDeviceCommunicator;
}

- (void)setInterDeviceCommunicator:(id)a3
{
}

- (OS_dispatch_queue)managedConfigurationQueue
{
  return self->_managedConfigurationQueue;
}

- (void)setManagedConfigurationQueue:(id)a3
{
}

- (unsigned)lockedToDisplayID
{
  return self->_lockedToDisplayID;
}

- (void)setLockedToDisplayID:(unsigned int)a3
{
  self->_lockedToDisplayID = a3;
}

- (NSMutableSet)scannerObservers
{
  return self->_scannerObservers;
}

- (void)setScannerObservers:(id)a3
{
}

- (SCATElement)cachedPickerElement
{
  return self->_cachedPickerElement;
}

- (void)setCachedPickerElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end