@interface ZWRootViewController
- ($8E443137C4339073293619EAAA2C742F)currentUIContextForEventProcessor:(SEL)a3;
- (AXAssertion)disableControlCenterAssertionFullscreenLens;
- (AXAssertion)disableControlCenterAssertionPIPLens;
- (AXAssertion)disableHomeGestureAssertion;
- (AXAssertion)disableNotificationCenterAssertionFullscreenLens;
- (AXAssertion)disableNotificationCenterAssertionPIPLens;
- (AXDispatchTimer)idleTouchTimer;
- (AXDispatchTimer)keyRepeatTimer;
- (AXUIService)axuiService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isZoomFactorAtMinimum:(double)a3;
- (BOOL)_isZoomedToMinimum;
- (BOOL)_pipLensIsNearBottomOfScreen;
- (BOOL)_pipLensIsNearRightOfScreen;
- (BOOL)_pipLensIsNearTopOfScreen;
- (BOOL)_shouldBlockShowControlCenterGesture;
- (BOOL)_shouldBlockShowNotificationGesture;
- (BOOL)_smartZoomFocusedElementIsBeingSampled;
- (BOOL)_watchUIInverted;
- (BOOL)attemptOrbZoomIfAppropriateWithSlugViewController:(id)a3;
- (BOOL)brailleInputUIIsShowing;
- (BOOL)carouselLockActive;
- (BOOL)eventProcessor:(id)a3 didGetWheelEventWithDelta:(int64_t)a4;
- (BOOL)fullscreenEventHandler:(id)a3 autopanShouldStartWithPoint:(CGPoint)a4 speedFactor:(double *)a5 initialSingleFingerLocation:(CGPoint)a6 fingerCount:(double)a7 pointHasBeenMapped:(BOOL)a8;
- (BOOL)fullscreenEventHandler:(id)a3 autopanWithLocation:(CGPoint)a4 initialSingleFingerLocation:(CGPoint)a5 distance:(double)a6 animationDuration:(double)a7 useGutterDistance:(BOOL)a8 pointHasBeenMapped:(BOOL)a9;
- (BOOL)haveTriedScrollingDuringZoomSweep;
- (BOOL)hostingWindowShouldMoveForReachability;
- (BOOL)inDockedModeForMenuViewController:(id)a3;
- (BOOL)inFullscreenModeForMenuViewController:(id)a3;
- (BOOL)inPIPModeForMenuViewController:(id)a3;
- (BOOL)inStandByForMenuViewController:(id)a3;
- (BOOL)isActiveLensTransitioning;
- (BOOL)isMainDisplay;
- (BOOL)isSweepingToNextZoomRow;
- (BOOL)isZoomInStandByModeWithSmartZoom:(id)a3;
- (BOOL)isZoomLensVisible;
- (BOOL)isZoomMovingWithVelocityWithDockedLensViewController:(id)a3;
- (BOOL)isZoomMovingWithVelocityWithFullscreenEventHandler:(id)a3;
- (BOOL)isZoomSlugVisible;
- (BOOL)pipWasOnBeforeSpeakFingerStarted;
- (BOOL)prefersStatusBarHidden;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)scrollBeganWhileSnarfingScrolls;
- (BOOL)shouldBeginAutopanningLensWithSlugViewController:(id)a3;
- (BOOL)shouldHideGrabbersWithZoomLensViewController:(id)a3;
- (BOOL)shouldSendTapEventWithATVEventProcessor:(id)a3;
- (BOOL)shouldShowSlugWithSlugViewController:(id)a3;
- (BOOL)shouldSuppressKeyCommandHUD;
- (BOOL)snarfingWheelEventsForPan;
- (BOOL)snarfingWheelEventsForZoom;
- (BOOL)togglePeekZoomWithMenuViewController:(id)a3;
- (BOOL)toggleSlugVisibilityWithMenuViewController:(id)a3;
- (BOOL)toggleStandbyOnNextCommandChange;
- (BOOL)touchTrapView:(id)a3 shouldReportSelfInHitTestAtLocation:(CGPoint)a4;
- (BOOL)triedToRezoomForDockTransition;
- (BOOL)triedToToggleStandbyDuringAnimation;
- (BOOL)userIsInteractingWithSlugWithDockedLensViewController:(id)a3;
- (BOOL)usingRelativePushPanningWithFullscreenEventHandler:(id)a3;
- (BOOL)zoomIsAnimating;
- (BOOL)zoomIsAnimatingDueToStandbyToggle;
- (BOOL)zoomIsAnimatingDueToTransition;
- (BOOL)zoomWasUnzoomedDueToAppTransition;
- (BSInvalidatable)hitTestCategoryAssertion;
- (CGPoint)_convertPointFromNormalizedToWindow:(CGPoint)a3;
- (CGPoint)_denormalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4;
- (CGPoint)_denormalizePointForCurrentOrientation:(CGPoint)a3;
- (CGPoint)_normalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4;
- (CGPoint)_physicalScreenPointForVirtualScreenPoint:(CGPoint)a3;
- (CGPoint)_slugNormalizedPositionForCurrentPosition;
- (CGPoint)_slugOriginForNormalizedPosition:(CGPoint)a3;
- (CGPoint)_virtualScreenPointForPhysicalScreenPoint:(CGPoint)a3;
- (CGPoint)lastOrbLocation;
- (CGPoint)mirrorPanOffsetForRTLIfNecessary:(CGPoint)a3;
- (CGPoint)zoomLocationWithFullscreenEventHandler:(id)a3;
- (CGPoint)zoomPanOffset;
- (CGRect)_determineSuitableLensFrame;
- (CGRect)zoomFrame;
- (CGRect)zoomFrameForPanningContinuouslyToPoint:(CGPoint)a3 zoomFactor:(double)a4;
- (CGSize)_lensDefaultSize;
- (CGSize)_lensMaximumSize;
- (CGSize)_lensMinimumSize;
- (CGSize)_screenSizeForCurrentOrientation;
- (CGSize)currentScreenSizeForEventProcessor:(id)a3;
- (NSLayoutConstraint)lensDragXConstraint;
- (NSLayoutConstraint)lensDragYConstraint;
- (NSLayoutConstraint)lensHeightConstraint;
- (NSLayoutConstraint)lensWidthConstraint;
- (NSLayoutConstraint)slugRingBottomConstraint;
- (NSLayoutConstraint)slugRingDragXConstraint;
- (NSLayoutConstraint)slugRingDragYConstraint;
- (NSLayoutConstraint)slugRingLeadingConstraint;
- (NSLayoutConstraint)slugRingTopConstraint;
- (NSLayoutConstraint)slugRingTrailingConstraint;
- (NSMutableSet)deactivatedAppIDs;
- (OS_dispatch_queue)cachedValuesSerialQueue;
- (UIScreen)screen;
- (UIView)containerView;
- (UIView)debugFocusView;
- (UIView)scrollTrapView;
- (ZWAlertManager)zoomAlertManager;
- (ZWAppleTVHUDViewController)HUDViewController;
- (ZWEventProcessor)eventManager;
- (ZWKeyboardContext)kbContext;
- (ZWLensAutopanner)lensAutopanner;
- (ZWMenuViewController)menuViewController;
- (ZWRootViewController)initWithAXUIService:(id)a3 onScreen:(id)a4 isMainDisplay:(BOOL)a5;
- (ZWSmartZoomManager)smartZoom;
- (ZWTouchTrapView)touchTrapView;
- (ZWUIMinimapView)minimapView;
- (ZWZoomDockedLensViewController)dockedLensViewController;
- (ZWZoomFullscreenLensViewController)fullscreenLensViewController;
- (ZWZoomLensViewController)activeLensViewController;
- (ZWZoomPIPLensViewController)pipLensViewController;
- (ZWZoomSlugViewController)slugViewController;
- (double)_calculateDurationForVelocity:(double)a3;
- (double)_interfaceAwareAdjustedAngleForScreenAngle:(double)a3;
- (double)accruedOvershoot;
- (double)handleAppActivationAnimationDelay;
- (double)handleAppDeactivationAnimationDelay;
- (double)handleAppSwitcherRevealAnimationDelay;
- (double)lastEventTime;
- (double)lastScrollTrapOffset;
- (double)lastWheelDelta;
- (double)panOffsetXBeforeTransition;
- (double)reachabilityOffset;
- (double)reachabilityScaleFactor;
- (double)setZoomFactorRespectingUserPreferredMaximumZoom:(double)a3;
- (double)storedZoomLevelWithFullscreenEventHandler:(id)a3;
- (double)zoomFactor;
- (double)zoomFactorForMenuViewController:(id)a3;
- (double)zoomFactorRespectingUserPreferredMaximumZoom:(double)a3;
- (double)zoomLevel;
- (double)zoomLevelWithFullscreenEventHandler:(id)a3;
- (id)activeZoomMode;
- (id)fullscreenZoomDidAutopanUnitTestCallback;
- (id)getLastSpeakUnderFingerPhrase;
- (id)lensTransitionUnitTestCallback;
- (id)title;
- (id)zoomMenuVisibilityChangedUnitTestCallback;
- (int64_t)currentInterfaceOrientationForEventProcessor:(id)a3;
- (int64_t)interfaceOrientationWithFullscreenEventHandler:(id)a3;
- (int64_t)lastKeyboardCommand;
- (unint64_t)pipLensEdgeMask;
- (unint64_t)slugEdgeMask;
- (unsigned)currentDisplayIdForEventProcessor:(id)a3;
- (unsigned)currentWindowContextIdForEventProcessor:(id)a3;
- (void)_applyInitialConstraintsForLensViewController:(id)a3;
- (void)_beginObservingValuesForLens:(id)a3;
- (void)_disableZoomWindowHitTesting;
- (void)_dismissMenuAnimated:(BOOL)a3;
- (void)_enableSmartZoomIfNeeded;
- (void)_enableZoomWindowHitTesting;
- (void)_endObservingValuesForLens:(id)a3;
- (void)_exitStandbyIfNecessary;
- (void)_focusLensOnRect:(CGRect)a3 panLensContent:(BOOL)a4 recentreLens:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_handleKeyboardCommand:(int64_t)a3 isRepeatCommand:(BOOL)a4;
- (void)_handlePanWheelEventWithDelta:(int64_t)a3;
- (void)_handlePanWheelEventWithDelta:(int64_t)a3 animated:(BOOL)a4 animationDuration:(double)a5;
- (void)_handleSlugAction:(int64_t)a3;
- (void)_handleZoomLevelAdjustmentViaGesture:(CGPoint)a3;
- (void)_handleZoomWheelEventWithDelta:(int64_t)a3;
- (void)_initializeEventUIContext:(id *)a3;
- (void)_initializeZoomSettingsIfNeeded;
- (void)_loadZoomTouchExtras;
- (void)_menuDidDisappear;
- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6;
- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6 shouldUseFullDeltaForDockedMode:(BOOL)a7 shouldPan:(BOOL)a8;
- (void)_prepareToHandleZoomLevelAdjustmentViaGesture;
- (void)_presentMenuWithAnchorView:(id)a3 animated:(BOOL)a4 ignoreCooldown:(BOOL)a5;
- (void)_removeAllSystemGestureDisablingAssertions;
- (void)_removeFullscreenSystemGestureDisablingAssertions;
- (void)_removeHomeGestureDisablingAssertion;
- (void)_removePIPSystemGestureDisablingAssertions;
- (void)_resizeZoomLensByDelta:(CGPoint)a3;
- (void)_resizeZoomLensWithAdjustment:(CGPoint)a3 lensPositionCompensation:(CGPoint)a4;
- (void)_rezoomDueToAppTransitionIfNeeded;
- (void)_rezoomDueToDockIfNeeded;
- (void)_setDockResizingEnabled:(BOOL)a3;
- (void)_setPIPLensResizingEnabled:(BOOL)a3;
- (void)_toggleStealingSingleFingerPanning;
- (void)_toggleZoomStandby;
- (void)_transitionToLens:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_transitionToLensForMode:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_unzoomDueToAppTransitionIfNeeded;
- (void)_updateKeyboardFrame:(CGRect)a3;
- (void)_updateLensEdgeMaskForZoomController:(id)a3;
- (void)_updateLensLayout;
- (void)_updateMinimapStatus;
- (void)_updateOrbLocation:(CGPoint)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateSlugConstraintsForOrientation:(int64_t)a3;
- (void)_updateSlugLayoutAnimated:(BOOL)a3;
- (void)_updateStealingSingleFingerPanning:(BOOL)a3 showHUDMessage:(BOOL)a4;
- (void)_updateSystemGestureDisablingAssertions;
- (void)_updateSystemGestureDisablingAssertionsForFullscreenZoom;
- (void)_updateSystemGestureDisablingAssertionsForPipLensPosition;
- (void)_updateZoomFactor:(double)a3 animated:(BOOL)a4;
- (void)_updateZoomListeners;
- (void)_zoomMovementHeartbeat;
- (void)_zoomMovementHeartbeat:(double)a3 fullscreenEventHandler:(id)a4;
- (void)atvEventProcessor:(id)a3 adjustZoomLevelWithDelta:(CGPoint)a4;
- (void)autopanner:(id)a3 didAutopanByDelta:(CGPoint)a4;
- (void)blockHomeGestureIfNeededWithEventProcessor:(id)a3;
- (void)dealloc;
- (void)didAnimateForReachabilityToOffset:(double)a3;
- (void)didEndAnimation;
- (void)didFinishAutopanningLensWithAutopanner:(id)a3;
- (void)didGetSpeakContentGestureWithATVEventProcessor:(id)a3;
- (void)didGetTogglePanningModeGestureWithATVEventProcessor:(id)a3;
- (void)didGetToggleZoomGestureWithEventProcessor:(id)a3;
- (void)didGetTouchOutsideLensChromeWithEventProcessor:(id)a3;
- (void)didGetTouchOutsideZoomMenuWithEventProcessor:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didStartAnimation;
- (void)dismissMenuWithMenuViewController:(id)a3;
- (void)dockedLensViewController:(id)a3 toggleButtonDidReceiveLongPress:(id)a4;
- (void)dockedLensViewController:(id)a3 zoomRegionVisibilityWasChanged:(BOOL)a4;
- (void)doneResizingDockWithDockedLensViewController:(id)a3;
- (void)endOrbZoomWithSlugViewController:(id)a3;
- (void)endZoomMovementWithFullscreenEventHandler:(id)a3;
- (void)eventProcessor:(id)a3 didGetFirstTouchAtLocation:(CGPoint)a4;
- (void)eventProcessor:(id)a3 didGetPanEventWithDelta:(int64_t)a4;
- (void)eventProcessor:(id)a3 didReceiveKeyboardEventWithCommand:(int64_t)a4;
- (void)externalClientSetZoomFactor:(double)a3;
- (void)externalClientSetZoomPanOffset:(CGPoint)a3;
- (void)externalClientWantsToAutopan:(CGPoint)a3 withPanningStyle:(unint64_t)a4;
- (void)fullscreenEventHandler:(id)a3 continueZoomMovementWithVelocity:(double)a4 angle:(double)a5;
- (void)fullscreenEventHandler:(id)a3 didEndOrbAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveOneFingerDownAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerDoubleTapAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerSingleTapAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerTripleTapAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didStartOrbAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 didThreeFingerOrbAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 setUsingRelativePushPanning:(BOOL)a4;
- (void)fullscreenEventHandler:(id)a3 setZoomLevel:(double)a4 duration:(double)a5;
- (void)fullscreenEventHandler:(id)a3 storeZoomLevel:(double)a4 location:(CGPoint)a5 zoomed:(BOOL)a6 forKey:(id)a7;
- (void)fullscreenEventHandler:(id)a3 updateOrbMovementAtLocation:(CGPoint)a4;
- (void)fullscreenEventHandler:(id)a3 updateZoomMovementWithPoint:(CGPoint)a4;
- (void)handleAppActivationAnimationDidFinish;
- (void)handleAppActivationAnimationWillBegin;
- (void)handleAppDeactivationAnimationWillBegin;
- (void)handleAppDidBecomeActiveWithID:(id)a3 initialKeyboardFrame:(CGRect)a4;
- (void)handleAppDidEnterBackgroundWithID:(id)a3;
- (void)handleAppSwitcherRevealAnimationWillBegin;
- (void)handleCarouselLockBegan;
- (void)handleCarouselLockEnded;
- (void)handleDeviceReturnedToClockAtIdle;
- (void)handleDeviceWasUnlocked;
- (void)handleDeviceWillWake;
- (void)handleDragWillEnd;
- (void)handleDragWillStart;
- (void)handleFocusChangedWithType:(int64_t)a3 rect:(CGRect)a4 keyboardFrame:(CGRect)a5 contextId:(unsigned int)a6 appID:(id)a7;
- (void)handleHomeButtonWasPressed;
- (void)handleKeyboardWillAppearWithFrame:(CGRect)a3 inAppWithBundleID:(id)a4;
- (void)handleKeyboardWillHideInAppWithBundleID:(id)a3;
- (void)handleLockButtonWasPressed;
- (void)handleReachabilityToggled:(double)a3;
- (void)handleSettingsAppDidUpdateIdleSlugOpacity:(double)a3;
- (void)handleSettingsAppDidUpdatePreferredDockPosition:(id)a3;
- (void)handleSettingsAppDidUpdatePreferredLensMode:(id)a3;
- (void)handleSubstantialAppTransition;
- (void)handleWasDraggedWithDockedLensViewController:(id)a3;
- (void)hideZoomSlugAndLens:(BOOL)a3 completion:(id)a4;
- (void)lastFingerWasLiftedWithEventProcessor:(id)a3 firstTouchWentIntoSlug:(BOOL)a4;
- (void)loadView;
- (void)menuDidAppear:(id)a3;
- (void)menuViewController:(id)a3 adjustZoomFactor:(double)a4 animated:(BOOL)a5;
- (void)menuViewController:(id)a3 didChooseDockPosition:(id)a4 withCompletion:(id)a5;
- (void)menuViewController:(id)a3 didChooseLensEffect:(id)a4;
- (void)menuViewController:(id)a3 didChooseZoomMode:(id)a4 withCompletion:(id)a5;
- (void)menuViewController:(id)a3 finishedAdjustingZoomFactor:(double)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)sendUserEventOccurred;
- (void)setAccruedOvershoot:(double)a3;
- (void)setActiveLensTransitioning:(BOOL)a3;
- (void)setActiveLensViewController:(id)a3;
- (void)setAxuiService:(id)a3;
- (void)setBrailleInputUIIsShowing:(BOOL)a3;
- (void)setCachedValuesSerialQueue:(id)a3;
- (void)setCarouselLockActive:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setDeactivatedAppIDs:(id)a3;
- (void)setDebugFocusView:(id)a3;
- (void)setDisableControlCenterAssertionFullscreenLens:(id)a3;
- (void)setDisableControlCenterAssertionPIPLens:(id)a3;
- (void)setDisableHomeGestureAssertion:(id)a3;
- (void)setDisableNotificationCenterAssertionFullscreenLens:(id)a3;
- (void)setDisableNotificationCenterAssertionPIPLens:(id)a3;
- (void)setDockedLensViewController:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setFullscreenLensViewController:(id)a3;
- (void)setFullscreenZoomDidAutopanUnitTestCallback:(id)a3;
- (void)setGutterDistanceForUnitTests:(double)a3 scaleFactor:(double)a4;
- (void)setHUDViewController:(id)a3;
- (void)setHaveTriedScrollingDuringZoomSweep:(BOOL)a3;
- (void)setHitTestCategoryAssertion:(id)a3;
- (void)setIdleTouchTimer:(id)a3;
- (void)setInUnitTestingMode:(BOOL)a3;
- (void)setIsMainDisplay:(BOOL)a3;
- (void)setIsSweepingToNextZoomRow:(BOOL)a3;
- (void)setKbContext:(id)a3;
- (void)setKeyRepeatTimer:(id)a3;
- (void)setLastEventTime:(double)a3;
- (void)setLastKeyboardCommand:(int64_t)a3;
- (void)setLastOrbLocation:(CGPoint)a3;
- (void)setLastScrollTrapOffset:(double)a3;
- (void)setLastWheelDelta:(double)a3;
- (void)setLensAutopanner:(id)a3;
- (void)setLensDragXConstraint:(id)a3;
- (void)setLensDragYConstraint:(id)a3;
- (void)setLensHeightConstraint:(id)a3;
- (void)setLensTransitionUnitTestCallback:(id)a3;
- (void)setLensWidthConstraint:(id)a3;
- (void)setMenuViewController:(id)a3;
- (void)setMinimapView:(id)a3;
- (void)setPanOffsetXBeforeTransition:(double)a3;
- (void)setPipLensEdgeMask:(unint64_t)a3;
- (void)setPipLensViewController:(id)a3;
- (void)setPipWasOnBeforeSpeakFingerStarted:(BOOL)a3;
- (void)setReachabilityOffset:(double)a3;
- (void)setScreen:(id)a3;
- (void)setScrollBeganWhileSnarfingScrolls:(BOOL)a3;
- (void)setScrollTrapView:(id)a3;
- (void)setShouldSuppressKeyCommandHUD:(BOOL)a3;
- (void)setSlugEdgeMask:(unint64_t)a3;
- (void)setSlugRingBottomConstraint:(id)a3;
- (void)setSlugRingDragXConstraint:(id)a3;
- (void)setSlugRingDragYConstraint:(id)a3;
- (void)setSlugRingLeadingConstraint:(id)a3;
- (void)setSlugRingTopConstraint:(id)a3;
- (void)setSlugRingTrailingConstraint:(id)a3;
- (void)setSlugViewController:(id)a3;
- (void)setSmartZoom:(id)a3;
- (void)setSnarfingWheelEventsForPan:(BOOL)a3;
- (void)setSnarfingWheelEventsForZoom:(BOOL)a3;
- (void)setTestingScreenSize:(CGSize)a3;
- (void)setToggleStandbyOnNextCommandChange:(BOOL)a3;
- (void)setTouchTrapView:(id)a3;
- (void)setTriedToRezoomForDockTransition:(BOOL)a3;
- (void)setTriedToToggleStandbyDuringAnimation:(BOOL)a3;
- (void)setUnitTestDelegate:(id)a3;
- (void)setZoomAlertManager:(id)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomIsAnimating:(BOOL)a3;
- (void)setZoomIsAnimatingDueToStandbyToggle:(BOOL)a3;
- (void)setZoomIsAnimatingDueToTransition:(BOOL)a3;
- (void)setZoomMenuVisibilityChangedUnitTestCallback:(id)a3;
- (void)setZoomPanOffset:(CGPoint)a3;
- (void)setZoomWasUnzoomedDueToAppTransition:(BOOL)a3;
- (void)showZoomSlugAndLens:(BOOL)a3 completion:(id)a4;
- (void)slugWasDoubleTappedWithSlugViewController:(id)a3;
- (void)slugWasSingleTappedWithSlugViewController:(id)a3;
- (void)slugWasTripleTappedWithSlugViewController:(id)a3;
- (void)stopZoomMovementWithVelocityWithFullscreenEventHandler:(id)a3;
- (void)toggleLensResizeModeWithMenuViewController:(id)a3;
- (void)toggleLensVisibilityWithMenuViewController:(id)a3;
- (void)toggleZoomMenu;
- (void)touchTrapView:(id)a3 didTrapTouches:(id)a4 withEvent:(id)a5;
- (void)touchTrapViewActivated:(id)a3;
- (void)updateDockedZoomRegionVisibility:(BOOL)a3;
- (void)updateFocusWithSmartZoom:(id)a3;
- (void)updateOrbZoomAtPoint:(CGPoint)a3 withSlugViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wantsToStartAutopannerWithATVEventProcessor:(id)a3;
- (void)wantsToStartAutopannerWithSlugViewController:(id)a3;
- (void)wantsToStopAutopannerWithATVEventProcessor:(id)a3;
- (void)wantsToStopAutopannerWithSlugViewController:(id)a3;
- (void)willBeginAutopanningLensWithAutopanner:(id)a3;
- (void)zoomInToPoint:(CGPoint)a3 withZoomFactor:(double)a4 animated:(BOOL)a5;
- (void)zoomLensViewController:(id)a3 didMoveLens:(id)a4 withDelta:(CGPoint)a5;
- (void)zoomLensViewController:(id)a3 grabberDidReceiveTap:(id)a4;
- (void)zoomLensViewController:(id)a3 willBeginMovingLens:(id)a4;
- (void)zoomLensViewControllerDidChangeStandbyMode:(id)a3;
- (void)zoomLensViewControllerUpdateUIForStandby:(id)a3 completion:(id)a4;
- (void)zoomListenerRegisteredForAllAttributeUpdatesCoalesced:(BOOL)a3 clientIdentifier:(id)a4;
- (void)zoomListenerRegisteredForAttributeUpdatesImmediately:(id)a3 registered:(BOOL)a4 clientIdentifier:(id)a5;
- (void)zoomSlugViewController:(id)a3 didDragSlug:(id)a4 withDelta:(CGPoint)a5;
@end

@implementation ZWRootViewController

- (UIScreen)screen
{
  return +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
}

- (ZWRootViewController)initWithAXUIService:(id)a3 onScreen:(id)a4 isMainDisplay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v106.receiver = self;
  v106.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  v10 = -[ZWRootViewController initWithNibName:bundle:](&v106, "initWithNibName:bundle:", 0LL, 0LL);
  if (v10)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kAXSZoomTouchReadyForObserversNotification, 0LL, 0LL, 1u);
    objc_storeWeak((id *)&v10->_axuiService, v8);
    -[ZWRootViewController _loadZoomTouchExtras](v10, "_loadZoomTouchExtras");
    -[ZWRootViewController _initializeZoomSettingsIfNeeded](v10, "_initializeZoomSettingsIfNeeded");
    v12 = objc_alloc_init(&OBJC_CLASS___ZWAlertManager);
    -[ZWRootViewController setZoomAlertManager:](v10, "setZoomAlertManager:", v12);

    -[ZWRootViewController setIsMainDisplay:](v10, "setIsMainDisplay:", v5);
    -[ZWRootViewController setScreen:](v10, "setScreen:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ZWEventProcessor defaultEventProcessor](&OBJC_CLASS___ZWEventProcessor, "defaultEventProcessor"));
    -[ZWRootViewController setEventManager:](v10, "setEventManager:", v13);
    v79 = v13;
    if (v5)
    {
      [v13 setMainDisplayDelegate:v10];
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 externalDisplayDelegates]);
      [v14 addPointer:v10];
    }

    v10->_cachedIsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
    objc_initWeak(&location, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472LL;
    v103[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke;
    v103[3] = &unk_6D0C8;
    objc_copyWeak(&v104, &location);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( [v15 addObserverForName:UIAccessibilityVoiceOverStatusDidChangeNotification object:0 queue:v16 usingBlock:v103]);
    id voiceOverStatusChangedNotificationObserverToken = v10->_voiceOverStatusChangedNotificationObserverToken;
    v10->_id voiceOverStatusChangedNotificationObserverToken = (id)v17;

    dispatch_queue_t v78 = dispatch_queue_create("ZWCachedValuesSerialQueue", 0LL);
    -[ZWRootViewController setCachedValuesSerialQueue:](v10, "setCachedValuesSerialQueue:");
    -[ZWRootViewController _initializeEventUIContext:](v10, "_initializeEventUIContext:", &v10->_eventUIContext);
    -[ZWRootViewController _initializeEventUIContext:]( v10,  "_initializeEventUIContext:",  &v10->_eventUIForInProgressFluidSwitcherGestureContext);
    v19 = objc_alloc(&OBJC_CLASS___AXDispatchTimer);
    v20 = &_dispatch_main_q;
    v21 = -[AXDispatchTimer initWithTargetSerialQueue:](v19, "initWithTargetSerialQueue:", &_dispatch_main_q);

    -[ZWRootViewController setIdleTouchTimer:](v10, "setIdleTouchTimer:", v21);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v21,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    v80 = v21;
    v22 = -[ZWZoomSlugViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___ZWZoomSlugViewController),  "initWithNibName:bundle:",  0LL,  0LL);
    -[ZWRootViewController setSlugViewController:](v10, "setSlugViewController:", v22);
    -[ZWZoomSlugViewController setDelegate:](v22, "setDelegate:", v10);
    v77 = v22;
    v23 = -[ZWAppleTVHUDViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___ZWAppleTVHUDViewController),  "initWithNibName:bundle:",  0LL,  0LL);
    -[ZWRootViewController setHUDViewController:](v10, "setHUDViewController:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v24 zoomFactor];
    double v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v27 zoomPanOffset];
    double v29 = v28;
    double v31 = v30;
    id v76 = v8;

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v82 = (void *)objc_claimAutoreleasedReturnValue([v32 zoomCurrentLensEffect]);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v34 = objc_alloc_init(&OBJC_CLASS___ZWKeyboardContext);
    -[ZWRootViewController setKbContext:](v10, "setKbContext:", v34);

    -[ZWKeyboardContext setKeyboardFrame:]( v10->_kbContext,  "setKeyboardFrame:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
    -[ZWKeyboardContext setZoomFollowsFocus:]( v10->_kbContext,  "setZoomFollowsFocus:",  [v33 zoomShouldFollowFocus]);
    -[ZWKeyboardContext setZoomRepositionsForKeyboard:]( v10->_kbContext,  "setZoomRepositionsForKeyboard:",  [v33 zoomAlwaysUseWindowedZoomForTyping]);
    v35 = objc_alloc_init(&OBJC_CLASS___ZWLensAutopanner);
    -[ZWRootViewController setLensAutopanner:](v10, "setLensAutopanner:", v35);
    -[ZWLensAutopanner setDelegate:](v35, "setDelegate:", v10);
    v36 = -[ZWZoomLensViewController initWithZoomFactor:zoomPanOffset:lensEffect:screen:]( objc_alloc(&OBJC_CLASS___ZWZoomPIPLensViewController),  "initWithZoomFactor:zoomPanOffset:lensEffect:screen:",  v82,  v9,  v26,  v29,  v31);
    -[ZWRootViewController setPipLensViewController:](v10, "setPipLensViewController:", v36);
    -[ZWZoomLensViewController setDelegate:](v36, "setDelegate:", v10);
    -[ZWZoomPIPLensViewController setPipDelegate:](v36, "setPipDelegate:", v10);
    v74 = v36;
    v37 = -[ZWZoomLensViewController initWithZoomFactor:zoomPanOffset:lensEffect:screen:]( objc_alloc(&OBJC_CLASS___ZWZoomDockedLensViewController),  "initWithZoomFactor:zoomPanOffset:lensEffect:screen:",  v82,  v9,  v26,  v29,  v31);
    -[ZWRootViewController setDockedLensViewController:](v10, "setDockedLensViewController:", v37);
    -[ZWZoomLensViewController setDelegate:](v37, "setDelegate:", v10);
    -[ZWZoomDockedLensViewController setDockedDelegate:](v37, "setDockedDelegate:", v10);
    v72 = v35;
    v38 = -[ZWZoomLensViewController initWithZoomFactor:zoomPanOffset:lensEffect:screen:]( objc_alloc(&OBJC_CLASS___ZWZoomFullscreenLensViewController),  "initWithZoomFactor:zoomPanOffset:lensEffect:screen:",  v82,  v9,  v26,  v29,  v31);
    -[ZWRootViewController setFullscreenLensViewController:](v10, "setFullscreenLensViewController:", v38);
    -[ZWZoomLensViewController setDelegate:](v38, "setDelegate:", v10);
    v81 = -[ZWMenuViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___ZWMenuViewController),  "initWithNibName:bundle:",  0LL,  0LL);
    -[ZWRootViewController setMenuViewController:](v10, "setMenuViewController:", v81);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](v10, "menuViewController"));
    [v39 setModalPresentationStyle:7];

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](v10, "menuViewController"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 popoverPresentationController]);
    [v41 setDelegate:v10];

    -[ZWMenuViewController setDelegate:](v81, "setDelegate:", v10);
    if (v5)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](v10, "eventManager", v38, v72, v74));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 fullscreenEventHandler]);
      [v43 setZoomDelegate:v10];
    }

    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](v10, "eventManager", v38, v72, v74));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 fullscreenEventHandler]);
      v44 = (void *)objc_claimAutoreleasedReturnValue([v43 externalDisplayZoomDelegates]);
      [v44 addPointer:v10];
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472LL;
    v101[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_2;
    v101[3] = &unk_6CB98;
    objc_copyWeak(&v102, &location);
    [v45 registerUpdateBlock:v101 forRetrieveSelector:"zoomPreferredLensModes" withListener:v10];

    objc_destroyWeak(&v102);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472LL;
    v99[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_3;
    v99[3] = &unk_6CB98;
    objc_copyWeak(&v100, &location);
    [v46 registerUpdateBlock:v99 forRetrieveSelector:"zoomShouldShowSlug" withListener:v10];

    objc_destroyWeak(&v100);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472LL;
    v97[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_4;
    v97[3] = &unk_6CB98;
    objc_copyWeak(&v98, &location);
    [v47 registerUpdateBlock:v97 forRetrieveSelector:"zoomCurrentLensEffect" withListener:v10];

    objc_destroyWeak(&v98);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_5;
    v94[3] = &unk_6CCC0;
    objc_copyWeak(&v96, &location);
    id v49 = v33;
    id v95 = v49;
    [v48 registerUpdateBlock:v94 forRetrieveSelector:"zoomShouldFollowFocus" withListener:v10];

    objc_destroyWeak(&v96);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472LL;
    v91[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_6;
    v91[3] = &unk_6CCC0;
    objc_copyWeak(&v93, &location);
    id v51 = v49;
    id v92 = v51;
    [v50 registerUpdateBlock:v91 forRetrieveSelector:"zoomAlwaysUseWindowedZoomForTyping" withListener:v10];

    objc_destroyWeak(&v93);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472LL;
    v89[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_7;
    v89[3] = &unk_6CB98;
    objc_copyWeak(&v90, &location);
    [v52 registerUpdateBlock:v89 forRetrieveSelector:"zoomPreferredMaximumZoomScale" withListener:v10];

    objc_destroyWeak(&v90);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472LL;
    v87[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_8;
    v87[3] = &unk_6CB98;
    objc_copyWeak(&v88, &location);
    [v53 registerUpdateBlock:v87 forRetrieveSelector:"zoomCurrentLensMode" withListener:v10];

    objc_destroyWeak(&v88);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472LL;
    v85[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_9;
    v85[3] = &unk_6CB98;
    objc_copyWeak(&v86, &location);
    [v54 registerUpdateBlock:v85 forRetrieveSelector:"zoomPreferredCurrentDockPosition" withListener:v10];

    objc_destroyWeak(&v86);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_10;
    v83[3] = &unk_6CB98;
    objc_copyWeak(&v84, &location);
    [v55 registerUpdateBlock:v83 forRetrieveSelector:"zoomShowWhileMirroring" withListener:v10];

    objc_destroyWeak(&v84);
    if (ZOTTimeSinceBoot() <= 99)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
      [v56 setZoomInStandby:1];
    }

    v10->_snarfingWheelEventsForPan = 0;
    v57 = objc_alloc_init(&OBJC_CLASS___ZWSmartZoomManager);
    -[ZWRootViewController setSmartZoom:](v10, "setSmartZoom:", v57);
    -[ZWSmartZoomManager setDelegate:](v57, "setDelegate:", v10);
    -[ZWRootViewController _enableSmartZoomIfNeeded](v10, "_enableSmartZoomIfNeeded");
    -[ZWRootViewController _updateMinimapStatus](v10, "_updateMinimapStatus");
    v58 = (void *)AXAssertionTypeDisableNotificationCenterGesture;
    id v59 =  +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableNotificationCenterGesture,  @"Zoom: Lens on screeen edge");
    uint64_t v60 = AXAssertionTypeDisableControlCenterGesture;
    id v61 =  +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableControlCenterGesture,  @"Zoom: Lens on screeen edge");
    id v62 =  +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  v58,  @"Zoom: Fullscreen lens not on edge");
    id v63 =  +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  v60,  @"Zoom: Fullscreen lens not on edge");
    int v64 = _AXSVoiceOverTouchEnabled( -[ZWRootViewController _removeAllSystemGestureDisablingAssertions]( v10,  "_removeAllSystemGestureDisablingAssertions"));
    if (v64)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      id v65 = [v58 isBrailleInputUIShowing];
    }

    else
    {
      id v65 = 0LL;
    }

    -[ZWRootViewController setBrailleInputUIIsShowing:](v10, "setBrailleInputUIIsShowing:", v65);
    if (v64) {

    }
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v10->_lastEdgePanHapticTime = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[ZWRootViewController setDeactivatedAppIDs:](v10, "setDeactivatedAppIDs:", v67);

    v68 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[ZWRootViewController setKeyRepeatTimer:](v10, "setKeyRepeatTimer:", v68);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController keyRepeatTimer](v10, "keyRepeatTimer"));
    [v69 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

    -[ZWRootViewController setLastKeyboardCommand:](v10, "setLastKeyboardCommand:", 16LL);
    -[ZWRootViewController setZoomIsAnimating:](v10, "setZoomIsAnimating:", 0LL);

    objc_destroyWeak(&v104);
    objc_destroyWeak(&location);

    id v8 = v76;
  }

  return v10;
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[64] = UIAccessibilityIsVoiceOverRunning();
  [WeakRetained _updateStealingSingleFingerPanning:0 showHUDMessage:0];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pipLensViewController]);
  [v1 preferredLensModesDidChange];

  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained fullscreenLensViewController]);
  [v2 preferredLensModesDidChange];

  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained dockedLensViewController]);
  [v3 preferredLensModesDidChange];

  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained slugViewController]);
  [v4 preferredLensModesDidChange];

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained menuViewController]);
  [v5 preferredLensModesDidChange];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSlugLayoutAnimated:0];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained menuViewController]);
  [v1 zoomCurrentLensEffectDidChange];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[117], "setZoomFollowsFocus:", objc_msgSend(*(id *)(a1 + 32), "zoomShouldFollowFocus"));
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend( WeakRetained[117],  "setZoomRepositionsForKeyboard:",  objc_msgSend(*(id *)(a1 + 32), "zoomAlwaysUseWindowedZoomForTyping"));
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_7(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id v17 = objc_loadWeakRetained((id *)(a1 + 32));
  [v17 zoomFactor];
  objc_msgSend(v17, "setZoomFactorRespectingUserPreferredMaximumZoom:");

  v2 = (void *)objc_claimAutoreleasedReturnValue([v17 activeLensViewController]);
  id WeakRetained = objc_loadWeakRetained(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained activeLensViewController]);
  id v5 = [v4 inStandbyMode];
  id v6 = objc_loadWeakRetained(v1);
  [v6 zoomFactor];
  double v8 = v7;
  id v9 = objc_loadWeakRetained(v1);
  [v9 zoomPanOffset];
  double v11 = v10;
  double v13 = v12;
  id v14 = objc_loadWeakRetained(v1);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 activeLensViewController]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lensEffect]);
  objc_msgSend( v2,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  v5,  v16,  1,  0,  v8,  v11,  v13);
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 zoomCurrentLensMode]);

  if ([v2 length])
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained activeZoomMode]);
    unsigned __int8 v4 = [v3 isEqualToString:v2];

    if ((v4 & 1) == 0) {
      [WeakRetained _transitionToLensForMode:v2 animated:1 completion:0];
    }
  }
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 zoomPreferredCurrentDockPosition]);
  [WeakRetained handleSettingsAppDidUpdatePreferredDockPosition:v2];
}

void __67__ZWRootViewController_initWithAXUIService_onScreen_isMainDisplay___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  else {
    uint64_t v2 = 16LL;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained view]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v4 setDisableUpdateMask:v2];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](self, "eventManager"));
  [v3 cleanup];

  -[ZWRootViewController _removeAllSystemGestureDisablingAssertions](self, "_removeAllSystemGestureDisablingAssertions");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom"));
  [v4 disableSmartZoom];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom"));
  [v5 setDelegate:0];

  if (self->_voiceOverStatusChangedNotificationObserverToken)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self->_voiceOverStatusChangedNotificationObserverToken name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    id voiceOverStatusChangedNotificationObserverToken = self->_voiceOverStatusChangedNotificationObserverToken;
    self->_id voiceOverStatusChangedNotificationObserverToken = 0LL;
  }

  if (-[ZWRootViewController isViewLoaded](self, "isViewLoaded"))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    [v8 removeObserver:self forKeyPath:@"slugRingView.bounds" context:&ZWZoomItemObserverContextID];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    [v9 removeObserver:self forKeyPath:@"view.center" context:&ZWZoomItemObserverContextID];

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    [v10 removeObserver:self forKeyPath:@"userIsInteractingWithSlug" context:&ZWZoomItemObserverContextID];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
    [v11 removeObserver:self forKeyPath:@"userIsInteractingWithMenu" context:&ZWZoomItemObserverContextID];
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensAutopanner](self, "lensAutopanner"));
  [(id)v12 setDelegate:0];

  LOBYTE(v12) = -[ZWRootViewController isMainDisplay](self, "isMainDisplay");
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](self, "eventManager"));
  id v14 = v13;
  if ((v12 & 1) != 0)
  {
    [v13 setMainDisplayDelegate:0];
LABEL_13:

    goto LABEL_14;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 externalDisplayDelegates]);
  id v16 = [v15 count];

  if (v16)
  {
    unint64_t v17 = 0LL;
    while (1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](self, "eventManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 externalDisplayDelegates]);
      v20 = (ZWRootViewController *)[v19 pointerAtIndex:v17];

      if (v20 == self) {
        break;
      }
      ++v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](self, "eventManager"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 externalDisplayDelegates]);
      id v23 = [v22 count];
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](self, "eventManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v14 externalDisplayDelegates]);
    [v24 removePointerAtIndex:v17];

    goto LABEL_13;
  }

- (void)_removePIPSystemGestureDisablingAssertions
{
}

- (void)_removeFullscreenSystemGestureDisablingAssertions
{
}

- (void)_removeHomeGestureDisablingAssertion
{
}

- (void)_removeAllSystemGestureDisablingAssertions
{
}

- (void)_updateSystemGestureDisablingAssertions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v3 != v4
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController")),
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController")),
        v6,
        v5,
        v5 == v6))
  {
    -[ZWRootViewController _updateSystemGestureDisablingAssertionsForPipLensPosition]( self,  "_updateSystemGestureDisablingAssertionsForPipLensPosition");
  }

  else
  {
    -[ZWRootViewController _updateSystemGestureDisablingAssertionsForFullscreenZoom]( self,  "_updateSystemGestureDisablingAssertionsForFullscreenZoom");
  }

- (void)_updateSystemGestureDisablingAssertionsForPipLensPosition
{
  if (-[ZWRootViewController _pipLensIsNearTopOfScreen](self, "_pipLensIsNearTopOfScreen"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[ZWRootViewController disableNotificationCenterAssertionPIPLens]( self,  "disableNotificationCenterAssertionPIPLens"));

    if (!v3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableNotificationCenterGesture,  @"Zoom: Lens on screeen edge"));
      -[ZWRootViewController setDisableNotificationCenterAssertionPIPLens:]( self,  "setDisableNotificationCenterAssertionPIPLens:",  v5);
    }
  }

  else
  {
    id v4 = -[ZWRootViewController setDisableNotificationCenterAssertionPIPLens:]( self,  "setDisableNotificationCenterAssertionPIPLens:",  0LL);
  }

  if (AXDeviceHasHomeButton(v4) && !AXDeviceIsPad())
  {
    if (!-[ZWRootViewController _pipLensIsNearBottomOfScreen](self, "_pipLensIsNearBottomOfScreen"))
    {
LABEL_14:
      -[ZWRootViewController setDisableControlCenterAssertionPIPLens:]( self,  "setDisableControlCenterAssertionPIPLens:",  0LL);
      return;
    }
  }

  else if (!-[ZWRootViewController _pipLensIsNearTopOfScreen](self, "_pipLensIsNearTopOfScreen") {
         || !-[ZWRootViewController _pipLensIsNearRightOfScreen](self, "_pipLensIsNearRightOfScreen"))
  }
  {
    goto LABEL_14;
  }

  if (!-[ZWRootViewController _shouldBlockShowControlCenterGesture](self, "_shouldBlockShowControlCenterGesture")) {
    goto LABEL_14;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ZWRootViewController disableControlCenterAssertionPIPLens]( self,  "disableControlCenterAssertionPIPLens"));

  if (!v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableControlCenterGesture,  @"Zoom: Lens on screeen edge"));
    -[ZWRootViewController setDisableControlCenterAssertionPIPLens:]( self,  "setDisableControlCenterAssertionPIPLens:",  v7);
  }

- (void)_loadZoomTouchExtras
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/AccessibilityBundles/ZoomTouchExtras.axbundle"));
  if (v2)
  {
    id v3 = v2;
    [v2 load];
    objc_msgSend(objc_msgSend(v3, "principalClass"), "initialize");
    uint64_t v2 = v3;
  }
}

- (void)_enableSmartZoomIfNeeded
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom"));
  [v2 enableSmartZoom];
}

- (void)_initializeZoomSettingsIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  if (([v3 zoomPreferencesWereInitialized] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v5 zoomUserHadLegacyZoomEnabled:&v21 wasZoomedIn:&v20 withScale:v19];

    double y = CGPointZero.y;
    objc_msgSend(v4, "setZoomPanOffset:", CGPointZero.x, y);
    -[ZWRootViewController _lensDefaultSize](self, "_lensDefaultSize");
    objc_msgSend(v4, "setZoomWindowFrame:", CGPointZero.x, y, v7, v8);
    [v4 setDockSize:0.5];
    [v3 setZoomCurrentLensEffect:AXZoomLensEffectNone];
    objc_msgSend(v4, "setZoomSlugNormalizedPosition:", 1.0, 0.5);
    [v3 setZoomShouldShowSlug:0];
    id v9 = [v3 zoomPreferredMaximumZoomScale];
    if (v10 == 0.0) {
      id v9 = [v3 setZoomPreferredMaximumZoomScale:5.0];
    }
    uint64_t v11 = AXZoomUserSelectableLensModes(v9);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v3 setZoomPreferredLensModes:v12];

    id v13 = [v3 setZoomShouldAllowFullscreenAutopanning:1];
    if (v21)
    {
      _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Determined that legacy zoom had been set up. Setting zoom window up to look like legacy zoom");
      id v14 = (double *)v19;
      if (!v20) {
        id v14 = (double *)&AXZoomMinimumZoomLevel;
      }
      [v4 setZoomFactor:*v14];
      [v3 setZoomCurrentLensMode:AXZoomLensModeFullscreen];
      [v3 setZoomShouldFollowFocus:0];
      [v3 setZoomPreferredCurrentLensMode:AXZoomLensModeFullscreen];
    }

    else
    {
      uint64_t v15 = AXZoomLensDefault(v13);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      [v4 setZoomFactor:2.0];
      [v3 setZoomPreferredCurrentLensMode:v16];
      [v3 setZoomCurrentLensMode:v16];
      [v3 setZoomShouldFollowFocus:1];
    }

    [v3 setZoomPreferencesWereInitialized:1];
  }

  if ([v4 zoomInStandby])
  {
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 zoomPreferredCurrentLensMode]);
    unsigned int v18 = [v17 isEqualToString:AXZoomLensModeWindow];

    if (v18) {
      [v3 setZoomCurrentLensEffect:AXZoomLensEffectNone];
    }
  }

  if (([v3 zoomShouldFollowFocus] & 1) == 0
    && [v3 zoomAlwaysUseWindowedZoomForTyping])
  {
    [v3 setZoomAlwaysUseWindowedZoomForTyping:0];
  }
}

- (void)loadView
{
  id v3 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v50 = -[UIView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  else {
    uint64_t v8 = 16LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v50, "layer"));
  [v9 setDisableUpdateMask:v8];

  -[ZWRootViewController setView:](self, "setView:", v50);
  double v10 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[ZWRootViewController setContainerView:](self, "setContainerView:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  [v11 setAutoresizingMask:18];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  -[UIView addSubview:](v50, "addSubview:", v12);

  id v13 = -[ZWTouchTrapView initWithFrame:]( objc_alloc(&OBJC_CLASS___ZWTouchTrapView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[ZWRootViewController setTouchTrapView:](self, "setTouchTrapView:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController touchTrapView](self, "touchTrapView"));
  [v14 setAutoresizingMask:18];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController touchTrapView](self, "touchTrapView"));
  -[UIView addSubview:](v50, "addSubview:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController touchTrapView](self, "touchTrapView"));
  [v16 setDelegate:self];

  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
  if (!v22 || v19 == 0.0)
  {
  }

  else
  {

    if (v21 != 0.0) {
      goto LABEL_10;
    }
  }

  double v21 = 1080.0;
  double v19 = 1920.0;
LABEL_10:
  id v23 = -[ZWUIMinimapView initWithFrame:]( objc_alloc(&OBJC_CLASS___ZWUIMinimapView),  "initWithFrame:",  80.0,  58.0,  350.0,  v21 * 350.0 / v19);
  -[ZWRootViewController setMinimapView:](self, "setMinimapView:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
  [v24 addSubview:v25];

  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
  [v26 setAlpha:0.0];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController HUDViewController](self, "HUDViewController"));
  double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 view]);

  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  [v29 addSubview:v28];

  double v30 = (void *)objc_claimAutoreleasedReturnValue([v28 topAnchor]);
  objc_super v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 topAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v32]);
  [v33 setActive:1];

  v34 = (void *)objc_claimAutoreleasedReturnValue([v28 rightAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 rightAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v36]);
  [v37 setActive:1];

  v38 = (void *)objc_claimAutoreleasedReturnValue([v28 bottomAnchor]);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 bottomAnchor]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v40]);
  [v41 setActive:1];

  v42 = (void *)objc_claimAutoreleasedReturnValue([v28 leftAnchor]);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 leftAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v44]);
  [v45 setActive:1];

  -[UIView setHidden:](v50, "setHidden:", 1LL);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v46 addObserver:self forKeyPath:@"view.center" options:1 context:&ZWZoomItemObserverContextID];

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v47 addObserver:self forKeyPath:@"slugRingView.bounds" options:1 context:&ZWZoomItemObserverContextID];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v48 addObserver:self forKeyPath:@"userIsInteractingWithSlug" options:1 context:&ZWZoomItemObserverContextID];

  id v49 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
  [v49 addObserver:self forKeyPath:@"userIsInteractingWithMenu" options:1 context:&ZWZoomItemObserverContextID];
}

- (void)viewDidLoad
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  -[ZWRootViewController viewDidLoad](&v45, "viewDidLoad");
  -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  -[ZWRootViewController addChildViewController:](self, "addChildViewController:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v4 addSubview:v6];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v7 didMoveToParentViewController:self];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 slugRingView]);

  int v12 = AXResistAllCompressingAndStretching[0];
  int v13 = AXResistAllCompressingAndStretching[1];
  int v14 = AXResistAllCompressingAndStretching[2];
  int v15 = AXResistAllCompressingAndStretching[3];
  LODWORD(v16) = AXResistAllCompressingAndStretching[0];
  LODWORD(v17) = v13;
  LODWORD(v18) = v14;
  LODWORD(v19) = v15;
  objc_msgSend(v9, "ax_setContentHuggingAndCompressionResistance:", v16, v17, v18, v19);
  LODWORD(v20) = v12;
  LODWORD(v21) = v13;
  LODWORD(v22) = v14;
  LODWORD(v23) = v15;
  objc_msgSend(v11, "ax_setContentHuggingAndCompressionResistance:", v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v44 safeAreaLayoutGuide]);
  double v25 = (void *)objc_claimAutoreleasedReturnValue([v11 leadingAnchor]);
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v24 leadingAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintGreaterThanOrEqualToAnchor:v26]);
  -[ZWRootViewController setSlugRingLeadingConstraint:](self, "setSlugRingLeadingConstraint:", v27);

  double v28 = (void *)objc_claimAutoreleasedReturnValue([v11 trailingAnchor]);
  double v29 = (void *)objc_claimAutoreleasedReturnValue([v24 trailingAnchor]);
  double v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintLessThanOrEqualToAnchor:v29]);
  -[ZWRootViewController setSlugRingTrailingConstraint:](self, "setSlugRingTrailingConstraint:", v30);

  objc_super v31 = (void *)objc_claimAutoreleasedReturnValue([v11 topAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v24 topAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintGreaterThanOrEqualToAnchor:v32]);
  -[ZWRootViewController setSlugRingTopConstraint:](self, "setSlugRingTopConstraint:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue([v11 bottomAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v24 bottomAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintLessThanOrEqualToAnchor:v35]);
  -[ZWRootViewController setSlugRingBottomConstraint:](self, "setSlugRingBottomConstraint:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingLeadingConstraint](self, "slugRingLeadingConstraint"));
  v46[0] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingTrailingConstraint](self, "slugRingTrailingConstraint"));
  v46[1] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingTopConstraint](self, "slugRingTopConstraint"));
  v46[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingBottomConstraint](self, "slugRingBottomConstraint"));
  v46[3] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 zoomPreferredCurrentLensMode]);
  -[ZWRootViewController _transitionToLensForMode:animated:completion:]( self,  "_transitionToLensForMode:animated:completion:",  v43,  0LL,  0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  -[ZWRootViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  -[ZWRootViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[ZWRootViewController _removeAllSystemGestureDisablingAssertions](self, "_removeAllSystemGestureDisablingAssertions");
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  -[ZWRootViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v4 bringSubviewToFront:v6];

  -[ZWRootViewController _updateSlugLayoutAnimated:](self, "_updateSlugLayoutAnimated:", 0LL);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ZWRootViewController;
  -[ZWRootViewController didMoveToParentViewController:](&v21, "didMoveToParentViewController:", v4);
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  v20[3] = 0LL;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3010000000LL;
  v18[3] = "";
  CGSize v19 = CGSizeZero;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = __54__ZWRootViewController_didMoveToParentViewController___block_invoke;
  v17[3] = &unk_6D0F0;
  v17[4] = self;
  v17[5] = v20;
  v17[6] = v18;
  AXPerformBlockSynchronouslyOnMainThread(v17);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __54__ZWRootViewController_didMoveToParentViewController___block_invoke_2;
  block[3] = &unk_6D118;
  block[4] = self;
  block[5] = v20;
  block[6] = v18;
  dispatch_sync(v5, block);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);

  id v8 = [v7 _contextId];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  double v23 = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  BKSHIDServicesExcludeCAContextsFromHitTestingForZoomSenders();

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController hitTestCategoryAssertion](self, "hitTestCategoryAssertion"));
  [v11 invalidate];

  if ((_DWORD)v8)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSTouchEventService sharedInstance](&OBJC_CLASS___BKSTouchEventService, "sharedInstance"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
    double v22 = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 setContextIDs:v14 forHitTestContextCategory:1]);
    -[ZWRootViewController setHitTestCategoryAssertion:](self, "setHitTestCategoryAssertion:", v15);
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

void __54__ZWRootViewController_didMoveToParentViewController___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 window]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 interfaceOrientation];

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) screen]);
  [v7 bounds];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
}

void __54__ZWRootViewController_didMoveToParentViewController___block_invoke_2(void *a1)
{
  *(void *)(a1[4] + 80LL) = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
  *(void *)(a1[4] + 384LL) = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
  *(_OWORD *)(a1[4] + 96LL) = *(_OWORD *)(*(void *)(a1[6] + 8LL) + 32LL);
  *(_OWORD *)(a1[4] + 400LL) = *(_OWORD *)(*(void *)(a1[6] + 8LL) + 32LL);
  v1 = (void *)a1[4];
  id v2 = v1 + 10;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v1 activeLensViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v8 lensZoomView]);
  objc_msgSend(v3, "zw_convertBoundsToScreenCoordinates");
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v6;
  v2[7] = v7;
}

- (void)_prepareToHandleZoomLevelAdjustmentViaGesture
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned int v4 = [v3 inStandbyMode];

  if (v4) {
    double v5 = AXZoomMinimumZoomLevel;
  }
  else {
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
  }
  self->_zoomFactorBeforeUserAdjustingGesture = v5;
}

- (void)_handleZoomLevelAdjustmentViaGesture:(CGPoint)a3
{
  if (self->_zoomFactorBeforeUserAdjustingGesture + a3.y * -5.0 >= AXZoomMinimumZoomLevel) {
    double v4 = self->_zoomFactorBeforeUserAdjustingGesture + a3.y * -5.0;
  }
  else {
    double v4 = AXZoomMinimumZoomLevel;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 zoomPreferredMaximumZoomScale];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v4;
  }
  -[ZWRootViewController _updateZoomFactor:animated:](self, "_updateZoomFactor:animated:", 0LL, v8);
}

- (void)_updateSlugConstraintsForOrientation:(int64_t)a3
{
  if ((AXDeviceHasHomeButton(self) & 1) == 0 && (AXDeviceIsPad() & 1) == 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    [v5 safeAreaInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    if ((unint64_t)(a3 - 1) > 1)
    {
      if (a3 == 3)
      {
        uint64_t v25 = ZOOMLogCommon();
        double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v29 = 0;
          _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "Updating slug constraints for landscape left orientation",  v29,  2u);
        }

        if (v9 != 0.0) {
          double v7 = 0.0;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingLeadingConstraint](self, "slugRingLeadingConstraint"));
        [v27 setConstant:v7];

        double v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingTrailingConstraint](self, "slugRingTrailingConstraint"));
        [v28 setConstant:-5.0];

        double v24 = 5.0 - v7;
      }

      else
      {
        if (a3 != 4) {
          return;
        }
        uint64_t v19 = ZOOMLogCommon();
        double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v30 = 0;
          _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Updating slug constraints for landscape right orientation",  v30,  2u);
        }

        if (v11 == 0.0) {
          double v21 = -v7;
        }
        else {
          double v21 = 0.0;
        }
        double v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingLeadingConstraint](self, "slugRingLeadingConstraint"));
        [v22 setConstant:5.0];

        double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingTrailingConstraint](self, "slugRingTrailingConstraint"));
        [v23 setConstant:v21];

        double v24 = v21 + 5.0;
      }

      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingTopConstraint](self, "slugRingTopConstraint"));
      double v17 = v16;
      double v18 = v24;
    }

    else
    {
      uint64_t v12 = ZOOMLogCommon();
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Updating slug constraints for portrait orientaiton", buf, 2u);
      }

      int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingLeadingConstraint](self, "slugRingLeadingConstraint"));
      [v14 setConstant:0.0];

      int v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingTrailingConstraint](self, "slugRingTrailingConstraint"));
      [v15 setConstant:0.0];

      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingTopConstraint](self, "slugRingTopConstraint"));
      double v17 = v16;
      double v18 = 0.0;
    }

    [v16 setConstant:v18];
  }

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isZoomLensVisible
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);
    if (v7 && ([v6 alpha], v8 > 0.0)) {
      unsigned int v4 = [v6 isHidden] ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

- (BOOL)isZoomSlugVisible
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  unsigned int v4 = [v3 isViewLoaded];

  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 window]);
    if (v7 && ([v6 alpha], v8 > 0.0)) {
      unsigned int v4 = [v6 isHidden] ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

- (id)title
{
  return ZWLocString(@"ZW_TITLE");
}

- (double)zoomFactor
{
  uint64_t v6 = 0LL;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  cachedValuesSerialQueue = (dispatch_queue_s *)self->_cachedValuesSerialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __34__ZWRootViewController_zoomFactor__block_invoke;
  v5[3] = &unk_6D140;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cachedValuesSerialQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __34__ZWRootViewController_zoomFactor__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 208LL);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (void)setZoomFactor:(double)a3
{
  cachedValuesSerialQueue = (dispatch_queue_s *)self->_cachedValuesSerialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __38__ZWRootViewController_setZoomFactor___block_invoke;
  v11[3] = &unk_6CD58;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_sync(cachedValuesSerialQueue, v11);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  objc_msgSend(v5, "validPanOffsetForProposedOffset:proposedZoomFactor:");
  double v7 = v6;
  double v9 = v8;

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  objc_msgSend(v10, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0);

  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v7, v9);
  -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
}

double __38__ZWRootViewController_setZoomFactor___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 208LL) = result;
  return result;
}

- (double)zoomFactorRespectingUserPreferredMaximumZoom:(double)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 zoomPreferredMaximumZoomScale];
  double v6 = v5;

  return fmin(a3, v6);
}

- (double)setZoomFactorRespectingUserPreferredMaximumZoom:(double)a3
{
  if (AXZoomMinimumZoomLevel > a3) {
    a3 = AXZoomMinimumZoomLevel;
  }
  -[ZWRootViewController zoomFactorRespectingUserPreferredMaximumZoom:]( self,  "zoomFactorRespectingUserPreferredMaximumZoom:",  a3);
  double v5 = v4;
  -[ZWRootViewController setZoomFactor:](self, "setZoomFactor:");
  return v5;
}

- (CGPoint)zoomPanOffset
{
  uint64_t v8 = 0LL;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x3010000000LL;
  double v11 = "";
  cachedValuesSerialQueue = (dispatch_queue_s *)self->_cachedValuesSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __37__ZWRootViewController_zoomPanOffset__block_invoke;
  v7[3] = &unk_6D140;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(cachedValuesSerialQueue, v7);
  double v3 = v9[4];
  double v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  double v5 = v3;
  double v6 = v4;
  result.double y = v6;
  result.x = v5;
  return result;
}

__n128 __37__ZWRootViewController_zoomPanOffset__block_invoke(uint64_t a1)
{
  v1 = (__n128 *)(*(void *)(a1 + 32) + 360LL);
  __n128 result = *v1;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL) = *v1;
  return result;
}

- (void)setZoomPanOffset:(CGPoint)a3
{
  cachedValuesSerialQueue = (dispatch_queue_s *)self->_cachedValuesSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __41__ZWRootViewController_setZoomPanOffset___block_invoke;
  block[3] = &unk_6CC98;
  block[4] = self;
  CGPoint v6 = a3;
  dispatch_sync(cachedValuesSerialQueue, block);
  -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
}

__n128 __41__ZWRootViewController_setZoomPanOffset___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(*(void *)(a1 + 32) + 360LL) = result;
  return result;
}

- (BOOL)_isZoomedToMinimum
{
  return vabdd_f64(v2, AXZoomMinimumZoomLevel) <= 0.0001;
}

- (BOOL)_smartZoomFocusedElementIsBeingSampled
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom"));
  [v3 focusRect];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lensZoomView]);
  [v13 sampleRect];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v23.origin.x = v5;
  v23.origin.double y = v7;
  v23.size.double width = v9;
  v23.size.double height = v11;
  v24.origin.x = v15;
  v24.origin.double y = v17;
  v24.size.double width = v19;
  v24.size.double height = v21;
  return CGRectIntersectsRect(v23, v24);
}

- (void)showZoomSlugAndLens:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  [v7 setHidden:0];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController zoomAlertManager](self, "zoomAlertManager"));
  [v8 showZoomEnabledAlertIfAppropriate];

  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoomPreferredCurrentLensMode]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke;
  v12[3] = &unk_6CE40;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  -[ZWRootViewController _transitionToLensForMode:animated:completion:]( self,  "_transitionToLensForMode:animated:completion:",  v10,  1LL,  v12);
}

void __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pipLensViewController]);
  if (v2 != v3)
  {

LABEL_4:
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoomCurrentLensEffect]);
    [v6 updateLensEffect:v8 animated:1 completion:0];

    goto LABEL_5;
  }

  double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  unsigned __int8 v5 = [v4 inStandbyMode];

  if ((v5 & 1) == 0) {
    goto LABEL_4;
  }
LABEL_5:
  [*(id *)(a1 + 32) _updateLensLayout];
  [*(id *)(a1 + 32) _updateSlugLayoutAnimated:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke_2;
  v10[3] = &unk_6CE40;
  CGFloat v9 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  char v12 = *(_BYTE *)(a1 + 48);
  id v11 = v9;
  AXPerformBlockAsynchronouslyOnMainThread(v10);
}

void __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pipLensViewController]);

  if (v2 == v3)
  {
    double v4 = *(void **)(a1 + 32);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeLensViewController]);
    [v4 _updateLensEdgeMaskForZoomController:v5];
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke_3;
  v22[3] = &unk_6CE40;
  char v24 = *(_BYTE *)(a1 + 48);
  id v6 = *(void **)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v23 = v6;
  CGFloat v7 = objc_retainBlock(v22);
  int v8 = _AXSZoomTouchToggledByPreferenceSwitch();
  _AXSZoomTouchSetToggledByPreferenceSwitch(0LL);
  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 window]);

  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
    char v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pipLensViewController]);
    if (v11 == v12)
    {
      double x = CGRectNull.origin.x;
      double y = CGRectNull.origin.y;
      double width = CGRectNull.size.width;
      double height = CGRectNull.size.height;
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
      objc_msgSend(v13, "zoomInitialFocusRectWithQueryingContext:", objc_msgSend(v10, "_contextId"));
      double x = v14;
      double y = v16;
      double width = v18;
      double height = v20;
    }
  }

  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }

  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  if (CGRectIsEmpty(v25))
  {
    ((void (*)(void *))v7[2])(v7);
  }

  else
  {
    AXUIConvertRectFromContextToScreenSpace(v10, x, y, width, height);
    objc_msgSend(v10, "convertRect:fromWindow:", 0);
    objc_msgSend(v10, "_convertRectToSceneReferenceSpace:");
    objc_msgSend( *(id *)(a1 + 32),  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  1,  1,  1,  v7);
  }
}

uint64_t __55__ZWRootViewController_showZoomSlugAndLens_completion___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
  {
    double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventManager]);
    [v2 beginHandlingHIDEventsForReason:@"Zoom wants them"];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)hideZoomSlugAndLens:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  -[ZWRootViewController _removeAllSystemGestureDisablingAssertions](self, "_removeAllSystemGestureDisablingAssertions");
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController zoomAlertManager](self, "zoomAlertManager"));
  [v7 showZoomDisabledAlertIfAppropriate];

  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  unsigned __int8 v9 = [v8 zoomInStandby];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __55__ZWRootViewController_hideZoomSlugAndLens_completion___block_invoke;
  v11[3] = &unk_6D168;
  unsigned __int8 v13 = v9;
  BOOL v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  -[ZWRootViewController _transitionToLens:animated:completion:]( self,  "_transitionToLens:animated:completion:",  0LL,  1LL,  v11);
}

uint64_t __55__ZWRootViewController_hideZoomSlugAndLens_completion___block_invoke(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 setHidden:1];

  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  [v4 setZoomInStandby:v3];

  if (*(_BYTE *)(a1 + 49))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventManager]);
    [v5 endHandlingHIDEventsForReason:@"Zoom wants them"];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)handleKeyboardWillAppearWithFrame:(CGRect)a3 inAppWithBundleID:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v11 = [v10 ignoreLogging];

  if ((v11 & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v13 = AXLoggerForFacility();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = AXColorizeFormatLog(3LL, @"Zoom handling keyboard will appear. frame:%{public}@ app: %{public}@");
      CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.double width = width;
      v29.size.double height = height;
      double v18 = NSStringFromCGRect(v29);
      CGRect v25 = (void *)objc_claimAutoreleasedReturnValue(v18);
      id v26 = v9;
      uint64_t v19 = _AXStringForArgs(v17);
      double v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138543362;
        double v28 = v20;
        _os_log_impl(&dword_0, v14, v15, "%{public}@", buf, 0xCu);
      }
    }
  }

  CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController deactivatedAppIDs](self, "deactivatedAppIDs", v25, v26));
  unsigned __int8 v22 = [v21 containsObject:v9];

  if ((v22 & 1) == 0)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    [v23 timeIntervalSinceReferenceDate];
    self->_lastKeyboardDismissal = v24;

    -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", x, y, width, height);
  }
}

- (void)handleKeyboardWillHideInAppWithBundleID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v8 = AXLoggerForFacility();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = AXColorizeFormatLog(3LL, @"Zoom handling keyboard will hide for app: %{public}@");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v18 = v4;
      uint64_t v13 = _AXStringForArgs(v12);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        double v20 = v14;
        _os_log_impl(&dword_0, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }

  os_log_type_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController deactivatedAppIDs](self, "deactivatedAppIDs", v18));
  unsigned __int8 v16 = [v15 containsObject:v4];

  if ((v16 & 1) == 0)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_lastKeyboardDismissal = v17;
    -[ZWRootViewController _updateKeyboardFrame:]( self,  "_updateKeyboardFrame:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
  }
}

- (void)zoomListenerRegisteredForAllAttributeUpdatesCoalesced:(BOOL)a3 clientIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v10 = AXLoggerForFacility();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);

    os_log_type_t v12 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = AXColorizeFormatLog(3LL, @"Zoom listener registered: %{public}@ %d");
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v17 = v6;
      BOOL v18 = v4;
      uint64_t v15 = _AXStringForArgs(v14);
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        double v20 = v16;
        _os_log_impl(&dword_0, v11, v12, "%{public}@", buf, 0xCu);
      }
    }
  }

  -[ZWRootViewController setZoomIsAnimating:](self, "setZoomIsAnimating:", 0LL, v17, v18);
  -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
}

- (void)zoomListenerRegisteredForAttributeUpdatesImmediately:(id)a3 registered:(BOOL)a4 clientIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v9 = [v8 ignoreLogging];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v11 = AXLoggerForFacility();
    os_log_type_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = AXColorizeFormatLog(3LL, @"Zoom listener registered for attributes: %{public}@ %d");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v18 = v7;
      BOOL v19 = v5;
      uint64_t v16 = _AXStringForArgs(v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        CGFloat v21 = v17;
        _os_log_impl(&dword_0, v12, v13, "%{public}@", buf, 0xCu);
      }
    }
  }

  -[ZWRootViewController setZoomIsAnimating:](self, "setZoomIsAnimating:", 0LL, v18, v19);
  -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
}

- (void)handleFocusChangedWithType:(int64_t)a3 rect:(CGRect)a4 keyboardFrame:(CGRect)a5 contextId:(unsigned int)a6 appID:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a4.size.height;
  double v13 = a4.size.width;
  double v14 = a4.origin.y;
  double v15 = a4.origin.x;
  id v18 = a7;
  if (v18)
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController deactivatedAppIDs](self, "deactivatedAppIDs"));
    unsigned __int8 v20 = [v19 containsObject:v18];

    if ((v20 & 1) == 0)
    {
      if ((_DWORD)v7)
      {
        CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 window]);
        objc_msgSend( v21,  "convertFrame:fromContextId:toContextId:",  v7,  objc_msgSend(v23, "_contextId"),  v15,  v14,  v13,  v12);
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 window]);
        double v34 = AXUIConvertRectFromContextToScreenSpace(v33, v25, v27, v29, v31);
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v41 window]);
        objc_msgSend(v42, "convertRect:fromWindow:", 0, v34, v36, v38, v40);
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;

        id v51 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
        v52 = (void *)objc_claimAutoreleasedReturnValue([v51 window]);
        objc_msgSend(v52, "_convertRectToSceneReferenceSpace:", v44, v46, v48, v50);
        double v15 = v53;
        double v14 = v54;
        double v13 = v55;
        double v12 = v56;
      }

      v57 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
      unsigned __int8 v58 = [v57 ignoreLogging];

      if ((v58 & 1) == 0)
      {
        id v59 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
        uint64_t v60 = AXLoggerForFacility();
        id v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);

        os_log_type_t v62 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v61, v62))
        {
          uint64_t v63 = AXColorizeFormatLog(3LL, @"Zoom handling focus change:%ld rect:%{public}@ kbFrame:%{public}@");
          int v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
          v92.origin.double x = v15;
          v92.origin.double y = v14;
          v92.size.double width = v13;
          v92.size.double height = v12;
          id v65 = NSStringFromCGRect(v92);
          double v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
          v93.origin.double x = x;
          v93.origin.double y = y;
          v93.size.double width = width;
          v93.size.double height = height;
          v67 = NSStringFromCGRect(v93);
          id v88 = v66;
          v89 = (void *)objc_claimAutoreleasedReturnValue(v67);
          int64_t v87 = a3;
          uint64_t v68 = _AXStringForArgs(v64);
          v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

          if (os_log_type_enabled(v61, v62))
          {
            *(_DWORD *)buf = 138543362;
            v91 = v69;
            _os_log_impl(&dword_0, v61, v62, "%{public}@", buf, 0xCu);
          }
        }
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom", v87, v88, v89));
      unsigned __int8 v71 = [v70 isEnabled];

      if (a3 == 9 || (v71 & 1) == 0)
      {
        v94.origin.double x = x;
        v94.origin.double y = y;
        v94.size.double width = width;
        v94.size.double height = height;
        IsEmptdouble y = (id)CGRectIsEmpty(v94);
        if ((unint64_t)(a3 - 1) > 1 || _AXSVoiceOverTouchEnabled(IsEmpty))
        {
          if (a3 == 5)
          {
          }

          else if (a3 == 3 && !_AXSAssistiveTouchScannerEnabled())
          {
            goto LABEL_41;
          }

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController eventManager](self, "eventManager"));
          v74 = (void *)objc_claimAutoreleasedReturnValue([v73 fullscreenEventHandler]);
          unsigned __int8 v75 = [v74 anyFingerDown];

          if (!a3 || (v75 & 1) == 0)
          {
            id v76 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
            v77 = (void *)objc_claimAutoreleasedReturnValue([v76 window]);
            unsigned int v78 = [v77 _contextId];

            if (v78 != (_DWORD)v7)
            {
              v79 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
              unsigned int v80 = [v79 inStandbyMode];

              +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
              double v82 = v81;
              if (a3)
              {
                if (vabdd_f64(v81, self->_lastTypingFocusChangeTime) >= 0.2) {
                  int v83 = v80 ^ 1;
                }
                else {
                  int v83 = 0;
                }
                if (a3 == 2 && -[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible"))
                {
                  if ((v83 & ~-[ZWKeyboardContext zoomRepositionsForKeyboard]( self->_kbContext,  "zoomRepositionsForKeyboard") & 1) == 0) {
                    goto LABEL_41;
                  }
                }

                else if (!v83)
                {
                  goto LABEL_41;
                }

                goto LABEL_40;
              }

              self->_lastTypingFocusChangeTime = v81;
              id v84 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
              v85 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));
              if (v84 == v85
                && !-[ZWKeyboardContext zoomRepositionsForKeyboard](self->_kbContext, "zoomRepositionsForKeyboard"))
              {
                unsigned __int8 v86 = -[ZWKeyboardContext zoomFollowsFocus](self->_kbContext, "zoomFollowsFocus");

                LOBYTE(v80) = v86 ^ 1 | v80;
              }

              else
              {
              }

              if (vabdd_f64(v82, self->_lastKeyboardDismissal) >= 0.25 && (v80 & 1) == 0) {
LABEL_40:
              }
                -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:]( self,  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  1LL,  a3 != 0,  a3 == 0,  0LL,  v15,  v14,  v13,  v12);
            }
          }
        }
      }
    }
  }

- (void)handleLockButtonWasPressed
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"Zoom handling lock button press");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v17 = 138543362;
        id v18 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
  }

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v13 == v14)
  {
    -[ZWRootViewController _setPIPLensResizingEnabled:](self, "_setPIPLensResizingEnabled:", 0LL);
  }

  else
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

    if (v15 == v16) {
      -[ZWRootViewController _setDockResizingEnabled:](self, "_setDockResizingEnabled:", 0LL);
    }
  }

  -[ZWRootViewController _dismissMenuAnimated:](self, "_dismissMenuAnimated:", 0LL);
}

- (void)handleDeviceWasUnlocked
{
  self->_lastDeviceUnlockTime = v3;
}

- (void)handleDeviceWillWake
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v2 wakeSlug];
}

- (void)handleHomeButtonWasPressed
{
}

- (void)handleSettingsAppDidUpdatePreferredLensMode:(id)a3
{
}

- (void)handleSettingsAppDidUpdatePreferredDockPosition:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  [v5 setDockPositionIsTransitioning:1];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringForCurrentDockPosition]);
  unsigned __int8 v8 = [v7 isEqualToString:v4];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    unsigned __int8 v10 = [v9 inStandbyMode];

    if ((v10 & 1) != 0)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_5;
      v23[3] = &unk_6CBC0;
      v23[4] = self;
      [v11 transitionToDockPosition:v4 completion:v23];
    }

    else
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      [v13 zoomFactor];
      double v15 = v14;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      [v16 zoomPanOffset];
      double v18 = v17;
      double v20 = v19;
      CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoomCurrentLensEffect]);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke;
      v24[3] = &unk_6D008;
      v24[4] = self;
      id v25 = v4;
      objc_msgSend( v12,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  v22,  1,  v24,  v15,  v18,  v20);

      uint64_t v11 = v25;
    }
  }
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_2;
  v4[3] = &unk_6CBC0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 transitionToDockPosition:v3 completion:v4];
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v3 zoomFactor];
  double v5 = v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v6 zoomPanOffset];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoomCurrentLensEffect]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_3;
  v13[3] = &unk_6CBC0;
  v13[4] = *(void *)(a1 + 32);
  objc_msgSend( v2,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v12,  1,  v13,  v5,  v8,  v10);
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  [v2 setDockPositionIsTransitioning:0];

  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_4;
  block[3] = &unk_6CBC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_5(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  [v2 setDockPositionIsTransitioning:0];

  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_6;
  block[3] = &unk_6CBC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __72__ZWRootViewController_handleSettingsAppDidUpdatePreferredDockPosition___block_invoke_6(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

- (void)handleSettingsAppDidUpdateIdleSlugOpacity:(double)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v4 updateIdleSlugOpacityAndPreviewImmediately:a3];
}

- (void)handleAppActivationAnimationWillBegin
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"Zoom handling app activation animation will begin");
      double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v13 = 138543362;
        double v14 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  -[ZWRootViewController _unzoomDueToAppTransitionIfNeeded](self, "_unzoomDueToAppTransitionIfNeeded");
}

- (void)handleAppDeactivationAnimationWillBegin
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"Zoom handling app deactivation animation will begin");
      double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v13 = 138543362;
        double v14 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  -[ZWRootViewController _unzoomDueToAppTransitionIfNeeded](self, "_unzoomDueToAppTransitionIfNeeded");
}

- (void)handleAppActivationAnimationDidFinish
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(3LL, @"Zoom handling app activation animation did finish");
      double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v13 = 138543362;
        double v14 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  -[ZWRootViewController _rezoomDueToAppTransitionIfNeeded](self, "_rezoomDueToAppTransitionIfNeeded");
}

- (void)handleDeviceReturnedToClockAtIdle
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend( v3,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  AXZoomLensEffectNone,  1,  0,  AXZoomMinimumZoomLevel,  CGPointZero.x,  CGPointZero.y);
}

- (void)handleCarouselLockBegan
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend( v3,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  AXZoomLensEffectNone,  1,  0,  AXZoomMinimumZoomLevel,  CGPointZero.x,  CGPointZero.y);
}

- (void)handleCarouselLockEnded
{
}

- (void)handleSubstantialAppTransition
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v5 = AXLoggerForFacility();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog(3LL, @"Zoom handling substantial app transition");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = _AXStringForArgs(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, v7))
      {
        int v12 = 138543362;
        int v13 = v11;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }

- (void)handleAppDidBecomeActiveWithID:(id)a3 initialKeyboardFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (-[ZWRootViewController isViewLoaded](self, "isViewLoaded"))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController deactivatedAppIDs](self, "deactivatedAppIDs"));
    [v10 removeObject:v9];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
    unsigned __int8 v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
      uint64_t v14 = AXLoggerForFacility();
      double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

      os_log_type_t v16 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = AXColorizeFormatLog( 3LL,  @"Zoom handling app did become active: %{public}@. keyboard Frame: %{public}@");
        double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v26.origin.double x = x;
        v26.origin.double y = y;
        v26.size.double width = width;
        v26.size.double height = height;
        double v19 = NSStringFromCGRect(v26);
        id v22 = v9;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v19);
        uint64_t v20 = _AXStringForArgs(v18);
        CGFloat v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          id v25 = v21;
          _os_log_impl(&dword_0, v15, v16, "%{public}@", buf, 0xCu);
        }
      }
    }

    -[ZWRootViewController _rezoomDueToAppTransitionIfNeeded](self, "_rezoomDueToAppTransitionIfNeeded", v22, v23);
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    if (!CGRectIsEmpty(v27)) {
      -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:", x, y, width, height);
    }
  }
}

- (void)handleAppDidEnterBackgroundWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v8 = AXLoggerForFacility();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = AXColorizeFormatLog(3LL, @"Zoom handling app did enter background: %{public}@");
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v18 = v4;
      uint64_t v13 = _AXStringForArgs(v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v14;
        _os_log_impl(&dword_0, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }

  if (-[ZWRootViewController isViewLoaded](self, "isViewLoaded", v18))
  {
    -[ZWRootViewController _rezoomDueToAppTransitionIfNeeded](self, "_rezoomDueToAppTransitionIfNeeded");
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController deactivatedAppIDs](self, "deactivatedAppIDs"));
    unsigned __int8 v16 = [v15 containsObject:v4];

    if ((v16 & 1) == 0) {
      -[ZWRootViewController _updateKeyboardFrame:]( self,  "_updateKeyboardFrame:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController deactivatedAppIDs](self, "deactivatedAppIDs"));
    [v17 addObject:v4];
  }
}

- (void)handleAppSwitcherRevealAnimationWillBegin
{
  char v3 = 1;
  _AXLogWithFacility(3LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, v3, @"App switcher reveal animation will begin");
  -[ZWRootViewController _updateKeyboardFrame:]( self,  "_updateKeyboardFrame:",  CGRectNull.origin.x,  CGRectNull.origin.y,  CGRectNull.size.width,  CGRectNull.size.height);
}

- (id)activeZoomMode
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v3 == v4)
  {
    os_log_type_t v10 = (id *)&AXZoomLensModeFullscreen;
LABEL_8:
    id v9 = (__CFString *)*v10;
    return v9;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v5 == v6)
  {
    os_log_type_t v10 = (id *)&AXZoomLensModeWindow;
    goto LABEL_8;
  }

  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  if (v7 == v8)
  {
    os_log_type_t v10 = (id *)&AXZoomLensModeWindowAnchored;
    goto LABEL_8;
  }

  id v9 = &stru_6D450;
  return v9;
}

- (double)handleAppActivationAnimationDelay
{
  return -1.0;
}

- (double)handleAppDeactivationAnimationDelay
{
  return -1.0;
}

- (double)handleAppSwitcherRevealAnimationDelay
{
  return -1.0;
}

- (void)handleDragWillStart
{
  cachedValuesSerialQueue = (dispatch_queue_s *)self->_cachedValuesSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __43__ZWRootViewController_handleDragWillStart__block_invoke;
  block[3] = &unk_6CBC0;
  block[4] = self;
  dispatch_sync(cachedValuesSerialQueue, block);
}

uint64_t __43__ZWRootViewController_handleDragWillStart__block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376LL) |= 0x1000u;
  return result;
}

- (void)handleDragWillEnd
{
  cachedValuesSerialQueue = (dispatch_queue_s *)self->_cachedValuesSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __41__ZWRootViewController_handleDragWillEnd__block_invoke;
  block[3] = &unk_6CBC0;
  block[4] = self;
  dispatch_sync(cachedValuesSerialQueue, block);
}

uint64_t __41__ZWRootViewController_handleDragWillEnd__block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376LL) &= ~0x1000u;
  return result;
}

- (CGRect)zoomFrame
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lensZoomView]);
  [v4 effectiveZoomViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v13 == v14)
  {
    double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    CGRect v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    CGRect v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lensChromeView]);
    objc_msgSend(v24, "convertRect:fromView:", v27, v6, v8, v10, v12);
    double v6 = v28;
    double v8 = v29;
    double v10 = v30;
    double v12 = v31;

LABEL_10:
  }

  else
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

    if (v15 == v16)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      [v17 zoomRegionFrame];
      double v6 = v18;
      double v8 = v19;
      double v10 = v20;
      double v12 = v21;

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      id v23 = [v22 dockPosition];

      switch((unint64_t)v23)
      {
        case 0uLL:
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          [v24 screenShift];
          double v8 = v8 - v25;
          goto LABEL_10;
        case 1uLL:
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          [v24 screenShift];
          double v6 = v6 - v40;
          goto LABEL_10;
        case 2uLL:
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v24 dockedLensView]);
          [v32 bounds];
          double v34 = v33;
          double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          [v35 screenShift];
          double v6 = v6 + v34 - v36;
          goto LABEL_8;
        case 3uLL:
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v24 dockedLensView]);
          [v32 bounds];
          double v38 = v37;
          double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          [v35 screenShift];
          double v8 = v8 + v38 - v39;
LABEL_8:

          goto LABEL_10;
        default:
          break;
      }
    }
  }

  double v41 = v6;
  double v42 = v8;
  double v43 = v10;
  double v44 = v12;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (double)zoomLevel
{
  return result;
}

- (double)reachabilityScaleFactor
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));
  double v5 = 1.0;
  if (v3 == v4)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    if (([v6 zoomInStandby] & 1) == 0)
    {
      -[ZWRootViewController zoomFactor](self, "zoomFactor");
      double v5 = 1.0 / v7;
    }
  }

  return v5;
}

- (void)_focusLensOnRect:(CGRect)a3 panLensContent:(BOOL)a4 recentreLens:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a7;
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  objc_msgSend(v16, "zw_convertRectFromScreenCoordinates:", x, y, width, height);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v26 = [v25 zoomDebugShowExternalFocusRect];

  if (v26)
  {
    CGRect v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController debugFocusView](self, "debugFocusView"));

    if (!v27)
    {
      double v28 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      -[ZWRootViewController setDebugFocusView:](self, "setDebugFocusView:", v28);
      double v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
      [v29 addSubview:v28];

      double v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](&OBJC_CLASS___UIColor, "greenColor"));
      -[UIView setBackgroundColor:](v28, "setBackgroundColor:", v30);
    }

    double v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController debugFocusView](self, "debugFocusView"));
    objc_msgSend(v31, "setFrame:", v18, v20, v22, v24);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController debugFocusView](self, "debugFocusView"));
    [v32 bringSubviewToFront:v33];
  }

  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472LL;
  v94[2] = __89__ZWRootViewController__focusLensOnRect_panLensContent_recentreLens_animated_completion___block_invoke;
  v94[3] = &unk_6D190;
  BOOL v102 = a4;
  id v34 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v95 = v34;
  id v96 = self;
  double v98 = v18;
  double v99 = v20;
  double v100 = v22;
  double v101 = v24;
  BOOL v103 = v7;
  id v35 = v15;
  id v97 = v35;
  BOOL v104 = v8;
  double v36 = objc_retainBlock(v94);
  CGFloat v92 = v24;
  CGFloat v93 = v20;
  CGFloat v91 = v22;
  if (-[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible")) {
    unsigned int v37 = -[ZWKeyboardContext zoomRepositionsForKeyboard](self->_kbContext, "zoomRepositionsForKeyboard");
  }
  else {
    unsigned int v37 = 0;
  }
  double v38 = (void *)objc_claimAutoreleasedReturnValue([v34 view]);
  double v39 = (void *)objc_claimAutoreleasedReturnValue([v34 view]);
  [v39 bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  objc_msgSend(v38, "convertRect:toView:", v48, v41, v43, v45, v47);
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned __int8 v58 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v57 == v58)
  {
    double v50 = UIRectInset(v50, v52, v54, v56, 18.0, 18.0, 18.0, 18.0);
    double v52 = v59;
    double v54 = v60;
    double v56 = v61;
  }

  double v62 = CGPointZero.x;
  double v63 = CGPointZero.y;
  if (((v37 | !v8) & 1) == 0)
  {
    CGFloat v89 = CGPointZero.y;
    CGFloat v90 = CGPointZero.x;
    v106.origin.double x = v50;
    v106.origin.double y = v52;
    v106.size.double width = v54;
    v106.size.double height = v56;
    double MidX = CGRectGetMidX(v106);
    v107.origin.double x = v50;
    v107.origin.double y = v52;
    v107.size.double width = v54;
    v107.size.double height = v56;
    double MidY = CGRectGetMidY(v107);
    v108.origin.double x = v18;
    v108.origin.double y = v93;
    v108.size.double width = v91;
    v108.size.double height = v92;
    double v67 = CGRectGetMidX(v108);
    v109.origin.double x = v18;
    v109.origin.double y = v93;
    v109.size.double width = v91;
    v109.size.double height = v92;
    double v68 = CGRectGetMidY(v109);
    id v69 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

    if (v34 == v69)
    {
      -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
      double v62 = v67 - MidX - v78;
      double v63 = v68 - MidY - v79;
    }

    else
    {
      id v70 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

      if (v34 == v70)
      {
        -[ZWRootViewController zoomFrame](self, "zoomFrame");
        double v80 = CGRectGetMidX(v110);
        -[ZWRootViewController zoomFrame](self, "zoomFrame");
        double v62 = v67 - v80;
        double v63 = v68 - CGRectGetMidY(v111);
      }

      else
      {
        id v71 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

        double v63 = v89;
        double v62 = CGPointZero.x;
        if (v34 == v71)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          v73 = v72;
          double v74 = v18;
          double v75 = v93;
          double v76 = v91;
          double v77 = v92;
LABEL_29:
          objc_msgSend(v72, "deltaForDockedZoomMovementToRect:", v74, v75, v76, v77, *(void *)&v89, *(void *)&v90);
          double v62 = v87;
          double v63 = v88;
        }
      }
    }

uint64_t (**__89__ZWRootViewController__focusLensOnRect_panLensContent_recentreLens_animated_completion___block_invoke( uint64_t a1))(void)
{
  if (*(_BYTE *)(a1 + 88))
  {
    id v2 = *(void **)(a1 + 32);
    char v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dockedLensViewController]);

    if (v2 == v3)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dockedLensViewController]);
      objc_msgSend( v15,  "deltaForDockedZoomMovementToRect:",  *(double *)(a1 + 56),  *(double *)(a1 + 64),  *(double *)(a1 + 72),  *(double *)(a1 + 80));
      double v17 = v16;
      double v19 = v18;

      objc_msgSend( *(id *)(a1 + 40),  "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:",  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 89),  1,  1,  1,  v17,  v19);
    }

    else if (!*(_BYTE *)(a1 + 90))
    {
      [*(id *)(a1 + 40) zoomFactor];
      double v5 = v4;
      objc_msgSend( *(id *)(a1 + 32),  "offsetIgnoringValidOffsetConstraintsByPanningToRect:zoomFacotr:",  *(double *)(a1 + 56),  *(double *)(a1 + 64),  *(double *)(a1 + 72),  *(double *)(a1 + 80),  v4);
      double v7 = v6;
      double v9 = v8;
      objc_msgSend( *(id *)(a1 + 32),  "offsetByPanningToRect:zoomFactor:",  *(double *)(a1 + 56),  *(double *)(a1 + 64),  *(double *)(a1 + 72),  *(double *)(a1 + 80),  v5);
      double v11 = v10;
      double v13 = v12;
      objc_msgSend( *(id *)(a1 + 32),  "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:",  1,  v7,  v9,  v10,  v12);
      objc_msgSend(*(id *)(a1 + 40), "setZoomPanOffset:", v11, v13);
      return (uint64_t (**)(void))objc_msgSend( *(id *)(a1 + 32),  "updateZoomFactor:panOffset:animated:animationDuration:completion:",  *(unsigned __int8 *)(a1 + 89),  *(void *)(a1 + 48),  v5,  v11,  v13,  -1.0);
    }
  }

  double result = *(uint64_t (***)(void))(a1 + 48);
  if (result) {
    return (uint64_t (**)(void))result[2]();
  }
  return result;
}

- (void)zoomInToPoint:(CGPoint)a3 withZoomFactor:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v10 == v11)
  {
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    [v26 frame];
    double Center = AX_CGRectGetCenter(v27, v28, v29, v30);
    double v33 = v32;

    -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", x - Center, y - v33);
    -[ZWRootViewController setZoomFactorRespectingUserPreferredMaximumZoom:]( self,  "setZoomFactorRespectingUserPreferredMaximumZoom:",  a4);
    double v35 = v34;
    double v36 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v36 zoomCurrentLensEffect]);

    unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke;
    v55[3] = &unk_6CBC0;
    v55[4] = self;
    objc_msgSend( v37,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v22,  v5,  v55,  v35,  v38,  v39);

    -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
    double v40 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v40 setZoomInStandby:0];

    double v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    double v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
    [v41 bringSubviewToFront:v42];

    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController kbContext](self, "kbContext"));
    [v23 keyboardFrame];
    -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:");
LABEL_6:

    return;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v12 != v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

    if (v14 != v15) {
      return;
    }
    -[ZWRootViewController _physicalScreenPointForVirtualScreenPoint:]( self,  "_physicalScreenPointForVirtualScreenPoint:",  x,  y);
    double v17 = v16;
    double v19 = v18;
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    objc_msgSend(v20, "moveDockedZoomToPhysicalScreenPoint:animated:", 0, v17, v19);

    double v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoomCurrentLensEffect]);

    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_4;
    v52[3] = &unk_6CBC0;
    v52[4] = self;
    objc_msgSend( v23,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v22,  1,  v52,  a4,  v24,  v25);
    goto LABEL_6;
  }

  double v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  objc_msgSend(v43, "zw_convertRectToScreenCoordinates:", x, y, 2.0, 2.0);
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_2;
  v53[3] = &unk_6D1B8;
  v53[4] = self;
  *(double *)&v53[5] = v45;
  *(double *)&v53[6] = v47;
  *(double *)&v53[7] = v49;
  *(double *)&v53[8] = v51;
  *(double *)&v53[9] = a4;
  BOOL v54 = v5;
  -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:]( self,  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  0LL,  1LL,  0LL,  v53,  v45,  v47,  v49,  v51);
}

id __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

void __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerView]);
  objc_msgSend( v2,  "zw_convertRectFromScreenCoordinates:",  *(double *)(a1 + 40),  *(double *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64));
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  objc_msgSend(v11, "offsetByPanningToRect:zoomFactor:", v4, v6, v8, v10, *(double *)(a1 + 72));
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:", v13, v15);
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoomCurrentLensEffect]);

  double v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  double v19 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) zoomPanOffset];
  uint64_t v20 = *(unsigned __int8 *)(a1 + 80);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_3;
  v23[3] = &unk_6CBC0;
  v23[4] = *(void *)(a1 + 32);
  objc_msgSend( v18,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v17,  v20,  v23,  v19,  v21,  v22);
}

id __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

id __62__ZWRootViewController_zoomInToPoint_withZoomFactor_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

- (void)_initializeEventUIContext:(id *)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
  [v5 bounds];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  id v10 = -[ZWRootViewController interfaceOrientation](self, "interfaceOrientation");
  double v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __50__ZWRootViewController__initializeEventUIContext___block_invoke;
  block[3] = &unk_6CF00;
  block[6] = v7;
  void block[7] = v9;
  block[8] = v10;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(v11, block);
}

void __50__ZWRootViewController__initializeEventUIContext___block_invoke(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 40) + 16LL) = *(_OWORD *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  *(void *)uint64_t v2 = *(void *)(a1 + 64);
  *(void *)(v2 + 8) = 0LL;
  CGPoint origin = CGRectNull.origin;
  CGSize size = CGRectNull.size;
  *(CGPoint *)(v2 + 32) = CGRectNull.origin;
  *(CGSize *)(v2 + 48) = size;
  uint64_t v5 = *(void *)(a1 + 40);
  *(CGPoint *)(v5 + 64) = origin;
  *(CGSize *)(v5 + 80) = size;
  uint64_t v6 = *(void *)(a1 + 40);
  *(CGPoint *)(v6 + 96) = origin;
  *(CGSize *)(v6 + 112) = size;
  uint64_t v7 = *(void *)(a1 + 40);
  *(CGPoint *)(v7 + 208) = origin;
  *(CGSize *)(v7 + 224) = size;
  uint64_t v8 = *(void *)(a1 + 40);
  *(CGPoint *)(v8 + 240) = origin;
  *(CGSize *)(v8 + 256) = size;
  uint64_t v9 = *(void *)(a1 + 40);
  *(CGPoint *)(v9 + 176) = origin;
  *(CGSize *)(v9 + 192) = size;
  uint64_t v10 = *(void *)(a1 + 40);
  *(CGPoint *)(v10 + 144) = origin;
  *(CGSize *)(v10 + 160) = size;
  *(void *)(*(void *)(a1 + 40) + 136LL) = 0LL;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  [v11 zoomFactor];
  *(void *)(*(void *)(a1 + 40) + 128LL) = v12;

  uint64_t v13 = *(void *)(a1 + 40);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  [v14 zoomPanOffset];
  *(void *)(v13 + 280) = v15;
  *(void *)(v13 + 288) = v16;

  *(_WORD *)(*(void *)(a1 + 40) + 296LL) &= ~1u;
  *(_WORD *)(*(void *)(a1 + 40) + 296LL) &= ~2u;
  *(_WORD *)(*(void *)(a1 + 40) + 296LL) &= ~8u;
  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoomCurrentLensMode]);
  else {
    __int16 v19 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 40) + 296LL) = *(_WORD *)(*(void *)(a1 + 40) + 296LL) & 0xFFEF | v19;

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoomCurrentLensMode]);
  else {
    __int16 v22 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 40) + 296LL) = *(_WORD *)(*(void *)(a1 + 40) + 296LL) & 0xFFDF | v22;

  double v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  else {
    __int16 v24 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 40) + 296LL) = *(_WORD *)(*(void *)(a1 + 40) + 296LL) & 0xFFBF | v24;

  *(_WORD *)(*(void *)(a1 + 40) + 296LL) &= ~0x80u;
  *(_WORD *)(*(void *)(a1 + 40) + 296LL) &= ~0x100u;
  double v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v29 = (id)objc_claimAutoreleasedReturnValue([v25 zoomPreferredCurrentDockPosition]);

  if ([v29 isEqualToString:AXZoomDockPositionLeft])
  {
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = 1LL;
  }

  else if ([v29 isEqualToString:AXZoomDockPositionRight])
  {
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = 2LL;
  }

  else
  {
    unsigned int v28 = [v29 isEqualToString:AXZoomDockPositionBottom];
    uint64_t v26 = *(void *)(a1 + 40);
    if (!v28)
    {
      *(void *)(v26 + 272) = 0LL;
      goto LABEL_17;
    }

    uint64_t v27 = 3LL;
  }

  *(void *)(v26 + 272) = v27;
LABEL_17:
  *(_DWORD *)(v26 + 300) = *(_BYTE *)(*(void *)(a1 + 32) + 64LL) == 0;
  *(_WORD *)(v26 + 296) &= ~0x1000u;
}

- (void)_updateMinimapStatus
{
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lensZoomView]);
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  CGFloat v15 = v4 + v10 * 0.5;
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  CGFloat v17 = v10 / v16 * -0.5;
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  CGFloat v19 = v12 / v18 * -0.5;
  v52.origin.double x = v15;
  v52.origin.double y = v6 + v12 * 0.5;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  CGRect v53 = CGRectInset(v52, v17, v19);
  double x = v53.origin.x;
  double y = v53.origin.y;
  double v22 = v53.size.width;
  double v23 = v53.size.height;
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController HUDViewController](self, "HUDViewController"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  if ([v25 inStandbyMode])
  {

LABEL_4:
LABEL_5:
    id v51 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
    [v51 setEnabled:0];
LABEL_6:

    return;
  }

  unsigned int stealingSingleFingerPanning = self->_eventUIContext.stealingSingleFingerPanning;

  if (!stealingSingleFingerPanning) {
    goto LABEL_5;
  }
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
  [v27 zoomedRect];
  v57.origin.double x = v28;
  v57.origin.double y = v29;
  v57.size.CGFloat width = v30;
  v57.size.CGFloat height = v31;
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.CGFloat width = v22;
  v54.size.CGFloat height = v23;
  if (!CGRectEqualToRect(v54, v57))
  {

    goto LABEL_12;
  }

  double v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
  unsigned int v33 = [v32 enabled];

  if (v33)
  {
LABEL_12:
    CGFloat v34 = CGRectZero.origin.y;
    v55.origin.double x = CGRectZero.origin.x;
    v55.origin.double y = v34;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    v58.origin.double x = x;
    v58.origin.double y = y;
    v58.size.CGFloat width = v22;
    v58.size.CGFloat height = v23;
    if (!CGRectEqualToRect(v55, v58))
    {
      double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      double v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lensZoomView]);
      [v36 bounds];
      v59.origin.double x = v37;
      v59.origin.double y = v38;
      v59.size.CGFloat width = v39;
      v59.size.CGFloat height = v40;
      v56.origin.double x = CGRectZero.origin.x;
      v56.origin.double y = v34;
      v56.size.CGFloat width = width;
      v56.size.CGFloat height = height;
      BOOL v41 = CGRectEqualToRect(v56, v59);

      if (!v41)
      {
        double v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
        double v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 lensZoomView]);
        [v44 bounds];
        objc_msgSend(v42, "setZoomedRect:screenRect:", x, y, v22, v23, v45, v46, v47, v48);
      }
    }

    double v49 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
    [v49 setEnabled:1];

    id v51 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    double v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
    [v51 bringSubviewToFront:v50];

    goto LABEL_6;
  }

- (void)_updateStealingSingleFingerPanning:(BOOL)a3 showHUDMessage:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __74__ZWRootViewController__updateStealingSingleFingerPanning_showHUDMessage___block_invoke;
  v15[3] = &unk_6CAB0;
  v15[4] = self;
  BOOL v16 = v5;
  dispatch_sync(v7, v15);

  if (v4)
  {
    if (v5) {
      uint64_t v8 = @"ZW_HUD_PANNING";
    }
    else {
      uint64_t v8 = @"ZW_HUD_FOLLOWING_FOCUS";
    }
    id v9 = ZWLocString(v8);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController HUDViewController](self, "HUDViewController"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
    [v11 bringSubviewToFront:v13];

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController HUDViewController](self, "HUDViewController"));
    [v14 showMessage:v10 forDuration:1 animated:2.0];
  }

  -[ZWRootViewController _updateMinimapStatus](self, "_updateMinimapStatus");
}

uint64_t __74__ZWRootViewController__updateStealingSingleFingerPanning_showHUDMessage___block_invoke( uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 380LL) = *(unsigned __int8 *)(result + 40);
  return result;
}

- (void)_toggleStealingSingleFingerPanning
{
  BOOL v3 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  if (!self->_cachedIsVoiceOverRunning)
  {
    BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue", 0LL));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = __58__ZWRootViewController__toggleStealingSingleFingerPanning__block_invoke;
    v5[3] = &unk_6D140;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(v4, v5);

    BOOL v3 = *((_BYTE *)v7 + 24) != 0;
  }

  -[ZWRootViewController _updateStealingSingleFingerPanning:showHUDMessage:]( self,  "_updateStealingSingleFingerPanning:showHUDMessage:",  v3,  1LL);
  _Block_object_dispose(&v6, 8);
}

uint64_t __58__ZWRootViewController__toggleStealingSingleFingerPanning__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_DWORD *)(*(void *)(result + 32) + 380LL) == 0;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 != &ZWZoomItemObserverContextID) {
    goto LABEL_2;
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));

  if (v13 == v11)
  {
    if (([v10 isEqualToString:@"view.center"] & 1) != 0
      || ([v10 isEqualToString:@"lensZoomView.center"] & 1) != 0
      || ([v10 isEqualToString:@"lensZoomView.bounds"] & 1) != 0
      || ([v10 isEqualToString:@"zoomPanOffset"] & 1) != 0
      || ([v10 isEqualToString:@"zoomFactor"] & 1) != 0
      || ([v10 isEqualToString:@"zoomRegionFrame"] & 1) != 0
      || [v10 isEqualToString:@"zoomRegionVisible"])
    {
      CGFloat v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
      uint64_t v20 = v19;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_6CBC0;
      block[4] = self;
      double v21 = block;
    }

    else
    {
      if ([v10 isEqualToString:@"userIsInteractingWithLens"])
      {
        BOOL v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
        CGFloat v17 = v16;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v27[3] = &unk_6CBC0;
        v27[4] = self;
        double v18 = v27;
        goto LABEL_21;
      }

      CGFloat v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
      uint64_t v20 = v19;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
      v26[3] = &unk_6CBC0;
      v26[4] = self;
      double v21 = v26;
    }

    dispatch_sync(v19, v21);

    -[ZWRootViewController _updateMinimapStatus](self, "_updateMinimapStatus");
    goto LABEL_3;
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));

  if (v14 == v11)
  {
    if (([v10 isEqualToString:@"view.center"] & 1) != 0
      || [v10 isEqualToString:@"slugRingView.bounds"])
    {
      BOOL v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
      CGFloat v17 = v16;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
      v25[3] = &unk_6CBC0;
      v25[4] = self;
      double v18 = v25;
      goto LABEL_21;
    }

    if ([v10 isEqualToString:@"userIsInteractingWithSlug"])
    {
      BOOL v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
      CGFloat v17 = v16;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_5;
      v24[3] = &unk_6CBC0;
      v24[4] = self;
      double v18 = v24;
      goto LABEL_21;
    }
  }

  else
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));

    if (v15 == v11 && [v10 isEqualToString:@"userIsInteractingWithMenu"])
    {
      BOOL v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
      CGFloat v17 = v16;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_6;
      v23[3] = &unk_6CBC0;
      v23[4] = self;
      double v18 = v23;
LABEL_21:
      dispatch_sync(v16, v18);

      goto LABEL_3;
    }
  }

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = v2 + 10;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v2 activeLensViewController]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lensZoomView]);
  objc_msgSend(v5, "zw_convertBoundsToScreenCoordinates");
  v3[4] = v6;
  v3[5] = v7;
  v3[6] = v8;
  v3[7] = v9;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);

  if (v10 == v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
    [v12 screenShift];
    *(void *)(*(void *)(a1 + 32) + 216LL) = v13;

    id v14 = *(void **)(a1 + 32);
    id v15 = v14 + 10;
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v14 dockedLensViewController]);
    CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dockedLensView]);
    [v17 frame];
    v15[18] = v18;
    v15[19] = v19;
    v15[20] = v20;
    v15[21] = v21;

    objc_super v22 = *(void **)(a1 + 32);
    double v23 = v22 + 10;
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 dockedLensViewController]);
    [v24 zoomRegionFrame];
    v23[22] = v25;
    v23[23] = v26;
    v23[24] = v27;
    v23[25] = v28;

    CGFloat v29 = *(void **)(a1 + 32);
    CGFloat v30 = v29 + 10;
    CGFloat v31 = (void *)objc_claimAutoreleasedReturnValue([v29 dockedLensViewController]);
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v31 toggleZoomRegionButton]);
    [v32 frame];
    v30[26] = v33;
    v30[27] = v34;
    v30[28] = v35;
    v30[29] = v36;

    CGFloat v37 = *(void **)(a1 + 32);
    CGFloat v38 = v37 + 10;
    CGFloat v39 = (void *)objc_claimAutoreleasedReturnValue([v37 dockedLensViewController]);
    [v39 frameForResizeDrag];
    v38[30] = v40;
    v38[31] = v41;
    v38[32] = v42;
    v38[33] = v43;

    id v45 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
    else {
      __int16 v44 = 0;
    }
    *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFBF | v44;
  }

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  *(_WORD *)(*(void *)(a1 + 32) + 376) = *(_WORD *)(*(void *)(a1 + 32) + 376) & 0xFFFE | (unsigned __int16)[v2 userIsInteractingWithLens];
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFF7F | v2;
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  __int16 v2 = v1 + 10;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v1 slugViewController]);
  [v7 slugRingViewBoundsInScreenCoordinates];
  v2[8] = v3;
  v2[9] = v4;
  v2[10] = v5;
  v2[11] = v6;
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_5(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFFD | v2;
}

void __71__ZWRootViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_6(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menuViewController]);
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFF7 | v2;
}

- (void)_disableZoomWindowHitTesting
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  __int16 v2 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 layer]);
  [v3 setAllowsHitTesting:0];
}

- (void)_enableZoomWindowHitTesting
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  __int16 v2 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 layer]);
  [v3 setAllowsHitTesting:1];
}

- (void)_transitionToLensForMode:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  uint64_t v8 = AXZoomLensModeFullscreen;
  id v9 = a5;
  if ([v15 isEqualToString:v8])
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));
  }

  else if ([v15 isEqualToString:AXZoomLensModeWindow])
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  }

  else
  {
    if (![v15 isEqualToString:AXZoomLensModeWindowAnchored])
    {
      id v14 = v15;
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2253LL,  "-[ZWRootViewController _transitionToLensForMode:animated:completion:]",  @"Did not recognize the lens mode to switch to: %@");
      id v11 = 0LL;
      goto LABEL_8;
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  }

  id v11 = (void *)v10;
LABEL_8:
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", v14));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v13 setZoomPreferredCurrentLensMode:v12];

  -[ZWRootViewController _transitionToLens:animated:completion:]( self,  "_transitionToLens:animated:completion:",  v11,  v6,  v9);
}

- (void)_transitionToLens:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if ((-[ZWRootViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    -[ZWRootViewController _setPIPLensResizingEnabled:](self, "_setPIPLensResizingEnabled:", 0LL);
    -[ZWRootViewController _setDockResizingEnabled:](self, "_setDockResizingEnabled:", 0LL);
    if (!-[ZWRootViewController isActiveLensTransitioning](self, "isActiveLensTransitioning"))
    {
      -[ZWRootViewController setActiveLensTransitioning:](self, "setActiveLensTransitioning:", 1LL);
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke;
      v57[3] = &unk_6CEB0;
      v57[4] = self;
      CGRect v58 = v9;
      id v11 = objc_retainBlock(v57);
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

      if (v12 != v8) {
        -[ZWRootViewController _removePIPSystemGestureDisablingAssertions]( self,  "_removePIPSystemGestureDisablingAssertions");
      }
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

      if (v13 != v8) {
        -[ZWRootViewController _removeFullscreenSystemGestureDisablingAssertions]( self,  "_removeFullscreenSystemGestureDisablingAssertions");
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
      [v14 setUserInteractionEnabled:0];

      if (v10 == v8)
      {
        ((void (*)(void *))v11[2])(v11);
      }

      else
      {
        id v15 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

        if (v10 == v15) {
          -[ZWRootViewController _removePIPSystemGestureDisablingAssertions]( self,  "_removePIPSystemGestureDisablingAssertions");
        }
        id v16 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

        if (v10 == v16) {
          -[ZWRootViewController _removeFullscreenSystemGestureDisablingAssertions]( self,  "_removeFullscreenSystemGestureDisablingAssertions");
        }
        CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoomCurrentLensEffect]);

        double y = CGPointZero.y;
        -[ZWRootViewController zoomFactor](self, "zoomFactor");
        -[ZWRootViewController setZoomFactorRespectingUserPreferredMaximumZoom:]( self,  "setZoomFactorRespectingUserPreferredMaximumZoom:");
        uint64_t v21 = v20;
        objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
        unsigned __int8 v23 = [v22 zoomInStandby];

        -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", CGPointZero.x, y);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_3;
        v47[3] = &unk_6D208;
        v47[4] = self;
        id v48 = v8;
        unsigned __int8 v55 = v23;
        uint64_t v52 = v21;
        CGFloat x = CGPointZero.x;
        double v54 = y;
        id v24 = v18;
        id v49 = v24;
        BOOL v56 = v6;
        id v25 = v10;
        id v50 = v25;
        id v51 = v11;
        uint64_t v26 = objc_retainBlock(v47);
        uint64_t v27 = v26;
        if (v25)
        {
          -[ZWRootViewController _endObservingValuesForLens:](self, "_endObservingValuesForLens:", v25);
          uint64_t v28 = AXZoomLensEffectNone;
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472LL;
          v39[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_7;
          v39[3] = &unk_6D230;
          id v40 = v25;
          uint64_t v43 = v21;
          CGFloat v44 = CGPointZero.x;
          double v45 = y;
          id v41 = v24;
          BOOL v46 = v6;
          id v42 = v27;
          [v40 updateLensEffect:v28 animated:v6 completion:v39];
        }

        else
        {
          ((void (*)(void *))v26[2])(v26);
        }
      }

      goto LABEL_26;
    }
  }

  else
  {
    CGFloat v29 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
    unsigned __int8 v30 = [v29 ignoreLogging];

    if ((v30 & 1) == 0)
    {
      CGFloat v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
      uint64_t v32 = AXLoggerForFacility();
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);

      os_log_type_t v34 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = AXColorizeFormatLog(1LL, @"View was not loaded when asked to transition to lens.");
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        uint64_t v37 = _AXStringForArgs(v36);
        CGFloat v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v33, v34))
        {
          *(_DWORD *)buf = 138543362;
          double v60 = v38;
          _os_log_impl(&dword_0, v33, v34, "%{public}@", buf, 0xCu);
        }
      }
    }
  }

  if (v9) {
    v9[2](v9);
  }
LABEL_26:
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 1152);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_2;
  block[3] = &unk_6CBC0;
  block[4] = v2;
  dispatch_sync(v3, block);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerView]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v4 bringSubviewToFront:v6];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v8 setUserInteractionEnabled:1];

  [*(id *)(a1 + 32) setActiveLensTransitioning:0];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeZoomMode]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v10 setZoomCurrentLensMode:v9];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensTransitionUnitTestCallback]);
  if (v11)
  {
    id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensTransitionUnitTestCallback]);
    v12[2](v12, *(void *)(a1 + 32));
  }

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fullscreenLensViewController]);
  *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFEF | (16 * (v2 == v3));

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFDF | (32 * (v4 == v5));

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFBF | v6;
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    if (([v2 inStandbyMode] & 1) == 0) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2353LL,  "-[ZWRootViewController _transitionToLens:animated:completion:]_block_invoke_3",  @"Should never transition to a lens that is not in standBy mode");
    }
    [*(id *)(a1 + 32) _beginObservingValuesForLens:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) addChildViewController:*(void *)(a1 + 40)];
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerView]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) view]);
    [v3 addSubview:v4];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) containerView]);
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) view]);
    [v5 sendSubviewToBack:v6];

    [*(id *)(a1 + 32) _applyInitialConstraintsForLensViewController:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) didMoveToParentViewController:*(void *)(a1 + 32)];
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_4;
    block[3] = &unk_6D008;
    id v8 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v20 = v8;
    dispatch_sync(v7, block);

    uint64_t v9 = *(unsigned __int8 *)(a1 + 96);
    double v10 = *(double *)(a1 + 72);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 97);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_5;
    v14[3] = &unk_6D1E0;
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v14[4] = *(void *)(a1 + 32);
    char v18 = v9;
    id v15 = v12;
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    objc_msgSend( v15,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  v9,  v13,  v11,  v14,  v10,  *(double *)(a1 + 80),  *(double *)(a1 + 88));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)(*(void *)(a1 + 32) + 80LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lensZoomView]);
  objc_msgSend(v3, "zw_convertBoundsToScreenCoordinates");
  v2[4] = v4;
  v2[5] = v5;
  v2[6] = v6;
  v2[7] = v7;

  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);

  if (v8 == v9)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
    [v10 screenShift];
    *(void *)(*(void *)(a1 + 32) + 216LL) = v11;

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = v12 + 10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 dockedLensViewController]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dockedLensView]);
    [v15 frame];
    v13[18] = v16;
    v13[19] = v17;
    v13[20] = v18;
    v13[21] = v19;

    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = v20 + 10;
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v20 dockedLensViewController]);
    [v22 zoomRegionFrame];
    v21[22] = v23;
    v21[23] = v24;
    v21[24] = v25;
    v21[25] = v26;

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
    else {
      __int16 v28 = 0;
    }
    *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFBF | v28;

    CGFloat v29 = *(void **)(a1 + 32);
    unsigned __int8 v30 = v29 + 10;
    CGFloat v31 = (void *)objc_claimAutoreleasedReturnValue([v29 dockedLensViewController]);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 toggleZoomRegionButton]);
    [v32 frame];
    v30[26] = v33;
    v30[27] = v34;
    v30[28] = v35;
    v30[29] = v36;

    uint64_t v37 = *(void **)(a1 + 32);
    CGFloat v38 = v37 + 10;
    id v43 = (id)objc_claimAutoreleasedReturnValue([v37 dockedLensViewController]);
    [v43 frameForResizeDrag];
    v38[30] = v39;
    v38[31] = v40;
    v38[32] = v41;
    v38[33] = v42;
  }

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_5(uint64_t a1)
{
  v7[0] = _NSConcreteStackBlock;
  v7[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_6;
  v7[3] = &unk_6D030;
  uint64_t v2 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  char v10 = *(_BYTE *)(a1 + 64);
  v7[1] = 3221225472LL;
  id v8 = v2;
  id v9 = *(id *)(a1 + 48);
  AXPerformBlockAsynchronouslyOnMainThread(v7);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  v3,  v4,  v5,  v6);
}

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_6(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 56))
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pipLensViewController]);
    if (v2 == v3)
    {
      uint64_t v4 = *(void **)(a1 + 48);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pipLensViewController]);

      if (v4 != v5)
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disableNotificationCenterAssertionPIPLens]);

        if (v6) {
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2377LL,  "-[ZWRootViewController _transitionToLens:animated:completion:]_block_invoke_6",  @"Expected PIP notification center assertion to be nil transitioning from fullscreen zoom to pip zoom");
        }
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disableControlCenterAssertionPIPLens]);

        if (v7) {
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2378LL,  "-[ZWRootViewController _transitionToLens:animated:completion:]_block_invoke_6",  @"Expected PIP control center assertion to be nil transitioning from fullscreen zoom to pip zoom");
        }
        [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
      }
    }

    else
    {
    }

    if (!*(_BYTE *)(a1 + 56))
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fullscreenLensViewController]);
      if (v8 == v9)
      {
        char v10 = *(void **)(a1 + 48);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fullscreenLensViewController]);

        if (v10 != v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disableNotificationCenterAssertionFullscreenLens]);

          if (v12) {
            _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2383LL,  "-[ZWRootViewController _transitionToLens:animated:completion:]_block_invoke_6",  @"Expected fullscreen notification center assertion to be nil transitioning from pip zoom to fullscreen zoom");
          }
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disableControlCenterAssertionFullscreenLens]);

          if (v13) {
            _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2384LL,  "-[ZWRootViewController _transitionToLens:animated:completion:]_block_invoke_6",  @"Expected fullscreen control center assertion to be nil transitioning from pip zoom to fullscreen zoom");
          }
          [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
        }
      }

      else
      {
      }
    }
  }

void __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_7(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_8;
  v6[3] = &unk_6CEB0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  objc_msgSend( v7,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  v4,  v5,  v6,  v2,  *(double *)(a1 + 64),  *(double *)(a1 + 72));
}

uint64_t __62__ZWRootViewController__transitionToLens_animated_completion___block_invoke_8(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_beginObservingValuesForLens:(id)a3
{
  id v6 = a3;
  [v6 addObserver:self forKeyPath:@"lensZoomView.bounds" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"view.center" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"lensZoomView.center" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"userIsInteractingWithLens" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"inStandbyMode" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"zoomPanOffset" options:1 context:&ZWZoomItemObserverContextID];
  [v6 addObserver:self forKeyPath:@"zoomFactor" options:1 context:&ZWZoomItemObserverContextID];
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  uint64_t v5 = v6;
  if (v4 == v6)
  {
    [v6 addObserver:self forKeyPath:@"zoomRegionFrame" options:1 context:&ZWZoomItemObserverContextID];
    [v6 addObserver:self forKeyPath:@"zoomRegionVisible" options:1 context:&ZWZoomItemObserverContextID];
    uint64_t v5 = v6;
  }
}

- (void)_endObservingValuesForLens:(id)a3
{
  id v6 = a3;
  [v6 removeObserver:self forKeyPath:@"lensZoomView.bounds" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"view.center" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"lensZoomView.center" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"userIsInteractingWithLens" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"inStandbyMode" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"zoomPanOffset" context:&ZWZoomItemObserverContextID];
  [v6 removeObserver:self forKeyPath:@"zoomFactor" context:&ZWZoomItemObserverContextID];
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  uint64_t v5 = v6;
  if (v4 == v6)
  {
    [v6 removeObserver:self forKeyPath:@"zoomRegionFrame" context:&ZWZoomItemObserverContextID];
    [v6 removeObserver:self forKeyPath:@"zoomRegionVisible" context:&ZWZoomItemObserverContextID];
    uint64_t v5 = v6;
  }
}

- (void)_applyInitialConstraintsForLensViewController:(id)a3
{
  id v44 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v44 view]);
  if (v5 == v44)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v44 lensZoomView]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v44 lensChromeView]);
    int v15 = AXResistAllCompressingAndStretching[0];
    int v16 = AXResistAllCompressingAndStretching[1];
    int v17 = AXResistAllCompressingAndStretching[2];
    int v18 = AXResistAllCompressingAndStretching[3];
    LODWORD(v19) = AXResistAllCompressingAndStretching[0];
    LODWORD(v20) = v16;
    LODWORD(v21) = v17;
    LODWORD(v22) = v18;
    objc_msgSend(v6, "ax_setContentHuggingAndCompressionResistance:", v19, v20, v21, v22);
    LODWORD(v23) = v15;
    LODWORD(v24) = v16;
    LODWORD(v25) = v17;
    LODWORD(v26) = v18;
    objc_msgSend(v13, "ax_setContentHuggingAndCompressionResistance:", v23, v24, v25, v26);
    LODWORD(v27) = v15;
    LODWORD(v28) = v16;
    LODWORD(v29) = v17;
    LODWORD(v30) = v18;
    objc_msgSend(v14, "ax_setContentHuggingAndCompressionResistance:", v27, v28, v29, v30);
    CGFloat v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  3LL,  1LL,  v4,  3LL,  1.0,  0.0));
    [v4 addConstraint:v31];

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  4LL,  -1LL,  v4,  4LL,  1.0,  0.0));
    [v4 addConstraint:v32];

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  1LL,  1LL,  v4,  1LL,  1.0,  0.0));
    [v4 addConstraint:v33];

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  2LL,  -1LL,  v4,  2LL,  1.0,  0.0));
    [v4 addConstraint:v34];

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  1LL,  0LL,  v4,  1LL,  1.0,  0.0));
    LODWORD(v36) = 1148780544;
    [v35 setPriority:v36];
    -[ZWRootViewController setLensDragXConstraint:](self, "setLensDragXConstraint:", v35);
    [v4 addConstraint:v35];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  3LL,  0LL,  v4,  3LL,  1.0,  0.0));

    LODWORD(v38) = 1148780544;
    [v37 setPriority:v38];
    -[ZWRootViewController setLensDragYConstraint:](self, "setLensDragYConstraint:", v37);
    [v4 addConstraint:v37];
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensWidthConstraint](self, "lensWidthConstraint"));

    if (!v39)
    {
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  7LL,  0LL,  0LL,  0LL,  1.0,  0.0));
      -[ZWRootViewController setLensWidthConstraint:](self, "setLensWidthConstraint:", v40);

      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensWidthConstraint](self, "lensWidthConstraint"));
      [v6 addConstraint:v41];

      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  8LL,  0LL,  0LL,  0LL,  1.0,  0.0));
      -[ZWRootViewController setLensHeightConstraint:](self, "setLensHeightConstraint:", v42);

      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensHeightConstraint](self, "lensHeightConstraint"));
      [v6 addConstraint:v43];
    }

    -[ZWRootViewController _updateLensLayout](self, "_updateLensLayout");
  }

  else
  {
    if (!v6 || !v4) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2501LL,  "-[ZWRootViewController _applyInitialConstraintsForLensViewController:]",  @"LensView and container must not be nil here. lensView:%@ container:%@");
    }
    double v7 = ZWGetTestingScreenSize();
    HIDWORD(v9) = HIDWORD(CGSizeZero.width);
    double height = CGSizeZero.height;
    if (v7 == CGSizeZero.width && v8 == height)
    {
      LODWORD(v7) = AXResistAllCompressingAndStretching[0];
      LODWORD(v8) = AXResistAllCompressingAndStretching[1];
      LODWORD(v9) = AXResistAllCompressingAndStretching[2];
      LODWORD(height) = AXResistAllCompressingAndStretching[3];
      objc_msgSend(v6, "ax_setContentHuggingAndCompressionResistance:", v7, v8, v9, height);
      id v12 = objc_msgSend(v6, "ax_pinConstraintsInAllDimensionsToView:", v4);
    }
  }
}

- (void)setActiveLensViewController:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
  [v4 lensModeDidChange];
}

- (void)_updateKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  IsEmptdouble y = CGRectIsEmpty(a3);
  BOOL v10 = IsEmpty;
  if (IsEmpty)
  {
    double v11 = CGRectNull.origin.x;
    double v12 = CGRectNull.origin.y;
    double v13 = CGRectNull.size.width;
    double v14 = CGRectNull.size.height;
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    objc_msgSend(v3, "zw_convertRectFromScreenCoordinates:", x, y, width, height);
  }

  -[ZWKeyboardContext setKeyboardFrame:](self->_kbContext, "setKeyboardFrame:", v11, v12, v13, v14);
  if (!v10) {

  }
  -[ZWKeyboardContext setUserMovedKeyboardLens:](self->_kbContext, "setUserMovedKeyboardLens:", 0LL);
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom sharedInstance](&OBJC_CLASS___AXSubsystemZoom, "sharedInstance"));
  unsigned __int8 v16 = [v15 ignoreLogging];

  if ((v16 & 1) == 0)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemZoom identifier](&OBJC_CLASS___AXSubsystemZoom, "identifier"));
    uint64_t v18 = AXLoggerForFacility();
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

    os_log_type_t v20 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = AXColorizeFormatLog(3LL, @"Did update keyboard frame: %{public}@");
      double v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      -[ZWKeyboardContext keyboardFrame](self->_kbContext, "keyboardFrame");
      double v23 = NSStringFromCGRect(v40);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v24 = _AXStringForArgs(v22);
      double v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v25;
        _os_log_impl(&dword_0, v19, v20, "%{public}@", buf, 0xCu);
      }
    }
  }

  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", v33));
  if (-[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible")
    && !-[ZWKeyboardContext userMovedKeyboardLens](self->_kbContext, "userMovedKeyboardLens"))
  {
    if (([v26 inStandbyMode] & 1) == 0
      && !-[ZWRootViewController _isZoomedToMinimum](self, "_isZoomedToMinimum"))
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = __45__ZWRootViewController__updateKeyboardFrame___block_invoke;
      v37[3] = &unk_6CBC0;
      v37[4] = self;
      double v29 = objc_retainBlock(v37);
      unsigned int v30 = -[ZWKeyboardContext zoomRepositionsForKeyboard](self->_kbContext, "zoomRepositionsForKeyboard");
      CGFloat v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

      if (v26 == v31)
      {
        if (-[ZWKeyboardContext zoomRepositionsForKeyboard](self->_kbContext, "zoomRepositionsForKeyboard")) {
          ((void (*)(void *))v29[2])(v29);
        }
      }

      else if (v30)
      {
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = __45__ZWRootViewController__updateKeyboardFrame___block_invoke_2;
        v35[3] = &unk_6CBE8;
        double v36 = v29;
        -[ZWRootViewController _transitionToLens:animated:completion:]( self,  "_transitionToLens:animated:completion:",  v32,  0LL,  v35);
      }
    }
  }

  else
  {
    double v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 zoomPreferredCurrentLensMode]);

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = __45__ZWRootViewController__updateKeyboardFrame___block_invoke_3;
    v34[3] = &unk_6CBC0;
    v34[4] = self;
    -[ZWRootViewController _transitionToLensForMode:animated:completion:]( self,  "_transitionToLensForMode:animated:completion:",  v28,  1LL,  v34);
  }

  -[ZWRootViewController _updateSlugLayoutAnimated:](self, "_updateSlugLayoutAnimated:", 1LL);
}

void __45__ZWRootViewController__updateKeyboardFrame___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v2 updateLensChromeAnimated:1];
}

uint64_t __45__ZWRootViewController__updateKeyboardFrame___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __45__ZWRootViewController__updateKeyboardFrame___block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v2 updateLensChromeAnimated:1];
}

- (void)_updateLensLayout
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensDragXConstraint](self, "lensDragXConstraint"));
  [v11 setConstant:v4];

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensDragYConstraint](self, "lensDragYConstraint"));
  [v12 setConstant:v6];

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensWidthConstraint](self, "lensWidthConstraint"));
  [v13 setConstant:v8];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensHeightConstraint](self, "lensHeightConstraint"));
  [v14 setConstant:v10];
}

- (CGRect)_determineSuitableLensFrame
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v3 == v4)
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    [v32 bounds];
    double v16 = v33;
    double v18 = v34;
    double v20 = v35;
    double v22 = v36;

    double v23 = 0.0;
  }

  else if (-[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible") {
         && !-[ZWKeyboardContext userMovedKeyboardLens](self->_kbContext, "userMovedKeyboardLens")
  }
         && -[ZWKeyboardContext zoomRepositionsForKeyboard](self->_kbContext, "zoomRepositionsForKeyboard"))
  {
    -[ZWKeyboardContext keyboardFrame](self->_kbContext, "keyboardFrame");
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    [v5 frame];
    double v6 = AX_CGRectBySubtractingRect(1LL, 1LL);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    double v13 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 lensZoomView]);
    objc_msgSend(v13, "convertRect:toView:", v14, v6, v8, v10, v12);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = -18.0;
  }

  else
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v24 zoomWindowFrame];
    double v16 = v25;
    double v18 = v26;
    double v20 = v27;
    double v22 = v28;

    double v23 = -18.0;
    if (v20 == CGSizeZero.width && v22 == CGSizeZero.height)
    {
      -[ZWRootViewController _lensDefaultSize](self, "_lensDefaultSize");
      double v20 = v30;
      double v22 = v31;
    }
  }

  -[ZWRootViewController _lensMinimumSize](self, "_lensMinimumSize");
  double v38 = v37;
  double v40 = v39;
  -[ZWRootViewController _lensMaximumSize](self, "_lensMaximumSize");
  if (v20 >= v38) {
    double v43 = v20;
  }
  else {
    double v43 = v38;
  }
  if (v43 >= v41) {
    double v44 = v41;
  }
  else {
    double v44 = v43;
  }
  if (v22 >= v40) {
    double v45 = v22;
  }
  else {
    double v45 = v40;
  }
  if (v45 >= v42) {
    double v46 = v42;
  }
  else {
    double v46 = v45;
  }
  double v47 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  [v47 bounds];
  double v49 = v48 - v44;

  if (v16 >= v49) {
    double v50 = v49;
  }
  else {
    double v50 = v16;
  }
  if (v23 >= v50) {
    double v51 = v23;
  }
  else {
    double v51 = v50;
  }
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  [v52 bounds];
  double v54 = v53 - v46;

  if (v18 >= v54) {
    double v55 = v54;
  }
  else {
    double v55 = v18;
  }
  if (v23 >= v55) {
    double v56 = v23;
  }
  else {
    double v56 = v55;
  }

  double v57 = v51;
  double v58 = v56;
  double v59 = v44;
  double v60 = v46;
  result.size.double height = v60;
  result.size.double width = v59;
  result.origin.double y = v58;
  result.origin.double x = v57;
  return result;
}

- (CGSize)_lensDefaultSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoomPreferredCurrentLensMode]);

  if ([v4 isEqualToString:AXZoomLensModeWindowAnchored])
  {
    -[ZWRootViewController _lensMaximumSize](self, "_lensMaximumSize");
    double v6 = v5;
    double v8 = v7;
  }

  else
  {
    int IsPad = AXDeviceIsPad();
    if (IsPad) {
      double v8 = 300.0;
    }
    else {
      double v8 = 200.0;
    }
    if (IsPad) {
      double v6 = 400.0;
    }
    else {
      double v6 = 320.0;
    }
  }

  double v10 = v6;
  double v11 = v8;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_lensMinimumSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  double v5 = 90.0;
  double v6 = 90.0;
  if (v3 == v4)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    if ([v7 dockPosition])
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      double v9 = (char *)[v8 dockPosition];

      if (v9 != (_BYTE *)&dword_0 + 3)
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
        [v11 bounds];
        double v5 = v12 * 0.1;
        double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
        [v14 bounds];
        double v6 = v15;
LABEL_7:

        goto LABEL_8;
      }
    }

    else
    {
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    [v11 bounds];
    double v5 = v16;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
    [v14 bounds];
    double v6 = v17 * 0.1;
    goto LABEL_7;
  }

- (CGSize)_lensMaximumSize
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  if (v3 == v4)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    if ([v7 dockPosition])
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      double v9 = (char *)[v8 dockPosition];

      if (v9 != (_BYTE *)&dword_0 + 3)
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
        [v11 bounds];
        double v13 = v12 * 0.5;
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 view]);
        [v15 bounds];
        double v17 = v16;
LABEL_8:

        double v5 = v13;
        double v6 = v17;
        goto LABEL_9;
      }
    }

    else
    {
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
    [v11 bounds];
    double v13 = v18;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 view]);
    [v15 bounds];
    double v17 = v19 * 0.5;
    goto LABEL_8;
  }

  -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
LABEL_9:
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGPoint)_slugOriginForNormalizedPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  double v17 = x * (v8 - v14);
  double v18 = y * (v10 - v16);
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)_slugNormalizedPositionForCurrentPosition
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11 / (v5 - v15);
  double v19 = v13 / (v7 - v17);
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)_updateSlugLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController viewIfLoaded](self, "viewIfLoaded"));

  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);

    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    else {
      uint64_t v10 = 1LL;
    }
    [v8 setHidden:v10];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingDragXConstraint](self, "slugRingDragXConstraint"));
    if (!v11)
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  1LL,  0LL,  v6,  1LL,  1.0,  0.0));
      LODWORD(v13) = 1148780544;
      [v12 setPriority:v13];
      -[ZWRootViewController setSlugRingDragXConstraint:](self, "setSlugRingDragXConstraint:", v12);
      [v6 addConstraint:v12];
      double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  3LL,  0LL,  v6,  3LL,  1.0,  0.0));

      LODWORD(v15) = 1148780544;
      [v14 setPriority:v15];
      -[ZWRootViewController setSlugRingDragYConstraint:](self, "setSlugRingDragYConstraint:", v14);
      [v6 addConstraint:v14];
    }

    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v16 zoomSlugNormalizedPosition];
    double v18 = v17;
    double v20 = v19;

    -[ZWRootViewController _slugOriginForNormalizedPosition:](self, "_slugOriginForNormalizedPosition:", v18, v20);
    double v22 = v21;
    double v24 = v23;
    if (-[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible"))
    {
      -[ZWKeyboardContext keyboardFrame](self->_kbContext, "keyboardFrame");
      double y = v39.origin.y;
      v38.double x = v22;
      v38.double y = v24;
      if (CGRectContainsPoint(v39, v38))
      {
        [v8 bounds];
        double v24 = y - v26;
      }
    }

    -[ZWRootViewController _updateSlugConstraintsForOrientation:]( self,  "_updateSlugConstraintsForOrientation:",  -[ZWRootViewController interfaceOrientation](self, "interfaceOrientation"));
    double v27 = fabs(v22);
    BOOL v28 = v27 <= INFINITY;
    if (v27 >= INFINITY) {
      double v29 = 0.0;
    }
    else {
      double v29 = v22;
    }
    if (v28) {
      double v22 = v29;
    }
    double v30 = fabs(v24);
    BOOL v31 = v30 <= INFINITY;
    if (v30 >= INFINITY) {
      double v32 = 0.0;
    }
    else {
      double v32 = v24;
    }
    if (v31) {
      double v24 = v32;
    }
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingDragXConstraint](self, "slugRingDragXConstraint", v32));
    [v33 setConstant:v22];

    double v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingDragYConstraint](self, "slugRingDragYConstraint"));
    [v34 setConstant:v24];

    double v35 = 0.3;
    if (!v3) {
      double v35 = 0.0;
    }
    v36[4] = self;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke;
    v37[3] = &unk_6CBC0;
    v37[4] = self;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_2;
    v36[3] = &unk_6D080;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v37,  v36,  v35);
  }

void __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 layoutIfNeeded];
}

void __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);
  unsigned __int8 v4 = [v3 isHidden];

  if ((v4 & 1) != 0)
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
    [v9 slugRingViewBoundsInScreenCoordinates];
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
  }

  double v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_3;
  block[3] = &unk_6CF00;
  block[4] = *(void *)(a1 + 32);
  *(CGFloat *)&void block[5] = x;
  *(CGFloat *)&block[6] = y;
  *(CGFloat *)&void block[7] = width;
  *(CGFloat *)&block[8] = height;
  dispatch_sync(v14, block);
}

__n128 __50__ZWRootViewController__updateSlugLayoutAnimated___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 80LL;
  __n128 result = *(__n128 *)(a1 + 56);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)(a1 + 40);
  *(__n128 *)(v1 + 80) = result;
  return result;
}

- (void)_updateZoomFactor:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[ZWRootViewController setZoomFactor:](self, "setZoomFactor:");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  double v9 = v8;
  double v11 = v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoomCurrentLensEffect]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __51__ZWRootViewController__updateZoomFactor_animated___block_invoke;
  v14[3] = &unk_6CBC0;
  v14[4] = self;
  objc_msgSend( v7,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v13,  v4,  v14,  a3,  v9,  v11);
}

id __51__ZWRootViewController__updateZoomFactor_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)zoomLensViewControllerDidChangeStandbyMode:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  +[ZWZoomSlugViewController longPressDurationForStandByMode:]( ZWZoomSlugViewController,  "longPressDurationForStandByMode:",  [v4 inStandbyMode]);
  objc_msgSend(v5, "updateLongPressDuration:");

  -[ZWRootViewController _setPIPLensResizingEnabled:](self, "_setPIPLensResizingEnabled:", 0LL);
  -[ZWRootViewController _setDockResizingEnabled:](self, "_setDockResizingEnabled:", 0LL);
  -[ZWRootViewController stopZoomMovementWithVelocityWithFullscreenEventHandler:]( self,  "stopZoomMovementWithVelocityWithFullscreenEventHandler:",  0LL);
  -[ZWRootViewController currentUIContextForEventProcessor:](self, "currentUIContextForEventProcessor:", 0LL);
  if (!CGRectIsNull(v13))
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
    [v6 standbyModeDidChange];
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  if (v7 == v4)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

    if (v8 == v9)
    {
      if ([v4 inStandbyMode]) {
        -[ZWRootViewController _removePIPSystemGestureDisablingAssertions]( self,  "_removePIPSystemGestureDisablingAssertions");
      }
      else {
        -[ZWRootViewController _updateSystemGestureDisablingAssertions](self, "_updateSystemGestureDisablingAssertions");
      }
    }
  }

  else
  {
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  if (v10 == v4)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

    if (v11 == v12)
    {
      if ([v4 inStandbyMode]) {
        -[ZWRootViewController _removeFullscreenSystemGestureDisablingAssertions]( self,  "_removeFullscreenSystemGestureDisablingAssertions");
      }
      else {
        -[ZWRootViewController _updateSystemGestureDisablingAssertions](self, "_updateSystemGestureDisablingAssertions");
      }
    }
  }

  else
  {
  }
}

- (void)zoomLensViewControllerUpdateUIForStandby:(id)a3 completion:(id)a4
{
  id v11 = a3;
  double v6 = (void (**)(void))a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  if (v7 == v11)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

    if (v8 == v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      [v10 showOrHideUIForStandbyModeWithCompletion:v6];

      goto LABEL_7;
    }
  }

  else
  {
  }

  if (v6) {
    v6[2](v6);
  }
LABEL_7:
  -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
}

- (void)didStartAnimation
{
}

- (void)didEndAnimation
{
}

- (BOOL)_pipLensIsNearTopOfScreen
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);
  [v3 frame];
  double v5 = v4;

  return v5 < 30.0;
}

- (BOOL)_pipLensIsNearRightOfScreen
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  [v13 bounds];
  double v15 = v14;

  v17.origin.CGFloat x = v6;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v10;
  v17.size.CGFloat height = v12;
  return v15 - CGRectGetMaxX(v17) < 30.0;
}

- (BOOL)_pipLensIsNearBottomOfScreen
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  [v9 bounds];
  double v11 = v10;

  return vabdd_f64(v6 + v8, v11) < 30.0;
}

- (void)_resizeZoomLensByDelta:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  if (v18 == v6)
  {
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

    if (!v7) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2887LL,  "-[ZWRootViewController _resizeZoomLensByDelta:]",  @"You should only be able to resize the pip or docked lens");
    }
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v8 == v9)
  {
    id v14 = [v18 activeResizeHandle];
    double v12 = y;
    double v13 = x;
    switch((unint64_t)v14)
    {
      case 0uLL:
      case 1uLL:
        goto LABEL_21;
      case 2uLL:
        double v13 = -x;
        double v12 = -y;
        goto LABEL_21;
      case 3uLL:
LABEL_14:
        double v12 = -y;
        double v13 = 0.0;
        goto LABEL_17;
      case 4uLL:
        double v12 = -y;
        double v13 = x;
LABEL_17:
        double x = 0.0;
        goto LABEL_21;
      case 5uLL:
        double v13 = x;
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        double v12 = 0.0;
        goto LABEL_21;
      case 6uLL:
LABEL_12:
        double v12 = y;
        double v13 = x;
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        goto LABEL_21;
      case 7uLL:
LABEL_11:
        double v12 = y;
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        double v13 = 0.0;
        goto LABEL_21;
      case 8uLL:
        double v13 = -x;
        double v12 = y;
        goto LABEL_20;
      case 9uLL:
LABEL_13:
        double v13 = -x;
        double v12 = 0.0;
LABEL_20:
        double y = 0.0;
        goto LABEL_21;
      default:
        CGRect v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14, x, y));
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2955LL,  "-[ZWRootViewController _resizeZoomLensByDelta:]",  @"Not an appropriate resize handle for resizing lens: %@");

        goto LABEL_22;
    }
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  if (v10 == v11)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    id v16 = [v15 dockPosition];

    switch((unint64_t)v16)
    {
      case 0uLL:
        goto LABEL_11;
      case 1uLL:
        goto LABEL_12;
      case 2uLL:
        goto LABEL_13;
      case 3uLL:
        goto LABEL_14;
      default:
        break;
    }
  }

  double v12 = y;
  double v13 = x;
LABEL_21:
  -[ZWRootViewController _resizeZoomLensWithAdjustment:lensPositionCompensation:]( self,  "_resizeZoomLensWithAdjustment:lensPositionCompensation:",  v13,  v12,  x,  y);
LABEL_22:
}

- (void)_resizeZoomLensWithAdjustment:(CGPoint)a3 lensPositionCompensation:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v72 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  double v71 = x;
  if (v72 == v9)
  {
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

    if (!v10) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  2997LL,  "-[ZWRootViewController _resizeZoomLensWithAdjustment:lensPositionCompensation:]",  @"You should only be able to resize the pip or docked lens");
    }
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v72 lensZoomView]);
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;

  double v16 = v7 + v13;
  double v17 = v6 + v15;
  -[ZWRootViewController _lensMinimumSize](self, "_lensMinimumSize");
  double v19 = v18;
  double v21 = v20;
  -[ZWRootViewController _lensMaximumSize](self, "_lensMaximumSize");
  if (v16 >= v19) {
    double v24 = v16;
  }
  else {
    double v24 = v19;
  }
  if (v24 >= v22) {
    double v25 = v22;
  }
  else {
    double v25 = v24;
  }
  if (v17 >= v21) {
    double v26 = v17;
  }
  else {
    double v26 = v21;
  }
  if (v26 >= v23) {
    double v27 = v23;
  }
  else {
    double v27 = v26;
  }
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  double v29 = v28;
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  double v31 = v30;
  double v33 = v32;
  double v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  if (v34 == v35)
  {
    double v69 = v31;
    -[ZWRootViewController zoomFrame](self, "zoomFrame");
    double v52 = v51;
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    double v59 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    objc_msgSend(v59, "resizeDock:animated:", 0, v25, v27);

    -[ZWRootViewController zoomFrame](self, "zoomFrame");
    double v61 = v60;
    -[ZWRootViewController zoomFrame](self, "zoomFrame");
    double v63 = v62;
    double v64 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    id v65 = (char *)[v64 dockPosition];

    if (v65 == (_BYTE *)&dword_0 + 2)
    {
      double v52 = v52 + v56 - v61;
    }

    else
    {
      double v66 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      double v67 = (char *)[v66 dockPosition];

      if (v67 == (_BYTE *)&dword_0 + 3) {
        double v54 = v54 + v58 - v63;
      }
    }

    objc_msgSend( v72,  "updateZoomFactor:panOffset:animated:animationDuration:completion:",  0,  0,  v29,  v69,  v33,  -1.0);
    double v68 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    objc_msgSend(v68, "zw_convertRectToScreenCoordinates:", v52, v54, v61, v63);
    -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:]( self,  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  1LL,  1LL,  0LL,  0LL);
  }

  else
  {
    double v36 = v27 - v15;
    double v37 = v25 - v13;
    if (v27 - v15 < 0.0) {
      double v36 = -(v27 - v15);
    }
    double v38 = -v36;
    if (y >= -v36) {
      double v38 = y;
    }
    if (v38 < v36) {
      double v36 = v38;
    }
    double v70 = v36;
    double v39 = -v37;
    if (v37 >= 0.0) {
      double v39 = v25 - v13;
    }
    double v40 = -v39;
    if (v71 >= -v39) {
      double v40 = v71;
    }
    double v41 = v31;
    if (v40 >= v39) {
      double v42 = v39;
    }
    else {
      double v42 = v40;
    }
    double v43 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v43 zoomWindowFrame];
    double v45 = v44;
    double v47 = v46;

    double v48 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    objc_msgSend(v48, "setZoomWindowFrame:", v45, v47, v25, v27);

    double v49 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensWidthConstraint](self, "lensWidthConstraint"));
    [v49 setConstant:v25];

    double v50 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensHeightConstraint](self, "lensHeightConstraint"));
    [v50 setConstant:v27];

    objc_msgSend( v72,  "updateZoomFactor:panOffset:animated:animationDuration:completion:",  0,  0,  v29,  v41,  v33,  -1.0);
    -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:]( self,  "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:",  v72,  0LL,  1LL,  0LL,  0LL,  v42,  v70);
  }
}

- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6
{
}

- (void)_moveZoomItemWithController:(id)a3 byDelta:(CGPoint)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6 shouldUseFullDeltaForDockedMode:(BOOL)a7 shouldPan:(BOOL)a8
{
  unsigned int v8 = a8;
  BOOL v9 = a7;
  BOOL v11 = a5;
  double y = a4.y;
  double x = a4.x;
  id v15 = a3;
  double v79 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));

  id v78 = v16;
  if (v16 != v15)
  {
    BOOL v17 = v11;
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingDragXConstraint](self, "slugRingDragXConstraint"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugRingDragYConstraint](self, "slugRingDragYConstraint"));
    LOBYTE(v20) = 0;
    goto LABEL_27;
  }

  BOOL v21 = a6;
  if (-[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible")) {
    -[ZWKeyboardContext setUserMovedKeyboardLens:](self->_kbContext, "setUserMovedKeyboardLens:", 1LL);
  }
  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  if (v22 == v23) {
    unint64_t v24 = -[ZWRootViewController pipLensEdgeMask](self, "pipLensEdgeMask");
  }
  else {
    unint64_t v24 = 15LL;
  }

  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  if (!v8) {
    goto LABEL_17;
  }
  double v27 = v25;
  double v28 = v26;
  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned int v8 = objc_msgSend(v29, "shouldPanZoomContentForAxis:delta:edgeMask:", 2, v24, x, y);

  if (v8)
  {
    double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
    objc_msgSend(v30, "offsetByPanningWithDelta:axis:zoomFactor:", 2, x, y, v31);
    double v33 = v32;

    double v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
    objc_msgSend(v34, "offsetIgnoringValidOffsetConstraintsByPanningWithDelta:axis:zoomFacotr:", 2, x, y, v35);
    double v27 = v36;
  }

  else
  {
    double v33 = v27;
  }

  double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned int v20 = objc_msgSend(v37, "shouldPanZoomContentForAxis:delta:edgeMask:", 4, v24, x, y);

  if (!v20)
  {
    if (v8)
    {
      LOBYTE(v8) = 1;
      double v44 = v28;
      goto LABEL_16;
    }

id __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke( uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activeLensViewController]);
  if (v2 != v3) {
    goto LABEL_4;
  }
  double v4 = *(void **)(a1 + 32);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) pipLensViewController]);
  if (v4 != v5)
  {

    BOOL v3 = v2;
LABEL_4:

    goto LABEL_5;
  }

  int v14 = *(unsigned __int8 *)(a1 + 48);

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lensDragXConstraint]);
    [v15 constant];
    double v17 = v16;
    double v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lensDragYConstraint]);
    [v18 constant];
    double v20 = v19;
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lensWidthConstraint]);
    [v21 constant];
    double v23 = v22;
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lensHeightConstraint]);
    [v24 constant];
    double v26 = v25;
    double v27 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    objc_msgSend(v27, "setZoomWindowFrame:", v17, v20, v23, v26);

    [*(id *)(a1 + 40) _updateLensLayout];
    return [*(id *)(a1 + 40) _updateLensEdgeMaskForZoomController:*(void *)(a1 + 32)];
  }

id __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id __125__ZWRootViewController__moveZoomItemWithController_byDelta_animated_userInitiated_shouldUseFullDeltaForDockedMode_shouldPan___block_invoke_3( uint64_t a1)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (*(_BYTE *)(a1 + 48)) {
    return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  }
  return result;
}

- (void)_updateLensEdgeMaskForZoomController:(id)a3
{
  id v50 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  if (v13 == v50)
  {
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v50 lensChromeView]);
    [v23 bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    unint64_t v24 = v25;
    double v26 = v32;
    double v27 = v34;
    double v28 = v36;
    double v29 = v38;
    double v30 = v23;
  }

  else
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v50 view]);
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v50 view]);
    double v25 = v23;
    double v26 = v16;
    double v27 = v18;
    double v28 = v20;
    double v29 = v22;
    double v30 = v24;
  }

  objc_msgSend(v25, "convertRect:fromView:", v30, v26, v27, v28, v29);
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  double v47 = vabdd_f64(v42, v12 - v46);
  uint64_t v48 = (vabdd_f64(v42, v8) < 1.0) | (8LL * (vabdd_f64(v40, v6) < 1.0)) | (2LL * (vabdd_f64(v40, v10 - v44) < 1.0)) | (4LL * (v47 < 1.0));
  id v49 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController", v47));

  if (v49 == v50) {
    -[ZWRootViewController setPipLensEdgeMask:](self, "setPipLensEdgeMask:", v48);
  }
  else {
    -[ZWRootViewController setSlugEdgeMask:](self, "setSlugEdgeMask:", v48);
  }
}

- (void)_unzoomDueToAppTransitionIfNeeded
{
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v4 = vabdd_f64(v3, self->_lastDeviceUnlockTime);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v6 = v5;
    if (v4 >= 0.5 && ([v5 inStandbyMode] & 1) == 0)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

      if (v7 == v8)
      {
        -[ZWRootViewController setZoomWasUnzoomedDueToAppTransition:]( self,  "setZoomWasUnzoomedDueToAppTransition:",  1LL);
        -[ZWRootViewController setZoomIsAnimatingDueToTransition:](self, "setZoomIsAnimatingDueToTransition:", 1LL);
        -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
        -[ZWRootViewController setPanOffsetXBeforeTransition:](self, "setPanOffsetXBeforeTransition:");
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = __57__ZWRootViewController__unzoomDueToAppTransitionIfNeeded__block_invoke;
        v10[3] = &unk_6CBC0;
        v10[4] = self;
        objc_msgSend( v9,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  AXZoomLensEffectNone,  1,  v10,  AXZoomMinimumZoomLevel,  CGPointZero.x,  CGPointZero.y);
      }
    }
  }

id __57__ZWRootViewController__unzoomDueToAppTransitionIfNeeded__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) triedToRezoomForDockTransition];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 32) _rezoomDueToDockIfNeeded];
  }
  return result;
}

- (void)_rezoomDueToAppTransitionIfNeeded
{
  if (!UIAccessibilityIsReduceMotionEnabled()
    && !-[ZWRootViewController triedToRezoomForDockTransition](self, "triedToRezoomForDockTransition")
    && -[ZWRootViewController zoomWasUnzoomedDueToAppTransition](self, "zoomWasUnzoomedDueToAppTransition"))
  {
    -[ZWRootViewController setZoomWasUnzoomedDueToAppTransition:](self, "setZoomWasUnzoomedDueToAppTransition:", 0LL);
    -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
    double v4 = v3;
    double v6 = v5;
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
    double v8 = v7;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

    if (v9 == v10)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));
      [v11 maximumPanOffsetWithZoomFactor:v8];
      double v13 = v12;

      double v6 = -v13;
      double v4 = 0.0;
      -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", 0.0, v6);
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v16 = (id)objc_claimAutoreleasedReturnValue([v14 zoomCurrentLensEffect]);

    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    objc_msgSend( v15,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v16,  1,  0,  v8,  v4,  v6);
  }

- (void)_rezoomDueToDockIfNeeded
{
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    if (-[ZWRootViewController zoomIsAnimatingDueToTransition](self, "zoomIsAnimatingDueToTransition"))
    {
      -[ZWRootViewController setTriedToRezoomForDockTransition:](self, "setTriedToRezoomForDockTransition:", 1LL);
    }

    else
    {
      -[ZWRootViewController setTriedToRezoomForDockTransition:](self, "setTriedToRezoomForDockTransition:", 0LL);
      if (-[ZWRootViewController zoomWasUnzoomedDueToAppTransition](self, "zoomWasUnzoomedDueToAppTransition"))
      {
        -[ZWRootViewController setZoomWasUnzoomedDueToAppTransition:]( self,  "setZoomWasUnzoomedDueToAppTransition:",  0LL);
        -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
        double v4 = v3;
        double v6 = v5;
        -[ZWRootViewController zoomFactor](self, "zoomFactor");
        double v8 = v7;
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

        if (v9 == v10)
        {
          double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));
          [v11 maximumPanOffsetWithZoomFactor:v8];
          double v6 = v12;

          -[ZWRootViewController panOffsetXBeforeTransition](self, "panOffsetXBeforeTransition");
          double v4 = v13;
          -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:");
        }

        int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        id v16 = (id)objc_claimAutoreleasedReturnValue([v14 zoomCurrentLensEffect]);

        double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        objc_msgSend( v15,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v16,  1,  0,  v8,  v4,  v6);
      }
    }
  }

- (void)_toggleZoomStandby
{
  if (-[ZWRootViewController zoomIsAnimatingDueToStandbyToggle](self, "zoomIsAnimatingDueToStandbyToggle"))
  {
    -[ZWRootViewController setTriedToToggleStandbyDuringAnimation:]( self,  "setTriedToToggleStandbyDuringAnimation:",  1LL);
  }

  else
  {
    -[ZWRootViewController setTriedToToggleStandbyDuringAnimation:]( self,  "setTriedToToggleStandbyDuringAnimation:",  0LL);
    -[ZWRootViewController setZoomIsAnimatingDueToStandbyToggle:](self, "setZoomIsAnimatingDueToStandbyToggle:", 1LL);
    -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
    double v5 = v4;
    if (-[ZWRootViewController _isZoomFactorAtMinimum:](self, "_isZoomFactorAtMinimum:"))
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
      [v6 zoomFactor];
      double v5 = v7;

      if (-[ZWRootViewController _isZoomFactorAtMinimum:](self, "_isZoomFactorAtMinimum:", v5)) {
        double v5 = AXZoomDefaultZoomLevel;
      }
    }

    -[ZWRootViewController setZoomFactor:](self, "setZoomFactor:", v5);
    -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
    double v9 = v8;
    double v11 = v10;
    if ([v3 inStandbyMode])
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom"));
      unsigned int v13 = [v12 isEnabled];

      if (v13)
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom"));
        [v14 focusRect];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;

        v37.origin.double x = v16;
        v37.origin.double y = v18;
        v37.size.CGFloat width = v20;
        v37.size.CGFloat height = v22;
        if (!CGRectIsEmpty(v37))
        {
          double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
          objc_msgSend(v23, "zw_convertRectFromScreenCoordinates:", v16, v18, v20, v22);
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;

          objc_msgSend(v3, "offsetByPanningToRect:zoomFactor:", v25, v27, v29, v31, v5);
          double v9 = v32;
          double v11 = v33;
        }
      }
    }

    double v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoomCurrentLensEffect]);

    -[ZWRootViewController _updateLensLayout](self, "_updateLensLayout");
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = __42__ZWRootViewController__toggleZoomStandby__block_invoke;
    v36[3] = &unk_6CBC0;
    v36[4] = self;
    objc_msgSend( v3,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  objc_msgSend(v3, "inStandbyMode") ^ 1,  v35,  1,  v36,  v5,  v9,  v11);
  }

id __42__ZWRootViewController__toggleZoomStandby__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) triedToToggleStandbyDuringAnimation];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 32) _toggleZoomStandby];
  }
  return result;
}

- (void)_setPIPLensResizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController touchTrapView](self, "touchTrapView"));
  [v5 setEnabled:v3];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  [v6 setInLensResizingMode:v3];

  double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __51__ZWRootViewController__setPIPLensResizingEnabled___block_invoke;
  v8[3] = &unk_6CAB0;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_sync(v7, v8);
}

uint64_t __51__ZWRootViewController__setPIPLensResizingEnabled___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376LL) = *(_WORD *)(*(void *)(result + 32) + 376LL) & 0xFEFF | (*(unsigned __int8 *)(result + 40) << 8);
  return result;
}

- (void)_setDockResizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController touchTrapView](self, "touchTrapView"));
  [v5 setEnabled:v3];

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  [v6 setInDockResizingMode:v3];

  double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __48__ZWRootViewController__setDockResizingEnabled___block_invoke;
  v8[3] = &unk_6CAB0;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_sync(v7, v8);
}

uint64_t __48__ZWRootViewController__setDockResizingEnabled___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376LL) = *(_WORD *)(*(void *)(result + 32) + 376LL) & 0xFEFF | (*(unsigned __int8 *)(result + 40) << 8);
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  uint64_t v8 = ZOOMLogCommon();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    [v10 bounds];
    v63.CGFloat width = v11;
    v63.CGFloat height = v12;
    unsigned int v13 = NSStringFromCGSize(v63);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v64.CGFloat width = width;
    v64.CGFloat height = height;
    double v15 = NSStringFromCGSize(v64);
    double v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138412546;
    double v60 = v14;
    __int16 v61 = 2112;
    double v62 = v16;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Zoom window will transition from size %@ to %@", buf, 0x16u);
  }

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  BOOL v19 = v17 == v18;
  if (v17 == v18) {
    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
  }
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 view]);
  [v21 alpha];
  uint64_t v23 = v22;

  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 view]);
  [v25 setAlpha:0.0];

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v58[3] = &unk_6D280;
  v58[4] = self;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v56[3] = &unk_6D2A8;
  BOOL v57 = v19;
  v56[4] = self;
  v56[5] = v23;
  [v7 animateAlongsideTransition:v58 completion:v56];

  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v26 == v27)
  {
    double v54 = width;
    double v55 = height;
    double v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v29 = (void *)objc_claimAutoreleasedReturnValue([v28 view]);
    [v29 frame];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;

    v65.origin.CGFloat x = UIRectInset(v31, v33, v35, v37, 18.0, 18.0, 18.0, 18.0);
    CGFloat x = v65.origin.x;
    CGFloat y = v65.origin.y;
    double v40 = v65.size.width;
    double v41 = v65.size.height;
    double MinX = CGRectGetMinX(v65);
    double v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    [v43 frame];
    double v45 = v44;
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = v40;
    v66.size.CGFloat height = v41;
    double v46 = v45 - CGRectGetMaxX(v66);

    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = v40;
    v67.size.CGFloat height = v41;
    double MinY = CGRectGetMinY(v67);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    [v48 frame];
    double v50 = v49;
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = v40;
    v68.size.CGFloat height = v41;
    double v51 = v50 - CGRectGetMaxY(v68);

    if (MinX + v46 > 0.5)
    {
      double v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensDragXConstraint](self, "lensDragXConstraint"));
      [v52 setConstant:MinX * (v54 - v40) / (MinX + v46) + -18.0];
    }

    if (MinY + v51 > 0.5)
    {
      double v53 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensDragYConstraint](self, "lensDragYConstraint"));
      [v53 setConstant:(v55 - v41) * MinY / (MinY + v51) + -18.0];
    }
  }

id __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSlugLayoutAnimated:1];
}

void __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 48)) {
    +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 1LL);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v12[3] = &unk_6CD58;
  v12[4] = *(void *)(a1 + 32);
  void v12[5] = *(void *)(a1 + 40);
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v12, 0.25);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lensZoomView]);
  [v5 zoomPanOffset];
  objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:");

  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3010000000LL;
  v10[3] = "";
  CGSize v11 = CGSizeZero;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  v9[3] = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v8[3] = &unk_6D0F0;
  v8[4] = *(void *)(a1 + 32);
  void v8[5] = v9;
  v8[6] = v10;
  AXPerformBlockSynchronouslyOnMainThread(v8);
  double v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
  v7[3] = &unk_6D118;
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = v9;
  void v7[6] = v10;
  dispatch_sync(v6, v7);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
}

void __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3( uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  [v2 setAlpha:v1];
}

void __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 window]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 interfaceOrientation];

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) screen]);
  [v7 bounds];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
}

__n128 __75__ZWRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5( uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = v2 + 10;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 activeLensViewController]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lensZoomView]);
  objc_msgSend(v5, "zw_convertBoundsToScreenCoordinates");
  v3[4] = v6;
  v3[5] = v7;
  v3[6] = v8;
  v3[7] = v9;

  double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  CGSize v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);

  if (v10 == v11)
  {
    CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
    [v12 screenShift];
    *(void *)(*(void *)(a1 + 32) + 216LL) = v13;

    int v14 = *(void **)(a1 + 32);
    double v15 = v14 + 10;
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v14 dockedLensViewController]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 dockedLensView]);
    [v17 frame];
    v15[18] = v18;
    v15[19] = v19;
    v15[20] = v20;
    v15[21] = v21;

    uint64_t v22 = *(void **)(a1 + 32);
    uint64_t v23 = v22 + 10;
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v22 dockedLensViewController]);
    [v24 zoomRegionFrame];
    v23[22] = v25;
    v23[23] = v26;
    v23[24] = v27;
    v23[25] = v28;

    double v29 = *(void **)(a1 + 32);
    double v30 = v29 + 10;
    double v31 = (void *)objc_claimAutoreleasedReturnValue([v29 dockedLensViewController]);
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v31 toggleZoomRegionButton]);
    [v32 frame];
    v30[26] = v33;
    v30[27] = v34;
    v30[28] = v35;
    v30[29] = v36;

    double v37 = *(void **)(a1 + 32);
    double v38 = v37 + 10;
    double v39 = (void *)objc_claimAutoreleasedReturnValue([v37 dockedLensViewController]);
    [v39 frameForResizeDrag];
    v38[30] = v40;
    v38[31] = v41;
    v38[32] = v42;
    v38[33] = v43;
  }

  *(void *)(*(void *)(a1 + 32) + 80LL) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  *(void *)(*(void *)(a1 + 32) + 384LL) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  *(_OWORD *)(*(void *)(a1 + 32) + 96LL) = *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
  __n128 result = *(__n128 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL);
  *(__n128 *)(*(void *)(a1 + 32) + 400LL) = result;
  return result;
}

- (void)setTestingScreenSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  ZWSetTestingScreenSize(a3.width, a3.height);
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v7 bounds];
    double width = v8;
    double height = v9;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, width, height);

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController _applyInitialConstraintsForLensViewController:]( self,  "_applyInitialConstraintsForLensViewController:",  v11);
}

- (CGSize)_screenSizeForCurrentOrientation
{
  if (!self->_inUnitTestingMode
    || (ZWGetTestingScreenSize() == CGSizeZero.width ? (BOOL v4 = v3 == CGSizeZero.height) : (BOOL v4 = 0), v4))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;

    double v5 = v9;
    double v6 = v11;
  }

  else
  {
    double v5 = ZWGetTestingScreenSize();
  }

  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGPoint)_denormalizePointForCurrentOrientation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
  double v6 = x * v5;
  double v8 = y * v7;
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (CGPoint)_denormalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4
{
  double v4 = a4.origin.x + a3.x * a4.size.width;
  double v5 = a4.origin.y + a3.y * a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_normalizePoint:(CGPoint)a3 withRespectToFrame:(CGRect)a4
{
  double v4 = (a3.x - a4.origin.x) / a4.size.width;
  double v5 = (a3.y - a4.origin.y) / a4.size.height;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_physicalScreenPointForVirtualScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[ZWRootViewController zoomFrame](self, "zoomFrame");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v14 == v15)
  {
    -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
    -[ZWRootViewController _normalizePoint:withRespectToFrame:]( self,  "_normalizePoint:withRespectToFrame:",  x,  y,  v7,  v9,  v11,  v13);
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:](self, "_denormalizePoint:withRespectToFrame:");
    double x = v24;
    double y = v25;
  }

  else
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

    if (v16 == v17)
    {
      -[ZWRootViewController _normalizePoint:withRespectToFrame:]( self,  "_normalizePoint:withRespectToFrame:",  x,  y,  v7,  v9,  v11,  v13);
      double v27 = v26;
      double v29 = v28;
      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
      double v31 = (void *)objc_claimAutoreleasedReturnValue([v30 lensChromeView]);
      double v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 lensChromeView]);
      [v33 bounds];
      objc_msgSend(v31, "convertRect:toView:", 0);
      -[ZWRootViewController _denormalizePoint:withRespectToFrame:]( self,  "_denormalizePoint:withRespectToFrame:",  v27,  v29,  v34,  v35,  v36,  v37);
      double x = v38;
      double y = v39;

LABEL_13:
    }

    else
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

      if (v18 == v19)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        id v21 = [v20 dockPosition];

        switch((unint64_t)v21)
        {
          case 0uLL:
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
            [v22 screenShift];
            double y = y + v23;
            goto LABEL_9;
          case 1uLL:
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
            [v22 screenShift];
            double x = x + v40;
LABEL_9:

            break;
          case 2uLL:
            double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
            [v30 screenShift];
            double v42 = v41;
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
            double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 dockedLensView]);
            [v44 bounds];
            double x = x + v42 - v45;
            goto LABEL_12;
          case 3uLL:
            double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
            [v30 screenShift];
            double v47 = v46;
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
            double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 dockedLensView]);
            [v44 bounds];
            double y = y + v47 - v48;
LABEL_12:

            goto LABEL_13;
          default:
            break;
        }
      }
    }
  }

  double v49 = x;
  double v50 = y;
  result.double y = v50;
  result.double x = v49;
  return result;
}

- (CGPoint)_virtualScreenPointForPhysicalScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[ZWRootViewController zoomFrame](self, "zoomFrame");
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v10 == v11)
  {
    -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
    -[ZWRootViewController _normalizePoint:withRespectToFrame:]( self,  "_normalizePoint:withRespectToFrame:",  x,  y,  0.0,  0.0,  v20,  v21);
    uint64_t v22 = self;
LABEL_8:
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:]( v22,  "_denormalizePoint:withRespectToFrame:",  v49,  v50);
    double x = v35;
    double y = v36;
    goto LABEL_9;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v12 == v13)
  {
    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lensChromeView]);
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 lensChromeView]);
    [v26 bounds];
    objc_msgSend(v24, "convertRect:toView:", 0);
    double v28 = v27;
    double v30 = v29;
    uint64_t v49 = v7;
    uint64_t v50 = v9;
    double v32 = v31;
    double v34 = v33;

    -[ZWRootViewController _normalizePoint:withRespectToFrame:]( self,  "_normalizePoint:withRespectToFrame:",  x,  y,  v28,  v30,  v32,  v34);
    uint64_t v22 = self;
    goto LABEL_8;
  }

  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  if (v14 == v15)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    id v17 = [v16 dockPosition];

    switch((unint64_t)v17)
    {
      case 0uLL:
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        [v18 screenShift];
        double y = y - v19;
        goto LABEL_11;
      case 1uLL:
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        [v18 screenShift];
        double x = x - v39;
LABEL_11:

        break;
      case 2uLL:
        double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        [v40 screenShift];
        double v42 = v41;
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 dockedLensView]);
        [v44 bounds];
        double x = x - (v42 - v45);
        goto LABEL_14;
      case 3uLL:
        double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        [v40 screenShift];
        double v47 = v46;
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 dockedLensView]);
        [v44 bounds];
        double y = y - (v47 - v48);
LABEL_14:

        break;
      default:
        break;
    }
  }

- (void)_presentMenuWithAnchorView:(id)a3 animated:(BOOL)a4 ignoreCooldown:(BOOL)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController presentedViewController](self, "presentedViewController"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));

  if (v8 != v9)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    if (a5 || vabdd_f64(v10, self->_lastMenuDismissalTime) >= 0.75)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController traitCollection](self, "traitCollection"));
      if (![v11 userInterfaceIdiom])
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));

        id v7 = (id)v12;
      }

      [v7 bounds];
      double v14 = v13;
      double MidY = v15;
      double v18 = v17;
      double v20 = v19;
      id v21 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));

      if (v7 == v21)
      {
        v54.origin.double x = v14;
        v54.origin.double y = MidY;
        v54.size.double width = v18;
        v54.size.double height = v20;
        CGFloat MidX = CGRectGetMidX(v54);
        v55.origin.double x = v14;
        v55.origin.double y = MidY;
        v55.size.double width = v18;
        v55.size.double height = v20;
        double MidY = CGRectGetMidY(v55);
        uint64_t v22 = 0LL;
        double v18 = 1.0;
        double v14 = MidX;
        double v20 = 1.0;
      }

      else
      {
        uint64_t v22 = 15LL;
      }

      uint64_t v24 = ZOOMLogCommon();
      double v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v56.origin.double x = v14;
        v56.origin.double y = MidY;
        v56.size.double width = v18;
        v56.size.double height = v20;
        double v26 = NSStringFromCGRect(v56);
        double v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        double v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
        [v28 bounds];
        double v29 = NSStringFromCGRect(v57);
        double v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138412802;
        uint64_t v49 = v27;
        __int16 v50 = 2112;
        id v51 = v7;
        __int16 v52 = 2112;
        double v53 = v30;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Displaying Zoom Menu at popover rect: %@, anchor view: %@, view bounds: %@",  buf,  0x20u);
      }

      double v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
      double v32 = (void *)objc_claimAutoreleasedReturnValue([v31 view]);
      double v33 = (void *)objc_claimAutoreleasedReturnValue([v32 window]);

      if (v33)
      {
        double v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
        double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 view]);
        double v47 = v35;
        double v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
        double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
        double v38 = (void *)objc_claimAutoreleasedReturnValue([v37 popoverPresentationController]);
        [v38 setPassthroughViews:v36];
      }

      double v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
      double v40 = (void *)objc_claimAutoreleasedReturnValue([v39 popoverPresentationController]);
      objc_msgSend(v40, "setSourceRect:", v14, MidY, v18, v20);

      double v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
      double v42 = (void *)objc_claimAutoreleasedReturnValue([v41 popoverPresentationController]);
      [v42 setSourceView:v7];

      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
      double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 popoverPresentationController]);
      [v44 setPermittedArrowDirections:v22];

      double v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
      double v46 = (void *)objc_claimAutoreleasedReturnValue( -[ZWRootViewController zoomMenuVisibilityChangedUnitTestCallback]( self,  "zoomMenuVisibilityChangedUnitTestCallback"));
      -[ZWRootViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v45,  1LL,  v46);
    }
  }
}

- (void)_dismissMenuAnimated:(BOOL)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController presentedViewController](self, "presentedViewController", a3));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));

  if (v4 == v5)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_lastMenuDismissalTime = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 presentingViewController]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[ZWRootViewController zoomMenuVisibilityChangedUnitTestCallback]( self,  "zoomMenuVisibilityChangedUnitTestCallback"));
    [v8 dismissViewControllerAnimated:1 completion:v9];

    -[ZWRootViewController _menuDidDisappear](self, "_menuDidDisappear");
  }

- (void)_menuDidDisappear
{
  double v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __41__ZWRootViewController__menuDidDisappear__block_invoke;
  block[3] = &unk_6CBC0;
  block[4] = self;
  dispatch_sync(v3, block);

  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v5);
}

__n128 __41__ZWRootViewController__menuDidDisappear__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 80LL;
  __n128 result = (__n128)CGRectNull.origin;
  CGSize size = CGRectNull.size;
  *(CGPoint *)(v1 + 96) = CGRectNull.origin;
  *(CGSize *)(v1 + 112) = size;
  return result;
}

- (void)willBeginAutopanningLensWithAutopanner:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __63__ZWRootViewController_willBeginAutopanningLensWithAutopanner___block_invoke;
  block[3] = &unk_6CBC0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

void __63__ZWRootViewController_willBeginAutopanningLensWithAutopanner___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
    [v4 updateLensChromeAnimated:1];
  }

- (void)didFinishAutopanningLensWithAutopanner:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __63__ZWRootViewController_didFinishAutopanningLensWithAutopanner___block_invoke;
  block[3] = &unk_6CBC0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

void __63__ZWRootViewController_didFinishAutopanningLensWithAutopanner___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
    [v4 updateLensChromeAnimated:1];
  }

- (void)autopanner:(id)a3 didAutopanByDelta:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __53__ZWRootViewController_autopanner_didAutopanByDelta___block_invoke;
  block[3] = &unk_6CC98;
  block[4] = self;
  CGPoint v5 = a4;
  dispatch_async(&_dispatch_main_q, block);
}

void __53__ZWRootViewController_autopanner_didAutopanByDelta___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 activeLensViewController]);
    objc_msgSend( v4,  "_moveZoomItemWithController:byDelta:animated:userInitiated:",  v5,  0,  1,  *(double *)(a1 + 40),  *(double *)(a1 + 48));
  }

- (void)toggleZoomMenu
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController presentedViewController](self, "presentedViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));

  if (v3 == v4)
  {
    -[ZWRootViewController _dismissMenuAnimated:](self, "_dismissMenuAnimated:", 1LL);
  }

  else
  {
    if (-[ZWRootViewController isZoomSlugVisible](self, "isZoomSlugVisible"))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
      id v6 = (id)objc_claimAutoreleasedReturnValue([v5 slugRingView]);
    }

    else
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    }

    -[ZWRootViewController _presentMenuWithAnchorView:animated:ignoreCooldown:]( self,  "_presentMenuWithAnchorView:animated:ignoreCooldown:",  v6,  1LL,  0LL);
  }

- (void)_handleSlugAction:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController presentedViewController](self, "presentedViewController"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));

    if (v8 == v9) {
      -[ZWRootViewController _dismissMenuAnimated:](self, "_dismissMenuAnimated:", 1LL);
    }
    -[ZWRootViewController _toggleZoomStandby](self, "_toggleZoomStandby");
  }

  else if (a3 == 1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController presentedViewController](self, "presentedViewController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));

    if (v4 == v5)
    {
      -[ZWRootViewController _dismissMenuAnimated:](self, "_dismissMenuAnimated:", 1LL);
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
      if (v6 == v7)
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
        unsigned int v11 = [v10 isInLensResizingMode];

        if (v11) {
          -[ZWRootViewController toggleLensResizeModeWithMenuViewController:]( self,  "toggleLensResizeModeWithMenuViewController:",  0LL);
        }
      }

      else
      {
      }

      id v13 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 slugRingView]);
      -[ZWRootViewController _presentMenuWithAnchorView:animated:ignoreCooldown:]( self,  "_presentMenuWithAnchorView:animated:ignoreCooldown:",  v12,  1LL,  0LL);
    }
  }

- (void)slugWasSingleTappedWithSlugViewController:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  -[ZWRootViewController _handleSlugAction:](self, "_handleSlugAction:", [v4 zoomSlugSingleTapAction]);
}

- (void)slugWasDoubleTappedWithSlugViewController:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  -[ZWRootViewController _handleSlugAction:](self, "_handleSlugAction:", [v4 zoomSlugDoubleTapAction]);
}

- (void)slugWasTripleTappedWithSlugViewController:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  -[ZWRootViewController _handleSlugAction:](self, "_handleSlugAction:", [v4 zoomSlugTripleTapAction]);
}

- (void)zoomSlugViewController:(id)a3 didDragSlug:(id)a4 withDelta:(CGPoint)a5
{
}

- (BOOL)shouldBeginAutopanningLensWithSlugViewController:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  char v4 = [v3 inStandbyMode] ^ 1;

  return v4;
}

- (void)wantsToStartAutopannerWithSlugViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensAutopanner](self, "lensAutopanner"));
  [v5 setDataSource:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensAutopanner](self, "lensAutopanner"));
  [v6 start];
}

- (void)wantsToStopAutopannerWithSlugViewController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensAutopanner](self, "lensAutopanner", a3));
  [v4 stop];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensAutopanner](self, "lensAutopanner"));
  [v5 setDataSource:0];

  -[ZWRootViewController _updateSystemGestureDisablingAssertions](self, "_updateSystemGestureDisablingAssertions");
}

- (BOOL)shouldShowSlugWithSlugViewController:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  char v4 = [v3 userIsMovingLens] ^ 1;

  return v4;
}

- (BOOL)attemptOrbZoomIfAppropriateWithSlugViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned int v6 = [v5 inStandbyMode];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
    [v8 center];
    objc_msgSend(v7, "zw_convertPointToScreenCoordinates:");
    double v10 = v9;
    double v12 = v11;

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
    [v13 scale];
    double v15 = v10 * v14;

    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
    [v16 scale];
    double v18 = v12 * v17;

    *((_WORD *)&self->_eventUIContext + 148) |= 0x800u;
    -[ZWRootViewController fullscreenEventHandler:didStartOrbAtLocation:]( self,  "fullscreenEventHandler:didStartOrbAtLocation:",  0LL,  v15,  v18);
  }

  return v6;
}

- (void)updateOrbZoomAtPoint:(CGPoint)a3 withSlugViewController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view", a4));
  objc_msgSend(v7, "zw_convertPointToScreenCoordinates:", x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
  [v12 scale];
  double v14 = v9 * v13;

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
  [v15 scale];
  double v17 = v11 * v16;

  -[ZWRootViewController fullscreenEventHandler:updateOrbMovementAtLocation:]( self,  "fullscreenEventHandler:updateOrbMovementAtLocation:",  0LL,  v14,  v17);
}

- (void)endOrbZoomWithSlugViewController:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);

  [v6 center];
  objc_msgSend(v5, "zw_convertPointToScreenCoordinates:");
  double v8 = v7;
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
  [v11 scale];
  double v13 = v8 * v12;

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
  [v14 scale];
  double v16 = v10 * v15;

  *((_WORD *)&self->_eventUIContext + 148) &= ~0x800u;
  -[ZWRootViewController fullscreenEventHandler:didEndOrbAtLocation:]( self,  "fullscreenEventHandler:didEndOrbAtLocation:",  0LL,  v13,  v16);
}

- (void)zoomLensViewController:(id)a3 willBeginMovingLens:(id)a4
{
  self->_lensDeltaSinceInitialMove = CGPointZero;
}

- (void)zoomLensViewController:(id)a3 didMoveLens:(id)a4 withDelta:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v13 = a3;
  CGFloat v8 = y + self->_lensDeltaSinceInitialMove.y;
  self->_lensDeltaSinceInitialMove.double x = x + self->_lensDeltaSinceInitialMove.x;
  self->_lensDeltaSinceInitialMove.double y = v8;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  if (v9 != v13)
  {

LABEL_6:
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    if (v11 != v13)
    {

LABEL_11:
      -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:]( self,  "_moveZoomItemWithController:byDelta:animated:userInitiated:",  v13,  0LL,  1LL,  x,  y);
      goto LABEL_12;
    }

    unsigned int v12 = [v13 isInDockResizingMode];

    if (!v12) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  unsigned int v10 = [v13 isInLensResizingMode];

  if (!v10) {
    goto LABEL_6;
  }
  if ([v13 activeResizeHandle] != (char *)&dword_0 + 1)
  {
LABEL_9:
    -[ZWRootViewController _resizeZoomLensByDelta:](self, "_resizeZoomLensByDelta:", x, y);
    goto LABEL_10;
  }

  -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:]( self,  "_moveZoomItemWithController:byDelta:animated:userInitiated:",  v13,  0LL,  1LL,  x,  y);
LABEL_10:
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
LABEL_12:
}

- (BOOL)shouldHideGrabbersWithZoomLensViewController:(id)a3
{
  return -[ZWKeyboardContext isKeyboardVisible](self->_kbContext, "isKeyboardVisible", a3);
}

- (void)zoomLensViewController:(id)a3 grabberDidReceiveTap:(id)a4
{
}

- (void)dockedLensViewController:(id)a3 toggleButtonDidReceiveLongPress:(id)a4
{
}

- (void)dockedLensViewController:(id)a3 zoomRegionVisibilityWasChanged:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue", a3));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __80__ZWRootViewController_dockedLensViewController_zoomRegionVisibilityWasChanged___block_invoke;
  v8[3] = &unk_6CAB0;
  v8[4] = self;
  BOOL v9 = v4;
  dispatch_sync(v6, v8);

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController axuiService](self, "axuiService"));
  [v7 notifyOtherDisplaysOfDockedZoomRegionVisibilityChange:v4];
}

uint64_t __80__ZWRootViewController_dockedLensViewController_zoomRegionVisibilityWasChanged___block_invoke( uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376LL) = *(_WORD *)(*(void *)(result + 32) + 376LL) & 0xFFBF | ((*(_BYTE *)(result + 40) & 3) << 6);
  return result;
}

- (void)handleWasDraggedWithDockedLensViewController:(id)a3
{
}

- (void)doneResizingDockWithDockedLensViewController:(id)a3
{
}

- (BOOL)userIsInteractingWithSlugWithDockedLensViewController:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController", a3));
  unsigned __int8 v4 = [v3 userIsInteractingWithSlug];

  return v4;
}

- (BOOL)isZoomMovingWithVelocityWithDockedLensViewController:(id)a3
{
  return self->_fullScreenZoomVelocity > 0.0;
}

- (void)updateDockedZoomRegionVisibility:(BOOL)a3
{
  int v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  unsigned int v6 = [v5 zoomRegionVisible];

  if (v6 != v3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    [v7 toggleZoomRegionVisibility];
  }

- (void)dismissMenuWithMenuViewController:(id)a3
{
}

- (void)menuViewController:(id)a3 finishedAdjustingZoomFactor:(double)a4
{
  id v7 = a3;
  if (!-[ZWRootViewController _isZoomFactorAtMinimum:](self, "_isZoomFactorAtMinimum:", a4))
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v6 setZoomFactor:a4];
  }

  -[ZWRootViewController menuViewController:adjustZoomFactor:animated:]( self,  "menuViewController:adjustZoomFactor:animated:",  v7,  0LL,  a4);
}

- (void)menuViewController:(id)a3 adjustZoomFactor:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  -[ZWRootViewController _updateZoomFactor:animated:](self, "_updateZoomFactor:animated:", a5);
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  if (v14 == v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    unsigned int v10 = [v9 zoomRegionVisible];

    if (!v10) {
      return;
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    [v8 zoomPanOffset];
    if (v5) {
      double v13 = 0.3;
    }
    else {
      double v13 = -1.0;
    }
    objc_msgSend(v14, "updateZoomFactor:panOffset:animated:animationDuration:completion:", v5, 0, a4, v11, v12, v13);
  }
}

- (void)menuViewController:(id)a3 didChooseLensEffect:(id)a4
{
  id v17 = a4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoomCurrentLensEffect]);
  unsigned __int8 v7 = [v6 isEqualToString:v17];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v8 setZoomCurrentLensEffect:v17];
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  if (([v9 inStandbyMode] & 1) == 0)
  {

    goto LABEL_7;
  }

  unsigned int v10 = (ZWZoomPIPLensViewController *)objc_claimAutoreleasedReturnValue( -[ZWRootViewController activeLensViewController]( self,  "activeLensViewController"));
  pipLensViewController = self->_pipLensViewController;

  if (v10 != pipLensViewController)
  {
LABEL_7:
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    [v12 updateLensEffect:v17 animated:1 completion:0];
    goto LABEL_8;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  double v14 = v13;
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  objc_msgSend( v12,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v17,  1,  0,  v14,  v15,  v16);
LABEL_8:
}

- (void)menuViewController:(id)a3 didChooseZoomMode:(id)a4 withCompletion:(id)a5
{
  id v11 = a4;
  unsigned int v6 = (void (**)(void))a5;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoomCurrentLensMode]);
  unsigned __int8 v9 = [v8 isEqualToString:v11];

  if ((v9 & 1) == 0)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v10 setZoomCurrentLensMode:v11];
  }

  if (v6) {
    v6[2](v6);
  }
}

- (void)menuViewController:(id)a3 didChooseDockPosition:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  [v9 setDockPositionIsTransitioning:1];

  +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v8);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoomPreferredCurrentDockPosition]);
  unsigned __int8 v12 = [v11 isEqualToString:v7];

  if ((v12 & 1) == 0)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    unsigned __int8 v14 = [v13 inStandbyMode];

    if ((v14 & 1) != 0)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_5;
      v28[3] = &unk_6CBC0;
      v28[4] = self;
      [v15 transitionToDockPosition:v7 completion:v28];
    }

    else
    {
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      [v17 zoomFactor];
      double v19 = v18;
      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      [v20 zoomPanOffset];
      double v22 = v21;
      double v24 = v23;
      double v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoomCurrentLensEffect]);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke;
      v29[3] = &unk_6D008;
      v29[4] = self;
      id v30 = v7;
      objc_msgSend( v16,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  v26,  1,  v29,  v19,  v22,  v24);

      double v15 = v30;
    }

    double v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v27 setZoomPreferredCurrentDockPosition:v7];
  }

  +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_2;
  v4[3] = &unk_6CBC0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 transitionToDockPosition:v3 completion:v4];
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_2( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v3 zoomFactor];
  double v5 = v4;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v6 zoomPanOffset];
  double v8 = v7;
  double v10 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoomCurrentLensEffect]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_3;
  v13[3] = &unk_6CBC0;
  v13[4] = *(void *)(a1 + 32);
  objc_msgSend( v2,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v12,  1,  v13,  v5,  v8,  v10);
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_3( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  [v2 setDockPositionIsTransitioning:0];

  [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_4;
  block[3] = &unk_6CBC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_4( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_5( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  [v2 setDockPositionIsTransitioning:0];

  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_6;
  block[3] = &unk_6CBC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v3, block);
}

void __80__ZWRootViewController_menuViewController_didChooseDockPosition_withCompletion___block_invoke_6( uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  *(void *)(*(void *)(a1 + 32) + 352) = [v2 dockPosition];
}

- (BOOL)toggleSlugVisibilityWithMenuViewController:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  uint64_t v4 = [v3 zoomShouldShowSlug] ^ 1;
  [v3 setZoomShouldShowSlug:v4];

  return v4;
}

- (BOOL)togglePeekZoomWithMenuViewController:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  uint64_t v4 = [v3 zoomPeekZoomEnabled] ^ 1;
  [v3 setZoomPeekZoomEnabled:v4];

  return v4;
}

- (void)_exitStandbyIfNecessary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  unsigned int v4 = [v3 zoomInStandby];

  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v6 zoomFactor];
    double v8 = v7;
    -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
    double v10 = v9;
    double v12 = v11;
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoomCurrentLensEffect]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __47__ZWRootViewController__exitStandbyIfNecessary__block_invoke;
    v15[3] = &unk_6CBC0;
    v15[4] = self;
    objc_msgSend( v5,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v14,  1,  v15,  v8,  v10,  v12);
  }

id __47__ZWRootViewController__exitStandbyIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)toggleLensVisibilityWithMenuViewController:(id)a3
{
  double v5 = v4;
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  [v8 zoomFactor];
  double v10 = v9;

  -[ZWRootViewController _dismissMenuAnimated:](self, "_dismissMenuAnimated:", 1LL);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoomCurrentLensEffect]);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  unsigned int v14 = [v13 zoomInStandby];

  uint64_t v15 = v14 ^ 1;
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  [v16 setZoomInStandby:v15];

  -[ZWRootViewController setZoomFactor:](self, "setZoomFactor:", v10);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __67__ZWRootViewController_toggleLensVisibilityWithMenuViewController___block_invoke;
  v19[3] = &unk_6CBC0;
  v19[4] = self;
  objc_msgSend( v17,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  v15,  v12,  1,  v19,  v10,  v5,  v7);

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController kbContext](self, "kbContext"));
  [v18 keyboardFrame];
  -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:");
}

id __67__ZWRootViewController_toggleLensVisibilityWithMenuViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)toggleLensResizeModeWithMenuViewController:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v4 == v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    uint64_t v7 = [v6 isInLensResizingMode] ^ 1;

    -[ZWRootViewController _setPIPLensResizingEnabled:](self, "_setPIPLensResizingEnabled:", v7);
    -[ZWRootViewController _exitStandbyIfNecessary](self, "_exitStandbyIfNecessary");
  }

- (BOOL)inFullscreenModeForMenuViewController:(id)a3
{
  uint64_t v3 = self;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](v3, "fullscreenLensViewController"));
  LOBYTE(v3) = v4 == v5;

  return (char)v3;
}

- (BOOL)inPIPModeForMenuViewController:(id)a3
{
  uint64_t v3 = self;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](v3, "pipLensViewController"));
  LOBYTE(v3) = v4 == v5;

  return (char)v3;
}

- (BOOL)inDockedModeForMenuViewController:(id)a3
{
  uint64_t v3 = self;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](v3, "dockedLensViewController"));
  LOBYTE(v3) = v4 == v5;

  return (char)v3;
}

- (BOOL)inStandByForMenuViewController:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  unsigned __int8 v4 = [v3 inStandbyMode];

  return v4;
}

- (double)zoomFactorForMenuViewController:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  unsigned int v5 = [v4 inStandbyMode];

  if (v5) {
    return AXZoomMinimumZoomLevel;
  }
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  return result;
}

- (void)menuDidAppear:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __38__ZWRootViewController_menuDidAppear___block_invoke;
  block[3] = &unk_6D008;
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = UIAccessibilityLayoutChangedNotification;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v6);

  -[ZWRootViewController _setPIPLensResizingEnabled:](self, "_setPIPLensResizingEnabled:", 0LL);
  -[ZWRootViewController _setDockResizingEnabled:](self, "_setDockResizingEnabled:", 0LL);
}

void __38__ZWRootViewController_menuDidAppear___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)(*(void *)(a1 + 32) + 80LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) view]);
  objc_msgSend(v6, "zw_convertBoundsToScreenCoordinates");
  v1[12] = v2;
  v1[13] = v3;
  v1[14] = v4;
  v1[15] = v5;
}

- (void)externalClientSetZoomFactor:(double)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __52__ZWRootViewController_externalClientSetZoomFactor___block_invoke;
  v8[3] = &unk_6CD58;
  v8[4] = self;
  *(double *)&void v8[5] = a3;
  uint64_t v4 = objc_retainBlock(v8);
  uint64_t v5 = v4;
  if (self->_inUnitTestingMode)
  {
    ((void (*)(void *))v4[2])(v4);
  }

  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = __52__ZWRootViewController_externalClientSetZoomFactor___block_invoke_2;
    v6[3] = &unk_6CBE8;
    id v7 = v4;
    AXPerformBlockAsynchronouslyOnMainThread(v6);
  }
}

id __52__ZWRootViewController_externalClientSetZoomFactor___block_invoke(uint64_t a1)
{
  double v3 = v2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isZoomFactorAtMinimum:") & 1) == 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v4 setZoomFactor:v3];
  }

  return [*(id *)(a1 + 32) menuViewController:0 adjustZoomFactor:1 animated:v3];
}

uint64_t __52__ZWRootViewController_externalClientSetZoomFactor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)externalClientSetZoomPanOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __55__ZWRootViewController_externalClientSetZoomPanOffset___block_invoke;
  v12[3] = &unk_6CC98;
  v12[4] = self;
  *(double *)&void v12[5] = x - v6;
  *(double *)&void v12[6] = y - v7;
  double v8 = objc_retainBlock(v12);
  id v9 = v8;
  if (self->_inUnitTestingMode)
  {
    ((void (*)(void *))v8[2])(v8);
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __55__ZWRootViewController_externalClientSetZoomPanOffset___block_invoke_2;
    v10[3] = &unk_6CBE8;
    double v11 = v8;
    AXPerformBlockAsynchronouslyOnMainThread(v10);
  }
}

void __55__ZWRootViewController_externalClientSetZoomPanOffset___block_invoke(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  unsigned __int8 v3 = [v2 inStandbyMode];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 activeLensViewController]);
    objc_msgSend( v4,  "_moveZoomItemWithController:byDelta:animated:userInitiated:",  v5,  1,  1,  *(double *)(a1 + 40),  *(double *)(a1 + 48));
  }

uint64_t __55__ZWRootViewController_externalClientSetZoomPanOffset___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)externalClientWantsToAutopan:(CGPoint)a3 withPanningStyle:(unint64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned __int8 v9 = [v8 inStandbyMode];

  if ((v9 & 1) == 0)
  {
    -[ZWRootViewController zoomFrame](self, "zoomFrame");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __70__ZWRootViewController_externalClientWantsToAutopan_withPanningStyle___block_invoke;
    v14[3] = &unk_6D2D0;
    v14[4] = self;
    void v14[5] = a4;
    *(CGFloat *)&v14[6] = x;
    *(CGFloat *)&v14[7] = y;
    v14[8] = v10;
    v14[9] = v11;
    v14[10] = v12;
    v14[11] = v13;
    AXPerformBlockAsynchronouslyOnMainThread(v14);
  }

void __70__ZWRootViewController_externalClientWantsToAutopan_withPanningStyle___block_invoke(uint64_t a1)
{
  double v62 = 0.0;
  uint64_t v2 = *(void *)(a1 + 40);
  switch(v2)
  {
    case 0LL:
      double v7 = *(void **)(a1 + 32);
      [v7 zoomFactor];
      objc_msgSend( v7,  "zoomFrameForPanningContinuouslyToPoint:zoomFactor:",  *(double *)(a1 + 48),  *(double *)(a1 + 56),  v8);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
      double v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);

      if (v17 != v18)
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 window]);
        double v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 window]);
        objc_msgSend(v22, "convertRect:fromWindow:", 0, v10, v12, v14, v16);
        objc_msgSend(v20, "_convertRectToSceneReferenceSpace:");
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;

        double v31 = *(void **)(a1 + 32);
        double v32 = v24;
        double v33 = v26;
        double v34 = v28;
        double v35 = v30;
        uint64_t v36 = 0LL;
LABEL_10:
        objc_msgSend( v31,  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  1,  v36,  0,  0,  v32,  v33,  v34,  v35);
        break;
      }

      double Center = AX_CGRectGetCenter(v10, v12, v14, v16);
      CGRect v55 = *(void **)(a1 + 32);
LABEL_13:
      objc_msgSend(v55, "_physicalScreenPointForVirtualScreenPoint:", Center, v54);
      double v57 = v56;
      double v59 = v58;
      double v60 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
      objc_msgSend(v60, "moveDockedZoomToPhysicalScreenPoint:animated:", 0, v57, v59);

      break;
    case 1LL:
      double v37 = *(double *)(a1 + 48);
      double v38 = *(double *)(a1 + 56);
      double v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
      double v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);

      if (v39 != v40)
      {
        double v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
        double v42 = (void *)objc_claimAutoreleasedReturnValue([v41 window]);
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
        double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 window]);
        objc_msgSend(v44, "convertRect:fromWindow:", 0, v37 + -1.0, v38 + -1.0, 2.0, 2.0);
        objc_msgSend(v42, "_convertRectToSceneReferenceSpace:");
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;

        double v31 = *(void **)(a1 + 32);
        double v32 = v46;
        double v33 = v48;
        double v34 = v50;
        double v35 = v52;
        uint64_t v36 = 1LL;
        goto LABEL_10;
      }

      CGRect v55 = *(void **)(a1 + 32);
      double Center = *(double *)(a1 + 48);
      double v54 = *(double *)(a1 + 56);
      goto LABEL_13;
    case 2LL:
      objc_msgSend( *(id *)(a1 + 32),  "_normalizePoint:withRespectToFrame:",  *(double *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64),  *(double *)(a1 + 72),  *(double *)(a1 + 80),  *(double *)(a1 + 88));
      double v4 = v3;
      double v6 = v5;
      if (objc_msgSend( *(id *)(a1 + 32),  "fullscreenEventHandler:autopanShouldStartWithPoint:speedFactor:initialSingleFingerLocation:fi ngerCount:pointHasBeenMapped:",  0,  &v62,  1,  v3,  v5,  v3,  v5,  1.0)) {
        objc_msgSend( *(id *)(a1 + 32),  "fullscreenEventHandler:autopanWithLocation:initialSingleFingerLocation:distance:animationDuration:useGutterDis tance:pointHasBeenMapped:",  0,  0,  1,  v4,  v6,  v4,  v6,  v62 * 4.0,  0.0166666675);
      }
      break;
  }

  __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v61 zoomMovementDidEnd];
}

- (CGRect)zoomFrameForPanningContinuouslyToPoint:(CGPoint)a3 zoomFactor:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned __int8 v9 = [v8 inStandbyMode];
  double v10 = 1.0;
  if ((v9 & 1) == 0) {
    -[ZWRootViewController zoomFactor](self, "zoomFactor", 1.0);
  }
  double v11 = v10 / a4;

  -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
  double v13 = v12;
  double v15 = v14;
  -[ZWRootViewController zoomFrame](self, "zoomFrame");
  double v17 = v11 * v16;
  double v19 = v11 * v18;
  double v20 = x + -x / v13 * v17;
  double v21 = y + -y / v15 * v19;
  result.size.double height = v19;
  result.size.double width = v17;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- ($8E443137C4339073293619EAAA2C742F)currentUIContextForEventProcessor:(SEL)a3
{
  id v6 = a4;
  uint64_t v13 = 0LL;
  double v14 = &v13;
  uint64_t v15 = 0x15010000000LL;
  double v16 = "";
  if (self->_inStandbyForFluidSwitcherGesture)
  {
    double v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke;
    block[3] = &unk_6D140;
    block[4] = self;
    void block[5] = &v13;
    dispatch_sync(v7, block);
  }

  else
  {
    double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke_2;
    v11[3] = &unk_6D140;
    v11[4] = self;
    void v11[5] = &v13;
    dispatch_sync(v8, v11);

    unsigned __int8 v9 = v14;
    if ((v14[41] & 0x80) != 0)
    {
      *(CGPoint *)(v14 + 39) = CGPointZero;
      v9[20] = AXZoomMinimumZoomLevel;
    }
  }

  memcpy(retstr, v14 + 4, sizeof($8E443137C4339073293619EAAA2C742F));
  _Block_object_dispose(&v13, 8);

  return result;
}

void *__58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke(uint64_t a1)
{
  return memcpy( (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL),  (const void *)(*(void *)(a1 + 32) + 384LL),  0x130uLL);
}

void *__58__ZWRootViewController_currentUIContextForEventProcessor___block_invoke_2(uint64_t a1)
{
  return memcpy( (void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL),  (const void *)(*(void *)(a1 + 32) + 80LL),  0x130uLL);
}

- (int64_t)currentInterfaceOrientationForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0LL;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __69__ZWRootViewController_currentInterfaceOrientationForEventProcessor___block_invoke;
  v8[3] = &unk_6D140;
  v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(v5, v8);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __69__ZWRootViewController_currentInterfaceOrientationForEventProcessor___block_invoke( uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 80LL);
  return result;
}

- (CGSize)currentScreenSizeForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x3010000000LL;
  double v14 = "";
  CGSize v15 = CGSizeZero;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __59__ZWRootViewController_currentScreenSizeForEventProcessor___block_invoke;
  v10[3] = &unk_6D140;
  void v10[4] = self;
  void v10[5] = &v11;
  dispatch_sync(v5, v10);

  double v6 = v12[4];
  double v7 = v12[5];
  _Block_object_dispose(&v11, 8);

  double v8 = v6;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

__n128 __59__ZWRootViewController_currentScreenSizeForEventProcessor___block_invoke(uint64_t a1)
{
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 96LL);
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL) = result;
  return result;
}

- (unsigned)currentWindowContextIdForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 0;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __64__ZWRootViewController_currentWindowContextIdForEventProcessor___block_invoke;
  v7[3] = &unk_6D140;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v5, v7);

  LODWORD(self) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return self;
}

uint64_t __64__ZWRootViewController_currentWindowContextIdForEventProcessor___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_DWORD *)(*(void *)(result + 32) + 88LL);
  return result;
}

- (unsigned)currentDisplayIdForEventProcessor:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0LL;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 0;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __58__ZWRootViewController_currentDisplayIdForEventProcessor___block_invoke;
  v7[3] = &unk_6D140;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v5, v7);

  LODWORD(self) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return self;
}

uint64_t __58__ZWRootViewController_currentDisplayIdForEventProcessor___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_DWORD *)(*(void *)(result + 32) + 92LL);
  return result;
}

- (void)eventProcessor:(id)a3 didGetFirstTouchAtLocation:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __66__ZWRootViewController_eventProcessor_didGetFirstTouchAtLocation___block_invoke;
  block[3] = &unk_6CC98;
  block[4] = self;
  CGPoint v5 = a4;
  dispatch_async(&_dispatch_main_q, block);
}

void __66__ZWRootViewController_eventProcessor_didGetFirstTouchAtLocation___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idleTouchTimer]);
  [v2 cancel];

  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
  CGPoint v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  objc_msgSend(v5, "zw_convertPointFromScreenCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v3, "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");

  double v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  objc_msgSend(v8, "zw_convertPointFromScreenCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v6, "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");

  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menuViewController]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menuViewController]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
  objc_msgSend(v10, "zw_convertPointFromScreenCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(v11, "userInteractionHasBecomeActiveWithFirstTouchAtLocation:");
}

- (BOOL)eventProcessor:(id)a3 didGetWheelEventWithDelta:(int64_t)a4
{
  if (v6 <= AXZoomMinimumZoomLevel)
  {
    unsigned int v8 = 0;
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    unsigned int v8 = [v7 inStandbyMode] ^ 1;
  }

  BOOL v9 = self->_snarfingWheelEventsForZoom
    || (char *)-[ZWRootViewController lastKeyboardCommand](self, "lastKeyboardCommand") == (char *)&dword_C + 2;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke;
  v22[3] = &unk_6CBC0;
  v22[4] = self;
  uint64_t v10 = objc_retainBlock(v22);
  if (v8)
  {
    BOOL v11 = !self->_snarfingWheelEventsForPan && !v9;
    if (!v11 && !-[ZWRootViewController carouselLockActive](self, "carouselLockActive")) {
      goto LABEL_15;
    }
  }

  if (!self->_inUnitTestingMode)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_2;
    block[3] = &unk_6CBE8;
    double v21 = v10;
    dispatch_async(&_dispatch_main_q, block);

    if (v9) {
      goto LABEL_15;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_21;
  }

  ((void (*)(void *))v10[2])(v10);
  if (!v9) {
    goto LABEL_18;
  }
LABEL_15:
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_3;
  v18[3] = &unk_6D2F8;
  BOOL v19 = v9;
  void v18[4] = self;
  v18[5] = a4;
  uint64_t v12 = objc_retainBlock(v18);
  uint64_t v13 = v12;
  if (self->_inUnitTestingMode)
  {
    ((void (*)(void *))v12[2])(v12);
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_4;
    v16[3] = &unk_6CBE8;
    double v17 = v12;
    dispatch_async(&_dispatch_main_q, v16);
  }

  BOOL v14 = 1;
LABEL_21:

  return v14;
}

uint64_t __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 904LL) = 0LL;
  return result;
}

uint64_t __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    [v3 _handleZoomWheelEventWithDelta:v4];
  }
  else {
    [v3 _handlePanWheelEventWithDelta:v4];
  }
  [*(id *)(a1 + 32) sendUserEventOccurred];
  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

uint64_t __65__ZWRootViewController_eventProcessor_didGetWheelEventWithDelta___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)eventProcessor:(id)a3 didGetPanEventWithDelta:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __63__ZWRootViewController_eventProcessor_didGetPanEventWithDelta___block_invoke;
  v4[3] = &unk_6CD58;
  v4[4] = self;
  void v4[5] = a4;
  dispatch_async(&_dispatch_main_q, v4);
}

id __63__ZWRootViewController_eventProcessor_didGetPanEventWithDelta___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) snarfingWheelEventsForPan];
  [*(id *)(a1 + 32) setSnarfingWheelEventsForPan:1];
  [*(id *)(a1 + 32) _handlePanWheelEventWithDelta:*(void *)(a1 + 40) animated:1 animationDuration:0.3];
  [*(id *)(a1 + 32) sendUserEventOccurred];
  [*(id *)(a1 + 32) _updateMinimapStatus];
  return [*(id *)(a1 + 32) setSnarfingWheelEventsForPan:v2];
}

- (void)eventProcessor:(id)a3 didReceiveKeyboardEventWithCommand:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __74__ZWRootViewController_eventProcessor_didReceiveKeyboardEventWithCommand___block_invoke;
  v4[3] = &unk_6CD58;
  v4[4] = self;
  void v4[5] = a4;
  AXPerformBlockOnMainThread(v4, a2, a3);
}

id __74__ZWRootViewController_eventProcessor_didReceiveKeyboardEventWithCommand___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeyboardCommand:*(void *)(a1 + 40) isRepeatCommand:0];
}

- (void)sendUserEventOccurred
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastEventTime > 1.5)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
    [v4 userEventOccurred];

    self->_lastEventTime = Current;
  }

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  -[ZWRootViewController setScrollBeganWhileSnarfingScrolls:]( self,  "setScrollBeganWhileSnarfingScrolls:",  (char *)-[ZWRootViewController lastKeyboardCommand](self, "lastKeyboardCommand") == (char *)&dword_C + 2);
  -[ZWRootViewController setLastScrollTrapOffset:](self, "setLastScrollTrapOffset:", 5000.0);
  objc_msgSend(v4, "setContentOffset:", 5000.0, 5000.0);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v9 = a3;
  if (-[ZWRootViewController scrollBeganWhileSnarfingScrolls](self, "scrollBeganWhileSnarfingScrolls"))
  {
    [v9 contentOffset];
    double v5 = v4;
    -[ZWRootViewController lastScrollTrapOffset](self, "lastScrollTrapOffset");
    double v7 = v5 - v6;
    [v9 contentOffset];
    -[ZWRootViewController setLastScrollTrapOffset:](self, "setLastScrollTrapOffset:", v8);
    -[ZWRootViewController _handleZoomWheelEventWithDelta:](self, "_handleZoomWheelEventWithDelta:", (uint64_t)v7);
  }
}

- (void)_handleZoomWheelEventWithDelta:(int64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v6 = 1.0;
  if (([v5 inStandbyMode] & 1) == 0)
  {
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
    double v6 = v7;
  }

  -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
  double v8 = (double)a3;
  double v10 = v6 * (v9 / (v9 - (double)a3));
  if (v10 < AXZoomMinimumZoomLevel) {
    double v10 = AXZoomMinimumZoomLevel;
  }
  -[ZWRootViewController setZoomFactorRespectingUserPreferredMaximumZoom:]( self,  "setZoomFactorRespectingUserPreferredMaximumZoom:",  v10);
  double v12 = v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned int v14 = [v13 inStandbyMode];

  CGSize v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  double v18 = v16;
  double v19 = v17;
  if (v14)
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoomCurrentLensEffect]);
    objc_msgSend( v15,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v21,  0,  0,  v12,  v18,  v19);
  }

  else
  {
    objc_msgSend( v15,  "updateZoomFactor:panOffset:animated:animationDuration:completion:",  0,  0,  v12,  v16,  v17,  -1.0);
  }

  self->_lastWheelDelta = v8;
}

- (void)_handlePanWheelEventWithDelta:(int64_t)a3
{
}

- (void)_handlePanWheelEventWithDelta:(int64_t)a3 animated:(BOOL)a4 animationDuration:(double)a5
{
  BOOL v5 = a4;
  double v7 = (double)a3 * 0.7;
  double v8 = (double)(uint64_t)v7 * 0.5 + self->_lastWheelDelta;
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  -[ZWRootViewController mirrorPanOffsetForRTLIfNecessary:](self, "mirrorPanOffsetForRTLIfNecessary:");
  double v10 = v9;
  double v12 = v11;
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  double v76 = v13;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  objc_msgSend(v14, "maximumPanOffsetWithZoomFactor:");
  double v16 = v15;
  double v18 = v17;

  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 view]);
  [v20 bounds];
  double v22 = v21;
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  double v24 = v22 / v23 * 0.67;

  if (-[ZWRootViewController _watchUIInverted](self, "_watchUIInverted")) {
    double v25 = -1.0;
  }
  else {
    double v25 = 1.0;
  }
  if (self->_isSweepingToNextZoomRow)
  {
    double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v26 view]);
    [v27 bounds];
    double v29 = v24 / v28;

    double v10 = v10 - v8 * 4.0;
    double v12 = v12 + v8 * v29 * 4.0;
    if (v8 <= 0.0)
    {
      double v31 = (double)(uint64_t)v7;
      double v30 = a5;
      if (v10 > v16)
      {
        double v32 = v10 - v16;
        double v10 = v10 - (v10 - v16);
LABEL_19:
        double v12 = v12 + v32 * v29;
        double v40 = v32 + self->_accruedOvershoot;
        self->_accruedOvershoot = v40;
        if (fabs(v40) > 60.0)
        {
          self->_isSweepingToNextZoomRow = 0;
          self->_accruedOvershoot = 0.0;
          self->_haveTriedScrollingDuringZoomSweep = 0;
        }
      }
    }

    else
    {
      double v31 = (double)(uint64_t)v7;
      double v30 = a5;
      if (v10 < -v16)
      {
        double v32 = v10 + v16;
        double v10 = v10 + v10 + v16;
        goto LABEL_19;
      }
    }

- (void)_handleKeyboardCommand:(int64_t)a3 isRepeatCommand:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a4) {
    -[AXDispatchTimer cancel](self->_keyRepeatTimer, "cancel");
  }
  if ((char *)-[ZWRootViewController lastKeyboardCommand](self, "lastKeyboardCommand") == (char *)&dword_0 + 3
    && -[ZWRootViewController toggleStandbyOnNextCommandChange](self, "toggleStandbyOnNextCommandChange"))
  {
    -[ZWRootViewController setToggleStandbyOnNextCommandChange:](self, "setToggleStandbyOnNextCommandChange:", 0LL);
    -[ZWRootViewController _toggleZoomStandby](self, "_toggleZoomStandby");
  }

  int64_t v7 = -[ZWRootViewController lastKeyboardCommand](self, "lastKeyboardCommand");
  if (v7 == 14)
  {
    self->_lastWheelDelta = 0.0;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController scrollTrapView](self, "scrollTrapView"));
    [v8 setAlpha:0.0];
  }

  switch(a3)
  {
    case 0LL:
      -[ZWRootViewController zoomFactor](self, "zoomFactor");
      double v32 = v31;
      double v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      unsigned int v34 = [v33 inStandbyMode];

      double v35 = AXZoomMinimumZoomLevel;
      if (!v34) {
        double v35 = v32;
      }
      int64_t v7 = (int64_t)-[ZWRootViewController fullscreenEventHandler:setZoomLevel:duration:]( self,  "fullscreenEventHandler:setZoomLevel:duration:",  0LL,  v35 * 1.1,  0.0);
      a3 = 0LL;
      goto LABEL_81;
    case 1LL:
      -[ZWRootViewController zoomFactor](self, "zoomFactor");
      int64_t v7 = (int64_t)-[ZWRootViewController fullscreenEventHandler:setZoomLevel:duration:]( self,  "fullscreenEventHandler:setZoomLevel:duration:",  0LL,  v36 * 0.9,  0.0);
      int v37 = 1;
      a3 = 1LL;
      goto LABEL_82;
    case 2LL:
      double v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController presentedViewController](self, "presentedViewController"));
      double v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController menuViewController](self, "menuViewController"));

      if (v38 == v39) {
        -[ZWRootViewController _dismissMenuAnimated:](self, "_dismissMenuAnimated:", 1LL);
      }
      int64_t v7 = (int64_t)-[ZWRootViewController _toggleZoomStandby](self, "_toggleZoomStandby");
      a3 = 2LL;
      goto LABEL_70;
    case 3LL:
      int64_t v7 = -[ZWRootViewController zoomIsAnimatingDueToStandbyToggle](self, "zoomIsAnimatingDueToStandbyToggle");
      if ((v7 & 1) == 0)
      {
        -[ZWRootViewController setToggleStandbyOnNextCommandChange:](self, "setToggleStandbyOnNextCommandChange:", 1LL);
        int64_t v7 = (int64_t)-[ZWRootViewController _toggleZoomStandby](self, "_toggleZoomStandby");
      }

      a3 = 3LL;
      goto LABEL_70;
    case 4LL:
    case 5LL:
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      unsigned __int8 v19 = [v18 inStandbyMode];

      if ((v19 & 1) != 0) {
        goto LABEL_70;
      }
      uint64_t v20 = AXZoomUserSelectableLensModes(v7);
      double v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      double v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeZoomMode](self, "activeZoomMode"));
      double v23 = (char *)[v21 indexOfObject:v22];

      if (a3 == 4)
      {
        if (v23 + 1 < [v21 count]) {
          double v24 = v23 + 1;
        }
        else {
          double v24 = 0LL;
        }
      }

      else if (v23)
      {
        double v24 = v23 - 1;
      }

      else
      {
        double v24 = (char *)[v21 count] - 1;
      }

      double v53 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndex:v24]);
      -[ZWRootViewController _transitionToLensForMode:animated:completion:]( self,  "_transitionToLensForMode:animated:completion:",  v53,  1LL,  0LL);

LABEL_69:
LABEL_70:
      int v37 = v4;
      goto LABEL_82;
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      unsigned __int8 v10 = [v9 inStandbyMode];

      if ((v10 & 1) != 0) {
        goto LABEL_70;
      }
      -[ZWRootViewController zoomFrame](self, "zoomFrame");
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      switch(a3)
      {
        case 6LL:
          if (v11 >= v12) {
            double v15 = v11;
          }
          else {
            double v15 = v12;
          }
          double v16 = CGPointZero.x + v15 / -5.0;
          if (v16 >= v11 * -0.5) {
            double x = v16;
          }
          else {
            double x = v11 * -0.5;
          }
          break;
        case 7LL:
          if (v11 >= v12) {
            double v45 = v11;
          }
          else {
            double v45 = v12;
          }
          double v46 = CGPointZero.x + v45 / 5.0;
          if (v46 >= v11 * 0.5) {
            double x = v11 * 0.5;
          }
          else {
            double x = v46;
          }
          break;
        case 8LL:
          if (v11 >= v12) {
            double v47 = v11;
          }
          else {
            double v47 = v12;
          }
          double v48 = y + v47 / -5.0;
          if (v48 >= v12 * -0.5) {
            double y = v48;
          }
          else {
            double y = v12 * -0.5;
          }
          break;
        case 9LL:
          if (v11 >= v12) {
            double v49 = v11;
          }
          else {
            double v49 = v12;
          }
          double v50 = y + v49 / 5.0;
          if (v50 >= v12 * 0.5) {
            double y = v12 * 0.5;
          }
          else {
            double y = v50;
          }
          break;
        default:
          break;
      }

      double v51 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      int v37 = 1;
      -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:]( self,  "_moveZoomItemWithController:byDelta:animated:userInitiated:shouldUseFullDeltaForDockedMode:shouldPan:",  v51,  0LL,  1LL,  1LL,  1LL,  x,  y);

      double v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      [v52 zoomMovementDidEnd];

      goto LABEL_82;
    case 10LL:
    case 11LL:
    case 12LL:
    case 13LL:
      double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      if (![v17 inStandbyMode])
      {
        double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

        if (v25 == v26) {
          goto LABEL_81;
        }
        double v27 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        double v28 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

        if (v27 != v28)
        {
LABEL_27:
          -[ZWRootViewController _lensMinimumSize](self, "_lensMinimumSize");
          switch(a3)
          {
            case 10LL:
              goto LABEL_78;
            case 11LL:
              goto LABEL_76;
            case 12LL:
              goto LABEL_46;
            case 13LL:
              goto LABEL_74;
            default:
              double v29 = CGPointZero.x;
              double v30 = CGPointZero.y;
              goto LABEL_79;
          }
        }

        double v41 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
        id v42 = [v41 dockPosition];

        if (v42)
        {
          double v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
          double v44 = (char *)[v43 dockPosition];

          if (v44 != (_BYTE *)&dword_0 + 2) {
            goto LABEL_27;
          }
          if (a3 == 12)
          {
            -[ZWRootViewController _lensMinimumSize](self, "_lensMinimumSize");
LABEL_78:
            double v30 = 0.0;
LABEL_79:
            a3 = 10LL;
          }

          else
          {
            if (a3 != 10) {
              goto LABEL_27;
            }
            -[ZWRootViewController _lensMinimumSize](self, "_lensMinimumSize");
LABEL_46:
            double v29 = -v29;
            double v30 = 0.0;
            a3 = 12LL;
          }
        }

        else if (a3 == 13)
        {
          -[ZWRootViewController _lensMinimumSize](self, "_lensMinimumSize");
LABEL_76:
          double v29 = 0.0;
          a3 = 11LL;
        }

        else
        {
          if (a3 != 11) {
            goto LABEL_27;
          }
          -[ZWRootViewController _lensMinimumSize](self, "_lensMinimumSize");
LABEL_74:
          double v30 = -v30;
          double v29 = 0.0;
          a3 = 13LL;
        }

        int64_t v7 = (int64_t)-[ZWRootViewController _resizeZoomLensWithAdjustment:lensPositionCompensation:]( self,  "_resizeZoomLensWithAdjustment:lensPositionCompensation:",  v29,  v30,  v29 * -0.5,  v30 * -0.5);
        goto LABEL_81;
      }

LABEL_81:
      int v37 = 1;
LABEL_82:
      int v54 = _AXSKeyRepeatEnabled(v7);
      if (v37 && v54)
      {
        if (v4) {
          _AXSKeyRepeatInterval();
        }
        else {
          double v55 = _AXSKeyRepeatDelay();
        }
        double v56 = v55;
        double v57 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController keyRepeatTimer](self, "keyRepeatTimer"));
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke;
        v59[3] = &unk_6CD58;
        v59[4] = self;
        v59[5] = a3;
        [v57 afterDelay:v59 processBlock:v56];
      }

      unsigned int v58 = -[ZWRootViewController shouldSuppressKeyCommandHUD](self, "shouldSuppressKeyCommandHUD");
      -[ZWRootViewController setShouldSuppressKeyCommandHUD:](self, "setShouldSuppressKeyCommandHUD:", a3 != 16);
      if (v58 != -[ZWRootViewController shouldSuppressKeyCommandHUD](self, "shouldSuppressKeyCommandHUD")) {
        -[ZWRootViewController _updateZoomListeners](self, "_updateZoomListeners");
      }
      -[ZWRootViewController setLastKeyboardCommand:](self, "setLastKeyboardCommand:", a3);
      return;
    case 14LL:
      double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController scrollTrapView](self, "scrollTrapView"));
      [v40 setAlpha:0.01];

      a3 = 14LL;
      goto LABEL_70;
    case 15LL:
    case 16LL:
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController keyRepeatTimer](self, "keyRepeatTimer"));
      [v21 cancel];
      goto LABEL_69;
    default:
      goto LABEL_70;
  }

id __63__ZWRootViewController__handleKeyboardCommand_isRepeatCommand___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleKeyboardCommand:*(void *)(a1 + 40) isRepeatCommand:1];
}

- (CGPoint)mirrorPanOffsetForRTLIfNecessary:(CGPoint)a3
{
  CGFloat y = a3.y;
  double x = a3.x;
  BOOL v5 = (char *)[UIApp userInterfaceLayoutDirection];
  double v6 = -x;
  if (v5 != (_BYTE *)&dword_0 + 1) {
    double v6 = x;
  }
  double v7 = y;
  result.CGFloat y = v7;
  result.double x = v6;
  return result;
}

- (void)lastFingerWasLiftedWithEventProcessor:(id)a3 firstTouchWentIntoSlug:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

void __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) idleTouchTimer]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_2;
  v7[3] = &unk_6CBC0;
  v7[4] = *(void *)(a1 + 32);
  [v2 afterDelay:v7 processBlock:2.0];

  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) presentedViewController]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menuViewController]);

  if (v3 != v4)
  {
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cachedValuesSerialQueue]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_3;
    v6[3] = &unk_6CBC0;
    void v6[4] = *(void *)(a1 + 32);
    dispatch_sync(v5, v6);
  }

void __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_2( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) slugViewController]);
  [v2 userInteractionHasBecomeIdle];

  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v3 userInteractionHasBecomeIdle];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) menuViewController]);
  [v4 userInteractionHasBecomeIdle];
}

__n128 __85__ZWRootViewController_lastFingerWasLiftedWithEventProcessor_firstTouchWentIntoSlug___block_invoke_3( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 80LL;
  __n128 result = (__n128)CGRectNull.origin;
  CGSize size = CGRectNull.size;
  *(CGPoint *)(v1 + 96) = CGRectNull.origin;
  *(CGSize *)(v1 + 112) = size;
  return result;
}

- (void)didGetToggleZoomGestureWithEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __66__ZWRootViewController_didGetToggleZoomGestureWithEventProcessor___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

id __66__ZWRootViewController_didGetToggleZoomGestureWithEventProcessor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleZoomStandby];
}

- (void)didGetTogglePanningModeGestureWithATVEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __76__ZWRootViewController_didGetTogglePanningModeGestureWithATVEventProcessor___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

id __76__ZWRootViewController_didGetTogglePanningModeGestureWithATVEventProcessor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleStealingSingleFingerPanning];
}

- (void)wantsToStartAutopannerWithATVEventProcessor:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __68__ZWRootViewController_wantsToStartAutopannerWithATVEventProcessor___block_invoke;
  v4[3] = &unk_6D008;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

void __68__ZWRootViewController_wantsToStartAutopannerWithATVEventProcessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensAutopanner]);
  [v3 setDataSource:v2];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensAutopanner]);
  [v4 start];
}

- (void)wantsToStopAutopannerWithATVEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __67__ZWRootViewController_wantsToStopAutopannerWithATVEventProcessor___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

void __67__ZWRootViewController_wantsToStopAutopannerWithATVEventProcessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensAutopanner]);
  [v2 stop];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lensAutopanner]);
  [v3 setDataSource:0];
}

- (void)didGetSpeakContentGestureWithATVEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __71__ZWRootViewController_didGetSpeakContentGestureWithATVEventProcessor___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

void __71__ZWRootViewController_didGetSpeakContentGestureWithATVEventProcessor___block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) smartZoom]);
  [v1 speakContent];
}

- (void)atvEventProcessor:(id)a3 adjustZoomLevelWithDelta:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __67__ZWRootViewController_atvEventProcessor_adjustZoomLevelWithDelta___block_invoke;
  block[3] = &unk_6CC98;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async(&_dispatch_main_q, block);
}

id __67__ZWRootViewController_atvEventProcessor_adjustZoomLevelWithDelta___block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_handleZoomLevelAdjustmentViaGesture:",  *(double *)(a1 + 40),  *(double *)(a1 + 48));
}

- (BOOL)shouldSendTapEventWithATVEventProcessor:(id)a3
{
  if (-[ZWRootViewController _isZoomedToMinimum](self, "_isZoomedToMinimum", a3)
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController")),
        unsigned __int8 v5 = [v4 inStandbyMode],
        v4,
        (v5 & 1) != 0)
    || -[ZWRootViewController _smartZoomFocusedElementIsBeingSampled](self, "_smartZoomFocusedElementIsBeingSampled"))
  {
    LOBYTE(v6) = 1;
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController smartZoom](self, "smartZoom"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lensZoomView]);
    [v10 sampleRect];
    unsigned int v6 = objc_msgSend(v8, "setNativeFocusOnBestElementNearRect:") ^ 1;
  }

  return v6;
}

- (void)blockHomeGestureIfNeededWithEventProcessor:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController disableHomeGestureAssertion](self, "disableHomeGestureAssertion", a3));

  if (!v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableSystemGestures,  @"Interacting with Zoom UI"));
    -[ZWRootViewController setDisableHomeGestureAssertion:](self, "setDisableHomeGestureAssertion:", v5);
  }

- (void)didGetTouchOutsideZoomMenuWithEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __69__ZWRootViewController_didGetTouchOutsideZoomMenuWithEventProcessor___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

id __69__ZWRootViewController_didGetTouchOutsideZoomMenuWithEventProcessor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissMenuAnimated:1];
}

- (void)didGetTouchOutsideLensChromeWithEventProcessor:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __71__ZWRootViewController_didGetTouchOutsideLensChromeWithEventProcessor___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

id __71__ZWRootViewController_didGetTouchOutsideLensChromeWithEventProcessor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPIPLensResizingEnabled:0];
}

- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerDoubleTapAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[ZWRootViewController _dismissMenuAnimated:](self, "_dismissMenuAnimated:", 1LL);
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  double v8 = v7;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned int v10 = [v9 inStandbyMode];
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v9 == v11 && vabdd_f64(v8, AXZoomMinimumZoomLevel) < 0.0001)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    [v12 zoomFactor];
    double v8 = v13;

    if (-[ZWRootViewController _isZoomFactorAtMinimum:](self, "_isZoomFactorAtMinimum:", v8)) {
      double v8 = AXZoomDefaultZoomLevel;
    }
    unsigned int v10 = 1;
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  double v15 = ZWConvertPointInScreenPixelsToViewCoordinates(v14, x, y);
  double v17 = v16;

  if (!v10)
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

    if (v9 == v18)
    {
      -[ZWRootViewController setZoomFactorRespectingUserPreferredMaximumZoom:]( self,  "setZoomFactorRespectingUserPreferredMaximumZoom:",  v8);
      double v32 = v31;
      double v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v33 zoomCurrentLensEffect]);

      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke;
      v45[3] = &unk_6CBC0;
      v45[4] = self;
      objc_msgSend( v34,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  v22,  1,  v45,  v32,  v35,  v36);

      int v37 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
      [v37 setZoomInStandby:1];

      double v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
      double v39 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController minimapView](self, "minimapView"));
      [v38 bringSubviewToFront:v39];

      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController kbContext](self, "kbContext"));
      [v23 keyboardFrame];
      -[ZWRootViewController _updateKeyboardFrame:](self, "_updateKeyboardFrame:");
    }

    else
    {
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

      if (v9 == v19)
      {
        double v40 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v40 zoomCurrentLensEffect]);

        double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        uint64_t v25 = [v24 inStandbyMode] ^ 1;
        -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
        double v27 = v41;
        double v29 = v42;
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_2;
        v44[3] = &unk_6CBC0;
        v44[4] = self;
        double v30 = v44;
      }

      else
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

        if (v9 != v20) {
          goto LABEL_16;
        }
        double v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoomCurrentLensEffect]);

        double v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        uint64_t v25 = [v24 inStandbyMode] ^ 1;
        -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
        double v27 = v26;
        double v29 = v28;
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_3;
        v43[3] = &unk_6CBC0;
        v43[4] = self;
        double v30 = v43;
      }

      objc_msgSend( v23,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  v25,  v22,  1,  v30,  v8,  v27,  v29);
    }

    goto LABEL_16;
  }

  -[ZWRootViewController zoomInToPoint:withZoomFactor:animated:]( self,  "zoomInToPoint:withZoomFactor:animated:",  1LL,  v15,  v17,  v8);
LABEL_16:
}

id __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

id __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

id __88__ZWRootViewController_fullscreenEventHandler_didReceiveThreeFingerDoubleTapAtLocation___block_invoke_3( uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerTripleTapAtLocation:(CGPoint)a4
{
  if ((AXDeviceIsTV(self, a2, a3, (__n128)a4, *(__n128 *)&a4.y) & 1) == 0) {
    -[ZWRootViewController toggleZoomMenu](self, "toggleZoomMenu");
  }
}

- (void)_updateOrbLocation:(CGPoint)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  double v9 = (void (**)(void))a5;
  *((_WORD *)&self->_eventUIContext + 148) |= 0x200u;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
  [v10 setShouldHideWhileOrbing:1];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v11 == v12)
  {
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController screen](self, "screen"));
    [v33 scale];
    double v35 = ZWConvertPointInScreenPixelsToScreenCoordinates(x, y, v34);
    double v37 = v36;

    double v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    double v39 = (void *)objc_claimAutoreleasedReturnValue([v38 lensChromeView]);
    [v39 bounds];
    double v41 = v40 * 0.5 - ZWZoomEdgeSlackAmount();

    double v42 = v37 - v41;
    if ((*((_WORD *)&self->_eventUIContext + 148) & 0x400) != 0)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = __63__ZWRootViewController__updateOrbLocation_animated_completion___block_invoke;
      v48[3] = &unk_6D320;
      v48[4] = self;
      double v50 = v35;
      double v51 = v42;
      __asm { FMOV            V0.2D, #2.0 }

      __int128 v52 = _Q0;
      double v49 = v9;
      -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:]( self,  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  0LL,  1LL,  v5,  v48,  v35,  v42,  2.0,  2.0);
    }

    else
    {
      -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:]( self,  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  1LL,  1LL,  v5,  v9,  v35,  v42,  2.0,  2.0);
    }
  }

  else
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
    double v14 = ZWConvertPointInScreenPixelsToViewCoordinates(v13, x, y);
    double v16 = v15;

    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);
    [v18 frame];
    double Center = AX_CGRectGetCenter(v19, v20, v21, v22);
    double v25 = v24;

    double v26 = (v14 - Center) * 3.5;
    double v27 = (v16 - v25) * 3.5;
    -[ZWRootViewController lastOrbLocation](self, "lastOrbLocation");
    double v29 = v28;
    -[ZWRootViewController lastOrbLocation](self, "lastOrbLocation");
    double v31 = v30;
    -[ZWRootViewController setLastOrbLocation:](self, "setLastOrbLocation:", v26, v27);
    if ((*((_WORD *)&self->_eventUIContext + 148) & 0x400) == 0)
    {
      double v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:]( self,  "_moveZoomItemWithController:byDelta:animated:userInitiated:",  v32,  0LL,  1LL,  v26 - v29,  v27 - v31);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

uint64_t __63__ZWRootViewController__updateOrbLocation_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [*(id *)(a1 + 32) zoomFactor];
  objc_msgSend( v2,  "offsetByPanningToRect:zoomFactor:",  *(double *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64),  *(double *)(a1 + 72),  v3);
  objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:");

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fullscreenEventHandler:(id)a3 didStartOrbAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  *((_WORD *)&self->_eventUIContext + 148) |= 0x400u;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  -[ZWRootViewController _transitionToLens:animated:completion:]( self,  "_transitionToLens:animated:completion:",  v7,  1LL,  &__block_literal_global_5);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v8 == v9)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    [v10 setOffsetZoomWindow:1];
  }

  double v11 = CGPointZero.y;
  -[ZWRootViewController setLastOrbLocation:](self, "setLastOrbLocation:", CGPointZero.x, v11);
  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", CGPointZero.x, v11);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoomCurrentLensEffect]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_2;
  v15[3] = &unk_6D008;
  v15[4] = self;
  id v16 = v13;
  id v14 = v13;
  -[ZWRootViewController _updateOrbLocation:animated:completion:]( self,  "_updateOrbLocation:animated:completion:",  0LL,  v15,  x,  y);
}

void __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [v3 zoomFactor];
  double v5 = v4;
  [*(id *)(a1 + 32) zoomPanOffset];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_3;
  v9[3] = &unk_6CBC0;
  uint64_t v6 = *(void *)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  objc_msgSend( v2,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v6,  1,  v9,  v5,  v7,  v8);
}

uint64_t __69__ZWRootViewController_fullscreenEventHandler_didStartOrbAtLocation___block_invoke_3( uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 376LL) &= ~0x400u;
  return result;
}

- (void)fullscreenEventHandler:(id)a3 didEndOrbAtLocation:(CGPoint)a4
{
  *((_WORD *)&self->_eventUIContext + 148) &= ~0x200u;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController slugViewController](self, "slugViewController", a3, a4.x, a4.y));
  [v5 setShouldHideWhileOrbing:0];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoomCurrentLensEffect]);

  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  double v10 = v9;
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __67__ZWRootViewController_fullscreenEventHandler_didEndOrbAtLocation___block_invoke;
  v16[3] = &unk_6CBC0;
  void v16[4] = self;
  objc_msgSend( v6,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  1,  v8,  1,  v16,  v10,  v11,  v12);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

  if (v13 == v14)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    [v15 setOffsetZoomWindow:0];
  }
}

id __67__ZWRootViewController_fullscreenEventHandler_didEndOrbAtLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)fullscreenEventHandler:(id)a3 updateOrbMovementAtLocation:(CGPoint)a4
{
  if ((*((_WORD *)&self->_eventUIContext + 148) & 0x400) == 0) {
    -[ZWRootViewController _updateOrbLocation:animated:completion:]( self,  "_updateOrbLocation:animated:completion:",  1LL,  0LL,  a4.x,  a4.y);
  }
}

- (void)fullscreenEventHandler:(id)a3 didThreeFingerOrbAtLocation:(CGPoint)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3, a4.x, a4.y));
  unsigned int v6 = [v5 zoomPeekZoomEnabled];
  char v7 = v6;
  uint64_t v8 = v6 ^ 1;

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v9 setZoomPeekZoomEnabled:v8];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController zoomAlertManager](self, "zoomAlertManager"));
  id v11 = v10;
  if ((v7 & 1) != 0) {
    [v10 showOrbZoomToggleOff];
  }
  else {
    [v10 showOrbZoomToggleOn];
  }
}

- (void)fullscreenEventHandler:(id)a3 didReceiveThreeFingerSingleTapAtLocation:(CGPoint)a4
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3, a4.x, a4.y));
  if ([v8 inStandbyMode])
  {
  }

  else
  {
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
    double v6 = v5;
    double v7 = AXZoomMinimumZoomLevel;

    if (v6 > v7) {
      -[ZWRootViewController _updateMinimapStatus](self, "_updateMinimapStatus");
    }
  }

- (void)fullscreenEventHandler:(id)a3 didReceiveOneFingerDownAtLocation:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke;
  block[3] = &unk_6CC98;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async(&_dispatch_main_q, block);
}

void __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke( uint64_t a1)
{
  id v13 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  if (v13 == v2)
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
    unsigned int v4 = [v3 zoomRegionVisible];

    if (v4)
    {
      objc_msgSend( *(id *)(a1 + 32),  "_denormalizePointForCurrentOrientation:",  *(double *)(a1 + 40),  *(double *)(a1 + 48));
      double v6 = v5;
      double v8 = v7;
      double v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dockedLensView]);
      [v10 frame];
      v15.double x = v6;
      v15.double y = v8;
      BOOL v11 = CGRectContainsPoint(v16, v15);

      if (!v11)
      {
        +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_2;
        v14[3] = &unk_6CBC0;
        v14[4] = *(void *)(a1 + 32);
        +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v14);
        double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
        objc_msgSend(v12, "interceptFingerDownAtLocation:", v6, v8);

        +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
      }
    }
  }

  else
  {
  }

void __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_2( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(dispatch_queue_s **)(v1 + 1152);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_3;
  block[3] = &unk_6CBC0;
  void block[4] = v1;
  dispatch_sync(v2, block);
}

void __81__ZWRootViewController_fullscreenEventHandler_didReceiveOneFingerDownAtLocation___block_invoke_3( uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  else {
    __int16 v2 = 0;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 376LL) = *(_WORD *)(*(void *)(a1 + 32) + 376LL) & 0xFFBF | v2;
}

- (double)zoomLevelWithFullscreenEventHandler:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  unsigned int v5 = [v4 inStandbyMode];

  if (v5) {
    return AXZoomMinimumZoomLevel;
  }
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  return result;
}

- (void)fullscreenEventHandler:(id)a3 setZoomLevel:(double)a4 duration:(double)a5
{
  double x = v7;
  double y = v9;
  if (vabdd_f64(a4, AXZoomMinimumZoomLevel) <= 0.0001 || AXZoomMinimumZoomLevel >= a4)
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", CGPointZero.x, y);
  }

  -[ZWRootViewController setZoomFactorRespectingUserPreferredMaximumZoom:]( self,  "setZoomFactorRespectingUserPreferredMaximumZoom:",  a4);
  double v13 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  if ([v14 inStandbyMode])
  {
    CGPoint v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    CGRect v16 = (void *)objc_claimAutoreleasedReturnValue([v15 zoomCurrentLensEffect]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = __69__ZWRootViewController_fullscreenEventHandler_setZoomLevel_duration___block_invoke;
    v17[3] = &unk_6CBC0;
    v17[4] = self;
    objc_msgSend( v14,  "updateStandbyMode:zoomFactor:panOffset:lensEffect:animated:completion:",  0,  v16,  0,  v17,  v13,  x,  y);
  }

  else
  {
    objc_msgSend(v14, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 0, 0, v13, x, y, -1.0);
  }
}

id __69__ZWRootViewController_fullscreenEventHandler_setZoomLevel_duration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSystemGestureDisablingAssertions];
}

- (void)fullscreenEventHandler:(id)a3 updateZoomMovementWithPoint:(CGPoint)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __75__ZWRootViewController_fullscreenEventHandler_updateZoomMovementWithPoint___block_invoke;
  block[3] = &unk_6CC98;
  void block[4] = self;
  CGPoint v5 = a4;
  dispatch_async(&_dispatch_main_q, block);
}

void __75__ZWRootViewController_fullscreenEventHandler_updateZoomMovementWithPoint___block_invoke( uint64_t a1)
{
  id v32 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  [*(id *)(a1 + 32) _dismissMenuAnimated:1];
  __int16 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 window]);
  objc_msgSend(v3, "_convertPointFromSceneReferenceSpace:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v5 = v4;
  double v7 = v6;

  *(_BYTE *)(*(void *)(a1 + 32) + 688LL) = 1;
  double v8 = v5 / ZOTMainScreenScaleFactor();
  double v9 = v7 / ZOTMainScreenScaleFactor();
  double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
  if (v10 == v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dockedLensViewController]);
    unsigned int v13 = [v12 zoomRegionVisible];

    if (v13)
    {
      double v8 = -v8;
      double v9 = -v9;
    }
  }

  else
  {
  }

  [*(id *)(a1 + 32) zoomFactor];
  double v15 = v14;
  [*(id *)(a1 + 32) zoomPanOffset];
  double v18 = *(double **)(a1 + 32);
  double v19 = v18[87];
  double v20 = v18[88];
  if (CGPointZero.x != v19 || CGPointZero.y != v20)
  {
    double v22 = (v20 - v9) / v15;
    double v23 = (v19 - v8) / v15 + v18[89];
    double v24 = v22 + v18[90];
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v18 activeLensViewController]);
    objc_msgSend(v25, "validPanOffsetForProposedOffset:proposedZoomFactor:", v23, v24, v15);
    double v27 = v26;
    double v29 = v28;

    double v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
    objc_msgSend(v30, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0, v23, v24, v27, v29);

    objc_msgSend(*(id *)(a1 + 32), "setZoomPanOffset:", v27, v29);
    double v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
    objc_msgSend(v31, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 1, 0, v15, v27, v29, 0.1);

    *(_BYTE *)(*(void *)(a1 + 32) + 688LL) = 0;
LABEL_10:
    [*(id *)(a1 + 32) _updateMinimapStatus];
    goto LABEL_11;
  }

  v18[87] = v8;
  v18[88] = v9;
  double v21 = (void *)(*(void *)(a1 + 32) + 712LL);
  void *v21 = v16;
  v21[1] = v17;
LABEL_11:
}

- (BOOL)isZoomMovingWithVelocityWithFullscreenEventHandler:(id)a3
{
  return self->_fullScreenZoomVelocity > 0.0;
}

- (void)stopZoomMovementWithVelocityWithFullscreenEventHandler:(id)a3
{
  movementTimer = self->_movementTimer;
  if (movementTimer)
  {
    -[CADisplayLink invalidate](movementTimer, "invalidate", a3);
    double v5 = self->_movementTimer;
    self->_movementTimer = 0LL;
  }

  self->_fullScreenZoomVelocitdouble y = 0.0;
  -[ZWRootViewController _updateSystemGestureDisablingAssertions](self, "_updateSystemGestureDisablingAssertions", a3);
}

- (void)endZoomMovementWithFullscreenEventHandler:(id)a3
{
  self->_fullScreenZoomStartPosition = CGPointZero;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  [v3 zoomMovementDidEnd];
}

- (void)fullscreenEventHandler:(id)a3 continueZoomMovementWithVelocity:(double)a4 angle:(double)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __86__ZWRootViewController_fullscreenEventHandler_continueZoomMovementWithVelocity_angle___block_invoke;
  v8[3] = &unk_6D368;
  v8[4] = self;
  id v9 = a3;
  double v10 = a4;
  double v11 = a5;
  id v7 = v9;
  dispatch_async(&_dispatch_main_q, v8);
}

void __86__ZWRootViewController_fullscreenEventHandler_continueZoomMovementWithVelocity_angle___block_invoke( uint64_t a1)
{
  id v16 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  if (([v16 inStandbyMode] & 1) == 0)
  {
    [*(id *)(a1 + 32) stopZoomMovementWithVelocityWithFullscreenEventHandler:*(void *)(a1 + 40)];
    if (*(double *)(a1 + 48) >= 125.0)
    {
      id v2 = [*(id *)(a1 + 32) _interfaceAwareAdjustedAngleForScreenAngle:*(double *)(a1 + 56)];
      double v4 = v3;
      BOOL v5 = 1;
      *(_BYTE *)(*(void *)(a1 + 32) + 688LL) = 1;
      uint64_t v6 = *(void *)(a1 + 32) + 736LL;
      *(double *)uint64_t v6 = ZOTCalculateDistanceForAngle((uint64_t)v2, v7, v3);
      *(void *)(v6 + 8) = v8;
      *(double *)(*(void *)(a1 + 32) + 728LL) = ZOTNormalizeVelocity(*(double *)(a1 + 48));
      if (v4 <= 60.0 || v4 >= 120.0) {
        BOOL v5 = v4 < 300.0 && v4 > 240.0;
      }
      *(_BYTE *)(*(void *)(a1 + 32) + 753LL) = v5;
      BOOL v10 = 1;
      if (v4 >= 30.0 && v4 <= 330.0)
      {
        BOOL v10 = v4 > 150.0;
        if (v4 >= 210.0) {
          BOOL v10 = 0;
        }
      }

      *(_BYTE *)(*(void *)(a1 + 32) + 752LL) = v10;
      *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 760LL) = CFAbsoluteTimeGetCurrent();
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  *(void *)(a1 + 32),  "_zoomMovementHeartbeat"));
      uint64_t v12 = *(void *)(a1 + 32);
      unsigned int v13 = *(void **)(v12 + 768);
      *(void *)(v12 + 768) = v11;

      double v14 = *(void **)(*(void *)(a1 + 32) + 768LL);
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      [v14 addToRunLoop:v15 forMode:NSRunLoopCommonModes];

      *(_BYTE *)(*(void *)(a1 + 32) + 688LL) = 0;
    }
  }
}

- (double)storedZoomLevelWithFullscreenEventHandler:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance", a3));
  [v3 zoomFactor];
  double v5 = v4;

  return v5;
}

- (CGPoint)zoomLocationWithFullscreenEventHandler:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance", a3));
  [v3 zoomPanOffset];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)fullscreenEventHandler:(id)a3 storeZoomLevel:(double)a4 location:(CGPoint)a5 zoomed:(BOOL)a6 forKey:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[ZWCoalescedSettings sharedInstance]( &OBJC_CLASS___ZWCoalescedSettings,  "sharedInstance",  a3,  a6,  a7,  a4));
  unsigned __int8 v11 = [v10 zoomInStandby];

  if ((v11 & 1) == 0)
  {
    -[ZWRootViewController zoomFactor](self, "zoomFactor");
    unsigned int v12 = -[ZWRootViewController _isZoomFactorAtMinimum:](self, "_isZoomFactorAtMinimum:");
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
    double v14 = v13;
    if (v12)
    {
      [v13 setZoomInStandby:1];
    }

    else
    {
      [v13 setZoomInStandby:0];

      -[ZWRootViewController zoomFactor](self, "zoomFactor");
      double v16 = v15;
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
      [v14 setZoomFactor:v16];
    }
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue(+[ZWCoalescedSettings sharedInstance](&OBJC_CLASS___ZWCoalescedSettings, "sharedInstance"));
  objc_msgSend(v17, "setZoomPanOffset:", x, y);
}

- (void)setGutterDistanceForUnitTests:(double)a3 scaleFactor:(double)a4
{
  if (self->_inUnitTestingMode)
  {
    ZOTSetGutterDistanceForUnitTests(a3);
    ZOTSetUnitTestScaleFactor(a4);
  }

- (BOOL)usingRelativePushPanningWithFullscreenEventHandler:(id)a3
{
  return self->_usingRelativePushPanning;
}

- (void)fullscreenEventHandler:(id)a3 setUsingRelativePushPanning:(BOOL)a4
{
  self->_usingRelativePushPanning = a4;
}

- (BOOL)fullscreenEventHandler:(id)a3 autopanWithLocation:(CGPoint)a4 initialSingleFingerLocation:(CGPoint)a5 distance:(double)a6 animationDuration:(double)a7 useGutterDistance:(BOOL)a8 pointHasBeenMapped:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  double y = a5.y;
  CGFloat x = a5.x;
  double v15 = a4.y;
  double v16 = a4.x;
  id v18 = a3;
  double v112 = a7;
  double v114 = x;
  if (v9)
  {
    -[ZWRootViewController zoomFrame](self, "zoomFrame");
    double v20 = v19;
    double v22 = v21;
    double width = v23;
    double height = v25;
    -[ZWRootViewController zoomFrame](self, "zoomFrame");
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:]( self,  "_denormalizePoint:withRespectToFrame:",  v16,  v15,  v27,  v28,  v29,  v30);
  }

  else
  {
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

    if (v33 == v34)
    {
      -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
      double width = v39;
      double height = v40;
      -[ZWRootViewController _denormalizePointForCurrentOrientation:]( self,  "_denormalizePointForCurrentOrientation:",  v16,  v15);
      double v16 = v41;
      double v15 = v42;
      double v20 = 0.0;
      double v22 = 0.0;
      goto LABEL_12;
    }

    double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

    if (v35 == v36)
    {
      double v43 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
      double v44 = (void *)objc_claimAutoreleasedReturnValue([v43 view]);
      double v45 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
      double v46 = (void *)objc_claimAutoreleasedReturnValue([v45 view]);
      [v46 bounds];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      double v55 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
      objc_msgSend(v44, "convertRect:toView:", v55, v48, v50, v52, v54);
      double v57 = v56;
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;

      double v20 = UIRectInset(v57, v59, v61, v63, 18.0, 18.0, 18.0, 18.0);
      double v22 = v64;
      double width = v65;
      double height = v66;
    }

    else
    {
      double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      double v38 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

      if (v37 != v38)
      {
        double v20 = CGRectZero.origin.x;
        double v22 = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        goto LABEL_12;
      }

      CGRect v67 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
      CGRect v68 = (void *)objc_claimAutoreleasedReturnValue([v67 dockedLensView]);
      [v68 frame];
      double v20 = v69;
      double v22 = v70;
      double width = v71;
      double height = v72;
    }

    -[ZWRootViewController _denormalizePointForCurrentOrientation:]( self,  "_denormalizePointForCurrentOrientation:",  v16,  v15,  *(void *)&v112);
  }

  double v16 = v31;
  double v15 = v32;
LABEL_12:
  int v73 = ZOTScreenRegionForPoint(v10, v16, v15, v20, v22, width, height);
  if (self->_usingRelativePushPanning) {
    int v73 = ZOTScreenRegionForRelativePushPan( (uint64_t)-[ZWRootViewController interfaceOrientation](self, "interfaceOrientation"),  v16,  v15,  v114,  y);
  }
  if (v73)
  {
    double v74 = CGPointZero.y;
    if ((v73 & 4) != 0) {
      double v75 = a6;
    }
    else {
      double v75 = 0.0;
    }
    double v76 = v74 - v75;
    double v77 = v74 + a6;
    if ((v73 & 8) != 0) {
      char v78 = 1;
    }
    else {
      char v78 = (v73 & 4) >> 2;
    }
    if ((v73 & 8) != 0) {
      double v79 = v77;
    }
    else {
      double v79 = v76;
    }
    if ((v73 & 1) != 0) {
      double v80 = a6;
    }
    else {
      double v80 = 0.0;
    }
    double v81 = CGPointZero.x - v80;
    double v82 = CGPointZero.x + a6;
    if ((v73 & 2) != 0) {
      char v83 = 1;
    }
    else {
      char v83 = v73 & 1;
    }
    if ((v73 & 2) != 0) {
      double v84 = CGPointZero.x + a6;
    }
    else {
      double v84 = v81;
    }
    -[ZWRootViewController zoomFactor](self, "zoomFactor", v82, *(void *)&v112);
    double v86 = v85;
    -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
    double v88 = v84 + v87;
    double v90 = v79 + v89;
    CGFloat v91 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    objc_msgSend(v91, "validPanOffsetForProposedOffset:proposedZoomFactor:", v88, v90, v86);
    double v93 = v92;
    double v95 = v94;

    id v96 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    objc_msgSend(v96, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 1, v88, v90, v93, v95);

    double v97 = vabdd_f64(v93, v88);
    double v98 = vabdd_f64(v95, v90);
    double v99 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    objc_msgSend(v99, "offsetByPanningWithDelta:axis:zoomFactor:", 6, v84, v79, v86);
    double v101 = v100;
    double v103 = v102;

    -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
    BOOL v106 = v101 == v105 && v103 == v104;
    if (!v106
      || (CGRect v107 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController")),
          CGRect v108 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController")),
          v108,
          v107,
          v107 == v108))
    {
      -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v101, v103);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke_2;
      block[3] = &unk_6CF00;
      void block[4] = self;
      *(double *)&void block[5] = v86;
      *(double *)&void block[6] = v101;
      *(double *)&void block[7] = v103;
      block[8] = v113;
      CGRect v109 = block;
    }

    else
    {
      v116[0] = _NSConcreteStackBlock;
      v116[1] = 3221225472LL;
      v116[2] = __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke;
      v116[3] = &unk_6CC98;
      v116[4] = self;
      *(double *)&v116[5] = v84;
      *(double *)&v116[6] = v79;
      CGRect v109 = v116;
    }

    dispatch_async(&_dispatch_main_q, v109);
    BOOL v110 = v83 & (v97 < 2.22044605e-16) | v78 & (v98 < 2.22044605e-16);
  }

  else
  {
    BOOL v110 = 0;
  }

  return v110;
}

id __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke( uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeLensViewController]);
  objc_msgSend( v2,  "_moveZoomItemWithController:byDelta:animated:userInitiated:",  v3,  0,  1,  *(double *)(a1 + 40),  *(double *)(a1 + 48));

  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

id __159__ZWRootViewController_fullscreenEventHandler_autopanWithLocation_initialSingleFingerLocation_distance_animationDuration_useGutterDistance_pointHasBeenMapped___block_invoke_2( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeLensViewController]);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 64);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fullscreenZoomDidAutopanUnitTestCallback]);
  objc_msgSend( v2,  "updateZoomFactor:panOffset:animated:animationDuration:completion:",  1,  v5,  v3,  *(double *)(a1 + 48),  *(double *)(a1 + 56),  v4);

  return [*(id *)(a1 + 32) _updateMinimapStatus];
}

- (BOOL)fullscreenEventHandler:(id)a3 autopanShouldStartWithPoint:(CGPoint)a4 speedFactor:(double *)a5 initialSingleFingerLocation:(CGPoint)a6 fingerCount:(double)a7 pointHasBeenMapped:(BOOL)a8
{
  BOOL v8 = a8;
  double y = a6.y;
  double x = a6.x;
  double v13 = a4.y;
  double v14 = a4.x;
  -[ZWRootViewController zoomFactor](self, "zoomFactor", a3);
  double v71 = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v70 = a7;
  if (v8)
  {
    -[ZWRootViewController zoomFrame](self, "zoomFrame");
    double v19 = v18;
    double v21 = v20;
    double width = v22;
    double height = v24;
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:]( self,  "_denormalizePoint:withRespectToFrame:",  v14,  v13,  v18,  v20,  v22,  v24);
    double v14 = v26;
    double v13 = v27;
    -[ZWRootViewController _denormalizePoint:withRespectToFrame:](self, "_denormalizePoint:withRespectToFrame:");
LABEL_8:
    double x = v28;
    double y = v29;
    goto LABEL_9;
  }

  double v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v30 == v31)
  {
    -[ZWRootViewController _screenSizeForCurrentOrientation](self, "_screenSizeForCurrentOrientation");
    double width = v34;
    double height = v35;
    -[ZWRootViewController _denormalizePointForCurrentOrientation:]( self,  "_denormalizePointForCurrentOrientation:",  v14,  v13);
    double v14 = v36;
    double v13 = v37;
    -[ZWRootViewController _denormalizePointForCurrentOrientation:]( self,  "_denormalizePointForCurrentOrientation:",  x,  y);
    double x = v38;
    double y = v39;
    double v19 = 0.0;
    double v21 = 0.0;
  }

  else
  {
    double v32 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

    if (v32 == v33)
    {
      double v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
      double v41 = (void *)objc_claimAutoreleasedReturnValue([v40 view]);
      double v42 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
      double v43 = (void *)objc_claimAutoreleasedReturnValue([v42 view]);
      [v43 bounds];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v52 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController containerView](self, "containerView"));
      objc_msgSend(v41, "convertRect:toView:", v52, v45, v47, v49, v51);
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;

      double v19 = UIRectInset(v54, v56, v58, v60, 18.0, 18.0, 18.0, 18.0);
      double v21 = v61;
      double width = v62;
      double height = v63;
      -[ZWRootViewController _denormalizePointForCurrentOrientation:]( self,  "_denormalizePointForCurrentOrientation:",  v14,  v13);
      double v14 = v64;
      double v13 = v65;
      -[ZWRootViewController _denormalizePointForCurrentOrientation:]( self,  "_denormalizePointForCurrentOrientation:",  x,  y);
      goto LABEL_8;
    }

    double v19 = CGRectZero.origin.x;
    double v21 = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

- (BOOL)_watchUIInverted
{
  return 0;
}

- (int64_t)interfaceOrientationWithFullscreenEventHandler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __71__ZWRootViewController_interfaceOrientationWithFullscreenEventHandler___block_invoke;
  v8[3] = &unk_6D140;
  v8[4] = self;
  void v8[5] = &v9;
  dispatch_sync(v5, v8);

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __71__ZWRootViewController_interfaceOrientationWithFullscreenEventHandler___block_invoke( uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 80LL);
  return result;
}

- (void)touchTrapView:(id)a3 didTrapTouches:(id)a4 withEvent:(id)a5
{
  id v9 = a3;
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  if ([v6 isInLensResizingMode])
  {
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    unsigned __int8 v8 = [v7 isInDockResizingMode];

    if ((v8 & 1) == 0) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ZoomTouch/ZoomWindowAXUIService/source/ZWRootViewController.m",  6142LL,  "-[ZWRootViewController touchTrapView:didTrapTouches:withEvent:]",  @"Shouldn't trap touches if we're not in lens resizing mode!");
    }
  }

  -[ZWRootViewController touchTrapViewActivated:](self, "touchTrapViewActivated:", v9);
}

- (void)touchTrapViewActivated:(id)a3
{
}

- (BOOL)touchTrapView:(id)a3 shouldReportSelfInHitTestAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v8 == v9) {
    goto LABEL_12;
  }
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
  if (v10 == v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));
    unsigned int v13 = [v12 isInLensResizingMode];

    if (!v13) {
      goto LABEL_12;
    }
  }

  else
  {
  }

  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  if (v14 == v15)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    unsigned int v17 = [v16 isInDockResizingMode];

    if (!v17) {
      goto LABEL_12;
    }
  }

  else
  {
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
  objc_msgSend(v7, "convertPoint:toView:", v19, x, y);
  double v21 = v20;
  double v23 = v22;

  double v24 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  if (v24 != v25)
  {

    goto LABEL_11;
  }

  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  double v27 = (void *)objc_claimAutoreleasedReturnValue([v26 toggleZoomRegionButton]);
  [v27 frame];
  v40.double x = v21;
  v40.double y = v23;
  BOOL v28 = CGRectContainsPoint(v41, v40);

  if (v28)
  {
LABEL_12:
    char v31 = 0;
    goto LABEL_13;
  }

- (void)_updateSystemGestureDisablingAssertionsForFullscreenZoom
{
}

- (void)_zoomMovementHeartbeat
{
}

- (void)_zoomMovementHeartbeat:(double)a3 fullscreenEventHandler:(id)a4
{
  id v41 = a4;
  -[ZWRootViewController zoomFactor](self, "zoomFactor");
  double v7 = v6;
  -[ZWRootViewController zoomPanOffset](self, "zoomPanOffset");
  double v9 = v8;
  double v11 = v10;
  ZOTDistanceForTimeAndVelocityWithMaxDistance(a3);
  double v13 = v12;
  double v15 = v14;
  double v16 = fabs(v14);
  if (fabs(v12) < 1.0 && v16 < 1.0) {
    goto LABEL_23;
  }
  self->_validatePanOffsetWithFullscreen = 1;
  double v18 = v9 + v12;
  double v19 = v11 + v15;
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend(v20, "validPanOffsetForProposedOffset:proposedZoomFactor:", v18, v11 + v15, v7);
  double v22 = v21;
  double v24 = v23;

  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend(v25, "handleAdditionalPanOffsetFromOriginalOffset:validOffset:useFullDelta:", 0, v18, v19, v22, v24);

  double v26 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend(v26, "offsetByPanningWithDelta:axis:zoomFactor:", 6, v13, v15, v7);
  double v28 = v27;
  double v30 = v29;

  -[ZWRootViewController setZoomPanOffset:](self, "setZoomPanOffset:", v28, v30);
  char v31 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  objc_msgSend(v31, "updateZoomFactor:panOffset:animated:animationDuration:completion:", 0, 0, v7, v28, v30, -1.0);

  self->_validatePanOffsetWithFullscreen = 0;
  if (v22 != v28 || v24 != v30) {
    goto LABEL_23;
  }
  double v33 = vabdd_f64(v24, v19);
  double v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v35 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));

  if (v34 != v35) {
    goto LABEL_19;
  }
  double v36 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
  if ([v36 dockPosition])
  {
    double v37 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    double v38 = (char *)[v37 dockPosition];

    if (v38 != (_BYTE *)&dword_0 + 3)
    {
      uint64_t v39 = 752LL;
      goto LABEL_16;
    }
  }

  else
  {
  }

  uint64_t v39 = 753LL;
LABEL_16:
  if (*((_BYTE *)&self->super.super.super.isa + v39))
  {
    CGPoint v40 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController dockedLensViewController](self, "dockedLensViewController"));
    *((_BYTE *)&self->super.super.super.isa + v39) = [v40 zoomRegionOnScreenReplicatorEdge];
  }

  else
  {
    *((_BYTE *)&self->super.super.super.isa + v39) = 0;
  }

- (double)_calculateDurationForVelocity:(double)a3
{
  return a3 * 2300.0 * 0.125 * sqrt(pow(a3 * 2300.0, 1.5));
}

- (BOOL)_shouldBlockShowNotificationGesture
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  if (v3 != v4) {
    return 0;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  if ([v5 inStandbyMode])
  {

    return 0;
  }

  unsigned __int8 v6 = -[ZWRootViewController _isZoomedToMinimum](self, "_isZoomedToMinimum");

  if ((v6 & 1) != 0) {
    return 0;
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lensZoomView]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoomReplicatorLayer]);
  [v10 position];
  double v12 = v11;

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lensZoomView]);
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoomReplicatorLayer]);
  [v15 bounds];
  double v17 = v16;

  return v12 + v17 * -0.5 >= 15.0;
}

- (BOOL)_shouldBlockShowControlCenterGesture
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  if ([v3 inStandbyMode])
  {

    return 0;
  }

  unsigned __int8 v4 = -[ZWRootViewController _isZoomedToMinimum](self, "_isZoomedToMinimum");

  if ((v4 & 1) != 0) {
    return 0;
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  [v5 zoomPanOffset];
  double v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  [v9 zoomFactor];
  objc_msgSend(v8, "maximumPanOffsetWithZoomFactor:");
  double v11 = v10;

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController fullscreenLensViewController](self, "fullscreenLensViewController"));

  BOOL result = 0;
  if (v13 == v14 && v11 - v7 >= 30.0) {
    return 1;
  }
  return result;
}

- (double)_interfaceAwareAdjustedAngleForScreenAngle:(double)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 window]);
  double v6 = (int *)[v5 interfaceOrientation];

  if (v6 == (int *)((char *)&dword_0 + 2))
  {
    double result = a3 + -180.0;
    if (a3 + -180.0 >= 0.0) {
      return result;
    }
    double v8 = 180.0;
    return a3 + v8;
  }

  if (v6 == (int *)((char *)&dword_0 + 3))
  {
    double result = a3 + -270.0;
    if (a3 + -270.0 >= 0.0) {
      return result;
    }
    double v8 = 90.0;
    return a3 + v8;
  }

  if (v6 == &dword_4)
  {
    double result = a3 + -90.0;
    if (a3 + -90.0 >= 0.0) {
      return result;
    }
    double v8 = 270.0;
    return a3 + v8;
  }

  return a3;
}

- (CGPoint)_convertPointFromNormalizedToWindow:(CGPoint)a3
{
  double v4 = ZOTDenormalizePoint((uint64_t)self, (uint64_t)a2, a3.x);
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 window]);
  double v9 = ZWConvertPointInScreenPixelsToViewCoordinates(v8, v4, v6);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (BOOL)hostingWindowShouldMoveForReachability
{
  return 0;
}

- (void)handleReachabilityToggled:(double)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  unsigned __int8 v6 = [v5 inStandbyMode];

  if ((v6 & 1) == 0)
  {
    -[ZWRootViewController reachabilityOffset](self, "reachabilityOffset");
    double v8 = v7;
    if (vabdd_f64(a3, v7) >= 0.00000011920929)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController pipLensViewController](self, "pipLensViewController"));

      if (v9 == v10)
      {
        double v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
        -[ZWRootViewController _moveZoomItemWithController:byDelta:animated:userInitiated:]( self,  "_moveZoomItemWithController:byDelta:animated:userInitiated:",  v11,  0LL,  0LL,  0.0,  a3 - v8);
      }

      -[ZWRootViewController setReachabilityOffset:](self, "setReachabilityOffset:", a3);
    }
  }

- (void)didAnimateForReachabilityToOffset:(double)a3
{
  double v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController cachedValuesSerialQueue](self, "cachedValuesSerialQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__ZWRootViewController_didAnimateForReachabilityToOffset___block_invoke;
  block[3] = &unk_6CBC0;
  void block[4] = self;
  dispatch_sync(v4, block);
}

void __58__ZWRootViewController_didAnimateForReachabilityToOffset___block_invoke(uint64_t a1)
{
  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 112LL)))
  {
    id v2 = *(void **)(a1 + 32);
    double v3 = v2 + 10;
    double v4 = (void *)objc_claimAutoreleasedReturnValue([v2 activeLensViewController]);
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lensZoomView]);
    objc_msgSend(v5, "zw_convertBoundsToScreenCoordinates");
    v3[4] = v6;
    v3[5] = v7;
    v3[6] = v8;
    v3[7] = v9;
  }

  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 176LL)))
  {
    double v10 = *(void **)(a1 + 32);
    double v11 = v10 + 10;
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 menuViewController]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
    objc_msgSend(v13, "zw_convertBoundsToScreenCoordinates");
    v11[12] = v14;
    v11[13] = v15;
    v11[14] = v16;
    v11[15] = v17;
  }

  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 144LL)))
  {
    double v18 = *(void **)(a1 + 32);
    double v19 = v18 + 10;
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v18 slugViewController]);
    [v20 slugRingViewBoundsInScreenCoordinates];
    v19[8] = v21;
    v19[9] = v22;
    v19[10] = v23;
    v19[11] = v24;
  }

  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 224LL)))
  {
    double v25 = *(void **)(a1 + 32);
    double v26 = v25 + 10;
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v25 dockedLensViewController]);
    double v28 = (void *)objc_claimAutoreleasedReturnValue([v27 dockedLensView]);
    [v28 frame];
    v26[18] = v29;
    v26[19] = v30;
    v26[20] = v31;
    v26[21] = v32;
  }

  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 256LL)))
  {
    double v33 = *(void **)(a1 + 32);
    double v34 = v33 + 10;
    double v35 = (void *)objc_claimAutoreleasedReturnValue([v33 dockedLensViewController]);
    [v35 zoomRegionFrame];
    v34[22] = v36;
    v34[23] = v37;
    v34[24] = v38;
    v34[25] = v39;
  }

  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 288LL)))
  {
    CGPoint v40 = *(void **)(a1 + 32);
    id v41 = v40 + 10;
    double v42 = (void *)objc_claimAutoreleasedReturnValue([v40 dockedLensViewController]);
    double v43 = (void *)objc_claimAutoreleasedReturnValue([v42 toggleZoomRegionButton]);
    [v43 frame];
    v41[26] = v44;
    v41[27] = v45;
    v41[28] = v46;
    v41[29] = v47;
  }

  if (!CGRectIsNull(*(CGRect *)(*(void *)(a1 + 32) + 320LL)))
  {
    double v48 = *(void **)(a1 + 32);
    double v49 = v48 + 10;
    id v54 = (id)objc_claimAutoreleasedReturnValue([v48 dockedLensViewController]);
    [v54 frameForResizeDrag];
    v49[30] = v50;
    v49[31] = v51;
    v49[32] = v52;
    v49[33] = v53;
  }

- (void)_updateZoomListeners
{
  v24[0] = ZWAttributeKeyAppActivationAnimationStartDelay;
  -[ZWRootViewController handleAppActivationAnimationDelay](self, "handleAppActivationAnimationDelay");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v25[0] = v23;
  v24[1] = ZWAttributeKeyAppDeactivationAnimationStartDelay;
  -[ZWRootViewController handleAppDeactivationAnimationDelay](self, "handleAppDeactivationAnimationDelay");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v25[1] = v22;
  v24[2] = ZWAttributeKeyAppSwitcherRevealAnimationStartDelay;
  -[ZWRootViewController handleAppSwitcherRevealAnimationDelay](self, "handleAppSwitcherRevealAnimationDelay");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v25[2] = v21;
  v24[3] = ZWAttributeKeyReachabilityScaleFactor;
  -[ZWRootViewController reachabilityScaleFactor](self, "reachabilityScaleFactor");
  double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v25[3] = v20;
  v24[4] = ZWAttributeKeyZoomLevel;
  -[ZWRootViewController zoomLevel](self, "zoomLevel");
  double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v25[4] = v19;
  void v24[5] = ZWAttributeKeyZoomFrame;
  -[ZWRootViewController zoomFrame](self, "zoomFrame");
  double v3 = NSStringFromCGRect(v26);
  double v18 = (void *)objc_claimAutoreleasedReturnValue(v3);
  void v25[5] = v18;
  v24[6] = ZWAttributeKeyActiveZoomMode;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeZoomMode](self, "activeZoomMode"));
  v25[6] = v17;
  v24[7] = ZWAttributeKeyInStandbyMode;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v16 inStandbyMode]));
  v25[7] = v15;
  v24[8] = ZWAttributeKeyShouldSuppressKeyCommandHUD;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ZWRootViewController shouldSuppressKeyCommandHUD](self, "shouldSuppressKeyCommandHUD")));
  v25[8] = v4;
  v24[9] = ZWAttributeKeyIsAnimating;
  BOOL v5 = -[ZWRootViewController zoomIsAnimatingDueToTransition](self, "zoomIsAnimatingDueToTransition")
    || -[ZWRootViewController zoomIsAnimatingDueToStandbyToggle](self, "zoomIsAnimatingDueToStandbyToggle")
    || -[ZWRootViewController zoomIsAnimating](self, "zoomIsAnimating");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  v25[9] = v6;
  v24[10] = ZWAttributeKeyDisplayID;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController view](self, "view"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 window]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 screen]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayIdentity]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v10 displayID]));
  v25[10] = v11;
  v24[11] = ZWAttributeKeyIsMainDisplay;
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[ZWRootViewController isMainDisplay](self, "isMainDisplay")));
  v25[11] = v12;
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  12LL));

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController axuiService](self, "axuiService"));
  [v14 updateZoomListeners:v13];
}

- (BOOL)_isZoomFactorAtMinimum:(double)a3
{
  BOOL v3 = vabdd_f64(a3, AXZoomMinimumZoomLevel) <= 0.0001;
  return AXZoomMinimumZoomLevel >= a3 || v3;
}

- (void)updateFocusWithSmartZoom:(id)a3
{
  id v10 = a3;
  AXDeviceIsTV(v10, v4, v5, v6, v7);
  if (-[ZWKeyboardContext zoomFollowsFocus](self->_kbContext, "zoomFollowsFocus"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController lensAutopanner](self, "lensAutopanner"));
    unsigned __int8 v9 = [v8 isAutomovingLens];

    if ((v9 & 1) == 0)
    {
      [v10 focusRect];
      -[ZWRootViewController _focusLensOnRect:panLensContent:recentreLens:animated:completion:]( self,  "_focusLensOnRect:panLensContent:recentreLens:animated:completion:",  1LL,  1LL,  0LL,  0LL);
    }
  }
}

- (BOOL)isZoomInStandByModeWithSmartZoom:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWRootViewController activeLensViewController](self, "activeLensViewController", a3));
  unsigned __int8 v4 = [v3 inStandbyMode];

  return v4;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setInUnitTestingMode:(BOOL)a3
{
  self->_inUnitTestingMode = a3;
}

- (void)setUnitTestDelegate:(id)a3
{
}

- (id)getLastSpeakUnderFingerPhrase
{
  return &stru_6D450;
}

- (AXUIService)axuiService
{
  return (AXUIService *)objc_loadWeakRetained((id *)&self->_axuiService);
}

- (void)setAxuiService:(id)a3
{
}

- (BOOL)brailleInputUIIsShowing
{
  return self->_brailleInputUIIsShowing;
}

- (void)setBrailleInputUIIsShowing:(BOOL)a3
{
  self->_brailleInputUIIsShowing = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (ZWTouchTrapView)touchTrapView
{
  return self->_touchTrapView;
}

- (void)setTouchTrapView:(id)a3
{
}

- (UIView)scrollTrapView
{
  return self->_scrollTrapView;
}

- (void)setScrollTrapView:(id)a3
{
}

- (ZWUIMinimapView)minimapView
{
  return self->_minimapView;
}

- (void)setMinimapView:(id)a3
{
}

- (ZWAlertManager)zoomAlertManager
{
  return self->_zoomAlertManager;
}

- (void)setZoomAlertManager:(id)a3
{
}

- (ZWAppleTVHUDViewController)HUDViewController
{
  return self->_HUDViewController;
}

- (void)setHUDViewController:(id)a3
{
}

- (BOOL)zoomWasUnzoomedDueToAppTransition
{
  return self->_zoomWasUnzoomedDueToAppTransition;
}

- (void)setZoomWasUnzoomedDueToAppTransition:(BOOL)a3
{
  self->_zoomWasUnzoomedDueToAppTransition = a3;
}

- (BOOL)zoomIsAnimatingDueToTransition
{
  return self->_zoomIsAnimatingDueToTransition;
}

- (void)setZoomIsAnimatingDueToTransition:(BOOL)a3
{
  self->_zoomIsAnimatingDueToTransition = a3;
}

- (BOOL)triedToRezoomForDockTransition
{
  return self->_triedToRezoomForDockTransition;
}

- (void)setTriedToRezoomForDockTransition:(BOOL)a3
{
  self->_triedToRezoomForDockTransition = a3;
}

- (BOOL)zoomIsAnimatingDueToStandbyToggle
{
  return self->_zoomIsAnimatingDueToStandbyToggle;
}

- (void)setZoomIsAnimatingDueToStandbyToggle:(BOOL)a3
{
  self->_zoomIsAnimatingDueToStandbyToggle = a3;
}

- (BOOL)zoomIsAnimating
{
  return self->_zoomIsAnimating;
}

- (void)setZoomIsAnimating:(BOOL)a3
{
  self->_zoomIsAnimating = a3;
}

- (BOOL)triedToToggleStandbyDuringAnimation
{
  return self->_triedToToggleStandbyDuringAnimation;
}

- (void)setTriedToToggleStandbyDuringAnimation:(BOOL)a3
{
  self->_triedToToggleStandbyDuringAnimation = a3;
}

- (BOOL)toggleStandbyOnNextCommandChange
{
  return self->_toggleStandbyOnNextCommandChange;
}

- (void)setToggleStandbyOnNextCommandChange:(BOOL)a3
{
  self->_toggleStandbyOnNextCommandChange = a3;
}

- (double)panOffsetXBeforeTransition
{
  return self->_panOffsetXBeforeTransition;
}

- (void)setPanOffsetXBeforeTransition:(double)a3
{
  self->_panOffsetXBeforeTransition = a3;
}

- (double)reachabilityOffset
{
  return self->_reachabilityOffset;
}

- (void)setReachabilityOffset:(double)a3
{
  self->_reachabilityOffset = a3;
}

- (ZWSmartZoomManager)smartZoom
{
  return self->_smartZoom;
}

- (void)setSmartZoom:(id)a3
{
}

- (double)lastWheelDelta
{
  return self->_lastWheelDelta;
}

- (void)setLastWheelDelta:(double)a3
{
  self->_lastWheelDelta = a3;
}

- (double)lastScrollTrapOffset
{
  return self->_lastScrollTrapOffset;
}

- (void)setLastScrollTrapOffset:(double)a3
{
  self->_lastScrollTrapOffset = a3;
}

- (BOOL)scrollBeganWhileSnarfingScrolls
{
  return self->_scrollBeganWhileSnarfingScrolls;
}

- (void)setScrollBeganWhileSnarfingScrolls:(BOOL)a3
{
  self->_scrollBeganWhileSnarfingScrolls = a3;
}

- (double)accruedOvershoot
{
  return self->_accruedOvershoot;
}

- (void)setAccruedOvershoot:(double)a3
{
  self->_accruedOvershoot = a3;
}

- (BOOL)isSweepingToNextZoomRow
{
  return self->_isSweepingToNextZoomRow;
}

- (void)setIsSweepingToNextZoomRow:(BOOL)a3
{
  self->_isSweepingToNextZoomRow = a3;
}

- (BOOL)haveTriedScrollingDuringZoomSweep
{
  return self->_haveTriedScrollingDuringZoomSweep;
}

- (void)setHaveTriedScrollingDuringZoomSweep:(BOOL)a3
{
  self->_haveTriedScrollingDuringZoomSweep = a3;
}

- (double)lastEventTime
{
  return self->_lastEventTime;
}

- (void)setLastEventTime:(double)a3
{
  self->_lastEventTime = a3;
}

- (BOOL)snarfingWheelEventsForPan
{
  return self->_snarfingWheelEventsForPan;
}

- (void)setSnarfingWheelEventsForPan:(BOOL)a3
{
  self->_snarfingWheelEventsForPan = a3;
}

- (BOOL)snarfingWheelEventsForZoom
{
  return self->_snarfingWheelEventsForZoom;
}

- (void)setSnarfingWheelEventsForZoom:(BOOL)a3
{
  self->_snarfingWheelEventsForZoom = a3;
}

- (BOOL)carouselLockActive
{
  return self->_carouselLockActive;
}

- (void)setCarouselLockActive:(BOOL)a3
{
  self->_carouselLockActive = a3;
}

- (ZWKeyboardContext)kbContext
{
  return self->_kbContext;
}

- (void)setKbContext:(id)a3
{
}

- (AXAssertion)disableNotificationCenterAssertionPIPLens
{
  return self->_disableNotificationCenterAssertionPIPLens;
}

- (void)setDisableNotificationCenterAssertionPIPLens:(id)a3
{
}

- (AXAssertion)disableControlCenterAssertionPIPLens
{
  return self->_disableControlCenterAssertionPIPLens;
}

- (void)setDisableControlCenterAssertionPIPLens:(id)a3
{
}

- (AXAssertion)disableNotificationCenterAssertionFullscreenLens
{
  return self->_disableNotificationCenterAssertionFullscreenLens;
}

- (void)setDisableNotificationCenterAssertionFullscreenLens:(id)a3
{
}

- (AXAssertion)disableControlCenterAssertionFullscreenLens
{
  return self->_disableControlCenterAssertionFullscreenLens;
}

- (void)setDisableControlCenterAssertionFullscreenLens:(id)a3
{
}

- (AXAssertion)disableHomeGestureAssertion
{
  return self->_disableHomeGestureAssertion;
}

- (void)setDisableHomeGestureAssertion:(id)a3
{
}

- (ZWZoomLensViewController)activeLensViewController
{
  return self->_activeLensViewController;
}

- (BOOL)isActiveLensTransitioning
{
  return self->_activeLensTransitioning;
}

- (void)setActiveLensTransitioning:(BOOL)a3
{
  self->_activeLensTransitioning = a3;
}

- (ZWLensAutopanner)lensAutopanner
{
  return self->_lensAutopanner;
}

- (void)setLensAutopanner:(id)a3
{
}

- (ZWZoomPIPLensViewController)pipLensViewController
{
  return self->_pipLensViewController;
}

- (void)setPipLensViewController:(id)a3
{
}

- (NSLayoutConstraint)lensDragXConstraint
{
  return self->_lensDragXConstraint;
}

- (void)setLensDragXConstraint:(id)a3
{
}

- (NSLayoutConstraint)lensDragYConstraint
{
  return self->_lensDragYConstraint;
}

- (void)setLensDragYConstraint:(id)a3
{
}

- (NSLayoutConstraint)lensWidthConstraint
{
  return self->_lensWidthConstraint;
}

- (void)setLensWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)lensHeightConstraint
{
  return self->_lensHeightConstraint;
}

- (void)setLensHeightConstraint:(id)a3
{
}

- (unint64_t)pipLensEdgeMask
{
  return self->_pipLensEdgeMask;
}

- (void)setPipLensEdgeMask:(unint64_t)a3
{
  self->_pipLensEdgeMask = a3;
}

- (ZWZoomDockedLensViewController)dockedLensViewController
{
  return self->_dockedLensViewController;
}

- (void)setDockedLensViewController:(id)a3
{
}

- (ZWZoomFullscreenLensViewController)fullscreenLensViewController
{
  return self->_fullscreenLensViewController;
}

- (void)setFullscreenLensViewController:(id)a3
{
}

- (ZWZoomSlugViewController)slugViewController
{
  return self->_slugViewController;
}

- (void)setSlugViewController:(id)a3
{
}

- (NSLayoutConstraint)slugRingDragXConstraint
{
  return self->_slugRingDragXConstraint;
}

- (void)setSlugRingDragXConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingDragYConstraint
{
  return self->_slugRingDragYConstraint;
}

- (void)setSlugRingDragYConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingLeadingConstraint
{
  return self->_slugRingLeadingConstraint;
}

- (void)setSlugRingLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingTrailingConstraint
{
  return self->_slugRingTrailingConstraint;
}

- (void)setSlugRingTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingTopConstraint
{
  return self->_slugRingTopConstraint;
}

- (void)setSlugRingTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)slugRingBottomConstraint
{
  return self->_slugRingBottomConstraint;
}

- (void)setSlugRingBottomConstraint:(id)a3
{
}

- (unint64_t)slugEdgeMask
{
  return self->_slugEdgeMask;
}

- (void)setSlugEdgeMask:(unint64_t)a3
{
  self->_slugEdgeMask = a3;
}

- (BOOL)pipWasOnBeforeSpeakFingerStarted
{
  return self->_pipWasOnBeforeSpeakFingerStarted;
}

- (void)setPipWasOnBeforeSpeakFingerStarted:(BOOL)a3
{
  self->_pipWasOnBeforeSpeakFingerStarted = a3;
}

- (CGPoint)lastOrbLocation
{
  double x = self->_lastOrbLocation.x;
  double y = self->_lastOrbLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastOrbLocation:(CGPoint)a3
{
  self->_lastOrbLocation = a3;
}

- (ZWMenuViewController)menuViewController
{
  return self->_menuViewController;
}

- (void)setMenuViewController:(id)a3
{
}

- (AXDispatchTimer)idleTouchTimer
{
  return self->_idleTouchTimer;
}

- (void)setIdleTouchTimer:(id)a3
{
}

- (ZWEventProcessor)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (OS_dispatch_queue)cachedValuesSerialQueue
{
  return self->_cachedValuesSerialQueue;
}

- (void)setCachedValuesSerialQueue:(id)a3
{
}

- (AXDispatchTimer)keyRepeatTimer
{
  return self->_keyRepeatTimer;
}

- (void)setKeyRepeatTimer:(id)a3
{
}

- (int64_t)lastKeyboardCommand
{
  return self->_lastKeyboardCommand;
}

- (void)setLastKeyboardCommand:(int64_t)a3
{
  self->_lastKeyboardCommand = a3;
}

- (BOOL)shouldSuppressKeyCommandHUD
{
  return self->_shouldSuppressKeyCommandHUD;
}

- (void)setShouldSuppressKeyCommandHUD:(BOOL)a3
{
  self->_shouldSuppressKeyCommandHUD = a3;
}

- (BOOL)isMainDisplay
{
  return self->_isMainDisplay;
}

- (void)setIsMainDisplay:(BOOL)a3
{
  self->_isMainDispladouble y = a3;
}

- (void)setScreen:(id)a3
{
}

- (BSInvalidatable)hitTestCategoryAssertion
{
  return self->_hitTestCategoryAssertion;
}

- (void)setHitTestCategoryAssertion:(id)a3
{
}

- (UIView)debugFocusView
{
  return self->_debugFocusView;
}

- (void)setDebugFocusView:(id)a3
{
}

- (NSMutableSet)deactivatedAppIDs
{
  return self->_deactivatedAppIDs;
}

- (void)setDeactivatedAppIDs:(id)a3
{
}

- (id)lensTransitionUnitTestCallback
{
  return self->_lensTransitionUnitTestCallback;
}

- (void)setLensTransitionUnitTestCallback:(id)a3
{
}

- (id)zoomMenuVisibilityChangedUnitTestCallback
{
  return self->_zoomMenuVisibilityChangedUnitTestCallback;
}

- (void)setZoomMenuVisibilityChangedUnitTestCallback:(id)a3
{
}

- (id)fullscreenZoomDidAutopanUnitTestCallback
{
  return self->_fullscreenZoomDidAutopanUnitTestCallback;
}

- (void)setFullscreenZoomDidAutopanUnitTestCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end