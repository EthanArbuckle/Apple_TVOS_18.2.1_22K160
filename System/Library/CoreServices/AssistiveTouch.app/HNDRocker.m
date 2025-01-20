@interface HNDRocker
+ (CGSize)initialRockerSize;
+ (CGSize)nubbitSize;
- ($01BB1521EC52D44A8E7628F5261DCEC8)rockerButtonGuttersForRockerButton:(id)a3;
- (AXAssertion)disableDashBoardGesturesAssertion;
- (BOOL)_angleIndicatesReturnToCenter:(double)a3;
- (BOOL)_backButtonShouldBeHidden;
- (BOOL)_includeRingerButtonInHardware;
- (BOOL)_replaceRingerWithOrientationLock;
- (BOOL)accessibilityPerformEscape;
- (BOOL)activateMenuItemDown:(id)a3 fromButtonPress:(BOOL)a4;
- (BOOL)activateMenuItemUp:(id)a3 fromButtonPress:(BOOL)a4;
- (BOOL)customizationMapAllowInstanceActivation:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isAnimatingNubbit;
- (BOOL)isFullMenuVisible;
- (BOOL)shouldForciblyHideBackButtonForAnimation;
- (BOOL)shouldIgnoreNextHome;
- (BSInvalidatable)hitTestCategoryAssertion;
- (CGPoint)_initialPointForGesture;
- (CGPoint)onScreenLocation;
- (CGRect)onScreenFrameForRockerButton:(id)a3;
- (HNDDisplayManager)displayManager;
- (HNDRocker)initWithFrame:(CGRect)a3;
- (HNDRockerButton)appSwitcherButton;
- (HNDRockerButton)gesturesButton;
- (HNDRockerButton)moreButton;
- (HNDRockerButton)reachabilityButton;
- (HNDRockerButton)sideAppButton;
- (HNDRockerButton)speakScreenButton;
- (HNDRockerButton)toggleDockButton;
- (HNDRockerButton)tripleClickHomeButton;
- (NSArray)backButtonConstraints;
- (NSArray)dockSpecificButtons;
- (NSArray)sideAppMoreRockerItems;
- (NSMutableArray)dwellItems;
- (NSMutableArray)hardwareItems;
- (NSMutableArray)initialItems;
- (NSMutableArray)moreItems;
- (NSMutableArray)rotateItems;
- (NSMutableArray)scrollItems;
- (NSMutableArray)siriShortcutsItems;
- (NSMutableArray)touchItems;
- (NSMutableDictionary)buttonsByMedusaGesture;
- (NSString)hardwareIdentifier;
- (NSString)lastMenuItemActivated;
- (id)_filteredItems:(id)a3;
- (id)_rockerButtonForLocation:(id)a3 buttonType:(id)a4;
- (id)_rockerItemsByLocation;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)animationEndButtonForButtonTag:(int)a3;
- (id)currentlyVisibleRockerItems;
- (id)rockerHitTest:(CGPoint)a3;
- (int)style;
- (int64_t)_indexForAngle:(double)a3;
- (int64_t)state;
- (uint64_t)_usesCircularNubbit;
- (void)_actionButtonPressed;
- (void)_activateLockButton;
- (void)_addFavoriteBoxPressed;
- (void)_addNewButtonsToView;
- (void)_applePayButtonPressed:(id)a3;
- (void)_armApplePay;
- (void)_assignLocationsToRockerItems;
- (void)_cameraButtonDoubleLightPressed;
- (void)_cameraButtonLightPressed;
- (void)_cameraButtonPressed;
- (void)_cameraPressed;
- (void)_centerBackButtonToView:(id)a3;
- (void)_commandAndControlPressed;
- (void)_continuousScrollPressed:(id)a3 fromButtonPress:(BOOL)a4 inDirection:(unint64_t)a5 iconType:(id)a6;
- (void)_controlCenterPressed;
- (void)_customGesturePressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_customsPressed:(id)a3;
- (void)_detectionModePresssed;
- (void)_dimFlashingLightsPressed;
- (void)_disableUserInterfaceClient;
- (void)_dockPressed;
- (void)_doubleTapPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_dragAndDropPressed:(id)a3 fromButtonPress:(BOOL)a4 dragMenu:(BOOL)a5;
- (void)_frontFacingCameraPressed;
- (void)_gesturesPressed:(id)a3;
- (void)_goBackInMenuState:(int)a3;
- (void)_handleTouch:(int64_t)a3;
- (void)_hardwareButtonPressed:(id)a3;
- (void)_highlightRockerButtonAtAngle:(double)a3;
- (void)_initializeNubbit;
- (void)_layoutButtonsWithViewForCenteringAtStart:(id)a3 includingBackButton:(BOOL)a4;
- (void)_layoutForegroundImageView;
- (void)_layoutMenuItems:(BOOL)a3 oldRockers:(id)a4 viewForCenteringAtStart:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6;
- (void)_layoutMenuItemsInReverse:(BOOL)a3 oldRockers:(id)a4 animateToIcon:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6;
- (void)_loadFavoritesMenuItems;
- (void)_loadGesturesMenuItems;
- (void)_loadHardwareMenuItems;
- (void)_loadInitialMenuItems;
- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6;
- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a7;
- (void)_loadMoreMenuItems;
- (void)_loadRotateMenuItems;
- (void)_loadScrollMenuItems;
- (void)_lockButton:(BOOL)a3;
- (void)_longPressPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_menuExited;
- (void)_morePressed:(id)a3;
- (void)_mutePressed;
- (void)_notificationCenterPressed;
- (void)_openVisualIntelligence;
- (void)_orbPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_orientationPressed:(id)a3;
- (void)_pinchPressed:(id)a3 mode:(unint64_t)a4;
- (void)_preloadInitialMenuItems;
- (void)_pushMenuItemsFromSender:(id)a3;
- (void)_reachabilityPressed;
- (void)_rebootDevicePressed;
- (void)_resetHoverCircleLocation;
- (void)_resetVisibility:(BOOL)a3;
- (void)_ringerPressed:(BOOL)a3;
- (void)_ringerSwitchPressed:(BOOL)a3;
- (void)_rotationLockPressed;
- (void)_screenshotPressed;
- (void)_scrollPressed:(id)a3;
- (void)_scrollPressed:(id)a3 fromButtonPress:(BOOL)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7;
- (void)_setBackgroundWithType:(int)a3;
- (void)_setRingerSwitchIcon:(id)a3;
- (void)_setRotationLockIcon:(id)a3;
- (void)_shakePressed;
- (void)_sideAppMorePressed:(id)a3;
- (void)_sideAppPressed:(id)a3;
- (void)_siriButtonPressed;
- (void)_siriPrefsChanged:(id)a3;
- (void)_sosPressed;
- (void)_spotlightPressed:(id)a3;
- (void)_sysdiagnosePressed;
- (void)_tapPressed:(id)a3 fromButtonPress:(BOOL)a4;
- (void)_toggleAppSwitcher;
- (void)_toggleHoverTextTyping;
- (void)_tripleClickHomePressed;
- (void)_typeToSiriButtonPressed;
- (void)_updateBackButtonVisibility;
- (void)_updateKeyboardFocusIfNeeded;
- (void)_updateNubbitFadedProperties;
- (void)_updateProgress:(id)a3;
- (void)_updateRockerItemIfNeededForItem:(id)a3;
- (void)_updateSelectedButton;
- (void)_updateSelectedButton:(id)a3;
- (void)_updateVolumeDisplay;
- (void)_voiceControlPressed;
- (void)_volumeDown:(BOOL)a3;
- (void)_volumeUp:(BOOL)a3;
- (void)dealloc;
- (void)didFailToFloatApp;
- (void)didFailToPinApp;
- (void)didMoveToWindow;
- (void)fadeNubbit;
- (void)forceReloadScrollMenuItems;
- (void)handleRealDownEvent:(CGPoint)a3;
- (void)handleRealMoveEvent:(CGPoint)a3 maxOrb:(double)a4 currentForce:(double)a5;
- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4;
- (void)highlightNubbit;
- (void)hoveredTo:(CGPoint)a3;
- (void)hoveredToRockerButton:(id)a3;
- (void)performPress:(int)a3 type:(int)a4 source:(int)a5;
- (void)resetOrbAction;
- (void)setAppSwitcherButton:(id)a3;
- (void)setBackButtonConstraints:(id)a3;
- (void)setButtonsByMedusaGesture:(id)a3;
- (void)setDisableDashBoardGesturesAssertion:(id)a3;
- (void)setDisplayManager:(id)a3;
- (void)setDockSpecificButtons:(id)a3;
- (void)setDwellItems:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFullMenuVisible:(BOOL)a3 atPoint:(CGPoint)a4;
- (void)setGesturesButton:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setHardwareItems:(id)a3;
- (void)setHitTestCategoryAssertion:(id)a3;
- (void)setInitialItems:(id)a3;
- (void)setLastMenuItemActivated:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setMoreItems:(id)a3;
- (void)setNubbitVisible:(BOOL)a3;
- (void)setReachabilityButton:(id)a3;
- (void)setRotateItems:(id)a3;
- (void)setScrollItems:(id)a3;
- (void)setShouldForciblyHideBackButtonForAnimation:(BOOL)a3;
- (void)setShouldIgnoreNextHome:(BOOL)a3;
- (void)setSideAppButton:(id)a3;
- (void)setSideAppMoreRockerItems:(id)a3;
- (void)setSiriShortcutsItems:(id)a3;
- (void)setSpeakScreenButton:(id)a3;
- (void)setStyle:(int)a3;
- (void)setToggleDockButton:(id)a3;
- (void)setTouchItems:(id)a3;
- (void)setTripleClickHomeButton:(id)a3;
- (void)setUseCircleMode:(BOOL)a3;
- (void)showBannerWithText:(id)a3;
- (void)showMiddleCircle:(BOOL)a3;
- (void)showNubbitPressedState:(BOOL)a3;
- (void)showVolumeBar:(BOOL)a3 withProgress:(double)a4;
- (void)showVolumeDisplayImmediately;
- (void)transitionMenuToNubbit:(CGPoint)a3 changeAlpha:(BOOL)a4 animate:(BOOL)a5;
- (void)transitionNubbitToMenu:(CGPoint)a3 concurrentAnimation:(id)a4 animationCompleted:(id)a5;
- (void)updateRingerSwitch;
- (void)updateRockersForSubstantialTransition;
- (void)updateRotationLockSwitch;
- (void)volumeChanged;
@end

@implementation HNDRocker

- (uint64_t)_usesCircularNubbit
{
  return AXDeviceHasHomeButton(a1, a2) ^ 1;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker disableDashBoardGesturesAssertion](self, "disableDashBoardGesturesAssertion"));

    if (!v4)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableDashboardSystemGestures,  @"AST menu active"));
      -[HNDRocker setDisableDashBoardGesturesAssertion:](self, "setDisableDashBoardGesturesAssertion:", v5);
    }
  }

  else
  {
    -[HNDRocker setDisableDashBoardGesturesAssertion:](self, "setDisableDashBoardGesturesAssertion:", 0LL);
  }

- (HNDRocker)initWithFrame:(CGRect)a3
{
  v89.receiver = self;
  v89.super_class = (Class)&OBJC_CLASS___HNDRocker;
  v3 = -[HNDView initWithFrame:](&v89, "initWithFrame:");
  -[HNDRocker setAlpha:](v3, "setAlpha:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[HNDRocker setBackgroundColor:](v3, "setBackgroundColor:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker layer](v3, "layer"));
  [v5 setMasksToBounds:0];

  -[HNDRocker setClipsToBounds:](v3, "setClipsToBounds:", 0LL);
  -[HNDRocker setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 1LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker layer](v3, "layer"));
  [v6 setDisableUpdateMask:32];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"NubbitCenter"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 imageWithRenderingMode:2]);
  nubbitImage = v3->_nubbitImage;
  v3->_nubbitImage = (UIImage *)v8;

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 1203LL));
  v10 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v78);
  backdropView = v3->_backdropView;
  v3->_backdropView = v10;

  -[HNDRocker _setOverrideUserInterfaceStyle:](v3, "_setOverrideUserInterfaceStyle:", 2LL);
  if (-[HNDRocker _usesCircularNubbit](v3, "_usesCircularNubbit"))
  {
    v12 = objc_alloc(&OBJC_CLASS___UIView);
    -[UIVisualEffectView bounds](v3->_backdropView, "bounds");
    v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
    maskImageView = v3->_maskImageView;
    v3->_maskImageView = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v3->_maskImageView, "setBackgroundColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_maskImageView, "layer"));
    [v16 setCornerCurve:kCACornerCurveContinuous];

    LODWORD(v16) = AXDeviceIsPad(v17, v18);
    +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
    double v20 = v19;
    if ((_DWORD)v16)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_maskImageView, "layer"));
      [v21 setCornerRadius:v20 * 13.0 / 60.0];
    }

    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_maskImageView, "layer"));
      [v21 setCornerRadius:v20 * 0.5];
    }
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"MenuMask"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "resizableImageWithCapInsets:resizingMode:", 1, 29.0, 29.0, 29.0, 29.0));

    v23 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v21);
    v24 = v3->_maskImageView;
    v3->_maskImageView = &v23->super;
  }

  -[UIView setAutoresizingMask:](v3->_maskImageView, "setAutoresizingMask:", 18LL);
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  stackState = v3->_stackState;
  v3->_stackState = v25;

  -[UIVisualEffectView setMaskView:](v3->_backdropView, "setMaskView:", v3->_maskImageView);
  -[HNDRocker addSubview:](v3, "addSubview:", v3->_backdropView);
  v27 = objc_alloc_init(&OBJC_CLASS___AXAssistiveTouchLayoutView);
  layoutView = v3->_layoutView;
  v3->_layoutView = v27;

  -[AXAssistiveTouchLayoutView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_layoutView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backdropView, "contentView"));
  [v29 addSubview:v3->_layoutView];

  objc_initWeak(&location, v3);
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_100030A88;
  v86[3] = &unk_100122BE8;
  objc_copyWeak(&v87, &location);
  LOBYTE(v69) = 1;
  uint64_t v30 = objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  0LL,  @"BackArrow",  0LL,  v86,  v3,  1LL,  v69));
  backButton = v3->_backButton;
  v3->_backButton = (HNDRockerButton *)v30;

  -[HNDRockerButton setIsBackButton:](v3->_backButton, "setIsBackButton:", 1LL);
  -[HNDRockerButton setAlpha:](v3->_backButton, "setAlpha:", 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backdropView, "contentView"));
  [v32 addSubview:v3->_backButton];

  v33 = (NSMutableArray *)[objc_allocWithZone(NSMutableArray) init];
  rockerItems = v3->_rockerItems;
  v3->_rockerItems = v33;

  v3->_state = 1LL;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100030AB8;
  v84[3] = &unk_100121EE8;
  objc_copyWeak(&v85, &location);
  id v36 = objc_loadWeakRetained(&location);
  [v35 registerUpdateBlock:v84 forRetrieveSelector:"assistiveTouchIdleOpacity" withListener:v36];

  objc_destroyWeak(&v85);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v37 addObserver:v3 selector:"_siriPrefsChanged:" name:AFPreferencesDidChangeNotification object:0];

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v38 addObserver:v3 selector:"_siriPrefsChanged:" name:kAXSHomeButtonAssistantChangedNotification object:0];

  uint64_t v39 = AXPIDefaultAppearanceForDevice(-[HNDRocker setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 1LL));
  v77 = (void *)objc_claimAutoreleasedReturnValue(v39);
  id v40 = [v77 fingerWidth];
  double v42 = v41;
  double Center = AX_CGRectGetCenter(v40);
  v45 = -[AXPIFingerView initWithFrame:appearanceDelegate:]( objc_alloc(&OBJC_CLASS___AXPIFingerView),  "initWithFrame:appearanceDelegate:",  v77,  Center - v42 * 0.5,  v44 - v42 * 0.5,  v42,  v42);
  middleCircle = v3->_middleCircle;
  v3->_middleCircle = v45;

  -[AXPIFingerView setHidden:](v3->_middleCircle, "setHidden:", 1LL);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backdropView, "contentView"));
  [v47 addSubview:v3->_middleCircle];

  id v48 = objc_allocWithZone(&OBJC_CLASS___AXDispatchTimer);
  v49 = &_dispatch_main_q;
  v50 = (AXDispatchTimer *)[v48 initWithTargetSerialQueue:&_dispatch_main_q];
  volumeUpdateTimer = v3->_volumeUpdateTimer;
  v3->_volumeUpdateTimer = v50;

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  v3->_isNubbitVisible = [v52 alwaysShowMenu];

  v53 = (AXDispatchTimer *)[objc_allocWithZone(AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  homeButtonDismissTimer = v3->_homeButtonDismissTimer;
  v3->_homeButtonDismissTimer = v53;

  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_100030B14;
  v82[3] = &unk_100121D18;
  v79 = v3;
  v83 = v79;
  AXPerformBlockAsynchronouslyOnMainThread(v82);
  v55 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
  nubbitFadeTimer = v79->_nubbitFadeTimer;
  v79->_nubbitFadeTimer = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_100030B1C;
  v80[3] = &unk_100121EE8;
  objc_copyWeak(&v81, &location);
  [v57 registerUpdateBlock:v80 forRetrieveSelector:"assistiveTouchMainScreenCustomization" withListener:v79];

  objc_destroyWeak(&v81);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssistiveTouchLayoutView topAnchor](v3->_layoutView, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backdropView, "contentView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue([v76 topAnchor]);
  v73 = (void *)objc_claimAutoreleasedReturnValue([v75 constraintEqualToAnchor:v74]);
  v90[0] = v73;
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssistiveTouchLayoutView bottomAnchor](v3->_layoutView, "bottomAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backdropView, "contentView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue([v72 bottomAnchor]);
  v58 = (void *)objc_claimAutoreleasedReturnValue([v71 constraintEqualToAnchor:v70]);
  v90[1] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssistiveTouchLayoutView leadingAnchor](v3->_layoutView, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backdropView, "contentView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v60 leadingAnchor]);
  v62 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v61]);
  v90[2] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssistiveTouchLayoutView trailingAnchor](v3->_layoutView, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_backdropView, "contentView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v64 trailingAnchor]);
  v66 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v65]);
  v90[3] = v66;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v67);

  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);

  return v79;
}

- (void)dealloc
{
  DarwinNotifydouble Center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSTripleHomeEnabledNotification, 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hitTestCategoryAssertion](self, "hitTestCategoryAssertion"));
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HNDRocker;
  -[HNDRocker dealloc](&v5, "dealloc");
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___HNDRocker;
  -[HNDRocker setFrame:](&v33, "setFrame:");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker displayManager](self, "displayManager"));
  [v8 screenBounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  CGFloat v18 = v17 / -3.0;
  CGFloat v20 = v19 / -3.0;
  v34.origin.double x = v10;
  v34.origin.double y = v12;
  v34.size.double width = v14;
  v34.size.CGFloat height = v16;
  CGRect v35 = CGRectInset(v34, v18, v20);
  CGFloat v21 = v35.origin.x;
  CGFloat v22 = v35.origin.y;
  CGFloat v23 = v35.size.width;
  CGFloat v24 = v35.size.height;
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.double width = width;
  double rect = height;
  v35.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v35);
  v36.origin.double x = v21;
  v36.origin.double y = v22;
  v36.size.double width = v23;
  v36.size.CGFloat height = v24;
  if (MaxX > CGRectGetMaxX(v36)) {
    goto LABEL_5;
  }
  v37.origin.double x = x;
  v37.origin.double y = y;
  v37.size.double width = width;
  v37.size.CGFloat height = rect;
  double MaxY = CGRectGetMaxY(v37);
  v38.origin.double x = v21;
  v38.origin.double y = v22;
  v38.size.double width = v23;
  v38.size.CGFloat height = v24;
  if (MaxY > CGRectGetMaxY(v38)) {
    goto LABEL_5;
  }
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.CGFloat height = rect;
  double MinX = CGRectGetMinX(v39);
  v40.origin.double x = v21;
  v40.origin.double y = v22;
  v40.size.double width = v23;
  v40.size.CGFloat height = v24;
  if (MinX < CGRectGetMinX(v40)) {
    goto LABEL_5;
  }
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.CGFloat height = rect;
  double MinY = CGRectGetMinY(v41);
  v42.origin.double x = v21;
  v42.origin.double y = v22;
  v42.size.double width = v23;
  v42.size.CGFloat height = v24;
  if (MinY < CGRectGetMinX(v42))
  {
LABEL_5:
    uint64_t v30 = ASTLogCommon(v26);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      sub_1000AF424(v31, x, y, width, rect, v21, v22, v23, v24);
    }
  }
}

- (void)_siriPrefsChanged:(id)a3
{
}

- (void)showMiddleCircle:(BOOL)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)_backButtonShouldBeHidden
{
  if (self->_state == 1 || self->_volumeBar || !self->_backgroundType) {
    return 1;
  }
  else {
    return -[HNDRocker shouldForciblyHideBackButtonForAnimation](self, "shouldForciblyHideBackButtonForAnimation");
  }
}

- (void)_updateBackButtonVisibility
{
  unsigned int v3 = -[HNDRocker _backButtonShouldBeHidden](self, "_backButtonShouldBeHidden");
  double v4 = 1.0;
  if (v3) {
    double v4 = 0.0;
  }
  -[HNDRockerButton setAlpha:](self->_backButton, "setAlpha:", v4);
  -[HNDRockerButton setUserInteractionEnabled:](self->_backButton, "setUserInteractionEnabled:", v3 ^ 1);
}

- (void)_updateProgress:(id)a3
{
  id v4 = a3;
  if (self->_startInterval == 0.0)
  {
    self->_startInterval = CFAbsoluteTimeGetCurrent();
    -[HNDRocker _loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:]( self,  "_loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:",  1LL,  0LL,  0LL,  self->_state);
  }

  self->_double progress = (CFAbsoluteTimeGetCurrent() - self->_startInterval) / 0.2;
  -[HNDRocker setNeedsDisplay](self, "setNeedsDisplay");
  double progress = self->_progress;
  if ((progress >= 0.5 || !self->_useCircle) && !self->_sentRockers)
  {
    self->_sentRockers = 1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100030FF8;
    v7[3] = &unk_100121D18;
    v7[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v7, 0.2);
    double progress = self->_progress;
  }

  if (progress >= 1.0)
  {
    self->_double progress = 1.0;
    -[HNDRocker setNeedsDisplay](self, "setNeedsDisplay");
    self->_linkRunning = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v4 removeFromRunLoop:v6 forMode:NSDefaultRunLoopMode];
  }
}

- (BOOL)_replaceRingerWithOrientationLock
{
  if (AXDeviceIsPad(self, a2) && !j__AXDeviceIsRingerSwitchAvailable())
  {
    return AXAssistiveAccessEnabled() ^ 1;
  }

  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    else {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (BOOL)_includeRingerButtonInHardware
{
  if ((AXDeviceIsPad(self, a2) & 1) != 0) {
    return 1;
  }
  else {
    return j__AXDeviceIsRingerSwitchAvailable();
  }
}

- (int64_t)_indexForAngle:(double)a3
{
  id v4 = -[NSMutableArray count](self->_rockerItems, "count");
  if (v4 == (id)6)
  {
    int64_t result = 0LL;
    if (a3 < 315.0 && a3 >= 0.0)
    {
      if (a3 >= 45.0)
      {
        if (a3 >= 135.0)
        {
          if (a3 < 180.0) {
            return 3LL;
          }
          if (a3 < 225.0) {
            return 4LL;
          }
          BOOL v6 = a3 >= 315.0 || a3 < 225.0;
          int64_t v7 = 5LL;
          goto LABEL_27;
        }

        return 2LL;
      }

      return 1LL;
    }
  }

  else
  {
    if (v4 != (id)4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    int64_t result = 0LL;
    if (a3 < 315.0 && a3 >= 45.0)
    {
      if (a3 >= 135.0)
      {
        if (a3 >= 225.0)
        {
          BOOL v6 = a3 >= 315.0 || a3 < 225.0;
          int64_t v7 = 3LL;
LABEL_27:
          if (v6) {
            return 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            return v7;
          }
        }

        return 2LL;
      }

      return 1LL;
    }
  }

  return result;
}

- (void)_highlightRockerButtonAtAngle:(double)a3
{
  int64_t v4 = -[HNDRocker _indexForAngle:](self, "_indexForAngle:", a3);
  self->_selectedButtonIndedouble x = v4;
  -[HNDRockerButton setSelected:](self->_selectedButton, "setSelected:", 0LL);
  objc_super v5 = (HNDRockerButton *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_rockerItems, "objectAtIndex:", v4));
  selectedButton = self->_selectedButton;
  self->_selectedButton = v5;

  -[HNDRockerButton setSelected:](self->_selectedButton, "setSelected:", 1LL);
  -[AXPIFingerView setSelected:](self->_middleCircle, "setSelected:", 0LL);
}

- (BOOL)_angleIndicatesReturnToCenter:(double)a3
{
  id v5 = -[NSMutableArray count](self->_rockerItems, "count");
  if (v5 == (id)6)
  {
    selectedButtonIndedouble x = self->_selectedButtonIndex;
    if (a3 >= 225.0 || (a3 >= 135.0 ? (BOOL v13 = selectedButtonIndex == 0) : (BOOL v13 = 0), !v13))
    {
      if (a3 >= 225.0 || (a3 >= 135.0 ? (BOOL v14 = selectedButtonIndex == 1) : (BOOL v14 = 0), !v14))
      {
        if (a3 >= 315.0 || (a3 >= 225.0 ? (BOOL v15 = selectedButtonIndex == 2) : (BOOL v15 = 0), !v15))
        {
          BOOL v17 = a3 >= 315.0 && (unint64_t)(selectedButtonIndex - 3) < 2;
          BOOL result = 1;
          if (a3 >= 45.0 && !v17 && (a3 >= 135.0 || a3 < 45.0 || selectedButtonIndex != 5)) {
            return 0;
          }
          return result;
        }
      }
    }

    return 1;
  }

  if (v5 != (id)4) {
    return 0;
  }
  int64_t v6 = self->_selectedButtonIndex;
  if (a3 < 225.0 && a3 >= 135.0 && v6 == 0) {
    return 1;
  }
  if (a3 < 315.0 && a3 >= 225.0 && v6 == 1) {
    return 1;
  }
  BOOL v10 = a3 >= 315.0 && v6 == 2;
  BOOL result = 1;
  if (a3 >= 45.0 && !v10 && (a3 >= 135.0 || a3 < 45.0 || v6 != 3)) {
    return 0;
  }
  return result;
}

- (id)rockerHitTest:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  BOOL v15 = sub_100031594;
  CGFloat v16 = sub_1000315A4;
  id v17 = 0LL;
  int64_t v6 = self->_rockerItems;
  -[HNDRockerButton alpha](self->_backButton, "alpha");
  if (v7 == 1.0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObject:](v6, "arrayByAddingObject:", self->_backButton));

    int64_t v6 = (NSMutableArray *)v8;
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000315AC;
  v11[3] = &unk_100122C10;
  *(CGFloat *)&v11[6] = x;
  *(CGFloat *)&v11[7] = y;
  v11[4] = self;
  v11[5] = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v11);
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)_updateSelectedButton
{
  if ((-[AXPIFingerView isHidden](self->_middleCircle, "isHidden") & 1) == 0)
  {
    -[AXPIFingerView convertPoint:toView:]( self->_middleCircle,  "convertPoint:toView:",  self,  AX_CGRectGetCenter(-[AXPIFingerView bounds](self->_middleCircle, "bounds")));
    -[HNDRocker hoveredTo:](self, "hoveredTo:");
  }

- (void)_updateSelectedButton:(id)a3
{
  id v5 = (HNDRockerButton *)a3;
  p_selectedButton = &self->_selectedButton;
  selectedButton = self->_selectedButton;
  if (selectedButton != v5)
  {
    id v9 = v5;
    -[HNDRockerButton setSelected:](selectedButton, "setSelected:", 0LL);
    -[HNDRockerButton setHighlighted:](*p_selectedButton, "setHighlighted:", 0LL);
    objc_storeStrong((id *)&self->_selectedButton, a3);
    -[HNDRockerButton setSelected:](*p_selectedButton, "setSelected:", 1LL);
    id v8 = -[NSMutableArray indexOfObject:](self->_rockerItems, "indexOfObject:", *p_selectedButton);
    id v5 = v9;
    self->_selectedButtonIndeCGFloat x = (int64_t)v8;
  }
}

- (void)hoveredTo:(CGPoint)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[HNDRocker rockerHitTest:](self, "rockerHitTest:", a3.x, a3.y));
  -[HNDRocker hoveredToRockerButton:](self, "hoveredToRockerButton:", v4);
}

- (void)hoveredToRockerButton:(id)a3
{
}

- (CGRect)onScreenFrameForRockerButton:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 imageView]);
  [v5 frame];
  double x = v6;
  double y = v8;
  double width = v10;
  double height = v12;

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 label]);
  if (v14)
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v4 imageView]);
    [v15 frame];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue([v4 label]);
    [v24 frame];
    v44.origin.double x = v25;
    v44.origin.double y = v26;
    v44.size.double width = v27;
    v44.size.double height = v28;
    v41.origin.double x = v17;
    v41.origin.double y = v19;
    v41.size.double width = v21;
    v41.size.double height = v23;
    CGRect v42 = CGRectUnion(v41, v44);
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
  }

  -[HNDRocker convertRect:fromView:](self, "convertRect:fromView:", v4, x, y, width, height);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  double v37 = v30;
  double v38 = v32;
  double v39 = v34;
  double v40 = v36;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (id)currentlyVisibleRockerItems
{
  id v3 = -[NSMutableArray copy](self->_rockerItems, "copy");
  -[HNDRockerButton alpha](self->_backButton, "alpha");
  if (v4 == 1.0)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 arrayByAddingObject:self->_backButton]);

    id v3 = (id)v5;
  }

  return v3;
}

- (void)volumeChanged
{
  if (-[HNDRocker isFullMenuVisible](self, "isFullMenuVisible"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    [v3 volumeLevel];
    -[HNDRocker showVolumeBar:withProgress:](self, "showVolumeBar:withProgress:", 1LL);
  }

- (void)showVolumeBar:(BOOL)a3 withProgress:(double)a4
{
  if (a3)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assistiveTouchMainScreenCustomization]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

    else {
      unsigned int v9 = [v8 containsObject:AXAssistiveTouchIconTypeVolumeDown];
    }
    int64_t state = self->_state;
    if (state == 1) {
      unsigned int v13 = v9;
    }
    else {
      unsigned int v13 = 0;
    }
    BOOL v14 = state != 2 && v13 == 0;
    if (!v14 && self->_style == 1)
    {
      -[HNDRocker _updateBackButtonVisibility](self, "_updateBackButtonVisibility");
      volumeBar = self->_volumeBar;
      if (!volumeBar)
      {
        double v16 = objc_opt_new(&OBJC_CLASS___HNDVolumeBar);
        CGFloat v17 = self->_volumeBar;
        self->_volumeBar = v16;

        -[HNDVolumeBar setTranslatesAutoresizingMaskIntoConstraints:]( self->_volumeBar,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
        double v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_backdropView, "contentView"));
        [v18 addSubview:self->_volumeBar];
        double v29 = (void *)objc_claimAutoreleasedReturnValue(-[HNDVolumeBar centerXAnchor](self->_volumeBar, "centerXAnchor"));
        CGFloat v28 = (void *)objc_claimAutoreleasedReturnValue([v18 centerXAnchor]);
        CGFloat v19 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v28]);
        v35[0] = v19;
        double v20 = (void *)objc_claimAutoreleasedReturnValue(-[HNDVolumeBar centerYAnchor](self->_volumeBar, "centerYAnchor"));
        CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue([v18 centerYAnchor]);
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21]);
        v35[1] = v22;
        CGFloat v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
        +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v23);

        volumeBar = self->_volumeBar;
      }

      -[HNDVolumeBar setProgress:](volumeBar, "setProgress:", a4);
      -[HNDVolumeBar setNeedsDisplay](self->_volumeBar, "setNeedsDisplay");
      volumeHideTimer = self->_volumeHideTimer;
      if (!volumeHideTimer)
      {
        CGFloat v25 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
        CGFloat v26 = self->_volumeHideTimer;
        self->_volumeHideTimer = v25;

        volumeHideTimer = self->_volumeHideTimer;
      }

      -[AXDispatchTimer cancel](volumeHideTimer, "cancel");
      CGFloat v27 = self->_volumeHideTimer;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100031E44;
      v30[3] = &unk_100121D18;
      v30[4] = self;
      -[AXDispatchTimer afterDelay:processBlock:](v27, "afterDelay:processBlock:", v30, 1.5);
    }
  }

  else
  {
    -[AXDispatchTimer cancel](self->_volumeHideTimer, "cancel", a4);
    double v10 = self->_volumeHideTimer;
    self->_volumeHideTimer = 0LL;

    if (-[HNDRocker style](self, "style")) {
      double v11 = 0.5;
    }
    else {
      double v11 = 0.0;
    }
    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x3032000000LL;
    v33[3] = sub_100031594;
    v33[4] = sub_1000315A4;
    double v34 = self->_volumeBar;
    v31[5] = v33;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100031D60;
    v32[3] = &unk_100121D18;
    v32[4] = self;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100031DA0;
    v31[3] = &unk_100122C38;
    v31[4] = self;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v32,  v31,  v11);
    _Block_object_dispose(v33, 8);
  }

- (void)_goBackInMenuState:(int)a3
{
  int64_t state = self->_state;
  switch(state)
  {
    case 1LL:
      if (a3 == 3) {
        -[HNDRocker _menuExited](self, "_menuExited");
      }
      break;
    case 2LL:
    case 3LL:
    case 7LL:
    case 9LL:
      if (a3 == 3)
      {
        int64_t v5 = 1LL;
        goto LABEL_17;
      }

      break;
    case 4LL:
    case 6LL:
      if (a3 == 3)
      {
        int64_t v5 = 2LL;
        goto LABEL_17;
      }

      break;
    case 5LL:
      if (a3 == 3)
      {
        if ((j__AXDeviceIsSiriAvailable() & 1) != 0)
        {
          int64_t v5 = 6LL;
        }

        else if (j__AXDeviceIsVoiceControlAvailable())
        {
          int64_t v5 = 6LL;
        }

        else
        {
          int64_t v5 = 1LL;
        }

        goto LABEL_17;
      }

      break;
    case 8LL:
      if (a3 == 3)
      {
        int64_t v5 = 7LL;
LABEL_17:
        if (-[NSMutableArray count](self->_stackState, "count"))
        {
          double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_stackState, "lastObject"));
          unsigned int v7 = [v6 intValue];
          int64_t v8 = self->_state;

          if (v8 != v7) {
            _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDRocker.m",  833LL,  "-[HNDRocker _goBackInMenuState:]",  @"Wrong state kept");
          }
          -[NSMutableArray removeLastObject](self->_stackState, "removeLastObject");
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_stackState, "lastObject"));
          int64_t v5 = (int)[v9 intValue];
        }

        self->_int64_t state = v5;
        -[HNDRocker _loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:]( self,  "_loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:",  1LL,  0LL,  1LL,  state);
      }

      break;
    default:
      return;
  }

- (void)performPress:(int)a3 type:(int)a4 source:(int)a5
{
  uint64_t v7 = *(void *)&a3;
  -[AXPIFingerView setPressed:animated:](self->_middleCircle, "setPressed:animated:", a3 == 2, 1LL);
  if (a4 == 2) {
    goto LABEL_2;
  }
  selectedButton = self->_selectedButton;
  if (selectedButton)
  {
    -[HNDRockerButton performPress:](selectedButton, "performPress:", (_DWORD)v7 == 2);
  }

  else if (a5 != 2 || a4 != 1)
  {
LABEL_2:
    -[HNDRocker _goBackInMenuState:](self, "_goBackInMenuState:", v7);
  }

- (void)handleRealDownEvent:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_farthestTrackingDistance = 0.0;
  p_windowDownStartPoint = &self->_windowDownStartPoint;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker window](self, "window"));
  objc_msgSend(v7, "convertPoint:fromView:", self, x, y);
  p_windowDownStartPoint->double x = v8;
  p_windowDownStartPoint->double y = v9;

  if (!self->_style)
  {
    -[AXDispatchTimer cancel](self->_nubbitFadeTimer, "cancel");
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[HNDView controlDelegate](self, "controlDelegate"));
    [v10 viewPressedDown:self];
  }

- (BOOL)isAnimatingNubbit
{
  return self->_animatingNubbit;
}

- (void)handleRealMoveEvent:(CGPoint)a3 maxOrb:(double)a4 currentForce:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  if (-[HNDRocker pointInside:withEvent:](self, "pointInside:withEvent:", 0LL, a3.x, a3.y, a4, a5)
    && AXForceTouchAvailableAndEnabled())
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker window](self, "window"));
    id v10 = objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    double DistanceBetweenPoints = SCRCMathGetDistanceBetweenPoints( v10,  self->_windowDownStartPoint.x,  self->_windowDownStartPoint.y,  v11,  v12);

    double farthestTrackingDistance = self->_farthestTrackingDistance;
    self->_double farthestTrackingDistance = farthestTrackingDistance;
    if (!self->_activatedOrbAction && AXForceTouchThresholdPeek() < a4 && self->_farthestTrackingDistance < 15.0)
    {
      uint64_t v16 = ASTLogCommon(v15);
      CGFloat v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)CGFloat v19 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Reached orb threshold, triggered orb action",  v19,  2u);
      }

      self->_orbActionThresholdReached = 1;
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDView controlDelegate](self, "controlDelegate"));
      [v18 viewOrbActionTriggered:self];

      -[HNDRocker fadeNubbit](self, "fadeNubbit");
      self->_activatedOrbAction = 1;
    }
  }

- (void)resetOrbAction
{
  self->_orbActionThresholdReached = 0;
  self->_activatedOrbAction = 0;
}

- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4
{
  int style = self->_style;
  unsigned int v7 = -[HNDRocker pointInside:withEvent:](self, "pointInside:withEvent:", 0LL, a3.x, a3.y);
  if (style)
  {
    if (v7 && !self->_selectedButton) {
      -[HNDRocker performPress:type:source:](self, "performPress:type:source:", 3LL, 1LL, 1LL);
    }
  }

  else
  {
    if (v7)
    {
      CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker displayManager](self, "displayManager"));
      if ([v8 playedHapticForCurrentEvent])
      {
        BOOL orbActionThresholdReached = self->_orbActionThresholdReached;

        if (orbActionThresholdReached)
        {
          sub_10002BEE0(2LL);
          self->_BOOL orbActionThresholdReached = 0;
        }
      }

      else
      {
      }

      if (!AXForceTouchAvailableAndEnabled() || AXForceTouchThresholdPeek() >= a4)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDView controlDelegate](self, "controlDelegate"));
        [v10 viewPressedUp:self];
      }
    }

    -[HNDRocker fadeNubbit](self, "fadeNubbit");
  }

  -[HNDRocker resetOrbAction](self, "resetOrbAction");
}

- (void)updateRockersForSubstantialTransition
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker initialItems](self, "initialItems"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker scrollItems](self, "scrollItems"));
  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker dwellItems](self, "dwellItems"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayWithPossiblyNilArrays:]( &OBJC_CLASS___NSArray,  "axArrayWithPossiblyNilArrays:",  8LL,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  self->_rockerItems));

  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 substantialTransitionOccurredBlock]);

        if (v16)
        {
          CGFloat v17 = objc_autoreleasePoolPush();
          double v18 = (void (**)(void))objc_claimAutoreleasedReturnValue([v15 substantialTransitionOccurredBlock]);
          v18[2]();

          objc_autoreleasePoolPop(v17);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }
}

- (id)_rockerButtonForLocation:(id)a3 buttonType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_100157688 != -1) {
    dispatch_once(&qword_100157688, &stru_100122C58);
  }
  unsigned int v8 = [(id)qword_100157678 containsObject:v7];
  unsigned __int8 v9 = [(id)qword_100157680 containsObject:v7];
  uint64_t v10 = AXUIAssistiveTouchImageNameForName(v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = AXUIAssistiveTouchStringForName(v7, 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  LOBYTE(v33) = v9 ^ 1;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v13,  v11,  0LL,  0LL,  self,  v8 ^ 1,  v33));

  [v14 setType:v7];
  uint64_t v15 = AXAssistiveTouchIconTypeTripleClick;
  [v7 isEqualToString:AXAssistiveTouchIconTypeTripleClick];
  objc_initWeak(&location, self);
  if (![v7 isEqualToString:AXAssistiveTouchIconTypeNotificationCenter])
  {
    if ([v7 isEqualToString:AXAssistiveTouchIconTypePinch])
    {
      v159[0] = _NSConcreteStackBlock;
      v159[1] = 3221225472LL;
      v159[2] = sub_100034C30;
      v159[3] = &unk_100122BE8;
      objc_copyWeak(&v160, &location);
      [v14 setUpBlock:v159];
      objc_destroyWeak(&v160);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeRotate])
    {
      v157[0] = _NSConcreteStackBlock;
      v157[1] = 3221225472LL;
      v157[2] = sub_100034C7C;
      v157[3] = &unk_100122BE8;
      objc_copyWeak(&v158, &location);
      [v14 setUpBlock:v157];
      objc_destroyWeak(&v158);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypePinchAndRotate])
    {
      v155[0] = _NSConcreteStackBlock;
      v155[1] = 3221225472LL;
      v155[2] = sub_100034CC8;
      v155[3] = &unk_100122BE8;
      objc_copyWeak(&v156, &location);
      [v14 setUpBlock:v155];
      objc_destroyWeak(&v156);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeDoubleTap])
    {
      v153[0] = _NSConcreteStackBlock;
      v153[1] = 3221225472LL;
      v153[2] = sub_100034D14;
      v153[3] = &unk_100122BE8;
      objc_copyWeak(&v154, &location);
      [v14 setUpBlock:v153];
      objc_destroyWeak(&v154);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeLongPress])
    {
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472LL;
      v151[2] = sub_100034D60;
      v151[3] = &unk_100122BE8;
      objc_copyWeak(&v152, &location);
      [v14 setUpBlock:v151];
      objc_destroyWeak(&v152);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeDragAndDrop])
    {
      v149[0] = _NSConcreteStackBlock;
      v149[1] = 3221225472LL;
      v149[2] = sub_100034DAC;
      v149[3] = &unk_100122BE8;
      objc_copyWeak(&v150, &location);
      [v14 setUpBlock:v149];
      objc_destroyWeak(&v150);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeMoveMenu])
    {
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472LL;
      v147[2] = sub_100034DFC;
      v147[3] = &unk_100122BE8;
      objc_copyWeak(&v148, &location);
      [v14 setUpBlock:v147];
      objc_destroyWeak(&v148);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeSpotlight])
    {
      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472LL;
      v145[2] = sub_100034E4C;
      v145[3] = &unk_100122BE8;
      objc_copyWeak(&v146, &location);
      [v14 setUpBlock:v145];
      objc_destroyWeak(&v146);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeForceTap])
    {
      v143[0] = _NSConcreteStackBlock;
      v143[1] = 3221225472LL;
      v143[2] = sub_100034E94;
      v143[3] = &unk_100122BE8;
      objc_copyWeak(&v144, &location);
      [v14 setUpBlock:v143];
      objc_destroyWeak(&v144);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeLockScreen])
    {
      [v14 setDownBlock:0];
      v141[0] = _NSConcreteStackBlock;
      v141[1] = 3221225472LL;
      v141[2] = sub_100034EE0;
      v141[3] = &unk_100122BE8;
      objc_copyWeak(&v142, &location);
      [v14 setUpBlock:v141];
      [v14 setIsModalDown:1];
      objc_destroyWeak(&v142);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeVolumeDown])
    {
      v139[0] = _NSConcreteStackBlock;
      v139[1] = 3221225472LL;
      v139[2] = sub_100034F0C;
      v139[3] = &unk_100122BE8;
      objc_copyWeak(&v140, &location);
      [v14 setDownBlock:v139];
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472LL;
      v137[2] = sub_100034F3C;
      v137[3] = &unk_100122BE8;
      objc_copyWeak(&v138, &location);
      [v14 setUpBlock:v137];
      [v14 setIsModalDown:1];
      objc_destroyWeak(&v138);
      objc_destroyWeak(&v140);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeVolumeUp])
    {
      v135[0] = _NSConcreteStackBlock;
      v135[1] = 3221225472LL;
      v135[2] = sub_100034F6C;
      v135[3] = &unk_100122BE8;
      objc_copyWeak(&v136, &location);
      [v14 setDownBlock:v135];
      v133[0] = _NSConcreteStackBlock;
      v133[1] = 3221225472LL;
      v133[2] = sub_100034F9C;
      v133[3] = &unk_100122BE8;
      objc_copyWeak(&v134, &location);
      [v14 setUpBlock:v133];
      [v14 setIsModalDown:1];
      objc_destroyWeak(&v134);
      objc_destroyWeak(&v136);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:v15])
    {
      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472LL;
      v131[2] = sub_100034FCC;
      v131[3] = &unk_100122BE8;
      objc_copyWeak(&v132, &location);
      [v14 setUpBlock:v131];
      [v14 setTag:111];
      objc_destroyWeak(&v132);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeRotateScreen])
    {
      v129[0] = _NSConcreteStackBlock;
      v129[1] = 3221225472LL;
      v129[2] = sub_100034FF8;
      v129[3] = &unk_100122BE8;
      objc_copyWeak(&v130, &location);
      [v14 setUpBlock:v129];
      [v14 setTag:108];
      objc_destroyWeak(&v130);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeMute])
    {
      v127[0] = _NSConcreteStackBlock;
      v127[1] = 3221225472LL;
      v127[2] = sub_100035040;
      v127[3] = &unk_100122BE8;
      objc_copyWeak(&v128, &location);
      [v14 setUpBlock:v127];
      [v14 setTag:100];
      -[HNDRocker _setRingerSwitchIcon:](self, "_setRingerSwitchIcon:", v14);
      objc_destroyWeak(&v128);
      goto LABEL_35;
    }

    if (AXDeviceHasStaccato()
      && [v7 isEqualToString:AXAssistiveTouchIconTypeActionButton])
    {
      v125[0] = _NSConcreteStackBlock;
      v125[1] = 3221225472LL;
      v125[2] = sub_100035070;
      v125[3] = &unk_100122BE8;
      objc_copyWeak(&v126, &location);
      [v14 setUpBlock:v125];
      [v14 setTag:100];
      -[HNDRocker _setRingerSwitchIcon:](self, "_setRingerSwitchIcon:", v14);
      objc_destroyWeak(&v126);
      goto LABEL_35;
    }

    if (AXDeviceSupportsCameraButton()
      && [v7 isEqualToString:AXAssistiveTouchIconTypeCameraButton])
    {
      v123[0] = _NSConcreteStackBlock;
      v123[1] = 3221225472LL;
      v123[2] = sub_10003509C;
      v123[3] = &unk_100122BE8;
      objc_copyWeak(&v124, &location);
      [v14 setUpBlock:v123];
      objc_destroyWeak(&v124);
      goto LABEL_35;
    }

    if (AXDeviceSupportsCameraButton()
      && [v7 isEqualToString:AXAssistiveTouchIconTypeCameraButtonLightPress])
    {
      v121[0] = _NSConcreteStackBlock;
      v121[1] = 3221225472LL;
      v121[2] = sub_1000350C8;
      v121[3] = &unk_100122BE8;
      objc_copyWeak(&v122, &location);
      [v14 setUpBlock:v121];
      objc_destroyWeak(&v122);
      goto LABEL_35;
    }

    if (AXDeviceSupportsCameraButton()
      && [v7 isEqualToString:AXAssistiveTouchIconTypeCameraButtonDoubleLightPress])
    {
      v119[0] = _NSConcreteStackBlock;
      v119[1] = 3221225472LL;
      v119[2] = sub_1000350F4;
      v119[3] = &unk_100122BE8;
      objc_copyWeak(&v120, &location);
      [v14 setUpBlock:v119];
      objc_destroyWeak(&v120);
      goto LABEL_35;
    }

    if (AXDeviceSupportsCameraButton()
      && [v7 isEqualToString:AXAssistiveTouchIconTypeVisualIntelligence])
    {
      v117[0] = _NSConcreteStackBlock;
      v117[1] = 3221225472LL;
      v117[2] = sub_100035120;
      v117[3] = &unk_100122BE8;
      objc_copyWeak(&v118, &location);
      [v14 setUpBlock:v117];
      objc_destroyWeak(&v118);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeOrientation])
    {
      v115[0] = _NSConcreteStackBlock;
      v115[1] = 3221225472LL;
      v115[2] = sub_10003514C;
      v115[3] = &unk_100122BE8;
      objc_copyWeak(&v116, &location);
      [v14 setUpBlock:v115];
      [v14 setTag:112];
      -[HNDRocker _setRotationLockIcon:](self, "_setRotationLockIcon:", v14);
      objc_destroyWeak(&v116);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeScreenshot])
    {
      v113[0] = _NSConcreteStackBlock;
      v113[1] = 3221225472LL;
      v113[2] = sub_100035178;
      v113[3] = &unk_100122BE8;
      objc_copyWeak(&v114, &location);
      [v14 setUpBlock:v113];
      objc_destroyWeak(&v114);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeShake])
    {
      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472LL;
      v111[2] = sub_1000351A4;
      v111[3] = &unk_100122BE8;
      objc_copyWeak(&v112, &location);
      [v14 setUpBlock:v111];
      objc_destroyWeak(&v112);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeAppSwitcher])
    {
      v109[0] = _NSConcreteStackBlock;
      v109[1] = 3221225472LL;
      v109[2] = sub_1000351D0;
      v109[3] = &unk_100122BE8;
      objc_copyWeak(&v110, &location);
      [v14 setUpBlock:v109];
      objc_destroyWeak(&v110);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeDevice])
    {
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472LL;
      v107[2] = sub_1000351FC;
      v107[3] = &unk_100122BE8;
      objc_copyWeak(&v108, &location);
      [v14 setUpBlock:v107];
      [v14 setTag:104];
      objc_destroyWeak(&v108);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeControlCenter])
    {
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472LL;
      v105[2] = sub_100035258;
      v105[3] = &unk_100122BE8;
      objc_copyWeak(&v106, &location);
      [v14 setUpBlock:v105];
      [v14 setTag:106];
      objc_destroyWeak(&v106);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeHome])
    {
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472LL;
      v103[2] = sub_100035298;
      v103[3] = &unk_100122BE8;
      objc_copyWeak(&v104, &location);
      [v14 setDownBlock:v103];
      v101[0] = _NSConcreteStackBlock;
      v101[1] = 3221225472LL;
      v101[2] = sub_1000352C8;
      v101[3] = &unk_100122BE8;
      objc_copyWeak(&v102, &location);
      [v14 setUpBlock:v101];
      [v14 setIsModalDown:1];
      [v14 setTag:103];
      objc_destroyWeak(&v102);
      objc_destroyWeak(&v104);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeCustom])
    {
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472LL;
      v99[2] = sub_1000352F8;
      v99[3] = &unk_100122BE8;
      objc_copyWeak(&v100, &location);
      [v14 setUpBlock:v99];
      [v14 setTag:107];
      objc_destroyWeak(&v100);
      goto LABEL_35;
    }

    if ([v7 isEqualToString:AXAssistiveTouchIconTypeSiri])
    {
      if ((j__AXDeviceIsSiriAvailable() & 1) != 0)
      {
        v97[0] = _NSConcreteStackBlock;
        v97[1] = 3221225472LL;
        v97[2] = sub_100035374;
        v97[3] = &unk_100122BE8;
        objc_copyWeak(&v98, &location);
        [v14 setUpBlock:v97];
        [v14 setTag:101];
        objc_destroyWeak(&v98);
        goto LABEL_35;
      }

      uint64_t v19 = AXAssistiveTouchIconTypeVoiceControl;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v6,  AXAssistiveTouchIconTypeVoiceControl));

      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 type]);
      LODWORD(v19) = [v21 isEqualToString:v19];

      if ((_DWORD)v19) {
        goto LABEL_81;
      }
    }

    else
    {
      if (![v7 isEqualToString:AXAssistiveTouchIconTypeTypeToSiri])
      {
        if ([v7 isEqualToString:AXAssistiveTouchIconTypeVoiceControl])
        {
          if ((j__AXDeviceIsVoiceControlAvailable() & 1) == 0)
          {
            id v16 = (id)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v6,  AXAssistiveTouchIconTypeGestures));
            goto LABEL_37;
          }

          v93[0] = _NSConcreteStackBlock;
          v93[1] = 3221225472LL;
          v93[2] = sub_1000353F4;
          v93[3] = &unk_100122BE8;
          objc_copyWeak(&v94, &location);
          objc_msgSend( v14,  "setDisabled:",  _AXSHomeButtonAssistant(objc_msgSend(v14, "setUpBlock:", v93)) != 1);
          objc_destroyWeak(&v94);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeCommandAndControl])
        {
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472LL;
          v91[2] = sub_100035434;
          v91[3] = &unk_100122BE8;
          objc_copyWeak(&v92, &location);
          [v14 setUpBlock:v91];
          objc_destroyWeak(&v92);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeGestures])
        {
          v89[0] = _NSConcreteStackBlock;
          v89[1] = 3221225472LL;
          v89[2] = sub_100035460;
          v89[3] = &unk_100122BE8;
          objc_copyWeak(&v90, &location);
          [v14 setUpBlock:v89];
          [v14 setTag:110];
          objc_destroyWeak(&v90);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSOS])
        {
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472LL;
          v87[2] = sub_1000354BC;
          v87[3] = &unk_100122BE8;
          objc_copyWeak(&v88, &location);
          [v14 setUpBlock:v87];
          objc_destroyWeak(&v88);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDetectionMode])
        {
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472LL;
          v85[2] = sub_1000354E8;
          v85[3] = &unk_100122BE8;
          objc_copyWeak(&v86, &location);
          [v14 setUpBlock:v85];
          objc_destroyWeak(&v86);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeDimFlashingLights])
        {
          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472LL;
          v83[2] = sub_100035514;
          v83[3] = &unk_100122BE8;
          objc_copyWeak(&v84, &location);
          [v14 setUpBlock:v83];
          objc_destroyWeak(&v84);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeRebootDevice])
        {
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472LL;
          v81[2] = sub_100035540;
          v81[3] = &unk_100122BE8;
          objc_copyWeak(&v82, &location);
          [v14 setUpBlock:v81];
          objc_destroyWeak(&v82);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeReachability])
        {
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472LL;
          v79[2] = sub_10003556C;
          v79[3] = &unk_100122BE8;
          objc_copyWeak(&v80, &location);
          [v14 setUpBlock:v79];
          objc_destroyWeak(&v80);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSpeakScreen])
        {
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472LL;
          v77[2] = sub_100035598;
          v77[3] = &unk_100122BE8;
          objc_copyWeak(&v78, &location);
          [v14 setUpBlock:v77];
          objc_destroyWeak(&v78);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSysdiagnose])
        {
          v75[0] = _NSConcreteStackBlock;
          v75[1] = 3221225472LL;
          v75[2] = sub_1000355C4;
          v75[3] = &unk_100122BE8;
          objc_copyWeak(&v76, &location);
          [v14 setUpBlock:v75];
          objc_destroyWeak(&v76);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeToggleDock])
        {
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472LL;
          v73[2] = sub_1000355F0;
          v73[3] = &unk_100122BE8;
          objc_copyWeak(&v74, &location);
          [v14 setUpBlock:v73];
          objc_destroyWeak(&v74);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeArmApplePay])
        {
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472LL;
          v71[2] = sub_10003561C;
          v71[3] = &unk_100122BE8;
          objc_copyWeak(&v72, &location);
          [v14 setUpBlock:v71];
          [v14 setTag:117];
          objc_destroyWeak(&v72);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeSideApp])
        {
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472LL;
          v69[2] = sub_100035664;
          v69[3] = &unk_100122BE8;
          objc_copyWeak(&v70, &location);
          [v14 setUpBlock:v69];
          [v14 setTag:113];
          objc_destroyWeak(&v70);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScroll])
        {
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472LL;
          v67[2] = sub_1000356AC;
          v67[3] = &unk_100122BE8;
          objc_copyWeak(&v68, &location);
          [v14 setUpBlock:v67];
          [v14 setTag:115];
          objc_destroyWeak(&v68);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollUp])
        {
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472LL;
          v65[2] = sub_100035708;
          v65[3] = &unk_100122BE8;
          objc_copyWeak(&v66, &location);
          [v14 setUpBlock:v65];
          objc_destroyWeak(&v66);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollDown])
        {
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_100035760;
          v63[3] = &unk_100122BE8;
          objc_copyWeak(&v64, &location);
          [v14 setUpBlock:v63];
          objc_destroyWeak(&v64);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollLeft])
        {
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472LL;
          v61[2] = sub_1000357B8;
          v61[3] = &unk_100122BE8;
          objc_copyWeak(&v62, &location);
          [v14 setUpBlock:v61];
          objc_destroyWeak(&v62);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollRight])
        {
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_100035810;
          v59[3] = &unk_100122BE8;
          objc_copyWeak(&v60, &location);
          [v14 setUpBlock:v59];
          objc_destroyWeak(&v60);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollToTop])
        {
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472LL;
          v57[2] = sub_100035868;
          v57[3] = &unk_100122BE8;
          objc_copyWeak(&v58, &location);
          [v14 setUpBlock:v57];
          objc_destroyWeak(&v58);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeScrollToBottom])
        {
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472LL;
          v55[2] = sub_1000358C0;
          v55[3] = &unk_100122BE8;
          objc_copyWeak(&v56, &location);
          [v14 setUpBlock:v55];
          objc_destroyWeak(&v56);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollHorizontal])
        {
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_100035918;
          v52[3] = &unk_100122C80;
          objc_copyWeak(&v54, &location);
          id v53 = v7;
          [v14 setUpBlock:v52];

          objc_destroyWeak(&v54);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollVertical])
        {
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472LL;
          v49[2] = sub_100035978;
          v49[3] = &unk_100122C80;
          objc_copyWeak(&v51, &location);
          id v50 = v7;
          [v14 setUpBlock:v49];

          objc_destroyWeak(&v51);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeCamera])
        {
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472LL;
          v47[2] = sub_1000359D8;
          v47[3] = &unk_100122BE8;
          objc_copyWeak(&v48, &location);
          [v14 setUpBlock:v47];
          objc_destroyWeak(&v48);
        }

        else if ([v7 isEqualToString:AXAssistiveTouchIconTypeFrontFacingCamera])
        {
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_100035A04;
          v45[3] = &unk_100122BE8;
          objc_copyWeak(&v46, &location);
          [v14 setUpBlock:v45];
          objc_destroyWeak(&v46);
        }

        else if ([v7 hasPrefix:@"CustomGesture-"])
        {
          double v37 = (void *)objc_claimAutoreleasedReturnValue( [v7 stringByReplacingOccurrencesOfString:@"CustomGesture-" withString:&stru_100127100]);
          CGFloat v25 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
          CGFloat v26 = (void *)objc_claimAutoreleasedReturnValue([v25 customGestures]);

          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          id obj = v26;
          id v38 = [obj countByEnumeratingWithState:&v41 objects:v164 count:16];
          if (v38)
          {
            uint64_t v36 = *(void *)v42;
            while (2)
            {
              for (i = 0LL; i != v38; i = (char *)i + 1)
              {
                if (*(void *)v42 != v36) {
                  objc_enumerationMutation(obj);
                }
                CGFloat v28 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
                double v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
                unsigned int v30 = [v29 isEqualToString:v37];

                if (v30)
                {
                  double v32 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
                  v39[0] = _NSConcreteStackBlock;
                  v39[1] = 3221225472LL;
                  v39[2] = sub_100035A30;
                  v39[3] = &unk_100122C80;
                  objc_copyWeak(&v40, &location);
                  v39[4] = v28;
                  LOBYTE(v34) = 1;
                  double v31 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWith AssistiveAccess:",  v32,  @"IconFavorites",  0LL,  v39,  self,  1LL,  v34));

                  [v31 setCustomTitle:1];
                  objc_destroyWeak(&v40);
                  goto LABEL_141;
                }
              }

              id v38 = [obj countByEnumeratingWithState:&v41 objects:v164 count:16];
              if (v38) {
                continue;
              }
              break;
            }
          }

          double v31 = v14;
LABEL_141:

          BOOL v14 = v31;
        }

        goto LABEL_35;
      }

      if ((j__AXDeviceIsSiriAvailable() & 1) != 0)
      {
        v95[0] = _NSConcreteStackBlock;
        v95[1] = 3221225472LL;
        v95[2] = sub_1000353B4;
        v95[3] = &unk_100122BE8;
        objc_copyWeak(&v96, &location);
        [v14 setUpBlock:v95];
        [v14 setTag:102];
        objc_destroyWeak(&v96);
        goto LABEL_35;
      }

      uint64_t v23 = AXAssistiveTouchIconTypeVoiceControl;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v6,  AXAssistiveTouchIconTypeVoiceControl));

      CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue([v20 type]);
      LODWORD(v23) = [v24 isEqualToString:v23];

      if ((_DWORD)v23) {
LABEL_81:
      }
        [v20 setDisabled:_AXSHomeButtonAssistant(v22) != 1];
    }

    id v16 = v20;
    goto LABEL_36;
  }

  v161[0] = _NSConcreteStackBlock;
  v161[1] = 3221225472LL;
  v161[2] = sub_100034BF0;
  v161[3] = &unk_100122BE8;
  objc_copyWeak(&v162, &location);
  [v14 setUpBlock:v161];
  objc_destroyWeak(&v162);
LABEL_35:
  [v14 setLocation:v6];
  id v16 = v14;
LABEL_36:
  BOOL v14 = v16;
LABEL_37:
  CGFloat v17 = v16;
  objc_destroyWeak(&location);

  return v17;
}

- (void)_preloadInitialMenuItems
{
  id v3 = [objc_allocWithZone(NSMutableArray) init];
  -[HNDRocker setInitialItems:](self, "setInitialItems:", v3);

  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assistiveTouchMainScreenCustomization]);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v17));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v11,  v12));

        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker initialItems](self, "initialItems"));
        [v14 addObject:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker initialItems](self, "initialItems"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _filteredItems:](self, "_filteredItems:", v15));
  -[HNDRocker setInitialItems:](self, "setInitialItems:", v16);
}

- (void)_loadInitialMenuItems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker initialItems](self, "initialItems"));

  if (!v3) {
    -[HNDRocker _preloadInitialMenuItems](self, "_preloadInitialMenuItems");
  }
  rockerItems = self->_rockerItems;
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker initialItems](self, "initialItems"));
  -[NSMutableArray addObjectsFromArray:](rockerItems, "addObjectsFromArray:", v5);

  -[HNDRocker updateRotationLockSwitch](self, "updateRotationLockSwitch");
  -[HNDRocker updateRingerSwitch](self, "updateRingerSwitch");
}

- (void)_loadMoreMenuItems
{
  int IsSOSAvailable = AXDeviceIsSOSAvailable(self, a2);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));

  if (!v4)
  {
    id v5 = [objc_allocWithZone(NSMutableArray) init];
    -[HNDRocker setMoreItems:](self, "setMoreItems:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeAppSwitcher));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
    [v7 addObject:v6];

    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeScreenshot));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
    [v9 addObject:v8];

    if (IsSOSAvailable)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeSOS));

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
      [v11 addObject:v10];

      id v8 = (void *)v10;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeShake));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
    [v13 addObject:v12];

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeRebootDevice));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
    [v15 addObject:v14];

    if (AXDeviceSupportsSideApp())
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeToggleDock));

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
      [v17 addObject:v16];

      BOOL v14 = (void *)v16;
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _filteredItems:](self, "_filteredItems:", v18));
    -[HNDRocker setMoreItems:](self, "setMoreItems:", v19);
  }

  rockerItems = self->_rockerItems;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker moreItems](self, "moreItems"));
  -[NSMutableArray addObjectsFromArray:](rockerItems, "addObjectsFromArray:", v21);

  CanArmApplePadouble y = AXDeviceCanArmApplePay();
  if ((j__AXDeviceIsSiriAvailable(CanArmApplePay) & 1) != 0 || j__AXDeviceIsVoiceControlAvailable())
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker gesturesButton](self, "gesturesButton"));

    if (!v23)
    {
      CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeGestures));
      -[HNDRocker setGesturesButton:](self, "setGesturesButton:", v24);
    }

    CGFloat v25 = self->_rockerItems;
    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[HNDRocker gesturesButton](self, "gesturesButton"));
  }

  else
  {
    CGFloat v27 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker tripleClickHomeButton](self, "tripleClickHomeButton"));

    if (!v27)
    {
      CGFloat v28 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeTripleClick));
      -[HNDRocker setTripleClickHomeButton:](self, "setTripleClickHomeButton:", v28);
    }

    CGFloat v25 = self->_rockerItems;
    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[HNDRocker tripleClickHomeButton](self, "tripleClickHomeButton"));
  }

  double v29 = (void *)v26;
  -[NSMutableArray addObject:](v25, "addObject:", v26);

  if (_AXSSpeakThisEnabled(v30, v31))
  {
    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker speakScreenButton](self, "speakScreenButton"));

    if (!v32)
    {
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  0LL,  AXAssistiveTouchIconTypeSpeakScreen));
      -[HNDRocker setSpeakScreenButton:](self, "setSpeakScreenButton:", v33);
    }

    uint64_t v34 = self->_rockerItems;
    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker speakScreenButton](self, "speakScreenButton"));
    -[NSMutableArray addObject:](v34, "addObject:", v35);
  }

  -[HNDRocker _assignLocationsToRockerItems](self, "_assignLocationsToRockerItems");
}

- (void)_assignLocationsToRockerItems
{
  uint64_t v3 = AXAssistiveTouchNamedLayout(-[NSMutableArray count](self->_rockerItems, "count"));
  if (!v3)
  {
    if ((unint64_t)-[NSMutableArray count](self->_rockerItems, "count") < 9)
    {
      uint64_t v3 = 0LL;
    }

    else
    {
      -[NSMutableArray removeObjectsInRange:]( self->_rockerItems,  "removeObjectsInRange:",  8LL,  (char *)-[NSMutableArray count](self->_rockerItems, "count") - 8);
      uint64_t v3 = AXAssistiveTouchNamedLayout(-[NSMutableArray count](self->_rockerItems, "count"));
    }
  }

  uint64_t v4 = AXAssistiveTouchLocationsForLayout(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  rockerItems = self->_rockerItems;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003613C;
  v8[3] = &unk_100122CA8;
  id v9 = v5;
  id v7 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](rockerItems, "enumerateObjectsUsingBlock:", v8);
}

- (void)_loadGesturesMenuItems
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));

  if (!v3)
  {
    id v4 = [objc_allocWithZone(NSMutableArray) init];
    -[HNDRocker setTouchItems:](self, "setTouchItems:", v4);

    objc_initWeak(location, self);
    id v5 = sub_10002B014(@"NUMBER_OF_FINGERS");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v6, 4LL));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100036678;
    v33[3] = &unk_100122BE8;
    objc_copyWeak(&v34, location);
    LOBYTE(v23) = 1;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v7,  @"IconFingers4",  0LL,  v33,  self,  1LL,  v23));

    [v8 setLocation:AXAssistiveTouchIconLocationBottomMiddle];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));
    [v9 addObject:v8];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v6,  3LL));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000366A8;
    v31[3] = &unk_100122BE8;
    objc_copyWeak(&v32, location);
    LOBYTE(v24) = 1;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v10,  @"IconFingers3",  0LL,  v31,  self,  1LL,  v24));

    [v11 setLocation:AXAssistiveTouchIconLocationMidRight];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));
    [v12 addObject:v11];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v6,  2LL));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000366D8;
    v29[3] = &unk_100122BE8;
    objc_copyWeak(&v30, location);
    LOBYTE(v25) = 1;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v13,  @"IconFingers2",  0LL,  v29,  self,  1LL,  v25));

    [v14 setLocation:AXAssistiveTouchIconLocationTopMiddle];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));
    [v15 addObject:v14];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v6,  5LL));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100036708;
    v27[3] = &unk_100122BE8;
    objc_copyWeak(&v28, location);
    LOBYTE(v26) = 1;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v16,  @"IconFingers5",  0LL,  v27,  self,  1LL,  v26));

    [v17 setLocation:AXAssistiveTouchIconLocationMidLeft];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));
    [v18 addObject:v17];

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _filteredItems:](self, "_filteredItems:", v19));
    -[HNDRocker setTouchItems:](self, "setTouchItems:", v20);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);

    objc_destroyWeak(location);
  }

  rockerItems = self->_rockerItems;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker touchItems](self, "touchItems"));
  -[NSMutableArray addObjectsFromArray:](rockerItems, "addObjectsFromArray:", v22);
}

- (void)_loadRotateMenuItems
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));

  if (!v3)
  {
    id v4 = [objc_allocWithZone(NSMutableArray) init];
    -[HNDRocker setRotateItems:](self, "setRotateItems:", v4);

    id v5 = sub_10002B014(@"ORIENTATION-UPSIDE-DOWN");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString at_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "at_deviceIconNameForIdentifier:",  @"IconUpsideDown"));
    LOBYTE(v28) = 1;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v6,  v7,  0LL,  &stru_100122CE8,  self,  1LL,  v28));

    [v8 setLocation:AXAssistiveTouchIconLocationBottomMiddle];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));
    [v9 addObject:v8];

    id v10 = sub_10002B014(@"ORIENTATION-LANDSCAPE-RIGHT");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString at_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "at_deviceIconNameForIdentifier:",  @"IconRight"));
    LOBYTE(v29) = 1;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v11,  v12,  0LL,  &stru_100122D08,  self,  1LL,  v29));

    [v13 setLocation:AXAssistiveTouchIconLocationMidRight];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));
    [v14 addObject:v13];

    id v15 = sub_10002B014(@"ORIENTATION-PORTRAIT");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString at_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "at_deviceIconNameForIdentifier:",  @"IconDevice"));
    LOBYTE(v30) = 1;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v16,  v17,  0LL,  &stru_100122D28,  self,  1LL,  v30));

    [v18 setLocation:AXAssistiveTouchIconLocationTopMiddle];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));
    [v19 addObject:v18];

    id v20 = sub_10002B014(@"ORIENTATION-LANDSCAPE-LEFT");
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString at_deviceIconNameForIdentifier:]( &OBJC_CLASS___NSString,  "at_deviceIconNameForIdentifier:",  @"IconLeft"));
    LOBYTE(v31) = 1;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v21,  v22,  0LL,  &stru_100122D48,  self,  1LL,  v31));

    [v23 setLocation:AXAssistiveTouchIconLocationMidLeft];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));
    [v24 addObject:v23];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _filteredItems:](self, "_filteredItems:", v25));
    -[HNDRocker setRotateItems:](self, "setRotateItems:", v26);
  }

  rockerItems = self->_rockerItems;
  id v32 = (id)objc_claimAutoreleasedReturnValue(-[HNDRocker rotateItems](self, "rotateItems"));
  -[NSMutableArray addObjectsFromArray:](rockerItems, "addObjectsFromArray:", v32);
}

- (void)_loadScrollMenuItems
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker scrollItems](self, "scrollItems"));

  if (!v3)
  {
    id v4 = [objc_allocWithZone(NSMutableArray) init];
    -[HNDRocker setScrollItems:](self, "setScrollItems:", v4);

    v16[0] = AXAssistiveTouchIconLocationTopLeft;
    v16[1] = AXAssistiveTouchIconLocationTopMiddle;
    v16[2] = AXAssistiveTouchIconLocationTopRight;
    v16[3] = AXAssistiveTouchIconLocationMidLeft;
    v16[4] = AXAssistiveTouchIconLocationMidRight;
    v16[5] = AXAssistiveTouchIconLocationBottomMiddle;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 6LL));
    uint64_t v6 = AXAssistiveTouchScrollIcons();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v7));

    [v8 removeObject:AXAssistiveTouchIconTypeContinuousScrollHorizontal];
    [v8 removeObject:AXAssistiveTouchIconTypeContinuousScrollVertical];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100036D74;
    v14[3] = &unk_100122D70;
    v14[4] = self;
    id v15 = v5;
    id v9 = v5;
    [v8 enumerateObjectsUsingBlock:v14];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker scrollItems](self, "scrollItems"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _filteredItems:](self, "_filteredItems:", v10));
    -[HNDRocker setScrollItems:](self, "setScrollItems:", v11);
  }

  rockerItems = self->_rockerItems;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker scrollItems](self, "scrollItems"));
  -[NSMutableArray addObjectsFromArray:](rockerItems, "addObjectsFromArray:", v13);
}

- (void)forceReloadScrollMenuItems
{
}

- (void)_setRingerSwitchIcon:(id)a3
{
  id v9 = a3;
  if (sub_10002ADD8()) {
    uint64_t v3 = @"MUTE";
  }
  else {
    uint64_t v3 = @"UNMUTE";
  }
  id v4 = sub_10002B014(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (AXDeviceHasStaccato())
  {
    id v6 = sub_10002B14C(@"ACTION_BUTTON");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v9 setTitle:v7];

    id v8 = (const __CFString *)AXAssistiveTouchIconTypeActionButton;
  }

  else
  {
    [v9 setTitle:v5];
    if (sub_10002ADD8()) {
      id v8 = @"IconMuted";
    }
    else {
      id v8 = @"IconUnmuted";
    }
  }

  [v9 setImageName:v8];
}

- (void)updateRingerSwitch
{
  id v3 = -[NSMutableArray indexOfObjectPassingTest:](self->_rockerItems, "indexOfObjectPassingTest:", &stru_100122DB0);
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_rockerItems, "objectAtIndex:", v3));
    if (-[HNDRocker _replaceRingerWithOrientationLock](self, "_replaceRingerWithOrientationLock")) {
      -[HNDRocker _setRotationLockIcon:](self, "_setRotationLockIcon:", v4);
    }
    else {
      -[HNDRocker _setRingerSwitchIcon:](self, "_setRingerSwitchIcon:", v4);
    }
  }

- (void)updateRotationLockSwitch
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray axFilterObjectsUsingBlock:]( self->_rockerItems,  "axFilterObjectsUsingBlock:",  &stru_100122DF0));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  id v4 = v5;
  if (v5)
  {
    -[HNDRocker _setRotationLockIcon:](self, "_setRotationLockIcon:", v5);
    id v4 = v5;
  }
}

- (void)_setRotationLockIcon:(id)a3
{
  id v9 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  unsigned int v4 = [v3 orientationLocked];

  if (v4) {
    id v5 = @"IconRotationUnlock";
  }
  else {
    id v5 = @"IconRotationLock";
  }
  if (v4) {
    id v6 = @"ORIENTATION_UNLOCKED";
  }
  else {
    id v6 = @"ORIENTATION_LOCKED";
  }
  [v9 setImageName:v5];
  id v7 = sub_10002B014(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v9 setTitle:v8];
}

- (void)_loadHardwareMenuItems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));

  if (v3) {
    goto LABEL_13;
  }
  id v4 = [objc_allocWithZone(NSMutableArray) init];
  -[HNDRocker setHardwareItems:](self, "setHardwareItems:", v4);

  if (-[HNDRocker _includeRingerButtonInHardware](self, "_includeRingerButtonInHardware"))
  {
    id v37 = AXAssistiveTouchIconLocationTopLeft;
    id v5 = (void *)AXAssistiveTouchIconLocationTopRight;
    id v6 = (void *)AXAssistiveTouchIconLocationMidLeft;
  }

  else
  {
    if (!AXDeviceHasStaccato())
    {
      id v37 = AXAssistiveTouchIconLocationTopMiddle;
      id v7 = AXAssistiveTouchIconLocationMidLeft;
      id v36 = AXAssistiveTouchIconLocationBottomLeft;
      id v38 = AXAssistiveTouchIconLocationBottomRight;
      id v9 = (void *)AXAssistiveTouchIconLocationMidRight;
      id v8 = (void *)AXAssistiveTouchIconLocationMidRight;
      goto LABEL_8;
    }

    id v37 = AXAssistiveTouchIconLocationTopLeft;
    id v6 = (void *)AXAssistiveTouchIconLocationMidLeft;
    id v5 = (void *)AXAssistiveTouchIconLocationTopRight;
  }

  id v7 = v5;
  id v36 = AXAssistiveTouchIconLocationBottomLeft;
  id v8 = (void *)AXAssistiveTouchIconLocationBottomRight;
  id v38 = v6;
  id v9 = (void *)AXAssistiveTouchIconLocationMidRight;
LABEL_8:
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v7,  AXAssistiveTouchIconTypeRotateScreen));
  [v12 addObject:v13];

  objc_initWeak(location, self);
  double v35 = v7;
  if (-[HNDRocker _includeRingerButtonInHardware](self, "_includeRingerButtonInHardware"))
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100037678;
    v42[3] = &unk_100122BE8;
    objc_copyWeak(&v43, location);
    LOBYTE(v34) = 1;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  0LL,  0LL,  0LL,  v42,  self,  1LL,  v34,  v7));
    [v14 setTag:100];
    [v14 setLocation:v11];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
    [v15 addObject:v14];

    objc_destroyWeak(&v43);
  }

  else if (AXDeviceHasStaccato())
  {
    id v16 = sub_10002B14C(@"ACTION_BUTTON");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000376A8;
    v41[3] = &unk_100122E18;
    v41[4] = self;
    LOBYTE(v34) = 1;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v17,  AXAssistiveTouchIconTypeActionButton,  0LL,  v41,  self,  0LL,  v34,  v35));

    [v18 setLocation:v11];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
    [v19 addObject:v18];
  }

  id v20 = sub_10002B014(@"MORE");
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000376B0;
  v39[3] = &unk_100122BE8;
  objc_copyWeak(&v40, location);
  LOBYTE(v34) = 1;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  v21,  @"IconMore",  0LL,  v39,  self,  1LL,  v34));

  [v22 setTag:109];
  [v22 setLocation:v10];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  [v23 addObject:v22];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v36,  AXAssistiveTouchIconTypeVolumeDown));
  [v24 addObject:v25];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  CGFloat v27 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v38,  AXAssistiveTouchIconTypeVolumeUp));
  [v26 addObject:v27];

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v37,  AXAssistiveTouchIconTypeLockScreen));
  [v28 addObject:v29];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _filteredItems:](self, "_filteredItems:", v30));
  -[HNDRocker setHardwareItems:](self, "setHardwareItems:", v31);

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

LABEL_13:
  rockerItems = self->_rockerItems;
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareItems](self, "hardwareItems"));
  -[NSMutableArray addObjectsFromArray:](rockerItems, "addObjectsFromArray:", v33);

  -[HNDRocker updateRingerSwitch](self, "updateRingerSwitch");
}

- (void)_customGesturePressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = AXAssistiveTouchIconTypeCustom;
  id v7 = a3;
  -[HNDRocker updateForegroundImageForAction:](self, "updateForegroundImageForAction:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  [v8 prepareGesture:v7 onDisplay:v9];

  if (v4)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
    [v11 performPreparedGestureOnDisplay:v10];
  }

- (void)_addFavoriteBoxPressed
{
  if (!-[AXDispatchTimer isPending](self->_homeButtonDismissTimer, "isPending")
    || -[AXDispatchTimer isCancelled](self->_homeButtonDismissTimer, "isCancelled"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    [v3 openCreateCustomGestureForAST];

    homeButtonDismissTimer = self->_homeButtonDismissTimer;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100037888;
    v5[3] = &unk_100121D18;
    v5[4] = self;
    -[AXDispatchTimer afterDelay:processBlock:](homeButtonDismissTimer, "afterDelay:processBlock:", v5, 1.5);
  }

- (void)_loadFavoritesMenuItems
{
  id v2 = [objc_allocWithZone(NSMutableArray) init];
  if ([UIApp userInterfaceLayoutDirection] == (id)1)
  {
    id v3 = (uint64_t *)&AXAssistiveTouchIconLocationBottomLeft;
    BOOL v4 = (uint64_t *)&AXAssistiveTouchIconLocationBottomRight;
    id v5 = (uint64_t *)&AXAssistiveTouchIconLocationMidLeft;
    uint64_t v48 = AXAssistiveTouchIconLocationTopRight;
    uint64_t v6 = (uint64_t *)&AXAssistiveTouchIconLocationMidRight;
    id v7 = (uint64_t *)&AXAssistiveTouchIconLocationTopLeft;
    id v8 = &v48;
  }

  else
  {
    id v3 = (uint64_t *)&AXAssistiveTouchIconLocationBottomRight;
    BOOL v4 = (uint64_t *)&AXAssistiveTouchIconLocationBottomLeft;
    id v5 = (uint64_t *)&AXAssistiveTouchIconLocationMidRight;
    uint64_t v47 = AXAssistiveTouchIconLocationTopLeft;
    uint64_t v6 = (uint64_t *)&AXAssistiveTouchIconLocationMidLeft;
    id v7 = (uint64_t *)&AXAssistiveTouchIconLocationTopRight;
    id v8 = &v47;
  }

  uint64_t v9 = *v7;
  v8[1] = AXAssistiveTouchIconLocationTopMiddle;
  v8[2] = v9;
  uint64_t v10 = *v5;
  v8[3] = *v6;
  void v8[4] = v10;
  uint64_t v11 = AXAssistiveTouchIconLocationBottomMiddle;
  v8[5] = *v4;
  v8[6] = v11;
  v8[7] = *v3;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v13,  AXAssistiveTouchIconTypePinchAndRotate));
  [v2 addObject:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v15 customGestures]);

  id v16 = (char *)[v2 count];
  if (&v16[(void)[v37 count]] <= (char *)7)
  {
    int v17 = AXForceTouchAvailableAndEnabled();
    __int128 v18 = (id *)&AXAssistiveTouchIconTypeForceTap;
    if (!v17) {
      __int128 v18 = (id *)&AXAssistiveTouchIconTypeLongPress;
    }
    id v19 = *v18;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v2, "count")));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v20,  v19));
    [v2 addObject:v21];
  }

  uint64_t v22 = (char *)[v2 count];
  if (&v22[(void)[v37 count]] <= (char *)7)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v2, "count")));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v23,  AXAssistiveTouchIconTypeDoubleTap));
    [v2 addObject:v24];
  }

  uint64_t v25 = (char *)[v2 count];
  if (&v25[(void)[v37 count]] <= (char *)7)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v2, "count")));
    CGFloat v27 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker _rockerButtonForLocation:buttonType:]( self,  "_rockerButtonForLocation:buttonType:",  v26,  AXAssistiveTouchIconTypeDragAndDrop));
    [v2 addObject:v27];
  }

  objc_initWeak(&location, self);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100037E30;
  v41[3] = &unk_100122E40;
  id v28 = v2;
  id v42 = v28;
  objc_copyWeak(&v45, &location);
  id v43 = self;
  id v29 = v12;
  id v44 = v29;
  [v37 enumerateObjectsUsingBlock:v41];
  uint64_t v30 = (char *)[v28 count];
  if ((unint64_t)v30 <= 7)
  {
    uint64_t v31 = v30 - 8;
    do
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_100037FDC;
      v39[3] = &unk_100122BE8;
      objc_copyWeak(&v40, &location);
      LOBYTE(v36) = 0;
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[HNDRockerButton buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:]( &OBJC_CLASS___HNDRockerButton,  "buttonWithTitle:imageName:downBlock:upBlock:dataSource:showWithGuidedAccess:showWithAssistiveAccess:",  &stru_100127100,  @"AddFavoritesBox",  0LL,  v39,  self,  0LL,  v36));
      [v32 setContinueHighlightAfterTouch:1];
      [v32 setIsEmptyFavorite:1];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v28, "count")));
      [v32 setLocation:v33];

      [v28 addObject:v32];
      objc_destroyWeak(&v40);
    }

    while (!__CFADD__(v31++, 1LL));
  }

  double v35 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _filteredItems:](self, "_filteredItems:", v28));

  -[NSMutableArray addObjectsFromArray:](self->_rockerItems, "addObjectsFromArray:", v35);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&location);
}

- (id)_filteredItems:(id)a3
{
  return a3;
}

+ (CGSize)initialRockerSize
{
  double v3 = v2;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (CGSize)nubbitSize
{
  int IsPad = AXDeviceIsPad(a1, a2);
  double v3 = 60.0;
  if (IsPad) {
    double v3 = 76.0;
  }
  double v4 = v3;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_setBackgroundWithType:(int)a3
{
  double y = CGPointZero.y;
  if (a3 == 1) {
    +[HNDRocker initialRockerSize](&OBJC_CLASS___HNDRocker, "initialRockerSize");
  }
  else {
    +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  }
  -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:", CGPointZero.x, y, v6, v7);
  -[UIVisualEffectView bounds](self->_backdropView, "bounds");
  -[UIView setFrame:](self->_maskImageView, "setFrame:");
  -[UIVisualEffectView setMaskView:](self->_backdropView, "setMaskView:", self->_maskImageView);
  self->_backgroundType = a3;
}

- (void)_addNewButtonsToView
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v3 = self->_rockerItems;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        objc_msgSend(v8, "setSelected:", 0, (void)v11);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_backdropView, "contentView"));
        [v9 addSubview:v8];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_backdropView, "contentView"));
  [v10 bringSubviewToFront:self->_middleCircle];
}

- (void)_centerBackButtonToView:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker backButtonConstraints](self, "backButtonConstraints"));

  if (v5)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker backButtonConstraints](self, "backButtonConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v7);
  }

  if (v4)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton imageView](self->_backButton, "imageView"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v18 centerXAnchor]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 centerXAnchor]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
    v19[0] = v10;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton imageView](self->_backButton, "imageView"));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 centerYAnchor]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 centerYAnchor]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
    v19[1] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    -[HNDRocker setBackButtonConstraints:](self, "setBackButtonConstraints:", v15);

    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[HNDRocker backButtonConstraints](self, "backButtonConstraints"));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v16);
  }

  else
  {
    uint64_t v17 = ASTLogCommon(v6);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_1000AF50C(v16);
    }
  }
}

- (void)_layoutMenuItemsInReverse:(BOOL)a3 oldRockers:(id)a4 animateToIcon:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  [v10 enumerateObjectsUsingBlock:&stru_100122E80];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  void v35[2] = sub_1000386C8;
  v35[3] = &unk_1001220B8;
  id v12 = v10;
  id v36 = v12;
  id v37 = self;
  id v13 = v11;
  id v38 = v13;
  __int128 v14 = objc_retainBlock(v35);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100038738;
  v31[3] = &unk_100122EE8;
  id v15 = v12;
  id v32 = v15;
  uint64_t v33 = self;
  BOOL v34 = a6;
  id v16 = objc_retainBlock(v31);
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  CGFloat v27 = sub_1000387A0;
  id v28 = &unk_100122168;
  id v29 = self;
  id v17 = v15;
  id v30 = v17;
  __int128 v18 = objc_retainBlock(&v25);
  if (v8)
  {
    LODWORD(v19) = 1048233745;
    LODWORD(v21) = 1061244476;
    LODWORD(v22) = 1065096357;
    LODWORD(v20) = 1048233745;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v19,  v20,  v21,  v22,  v25,  v26,  v27,  v28,  v29));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[HNDSpringAnimationFactory factoryWithMass:stiffness:damping:]( &OBJC_CLASS___HNDSpringAnimationFactory,  "factoryWithMass:stiffness:damping:",  0.5,  300.0,  400.0));
    [v24 setTimingFunction:v23];
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  0LL,  v24,  v14,  v16,  0.61,  0.0);
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  2LL,  v18,  0LL,  0.2,  0.25);
  }

  else
  {
    ((void (*)(void *))v14[2])(v14);
    ((void (*)(void ***))v18[2])(v18);
    ((void (*)(void *, uint64_t))v16[2])(v16, 1LL);
  }
}

- (void)_layoutMenuItems:(BOOL)a3 oldRockers:(id)a4 viewForCenteringAtStart:(id)a5 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  -[HNDRocker _addNewButtonsToView](self, "_addNewButtonsToView");
  if (self->_state != 1) {
    -[HNDRockerButton setSelected:](self->_backButton, "setSelected:", 0LL);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_backdropView, "contentView"));
  [v12 bringSubviewToFront:self->_middleCircle];

  [v10 enumerateObjectsUsingBlock:&stru_100122F08];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100038BA8;
  v31[3] = &unk_1001220B8;
  id v13 = v10;
  id v32 = v13;
  uint64_t v33 = self;
  id v14 = v11;
  id v34 = v14;
  id v15 = objc_retainBlock(v31);
  uint64_t v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  uint64_t v26 = sub_100038CC0;
  CGFloat v27 = &unk_100122EE8;
  id v16 = v13;
  BOOL v30 = a6;
  id v28 = v16;
  id v29 = self;
  id v17 = objc_retainBlock(&v24);
  if (v8)
  {
    LODWORD(v18) = 1048233745;
    LODWORD(v20) = 1061244476;
    LODWORD(v21) = 1065096357;
    LODWORD(v19) = 1048233745;
    double v22 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v18,  v19,  v20,  v21,  v24,  v25,  v26,  v27));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[HNDSpringAnimationFactory factoryWithMass:stiffness:damping:]( &OBJC_CLASS___HNDSpringAnimationFactory,  "factoryWithMass:stiffness:damping:",  0.5,  300.0,  400.0));
    [v23 setTimingFunction:v22];
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  2LL,  v23,  v15,  v17,  0.61,  0.0);
  }

  else
  {
    ((void (*)(void *))v15[2])(v15);
    ((void (*)(void ***, uint64_t))v17[2])(v17, 1LL);
  }
}

- (BOOL)activateMenuItemDown:(id)a3 fromButtonPress:(BOOL)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:AXAssistiveTouchIconTypeHome])
  {
    id v6 = -[HNDRocker _homeButton:](self, "_homeButton:", 1LL);
  }

  else if ([v5 isEqualToString:AXAssistiveTouchIconTypeLockScreen])
  {
    id v6 = -[HNDRocker _lockButton:](self, "_lockButton:", 1LL);
  }

  else if ([v5 isEqualToString:AXAssistiveTouchIconTypeVolumeUp])
  {
    id v6 = -[HNDRocker _volumeUp:](self, "_volumeUp:", 1LL);
  }

  else
  {
    if (![v5 isEqualToString:AXAssistiveTouchIconTypeVolumeDown])
    {
      BOOL v9 = 0;
      goto LABEL_12;
    }

    id v6 = -[HNDRocker _volumeDown:](self, "_volumeDown:", 1LL);
  }

  uint64_t v7 = ASTLogCommon(v6);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Activate menu item down: %@",  (uint8_t *)&v11,  0xCu);
  }

  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)activateMenuItemUp:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeOrientation])
  {
    -[HNDRocker _rotationLockPressed](self, "_rotationLockPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeOpenMenu])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker displayManager](self, "displayManager"));
    [v7 showMenu:1];

    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeNotificationCenter])
  {
    -[HNDRocker _notificationCenterPressed](self, "_notificationCenterPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeControlCenter])
  {
    -[HNDRocker _controlCenterPressed](self, "_controlCenterPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeHome])
  {
    -[HNDRocker _homeButton:](self, "_homeButton:", 0LL);
    goto LABEL_11;
  }

  id v12 = [v6 isEqualToString:AXAssistiveTouchIconTypeSiri];
  if ((_DWORD)v12)
  {
    goto LABEL_11;
  }

  id v13 = [v6 isEqualToString:AXAssistiveTouchIconTypeTypeToSiri];
  if ((_DWORD)v13)
  {
    goto LABEL_11;
  }

  uint64_t v14 = AXAssistiveTouchIconTypeVoiceControl;
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeVoiceControl])
  {
LABEL_23:
    -[HNDRocker _voiceControlPressed](self, "_voiceControlPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeCommandAndControl])
  {
    -[HNDRocker _commandAndControlPressed](self, "_commandAndControlPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeLockScreen])
  {
    -[HNDRocker _lockButton:](self, "_lockButton:", 0LL);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeVolumeUp])
  {
    -[HNDRocker _volumeUp:](self, "_volumeUp:", 0LL);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeVolumeDown])
  {
    -[HNDRocker _volumeDown:](self, "_volumeDown:", 0LL);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeMute])
  {
    -[HNDRocker _ringerPressed:](self, "_ringerPressed:", 1LL);
    goto LABEL_11;
  }

  if (AXDeviceHasStaccato()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeActionButton])
  {
    -[HNDRocker _actionButtonPressed](self, "_actionButtonPressed");
    goto LABEL_11;
  }

  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeCameraButton])
  {
    -[HNDRocker _cameraButtonPressed](self, "_cameraButtonPressed");
    goto LABEL_11;
  }

  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeCameraButtonLightPress])
  {
    -[HNDRocker _cameraButtonLightPressed](self, "_cameraButtonLightPressed");
    goto LABEL_11;
  }

  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeCameraButtonDoubleLightPress])
  {
    -[HNDRocker _cameraButtonDoubleLightPressed](self, "_cameraButtonDoubleLightPressed");
    goto LABEL_11;
  }

  if (AXDeviceSupportsCameraButton()
    && [v6 isEqualToString:AXAssistiveTouchIconTypeVisualIntelligence])
  {
    -[HNDRocker _openVisualIntelligence](self, "_openVisualIntelligence");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeShake])
  {
    -[HNDRocker _shakePressed](self, "_shakePressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeAppSwitcher])
  {
    -[HNDRocker _toggleAppSwitcher](self, "_toggleAppSwitcher");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScreenshot])
  {
    -[HNDRocker _screenshotPressed](self, "_screenshotPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeHoverTextTyping])
  {
    -[HNDRocker _toggleHoverTextTyping](self, "_toggleHoverTextTyping");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypePinch])
  {
    id v15 = self;
    uint64_t v16 = 1LL;
LABEL_64:
    -[HNDRocker _pinchPressed:mode:](v15, "_pinchPressed:mode:", 0LL, v16);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeRotate])
  {
    id v15 = self;
    uint64_t v16 = 0LL;
    goto LABEL_64;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypePinchAndRotate])
  {
    id v15 = self;
    uint64_t v16 = 2LL;
    goto LABEL_64;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeTap])
  {
    -[HNDRocker _tapPressed:fromButtonPress:](self, "_tapPressed:fromButtonPress:", 0LL, v4);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDoubleTap])
  {
    -[HNDRocker _doubleTapPressed:fromButtonPress:](self, "_doubleTapPressed:fromButtonPress:", 0LL, v4);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeLongPress])
  {
    -[HNDRocker _longPressPressed:fromButtonPress:](self, "_longPressPressed:fromButtonPress:", 0LL, v4);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDragAndDrop])
  {
    id v17 = self;
    BOOL v18 = v4;
    uint64_t v19 = 0LL;
LABEL_75:
    -[HNDRocker _dragAndDropPressed:fromButtonPress:dragMenu:]( v17,  "_dragAndDropPressed:fromButtonPress:dragMenu:",  0LL,  v18,  v19);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeMoveMenu])
  {
    id v17 = self;
    BOOL v18 = v4;
    uint64_t v19 = 1LL;
    goto LABEL_75;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSpotlight])
  {
    -[HNDRocker _spotlightPressed:](self, "_spotlightPressed:", 0LL);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeTripleClick])
  {
    -[HNDRocker _tripleClickHomePressed](self, "_tripleClickHomePressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeForceTap])
  {
    -[HNDRocker _orbPressed:fromButtonPress:](self, "_orbPressed:fromButtonPress:", 0LL, v4);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSOS])
  {
    -[HNDRocker _sosPressed](self, "_sosPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDetectionMode])
  {
    -[HNDRocker _detectionModePresssed](self, "_detectionModePresssed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeDimFlashingLights])
  {
    -[HNDRocker _dimFlashingLightsPressed](self, "_dimFlashingLightsPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSysdiagnose])
  {
    -[HNDRocker _sysdiagnosePressed](self, "_sysdiagnosePressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeRebootDevice])
  {
    -[HNDRocker _rebootDevicePressed](self, "_rebootDevicePressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeReachability])
  {
    -[HNDRocker _reachabilityPressed](self, "_reachabilityPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeSpeakScreen])
  {
    -[HNDRocker _speakScreenPressed](self, "_speakScreenPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeToggleDock])
  {
    -[HNDRocker _dockPressed](self, "_dockPressed");
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeArmApplePay])
  {
    -[HNDRocker _applePayButtonPressed:](self, "_applePayButtonPressed:", 0LL);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollUp])
  {
    double v20 = self;
    BOOL v21 = v4;
    uint64_t v22 = 1LL;
LABEL_106:
    uint64_t v23 = 0LL;
LABEL_110:
    uint64_t v24 = 0LL;
LABEL_111:
    -[HNDRocker _scrollPressed:fromButtonPress:vertical:forward:max:]( v20,  "_scrollPressed:fromButtonPress:vertical:forward:max:",  0LL,  v21,  v22,  v23,  v24);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollDown])
  {
    double v20 = self;
    BOOL v21 = v4;
    uint64_t v22 = 1LL;
LABEL_109:
    uint64_t v23 = 1LL;
    goto LABEL_110;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollLeft])
  {
    double v20 = self;
    BOOL v21 = v4;
    uint64_t v22 = 0LL;
    goto LABEL_106;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollRight])
  {
    double v20 = self;
    BOOL v21 = v4;
    uint64_t v22 = 0LL;
    goto LABEL_109;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollToTop])
  {
    double v20 = self;
    BOOL v21 = v4;
    uint64_t v22 = 1LL;
    uint64_t v23 = 0LL;
LABEL_116:
    uint64_t v24 = 1LL;
    goto LABEL_111;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeScrollToBottom])
  {
    double v20 = self;
    BOOL v21 = v4;
    uint64_t v22 = 1LL;
    uint64_t v23 = 1LL;
    goto LABEL_116;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollHorizontal])
  {
    uint64_t v25 = self;
    BOOL v26 = v4;
    uint64_t v27 = 1LL;
LABEL_121:
    -[HNDRocker _continuousScrollPressed:fromButtonPress:inDirection:iconType:]( v25,  "_continuousScrollPressed:fromButtonPress:inDirection:iconType:",  0LL,  v26,  v27,  v6);
    goto LABEL_11;
  }

  if ([v6 isEqualToString:AXAssistiveTouchIconTypeContinuousScrollVertical])
  {
    uint64_t v25 = self;
    BOOL v26 = v4;
    uint64_t v27 = 0LL;
    goto LABEL_121;
  }

  uint64_t v28 = AXAssistiveTouchIconTypeCamera;
  if ([v6 isEqualToString:AXAssistiveTouchIconTypeCamera])
  {
    -[HNDRocker _cameraPressed](self, "_cameraPressed");
  }

  else if ([v6 isEqualToString:v28])
  {
    -[HNDRocker _frontFacingCameraPressed](self, "_frontFacingCameraPressed");
  }

  else if ([v6 hasPrefix:@"CustomGesture-"])
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue( [v6 stringByReplacingOccurrencesOfString:@"CustomGesture-" withString:&stru_100127100]);
    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 customGestures]);

    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id obj = v31;
    id v32 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v43;
      while (2)
      {
        for (i = 0LL; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(obj);
          }
          id v36 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 name]);
          unsigned int v38 = [v37 isEqualToString:v29];

          if (v38)
          {
            -[HNDRocker _customGesturePressed:fromButtonPress:](self, "_customGesturePressed:fromButtonPress:", v36, v4);
            goto LABEL_139;
          }
        }

        id v33 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

- (void)showNubbitPressedState:(BOOL)a3
{
  double v3 = 0.65;
  if (!a3) {
    double v3 = 1.0;
  }
  -[HNDRocker setAlpha:](self, "setAlpha:", v3);
}

- (BOOL)customizationMapAllowInstanceActivation:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    uint64_t v4 = AXAssistiveTouchLocationsForLayout(1LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v6]);

    if (!v7
      || ([v7 isEqualToString:AXAssistiveTouchIconTypeCustom] & 1) != 0
      || ([v7 isEqualToString:AXAssistiveTouchIconTypeDevice] & 1) != 0
      || ([v7 isEqualToString:AXAssistiveTouchIconTypeGestures] & 1) != 0
      || ([v7 isEqualToString:AXAssistiveTouchIconTypeOrientation] & 1) != 0
      || ([v7 isEqualToString:AXAssistiveTouchIconTypeSideApp] & 1) != 0)
    {
      LOBYTE(v8) = 0;
    }

    else
    {
      unsigned int v8 = [v7 isEqualToString:AXAssistiveTouchIconTypeRotateScreen] ^ 1;
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_rockerItemsByLocation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[NSMutableArray count](self->_rockerItems, "count")));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v4 = self->_rockerItems;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "location", (void)v12));
        [v3 setObject:v9 forKeyedSubscript:v10];
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)_layoutButtonsWithViewForCenteringAtStart:(id)a3 includingBackButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[HNDRocker _setBackgroundWithType:](self, "_setBackgroundWithType:", 1LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker _rockerItemsByLocation](self, "_rockerItemsByLocation"));
  unsigned int v8 = v7;
  BOOL v9 = "kersForSubstantialTransition";
  if (v6)
  {
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_10003A598;
    v60[3] = &unk_100122F70;
    v60[4] = self;
    id v61 = v7;
    id v62 = v6;
    BOOL v63 = v4;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v60);
  }

  BOOL v10 = &selRef_setSiriShortcutsItems_;
  if (self->_state != 2) {
    goto LABEL_11;
  }
  if (-[NSMutableArray count](self->_rockerItems, "count") == (id)6)
  {
    layoutView = self->_layoutView;
    v78[0] = AXAssistiveTouchIconLocationTopLeft;
    uint64_t v11 = AXAssistiveTouchIconLocationTopLeft;
    id v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.331, 0.127));
    v79[0] = v53;
    uint64_t v12 = AXAssistiveTouchIconLocationTopRight;
    v78[1] = AXAssistiveTouchIconLocationTopRight;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.669, 0.127));
    v79[1] = v52;
    BOOL v54 = v4;
    v78[2] = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v13 = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v37 = AXAssistiveTouchIconLocationMidLeft;
    uint64_t v50 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.161, 0.475));
    v79[2] = v50;
    v57 = v8;
    uint64_t v14 = AXAssistiveTouchIconLocationMidRight;
    v78[3] = AXAssistiveTouchIconLocationMidRight;
    id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.854, 0.475));
    v79[3] = v46;
    uint64_t v15 = AXAssistiveTouchIconLocationBottomLeft;
    v78[4] = AXAssistiveTouchIconLocationBottomLeft;
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.331, 0.753));
    void v79[4] = v44;
    uint64_t v16 = AXAssistiveTouchIconLocationBottomRight;
    v78[5] = AXAssistiveTouchIconLocationBottomRight;
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.669, 0.753));
    v79[5] = v42;
    double v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  6LL));
    v76[0] = v11;
    v76[1] = v12;
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 2LL));
    v77[0] = v41;
    v75[0] = v13;
    v75[1] = v14;
    id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 2LL));
    v77[1] = v40;
    v74[0] = v15;
    v74[1] = v16;
    unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v74, 2LL));
    v77[2] = v38;
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 3LL));
    v72[0] = v11;
    v72[1] = v15;
    uint64_t v17 = v11;
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 2LL));
    v73[0] = v18;
    v71[0] = v12;
    v71[1] = v16;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
    v73[1] = v19;
    double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 2LL));
    v70[0] = v17;
    v70[1] = v12;
    v70[2] = v14;
    v70[3] = v14;
    v70[4] = v16;
    v70[5] = v15;
    v70[6] = v37;
    v70[7] = v37;
    BOOL v4 = v54;
    unsigned int v8 = v57;
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 8LL));
    -[AXAssistiveTouchLayoutView layoutItemsByLocation:positions:rows:columns:clockwiseOctagonalLocations:horizontallyCenteredLocation:]( layoutView,  "layoutItemsByLocation:positions:rows:columns:clockwiseOctagonalLocations:horizontallyCenteredLocation:",  v57,  v39,  v36,  v20,  v21,  0LL);

    BOOL v10 = &selRef_setSiriShortcutsItems_;
    uint64_t v22 = (void *)v50;
    goto LABEL_8;
  }

  if (-[NSMutableArray count](self->_rockerItems, "count") == (id)5)
  {
    id v51 = self->_layoutView;
    id v58 = v8;
    uint64_t v23 = AXAssistiveTouchIconLocationTopMiddle;
    v68[0] = AXAssistiveTouchIconLocationTopMiddle;
    id v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.5, 0.127));
    v69[0] = v53;
    id v56 = v6;
    uint64_t v24 = AXAssistiveTouchIconLocationMidLeft;
    v68[1] = AXAssistiveTouchIconLocationMidLeft;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.161, 0.475));
    v69[1] = v52;
    BOOL v55 = v4;
    uint64_t v25 = AXAssistiveTouchIconLocationMidRight;
    v68[2] = AXAssistiveTouchIconLocationMidRight;
    uint64_t v49 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.854, 0.475));
    v69[2] = v49;
    uint64_t v26 = AXAssistiveTouchIconLocationBottomLeft;
    v68[3] = AXAssistiveTouchIconLocationBottomLeft;
    id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.331, 0.753));
    v69[3] = v47;
    uint64_t v27 = AXAssistiveTouchIconLocationBottomRight;
    v68[4] = AXAssistiveTouchIconLocationBottomRight;
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:", 0.669, 0.753));
    void v69[4] = v45;
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  5LL));
    v66[0] = v24;
    v66[1] = v25;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 2LL));
    v67[0] = v28;
    v65[0] = v26;
    v65[1] = v27;
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 2LL));
    v67[1] = v29;
    BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
    v64[0] = v23;
    v64[1] = v23;
    v64[2] = v25;
    v64[3] = v25;
    BOOL v4 = v55;
    v64[4] = v27;
    v64[5] = v26;
    v64[6] = v24;
    v64[7] = v24;
    id v6 = v56;
    BOOL v10 = &selRef_setSiriShortcutsItems_;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 8LL));
    uint64_t v32 = v23;
    unsigned int v8 = v58;
    -[AXAssistiveTouchLayoutView layoutItemsByLocation:positions:rows:columns:clockwiseOctagonalLocations:horizontallyCenteredLocation:]( v51,  "layoutItemsByLocation:positions:rows:columns:clockwiseOctagonalLocations:horizontallyCenteredLocation:",  v58,  v43,  v30,  &__NSArray0__struct,  v31,  v32);

    uint64_t v22 = (void *)v49;
LABEL_8:

    BOOL v9 = "updateRockersForSubstantialTransition" + 9;
    if (!v4) {
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_backdropView, "contentView"));
    -[HNDRocker _centerBackButtonToView:](self, "_centerBackButtonToView:", v34);

    goto LABEL_13;
  }

  uint64_t v33 = _AXSMossdeepEnabled();
  if ((_DWORD)v33)
  {
LABEL_11:
    -[AXAssistiveTouchLayoutView layoutItemsByLocation:hasBackButton:]( self->_layoutView,  "layoutItemsByLocation:hasBackButton:",  v8,  -[HNDRocker _backButtonShouldBeHidden](self, "_backButtonShouldBeHidden") ^ 1);
    if (!v4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  _AXAssert( v33,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDRocker.m",  3280LL,  "-[HNDRocker _layoutButtonsWithViewForCenteringAtStart:includingBackButton:]",  @"Unexpected number of items for Device menu");
  if (v4) {
    goto LABEL_12;
  }
LABEL_13:
  -[HNDRocker layoutIfNeeded](self, "layoutIfNeeded");
  double v35 = *(Class *)((char *)&self->super.super.super.super.isa + *((int *)v10 + 951));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = *((void *)v9 + 385);
  v59[2] = sub_10003A604;
  v59[3] = &unk_100122F98;
  void v59[4] = self;
  [v35 enumerateObjectsUsingBlock:v59];
  if (v4) {
    -[HNDRocker _updateBackButtonVisibility](self, "_updateBackButtonVisibility");
  }
}

- (void)setUseCircleMode:(BOOL)a3
{
  self->_useCircle = a3;
}

- (void)_resetHoverCircleLocation
{
  double Center = AX_CGRectGetCenter(-[HNDRocker bounds](self, "bounds"));
  double v5 = v4;
  -[AXPIFingerView frame](self->_middleCircle, "frame");
  -[AXPIFingerView setFrame:](self->_middleCircle, "setFrame:", sub_10002ADC4(Center - v6 * 0.5, v5 - v7 * 0.5));
}

- (void)_updateKeyboardFocusIfNeeded
{
  if (_AXSFullKeyboardAccessEnabled(self, a2))
  {
    -[HNDRocker setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    -[HNDRocker updateFocusIfNeeded](self, "updateFocusIfNeeded");
  }

- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6
{
}

- (void)_loadMenuItems:(BOOL)a3 viewForCenteringAtStart:(id)a4 goBackwards:(BOOL)a5 originalState:(int64_t)a6 shouldUpdateKeyboardFocusIfNeeded:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a3;
  id v26 = a4;
  -[AXPIFingerView setSelected:](self->_middleCircle, "setSelected:", 1LL);
  -[HNDRockerButton setSelected:](self->_selectedButton, "setSelected:", 0LL);
  selectedButton = self->_selectedButton;
  self->_selectedButton = 0LL;

  if (!v9)
  {
    id v13 = -[NSMutableArray count](self->_stackState, "count");
    if (a6 != 1 || v13 != (id)1)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_stackState, "lastObject"));
      uint64_t v15 = (int)[v14 intValue];

      if (v15 != a6)
      {
        stackState = self->_stackState;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
        -[NSMutableArray addObject:](stackState, "addObject:", v17);
      }
    }
  }

  -[HNDRocker showVolumeBar:withProgress:](self, "showVolumeBar:withProgress:", 0LL, 0.0);
  id v18 = -[NSMutableArray copy](self->_rockerItems, "copy");
  -[NSMutableArray removeAllObjects](self->_rockerItems, "removeAllObjects");
  switch(self->_state)
  {
    case 1LL:
      -[HNDRocker _loadInitialMenuItems](self, "_loadInitialMenuItems");
      break;
    case 2LL:
      -[HNDRocker _loadHardwareMenuItems](self, "_loadHardwareMenuItems");
      break;
    case 3LL:
      -[HNDRocker _loadFavoritesMenuItems](self, "_loadFavoritesMenuItems");
      break;
    case 4LL:
      -[HNDRocker _loadRotateMenuItems](self, "_loadRotateMenuItems");
      break;
    case 5LL:
      -[HNDRocker _loadGesturesMenuItems](self, "_loadGesturesMenuItems");
      break;
    case 6LL:
      -[HNDRocker _loadMoreMenuItems](self, "_loadMoreMenuItems");
      break;
    case 9LL:
      -[HNDRocker _loadScrollMenuItems](self, "_loadScrollMenuItems");
      break;
    default:
      break;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  unsigned __int8 v20 = [v19 isGuidedAccessActive];

  char v21 = AXAssistiveAccessEnabled();
  rockerItems = self->_rockerItems;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10003AAE8;
  v29[3] = &unk_100122FB8;
  unsigned __int8 v30 = v20;
  char v31 = v21;
  -[NSMutableArray enumerateObjectsUsingBlock:](rockerItems, "enumerateObjectsUsingBlock:", v29);
  if (qword_100157698 != -1) {
    dispatch_once(&qword_100157698, &stru_100122FD8);
  }
  uint64_t v23 = self->_rockerItems;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10003AC50;
  v27[3] = &unk_100122FF8;
  char v28 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](v23, "enumerateObjectsUsingBlock:", v27);
  if (v9)
  {
    -[HNDRocker _addNewButtonsToView](self, "_addNewButtonsToView");
    if ((unint64_t)(a6 - 2) >= 8)
    {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDRocker.m",  3534LL,  "-[HNDRocker _loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:shouldUpdateKeyboardFocusIfNeeded:]",  @"We should not hit here");
    }

    else
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRocker animationEndButtonForButtonTag:]( self,  "animationEndButtonForButtonTag:",  dword_100117F5C[a6 - 2]));
      if (v24)
      {
LABEL_23:
        -[HNDRocker _removeAllAnimations:](self, "_removeAllAnimations:", 1LL, v25);
        -[HNDRocker _layoutMenuItemsInReverse:oldRockers:animateToIcon:shouldUpdateKeyboardFocusIfNeeded:]( self,  "_layoutMenuItemsInReverse:oldRockers:animateToIcon:shouldUpdateKeyboardFocusIfNeeded:",  v10,  v18,  v24,  v7);

        goto LABEL_24;
      }
    }

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a6));
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDRocker.m",  3538LL,  "-[HNDRocker _loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:shouldUpdateKeyboardFocusIfNeeded:]",  @"Where was our icon? originalState: %@");

    uint64_t v24 = 0LL;
    goto LABEL_23;
  }

  -[HNDRocker _removeAllAnimations:](self, "_removeAllAnimations:", 1LL);
  -[HNDRocker _layoutMenuItems:oldRockers:viewForCenteringAtStart:shouldUpdateKeyboardFocusIfNeeded:]( self,  "_layoutMenuItems:oldRockers:viewForCenteringAtStart:shouldUpdateKeyboardFocusIfNeeded:",  v10,  v18,  v26,  v7);
LABEL_24:
  -[HNDRocker _resetHoverCircleLocation](self, "_resetHoverCircleLocation");
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_rockerItems, "enumerateObjectsUsingBlock:", &stru_100123038);
  -[HNDRocker _updateSelectedButton](self, "_updateSelectedButton");
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

- (id)animationEndButtonForButtonTag:(int)a3
{
  rockerItems = self->_rockerItems;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003AD78;
  v7[3] = &unk_100123058;
  int v8 = a3;
  id v5 = -[NSMutableArray indexOfObjectPassingTest:](rockerItems, "indexOfObjectPassingTest:", v7);
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/HNDRocker.m",  3579LL,  "-[HNDRocker animationEndButtonForButtonTag:]",  @"Where's our button?");
    id v5 = 0LL;
  }

  return -[NSMutableArray objectAtIndex:](self->_rockerItems, "objectAtIndex:", v5);
}

- (void)_customsPressed:(id)a3
{
  self->_int64_t state = 3LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_gesturesPressed:(id)a3
{
  self->_int64_t state = 5LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_scrollPressed:(id)a3
{
  self->_int64_t state = 9LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_pushMenuItemsFromSender:(id)a3
{
}

- (void)_applePayButtonPressed:(id)a3
{
}

- (CGPoint)_initialPointForGesture
{
  if (self->_style)
  {
    double Center = AX_CGRectGetCenter(-[AXPIFingerView frame](self->_middleCircle, "frame"));
    double v5 = v4;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker superview](self, "superview"));
    -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v6, Center, v5);
    double v8 = v7;
    double v10 = v9;
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker window](self, "window"));
    [v11 bounds];
    double MidX = CGRectGetMidX(v21);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker window](self, "window"));
    [v13 bounds];
    double MidY = CGRectGetMidY(v22);

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker window](self, "window"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker superview](self, "superview"));
    objc_msgSend(v6, "convertPoint:toView:", v15, MidX, MidY);
    double v8 = v16;
    double v10 = v17;
  }

  double v18 = v8;
  double v19 = v10;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)_orbPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  -[HNDRocker updateForegroundImageForAction:]( self,  "updateForegroundImageForAction:",  AXAssistiveTouchIconTypeForceTap);
  -[HNDRocker _initialPointForGesture](self, "_initialPointForGesture");
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture forceTouchGestureAtPoint:]( &OBJC_CLASS___AXNamedReplayableGesture,  "forceTouchGestureAtPoint:"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_longPressPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  -[HNDRocker updateForegroundImageForAction:]( self,  "updateForegroundImageForAction:",  AXAssistiveTouchIconTypeLongPress);
  -[HNDRocker _initialPointForGesture](self, "_initialPointForGesture");
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture longPressGestureAtPoint:]( &OBJC_CLASS___AXNamedReplayableGesture,  "longPressGestureAtPoint:"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_tapPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  -[HNDRocker updateForegroundImageForAction:]( self,  "updateForegroundImageForAction:",  AXAssistiveTouchIconTypeDwellClick);
  -[HNDRocker _initialPointForGesture](self, "_initialPointForGesture");
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture tapGestureAtPoint:isDoubleTap:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "tapGestureAtPoint:isDoubleTap:numberOfFingers:",  0LL,  1LL));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_doubleTapPressed:(id)a3 fromButtonPress:(BOOL)a4
{
  BOOL v4 = a4;
  -[HNDRocker updateForegroundImageForAction:]( self,  "updateForegroundImageForAction:",  AXAssistiveTouchIconTypeDoubleTap);
  -[HNDRocker _initialPointForGesture](self, "_initialPointForGesture");
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[AXNamedReplayableGesture tapGestureAtPoint:isDoubleTap:numberOfFingers:]( &OBJC_CLASS___AXNamedReplayableGesture,  "tapGestureAtPoint:isDoubleTap:numberOfFingers:",  1LL,  1LL));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  [v6 prepareGesture:v10 onDisplay:v7];

  if (v4)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
    [v8 performPreparedGestureOnDisplay:v9];
  }
}

- (void)_dragAndDropPressed:(id)a3 fromButtonPress:(BOOL)a4 dragMenu:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = v8;
  if (v5 && !self->_isNubbitVisible)
  {
    uint64_t v21 = ASTLogCommon(v8);
    CGRect v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Skipping _dragAndDropPressed w/ dragMenu because nubbit is not visible",  v23,  2u);
    }
  }

  else
  {
    if (v5) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = AXAssistiveTouchIconTypeDragAndDrop;
    }
    -[HNDRocker updateForegroundImageForAction:](self, "updateForegroundImageForAction:", v10);
    -[HNDRocker _initialPointForGesture](self, "_initialPointForGesture");
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    unsigned int v16 = [v15 inDragMode];

    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
    if (!v16)
    {
      [v17 startDragModeOnDisplay:v18];

      if (!v6 || v5)
      {
        if (!v5) {
          goto LABEL_17;
        }
        double v19 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
        objc_msgSend(v19, "beginDragMenuAtPoint:onDisplay:", v20, v12, v14);
      }

      else
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
        objc_msgSend(v19, "beginDragAtPoint:onDisplay:", v20, v12, v14);
      }

      goto LABEL_17;
    }

    objc_msgSend(v17, "endDragModeAtPoint:onDisplay:completed:", v18, 1, v12, v14);
  }

- (void)_pinchPressed:(id)a3 mode:(unint64_t)a4
{
  id v16 = a3;
  if (a4 <= 2) {
    -[HNDRocker updateForegroundImageForAction:]( self,  "updateForegroundImageForAction:",  *(void *)*(&off_100123360 + a4));
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  double Center = AX_CGRectGetCenter(-[AXPIFingerView frame](self->_middleCircle, "frame"));
  double v9 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker superview](self, "superview"));
  -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v10, Center, v9);
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  objc_msgSend(v6, "startPinchModeWithPoint:onDisplay:mode:", v15, a4, v12, v14);
}

- (void)_scrollPressed:(id)a3 fromButtonPress:(BOOL)a4 vertical:(BOOL)a5 forward:(BOOL)a6 max:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double v12 = &AXAssistiveTouchIconTypeScrollDown;
  if (!a5) {
    double v12 = &AXAssistiveTouchIconTypeScrollRight;
  }
  double v13 = &AXAssistiveTouchIconTypeScrollUp;
  if (!a5) {
    double v13 = &AXAssistiveTouchIconTypeScrollLeft;
  }
  if (!a6) {
    double v12 = v13;
  }
  -[HNDRocker updateForegroundImageForAction:](self, "updateForegroundImageForAction:", *v12);
  -[HNDRocker _initialPointForGesture](self, "_initialPointForGesture");
  double v15 = v14;
  double v17 = v16;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  objc_msgSend(v18, "prepareScrollAtPoint:onDisplay:vertical:forward:max:", v19, v9, v8, v7, v15, v17);

  if (v10)
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
    [v21 performPreparedGestureOnDisplay:v20];
  }

- (void)_continuousScrollPressed:(id)a3 fromButtonPress:(BOOL)a4 inDirection:(unint64_t)a5 iconType:(id)a6
{
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  unsigned int v9 = [v8 inContinuousScrollMode];

  id v11 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  if (v9) {
    [v11 endContinuousScrollingOnDisplay:v10 withCompletion:0];
  }
  else {
    [v11 beginContinuousScrollingInDirection:a5 onDisplay:v10];
  }
}

- (void)_layoutForegroundImageView
{
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_nubbitForeground, "image"));
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  v12.origin.double x = (v4 - v9) * 0.5;
  v12.origin.double y = (v6 - v11) * 0.5;
  v12.size.double width = v9;
  v12.size.double height = v11;
  CGRect v13 = CGRectIntegral(v12);
  -[UIImageView setFrame:]( self->_nubbitForeground,  "setFrame:",  v13.origin.x,  v13.origin.y,  v13.size.width,  v13.size.height);
}

- (void)_voiceControlPressed
{
}

- (void)_siriButtonPressed
{
}

- (void)_typeToSiriButtonPressed
{
}

- (void)_tripleClickHomePressed
{
}

- (void)_notificationCenterPressed
{
}

- (void)_controlCenterPressed
{
}

- (void)_screenshotPressed
{
}

- (void)showBannerWithText:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_disableUserInterfaceClient",  0LL);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker displayManager](self, "displayManager"));
  [v5 addUserInterfaceClientEnabler:@"AssistiveTouchRocker"];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker displayManager](self, "displayManager"));
  id v7 = sub_10002B014(@"ASSISTIVE_TOUCH");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 showSimpleBannerWithTitle:v8 text:v4];

  -[HNDRocker performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_disableUserInterfaceClient",  0LL,  15.0);
}

- (void)_disableUserInterfaceClient
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[HNDRocker displayManager](self, "displayManager"));
  [v2 removeUserInterfaceClientEnabler:@"AssistiveTouchRocker"];
}

- (void)_spotlightPressed:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server", a3));
  unsigned int v5 = [v4 isGuidedAccessActive];

  if (v5)
  {
    uint64_t v7 = ASTLogCommon(v6);
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      double v9 = "Not triggering spotlight because GAX is active";
      double v10 = (uint8_t *)&v15;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  uint64_t v11 = AXAssistiveAccessEnabled();
  if ((_DWORD)v11)
  {
    uint64_t v12 = ASTLogCommon(v11);
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      double v9 = "Not triggering spotlight because Assistive Access is active";
      double v10 = (uint8_t *)&v14;
      goto LABEL_7;
    }

- (void)_detectionModePresssed
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v3 activateDetectionMode];

  -[HNDRocker _menuExited](self, "_menuExited");
}

- (void)_dimFlashingLightsPressed
{
}

- (void)_sosPressed
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  unsigned int v4 = [v3 isGuidedAccessActive];

  if (v4)
  {
    uint64_t v6 = ASTLogCommon(v5);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      double v8 = "Not triggering SOS because GAX is active";
      double v9 = (uint8_t *)&v14;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  uint64_t v10 = AXAssistiveAccessEnabled();
  if ((_DWORD)v10)
  {
    uint64_t v11 = ASTLogCommon(v10);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      double v8 = "Not triggering SOS because Assistive Access is active";
      double v9 = (uint8_t *)&v13;
      goto LABEL_7;
    }

- (void)_commandAndControlPressed
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleCommandAndControl];

  sub_10002AEE8(AXAssistiveTouchIconTypeCommandAndControl);
}

- (void)_sysdiagnosePressed
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003BF14;
  v4[3] = &unk_1001231A0;
  v4[4] = self;
  [v3 performSysdiagnoseWithStatusUpdateHandler:v4];
}

- (void)_reachabilityPressed
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleReachability];

  sub_10002AEE8(AXAssistiveTouchIconTypeReachability);
}

- (void)_rebootDevicePressed
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 rebootDevice];

  sub_10002AEE8(AXAssistiveTouchIconTypeRebootDevice);
}

- (void)_dockPressed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleDock];
}

- (void)_armApplePay
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 armApplePay];
}

- (void)_toggleHoverTextTyping
{
}

- (void)_toggleAppSwitcher
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleAppSwitcher];
}

- (void)_handleTouch:(int64_t)a3
{
  middleCircle = self->_middleCircle;
  if (middleCircle && (-[AXPIFingerView isHidden](middleCircle, "isHidden") & 1) == 0)
  {
    double Center = AX_CGRectGetCenter(-[AXPIFingerView frame](self->_middleCircle, "frame"));
    double v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker superview](self, "superview"));
    -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v11, Center, v10);
    double x = v12;
    double y = v13;
  }

  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  objc_msgSend(v15, "handleMultiTouchStandard:onDisplay:withExistingFingerMidPoint:", a3, v14, x, y);
}

- (void)_hardwareButtonPressed:(id)a3
{
  self->_int64_t state = 2LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_morePressed:(id)a3
{
  self->_int64_t state = 6LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_sideAppPressed:(id)a3
{
  self->_int64_t state = 7LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_sideAppMorePressed:(id)a3
{
  self->_int64_t state = 8LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_activateLockButton
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v3 activateLockButton];

  -[HNDRocker _menuExited](self, "_menuExited");
  sub_10002AEE8(AXAssistiveTouchIconTypeLockScreen);
}

- (void)_lockButton:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  uint64_t v6 = v5;
  if (a3)
  {
    [v5 pressLockButtonDown];

    sub_10002AEE8(AXAssistiveTouchIconTypeLockScreen);
  }

  else
  {
    [v5 liftLockButtonUp];

    -[HNDRocker _menuExited](self, "_menuExited");
  }

- (void)_updateVolumeDisplay
{
  volumeUpdateTimer = self->_volumeUpdateTimer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003C2BC;
  v3[3] = &unk_100121D18;
  v3[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](volumeUpdateTimer, "afterDelay:processBlock:", v3, 0.05);
}

- (void)showVolumeDisplayImmediately
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v3 volumeLevel];
  -[HNDRocker showVolumeBar:withProgress:](self, "showVolumeBar:withProgress:", 1LL);
}

- (void)_volumeUp:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  uint64_t v6 = v5;
  if (v3)
  {
    [v5 pressVolumeUpButtonDown];

    -[HNDRocker _updateVolumeDisplay](self, "_updateVolumeDisplay");
    sub_10002AEE8(AXAssistiveTouchIconTypeVolumeUp);
  }

  else
  {
    [v5 liftVolumeUpButtonUp];

    -[HNDRocker showVolumeDisplayImmediately](self, "showVolumeDisplayImmediately");
  }

- (void)_volumeDown:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  uint64_t v6 = v5;
  if (v3)
  {
    [v5 pressVolumeDownButtonDown];

    -[HNDRocker _updateVolumeDisplay](self, "_updateVolumeDisplay");
    sub_10002AEE8(AXAssistiveTouchIconTypeVolumeDown);
  }

  else
  {
    [v5 liftVolumeDownButtonUp];

    -[HNDRocker showVolumeDisplayImmediately](self, "showVolumeDisplayImmediately");
  }

- (void)_mutePressed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleMute];
}

- (void)_rotationLockPressed
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  unsigned int v4 = [v3 orientationLocked];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
  [v5 setOrientationLocked:v4 ^ 1];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003C55C;
  v7[3] = &unk_100121D18;
  void v7[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v7, v6, 0.25);
}

- (void)_ringerSwitchPressed:(BOOL)a3
{
  if (!-[HNDRocker _replaceRingerWithOrientationLock](self, "_replaceRingerWithOrientationLock") || a3)
  {
    unint64_t v6 = !sub_10002ADD8();
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    unint64_t v6 = (unint64_t)[v5 orientationLocked];
  }

  if (j__AXDeviceIsRingerSwitchAvailable())
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v7 toggleRingerSwitch:v6];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10003C67C;
    v12[3] = &unk_100121D18;
    v12[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v12, v8, 0.25);
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    unsigned int v10 = [v9 orientationLocked];

    id v11 = (id)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    [v11 setOrientationLocked:v10 ^ 1];
  }

- (void)_ringerPressed:(BOOL)a3
{
}

- (void)_actionButtonPressed
{
  if (AXDeviceHasStaccato(self, a2))
  {
    -[HNDRocker _menuExited](self, "_menuExited");
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v3 pressStaccato];
  }

- (void)_cameraButtonPressed
{
  if (AXDeviceSupportsCameraButton(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v3 pressCameraButton];
  }

  -[HNDRocker _menuExited](self, "_menuExited");
}

- (void)_cameraButtonLightPressed
{
  if (AXDeviceSupportsCameraButton(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v3 lightPressCameraButton];
  }

  -[HNDRocker _menuExited](self, "_menuExited");
}

- (void)_cameraButtonDoubleLightPressed
{
  if (AXDeviceSupportsCameraButton(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v3 doubleLightPressCameraButton];
  }

  -[HNDRocker _menuExited](self, "_menuExited");
}

- (void)_openVisualIntelligence
{
  if (AXDeviceSupportsCameraButton(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v3 openVisualIntelligence];
  }

  -[HNDRocker _menuExited](self, "_menuExited");
}

- (void)_shakePressed
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v3 shake];

  homeButtonDismissTimer = self->_homeButtonDismissTimer;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10003C880;
  v5[3] = &unk_100121D18;
  v5[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](homeButtonDismissTimer, "afterDelay:processBlock:", v5, 0.5);
}

- (void)_orientationPressed:(id)a3
{
  self->_int64_t state = 4LL;
  -[HNDRocker _pushMenuItemsFromSender:](self, "_pushMenuItemsFromSender:", a3);
}

- (void)_cameraPressed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 performActionForSystemAction:AXAssistiveTouchIconTypeCamera];
}

- (void)_frontFacingCameraPressed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 performActionForSystemAction:AXAssistiveTouchIconTypeFrontFacingCamera];
}

- (CGPoint)onScreenLocation
{
  double Center = AX_CGRectGetCenter(-[AXPIFingerView frame](self->_middleCircle, "frame"));
  double v5 = v4;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker window](self, "window"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 subviews]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  -[HNDRocker convertPoint:toView:](self, "convertPoint:toView:", v8, Center, v5);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (BOOL)isFullMenuVisible
{
  return self->_isFullMenuVisible;
}

- (void)setFullMenuVisible:(BOOL)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  uint64_t v8 = ASTLogCommon(self);
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v27.double x = x;
    v27.double y = y;
    double v10 = NSStringFromCGPoint(v27);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 67109378;
    BOOL v24 = v6;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "setFullMenuVisible: %d, atPoint: %@", buf, 0x12u);
  }

  if (self->_isFullMenuVisible == v6)
  {
    uint64_t v13 = ASTLogCommon(v12);
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Skipping setFullMenuVisible due to no change in visibility state",  buf,  2u);
    }
  }

  else
  {
    self->_isFullMenuVisible = v6;
    self->_double progress = 0.1;
    -[HNDRocker frame](self, "frame");
    if (v6)
    {
      double v17 = v15;
      double v18 = v16;
      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      float v19 = x - v17 * 0.5;
      float v20 = y - v18 * 0.5;
      -[HNDRocker setFrame:](self, "setFrame:", roundf(v19), roundf(v20), v17, v18);
      -[HNDRocker _resetHoverCircleLocation](self, "_resetHoverCircleLocation");
      -[HNDRocker setAlpha:](self, "setAlpha:", 1.0);
      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
      self->_startInterval = 0.0;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
      [v21 manipulateDimTimer:0];

      self->_int64_t state = 1LL;
      -[HNDRocker _loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:]( self,  "_loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:",  0LL,  self,  0LL,  1LL);
      -[HNDRocker _setBackgroundWithType:](self, "_setBackgroundWithType:", 0LL);
      self->_sentRockers = 0;
      self->_linkRunning = 1;
      -[NSMutableArray enumerateObjectsUsingBlock:](self->_rockerItems, "enumerateObjectsUsingBlock:", &stru_1001231C0);
      -[HNDRocker _updateBackButtonVisibility](self, "_updateBackButtonVisibility");
      -[HNDRocker setAlpha:](self, "setAlpha:", 0.0);
      -[HNDRocker _updateProgress:](self, "_updateProgress:", 0LL);
    }

    else
    {
      self->_startInterval = 0.0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10003CCCC;
      v22[3] = &unk_100121D18;
      v22[4] = self;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v22,  &stru_100123200,  0.2);
    }
  }

- (void)didFailToPinApp
{
  id v3 = sub_10002B014(@"PIN_ERROR");
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[HNDRocker showBannerWithText:](self, "showBannerWithText:", v4);
}

- (void)didFailToFloatApp
{
  id v3 = sub_10002B014(@"FLOAT_ERROR");
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[HNDRocker showBannerWithText:](self, "showBannerWithText:", v4);
}

- (void)_initializeNubbit
{
  double v4 = v3;
  double v6 = v5;
  if (!self->_isFullMenuVisible) {
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_rockerItems, "enumerateObjectsUsingBlock:", &stru_100123220);
  }
  +[HNDRocker nubbitSize](&OBJC_CLASS___HNDRocker, "nubbitSize");
  -[HNDRocker setBounds:](self, "setBounds:", v4, v6, v7, v8);
  -[HNDRocker _setBackgroundWithType:](self, "_setBackgroundWithType:", 0LL);
  nubbitForeground = self->_nubbitForeground;
  if (!nubbitForeground)
  {
    double v10 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", self->_nubbitImage);
    double v11 = self->_nubbitForeground;
    self->_nubbitForeground = v10;

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIImageView setTintColor:](self->_nubbitForeground, "setTintColor:", v12);

    -[UIImageView setAutoresizingMask:](self->_nubbitForeground, "setAutoresizingMask:", 0LL);
    -[HNDRocker addSubview:](self, "addSubview:", self->_nubbitForeground);
    nubbitForeground = self->_nubbitForeground;
  }

  -[UIImageView setAlpha:](nubbitForeground, "setAlpha:", 1.0);
  -[HNDRocker _layoutForegroundImageView](self, "_layoutForegroundImageView");
  -[HNDRocker _updateBackButtonVisibility](self, "_updateBackButtonVisibility");
}

- (void)_updateNubbitFadedProperties
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 assistiveTouchIdleOpacity];
  -[UIImageView setAlpha:](self->_nubbitForeground, "setAlpha:");

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 assistiveTouchIdleOpacity];
  -[UIVisualEffectView setAlpha:](self->_backdropView, "setAlpha:", v4 + -0.1);
}

- (void)_resetVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[HNDRocker style](self, "style"))
  {
    if (v3)
    {
      -[UIVisualEffectView setAlpha:](self->_backdropView, "setAlpha:", 1.0);
      -[UIImageView setAlpha:](self->_nubbitForeground, "setAlpha:", 1.0);
    }

    else
    {
      -[HNDRocker _updateNubbitFadedProperties](self, "_updateNubbitFadedProperties");
    }
  }

- (void)fadeNubbit
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  unsigned int v4 = [v3 alwaysShowMenu];

  if (v4)
  {
    if (!self->_nubbitDimmed)
    {
      -[AXDispatchTimer cancel](self->_nubbitFadeTimer, "cancel");
      nubbitFadeTimer = self->_nubbitFadeTimer;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10003D038;
      v6[3] = &unk_100121D18;
      v6[4] = self;
      -[AXDispatchTimer afterDelay:processBlock:](nubbitFadeTimer, "afterDelay:processBlock:", v6, 4.0);
    }
  }

- (void)highlightNubbit
{
  if (self->_nubbitDimmed)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10003D170;
    v3[3] = &unk_100121D18;
    v3[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.15);
    self->_nubbitDimmed = 0;
    -[HNDRocker fadeNubbit](self, "fadeNubbit");
  }

  else
  {
    -[AXDispatchTimer cancel](self->_nubbitFadeTimer, "cancel");
    -[HNDRocker fadeNubbit](self, "fadeNubbit");
  }

- (void)transitionMenuToNubbit:(CGPoint)a3 changeAlpha:(BOOL)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker displayManager](self, "displayManager"));
  unsigned int v11 = [v10 userInteractionEnabledOnRockerDismissView];

  if (v11)
  {
    uint64_t v13 = ASTLogCommon(v12);
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000AF54C(v14);
    }
  }

  uint64_t v15 = ASTLogCommon(v12);
  double v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v51.double x = x;
    v51.double y = y;
    double v17 = NSStringFromCGPoint(v51);
    double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138412802;
    uint64_t v48 = v18;
    __int16 v49 = 1024;
    *(_DWORD *)uint64_t v50 = v6;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "transitionMenuToNubbit point: %@, changeAlpha: %i, animate: %i",  buf,  0x18u);
  }

  if (!self->_isNubbitVisible)
  {
    uint64_t v23 = ASTLogCommon(v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CGRect v22 = "Skipping transitionMenuToNubbit because nubbit is not visible";
      goto LABEL_13;
    }

- (void)transitionNubbitToMenu:(CGPoint)a3 concurrentAnimation:(id)a4 animationCompleted:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ASTLogCommon(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v43.CGFloat x = x;
    v43.CGFloat y = y;
    uint64_t v13 = NSStringFromCGPoint(v43);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138412290;
    int v42 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "transitionNubbitToMenu: %@", buf, 0xCu);
  }

  if (self->_animatingNubbit)
  {
    uint64_t v16 = ASTLogCommon(v15);
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Skipping transitionNubbitToMenu due to animating nubbit",  buf,  2u);
    }
  }

  else
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue(+[HNDEventManager sharedManager](&OBJC_CLASS___HNDEventManager, "sharedManager"));
    [v18 manipulateDimTimer:1];

    self->_int64_t state = 1LL;
    -[HNDRocker _loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:shouldUpdateKeyboardFocusIfNeeded:]( self,  "_loadMenuItems:viewForCenteringAtStart:goBackwards:originalState:shouldUpdateKeyboardFocusIfNeeded:",  0LL,  self,  0LL,  1LL,  0LL);
    -[HNDRocker _setBackgroundWithType:](self, "_setBackgroundWithType:", 0LL);
    -[HNDRocker frame](self, "frame");
    double v20 = v19;
    double v22 = v21;
    -[UIVisualEffectView bounds](self->_backdropView, "bounds");
    -[HNDRocker setFrame:](self, "setFrame:", v20, v22);
    -[HNDRocker setAlpha:](self, "setAlpha:", 1.0);
    -[HNDRocker setStyle:](self, "setStyle:", 1LL);
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_rockerItems, "enumerateObjectsUsingBlock:", &stru_1001232F0);
    -[HNDRocker _updateBackButtonVisibility](self, "_updateBackButtonVisibility");
    -[AXAssistiveTouchLayoutView centerItems:](self->_layoutView, "centerItems:", self->_rockerItems);
    -[HNDRocker layoutIfNeeded](self, "layoutIfNeeded");
    self->_isFullMenuVisible = 1;
    -[AXPIFingerView setAlpha:](self->_middleCircle, "setAlpha:", 0.0);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10003DB0C;
    v37[3] = &unk_100123318;
    v37[4] = self;
    CGFloat v39 = x;
    CGFloat v40 = y;
    id v38 = v9;
    uint64_t v23 = objc_retainBlock(v37);
    double v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    uint64_t v33 = sub_10003DE14;
    uint64_t v34 = &unk_100123340;
    double v35 = self;
    id v36 = v10;
    double v24 = objc_retainBlock(&v31);
    LODWORD(v25) = 1048233745;
    LODWORD(v26) = 1024060595;
    LODWORD(v27) = 1061244476;
    LODWORD(v28) = 1065096357;
    double v29 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v25,  v26,  v27,  v28,  v31,  v32,  v33,  v34,  v35));
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[HNDSpringAnimationFactory factoryWithMass:stiffness:damping:]( &OBJC_CLASS___HNDSpringAnimationFactory,  "factoryWithMass:stiffness:damping:",  0.5,  300.0,  400.0));
    [v30 setTimingFunction:v29];
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:]( &OBJC_CLASS___UIView,  "_animateWithDuration:delay:options:factory:animations:completion:",  2LL,  v30,  v23,  v24,  0.61,  0.0);
  }
}

- (void)setNubbitVisible:(BOOL)a3
{
  self->_isNubbitVisible = a3;
  nubbitForeground = self->_nubbitForeground;
  if (a3)
  {
    double v5 = 1.0;
    if (!nubbitForeground) {
      -[HNDRocker _initializeNubbit](self, "_initializeNubbit");
    }
  }

  else
  {
    -[UIImageView removeFromSuperview](nubbitForeground, "removeFromSuperview");
    BOOL v6 = self->_nubbitForeground;
    self->_nubbitForeground = 0LL;

    double v5 = 0.0;
  }

  -[HNDRocker setAlpha:](self, "setAlpha:", v5);
}

- (void)_menuExited
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hardwareIdentifier](self, "hardwareIdentifier"));
  [v4 menuExitedOnDisplay:v3];
}

- (BOOL)accessibilityPerformEscape
{
  unsigned __int8 v3 = -[HNDRocker isAccessibilityElement](self, "isAccessibilityElement");
  if ((v3 & 1) == 0) {
    -[HNDRocker _menuExited](self, "_menuExited");
  }
  return v3 ^ 1;
}

- (BOOL)isAccessibilityElement
{
  return v3 > 0.0 && -[HNDRocker style](self, "style") == 0;
}

- (id)accessibilityPath
{
  if (-[HNDRocker _usesCircularNubbit](self, "_usesCircularNubbit"))
  {
    -[UIView bounds](self->_maskImageView, "bounds");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_maskImageView, "layer"));
    [v11 cornerRadius];
    uint64_t v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v4,  v6,  v8,  v10,  v12));
    double v14 = UIAccessibilityConvertPathToScreenCoordinates(v13, self->_maskImageView);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (id)accessibilityLabel
{
  return sub_10002B014(@"nubbit.label");
}

- (id)accessibilityHint
{
  return sub_10002B014(@"nubbit.hint");
}

- (id)accessibilityIdentifier
{
  return @"AssistiveTouchNubbit";
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)rockerButtonGuttersForRockerButton:(id)a3
{
  id v4 = a3;
  rockerItems = self->_rockerItems;
  if (rockerItems)
  {
    rockerItems = (NSMutableArray *)-[NSMutableArray count](rockerItems, "count");
    if (rockerItems) {
      rockerItems = (NSMutableArray *)-[NSMutableArray indexOfObject:](self->_rockerItems, "indexOfObject:", v4);
    }
  }

  int64_t state = self->_state;
  if (state != 1)
  {
    if (state != 6)
    {
LABEL_10:
      double v7 = 30.0;
      goto LABEL_11;
    }

    if ((rockerItems & 1) == 0)
    {
      double v7 = 60.0;
      goto LABEL_11;
    }
  }

  if (rockerItems != (NSMutableArray *)2) {
    goto LABEL_10;
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  unsigned __int8 v9 = [v8 isEqualToString:@"Control Center"];

  double v7 = 18.0;
  if ((v9 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_11:

  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v7;
  double v13 = v7;
  result.var3 = v13;
  result.var2 = v11;
  result.var1 = v12;
  result.var0 = v10;
  return result;
}

- (void)didMoveToWindow
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___HNDRocker;
  -[HNDRocker didMoveToWindow](&v11, "didMoveToWindow");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPerformanceTestReportingServer server](&OBJC_CLASS___AXPerformanceTestReportingServer, "server"));
  [v3 assistiveTouchDidLaunch];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker window](self, "window"));
  id v5 = [v4 _contextId];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRocker hitTestCategoryAssertion](self, "hitTestCategoryAssertion"));
  [v6 invalidate];

  if ((_DWORD)v5)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSTouchEventService sharedInstance](&OBJC_CLASS___BKSTouchEventService, "sharedInstance"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
    double v12 = v8;
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 setContextIDs:v9 forHitTestContextCategory:1]);
    -[HNDRocker setHitTestCategoryAssertion:](self, "setHitTestCategoryAssertion:", v10);
  }

- (void)_updateRockerItemIfNeededForItem:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray count](self->_rockerItems, "count"))
  {
    __n128 v6 = objc_opt_class(&OBJC_CLASS___HNDRockerButton, v5);
    uint64_t v7 = __UIAccessibilityCastAsClass(v6);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 type]);
    unsigned int v10 = [v9 isEqualToString:AXAssistiveTouchIconTypeSpotlight];

    if (v10)
    {
      __n128 v12 = objc_opt_class(&OBJC_CLASS___HNDRockerButton, v11);
      uint64_t v13 = __UIAccessibilityCastAsClass(v12);
      double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentDisplayManager]);
      unsigned int v17 = [v16 isCurrentOrientationLandscape];

      [v14 setDisabled:AXDeviceIsPhone(v18) & v17];
    }
  }
}

- (int)style
{
  return self->_style;
}

- (HNDDisplayManager)displayManager
{
  return (HNDDisplayManager *)objc_loadWeakRetained((id *)&self->_displayManager);
}

- (void)setDisplayManager:(id)a3
{
}

- (NSString)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (NSString)lastMenuItemActivated
{
  return self->_lastMenuItemActivated;
}

- (void)setLastMenuItemActivated:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesAssertion
{
  return self->_disableDashBoardGesturesAssertion;
}

- (void)setDisableDashBoardGesturesAssertion:(id)a3
{
}

- (BOOL)shouldIgnoreNextHome
{
  return self->_shouldIgnoreNextHome;
}

- (void)setShouldIgnoreNextHome:(BOOL)a3
{
  self->_shouldIgnoreNextHome = a3;
}

- (NSArray)backButtonConstraints
{
  return self->_backButtonConstraints;
}

- (void)setBackButtonConstraints:(id)a3
{
}

- (BOOL)shouldForciblyHideBackButtonForAnimation
{
  return self->_shouldForciblyHideBackButtonForAnimation;
}

- (void)setShouldForciblyHideBackButtonForAnimation:(BOOL)a3
{
  self->_shouldForciblyHideBackButtonForAnimation = a3;
}

- (NSArray)sideAppMoreRockerItems
{
  return self->_sideAppMoreRockerItems;
}

- (void)setSideAppMoreRockerItems:(id)a3
{
}

- (NSMutableArray)initialItems
{
  return self->_initialItems;
}

- (void)setInitialItems:(id)a3
{
}

- (NSMutableArray)touchItems
{
  return self->_touchItems;
}

- (void)setTouchItems:(id)a3
{
}

- (NSMutableArray)hardwareItems
{
  return self->_hardwareItems;
}

- (void)setHardwareItems:(id)a3
{
}

- (NSMutableArray)rotateItems
{
  return self->_rotateItems;
}

- (void)setRotateItems:(id)a3
{
}

- (NSMutableArray)moreItems
{
  return self->_moreItems;
}

- (void)setMoreItems:(id)a3
{
}

- (NSMutableArray)scrollItems
{
  return self->_scrollItems;
}

- (void)setScrollItems:(id)a3
{
}

- (NSMutableArray)dwellItems
{
  return self->_dwellItems;
}

- (void)setDwellItems:(id)a3
{
}

- (NSMutableArray)siriShortcutsItems
{
  return self->_siriShortcutsItems;
}

- (void)setSiriShortcutsItems:(id)a3
{
}

- (HNDRockerButton)sideAppButton
{
  return self->_sideAppButton;
}

- (void)setSideAppButton:(id)a3
{
}

- (HNDRockerButton)gesturesButton
{
  return self->_gesturesButton;
}

- (void)setGesturesButton:(id)a3
{
}

- (HNDRockerButton)tripleClickHomeButton
{
  return self->_tripleClickHomeButton;
}

- (void)setTripleClickHomeButton:(id)a3
{
}

- (HNDRockerButton)reachabilityButton
{
  return self->_reachabilityButton;
}

- (void)setReachabilityButton:(id)a3
{
}

- (HNDRockerButton)speakScreenButton
{
  return self->_speakScreenButton;
}

- (void)setSpeakScreenButton:(id)a3
{
}

- (HNDRockerButton)toggleDockButton
{
  return self->_toggleDockButton;
}

- (void)setToggleDockButton:(id)a3
{
}

- (HNDRockerButton)appSwitcherButton
{
  return self->_appSwitcherButton;
}

- (void)setAppSwitcherButton:(id)a3
{
}

- (HNDRockerButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (NSArray)dockSpecificButtons
{
  return self->_dockSpecificButtons;
}

- (void)setDockSpecificButtons:(id)a3
{
}

- (NSMutableDictionary)buttonsByMedusaGesture
{
  return self->_buttonsByMedusaGesture;
}

- (void)setButtonsByMedusaGesture:(id)a3
{
}

- (BSInvalidatable)hitTestCategoryAssertion
{
  return self->_hitTestCategoryAssertion;
}

- (void)setHitTestCategoryAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end