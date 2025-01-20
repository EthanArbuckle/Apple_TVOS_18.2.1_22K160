@interface HNDDisplayManager
+ (double)fadeDuration;
- (AXDispatchTimer)presentHUDViewTimer;
- (AXPIFingerController)fingerController;
- (AXUIClient)userInterfaceClient;
- (BOOL)_nubbitIsOverKeyboard:(CGRect)a3;
- (BOOL)_position:(CGPoint)a3 isOverKeyboard:(CGRect)a4;
- (BOOL)_shouldSetFingerContentViewToActive:(BOOL)a3;
- (BOOL)_shouldShowLargeContentViewer;
- (BOOL)alwaysShowMenu;
- (BOOL)assistiveTouchMousePointerTimeoutEnabled;
- (BOOL)fingerContentViewIsActive;
- (BOOL)handleRealEvent:(id)a3;
- (BOOL)hoverMovedToNormalizedPoint:(CGPoint)a3 shouldUpdateCurrentPoint:(BOOL)a4;
- (BOOL)inNubbitMode;
- (BOOL)initialDownMenuCanTransitionToPressDown;
- (BOOL)initialMenuDownHasFinished;
- (BOOL)isCurrentOrientationLandscape;
- (BOOL)isMainDisplay;
- (BOOL)isMenuVisible;
- (BOOL)multiTouchToolBackgroundEnabled;
- (BOOL)playedHapticForCurrentEvent;
- (BOOL)shouldDelayBeforePresentingHUDView;
- (BOOL)showingHoverOverMenu;
- (BOOL)userInteractionEnabledOnRockerDismissView;
- (BOOL)visualsHidden;
- (CGAffineTransform)_transformForOrientation;
- (CGPoint)_layoutPointForPoint:(CGPoint)a3 screenBounds:(CGRect)a4;
- (CGPoint)_menuPointForFingerLayout;
- (CGPoint)_nubbitPointForEdgePosition;
- (CGPoint)_nubbitPositionForKeyboardFrame:(CGRect)a3;
- (CGPoint)_rotatedNormalizedInitialPoint;
- (CGPoint)_testingRockerPosition;
- (CGPoint)_validateNubbitPosition:(CGPoint)a3 forKeyboard:(BOOL)a4;
- (CGPoint)closestNubbitPositionForPoint:(CGPoint)a3 offsetByMidpoint:(BOOL)a4;
- (CGPoint)convertPoint:(CGPoint)a3 fromOrientation:(int)a4;
- (CGPoint)convertPointToIntefaceOrientation:(CGPoint)a3;
- (CGPoint)convertPointToPortraitUpOrientation:(CGPoint)a3;
- (CGPoint)convertToNormalizedInterfaceOrientation:(CGPoint)a3;
- (CGPoint)normalizedPointForDifference:(CGPoint)a3;
- (CGPoint)nubbitPositionForFlick:(CGPoint)a3;
- (CGPoint)point;
- (CGPoint)screenPoint;
- (CGRect)convertFrameToInterfaceOrientation:(CGRect)a3;
- (CGRect)orientedContinuousScrollViewFrameForScrollViewFrame:(CGRect)a3;
- (CGRect)portraitUpScreenBounds;
- (CGRect)rockerFrame;
- (CGRect)screenBounds;
- (CGRect)screenBoundsForRockerButton:(id)a3;
- (HNDDisplayManager)init;
- (HNDDisplayManager)initWithWindow:(id)a3 ignoredWindow:(id)a4;
- (HNDHandManager)handManager;
- (NSMutableSet)userInterfaceClientEnablers;
- (NSString)hardwareIdentifier;
- (NSString)reachabilityHandlerIdentifier;
- (UIAccessibilityHUDView)hudView;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)fingerContainerView;
- (UIView)scannerBackCursorView;
- (UIView)scannerContentView;
- (UIView)scannerFrontCursorView;
- (double)_currentRockerTranslateY;
- (double)_iconScaleForForce:(double)a3;
- (double)_idleTime;
- (double)_rotationDegreesForOrientation:(int)a3;
- (double)_xNubbitPadding:(double)a3 x:(double)a4;
- (double)_yNubbitPadding:(double)a3 y:(double)a4;
- (double)assistiveTouchMouseDwellControlActivationTimeout;
- (double)assistiveTouchMousePointerTimeout;
- (double)lastMenuInteractionTime;
- (double)reachabilityOffset;
- (id)_itemForButton:(id)a3;
- (id)ignoredWindow;
- (id)rocker;
- (id)viewAtDisplayPoint:(CGPoint)a3;
- (id)viewAtDisplayPoint:(CGPoint)a3 downPoint:(CGPoint *)a4 window:(id)a5;
- (id)window;
- (int)_angleForDegrees:(double)a3;
- (int)orientation;
- (unsigned)displayID;
- (void)_cleanupUserInterfaceClient;
- (void)_deviceCountChanged:(id)a3;
- (void)_handleNubbitMove:(CGPoint)a3 event:(id)a4;
- (void)_hideLargeContentViewerIfNeeded;
- (void)_idleTimerFired;
- (void)_layoutHUDView:(id)a3 withinBounds:(CGRect)a4;
- (void)_longIdleTimerFired;
- (void)_moveNubbitForKeyboard:(CGRect)a3;
- (void)_moveNubbitToPosition:(CGPoint)a3;
- (void)_moveNubbitToPosition:(CGPoint)a3 forKeyboard:(BOOL)a4;
- (void)_presentLargeContentViewerForHUDItem:(id)a3 inContentView:(id)a4;
- (void)_repositionNubbitAfterLift:(CGPoint)a3;
- (void)_resetCurrentPointToInitialPoint;
- (void)_resetReachabilityOffset;
- (void)_setupUserInterfaceClient;
- (void)_startIdleTimer;
- (void)_updateLargeContentViewerIfNeededForView:(id)a3;
- (void)_updateNubbitEdgePosition:(CGPoint)a3;
- (void)_updateNubbitPosition;
- (void)_updateRockerReachability;
- (void)_updateSpeakScreenStatus;
- (void)_updateViewsForOrientation;
- (void)activateAssistiveTouchAction:(id)a3 fromButtonPress:(BOOL)a4;
- (void)activateDisplayItems;
- (void)addUserInterfaceClientEnabler:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)deviceCountChanged:(int64_t)a3;
- (void)didFailToFloatApp;
- (void)didFailToPinApp;
- (void)initializeDisplay;
- (void)initializeDisplayWithCompletion:(id)a3;
- (void)initializeScreenBounds;
- (void)initializeWindowsIfNecessary;
- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4;
- (void)moveNubbitToPoint:(CGPoint)a3;
- (void)performPress:(int)a3 type:(int)a4;
- (void)placeNubbitAtBottomCenter;
- (void)removeUserInterfaceClientEnabler:(id)a3;
- (void)resetNubbitLocation;
- (void)restartWithCompletion:(id)a3;
- (void)setAlwaysShowMenu:(BOOL)a3;
- (void)setAssistiveTouchMouseDwellControlActivationTimeout:(double)a3;
- (void)setAssistiveTouchMousePointerTimeout:(double)a3;
- (void)setAssistiveTouchMousePointerTimeoutEnabled:(BOOL)a3;
- (void)setFingerContainerView:(id)a3;
- (void)setFingerContentViewIsActive:(BOOL)a3;
- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4;
- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5;
- (void)setFingerController:(id)a3;
- (void)setHandManager:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setHudView:(id)a3;
- (void)setIsMainDisplay:(BOOL)a3;
- (void)setLastMenuInteractionTime:(double)a3;
- (void)setMultiTouchToolBackgroundEnabled:(BOOL)a3;
- (void)setNubbitMoving:(BOOL)a3;
- (void)setOrientation:(int)a3 withCompletion:(id)a4;
- (void)setPlayedHapticForCurrentEvent:(BOOL)a3;
- (void)setPresentHUDViewTimer:(id)a3;
- (void)setReachabilityHandlerIdentifier:(id)a3;
- (void)setReachabilityOffset:(double)a3;
- (void)setShouldDelayBeforePresentingHUDView:(BOOL)a3;
- (void)setShowingHoverOverMenu:(BOOL)a3;
- (void)setUserInterfaceClient:(id)a3;
- (void)setUserInterfaceClientEnablers:(id)a3;
- (void)setVisualsHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5;
- (void)showCircleMenu:(BOOL)a3;
- (void)showMenu:(BOOL)a3;
- (void)showSimpleAlertWithText:(id)a3;
- (void)showSimpleBannerWithTitle:(id)a3 text:(id)a4;
- (void)updateMenuStyle;
- (void)updateNubbitForegroundImageForAction:(id)a3;
- (void)updateRingerSwitch;
- (void)updateRockersForSubstantialTransition;
- (void)updateRotationLockSwitch;
- (void)updateWithPrimaryFingerPoint:(CGPoint)a3;
- (void)viewOrbActionTriggered:(id)a3;
- (void)viewPressedDown:(id)a3;
- (void)viewPressedUp:(id)a3;
- (void)volumeChanged;
@end

@implementation HNDDisplayManager

+ (double)fadeDuration
{
  return 0.25;
}

- (HNDDisplayManager)init
{
  return -[HNDDisplayManager initWithWindow:ignoredWindow:](self, "initWithWindow:ignoredWindow:", 0LL, 0LL);
}

- (HNDDisplayManager)initWithWindow:(id)a3 ignoredWindow:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___HNDDisplayManager;
  v9 = -[HNDDisplayManager init](&v56, "init");
  objc_storeStrong((id *)&v9->_window, a3);
  objc_storeStrong((id *)&v9->_ignoredWindow, a4);
  v10 = (AXDispatchTimer *)[objc_allocWithZone(AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  idleTimer = v9->_idleTimer;
  v9->_idleTimer = v10;

  v12 = (AXDispatchTimer *)[objc_allocWithZone(AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  longIdleTimer = v9->_longIdleTimer;
  v9->_longIdleTimer = v12;

  v9->_orientation = 0;
  v14 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
  positionSetTimer = v9->_positionSetTimer;
  v9->_positionSetTimer = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 preferenceForKey:@"NubbitPositionPercentage"]);
  [v17 doubleValue];
  v9->_nubbitPositionPercentage = v18;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[HNDDefaults sharedDefaults](&OBJC_CLASS___HNDDefaults, "sharedDefaults"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 preferenceForKey:@"NubbitPositionEdge"]);
  v9->_nubbitPositionEdge = [v20 intValue];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 assistiveTouchOrbAction]);
  v9->_orbActionExists = v22 != 0LL;

  objc_initWeak(&location, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_10000FD34;
  v53[3] = &unk_100121EE8;
  objc_copyWeak(&v54, &location);
  [v23 registerUpdateBlock:v53 forRetrieveSelector:"assistiveTouchOrbAction" withListener:v9];

  objc_destroyWeak(&v54);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10000FDB0;
  v51[3] = &unk_100121EE8;
  objc_copyWeak(&v52, &location);
  [v24 registerUpdateBlock:v51 forRetrieveSelector:"assistiveTouchSingleTapAction" withListener:v9];

  objc_destroyWeak(&v52);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10000FDDC;
  v49[3] = &unk_100121EE8;
  objc_copyWeak(&v50, &location);
  [v25 registerUpdateBlock:v49 forRetrieveSelector:"assistiveTouchDoubleTapAction" withListener:v9];

  objc_destroyWeak(&v50);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10000FE08;
  v47[3] = &unk_100121EE8;
  objc_copyWeak(&v48, &location);
  [v26 registerUpdateBlock:v47 forRetrieveSelector:"assistiveTouchLongPressAction" withListener:v9];

  objc_destroyWeak(&v48);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v42 = _NSConcreteStackBlock;
  uint64_t v43 = 3221225472LL;
  v44 = sub_10000FE34;
  v45 = &unk_100121EE8;
  objc_copyWeak(&v46, &location);
  [v27 registerUpdateBlock:&v42 forRetrieveSelector:"assistiveTouchMainScreenCustomization" withListener:v9];

  objc_destroyWeak(&v46);
  v28 = objc_alloc(&OBJC_CLASS___AXDispatchTimer);
  v29 = -[AXDispatchTimer initWithTargetSerialQueue:]( v28,  "initWithTargetSerialQueue:",  &_dispatch_main_q,  v42,  v43,  v44,  v45);
  longPressTimer = v9->_longPressTimer;
  v9->_longPressTimer = v29;

  v31 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
  doubleTapTimer = v9->_doubleTapTimer;
  v9->_doubleTapTimer = v31;

  -[HNDDisplayManager _updateSpeakScreenStatus](v9, "_updateSpeakScreenStatus");
  v33 = objc_alloc(&OBJC_CLASS___AXPIFingerController);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v7 screen]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 displayConfiguration]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 hardwareIdentifier]);
  v37 = -[AXPIFingerController initWithDisplayUUID:](v33, "initWithDisplayUUID:", v36);
  fingerController = v9->_fingerController;
  v9->_fingerController = v37;

  uint64_t v39 = objc_claimAutoreleasedReturnValue(-[AXPIFingerController fingerContainerView](v9->_fingerController, "fingerContainerView"));
  fingerContainerView = v9->_fingerContainerView;
  v9->_fingerContainerView = (UIView *)v39;

  objc_destroyWeak(&location);
  return v9;
}

- (void)_updateSpeakScreenStatus
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 assistiveTouchOrbAction]);
  uint64_t v4 = AXAssistiveTouchIconTypeSpeakScreen;
  if (([v3 isEqualToString:AXAssistiveTouchIconTypeSpeakScreen] & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assistiveTouchSingleTapAction]);
    if (([v6 isEqualToString:v4] & 1) == 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assistiveTouchDoubleTapAction]);
      if (([v8 isEqualToString:v4] & 1) == 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assistiveTouchLongPressAction]);
        if (([v10 isEqualToString:v4] & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          double v18 = v9;
          v14 = (void *)objc_claimAutoreleasedReturnValue([v17 assistiveTouchMainScreenCustomization]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allValues]);
          unsigned __int8 v16 = [v15 containsObject:v4];

          if ((v16 & 1) == 0) {
            return;
          }
          goto LABEL_10;
        }
      }
    }
  }

LABEL_10:
  uint64_t v12 = ASTLogCommon(v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Turning on Speak Screen because speak screen action is set to a customized override",  buf,  2u);
  }

  _AXSSetSpeakThisEnabled(1LL);
}

- (void)initializeWindowsIfNecessary
{
  uint64_t v3 = ASTLogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    int v23 = 138412290;
    v24 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "setting up windows from didFinishLaunching %@.",  (uint8_t *)&v23,  0xCu);
  }

  int v6 = _AXSInUnitTestMode();
  ignoredWindow = self->_ignoredWindow;
  if (v6)
  {
    if (!ignoredWindow)
    {
      id v8 = objc_opt_new(&OBJC_CLASS___HNDIgnoredWindow);
      v9 = self->_ignoredWindow;
      self->_ignoredWindow = (UIWindow *)v8;

      -[UIWindow setWindowLevel:](self->_ignoredWindow, "setWindowLevel:", 10000011.0);
      -[UIWindow setHidden:](self->_ignoredWindow, "setHidden:", 0LL);
      v10 = objc_opt_new(&OBJC_CLASS___HNDBlankRootViewController);
      -[UIWindow setRootViewController:](self->_ignoredWindow, "setRootViewController:", v10);
    }

    window = self->_window;
    p_window = (id *)&self->_window;
    if (!window)
    {
      v13 = objc_opt_new(&OBJC_CLASS___HNDWindow);
      id v14 = *p_window;
      id *p_window = v13;
LABEL_12:

      [*p_window makeKeyAndVisible];
      [*p_window setWindowLevel:10000010.0];
      v22 = objc_opt_new(&OBJC_CLASS___HNDBlankRootViewController);
      [*p_window setRootViewController:v22];
    }
  }

  else
  {
    if (!ignoredWindow)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      unsigned __int8 v16 = (UIWindow *)objc_claimAutoreleasedReturnValue( [v15 _windowWithUserInteractionEnabled:0 windowLevel:1 createIfNeeded:@"HNDIgnoredWindow" purposeIdentifier:10000011.0]);
      v17 = self->_ignoredWindow;
      self->_ignoredWindow = v16;

      -[UIWindow setHidden:](self->_ignoredWindow, "setHidden:", 0LL);
      double v18 = objc_opt_new(&OBJC_CLASS___HNDBlankRootViewController);
      -[UIWindow setRootViewController:](self->_ignoredWindow, "setRootViewController:", v18);
    }

    v19 = self->_window;
    p_window = (id *)&self->_window;
    if (!v19)
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
      uint64_t v20 = objc_claimAutoreleasedReturnValue( [v14 _windowWithUserInteractionEnabled:1 windowLevel:1 createIfNeeded:@"HNDWindow" purposeIdentifier:10000010.0]);
      id v21 = *p_window;
      id *p_window = (id)v20;

      goto LABEL_12;
    }
  }

- (void)initializeScreenBounds
{
  v10.origin.x = v3;
  v10.origin.y = v4;
  v10.size.width = v5;
  v10.size.height = v6;
  v9.origin.x = CGRectZero.origin.x;
  v9.origin.y = CGRectZero.origin.y;
  v9.size.width = CGRectZero.size.width;
  v9.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v9, v10))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100010300;
    v8[3] = &unk_100121D18;
    v8[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v8, v7, 0.25);
  }

- (void)initializeDisplay
{
}

- (void)initializeDisplayWithCompletion:(id)a3
{
  CGFloat v5 = (void (**)(void))a3;
  id v6 = -[HNDDisplayManager initializeScreenBounds](self, "initializeScreenBounds");
  uint64_t v8 = _AXSAssistiveTouchScannerEnabled(v6, v7);
  int v9 = v8;
  int v11 = _AXSAssistiveTouchEnabled(v8, v10);
  if (v9 | v11)
  {
    int v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_contentView, "superview"));

    if (v13)
    {
      id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDDisplayManager.m",  549LL,  "-[HNDDisplayManager initializeDisplayWithCompletion:]",  @"We shouldn't be calling in here twice! %@");
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_contentView, "superview", v50));

    if (!v14)
    {
      -[HNDDisplayManager initializeWindowsIfNecessary](self, "initializeWindowsIfNecessary");
      v15 = objc_alloc(&OBJC_CLASS___UIView);
      -[UIWindow bounds](self->_window, "bounds");
      unsigned __int8 v16 = -[UIView initWithFrame:](v15, "initWithFrame:");
      contentView = self->_contentView;
      self->_contentView = v16;

      -[UIView setAccessibilityIgnoresInvertColors:](self->_contentView, "setAccessibilityIgnoresInvertColors:", 1LL);
      -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18LL);
      -[UIWindow addSubview:](self->_window, "addSubview:", self->_contentView);
      double v18 = objc_alloc(&OBJC_CLASS___HNDView);
      -[UIWindow bounds](self->_window, "bounds");
      v19 = -[HNDView initWithFrame:](v18, "initWithFrame:");
      fingerContentView = self->_fingerContentView;
      self->_fingerContentView = v19;

      -[HNDView setInactiveAlpha:](self->_fingerContentView, "setInactiveAlpha:", 0.0);
      -[HNDView setUserInteractionEnabled:](self->_fingerContentView, "setUserInteractionEnabled:", 0LL);
      -[HNDView setAutoresizingMask:](self->_fingerContentView, "setAutoresizingMask:", 18LL);
      -[UIView setAutoresizingMask:](self->_fingerContainerView, "setAutoresizingMask:", 18LL);
      fingerContainerView = self->_fingerContainerView;
      -[UIWindow bounds](self->_window, "bounds");
      -[UIView setFrame:](fingerContainerView, "setFrame:");
      -[HNDView addSubview:](self->_fingerContentView, "addSubview:", self->_fingerContainerView);
      -[UIWindow addSubview:](self->_ignoredWindow, "addSubview:", self->_fingerContentView);
      if (v9
        || (v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance")),
            unsigned int v23 = [v22 assistiveTouchInternalOnlyHiddenNubbitModeEnabled],
            v22,
            v23))
      {
        v25 = objc_alloc(&OBJC_CLASS___UIView);
        -[UIWindow bounds](self->_window, "bounds");
        v26 = -[UIView initWithFrame:](v25, "initWithFrame:");
        scannerFrontCursorView = self->_scannerFrontCursorView;
        self->_scannerFrontCursorView = v26;

        -[UIView setAutoresizingMask:](self->_scannerFrontCursorView, "setAutoresizingMask:", 18LL);
        -[UIWindow addSubview:](self->_ignoredWindow, "addSubview:", self->_scannerFrontCursorView);
        v28 = objc_alloc(&OBJC_CLASS___UIView);
        -[UIWindow bounds](self->_window, "bounds");
        v29 = -[UIView initWithFrame:](v28, "initWithFrame:");
        scannerContentView = self->_scannerContentView;
        self->_scannerContentView = v29;

        -[UIView setAutoresizingMask:](self->_scannerContentView, "setAutoresizingMask:", 18LL);
        -[UIWindow addSubview:](self->_ignoredWindow, "addSubview:", self->_scannerContentView);
        v31 = objc_alloc(&OBJC_CLASS___UIView);
        -[UIWindow bounds](self->_window, "bounds");
        v32 = -[UIView initWithFrame:](v31, "initWithFrame:");
        scannerBackCursorView = self->_scannerBackCursorView;
        self->_scannerBackCursorView = v32;

        -[UIView setAutoresizingMask:](self->_scannerBackCursorView, "setAutoresizingMask:", 18LL);
        -[UIWindow addSubview:](self->_ignoredWindow, "addSubview:", self->_scannerBackCursorView);
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472LL;
        v51[2] = sub_100010858;
        v51[3] = &unk_100121D18;
        void v51[4] = self;
        AXPerformBlockOnMainThreadAfterDelay(v51, v34, 0.1);
      }

      else
      {
        if (self->_rocker)
        {
          uint64_t v37 = ASTLogCommon(v24);
          v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
            sub_1000AEB1C();
          }

          -[HNDRocker removeFromSuperview](self->_rocker, "removeFromSuperview");
        }

        uint64_t v39 = -[HNDRocker initWithFrame:]( objc_alloc(&OBJC_CLASS___HNDRocker),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
        rocker = self->_rocker;
        self->_rocker = v39;

        -[HNDRocker setDisplayManager:](self->_rocker, "setDisplayManager:", self);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
        -[HNDRocker setHardwareIdentifier:](self->_rocker, "setHardwareIdentifier:", v41);

        -[HNDRocker setAutoresizingMask:](self->_rocker, "setAutoresizingMask:", 45LL);
        if (self->_pendingForegroundImageAction)
        {
          -[HNDRocker updateForegroundImageForAction:](self->_rocker, "updateForegroundImageForAction:");
          pendingForegroundImageAction = self->_pendingForegroundImageAction;
          self->_pendingForegroundImageAction = 0LL;
        }

        -[UIView addSubview:](self->_contentView, "addSubview:", self->_rocker);
        -[HNDView setControlDelegate:](self->_rocker, "setControlDelegate:", self);
        uint64_t v43 = objc_alloc(&OBJC_CLASS___HNDView);
        -[UIWindow bounds](self->_window, "bounds");
        v44 = -[HNDView initWithFrame:](v43, "initWithFrame:");
        rockerDismiss = self->_rockerDismiss;
        self->_rockerDismiss = v44;

        -[HNDView setAutoresizingMask:](self->_rockerDismiss, "setAutoresizingMask:", 18LL);
        -[HNDView setAlpha:](self->_rockerDismiss, "setAlpha:", 0.0);
        id v46 = self->_rocker;
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
        -[HNDRocker setBackgroundColor:](v46, "setBackgroundColor:", v47);

        -[HNDView setUserInteractionEnabled:](self->_rockerDismiss, "setUserInteractionEnabled:", 0LL);
        -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", self->_rockerDismiss, 0LL);
        -[HNDView setAccessibilityIdentifier:]( self->_rockerDismiss,  "setAccessibilityIdentifier:",  @"RockerDismiss");
        -[HNDView setControlDelegate:](self->_rockerDismiss, "setControlDelegate:", self);
        -[HNDDisplayManager _resetCurrentPointToInitialPoint](self, "_resetCurrentPointToInitialPoint");
        if (self->_nubbitPositionPercentage == 0.0) {
          self->_nubbitPositionPercentage = 0.75;
        }
        if (!self->_nubbitPositionEdge) {
          self->_nubbitPositionEdge = 4;
        }
        +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
        -[HNDDisplayManager _updateNubbitPosition](self, "_updateNubbitPosition");
        +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 1LL);
        self->_preKeyboardMovePosition.x = -1.0;
        self->_preKeyboardMovePosition.y = -1.0;
        -[HNDDisplayManager _startHandlingReachabilityIfNeeded](self, "_startHandlingReachabilityIfNeeded");
        id v48 = NSStringFromSelector(a2);
        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        -[HNDDisplayManager setVisualsHidden:forReason:animated:]( self,  "setVisualsHidden:forReason:animated:",  0LL,  v49,  1LL);
      }

      -[HNDDisplayManager _updateViewsForOrientation](self, "_updateViewsForOrientation");
      if (v12) {
        -[HNDDisplayManager updateMenuStyle](self, "updateMenuStyle");
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClientEnablers](self, "userInterfaceClientEnablers"));
      id v36 = [v35 count];

      if (v36) {
        -[HNDDisplayManager _setupUserInterfaceClient](self, "_setupUserInterfaceClient");
      }
    }
  }

  if (v5) {
    v5[2](v5);
  }
}

- (void)placeNubbitAtBottomCenter
{
  double v4 = v3 * 0.5;
  -[HNDDisplayManager screenBounds](self, "screenBounds");
  self->_nubbitPositionPercentage = 0.5 - v4 / v5;
  self->_nubbitPositionEdge = 2;
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
  -[HNDDisplayManager _updateNubbitPosition](self, "_updateNubbitPosition");
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 1LL);
}

- (void)cleanup
{
  contentView = self->_contentView;
  self->_contentView = 0LL;

  -[HNDView removeFromSuperview](self->_fingerContentView, "removeFromSuperview");
  fingerContentView = self->_fingerContentView;
  self->_fingerContentView = 0LL;

  -[UIView removeFromSuperview](self->_scannerContentView, "removeFromSuperview");
  scannerContentView = self->_scannerContentView;
  self->_scannerContentView = 0LL;

  -[UIView removeFromSuperview](self->_scannerBackCursorView, "removeFromSuperview");
  scannerBackCursorView = self->_scannerBackCursorView;
  self->_scannerBackCursorView = 0LL;

  -[UIView removeFromSuperview](self->_scannerFrontCursorView, "removeFromSuperview");
  scannerFrontCursorView = self->_scannerFrontCursorView;
  self->_scannerFrontCursorView = 0LL;

  -[HNDRocker removeFromSuperview](self->_rocker, "removeFromSuperview");
  rocker = self->_rocker;
  self->_rocker = 0LL;

  rockerDismiss = self->_rockerDismiss;
  self->_rockerDismiss = 0LL;

  downView = self->_downView;
  self->_downView = 0LL;

  -[HNDDisplayManager _endHandlingReachabilityIfNeeded](self, "_endHandlingReachabilityIfNeeded");
  -[HNDDisplayManager _cleanupUserInterfaceClient](self, "_cleanupUserInterfaceClient");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDDisplayManager;
  -[HNDDisplayManager dealloc](&v3, "dealloc");
}

- (void)_updateRockerReachability
{
  CGAffineTransform v4 = v6;
  -[UIView setTransform:](self->_contentView, "setTransform:", &v4);
}

- (double)_currentRockerTranslateY
{
  double v4 = v3;
  -[HNDRocker frame](self->_rocker, "frame");
  double MaxY = CGRectGetMaxY(v14);
  int IsPad = AXDeviceIsPad(v6, v7);
  double v9 = -8.0;
  if (IsPad) {
    double v9 = -6.0;
  }
  double v10 = v4 + MaxY - v9;
  -[UIView bounds](self->_contentView, "bounds");
  double result = 0.0;
  if (v10 > v12)
  {
    -[UIView bounds](self->_contentView, "bounds", 0.0);
    return v13 - v10;
  }

  return result;
}

- (CGPoint)_rotatedNormalizedInitialPoint
{
  signed int v2 = -[HNDDisplayManager orientation](self, "orientation") - 2;
  if (v2 > 2)
  {
    double v4 = 0.75;
    double v3 = 0.5;
  }

  else
  {
    double v3 = dbl_100117D80[v2];
    double v4 = dbl_100117D98[v2];
  }

  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_resetCurrentPointToInitialPoint
{
  self->_currentPoint.x = v3;
  self->_currentPoint.y = v4;
}

- (void)_resetReachabilityOffset
{
  contentView = self->_contentView;
  v4[0] = v4[3];
  v4[1] = v4[4];
  v4[2] = v4[5];
  -[UIView setTransform:](contentView, "setTransform:", v4);
}

- (BOOL)multiTouchToolBackgroundEnabled
{
  return self->_multiTouchBackgound != 0LL;
}

- (void)setMultiTouchToolBackgroundEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[HNDDisplayManager multiTouchToolBackgroundEnabled](self, "multiTouchToolBackgroundEnabled") != a3)
  {
    if (!v3) {
      goto LABEL_8;
    }
    if (UIAccessibilityIsSwitchControlRunning()) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDDisplayManager.m",  1153LL,  "-[HNDDisplayManager setMultiTouchToolBackgroundEnabled:]",  @"The multi touch tool background should only be used for AssistiveTouch.");
    }
    if (self->_contentView)
    {
      CGAffineTransform v5 = -[HNDView initWithFrame:]( objc_alloc(&OBJC_CLASS___HNDView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      multiTouchBackgound = self->_multiTouchBackgound;
      self->_multiTouchBackgound = v5;

      -[UIView bounds](self->_contentView, "bounds");
      -[HNDView setFrame:](self->_multiTouchBackgound, "setFrame:");
      AX_CGRectGetCenter(-[UIView bounds](self->_contentView, "bounds"));
      -[HNDView setCenter:](self->_multiTouchBackgound, "setCenter:");
      -[HNDView setAccessibilityIdentifier:]( self->_multiTouchBackgound,  "setAccessibilityIdentifier:",  @"MT Back");
      -[HNDView setAlpha:](self->_multiTouchBackgound, "setAlpha:", 0.0);
      uint64_t v7 = self->_multiTouchBackgound;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  0.01));
      -[HNDView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      -[HNDView setUserInteractionEnabled:](self->_multiTouchBackgound, "setUserInteractionEnabled:", 1LL);
      -[HNDView setIsAccessibilityElement:](self->_multiTouchBackgound, "setIsAccessibilityElement:", 1LL);
      id v9 = sub_10002B014(@"GesturePerformArea");
      double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[HNDView setAccessibilityLabel:](self->_multiTouchBackgound, "setAccessibilityLabel:", v10);

      -[HNDView setAccessibilityTraits:]( self->_multiTouchBackgound,  "setAccessibilityTraits:",  UIAccessibilityTraitAllowsDirectInteraction);
      uint64_t v11 = ASTLogCommon( -[UIView insertSubview:atIndex:]( self->_contentView,  "insertSubview:atIndex:",  self->_multiTouchBackgound,  0LL));
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[HNDDisplayManager setMultiTouchToolBackgroundEnabled:]";
        double v13 = "%s: enabled _multiTouchBackgound!";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v18, 0xCu);
      }
    }

    else
    {
LABEL_8:
      -[HNDView removeFromSuperview](self->_multiTouchBackgound, "removeFromSuperview");
      CGRect v14 = self->_multiTouchBackgound;
      self->_multiTouchBackgound = 0LL;

      uint64_t v16 = ASTLogCommon(v15);
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[HNDDisplayManager setMultiTouchToolBackgroundEnabled:]";
        double v13 = "%s: removed _multiTouchBackgound!";
        goto LABEL_10;
      }
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    [v17 setCaptureEvents:v3];
  }

- (CGPoint)closestNubbitPositionForPoint:(CGPoint)a3 offsetByMidpoint:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  -[HNDDisplayManager screenBounds](self, "screenBounds");
  double v8 = v7;
  double v10 = v9;
  double v11 = v7;
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v13 = v12;
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  if (y - v14 * 0.5 >= 30.0)
  {
    if (y + v14 * 0.5 > v10 + -30.0)
    {
      if (x - v13 * 0.5 < 30.0)
      {
        double v11 = 0.0;
LABEL_10:
        double v16 = v10;
        goto LABEL_24;
      }

      if (x + v13 * 0.5 > v8 + -30.0) {
        goto LABEL_10;
      }
    }

- (int)_angleForDegrees:(double)a3
{
  if (a3 > 45.0 && a3 < 115.0) {
    return 1;
  }
  if (a3 < -70.0 && a3 > -110.0 || a3 >= 250.0 && a3 <= 290.0) {
    return 2;
  }
  if (a3 < -25.0 && a3 >= -70.0 || a3 >= 290.0 && a3 <= 335.0) {
    return 7;
  }
  if (a3 > 200.0 && a3 <= 245.0) {
    return 8;
  }
  if (a3 > 160.0 && a3 < 200.0) {
    return 4;
  }
  if (a3 >= 115.0 && a3 < 160.0) {
    return 5;
  }
  if (a3 >= 25.0 && a3 < 65.0) {
    return 6;
  }
  if (a3 >= 25.0 && a3 <= 315.0) {
    return 0;
  }
  else {
    return 3;
  }
}

- (CGPoint)nubbitPositionForFlick:(CGPoint)a3
{
  double Average = SCRCMathGetAverage(&self->_nubbitAngleTracking, a2, (__n128)a3, *(__n128 *)&a3.y);
  -[HNDDisplayManager screenBounds](self, "screenBounds");
  double v6 = v5;
  double v8 = v7;
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v10 = v9;
  double v12 = v11;
  -[HNDDisplayManager _nubbitPointForEdgePosition](self, "_nubbitPointForEdgePosition");
  double v14 = v13;
  double v16 = v15;
  unsigned int v17 = -[HNDDisplayManager _angleForDegrees:](self, "_angleForDegrees:", Average);
  double v18 = v6 - v10;
  double v19 = v8 - v12;
  switch(v17)
  {
    case 1u:
      if (v16 > 0.0) {
        double v16 = v16 + v8 / -3.0;
      }
      break;
    case 2u:
      if (v16 < v19) {
        double v16 = v8 / 3.0 + v16;
      }
      break;
    case 3u:
      if (v14 > 0.0) {
        goto LABEL_19;
      }
      break;
    case 4u:
      if (v14 < v18) {
        goto LABEL_26;
      }
      break;
    case 5u:
      if (v14 < v18 && v16 > 0.0)
      {
        double v16 = v16 + v8 / -3.0;
        goto LABEL_26;
      }

      break;
    case 6u:
      if (v14 > 0.0 && v16 > 0.0)
      {
        double v16 = v16 + v8 / -3.0;
        goto LABEL_19;
      }

      break;
    case 7u:
      if (v14 > 0.0 && v16 < v19)
      {
        double v16 = v8 / 3.0 + v16;
LABEL_19:
        double v14 = 0.0;
      }

      break;
    case 8u:
      if (v14 < v18 && v16 < v19)
      {
        double v16 = v8 / 3.0 + v16;
LABEL_26:
        double v14 = v6 - v10;
      }

      break;
    default:
      break;
  }

  -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:]( self,  "closestNubbitPositionForPoint:offsetByMidpoint:",  0LL,  v14,  v16);
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (double)_yNubbitPadding:(double)a3 y:(double)a4
{
  uint64_t v7 = sub_10002BE8C((uint64_t)self, (uint64_t)a2);
  if ((v7 & 1) == 0)
  {
    double v9 = 2.0;
  }

  id v10 = -[HNDDisplayManager screenBounds](self, "screenBounds");
  double v12 = v11;
  double v14 = v13;
  uint64_t v16 = sub_10002BE8C((uint64_t)v10, v15);
  int v17 = v16;
  double v9 = 2.0;
  id v19 = (id)sub_10002BE8C(v16, v18);
  double v21 = 2.0;
  if ((_DWORD)v19)
  {
    if (v17) {
      double v22 = 10.0;
    }
    else {
      double v22 = 0.0;
    }
    id v19 = -[HNDDisplayManager safeAreaInsets](self, "safeAreaInsets");
    double v21 = v23 - v22;
  }

  uint64_t v24 = sub_10002BE44((uint64_t)v19, v20);
  int v25 = v24;
  if (sub_10002BE44(v24, v26))
  {
    if (v25) {
      double v27 = 10.0;
    }
    else {
      double v27 = 0.0;
    }
    -[HNDDisplayManager safeAreaInsets](self, "safeAreaInsets");
    double v9 = v28 - v27;
  }

  uint64_t v29 = -[HNDDisplayManager orientation](self, "orientation");
  int v30 = v29;
  uint64_t v32 = sub_10002BE44(v29, v31);
  if (v9 >= a4 && sub_10002BE44(v32, v33))
  {
    +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
    if (88.0 - v34 < a3 && v12 + -88.0 > a3) {
      return v9;
    }
    return 10.0;
  }

  id v36 = +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v39 = v12 * 0.5;
  id v40 = +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v42 = v41 + a3;
  uint64_t IsPhone = AXDeviceIsPhone(v40);
  double v44 = (_DWORD)IsPhone ? 67.0 : 170.0;
  if (v42 <= v39 - v44) {
    return 10.0;
  }
  double v45 = AXDeviceIsPhone(IsPhone) ? 67.0 : 170.0;
  double v9 = v21;
  if (v39 + v45 <= a3) {
    return 10.0;
  }
  return v9;
}

- (double)_xNubbitPadding:(double)a3 x:(double)a4
{
  uint64_t v7 = sub_10002BE8C((uint64_t)self, (uint64_t)a2);
  if ((v7 & 1) != 0 || (double v9 = 2.0, sub_10002BE44(v7, v8)))
  {
    +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
    double v11 = v10;
    double v13 = v12;
    -[HNDDisplayManager _yNubbitPadding:y:](self, "_yNubbitPadding:y:", a4, a3);
    double v15 = v14;
    id v16 = -[HNDDisplayManager screenBounds](self, "screenBounds");
    double v18 = v17;
    double v20 = v19;
    double v21 = v17 - v11;
    else {
      double v23 = 0.0;
    }
    uint64_t v24 = -[HNDDisplayManager orientation](self, "orientation");
    int v26 = v24;
    if (v15 >= a3 && (uint64_t v24 = sub_10002BE8C(v24, v25), (v24 & 1) != 0)
      || v20 - v13 - v15 <= a3 && sub_10002BE44(v24, v25))
    {
      double v9 = 10.0;
      if (a4 > 9.0)
      {
        double v9 = 9.0;
        if (v21 + -9.0 <= a4) {
          return v21 + -10.0;
        }
      }
    }

    else
    {
      double v9 = 9.0;
      if (v26 == 4)
      {
        -[HNDDisplayManager safeAreaInsets](self, "safeAreaInsets");
        double v38 = v37;
        id v39 = -[HNDDisplayManager safeAreaInsets](self, "safeAreaInsets");
        if (v38 == 0.0) {
          double v43 = v41;
        }
        else {
          double v43 = v42;
        }
        if (sub_10002BE44((uint64_t)v39, v40))
        {
          double v44 = v43 - v23;
          +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
          if (v45 + a4 > v18 - v44)
          {
            +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
            if (v20 + -88.0 > a3 && 88.0 - v46 < a3) {
              return v21 - v44;
            }
            else {
              return 9.0;
            }
          }
        }
      }

      else if (v26 == 3)
      {
        -[HNDDisplayManager safeAreaInsets](self, "safeAreaInsets");
        double v28 = v27;
        id v29 = -[HNDDisplayManager safeAreaInsets](self, "safeAreaInsets");
        double v33 = v28 == 0.0 ? v31 : v32;
        if (sub_10002BE44((uint64_t)v29, v30))
        {
          double v34 = v33 - v23;
          if (v34 > a4)
          {
            +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
            if (v20 + -88.0 > a3 && 88.0 - v35 < a3) {
              return v34;
            }
            else {
              return 9.0;
            }
          }
        }
      }
    }
  }

  return v9;
}

- (CGPoint)_validateNubbitPosition:(CGPoint)a3 forKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v10 = v9;
  double v12 = v11;
  else {
    double v14 = -4.0;
  }
  -[HNDDisplayManager screenBounds](self, "screenBounds");
  double v16 = v15 - (v12 + 0.0);
  double v18 = v17 - (v10 + 0.0);
  -[HNDDisplayManager _yNubbitPadding:y:](self, "_yNubbitPadding:y:", x, y);
  double v20 = v16 - v19;
  if (y < v16 - v19) {
    double v20 = y;
  }
  if (v19 >= v20) {
    double v21 = v19;
  }
  else {
    double v21 = v20;
  }
  -[HNDDisplayManager _xNubbitPadding:x:](self, "_xNubbitPadding:x:", v21, x);
  double v23 = v18 - v22;
  if (x < v18 - v22) {
    double v23 = x;
  }
  if (v22 < v23) {
    double v22 = v23;
  }
  if (v22 == 0.0) {
    double v24 = v14;
  }
  else {
    double v24 = v22;
  }
  if (v21 == 0.0) {
    double v25 = v14;
  }
  else {
    double v25 = v21;
  }
  if (v4)
  {
    double v22 = v24;
    double v26 = v25;
  }

  else
  {
    double v26 = v21;
  }

  result.double y = v26;
  result.double x = v22;
  return result;
}

- (void)_moveNubbitToPosition:(CGPoint)a3
{
}

- (CGPoint)_nubbitPointForEdgePosition
{
  double v4 = v3;
  double v6 = v5;
  -[HNDDisplayManager screenBounds](self, "screenBounds");
  int nubbitPositionEdge = self->_nubbitPositionEdge;
  switch(nubbitPositionEdge)
  {
    case 1:
      double v11 = v7 * self->_nubbitPositionPercentage;
      double v10 = 0.0;
      break;
    case 2:
      double v11 = v7 * self->_nubbitPositionPercentage;
      double v10 = v8 - v6;
      break;
    case 3:
      double v10 = v8 * self->_nubbitPositionPercentage;
      double v11 = 0.0;
      break;
    default:
      double v11 = v7 - v4;
      double v10 = v8 * self->_nubbitPositionPercentage;
      break;
  }

  -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:]( self,  "closestNubbitPositionForPoint:offsetByMidpoint:",  0LL,  v11,  v10);
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)_updateNubbitPosition
{
}

- (void)_updateNubbitEdgePosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v7 = v6;
  double v9 = v8;
  -[HNDDisplayManager screenBounds](self, "screenBounds");
  double v11 = v10;
  double v13 = v12;
  -[HNDDisplayManager _xNubbitPadding:x:](self, "_xNubbitPadding:x:", y, x);
  double v15 = v14;
  -[HNDDisplayManager _yNubbitPadding:y:](self, "_yNubbitPadding:y:", x, y);
  if (x <= v15)
  {
    int v21 = 3;
    double v22 = y / v13;
  }

  else
  {
    double v17 = v11 - v7 - v15;
    double v18 = 0.0;
    if (y >= v13 - v9 - v16) {
      int v19 = 2;
    }
    else {
      int v19 = 0;
    }
    if (y >= v13 - v9 - v16) {
      double v18 = x / v11;
    }
    if (y > v16)
    {
      double v20 = v18;
    }

    else
    {
      int v19 = 1;
      double v20 = x / v11;
    }

    if (x >= v17) {
      int v21 = 4;
    }
    else {
      int v21 = v19;
    }
    if (x >= v17) {
      double v22 = y / v13;
    }
    else {
      double v22 = v20;
    }
  }

  self->_int nubbitPositionEdge = v21;
  self->_nubbitPositionPercentage = fmin(fmax(v22, 0.0), 1.0);
  -[AXDispatchTimer cancel](self->_positionSetTimer, "cancel");
  positionSetTimer = self->_positionSetTimer;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000119D8;
  v24[3] = &unk_100121F08;
  *(double *)&v24[4] = v22;
  int v25 = v21;
  -[AXDispatchTimer afterDelay:processBlock:](positionSetTimer, "afterDelay:processBlock:", v24, 1.0);
}

- (void)_moveNubbitToPosition:(CGPoint)a3 forKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (!-[HNDRocker style](self->_rocker, "style"))
  {
    -[HNDDisplayManager screenBounds](self, "screenBounds");
    v12.origin.double x = CGRectZero.origin.x;
    v12.origin.double y = CGRectZero.origin.y;
    v12.size.width = CGRectZero.size.width;
    v12.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v11, v12))
    {
      if (!v4) {
        -[HNDDisplayManager _updateNubbitEdgePosition:](self, "_updateNubbitEdgePosition:", x, y);
      }
      -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", v4, x, y);
      self->_preKeyboardMovePosition.double x = -1.0;
      self->_preKeyboardMovePosition.double y = -1.0;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100011B78;
      v10[3] = &unk_100121F30;
      v10[4] = self;
      v10[5] = v8;
      v10[6] = v9;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v10, 0.22);
    }
  }

- (void)_repositionNubbitAfterLift:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_nubbitDistanceTracking = &self->_nubbitDistanceTracking;
  fifoIndedouble x = self->_nubbitDistanceTracking.fifoIndex;
  int v8 = fifoIndex - 1;
  if (fifoIndex < 1) {
    int v8 = 7;
  }
  BOOL v9 = __OFSUB__(fifoIndex, 2);
  int v10 = fifoIndex - 2;
  if (v10 < 0 != v9) {
    int v10 = 7;
  }
  float v11 = self->_nubbitDistanceTracking.fifo[v8];
  a3.double x = self->_nubbitDistanceTracking.fifo[v10];
  float v12 = a3.x;
  if (SCRCMathGetAverage(p_nubbitDistanceTracking, a2, (__n128)a3, *(__n128 *)&a3.y) <= 22.5
    || v11 <= 8.0
    || v12 <= 8.0)
  {
    -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:]( self,  "closestNubbitPositionForPoint:offsetByMidpoint:",  1LL,  x,  y);
  }

  else
  {
    -[HNDDisplayManager nubbitPositionForFlick:](self, "nubbitPositionForFlick:", x, y);
  }

  -[HNDDisplayManager _moveNubbitToPosition:](self, "_moveNubbitToPosition:");
}

- (BOOL)_position:(CGPoint)a3 isOverKeyboard:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  -[UIWindow convertPoint:fromView:](self->_window, "convertPoint:fromView:", self->_contentView, a3.x, a3.y);
  v11.CGFloat x = v8;
  v11.CGFloat y = v9;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  return CGRectContainsPoint(v12, v11);
}

- (BOOL)_nubbitIsOverKeyboard:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  window = self->_window;
  -[HNDRocker frame](self->_rocker, "frame");
  -[UIWindow convertRect:fromView:](window, "convertRect:fromView:", self->_contentView);
  v15.origin.CGFloat x = v9;
  v15.origin.CGFloat y = v10;
  v15.size.CGFloat width = v11;
  v15.size.CGFloat height = v12;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  return CGRectIntersectsRect(v14, v15);
}

- (CGPoint)_nubbitPositionForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[HNDDisplayManager _nubbitPointForEdgePosition](self, "_nubbitPointForEdgePosition");
  double v9 = v8;
  -[UIWindow convertRect:toView:](self->_window, "convertRect:toView:", self->_contentView, x, y, width, height);
  double v11 = v10;
  id v12 = +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v14 = v11 - v13;
  uint64_t v16 = sub_10002BE8C((uint64_t)v12, v15);
  if ((_DWORD)v16 && AXDeviceIsPhone(v16) && -[HNDDisplayManager orientation](self, "orientation") == 1)
  {
    self->_int nubbitPositionEdge = 2;
    -[HNDDisplayManager _nubbitPointForEdgePosition](self, "_nubbitPointForEdgePosition");
    double v18 = v17;
    double v14 = v19;
    double v20 = width - v17;
    id v21 = -[HNDDisplayManager screenBounds](self, "screenBounds");
    double v23 = v22;
    int IsPhone = AXDeviceIsPhone(v21);
    double v25 = 340.0;
    if (IsPhone) {
      double v25 = 134.0;
    }
    double v26 = (v23 - v25) * 0.5;
    if (v18 >= v20)
    {
      double v9 = width - v26;
    }

    else
    {
      +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
      double v9 = v26 - v27;
    }
  }

  -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", 1LL, v9, v14);
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (void)_moveNubbitForKeyboard:(CGRect)a3
{
}

- (UIEdgeInsets)safeAreaInsets
{
  signed int v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager window](self, "window"));
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)keyboardVisible:(BOOL)a3 withFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = self;
  if (a3)
  {
    v38.origin.double x = CGRectZero.origin.x;
    v38.origin.double y = CGRectZero.origin.y;
    v38.size.double width = CGRectZero.size.width;
    v38.size.double height = CGRectZero.size.height;
    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    self = (HNDDisplayManager *)CGRectEqualToRect(v38, v40);
    unsigned int v9 = self ^ 1;
  }

  else
  {
    unsigned int v9 = 0;
  }

  int keyboardVisible = v8->_keyboardVisible;
  uint64_t v11 = ASTLogCommon(self);
  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    double v13 = NSStringFromCGRect(v39);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = NSStringFromCGRect(v8->_keyboardFrame);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v34 = 67109634;
    *(_DWORD *)double v35 = v9;
    *(_WORD *)&v35[4] = 2114;
    *(void *)&v35[6] = v14;
    __int16 v36 = 2114;
    double v37 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "KB visible: %d with frame: %{public}@ (exisitng frame: %{public}@",  (uint8_t *)&v34,  0x1Cu);
  }

  if (keyboardVisible == v9
    && (v41.origin.double x = x,
        v41.origin.double y = y,
        v41.size.double width = width,
        v41.size.double height = height,
        BOOL v17 = CGRectEqualToRect(v8->_keyboardFrame, v41)))
  {
    uint64_t v18 = ASTLogCommon(v17);
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "No change in KB visibility, not moving nubbit.",  (uint8_t *)&v34,  2u);
    }
  }

  else
  {
    v8->_int keyboardVisible = v9;
    v8->_keyboardFrame.origin.double x = x;
    v8->_keyboardFrame.origin.double y = y;
    v8->_keyboardFrame.size.double width = width;
    v8->_keyboardFrame.size.double height = height;
    id v20 = (id)-[HNDRocker style](v8->_rocker, "style");
    if (!(_DWORD)v20)
    {
      if (v9)
      {
        if (-[HNDDisplayManager _nubbitIsOverKeyboard:](v8, "_nubbitIsOverKeyboard:", x, y, width, height))
        {
          if (keyboardVisible != v9
            || (double v21 = v8->_preKeyboardMovePosition.x, v22 = v8->_preKeyboardMovePosition.y, v21 == -1.0) && v22 == -1.0)
          {
            -[HNDDisplayManager _nubbitPointForEdgePosition](v8, "_nubbitPointForEdgePosition");
            double v21 = v23;
            double v22 = v24;
          }

          id v25 = -[HNDDisplayManager _moveNubbitForKeyboard:](v8, "_moveNubbitForKeyboard:", x, y, width, height);
          v8->_preKeyboardMovePosition.double x = v21;
          v8->_preKeyboardMovePosition.double y = v22;
          uint64_t v26 = ASTLogCommon(v25);
          double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            double v28 = NSStringFromPoint(v8->_preKeyboardMovePosition);
            double v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            int v34 = 138412290;
            *(void *)double v35 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Storing Pre nubbit position: %@",  (uint8_t *)&v34,  0xCu);
          }
        }
      }

      else
      {
        uint64_t v30 = ASTLogCommon(v20);
        double v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          double v32 = NSStringFromPoint(v8->_preKeyboardMovePosition);
          double v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          int v34 = 138412290;
          *(void *)double v35 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Pre nubbit position: %@",  (uint8_t *)&v34,  0xCu);
        }

        if (v8->_preKeyboardMovePosition.x != -1.0 || v8->_preKeyboardMovePosition.y != -1.0) {
          -[HNDDisplayManager _moveNubbitToPosition:](v8, "_moveNubbitToPosition:");
        }
      }
    }
  }

- (void)moveNubbitToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v7 = x - v6 * 0.5;
  double v9 = y - v8 * 0.5;
  -[HNDRocker frame](self->_rocker, "frame");
  -[HNDRocker setFrame:](self->_rocker, "setFrame:", v7, v9);
}

- (void)setNubbitMoving:(BOOL)a3
{
  if (self->_nubbitMoving != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = ASTLogCommon(self);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Set nubbit moving from override", v8, 2u);
    }

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    [v7 setNubbitMoving:v3];

    self->_nubbitMoving = v3;
  }

- (void)_handleNubbitMove:(CGPoint)a3 event:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v9 = v8;
  double v11 = v10;
  double v12 = x - v8 * 0.5;
  double v13 = y - v10 * 0.5;
  double v14 = self->_movePoint.x;
  double v15 = self->_movePoint.y;
  double v16 = v14 - v12;
  double v17 = v15 - v13;
  if (self->_nubbitMoving
    || ((double v18 = vabdd_f64(v15, v13), vabdd_f64(v14, v12) <= 1.0) ? (v19 = v18 <= 1.0) : (v19 = 0), !v19))
  {
    double v58 = v13;
    double v61 = v12;
    -[HNDRocker frame](self->_rocker, "frame");
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    double v59 = v17;
    double v60 = v16;
    CGFloat v25 = v24 - v16;
    double v27 = v26 - v17;
    -[HNDDisplayManager screenBounds](self, "screenBounds");
    CGRect v65 = CGRectInset(v64, v9 / -3.0, v11 / -3.0);
    CGFloat v28 = v65.origin.x;
    CGFloat v29 = v65.origin.y;
    CGFloat width = v65.size.width;
    double v55 = v25;
    double v56 = v23;
    v65.origin.double x = v25;
    double v31 = v27;
    CGFloat height = v65.size.height;
    v65.origin.double y = v31;
    double rect = v21;
    v65.size.CGFloat width = v21;
    v65.size.CGFloat height = v23;
    CGFloat v33 = width;
    double MaxX = CGRectGetMaxX(v65);
    v66.origin.double x = v28;
    v66.origin.double y = v29;
    v66.size.CGFloat width = v33;
    v66.size.CGFloat height = height;
    if (MaxX <= CGRectGetMaxX(v66))
    {
      v67.origin.double x = v55;
      v67.size.CGFloat height = v56;
      v67.origin.double y = v31;
      v67.size.CGFloat width = rect;
      double MaxY = CGRectGetMaxY(v67);
      v68.origin.double x = v28;
      v68.origin.double y = v29;
      v68.size.CGFloat width = v33;
      v68.size.CGFloat height = height;
      if (MaxY <= CGRectGetMaxY(v68))
      {
        v69.origin.double x = v55;
        v69.size.CGFloat height = v56;
        v69.origin.double y = v31;
        v69.size.CGFloat width = rect;
        double MinX = CGRectGetMinX(v69);
        v70.origin.double x = v28;
        v70.origin.double y = v29;
        v70.size.CGFloat width = v33;
        v70.size.CGFloat height = height;
        if (MinX >= CGRectGetMinX(v70))
        {
          v71.origin.double x = v55;
          v71.size.CGFloat height = v56;
          v71.origin.double y = v31;
          v71.size.CGFloat width = rect;
          double MinY = CGRectGetMinY(v71);
          v72.origin.double x = v28;
          v72.origin.double y = v29;
          v72.size.CGFloat width = v33;
          v72.size.CGFloat height = height;
          if (MinY >= CGRectGetMinX(v72)) {
            id v35 = -[HNDRocker setFrame:](self->_rocker, "setFrame:", v55, v31, rect, v56);
          }
        }
      }
    }

    double v16 = v60;
    double v12 = v61;
    double v13 = v58;
    double v17 = v59;
    if (!self->_nubbitMoving)
    {
      uint64_t v39 = ASTLogCommon(v35);
      CGRect v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.a) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Set nubbit moving; handle nubbit move",
          (uint8_t *)&buf,
          2u);
      }

      CGRect v41 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
      [v41 setNubbitMoving:1];

      self->_nubbitMoving = 1;
    }

    SCRCMathGetDistanceBetweenPoints(v35, v14, v15, v61, v58);
    SCRCMathUpdateAverage(&self->_nubbitDistanceTracking, 8LL);
    buf.a = 0.0;
    v62.a = 0.0;
    SCRCMathGetVectorAndDistanceForPoints(&buf, &v62, v14, v15, v61, v58);
    SCRCMathUpdateAngleAverage(&self->_nubbitAngleTracking, 10LL, buf.a);
  }

  double v42 = (void *)objc_claimAutoreleasedReturnValue([v7 handInfo]);
  double v43 = (void *)objc_claimAutoreleasedReturnValue([v42 paths]);
  double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 firstPath]);
  [v44 orbValue];
  double v46 = v45;

  uint64_t v47 = AXForceTouchAvailableAndEnabled();
  if ((_DWORD)v47
    && self->_orbActionExists
    && !self->_playedHapticForCurrentEvent
    && SCRCMathGetDistanceBetweenPoints(v47, self->_nubbitStartDownPoint.x, self->_nubbitStartDownPoint.y, v12, v13) < 15.0)
  {
    __int128 v48 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&buf.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&buf.c = v48;
    *(_OWORD *)&buf.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[HNDDisplayManager _iconScaleForForce:](self, "_iconScaleForForce:", v46);
    if (v49 > 1.0)
    {
      CGAffineTransformMakeScale(&buf, v49, v49);
      -[AXDispatchTimer cancel](self->_longPressTimer, "cancel");
    }

    rocker = self->_rocker;
    CGAffineTransform v62 = buf;
    -[HNDRocker setTransform:](rocker, "setTransform:", &v62);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 assistiveTouchSingleTapAction]);
  if (![v52 isEqualToString:AXAssistiveTouchIconTypePassThroughToApp])
  {

LABEL_31:
    -[HNDRocker highlightNubbit](self->_rocker, "highlightNubbit");
    goto LABEL_32;
  }

  if (v16 > 3.0 || v17 > 3.0) {
    goto LABEL_31;
  }
LABEL_32:
  self->_movePoint.double x = v12;
  self->_movePoint.double y = v13;
  id v54 = self->_rocker;
  -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", self->_downView, v12, v13);
  -[HNDRocker handleRealMoveEvent:maxOrb:currentForce:](v54, "handleRealMoveEvent:maxOrb:currentForce:");
}

- (double)_iconScaleForForce:(double)a3
{
  double v3 = 1.0;
  if (a3 > 100.0)
  {
    double v4 = a3 / 1000.0 + 1.0;
    double v3 = 1.5;
    if (v4 <= 1.5) {
      return v4;
    }
  }

  return v3;
}

- (id)viewAtDisplayPoint:(CGPoint)a3 downPoint:(CGPoint *)a4 window:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  if (v8)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v8));
    if ([v9 count])
    {
      double v31 = a4;
      double v10 = 0LL;
      do
      {
        double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);
        [v9 removeObjectAtIndex:0];
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subviews]);
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 reverseObjectEnumerator]);
        double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);

        id v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v33;
LABEL_6:
          uint64_t v18 = 0LL;
          while (1)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            BOOL v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
            double v20 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
            objc_msgSend(v20, "convertPoint:fromLayer:", 0, x, y);
            double v22 = v21;
            double v24 = v23;

            objc_msgSend(v8, "convertPoint:toView:", v19, v22, v24);
            if (objc_msgSend(v19, "pointInside:withEvent:", 0))
            {
              if ([v19 isUserInteractionEnabled]
                && ([v19 isHidden] & 1) == 0)
              {
                break;
              }
            }

            [v9 addObject:v19];
            if (v16 == (id)++v18)
            {
              id v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
              if (v16) {
                goto LABEL_6;
              }
              goto LABEL_14;
            }
          }

          uint64_t v27 = objc_opt_class(&OBJC_CLASS___HNDView, v25);
          if ((objc_opt_isKindOfClass(v19, v27) & 1) != 0)
          {
            if (v31)
            {
              v31->double x = v22;
              v31->double y = v24;
            }

            id v26 = v19;

            CGFloat v28 = (void *)objc_claimAutoreleasedReturnValue([v26 subviews]);
            id v29 = [v28 count];

            if (!v29)
            {
              [v9 removeAllObjects];
              goto LABEL_22;
            }
          }

          else
          {
            id v26 = v10;
          }

          [v9 removeAllObjects];
          [v9 addObject:v19];
        }

        else
        {
LABEL_14:
          id v26 = v10;
        }

- (id)window
{
  return self->_window;
}

- (unsigned)displayID
{
  signed int v2 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager window](self, "window"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 screen]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayIdentity]);
  unsigned int v5 = [v4 displayID];

  return v5;
}

- (id)ignoredWindow
{
  return self->_ignoredWindow;
}

- (id)viewAtDisplayPoint:(CGPoint)a3
{
  return -[HNDDisplayManager viewAtDisplayPoint:downPoint:window:]( self,  "viewAtDisplayPoint:downPoint:window:",  0LL,  self->_window,  a3.x,  a3.y);
}

- (void)resetNubbitLocation
{
  if (self->_nubbitMoving)
  {
    rocker = self->_rocker;
    __int128 v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v8[1] = v4;
    v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[HNDRocker setTransform:](rocker, "setTransform:", v8);
    contentView = self->_contentView;
    AX_CGRectGetCenter(-[HNDRocker bounds](self->_rocker, "bounds"));
    -[UIView convertPoint:fromView:](contentView, "convertPoint:fromView:", self->_rocker);
    -[HNDDisplayManager _repositionNubbitAfterLift:](self, "_repositionNubbitAfterLift:");
    -[HNDRocker fadeNubbit](self->_rocker, "fadeNubbit");
    -[HNDDisplayManager reachabilityOffset](self, "reachabilityOffset");
    if (v6 > 0.0) {
      -[HNDDisplayManager _updateRockerReachability](self, "_updateRockerReachability");
    }
  }

  else
  {
    -[HNDDisplayManager reachabilityOffset](self, "reachabilityOffset");
    if (v7 > 0.0) {
      -[HNDDisplayManager _resetReachabilityOffset](self, "_resetReachabilityOffset");
    }
  }

- (BOOL)handleRealEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paths]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstPath]);
  [v7 pathLocation];
  double v9 = v8;
  double v11 = v10;

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow layer](self->_window, "layer"));
  objc_msgSend(v12, "convertPoint:fromLayer:", 0, v9, v11);
  double v14 = v13;
  double v16 = v15;

  if (self->_lastHandType != 6 || [v5 eventType] != self->_lastHandType)
  {
    -[HNDRocker isAnimatingNubbit](self->_rocker, "isAnimatingNubbit");
    double v21 = &OBJC_CLASS___SCATAppleTVRemoteViewController;
    if (-[HNDRocker isAnimatingNubbit](self->_rocker, "isAnimatingNubbit"))
    {
      downView = self->_downView;
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___HNDRockerButton, v20);
      if ((objc_opt_isKindOfClass(downView, v23) & 1) == 0 && (id)-[HNDRocker state](self->_rocker, "state") == (id)1) {
        objc_storeStrong((id *)&self->_downView, self->_rocker);
      }
    }

    BOOL v25 = [v5 eventType] == 1 || objc_msgSend(v5, "eventType") == 2;
    p_downView = (id *)&self->_downView;
    uint64_t v27 = self->_downView;
    uint64_t v28 = objc_opt_class(&OBJC_CLASS___HNDRockerButton, v24);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0 && [*p_downView isModalDown])
    {
      id v29 = (HNDRocker *)*p_downView;
    }

    else
    {
      id v29 = (HNDRocker *)self->_downView;
      if (v29 != self->_rocker
        || !self->_nubbitMoving
        || (v32 = [v5 eventType], id v29 = (HNDRocker *)*p_downView, v32 != 2))
      {
        if (!v29 || v25)
        {
          double v31 = (HNDRocker *)objc_claimAutoreleasedReturnValue( -[HNDDisplayManager viewAtDisplayPoint:downPoint:window:]( self,  "viewAtDisplayPoint:downPoint:window:",  &self->_downPoint,  self->_window,  v9,  v11));
LABEL_23:
          __int128 v33 = v31;
          multiTouchBackgound = self->_multiTouchBackgound;
          id v35 = [v5 eventType];
          unsigned int v36 = v35;
          BOOL v19 = 0;
          float DistanceBetweenPoints = SCRCMathGetDistanceBetweenPoints( v35,  self->_nubbitStartDownPoint.x,  self->_nubbitStartDownPoint.y,  self->_movePoint.x,  self->_movePoint.y);
          switch(v36)
          {
            case 1u:
              +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
              double v50 = v14 - v49 * 0.5;
              double v52 = v16 - v51 * 0.5;
              v53 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
              uint64_t v54 = objc_claimAutoreleasedReturnValue([v53 assistiveTouchLongPressAction]);
              if (v54)
              {
                double v55 = (void *)v54;
                unsigned __int8 v56 = -[HNDRocker isFullMenuVisible](self->_rocker, "isFullMenuVisible");

                if ((v56 & 1) == 0)
                {
                  uint64_t v58 = ASTLogCommon(v57);
                  double v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    double v60 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
                    double v61 = (void *)objc_claimAutoreleasedReturnValue([v60 assistiveTouchLongPressAction]);
                    *(_DWORD *)CGAffineTransform buf = 138412290;
                    *(void *)&buf[4] = v61;
                    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "kicking off longpress action: %@",  buf,  0xCu);
                  }

                  longPressTimer = self->_longPressTimer;
                  v63 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
                  [v63 assistiveTouchLongPressActionDuration];
                  v120[0] = _NSConcreteStackBlock;
                  v120[1] = 3221225472LL;
                  v120[2] = sub_100013718;
                  v120[3] = &unk_100121D18;
                  v120[4] = self;
                  -[AXDispatchTimer afterDelay:processBlock:](longPressTimer, "afterDelay:processBlock:", v120);
                }
              }

              else
              {
              }

              self->_movePoint.double x = v50;
              self->_movePoint.double y = v52;
              if (-[HNDRocker isFullMenuVisible](self->_rocker, "isFullMenuVisible"))
              {
                -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", self->_downView, v50, v52);
                -[HNDRocker handleRealDownEvent:](v33, "handleRealDownEvent:");
                -[HNDDisplayManager setShouldDelayBeforePresentingHUDView:]( self,  "setShouldDelayBeforePresentingHUDView:",  1LL);
                -[HNDDisplayManager _updateLargeContentViewerIfNeededForView:]( self,  "_updateLargeContentViewerIfNeededForView:",  v33);
                SCRCMathClearAverage(&self->_nubbitDistanceTracking);
                SCRCMathClearAverage(&self->_nubbitAngleTracking);
                double v21 = &OBJC_CLASS___SCATAppleTVRemoteViewController;
              }

              else
              {
                if (!self->_nubbitMoving)
                {
                  v77 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
                  v78 = (void *)objc_claimAutoreleasedReturnValue([v77 assistiveTouchSingleTapAction]);
                  unsigned __int8 v79 = [v78 isEqualToString:AXAssistiveTouchIconTypePassThroughToApp];

                  if ((v79 & 1) == 0) {
                    -[HNDRocker highlightNubbit](self->_rocker, "highlightNubbit");
                  }
                  rocker = self->_rocker;
                  -[UIWindow convertPoint:toView:]( self->_window,  "convertPoint:toView:",  rocker,  self->_movePoint.x,  self->_movePoint.y);
                  -[HNDRocker handleRealDownEvent:](rocker, "handleRealDownEvent:");
                }

                double v21 = &OBJC_CLASS___SCATAppleTVRemoteViewController;
                if (v33 == self->_rocker)
                {
                  self->_nubbitStartDownPoint.double x = v50;
                  self->_nubbitStartDownPoint.double y = v52;
                  self->_nubbitTouchDownTime = CFAbsoluteTimeGetCurrent();
                  uint64_t v81 = -[HNDRocker style](self->_rocker, "style");
                  if (!(_DWORD)v81)
                  {
                    uint64_t v82 = ASTLogCommon(v81);
                    v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)CGAffineTransform buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_INFO,  "Set nubbit moving; touch event down",
                        buf,
                        2u);
                    }

                    v84 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
                    [v84 setNubbitMoving:1];

                    self->_BOOL nubbitMoving = 1;
                  }
                }
              }

              v85 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
              v86 = (void *)objc_claimAutoreleasedReturnValue([v85 paths]);
              v87 = (void *)objc_claimAutoreleasedReturnValue([v86 firstPath]);
              [v87 pathPressure];
              self->_double maxOrbDuringTouch = v88;

              -[AXDispatchTimer cancel](self->_idleTimer, "cancel");
              -[AXDispatchTimer cancel](self->_longIdleTimer, "cancel");
              int v89 = 0;
              goto LABEL_86;
            case 2u:
              -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v33, v14, v16);
              double v66 = v65;
              double v68 = v67;
              CGRect v69 = (HNDRocker *)self->_downView;
              if (v69 != self->_rocker) {
                goto LABEL_51;
              }
              if (-[HNDView style](self->_downView, "style"))
              {
                CGRect v69 = (HNDRocker *)*p_downView;
LABEL_51:
                if (v69 == v33)
                {
                  double maxOrbDuringTouch = self->_maxOrbDuringTouch;
                  v91 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
                  v92 = (void *)objc_claimAutoreleasedReturnValue([v91 paths]);
                  v93 = (void *)objc_claimAutoreleasedReturnValue([v92 firstPath]);
                  [v93 pathPressure];
                  -[HNDRocker handleRealMoveEvent:maxOrb:currentForce:]( v33,  "handleRealMoveEvent:maxOrb:currentForce:",  v66,  v68,  maxOrbDuringTouch,  v94);
                }

                else
                {
                  uint64_t v70 = objc_opt_class(&OBJC_CLASS___HNDRockerButton, v64);
                  if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0
                    && [*p_downView isModalDown])
                  {
                    v119 = self->_downView;
                    double v71 = self->_maxOrbDuringTouch;
                    CGRect v72 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
                    v73 = (void *)objc_claimAutoreleasedReturnValue([v72 paths]);
                    v74 = (void *)objc_claimAutoreleasedReturnValue([v73 firstPath]);
                    [v74 pathPressure];
                    -[HNDView handleRealMoveEvent:maxOrb:currentForce:]( v119,  "handleRealMoveEvent:maxOrb:currentForce:",  v66,  v68,  v71,  v75);

                    double v21 = &OBJC_CLASS___SCATAppleTVRemoteViewController;
                    p_downView = (id *)&self->_downView;
                  }

                  else
                  {
                    -[HNDView handleFingerDriftedAway](self->_downView, "handleFingerDriftedAway");
                    v76 = self->_downView;
                    self->_downView = 0LL;

                    -[HNDRocker handleRealDownEvent:](v33, "handleRealDownEvent:", v66, v68);
                    -[HNDDisplayManager _updateLargeContentViewerIfNeededForView:]( self,  "_updateLargeContentViewerIfNeededForView:",  v33);
                  }
                }
              }

              else
              {
                -[HNDDisplayManager _handleNubbitMove:event:](self, "_handleNubbitMove:event:", v4, v14, v16);
              }

              if (DistanceBetweenPoints > 10.0
                && -[AXDispatchTimer isPending](self->_longPressTimer, "isPending")
                && (-[AXDispatchTimer isCancelled](self->_longPressTimer, "isCancelled") & 1) == 0)
              {
                uint64_t v97 = ASTLogCommon(-[AXDispatchTimer cancel](self->_longPressTimer, "cancel"));
                v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
                if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)CGAffineTransform buf = 134217984;
                  *(double *)&buf[4] = DistanceBetweenPoints;
                  _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_INFO,  "Moved to far, canceling long press timer: %f",  buf,  0xCu);
                }
              }

              double v99 = self->_maxOrbDuringTouch;
              v100 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
              v101 = (void *)objc_claimAutoreleasedReturnValue([v100 paths]);
              v102 = (void *)objc_claimAutoreleasedReturnValue([v101 firstPath]);
              [v102 pathPressure];
              float v104 = v103;

              int v89 = 0;
              double v105 = v104;
              if (v99 >= v104) {
                double v105 = v99;
              }
              self->_double maxOrbDuringTouch = v105;
              goto LABEL_86;
            case 6u:
            case 8u:
            case 9u:
            case 0xAu:
              CGRect v38 = self->_rocker;
              __int128 v39 = *(_OWORD *)&CGAffineTransformIdentity.c;
              *(_OWORD *)CGAffineTransform buf = *(_OWORD *)&CGAffineTransformIdentity.a;
              __int128 v122 = v39;
              __int128 v123 = *(_OWORD *)&CGAffineTransformIdentity.tx;
              -[HNDRocker setTransform:](v38, "setTransform:", buf);
              id v40 = -[AXDispatchTimer cancel](self->_longPressTimer, "cancel");
              BOOL nubbitMoving = self->_nubbitMoving;
              uint64_t v42 = ASTLogCommon(v40);
              double v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
              BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);
              if (nubbitMoving)
              {
                if (v44)
                {
                  *(_WORD *)CGAffineTransform buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Nubbit not moving", buf, 2u);
                }

                float v45 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
                [v45 setNubbitMoving:0];

                double v21 = &OBJC_CLASS___SCATAppleTVRemoteViewController;
                if (DistanceBetweenPoints >= 10.0
                  || CFAbsoluteTimeGetCurrent() - self->_nubbitTouchDownTime >= 0.5 && self->_maxOrbDuringTouch <= 100.0)
                {
                  -[HNDRocker resetOrbAction](self->_rocker, "resetOrbAction");
                }

                else
                {
                  double v46 = self->_downView;
                  -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v46, v14, v16);
                  -[HNDView handleRealUpEvent:maxOrb:](v46, "handleRealUpEvent:maxOrb:");
                  if (-[HNDRocker style](self->_rocker, "style"))
                  {
LABEL_34:
                    self->_BOOL nubbitMoving = 0;
                    if (DistanceBetweenPoints > 10.0)
                    {
                      self->_preKeyboardMovePosition.double x = -1.0;
                      self->_preKeyboardMovePosition.double y = -1.0;
                    }

                    SCRCMathClearAverage(&self->_nubbitAngleTracking);
                    SCRCMathClearAverage(&self->_nubbitDistanceTracking);
                    goto LABEL_71;
                  }
                }

                -[HNDDisplayManager resetNubbitLocation](self, "resetNubbitLocation");
                goto LABEL_34;
              }

              if (v44)
              {
                BOOL longPressActionActivated = self->_longPressActionActivated;
                *(_DWORD *)CGAffineTransform buf = 67109120;
                *(_DWORD *)&buf[4] = longPressActionActivated;
                _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_INFO,  "Up event, long press activation state: %d",  buf,  8u);
              }

              double v21 = &OBJC_CLASS___SCATAppleTVRemoteViewController;
              if (!self->_longPressActionActivated)
              {
                -[HNDRocker modalizeMenu:modalButton:](self->_rocker, "modalizeMenu:modalButton:", 0LL, 0LL);
                if (v36 <= 0xA && ((1 << v36) & 0x640) != 0)
                {
                  __int128 v48 = self->_downView;
                  -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v48, v14, v16);
                  -[HNDView handleRealUpEvent:maxOrb:](v48, "handleRealUpEvent:maxOrb:");
                }

                else
                {
                  v95 = self->_downView;
                  -[UIWindow convertPoint:toView:](self->_window, "convertPoint:toView:", v95, v14, v16);
                  -[HNDView handleRealCancelEvent:](v95, "handleRealCancelEvent:");
                }
              }

- (void)updateRockersForSubstantialTransition
{
}

- (CGPoint)convertPointToIntefaceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[HNDDisplayManager portraitUpScreenBounds](self, "portraitUpScreenBounds");
  int orientation = self->_orientation;
  double v9 = v7 - y;
  double v10 = v6 - x;
  if (orientation == 2) {
    double v11 = v6 - x;
  }
  else {
    double v11 = x;
  }
  if (orientation == 2) {
    double v12 = v7 - y;
  }
  else {
    double v12 = y;
  }
  if (orientation == 3) {
    double v11 = y;
  }
  else {
    double v10 = v12;
  }
  if (orientation == 4) {
    double v10 = x;
  }
  else {
    double v9 = v11;
  }
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGRect)convertFrameToInterfaceOrientation:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[HNDDisplayManager portraitUpScreenBounds](self, "portraitUpScreenBounds");
  int orientation = self->_orientation;
  double v11 = v9 - y - height;
  double v12 = v8 - x - width;
  if (orientation == 2) {
    double v13 = v8 - x - width;
  }
  else {
    double v13 = x;
  }
  if (orientation == 2) {
    double v14 = v9 - y - height;
  }
  else {
    double v14 = y;
  }
  if (orientation == 3) {
    double v13 = y;
  }
  else {
    double v12 = v14;
  }
  if (orientation == 3) {
    double v15 = height;
  }
  else {
    double v15 = width;
  }
  if (orientation == 3) {
    double v16 = width;
  }
  else {
    double v16 = height;
  }
  if (orientation == 4) {
    double v12 = x;
  }
  else {
    double v11 = v13;
  }
  if (orientation == 4) {
    double v17 = height;
  }
  else {
    double v17 = v15;
  }
  if (orientation == 4) {
    double v18 = width;
  }
  else {
    double v18 = v16;
  }
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGPoint)convertToNormalizedInterfaceOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[HNDDisplayManager screenBounds](self, "screenBounds");
  double v6 = x / v5;
  double v8 = y / v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromOrientation:(int)a4
{
  double y = a3.y;
  double x = a3.x;
  -[HNDDisplayManager portraitUpScreenBounds](self, "portraitUpScreenBounds");
  double v8 = v7 - x;
  double v10 = v9 - y;
  double v11 = v7 - y;
  double v12 = v9 - x;
  if (a4 != 2)
  {
    double v12 = x;
    double v11 = y;
  }

  if (a4 == 3)
  {
    double v13 = x;
  }

  else
  {
    double v10 = v12;
    double v13 = v11;
  }

  if (a4 == 4) {
    double v10 = y;
  }
  else {
    double v8 = v13;
  }
  result.double y = v8;
  result.double x = v10;
  return result;
}

- (CGPoint)convertPointToPortraitUpOrientation:(CGPoint)a3
{
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGRect)screenBoundsForRockerButton:(id)a3
{
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)_longIdleTimerFired
{
  if (-[HNDDisplayManager isMenuVisible](self, "isMenuVisible"))
  {
    -[HNDRocker onScreenLocation](self->_rocker, "onScreenLocation");
    double v4 = v3;
    double v6 = v5;
    -[HNDDisplayManager showMenu:](self, "showMenu:", 0LL);
  }

  else
  {
    double v4 = -1.0;
    double v6 = -1.0;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
  objc_msgSend( v8,  "resetFingersToPoint:onDisplay:active:",  v7,  -[HNDView isActive](self->_fingerContentView, "isActive"),  v4,  v6);
}

- (void)updateNubbitForegroundImageForAction:(id)a3
{
  id v5 = a3;
  rocker = self->_rocker;
  id v7 = v5;
  if (rocker) {
    -[HNDRocker updateForegroundImageForAction:](rocker, "updateForegroundImageForAction:");
  }
  else {
    objc_storeStrong((id *)&self->_pendingForegroundImageAction, a3);
  }
}

- (void)activateDisplayItems
{
  if (!-[HNDView isActive](self->_rocker, "isActive"))
  {
    if (-[HNDDisplayManager isMenuVisible](self, "isMenuVisible")) {
      -[HNDView setIsActive:](self->_rocker, "setIsActive:", 1LL);
    }
  }

- (BOOL)fingerContentViewIsActive
{
  return -[HNDView isActive](self->_fingerContentView, "isActive");
}

- (void)setFingerContentViewIsActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[HNDDisplayManager _shouldSetFingerContentViewToActive:](self, "_shouldSetFingerContentViewToActive:")) {
    -[HNDView setIsActive:](self->_fingerContentView, "setIsActive:", v3);
  }
}

- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  if (-[HNDDisplayManager _shouldSetFingerContentViewToActive:](self, "_shouldSetFingerContentViewToActive:")) {
    -[HNDView setIsActive:withDuration:](self->_fingerContentView, "setIsActive:withDuration:", v5, a4);
  }
}

- (void)setFingerContentViewIsActive:(BOOL)a3 withDuration:(double)a4 options:(unint64_t)a5
{
  BOOL v7 = a3;
  if (-[HNDDisplayManager _shouldSetFingerContentViewToActive:](self, "_shouldSetFingerContentViewToActive:")) {
    -[HNDView setIsActive:withDuration:options:]( self->_fingerContentView,  "setIsActive:withDuration:options:",  v7,  a5,  a4);
  }
}

- (BOOL)_shouldSetFingerContentViewToActive:(BOOL)a3
{
  return 1;
}

- (void)_idleTimerFired
{
  longIdleTimer = self->_longIdleTimer;
  unsigned int v4 = -[HNDDisplayManager isMenuVisible](self, "isMenuVisible");
  double v5 = 7.0;
  if (v4) {
    double v5 = 30.0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100013C78;
  v6[3] = &unk_100121D18;
  v6[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](longIdleTimer, "afterDelay:processBlock:", v6, v5);
}

- (void)_startIdleTimer
{
  idleTimer = self->_idleTimer;
  -[HNDDisplayManager _idleTime](self, "_idleTime");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100013D00;
  v4[3] = &unk_100121D18;
  v4[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](idleTimer, "afterDelay:processBlock:", v4);
}

- (double)_idleTime
{
  return 3.0;
}

- (CGPoint)normalizedPointForDifference:(CGPoint)a3
{
  CGFloat y = a3.y;
  __asm { FMOV            V1.2D, #1.0 }

  float64x2_t v9 = vminnmq_f64( vmaxnmq_f64( vaddq_f64( vdivq_f64((float64x2_t)a3, (float64x2_t)vdupq_n_s64(0x4072C00000000000uLL)),  (float64x2_t)self->_currentPoint),  (float64x2_t)0),  _Q1);
  double v10 = v9.f64[1];
  result.double x = v9.f64[0];
  result.CGFloat y = v10;
  return result;
}

- (double)_rotationDegreesForOrientation:(int)a3
{
  double result = 0.0;
  return result;
}

- (CGAffineTransform)_transformForOrientation
{
  return CGAffineTransformMakeRotation(retstr, v4 * 0.0174532925);
}

- (void)_updateViewsForOrientation
{
  if (self->_orientation)
  {
    -[HNDDisplayManager _resetCurrentPointToInitialPoint](self, "_resetCurrentPointToInitialPoint");
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
    [v4 resetFingersIfNeededOnDisplay:v3];
  }

- (void)setOrientation:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (self->_orientation != (_DWORD)v4)
  {
LABEL_7:
    -[HNDDisplayManager _rotationDegreesForOrientation:](self, "_rotationDegreesForOrientation:", v4);
    double v11 = v10;
    -[HNDDisplayManager _rotationDegreesForOrientation:]( self,  "_rotationDegreesForOrientation:",  self->_orientation);
    double v13 = v12;
    id v14 = [UIApp windowRotationDuration];
    double v17 = v13 - v11;
    if (v13 - v11 < 0.0) {
      double v17 = -(v13 - v11);
    }
    if (v17 == 180.0) {
      double v18 = v16 + v16;
    }
    else {
      double v18 = v16;
    }
    int v19 = _AXSAssistiveTouchScannerEnabled(v14, v15);
    if (v19
      || -[HNDDisplayManager alwaysShowMenu](self, "alwaysShowMenu")
      || (-[HNDRocker alpha](self->_rocker, "alpha"), v20 != 0.0))
    {
      self->_int orientation = v4;
      -[HNDRocker alpha](self->_rocker, "alpha");
      BOOL v22 = v21 == 0.0;
      -[HNDRocker alpha](self->_rocker, "alpha");
      if (v23 >= 0.01) {
        double v24 = v23;
      }
      else {
        double v24 = 1.0;
      }
      double v25 = 0.0;
      if (!v19)
      {
        if (-[HNDRocker style](self->_rocker, "style")) {
          double v25 = 0.0;
        }
        else {
          double v25 = 0.2;
        }
      }

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000140A4;
      v33[3] = &unk_100121F58;
      BOOL v34 = v22;
      v33[4] = self;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100014184;
      v28[3] = &unk_100121FF8;
      v28[4] = self;
      BOOL v32 = v22;
      double v30 = v18;
      double v31 = v24;
      id v29 = v7;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v33,  v28,  v25);
    }

    else
    {
      -[HNDDisplayManager _updateViewsForOrientation](self, "_updateViewsForOrientation");
    }

    goto LABEL_27;
  }

  if ((_DWORD)v4)
  {
    id v6 = -[UIWindow isHidden](self->_window, "isHidden");
    if ((_DWORD)v6)
    {
      uint64_t v8 = ASTLogCommon(v6);
      float64x2_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "AST Windows: got same non-ambiguous orientation, but windows are hidden, so continue",  buf,  2u);
      }

      goto LABEL_7;
    }
  }

  uint64_t v26 = ASTLogCommon(v6);
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CGAffineTransform buf = 67109120;
    int v36 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "AST Windows: visible windows got same orientation, return. orientation: %d",  buf,  8u);
  }

LABEL_27:
}

- (int)orientation
{
  return self->_orientation;
}

- (BOOL)isCurrentOrientationLandscape
{
  return (self->_orientation - 3) < 2;
}

- (BOOL)initialMenuDownHasFinished
{
  return self->_menuOpenTime == -3061152000.0;
}

- (BOOL)initialDownMenuCanTransitionToPressDown
{
  return self->_menuOpenTime != -3061152000.0 && CFAbsoluteTimeGetCurrent() - self->_menuOpenTime > 0.15;
}

- (BOOL)hoverMovedToNormalizedPoint:(CGPoint)a3 shouldUpdateCurrentPoint:(BOOL)a4
{
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    if (a3.x == -1.0 && a3.y == -1.0)
    {
      uint64_t v8 = ASTLogCommon(self);
      float64x2_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1000AEB48();
      }
    }

    -[HNDDisplayManager _rotatedNormalizedInitialPoint](self, "_rotatedNormalizedInitialPoint");
    double v11 = self->_currentPoint.x;
    double v12 = self->_currentPoint.y;
    BOOL v14 = v12 != v13 || v11 != v10;
    BOOL v15 = v11 != x;
    if (v12 != y) {
      BOOL v15 = 1;
    }
    BOOL v16 = v14 && v15;
    self->_currentPoint.double x = x;
    self->_currentPoint.double y = y;
  }

  else
  {
    BOOL v16 = 0;
  }

  if (-[HNDDisplayManager isMenuVisible](self, "isMenuVisible"))
  {
    fingerContentView = self->_fingerContentView;
    -[HNDDisplayManager screenPoint](self, "screenPoint");
    -[HNDView convertPoint:toView:](fingerContentView, "convertPoint:toView:", self->_rocker);
    -[HNDRocker hoveredTo:](self->_rocker, "hoveredTo:");
  }

  -[HNDDisplayManager _startIdleTimer](self, "_startIdleTimer");
  -[HNDDisplayManager setFingerContentViewIsActive:](self, "setFingerContentViewIsActive:", 1LL);
  return v16;
}

- (CGPoint)screenPoint
{
  double v6 = sub_10002AFE4(0, self->_currentPoint.x, self->_currentPoint.y, v3, v4, v5);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)point
{
  double x = self->_currentPoint.x;
  double y = self->_currentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)screenBounds
{
  signed int v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self->_window, "screen"));
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)portraitUpScreenBounds
{
  signed int v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow screen](self->_window, "screen"));
  [v2 _referenceBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)rockerFrame
{
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)userInteractionEnabledOnRockerDismissView
{
  return -[HNDView isUserInteractionEnabled](self->_rockerDismiss, "isUserInteractionEnabled");
}

- (void)updateWithPrimaryFingerPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x == -1.0 && a3.y == -1.0)
  {
    uint64_t v7 = ASTLogCommon(self);
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000AEB74();
    }
  }

  -[HNDDisplayManager screenBounds](self, "screenBounds");
  self->_currentPoint.double x = sub_10002AFD8(x, y, v9, v10, v11);
  self->_currentPoint.double y = v12;
}

- (void)showCircleMenu:(BOOL)a3
{
}

- (void)performPress:(int)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  -[HNDDisplayManager activateDisplayItems](self, "activateDisplayItems");
  -[AXDispatchTimer cancel](self->_idleTimer, "cancel");
  if (-[HNDDisplayManager isMenuVisible](self, "isMenuVisible"))
  {
    if ((_DWORD)v5 == 2)
    {
      -[HNDRocker performPress:type:source:](self->_rocker, "performPress:type:source:", 2LL, v4, 2LL);
      goto LABEL_9;
    }

    if (!-[HNDDisplayManager initialMenuDownHasFinished](self, "initialMenuDownHasFinished"))
    {
      if (!-[HNDDisplayManager initialDownMenuCanTransitionToPressDown]( self,  "initialDownMenuCanTransitionToPressDown"))
      {
LABEL_8:
        self->_menuOpenTime = -3061152000.0;
        goto LABEL_9;
      }

      self->_menuDownWillFireAutomaticUp = 1;
    }

    -[HNDRocker performPress:type:source:](self->_rocker, "performPress:type:source:", v5, v4, 2LL);
    goto LABEL_8;
  }

- (CGPoint)_menuPointForFingerLayout
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
  [v3 preferredMenuDisplayPointOnDisplay:v4];
  double v6 = v5;
  double v8 = v7;

  -[HNDDisplayManager screenBounds](self, "screenBounds");
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (v6 == CGPointZero.x && v8 == CGPointZero.y)
  {
    +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
    double v19 = v18 * 0.5;
    double v6 = v14 * 0.5;
    -[HNDRocker frame](self->_rocker, "frame");
    double v8 = v19 + v20;
  }

  -[HNDDisplayManager _layoutPointForPoint:screenBounds:]( self,  "_layoutPointForPoint:screenBounds:",  v6,  v8,  v10,  v12,  v14,  v16);
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)_layoutPointForPoint:(CGPoint)a3 screenBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a3.y;
  double x = a3.x;
  +[HNDRocker initialRockerSize](&OBJC_CLASS___HNDRocker, "initialRockerSize", a3.x, a3.y, a4.origin.x, a4.origin.y);
  double v9 = v8;
  double v11 = v10;
  +[AXAssistiveTouchLayoutView minimumOuterPadding](&OBJC_CLASS___AXAssistiveTouchLayoutView, "minimumOuterPadding");
  double v13 = v12;
  double v14 = v12 + v9 * 0.5;
  if (x - v9 * 0.5 >= v12) {
    double v14 = x;
  }
  if (v12 + x + v9 * 0.5 > width) {
    double v15 = width - (v9 * 0.5 + v12);
  }
  else {
    double v15 = v14;
  }
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  double v17 = v11 * 0.5;
  if (y + v11 * 0.5 + v16 <= height)
  {
    if (y - v17 - v16 < 0.0)
    {
      double v20 = height - v13 - v17;
      double v21 = v13 + v17 + v16;
      if (v21 >= v20) {
        double y = v20;
      }
      else {
        double y = v21;
      }
    }
  }

  else
  {
    double v18 = v13 + v17;
    double v19 = height - (v13 + v17 + v16);
    if (v19 >= v18) {
      double y = v19;
    }
    else {
      double y = v18;
    }
  }

  double v22 = v15;
  double v23 = y;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (BOOL)visualsHidden
{
  BOOL result = v3 <= 0.0 && (-[HNDView alpha](self->_fingerContentView, "alpha"), v4 <= 0.0) || self->_visualsHidden;
  return result;
}

- (void)setVisualsHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v9 = ASTLogCommon(v8);
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CGAffineTransform buf = 67109634;
    BOOL v15 = v6;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 1024;
    BOOL v19 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Set visuals hidden: %i. Reason: %@. Animated: %i",  buf,  0x18u);
  }

  self->_visualsHidden = v6;
  double v11 = 0.0;
  if (v5) {
    +[HNDDisplayManager fadeDuration](&OBJC_CLASS___HNDDisplayManager, "fadeDuration", 0.0);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100014CB4;
  v12[3] = &unk_100121F58;
  v12[4] = self;
  BOOL v13 = v6;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v12, v11);
  if (!v6) {
    -[HNDRocker fadeNubbit](self->_rocker, "fadeNubbit");
  }
}

- (void)showMenu:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[HNDRocker isFullMenuVisible](self->_rocker, "isFullMenuVisible") != a3
    && !-[HNDRocker isAnimatingNubbit](self->_rocker, "isAnimatingNubbit"))
  {
    rocker = self->_rocker;
    __int128 v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v33[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    __int128 v7 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v33[1] = v6;
    v33[2] = v7;
    -[HNDRocker setTransform:](rocker, "setTransform:", v33);
    self->_BOOL nubbitMoving = 0;
    if (v3)
    {
      -[HNDRocker highlightNubbit](self->_rocker, "highlightNubbit");
      *(_WORD *)&self->_isPressedDown = 257;
      self->_menuOpenTime = CFAbsoluteTimeGetCurrent();
      -[HNDView setUserInteractionEnabled:](self->_rockerDismiss, "setUserInteractionEnabled:", 1LL);
      +[HNDDisplayManager fadeDuration](&OBJC_CLASS___HNDDisplayManager, "fadeDuration");
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1000150A0;
      v32[3] = &unk_100121D18;
      v32[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v32);
      -[HNDDisplayManager _menuPointForFingerLayout](self, "_menuPointForFingerLayout");
      double v9 = v8;
      double v11 = v10;
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
      [v12 specialToolUsageEnded:1];

      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
      [v13 resetFingersIfNeededOnDisplay:v14];

      LODWORD(v13) = -[HNDRocker style](self->_rocker, "style");
      -[HNDRocker setStyle:](self->_rocker, "setStyle:", 1LL);
      BOOL v15 = self->_rocker;
      if ((_DWORD)v13)
      {
        -[HNDRocker setFullMenuVisible:atPoint:](v15, "setFullMenuVisible:atPoint:", 1LL, v9, v11);
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
        [v16 resetFingersIfActiveOnDisplay:v17];
      }

      else
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_100015154;
        v30[3] = &unk_100121D18;
        v30[4] = self;
        -[HNDRocker transitionNubbitToMenu:concurrentAnimation:animationCompleted:]( v15,  "transitionNubbitToMenu:concurrentAnimation:animationCompleted:",  v30,  &stru_100122018,  v9,  v11);
      }
    }

    else
    {
      -[HNDView setUserInteractionEnabled:](self->_rockerDismiss, "setUserInteractionEnabled:", 0LL);
      +[HNDDisplayManager fadeDuration](&OBJC_CLASS___HNDDisplayManager, "fadeDuration");
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100015104;
      v31[3] = &unk_100121D18;
      v31[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v31);
      -[HNDDisplayManager _menuPointForFingerLayout](self, "_menuPointForFingerLayout");
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v18 eventManager]);
      [v19 manipulateDimTimer:0];

      -[HNDDisplayManager _nubbitPointForEdgePosition](self, "_nubbitPointForEdgePosition");
      -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", 0LL);
      double v22 = v20;
      double v23 = v21;
      if (self->_keyboardVisible
        && -[HNDDisplayManager _position:isOverKeyboard:]( self,  "_position:isOverKeyboard:",  v20,  v21,  self->_keyboardFrame.origin.x,  self->_keyboardFrame.origin.y,  self->_keyboardFrame.size.width,  self->_keyboardFrame.size.height))
      {
        -[HNDDisplayManager _nubbitPositionForKeyboardFrame:]( self,  "_nubbitPositionForKeyboardFrame:",  self->_keyboardFrame.origin.x,  self->_keyboardFrame.origin.y,  self->_keyboardFrame.size.width,  self->_keyboardFrame.size.height);
        double v22 = v24;
        double v23 = v25;
      }

      unsigned int v26 = -[HNDDisplayManager alwaysShowMenu](self, "alwaysShowMenu");
      uint64_t v27 = self->_rocker;
      if (v26) {
        -[HNDRocker transitionMenuToNubbit:changeAlpha:animate:]( v27,  "transitionMenuToNubbit:changeAlpha:animate:",  1LL,  1LL,  v22,  v23);
      }
      else {
        -[HNDRocker setFullMenuVisible:atPoint:](v27, "setFullMenuVisible:atPoint:", 0LL, v22, v23);
      }
    }

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 eventManager]);
    [v29 setMenuVisible:v3];
  }

- (BOOL)isMenuVisible
{
  return -[HNDRocker isFullMenuVisible](self->_rocker, "isFullMenuVisible");
}

- (void)restartWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASTLogCommon(v4);
  __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AST Windows: restart display manager", v7, 2u);
  }

  -[HNDDisplayManager cleanup](self, "cleanup");
  -[HNDDisplayManager initializeDisplayWithCompletion:](self, "initializeDisplayWithCompletion:", v4);
}

- (void)updateMenuStyle
{
  if (-[HNDDisplayManager alwaysShowMenu](self, "alwaysShowMenu") && !-[HNDRocker style](self->_rocker, "style"))
  {
    -[HNDDisplayManager _nubbitPointForEdgePosition](self, "_nubbitPointForEdgePosition");
    -[HNDDisplayManager _validateNubbitPosition:forKeyboard:](self, "_validateNubbitPosition:forKeyboard:", 0LL);
    -[HNDRocker transitionMenuToNubbit:changeAlpha:animate:]( self->_rocker,  "transitionMenuToNubbit:changeAlpha:animate:",  1LL,  1LL);
  }

  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 1LL);
}

- (void)_deviceCountChanged:(id)a3
{
}

- (void)deviceCountChanged:(int64_t)a3
{
  if (a3 < 1)
  {
    if (!a3)
    {
      if (-[HNDDisplayManager isMenuVisible](self, "isMenuVisible")) {
        -[HNDDisplayManager showMenu:](self, "showMenu:", 0LL);
      }
    }

    goto LABEL_7;
  }

  if (self->_ignoredWindow)
  {
    -[HNDDisplayManager hoverMovedToNormalizedPoint:shouldUpdateCurrentPoint:]( self,  "hoverMovedToNormalizedPoint:shouldUpdateCurrentPoint:",  0LL,  CGPointZero.x,  CGPointZero.y);
LABEL_7:
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
    [v4 resetFingersIfNeededOnDisplay:v5];

    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    [v6 updateMenuVisibility];

    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    [v7 updateSoftwareKeyboardState];

    -[HNDRocker forceReloadScrollMenuItems](self->_rocker, "forceReloadScrollMenuItems");
    return;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:"));
  -[HNDDisplayManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_deviceCountChanged:",  v8,  0.1);
}

- (void)updateRingerSwitch
{
}

- (void)updateRotationLockSwitch
{
}

- (BOOL)inNubbitMode
{
  return -[HNDRocker style](self->_rocker, "style") == 0;
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

- (void)viewPressedDown:(id)a3
{
  if (self->_rocker == a3 && ![a3 style])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 assistiveTouchMainScreenCustomization]);

    if (-[HNDRocker customizationMapAllowInstanceActivation:]( self->_rocker,  "customizationMapAllowInstanceActivation:",  v5))
    {
      -[HNDRocker showNubbitPressedState:](self->_rocker, "showNubbitPressedState:", 1LL);
    }
  }

- (void)viewOrbActionTriggered:(id)a3
{
  if (self->_rocker == a3 && ![a3 style])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 assistiveTouchOrbAction]);

    id v5 = v8;
    if (v8)
    {
      if ([v8 isEqualToString:AXAssistiveTouchIconTypeOpenMenu])
      {
        window = self->_window;
        AX_CGRectGetCenter(-[HNDRocker bounds](self->_rocker, "bounds"));
        -[UIWindow convertPoint:fromView:](window, "convertPoint:fromView:", self->_rocker);
        -[HNDDisplayManager closestNubbitPositionForPoint:offsetByMidpoint:]( self,  "closestNubbitPositionForPoint:offsetByMidpoint:",  1LL);
        -[HNDDisplayManager _updateNubbitEdgePosition:](self, "_updateNubbitEdgePosition:");
      }

      sub_10002BEE0(1LL);
      self->_playedHapticForCurrentEvent = 1;
      sub_10002AEE8(@"assistiveTouchOrbAction");
      __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
      [v7 setNubbitMoving:0];

      -[HNDRocker activateMenuItemDown:fromButtonPress:]( self->_rocker,  "activateMenuItemDown:fromButtonPress:",  v8,  0LL);
      -[HNDRocker activateMenuItemUp:fromButtonPress:](self->_rocker, "activateMenuItemUp:fromButtonPress:", v8, 0LL);
      id v5 = v8;
    }
  }

- (id)rocker
{
  return self->_rocker;
}

- (void)activateAssistiveTouchAction:(id)a3 fromButtonPress:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000156D8;
  v7[3] = &unk_100122068;
  v7[4] = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  __int128 v6 = objc_retainBlock(v7);
  ((void (*)(void))v6[2])();
}

- (void)viewPressedUp:(id)a3
{
  id v4 = (HNDRocker *)a3;
  p_super = &v4->super;
  if (self->_rocker == v4 && !-[HNDRocker style](v4, "style"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assistiveTouchLongPressAction]);

    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assistiveTouchDoubleTapAction]);

    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assistiveTouchSingleTapAction]);

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
    [v14 resetFingersIfActiveOnDisplay:v15];

    -[AXDispatchTimer cancel](self->_longPressTimer, "cancel");
    id v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    double v31 = sub_100015B18;
    BOOL v32 = &unk_100122090;
    __int128 v33 = self;
    id v16 = v11;
    id v34 = v16;
    id v17 = v9;
    id v35 = v17;
    id v18 = v13;
    id v36 = v18;
    BOOL v19 = objc_retainBlock(&v29);
    id v20 = -[AXDispatchTimer isPending](self->_doubleTapTimer, "isPending", v29, v30, v31, v32, v33);
    if ((_DWORD)v20
      && (id v20 = -[AXDispatchTimer isCancelled](self->_doubleTapTimer, "isCancelled"), (v20 & 1) == 0))
    {
      uint64_t v27 = ASTLogCommon(v20);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGAffineTransform buf = 138412290;
        id v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Performing double tap action: %@", buf, 0xCu);
      }

      -[HNDDisplayManager activateAssistiveTouchAction:fromButtonPress:]( self,  "activateAssistiveTouchAction:fromButtonPress:",  v16,  0LL);
      -[AXDispatchTimer cancel](self->_doubleTapTimer, "cancel");
    }

    else if (v16)
    {
      uint64_t v21 = ASTLogCommon(v20);
      double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        double v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        [v23 assistiveTouchDoubleTapActionTimeout];
        *(_DWORD *)CGAffineTransform buf = 134217984;
        id v38 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Waiting to see if double tap triggered: %f",  buf,  0xCu);
      }

      doubleTapTimer = self->_doubleTapTimer;
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v26 assistiveTouchDoubleTapActionTimeout];
      -[AXDispatchTimer afterDelay:processBlock:](doubleTapTimer, "afterDelay:processBlock:", v19);
    }

    else
    {
      ((void (*)(void ***))v19[2])(v19);
    }
  }

  else if (self->_rockerDismiss == p_super && -[HNDRocker style](self->_rocker, "style") == 1)
  {
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager handManager](self, "handManager"));
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hardwareIdentifier](self, "hardwareIdentifier"));
    [v6 menuExitedOnDisplay:v7];
  }
}

- (CGRect)orientedContinuousScrollViewFrameForScrollViewFrame:(CGRect)a3
{
  window = self->_window;
  -[HNDDisplayManager convertFrameToInterfaceOrientation:]( self,  "convertFrameToInterfaceOrientation:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[UIWindow convertRect:toView:](window, "convertRect:toView:", self->_fingerContentView);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)addUserInterfaceClientEnabler:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClientEnablers](self, "userInterfaceClientEnablers"));

  if (!v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[HNDDisplayManager setUserInterfaceClientEnablers:](self, "setUserInterfaceClientEnablers:", v6);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClientEnablers](self, "userInterfaceClientEnablers"));
  [v7 addObject:v4];

  -[HNDDisplayManager _setupUserInterfaceClient](self, "_setupUserInterfaceClient");
}

- (void)removeUserInterfaceClientEnabler:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClientEnablers](self, "userInterfaceClientEnablers"));
  [v5 removeObject:v4];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClientEnablers](self, "userInterfaceClientEnablers"));
  id v7 = [v6 count];

  if (!v7) {
    -[HNDDisplayManager _cleanupUserInterfaceClient](self, "_cleanupUserInterfaceClient");
  }
}

- (void)_setupUserInterfaceClient
{
  BOOL v3 = (AXUIClient *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClient](self, "userInterfaceClient"));
  if (!v3)
  {
    if ((AXInPreboardScenario() & 1) != 0) {
      return;
    }
    double v5 = -[AXUIClient initWithIdentifier:serviceBundleName:]( objc_alloc(&OBJC_CLASS___AXUIClient),  "initWithIdentifier:serviceBundleName:",  @"AssistiveTouchUIClient",  @"AssistiveTouch");
    -[HNDDisplayManager setUserInterfaceClient:](self, "setUserInterfaceClient:", v5);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClient](self, "userInterfaceClient"));
    [v4 sendAsynchronousMessage:0 withIdentifier:2 targetAccessQueue:0 completion:0];

    BOOL v3 = v5;
  }
}

- (void)_cleanupUserInterfaceClient
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClient](self, "userInterfaceClient"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClient](self, "userInterfaceClient"));
    [v4 sendAsynchronousMessage:0 withIdentifier:1 targetAccessQueue:0 completion:0];

    -[HNDDisplayManager setUserInterfaceClient:](self, "setUserInterfaceClient:", 0LL);
  }

- (void)showSimpleAlertWithText:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClientEnablers](self, "userInterfaceClientEnablers"));
  id v6 = [v5 count];

  if (!v6) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDDisplayManager.m",  3902LL,  "-[HNDDisplayManager showSimpleAlertWithText:]",  @"Tried to show alert without enabling user interface client");
  }
  if ([v4 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClient](self, "userInterfaceClient"));
    BOOL v9 = @"simple alert text";
    id v10 = v4;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    [v7 sendAsynchronousMessage:v8 withIdentifier:7 targetAccessQueue:0 completion:0];
  }
}

- (void)showSimpleBannerWithTitle:(id)a3 text:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClientEnablers](self, "userInterfaceClientEnablers"));
  id v9 = [v8 count];

  if (!v9) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDDisplayManager.m",  3911LL,  "-[HNDDisplayManager showSimpleBannerWithTitle:text:]",  @"Tried to show banner without enabling user interface client");
  }
  if (![v6 length] || !objc_msgSend(v7, "length"))
  {
    id v12 = v6;
    id v13 = v7;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDDisplayManager.m",  3912LL,  "-[HNDDisplayManager showSimpleBannerWithTitle:text:]",  @"Missing required text for banner. Title: %@, text: %@");
  }

  if (objc_msgSend(v6, "length", v12, v13) && objc_msgSend(v7, "length"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager userInterfaceClient](self, "userInterfaceClient"));
    v14[0] = @"simple banner title";
    v14[1] = @"simple banner text";
    v15[0] = v6;
    v15[1] = v7;
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    [v10 sendAsynchronousMessage:v11 withIdentifier:8 targetAccessQueue:0 completion:0];
  }
}

- (UIView)scannerContentView
{
  return self->_scannerContentView;
}

- (UIView)scannerFrontCursorView
{
  return self->_scannerFrontCursorView;
}

- (UIView)scannerBackCursorView
{
  return self->_scannerBackCursorView;
}

- (void)_layoutHUDView:(id)a3 withinBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double v13 = CGRectGetWidth(v21) / v10;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  double v14 = CGRectGetHeight(v22) / v12;
  if (v13 < v14) {
    double v14 = v13;
  }
  sCGFloat x = fmax(fmin(v14, 1.0), 0.5);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  CGFloat MidX = CGRectGetMidX(v23);
  double v16 = v10 * 0.5 + UIRoundToViewScale(v8, MidX - v10 * 0.5);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v24);
  objc_msgSend(v8, "setCenter:", v16, v12 * 0.5 + UIRoundToViewScale(v8, MidY - v12 * 0.5));
  objc_msgSend(v8, "setBounds:", CGRectZero.origin.x, CGRectZero.origin.y, v10, v12);
  CGAffineTransformMakeScale(&v20, sx, sx);
  CGAffineTransform v19 = v20;
  [v8 setTransform:&v19];
}

- (id)_itemForButton:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___UIAccessibilityHUDItem);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceSpecificImage]);

  id v7 = objc_msgSend( v4,  "initWithTitle:image:imageInsets:scaleImage:",  v5,  v6,  1,  UIEdgeInsetsZero.top,  UIEdgeInsetsZero.left,  UIEdgeInsetsZero.bottom,  UIEdgeInsetsZero.right);
  return v7;
}

- (BOOL)_shouldShowLargeContentViewer
{
  return 0;
}

- (void)_updateLargeContentViewerIfNeededForView:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager presentHUDViewTimer](self, "presentHUDViewTimer"));
  [v5 cancel];

  if (-[HNDDisplayManager _shouldShowLargeContentViewer](self, "_shouldShowLargeContentViewer")
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___HNDRockerButton, v6), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    && (id v8 = v4) != 0LL)
  {
    double v9 = v8;
    double v10 = self->_contentView;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager _itemForButton:](self, "_itemForButton:", v9));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hudView](self, "hudView"));

    if (v12)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hudView](self, "hudView"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 item]);
      unsigned __int8 v15 = [v11 isEqual:v14];

      if ((v15 & 1) == 0)
      {
        double v16 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hudView](self, "hudView"));
        [v16 setItem:v11];

        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hudView](self, "hudView"));
        -[UIView bounds](v10, "bounds");
        -[HNDDisplayManager _layoutHUDView:withinBounds:](self, "_layoutHUDView:withinBounds:", v17);
      }
    }

    else if (-[HNDDisplayManager shouldDelayBeforePresentingHUDView](self, "shouldDelayBeforePresentingHUDView"))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager presentHUDViewTimer](self, "presentHUDViewTimer"));

      if (!v18)
      {
        CGAffineTransform v19 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
        -[HNDDisplayManager setPresentHUDViewTimer:](self, "setPresentHUDViewTimer:", v19);
      }

      CGAffineTransform v20 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager presentHUDViewTimer](self, "presentHUDViewTimer"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100016668;
      v21[3] = &unk_1001220B8;
      v21[4] = self;
      id v22 = v11;
      CGRect v23 = v10;
      [v20 afterDelay:v21 processBlock:0.15];
    }

    else
    {
      -[HNDDisplayManager _presentLargeContentViewerForHUDItem:inContentView:]( self,  "_presentLargeContentViewerForHUDItem:inContentView:",  v11,  v10);
    }
  }

  else
  {
    -[HNDDisplayManager _hideLargeContentViewerIfNeeded](self, "_hideLargeContentViewerIfNeeded");
  }
}

- (void)_presentLargeContentViewerForHUDItem:(id)a3 inContentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v9 = ASTLogCommon(v7);
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000AEBCC();
    }
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hudView](self, "hudView"));

  if (v11)
  {
    uint64_t v13 = ASTLogCommon(v12);
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1000AEBA0();
    }
  }

  -[HNDDisplayManager _hideLargeContentViewerIfNeeded](self, "_hideLargeContentViewerIfNeeded");
  unsigned __int8 v15 = -[UIAccessibilityHUDView initWithHUDItem:]( objc_alloc(&OBJC_CLASS___UIAccessibilityHUDView),  "initWithHUDItem:",  v6);
  [v8 addSubview:v15];
  [v8 bounds];
  -[HNDDisplayManager _layoutHUDView:withinBounds:](self, "_layoutHUDView:withinBounds:", v15);
  -[UIAccessibilityHUDView showAnimated:completion:](v15, "showAnimated:completion:", 1LL, 0LL);
  -[HNDDisplayManager setHudView:](self, "setHudView:", v15);
}

- (void)_hideLargeContentViewerIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager presentHUDViewTimer](self, "presentHUDViewTimer"));
  [v3 cancel];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hudView](self, "hudView"));
  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDDisplayManager hudView](self, "hudView"));
    -[HNDDisplayManager setHudView:](self, "setHudView:", 0LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100016860;
    v7[3] = &unk_100121D18;
    id v8 = v5;
    id v6 = v5;
    [v6 dismissAnimated:1 completion:v7];
  }

- (CGPoint)_testingRockerPosition
{
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (BOOL)showingHoverOverMenu
{
  return self->_showingHoverOverMenu;
}

- (void)setShowingHoverOverMenu:(BOOL)a3
{
  self->_showingHoverOverMenu = a3;
}

- (HNDHandManager)handManager
{
  return (HNDHandManager *)objc_loadWeakRetained((id *)&self->_handManager);
}

- (void)setHandManager:(id)a3
{
}

- (AXPIFingerController)fingerController
{
  return self->_fingerController;
}

- (void)setFingerController:(id)a3
{
}

- (BOOL)isMainDisplay
{
  return self->_isMainDisplay;
}

- (void)setIsMainDisplay:(BOOL)a3
{
  self->_isMainDisplaCGFloat y = a3;
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (BOOL)alwaysShowMenu
{
  return self->_alwaysShowMenu;
}

- (void)setAlwaysShowMenu:(BOOL)a3
{
  self->_alwaysShowMenu = a3;
}

- (BOOL)playedHapticForCurrentEvent
{
  return self->_playedHapticForCurrentEvent;
}

- (void)setPlayedHapticForCurrentEvent:(BOOL)a3
{
  self->_playedHapticForCurrentEvent = a3;
}

- (AXUIClient)userInterfaceClient
{
  return self->_userInterfaceClient;
}

- (void)setUserInterfaceClient:(id)a3
{
}

- (double)lastMenuInteractionTime
{
  return self->_lastMenuInteractionTime;
}

- (void)setLastMenuInteractionTime:(double)a3
{
  self->_lastMenuInteractionTime = a3;
}

- (UIView)fingerContainerView
{
  return self->_fingerContainerView;
}

- (void)setFingerContainerView:(id)a3
{
}

- (AXDispatchTimer)presentHUDViewTimer
{
  return self->_presentHUDViewTimer;
}

- (void)setPresentHUDViewTimer:(id)a3
{
}

- (UIAccessibilityHUDView)hudView
{
  return self->_hudView;
}

- (void)setHudView:(id)a3
{
}

- (BOOL)shouldDelayBeforePresentingHUDView
{
  return self->_shouldDelayBeforePresentingHUDView;
}

- (void)setShouldDelayBeforePresentingHUDView:(BOOL)a3
{
  self->_shouldDelayBeforePresentingHUDView = a3;
}

- (NSString)reachabilityHandlerIdentifier
{
  return self->_reachabilityHandlerIdentifier;
}

- (void)setReachabilityHandlerIdentifier:(id)a3
{
}

- (double)reachabilityOffset
{
  return self->_reachabilityOffset;
}

- (void)setReachabilityOffset:(double)a3
{
  self->_reachabilityOffset = a3;
}

- (NSMutableSet)userInterfaceClientEnablers
{
  return self->_userInterfaceClientEnablers;
}

- (void)setUserInterfaceClientEnablers:(id)a3
{
}

- (BOOL)assistiveTouchMousePointerTimeoutEnabled
{
  return self->_assistiveTouchMousePointerTimeoutEnabled;
}

- (void)setAssistiveTouchMousePointerTimeoutEnabled:(BOOL)a3
{
  self->_assistiveTouchMousePointerTimeoutEnabled = a3;
}

- (double)assistiveTouchMousePointerTimeout
{
  return self->_assistiveTouchMousePointerTimeout;
}

- (void)setAssistiveTouchMousePointerTimeout:(double)a3
{
  self->_assistiveTouchMousePointerTimeout = a3;
}

- (double)assistiveTouchMouseDwellControlActivationTimeout
{
  return self->_assistiveTouchMouseDwellControlActivationTimeout;
}

- (void)setAssistiveTouchMouseDwellControlActivationTimeout:(double)a3
{
  self->_assistiveTouchMouseDwellControlActivationTimeout = a3;
}

- (void).cxx_destruct
{
}

@end