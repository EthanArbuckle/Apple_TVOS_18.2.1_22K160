@interface VOTEventFactory
+ (void)_updateZoomFrame:(CGRect)a3;
+ (void)initialize;
- (AXDispatchTimer)_handwritingCaptureTimer;
- (AXEventProcessor)eventProcessor;
- (AXEventRepresentation)audioAccHeldEventForRepost;
- (AXEventRepresentation)audioAccHeldUpEventForRepost;
- (AXEventRepresentation)audioAccTapDownEventForRepost;
- (AXEventRepresentation)audioAccTapUpEventForRepost;
- (BOOL)_atvEventFilter:(id)a3;
- (BOOL)_audioAccessoryEventFilter:(id)a3;
- (BOOL)_canScribbleWithElement:(id)a3;
- (BOOL)_gestureEventIsInvalid:(id)a3;
- (BOOL)_handleAccessibilityEvent:(id)a3;
- (BOOL)_handleDirectInteractionEvent:(id)a3;
- (BOOL)_handleOrbEvent:(id)a3;
- (BOOL)_handleVoiceOverGreySupportAccessibilityEvent:(id)a3;
- (BOOL)_iosEventFilter:(id)a3;
- (BOOL)_isEdgePressSupportedAtPosition:(CGPoint)a3;
- (BOOL)_isPreviewElementSelected;
- (BOOL)_isStylusGesture;
- (BOOL)_isTapAndHoldPending;
- (BOOL)_shouldAttemptTracking;
- (BOOL)_shouldDismissPreviewOnLift;
- (BOOL)_shouldUseGesturedTextInputManager;
- (BOOL)_tapAndHoldModeIsForScribble;
- (BOOL)_twoFingersDistant:(id)a3;
- (BOOL)_updateFingersInSystemControlLocation:(CGPoint)a3 fingerCount:(unint64_t)a4 isLift:(BOOL)a5;
- (BOOL)_willStartEdgePanGestureForEvent:(id)a3;
- (BOOL)brailleInputActive;
- (BOOL)brailleInputAllowsElementMovement;
- (BOOL)brailleInputShouldBeDeactivatedByEscape;
- (BOOL)brailleInputWantsToStayActive;
- (BOOL)directInteractionGestureInProgress;
- (BOOL)directTouchElementsPresent;
- (BOOL)handleVOSGesture:(id)a3;
- (BOOL)mapsExplorationInputActive;
- (BOOL)processEventAsGesturedTextInput:(id)a3;
- (BOOL)registerForEvents;
- (BOOL)shouldBlockSplitTapGestureWithFactory:(id)a3;
- (BOOL)shouldSnarfEventForTapWakeGesture:(id)a3;
- (BOOL)tapAndHoldMode;
- (CGPoint)_averagePointForLastDownEvent;
- (CGPoint)_convertZoomPointToDevicePoint:(CGPoint)a3;
- (CGPoint)_startPointForScribbleWithElement:(id)a3 originalStartPoint:(CGPoint)a4;
- (CGPoint)_updateTapAndHoldLocationDataForElement:(id)a3;
- (CGPoint)adjustedPointForFactoryPoint:(CGPoint)a3 forOrientation:(int64_t)a4;
- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3;
- (CGPoint)fingerPosition;
- (CGRect)_convertFrame:(CGRect)a3 toPortraitFromOrientation:(int64_t)a4;
- (VOTDirectInteractionKeyboardManager)directInteractionKeyboardManager;
- (VOTDirectTouchManagementProtocol)directTouchManager;
- (VOTElement)currentElement;
- (VOTElement)lastTouchedDirectTouchElement;
- (VOTElementManagementProtocol)elementManager;
- (VOTEvent)lastGestureEvent;
- (VOTEventFactory)init;
- (VOTEventFactoryCallbackProtocol)delegate;
- (VOTRotorManagementProtocol)rotorManager;
- (double)_edgeGestureScaleFactor:(BOOL)a3;
- (double)_edgePanGestureStartThreshold;
- (id)_brailleGestureManager;
- (id)_commandResolver;
- (id)_currentGesturedTextInputManager;
- (id)_currentGesturedTextInputManagerAndCommandResolver:(id)a3 forCommandResolver:(BOOL)a4;
- (id)_denormalizeEventRepresentation:(id)a3;
- (id)_handleGestureKeyboardTappingCallback:(unint64_t)a3 fingerCount:(unint64_t)a4 isDown:(BOOL)a5 originalLocation:(CGPoint)a6 convertedLocation:(CGPoint)a7;
- (id)_mapAXEventToVOTEvent:(id)a3;
- (id)_mapsExplorationGestureManager;
- (id)_notificationsToRegister;
- (id)_preprocessEventForSimulator:(id)a3;
- (id)_touchLocationsForGestureEvent:(id)a3;
- (id)_updateEdgePanGestureForState:(int64_t)a3;
- (id)gestureFactory;
- (id)tapAndHoldContextNumbers;
- (id)votActionForEdgePanGestureState:(unint64_t)a3;
- (int)_registerForAXNotifications:(BOOL)a3;
- (int)_systemControlPosition:(CGPoint)a3 fingerCount:(unint64_t)a4;
- (int64_t)brailleInputTypingMode;
- (int64_t)orientation;
- (unint64_t)fingerCount;
- (void)_audioAccAnnounceButton;
- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4;
- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4 timeOffset:(double)a5;
- (void)_audioAccProcessTapUpdates;
- (void)_beginAudiographScrubbingMode;
- (void)_beginNativeSliding:(id)a3;
- (void)_cancelScribbleTapAndHoldModeTimeout;
- (void)_cancelTapAndHold:(CGPoint)a3;
- (void)_cancelTapAndHold:(CGPoint)a3 forScribble:(BOOL)a4;
- (void)_cancelTapAndHoldWithValue:(id)a3;
- (void)_cancelUpdateScribbleTapAndHoldModeOffset;
- (void)_commitDeferredZoomInfo;
- (void)_commitDeferredZoomInfoIfAppropriate;
- (void)_contextlessTouchWithHandType:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 altitude:(double)a6 azimuth:(double)a7;
- (void)_convertZoomRecordToDeviceRecord:(id)a3;
- (void)_edgePanGestureSpeakHintTimerFired;
- (void)_endAudiographScrubbingMode;
- (void)_endScribbleTapAndHoldMode;
- (void)_gestureTrackingCallbackWithFactory:(id)a3 isHandlingSystemControlEvent:(BOOL)a4;
- (void)_handleAudiographScrubbingPositionChanged;
- (void)_handleBSIStateChangedNotification:(id)a3;
- (void)_handleElementPreviewNotification:(id)a3;
- (void)_handleEventWithData:(id)a3;
- (void)_handleIOHIDEvent:(id)a3;
- (void)_handleKeyboardVisibilityChanged:(id)a3;
- (void)_handleRotorChangedNotification:(id)a3;
- (void)_handleSOSMedicalIDShown;
- (void)_liftFromTapAndHoldAndResetFingers:(BOOL)a3;
- (void)_liftPreviewFinger;
- (void)_markTapAndHoldOffsetAsDirty;
- (void)_outputElementSummaryFired;
- (void)_processGestureEvent:(id)a3;
- (void)_processIdle:(CGPoint)a3;
- (void)_processTapAndHoldMode:(id)a3;
- (void)_reducePreviewFingerStartingForce:(double)a3;
- (void)_registerForIOHIDUsage;
- (void)_registerForZoomListener;
- (void)_resetSystemControlStatus;
- (void)_scheduleUpdateScribbleTapAndHoldModeOffset;
- (void)_sendSystemControlEvent:(id)a3;
- (void)_setFingerCount:(unint64_t)a3;
- (void)_setHandwritingCaptureTimer:(id)a3;
- (void)_simulatePeekAndSwitchToTapHoldMode;
- (void)_simulatePop;
- (void)_simulatePreviewActionGesture;
- (void)_startLabelElementSoundPlay;
- (void)_startScribbleTapAndHoldModeTimeout;
- (void)_startTouchDownForTapAndHoldActionWithCenter:(id)a3 force:(id)a4 altitude:(id)a5 azimuth:(id)a6;
- (void)_stopMemorizingSession;
- (void)_switchToTrackingMode;
- (void)_systemControlLocationTimer;
- (void)_tapHoldFired:(id)a3;
- (void)_threeFingerHoldFired;
- (void)_touchDownAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6;
- (void)_touchDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6;
- (void)_touchLiftAtPoint:(CGPoint)a3;
- (void)_transitionToGestureState:(unint64_t)a3;
- (void)_transitionToGestureState:(unint64_t)a3 playHaptic:(BOOL)a4;
- (void)_updateCurrentElementOrbGestureMode;
- (void)_updateDelayUntilSpeakUnderTouch;
- (void)_updateFirstnessOfTrackingEvent:(id)a3;
- (void)_updateTapSpeedFromPreferences;
- (void)_updateVoiceOverHandGesturesActionCustomizations;
- (void)_volumeChangeTimer;
- (void)_wakeTapFired;
- (void)brailleGestureManager:(id)a3 setForcedOrientation:(int64_t)a4 shouldAnnounce:(BOOL)a5;
- (void)brailleGestureManager:(id)a3 unsetForcedOrientationAndAnnounce:(BOOL)a4;
- (void)cancelTapAndHold:(CGPoint)a3;
- (void)currentElementDidUpdate:(id)a3;
- (void)dealloc;
- (void)directInteractionElementsUpdated:(id)a3;
- (void)directInteractionModeStatus:(BOOL)a3;
- (void)firstResponderDidUpdate:(id)a3;
- (void)gestureFactoryDidBeginSplitGesture:(id)a3;
- (void)gestureSplitTappingCallbackWithFactory:(id)a3;
- (void)gestureTappingCallbackWithFactory:(id)a3;
- (void)gestureTrackingCallbackWithFactory:(id)a3;
- (void)gesturedTextInputManager:(id)a3 accessCurrentGesturedTextInputElement:(id)a4;
- (void)gesturedTextInputManager:(id)a3 moveToElementMatchingRotorType:(int64_t)a4 inDirection:(int64_t)a5;
- (void)nowPlayingChanged:(id)a3;
- (void)processEvent:(id)a3;
- (void)resetEventFactory;
- (void)screenLockOccurred;
- (void)setAudioAccHeldEventForRepost:(id)a3;
- (void)setAudioAccHeldUpEventForRepost:(id)a3;
- (void)setAudioAccTapDownEventForRepost:(id)a3;
- (void)setAudioAccTapUpEventForRepost:(id)a3;
- (void)setCurrentElement:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectTouchManager:(id)a3;
- (void)setElementManager:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)setGestureFactory:(id)a3;
- (void)setLastGestureEvent:(id)a3;
- (void)setLastTouchedDirectTouchElement:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setRotorManager:(id)a3;
- (void)shutdown;
- (void)startTapAndHoldMode:(BOOL)a3;
- (void)unregisterForEvents;
- (void)updateOrientation;
@end

@implementation VOTEventFactory

- (void)setGestureFactory:(id)a3
{
}

- (id)gestureFactory
{
  return self->_gestureFactory;
}

- (id)_brailleGestureManager
{
  brailleGestureManager = self->_brailleGestureManager;
  if (!brailleGestureManager)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___VOTBrailleGestureManager);
    v5 = self->_brailleGestureManager;
    self->_brailleGestureManager = v4;

    -[VOTGesturedTextInputManager setDelegate:](self->_brailleGestureManager, "setDelegate:", self);
    -[VOTBrailleGestureManager setBrailleGestureManagerDelegate:]( self->_brailleGestureManager,  "setBrailleGestureManagerDelegate:",  self);
    brailleGestureManager = self->_brailleGestureManager;
  }

  return brailleGestureManager;
}

- (BOOL)brailleInputActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (int64_t)brailleInputTypingMode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  id v3 = [v2 typingMode];

  return (int64_t)v3;
}

- (BOOL)brailleInputAllowsElementMovement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  unsigned __int8 v3 = [v2 allowsElementMovement];

  return v3;
}

- (BOOL)brailleInputWantsToStayActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  unsigned __int8 v3 = [v2 wantsToStayActive];

  return v3;
}

- (BOOL)brailleInputShouldBeDeactivatedByEscape
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  unsigned __int8 v3 = [v2 shouldBeDeactivatedByEscape];

  return v3;
}

- (id)_mapsExplorationGestureManager
{
  mapsExplorationGestureManager = self->_mapsExplorationGestureManager;
  if (!mapsExplorationGestureManager)
  {
    v4 = objc_opt_new(&OBJC_CLASS___VOTMapsExplorationGestureManager);
    v5 = self->_mapsExplorationGestureManager;
    self->_mapsExplorationGestureManager = v4;

    -[VOTGesturedTextInputManager setDelegate:](self->_mapsExplorationGestureManager, "setDelegate:", self);
    mapsExplorationGestureManager = self->_mapsExplorationGestureManager;
  }

  return mapsExplorationGestureManager;
}

- (BOOL)mapsExplorationInputActive
{
  mapsExplorationGestureManager = self->_mapsExplorationGestureManager;
  if (mapsExplorationGestureManager) {
    LOBYTE(mapsExplorationGestureManager) = -[VOTGesturedTextInputManager isActive]( mapsExplorationGestureManager,  "isActive");
  }
  return (char)mapsExplorationGestureManager;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___VOTEventFactory, a2) == a1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
    [v2 registerInterestInZoomAttributes];
  }

- (VOTEventFactory)init
{
  v89.receiver = self;
  v89.super_class = (Class)&OBJC_CLASS___VOTEventFactory;
  id v2 = -[VOTEventFactory init](&v89, "init");
  if (v2)
  {
    double v3 = AXDeviceSizeMM();
    double v5 = v4;
    v6 = (SCRCGestureFactory *)objc_msgSend( objc_allocWithZone((Class)SCRCGestureFactory),  "initWithSize:delegate:threadKey:",  v2,  0,  v3,  v4);
    gestureFactory = v2->_gestureFactory;
    v2->_gestureFactory = v6;

    if (v3 >= v5) {
      double v8 = v3;
    }
    else {
      double v8 = v5;
    }
    double v9 = v8 / 74.0;
    double v10 = (0.9 / v9 + -0.9) / 0.6;
    BOOL v11 = v9 <= 0.5;
    double v12 = 1.5;
    if (!v11) {
      double v12 = v10;
    }
    -[SCRCGestureFactory setFlickSpeed:](v2->_gestureFactory, "setFlickSpeed:", v12);
    -[VOTEventFactory _updateTapSpeedFromPreferences](v2, "_updateTapSpeedFromPreferences");
    v2->_currentElementLock._os_unfair_lock_opaque = 0;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    tapAndHoldContextIds = v2->_tapAndHoldContextIds;
    v2->_tapAndHoldContextIds = v13;

    v2->_tapAndHoldLock._os_unfair_lock_opaque = 0;
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    previewFingerContextId = v2->_previewFingerContextId;
    v2->_previewFingerContextId = v15;

    v17 = -[SCRCThreadKey initWithObject:](objc_alloc(&OBJC_CLASS___SCRCThreadKey), "initWithObject:", v2);
    threadKey = v2->_threadKey;
    v2->_threadKey = v17;

    v19 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_tapHoldFired:" threadKey:0];
    tapHoldTimer = v2->_tapHoldTimer;
    v2->_tapHoldTimer = v19;

    v21 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_outputElementSummaryFired" threadKey:0];
    elementSummaryTimer = v2->_elementSummaryTimer;
    v2->_elementSummaryTimer = v21;

    v23 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_twoFingerHoldFired" threadKey:0];
    twoFingerHoldTimer = v2->_twoFingerHoldTimer;
    v2->_twoFingerHoldTimer = v23;

    v25 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_threeFingerHoldFired" threadKey:0];
    threeFingerHoldTimer = v2->_threeFingerHoldTimer;
    v2->_threeFingerHoldTimer = v25;

    v27 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_startLabelElementSoundPlay" threadKey:0];
    memorizeSoundTimer = v2->_memorizeSoundTimer;
    v2->_memorizeSoundTimer = v27;

    v29 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_systemControlLocationTimer" threadKey:0];
    systemControlLocationTimer = v2->_systemControlLocationTimer;
    v2->_systemControlLocationTimer = v29;

    v31 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_volumeChangeTimer" threadKey:0];
    volumeChangeTimer = v2->_volumeChangeTimer;
    v2->_volumeChangeTimer = v31;

    v33 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_wakeTapFired" threadKey:0];
    wakeTapTimer = v2->_wakeTapTimer;
    v2->_wakeTapTimer = v33;

    v35 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_audioAccProcessTapUpdates" threadKey:0];
    audioAccTapTimer = v2->_audioAccTapTimer;
    v2->_audioAccTapTimer = v35;

    v37 = (SCRCTargetSelectorTimer *)[objc_allocWithZone(SCRCTargetSelectorTimer) initWithTarget:v2 selector:"_edgePanGestureSpeakHintTimerFired" threadKey:0];
    edgePanGestureSpeakHintTimer = v2->_edgePanGestureSpeakHintTimer;
    v2->_edgePanGestureSpeakHintTimer = v37;

    objc_initWeak(&location, v2);
    v39 = -[VOTClickAndHoldButtonInterceptor initWithThreadKey:]( objc_alloc(&OBJC_CLASS___VOTClickAndHoldButtonInterceptor),  "initWithThreadKey:",  v2->_threadKey);
    playButtonInterceptor = v2->_playButtonInterceptor;
    v2->_playButtonInterceptor = v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v41 voiceOverDoubleTapInterval];
    -[VOTClickAndHoldButtonInterceptor setReleaseDuration:](v2->_playButtonInterceptor, "setReleaseDuration:");

    -[VOTClickAndHoldButtonInterceptor setClickHandler:]( v2->_playButtonInterceptor,  "setClickHandler:",  &stru_100179708);
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472LL;
    v86[2] = sub_1000AB2FC;
    v86[3] = &unk_100176F08;
    objc_copyWeak(&v87, &location);
    -[VOTClickAndHoldButtonInterceptor setHoldHandler:](v2->_playButtonInterceptor, "setHoldHandler:", v86);
    -[VOTClickAndHoldButtonInterceptor setClickAndHoldHandler:]( v2->_playButtonInterceptor,  "setClickAndHoldHandler:",  &stru_100179728);
    v42 = objc_alloc(&OBJC_CLASS___VOTSimpleClickButtonInterceptor);
    v43 = v2->_threadKey;
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472LL;
    v84[2] = sub_1000AB3CC;
    v84[3] = &unk_100179750;
    objc_copyWeak(&v85, &location);
    v44 = -[VOTSimpleClickButtonInterceptor initWithThreadKey:simpleClickHandler:]( v42,  "initWithThreadKey:simpleClickHandler:",  v43,  v84);
    v70 = &v85;
    selectButtonInterceptor = v2->_selectButtonInterceptor;
    v2->_selectButtonInterceptor = v44;

    v46 = objc_alloc(&OBJC_CLASS___VOTSimpleClickButtonInterceptor);
    v47 = v2->_threadKey;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472LL;
    v82[2] = sub_1000AB418;
    v82[3] = &unk_100179750;
    objc_copyWeak(&v83, &location);
    v48 = -[VOTSimpleClickButtonInterceptor initWithThreadKey:simpleClickHandler:]( v46,  "initWithThreadKey:simpleClickHandler:",  v47,  v82);
    menuButtonInterceptor = v2->_menuButtonInterceptor;
    v2->_menuButtonInterceptor = v48;

    if (AXDeviceIsAudioAccessory(v50, v51))
    {
      MRMediaRemoteSetCanBeNowPlayingApplication(0LL);
      v52 = &_dispatch_main_q;
      MRMediaRemoteRegisterForNowPlayingNotifications(&_dispatch_main_q);

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", &v85));
      [v53 addObserver:v2 selector:"nowPlayingChanged:" name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];

      -[VOTEventFactory nowPlayingChanged:](v2, "nowPlayingChanged:", 0LL);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", v70));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](&OBJC_CLASS___NSOperationQueue, "currentQueue"));
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472LL;
    v80[2] = sub_1000AB464;
    v80[3] = &unk_100176D60;
    v56 = v2;
    v81 = v56;
    id v57 =  [v54 addObserverForName:@"VOTRotorChangedNotification" object:0 queue:v55 usingBlock:v80];

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](&OBJC_CLASS___NSOperationQueue, "currentQueue"));
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472LL;
    v78[2] = sub_1000AB470;
    v78[3] = &unk_100176D60;
    v60 = v56;
    v79 = v60;
    id v61 =  [v58 addObserverForName:@"VOTBSIStateChangedNotification" object:0 queue:v59 usingBlock:v78];

    v60->_lastNativeSlideCancel = -3061152000.0;
    v60->_lastTwoFingerSlideTime = -3061152000.0;
    v60->_rotateStartTime = -3061152000.0;
    v60->_systemControlFingerDownFollowupTime = 1.1;
    v60->_lastEdgePressTime = CFAbsoluteTimeGetCurrent();
    -[VOTEventFactory _registerForIOHIDUsage](v60, "_registerForIOHIDUsage");
    -[VOTEventFactory _updateDelayUntilSpeakUnderTouch](v60, "_updateDelayUntilSpeakUnderTouch");
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_1000AB47C;
    v76[3] = &unk_100176F08;
    objc_copyWeak(&v77, &location);
    [v62 registerUpdateBlock:v76 forRetrieveSelector:"voiceOverDelayUntilSpeakUnderTouch" withListener:v60];

    objc_destroyWeak(&v77);
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472LL;
    v74[2] = sub_1000AB4A8;
    v74[3] = &unk_100176F08;
    objc_copyWeak(&v75, &location);
    [v63 registerUpdateBlock:v74 forRetrieveSelector:"voiceOverDoubleTapInterval" withListener:v60];

    objc_destroyWeak(&v75);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    uint64_t v65 = objc_claimAutoreleasedReturnValue([v64 voiceOverHandGesturesActionCustomizations]);
    handGestureCommandDict = v60->_handGestureCommandDict;
    v60->_handGestureCommandDict = (NSDictionary *)v65;

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472LL;
    v72[2] = sub_1000AB4D4;
    v72[3] = &unk_100176F08;
    objc_copyWeak(&v73, &location);
    [v67 registerUpdateBlock:v72 forRetrieveSelector:"voiceOverHandGesturesActionCustomizations" withListener:v60];

    objc_destroyWeak(&v73);
    v68 = v60;

    objc_destroyWeak(&v83);
    objc_destroyWeak(v71);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)_updateDelayUntilSpeakUnderTouch
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 voiceOverDelayUntilSpeakUnderTouch];
  self->_delayUntilSpeakInterval = v3;
}

- (void)_updateTapSpeedFromPreferences
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 voiceOverDoubleTapInterval];
  double v5 = (v4 - kAXSVoiceOverDoubleTapIntervalMin)
     / (kAXSVoiceOverDoubleTapIntervalMax - kAXSVoiceOverDoubleTapIntervalMin)
     * -2.0
     + 1.0;

  -[SCRCGestureFactory setTapSpeed:](self->_gestureFactory, "setTapSpeed:", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 voiceOverDoubleTapInterval];
  -[VOTClickAndHoldButtonInterceptor setReleaseDuration:](self->_playButtonInterceptor, "setReleaseDuration:");
}

- (BOOL)shouldSnarfEventForTapWakeGesture:(id)a3
{
  return vabdd_f64(sub_1000AB630((unint64_t)[a3 HIDTime]), self->_lastWatchWakeUpTime) < 0.699999988;
}

- (void)_wakeTapFired
{
  unint64_t watchWakeTapCount = self->_watchWakeTapCount;
  if (watchWakeTapCount == 2)
  {
    double v10 = &kVOTEventCommandWatchWakeDoubleTap;
    goto LABEL_16;
  }

  if (watchWakeTapCount == 1)
  {
    if (-[NSMutableArray count](self->_snarfedWatchWakeRecords, "count"))
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      double v4 = self->_snarfedWatchWakeRecords;
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            double v9 = (void *)objc_claimAutoreleasedReturnValue( +[VOTGestureEvent gestureEventWithEventRepresentation:]( &OBJC_CLASS___VOTGestureEvent,  "gestureEventWithEventRepresentation:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11));
            -[VOTEventFactory _processGestureEvent:](self, "_processGestureEvent:", v9);
          }

          id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
        }

        while (v6);
      }

      goto LABEL_17;
    }

    double v10 = &kVOTEventCommandWatchWakeTap;
LABEL_16:
    double v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[VOTEvent internalEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "internalEventWithCommand:info:",  *v10,  0LL));
    -[VOTEventFactory processEvent:](self, "processEvent:", v4);
LABEL_17:

    goto LABEL_18;
  }

  if (watchWakeTapCount >= 3)
  {
    double v10 = &kVOTEventCommandWatchWakeTripleTap;
    goto LABEL_16;
  }

- (id)_denormalizeEventRepresentation:(id)a3
{
  return [a3 denormalizedEventRepresentation:0 descale:1];
}

- (void)_handleIOHIDEvent:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _denormalizeEventRepresentation:](self, "_denormalizeEventRepresentation:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v6 = [v5 voiceOverUseTVToggleStyleNavigation];

  if (v6)
  {
    uint64_t v7 = (void *)VOTSharedWorkspace;
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    objc_msgSend(v7, "setTvInteractionModeWithoutSaving:", objc_msgSend(v8, "voiceOverPreferredTVInteractionMode"));
  }

  id v9 = [v4 type];
  if ((_DWORD)v9 == 3001)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    if ([v10 eventType] == 1)
    {

LABEL_8:
      id v9 = -[VOTEventFactory _commitDeferredZoomInfo](self, "_commitDeferredZoomInfo");
      goto LABEL_10;
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    if ([v11 eventType] != 5)
    {

      goto LABEL_10;
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 paths]);
    id v14 = [v13 count];

    if (v14 == (id)1) {
      goto LABEL_8;
    }
  }

- (id)_preprocessEventForSimulator:(id)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue([a3 denormalizedEventRepresentation:1 descale:1]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 paths]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstPath]);
  [v6 pathLocation];
  double v8 = v7;
  double v10 = v9;

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  id v12 = objc_msgSend(v11, "contextIdForPosition:", v8, v10);

  [v3 setContextId:v12];
  v13.n128_f64[0] = v8;
  v14.n128_f64[0] = v10;
  double v15 = AXConvertPointToHostedCoordinates(v12, 0LL, v13, v14);
  double v16 = _AXUIScreenConvertToCAScreen(0LL, v15);
  double v18 = v17;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 handInfo]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 paths]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstPath]);
  objc_msgSend(v21, "setPathLocation:", v16, v18);

  return v3;
}

- (BOOL)_atvEventFilter:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && [v4 type]
    && [v5 senderID] != (id)0x8000000817319373
    && [v5 senderID] != (id)0x8000000817319375)
  {
    if ([v5 type] == 3001)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory elementManager](self, "elementManager"));
      uint64_t v6 = (uint64_t)[v8 inDirectTouchMode];

      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory elementManager](self, "elementManager"));
      unsigned int v10 = [v9 tvIsInteractingWithRotor];

      unsigned int v11 = -[VOTSimpleClickButtonInterceptor touchEventOccurred:inTVDirectTouch:]( self->_selectButtonInterceptor,  "touchEventOccurred:inTVDirectTouch:",  v5,  v6);
      if (!(_DWORD)v6 || (v10 & 1) == 0 && (unint64_t)[v5 fingerCount] < 2)
      {
        LOBYTE(v6) = v6 ^ 1;
        if (!(v11 ^ 1 | v10)) {
          goto LABEL_6;
        }
LABEL_17:
        -[VOTEventFactory performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_handleIOHIDEvent:",  v5,  0LL);
        goto LABEL_7;
      }

- (BOOL)_audioAccessoryEventFilter:(id)a3
{
  id v4 = a3;
  if ([v4 senderID] == (id)0x8000000817319373) {
    goto LABEL_13;
  }
  id v5 = [v4 creatorHIDEvent];
  if (!v5) {
    goto LABEL_13;
  }
  id v6 = v5;
  if (((uint64_t (*)(void))IOHIDEventGetType)() != 11)
  {
    if (IOHIDEventGetType(v6) == 3 && IOHIDEventGetIntegerValue(v6, 196608LL) == 12)
    {
      char Phase = IOHIDEventGetPhase(v6);
      uint64_t IntegerValue = IOHIDEventGetIntegerValue(v6, 196609LL);
      uint64_t v14 = IOHIDEventGetIntegerValue(v6, 196610LL);
      uint64_t v9 = IOHIDEventGetIntegerValue(v6, 196613LL);
      switch(IntegerValue)
      {
        case 205LL:
          uint64_t v11 = 3LL;
          goto LABEL_28;
        case 234LL:
          uint64_t v11 = 1LL;
          goto LABEL_28;
        case 233LL:
          uint64_t v11 = 2LL;
LABEL_28:
          if (Phase < 0)
          {
            int v18 = 1;
          }

          else if ((Phase & 8) != 0)
          {
            int v18 = 6;
          }

          else if (v14 != 1 || v9 == 1)
          {
            int v18 = 4 * (v9 == 1);
            if (v14 != 1) {
              int v18 = 5;
            }
          }

          else
          {
            int v18 = 3;
          }

          if ((Phase & 2) != 0 && v14 == 1) {
            int v17 = 2;
          }
          else {
            int v17 = v18;
          }
          goto LABEL_49;
      }
    }

- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4
{
}

- (void)_audioAccPostEvent:(id)a3 withButton:(unint64_t)a4 timeOffset:(double)a5
{
  id v8 = a3;
  id v21 = v8;
  if (!self->_audioAccIOSystemPostBackClient)
  {
    self->_audioAccIOSystemPostBackClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault);
    id v8 = v21;
  }

  id v9 = [v8 creatorHIDEvent];
  if (self->_audioAccIOSystemPostBackClient) {
    BOOL v10 = v9 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = v9;
    int Type = IOHIDEventGetType(v9);
    int v13 = Type;
    uint64_t v14 = 2LL;
    if (Type == 3) {
      uint64_t v14 = 234LL;
    }
    uint64_t v15 = 3LL;
    if (Type == 3) {
      uint64_t v15 = 233LL;
    }
    uint64_t v16 = 205LL;
    if (Type != 3) {
      uint64_t v16 = 1LL;
    }
    if (a4 != 3) {
      uint64_t v16 = 0LL;
    }
    if (a4 != 2) {
      uint64_t v15 = v16;
    }
    if (a4 == 1) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = v15;
    }
    IOHIDEventSetSenderID(v11, 0x8000000817319373LL);
    uint64_t v18 = mach_absolute_time();
    double v19 = sub_1000AB630(0xF4240uLL);
    IOHIDEventSetTimeStamp(v11, (unint64_t)((double)v18 + a5 / v19 * 1000000.0));
    if (v13 == 3) {
      uint64_t v20 = 196609LL;
    }
    else {
      uint64_t v20 = 720897LL;
    }
    IOHIDEventSetIntegerValue(v11, v20, v17);
    IOHIDEventSystemClientDispatchEvent(self->_audioAccIOSystemPostBackClient, v11);
  }
}

- (void)_audioAccAnnounceButton
{
  float v19 = 1.0;
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  [v3 getVolume:&v19 category:@"Audio/Video" mode:0 route:@"Speaker" deviceIdentifier:@"PuffinOutput" routeSubtype:0];

  double v4 = v19;
  if (v19 < 0.03)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory audioAccTapDownEventForRepost](self, "audioAccTapDownEventForRepost", v4));
    -[VOTEventFactory _audioAccPostEvent:withButton:](self, "_audioAccPostEvent:withButton:", v5, 2LL);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory audioAccTapUpEventForRepost](self, "audioAccTapUpEventForRepost"));
    -[VOTEventFactory _audioAccPostEvent:withButton:](self, "_audioAccPostEvent:withButton:", v6, 2LL);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences", v4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 languageCode]);

  unint64_t currentSoundButton = self->_currentSoundButton;
  switch(currentSoundButton)
  {
    case 3uLL:
      unint64_t v11 = (unint64_t)[(id)VOTSharedWorkspace systemVisualizationState] - 1;
      if (v11 > 0xD || ((0x3FBBu >> v11) & 1) == 0) {
        goto LABEL_13;
      }
      BOOL v10 = off_1001798A0[v11];
      break;
    case 2uLL:
      BOOL v10 = @"volume.up.button";
      break;
    case 1uLL:
      BOOL v10 = @"volume.down.button";
      break;
    default:
LABEL_13:
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      uint64_t v17 = (AXIndexMap *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent NoItemExists](&OBJC_CLASS___VOSOutputEvent, "NoItemExists"));
      [v14 sendEvent:v17];
      goto LABEL_14;
  }

  id v12 = sub_10004AE68(off_1001AC148, v10, 0LL, v8);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidFocusOnElement](&OBJC_CLASS___VOSOutputEvent, "DidFocusOnElement"));
  [v15 sendEvent:v16];

  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___AXIndexMap);
  -[AXIndexMap setObject:forIndex:](v17, "setObject:forIndex:", v14, 116LL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent internalEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "internalEventWithCommand:info:",  kVOTEventCommandAnnouncement,  v17));
  -[VOTEventFactory processEvent:](self, "processEvent:", v18);

LABEL_14:
}

- (void)_audioAccProcessTapUpdates
{
  unint64_t v3 = 0LL;
  unint64_t v4 = 0LL;
  char v5 = 0;
  char v6 = 0;
  int v7 = 0;
  unsigned __int8 v8 = 0;
  unsigned __int8 v9 = 0;
  unint64_t currentSoundButton = self->_currentSoundButton;
  unint64_t v11 = currentSoundButton;
  p_heldUp = &self->_audioAccButtonStates[0].heldUp;
  for (uint64_t i = 1LL; i != 4; ++i)
  {
    v5 |= *(p_heldUp - 4);
    if (*(p_heldUp - 4)) {
      unint64_t v4 = i;
    }
    v9 |= *(p_heldUp - 2);
    v7 |= *(p_heldUp - 1);
    v6 |= *p_heldUp;
    v8 |= *(p_heldUp - 3);
    if (*(p_heldUp - 3)) {
      unint64_t v3 = i;
    }
    p_heldUp += 5;
  }

  if ((v5 & 1) != 0)
  {
    if (!currentSoundButton)
    {
      self->_unint64_t currentSoundButton = v4;
      unint64_t v11 = v4;
    }

    unint64_t audioAccTouchGeneration = self->_audioAccTouchGeneration;
    if (self->_audioAccPendingGeneration != audioAccTouchGeneration)
    {
      self->_unint64_t pendingSoundButton = v4;
      self->_audioAccPendingGeneration = audioAccTouchGeneration;
      self->_audioAccLastDownTime = CFAbsoluteTimeGetCurrent();
      -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_audioAccTapTimer, "dispatchAfterDelay:", 0.100000001);
      unint64_t v11 = self->_currentSoundButton;
    }
  }

  if (((v11 != 0) & v8) == 1 && !self->_audioAccTapCount)
  {
    self->_unint64_t currentSoundButton = v3;
    self->_unint64_t pendingSoundButton = 0LL;
    if ((v5 & 1) == 0) {
      goto LABEL_21;
    }
  }

  else if ((v5 & 1) == 0)
  {
    goto LABEL_21;
  }

  if (self->_audioAccTapCount
    || !self->_pendingSoundButton
    || CFAbsoluteTimeGetCurrent() - self->_audioAccLastDownTime <= 0.0990000015)
  {
LABEL_21:
    char v15 = 0;
    if ((v7 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }

  self->_unint64_t currentSoundButton = self->_pendingSoundButton;
  self->_unint64_t pendingSoundButton = 0LL;
  char v15 = 1;
  if ((v7 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_22:
  if (self->_audioAccTapCount)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory audioAccTapDownEventForRepost](self, "audioAccTapDownEventForRepost"));
    -[VOTEventFactory _audioAccPostEvent:withButton:]( self,  "_audioAccPostEvent:withButton:",  v16,  self->_currentSoundButton);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory audioAccHeldEventForRepost](self, "audioAccHeldEventForRepost"));
    -[VOTEventFactory _audioAccPostEvent:withButton:]( self,  "_audioAccPostEvent:withButton:",  v17,  self->_currentSoundButton);

    self->_audioAccHoldSent = 1;
    self->_unint64_t audioAccTapCount = 0LL;
  }

- (void)nowPlayingChanged:(id)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  char v5 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000ACEE8;
  v6[3] = &unk_100179780;
  v6[4] = self;
  MRMediaRemoteGetNowPlayingApplicationIsPlaying(v5, v6);
}

- (BOOL)_iosEventFilter:(id)a3
{
  id v4 = a3;
  if ([v4 senderID] == (id)0x8000000817319373
    || [v4 senderID] == (id)0x8000000817319375
    || [v4 senderID] == (id)0x8000000817319372
    || [v4 type] == 1013
    || [v4 type] == 1012)
  {
    goto LABEL_6;
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
  if ([v7 keyCode] == 10)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
    BOOL v9 = [v8 usagePage] == 255;
  }

  else
  {
    BOOL v9 = 0;
  }

  BOOL v5 = 0;
  if (v4 && !v9)
  {
    if (![v4 type]
      || (AXEventTypeIsHomeButtonPress([v4 type]) & 1) != 0
      || (AXEventTypeIsLockButtonPress([v4 type]) & 1) != 0)
    {
      goto LABEL_6;
    }

    if (AXEventTypeIsVolumeButtonPress([v4 type]))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained handleTurnOffSoundAndCurtainEvent:v4];

LABEL_6:
      BOOL v5 = 0;
      goto LABEL_7;
    }

    if ([v4 senderID] == (id)0x8000000817319375) {
      goto LABEL_6;
    }
    if ([v4 type] == 3001)
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
      unsigned int v12 = [v11 eventType];

      if (v12 == 12) {
        goto LABEL_6;
      }
    }

    if ([v4 type] == 1100)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory elementManager](self, "elementManager"));
      unsigned int v14 = [v13 shouldSnarfCrown];

      if (!v14) {
        goto LABEL_6;
      }
    }

    BOOL v15 = [v4 type] != 1102 && objc_msgSend(v4, "type") != 1101;
    if ([v4 type] == 5000)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityData]);
      id v17 = [v16 page];

      if (v17 == (id)2)
      {
        unsigned __int8 v18 = -[VOTEventFactory _handleVoiceOverGreySupportAccessibilityEvent:]( self,  "_handleVoiceOverGreySupportAccessibilityEvent:",  v4);
LABEL_32:
        BOOL v5 = v18;
        goto LABEL_7;
      }
    }

    if ([v4 type] == 5000)
    {
      unsigned __int8 v18 = -[VOTEventFactory _handleAccessibilityEvent:](self, "_handleAccessibilityEvent:", v4);
      goto LABEL_32;
    }

    -[VOTEventFactory performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_handleIOHIDEvent:",  v4,  0LL);
    CFAbsoluteTime v19 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 paths]);

    if ((self->_flags.allowingSystemGesturePassthrough
       || v20
       && (id v24 = [v20 count], (unint64_t)v24 >= 5)
       && AXDeviceIsPad(v24, v25)
       && !self->_flags.sendingToDirectTouch)
      && (CFAbsoluteTime v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _currentGesturedTextInputManager](self, "_currentGesturedTextInputManager")),
          v21,
          !v21))
    {
      if (v20 && [v20 count])
      {
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
        BOOL v23 = [v22 currentFingerCount] != 0;
      }

      else
      {
        BOOL v23 = 0;
      }

      BOOL v26 = 0;
      self->_flags.allowingSystemGesturePassthrough = v23;
    }

    else
    {
      BOOL v26 = [v4 type] != 1042 && objc_msgSend(v4, "type") != 1043 && v15;
    }

    BOOL v5 = v26;
  }

- (void)_registerForIOHIDUsage
{
  unint64_t v3 = -[AXEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( objc_alloc(&OBJC_CLASS___AXEventProcessor),  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  @"VoiceOverTouch",  15LL,  0LL,  15LL);
  -[VOTEventFactory setEventProcessor:](self, "setEventProcessor:", v3);

  uint64_t IsAudioAccessory = AXDeviceIsAudioAccessory(v4, v5);
  if ((_DWORD)IsAudioAccessory)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory eventProcessor](self, "eventProcessor"));
    unsigned __int8 v8 = v7;
    uint64_t v9 = 3LL;
  }

  else
  {
    int IsTV = AXDeviceIsTV(IsAudioAccessory);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory eventProcessor](self, "eventProcessor"));
    unsigned __int8 v8 = v7;
    if (IsTV) {
      uint64_t v9 = 256LL;
    }
    else {
      uint64_t v9 = 171LL;
    }
  }

  [v7 setHIDEventFilterMask:v9];

  objc_initWeak(&location, self);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory eventProcessor](self, "eventProcessor"));
  [v11 setFailedToHandleEventInTime:&stru_1001797C0];

  uint64_t v14 = AXDeviceIsAudioAccessory(v12, v13);
  LOBYTE(v11) = v14;
  char v15 = AXDeviceIsTV(v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000AD494;
  v18[3] = &unk_1001797E8;
  char v20 = (char)v11;
  objc_copyWeak(&v19, &location);
  char v21 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory eventProcessor](self, "eventProcessor"));
  [v16 setHIDEventHandler:v18];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory eventProcessor](self, "eventProcessor"));
  [v17 beginHandlingHIDEventsForReason:@"VoiceOver wants them"];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

+ (void)_updateZoomFrame:(CGRect)a3
{
  *(CGRect *)ymmword_1001ACF70 = a3;
}

- (void)_registerForZoomListener
{
  if (!self->_zoomListenerIdentifier)
  {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000AD608;
    v7[3] = &unk_100179810;
    v7[4] = self;
    uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue([v3 registerForCoalescedZoomAttributesWithChangedHandler:v7 onDisplay:0]);
    zoomListenerIdentifier = self->_zoomListenerIdentifier;
    self->_zoomListenerIdentifier = v4;

    if (!self->_zoomListenerIdentifier)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000AD734,  kAXSZoomTouchEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }

- (void)shutdown
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory eventProcessor](self, "eventProcessor"));
  [v3 endHandlingHIDEventsForReason:@"VoiceOver wants them"];

  -[VOTEventFactory setEventProcessor:](self, "setEventProcessor:", 0LL);
  -[VOTEventFactory unregisterForEvents](self, "unregisterForEvents");
}

- (void)dealloc
{
  if (self->_axEventObserver)
  {
    -[VOTEventFactory _registerForAXNotifications:](self, "_registerForAXNotifications:", 0LL);
    CFRelease(self->_axEventObserver);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSZoomTouchEnabledNotification, 0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
  [v4 removeCoalescedZoomAttributesChangedHandler:self->_zoomListenerIdentifier];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory eventProcessor](self, "eventProcessor"));
  [v5 cleanup];

  previewFingerContextId = self->_previewFingerContextId;
  self->_previewFingerContextId = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_systemControlLocationTimer, "invalidate");
  systemControlLocationTimer = self->_systemControlLocationTimer;
  self->_systemControlLocationTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_tapHoldTimer, "invalidate");
  tapHoldTimer = self->_tapHoldTimer;
  self->_tapHoldTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_elementSummaryTimer, "invalidate");
  elementSummaryTimer = self->_elementSummaryTimer;
  self->_elementSummaryTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_twoFingerHoldTimer, "invalidate");
  twoFingerHoldTimer = self->_twoFingerHoldTimer;
  self->_twoFingerHoldTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_threeFingerHoldTimer, "invalidate");
  threeFingerHoldTimer = self->_threeFingerHoldTimer;
  self->_threeFingerHoldTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_memorizeSoundTimer, "invalidate");
  memorizeSoundTimer = self->_memorizeSoundTimer;
  self->_memorizeSoundTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_volumeChangeTimer, "invalidate");
  volumeChangeTimer = self->_volumeChangeTimer;
  self->_volumeChangeTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_wakeTapTimer, "invalidate");
  wakeTapTimer = self->_wakeTapTimer;
  self->_wakeTapTimer = 0LL;

  -[SCRCTargetSelectorTimer invalidate](self->_edgePanGestureSpeakHintTimer, "invalidate");
  edgePanGestureSpeakHintTimer = self->_edgePanGestureSpeakHintTimer;
  self->_edgePanGestureSpeakHintTimer = 0LL;

  -[VOTBrailleGestureManager setBrailleGestureManagerDelegate:]( self->_brailleGestureManager,  "setBrailleGestureManagerDelegate:",  0LL);
  -[VOTGesturedTextInputManager setDelegate:](self->_brailleGestureManager, "setDelegate:", 0LL);
  -[VOTMapsExplorationGestureManager setMapsExplorationGestureManagerDelegate:]( self->_mapsExplorationGestureManager,  "setMapsExplorationGestureManagerDelegate:",  0LL);
  playButtonInterceptor = self->_playButtonInterceptor;
  self->_playButtonInterceptor = 0LL;

  selectButtonInterceptor = self->_selectButtonInterceptor;
  self->_selectButtonInterceptor = 0LL;

  menuButtonInterceptor = self->_menuButtonInterceptor;
  self->_menuButtonInterceptor = 0LL;

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___VOTEventFactory;
  -[VOTEventFactory dealloc](&v19, "dealloc");
}

- (void)screenLockOccurred
{
}

- (void)_handleRotorChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"kVOTRotorChangedNotificationOldRotor"]);
  uint64_t v7 = (int)[v6 intValue];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"kVOTRotorChangedNotificationNewRotor"]);
  signed int v10 = [v9 intValue];

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  [v11 setActive:v10 == 55];

  if (sub_1000D3070(v10) && !sub_1000D3070(v7))
  {
    uint64_t v15 = VOTLogHandwriting();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Posting AXVoiceOverDidEnableGesturedTextInputNotification",  buf,  2u);
    }

    uint64_t v14 = (CFNotificationName *)&AXVoiceOverDidEnableGesturedTextInputNotification;
    goto LABEL_11;
  }

  if (!sub_1000D3070(v10) && sub_1000D3070(v7))
  {
    uint64_t v12 = VOTLogHandwriting();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Posting AXVoiceOverDidDisableGesturedTextInputNotification",  v17,  2u);
    }

    uint64_t v14 = (CFNotificationName *)&AXVoiceOverDidDisableGesturedTextInputNotification;
LABEL_11:

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, *v14, 0LL, 0LL, 1u);
  }

- (void)_handleBSIStateChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"VOTBSIStateChangedNotificationActive"]);
  id v7 = [v6 BOOLValue];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"VOTBSIStateChangedNotificationUsage"]);
  id v10 = [v9 integerValue];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  [v11 setActive:v7 usage:v10];
}

- (void)resetEventFactory
{
}

- (void)unregisterForEvents
{
  if (self->_axEventObserver)
  {
    -[VOTEventFactory _registerForAXNotifications:](self, "_registerForAXNotifications:", 0LL);
    CFRelease(self->_axEventObserver);
    self->_axEventObserver = 0LL;
  }

  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
  [v3 removeCoalescedZoomAttributesChangedHandler:self->_zoomListenerIdentifier];

  zoomListenerIdentifier = self->_zoomListenerIdentifier;
  self->_zoomListenerIdentifier = 0LL;
}

- (BOOL)registerForEvents
{
  uint64_t IsAudioAccessory = AXDeviceIsAudioAccessory(self, a2);
  if ((IsAudioAccessory & 1) != 0) {
    return 0;
  }
  uint64_t v5 = VOTLogEvent(IsAudioAccessory, v4);
  char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering for GS Events", buf, 2u);
  }

  AXUIElementRegisterSystemWideServerDeathCallback(sub_1000ADEF8, self);
  AXUIElementGetPid( (AXUIElementRef)+[AXUIElement systemWideAXUIElement](&OBJC_CLASS___AXUIElement, "systemWideAXUIElement"),  &pid);
  axEventObserver = self->_axEventObserver;
  if (axEventObserver)
  {
LABEL_5:
    CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(axEventObserver);
    if (RunLoopSource)
    {
      id v10 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v10, kCFRunLoopDefaultMode);
      uint64_t v12 = -[VOTEventFactory _registerForAXNotifications:](self, "_registerForAXNotifications:", 1LL);
      if (!(_DWORD)v12)
      {
        -[VOTEventFactory _registerForZoomListener](self, "_registerForZoomListener");
        return 1;
      }

      int v14 = v12;
      uint64_t v15 = VOTLogEvent(v12, v13);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 134217984;
      char v34 = (void *)v14;
      id v17 = "Could not register for AX notifications. err %ld";
      unsigned __int8 v18 = v16;
      uint32_t v19 = 12;
    }

    else
    {
      uint64_t v29 = VOTLogEvent(0LL, v9);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }

      *(_WORD *)buf = 0;
      id v17 = "Could not get AX run loop";
      unsigned __int8 v18 = v16;
      uint32_t v19 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
    goto LABEL_18;
  }

  if (AXObserverCreate(pid, (AXObserverCallback)sub_1000ADF2C, &self->_axEventObserver) == kAXErrorSuccess)
  {
    axEventObserver = self->_axEventObserver;
    goto LABEL_5;
  }

  char v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
  unsigned __int8 v21 = [v20 ignoreLogging];

  if ((v21 & 1) == 0)
  {
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v23 = AXLoggerForFacility(v22);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);

    os_log_type_t v24 = AXOSLogLevelFromAXLogLevel(0LL);
    if (os_log_type_enabled(v16, v24))
    {
      uint64_t v25 = AXColorizeFormatLog(0LL, @"Could not observer AX events: %d");
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v27 = _AXStringForArgs(v26);
      CFAbsoluteTime v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v16, v24))
      {
        *(_DWORD *)buf = 138543362;
        char v34 = v28;
        _os_log_impl((void *)&_mh_execute_header, v16, v24, "%{public}@", buf, 0xCu);
      }
    }

    goto LABEL_18;
  }

- (id)_notificationsToRegister
{
  return &off_100188FE8;
}

- (int)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (const __AXUIElement *)+[AXUIElement systemWideAXUIElement](&OBJC_CLASS___AXUIElement, "systemWideAXUIElement");
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _notificationsToRegister](self, "_notificationsToRegister"));
  if ([v6 count])
  {
    uint64_t v8 = 0LL;
    int v9 = 0;
    if (v3) {
      id v10 = @"register";
    }
    else {
      id v10 = @"unregister";
    }
    unsigned int v11 = 1;
    *(void *)&__int128 v7 = 138543874LL;
    __int128 v25 = v7;
    do
    {
      axEventObserver = self->_axEventObserver;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v8, v25));
      int v14 = (const __CFString *)[v13 intValue];
      if (v3) {
        AXError v15 = AXObserverAddNotification(axEventObserver, v5, v14, self);
      }
      else {
        AXError v15 = AXObserverRemoveNotification(axEventObserver, v5, v14);
      }
      AXError v16 = v15;

      if (v16)
      {
        uint64_t v17 = VOTLogNotifications();
        unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          char v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v8]);
          unsigned int v21 = [v20 intValue];
          *(_DWORD *)buf = v25;
          uint64_t v27 = v10;
          __int16 v28 = 1024;
          unsigned int v29 = v21;
          __int16 v30 = 1024;
          AXError v31 = v16;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Unable to %{public}@ for notification %d. Error: %d",  buf,  0x18u);
        }

        if (!v9) {
          int v9 = v16;
        }
      }

      uint64_t v8 = v11;
    }

    while ((unint64_t)[v6 count] > v11++);
    if (v9)
    {
      uint64_t v22 = VOTLogNotifications();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_1000F3ED8();
      }
    }
  }

  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void)_handleSOSMedicalIDShown
{
  uint64_t v2 = VOTLogEvent(self, a2);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Will try to reset screen curtain because medical ID is shown",  v5,  2u);
  }

  if (_AXSVoiceOverTouchScreenCurtainEnabled())
  {
    BOOL v4 = _AXSVoiceOverTouchScreenCurtainEnabled() == 0;
    _AXSVoiceOverTouchSetScreenCurtainEnabled(v4);
  }

- (id)_commandResolver
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[VOSCommandResolver resolverForCurrentHost]( &OBJC_CLASS___VOSCommandResolver,  "resolverForCurrentHost"));
  id v4 =  -[VOTEventFactory _currentGesturedTextInputManagerAndCommandResolver:forCommandResolver:]( self,  "_currentGesturedTextInputManagerAndCommandResolver:forCommandResolver:",  v3,  1LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v6 = [v5 voiceOverNavigationDirectionMode];

  if (v6)
  {
    if (v6 == (id)2)
    {
      __int128 v7 = v3;
      uint64_t v8 = 0LL;
      goto LABEL_7;
    }

    if (v6 == (id)1)
    {
      __int128 v7 = v3;
      uint64_t v8 = 1LL;
LABEL_7:
      [v7 setShouldApplyRTL:v8];
    }
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
    objc_msgSend(v3, "setShouldApplyRTL:", objc_msgSend(v9, "applicationIsRTL"));
  }

  return v3;
}

- (id)_currentGesturedTextInputManagerAndCommandResolver:(id)a3 forCommandResolver:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  unsigned int v8 = [v7 helpEnabled];

  if (v8) {
    BOOL v9 = !v4;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    BOOL v10 = 1;
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
    [v11 practiceRegion];
    double v13 = v12;
    double v15 = v14;

    BOOL v10 = CGSizeZero.height == v15 && CGSizeZero.width == v13;
  }

  AXError v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory rotorManager](self, "rotorManager"));
  id v17 = [v16 currentRotorType];

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
  unsigned int v19 = [v18 isActive];
  if ((v19 & 1) != 0 || v10)
  {

    if (!v19) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[VOSScreenreaderMode BrailleScreenInput](&OBJC_CLASS___VOSScreenreaderMode, "BrailleScreenInput"));
    [v6 setScreenreaderMode:v23];

    objc_msgSend(v6, "setBsiTypingMode:", objc_msgSend(v22, "typingMode") == 0);
    goto LABEL_16;
  }

  char v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v21 = [v20 voiceOverHelpMode];

  if (v21 == (id)2) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v22 = 0LL;
LABEL_16:
  if (v17 == (id)58)
  {
    os_log_type_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _mapsExplorationGestureManager](self, "_mapsExplorationGestureManager"));
    unsigned int v25 = [v24 isActive];

    if (v25)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue(-[VOTEventFactory _mapsExplorationGestureManager](self, "_mapsExplorationGestureManager"));

      uint64_t v22 = (void *)v26;
    }
  }

  return v22;
}

- (id)_currentGesturedTextInputManager
{
  return -[VOTEventFactory _currentGesturedTextInputManagerAndCommandResolver:forCommandResolver:]( self,  "_currentGesturedTextInputManagerAndCommandResolver:forCommandResolver:",  0LL,  0LL);
}

- (BOOL)processEventAsGesturedTextInput:(id)a3
{
  id v4 = a3;
  if ([v4 isSystemServerEvent])
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _currentGesturedTextInputManager](self, "_currentGesturedTextInputManager"));
    __int128 v7 = v6;
    if (v6) {
      unsigned __int8 v5 = [v6 processEvent:v4];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (void)processEvent:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory directInteractionKeyboardManager](self, "directInteractionKeyboardManager"));
  unsigned int v6 = [v5 inDirectInteractionTypingMode];

  if (!v6
    || (BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory directInteractionKeyboardManager](self, "directInteractionKeyboardManager")),
        unsigned __int8 v10 = [v9 processEvent:v4],
        v9,
        (v10 & 1) == 0))
  {
    uint64_t v11 = VOTLogEvent(v7, v8);
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)unsigned __int8 v18 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ProcessEvent",  "",  v18,  2u);
    }

    double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
    if (![v13 isEqualToString:kVOTEventCommandIdle])
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
      if (![v14 isEqualToString:kVOTEventCommandWatchWakeDoubleTap])
      {
        AXError v16 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
        unsigned __int8 v17 = [v16 isEqualToString:kVOTEventCommandWatchWakeTripleTap];

        if ((v17 & 1) == 0) {
          [(id)VOTSharedWorkspace unmuteEligibleEventOccured];
        }
        goto LABEL_9;
      }
    }

LABEL_9:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
    [WeakRetained handleEvent:v4];
  }
}

- (void)gestureTrackingCallbackWithFactory:(id)a3
{
}

- (BOOL)_isTapAndHoldPending
{
  unsigned int v3 = -[SCRCTargetSelectorTimer isPending](self->_tapHoldTimer, "isPending");
  if (v3) {
    LOBYTE(v3) = -[SCRCTargetSelectorTimer isCancelled](self->_tapHoldTimer, "isCancelled") ^ 1;
  }
  return v3;
}

- (BOOL)_shouldAttemptTracking
{
  BOOL tapAndHoldMode = self->_flags.tapAndHoldMode;
  if (tapAndHoldMode)
  {
    BOOL v4 = -[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble");
    if (!v4) {
      return v4;
    }
    BOOL tapAndHoldMode = -[VOTEventFactory _isStylusGesture](self, "_isStylusGesture");
  }

  LOBYTE(v4) = 0;
  if (self->_fingerCount && !tapAndHoldMode)
  {
    if (-[VOTEventFactory _isTapAndHoldPending](self, "_isTapAndHoldPending")) {
      LOBYTE(v4) = self->_travelDistance >= 0.119999997;
    }
    else {
      LOBYTE(v4) = 1;
    }
  }

  return v4;
}

- (BOOL)_isEdgePressSupportedAtPosition:(CGPoint)a3
{
  double x = a3.x;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication"));
  unsigned int v6 = [v5 applicationIsRTL];

  if (v6) {
    return x > 0.93;
  }
  else {
    return x < 0.07;
  }
}

- (void)_updateFirstnessOfTrackingEvent:(id)a3
{
  if (self->_flags.hasSentFirstTrackingEventForGesture)
  {
    [a3 setObject:&__kCFBooleanFalse forIndex:113];
  }

  else
  {
    [a3 setObject:&__kCFBooleanTrue forIndex:113];
    self->_flags.hasSentFirstTrackingEventForGesture = 1;
  }

- (void)_gestureTrackingCallbackWithFactory:(id)a3 isHandlingSystemControlEvent:(BOOL)a4
{
  id v6 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  -[VOTGestureEvent time](self->_lastDownEvent, "time");
  if (Current - v8 >= self->_delayUntilSpeakInterval)
  {
    BOOL v9 = -[VOTEventFactory mapsExplorationInputActive](self, "mapsExplorationInputActive");
    if (v9)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandTracking,  0LL));
      double v12 = (void *)VOTSharedWorkspace;
      [v6 rawLocation];
      [v12 convertDevicePointToZoomedPoint:sub_10004AFD4(v13)];
      objc_msgSend(v11, "setTouchPoint:");
      -[VOTEventFactory _updateFirstnessOfTrackingEvent:](self, "_updateFirstnessOfTrackingEvent:", v11);
      -[VOTEventFactory processEvent:](self, "processEvent:", v11);
    }

    else
    {
      uint64_t v14 = VOTLogEvent(v9, v10);
      double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1000F3F58();
      }

      if (!-[VOTEventFactory _shouldUseGesturedTextInputManager](self, "_shouldUseGesturedTextInputManager"))
      {
        if (self->_flags.orbMode)
        {
          self->_flags.orbMode = 0;
          self->_flags.BOOL tapAndHoldMode = 0;
        }

        if (-[VOTEventFactory _shouldAttemptTracking](self, "_shouldAttemptTracking"))
        {
          if (self->_flags.sendingToNativeSlide
            && !-[VOTGestureEvent isDownEvent](self->_currentGestureEvent, "isDownEvent"))
          {
            AXError v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGestureEvent eventRepresentation](self->_currentGestureEvent, "eventRepresentation"));
            id v17 = [v16 copy];

            unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 handInfo]);
            unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 paths]);
            char v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:0]);
            [v20 pathLocation];
            double v22 = v21;
            double v24 = v23;

            sub_1000AA844( v17,  self->_nativeSlidingCenter.x + v22 - self->_nativeSlidingOffset.x,  self->_nativeSlidingCenter.y + v24 - self->_nativeSlidingOffset.y);
            unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
            [v25 repostEvent:v17];
          }

          if (!a4)
          {
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandTracking,  0LL));
            [v6 firstFingerPressure];
            objc_msgSend(v26, "setTouchForce:");
            [v6 rawLocation];
            objc_msgSend(v26, "setTouchRawLocation:");
            [v6 rawLocation];
            -[VOTEventFactory convertDevicePointToZoomedPoint:]( self,  "convertDevicePointToZoomedPoint:",  sub_10004AFD4(v27));
            objc_msgSend(v26, "setTouchPoint:");
            [v26 setObject:self->_currentGestureEvent forIndex:108];
            -[VOTEventFactory _updateFirstnessOfTrackingEvent:](self, "_updateFirstnessOfTrackingEvent:", v26);
            -[VOTEventFactory processEvent:](self, "processEvent:", v26);
          }

          if (-[VOTEventFactory _isTapAndHoldPending](self, "_isTapAndHoldPending")) {
            -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:", CGPointZero.x, CGPointZero.y);
          }
        }
      }
    }
  }
}

- (void)_volumeChangeTimer
{
  unsigned int v3 = (id *)&kVOTEventCommandIncreaseVolume;
  float v4 = self->_volumeChangeDistance - self->_oldVolumeChangeDistance;
  if (v4 <= 0.0) {
    unsigned int v3 = (id *)&kVOTEventCommandDecreaseVolume;
  }
  id v5 = *v3;
  id v9 = [objc_allocWithZone(AXIndexMap) init];
  *(float *)&double v6 = fabsf(v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v6));
  [v9 setObject:v7 forIndex:110];

  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent internalEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "internalEventWithCommand:info:",  v5,  v9));
  -[VOTEventFactory processEvent:](self, "processEvent:", v8);
  self->_oldVolumeChangeDistance = self->_volumeChangeDistance;
}

- (void)_systemControlLocationTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
  if ([WeakRetained allowsSystemControlEventForPosition:self->_systemControlPosition])
  {
    BOOL tapAndHoldMode = self->_flags.tapAndHoldMode;

    if (!tapAndHoldMode)
    {
      float v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      [v4 playSoundFast:@"Sounds/Edge.aiff"];

      self->_systemControlActivated = 1;
      self->_systemControlStartSwipeTime = -3061152000.0;
    }
  }

  else
  {
  }

- (int)_systemControlPosition:(CGPoint)a3 fingerCount:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(id)VOTSharedWorkspace deviceOrientation];
  int IsPad = AXDeviceIsPad(v8, v9);
  double v11 = 60.0;
  if (IsPad) {
    double v11 = 120.0;
  }
  if (x >= 20.0 || fabs(y + *((double *)&xmmword_1001AD170 + 1) * -0.5) >= v11)
  {
    if (x <= *(double *)&xmmword_1001AD170 + -20.0 || fabs(y + *((double *)&xmmword_1001AD170 + 1) * -0.5) >= v11)
    {
      if (y >= 20.0 || fabs(x + *(double *)&xmmword_1001AD170 * -0.5) >= v11)
      {
        else {
          int v12 = 2;
        }
      }

      else
      {
        int v12 = 1;
      }
    }

    else
    {
      int v12 = 4;
    }
  }

  else
  {
    int v12 = 3;
  }

  if (v8 == (id)4)
  {
    int v13 = v12 - 1;
    uint64_t v14 = &unk_100132D80;
  }

  else if (v8 == (id)3)
  {
    int v13 = v12 - 1;
    uint64_t v14 = &unk_100132D70;
  }

  else
  {
    if (v8 != (id)2) {
      goto LABEL_26;
    }
    int v13 = v12 - 1;
    uint64_t v14 = &unk_100132D60;
  }

  int v12 = v14[v13];
LABEL_26:
  if (a4 == 1) {
    unsigned int v15 = v12;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v12 == 1 && a4 == 2) {
    uint64_t v17 = 5LL;
  }
  else {
    uint64_t v17 = v15;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
  unsigned int v19 = [WeakRetained allowsSystemControlEventForPosition:v17];

  if (v19) {
    return v17;
  }
  else {
    return 0;
  }
}

- (void)_sendSystemControlEvent:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  switch(self->_systemControlPosition)
  {
    case 1:
      id v5 = &kVOTEventCommandSystemShowNotificationCenter;
      goto LABEL_8;
    case 2:
      id v5 = &kVOTEventCommandSystemShowControlCenter;
      goto LABEL_8;
    case 3:
      id v5 = &kVOTEventCommandSystemControlLeft;
      goto LABEL_8;
    case 4:
      id v5 = &kVOTEventCommandSystemControlRight;
      goto LABEL_8;
    case 5:
      id v5 = &kVOTEventCommandSystemControlTwoTop;
LABEL_8:
      [v4 setCommand:*v5];
      break;
    default:
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTEventFactory.m",  2783LL,  "-[VOTEventFactory _sendSystemControlEvent:]",  @"We should not have reached here");
      break;
  }

  -[VOTEventFactory processEvent:](self, "processEvent:", v6);
  self->_systemControlActivated = 0;
}

- (void)_resetSystemControlStatus
{
  self->_systemControlStartPoint = CGPointZero;
  self->_systemControlActivated = 0;
  *(_OWORD *)&self->_systemControlStartSwipeTime = xmmword_100132D30;
}

- (CGPoint)_averagePointForLastDownEvent
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGestureEvent eventRepresentation](self->_lastDownEvent, "eventRepresentation"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 handInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 paths]);

  double x = CGPointZero.x;
  double y = CGPointZero.y;
  id v7 = [v4 count];
  if (v7)
  {
    unint64_t v8 = (unint64_t)v7;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          objc_msgSend(v14, "pathLocation", (void)v19);
          double x = x + v15;
          [v14 pathLocation];
          double y = y + v16;
        }

        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v11);
    }

    double x = x / (double)v8;
    double y = y / (double)v8;
  }

  double v17 = x;
  double v18 = y;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (BOOL)_updateFingersInSystemControlLocation:(CGPoint)a3 fingerCount:(unint64_t)a4 isLift:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v8 = -[VOTEventFactory _systemControlPosition:fingerCount:](self, "_systemControlPosition:fingerCount:", a4, a5);
  int v9 = v8;
  if (!self->_systemControlActivated)
  {
    if (!v8)
    {
      double v24 = CGPointZero.y;
      return 0;
    }

- (BOOL)shouldBlockSplitTapGestureWithFactory:(id)a3
{
  return 0;
}

- (void)gestureSplitTappingCallbackWithFactory:(id)a3
{
  double v6 = v5;
  double v8 = v7;
  id v11 = [objc_allocWithZone(AXIndexMap) init];
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", v6, v8));
  [v11 setObject:v9 forIndex:101];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandSplitTapTap,  v11));
  -[VOTEventFactory processEvent:](self, "processEvent:", v10);
}

- (void)gestureFactoryDidBeginSplitGesture:(id)a3
{
  if (!self->_flags.splitSlide)
  {
    uint64_t v4 = VOTLogEvent(self, a2);
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3F84();
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _currentGesturedTextInputManager](self, "_currentGesturedTextInputManager"));
    [v6 eventFactoryDidBeginSplitGesture:self];
  }

- (id)_handleGestureKeyboardTappingCallback:(unint64_t)a3 fingerCount:(unint64_t)a4 isDown:(BOOL)a5 originalLocation:(CGPoint)a6 convertedLocation:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userCommandManager]);

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory directInteractionKeyboardManager](self, "directInteractionKeyboardManager"));
  [v17 gestureKeyboardRegion];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  if (a3 == 1 && a4 == 1)
  {
    v31.origin.CGFloat x = v19;
    v31.origin.CGFloat y = v21;
    v31.size.width = v23;
    v31.size.height = v25;
    v30.CGFloat x = x;
    v30.CGFloat y = y;
    if (CGRectContainsPoint(v31, v30)) {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandGestureTypingType,  0LL));
    }
    else {
      uint64_t v26 = 0LL;
    }
  }

  else
  {
    uint64_t v26 = 0LL;
    if (a3 == 2 && a4 == 2 && !a5)
    {
      double v27 = (void *)objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerDoubleTap](&OBJC_CLASS___VOSGesture, "TwoFingerDoubleTap"));
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v16 eventForTouchGesture:v27 resolver:v28]);
    }
  }

  objc_msgSend(v26, "setTouchPoint:", v10, v9);

  return v26;
}

- (BOOL)_isStylusGesture
{
  return 1;
}

- (void)gestureTappingCallbackWithFactory:(id)a3
{
  id v4 = a3;
  uint64_t v6 = VOTLogEvent(v4, v5);
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000F3FE8(v4, v7);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userCommandManager]);

  [v4 rawLocation];
  -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:", sub_10004AFD4(v10));
  double v12 = v11;
  double v14 = v13;
  [v4 firstFingerPressure];
  double v16 = v15;
  double v17 = (char *)[v4 tapCount] + self->_watchWakeTapCount;
  BOOL v18 = self->_delayUntilSpeakInterval > 0.001 && v17 == (char *)1;
  if (v18 && [v4 fingerCount] == (id)1)
  {
    uint64_t v20 = VOTLogEvent(1LL, v19);
    CGFloat v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_delayUntilSpeakInterval));
      *(_DWORD *)v98 = 138412290;
      *(void *)&v98[4] = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Ignoring tap because tap to speak is set to %@",  v98,  0xCu);
    }

    goto LABEL_139;
  }

  id v23 = [v4 tapIsDown];
  -[VOTEventFactory _setFingerCount:](self, "_setFingerCount:", [v4 fingerCount]);
  if (self->_flags.tapAndHoldMode)
  {
    if (-[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble"))
    {
      BOOL v24 = -[VOTEventFactory _isStylusGesture](self, "_isStylusGesture");
      if (v24)
      {
        uint64_t v26 = VOTLogEvent(v24, v25);
        CGFloat v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v98 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Scribble: Ignoring tapping callback for stylus, because scribble was in progress.",  v98,  2u);
        }

        goto LABEL_139;
      }
    }
  }

  -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:", CGPointZero.x, CGPointZero.y);
  double v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _currentGesturedTextInputManager](self, "_currentGesturedTextInputManager"));
  CGFloat v21 = v27;
  if (v27
    && (-[os_log_s processTapWithFingerCount:](v27, "processTapWithFingerCount:", self->_fingerCount) & 1) != 0)
  {
    goto LABEL_139;
  }

  unsigned int v28 = -[VOTDirectInteractionKeyboardManager inDirectInteractionTypingMode]( self->_directInteractionKeyboardManager,  "inDirectInteractionTypingMode");
  double v29 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  CGPoint v30 = (void *)objc_claimAutoreleasedReturnValue( -[VOTDirectInteractionKeyboardManager keyboardElement]( self->_directInteractionKeyboardManager,  "keyboardElement"));
  objc_msgSend(v29, "convertPoint:toContextId:", objc_msgSend(v30, "windowContextId"), v12, v14);
  double v32 = v31;
  double v34 = v33;

  if (v28)
  {
    -[VOTDirectInteractionKeyboardManager gestureKeyboardRegion]( self->_directInteractionKeyboardManager,  "gestureKeyboardRegion");
    v103.CGFloat x = v32;
    v103.CGFloat y = v34;
    uint64_t IsPad = CGRectContainsPoint(v104, v103);
    if ((_DWORD)IsPad)
    {
      if (!-[VOTDirectInteractionKeyboardManager isEmojiKeyboard]( self->_directInteractionKeyboardManager,  "isEmojiKeyboard")
        || (uint64_t IsPad = -[VOTDirectInteractionKeyboardManager isEmojiKey]( self->_directInteractionKeyboardManager,  "isEmojiKey"),  (_DWORD)IsPad))
      {
        uint64_t IsPad = objc_claimAutoreleasedReturnValue( -[VOTEventFactory _handleGestureKeyboardTappingCallback:fingerCount:isDown:originalLocation:convertedLocation:]( self,  "_handleGestureKeyboardTappingCallback:fingerCount:isDown:originalLocation:convertedLocation:",  v17,  self->_fingerCount,  v23,  v12,  v14,  v32,  v34));
        if (IsPad)
        {
          uint64_t v37 = (void *)IsPad;
          double v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", v32, v34));
          [v37 setObject:v38 forIndex:115];

          -[VOTEventFactory processEvent:](self, "processEvent:", v37);
          goto LABEL_139;
        }
      }
    }
  }

  if (v17 == (char *)1)
  {
    int64_t fingerCount = self->_fingerCount;
    if (fingerCount != 3)
    {
      if (fingerCount != 2)
      {
        if (fingerCount == 1)
        {
          if (self->_flags.sendingToNativeSlide) {
            goto LABEL_139;
          }
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandTracking,  0LL));
          objc_msgSend(v40, "setTouchPoint:", v12, v14);
          [v4 rawLocation];
          objc_msgSend(v40, "setTouchRawLocation:");
          [v40 setTouchForce:v16];
          if (v40) {
            -[VOTEventFactory processEvent:](self, "processEvent:", v40);
          }
          -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
          -[VOTEventFactory _processIdle:](self, "_processIdle:", sub_10004AFD4(v41));
          goto LABEL_134;
        }

        if (fingerCount == 4) {
          char v55 = (char)v23;
        }
        else {
          char v55 = 1;
        }
        if ((v55 & 1) != 0) {
          goto LABEL_135;
        }
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[VOSGesture FourFingerSingleTap](&OBJC_CLASS___VOSGesture, "FourFingerSingleTap"));
        id v57 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v9 eventForTouchGesture:v56 resolver:v57]);

        if (v40) {
          goto LABEL_133;
        }
        [v4 tapPoint];
        id v60 = -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:]( self,  "adjustedPointForFactoryPoint:forOrientation:",  [v4 orientation],  v58,  v59);
        double v62 = v61;
        double v64 = v63;
        if (AXDeviceIsPad(v60, v65) && fabs(v64 + -0.5) <= fabs(v62 + -0.5))
        {
          if (v62 >= 0.5) {
            v66 = &kVOTEventCommandRightElementCommunity;
          }
          else {
            v66 = &kVOTEventCommandLeftElementCommunity;
          }
        }

        else if (v64 >= 0.5)
        {
          v66 = &kVOTEventCommandLastElement;
        }

        else
        {
          v66 = &kVOTEventCommandFirstElement;
        }

        uint64_t IsPad = objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  *v66,  0LL));
        goto LABEL_149;
      }

      uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerSingleTap](&OBJC_CLASS___VOSGesture, "TwoFingerSingleTap"));
      goto LABEL_131;
    }

    if (self->_flags.firedElementSummaryTimer)
    {
      uint64_t v40 = 0LL;
LABEL_118:
      self->_flags.firedElementSummaryTimer = 0;
      if (!v40) {
        goto LABEL_135;
      }
      goto LABEL_133;
    }

    elementSummaryTimer = self->_elementSummaryTimer;
    if ((v23 & 1) == 0)
    {
      -[SCRCTargetSelectorTimer cancel](elementSummaryTimer, "cancel");
      id v83 = (void *)objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerSingleTap](&OBJC_CLASS___VOSGesture, "ThreeFingerSingleTap"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v9 eventForTouchGesture:v83 resolver:v84]);

      goto LABEL_118;
    }

    if (-[SCRCTargetSelectorTimer isPending](elementSummaryTimer, "isPending"))
    {
      uint64_t IsPad = (uint64_t)-[SCRCTargetSelectorTimer isCancelled](self->_elementSummaryTimer, "isCancelled");
      if (!(_DWORD)IsPad) {
        goto LABEL_135;
      }
    }

    threeFingerHoldTimer = self->_elementSummaryTimer;
    double v78 = 0.5;
LABEL_107:
    uint64_t IsPad = (uint64_t)-[SCRCTargetSelectorTimer dispatchAfterDelay:](threeFingerHoldTimer, "dispatchAfterDelay:", v78);
    goto LABEL_135;
  }

  if (v17 == (char *)4)
  {
    int64_t v47 = self->_fingerCount;
    if (v47 == 1)
    {
      id v48 = [objc_allocWithZone(AXIndexMap) init];
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", v12, v14));
      [v48 setObject:v49 forIndex:101];

      uint64_t v50 = objc_claimAutoreleasedReturnValue(+[VOSGesture OneFingerQuadrupleTap](&OBJC_CLASS___VOSGesture, "OneFingerQuadrupleTap"));
      goto LABEL_144;
    }

    if (v47 == 3) {
      char v67 = (char)v23;
    }
    else {
      char v67 = 1;
    }
    if ((v67 & 1) != 0)
    {
      if (v47 == 2) {
        char v68 = (char)v23;
      }
      else {
        char v68 = 1;
      }
      if ((v68 & 1) != 0)
      {
        if (v47 == 4) {
          char v69 = (char)v23;
        }
        else {
          char v69 = 1;
        }
        if ((v69 & 1) != 0) {
          goto LABEL_135;
        }
        uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture FourFingerQuadrupleTap](&OBJC_CLASS___VOSGesture, "FourFingerQuadrupleTap"));
      }

      else
      {
        uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerQuadrupleTap](&OBJC_CLASS___VOSGesture, "TwoFingerQuadrupleTap"));
      }
    }

    else
    {
      uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerQuadrupleTap](&OBJC_CLASS___VOSGesture, "ThreeFingerQuadrupleTap"));
    }

    goto LABEL_131;
  }

  if (v17 != (char *)3)
  {
    int64_t v42 = self->_fingerCount;
    if (v42 == 3)
    {
      if ((v23 & 1) != 0)
      {
        uint64_t IsPad = AXDeviceIsPad(IsPad, v36);
        if (!(_DWORD)IsPad) {
          goto LABEL_135;
        }
        -[SCRCTargetSelectorTimer cancel](self->_elementSummaryTimer, "cancel");
        -[SCRCTargetSelectorTimer cancel](self->_threeFingerHoldTimer, "cancel");
        self->_flags.memorizingData = 1;
        threeFingerHoldTimer = self->_threeFingerHoldTimer;
        double v78 = 0.25;
        goto LABEL_107;
      }

      uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerDoubleTap](&OBJC_CLASS___VOSGesture, "ThreeFingerDoubleTap"));
    }

    else if (v42 == 2)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
      unsigned int v80 = [v79 helpEnabled];

      if (!v80)
      {
        if ((_DWORD)v23)
        {
          self->_flags.twoFingerTapAndSlide = 1;
          self->_oldVolumeChangeDistance = 0.0;
          goto LABEL_135;
        }

        -[VOTEventFactory _stopMemorizingSession](self, "_stopMemorizingSession");
      }

      uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerDoubleTap](&OBJC_CLASS___VOSGesture, "TwoFingerDoubleTap"));
    }

    else
    {
      if (v42 == 1)
      {
        if ((v23 & 1) != 0)
        {
          uint64_t IsPad = (uint64_t)[v4 multiTapFrame];
          if (!v21 && v43 < 0.330000013 && v44 < 0.330000013)
          {
            uint64_t IsPad = (uint64_t)[v4 tapInterval];
            if (v45 > 0.100000001 && self->_travelDistance < 0.100000001) {
              uint64_t IsPad = (uint64_t)-[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:]( self->_tapHoldTimer,  "dispatchAfterDelay:withObject:",  &__kCFBooleanTrue,  0.5);
            }
          }

          goto LABEL_135;
        }

        id v85 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
        unsigned int v86 = [v85 voiceOverIsIdle];

        if (v86)
        {
          double v54 = &kVOTEventCommandWatchWakeDoubleTap;
          goto LABEL_122;
        }

        id v48 = [objc_allocWithZone(AXIndexMap) init];
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", v12, v14));
        [v48 setObject:v93 forIndex:101];

        *(float *)&double v94 = v16;
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v94));
        [v48 setObject:v95 forIndex:111];

        uint64_t v50 = objc_claimAutoreleasedReturnValue(+[VOSGesture OneFingerDoubleTap](&OBJC_CLASS___VOSGesture, "OneFingerDoubleTap"));
        goto LABEL_144;
      }

      if (v42 == 4) {
        char v81 = (char)v23;
      }
      else {
        char v81 = 1;
      }
      if ((v81 & 1) != 0)
      {
        if (v42 == 5) {
          char v82 = (char)v23;
        }
        else {
          char v82 = 1;
        }
        if ((v82 & 1) != 0) {
          goto LABEL_135;
        }
        uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture FiveFingerDoubleTap](&OBJC_CLASS___VOSGesture, "FiveFingerDoubleTap"));
      }

      else
      {
        uint64_t v46 = objc_claimAutoreleasedReturnValue(+[VOSGesture FourFingerDoubleTap](&OBJC_CLASS___VOSGesture, "FourFingerDoubleTap"));
      }
    }

- (BOOL)_twoFingersDistant:(id)a3
{
  id v3 = a3;
  [v3 rawLocation];
  double v5 = v4;
  double v7 = v6;
  [v3 rawAverageLocation];
  double v9 = v8;
  double v11 = v10;

  double v12 = vabdd_f64(v7, v11);
  double v13 = v12 + v12;
  int IsPad = AXDeviceIsPad(v14, v15);
  double v17 = vabdd_f64(v5, v9);
  BOOL v18 = v17 + v17 > 0.5 || v13 > 0.5;
  if (IsPad) {
    return v18;
  }
  else {
    return v13 > 0.5;
  }
}

- (CGPoint)adjustedPointForFactoryPoint:(CGPoint)a3 forOrientation:(int64_t)a4
{
  double v4 = 1.0 - a3.x;
  double v5 = 1.0 - a3.y;
  if (a4 == 1) {
    double x = 1.0 - a3.x;
  }
  else {
    double x = a3.x;
  }
  if (a4 == 1) {
    double y = 1.0 - a3.y;
  }
  else {
    double y = a3.y;
  }
  if (a4 == 2)
  {
    double v8 = a3.x;
  }

  else
  {
    double v5 = x;
    double v8 = y;
  }

  if (a4 == 3) {
    double v9 = a3.y;
  }
  else {
    double v9 = v5;
  }
  if (a4 == 3) {
    double v10 = v4;
  }
  else {
    double v10 = v8;
  }
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (BOOL)_shouldUseGesturedTextInputManager
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _currentGesturedTextInputManager](self, "_currentGesturedTextInputManager"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)_handleDirectInteractionEvent:(id)a3
{
  double v4 = (VOTGestureEvent *)a3;
  if (-[VOTEventFactory _willStartEdgePanGestureForEvent:](self, "_willStartEdgePanGestureForEvent:", v4)
    || self->_edgePanGestureState
    || (double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory directInteractionKeyboardManager](self, "directInteractionKeyboardManager")),
        unsigned __int8 v6 = [v5 inDirectInteractionTypingMode],
        v5,
        (v6 & 1) != 0)
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_directTouchManager),
        unsigned int v8 = [WeakRetained inDirectTouchMode],
        WeakRetained,
        !v8))
  {
    LOBYTE(v10) = 0;
    goto LABEL_51;
  }

  double v9 = self->_directInteractionElements;
  if (!-[NSArray count](v9, "count"))
  {
    LOBYTE(v10) = 0;
    goto LABEL_61;
  }

  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  obuint64_t j = v9;
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v81,  v87,  16LL);
  if (!v10) {
    goto LABEL_60;
  }
  char v69 = v9;
  id location = (id *)&self->_directTouchManager;
  char v11 = 0;
  uint64_t v72 = *(void *)v82;
LABEL_8:
  uint64_t v12 = 0LL;
  while (1)
  {
    if (*(void *)v82 != v72) {
      objc_enumerationMutation(obj);
    }
    double v13 = *(void **)(*((void *)&v81 + 1) + 8 * v12);
    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    objc_msgSend(v22, "convertRect:fromContextId:", objc_msgSend(v13, "windowContextId"), v15, v17, v19, v21);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;

    BOOL sendingToDirectTouch = self->_flags.sendingToDirectTouch;
    if (([v13 directTouchOptions] & 2) == 0
      || [v13 activatedDirectTouchThatRequiredActivation])
    {
      if (sendingToDirectTouch)
      {
        int v32 = 1;
      }

      else if (-[VOTGestureEvent isDownEvent](v4, "isDownEvent") {
             || (id v40 = objc_loadWeakRetained(location),
      }
                 unsigned int v41 = [v40 shouldTurnTrackingIntoDirectTouch],
                 v40,
                 v41))
      {
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        int64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGestureEvent fingers](v4, "fingers"));
        id v43 = [v42 countByEnumeratingWithState:&v77 objects:v86 count:16];
        if (v43)
        {
          id v44 = v43;
          uint64_t v45 = *(void *)v78;
          while (2)
          {
            for (uint64_t i = 0LL; i != v44; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v78 != v45) {
                objc_enumerationMutation(v42);
              }
              [*(id *)(*((void *)&v77 + 1) + 8 * (void)i) location];
              v89.double x = sub_10004AFD4(v47);
              v89.double y = v48;
              v91.origin.double x = v24;
              v91.origin.double y = v26;
              v91.size.width = v28;
              v91.size.height = v30;
              if (CGRectContainsPoint(v91, v89))
              {
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
                unsigned __int8 v50 = [v49 isEqual:v13];

                if ((v50 & 1) == 0)
                {
                  id v51 = objc_loadWeakRetained(location);
                  [v51 setDirectInteractionElement:v13];
                }

                -[VOTEventFactory setLastTouchedDirectTouchElement:](self, "setLastTouchedDirectTouchElement:", v13);
                int v32 = 1;
                goto LABEL_45;
              }
            }

            id v44 = [v42 countByEnumeratingWithState:&v77 objects:v86 count:16];
            if (v44) {
              continue;
            }
            break;
          }
        }

        int v32 = 0;
LABEL_45:

        id v52 = objc_loadWeakRetained(location);
        unsigned int v53 = [v52 shouldTurnTrackingIntoDirectTouch];

        if (v53)
        {
          double v54 = self->_lastDownEvent;

          id v55 = objc_loadWeakRetained(location);
          [v55 setShouldTurnTrackingIntoDirectTouch:0];

          double v4 = v54;
        }
      }

      else
      {
        int v32 = 0;
      }

      if ((v11 & 1) != 0)
      {
LABEL_38:
        char v11 = 1;
      }

      else
      {
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        double v33 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGestureEvent fingers](v4, "fingers"));
        id v34 = [v33 countByEnumeratingWithState:&v73 objects:v85 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v74;
          while (2)
          {
            for (uint64_t j = 0LL; j != v35; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v74 != v36) {
                objc_enumerationMutation(v33);
              }
              [*(id *)(*((void *)&v73 + 1) + 8 * (void)j) location];
              v88.double x = sub_10004AFD4(v38);
              v88.double y = v39;
              v90.origin.double x = v24;
              v90.origin.double y = v26;
              v90.size.width = v28;
              v90.size.height = v30;
              if (CGRectContainsPoint(v90, v88))
              {
                -[VOTEventFactory setLastTouchedDirectTouchElement:](self, "setLastTouchedDirectTouchElement:", v13);

                goto LABEL_38;
              }
            }

            id v35 = [v33 countByEnumeratingWithState:&v73 objects:v85 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }

        char v11 = 0;
        if (!v32) {
          goto LABEL_40;
        }
      }

      if (!self->_flags.allowingSystemGesturePassthrough) {
        break;
      }
    }

- (BOOL)directTouchElementsPresent
{
  return -[NSArray count](self->_directInteractionElements, "count") != 0;
}

- (BOOL)_gestureEventIsInvalid:(id)a3
{
  id v4 = a3;
  if ([v4 isLiftEvent])
  {
    if (!self->_flags.gestureSawDownEvent)
    {
      unsigned __int8 v5 = 1;
      goto LABEL_9;
    }

    self->_flags.gestureSawDownEvent = 0;
  }

  unsigned __int8 v5 = [v4 isNonLiftingInRangeEvent];
LABEL_9:

  return v5;
}

- (void)updateOrientation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[VOTEventFactory directInteractionKeyboardManager](self, "directInteractionKeyboardManager"));
  [v2 updateKeyboardElement];
}

- (id)_touchLocationsForGestureEvent:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (([v4 isLiftEvent] & 1) == 0
    && ([v4 isCancelEvent] & 1) == 0)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v17 = v4;
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 eventRepresentation]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 handInfo]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 paths]);

    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          [v13 pathLocation];
          -[SCRCGestureFactory orientation](self->_gestureFactory, "orientation");
          sub_10004B190();
          double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:"));
          double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v13 pathIndex]));
          [v5 setObject:v14 forKeyedSubscript:v15];
        }

        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v10);
    }

    id v4 = v17;
  }

  return v5;
}

- (BOOL)_handleOrbEvent:(id)a3
{
  return 0;
}

- (BOOL)_willStartEdgePanGestureForEvent:(id)a3
{
  id v4 = a3;
  if (([(id)VOTSharedWorkspace supportsHomeGestures] & 1) != 0
    || [(id)VOTSharedWorkspace inUnitTestMode])
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fingers", 0));
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v11 = -[SCRCGestureFactory orientation](self->_gestureFactory, "orientation");
          [v10 location];
          -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:]( self,  "adjustedPointForFactoryPoint:forOrientation:",  v11);
          double v13 = v12;
          -[VOTEventFactory _edgePanGestureStartThreshold](self, "_edgePanGestureStartThreshold");
          double v15 = v14;
          unsigned int v16 = [(id)VOTSharedWorkspace reachabilityActive];
          double v17 = v15;
          if (v16)
          {
            objc_msgSend((id)VOTSharedWorkspace, "reachabilityOffset", v15);
            double v17 = v15 + v18;
          }

          if (!self->_edgePanGestureState)
          {
            double v17 = 1.0 - v17;
            if (1.0 - v13 <= v15 || 1.0 - v13 >= v17)
            {
              BOOL v20 = 1;
              goto LABEL_19;
            }
          }
        }

        id v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v17);
      }

      while (v7);
    }

    BOOL v20 = 0;
LABEL_19:
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (double)_edgeGestureScaleFactor:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    self = (VOTEventFactory *)AXDeviceIsPhone(self, a2);
    if ((_DWORD)self)
    {
      double v4 = AXDeviceSizeMM();
      double v6 = fmax(v4, v5);
      return 135.0 / v6;
    }
  }

  double v7 = 1.0;
  if (AXDeviceIsPad(self, a2))
  {
    double v8 = AXDeviceSizeMM();
    double v10 = fmin(v8, v9);
    double v6 = fmax(v8, v9);
    if (v3) {
      double v6 = v10;
    }
    return 135.0 / v6;
  }

  return v7;
}

- (id)_updateEdgePanGestureForState:(int64_t)a3
{
  unint64_t v5 = (unint64_t)-[SCRCGestureFactory orientation](self->_gestureFactory, "orientation");
  double v6 = 0LL;
  unint64_t v7 = v5;
  switch(a3)
  {
    case 0LL:
      double v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTEventFactory votActionForEdgePanGestureState:]( self,  "votActionForEdgePanGestureState:",  self->_edgePanGestureState));
      if (v8)
      {
        -[VOTEventFactory _playFeedbackForGestureState:gestureComplete:]( self,  "_playFeedbackForGestureState:gestureComplete:",  self->_edgePanGestureState,  1LL);
        double v6 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  v8,  0LL));
      }

      else
      {
        double v6 = 0LL;
      }

      -[VOTEventFactory _transitionToGestureState:](self, "_transitionToGestureState:", 0LL);

      return v6;
    case 1LL:
      -[SCRCGestureFactory startLocation](self->_gestureFactory, "startLocation");
      -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:]( self,  "adjustedPointForFactoryPoint:forOrientation:",  v7);
      uint64_t v10 = v9;
      double v12 = v11;
      -[VOTEventFactory _edgePanGestureStartThreshold](self, "_edgePanGestureStartThreshold");
      double v14 = v13;
      unsigned int v15 = [(id)VOTSharedWorkspace reachabilityActive];
      char v16 = v15;
      double v17 = v14;
      if (v15)
      {
        [(id)VOTSharedWorkspace reachabilityOffset];
        double v17 = v14 + v18;
      }

      double v6 = 0LL;
      BOOL v19 = 1.0 - v12 <= v14;
      if (1.0 - v12 >= 1.0 - v17) {
        BOOL v19 = 1;
      }
      if (self->_edgePanGestureState || !v19) {
        return v6;
      }
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_1000B14F4;
      v65[3] = &unk_100179838;
      v65[4] = self;
      v65[5] = v10;
      *(double *)&v65[6] = v12;
      BOOL v66 = 1.0 - v12 <= v14;
      char v67 = v16;
      BOOL v20 = objc_retainBlock(v65);
      ((void (*)(void))v20[2])();

      goto LABEL_42;
    case 2LL:
      if ((self->_edgePanGestureState & 0xFFFFFFFFFFFFFFF7LL) == 0) {
        goto LABEL_42;
      }
      unint64_t v21 = v5 & 0xFFFFFFFFFFFFFFFELL;
      double y = self->_edgePanGestureStartPoint.y;
      -[SCRCGestureFactory endLocation](self->_gestureFactory, "endLocation");
      -[VOTEventFactory adjustedPointForFactoryPoint:forOrientation:]( self,  "adjustedPointForFactoryPoint:forOrientation:",  v7);
      double v25 = v24;
      double v26 = v23;
      double x = self->_edgePanGestureStartPoint.x;
      double v27 = self->_edgePanGestureStartPoint.y;
      BOOL v29 = v27 - v23 <= 0.0 || y == 1.0;
      double v30 = vabdd_f64(v27, v23);
      if (v29) {
        double v31 = v30;
      }
      else {
        double v31 = 0.0;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      unint64_t edgePanGestureState = self->_edgePanGestureState;
      -[SCRCGestureFactory startLocation](self->_gestureFactory, "startLocation");
      double v35 = v34;
      double v37 = v36;
      id v38 = -[SCRCGestureFactory endLocation](self->_gestureFactory, "endLocation");
      BOOL v42 = v37 == v41 && v35 == v40;
      if (v21 == 2)
      {
        int IsPad = AXDeviceIsPad(v38, v39);
        double v44 = 0.100000001;
        if (IsPad) {
          double v44 = 0.300000012;
        }
      }

      else
      {
        double v44 = 0.300000012;
      }

      double v45 = vabdd_f64(x, v25);
      if (edgePanGestureState != 1)
      {
        BOOL v47 = 0;
        goto LABEL_36;
      }

      double v46 = Current - self->_edgePanGestureStartTime;
      BOOL v47 = v46 > 1.5;
      if (v46 <= 0.5)
      {
LABEL_36:
        BOOL v48 = 0;
        goto LABEL_37;
      }

      BOOL v48 = v31 < 0.200000003 && v42;
LABEL_37:
      if (v45 > v44 || v47 || v48) {
        -[VOTEventFactory _transitionToGestureState:](self, "_transitionToGestureState:", 8LL);
      }
      if (self->_edgePanGestureState == 8) {
        goto LABEL_42;
      }
      BOOL v50 = v21 == 2;
      -[VOTEventFactory _edgeGestureScaleFactor:](self, "_edgeGestureScaleFactor:", v50);
      double v52 = v51 * 0.5;
      id v53 = -[VOTEventFactory _edgeGestureScaleFactor:](self, "_edgeGestureScaleFactor:", v50);
      double v56 = v55 * 0.200000003;
      if (y != 1.0)
      {
        id v53 = [(id)VOTSharedWorkspace reachabilityActive];
        if ((_DWORD)v53)
        {
          double v52 = v52 / 1.5;
          double v56 = v56 / 1.5;
        }
      }

      if (v31 >= v52)
      {
LABEL_56:
        if (!v42) {
          goto LABEL_73;
        }
        goto LABEL_57;
      }

      if (v31 >= v56)
      {
        if (y == 1.0) {
          uint64_t v58 = 3LL;
        }
        else {
          uint64_t v58 = 6LL;
        }
        -[VOTEventFactory _transitionToGestureState:](self, "_transitionToGestureState:", v58);
        goto LABEL_56;
      }

      if (self->_edgePanGestureState == 1) {
        goto LABEL_56;
      }
      int IsPhone = AXDeviceIsPhone(v53, v54);
      if (!v42)
      {
        uint64_t v59 = 5LL;
        if (!IsPhone) {
          uint64_t v59 = 9LL;
        }
        unint64_t v60 = self->_edgePanGestureState;
        if (v60 != v59)
        {
          if (y != 1.0 || v60 == 2) {
            int v62 = 1;
          }
          else {
            int v62 = IsPhone;
          }
          if (v62) {
            uint64_t v63 = 2LL;
          }
          else {
            uint64_t v63 = 9LL;
          }
          -[VOTEventFactory _transitionToGestureState:](self, "_transitionToGestureState:", v63);
        }

        goto LABEL_73;
      }

      -[VOTEventFactory _transitionToGestureState:](self, "_transitionToGestureState:", 2LL);
LABEL_57:
      if (self->_edgePanGesturePausePoint.x == CGPointZero.x && self->_edgePanGesturePausePoint.y == CGPointZero.y)
      {
        self->_edgePanGesturePausePoint.double x = v25;
        self->_edgePanGesturePausePoint.double y = v26;
        -[SCRCTargetSelectorTimer dispatchAfterDelay:]( self->_edgePanGestureSpeakHintTimer,  "dispatchAfterDelay:",  0.800000012);
        goto LABEL_42;
      }

- (void)_transitionToGestureState:(unint64_t)a3
{
}

- (void)_transitionToGestureState:(unint64_t)a3 playHaptic:(BOOL)a4
{
  if (self->_edgePanGestureState != a3)
  {
    BOOL v4 = a4;
    uint64_t v7 = VOTLogEvent(self, a2);
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (a3 > 9) {
        uint64_t v9 = &stru_10017A920;
      }
      else {
        uint64_t v9 = off_100179910[a3];
      }
      uint64_t v10 = NSStringFromBOOL(v4);
      double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v12 = 138412546;
      double v13 = v9;
      __int16 v14 = 2112;
      unsigned int v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "_transitionToGestureState=%@, playHaptic=%@",  (uint8_t *)&v12,  0x16u);
    }

    self->_unint64_t edgePanGestureState = a3;
    if (v4) {
      -[VOTEventFactory _playFeedbackForGestureState:gestureComplete:]( self,  "_playFeedbackForGestureState:gestureComplete:",  a3,  0LL);
    }
  }

- (void)_processGestureEvent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentGestureEvent, a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _currentGesturedTextInputManager](self, "_currentGesturedTextInputManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userCommandManager]);

  if (!v6 && -[VOTEventFactory _handleDirectInteractionEvent:](self, "_handleDirectInteractionEvent:", v5))
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&qword_1001AC668 > 4.0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
      [v9 userEventOccurred];

      qword_1001AC668 = CFAbsoluteTimeGetCurrent();
    }

    goto LABEL_239;
  }

  if (-[VOTEventFactory _gestureEventIsInvalid:](self, "_gestureEventIsInvalid:", v5)) {
    goto LABEL_239;
  }
  if (-[VOTEventFactory _handleOrbEvent:](self, "_handleOrbEvent:", v5))
  {
    unsigned int v10 = 1;
  }

  else
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));

    if (v6 == v11)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _brailleGestureManager](self, "_brailleGestureManager"));
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _touchLocationsForGestureEvent:](self, "_touchLocationsForGestureEvent:", v5));
      unsigned int v10 = objc_msgSend( v12,  "processTouchLocations:isFirstTouch:isCancelTouch:",  v13,  objc_msgSend(v5, "isDownEvent"),  objc_msgSend(v5, "isCancelEvent"));
    }

    else
    {
      unsigned int v10 = 0;
    }
  }

  if ((objc_opt_respondsToSelector(self->_gestureFactory, "setSplitFlickEnabled:") & 1) != 0) {
    -[SCRCGestureFactory setSplitFlickEnabled:]( self->_gestureFactory,  "setSplitFlickEnabled:",  -[VOTEventFactory brailleInputActive](self, "brailleInputActive"));
  }
  if ((objc_opt_respondsToSelector(self->_gestureFactory, "setUsesAbsoluteDistanceForPinch:") & 1) != 0) {
    -[SCRCGestureFactory setUsesAbsoluteDistanceForPinch:]( self->_gestureFactory,  "setUsesAbsoluteDistanceForPinch:",  -[VOTEventFactory brailleInputActive](self, "brailleInputActive"));
  }
  -[SCRCGestureFactory handleGestureEvent:](self->_gestureFactory, "handleGestureEvent:", v5);
  if (v10)
  {
    -[VOTEventFactory resetEventFactory](self, "resetEventFactory");
    -[VOTEventFactory _setFingerCount:](self, "_setFingerCount:", 0LL);
    goto LABEL_239;
  }

  -[SCRCGestureFactory distance](self->_gestureFactory, "distance");
  double v15 = v14;
  if (!self->_flags.tapAndHoldMode
    || -[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble")
    && ![v5 isStylusEvent])
  {
    id v16 = -[SCRCGestureFactory gestureState](self->_gestureFactory, "gestureState");
    int64_t v17 = (int64_t)-[SCRCGestureFactory direction](self->_gestureFactory, "direction");
    id v235 = -[SCRCGestureFactory fingerCount](self->_gestureFactory, "fingerCount");
    id v18 = [v5 fingerCount];
    if ([v5 isDownEvent])
    {
      objc_storeStrong((id *)&self->_lastDownEvent, a3);
      uint64_t v21 = AXLogCommon(v19, v20);
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        lastDownEvent = self->_lastDownEvent;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = lastDownEvent;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Last down %@", buf, 0xCu);
      }

      self->_flags.hasSentFirstTrackingEventForGesture = 0;
    }

    if (v18)
    {
      -[SCRCGestureFactory distance](self->_gestureFactory, "distance");
      self->_travelDistance = v24 + self->_travelDistance;
    }

    else
    {
      self->_travelDistance = 0.0;
    }

    if (self->_flags.memorizingData && [v5 fingerCount] != (id)2)
    {
      -[VOTEventFactory _stopMemorizingSession](self, "_stopMemorizingSession");
      int v32 = 0LL;
LABEL_238:
      self->_state = (int64_t)v16;
      self->_direction = v17;
      -[VOTEventFactory _commitDeferredZoomInfoIfAppropriate](self, "_commitDeferredZoomInfoIfAppropriate");

      goto LABEL_239;
    }

    -[SCRCGestureFactory rawAverageLocation](self->_gestureFactory, "rawAverageLocation");
    -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:", sub_10004AFD4(v25));
    unsigned int v28 = -[VOTEventFactory _updateFingersInSystemControlLocation:fingerCount:isLift:]( self,  "_updateFingersInSystemControlLocation:fingerCount:isLift:",  -[SCRCGestureFactory fingerCount](self->_gestureFactory, "fingerCount"),  [v5 isLiftEvent],  v26,  v27);
    if (self->_systemControlActivated) {
      uint64_t v29 = 1LL;
    }
    else {
      uint64_t v29 = v28;
    }
    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[VOTEventFactory _updateEdgePanGestureForState:](self, "_updateEdgePanGestureForState:", v16));
    int v32 = (void *)v30;
    id v234 = v18;
    char v33 = 0;
    switch((unint64_t)v16)
    {
      case 0uLL:
        char v33 = 0;
        self->_int64_t rotorSoundZone = 0LL;
        self->_int64_t continuityZone = 0LL;
        goto LABEL_201;
      case 1uLL:
      case 3uLL:
        goto LABEL_201;
      case 2uLL:
        [v5 time];
        double v48 = v47;
        if (vabdd_f64(v47, self->_lastEchoTime) <= 0.00100000005) {
          goto LABEL_200;
        }
        -[VOTEventFactory _gestureTrackingCallbackWithFactory:isHandlingSystemControlEvent:]( self,  "_gestureTrackingCallbackWithFactory:isHandlingSystemControlEvent:",  self->_gestureFactory,  v29);
        self->_lastEchoTime = v48;
        char v33 = 1;
        goto LABEL_201;
      case 4uLL:
        int64_t v49 = v17;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_rotorManager);
        unsigned int v51 = [WeakRetained rotorEnabled];

        if (!v51) {
          goto LABEL_105;
        }
        float v52 = v15;
        float v53 = floorf(v52 / 0.03);
        float v54 = ceilf(v52 / 0.03);
        if (v15 > 0.0) {
          float v54 = v53;
        }
        int64_t v55 = (uint64_t)v54;
        int64_t rotorSoundZone = self->_rotorSoundZone;
        if (rotorSoundZone <= (uint64_t)v54)
        {
          if (rotorSoundZone >= (uint64_t)v54)
          {
            v230 = 0LL;
            goto LABEL_150;
          }

          uint64_t v57 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent NextRotorProgress](&OBJC_CLASS___VOSOutputEvent, "NextRotorProgress"));
        }

        else
        {
          uint64_t v57 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent PreviousRotorProgress](&OBJC_CLASS___VOSOutputEvent, "PreviousRotorProgress"));
        }

        v230 = (void *)v57;
LABEL_150:
        self->_int64_t rotorSoundZone = v55;
        [v5 time];
        double rotateStartTime = self->_rotateStartTime;
        if (rotateStartTime == -3061152000.0)
        {
          self->_double rotateStartTime = v120;
          double rotateStartTime = v120;
        }

        float v122 = flt_100132C90[v120 - rotateStartTime > 0.2];
        int64_t v123 = -1LL;
        if (v15 > 0.0) {
          int64_t v123 = 1LL;
        }
        self->_rotateDirection = v123;
        float v124 = v52 / v122;
        float v125 = floorf(v124);
        float v126 = ceilf(v124);
        if (v15 > 0.0) {
          float v126 = v125;
        }
        int64_t v127 = (uint64_t)v126;
        int64_t continuityZone = self->_continuityZone;
        if (continuityZone <= (uint64_t)v126)
        {
          if (continuityZone >= (uint64_t)v126)
          {
            int64_t v17 = v49;
            v134 = v230;
            goto LABEL_162;
          }

          v132 = (void *)objc_claimAutoreleasedReturnValue(+[VOSGesture TwoFingerRotateClockwise](&OBJC_CLASS___VOSGesture, "TwoFingerRotateClockwise"));
          v133 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
          uint64_t v224 = objc_claimAutoreleasedReturnValue([v8 eventForTouchGesture:v132 resolver:v133]);

          uint64_t v131 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidSelectNextRotor](&OBJC_CLASS___VOSOutputEvent, "DidSelectNextRotor"));
        }

        else
        {
          v129 = (void *)objc_claimAutoreleasedReturnValue( +[VOSGesture TwoFingerRotateCounterclockwise]( &OBJC_CLASS___VOSGesture,  "TwoFingerRotateCounterclockwise"));
          v130 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
          uint64_t v224 = objc_claimAutoreleasedReturnValue([v8 eventForTouchGesture:v129 resolver:v130]);

          uint64_t v131 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidSelectPreviousRotor](&OBJC_CLASS___VOSOutputEvent, "DidSelectPreviousRotor"));
        }

        v134 = (void *)v131;
        int v32 = (void *)v224;

        int64_t v17 = v49;
LABEL_162:
        v135 = v134;
        if (v134)
        {
          v136 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
          [v136 sendEvent:v135];
        }

        self->_int64_t continuityZone = v127;
        -[VOTEventFactory _stopMemorizingSession](self, "_stopMemorizingSession");

        goto LABEL_165;
      case 5uLL:
        if (-[VOTEventFactory brailleInputActive](self, "brailleInputActive")) {
          goto LABEL_200;
        }
        -[SCRCGestureFactory distance](self->_gestureFactory, "distance");
        double v59 = sub_10004AFEC(v58);
        double startPinchDistance = self->_startPinchDistance;
        if (startPinchDistance == 0.0)
        {
          self->_double startPinchDistance = v59;
          double startPinchDistance = v59;
        }

        float v61 = (v59 - startPinchDistance) / 20.0;
        float v62 = ceilf(v61);
        float v63 = floorf(v61);
        if (v15 < 0.0) {
          float v63 = v62;
        }
        int64_t v64 = (uint64_t)v63;
        double v65 = (double)(uint64_t)v63;
        double v66 = (double)self->_continuityZone;
        if (v65 == v66) {
          goto LABEL_141;
        }
        if (v65 >= v66)
        {
          if (v65 <= v66) {
            goto LABEL_141;
          }
          char v67 = &kVOTEventCommandSelectRight;
        }

        else
        {
          char v67 = &kVOTEventCommandSelectLeft;
        }

        uint64_t v111 = objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  *v67,  0LL));

        int v32 = (void *)v111;
LABEL_141:
        self->_int64_t continuityZone = v64;
        -[VOTEventFactory _stopMemorizingSession](self, "_stopMemorizingSession");
LABEL_165:
        char v33 = 0;
        id v18 = v234;
        goto LABEL_201;
      case 6uLL:
        if (v235 != (id)2) {
          goto LABEL_200;
        }
        if (self->_flags.twoFingerTapAndSlide && v17 == 6)
        {
          CFAbsoluteTimeGetCurrent();
LABEL_200:
          char v33 = 0;
        }

        else
        {
          if (v17)
          {
            double continuityDistance = self->_zigzag.continuityDistance;
            if (fabs(v15) >= fabs(continuityDistance))
            {
              int64_t v102 = 0LL;
              self->_zigzag.distanceTraveled = 0.0;
            }

            else
            {
              self->_zigzag.distanceTraveled = continuityDistance;
              if (continuityDistance <= 0.1)
              {
                if (continuityDistance >= -0.1) {
                  int64_t v102 = 0LL;
                }
                else {
                  int64_t v102 = -1LL;
                }
              }

              else
              {
                int64_t v102 = 1LL;
              }
            }

            if (v102 != self->_zigzag.direction)
            {
              unint64_t count = self->_zigzag.count;
              if (!count)
              {
                -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
                self->_zigzag.firstCountPoint.double x = v145;
                self->_zigzag.firstCountPoint.double y = v146;
                unint64_t count = self->_zigzag.count;
              }

              self->_zigzag.unint64_t count = count + 1;
            }

            self->_zigzag.direction = v102;
            id v18 = v234;
          }

          else
          {
            self->_zigzag.unint64_t count = 0LL;
          }

          char v33 = 0;
          self->_zigzag.double continuityDistance = v15;
        }

        goto LABEL_201;
      case 8uLL:
      case 9uLL:
        int64_t v34 = v17;
        id v35 = [objc_allocWithZone(AXIndexMap) init];
        -[SCRCGestureFactory startLocation](self->_gestureFactory, "startLocation");
        double v37 = v36;
        -[SCRCGestureFactory endLocation](self->_gestureFactory, "endLocation");
        double v39 = v38;
        -[SCRCGestureFactory directionalSlope](self->_gestureFactory, "directionalSlope");
        double v41 = v40;
        BOOL v42 = +[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", sub_10004AFD4((v37 + v39) * 0.5));
        id v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        [v35 setObject:v43 forIndex:101];

        uint64_t v44 = 3LL;
        if (v34 != 1) {
          uint64_t v44 = 4LL;
        }
        int64_t v227 = v34;
        switch(v34)
        {
          case 1LL:
            if (-[VOTDirectInteractionKeyboardManager inGestureMode]( self->_directInteractionKeyboardManager,  "inGestureMode"))
            {
              double v46 = &kVOTEventCommandGestureTypingDelete;
              goto LABEL_137;
            }

            uint64_t v109 = objc_claimAutoreleasedReturnValue(+[VOSGesture OneFingerFlickLeft](&OBJC_CLASS___VOSGesture, "OneFingerFlickLeft"));
            goto LABEL_169;
          case 2LL:
            if (-[VOTDirectInteractionKeyboardManager inGestureMode]( self->_directInteractionKeyboardManager,  "inGestureMode"))
            {
              goto LABEL_171;
            }

            uint64_t v109 = objc_claimAutoreleasedReturnValue(+[VOSGesture OneFingerFlickRight](&OBJC_CLASS___VOSGesture, "OneFingerFlickRight"));
            goto LABEL_169;
          case 3LL:
            if (-[VOTDirectInteractionKeyboardManager inGestureMode]( self->_directInteractionKeyboardManager,  "inGestureMode"))
            {
              double v46 = &kVOTEventCommandGestureTypingNextSuggestion;
              goto LABEL_137;
            }

            uint64_t v109 = objc_claimAutoreleasedReturnValue(+[VOSGesture OneFingerFlickUp](&OBJC_CLASS___VOSGesture, "OneFingerFlickUp"));
            goto LABEL_169;
          case 4LL:
            if (-[VOTDirectInteractionKeyboardManager inGestureMode]( self->_directInteractionKeyboardManager,  "inGestureMode"))
            {
              double v46 = &kVOTEventCommandGestureTypingPreviousSuggestion;
LABEL_137:
              uint64_t v110 = objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  *v46,  v35));
            }

            else
            {
              uint64_t v109 = objc_claimAutoreleasedReturnValue(+[VOSGesture OneFingerFlickDown](&OBJC_CLASS___VOSGesture, "OneFingerFlickDown"));
LABEL_169:
              v137 = (void *)v109;
              v225 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
              uint64_t v110 = objc_claimAutoreleasedReturnValue([v8 eventForTouchGesture:v137 resolver:v225 info:v35]);

              int v32 = v137;
            }

            int v32 = (void *)v110;
LABEL_171:

            char v33 = 0;
            int64_t v17 = v227;
            break;
          default:
            goto LABEL_171;
        }

        goto LABEL_201;
      case 0xAuLL:
        int64_t v49 = v17;
        id v68 = objc_loadWeakRetained((id *)&self->_rotorManager);
        unsigned int v69 = [v68 rotorEnabled];

        if (v69)
        {
          [v5 time];
          if (v70 - self->_rotateStartTime < 0.2 && !self->_continuityZone)
          {
            if (self->_rotateDirection < 0)
            {
              v154 = (void *)objc_claimAutoreleasedReturnValue( +[VOSGesture TwoFingerRotateCounterclockwise]( &OBJC_CLASS___VOSGesture,  "TwoFingerRotateCounterclockwise"));
              v155 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
              uint64_t v228 = objc_claimAutoreleasedReturnValue([v8 eventForTouchGesture:v154 resolver:v155]);

              uint64_t v73 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidSelectPreviousRotor](&OBJC_CLASS___VOSOutputEvent, "DidSelectPreviousRotor"));
            }

            else
            {
              char v71 = (void *)objc_claimAutoreleasedReturnValue( +[VOSGesture TwoFingerRotateClockwise]( &OBJC_CLASS___VOSGesture,  "TwoFingerRotateClockwise"));
              uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
              uint64_t v228 = objc_claimAutoreleasedReturnValue([v8 eventForTouchGesture:v71 resolver:v72]);

              uint64_t v73 = objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidSelectNextRotor](&OBJC_CLASS___VOSOutputEvent, "DidSelectNextRotor"));
            }

            v156 = (void *)v73;
            int v32 = (void *)v228;
            if (v73)
            {
              v157 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
              [v157 sendEvent:v156];
            }
          }

          int64_t v17 = v49;
          self->_flags.rotating = 0;
          self->_int64_t rotorSoundZone = 0LL;
          self->_int64_t continuityZone = 0LL;
          self->_double rotateStartTime = -3061152000.0;
          self->_rotateDirection = 0LL;
          -[VOTEventFactory _stopMemorizingSession](self, "_stopMemorizingSession");
        }

        else
        {
LABEL_105:
          int64_t v17 = v49;
        }

        goto LABEL_200;
      case 0xBuLL:
        char v33 = 0;
        self->_int64_t continuityZone = 0LL;
        self->_double startPinchDistance = 0.0;
        goto LABEL_201;
      case 0xCuLL:
        if (v235 == (id)2) {
          char v74 = v29;
        }
        else {
          char v74 = 1;
        }
        if ((v74 & 1) != 0)
        {
          if (v235 == (id)3 && !v18)
          {
            if (self->_flags.threeFingerTapAndSlide)
            {
              if (AXDeviceIsPad(v30, v31))
              {
                if (v17 == 5)
                {
                  v199 = v32;
                  uint64_t v76 = 5LL;
                  -[SCRCGestureFactory distance](self->_gestureFactory, "distance");
                  if (v200 >= 0.0) {
                    uint64_t v201 = objc_claimAutoreleasedReturnValue( +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight]( &OBJC_CLASS___VOSGesture,  "ThreeFingerDoubleTapHoldAndFlickRight"));
                  }
                  else {
                    uint64_t v201 = objc_claimAutoreleasedReturnValue( +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft]( &OBJC_CLASS___VOSGesture,  "ThreeFingerDoubleTapHoldAndFlickLeft"));
                  }
                  v212 = (void *)v201;
                  v213 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
                  int v32 = (void *)objc_claimAutoreleasedReturnValue([v8 eventForTouchGesture:v212 resolver:v213]);

                  uint64_t v216 = VOTLogEvent(v214, v215);
                  v211 = (os_log_s *)objc_claimAutoreleasedReturnValue(v216);
                  if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG)) {
                    sub_1000F42D0(v32);
                  }
                }

                else
                {
                  if (v17 != 6)
                  {
LABEL_271:
                    char v33 = 0;
                    self->_flags.threeFingerTapAndSlide = 0;
                    goto LABEL_203;
                  }

                  __int128 v75 = v32;
                  uint64_t v76 = 6LL;
                  -[SCRCGestureFactory distance](self->_gestureFactory, "distance");
                  if (v77 >= 0.0) {
                    uint64_t v78 = objc_claimAutoreleasedReturnValue( +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown]( &OBJC_CLASS___VOSGesture,  "ThreeFingerDoubleTapHoldAndFlickDown"));
                  }
                  else {
                    uint64_t v78 = objc_claimAutoreleasedReturnValue( +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp]( &OBJC_CLASS___VOSGesture,  "ThreeFingerDoubleTapHoldAndFlickUp"));
                  }
                  v206 = (void *)v78;
                  v207 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
                  int v32 = (void *)objc_claimAutoreleasedReturnValue([v8 eventForTouchGesture:v206 resolver:v207]);

                  uint64_t v210 = VOTLogEvent(v208, v209);
                  v211 = (os_log_s *)objc_claimAutoreleasedReturnValue(v210);
                  if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG)) {
                    sub_1000F4258(v32);
                  }
                }

                int64_t v17 = v76;

                goto LABEL_271;
              }

              goto LABEL_177;
            }

            -[SCRCTargetSelectorTimer cancel](self->_threeFingerHoldTimer, "cancel");
            if (v17 != 5)
            {
              if (v17 == 6)
              {
                CGPoint v103 = v32;
                -[SCRCGestureFactory distance](self->_gestureFactory, "distance");
                if (v138 >= 0.0)
                {
                  uint64_t v105 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerFlickUp](&OBJC_CLASS___VOSGesture, "ThreeFingerFlickUp"));
                }

                else
                {
                  if (-[VOTDirectInteractionKeyboardManager inGestureMode]( self->_directInteractionKeyboardManager,  "inGestureMode"))
                  {
                    int v32 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandGestureTypingNextInternationalKeyboard,  0LL));

                    char v33 = 0;
LABEL_274:
                    int64_t v17 = 6LL;
                    goto LABEL_203;
                  }

                  uint64_t v105 = objc_claimAutoreleasedReturnValue(+[VOSGesture ThreeFingerFlickDown](&OBJC_CLASS___VOSGesture, "ThreeFingerFlickDown"));
                }

- (void)_commitDeferredZoomInfo
{
  if (!CGRectIsNull(*(CGRect *)ymmword_1001ACF90))
  {
    objc_opt_class(self, v3);
    objc_msgSend( v4,  "_updateZoomFrame:",  *(_OWORD *)ymmword_1001ACF90,  *(double *)&ymmword_1001ACF90[16],  *(double *)&ymmword_1001ACF90[24]);
    CGSize size = CGRectNull.size;
    *(CGPoint *)ymmword_1001ACF90 = CGRectNull.origin;
    *(CGSize *)&ymmword_1001ACF90[16] = size;
  }

- (void)_commitDeferredZoomInfoIfAppropriate
{
  if ((self->_state | 2) != 3) {
    -[VOTEventFactory _commitDeferredZoomInfo](self, "_commitDeferredZoomInfo");
  }
}

- (void)setCurrentElement:(id)a3
{
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  double v8 = sub_1000B30E0;
  uint64_t v9 = &unk_100176DA8;
  id v4 = a3;
  id v10 = v4;
  double v11 = self;
  AX_PERFORM_WITH_LOCK(&self->_currentElementLock, &v6);
  if (objc_msgSend(v4, "doesHaveTraits:", kAXKeyboardKeyTrait, v6, v7, v8, v9))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory directInteractionKeyboardManager](self, "directInteractionKeyboardManager"));
    [v5 updateKeyboardElement];
  }
}

- (VOTElement)currentElement
{
  uint64_t v5 = 0LL;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  double v8 = sub_1000B31FC;
  uint64_t v9 = sub_1000B320C;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B3214;
  v4[3] = &unk_100176E20;
  v4[4] = self;
  v4[5] = &v5;
  AX_PERFORM_WITH_LOCK(&self->_currentElementLock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VOTElement *)v2;
}

- (void)startTapAndHoldMode:(BOOL)a3
{
  tapHoldTimer = self->_tapHoldTimer;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:](tapHoldTimer, "dispatchAfterDelay:withObject:", v4, 0.0);
}

- (void)_beginNativeSliding:(id)a3
{
  if (a3)
  {
    currentGestureEvent = self->_currentGestureEvent;
    if (currentGestureEvent)
    {
      id v5 = a3;
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[VOTGestureEvent eventRepresentation](currentGestureEvent, "eventRepresentation"));
      self->_flags.sendingToNativeSlide = 1;
      double v6 = (void *)objc_claimAutoreleasedReturnValue([v16 handInfo]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 paths]);
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstPath]);
      [v8 pathLocation];
      self->_nativeSlidingOffset.double x = v9;
      self->_nativeSlidingOffset.double y = v10;

      [v5 centerPoint];
      double v12 = v11;
      double v14 = v13;

      self->_nativeSlidingCenter.double x = v12;
      self->_nativeSlidingCenter.double y = v14;
      sub_1000AA844(v16, v12, v14);
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      [v15 repostEvent:v16];
    }
  }

- (int64_t)orientation
{
  return (int64_t)-[SCRCGestureFactory orientation](self->_gestureFactory, "orientation");
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)_outputElementSummaryFired
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandOutputElementSummary,  0LL));
  self->_flags.firedElementSummaryTimer = 1;
  -[VOTEventFactory processEvent:](self, "processEvent:", v3);
}

- (void)cancelTapAndHold:(CGPoint)a3
{
  threadKedouble y = self->_threadKey;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:", a3.x, a3.y));
  -[VOTEventFactory performSelector:withThreadKey:count:objects:]( self,  "performSelector:withThreadKey:count:objects:",  "_cancelTapAndHoldWithValue:",  threadKey,  1LL,  v5);
}

- (void)_cancelTapAndHoldWithValue:(id)a3
{
}

- (void)_cancelTapAndHold:(CGPoint)a3
{
}

- (void)_cancelTapAndHold:(CGPoint)a3 forScribble:(BOOL)a4
{
  if (self->_flags.tapAndHoldMode)
  {
    double y = a3.y;
    double x = a3.x;
    BOOL v8 = -[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble");
    if (v8 && !a4)
    {
      uint64_t v10 = VOTLogEvent(v8, v9);
      double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Scribble: Not canceling tap and hold, because scribble was in progress.",  buf,  2u);
      }

      goto LABEL_6;
    }

    if (self->_flags.tapAndHoldMode)
    {
      uint64_t v12 = VOTLogEvent(v8, v9);
      double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000F4444(x, y);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
      [WeakRetained performSelector:"updateCurrentElementFrame" withObject:0 afterDelay:0.25];

      self->_flags.BOOL tapAndHoldMode = 0;
      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
      [v15 setInPassthroughMode:0];

      if (CGPointZero.x == x && CGPointZero.y == y)
      {
        -[VOTEventFactory _touchLiftAtPoint:](self, "_touchLiftAtPoint:", x, y);
        goto LABEL_20;
      }

      if (-[VOTEventFactory _systemControlPosition:fingerCount:]( self,  "_systemControlPosition:fingerCount:",  1LL,  self->_systemControlStartPoint.x,  self->_systemControlStartPoint.y) == 1)
      {
        SCRCMathGetVectorAndDistanceForPoints( &v17,  buf,  self->_systemControlStartPoint.x,  self->_systemControlStartPoint.y,  x,  y);
        a3.double x = *(CGFloat *)buf;
        a3.double y = 37.5;
        if (*(double *)buf > 37.5)
        {
          a3.double x = v17;
          a3.double y = 255.0;
          if (v17 > 255.0)
          {
            a3.double y = 290.0;
            if (v17 < 290.0)
            {
              self->_int systemControlPosition = 1;
              double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[VOTEvent internalEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "internalEventWithCommand:info:",  kVOTEventCommandSystemShowNotificationCenter,  0LL,  a3.x));
              -[VOTEventFactory _sendSystemControlEvent:](self, "_sendSystemControlEvent:", v11);
LABEL_6:
            }
          }
        }
      }
    }
  }

- (void)setElementManager:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_elementManager, obj);
    [obj setUpdateDelegate:self];
  }
}

- (void)directInteractionElementsUpdated:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  directInteractionElements = self->_directInteractionElements;
  self->_directInteractionElements = v4;
}

- (BOOL)directInteractionGestureInProgress
{
  return self->_flags.sendingToDirectTouch;
}

- (void)currentElementDidUpdate:(id)a3
{
  id v4 = a3;
  -[VOTEventFactory setCurrentElement:](self, "setCurrentElement:", v4);
  [(id)VOTSharedWorkspace currentElementDidUpdate:v4];
}

- (void)firstResponderDidUpdate:(id)a3
{
  id v5 = (VOTElement *)a3;
  if (self->_firstResponder != v5)
  {
    objc_storeStrong((id *)&self->_firstResponder, a3);
    if (self->_flags.tapAndHoldMode)
    {
      if (-[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble"))
      {
        BOOL v6 = -[VOTEventFactory _canScribbleWithElement:](self, "_canScribbleWithElement:", v5);
        BOOL v7 = v6;
        uint64_t v9 = VOTLogEvent(v6, v8);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
        if (v7)
        {
          if (v11)
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Scribble: Switching to new first responder while scribbling.",  buf,  2u);
          }

          objc_storeStrong((id *)&self->_tapAndHoldScribbleElement, a3);
          self->_flags.tapAndHoldOffsetNeedsUpdate = 1;
        }

        else
        {
          if (v11)
          {
            *(_WORD *)uint64_t v12 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Scribble: Ending because first responder changed.",  v12,  2u);
          }

          -[VOTEventFactory _endScribbleTapAndHoldMode](self, "_endScribbleTapAndHoldMode");
        }
      }
    }
  }
}

- (void)_startLabelElementSoundPlay
{
  if (self->_flags.memorizingData)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[VOSOutputEvent ItemMemorizationInProgress]( &OBJC_CLASS___VOSOutputEvent,  "ItemMemorizationInProgress"));
    [v3 sendEvent:v4];

    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_memorizeSoundTimer, "dispatchAfterDelay:", 0.5);
    self->_flags.didPlayStartLabelSound = 1;
  }

- (void)_stopMemorizingSession
{
  if (self->_flags.didPlayStartLabelSound && self->_flags.memorizingData)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent ItemMemorizationFailed](&OBJC_CLASS___VOSOutputEvent, "ItemMemorizationFailed"));
    [v3 sendEvent:v4];
  }

  self->_flags.memorizingData = 0;
  self->_flags.didPlayStartLabelSound = 0;
}

- (void)_edgePanGestureSpeakHintTimerFired
{
  unint64_t v2 = self->_edgePanGestureState - 2;
  if (v2 <= 5 && ((0x37u >> v2) & 1) != 0)
  {
    id v3 = sub_10004A988(off_1001AC148, off_100179960[v2], 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4)
    {
      id v6 = v4;
      id v5 = sub_10000BBB0(v4, 0, 0LL);
    }
  }

- (BOOL)_tapAndHoldModeIsForScribble
{
  return self->_tapAndHoldScribbleElement != 0LL;
}

- (void)_tapHoldFired:(id)a3
{
  id v4 = a3;
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 postNotificationName:@"TapHoldFired" object:0];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  unsigned int v7 = [v6 helpEnabled];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandTapAndHoldMode,  0LL));
    -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
    -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:", sub_10004AFD4(v9));
    objc_msgSend(v8, "setTouchPoint:");
    -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
    objc_msgSend(v8, "setTouchRawLocation:");
    -[VOTEventFactory processEvent:](self, "processEvent:", v8);
  }

  else
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
    uint64_t v8 = (void *)v10;
    if (v10)
    {
      uint64_t v11 = AXDeviceSupportsSonification(v10);
      if ((_DWORD)v11)
      {
        uint64_t v11 = (uint64_t)[v8 supportsAudiographs];
        if ((v11 & 1) != 0)
        {
          uint64_t v13 = AXDeviceSupportsSonification(v11);
          if ((_DWORD)v13)
          {
            uint64_t v15 = VOTLogEvent(v13, v14);
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              sub_1000F44BC();
            }

            -[VOTEventFactory _beginAudiographScrubbingMode](self, "_beginAudiographScrubbingMode");
          }

          goto LABEL_5;
        }
      }

      uint64_t v17 = VOTLogEvent(v11, v12);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000F44E8();
      }

      -[SCRCGestureFactory firstFingerPressure](self->_gestureFactory, "firstFingerPressure");
      uint64_t v20 = v19;
      -[SCRCGestureFactory firstFingerAltitude](self->_gestureFactory, "firstFingerAltitude");
      __int128 v22 = v21;
      -[SCRCGestureFactory firstFingerAzimuth](self->_gestureFactory, "firstFingerAzimuth");
      double v24 = v23;
      self->_tapAndHoldFingerint Type = -[VOTEventFactory _isStylusGesture](self, "_isStylusGesture");
      if (self->_firstResponder
        && [v8 isEqual:*(double *)&v24]
        && (BOOL v25 = -[VOTEventFactory _canScribbleWithElement:](self, "_canScribbleWithElement:", v8))
        && self->_tapAndHoldFingerType == 1)
      {
        uint64_t v27 = VOTLogEvent(v25, v26);
        unsigned int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Scribble: Starting.", (uint8_t *)buf, 2u);
        }

        objc_storeStrong((id *)&self->_tapAndHoldScribbleElement, v8);
      }

      else
      {
        tapAndHoldScribbleElement = self->_tapAndHoldScribbleElement;
        self->_tapAndHoldScribbleElement = 0LL;

        -[VOTEventFactory _cancelScribbleTapAndHoldModeTimeout](self, "_cancelScribbleTapAndHoldModeTimeout");
        -[VOTEventFactory _cancelUpdateScribbleTapAndHoldModeOffset](self, "_cancelUpdateScribbleTapAndHoldModeOffset");
      }

      if (-[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble")) {
        unsigned __int8 v30 = 0;
      }
      else {
        unsigned __int8 v30 = [v8 prefersContextlessPassthrough];
      }
      -[VOTEventFactory _updateTapAndHoldLocationDataForElement:](self, "_updateTapAndHoldLocationDataForElement:", v8);
      int v32 = v31;
      int64_t v34 = v33;
      if (!-[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble"))
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
        [v35 clearCursorFrame];
      }

      id v36 = [v8 windowContextId];
      double v37 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
      unsigned int v38 = [v37 contextIdHostingContextId:v36];

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_1000B3FB4;
      v54[3] = &unk_100176F30;
      v54[4] = self;
      int v55 = (int)v36;
      unsigned int v56 = v38;
      AX_PERFORM_WITH_LOCK(&self->_tapAndHoldLock, v54);
      self->_flags.tapAndHoldModeContextless = v30;
      self->_flags.BOOL tapAndHoldMode = 1;
      if (-[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble"))
      {
        double v39 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        double v40 = (void *)objc_claimAutoreleasedReturnValue( +[VOSOutputEvent TVDidBeginInteractionWithRotor]( &OBJC_CLASS___VOSOutputEvent,  "TVDidBeginInteractionWithRotor"));
        [v39 sendEvent:v40];
      }

      else if (v4 && !self->_flags.orbMode && [(id)VOTSharedWorkspace soundEffectsEnabled])
      {
        objc_initWeak(buf, self);
        double v41 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        double v48 = _NSConcreteStackBlock;
        uint64_t v49 = 3221225472LL;
        BOOL v50 = sub_1000B4048;
        unsigned int v51 = &unk_100179880;
        objc_copyWeak(v52, buf);
        v52[1] = v32;
        v52[2] = v34;
        v52[3] = v20;
        v52[4] = v22;
        v52[5] = v24;
        [v41 addVOSEventFinishedHandler:&v48 forIdentifier:@"PassThroughHandler"];

        BOOL v42 = (void *)objc_claimAutoreleasedReturnValue( +[VOTOutputManager outputManager]( &OBJC_CLASS___VOTOutputManager,  "outputManager",  v48,  v49,  v50,  v51));
        id v43 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidBeginPassthrough](&OBJC_CLASS___VOSOutputEvent, "DidBeginPassthrough"));
        [v42 sendEvent:v43];

        objc_destroyWeak(v52);
        objc_destroyWeak(buf);
        goto LABEL_5;
      }

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPoint:]( &OBJC_CLASS___NSValue,  "valueWithPoint:",  *(double *)&v32,  *(double *)&v34));
      double v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&v20));
      double v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&v22));
      double v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)&v24));
      -[VOTEventFactory _startTouchDownForTapAndHoldActionWithCenter:force:altitude:azimuth:]( self,  "_startTouchDownForTapAndHoldActionWithCenter:force:altitude:azimuth:",  v44,  v45,  v46,  v47);
    }
  }

- (CGPoint)_updateTapAndHoldLocationDataForElement:(id)a3
{
  id v4 = a3;
  self->_flags.tapAndHoldOffsetNeedsUpdate = 0;
  [v4 centerPoint];
  double x = -1.0;
  BOOL v8 = v6 == -1.0 && v5 == -1.0;
  double v9 = -1.0;
  if (!v8)
  {
    double v10 = v5;
    double v11 = v6;
    [v4 updateVisiblePoint];
    [v4 visiblePoint];
    BOOL v14 = v12 == -1.0;
    BOOL v15 = v13 == -1.0;
    if (v14 && v15) {
      *(double *)&unint64_t v16 = v10;
    }
    else {
      *(double *)&unint64_t v16 = v12;
    }
    if (v14 && v15) {
      *(double *)&unint64_t v17 = v11;
    }
    else {
      *(double *)&unint64_t v17 = v13;
    }
    id v18 = [v4 windowContextId];
    id v19 = [v4 displayId];
    v20.n128_u64[0] = v16;
    v21.n128_u64[0] = v17;
    double x = AXConvertPointFromHostedCoordinates(v18, v19, v20, v21);
    double v9 = v22;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
  [WeakRetained currentLineFrame];
  double v25 = v24;
  double v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  BOOL v32 = CGPointZero.y == v27 && CGPointZero.x == v25;
  if ((objc_msgSend(v4, "doesHaveTraits:", kAXIsEditingTrait, CGPointZero.x) & 1) != 0
    || ([v4 doesHaveTraits:kAXTextAreaTrait] & 1) == 0)
  {
    unsigned int v33 = [v4 doesHaveTraits:kAXWebContentTrait | kAXStaticTextTrait] ^ 1;
  }

  else
  {
    unsigned int v33 = 0;
  }

  v58.origin.double x = v25;
  v58.origin.double y = v27;
  v58.size.width = v29;
  v58.size.height = v31;
  double MidX = CGRectGetMidX(v58);
  v59.origin.double x = v25;
  v59.origin.double y = v27;
  v59.size.width = v29;
  v59.size.height = v31;
  double MidY = CGRectGetMidY(v59);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  objc_msgSend(v36, "convertPoint:toContextId:", objc_msgSend(v4, "windowContextId"), MidX, MidY);
  double v38 = v37;
  double v40 = v39;

  if ((v32 | v33) != 1
    || (double v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataDetectorURL:", v38, v40)),
        v41,
        v41))
  {
    double x = MidX;
    double v9 = MidY;
  }

  -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
  self->_tapHoldOffset.double x = sub_10004AFD4(v42);
  p_tapHoldOffset = &self->_tapHoldOffset;
  self->_tapHoldOffset.double y = v44;
  p_double y = &self->_tapHoldOffset.y;
  -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:");
  self->_tapHoldOffset.double x = v46;
  self->_tapHoldOffset.double y = v47;
  BOOL v48 = -[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble");
  if (v48)
  {
    if (v8)
    {
      uint64_t v50 = VOTLogEvent(v48, v49);
      unsigned int v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        sub_1000F4514();
      }

      goto LABEL_28;
    }

    -[VOTEventFactory _startPointForScribbleWithElement:originalStartPoint:]( self,  "_startPointForScribbleWithElement:originalStartPoint:",  v4,  x,  v9);
    double x = v52;
    double v9 = v53;
  }

  else if (v8)
  {
LABEL_28:
    double x = p_tapHoldOffset->x;
    double v9 = *p_y;
    CGPoint *p_tapHoldOffset = CGPointZero;
    goto LABEL_31;
  }

  p_tapHoldOffset->double x = x - p_tapHoldOffset->x;
  *p_double y = v9 - *p_y;
LABEL_31:
  self->_systemControlStartPoint.double x = x;
  self->_systemControlStartPoint.double y = v9;
  if ([v4 doesHaveTraits:kAXTableIndexTrait])
  {
    else {
      float v54 = &self->_tapHoldOffset;
    }
    v54->double x = 0.0;
  }

  double v55 = x;
  double v56 = v9;
  result.double y = v56;
  result.double x = v55;
  return result;
}

- (CGPoint)_startPointForScribbleWithElement:(id)a3 originalStartPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  switch((unint64_t)-[SCRCGestureFactory orientation](self->_gestureFactory, "orientation", a3))
  {
    case 0uLL:
      double v6 = 30.0;
      goto LABEL_4;
    case 1uLL:
      double v6 = -30.0;
LABEL_4:
      double x = x + v6;
      break;
    case 2uLL:
      double v7 = -30.0;
      goto LABEL_7;
    case 3uLL:
      double v7 = 30.0;
LABEL_7:
      double y = y + v7;
      break;
    default:
      break;
  }

  double v8 = x;
  double v9 = y;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (void)_startTouchDownForTapAndHoldActionWithCenter:(id)a3 force:(id)a4 altitude:(id)a5 azimuth:(id)a6
{
  if (self->_flags.tapAndHoldMode)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    [a3 pointValue];
    double v14 = v13;
    double v16 = v15;
    [v12 doubleValue];
    double v18 = v17;

    [v11 doubleValue];
    double v20 = v19;

    [v10 doubleValue];
    double v22 = v21;

    -[VOTEventFactory _touchDownAtPoint:withForce:altitude:azimuth:]( self,  "_touchDownAtPoint:withForce:altitude:azimuth:",  v14,  v16,  v18,  v20,  v22);
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
    [v23 setInPassthroughMode:1];
  }

- (void)_threeFingerHoldFired
{
  self->_flags.threeFingerTapAndSlide = 1;
  self->_flags.memorizingData = 0;
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandShowEditingHUD,  0LL));
  -[VOTEventFactory processEvent:](self, "processEvent:", v3);
}

- (void)_contextlessTouchWithHandType:(unsigned int)a3 location:(CGPoint)a4 force:(double)a5 altitude:(double)a6 azimuth:(double)a7
{
  uint64_t v10 = *(void *)&a3;
  AXNormalizePoint(1LL, a2, (__n128)a4, *(__n128 *)&a4.y);
  id v33 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation touchRepresentationWithHandType:location:]( &OBJC_CLASS___AXEventRepresentation,  "touchRepresentationWithHandType:location:",  v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v33 handInfo]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 paths]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstPath]);
  [v14 setTransducerType:2];

  double v15 = (void *)objc_claimAutoreleasedReturnValue([v33 handInfo]);
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 paths]);
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstPath]);
  *(float *)&a5 = a5;
  LODWORD(v18) = LODWORD(a5);
  [v17 setOrbValue:v18];

  if (self->_tapAndHoldFingerType == 1)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v33 handInfo]);
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 paths]);
    double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstPath]);
    [v21 setTransducerType:0];

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v33 handInfo]);
    double v24 = (void *)objc_claimAutoreleasedReturnValue([v23 paths]);
    double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstPath]);
    float v22 = a6;
    *(float *)&double v26 = v22;
    [v25 setAltitude:v26];

    double v28 = (void *)objc_claimAutoreleasedReturnValue([v33 handInfo]);
    CGFloat v29 = (void *)objc_claimAutoreleasedReturnValue([v28 paths]);
    double v30 = (void *)objc_claimAutoreleasedReturnValue([v29 firstPath]);
    float v27 = a7;
    *(float *)&double v31 = v27;
    [v30 setAzimuth:v31];
  }

  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
  [v32 sendHIDSystemEvent:v33 senderID:0x8000000817319373];
}

- (void)_touchDownAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  if (self->_flags.tapAndHoldModeContextless)
  {
    -[VOTEventFactory _contextlessTouchWithHandType:location:force:altitude:azimuth:]( self,  "_contextlessTouchWithHandType:location:force:altitude:azimuth:",  1LL,  a3.x,  a3.y,  a4,  a5,  a6);
    return;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory tapAndHoldContextNumbers](self, "tapAndHoldContextNumbers"));
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v13) {
    goto LABEL_15;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v22;
  do
  {
    for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v12);
      }
      double v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      tapAndHoldFingerint Type = self->_tapAndHoldFingerType;
      if (tapAndHoldFingerType != 1)
      {
        if (!tapAndHoldFingerType)
        {
          double v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
          objc_msgSend( v19,  "postFingerTouchAtPoint:withForce:withContextId:",  objc_msgSend(v17, "unsignedIntValue"),  x,  y,  a4);
          goto LABEL_13;
        }

        int64_t v20 = self->_tapAndHoldFingerType;
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTEventFactory.m",  5606LL,  "-[VOTEventFactory _touchDownAtPoint:withForce:altitude:azimuth:]",  @"Weird finger type %d");
      }

      double v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement", v20));
      objc_msgSend( v19,  "postStylusTouchAtPoint:withForce:altitude:azimuth:withContextId:",  objc_msgSend(v17, "unsignedIntValue"),  x,  y,  a4,  a5,  a6);
LABEL_13:
    }

    id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }

  while (v14);
LABEL_15:
}

- (void)_touchDragAtPoint:(CGPoint)a3 withForce:(double)a4 altitude:(double)a5 azimuth:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  if (self->_flags.tapAndHoldModeContextless)
  {
    -[VOTEventFactory _contextlessTouchWithHandType:location:force:altitude:azimuth:]( self,  "_contextlessTouchWithHandType:location:force:altitude:azimuth:",  2LL,  a3.x,  a3.y,  a4,  a5,  a6);
    return;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory tapAndHoldContextNumbers](self, "tapAndHoldContextNumbers"));
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v13) {
    goto LABEL_15;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v22;
  do
  {
    for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v12);
      }
      double v17 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      tapAndHoldFingerint Type = self->_tapAndHoldFingerType;
      if (tapAndHoldFingerType != 1)
      {
        if (!tapAndHoldFingerType)
        {
          double v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
          objc_msgSend( v19,  "postFingerDragAtPoint:withForce:withContextId:",  objc_msgSend(v17, "unsignedIntValue"),  x,  y,  a4);
          goto LABEL_13;
        }

        int64_t v20 = self->_tapAndHoldFingerType;
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTEventFactory.m",  5629LL,  "-[VOTEventFactory _touchDragAtPoint:withForce:altitude:azimuth:]",  @"Weird finger type %d");
      }

      double v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement", v20));
      objc_msgSend( v19,  "postStylusDragAtPoint:withForce:altitude:azimuth:withContextId:",  objc_msgSend(v17, "unsignedIntValue"),  x,  y,  a4,  a5,  a6);
LABEL_13:
    }

    id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }

  while (v14);
LABEL_15:
}

- (id)tapAndHoldContextNumbers
{
  uint64_t v5 = 0LL;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  double v8 = sub_1000B31FC;
  double v9 = sub_1000B320C;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000B4D9C;
  v4[3] = &unk_100176E20;
  v4[4] = self;
  v4[5] = &v5;
  AX_PERFORM_WITH_LOCK(&self->_tapAndHoldLock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_touchLiftAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_flags.tapAndHoldModeContextless)
  {
    id v6 = -[VOTEventFactory _contextlessTouchWithHandType:location:force:altitude:azimuth:]( self,  "_contextlessTouchWithHandType:location:force:altitude:azimuth:",  6LL,  a3.x,  a3.y,  0.0,  0.0,  0.0);
    goto LABEL_16;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory tapAndHoldContextNumbers](self, "tapAndHoldContextNumbers"));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8) {
    goto LABEL_15;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v17;
  do
  {
    for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
      tapAndHoldFingerint Type = self->_tapAndHoldFingerType;
      if (tapAndHoldFingerType != 1)
      {
        if (!tapAndHoldFingerType)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
          objc_msgSend(v14, "postFingerLiftAtPoint:withContextId:", objc_msgSend(v12, "unsignedIntValue"), x, y);
          goto LABEL_13;
        }

        int64_t v15 = self->_tapAndHoldFingerType;
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTEventFactory.m",  5661LL,  "-[VOTEventFactory _touchLiftAtPoint:]",  @"Weird finger type %d");
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement", v15));
      objc_msgSend(v14, "postStylusLiftAtPoint:withContextId:", objc_msgSend(v12, "unsignedIntValue"), x, y);
LABEL_13:
    }

    id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }

  while (v9);
LABEL_15:

LABEL_16:
}

- (void)_processIdle:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  *(_WORD *)&self->_flags.twoFingerTapAndSlide = 0;
  -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:");
  -[VOTEventFactory _stopMemorizingSession](self, "_stopMemorizingSession");
  self->_flags.splitSlide = 0;
  self->_flags.handwritingOnldouble y = 0;
  -[SCRCTargetSelectorTimer cancel](self->_systemControlLocationTimer, "cancel");
  self->_systemControlActivated = 0;
  *(_OWORD *)&self->_systemControlStartSwipeTime = xmmword_100132D40;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandIdle,  0LL));
  objc_msgSend(v6, "setTouchPoint:", x, y);
  -[VOTEventFactory processEvent:](self, "processEvent:", v6);
  if (-[VOTEventFactory _shouldDismissPreviewOnLift](self, "_shouldDismissPreviewOnLift")
    && !-[VOTEventFactory _isPreviewElementSelected](self, "_isPreviewElementSelected"))
  {
    -[VOTEventFactory _liftFromTapAndHoldAndResetFingers:](self, "_liftFromTapAndHoldAndResetFingers:", 1LL);
  }

  else
  {
    self->_isPreviewPinned = 1;
  }
}

- (void)_processTapAndHoldMode:(id)a3
{
  id v4 = a3;
  if (self->_flags.orbMode
    && (id v5 = -[SCRCGestureFactory firstFingerPressure](self->_gestureFactory, "firstFingerPressure"),
        v6 < AXForceTouchThresholdPeek(v5)))
  {
    -[VOTEventFactory _switchToTrackingMode](self, "_switchToTrackingMode");
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
    unsigned __int8 v8 = [v7 helpEnabled];

    if ((v8 & 1) == 0)
    {
      if ([v4 fingerCount] == (id)1)
      {
        if (self->_flags.audiographScrubbingMode)
        {
          if (AXDeviceSupportsSonification(1LL)) {
            -[VOTEventFactory _handleAudiographScrubbingPositionChanged]( self,  "_handleAudiographScrubbingPositionChanged");
          }
        }

        else
        {
          -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation", CFAbsoluteTimeGetCurrent());
          double v10 = sub_10004AFD4(v9);
          double v12 = v11;
          -[SCRCGestureFactory firstFingerPressure](self->_gestureFactory, "firstFingerPressure");
          double v14 = v13;
          -[SCRCGestureFactory firstFingerAltitude](self->_gestureFactory, "firstFingerAltitude");
          double v16 = v15;
          -[SCRCGestureFactory firstFingerAzimuth](self->_gestureFactory, "firstFingerAzimuth");
          double v18 = v17;
          if (-[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble")
            && [v4 isDownEvent])
          {
            if (self->_flags.tapAndHoldOffsetNeedsUpdate) {
              -[VOTEventFactory _updateTapAndHoldLocationDataForElement:]( self,  "_updateTapAndHoldLocationDataForElement:",  self->_firstResponder);
            }
            int v19 = 1;
          }

          else
          {
            int v19 = 0;
          }

          -[VOTEventFactory convertDevicePointToZoomedPoint:]( self,  "convertDevicePointToZoomedPoint:",  v10 + self->_tapHoldOffset.x,  v12 + self->_tapHoldOffset.y);
          double v27 = v25;
          double v28 = v26;
          if (v19)
          {
            BOOL v29 = -[VOTEventFactory _isStylusGesture](self, "_isStylusGesture");
            if (!v29)
            {
              uint64_t v31 = VOTLogEvent(v29, v30);
              BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                sub_1000F4540();
              }
            }

            -[VOTEventFactory _cancelScribbleTapAndHoldModeTimeout](self, "_cancelScribbleTapAndHoldModeTimeout");
            -[VOTEventFactory _cancelUpdateScribbleTapAndHoldModeOffset]( self,  "_cancelUpdateScribbleTapAndHoldModeOffset");
            -[VOTEventFactory _touchDownAtPoint:withForce:altitude:azimuth:]( self,  "_touchDownAtPoint:withForce:altitude:azimuth:",  v27,  v28,  v14,  v16,  v18);
          }

          else
          {
            -[VOTEventFactory _touchDragAtPoint:withForce:altitude:azimuth:]( self,  "_touchDragAtPoint:withForce:altitude:azimuth:",  v25,  v26,  v14,  v16,  v18);
          }

          id v33 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandTapAndHoldEventMonitor,  0LL));
          objc_msgSend(v33, "setTouchPoint:", v27, v28);
          -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
          objc_msgSend(v33, "setTouchRawLocation:");
          [v33 setTouchForce:v14];
          -[VOTEventFactory processEvent:](self, "processEvent:", v33);
        }
      }

      else if (self->_flags.audiographScrubbingMode)
      {
        -[VOTEventFactory _endAudiographScrubbingMode](self, "_endAudiographScrubbingMode");
      }

      else
      {
        BOOL v20 = -[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble");
        if (v20)
        {
          uint64_t v22 = VOTLogEvent(v20, v21);
          __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int64_t v34 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Scribble: Lift occurred, but not ending tap and hold because scribble was in progress.",  v34,  2u);
          }

          -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
          -[VOTEventFactory _touchLiftAtPoint:](self, "_touchLiftAtPoint:", sub_10004AFD4(v24));
          -[VOTEventFactory _startScribbleTapAndHoldModeTimeout](self, "_startScribbleTapAndHoldModeTimeout");
          -[VOTEventFactory _scheduleUpdateScribbleTapAndHoldModeOffset]( self,  "_scheduleUpdateScribbleTapAndHoldModeOffset");
        }

        else
        {
          -[VOTEventFactory _liftFromTapAndHoldAndResetFingers:](self, "_liftFromTapAndHoldAndResetFingers:", 1LL);
        }
      }
    }
  }
}

- (void)_cancelScribbleTapAndHoldModeTimeout
{
  uint64_t v3 = VOTLogEvent(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Scribble: Cancel timeout.", v5, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_endScribbleTapAndHoldMode",  0LL);
}

- (void)_startScribbleTapAndHoldModeTimeout
{
  id v3 = -[VOTEventFactory _cancelScribbleTapAndHoldModeTimeout](self, "_cancelScribbleTapAndHoldModeTimeout");
  uint64_t v5 = VOTLogEvent(v3, v4);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Scribble: Will end after delay.", v7, 2u);
  }

  -[VOTEventFactory performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_endScribbleTapAndHoldMode",  0LL,  5.0);
}

- (void)_endScribbleTapAndHoldMode
{
  if (self->_flags.tapAndHoldMode
    && -[VOTEventFactory _tapAndHoldModeIsForScribble](self, "_tapAndHoldModeIsForScribble"))
  {
    id v3 = -[VOTEventFactory _cancelScribbleTapAndHoldModeTimeout](self, "_cancelScribbleTapAndHoldModeTimeout");
    uint64_t v5 = VOTLogEvent(v3, v4);
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Scribble: Ending.", v9, 2u);
    }

    -[VOTEventFactory _cancelTapAndHold:forScribble:]( self,  "_cancelTapAndHold:forScribble:",  1LL,  CGPointZero.x,  CGPointZero.y);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[VOSOutputEvent TVDidEndInteractionWithRotor]( &OBJC_CLASS___VOSOutputEvent,  "TVDidEndInteractionWithRotor"));
    [v7 sendEvent:v8];
  }

- (void)_cancelUpdateScribbleTapAndHoldModeOffset
{
  uint64_t v3 = VOTLogEvent(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Scribble: Cancel update for offset.", v5, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_markTapAndHoldOffsetAsDirty",  0LL);
}

- (void)_scheduleUpdateScribbleTapAndHoldModeOffset
{
  id v3 = -[VOTEventFactory _cancelUpdateScribbleTapAndHoldModeOffset](self, "_cancelUpdateScribbleTapAndHoldModeOffset");
  uint64_t v5 = VOTLogEvent(v3, v4);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Scribble: Will update offset after delay.", v7, 2u);
  }

  -[VOTEventFactory performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_markTapAndHoldOffsetAsDirty",  0LL,  1.0);
}

- (void)_markTapAndHoldOffsetAsDirty
{
  id v3 = -[VOTEventFactory _cancelUpdateScribbleTapAndHoldModeOffset](self, "_cancelUpdateScribbleTapAndHoldModeOffset");
  uint64_t v5 = VOTLogEvent(v3, v4);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Scribble: Set flag that offset needs update.",  v7,  2u);
  }

  self->_flags.tapAndHoldOffsetNeedsUpdate = 1;
}

- (void)_liftFromTapAndHoldAndResetFingers:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = VOTLogEvent(self, a2);
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000F456C(v3, v6);
  }

  -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
  double v8 = sub_10004AFD4(v7);
  double v10 = v9;
  -[VOTEventFactory _cancelTapAndHold:](self, "_cancelTapAndHold:");
  -[VOTEventFactory _touchLiftAtPoint:]( self,  "_touchLiftAtPoint:",  v8 + self->_tapHoldOffset.x,  v10 + self->_tapHoldOffset.y);
  -[VOTEventFactory _liftPreviewFinger](self, "_liftPreviewFinger");
  if (v3) {
    -[VOTEventFactory _setFingerCount:](self, "_setFingerCount:", 0LL);
  }
}

- (BOOL)_canScribbleWithElement:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_beginAudiographScrubbingMode
{
  if (AXDeviceSupportsSonification(self))
  {
    self->_flags.BOOL tapAndHoldMode = 1;
    tapAndHoldScribbleElement = self->_tapAndHoldScribbleElement;
    self->_tapAndHoldScribbleElement = 0LL;

    if (!self->_flags.orbMode)
    {
      unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent DidBeginPassthrough](&OBJC_CLASS___VOSOutputEvent, "DidBeginPassthrough"));
      [v4 sendEvent:v5];
    }

    self->_flags.audiographScrubbingMode = 1;
    -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
    -[SCRCGestureFactory orientation](self->_gestureFactory, "orientation");
    sub_10004B190();
    self->_audiographScrubbingPreviousLocation.double x = v6;
    self->_audiographScrubbingPreviousLocation.double y = v7;
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[VOTAudiographManager sharedManager](&OBJC_CLASS___VOTAudiographManager, "sharedManager"));
    [v8 beginScrubbingSession];
  }

- (void)_handleAudiographScrubbingPositionChanged
{
  if (AXDeviceSupportsSonification(self))
  {
    -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
    -[SCRCGestureFactory orientation](self->_gestureFactory, "orientation");
    sub_10004B190();
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    double v7 = (v3 - self->_audiographScrubbingPreviousLocation.x) * 1.5;
    if (v7 != 0.0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTAudiographManager sharedManager](&OBJC_CLASS___VOTAudiographManager, "sharedManager"));
      [v8 currentPlaybackPosition];
      double v10 = v9;

      double v11 = v7 + v10;
      BOOL v12 = 1.0 - v10 > 0.00001 && v10 > 0.00001;
      self->_canPlayBoundaryFeedback = v12;
      if (v11 >= 0.0)
      {
        if (v11 > 1.0)
        {
          double v13 = 1.0;
        }

        else
        {
          BOOL v12 = 0;
          double v13 = v7 + v10;
        }

        if (!v12) {
          goto LABEL_15;
        }
        double v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        double v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
        [v14 sendEvent:v15];
        double v13 = 1.0;
      }

      else
      {
        double v13 = 0.0;
        if (!v12)
        {
LABEL_15:
          double v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOTAudiographManager sharedManager](&OBJC_CLASS___VOTAudiographManager, "sharedManager"));
          [v16 scrubToPosition:v13];

          self->_audiographScrubbingPreviousLocation.double x = v4;
          self->_audiographScrubbingPreviousLocation.double y = v6;
          return;
        }

        double v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
        double v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
        [v14 sendEvent:v15];
      }

      goto LABEL_15;
    }
  }

- (void)_endAudiographScrubbingMode
{
  if (AXDeviceSupportsSonification(self))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTAudiographManager sharedManager](&OBJC_CLASS___VOTAudiographManager, "sharedManager"));
    unsigned int v4 = [v3 isScrubbing];

    if (v4)
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTAudiographManager sharedManager](&OBJC_CLASS___VOTAudiographManager, "sharedManager"));
      [v5 endScrubbingSession];

      self->_flags.audiographScrubbingMode = 0;
    }
  }

- (void)_handleElementPreviewNotification:(id)a3
{
  unsigned int v4 = [a3 isEqualToNumber:&__kCFBooleanTrue];
  self->_isInPreview = v4;
  if (v4)
  {
    self->_previewStartTime = CFAbsoluteTimeGetCurrent();
    -[VOTEventFactory _updateCurrentElementOrbGestureMode](self, "_updateCurrentElementOrbGestureMode");
    -[VOTEventFactory _switchToTrackingMode](self, "_switchToTrackingMode");
  }

  else
  {
    self->_isPreviewPinned = 0;
    -[VOTEventFactory _liftPreviewFinger](self, "_liftPreviewFinger");
  }

- (void)_handleKeyboardVisibilityChanged:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000B5B6C;
  v3[3] = &unk_100176D38;
  v3[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v3, a2, 0.35);
}

- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (_AXSZoomTouchEnabled(self))
  {
    if (*(float *)&dword_1001ACF68 > 1.0 && !CGRectIsEmpty(*(CGRect *)ymmword_1001ACF70))
    {
      uint64_t v6 = AXInCheckerBoardScenario();
      if ((v6 & 1) == 0 && (AXInPreboardScenario(v6) & 1) == 0)
      {
        LODWORD(v7) = dword_1001ACF68;
        if (*(float *)&dword_1001ACF68 == 0.0)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance", v7));
          [v8 zoomLevelOnDisplay:0];
          *(float *)&double v9 = v9;
          dword_1001ACF68 = LODWORD(v9);

          double v10 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
          [v10 zoomFrameOnDisplay:0];
          +[VOTEventFactory _updateZoomFrame:](&OBJC_CLASS___VOTEventFactory, "_updateZoomFrame:");
        }

        -[VOTEventFactory _convertFrame:toPortraitFromOrientation:]( self,  "_convertFrame:toPortraitFromOrientation:",  -[SCRCGestureFactory orientation](self->_gestureFactory, "orientation", v7),  *(double *)ymmword_1001ACF70,  *(double *)&ymmword_1001ACF70[8],  *(double *)&ymmword_1001ACF70[16],  *(double *)&ymmword_1001ACF70[24]);
        double x = floor(v13 + x / *(double *)&xmmword_1001AD170 * v11);
        double y = floor(v14 + v12 * (y / *((double *)&xmmword_1001AD170 + 1)));
      }
    }
  }

  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGRect)_convertFrame:(CGRect)a3 toPortraitFromOrientation:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  switch(a4)
  {
    case 3LL:
      double v11 = *(double *)&xmmword_1001AD170;
      double v9 = v11 - CGRectGetMaxY(a3);
LABEL_7:
      double v13 = height;
      CGFloat height = width;
      goto LABEL_10;
    case 2LL:
      double v12 = *((double *)&xmmword_1001AD170 + 1);
      double x = v12 - CGRectGetMaxX(a3);
      double v9 = y;
      goto LABEL_7;
    case 1LL:
      double v8 = *(double *)&xmmword_1001AD170;
      double v9 = v8 - CGRectGetMaxX(a3);
      double v10 = *((double *)&xmmword_1001AD170 + 1);
      v17.origin.double x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      double x = v10 - CGRectGetMaxY(v17);
      break;
    default:
      double v9 = a3.origin.x;
      double x = a3.origin.y;
      break;
  }

  double v13 = width;
LABEL_10:
  double v14 = v9;
  double v15 = x;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGPoint)_convertZoomPointToDevicePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[VOTEventFactory _convertFrame:toPortraitFromOrientation:]( self,  "_convertFrame:toPortraitFromOrientation:",  -[SCRCGestureFactory orientation](self->_gestureFactory, "orientation"),  *(double *)ymmword_1001ACF70,  *(double *)&ymmword_1001ACF70[8],  *(double *)&ymmword_1001ACF70[16],  *(double *)&ymmword_1001ACF70[24]);
  double v9 = *(double *)&xmmword_1001AD170 * ((x - v5) / v7);
  double v10 = *((double *)&xmmword_1001AD170 + 1) * ((y - v6) / v8);
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_convertZoomRecordToDeviceRecord:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 3001)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handInfo", 0));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 paths]);

    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
          [v11 pathLocation];
          -[VOTEventFactory _convertZoomPointToDevicePoint:](self, "_convertZoomPointToDevicePoint:");
          objc_msgSend(v11, "setPathLocation:");
        }

        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v8);
    }
  }
}

- (void)_handleEventWithData:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation representationWithData:]( &OBJC_CLASS___AXEventRepresentation,  "representationWithData:",  a3));
  double v5 = v4;
  if (v4)
  {
    double v16 = v4;
    unsigned int v6 = [v4 additionalFlags];
    double v5 = v16;
    if ((v6 & 0x2000000) != 0)
    {
      id v7 = [v16 senderID];
      double v5 = v16;
      if (v7 != (id)0x8000000817319373LL)
      {
        if (_AXSZoomTouchEnabled(v7))
        {
          LODWORD(v8) = dword_1001ACF68;
          if (*(float *)&dword_1001ACF68 > 1.0)
          {
            BOOL IsEmpty = CGRectIsEmpty(*(CGRect *)ymmword_1001ACF70);
            if (!IsEmpty && (AXInPreboardScenario(IsEmpty) & 1) == 0 && (AXInCheckerBoardScenario() & 1) == 0) {
              -[VOTEventFactory _convertZoomRecordToDeviceRecord:](self, "_convertZoomRecordToDeviceRecord:", v16);
            }
          }
        }

        unsigned int v10 = objc_msgSend(v16, "originalType", v8);
        switch(v10)
        {
          case 0x3E9u:
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained handleMenuButtonPress:v16];

            goto LABEL_22;
          case 0x3EAu:
          case 0x3EBu:
          case 0x3ECu:
          case 0x3EDu:
          case 0x3EEu:
          case 0x3F0u:
          case 0x3F6u:
          case 0x3F7u:
          case 0x3F8u:
          case 0x3F9u:
          case 0x3FAu:
          case 0x3FBu:
          case 0x3FCu:
          case 0x3FDu:
          case 0x3FEu:
          case 0x3FFu:
          case 0x400u:
            break;
          case 0x3EFu:
          case 0x3F1u:
            id v11 = objc_loadWeakRetained((id *)&self->_delegate);
            [v11 handleVolumeButtonPress:v16];
            goto LABEL_15;
          case 0x3F2u:
LABEL_22:
            [(id)VOTSharedWorkspace unmuteEligibleEventOccured];
            break;
          case 0x3F3u:
            id v11 = objc_loadWeakRetained((id *)&self->_delegate);
            [v11 handleLockButtonPress:v16];
            goto LABEL_15;
          case 0x3F4u:
          case 0x3F5u:
            goto LABEL_14;
          case 0x401u:
          case 0x402u:
          case 0x403u:
          case 0x404u:
          case 0x405u:
          case 0x406u:
            id v11 = objc_loadWeakRetained((id *)&self->_delegate);
            [v11 handleMediaKeyPress:v16];
            goto LABEL_15;
          case 0x407u:
            id v11 = objc_loadWeakRetained((id *)&self->_delegate);
            [v11 handleProximityEvent:v16];
            goto LABEL_15;
          case 0x408u:
          case 0x409u:
            id v12 = objc_loadWeakRetained((id *)&self->_delegate);
            [v12 handlePlayPauseKeyPress:v16];

LABEL_14:
            id v11 = objc_loadWeakRetained((id *)&self->_delegate);
            [v11 handleRingerSwitchSwitched:v16];
LABEL_15:

            break;
          default:
            if (v10 == 3001)
            {
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
              unsigned __int8 v14 = [v13 isPassivelyListeningForEvents];

              if ((v14 & 1) == 0) {
                _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTEventFactory.m",  6133LL,  "-[VOTEventFactory _handleEventWithData:]",  @"We shouldn't be getting touch events through this.. only through HID");
              }
            }

            break;
        }

        [(id)VOTSharedWorkspace userInteractedWithDevice];
        double v5 = v16;
      }
    }
  }
}

- (CGPoint)fingerPosition
{
  double v3 = sub_10004AFD4(v2);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)_setFingerCount:(unint64_t)a3
{
  self->_int64_t fingerCount = a3;
  if (!a3) {
    -[VOTEventFactory _commitDeferredZoomInfo](self, "_commitDeferredZoomInfo");
  }
}

- (unint64_t)fingerCount
{
  return self->_fingerCount;
}

- (BOOL)tapAndHoldMode
{
  return self->_flags.tapAndHoldMode;
}

- (void)directInteractionModeStatus:(BOOL)a3
{
  if (a3)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory directInteractionKeyboardManager](self, "directInteractionKeyboardManager"));
    [v4 gestureKeyboardRegion];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    -[VOTEventFactory _convertFrame:toPortraitFromOrientation:]( self,  "_convertFrame:toPortraitFromOrientation:",  -[SCRCGestureFactory orientation](self->_gestureFactory, "orientation"),  v6,  v8,  v10,  v12);
    double v14 = v13;
    double x = sub_10004AFBC(v15);
    double y = v17;
    double width = sub_10004AFBC(v14);
    double height = v20;
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }

  -[SCRCGestureFactory setTapSpeedTimeThreshold:forRegion:fingerCount:]( self->_gestureFactory,  "setTapSpeedTimeThreshold:forRegion:fingerCount:",  3LL,  0.0,  x,  y,  width,  height);
}

- (BOOL)_isPreviewElementSelected
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  unsigned __int8 v4 = [v3 isEqualToString:@"PreviewContainerElement"];

  return v4;
}

- (void)_simulatePreviewActionGesture
{
  int y = (int)self->_previewFingerLocation.y;
  if (y >= 1)
  {
    do
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      unsigned __int8 v4 = self->_previewFingerContextId;
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v15;
        double v8 = fmax((double)y, 0.0);
        do
        {
          double v9 = 0LL;
          do
          {
            if (*(void *)v15 != v7) {
              objc_enumerationMutation(v4);
            }
            double v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)v9);
            self->_previewFingerLocation.int y = v8;
            double v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
            objc_msgSend( v11,  "postFingerDragAtPoint:withForce:withContextId:",  objc_msgSend(v10, "unsignedIntValue"),  self->_previewFingerLocation.x,  self->_previewFingerLocation.y,  0.0);

            double v9 = (char *)v9 + 1;
          }

          while (v6 != v9);
          id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
        }

        while (v6);
      }

      usleep(0x3E8u);
      BOOL v12 = __OFSUB__(y, 5);
      y -= 5;
    }

    while (!((y < 0) ^ v12 | (y == 0)));
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B6514;
  v13[3] = &unk_100176D38;
  v13[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v13, a2, 0.75);
}

- (void)_reducePreviewFingerStartingForce:(double)a3
{
  for (double i = self->_previewFingerStartingForce; i > a3; double i = self->_previewFingerStartingForce)
  {
    self->_previewFingerStartingForce = fmax(a3, i + -2.0);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = self->_previewFingerContextId;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        double v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v10);
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
          objc_msgSend( v12,  "postFingerTouchAtPoint:withForce:withContextId:",  objc_msgSend(v11, "unsignedIntValue"),  self->_previewFingerLocation.x,  self->_previewFingerLocation.y,  self->_previewFingerStartingForce);

          double v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v8);
    }

    usleep(5u);
  }

- (void)_simulatePop
{
  self->_isInPreview = 0;
  self->_isPreviewPinned = 0;
  AXForceTouchThresholdPeekPopMidpoint();
  id v3 = -[VOTEventFactory _reducePreviewFingerStartingForce:](self, "_reducePreviewFingerStartingForce:");
  double previewFingerStartingForce = self->_previewFingerStartingForce;
  self->_currentTouchForce = previewFingerStartingForce;
  if (previewFingerStartingForce <= AXForceTouchThresholdPop(v3))
  {
    do
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v6 = self->_previewFingerContextId;
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          double v10 = 0LL;
          do
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            double v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v10);
            BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
            objc_msgSend( v12,  "postFingerTouchAtPoint:withForce:withContextId:",  objc_msgSend(v11, "unsignedIntValue"),  self->_previewFingerLocation.x,  self->_previewFingerLocation.y,  self->_currentTouchForce);

            double v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        }

        while (v8);
      }

      uint64_t v13 = usleep(5u);
      double v14 = self->_currentTouchForce + 2.0;
      self->_currentTouchForce = v14;
    }

    while (v14 <= AXForceTouchThresholdPop(v13));
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000B6850;
  v15[3] = &unk_100176D38;
  v15[4] = self;
  AXPerformBlockOnMainThreadAfterDelay(v15, v5, 0.25);
}

- (void)_simulatePeekAndSwitchToTapHoldMode
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
  unsigned __int8 v4 = v3;
  if (v3)
  {
    [v3 centerPoint];
    double v7 = -1.0;
    BOOL v8 = v5 == -1.0 && v6 == -1.0;
    double v9 = -1.0;
    if (!v8)
    {
      double v10 = v5;
      double v11 = v6;
      [v4 updateVisiblePoint];
      [v4 visiblePoint];
      BOOL v14 = v12 == -1.0;
      BOOL v15 = v13 == -1.0;
      if (v14 && v15) {
        *(double *)&unint64_t v16 = v10;
      }
      else {
        *(double *)&unint64_t v16 = v12;
      }
      if (v14 && v15) {
        *(double *)&unint64_t v17 = v11;
      }
      else {
        *(double *)&unint64_t v17 = v13;
      }
      id v18 = [v4 windowContextId];
      id v19 = [v4 displayId];
      v20.n128_u64[0] = v16;
      v21.n128_u64[0] = v17;
      double v7 = AXConvertPointFromHostedCoordinates(v18, v19, v20, v21);
      double v9 = v22;
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);
    [WeakRetained currentLineFrame];
    double v25 = v24;
    double v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    BOOL v32 = CGPointZero.y == v27 && CGPointZero.x == v25;
    if ((objc_msgSend(v4, "doesHaveTraits:", kAXIsEditingTrait, CGPointZero.x) & 1) != 0
      || ([v4 doesHaveTraits:kAXTextAreaTrait] & 1) == 0)
    {
      unsigned int v33 = [v4 doesHaveTraits:kAXWebContentTrait | kAXStaticTextTrait] ^ 1;
    }

    else
    {
      unsigned int v33 = 0;
    }

    v63.origin.double x = v25;
    v63.origin.int y = v27;
    v63.size.double width = v29;
    v63.size.double height = v31;
    double MidX = CGRectGetMidX(v63);
    v64.origin.double x = v25;
    v64.origin.int y = v27;
    v64.size.double width = v29;
    v64.size.double height = v31;
    double MidY = CGRectGetMidY(v64);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    objc_msgSend(v36, "convertPoint:toContextId:", objc_msgSend(v4, "windowContextId"), MidX, MidY);
    double v38 = v37;
    double v40 = v39;

    if ((v32 | v33) != 1
      || (double v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataDetectorURL:", v38, v40)),
          v41,
          v41))
    {
      double v7 = MidX;
      double v9 = MidY;
    }

    id v42 = [v4 windowContextId];
    id v43 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
    unsigned int v44 = [v43 contextIdHostingContextId:v42];

    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1000B6C44;
    v59[3] = &unk_100176F30;
    v59[4] = self;
    int v60 = (int)v42;
    unsigned int v61 = v44;
    uint64_t v45 = AX_PERFORM_WITH_LOCK(&self->_tapAndHoldLock, v59);
    self->_currentTouchForce = 0.0;
    if (AXForceTouchThresholdPeek(v45) > 0.0)
    {
      do
      {
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        CGFloat v46 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory tapAndHoldContextNumbers](self, "tapAndHoldContextNumbers", 0LL));
        id v47 = [v46 countByEnumeratingWithState:&v55 objects:v62 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v56;
          do
          {
            for (double i = 0LL; i != v48; double i = (char *)i + 1)
            {
              if (*(void *)v56 != v49) {
                objc_enumerationMutation(v46);
              }
              unsigned int v51 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
              double v52 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
              objc_msgSend( v52,  "postFingerTouchAtPoint:withForce:withContextId:",  objc_msgSend(v51, "unsignedIntValue"),  v7,  v9,  self->_currentTouchForce);
            }

            id v48 = [v46 countByEnumeratingWithState:&v55 objects:v62 count:16];
          }

          while (v48);
        }

        uint64_t v53 = usleep(0x3E8u);
        double v54 = self->_currentTouchForce + 30.0;
        self->_currentTouchForce = v54;
      }

      while (v54 < AXForceTouchThresholdPeek(v53));
    }
  }

  self->_flags.orbMode = 1;
  -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:]( self->_tapHoldTimer,  "dispatchAfterDelay:withObject:",  &__kCFBooleanTrue,  0.0);
}

- (void)_switchToTrackingMode
{
  self->_flags.BOOL tapAndHoldMode = 0;
  self->_flags.orbMode = 0;
  -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
  double v4 = sub_10004AFD4(v3);
  double v6 = v5;
  -[SCRCGestureFactory firstFingerPressure](self->_gestureFactory, "firstFingerPressure");
  double v8 = v7;
  -[VOTEventFactory convertDevicePointToZoomedPoint:](self, "convertDevicePointToZoomedPoint:", v4, v6);
  double v11 = v9;
  double v12 = v10;
  if (self->_isInPreview)
  {
    self->_double previewFingerStartingForce = v8;
    self->_previewFingerLocation.double x = v9;
    self->_previewFingerLocation.int y = v10;
    self->_previewPopDelayTime = CFAbsoluteTimeGetCurrent();
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
    if (v13)
    {
      -[NSMutableArray removeAllObjects](self->_previewFingerContextId, "removeAllObjects");
      id v14 = [v13 windowContextId];
      previewFingerContextId = self->_previewFingerContextId;
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
      -[NSMutableArray addObject:](previewFingerContextId, "addObject:", v16);

      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
      id v18 = [v17 contextIdHostingContextId:v14];

      id v19 = self->_previewFingerContextId;
      __n128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v18));
      -[NSMutableArray addObject:](v19, "addObject:", v20);
    }
  }

  else
  {
    -[VOTEventFactory _liftFromTapAndHoldAndResetFingers:](self, "_liftFromTapAndHoldAndResetFingers:", 0LL);
  }

  double v22 = objc_alloc_init(&OBJC_CLASS___AXIndexMap);
  -[AXIndexMap setObject:forIndex:](v22, "setObject:forIndex:", &__kCFBooleanTrue, 112LL);
  __n128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  kVOTEventCommandTracking,  v22));
  -[VOTEventFactory _updateFirstnessOfTrackingEvent:](self, "_updateFirstnessOfTrackingEvent:", v21);
  objc_msgSend(v21, "setTouchPoint:", v11, v12);
  -[SCRCGestureFactory rawLocation](self->_gestureFactory, "rawLocation");
  objc_msgSend(v21, "setTouchRawLocation:");
  [v21 setTouchForce:v8];
  -[VOTEventFactory processEvent:](self, "processEvent:", v21);
}

- (void)_liftPreviewFinger
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  double v3 = self->_previewFingerContextId;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      double v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)v7);
        CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement", (void)v10));
        objc_msgSend( v9,  "postFingerLiftAtPoint:withContextId:",  objc_msgSend(v8, "unsignedIntValue"),  self->_previewFingerLocation.x,  self->_previewFingerLocation.y);

        double v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_previewFingerContextId, "removeAllObjects");
}

- (BOOL)_shouldDismissPreviewOnLift
{
  return CFAbsoluteTimeGetCurrent() - self->_previewStartTime > 1.0 && !self->_isPreviewPinned;
}

- (void)_updateCurrentElementOrbGestureMode
{
  self->_currentOrbGestureMode = 2LL;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uiElement]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayWithAXAttribute:2063]);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (double i = 0LL; i != v10; double i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          __int128 v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", @"AXSupportedGestureTypeKey", (void)v17));
          id v15 = [v14 integerValue];

          if (v15 == (id)6)
          {
            unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"AXOrbGestureMode"]);
            self->_currentOrbGestureMode = (int)[v16 intValue];

            goto LABEL_12;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

- (double)_edgePanGestureStartThreshold
{
  unint64_t v2 = (unint64_t)-[SCRCGestureFactory orientation](self->_gestureFactory, "orientation");
  double v3 = dbl_100132D50[(v2 & 0xFFFFFFFFFFFFFFFELL) == 2];
  int IsPad = AXDeviceIsPad(v2, v4);
  double result = 0.0199999996;
  if (!IsPad) {
    return v3;
  }
  return result;
}

- (id)votActionForEdgePanGestureState:(unint64_t)a3
{
  unint64_t v3 = a3 - 3;
  if (a3 - 3 <= 6 && ((0x5Fu >> v3) & 1) != 0) {
    id v4 = *(id *)*(&off_100179990 + v3);
  }
  else {
    id v4 = 0LL;
  }
  return v4;
}

- (void)gesturedTextInputManager:(id)a3 moveToElementMatchingRotorType:(int64_t)a4 inDirection:(int64_t)a5
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[VOTEventFactory elementManager](self, "elementManager", a3));
  [v7 moveToElementMatchingRotorType:a4 inDirection:a5];
}

- (void)gesturedTextInputManager:(id)a3 accessCurrentGesturedTextInputElement:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 elementForGesturedTextInput]);

  if (!v6) {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self, "currentElement"));
  }
  v7[2](v7, v6);
}

- (void)brailleGestureManager:(id)a3 setForcedOrientation:(int64_t)a4 shouldAnnounce:(BOOL)a5
{
  BOOL v5 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained handleSetForcedOrientation:a4 shouldAnnounce:v5];
}

- (void)brailleGestureManager:(id)a3 unsetForcedOrientationAndAnnounce:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained handleUnsetForcedOrientationAndAnnounce:v4];
}

- (BOOL)_handleAccessibilityEvent:(id)a3
{
  return 0;
}

- (BOOL)handleVOSGesture:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace userCommandManager]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _commandResolver](self, "_commandResolver"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 eventForTouchGesture:v4 resolver:v6]);

  if (!v7)
  {

LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B749C;
  v12[3] = &unk_100176DA8;
  v12[4] = self;
  id v13 = v7;
  id v8 = v7;
  AXPerformBlockAsynchronouslyOnMainThread(v12, v9);

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)_updateVoiceOverHandGesturesActionCustomizations
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v5 voiceOverHandGesturesActionCustomizations]);
  handGestureCommandDict = self->_handGestureCommandDict;
  self->_handGestureCommandDict = v3;
}

- (BOOL)_handleVoiceOverGreySupportAccessibilityEvent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory _mapAXEventToVOTEvent:](self, "_mapAXEventToVOTEvent:", a3));
  id v5 = v4;
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000B7584;
    v8[3] = &unk_100176DA8;
    v8[4] = self;
    id v9 = v4;
    AXPerformBlockAsynchronouslyOnMainThread(v8, v6);
  }

  return v5 != 0LL;
}

- (id)_mapAXEventToVOTEvent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 accessibilityData]);
  handGestureCommandDict = self->_handGestureCommandDict;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v4 usage]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](handGestureCommandDict, "objectForKeyedSubscript:", v6));

  if (v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent internalEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "internalEventWithCommand:info:",  v7,  0LL));
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (VOTElementManagementProtocol)elementManager
{
  return (VOTElementManagementProtocol *)objc_loadWeakRetained((id *)&self->_elementManager);
}

- (VOTRotorManagementProtocol)rotorManager
{
  return (VOTRotorManagementProtocol *)objc_loadWeakRetained((id *)&self->_rotorManager);
}

- (void)setRotorManager:(id)a3
{
}

- (VOTDirectTouchManagementProtocol)directTouchManager
{
  return (VOTDirectTouchManagementProtocol *)objc_loadWeakRetained((id *)&self->_directTouchManager);
}

- (void)setDirectTouchManager:(id)a3
{
}

- (VOTEventFactoryCallbackProtocol)delegate
{
  return (VOTEventFactoryCallbackProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AXDispatchTimer)_handwritingCaptureTimer
{
  return self->_handwritingCaptureTimer;
}

- (void)_setHandwritingCaptureTimer:(id)a3
{
}

- (VOTDirectInteractionKeyboardManager)directInteractionKeyboardManager
{
  return self->_directInteractionKeyboardManager;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (VOTElement)lastTouchedDirectTouchElement
{
  return self->_lastTouchedDirectTouchElement;
}

- (void)setLastTouchedDirectTouchElement:(id)a3
{
}

- (VOTEvent)lastGestureEvent
{
  return self->_lastGestureEvent;
}

- (void)setLastGestureEvent:(id)a3
{
}

- (AXEventRepresentation)audioAccTapDownEventForRepost
{
  return (AXEventRepresentation *)objc_getProperty(self, a2, 928LL, 1);
}

- (void)setAudioAccTapDownEventForRepost:(id)a3
{
}

- (AXEventRepresentation)audioAccHeldEventForRepost
{
  return (AXEventRepresentation *)objc_getProperty(self, a2, 936LL, 1);
}

- (void)setAudioAccHeldEventForRepost:(id)a3
{
}

- (AXEventRepresentation)audioAccHeldUpEventForRepost
{
  return (AXEventRepresentation *)objc_getProperty(self, a2, 944LL, 1);
}

- (void)setAudioAccHeldUpEventForRepost:(id)a3
{
}

- (AXEventRepresentation)audioAccTapUpEventForRepost
{
  return (AXEventRepresentation *)objc_getProperty(self, a2, 952LL, 1);
}

- (void)setAudioAccTapUpEventForRepost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end