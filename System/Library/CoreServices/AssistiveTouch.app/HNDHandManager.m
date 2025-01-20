@interface HNDHandManager
+ (CGPoint)_pointByAvoidingDisplayCornerRadius:(double)a3 forPoint:(CGPoint)a4;
+ (double)_displayCornerRadius;
+ (id)sharedManager;
- (AXElement)continuousScrollPickedElement;
- (AXElementFetcher)elementFetcher;
- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer;
- (BOOL)_elementFetchingRequired;
- (BOOL)_isChildElement:(id)a3 desendantOfElement:(id)a4;
- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4;
- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4 activationFactor:(double)a5;
- (BOOL)_isPoint:(CGPoint)a3 withinTolerance:(double)a4 ofStartPoint:(CGPoint)a5;
- (BOOL)_iterateRemoteViewsAndPerformContinuousScrollWithSpeed:(double)a3 direction:(unint64_t)a4;
- (BOOL)_performAXScrollActionAtPoint:(CGPoint)a3 onDisplay:(id)a4 action:(int)a5;
- (BOOL)_scrollAncestorIsSelfForScrollView:(id)a3 scrollAction:(int)a4 resultScrollAncestor:(id *)a5;
- (BOOL)_shouldEnableMultiTouchToolBackground;
- (BOOL)_shouldHandleRealEventWithMultiTouchTool;
- (BOOL)_shouldRepeatGesture;
- (BOOL)alwaysShowMenu;
- (BOOL)assistiveTouchMouseDwellControlEnabled;
- (BOOL)canShowASTMousePointer;
- (BOOL)dwellControlEnabled;
- (BOOL)inContinuousScrollMode;
- (BOOL)inCustomGesture;
- (BOOL)inDragMode;
- (BOOL)inPinchMode;
- (BOOL)inRockerMode;
- (BOOL)isActivelyScrollingContinuously;
- (BOOL)isCapturingRealEvents;
- (BOOL)isDwellActionPendingButtonUp;
- (BOOL)isFingersPressedDown;
- (BOOL)isPendingFingerLiftForPrimaryButtonPressUp;
- (BOOL)isPerformingDragPress;
- (BOOL)isPerformingGesture;
- (BOOL)isSystemSleeping:(id)a3;
- (BOOL)isVoiceControlRunning;
- (BOOL)nubbitMoving;
- (BOOL)nubbitVisible;
- (BOOL)openMenuWithSwaggle;
- (BOOL)scrollingBlockedOnElementRefresh;
- (BOOL)shouldUseEyeTrackingAutoHide;
- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5;
- (BOOL)usingSpecialTool;
- (BOOL)voiceControl;
- (CGPoint)_fingerControllerPointForScreenPoint:(CGPoint)a3 onDisplay:(id)a4;
- (CGPoint)currentPointForPointer;
- (CGPoint)preferredMenuDisplayPointOnDisplay:(id)a3;
- (CGPoint)rotateEventFromOrientation:(CGPoint)a3;
- (CGPoint)rotateNormalizedPointToOrientation:(CGPoint)result;
- (CGPoint)startPointForDrag;
- (CGRect)_paddedHitboxForNubbitOnDisplay:(id)a3 activationFactor:(double)a4;
- (HNDContinuousScroller)activeContinuousScroller;
- (HNDDeviceManager)deviceManager;
- (HNDDisplayManager)currentDisplayManager;
- (HNDDisplayManager)mainDisplayManager;
- (HNDEventManager)eventManager;
- (HNDHandManager)init;
- (NSArray)customGestures;
- (NSArray)horizontalContinuousScrollers;
- (NSArray)verticalContinuousScrollers;
- (NSDate)previousPrimaryButtonPressDownDate;
- (NSMutableArray)displayManagers;
- (NSNumber)currentContinuousScrollDirection;
- (NSPointerArray)eventHandlers;
- (OS_dispatch_queue)continuousScrollerGenerationQueue;
- (double)_defaultNubbitHitboxActivationFactor;
- (double)_scrollDeltaForGesture:(BOOL)a3 screenSize:(CGSize)a4;
- (double)continuousScrollCurrentSpeedFactor;
- (double)screenFrame:(uint64_t)a1;
- (double)touchSpeed;
- (double)touchSpeedMultiplier;
- (double)volumeLevel;
- (id)_avPlayerForSound:(id)a3;
- (id)_scrollFallbackGestureAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7;
- (id)_scrollViewForScrollAction:(int)a3 elementsToScroll:(id *)a4;
- (id)_shiftGestureIfNeeded:(id)a3 onDisplay:(id)a4 toMidpoint:(CGPoint)a5;
- (id)additionalAXNotificationsToObserve;
- (id)currentHardwareIdentifierForPointer;
- (id)displayManagerForDisplayId:(unsigned int)a3;
- (id)displayManagerForHardwareIdentifier:(id)a3;
- (id)fingerController;
- (id)mainWindow;
- (int)deviceOrientation;
- (os_unfair_lock_s)continuousScrollLock;
- (unint64_t)continuousScrollMode;
- (unint64_t)lastTimeElementFetcherRefreshed;
- (void)_attemptToShowVisualsAfterPerformingScreenshot;
- (void)_bootstrapRegister;
- (void)_handleAction:(id)a3 type:(int)a4 state:(int)a5;
- (void)_handleMultiTouchToolEvent:(id)a3;
- (void)_handlePinchFingerDownWithFinger:(id)a3 onDisplay:(id)a4;
- (void)_handleRealContinuousScrollToolUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealCustomGestureDown:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealCustomGestureMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealCustomGestureUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealDragToolMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealDragToolUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealMultiFingerDown:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealMultiFingerMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealMultiFingerUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealPinchToolDown:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealPinchToolMove:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleRealPinchToolUp:(CGPoint)a3 onDisplay:(id)a4;
- (void)_handleScreenshotDidFireCallbackTimeout;
- (void)_handleUsageConfirmation;
- (void)_liftFingersUpForPotentialTapViaPrimaryButton;
- (void)_menuOpenTracker:(CGPoint)a3;
- (void)_modifyPinchToolMoveToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)_moveFingersForRealEventToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)_moveFingersToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)_moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_performCustomGestureOnDisplay:(id)a3;
- (void)_reallyLiftFingersUpForPotentialTapViaPrimaryButton;
- (void)_registerForSettingsNotifications;
- (void)_resetMenuOpenTracker;
- (void)_setApplicationAccessibilityEnabledIfNeeded;
- (void)_startOrientationUpdateTimer;
- (void)_updateForElementFetchRequired;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)addEventHandler:(id)a3;
- (void)beginContinuousScrollingInDirection:(unint64_t)a3 onDisplay:(id)a4;
- (void)beginDragMenuAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)cancelCurrentGesture;
- (void)dealloc;
- (void)didFailToFloatApp;
- (void)didFailToPinApp;
- (void)endContinuousScrollingOnDisplay:(id)a3 withCompletion:(BOOL)a4;
- (void)endDragModeAtPoint:(CGPoint)a3 onDisplay:(id)a4 completed:(BOOL)a5;
- (void)enumerateDisplayManagersWithBlock:(id)a3;
- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5;
- (void)generateContinuousScrollersOnQueue:(id)a3 withCompletion:(id)a4;
- (void)generateContinuousScrollersWithCompletion:(id)a3;
- (void)handleButtonEvent:(id)a3;
- (void)handleCustomHomeButtonAction:(int)a3;
- (void)handleMultiTouchStandard:(int64_t)a3 onDisplay:(id)a4 withExistingFingerMidPoint:(CGPoint)a5;
- (void)handlePrimaryButtonPress:(int)a3;
- (void)handleRealEvent:(id)a3;
- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4;
- (void)mediaControlsChanged:(BOOL)a3;
- (void)mediaPlaybackChanged;
- (void)menuExitedOnDisplay:(id)a3;
- (void)moveFingerByDelta:(CGPoint)a3;
- (void)moveFingerToPoint:(CGPoint)a3;
- (void)moveFingerToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5;
- (void)notifyUserEventOccurred;
- (void)orientationChanged;
- (void)orientationChanged:(int64_t)a3;
- (void)performButtonAction:(id)a3 type:(int)a4 state:(int)a5;
- (void)performFingerDownAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)performFingerMoveToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)performFingerUpAtPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)performPreparedGestureOnDisplay:(id)a3;
- (void)prepareForContinuousScrollOnDisplay:(id)a3;
- (void)prepareGesture:(id)a3 onDisplay:(id)a4;
- (void)prepareScrollAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7;
- (void)processOrientedPointForContinuousScrolling:(CGPoint)a3 onDisplay:(id)a4;
- (void)refreshElementFetcherWithScrollingBlocked:(BOOL)a3;
- (void)refreshOrientation;
- (void)reloadFingerAppearance;
- (void)removeEventHandler:(id)a3;
- (void)removeFingersToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)resetFingersIfNeeded;
- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4;
- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4 active:(BOOL)a5;
- (void)resetNubbitLocation;
- (void)resetPinchFingersOnDisplay:(id)a3;
- (void)restartEverything;
- (void)ringerSwitchChanged;
- (void)rotateEventToOrientation:(id)a3;
- (void)rotationLockChanged;
- (void)sceneDidConnect:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)screenshotDidFire;
- (void)screenshotWillFire;
- (void)setActiveContinuousScroller:(id)a3;
- (void)setAlwaysShowMenu:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlEnabled:(BOOL)a3;
- (void)setCaptureEvents:(BOOL)a3;
- (void)setContinuousScrollCurrentSpeedFactor:(double)a3;
- (void)setContinuousScrollLock:(os_unfair_lock_s)a3;
- (void)setContinuousScrollMode:(unint64_t)a3;
- (void)setContinuousScrollPickedElement:(id)a3;
- (void)setContinuousScrollerGenerationQueue:(id)a3;
- (void)setCurrentContinuousScrollDirection:(id)a3;
- (void)setCustomGestures:(id)a3;
- (void)setDisplayManagers:(id)a3;
- (void)setElementFetcher:(id)a3;
- (void)setEventHandlers:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setHorizontalContinuousScrollers:(id)a3;
- (void)setIsActivelyScrollingContinuously:(BOOL)a3;
- (void)setIsDwellActionPendingButtonUp:(BOOL)a3;
- (void)setIsPendingFingerLiftForPrimaryButtonPressUp:(BOOL)a3;
- (void)setLastTimeElementFetcherRefreshed:(unint64_t)a3;
- (void)setNubbitMoving:(BOOL)a3;
- (void)setOpenMenuWithSwaggle:(BOOL)a3;
- (void)setPreviousPrimaryButtonPressDownDate:(id)a3;
- (void)setScrollingBlockedOnElementRefresh:(BOOL)a3;
- (void)setTouchSpeed:(double)a3;
- (void)setUpdateElementVisualsCoalescer:(id)a3;
- (void)setVerticalContinuousScrollers:(id)a3;
- (void)setVoiceControl:(BOOL)a3;
- (void)setupNonSceneUI:(BOOL)a3;
- (void)setupWindow:(id)a3 ignoredWindow:(id)a4;
- (void)showMenu:(BOOL)a3 onDisplay:(id)a4;
- (void)specialToolUsageEnded:(BOOL)a3;
- (void)startDragModeOnDisplay:(id)a3;
- (void)startPinchModeWithPoint:(CGPoint)a3 onDisplay:(id)a4 mode:(unint64_t)a5;
- (void)substantialTransitionOccurred;
- (void)systemServerConnected;
- (void)systemServerDied;
- (void)updateAllSettings;
- (void)updateMenuVisibility;
- (void)volumeChanged;
@end

@implementation HNDHandManager

+ (id)sharedManager
{
  if (qword_1001575D8 != -1) {
    dispatch_once(&qword_1001575D8, &stru_1001220D8);
  }
  return (id)qword_1001575D0;
}

- (HNDHandManager)init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___HNDHandManager;
  v2 = -[HNDHandManager init](&v27, "init");
  nullsub_5();
  v3 = objc_alloc_init(&OBJC_CLASS___HNDEventManager);
  eventManager = v2->_eventManager;
  v2->_eventManager = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___HNDDeviceManager);
  deviceManager = v2->_deviceManager;
  v2->_deviceManager = v5;

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  displayManagers = v2->_displayManagers;
  v2->_displayManagers = v7;

  -[HNDEventManager setDelegate:](v2->_eventManager, "setDelegate:", v2);
  -[HNDDeviceManager setHandManager:](v2->_deviceManager, "setHandManager:", v2);
  -[HNDHandManager _bootstrapRegister](v2, "_bootstrapRegister");
  v2->_dragStartPoint = (CGPoint)HNDPointNull;
  v2->_orientation = -[HNDHandManager deviceOrientation](v2, "deviceOrientation");
  objc_initWeak(&location, v2);
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_1000194DC;
  v24 = &unk_100121D18;
  v9 = v2;
  v25 = v9;
  AXPerformBlockOnMainThreadAfterDelay(&v21, v10, 0.5);
  objc_msgSend(v9, "_registerForSettingsNotifications", v21, v22, v23, v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v11 warm];

  BKSHIDServicesCancelTouchesOnMainDisplay();
  [v9 _handleUsageConfirmation];
  [v9 _setApplicationAccessibilityEnabledIfNeeded];
  v12 = objc_alloc(&OBJC_CLASS___AXElementFetcher);
  v13 = -[AXElementFetcher initWithDelegate:fetchEvents:enableEventManagement:enableGrouping:shouldIncludeNonScannerElements:beginEnabled:]( v12,  "initWithDelegate:fetchEvents:enableEventManagement:enableGrouping:shouldIncludeNonScannerElements:beginEnabled:",  v9,  AXFetchEventAllEvents,  0LL,  0LL,  0LL,  0LL);
  objc_storeStrong(v9 + 44, v13);
  id v14 = v9[44];
  v15 = &_dispatch_main_q;
  [v14 registerFetchObserver:v9 targetQueue:&_dispatch_main_q];

  +[AXUIElement applyElementAttributeCacheScheme:](&OBJC_CLASS___AXUIElement, "applyElementAttributeCacheScheme:", 3LL);
  id v16 = v9[34];
  v9[34] = &__NSArray0__struct;

  id v17 = v9[35];
  v9[35] = &__NSArray0__struct;

  id v18 =  +[SCATAssistiveTouchServerInstance serverInstance]( &OBJC_CLASS___SCATAssistiveTouchServerInstance,  "serverInstance");
  v19 = v9;

  objc_destroyWeak(&location);
  return v19;
}

- (void)_updateForElementFetchRequired
{
  if (-[HNDHandManager _elementFetchingRequired](self, "_elementFetchingRequired")) {
    -[HNDHandManager enableElementFetcherAndNotificationsIfNecessary]( self,  "enableElementFetcherAndNotificationsIfNecessary");
  }
  else {
    -[HNDHandManager disableElementFetcherIfNecessary](self, "disableElementFetcherIfNecessary");
  }
}

- (BOOL)_elementFetchingRequired
{
  return _AXSAssistiveTouchEnabled(self, a2) != 0;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager elementFetcher](self, "elementFetcher"));
  [v3 disableEventManagement];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager elementFetcher](self, "elementFetcher"));
  [v4 unregisterFetchObserver:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v5 removeObserver:self];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager additionalAXNotificationsToObserve](self, "additionalAXNotificationsToObserve"));
  [v6 stopObservingAXNotifications:v7];

  -[HNDHandManager setContinuousScrollerGenerationQueue:](self, "setContinuousScrollerGenerationQueue:", 0LL);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HNDHandManager;
  -[HNDHandManager dealloc](&v8, "dealloc");
}

- (void)_bootstrapRegister
{
  if (!task_get_special_port(mach_task_self_, 4, &special_port))
  {
    uint64_t v2 = bootstrap_check_in2(special_port, "com.apple.assistivetouchd", v12, 0LL);
    if ((_DWORD)v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = ASTLogCommon(v2);
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000AEC48(v3, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

- (void)setAlwaysShowMenu:(BOOL)a3
{
  if (self->_alwaysShowMenu != a3)
  {
    self->_alwaysShowMenu = a3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10001970C;
    v4[3] = &unk_1001220F8;
    BOOL v5 = a3;
    -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
    -[HNDHandManager refreshOrientation](self, "refreshOrientation");
  }

- (void)_handleUsageConfirmation
{
  if (_AXSAssistiveTouchScannerEnabled(self, a2))
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v2 setAssistiveTouchSwitchUsageConfirmed:1];
  }

- (void)_registerForSettingsNotifications
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100019A38;
  v22[3] = &unk_100122120;
  objc_copyWeak(&v24, &location);
  id v5 = v3;
  id v23 = v5;
  [v4 registerUpdateBlock:v22 forRetrieveSelector:"assistiveTouchOpenMenuSwaggleEnabled" withListener:self];

  objc_destroyWeak(&v24);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100019A80;
  v19[3] = &unk_100122120;
  objc_copyWeak(&v21, &location);
  id v7 = v5;
  id v20 = v7;
  [v6 registerUpdateBlock:v19 forRetrieveSelector:"assistiveTouchSpeed" withListener:self];

  objc_destroyWeak(&v21);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100019AD0;
  v16[3] = &unk_100122120;
  objc_copyWeak(&v18, &location);
  id v9 = v7;
  id v17 = v9;
  [v8 registerUpdateBlock:v16 forRetrieveSelector:"assistiveTouchCustomGestures" withListener:self];

  objc_destroyWeak(&v18);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100019B20;
  v14[3] = &unk_100121EE8;
  objc_copyWeak(&v15, &location);
  [v10 registerUpdateBlock:v14 forRetrieveSelector:"assistiveTouchAlwaysShowMenuEnabled" withListener:self];

  objc_destroyWeak(&v15);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100019B4C;
  v12[3] = &unk_100121EE8;
  objc_copyWeak(&v13, &location);
  [v11 registerUpdateBlock:v12 forRetrieveSelector:"assistiveTouchMainScreenCustomization" withListener:self];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (int)deviceOrientation
{
  return 1;
}

- (void)refreshOrientation
{
  uint64_t v3 = -[HNDHandManager deviceOrientation](self, "deviceOrientation");
  self->_int orientation = v3;
  uint64_t v4 = ASTLogCommon(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int orientation = self->_orientation;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = orientation;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "AST Windows: handManager orientation: %d",  (uint8_t *)&buf,  8u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager mainDisplayManager](self, "mainDisplayManager"));
  [v7 setOrientation:self->_orientation withCompletion:0];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager mainDisplayManager](self, "mainDisplayManager"));
  BOOL v9 = [v8 orientation] == 0;

  if (v9)
  {
    ++qword_1001575E0;
    uint64_t v11 = ASTLogCommon(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000AECAC();
    }

    objc_initWeak(&buf, self);
    else {
      double v13 = 60.0;
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100019D6C;
    v15[3] = &unk_100121EE8;
    objc_copyWeak(&v16, &buf);
    AXPerformBlockOnMainThreadAfterDelay(v15, v14, v13);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&buf);
  }

  else
  {
    qword_1001575E0 = 0LL;
  }

- (void)setupNonSceneUI:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[HNDApplication usesScenes](&OBJC_CLASS___HNDApplication, "usesScenes")) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___HNDDisplayManager);
    -[NSMutableArray addObject:](self->_displayManagers, "addObject:", v6);
    -[HNDDisplayManager setAlwaysShowMenu:]( v6,  "setAlwaysShowMenu:",  -[HNDHandManager alwaysShowMenu](self, "alwaysShowMenu"));
    -[HNDDisplayManager setHandManager:](v6, "setHandManager:", self);
    -[HNDDisplayManager setIsMainDisplay:](v6, "setIsMainDisplay:", 1LL);
    -[HNDDisplayManager setOrientation:withCompletion:]( v6,  "setOrientation:withCompletion:",  self->_orientation,  0LL);
    -[HNDDisplayManager initializeDisplay](v6, "initializeDisplay");
    -[HNDHandManager restartEverything](self, "restartEverything");
  }

- (void)systemServerConnected
{
}

- (void)restartEverything
{
  uint64_t v3 = ASTLogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AST Windows: Server connected callback", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100019F00;
  v5[3] = &unk_100121CB0;
  v5[4] = self;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v5);
}

- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager mainDisplayManager](self, "mainDisplayManager"));
  objc_msgSend(v9, "keyboardVisible:withFrame:", v8, x, y, width, height);
}

- (void)_moveFingersToPoint:(CGPoint)a3 onDisplay:(id)a4
{
}

- (void)_moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, uint64_t))a7;
  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001A1B0;
    v15[3] = &unk_100122190;
    void v15[4] = self;
    double v17 = x;
    double v18 = y;
    id v16 = v13;
    BOOL v19 = v9;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v15,  v14,  0.15);
  }

  else
  {
    -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:]( self,  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  v13,  v9,  x,  y);
    if (v14) {
      v14[2](v14, 1LL);
    }
  }
}

- (void)moveFingersToPointInFingerCoordinateSpace:(CGPoint)a3 onDisplay:(id)a4 allowOutOfBounds:(BOOL)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerController]);

  if ([v11 numberOfFingers])
  {
    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x3010000000LL;
    v33[3] = "";
    CGPoint v34 = CGPointZero;
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x3010000000LL;
    v31[3] = "";
    CGPoint v32 = v34;
    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x2020000000LL;
    char v30 = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10001A3EC;
    v18[3] = &unk_1001221B8;
    id v21 = v33;
    uint64_t v22 = v31;
    CGFloat v24 = x;
    CGFloat v25 = y;
    BOOL v26 = a5;
    id v13 = v11;
    id v19 = v13;
    id v23 = &v27;
    id v14 = v12;
    id v20 = v14;
    [v13 enumerateFingersUsingBlock:v18];
    if (*((_BYTE *)v28 + 24))
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10001A510;
      v15[3] = &unk_1001221E0;
      id v16 = v14;
      uint64_t v17 = 0LL;
      [v13 enumerateFingersUsingBlock:v15];
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
}

- (void)startDragModeOnDisplay:(id)a3
{
  id v4 = a3;
  if (!-[HNDHandManager inDragMode](self, "inDragMode"))
  {
    -[HNDHandManager showMenu:onDisplay:](self, "showMenu:onDisplay:", 0LL, v4);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v4));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
    if (![v6 numberOfFingers])
    {
      [v5 screenPoint];
      double v8 = v7;
      double v10 = v9;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerModel fingerModelForLocation:]( &OBJC_CLASS___AXPIFingerModel,  "fingerModelForLocation:"));
      id v13 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
      objc_msgSend(v6, "showFingerModels:animated:startPointForAnimation:", v12, 1, v8, v10);
    }

    [v5 setMultiTouchToolBackgroundEnabled:1];
    self->_inDragMode = 1;
  }
}

- (void)beginDragMenuAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  self->_isDragNubbitMode = 1;
  -[HNDHandManager beginDragAtPoint:onDisplay:](self, "beginDragAtPoint:onDisplay:", a4, a3.x, a3.y);
}

- (void)endDragModeAtPoint:(CGPoint)a3 onDisplay:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if (-[HNDHandManager inDragMode](self, "inDragMode") && !self->_isPerformingDragPressEvent)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10001A9B4;
    v34[3] = &unk_100122208;
    id v10 = (id)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v9));
    id v35 = v10;
    v36 = self;
    double v38 = x;
    double v39 = y;
    BOOL v40 = v5;
    id v11 = v9;
    id v37 = v11;
    v12 = objc_retainBlock(v34);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10001AA74;
    v32[3] = &unk_100122230;
    v32[4] = self;
    id v13 = v10;
    id v33 = v13;
    id v14 = objc_retainBlock(v32);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10001AA8C;
    v30[3] = &unk_100122168;
    v30[4] = self;
    id v15 = v13;
    id v31 = v15;
    id v16 = objc_retainBlock(v30);
    if (v5)
    {
      self->_isPerformingDragPressEvent = 1;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10001AAA8;
      v25[3] = &unk_100122258;
      double v28 = x + 0.001;
      double v29 = y + 0.001;
      uint64_t v27 = v14;
      v25[4] = self;
      id v26 = v11;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10001AAE0;
      v17[3] = &unk_1001222A8;
      id v21 = v16;
      double v23 = x;
      double v24 = y;
      id v18 = v15;
      id v19 = self;
      id v20 = v26;
      uint64_t v22 = v12;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v25,  v17,  0.15);
    }

    else
    {
      if (self->_dragStartPoint.x != -1.0 || self->_dragStartPoint.y != -1.0)
      {
        ((void (*)(void *))v14[2])(v14);
        ((void (*)(void *))v16[2])(v16);
        -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:]( self,  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  v11,  0LL,  self->_dragStartPoint.x,  self->_dragStartPoint.y);
        objc_msgSend(v15, "updateWithPrimaryFingerPoint:", self->_dragStartPoint.x, self->_dragStartPoint.y);
      }

      ((void (*)(void *))v12[2])(v12);
    }
  }
}

- (void)_handleRealDragToolUp:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v7));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 fingerController]);

  objc_msgSend(v10, "hndConvertPointToFingerContainerView:", x, y);
  else {
    -[HNDHandManager endDragModeAtPoint:onDisplay:completed:](self, "endDragModeAtPoint:onDisplay:completed:", v7, 1LL);
  }
}

- (void)_handleRealDragToolMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!*(_WORD *)&self->_isDragNubbitMode)
  {
    id v8 = v7;
    -[HNDHandManager _moveFingersForRealEventToPoint:onDisplay:]( self,  "_moveFingersForRealEventToPoint:onDisplay:",  v7,  x,  y);
    id v7 = v8;
  }
}

- (void)_handleRealContinuousScrollToolUp:(CGPoint)a3 onDisplay:(id)a4
{
  id v5 = a4;
  if (-[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode")) {
    -[HNDHandManager endContinuousScrollingOnDisplay:withCompletion:]( self,  "endContinuousScrollingOnDisplay:withCompletion:",  v5,  0LL);
  }
  else {
    -[HNDHandManager beginContinuousScrollingInDirection:onDisplay:]( self,  "beginContinuousScrollingInDirection:onDisplay:",  (id)-[HNDHandManager continuousScrollMode](self, "continuousScrollMode") == (id)1,  v5);
  }
}

- (BOOL)isSystemSleeping:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server", a3));
  unsigned __int8 v4 = [v3 isSystemSleeping];

  return v4;
}

- (void)fetcher:(id)a3 didFetchElementsForEvent:(unint64_t)a4 foundNewElements:(BOOL)a5
{
  if (-[HNDHandManager needsGenerateScrollers](self, "needsGenerateScrollers", a3, a4, a5)) {
    -[HNDHandManager generateContinuousScrollersWithCompletion:]( self,  "generateContinuousScrollersWithCompletion:",  0LL);
  }
}

- (id)additionalAXNotificationsToObserve
{
  if (qword_1001575F0 != -1) {
    dispatch_once(&qword_1001575F0, &stru_1001222C8);
  }
  return (id)qword_1001575E8;
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  if ((unint64_t)a4 <= 0x10 && ((1LL << a4) & 0x1F2EE) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager", a3));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 updateElementVisualsCoalescer]);
    [v5 notifyUpdateElementVisualsEventDidOccur];
  }

- (BOOL)_scrollAncestorIsSelfForScrollView:(id)a3 scrollAction:(int)a4 resultScrollAncestor:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXElement elementWithAXUIElement:]( AXElement,  "elementWithAXUIElement:",  [v7 scrollAncestorForScrollAction:v6]));
  id v9 = v8;
  if (a5) {
    *a5 = v8;
  }
  unsigned __int8 v10 = [v7 isEqual:v9];

  return v10;
}

- (void)generateContinuousScrollersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollerGenerationQueue](self, "continuousScrollerGenerationQueue"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollerGenerationQueue](self, "continuousScrollerGenerationQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001AFA8;
    v7[3] = &unk_100121FA8;
    id v8 = v4;
    -[HNDHandManager generateContinuousScrollersOnQueue:withCompletion:]( self,  "generateContinuousScrollersOnQueue:withCompletion:",  v6,  v7);
  }
}

- (void)generateContinuousScrollersOnQueue:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = (dispatch_queue_s *)a3;
  id v7 = a4;
  if (!-[HNDHandManager isActivelyScrollingContinuously](self, "isActivelyScrollingContinuously"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001B05C;
    v8[3] = &unk_100122318;
    v8[4] = self;
    id v9 = v7;
    dispatch_async(v6, v8);
  }
}

- (BOOL)shouldUseEyeTrackingAutoHide
{
  return 0;
}

- (BOOL)inContinuousScrollMode
{
  unint64_t v3 = -[HNDHandManager continuousScrollMode](self, "continuousScrollMode");
  if (v3 != 1) {
    LOBYTE(v3) = (id)-[HNDHandManager continuousScrollMode](self, "continuousScrollMode") == (id)2;
  }
  return v3;
}

- (void)refreshElementFetcherWithScrollingBlocked:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = mach_absolute_time();
  if ((double)(unint64_t)AXMachTimeToNanoseconds( v5 - -[HNDHandManager lastTimeElementFetcherRefreshed]( self,  "lastTimeElementFetcherRefreshed"))
     / 1000000000.0 > 0.1)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager elementFetcher](self, "elementFetcher"));
    [v6 refresh];

    -[HNDHandManager setLastTimeElementFetcherRefreshed:](self, "setLastTimeElementFetcherRefreshed:", v5);
    if (v3)
    {
      os_unfair_lock_lock(&self->_continuousScrollLock);
      -[HNDHandManager setScrollingBlockedOnElementRefresh:](self, "setScrollingBlockedOnElementRefresh:", 1LL);
      os_unfair_lock_unlock(&self->_continuousScrollLock);
    }
  }

- (void)prepareForContinuousScrollOnDisplay:(id)a3
{
  id v4 = a3;
  -[HNDHandManager showMenu:onDisplay:](self, "showMenu:onDisplay:", 0LL, v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v4));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
  id v7 = [v6 numberOfFingers];

  if (!v7)
  {
    [v5 screenPoint];
    double v9 = v8;
    double v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerModel fingerModelForLocation:]( &OBJC_CLASS___AXPIFingerModel,  "fingerModelForLocation:",  v9,  v11));
    id v15 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    objc_msgSend(v12, "showFingerModels:animated:startPointForAnimation:", v14, 1, v9, v11);
  }

  [v5 setMultiTouchToolBackgroundEnabled:1];
  -[HNDHandManager setIsActivelyScrollingContinuously:](self, "setIsActivelyScrollingContinuously:", 0LL);
  os_unfair_lock_lock(&self->_continuousScrollLock);
  -[HNDHandManager setScrollingBlockedOnElementRefresh:](self, "setScrollingBlockedOnElementRefresh:", 0LL);
  os_unfair_lock_unlock(&self->_continuousScrollLock);
  -[HNDHandManager enableElementFetcherAndNotificationsIfNecessary]( self,  "enableElementFetcherAndNotificationsIfNecessary");
}

- (void)beginContinuousScrollingInDirection:(unint64_t)a3 onDisplay:(id)a4
{
  id v6 = a4;
  if (!-[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode"))
  {
    if (a3 != 1)
    {
      if (a3)
      {
        -[HNDHandManager setContinuousScrollMode:](self, "setContinuousScrollMode:", 0LL);
        goto LABEL_7;
      }

      a3 = 2LL;
    }

    -[HNDHandManager setContinuousScrollMode:](self, "setContinuousScrollMode:", a3);
    -[HNDHandManager prepareForContinuousScrollOnDisplay:](self, "prepareForContinuousScrollOnDisplay:", v6);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001BB1C;
    v7[3] = &unk_100122340;
    void v7[4] = self;
    id v8 = v6;
    -[HNDHandManager generateContinuousScrollersWithCompletion:](self, "generateContinuousScrollersWithCompletion:", v7);
  }

- (void)processOrientedPointForContinuousScrolling:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  os_unfair_lock_lock(&self->_continuousScrollLock);
  if ((id)-[HNDHandManager continuousScrollMode](self, "continuousScrollMode") == (id)1) {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager horizontalContinuousScrollers](self, "horizontalContinuousScrollers"));
  }
  else {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager verticalContinuousScrollers](self, "verticalContinuousScrollers"));
  }
  double v10 = v9;
  id v11 = [v9 copy];

  v65 = self;
  unsigned __int8 v12 = -[HNDHandManager scrollingBlockedOnElementRefresh](self, "scrollingBlockedOnElementRefresh");
  os_unfair_lock_unlock(&self->_continuousScrollLock);
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v71;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v71 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
      }

      id v15 = [v13 countByEnumeratingWithState:&v70 objects:v81 count:16];
    }

    while (v15);
  }

  id v19 = [v8 count];
  if (v19) {
    unsigned __int8 v20 = v12;
  }
  else {
    unsigned __int8 v20 = 0;
  }
  if ((v20 & 1) == 0)
  {
    if (v19)
    {
      id v63 = v7;
      -[HNDHandManager setIsActivelyScrollingContinuously:](v65, "setIsActivelyScrollingContinuously:", 1LL);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
      [v8 removeObject:v21];
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      v64 = v8;
      id v22 = v8;
      id v23 = [v22 countByEnumeratingWithState:&v66 objects:v80 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v67;
        do
        {
          for (j = 0LL; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v67 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)j);
            double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 scrollView]);
            double v29 = (void *)objc_claimAutoreleasedReturnValue([v21 scrollView]);
            unsigned int v30 = -[HNDHandManager _isChildElement:desendantOfElement:]( v65,  "_isChildElement:desendantOfElement:",  v28,  v29);

            if (v30)
            {
              id v31 = v27;

              id v21 = v31;
            }
          }

          id v24 = [v22 countByEnumeratingWithState:&v66 objects:v80 count:16];
        }

        while (v24);
      }

      uint64_t v32 = AXLogCommon();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        CGPoint v34 = (void *)objc_claimAutoreleasedReturnValue([v21 targetElement]);
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 label]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v21 targetElement]);
        [v36 frame];
        id v37 = NSStringFromCGRect(v82);
        double v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        double v39 = (void *)objc_claimAutoreleasedReturnValue([v21 scrollDirectionToActivationFrame]);
        *(_DWORD *)id buf = 138412802;
        v75 = v35;
        __int16 v76 = 2112;
        v77 = v38;
        __int16 v78 = 2112;
        v79 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Attempting to scroll targetElement with label: %@, element frames: %@, activation frames: %@",  buf,  0x20u);
      }

      BOOL v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "directionForOrientedPoint:", x, y));
      uint64_t v41 = (int)[v40 intValue];
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "scrollingSpeedFactorForOrientedPoint:", x, y));
      [v42 floatValue];
      double v44 = v43;

      -[HNDHandManager continuousScrollCurrentSpeedFactor](v65, "continuousScrollCurrentSpeedFactor");
      double v46 = v45;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentContinuousScrollDirection](v65, "currentContinuousScrollDirection"));
      id v7 = v63;
      if (v47)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentContinuousScrollDirection](v65, "currentContinuousScrollDirection"));
        BOOL v49 = [v48 intValue] != v41;
      }

      else
      {
        BOOL v49 = 1;
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager activeContinuousScroller](v65, "activeContinuousScroller"));
      unsigned int v55 = [v21 isEqual:v54];

      int v56 = v55 ^ 1 | v49;
      if ((v56 & 1) != 0 || vabdd_f64(v46, v44) < 0.1)
      {
        id v8 = v64;
        if (!v56)
        {
LABEL_44:

          goto LABEL_45;
        }

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollPickedElement](v65, "continuousScrollPickedElement"));
        unsigned int v59 = [v58 isAutoscrolling];

        if (v59)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollPickedElement](v65, "continuousScrollPickedElement"));
          [v60 pauseAutoscrolling];
        }

        -[HNDHandManager setContinuousScrollCurrentSpeedFactor:](v65, "setContinuousScrollCurrentSpeedFactor:", v44);
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v41));
        -[HNDHandManager setCurrentContinuousScrollDirection:](v65, "setCurrentContinuousScrollDirection:", v61);

        v62 = (void *)objc_claimAutoreleasedReturnValue([v21 targetElement]);
        -[HNDHandManager setContinuousScrollPickedElement:](v65, "setContinuousScrollPickedElement:", v62);

        -[HNDHandManager setActiveContinuousScroller:](v65, "setActiveContinuousScroller:", v21);
        -[HNDHandManager _iterateRemoteViewsAndPerformContinuousScrollWithSpeed:direction:]( v65,  "_iterateRemoteViewsAndPerformContinuousScrollWithSpeed:direction:",  v41,  v44 * 1000.0);
      }

      else
      {
        -[HNDHandManager setContinuousScrollCurrentSpeedFactor:](v65, "setContinuousScrollCurrentSpeedFactor:", v44);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollPickedElement](v65, "continuousScrollPickedElement"));
        [v57 setAutoscrollSpeed:v44 * 1000.0];
      }

      id v8 = v64;
      goto LABEL_44;
    }

    unsigned int v50 = -[HNDHandManager isActivelyScrollingContinuously](v65, "isActivelyScrollingContinuously");
    -[HNDHandManager setCurrentContinuousScrollDirection:](v65, "setCurrentContinuousScrollDirection:", 0LL);
    -[HNDHandManager setIsActivelyScrollingContinuously:](v65, "setIsActivelyScrollingContinuously:", 0LL);
    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollPickedElement](v65, "continuousScrollPickedElement"));
      unsigned int v52 = [v51 isAutoscrolling];

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollPickedElement](v65, "continuousScrollPickedElement"));
        [v53 pauseAutoscrolling];
      }

      -[HNDHandManager generateContinuousScrollersWithCompletion:]( v65,  "generateContinuousScrollersWithCompletion:",  0LL);
    }
  }

- (BOOL)_iterateRemoteViewsAndPerformContinuousScrollWithSpeed:(double)a3 direction:(unint64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager continuousScrollPickedElement](self, "continuousScrollPickedElement"));
  [v7 setAutoscrollSpeed:a3];
  [v7 setAutoscrollTarget:v7];
  if ([v7 autoscrollInDirection:a4])
  {
    BOOL v8 = 1;
  }

  else
  {
    while (1)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
      unsigned int v10 = [v9 BOOLWithAXAttribute:2093];

      if (!v10) {
        break;
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 uiElement]);
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectWithAXAttribute:2310]);

      uint64_t v14 = objc_opt_class(&OBJC_CLASS___AXUIElement, v13);
      char isKindOfClass = objc_opt_isKindOfClass(v12, v14);
      id v16 = v12;
      if ((isKindOfClass & 1) != 0) {
        id v16 = objc_msgSend(v12, "axElement", v12);
      }
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement elementWithAXUIElement:](&OBJC_CLASS___AXElement, "elementWithAXUIElement:", v16));
      unsigned int v18 = [v17 isEqual:v7];
      if (!v17 || v18)
      {

        break;
      }

      [v17 setAutoscrollSpeed:a3];
      [v17 setAutoscrollTarget:v17];
      id v7 = v17;
      if ([v17 autoscrollInDirection:a4])
      {
        BOOL v8 = 1;
        id v7 = v17;
        goto LABEL_14;
      }
    }

    uint64_t v19 = AXLogCommon();
    unsigned __int8 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 label]);
      int v23 = 134218498;
      double v24 = a3;
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      __int16 v27 = 2112;
      double v28 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to autoscroll with speed: %f, direction: %lu, pickedElement label: %@",  (uint8_t *)&v23,  0x20u);
    }

    BOOL v8 = 0;
  }

- (id)_scrollViewForScrollAction:(int)a3 elementsToScroll:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10001C640;
  v34[3] = &unk_100122368;
  int v37 = a3;
  id v9 = v7;
  id v35 = v9;
  id v10 = v8;
  id v36 = v10;
  id v11 = objc_retainBlock(v34);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager elementFetcher](self, "elementFetcher"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 availableElements]);

  id v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        ((void (*)(void *, void))v11[2])(v11, *(void *)(*((void *)&v30 + 1) + 8LL * (void)v17));
        uint64_t v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }

    while (v15);
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v9 count]));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v19 = v9;
  id v20 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      int v23 = 0LL;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXElement elementWithAXUIElement:]( &OBJC_CLASS___AXElement,  "elementWithAXUIElement:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)v23),  (void)v26));
        [v18 addObject:v24];

        int v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }

    while (v21);
  }

  if (a4) {
    *a4 = v10;
  }

  return v18;
}

- (BOOL)_isChildElement:(id)a3 desendantOfElement:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    do
    {
      unsigned __int8 v8 = [v7 isEqual:a4];
      if ((v8 & 1) != 0) {
        break;
      }
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 elementParent]);

      id v7 = (void *)v9;
    }

    while (v9);
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)endContinuousScrollingOnDisplay:(id)a3 withCompletion:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if (-[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode"))
  {
    unint64_t continuousScrollMode = self->_continuousScrollMode;
    self->_unint64_t continuousScrollMode = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v13));
    [v7 setMultiTouchToolBackgroundEnabled:0];
    -[HNDHandManager currentPointForPointer](self, "currentPointForPointer");
    objc_msgSend(v7, "updateWithPrimaryFingerPoint:");
    continuousScrollPickedElement = self->_continuousScrollPickedElement;
    self->_continuousScrollPickedElement = 0LL;

    activeContinuousScroller = self->_activeContinuousScroller;
    self->_activeContinuousScroller = 0LL;

    os_unfair_lock_lock(&self->_continuousScrollLock);
    horizontalContinuousScrollers = self->_horizontalContinuousScrollers;
    self->_horizontalContinuousScrollers = (NSArray *)&__NSArray0__struct;

    verticalContinuousScrollers = self->_verticalContinuousScrollers;
    self->_verticalContinuousScrollers = (NSArray *)&__NSArray0__struct;

    self->_scrollingBlockedOnElementRefresh = 0;
    os_unfair_lock_unlock(&self->_continuousScrollLock);
    currentContinuousScrollDirection = self->_currentContinuousScrollDirection;
    self->_currentContinuousScrollDirection = 0LL;

    self->_isActivelyScrollingContinuousldouble y = 0;
    if (-[HNDHandManager _shouldRepeatGesture](self, "_shouldRepeatGesture") && v4) {
      -[HNDHandManager beginContinuousScrollingInDirection:onDisplay:]( self,  "beginContinuousScrollingInDirection:onDisplay:",  continuousScrollMode == 1,  v13);
    }
  }
}

- (void)_handlePinchFingerDownWithFinger:(id)a3 onDisplay:(id)a4
{
  id v6 = (AXPIFingerModel *)a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", a4));
  [v9 performPress:2 type:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 fingerController]);
  [v7 pressFingersDownAnimated:1];

  self->_pinchState = 1LL;
  realSelectedPinchFinger = self->_realSelectedPinchFinger;
  self->_realSelectedPinchFinger = v6;
}

- (void)_handleRealPinchToolDown:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v7));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v8 fingerController]);

  objc_msgSend(v10, "hndConvertPointToFingerContainerView:", x, y);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fingerModelAtPoint:"));
  if (v9)
  {
    -[HNDHandManager _handlePinchFingerDownWithFinger:onDisplay:]( self,  "_handlePinchFingerDownWithFinger:onDisplay:",  v9,  v7);
  }

  else
  {
    -[HNDHandManager _handleRealPinchToolMove:onDisplay:](self, "_handleRealPinchToolMove:onDisplay:", v7, x, y);

    [v10 enumerateFingersUsingBlock:&stru_1001223A8];
  }
}

- (void)resetPinchFingersOnDisplay:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fingerController]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerModels]);
  id v7 = [v6 count];

  if (v7 != (id)2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDHandManager.m",  2769LL,  "-[HNDHandManager resetPinchFingersOnDisplay:]",  @"Can only pinch with 2 fingers");
  }
  if (!self->_resettingPinch)
  {
    self->_resettingPinch = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001CAF0;
    v9[3] = &unk_100122168;
    id v10 = v4;
    id v11 = self;
    AXPerformBlockOnMainThreadAfterDelay(v9, v8, 0.25);
  }
}

- (id)mainWindow
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager mainDisplayManager](self, "mainDisplayManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 window]);

  return v3;
}

- (void)_handleRealPinchToolUp:(CGPoint)a3 onDisplay:(id)a4
{
  id v8 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);

  if (self->_pinchState)
  {
    -[HNDHandManager resetPinchFingersOnDisplay:](self, "resetPinchFingersOnDisplay:", v8);
    realSelectedPinchFinger = self->_realSelectedPinchFinger;
    self->_realSelectedPinchFinger = 0LL;
  }

  else
  {
    [v6 enumerateFingersUsingBlock:&stru_1001223C8];
  }

  [v6 liftFingersUpAnimated:1];
  self->_pinchState = 0LL;
}

- (void)_handleRealPinchToolMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 fingerController]);

  if (self->_pinchState)
  {
    objc_msgSend(v9, "hndConvertPointToFingerContainerView:", x, y);
    -[HNDHandManager _modifyPinchToolMoveToPoint:onDisplay:](self, "_modifyPinchToolMoveToPoint:onDisplay:", v7);
  }

  else
  {
    objc_msgSend(v9, "hndCentroidForPinchChainMidPoint:", x, y);
    -[HNDHandManager _moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:]( self,  "_moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:",  v7,  0LL,  1LL,  0LL);
  }
}

- (void)_handleRealMultiFingerMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 fingerController]);

  objc_msgSend(v9, "hndStandardCentroidForMultifingers:", x, y);
  -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:]( self,  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  v7,  0LL);
}

- (void)_handleRealMultiFingerDown:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", v7));
  self->_inMultiFingerGesture = 1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v14 fingerController]);
  objc_msgSend(v8, "hndStandardCentroidForMultifingers:", x, y);
  double v10 = v9;
  double v12 = v11;

  -[HNDHandManager _moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:]( self,  "_moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:",  v7,  0LL,  1LL,  0LL,  v10,  v12);
  [v14 performPress:2 type:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 fingerController]);
  [v13 pressFingersDownAnimated:1];
}

- (void)_handleRealMultiFingerUp:(CGPoint)a3 onDisplay:(id)a4
{
  self->_inMultiFingerGesture = 0;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  a4,  a3.x,  a3.y));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
  [v4 liftFingersUpAnimated:1];
}

- (void)_moveFingersForRealEventToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v13));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerController]);
  objc_msgSend(v8, "hndAbsoluteCentroidForMultifingers:", x, y);
  double v10 = v9;
  double v12 = v11;

  -[HNDHandManager _moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:]( self,  "_moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:animated:completion:",  v13,  0LL,  1LL,  0LL,  v10,  v12);
}

- (void)_handleRealCustomGestureDown:(CGPoint)a3 onDisplay:(id)a4
{
  self->_inCustomGestureMovement = 1;
}

- (void)_handleRealCustomGestureMove:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v13));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerController]);
  objc_msgSend(v8, "hndAbsoluteCentroidForMultifingers:", x, y);
  double v10 = v9;
  double v12 = v11;

  -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:]( self,  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  v13,  1LL,  v10,  v12);
}

- (void)_handleRealCustomGestureUp:(CGPoint)a3 onDisplay:(id)a4
{
  id v7 = a4;
  unsigned __int8 v5 = -[HNDHandManager isPerformingGesture](self, "isPerformingGesture");
  id v6 = v7;
  if ((v5 & 1) == 0)
  {
    if (self->_inCustomGestureMovement) {
      -[HNDHandManager _performCustomGestureOnDisplay:](self, "_performCustomGestureOnDisplay:", v7);
    }
    self->_inCustomGestureMovement = 0;
    id v6 = v7;
  }
}

- (BOOL)_shouldEnableMultiTouchToolBackground
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager deviceManager](self, "deviceManager"));
  if ([v2 deviceCount]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = _AXSAssistiveTouchScannerEnabled(0LL, v3) == 0;
  }

  return v4;
}

- (void)_handleMultiTouchToolEvent:(id)a3
{
  id v4 = a3;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paths]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstPath]);
  [v7 pathLocation];
  double v9 = v8;
  double v11 = v10;

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
  unsigned int v13 = [v12 eventType];

  switch(v13)
  {
    case 1u:
      if (!self->_resettingPinch)
      {
        if (-[HNDHandManager inPinchMode](self, "inPinchMode"))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
          -[HNDHandManager _handleRealPinchToolDown:onDisplay:]( self,  "_handleRealPinchToolDown:onDisplay:",  v15,  v9,  v11);
        }

        else if (-[HNDHandManager inCustomGesture](self, "inCustomGesture"))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
          -[HNDHandManager _handleRealCustomGestureDown:onDisplay:]( self,  "_handleRealCustomGestureDown:onDisplay:",  v15,  v9,  v11);
        }

        else if (-[HNDHandManager inDragMode](self, "inDragMode"))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
          -[HNDHandManager _handleRealDragToolMove:onDisplay:](self, "_handleRealDragToolMove:onDisplay:", v15, v9, v11);
        }

        else
        {
          unsigned int v18 = -[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode");
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
          if (v18) {
            -[HNDHandManager _handleRealContinuousScrollToolMove:onDisplay:]( self,  "_handleRealContinuousScrollToolMove:onDisplay:",  v15,  v9,  v11);
          }
          else {
            -[HNDHandManager _handleRealMultiFingerDown:onDisplay:]( self,  "_handleRealMultiFingerDown:onDisplay:",  v15,  v9,  v11);
          }
        }

        self->_isFingerDown = 1;
      }

      goto LABEL_36;
    case 2u:
      if (-[HNDHandManager inPinchMode](self, "inPinchMode"))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealPinchToolMove:onDisplay:](self, "_handleRealPinchToolMove:onDisplay:", v16, v9, v11);
      }

      else if (-[HNDHandManager inCustomGesture](self, "inCustomGesture"))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealCustomGestureMove:onDisplay:]( self,  "_handleRealCustomGestureMove:onDisplay:",  v16,  v9,  v11);
      }

      else if (-[HNDHandManager inDragMode](self, "inDragMode"))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealDragToolMove:onDisplay:](self, "_handleRealDragToolMove:onDisplay:", v16, v9, v11);
      }

      else if (-[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode"))
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealContinuousScrollToolMove:onDisplay:]( self,  "_handleRealContinuousScrollToolMove:onDisplay:",  v16,  v9,  v11);
      }

      else
      {
        if (-[HNDHandManager inCustomGesture](self, "inCustomGesture")) {
          goto LABEL_36;
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealMultiFingerMove:onDisplay:]( self,  "_handleRealMultiFingerMove:onDisplay:",  v16,  v9,  v11);
      }

LABEL_36:
      return;
    case 6u:
    case 8u:
    case 9u:
      if (-[HNDHandManager inPinchMode](self, "inPinchMode"))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealPinchToolUp:onDisplay:](self, "_handleRealPinchToolUp:onDisplay:", v14, v9, v11);
      }

      else if (-[HNDHandManager inCustomGesture](self, "inCustomGesture"))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealCustomGestureUp:onDisplay:]( self,  "_handleRealCustomGestureUp:onDisplay:",  v14,  v9,  v11);
      }

      else if (-[HNDHandManager inDragMode](self, "inDragMode"))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        -[HNDHandManager _handleRealDragToolUp:onDisplay:](self, "_handleRealDragToolUp:onDisplay:", v14, v9, v11);
      }

      else
      {
        unsigned int v17 = -[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode");
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 hardwareIdentifier]);
        if (v17) {
          -[HNDHandManager _handleRealContinuousScrollToolUp:onDisplay:]( self,  "_handleRealContinuousScrollToolUp:onDisplay:",  v14,  v9,  v11);
        }
        else {
          -[HNDHandManager _handleRealMultiFingerUp:onDisplay:]( self,  "_handleRealMultiFingerUp:onDisplay:",  v14,  v9,  v11);
        }
      }

      self->_isFingerDown = 0;
      goto LABEL_36;
    default:
      goto LABEL_36;
  }

- (BOOL)_shouldHandleRealEventWithMultiTouchTool
{
  if (-[HNDHandManager inCustomGesture](self, "inCustomGesture")
    || -[HNDHandManager inPinchMode](self, "inPinchMode")
    || -[HNDHandManager inDragMode](self, "inDragMode"))
  {
    return 1;
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
  BOOL v3 = (unint64_t)[v6 numberOfFingers] > 1;

  return v3;
}

- (void)specialToolUsageEnded:(BOOL)a3
{
  currentCustomGesture = self->_currentCustomGesture;
  self->_currentCustomGesture = 0LL;

  self->_preparedScrollAction = 0;
  if (-[HNDHandManager inDragMode](self, "inDragMode"))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
    -[HNDHandManager endDragModeAtPoint:onDisplay:completed:]( self,  "endDragModeAtPoint:onDisplay:completed:",  v5,  0LL,  self->_dragStartPoint.x,  self->_dragStartPoint.y);
  }

  if (-[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
    -[HNDHandManager endContinuousScrollingOnDisplay:withCompletion:]( self,  "endContinuousScrollingOnDisplay:withCompletion:",  v6,  0LL);
  }

  self->_pinchState = 0LL;
  self->_isPerformingDragPressEvent = 0;
  self->_inCustomGestureMovement = 0;
  self->_inMultiFingerGesture = 0;
  uint64_t v7 = AXLogCommon();
  double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Special tool usage ended", v9, 2u);
  }
}

- (BOOL)usingSpecialTool
{
  if (-[HNDHandManager inPinchMode](self, "inPinchMode")
    || self->_inMultiFingerGesture
    || self->_inCustomGestureMovement
    || -[HNDHandManager inDragMode](self, "inDragMode"))
  {
    return 1;
  }

  else
  {
    return -[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode");
  }

- (void)handleRealEvent:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned __int8 v6 = [v5 isControllingOtherDevice];

  if ((v6 & 1) == 0) {
    -[HNDHandManager notifyUserEventOccurred](self, "notifyUserEventOccurred");
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventHandlers](self, "eventHandlers"));
  if ([v4 type] == 3001
    && ([v4 isDisplayIntegrated] & 1) == 0)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 paths]);
    if ([v9 count] == (id)1)
    {
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 paths]);
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
      unsigned int v13 = [v12 transducerType];

      if (!v13) {
        goto LABEL_27;
      }
    }

    else
    {
    }
  }

  if (([v4 isSystemDrag] & 1) == 0)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v14 = v7;
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        unsigned int v18 = 0LL;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend( *(id *)(*((void *)&v25 + 1) + 8 * (void)v18),  "handledEvent:",  v4,  (void)v25))
          {

            goto LABEL_27;
          }

          unsigned int v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    unsigned int v20 = [v19 eventType];

    unsigned int v21 = -[HNDHandManager usingSpecialTool](self, "usingSpecialTool");
    if (v20 == 2) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = 0;
    }
    int v23 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager", (void)v25));
    if ([v23 handleRealEvent:v4])
    {

      if (!v22) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }

    unsigned int v24 = -[HNDHandManager _shouldHandleRealEventWithMultiTouchTool](self, "_shouldHandleRealEventWithMultiTouchTool");

    if (((v24 | v22) & 1) != 0) {
LABEL_26:
    }
      -[HNDHandManager _handleMultiTouchToolEvent:](self, "_handleMultiTouchToolEvent:", v4);
  }

- (void)ringerSwitchChanged
{
}

- (void)rotationLockChanged
{
}

- (void)substantialTransitionOccurred
{
  if (!self->_isFingerDown)
  {
    self->_shouldSkipElementFetchForAXScroll = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10001DAEC;
    v4[3] = &unk_100122470;
    void v4[4] = self;
    v4[5] = a2;
    -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
  }

- (void)systemServerDied
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001DD38;
  v2[3] = &unk_100121D18;
  v2[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v2, a2, 0.5);
}

- (BOOL)inRockerMode
{
  uint64_t v5 = 0LL;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001DDE0;
  v4[3] = &unk_100122498;
  void v4[4] = &v5;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)inPinchMode
{
  uint64_t v5 = 0LL;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001DEC8;
  v4[3] = &unk_100122498;
  void v4[4] = &v5;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)inDragMode
{
  return self->_inDragMode;
}

- (void)orientationChanged
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001DFB4;
  block[3] = &unk_100121D18;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)orientationChanged:(int64_t)a3
{
  uint64_t v5 = ASTLogCommon(self);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int orientation = self->_orientation;
    v9[0] = 67109376;
    v9[1] = orientation;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Orientation changed via SpringBoard action handler: old %d new %ld",  (uint8_t *)v9,  0x12u);
  }

  else {
    int v8 = 0;
  }
  self->_int orientation = v8;
  -[HNDHandManager _startOrientationUpdateTimer](self, "_startOrientationUpdateTimer");
}

- (void)_startOrientationUpdateTimer
{
  orientationUpdateTimer = self->_orientationUpdateTimer;
  if (!orientationUpdateTimer)
  {
    id v4 = (AXDispatchTimer *)[objc_allocWithZone(AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    uint64_t v5 = self->_orientationUpdateTimer;
    self->_orientationUpdateTimer = v4;

    orientationUpdateTimer = self->_orientationUpdateTimer;
  }

  id v6 = -[AXDispatchTimer cancel](orientationUpdateTimer, "cancel");
  if (_AXSAssistiveTouchScannerEnabled(v6, v7))
  {
    double v8 = 0.05;
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager mainDisplayManager](self, "mainDisplayManager"));
    else {
      double v8 = 0.28;
    }
  }

  __int16 v10 = self->_orientationUpdateTimer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001E284;
  v11[3] = &unk_100121D18;
  v11[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](v10, "afterDelay:processBlock:", v11, v8);
}

- (void)resetNubbitLocation
{
}

- (void)mediaControlsChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001E334;
  v3[3] = &unk_1001224D8;
  BOOL v4 = a3;
  v3[4] = a2;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v3);
}

- (void)_attemptToShowVisualsAfterPerformingScreenshot
{
  uint64_t v4 = ASTLogCommon(self);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t visualsHiddenForScreenshotCount = self->_visualsHiddenForScreenshotCount;
    *(_DWORD *)id buf = 134217984;
    unint64_t v11 = visualsHiddenForScreenshotCount;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Attempt to show visuals after performing screenshot. Hidden count: %lu",  buf,  0xCu);
  }

  unint64_t v7 = self->_visualsHiddenForScreenshotCount;
  if (v7)
  {
    unint64_t v8 = v7 - 1;
    self->_unint64_t visualsHiddenForScreenshotCount = v8;
    if (!v8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      _DWORD v9[2] = sub_10001E498;
      v9[3] = &unk_1001224F8;
      void v9[4] = a2;
      -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v9);
    }
  }

- (void)_handleScreenshotDidFireCallbackTimeout
{
  if (self->_visualsHiddenForScreenshotCount)
  {
    uint64_t v3 = ASTLogCommon(self);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = 0x400C000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Took longer than %f seconds to show visuals again after taking screenshot. Showing them now.",  (uint8_t *)&v5,  0xCu);
    }

    -[HNDHandManager _attemptToShowVisualsAfterPerformingScreenshot]( self,  "_attemptToShowVisualsAfterPerformingScreenshot");
  }

- (void)screenshotWillFire
{
  uint64_t v8 = 0LL;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E760;
  v7[3] = &unk_100122520;
  void v7[4] = &v8;
  void v7[5] = a2;
  id v3 = -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v7);
  if (*((_BYTE *)v9 + 24))
  {
    ++self->_visualsHiddenForScreenshotCount;
    uint64_t v4 = ASTLogCommon(v3);
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t visualsHiddenForScreenshotCount = self->_visualsHiddenForScreenshotCount;
      *(_DWORD *)id buf = 134217984;
      unint64_t v13 = visualsHiddenForScreenshotCount;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Did hide visuals for screenshot. Count: %lu",  buf,  0xCu);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_handleScreenshotDidFireCallbackTimeout",  0LL);
    -[HNDHandManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_handleScreenshotDidFireCallbackTimeout",  0LL,  3.5);
  }

  _Block_object_dispose(&v8, 8);
}

- (void)screenshotDidFire
{
  uint64_t v3 = ASTLogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Screenshot did fire.", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001E910;
  v6[3] = &unk_100121D18;
  v6[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v6, v5, 0.5);
}

- (void)mediaPlaybackChanged
{
  char v2 = 1;
  _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v2,  @"mediaPlaybackChanged not handled for tvOS");
}

- (void)_modifyPinchToolMoveToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v51 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", a4));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v51 fingerController]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerModels]);
  id v9 = [v8 count];

  if (v9 != (id)2) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDHandManager.m",  3610LL,  "-[HNDHandManager _modifyPinchToolMoveToPoint:onDisplay:]",  @"Can only pinch with 2 fingers");
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerModels]);
  char v11 = (AXPIFingerModel *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerModels]);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);

  -[AXPIFingerModel location](v11, "location");
  double v15 = v14;
  double v17 = v16;
  [v13 location];
  double v19 = v18;
  double v21 = v20;
  unint64_t pinchMode = self->_pinchMode;
  if (pinchMode)
  {
    if (pinchMode == 1)
    {
      realSelectedPinchFinger = self->_realSelectedPinchFinger;
      if (!realSelectedPinchFinger) {
        realSelectedPinchFinger = v11;
      }
      float v43 = realSelectedPinchFinger;
      -[AXPIFingerModel location](v43, "location");
      double v45 = y - v44;

      double v46 = -v45;
      if (v43 == v11) {
        double v46 = v45;
      }
      double v15 = v15 - v46;
      double v17 = v17 + v46;
      double v19 = v19 + v46;
      double v21 = v21 - v46;
    }

    else if (pinchMode == 2)
    {
      int v23 = self->_realSelectedPinchFinger;
      if (!v23) {
        int v23 = v11;
      }
      unsigned int v24 = v23;
      -[AXPIFingerModel location](v24, "location");
      double v26 = x - v25;
      -[AXPIFingerModel location](v24, "location");
      double v28 = y - v27;

      double v29 = -v26;
      double v30 = -v28;
      if (v24 == v11)
      {
        double v29 = v26;
        double v30 = v28;
      }

      double v15 = v15 + v29;
      double v17 = v17 + v30;
      double v19 = v19 - v29;
      double v21 = v21 - v30;
    }
  }

  else
  {
    [v7 midpointForFingers];
    double v32 = v31;
    double v34 = v33;
    double v35 = atan(y - v17) / -40.0;
    id v36 = self->_realSelectedPinchFinger;
    if (v36 != v11 && v36 != 0LL) {
      double v35 = -v35;
    }
    double v38 = v15 - v32;
    double v39 = v17 - v34;
    __double2 v40 = __sincos_stret(v35);
    double v15 = v32 + v40.__cosval * (v15 - v32) - v40.__sinval * v39;
    double v17 = v34 + v39 * v40.__cosval + v40.__sinval * v38;
    double v41 = v19 - v32;
    double v19 = v32 + v40.__cosval * (v19 - v32) - v40.__sinval * (v21 - v34);
    double v21 = v34 + (v21 - v34) * v40.__cosval + v40.__sinval * v41;
  }

  [v7 beginUpdates];
  v47 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerContainerView]);
  [v47 bounds];
  v52.double x = v15;
  v52.double y = v17;
  BOOL v48 = CGRectContainsPoint(v54, v52);

  if (v48) {
    -[AXPIFingerModel setLocation:](v11, "setLocation:", v15, v17);
  }
  BOOL v49 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerContainerView]);
  [v49 bounds];
  v53.double x = v19;
  v53.double y = v21;
  BOOL v50 = CGRectContainsPoint(v55, v53);

  if (v50) {
    objc_msgSend(v13, "setLocation:", v19, v21);
  }
  [v7 endUpdates];
  -[AXPIFingerModel location](v11, "location");
  objc_msgSend(v51, "updateWithPrimaryFingerPoint:");
}

- (void)addEventHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___AXEventHandler])
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventHandlers](self, "eventHandlers"));
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            if (*(void **)(*((void *)&v16 + 1) + 8LL * (void)i) == v5)
            {

              _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not add duplicate event handler");
              goto LABEL_25;
            }
          }

          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      if (!v6)
      {
        id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](&OBJC_CLASS___NSPointerArray, "weakObjectsPointerArray"));
        -[HNDHandManager setEventHandlers:](self, "setEventHandlers:", v6);
      }

      if ([v6 count] && (id v11 = objc_msgSend(v6, "count")) != 0)
      {
        id v12 = v11;
        uint64_t v13 = 0LL;
        while (1)
        {
          double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 pointerAtIndex:v13]);
          id v15 = [v14 priority];
          if (v15 > [v5 priority]) {
            break;
          }

          if (v12 == (id)++v13) {
            goto LABEL_18;
          }
        }

        [v6 insertPointer:v5 atIndex:v13];
      }

      else
      {
LABEL_18:
        [v6 addPointer:v5];
      }

      if ([v6 count]) {
        -[HNDHandManager setCaptureEvents:](self, "setCaptureEvents:", 1LL);
      }
LABEL_25:
    }

    else
    {
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not add object that is not an event handler");
    }
  }

  else
  {
    _AXLogWithFacility(0LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"Could not add nil event handler");
  }
}

- (void)removeEventHandler:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventHandlers](self, "eventHandlers"));
    id v5 = [v4 count];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0LL;
      while (1)
      {
        id v8 = (id)objc_claimAutoreleasedReturnValue([v4 pointerAtIndex:v7]);
        if (v8 == v9) {
          break;
        }

        if (v6 == (id)++v7) {
          goto LABEL_9;
        }
      }

      [v4 removePointerAtIndex:v7];
    }

- (void)updateAllSettings
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 assistiveTouchSpeed];
  -[HNDHandManager setTouchSpeed:](self, "setTouchSpeed:");
  -[HNDHandManager setOpenMenuWithSwaggle:]( self,  "setOpenMenuWithSwaggle:",  [v5 assistiveTouchOpenMenuSwaggleEnabled]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 assistiveTouchCustomGestures]);
  -[HNDHandManager setCustomGestures:](self, "setCustomGestures:", v3);

  -[HNDHandManager updateMenuVisibility](self, "updateMenuVisibility");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager deviceManager](self, "deviceManager"));
  [v4 setDetectDevices:1];
}

- (void)updateMenuVisibility
{
  int v3 = _AXSAssistiveTouchHardwareEnabled(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v4 assistiveTouchInternalOnlyHiddenNubbitModeEnabled])
  {
    unsigned int v5 = 1;
  }

  else if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v5 = [v6 assistiveTouchAlwaysShowMenuEnabled] ^ 1;
  }

  else
  {
    unsigned int v5 = 0;
  }

  uint64_t v8 = ASTLogCommon(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating menu visibility: %d", (uint8_t *)v10, 8u);
  }

  -[HNDHandManager setAlwaysShowMenu:](self, "setAlwaysShowMenu:", v5 ^ 1);
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", &stru_100122540);
}

- (BOOL)nubbitVisible
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F240;
  v4[3] = &unk_100122498;
  void v4[4] = &v5;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)touchSpeedMultiplier
{
  double touchSpeed = self->_touchSpeed;
  if (touchSpeed > 0.5) {
    return (touchSpeed + -0.5) * 5.0 + 1.0;
  }
  double result = 1.0;
  if (touchSpeed < 0.5) {
    return fmax(touchSpeed + touchSpeed, 0.1);
  }
  return result;
}

- (void)cancelCurrentGesture
{
}

- (BOOL)isPerformingGesture
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F3D8;
  v4[3] = &unk_100122498;
  void v4[4] = &v5;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)performPreparedGestureOnDisplay:(id)a3
{
  if (self->_currentCustomGesture) {
    -[HNDHandManager _performCustomGestureOnDisplay:](self, "_performCustomGestureOnDisplay:", a3);
  }
}

- (id)_shiftGestureIfNeeded:(id)a3 onDisplay:(id)a4 toMidpoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if ([v9 shouldPerformAtOriginalLocation])
  {
    id v11 = v9;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v10));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 fingerController]);
    [v13 midpointOfStartingFingersForGesture:v9];
    double v15 = v14;
    double v17 = v16;

    id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "gestureShiftedByOffset:", x - v15, y - v17));
  }

  __int128 v18 = v11;

  return v18;
}

- (void)_performCustomGestureOnDisplay:(id)a3
{
  id v4 = a3;
  if (!-[HNDHandManager inCustomGesture](self, "inCustomGesture")) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDHandManager.m",  4041LL,  "-[HNDHandManager _performCustomGestureOnDisplay:]",  @"Should not have tried to perform a gesture");
  }
  if (self->_currentCustomGesture
    || (_AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDHandManager.m",  4042LL,  "-[HNDHandManager _performCustomGestureOnDisplay:]",  @"Tried to perform custom gesture, but none was set."),  self->_currentCustomGesture))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v4));
    -[HNDHandManager currentPointForPointer](self, "currentPointForPointer");
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager _shiftGestureIfNeeded:onDisplay:toMidpoint:]( self,  "_shiftGestureIfNeeded:onDisplay:toMidpoint:",  self->_currentCustomGesture,  v4));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10001F77C;
    v20[3] = &unk_100122588;
    id v11 = v5;
    id v21 = v11;
    id v12 = v10;
    uint64_t v25 = v7;
    uint64_t v26 = v9;
    id v22 = v12;
    int v23 = self;
    id v13 = v4;
    id v24 = v13;
    double v14 = objc_retainBlock(v20);
    if ((self->_preparedScrollAction - 2006) <= 0x19
      && ((1 << (LOBYTE(self->_preparedScrollAction) + 42)) & 0x300000F) != 0
      && [v12 numberOfEvents]
      && (double v15 = (void *)objc_claimAutoreleasedReturnValue([v12 fingerIdentifiersAtEventIndex:0]),
          id v16 = [v15 count],
          v15,
          v16)
      && ([v12 pointForFingerIdentifier:&off_10012F790 atEventIndex:0],
          -[HNDHandManager _performAXScrollActionAtPoint:onDisplay:action:]( self,  "_performAXScrollActionAtPoint:onDisplay:action:",  v13,  self->_preparedScrollAction)))
    {
      ((void (*)(void *))v14[2])(v14);
    }

    else
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v11 fingerController]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10001F7F0;
      v18[3] = &unk_100121FA8;
      __int128 v19 = v14;
      [v17 performGesture:v12 completion:v18];
    }
  }
}

- (BOOL)_shouldRepeatGesture
{
  return 1;
}

- (BOOL)isCapturingRealEvents
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F8A4;
  v4[3] = &unk_100122498;
  void v4[4] = &v5;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)prepareGesture:(id)a3 onDisplay:(id)a4
{
  uint64_t v25 = (AXNamedReplayableGesture *)a3;
  id v7 = a4;
  -[HNDHandManager showMenu:onDisplay:](self, "showMenu:onDisplay:", 0LL, v7);
  char v8 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v7));
  [v8 setMultiTouchToolBackgroundEnabled:1];
  [v8 setFingerContentViewIsActive:1];
  if (self->_currentCustomGesture != v25)
  {
    objc_storeStrong((id *)&self->_currentCustomGesture, a3);
    uint64_t v9 = v25;
    -[HNDHandManager currentPointForPointer](self, "currentPointForPointer");
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    if (v10 != CGPointZero.x || v11 != y)
    {
      double v15 = v10;
      double v16 = v11;
      uint64_t v17 = objc_claimAutoreleasedReturnValue( -[HNDHandManager _shiftGestureIfNeeded:onDisplay:toMidpoint:]( self,  "_shiftGestureIfNeeded:onDisplay:toMidpoint:",  v9,  v7));

      double x = v15;
      double y = v16;
      uint64_t v9 = (AXNamedReplayableGesture *)v17;
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerController]);
    objc_msgSend(v18, "showStartingFingersForGesture:animated:startPointForAnimation:", v9, 1, x, y);

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerController]);
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 fingerModels]);
    id v21 = [v20 count];

    if (v21)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerController]);
      int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 fingerModels]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
      [v24 location];
      objc_msgSend(v8, "updateWithPrimaryFingerPoint:");
    }
  }
}

- (void)_resetMenuOpenTracker
{
  xmmword_1001575F8 = (__int128)CGPointZero;
  qword_100155798 = 0xC1E6CEAF20000000LL;
  qword_100157608 = 0LL;
}

- (void)setCaptureEvents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
  unsigned int v6 = [v5 isCapturingEvents];
  char v7 = v6;
  if (v3)
  {

    if ((v7 & 1) != 0) {
      goto LABEL_9;
    }
LABEL_6:
    if (!-[HNDHandManager dwellControlEnabled](self, "dwellControlEnabled"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
      [v5 setCaptureEvents:v3];
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  if (!v6)
  {
LABEL_8:

    goto LABEL_9;
  }

  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventHandlers](self, "eventHandlers"));
  id v9 = [v8 count];

  if (!v9) {
    goto LABEL_6;
  }
LABEL_9:
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", &stru_1001225A8);
}

- (void)setNubbitMoving:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
  [v4 setNubbitMoving:v3];
}

- (BOOL)nubbitMoving
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
  unsigned __int8 v3 = [v2 nubbitMoving];

  return v3;
}

- (void)_menuOpenTracker:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[HNDHandManager openMenuWithSwaggle](self, "openMenuWithSwaggle"))
  {
    double v6 = *(double *)&qword_100155798;
    if (*(double *)&qword_100155798 != -3061152000.0)
    {
      double v6 = CFAbsoluteTimeGetCurrent() - *(double *)&qword_100155798;
      if (v6 > 5.0) {
        goto LABEL_9;
      }
    }

    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager", v6));
    [v7 screenBounds];
    double v11 = sub_10002AFE4(1, x, y, v8, v9, v10);
    double v13 = v12;

    if (*(double *)&xmmword_1001575F8 == CGPointZero.x && *((double *)&xmmword_1001575F8 + 1) == CGPointZero.y)
    {
      *(double *)&xmmword_1001575F8 = v11;
      *((double *)&xmmword_1001575F8 + 1) = v13;
      return;
    }

    if (vabdd_f64(*((double *)&xmmword_1001575F8 + 1), v13) > 2.0)
    {
LABEL_9:
      -[HNDHandManager _resetMenuOpenTracker](self, "_resetMenuOpenTracker");
      return;
    }

    double v15 = *(double *)&xmmword_1001575F8 - v11;
    uint64_t v16 = qword_100157608;
    if (!qword_100157608 && fabs(v15) > 2.0) {
      goto LABEL_14;
    }
    if (byte_100157610) {
      BOOL v17 = v15 <= 2.0;
    }
    else {
      BOOL v17 = v15 >= -2.0;
    }
    if (v17) {
      goto LABEL_21;
    }
    if (!qword_100157608)
    {
LABEL_14:
      qword_100155798 = CFAbsoluteTimeGetCurrent();
      uint64_t v16 = qword_100157608;
    }

    qword_100157608 = ++v16;
    xmmword_1001575F8 = (__int128)CGPointZero;
    byte_100157610 = v15 < 0.0;
LABEL_21:
    if (v16 == 3)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10001FE44;
      v18[3] = &unk_100121CB0;
      void v18[4] = self;
      -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v18);
      -[HNDHandManager _resetMenuOpenTracker](self, "_resetMenuOpenTracker");
      qword_100157608 = 0LL;
    }
  }

+ (double)_displayCornerRadius
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 traitCollection]);
  [v3 displayCornerRadius];
  double v5 = v4;

  if (v5 == _UITraitCollectionDisplayCornerRadiusUnspecified)
  {
    uint64_t v7 = ASTLogCommon(v6);
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Had unspecified display corner radius.",  v10,  2u);
    }

    return 0.0;
  }

  return v5;
}

+ (CGPoint)_pointByAvoidingDisplayCornerRadius:(double)a3 forPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (a3 <= 0.0)
  {
    uint64_t v7 = ASTLogMouse(a1, a2);
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000AEDE4();
    }
  }

  double v9 = (void *)qword_100157618;
  if (qword_100157618) {
    BOOL v10 = *(double *)&qword_100157620 == a3;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    double v11 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  -[HNDHandManager screenFrame:]_0(qword_100157618, (uint64_t)a2));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    double v13 = (void *)qword_100157618;
    qword_100157618 = v12;

    qword_100157620 = *(void *)&a3;
    double v9 = (void *)qword_100157618;
  }

  uint64_t v14 = (uint64_t)objc_msgSend(v9, "containsPoint:", x, y);
  if ((v14 & 1) == 0)
  {
    -[HNDHandManager screenFrame:]_0(v14, v15);
    double Center = AX_CGRectGetCenter(v16);
    double v19 = v18;
    double v22 = -[HNDHandManager screenFrame:]_0(v20, v21);
    if (x <= Center) {
      double v28 = CGRectGetMinX(*(CGRect *)&v22) + a3;
    }
    else {
      double v28 = CGRectGetMaxX(*(CGRect *)&v22) - a3;
    }
    double v49 = v28;
    double v29 = -[HNDHandManager screenFrame:]_0(v26, v27);
    if (y <= v19) {
      double v33 = CGRectGetMinY(*(CGRect *)&v29) + a3;
    }
    else {
      double v33 = CGRectGetMaxY(*(CGRect *)&v29) - a3;
    }
    double v34 = atan2(y - v33, x - v49);
    double v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v35 scale];
    double v37 = v36;

    if (v37 <= 0.0)
    {
      uint64_t v39 = ASTLogCommon(v38);
      __double2 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        sub_1000AEDB8();
      }
    }

    double v47 = x;
    double v48 = y;
    double v41 = sqrt((x - v49) * (x - v49) + (y - v33) * (y - v33));
    if (v37 >= 2.22044605e-16) {
      double v42 = 1.0 / v37;
    }
    else {
      double v42 = 1.0;
    }
    __double2 v43 = __sincos_stret(v34);
    while (1)
    {
      double v41 = v41 - v42;
      if (v41 <= 0.0) {
        break;
      }
      double x = UIPointRoundToScale(v49 + v41 * v43.__cosval, v33 + v41 * v43.__sinval, v37);
      double y = v44;
    }

    double x = v47;
    double y = v48;
  }

- (void)setupWindow:(id)a3 ignoredWindow:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  block = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  double v18 = sub_100020310;
  double v19 = &unk_100121D18;
  uint64_t v20 = self;
  if (qword_100157628 != -1) {
    dispatch_once(&qword_100157628, &block);
  }
  uint64_t v7 = -[HNDDisplayManager initWithWindow:ignoredWindow:]( objc_alloc(&OBJC_CLASS___HNDDisplayManager),  "initWithWindow:ignoredWindow:",  v14,  v6);
  -[NSMutableArray addObject:](self->_displayManagers, "addObject:", v7);
  -[HNDDisplayManager setAlwaysShowMenu:]( v7,  "setAlwaysShowMenu:",  -[HNDHandManager alwaysShowMenu](self, "alwaysShowMenu"));
  -[HNDDisplayManager setHandManager:](v7, "setHandManager:", self);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v14 screen]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 displayConfiguration]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hardwareIdentifier]);
  -[HNDDisplayManager setHardwareIdentifier:](v7, "setHardwareIdentifier:", v10);

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v14 screen]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));

  if (v11 == v12)
  {
    -[HNDDisplayManager setIsMainDisplay:](v7, "setIsMainDisplay:", 1LL);
    uint64_t orientation = self->_orientation;
  }

  else
  {
    uint64_t orientation = 1LL;
  }

  -[HNDDisplayManager setOrientation:withCompletion:]( v7,  "setOrientation:withCompletion:",  orientation,  0LL,  v14,  block,  v17,  v18,  v19,  v20);
  -[HNDHandManager restartEverything](self, "restartEverything");
}

- (void)sceneDidConnect:(id)a3
{
  if (+[HNDAccessibilityManager accessibilityEnabled]( &OBJC_CLASS___HNDAccessibilityManager,  "accessibilityEnabled",  a3))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayManagers]);
    [v5 displaysDidChange:v4];
  }

- (void)sceneDidDisconnect:(id)a3
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_1000204E4;
  double v18 = sub_1000204F4;
  id v19 = 0LL;
  double v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  BOOL v10 = sub_1000204FC;
  double v11 = &unk_1001225D0;
  id v4 = a3;
  id v12 = v4;
  double v13 = &v14;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", &v8);
  -[NSMutableArray removeObject:](self->_displayManagers, "removeObject:", v15[5], v8, v9, v10, v11);
  if (+[HNDAccessibilityManager accessibilityEnabled](&OBJC_CLASS___HNDAccessibilityManager, "accessibilityEnabled"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 displayManagers]);
    [v5 displaysDidChange:v7];
  }

  _Block_object_dispose(&v14, 8);
}

- (void)moveFingerByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
    objc_msgSend(v18, "normalizedPointForDifference:", x, y);
    double v8 = v7;
    double v10 = v9;
    [v18 screenBounds];
    double v14 = sub_10002AFE4(0, v8, v10, v11, v12, v13);
    double v16 = v15;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v18 hardwareIdentifier]);
    -[HNDHandManager moveFingerToPoint:onDisplay:](self, "moveFingerToPoint:onDisplay:", v17, v14, v16);
  }

- (void)moveFingerToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
  -[HNDHandManager moveFingerToPoint:onDisplay:](self, "moveFingerToPoint:onDisplay:", v6, x, y);
}

- (void)moveFingerToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[HNDHandManager inPinchMode](self, "inPinchMode")) {
    BOOL primaryButtonDown = self->_primaryButtonDown;
  }
  else {
    BOOL primaryButtonDown = 0;
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000209CC;
  v33[3] = &unk_1001225F8;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v7));
  id v34 = v9;
  double v35 = self;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v33);
  objc_msgSend( (id)((uint64_t (*)(HNDHandManager *, uint64_t))objc_opt_class)(self, v10),  "_displayCornerRadius");
  if (v11 > 0.0)
  {
    double v12 = v11;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
    unsigned int v14 = [v13 isMainDisplay];

    if (v14)
    {
      objc_opt_class(self, v15);
      objc_msgSend(v16, "_pointByAvoidingDisplayCornerRadius:forPoint:", v12, x, y);
      double x = v17;
      double y = v18;
    }
  }

  [v9 screenBounds];
  double v22 = sub_10002AFD8(x, y, v19, v20, v21);
  double v24 = v23;
  if (!-[HNDHandManager isPerformingGesture](self, "isPerformingGesture"))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    unsigned int v26 = objc_msgSend( v9,  "hoverMovedToNormalizedPoint:shouldUpdateCurrentPoint:",  !primaryButtonDown,  v22,  v24);
    if (v26 && CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001557A0 > 4.0)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
      [v27 wakeDeviceFromSleepIfNecessary];

      qword_1001557A0 = *(void *)&Current;
    }

    if (!self->_primaryButtonDown) {
      -[HNDHandManager _menuOpenTracker:](self, "_menuOpenTracker:", v22, v24);
    }
    if (primaryButtonDown)
    {
      -[HNDHandManager _modifyPinchToolMoveToPoint:onDisplay:](self, "_modifyPinchToolMoveToPoint:onDisplay:", v7, x, y);
    }

    else if (-[HNDHandManager inDragMode](self, "inDragMode") && self->_isDragNubbitMode)
    {
      -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:]( self,  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  v7,  1LL,  x,  y);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100020A64;
      v29[3] = &unk_100121F30;
      id v30 = v9;
      double v31 = x;
      double v32 = y;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v29, 0.0);
    }

    else
    {
      unsigned int v28 = -[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode");
      -[HNDHandManager moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:]( self,  "moveFingersToPointInFingerCoordinateSpace:onDisplay:allowOutOfBounds:",  v7,  1LL,  x,  y);
      if (v28) {
        -[HNDHandManager processOrientedPointForContinuousScrolling:onDisplay:]( self,  "processOrientedPointForContinuousScrolling:onDisplay:",  v7,  x,  y);
      }
    }

    if (!self->_primaryButtonDown)
    {
      qword_1001557A8 = *(void *)&Current;
    }

    if ((primaryButtonDown | v26) == 1) {
      -[HNDHandManager notifyUserEventOccurred](self, "notifyUserEventOccurred");
    }
  }
}

- (CGRect)_paddedHitboxForNubbitOnDisplay:(id)a3 activationFactor:(double)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  a3,  a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rocker]);
  [v5 alpha];
  double v7 = fabs(v6);

  if (v7 >= 1.0)
  {
    [v4 rockerFrame];
    CGRect v17 = CGRectInset(v16, v16.size.width * -0.18, v16.size.height * -0.18);
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
  }

  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  -[HNDHandManager _defaultNubbitHitboxActivationFactor](self, "_defaultNubbitHitboxActivationFactor");
  -[HNDHandManager _paddedHitboxForNubbitOnDisplay:activationFactor:]( self,  "_paddedHitboxForNubbitOnDisplay:activationFactor:",  v7);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v18.origin.CGFloat x = v9;
  v18.origin.CGFloat y = v11;
  v18.size.CGFloat width = v13;
  v18.size.CGFloat height = v15;
  if (CGRectIsNull(v18)) {
    return 0;
  }
  v19.origin.CGFloat x = v9;
  v19.origin.CGFloat y = v11;
  v19.size.CGFloat width = v13;
  v19.size.CGFloat height = v15;
  v17.CGFloat x = x;
  v17.CGFloat y = y;
  return CGRectContainsPoint(v19, v17);
}

- (BOOL)_isInNubbitHitbox:(CGPoint)a3 onDisplay:(id)a4 activationFactor:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[HNDHandManager _paddedHitboxForNubbitOnDisplay:activationFactor:]( self,  "_paddedHitboxForNubbitOnDisplay:activationFactor:",  a4,  a5);
  CGFloat v7 = v13.origin.x;
  CGFloat v8 = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  if (CGRectIsNull(v13)) {
    return 0;
  }
  v14.origin.CGFloat x = v7;
  v14.origin.CGFloat y = v8;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  return CGRectContainsPoint(v14, v12);
}

- (double)_defaultNubbitHitboxActivationFactor
{
  return 0.18;
}

- (BOOL)inCustomGesture
{
  return self->_currentCustomGesture != 0LL;
}

- (id)_avPlayerForSound:(id)a3
{
  id v4 = a3;
  avPlayers = self->_avPlayers;
  if (!avPlayers)
  {
    double v6 = (NSMutableDictionary *)[objc_allocWithZone(NSMutableDictionary) init];
    CGFloat v7 = self->_avPlayers;
    self->_avPlayers = v6;

    avPlayers = self->_avPlayers;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](avPlayers, "objectForKey:", v4));
  if (!v8)
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByDeletingPathExtension]);
    CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue([v4 pathExtension]);
    CGPoint v12 = (void *)objc_claimAutoreleasedReturnValue([v9 URLForResource:v10 withExtension:v11]);

    id v8 = [objc_allocWithZone(AVAudioPlayer) initWithContentsOfURL:v12 error:0];
    -[NSMutableDictionary setObject:forKey:](self->_avPlayers, "setObject:forKey:", v8, v4);
  }

  return v8;
}

- (BOOL)_isPoint:(CGPoint)a3 withinTolerance:(double)a4 ofStartPoint:(CGPoint)a5
{
  BOOL v6 = vabdd_f64(a3.x, a5.x) < a4;
  double v5 = vabdd_f64(a3.y, a5.y);
  return v6 && v5 < a4;
}

- (void)_setApplicationAccessibilityEnabledIfNeeded
{
  if (!_AXSApplicationAccessibilityEnabled(self, a2))
  {
    char v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 assistiveTouchMainScreenCustomization]);

    uint64_t v4 = AXAssistiveTouchScrollIcons();
    double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrayByAddingObject:AXAssistiveTouchIconTypeScroll]);

    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    _DWORD v9[2] = sub_100020E90;
    v9[3] = &unk_100122620;
    id v8 = v6;
    id v10 = v8;
    LODWORD(v6) = objc_msgSend(v7, "ax_containsObjectUsingBlock:", v9);

    if ((_DWORD)v6)
    {
      _AXSSetAccessibilityEnabled();
      _AXSApplicationAccessibilitySetEnabled(1LL);
    }
  }

- (BOOL)dwellControlEnabled
{
  return 0;
}

- (CGPoint)currentPointForPointer
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fingerController]);
  double v4 = -1.0;
  double v5 = -1.0;
  if ([v3 numberOfFingers])
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v2 fingerController]);
    [v6 midpointForFingers];
    double v5 = v7;
    double v4 = v8;
  }

  if (v5 == -1.0 && v4 == -1.0)
  {
    [v2 screenPoint];
    double v5 = v10;
    double v4 = v11;
  }

  double v12 = v5;
  double v13 = v4;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (id)currentHardwareIdentifierForPointer
{
  return 0LL;
}

- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5
{
  return 0;
}

- (void)handleButtonEvent:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ASTLogMouse(v4, v5);
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000AEE10((uint64_t)v4, v7);
  }

  if ([v4 type] == 2)
  {
    uint64_t v8 = 3LL;
  }

  else
  {
    uint64_t v8 = 2LL;
  }

  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v4 actionOverride]);
  if (![v9 length])
  {
    id v10 = [v4 buttonNumber];
    uint64_t v13 = AXAssistiveTouchDefaultIconTypeForMouseButton(v10, v11, v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    CGFloat v9 = (void *)v14;
  }

  else {
    uint64_t v15 = (uint64_t)[v4 buttonNumber];
  }
  -[HNDHandManager _handleAction:type:state:](self, "_handleAction:type:state:", v9, v15, v8);

LABEL_13:
}

- (void)_handleAction:(id)a3 type:(int)a4 state:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v14 = a3;
  if ([v14 isEqualToString:AXAssistiveTouchIconTypeMousePrimaryClick])
  {
    -[HNDHandManager dwellControlEnabled](self, "dwellControlEnabled");
LABEL_4:
    -[HNDHandManager handlePrimaryButtonPress:](self, "handlePrimaryButtonPress:", v5);
    goto LABEL_5;
  }

  if ([v14 isEqualToString:AXAssistiveTouchIconTypeHome])
  {
    -[HNDHandManager handleCustomHomeButtonAction:](self, "handleCustomHomeButtonAction:", v5);
  }

  else if ([v14 isEqualToString:AXAssistiveTouchIconTypeOpenMenu])
  {
    if (-[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode"))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
      -[HNDHandManager endContinuousScrollingOnDisplay:withCompletion:]( self,  "endContinuousScrollingOnDisplay:withCompletion:",  v8,  0LL);
    }

    if ((_DWORD)v5 == 2)
    {
      CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v9));

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rocker]);
      uint64_t v12 = [v11 isFullMenuVisible] ^ 1;

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
      -[HNDHandManager showMenu:onDisplay:](self, "showMenu:onDisplay:", v12, v13);
    }
  }

  else
  {
    -[HNDHandManager performButtonAction:type:state:](self, "performButtonAction:type:state:", v14, v6, v5);
  }

- (void)_reallyLiftFingersUpForPotentialTapViaPrimaryButton
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerController]);
  [v4 liftFingersUpAnimated:1];

  -[HNDHandManager setIsPendingFingerLiftForPrimaryButtonPressUp:]( self,  "setIsPendingFingerLiftForPrimaryButtonPressUp:",  0LL);
}

- (void)_liftFingersUpForPotentialTapViaPrimaryButton
{
  BOOL v3 = -[HNDHandManager isPendingFingerLiftForPrimaryButtonPressUp](self, "isPendingFingerLiftForPrimaryButtonPressUp");
  if (v3)
  {
    uint64_t v5 = ASTLogMouse(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000AEE84();
    }
  }

  -[HNDHandManager setIsPendingFingerLiftForPrimaryButtonPressUp:]( self,  "setIsPendingFingerLiftForPrimaryButtonPressUp:",  0LL);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager previousPrimaryButtonPressDownDate](self, "previousPrimaryButtonPressDownDate"));

  if (v8)
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager previousPrimaryButtonPressDownDate](self, "previousPrimaryButtonPressDownDate"));
    [v7 timeIntervalSinceDate:v9];
    double v11 = v10;

    if (v11 < 0.1)
    {
      -[HNDHandManager setIsPendingFingerLiftForPrimaryButtonPressUp:]( self,  "setIsPendingFingerLiftForPrimaryButtonPressUp:",  1LL);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10002136C;
      v13[3] = &unk_100121D18;
      v13[4] = self;
      AXPerformBlockOnMainThreadAfterDelay(v13, v12, 0.1 - v11);
    }
  }

  if (!-[HNDHandManager isPendingFingerLiftForPrimaryButtonPressUp](self, "isPendingFingerLiftForPrimaryButtonPressUp")) {
    -[HNDHandManager _reallyLiftFingersUpForPotentialTapViaPrimaryButton]( self,  "_reallyLiftFingersUpForPotentialTapViaPrimaryButton");
  }
}

- (void)handlePrimaryButtonPress:(int)a3
{
  if (-[HNDHandManager isPendingFingerLiftForPrimaryButtonPressUp](self, "isPendingFingerLiftForPrimaryButtonPressUp")) {
    -[HNDHandManager _reallyLiftFingersUpForPotentialTapViaPrimaryButton]( self,  "_reallyLiftFingersUpForPotentialTapViaPrimaryButton");
  }
  id v26 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
  if (a3 == 3)
  {
    if (-[HNDHandManager inPinchMode](self, "inPinchMode"))
    {
      if (self->_pinchState == 1)
      {
        self->_pinchState = 2LL;
        goto LABEL_29;
      }

      self->_pinchState = 0LL;
      if (-[HNDHandManager dwellControlEnabled](self, "dwellControlEnabled"))
      {
        [v5 updateNubbitForegroundImageForAction:AXAssistiveTouchIconTypeDwellClick];
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
        [v10 liftFingersUpAnimated:0];

        double v11 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
        [v11 midpointForFingers];
        double v13 = v12;
        double v15 = v14;

        -[HNDHandManager removeFingersToPoint:onDisplay:](self, "removeFingersToPoint:onDisplay:", v26, v13, v15);
        -[HNDHandManager resetFingersToPoint:onDisplay:active:]( self,  "resetFingersToPoint:onDisplay:active:",  v26,  1LL,  v13,  v15);
      }

      else
      {
        -[HNDHandManager resetPinchFingersOnDisplay:](self, "resetPinchFingersOnDisplay:", v26);
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v5 fingerController]);
        [v22 liftFingersUpAnimated:1];
      }
    }

    else if (!-[HNDHandManager inDragMode](self, "inDragMode"))
    {
      -[HNDHandManager _liftFingersUpForPotentialTapViaPrimaryButton]( self,  "_liftFingersUpForPotentialTapViaPrimaryButton");
    }

    if (-[HNDHandManager dwellControlEnabled](self, "dwellControlEnabled")
      && ([v5 isMenuVisible] & 1) == 0
      && !-[HNDHandManager inDragMode](self, "inDragMode"))
    {
      -[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode");
    }

    -[HNDHandManager _resetMenuOpenTracker](self, "_resetMenuOpenTracker");
    self->_BOOL primaryButtonDown = 0;
  }

  else if (a3 == 2)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXOutputManager sharedOutputManager](&OBJC_CLASS___AXOutputManager, "sharedOutputManager"));
    [v7 playMouseClickSound];

    if (!self->_hotCornerLocked)
    {
      if (-[HNDHandManager inCustomGesture](self, "inCustomGesture"))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager currentHardwareIdentifierForPointer]( self,  "currentHardwareIdentifierForPointer"));
        -[HNDHandManager _performCustomGestureOnDisplay:](self, "_performCustomGestureOnDisplay:", v8);
      }

      else
      {
        if (!-[HNDHandManager inPinchMode](self, "inPinchMode"))
        {
          if (!-[HNDHandManager inDragMode](self, "inDragMode"))
          {
            if (-[HNDHandManager inContinuousScrollMode](self, "inContinuousScrollMode")) {
              -[HNDHandManager endContinuousScrollingOnDisplay:withCompletion:]( self,  "endContinuousScrollingOnDisplay:withCompletion:",  v26,  0LL);
            }
            else {
              [v6 pressFingersDownAnimated:1];
            }
          }

          goto LABEL_8;
        }

        if (self->_pinchState == 2) {
          goto LABEL_29;
        }
        CGRect v16 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerModels]);
        id v17 = [v16 count];

        if (v17 != (id)2) {
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDHandManager.m",  6335LL,  "-[HNDHandManager handlePrimaryButtonPress:]",  @"Pinch should only use 2 fingers.");
        }
        CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerModels]);
        id v19 = [v18 count];

        if (v19 != (id)2) {
          goto LABEL_8;
        }
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerModels]);
        double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndexedSubscript:0]);
        [v21 location];
        if (-[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v26))
        {
        }

        else
        {
          double v23 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerModels]);
          double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:1]);
          [v24 location];
          unsigned int v25 = -[HNDHandManager _isInNubbitHitbox:onDisplay:](self, "_isInNubbitHitbox:onDisplay:", v26);

          if (!v25)
          {
            -[HNDHandManager setCaptureEvents:](self, "setCaptureEvents:", 1LL);
            [v6 pressFingersDownAnimated:1];
            self->_pinchState = 1LL;
            goto LABEL_8;
          }
        }

        -[HNDHandManager showMenu:onDisplay:](self, "showMenu:onDisplay:", 1LL, v26);
      }

- (void)handleMultiTouchStandard:(int64_t)a3 onDisplay:(id)a4 withExistingFingerMidPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  self->_inMultiFingerGesture = 1;
  -[HNDHandManager showMenu:onDisplay:](self, "showMenu:onDisplay:", 0LL, v9);
  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v9));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerController]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fingerContainerView]);
  [v12 bounds];
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerUtilities defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:]( &OBJC_CLASS___AXPIFingerUtilities,  "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:",  a3,  x,  y,  v13,  v14,  v15,  v16));

  double v18 = CGPointZero.y;
  if (x == CGPointZero.x && y == v18)
  {
    double MidpointOfAllPoints = AX_CGPointGetMidpointOfAllPoints(v17);
    double v24 = v23;
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerController]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 fingerContainerView]);
    double Center = AX_CGRectGetCenter([v26 bounds]);
    double v29 = v28;

    double width = Center - MidpointOfAllPoints;
    double height = v29 - v24;
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v17 count]));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v31 = v17;
  id v32 = [v31 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v40;
    do
    {
      double v35 = 0LL;
      do
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(v31);
        }
        CGPoint v36 = CGPointFromString((NSString *)*(void *)(*((void *)&v39 + 1) + 8LL * (void)v35));
        double v37 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerModel fingerModelForLocation:]( &OBJC_CLASS___AXPIFingerModel,  "fingerModelForLocation:",  width + v36.x,  height + v36.y,  (void)v39));
        [v30 addObject:v37];

        double v35 = (char *)v35 + 1;
      }

      while (v33 != v35);
      id v33 = [v31 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v33);
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerController]);
  objc_msgSend(v38, "showFingerModels:animated:startPointForAnimation:", v30, 1, CGPointZero.x, v18);

  [v10 setMultiTouchToolBackgroundEnabled:1];
}

- (void)prepareScrollAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  id v16 = (id)objc_claimAutoreleasedReturnValue( -[HNDHandManager _scrollFallbackGestureAtPoint:onDisplay:vertical:forward:max:]( self,  "_scrollFallbackGestureAtPoint:onDisplay:vertical:forward:max:",  v13,  v9,  v8,  v7,  x,  y));
  -[HNDHandManager prepareGesture:onDisplay:](self, "prepareGesture:onDisplay:");

  if (v9 && v7)
  {
    if (v8) {
      int v14 = 2031;
    }
    else {
      int v14 = 2030;
    }
  }

  else
  {
    if (v8) {
      int v14 = 2009;
    }
    else {
      int v14 = 2008;
    }
    if (v8) {
      int v15 = 2006;
    }
    else {
      int v15 = 2007;
    }
    if (v9) {
      int v14 = v15;
    }
  }

  self->_preparedScrollAction = v14;
}

- (BOOL)_performAXScrollActionAtPoint:(CGPoint)a3 onDisplay:(id)a4 action:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  if (self->_shouldSkipElementFetchForAXScroll)
  {
    BOOL v10 = 0;
  }

  else
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100021D1C;
    v38[3] = &unk_100122640;
    int v39 = v5;
    double v11 = objc_retainBlock(v38);
    uint64_t v34 = 0LL;
    double v35 = &v34;
    uint64_t v36 = 0x2020000000LL;
    char v37 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100021E04;
    v28[3] = &unk_100122668;
    id v31 = &v34;
    id v13 = v11;
    id v30 = v13;
    CGFloat v32 = x;
    CGFloat v33 = y;
    int v14 = v12;
    double v29 = v14;
    dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0LL, v28);
    if (qword_100157638 != -1) {
      dispatch_once(&qword_100157638, &stru_100122688);
    }
    id v16 = (dispatch_queue_s *)(id)qword_100157630;
    dispatch_async(v16, v15);
    dispatch_time_t v17 = dispatch_time(0LL, 100000000LL);
    if (dispatch_semaphore_wait(v14, v17))
    {
      dispatch_block_cancel(v15);
      self->_shouldSkipElementFetchForAXScroll = 1;
      uint64_t v19 = ASTLogCommon(v18);
      double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000AEEB0(v5, v20, v21, v22, v23, v24, v25, v26);
      }
    }

    BOOL v10 = *((_BYTE *)v35 + 24) != 0;

    _Block_object_dispose(&v34, 8);
  }

  return v10;
}

- (double)_scrollDeltaForGesture:(BOOL)a3 screenSize:(CGSize)a4
{
  if (a3) {
    a4.double width = a4.height;
  }
  return a4.width * 0.75;
}

- (id)_scrollFallbackGestureAtPoint:(CGPoint)a3 onDisplay:(id)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  a4));
  [v13 screenBounds];
  double v15 = v14;
  -[HNDHandManager _scrollDeltaForGesture:screenSize:](self, "_scrollDeltaForGesture:screenSize:", v9, v14, v16);
  if (v8) {
    double v17 = -v17;
  }
  if (v9) {
    double v18 = 0.0;
  }
  else {
    double v18 = v17;
  }
  double v19 = x + v18;
  if (v9) {
    double v20 = v17;
  }
  else {
    double v20 = 0.0;
  }
  id v21 = [v13 orientation];
  int v22 = (int)v21;
  if (((AXDeviceIsPhone(v21) & 1) != 0 || AXDeviceIsPod()) && !v9)
  {
    double v23 = 0.0;
    if (v8) {
      double v23 = v15;
    }
    if (v22 == 2) {
      double v19 = v23;
    }
  }

  double v24 = y + v20;
  if (v9 && v7) {
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "flickGestureStartingAtPoint:endingAtPoint:numberOfFingers:",  1LL,  x,  y,  v19,  v24));
  }
  else {
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture scrollGestureFromPoint:toPoint:duration:]( &OBJC_CLASS___AXNamedReplayableGesture,  "scrollGestureFromPoint:toPoint:duration:",  x,  y,  v19,  v24,  0.5));
  }
  uint64_t v26 = (void *)v25;

  return v26;
}

- (void)startPinchModeWithPoint:(CGPoint)a3 onDisplay:(id)a4 mode:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  self->_unint64_t pinchMode = a5;
  id v8 = a4;
  -[HNDHandManager showMenu:onDisplay:](self, "showMenu:onDisplay:", 0LL, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", v8));

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerController]);
  objc_msgSend(v9, "showPinchFingersAnimated:midpoint:", 0, x, y);

  [v10 setMultiTouchToolBackgroundEnabled:1];
}

- (void)notifyUserEventOccurred
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
  [v2 notifyUserEventOccurred];
}

- (void)menuExitedOnDisplay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
  [v5 manipulateDimTimer:0];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", v4));
  [v6 showMenu:0];
}

- (BOOL)canShowASTMousePointer
{
  return 0;
}

- (BOOL)isFingersPressedDown
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000221D0;
  v4[3] = &unk_100122498;
  void v4[4] = &v5;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v4);
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)resetFingersIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100022348;
  v2[3] = &unk_100121CB0;
  v2[4] = self;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v2);
}

- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4
{
}

- (void)resetFingersToPoint:(CGPoint)a3 onDisplay:(id)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  a4));
  id v10 = v9;
  if (x == -1.0 && y == -1.0)
  {
    [v9 screenPoint];
    double x = v12;
    double y = v13;
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerController]);
  objc_msgSend(v14, "clearAllFingersAnimated:endPointForAnimation:", 1, x, y);

  self->_BOOL primaryButtonDown = 0;
  if (-[HNDHandManager canShowASTMousePointer](self, "canShowASTMousePointer"))
  {
    [v10 setFingerContentViewIsActive:v5];
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v10 fingerController]);
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXPIFingerModel fingerModelForLocation:]( &OBJC_CLASS___AXPIFingerModel,  "fingerModelForLocation:",  x,  y));
    double v18 = v16;
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    objc_msgSend(v15, "showFingerModels:animated:startPointForAnimation:", v17, 1, x, y);

    objc_msgSend(v10, "updateWithPrimaryFingerPoint:", x, y);
  }

  [v10 setMultiTouchToolBackgroundEnabled:0];
}

- (void)removeFingersToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  a4));
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerController]);
  objc_msgSend(v8, "clearAllFingersAnimated:endPointForAnimation:", 1, x, y);

  self->_BOOL primaryButtonDown = 0;
}

- (void)reloadFingerAppearance
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000225BC;
  v2[3] = &unk_100121CB0;
  v2[4] = self;
  -[HNDHandManager enumerateDisplayManagersWithBlock:](self, "enumerateDisplayManagersWithBlock:", v2);
}

- (CGPoint)preferredMenuDisplayPointOnDisplay:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager deviceManager](self, "deviceManager"));
  id v6 = [v5 deviceCount];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v4));
    char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerController]);
    if ([v8 numberOfFingers])
    {
      unsigned __int8 v9 = [v7 fingerContentViewIsActive];

      if ((v9 & 1) != 0)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerController]);
        [v10 hndMenuPointForFingerLayout];
        CGFloat x = v11;
        CGFloat y = v13;

LABEL_8:
        goto LABEL_9;
      }
    }

    else
    {
    }

    CGFloat x = CGPointZero.x;
    CGFloat y = CGPointZero.y;
    goto LABEL_8;
  }

  CGFloat x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
LABEL_9:

  double v15 = x;
  double v16 = y;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

- (void)performButtonAction:(id)a3 type:(int)a4 state:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentDisplayManager](self, "currentDisplayManager"));
  unsigned __int8 v9 = v8;
  if (self->_primaryButtonDown)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 fingerController]);
    [v10 liftFingersUpAnimated:1];

    self->_BOOL primaryButtonDown = 0;
  }

  if ((_DWORD)v5 == 2) {
    [v9 activateAssistiveTouchAction:v11 fromButtonPress:1];
  }
  else {
    [v9 performPress:v5 type:v6];
  }
}

- (void)handleCustomHomeButtonAction:(int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  id v5 = v4;
  if (a3 == 2) {
    [v4 pressHomeButtonDown];
  }
  else {
    [v4 liftHomeButtonUp];
  }
}

- (void)rotateEventToOrientation:(id)a3
{
  id v4 = a3;
  int orientation = self->_orientation;
  switch(orientation)
  {
    case 4:
      id v13 = v4;
      [v4 deltaY];
      double v8 = v9;
      [v13 deltaX];
      double v11 = -v10;
LABEL_7:
      [v13 setDeltaY:v11];
      goto LABEL_8;
    case 3:
      id v13 = v4;
      [v4 deltaY];
      double v8 = -v12;
      [v13 deltaX];
      goto LABEL_7;
    case 2:
      id v13 = v4;
      [v4 deltaY];
      [v13 setDeltaY:-v6];
      [v13 deltaX];
      double v8 = -v7;
LABEL_8:
      [v13 setDeltaX:v8];
      id v4 = v13;
      break;
  }
}

- (double)volumeLevel
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
  [v2 volumeLevel];
  double v4 = v3;

  return v4;
}

- (BOOL)isVoiceControlRunning
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager eventManager](self, "eventManager"));
  unsigned __int8 v3 = [v2 isVoiceControlRunning];

  return v3;
}

- (void)volumeChanged
{
}

- (void)didFailToPinApp
{
}

- (void)didFailToFloatApp
{
}

- (CGPoint)rotateNormalizedPointToOrientation:(CGPoint)result
{
  int orientation = self->_orientation;
  if (orientation == 4)
  {
    double y = result.y;
    result.double y = result.x;
  }

  else if (orientation == 3)
  {
    double y = result.y;
    result.double y = 1.0 - result.x;
  }

  else
  {
    double y = result.x;
    if (orientation == 2)
    {
      result.double y = 1.0 - result.y;
      double y = 1.0 - result.x;
    }
  }

  double v5 = y;
  result.CGFloat x = v5;
  return result;
}

- (CGPoint)rotateEventFromOrientation:(CGPoint)a3
{
  double x = a3.x;
  int orientation = self->_orientation;
  double v5 = -a3.y;
  if (orientation != 4)
  {
    double v6 = -x;
    if (orientation == 2)
    {
      double x = -x;
      double y = -a3.y;
    }

    else
    {
      double y = a3.y;
    }

    if (orientation == 3) {
      double v5 = a3.y;
    }
    else {
      double v5 = x;
    }
    if (orientation == 3) {
      double x = v6;
    }
    else {
      double x = y;
    }
  }

  double v8 = x;
  result.double y = v8;
  result.double x = v5;
  return result;
}

- (void)showMenu:(BOOL)a3 onDisplay:(id)a4
{
  BOOL v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", a4));
  [v5 showMenu:v4];
}

- (id)fingerController
{
  if (!UIAccessibilityIsSwitchControlRunning()) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDHandManager.m",  7094LL,  "-[HNDHandManager fingerController]",  @"Access to -fingerController is only allowed for Switch Control.");
  }
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager mainDisplayManager](self, "mainDisplayManager"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fingerController]);

  return v4;
}

- (CGPoint)_fingerControllerPointForScreenPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  a4));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fingerController]);

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerContainerView]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 fingerContainerView]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 window]);
  objc_msgSend(v10, "convertPoint:fromWindow:", 0, x, y);
  objc_msgSend(v8, "convertPoint:fromView:", 0);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)performFingerDownAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", v7));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v13 fingerController]);
  -[HNDHandManager _fingerControllerPointForScreenPoint:onDisplay:]( self,  "_fingerControllerPointForScreenPoint:onDisplay:",  v7,  x,  y);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v8, "performDownAtPoint:", v10, v12);
}

- (void)performFingerMoveToPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", v7));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v13 fingerController]);
  -[HNDHandManager _fingerControllerPointForScreenPoint:onDisplay:]( self,  "_fingerControllerPointForScreenPoint:onDisplay:",  v7,  x,  y);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v8, "performMoveToPoint:", v10, v12);
}

- (void)performFingerUpAtPoint:(CGPoint)a3 onDisplay:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagerForHardwareIdentifier:](self, "displayManagerForHardwareIdentifier:", v7));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v13 fingerController]);
  -[HNDHandManager _fingerControllerPointForScreenPoint:onDisplay:]( self,  "_fingerControllerPointForScreenPoint:onDisplay:",  v7,  x,  y);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v8, "performUpAtPoint:", v10, v12);
}

- (CGPoint)startPointForDrag
{
  double x = self->_dragStartPoint.x;
  double y = self->_dragStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isPerformingDragPress
{
  return self->_isPerformingDragPressEvent;
}

- (HNDDisplayManager)mainDisplayManager
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagers](self, "displayManagers"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 axFirstObjectsUsingBlock:&stru_100122768]);

  return (HNDDisplayManager *)v3;
}

- (HNDDisplayManager)currentDisplayManager
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager currentHardwareIdentifierForPointer](self, "currentHardwareIdentifierForPointer"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[HNDHandManager displayManagerForHardwareIdentifier:]( self,  "displayManagerForHardwareIdentifier:",  v3));

  return (HNDDisplayManager *)v4;
}

- (id)displayManagerForHardwareIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagers](self, "displayManagers"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100022F18;
  v12[3] = &unk_100122790;
  id v13 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 axFirstObjectsUsingBlock:v12]);
  double v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[HNDHandManager mainDisplayManager](self, "mainDisplayManager"));
  }
  double v10 = v9;

  return v10;
}

- (void)enumerateDisplayManagersWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagers](self, "displayManagers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100022FE8;
  v7[3] = &unk_1001227B8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (id)displayManagerForDisplayId:(unsigned int)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDHandManager displayManagers](self, "displayManagers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002306C;
  v7[3] = &unk_1001227D8;
  unsigned int v8 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 axFirstObjectsUsingBlock:v7]);

  return v5;
}

- (double)touchSpeed
{
  return self->_touchSpeed;
}

- (void)setTouchSpeed:(double)a3
{
  self->_double touchSpeed = a3;
}

- (BOOL)openMenuWithSwaggle
{
  return self->_openMenuWithSwaggle;
}

- (void)setOpenMenuWithSwaggle:(BOOL)a3
{
  self->_openMenuWithSwaggle = a3;
}

- (NSArray)customGestures
{
  return self->_customGestures;
}

- (void)setCustomGestures:(id)a3
{
}

- (NSPointerArray)eventHandlers
{
  return self->_eventHandlers;
}

- (void)setEventHandlers:(id)a3
{
}

- (HNDEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (HNDDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (NSMutableArray)displayManagers
{
  return self->_displayManagers;
}

- (void)setDisplayManagers:(id)a3
{
}

- (NSArray)horizontalContinuousScrollers
{
  return self->_horizontalContinuousScrollers;
}

- (void)setHorizontalContinuousScrollers:(id)a3
{
}

- (NSArray)verticalContinuousScrollers
{
  return self->_verticalContinuousScrollers;
}

- (void)setVerticalContinuousScrollers:(id)a3
{
}

- (BOOL)alwaysShowMenu
{
  return self->_alwaysShowMenu;
}

- (BOOL)voiceControl
{
  return self->_voiceControl;
}

- (void)setVoiceControl:(BOOL)a3
{
  self->_voiceControl = a3;
}

- (BOOL)assistiveTouchMouseDwellControlEnabled
{
  return self->_assistiveTouchMouseDwellControlEnabled;
}

- (void)setAssistiveTouchMouseDwellControlEnabled:(BOOL)a3
{
  self->_assistiveTouchMouseDwellControlEnabled = a3;
}

- (NSDate)previousPrimaryButtonPressDownDate
{
  return self->_previousPrimaryButtonPressDownDate;
}

- (void)setPreviousPrimaryButtonPressDownDate:(id)a3
{
  self->_previousPrimaryButtonPressDownDate = (NSDate *)a3;
}

- (BOOL)isPendingFingerLiftForPrimaryButtonPressUp
{
  return self->_isPendingFingerLiftForPrimaryButtonPressUp;
}

- (void)setIsPendingFingerLiftForPrimaryButtonPressUp:(BOOL)a3
{
  self->_isPendingFingerLiftForPrimaryButtonPressUp = a3;
}

- (unint64_t)continuousScrollMode
{
  return self->_continuousScrollMode;
}

- (void)setContinuousScrollMode:(unint64_t)a3
{
  self->_unint64_t continuousScrollMode = a3;
}

- (NSNumber)currentContinuousScrollDirection
{
  return self->_currentContinuousScrollDirection;
}

- (void)setCurrentContinuousScrollDirection:(id)a3
{
}

- (unint64_t)lastTimeElementFetcherRefreshed
{
  return self->_lastTimeElementFetcherRefreshed;
}

- (void)setLastTimeElementFetcherRefreshed:(unint64_t)a3
{
  self->_lastTimeElementFetcherRefreshed = a3;
}

- (BOOL)isActivelyScrollingContinuously
{
  return self->_isActivelyScrollingContinuously;
}

- (void)setIsActivelyScrollingContinuously:(BOOL)a3
{
  self->_isActivelyScrollingContinuousldouble y = a3;
}

- (BOOL)scrollingBlockedOnElementRefresh
{
  return self->_scrollingBlockedOnElementRefresh;
}

- (void)setScrollingBlockedOnElementRefresh:(BOOL)a3
{
  self->_scrollingBlockedOnElementRefresh = a3;
}

- (OS_dispatch_queue)continuousScrollerGenerationQueue
{
  return self->_continuousScrollerGenerationQueue;
}

- (void)setContinuousScrollerGenerationQueue:(id)a3
{
}

- (os_unfair_lock_s)continuousScrollLock
{
  return self->_continuousScrollLock;
}

- (void)setContinuousScrollLock:(os_unfair_lock_s)a3
{
  self->_continuousScrollLock = a3;
}

- (AXElement)continuousScrollPickedElement
{
  return self->_continuousScrollPickedElement;
}

- (void)setContinuousScrollPickedElement:(id)a3
{
}

- (double)continuousScrollCurrentSpeedFactor
{
  return self->_continuousScrollCurrentSpeedFactor;
}

- (void)setContinuousScrollCurrentSpeedFactor:(double)a3
{
  self->_continuousScrollCurrentSpeedFactor = a3;
}

- (HNDContinuousScroller)activeContinuousScroller
{
  return self->_activeContinuousScroller;
}

- (void)setActiveContinuousScroller:(id)a3
{
}

- (AXElementFetcher)elementFetcher
{
  return self->_elementFetcher;
}

- (void)setElementFetcher:(id)a3
{
}

- (AXUpdateElementVisualsCoalescer)updateElementVisualsCoalescer
{
  return self->_updateElementVisualsCoalescer;
}

- (void)setUpdateElementVisualsCoalescer:(id)a3
{
}

- (BOOL)isDwellActionPendingButtonUp
{
  return self->_isDwellActionPendingButtonUp;
}

- (void)setIsDwellActionPendingButtonUp:(BOOL)a3
{
  self->_isDwellActionPendingButtonUp = a3;
}

- (void).cxx_destruct
{
}

- (double)screenFrame:(uint64_t)a1
{
  uint64_t IsPad = AXDeviceIsPad(a1, a2);
  if ((IsPad & 1) != 0 || AXDeviceIsPhone(IsPad))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
    id v4 = [v3 orientation];

    if (!v4) {
      return CGRectZero.origin.x;
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 _referenceBounds];
  double v7 = v6;

  return v7;
}

@end