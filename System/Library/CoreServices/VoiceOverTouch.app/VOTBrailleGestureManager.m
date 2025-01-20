@interface VOTBrailleGestureManager
- (AXDispatchTimer)brailleTypingPropertiesAnnouncementTimer;
- (AXDispatchTimer)initialOrientationTimer;
- (AXDispatchTimer)lockScreenDimmingTimer;
- (AXDispatchTimer)logBSIUsageTimer;
- (AXDispatchTimer)speakingDelayTimer;
- (AXDispatchTimer)warningTonesTimer;
- (BOOL)_canUseContractedBraille;
- (BOOL)_handleAdjustTextSegmentTypeEvent:(id)a3;
- (BOOL)_handleAllFingersLifted;
- (BOOL)_handleCarriageReturnSwipe;
- (BOOL)_handleWordBreak:(id)a3 includeSpace:(BOOL)a4;
- (BOOL)_hasContractedBraillePreference;
- (BOOL)_isAdjustTextSegmentEvent:(id)a3;
- (BOOL)_isAdjustTextSegmentTypeEvent:(id)a3;
- (BOOL)_isCalibrationEndPattern:(id)a3;
- (BOOL)_isCalibrationStartPattern:(id)a3;
- (BOOL)_isCarriageReturnSwipeEvent:(id)a3;
- (BOOL)_isNextBrailleUsageEvent:(id)a3;
- (BOOL)_isPreviousBrailleUsageEvent:(id)a3;
- (BOOL)_isSelectEvent:(id)a3;
- (BOOL)_isToggleLockedConfigurationEvent:(id)a3;
- (BOOL)_isTranslateImmediatelyEvent:(id)a3;
- (BOOL)_patternIncludesEveryFinger:(id)a3;
- (BOOL)_requiresCandidateSelection;
- (BOOL)_requiresLaTeXInput;
- (BOOL)_shouldReverseDots;
- (BOOL)_shouldUseContractedBraille;
- (BOOL)_shouldUseEightDotBraille;
- (BOOL)allowsElementMovement;
- (BOOL)didAnnounceBrailleTypingProperties;
- (BOOL)didAnnounceExplorationMode;
- (BOOL)didEnterInvalidGesture;
- (BOOL)didMoveFingersTooFarForInput;
- (BOOL)didStartFullGesture;
- (BOOL)isBackspaceEvent:(id)a3;
- (BOOL)isExploring;
- (BOOL)isNextBrailleTableEvent:(id)a3;
- (BOOL)isNextKeyboardLanguageEvent:(id)a3;
- (BOOL)isNextSuggestionEvent:(id)a3;
- (BOOL)isPreviousSuggestionEvent:(id)a3;
- (BOOL)isReturnKeyEvent:(id)a3;
- (BOOL)isSelectItemEvent:(id)a3;
- (BOOL)isSpaceEvent:(id)a3;
- (BOOL)isSplitting;
- (BOOL)isWordBackspaceEvent:(id)a3;
- (BOOL)overridePrintBrailleWithAllSixDots;
- (BOOL)performCustomBackspace;
- (BOOL)performCustomWordBackspace;
- (BOOL)performNextBrailleTableCommand;
- (BOOL)performNextKeyboardLanguage;
- (BOOL)processEvent:(id)a3;
- (BOOL)processTapWithFingerCount:(unint64_t)a3;
- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4 isCancelTouch:(BOOL)a5;
- (BOOL)shouldAllowRotorEvents;
- (BOOL)shouldBeDeactivatedByEscape;
- (BOOL)shouldUpdateDotPositions;
- (BOOL)usesHapticFeedback;
- (BOOL)usesTypingSoundFeedback;
- (BOOL)wantsToStayActive;
- (BSInvalidatable)disableIdleTimerAssertion;
- (NSArray)calibrationStartTouchPoints;
- (NSDictionary)commands;
- (NSDictionary)lastTouchLocationsByIdentifier;
- (NSString)lastPrintBrailleCharacter;
- (VOTBrailleGestureManager)init;
- (VOTBrailleGestureManagerDelegate)brailleGestureManagerDelegate;
- (VOTTextMovementManager)movementManager;
- (id)_languageCodeForBrailleTable;
- (id)_languageCodeForSpeakingAndBrailleTranslation;
- (id)_languageCodeForSpellChecking;
- (id)_newBrailleInput;
- (id)_outputRequestForText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11;
- (id)_printBrailleForTouchPoints:(id)a3;
- (id)_spokenStringForPrintBraille:(id)a3;
- (id)_spokenStringForPrintBraille:(id)a3 useLongForm:(BOOL)a4;
- (id)_stringWithFirstPart:(id)a3 secondPart:(id)a4;
- (id)_touchLocationsByFilteringOutEdges:(id)a3;
- (id)_touchPointsForCalibrationGivenFirstPoints:(id)a3 lastPoints:(id)a4;
- (id)hintForAppLaunch;
- (id)hintForItemChooser;
- (id)nameSearcherEntriesPassingSearchFrom:(id)a3;
- (id)outputForLatestInput;
- (int64_t)keyboardOrientation;
- (int64_t)typingMode;
- (int64_t)usage;
- (int64_t)valueChangeOriginator;
- (unint64_t)_numberOfDots;
- (unint64_t)mode;
- (unint64_t)translationOverride;
- (void)_announceBrailleTypingPropertiesIncludingOrientation:(BOOL)a3 typingMode:(BOOL)a4 forUnlockConfiguration:(BOOL)a5;
- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4;
- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4 hint:(id)a5;
- (void)_appendOrientationToAnnouncement:(id)a3;
- (void)_applyCandidateInDirection:(int64_t)a3;
- (void)_applyNextCandidate;
- (void)_applyPreviousCandidate;
- (void)_applySuggestionToElement:(id)a3 direction:(int64_t)a4;
- (void)_beginExploringDotPatterns;
- (void)_calibrateWithTouchPoints:(id)a3;
- (void)_cancelWarningTones;
- (void)_cleanUpTouchesIncludingCalibrationStartPoints:(BOOL)a3;
- (void)_commitBufferedBraille;
- (void)_endExploringDotPatterns;
- (void)_enumerateDotNumbersForPrintBraille:(id)a3 usingBlock:(id)a4;
- (void)_flashInsertedTextIfAllowed:(id)a3;
- (void)_handleCalibrationTimeout;
- (void)_handleFingersOnScreen:(id)a3 didAddOrRemoveFingers:(BOOL)a4;
- (void)_handlePrintBraille:(id)a3;
- (void)_handleTouchPoints:(id)a3;
- (void)_handleTranslateImmediately;
- (void)_inputBrailleFromSeriesOfTouchPoints:(id)a3;
- (void)_inputBrailleFromTouchPoints:(id)a3;
- (void)_insertCurrentSelectedCandidate;
- (void)_insertCurrentSelectedSuggestion:(id)a3;
- (void)_issueCommands:(id)a3;
- (void)_issueSingleCommand:(id)a3;
- (void)_outputChosenCandidate:(id)a3;
- (void)_outputChosenSuggestion:(id)a3;
- (void)_playBonk;
- (void)_playWarningTone;
- (void)_playWarningTones:(unint64_t)a3 completion:(id)a4;
- (void)_scheduleExploringModeIfNeeded;
- (void)_speakPrintBrailleForExploration;
- (void)_speakText:(id)a3 hint:(id)a4;
- (void)_speakText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11;
- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4;
- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5;
- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5 isInsert:(BOOL)a6 isDelete:(BOOL)a7 speakLiterally:(BOOL)a8;
- (void)_typePrintBraille:(id)a3;
- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3;
- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3 forUnlockConfiguration:(BOOL)a4;
- (void)_updateBrailleUI;
- (void)_updateDotNumberCirclesForPrintBraille:(id)a3;
- (void)_updateDotPositions;
- (void)_updateShouldUseContractedBraille;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)applyNextSuggestionToElement:(id)a3;
- (void)applyPreviousSuggestionToElement:(id)a3;
- (void)clearCurrentString;
- (void)dealloc;
- (void)didInputBackspace;
- (void)didInputWordBackspace;
- (void)eventFactoryDidBeginSplitGesture:(id)a3;
- (void)handleBrailleGestureWithLeftPatternDictionary:(id)a3 rightPatternDictionary:(id)a4;
- (void)inputSpaceForElement:(id)a3;
- (void)pressReturnKeyForElement:(id)a3;
- (void)sendCarriageReturnForElement:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 usage:(int64_t)a4;
- (void)setBrailleGestureManagerDelegate:(id)a3;
- (void)setBrailleTypingPropertiesAnnouncementTimer:(id)a3;
- (void)setCalibrationStartTouchPoints:(id)a3;
- (void)setCommands:(id)a3;
- (void)setDidAnnounceBrailleTypingProperties:(BOOL)a3;
- (void)setDidAnnounceExplorationMode:(BOOL)a3;
- (void)setDidEnterInvalidGesture:(BOOL)a3;
- (void)setDidMoveFingersTooFarForInput:(BOOL)a3;
- (void)setDidStartFullGesture:(BOOL)a3;
- (void)setDisableIdleTimerAssertion:(id)a3;
- (void)setExploring:(BOOL)a3;
- (void)setInitialOrientationTimer:(id)a3;
- (void)setKeyboardOrientation:(int64_t)a3;
- (void)setLastPrintBrailleCharacter:(id)a3;
- (void)setLastTouchLocationsByIdentifier:(id)a3;
- (void)setLockScreenDimmingTimer:(id)a3;
- (void)setLogBSIUsageTimer:(id)a3;
- (void)setMovementManager:(id)a3;
- (void)setOverridePrintBrailleWithAllSixDots:(BOOL)a3;
- (void)setShouldUpdateDotPositions:(BOOL)a3;
- (void)setSpeakingDelayTimer:(id)a3;
- (void)setSplitting:(BOOL)a3;
- (void)setTranslationOverride:(unint64_t)a3;
- (void)setTypingMode:(int64_t)a3;
- (void)setUsage:(int64_t)a3;
- (void)setUsesHapticFeedback:(BOOL)a3;
- (void)setUsesTypingSoundFeedback:(BOOL)a3;
- (void)setWarningTonesTimer:(id)a3;
- (void)updateWithString:(id)a3;
@end

@implementation VOTBrailleGestureManager

- (VOTBrailleGestureManager)init
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
  v2 = -[VOTGesturedTextInputManager init](&v38, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___VOTBrailleGestureTranslator);
    gestureTranslator = v2->_gestureTranslator;
    v2->_gestureTranslator = v3;

    -[VOTBrailleGestureTranslator setDelegate:](v2->_gestureTranslator, "setDelegate:", v2);
    v5 = objc_alloc_init(&OBJC_CLASS___VOTBrailleGestureSpellingSuggestionHandler);
    spellingSuggestionHandler = v2->_spellingSuggestionHandler;
    v2->_spellingSuggestionHandler = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___VOTBrailleGestureCandidateManager);
    candidateManager = v2->_candidateManager;
    v2->_candidateManager = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___BKSAccelerometer);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v9;

    -[BKSAccelerometer setDelegate:](v2->_accelerometer, "setDelegate:", v2);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    allTouchLocationsByIdentifier = v2->_allTouchLocationsByIdentifier;
    v2->_allTouchLocationsByIdentifier = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    firstTouchLocationsByIdentifier = v2->_firstTouchLocationsByIdentifier;
    v2->_firstTouchLocationsByIdentifier = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___AXDispatchTimer);
    logBSIUsageTimer = v2->_logBSIUsageTimer;
    v2->_logBSIUsageTimer = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___AXDispatchTimer);
    initialOrientationTimer = v2->_initialOrientationTimer;
    v2->_initialOrientationTimer = v17;

    v19 = -[VOTTextMovementManager initWithSegments:]( objc_alloc(&OBJC_CLASS___VOTTextMovementManager),  "initWithSegments:",  &off_100189000);
    movementManager = v2->_movementManager;
    v2->_movementManager = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 pathForResource:@"VOTBrailleGestureCommands" ofType:@"plist"]);

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v22));
    commands = v2->_commands;
    v2->_commands = (NSDictionary *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v2->_usesTypingSoundFeedback = [v25 voiceOverTouchBrailleGesturesUsesTypingSoundFeedback];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v2->_usesHapticFeedback = [v26 voiceOverTouchBrailleGesturesUsesHapticFeedback];

    objc_initWeak(&location, v2);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000D56B4;
    v35[3] = &unk_100176F08;
    objc_copyWeak(&v36, &location);
    [v27 registerUpdateBlock:v35 forRetrieveSelector:"voiceOverTouchBrailleShouldReverseDots" withListener:v2];

    objc_destroyWeak(&v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000D56E0;
    v33[3] = &unk_100176F08;
    objc_copyWeak(&v34, &location);
    [v28 registerUpdateBlock:v33 forRetrieveSelector:"voiceOverTouchBrailleGesturesUsesTypingSoundFeedback" withListener:v2];

    objc_destroyWeak(&v34);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1000D573C;
    v31[3] = &unk_100176F08;
    objc_copyWeak(&v32, &location);
    [v29 registerUpdateBlock:v31 forRetrieveSelector:"voiceOverTouchBrailleGesturesUsesHapticFeedback" withListener:v2];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
  -[VOTBrailleGestureManager dealloc](&v3, "dealloc");
}

- (void)setActive:(BOOL)a3
{
}

- (void)setActive:(BOOL)a3 usage:(int64_t)a4
{
  BOOL v5 = a3;
  unsigned int v7 = -[VOTGesturedTextInputManager isActive](self, "isActive");
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
  -[VOTGesturedTextInputManager setActive:](&v38, "setActive:", v5);
  -[VOTBrailleGestureTranslator setActive:](self->_gestureTranslator, "setActive:", v5);
  int64_t v8 = -[VOTBrailleGestureManager usage](self, "usage");
  if (v5 && (v7 & 1) == 0)
  {
    self->_usage = a4;
    -[VOTBrailleGestureManager setDidStartFullGesture:](self, "setDidStartFullGesture:", 0LL);
    -[VOTBrailleGestureManager setDidAnnounceBrailleTypingProperties:]( self,  "setDidAnnounceBrailleTypingProperties:",  0LL);
    -[BKSAccelerometer setPassiveOrientationEvents:](self->_accelerometer, "setPassiveOrientationEvents:", 0LL);
    -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 1LL);
    -[VOTBrailleGestureManager _updateShouldUseContractedBraille](self, "_updateShouldUseContractedBraille");
    -[VOTBrailleGestureManager _updateBrailleTypingPropertiesAndDelayAnnouncement:]( self,  "_updateBrailleTypingPropertiesAndDelayAnnouncement:",  1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
    [v9 setRotationCapabilityEnabled:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    int64_t v11 = -[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator dotNumberPositions](self->_gestureTranslator, "dotNumberPositions"));
    objc_msgSend( v10,  "showBrailleUIWithOrientation:dotPositions:typingMode:",  v11,  v12,  -[VOTBrailleGestureManager typingMode](self, "typingMode"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager disableIdleTimerAssertion](self, "disableIdleTimerAssertion"));
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
      objc_opt_class(self, v15);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v14 acquireAssertionToDisableIdleTimerWithReason:v18]);
      -[VOTBrailleGestureManager setDisableIdleTimerAssertion:](self, "setDisableIdleTimerAssertion:", v19);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lockScreenDimmingTimer](self, "lockScreenDimmingTimer"));

    if (!v20)
    {
      v21 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
      -[VOTBrailleGestureManager setLockScreenDimmingTimer:](self, "setLockScreenDimmingTimer:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lockScreenDimmingTimer](self, "lockScreenDimmingTimer"));
      [v22 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lockScreenDimmingTimer](self, "lockScreenDimmingTimer"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000D5CD0;
    v37[3] = &unk_100176D38;
    v37[4] = self;
    [v23 afterDelay:v37 processBlock:30.0];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager logBSIUsageTimer](self, "logBSIUsageTimer"));
    [v24 afterDelay:&stru_100179E68 processBlock:0 cancelBlock:15.0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager movementManager](self, "movementManager"));
    [v25 setSegment:1];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager initialOrientationTimer](self, "initialOrientationTimer"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1000D5D4C;
    v36[3] = &unk_100176D38;
    v36[4] = self;
    [v26 afterDelay:v36 processBlock:0.1];
    goto LABEL_11;
  }

  if (!v5 && ((v7 ^ 1) & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
    -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v27);

    -[VOTBrailleGestureManager clearCurrentString](self, "clearCurrentString");
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_handleCalibrationTimeout",  0LL);
    -[VOTBrailleGestureManager _cleanUpTouchesIncludingCalibrationStartPoints:]( self,  "_cleanUpTouchesIncludingCalibrationStartPoints:",  1LL);
    -[BKSAccelerometer setPassiveOrientationEvents:](self->_accelerometer, "setPassiveOrientationEvents:", 1LL);
    -[BKSAccelerometer setOrientationEventsEnabled:](self->_accelerometer, "setOrientationEventsEnabled:", 0LL);
    -[VOTBrailleGestureManager _updateBrailleTypingPropertiesAndDelayAnnouncement:]( self,  "_updateBrailleTypingPropertiesAndDelayAnnouncement:",  0LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    [v28 hideBrailleUI];

    -[VOTBrailleGestureSpellingSuggestionHandler clearSpellingSuggestions]( self->_spellingSuggestionHandler,  "clearSpellingSuggestions");
    -[VOTBrailleGestureCandidateManager deactivate](self->_candidateManager, "deactivate");
    -[VOTBrailleGestureTranslator savePersistentGestureData](self->_gestureTranslator, "savePersistentGestureData");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
    [v29 setRotationCapabilityEnabled:1];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager disableIdleTimerAssertion](self, "disableIdleTimerAssertion"));
    [v30 invalidate];

    -[VOTBrailleGestureManager setDisableIdleTimerAssertion:](self, "setDisableIdleTimerAssertion:", 0LL);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lockScreenDimmingTimer](self, "lockScreenDimmingTimer"));
    [v31 cancel];

    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager logBSIUsageTimer](self, "logBSIUsageTimer"));
    [v32 cancel];

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager initialOrientationTimer](self, "initialOrientationTimer"));
    [v33 cancel];

    id v34 = sub_10004A988(off_1001AC148, @"stopping.bsi", 0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BSIDidDisable](&OBJC_CLASS___VOSOutputEvent, "BSIDidDisable"));
    -[VOTBrailleGestureManager _announceRespectingSoundSettingsRequest:event:]( self,  "_announceRespectingSoundSettingsRequest:event:",  v26,  v35);

LABEL_11:
    return;
  }

  if (v5 && v8 != a4) {
    -[VOTBrailleGestureManager setUsage:](self, "setUsage:", a4);
  }
}

- (BOOL)wantsToStayActive
{
  return 0;
}

- (BOOL)allowsElementMovement
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElement]);
  [v3 updateGesturedTextInputAttributes];
  if (-[VOTGesturedTextInputManager isActive](self, "isActive") && !-[VOTBrailleGestureManager usage](self, "usage"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 gesturedTextInputAttributes]);
    unsigned int v4 = [v5 acceptsRawInput] ^ 1;
  }

  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)shouldBeDeactivatedByEscape
{
  return !-[VOTGesturedTextInputManager isActive](self, "isActive")
      || -[VOTBrailleGestureManager usage](self, "usage") == 0;
}

- (void)setUsage:(int64_t)a3
{
}

- (void)clearCurrentString
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
  -[VOTGesturedTextInputManager clearCurrentString](&v3, "clearCurrentString");
  -[VOTBrailleGestureTranslator clearBrailleBuffer](self->_gestureTranslator, "clearBrailleBuffer");
}

- (BOOL)processEvent:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _isNextBrailleUsageEvent:](self, "_isNextBrailleUsageEvent:", v4))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000D621C;
    v23[3] = &unk_100176D38;
    v23[4] = self;
    BOOL v5 = v23;
LABEL_7:
    AXPerformBlockOnMainThread(v5);
LABEL_8:
    BOOL v6 = 1;
    goto LABEL_9;
  }

  if (-[VOTBrailleGestureManager _isPreviousBrailleUsageEvent:](self, "_isPreviousBrailleUsageEvent:", v4))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000D6228;
    v22[3] = &unk_100176D38;
    v22[4] = self;
    BOOL v5 = v22;
    goto LABEL_7;
  }

  if (-[VOTBrailleGestureManager _isTranslateImmediatelyEvent:](self, "_isTranslateImmediatelyEvent:", v4))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000D6234;
    v21[3] = &unk_100176D38;
    v21[4] = self;
    BOOL v5 = v21;
    goto LABEL_7;
  }

  if (-[VOTBrailleGestureManager _isCarriageReturnSwipeEvent:](self, "_isCarriageReturnSwipeEvent:", v4))
  {
    if (-[VOTBrailleGestureManager _handleCarriageReturnSwipe](self, "_handleCarriageReturnSwipe")) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }

  if (-[VOTBrailleGestureManager _isToggleLockedConfigurationEvent:](self, "_isToggleLockedConfigurationEvent:", v4))
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    if ([v8 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration])
    {
      [v8 setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:0];
      -[VOTBrailleGestureManager _updateBrailleTypingPropertiesAndDelayAnnouncement:forUnlockConfiguration:]( self,  "_updateBrailleTypingPropertiesAndDelayAnnouncement:forUnlockConfiguration:",  0LL,  1LL);
      -[VOTBrailleGestureManager _updateBrailleUI](self, "_updateBrailleUI");
    }

    else
    {
      id v17 = sub_10004A988(off_1001AC148, @"braille.locked.configuration", 0LL);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:](self, "_speakText:useKeyboardLanguage:", v18, 0LL);

      objc_msgSend( v8,  "setVoiceOverTouchBrailleGesturesLockedOrientation:",  -[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"));
      objc_msgSend( v8,  "setVoiceOverTouchBrailleGesturesLockedTypingMode:",  -[VOTBrailleGestureManager typingMode](self, "typingMode"));
      [v8 setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:1];
    }

    goto LABEL_8;
  }

  BOOL v9 = -[VOTBrailleGestureManager _isAdjustTextSegmentEvent:](self, "_isAdjustTextSegmentEvent:", v4);
  if (v9 || (BOOL v9 = -[VOTBrailleGestureManager _isSelectEvent:](self, "_isSelectEvent:", v4)))
  {
    uint64_t v11 = VOTLogEvent(v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager movementManager](self, "movementManager"));
      *(_DWORD *)buf = 138412546;
      v25 = v13;
      __int16 v26 = 1024;
      unsigned int v27 = [v14 segment];
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Passing up %@ event with segment:%d.",  buf,  0x12u);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager movementManager](self, "movementManager"));
    Class v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v15 segment]));
    [v4 setObject:v16 forIndex:118];

    -[VOTBrailleGestureManager setSplitting:](self, "setSplitting:", 1LL);
    -[VOTBrailleGestureManager _endExploringDotPatterns](self, "_endExploringDotPatterns");
    goto LABEL_21;
  }

  if (!-[VOTBrailleGestureManager _isAdjustTextSegmentTypeEvent:](self, "_isAdjustTextSegmentTypeEvent:", v4)
    || (v19 = -[VOTBrailleGestureManager _handleAdjustTextSegmentTypeEvent:]( self,  "_handleAdjustTextSegmentTypeEvent:",  v4),  BOOL v6 = 1,  -[VOTBrailleGestureManager setSplitting:](self, "setSplitting:", 1LL),  -[VOTBrailleGestureManager _endExploringDotPatterns](self, "_endExploringDotPatterns"),  (v19 & 1) == 0))
  {
LABEL_21:
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
    BOOL v6 = -[VOTGesturedTextInputManager processEvent:](&v20, "processEvent:", v4);
  }

- (BOOL)processTapWithFingerCount:(unint64_t)a3
{
  return 1;
}

- (BOOL)processTouchLocations:(id)a3 isFirstTouch:(BOOL)a4 isCancelTouch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!-[VOTBrailleGestureManager typingMode](self, "typingMode"))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _touchLocationsByFilteringOutEdges:]( self,  "_touchLocationsByFilteringOutEdges:",  v8));

    id v8 = (id)v9;
  }

  [v8 count];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lastTouchLocationsByIdentifier](self, "lastTouchLocationsByIdentifier"));
  [v10 count];

  if (![v8 count])
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lastTouchLocationsByIdentifier](self, "lastTouchLocationsByIdentifier"));
    id v12 = [v11 count];

    if (!v12) {
      goto LABEL_13;
    }
  }

  if (!v6 && !-[VOTBrailleGestureManager didStartFullGesture](self, "didStartFullGesture")) {
    goto LABEL_13;
  }
  id v13 = [v8 count];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lastTouchLocationsByIdentifier](self, "lastTouchLocationsByIdentifier"));
  id v15 = [v14 count];

  -[VOTBrailleGestureManager setLastTouchLocationsByIdentifier:](self, "setLastTouchLocationsByIdentifier:", v8);
  if ([v8 count] || v13 == v15)
  {
    if (v6)
    {
      -[VOTBrailleGestureManager setDidStartFullGesture:](self, "setDidStartFullGesture:", 1LL);
      -[VOTBrailleGestureManager setShouldUpdateDotPositions:](self, "setShouldUpdateDotPositions:", 1LL);
    }

    -[VOTBrailleGestureManager _handleFingersOnScreen:didAddOrRemoveFingers:]( self,  "_handleFingersOnScreen:didAddOrRemoveFingers:",  v8,  v13 != v15);
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }

  -[VOTBrailleGestureManager setOverridePrintBrailleWithAllSixDots:]( self,  "setOverridePrintBrailleWithAllSixDots:",  v5 & ~AXDeviceSupportsManyTouches());
  BOOL v16 = -[VOTBrailleGestureManager _handleAllFingersLifted](self, "_handleAllFingersLifted");
LABEL_14:

  return v16;
}

- (id)_touchLocationsByFilteringOutEdges:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v21));
        objc_msgSend(v12, "ax_CGPointValue");
        double v14 = v13;
        double v16 = v15;

        double v17 = v14 / sub_10004B1F8(-[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"));
        if (v17 > 0.05 && v17 < 0.95)
        {
          double v17 = v16 / v18;
          if (v16 / v18 > 0.05 && v17 < 0.95)
          {
            unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, v11);
          }
        }
      }

      id v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v17);
    }

    while (v8);
  }

  return v5;
}

- (void)setTypingMode:(int64_t)a3
{
  if (self->_typingMode != a3)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
    -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v5);

    self->_typingMode = a3;
  }

- (void)inputSpaceForElement:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _requiresCandidateSelection](self, "_requiresCandidateSelection"))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
    if ([v5 length])
    {
      -[VOTBrailleGestureManager _applyNextCandidate](self, "_applyNextCandidate");
LABEL_9:

      goto LABEL_14;
    }
  }

  if (-[VOTBrailleGestureManager _requiresLaTeXInput](self, "_requiresLaTeXInput"))
  {
    id v5 = [[BRLTBrailleChar alloc] initWithBits:0];
    gestureTranslator = self->_gestureTranslator;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 unicode]);
    -[VOTBrailleGestureTranslator addPrintBrailleToBuffer:language:]( gestureTranslator,  "addPrintBrailleToBuffer:language:",  v7,  0LL);

    -[VOTBrailleGestureTranslator didInputSpace](self->_gestureTranslator, "didInputSpace");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unint64_t v9 = (unint64_t)[v8 voiceOverBrailleGesturesTypingFeedback];

    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
      unsigned __int8 v11 = [v10 shouldPlayKeyboardSecureClickSound];

      if ((v11 & 1) == 0)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
        double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 selectedLanguage]);
        id v14 = sub_10004B314(32LL, @"UnicodeHex.", @"VOTOutputPunctuation", v13);
        double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:](self, "_speakText:useKeyboardLanguage:", v15, 0LL);
      }
    }

    goto LABEL_9;
  }

  if (!-[VOTBrailleGestureManager _handleWordBreak:includeSpace:](self, "_handleWordBreak:includeSpace:", v4, 1LL))
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
    -[VOTGesturedTextInputManager inputSpaceForElement:](&v18, "inputSpaceForElement:", v4);
  }

  -[VOTBrailleGestureManager clearCurrentString](self, "clearCurrentString");
  -[VOTBrailleGestureTranslator didInputSpace](self->_gestureTranslator, "didInputSpace");
  -[VOTBrailleGestureSpellingSuggestionHandler clearSpellingSuggestions]( self->_spellingSuggestionHandler,  "clearSpellingSuggestions");
  if (-[VOTBrailleGestureManager usesTypingSoundFeedback](self, "usesTypingSoundFeedback"))
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BSIDidEnterSpace](&OBJC_CLASS___VOSOutputEvent, "BSIDidEnterSpace"));
    [v16 sendEvent:v17];
  }

- (void)pressReturnKeyForElement:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _requiresCandidateSelection](self, "_requiresCandidateSelection"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
    if ([v5 length])
    {
      -[VOTBrailleGestureManager _handleWordBreak:includeSpace:](self, "_handleWordBreak:includeSpace:", v4, 0LL);
      -[VOTBrailleGestureManager clearCurrentString](self, "clearCurrentString");
      -[VOTBrailleGestureCandidateManager deactivate](self->_candidateManager, "deactivate");

      goto LABEL_11;
    }
  }

  if (-[VOTBrailleGestureManager _requiresLaTeXInput](self, "_requiresLaTeXInput"))
  {
    -[VOTBrailleGestureTranslator addPrintBrailleToBuffer:language:]( self->_gestureTranslator,  "addPrintBrailleToBuffer:language:",  @"\n",  0LL);
    -[VOTBrailleGestureTranslator didPressReturnKey](self->_gestureTranslator, "didPressReturnKey");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unint64_t v7 = (unint64_t)[v6 voiceOverBrailleGesturesTypingFeedback];

    if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
      unsigned __int8 v9 = [v8 shouldPlayKeyboardSecureClickSound];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 selectedLanguage]);
        id v12 = sub_10004B314(10LL, @"UnicodeHex.", @"VOTOutputPunctuation", v11);
        double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

        -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:](self, "_speakText:useKeyboardLanguage:", v13, 0LL);
      }
    }
  }

  else
  {
    -[VOTBrailleGestureManager _handleWordBreak:includeSpace:](self, "_handleWordBreak:includeSpace:", v4, 0LL);
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
    -[VOTGesturedTextInputManager pressReturnKeyForElement:](&v16, "pressReturnKeyForElement:", v4);
    -[VOTBrailleGestureTranslator didPressReturnKey](self->_gestureTranslator, "didPressReturnKey");
    -[VOTBrailleGestureSpellingSuggestionHandler clearSpellingSuggestions]( self->_spellingSuggestionHandler,  "clearSpellingSuggestions");
    if (-[VOTBrailleGestureManager usesTypingSoundFeedback](self, "usesTypingSoundFeedback"))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BSIDidCarriageReturn](&OBJC_CLASS___VOSOutputEvent, "BSIDidCarriageReturn"));
      [v14 sendEvent:v15];
    }
  }

- (void)sendCarriageReturnForElement:(id)a3
{
  id v4 = a3;
  -[VOTBrailleGestureManager _handleWordBreak:includeSpace:](self, "_handleWordBreak:includeSpace:", v4, 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
  -[VOTGesturedTextInputManager sendCarriageReturnForElement:](&v5, "sendCarriageReturnForElement:", v4);

  -[VOTBrailleGestureTranslator didPressReturnKey](self->_gestureTranslator, "didPressReturnKey");
  -[VOTBrailleGestureSpellingSuggestionHandler clearSpellingSuggestions]( self->_spellingSuggestionHandler,  "clearSpellingSuggestions");
  -[VOTBrailleGestureCandidateManager deactivate](self->_candidateManager, "deactivate");
}

- (BOOL)_handleWordBreak:(id)a3 includeSpace:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[VOTBrailleGestureCandidateManager isActive](self->_candidateManager, "isActive"))
  {
    -[VOTBrailleGestureManager _insertCurrentSelectedCandidate](self, "_insertCurrentSelectedCandidate");
  }

  else
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureSpellingSuggestionHandler currentSpellingSuggestion]( self->_spellingSuggestionHandler,  "currentSpellingSuggestion"));

    if (v7)
    {
      -[VOTBrailleGestureManager _insertCurrentSelectedSuggestion:](self, "_insertCurrentSelectedSuggestion:", v6);
    }

    else
    {
      if (!-[VOTBrailleGestureManager _shouldUseContractedBraille](self, "_shouldUseContractedBraille")
        && !-[VOTBrailleGestureManager _requiresCandidateSelection](self, "_requiresCandidateSelection"))
      {
        BOOL v12 = 0;
        goto LABEL_14;
      }

      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
      unsigned __int8 v9 = &stru_10017A920;
      if (v8) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = &stru_10017A920;
      }
      if (v4) {
        unsigned __int8 v9 = @" ";
      }
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v10, v9));
      -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v11);
    }
  }

  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (void)updateWithString:(id)a3
{
  id v4 = a3;
  uint64_t v6 = VOTLogBrailleGestures(v4, v5);
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000F58B0();
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTBrailleGestureManager;
  -[VOTGesturedTextInputManager updateWithString:](&v8, "updateWithString:", v4);
}

- (BOOL)_shouldReverseDots
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 voiceOverTouchBrailleShouldReverseDots];

  return v3;
}

- (BOOL)_handleAdjustTextSegmentTypeEvent:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned int v5 = [v4 isEqualToString:kVOTEventCommandNextTextSegmentType];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager movementManager](self, "movementManager"));
  unint64_t v7 = v6;
  if (v5) {
    [v6 nextSegment];
  }
  else {
    [v6 previousSegment];
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager movementManager](self, "movementManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedSegmentName]);

  id v11 = sub_10000BBB0(v10, 0, v8);
  return 1;
}

- (unint64_t)mode
{
  if (-[VOTBrailleGestureManager translationOverride](self, "translationOverride")) {
    return -[VOTBrailleGestureManager translationOverride](self, "translationOverride");
  }
  else {
    return BRLTModeForFlags( -[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille"),  -[VOTBrailleGestureManager _shouldUseContractedBraille](self, "_shouldUseContractedBraille"),  -[VOTBrailleGestureManager _requiresLaTeXInput](self, "_requiresLaTeXInput"));
  }
}

- (BOOL)isReturnKeyEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputPerformReturnEquivalent];

  return v4;
}

- (BOOL)isSpaceEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputInsertSpace];

  return v4;
}

- (BOOL)isBackspaceEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputBackspace];

  return v4;
}

- (BOOL)isWordBackspaceEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputDeleteWord];

  return v4;
}

- (BOOL)isNextSuggestionEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextSuggestion];

  return v4;
}

- (BOOL)isPreviousSuggestionEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputPreviousSuggestion];

  return v4;
}

- (BOOL)isSelectItemEvent:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager isReturnKeyEvent:](self, "isReturnKeyEvent:", v4))
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 command]);
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandGesturedTextInputLaunchApp];
  }

  return v5;
}

- (BOOL)isNextKeyboardLanguageEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextKeyboardLanguage];

  return v4;
}

- (BOOL)performNextKeyboardLanguage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  [v2 performNextLanguageButtonPress];

  return 1;
}

- (BOOL)isNextBrailleTableEvent:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandGesturedTextInputNextBrailleTable];

  return v4;
}

- (BOOL)performNextBrailleTableCommand
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace brailleLanguageRotorItems]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &stru_100179E88));

  if ((unint64_t)[v4 count] > 1)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleGesturesInputTable]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

    if ([v4 count])
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v7]);
        uint64_t v9 = VOSBrailleTableForRotorItem(v8);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

        LOBYTE(v8) = [v6 isEqual:v11];
        if ((v8 & 1) != 0) {
          break;
        }
      }
    }

    else
    {
LABEL_7:
      uint64_t v7 = 0LL;
    }

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", (v7 + 1) % (unint64_t)objc_msgSend(v4, "count")));
    uint64_t v13 = VOSBrailleTableForRotorItem(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    unsigned int v15 = -[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille");
    objc_super v16 = objc_alloc(&OBJC_CLASS___BRLTTable);
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    objc_super v18 = -[BRLTTable initWithIdentifier:](v16, "initWithIdentifier:", v17);
    [(id)VOTSharedWorkspace setSelectedBrailleGesturesInputTable:v18];

    BOOL v19 = -[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille");
    if (v15 != v19)
    {
      BOOL v20 = v19;
      _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Toggled contractions, which toggled eight dot braille. Updating UI.");
      gestureTranslator = self->_gestureTranslator;
      int64_t v22 = -[VOTBrailleGestureManager typingMode](self, "typingMode");
      double v23 = sub_10004B1F8(-[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"));
      -[VOTBrailleGestureTranslator setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:]( gestureTranslator,  "setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:",  v22,  v20,  -[VOTBrailleGestureManager _shouldReverseDots](self, "_shouldReverseDots"),  v23,  v24);
      -[VOTBrailleGestureManager _updateBrailleUI](self, "_updateBrailleUI");
    }

    id v25 = +[VOTOutputRequest createRequest](&OBJC_CLASS___VOTOutputRequest, "createRequest");
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 nameForSpokenAnnouncementOfBrailleTable:v14]);
    id v28 = [v25 addString:v27];

    [v25 setCannotBeInterrupted:1];
    [v25 send];
  }

  else
  {
    -[VOTBrailleGestureManager _playBonk](self, "_playBonk");
  }

  return 1;
}

- (void)_commitBufferedBraille
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
  -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v3);

  -[VOTBrailleGestureManager clearCurrentString](self, "clearCurrentString");
  -[VOTBrailleGestureSpellingSuggestionHandler clearSpellingSuggestions]( self->_spellingSuggestionHandler,  "clearSpellingSuggestions");
  -[VOTBrailleGestureCandidateManager deactivate](self->_candidateManager, "deactivate");
}

- (void)_insertCurrentSelectedSuggestion:(id)a3
{
  spellingSuggestionHandler = self->_spellingSuggestionHandler;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForSpellChecking](self, "_languageCodeForSpellChecking"));
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureSpellingSuggestionHandler applySpellingSuggestionForResponder:languageCode:]( spellingSuggestionHandler,  "applySpellingSuggestionForResponder:languageCode:",  v5,  v6));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
  LODWORD(v5) = [v7 shouldEchoCharacter];

  if ((_DWORD)v5)
  {
    LOWORD(v8) = 0;
    -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:]( self,  "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:",  v9,  0LL,  1LL,  0LL,  1LL,  0LL,  v8,  0LL);
  }

  -[VOTBrailleGestureSpellingSuggestionHandler clearSpellingSuggestions]( self->_spellingSuggestionHandler,  "clearSpellingSuggestions");
}

- (void)_outputChosenSuggestion:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
    unsigned int v5 = [v4 shouldEchoCharacter];

    if (v5)
    {
      LOWORD(v6) = 0;
      -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:]( self,  "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:",  v7,  0LL,  1LL,  0LL,  0LL,  1LL,  v6,  0LL);
    }
  }

  else
  {
    -[VOTBrailleGestureManager _playBonk](self, "_playBonk");
  }

  -[VOTBrailleGestureManager _flashInsertedTextIfAllowed:](self, "_flashInsertedTextIfAllowed:", v7);
}

- (void)_applySuggestionToElement:(id)a3 direction:(int64_t)a4
{
  gestureTranslator = self->_gestureTranslator;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
  uint64_t v10 = VOTLogBrailleGestures(v8, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    BOOL v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Translate existing input: %@",  (uint8_t *)&v19,  0xCu);
  }

  -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v8);
  spellingSuggestionHandler = self->_spellingSuggestionHandler;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForSpellChecking](self, "_languageCodeForSpellChecking"));
  -[VOTBrailleGestureSpellingSuggestionHandler selectNextSpellingSuggestionInDirection:responder:languageCode:]( spellingSuggestionHandler,  "selectNextSpellingSuggestionInDirection:responder:languageCode:",  a4,  v7,  v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureSpellingSuggestionHandler currentSpellingSuggestion]( self->_spellingSuggestionHandler,  "currentSpellingSuggestion"));
  id v15 = -[VOTBrailleGestureManager _outputChosenSuggestion:](self, "_outputChosenSuggestion:", v14);
  uint64_t v17 = VOTLogBrailleGestures(v15, v16);
  objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    BOOL v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Spelling suggestion suggested: %@",  (uint8_t *)&v19,  0xCu);
  }
}

- (void)applyNextSuggestionToElement:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _requiresCandidateSelection](self, "_requiresCandidateSelection")) {
    -[VOTBrailleGestureManager _applyNextCandidate](self, "_applyNextCandidate");
  }
  else {
    -[VOTBrailleGestureManager _applySuggestionToElement:direction:]( self,  "_applySuggestionToElement:direction:",  v4,  1LL);
  }
}

- (void)applyPreviousSuggestionToElement:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _requiresCandidateSelection](self, "_requiresCandidateSelection")) {
    -[VOTBrailleGestureManager _applyPreviousCandidate](self, "_applyPreviousCandidate");
  }
  else {
    -[VOTBrailleGestureManager _applySuggestionToElement:direction:]( self,  "_applySuggestionToElement:direction:",  v4,  2LL);
  }
}

- (BOOL)performCustomBackspace
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator popLastBrailleCellFromBuffer]( self->_gestureTranslator,  "popLastBrailleCellFromBuffer"));
  if (!v3)
  {
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }

  if ((!-[VOTBrailleGestureManager _canUseContractedBraille](self, "_canUseContractedBraille")
     || !-[VOTBrailleGestureManager _shouldUseContractedBraille](self, "_shouldUseContractedBraille"))
    && !-[VOTBrailleGestureManager _requiresLaTeXInput](self, "_requiresLaTeXInput"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
    if (!v6) {
      goto LABEL_12;
    }
    -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v6);
    goto LABEL_10;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
  unsigned int v5 = [v4 shouldEchoCharacter];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _spokenStringForPrintBraille:useLongForm:]( self,  "_spokenStringForPrintBraille:useLongForm:",  v3,  1LL));
    -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:]( self,  "_speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:",  v6,  0LL,  0LL,  0LL,  1LL,  0LL);
LABEL_10:
  }

  -[VOTBrailleGestureSpellingSuggestionHandler clearSpellingSuggestions]( self->_spellingSuggestionHandler,  "clearSpellingSuggestions");
  -[VOTBrailleGestureCandidateManager deactivate](self->_candidateManager, "deactivate");
  -[VOTBrailleGestureManager _updateBrailleUI](self, "_updateBrailleUI");
  LOBYTE(v6) = 1;
LABEL_12:
  if (-[VOTBrailleGestureManager usesTypingSoundFeedback](self, "usesTypingSoundFeedback"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BSIDidDelete](&OBJC_CLASS___VOSOutputEvent, "BSIDidDelete"));
    [v7 sendEvent:v8];
  }

  return (char)v6;
}

- (BOOL)performCustomWordBackspace
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translatedTextOfBufferWithMode:]( self->_gestureTranslator,  "translatedTextOfBufferWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
  id v4 = [v3 length];
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
    unsigned int v6 = [v5 shouldEchoCharacter];

    if (v6) {
      -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:]( self,  "_speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:",  v3,  0LL,  0LL,  0LL,  1LL,  0LL);
    }
    -[VOTBrailleGestureTranslator clearBrailleBuffer](self->_gestureTranslator, "clearBrailleBuffer");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
    [v7 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:&stru_100179EC8];
  }

  return v4 != 0LL;
}

- (void)didInputBackspace
{
}

- (void)didInputWordBackspace
{
}

- (BOOL)shouldAllowRotorEvents
{
  return ((unint64_t)-[NSMutableDictionary count](self->_allTouchLocationsByIdentifier, "count") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)hintForAppLaunch
{
  return sub_10004A988(off_1001AC148, @"braille.launch.app.hint", 0LL);
}

- (id)hintForItemChooser
{
  return sub_10004A988(off_1001AC148, @"braille.choose.item.hint", 0LL);
}

- (void)eventFactoryDidBeginSplitGesture:(id)a3
{
  uint64_t v3 = VOTLogEvent(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000F5910(v4);
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent AutofillDidAppear](&OBJC_CLASS___VOSOutputEvent, "AutofillDidAppear"));
  [v5 sendEvent:v6];
}

- (id)outputForLatestInput
{
  return -[VOTBrailleGestureTranslator outputForLatestInput](self->_gestureTranslator, "outputForLatestInput");
}

- (BOOL)_shouldUseEightDotBraille
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleGesturesInputTable]);
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)_numberOfDots
{
  if (-[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille")) {
    return 8LL;
  }
  else {
    return 6LL;
  }
}

- (void)_appendOrientationToAnnouncement:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  unsigned int v6 = [v5 hintsEnabled];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000D7F38;
  v21[3] = &unk_100178128;
  id v7 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  id v22 = v7;
  uint64_t v8 = objc_retainBlock(v21);
  switch(-[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"))
  {
    case 1LL:
      uint64_t v9 = off_1001AC148;
      uint64_t v10 = @"rotate.portrait";
      goto LABEL_13;
    case 2LL:
      uint64_t v9 = off_1001AC148;
      uint64_t v10 = @"rotate.portrait.upsidedown";
LABEL_13:
      id v19 = sub_10004AE68(v9, v10, 0LL, v7);
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v19);
      goto LABEL_14;
    case 3LL:
      id v11 = sub_10004AE68(off_1001AC148, @"rotate.landscape.left", 0LL, v7);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v4 appendStringWithComma:v12];

      if (!v6) {
        goto LABEL_15;
      }
      BOOL v13 = -[VOTBrailleGestureManager typingMode](self, "typingMode") == 0;
      break;
    case 4LL:
      id v14 = sub_10004AE68(off_1001AC148, @"rotate.landscape.right", 0LL, v7);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v4 appendStringWithComma:v15];

      if (!v6) {
        goto LABEL_15;
      }
      BOOL v13 = (id)-[VOTBrailleGestureManager typingMode](self, "typingMode") == (id)1;
      break;
    default:
      _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Unhandled orientation for Braille Gestures typing properties announcement");
      goto LABEL_15;
  }

  uint64_t v16 = v13;
  uint64_t v17 = ((uint64_t (*)(void *, uint64_t))v8[2])(v8, v16);
  uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
LABEL_14:
  BOOL v20 = (void *)v18;
  [v4 appendStringWithComma:v18];

LABEL_15:
}

- (void)_announceBrailleTypingPropertiesIncludingOrientation:(BOOL)a3 typingMode:(BOOL)a4 forUnlockConfiguration:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v11 = [v10 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration];

  if ((v11 & 1) == 0 && !v5)
  {
    if (!v7) {
      goto LABEL_4;
    }
LABEL_16:
    -[VOTBrailleGestureManager _appendOrientationToAnnouncement:](self, "_appendOrientationToAnnouncement:", v24);
    if (v6) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }

  if (v11) {
    id v19 = @"braille.locked.configuration";
  }
  else {
    id v19 = @"braille.unlocked.configuration";
  }
  id v20 = sub_10004AE68(off_1001AC148, v19, 0LL, v9);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v24 appendStringWithComma:v21];

  if (v7) {
    goto LABEL_16;
  }
LABEL_4:
  if (v6)
  {
LABEL_5:
    BOOL v12 = off_1001AC148;
    if (-[VOTBrailleGestureManager typingMode](self, "typingMode")) {
      BOOL v13 = @"braille.table.top";
    }
    else {
      BOOL v13 = @"braille.screen.away";
    }
    id v14 = sub_10004AE68(v12, v13, 0LL, v9);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v24 appendStringWithComma:v15];
  }

- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3
{
}

- (void)_updateBrailleTypingPropertiesAndDelayAnnouncement:(BOOL)a3 forUnlockConfiguration:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager brailleTypingPropertiesAnnouncementTimer]( self,  "brailleTypingPropertiesAnnouncementTimer"));
  [v7 cancel];

  if (!-[VOTGesturedTextInputManager isActive](self, "isActive"))
  {
    -[VOTBrailleGestureManager setKeyboardOrientation:](self, "setKeyboardOrientation:", 0LL);
    id v40 = (id)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager brailleGestureManagerDelegate](self, "brailleGestureManagerDelegate"));
    objc_msgSend( v40,  "brailleGestureManager:unsetForcedOrientationAndAnnounce:",  self,  -[VOTBrailleGestureManager didAnnounceBrailleTypingProperties](self, "didAnnounceBrailleTypingProperties"));

    return;
  }

  int64_t v8 = -[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  int IsPad = AXDeviceIsPad(v9, v10);
  BOOL v39 = v4;
  if (![v9 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration])
  {
    uint64_t v12 = 0LL;
    uint64_t v15 = 4LL;
    goto LABEL_13;
  }

  uint64_t v12 = (uint64_t)[v9 voiceOverTouchBrailleGesturesLockedTypingMode];
  BOOL v13 = (char *)[v9 voiceOverTouchBrailleGesturesLockedOrientation];
  uint64_t v15 = (uint64_t)v13;
  else {
    char v16 = IsPad;
  }
  if ((v16 & 1) == 0)
  {
    uint64_t v19 = VOTLogBrailleGestures(v13, v14);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000F594C(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    [v9 setVoiceOverTouchBrailleGesturesShouldUseLockedConfiguration:0];
LABEL_13:
    id v28 = (char *)[(id)VOTSharedWorkspace deviceOrientation];
    uint64_t v29 = sub_10004B7E8((uint64_t)-[BKSAccelerometer currentDeviceOrientation]( self->_accelerometer,  "currentDeviceOrientation"));
    if (v29 == 5) {
      uint64_t v12 = 1LL;
    }
    if (IsPad)
    {
      if ((unint64_t)(v29 - 1) < 2)
      {
LABEL_18:
        int64_t v17 = v8;
        char v18 = 0;
        uint64_t v15 = v29;
        goto LABEL_26;
      }

      if ((unint64_t)(v28 - 1) < 4)
      {
LABEL_23:
        int64_t v17 = v8;
        char v18 = 0;
        uint64_t v15 = (uint64_t)v28;
        goto LABEL_26;
      }

      if ((unint64_t)(v8 - 1) >= 4)
      {
LABEL_25:
        int64_t v17 = v8;
        char v18 = 0;
        goto LABEL_26;
      }
    }

    else
    {
    }

    uint64_t v15 = v8;
    char v18 = 0;
    int64_t v17 = v15;
    goto LABEL_26;
  }

  int64_t v17 = v8;
  char v18 = 1;
LABEL_26:
  int64_t v30 = -[VOTBrailleGestureManager typingMode](self, "typingMode");
  -[VOTBrailleGestureManager setTypingMode:](self, "setTypingMode:", v12);
  -[VOTBrailleGestureManager setKeyboardOrientation:](self, "setKeyboardOrientation:", v15);
  gestureTranslator = self->_gestureTranslator;
  double v32 = sub_10004B1F8(v15);
  -[VOTBrailleGestureTranslator setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:]( gestureTranslator,  "setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:",  v12,  -[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille"),  -[VOTBrailleGestureManager _shouldReverseDots](self, "_shouldReverseDots"),  v32,  v33);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager brailleGestureManagerDelegate](self, "brailleGestureManagerDelegate"));
  [v34 brailleGestureManager:self setForcedOrientation:v15 shouldAnnounce:0];

  if ((v18 & 1) == 0)
  {
    if (v5)
    {
      if (-[VOTBrailleGestureManager didAnnounceBrailleTypingProperties](self, "didAnnounceBrailleTypingProperties")) {
        *(void *)&double v35 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureManager.m",  1221LL,  "-[VOTBrailleGestureManager _updateBrailleTypingPropertiesAndDelayAnnouncement:forUnlockConfiguration:]",  @"We delayed the announcement of Braille typing properties, but we had already announced them once.  That's weird because we should only be doing this when you first rotor into Braille Gestures.").n128_u64[0];
      }
      id v36 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager brailleTypingPropertiesAnnouncementTimer]( self,  "brailleTypingPropertiesAnnouncementTimer",  v35));

      if (!v36)
      {
        v37 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
        -[VOTBrailleGestureManager setBrailleTypingPropertiesAnnouncementTimer:]( self,  "setBrailleTypingPropertiesAnnouncementTimer:",  v37);
      }

      objc_super v38 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager brailleTypingPropertiesAnnouncementTimer]( self,  "brailleTypingPropertiesAnnouncementTimer"));
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_1000D8574;
      v41[3] = &unk_100177C50;
      v41[4] = self;
      BOOL v42 = v39;
      [v38 afterDelay:v41 processBlock:1.0];
    }

    else
    {
      -[VOTBrailleGestureManager _announceBrailleTypingPropertiesIncludingOrientation:typingMode:forUnlockConfiguration:]( self,  "_announceBrailleTypingPropertiesIncludingOrientation:typingMode:forUnlockConfiguration:",  v17 != v15,  v12 != (v30 != 0),  v39);
    }
  }
}

- (void)_updateShouldUseContractedBraille
{
  if (-[VOTBrailleGestureManager _hasContractedBraillePreference](self, "_hasContractedBraillePreference")) {
    BOOL v3 = -[VOTBrailleGestureManager _canUseContractedBraille](self, "_canUseContractedBraille");
  }
  else {
    BOOL v3 = 0LL;
  }
  -[VOTBrailleGestureTranslator setShouldUseContractedBraille:]( self->_gestureTranslator,  "setShouldUseContractedBraille:",  v3);
}

- (BOOL)_canUseContractedBraille
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
  unsigned __int8 v3 = [v2 acceptsContractedBraille];

  return v3;
}

- (BOOL)_hasContractedBraillePreference
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v3 = [v2 voiceOverTouchBrailleGesturesInputMode] == (id)3;

  return v3;
}

- (BOOL)_shouldUseContractedBraille
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleGesturesInputTable]);
  else {
    BOOL v4 = -[VOTBrailleGestureManager _requiresCandidateSelection](self, "_requiresCandidateSelection");
  }

  return v4;
}

- (BOOL)_requiresLaTeXInput
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000D875C;
  v5[3] = &unk_100177E40;
  v5[4] = &v6;
  [v3 gesturedTextInputManager:v2 accessCurrentGesturedTextInputElement:v5];

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_requiresCandidateSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForSpellChecking](self, "_languageCodeForSpellChecking"));
  unsigned __int8 v3 = [v2 hasPrefix:@"ja"];

  return v3;
}

- (BOOL)_patternIncludesEveryFinger:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille")
    && ([v4 isEqualToString:@"⣿"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }

  else if (-[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille"))
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    unsigned __int8 v5 = [v4 isEqualToString:@"⠿"];
  }

  return v5;
}

- (BOOL)_isCalibrationStartPattern:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _deviceSupportsMoreThanFiveTouches](self, "_deviceSupportsMoreThanFiveTouches")) {
    unsigned __int8 v5 = -[VOTBrailleGestureManager _patternIncludesEveryFinger:](self, "_patternIncludesEveryFinger:", v4);
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"⠸"];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_isCalibrationEndPattern:(id)a3
{
  id v4 = a3;
  if (-[VOTBrailleGestureManager _deviceSupportsMoreThanFiveTouches](self, "_deviceSupportsMoreThanFiveTouches")) {
    unsigned __int8 v5 = -[VOTBrailleGestureManager _patternIncludesEveryFinger:](self, "_patternIncludesEveryFinger:", v4);
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"⠇"];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)_touchPointsForCalibrationGivenFirstPoints:(id)a3 lastPoints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[VOTBrailleGestureManager _deviceSupportsMoreThanFiveTouches](self, "_deviceSupportsMoreThanFiveTouches")) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObjectsFromArray:v7]);
  }
  char v9 = v8;

  return v9;
}

- (void)_beginExploringDotPatterns
{
  if (!-[VOTBrailleGestureManager isSplitting](self, "isSplitting"))
  {
    -[VOTBrailleGestureManager setExploring:](self, "setExploring:", 1LL);
    -[VOTBrailleGestureManager _speakPrintBrailleForExploration](self, "_speakPrintBrailleForExploration");
    if (!-[VOTBrailleGestureManager shouldUpdateDotPositions](self, "shouldUpdateDotPositions"))
    {
      -[VOTBrailleGestureManager setShouldUpdateDotPositions:](self, "setShouldUpdateDotPositions:", 1LL);
      id v3 = (id)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lastPrintBrailleCharacter](self, "lastPrintBrailleCharacter"));
      -[VOTBrailleGestureManager _updateDotNumberCirclesForPrintBraille:]( self,  "_updateDotNumberCirclesForPrintBraille:",  v3);
    }
  }

- (void)_endExploringDotPatterns
{
}

- (id)_stringWithFirstPart:(id)a3 secondPart:(id)a4
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@, %@", a3, a4);
}

- (void)_calibrateWithTouchPoints:(id)a3
{
  id v4 = sub_10004A988(off_1001AC148, @"braille.calibrate.announcement", 0LL);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BSIDidCalibrate](&OBJC_CLASS___VOSOutputEvent, "BSIDidCalibrate"));
  -[VOTBrailleGestureManager _announceRespectingSoundSettingsRequest:event:]( self,  "_announceRespectingSoundSettingsRequest:event:",  v5,  v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[VOTUserEventManager sharedInstance](&OBJC_CLASS___VOTUserEventManager, "sharedInstance"));
  [v7 userEventOccurred];
}

- (void)_speakPrintBrailleForExploration
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager speakingDelayTimer](self, "speakingDelayTimer"));

  if (!v3)
  {
    id v4 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[VOTBrailleGestureManager setSpeakingDelayTimer:](self, "setSpeakingDelayTimer:", v4);

    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager speakingDelayTimer](self, "speakingDelayTimer"));
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager speakingDelayTimer](self, "speakingDelayTimer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D8BD4;
  v7[3] = &unk_100176D38;
  v7[4] = self;
  [v6 afterDelay:v7 processBlock:0.3];
}

- (void)_enumerateDotNumbersForPrintBraille:(id)a3 usingBlock:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, unint64_t, void))a4;
  if ((unint64_t)[v11 length] >= 2) {
    *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureManager.m",  1421LL,  "-[VOTBrailleGestureManager _enumerateDotNumbersForPrintBraille:usingBlock:]",  @"Should have passed in either a single Braille character or none").n128_u64[0];
  }
  if (objc_msgSend(v11, "length", v7) == (id)1)
  {
    unsigned int v8 = [v11 characterAtIndex:0];
    if (-[VOTBrailleGestureManager _numberOfDots](self, "_numberOfDots"))
    {
      unint64_t v9 = 1LL;
      do
      {
        v6[2](v6, v9, (v8 >> (v9 - 1)) & 1);
        ++v9;
      }

      while (v9 <= -[VOTBrailleGestureManager _numberOfDots](self, "_numberOfDots"));
    }
  }

  else if (-[VOTBrailleGestureManager _numberOfDots](self, "_numberOfDots"))
  {
    unint64_t v10 = 1LL;
    do
      v6[2](v6, v10++, 0LL);
    while (v10 <= -[VOTBrailleGestureManager _numberOfDots](self, "_numberOfDots"));
  }
}

- (id)_spokenStringForPrintBraille:(id)a3
{
  return -[VOTBrailleGestureManager _spokenStringForPrintBraille:useLongForm:]( self,  "_spokenStringForPrintBraille:useLongForm:",  a3,  0LL);
}

- (id)_spokenStringForPrintBraille:(id)a3 useLongForm:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((unint64_t)[v6 length] >= 2) {
    *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureManager.m",  1447LL,  "-[VOTBrailleGestureManager _spokenStringForPrintBraille:useLongForm:]",  @"Should have passed in either a single Braille character or none").n128_u64[0];
  }
  int64_t v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = sub_1000D8FAC;
  id v20 = &unk_100179EF0;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[VOTBrailleGestureManager _numberOfDots](self, "_numberOfDots", v7)));
  id v21 = v8;
  -[VOTBrailleGestureManager _enumerateDotNumbersForPrintBraille:usingBlock:]( self,  "_enumerateDotNumbersForPrintBraille:usingBlock:",  v6,  &v17);

  if ([v8 count])
  {
    id v9 = sub_10004A988(off_1001AC148, @"braille.dot.pattern.separator", 0LL);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:v10]);

    if (v4)
    {
      if ([v8 count] == (id)1) {
        uint64_t v12 = @"braille.dot.pattern.singular";
      }
      else {
        uint64_t v12 = @"braille.dot.pattern.plural";
      }
      id v13 = sub_10004A988(off_1001AC148, v12, 0LL);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v14,  v11,  v17,  v18,  v19,  v20));

      id v11 = (void *)v15;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)_handleCalibrationTimeout
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager calibrationStartTouchPoints](self, "calibrationStartTouchPoints"));

  if (!v3) {
    *(void *)&double v4 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureManager.m",  1471LL,  "-[VOTBrailleGestureManager _handleCalibrationTimeout]",  @"Timed out from calibration, but had no touch points to input.").n128_u64[0];
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager calibrationStartTouchPoints](self, "calibrationStartTouchPoints", v4));
  -[VOTBrailleGestureManager _inputBrailleFromTouchPoints:](self, "_inputBrailleFromTouchPoints:", v5);

  -[VOTBrailleGestureManager setCalibrationStartTouchPoints:](self, "setCalibrationStartTouchPoints:", 0LL);
}

- (BOOL)_handleAllFingersLifted
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager calibrationStartTouchPoints](self, "calibrationStartTouchPoints"));

  if (v3) {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_handleCalibrationTimeout",  0LL);
  }
  -[VOTBrailleGestureManager setSplitting:](self, "setSplitting:", 0LL);
  int v4 = 0;
  BOOL v5 = 0;
  if (!-[VOTBrailleGestureManager isExploring](self, "isExploring"))
  {
    if (-[VOTBrailleGestureManager didMoveFingersTooFarForInput](self, "didMoveFingersTooFarForInput")
      || -[VOTBrailleGestureManager didEnterInvalidGesture](self, "didEnterInvalidGesture"))
    {
      int v4 = 0;
      BOOL v5 = 0;
      goto LABEL_19;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_allTouchLocationsByIdentifier, "allValues"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _printBrailleForTouchPoints:](self, "_printBrailleForTouchPoints:", v6));
    if (v3)
    {
      unsigned int v8 = -[VOTBrailleGestureManager _isCalibrationEndPattern:](self, "_isCalibrationEndPattern:", v7);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager calibrationStartTouchPoints](self, "calibrationStartTouchPoints"));
      unint64_t v10 = (void *)v9;
      if (v8)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _touchPointsForCalibrationGivenFirstPoints:lastPoints:]( self,  "_touchPointsForCalibrationGivenFirstPoints:lastPoints:",  v9,  v6));
        -[VOTBrailleGestureManager _calibrateWithTouchPoints:](self, "_calibrateWithTouchPoints:", v11);
      }

      else
      {
        v15[0] = v9;
        v15[1] = v6;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
        -[VOTBrailleGestureManager _inputBrailleFromSeriesOfTouchPoints:]( self,  "_inputBrailleFromSeriesOfTouchPoints:",  v11);
      }
    }

    else
    {
      if (-[VOTBrailleGestureManager _isCalibrationStartPattern:](self, "_isCalibrationStartPattern:", v7))
      {
        -[VOTBrailleGestureManager setCalibrationStartTouchPoints:](self, "setCalibrationStartTouchPoints:", v6);
        unsigned int v12 = -[VOTBrailleGestureManager _deviceSupportsMoreThanFiveTouches](self, "_deviceSupportsMoreThanFiveTouches");
        double v13 = 0.5;
        if (v12) {
          double v13 = 0.25;
        }
        -[VOTBrailleGestureManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_handleCalibrationTimeout",  0LL,  v13);
        int v4 = 1;
        goto LABEL_18;
      }

      -[VOTBrailleGestureManager _inputBrailleFromTouchPoints:](self, "_inputBrailleFromTouchPoints:", v6);
    }

    int v4 = 0;
LABEL_18:
    -[VOTBrailleGestureManager _updateBrailleUI](self, "_updateBrailleUI");

    BOOL v5 = 1;
  }

- (void)_cleanUpTouchesIncludingCalibrationStartPoints:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSMutableDictionary removeAllObjects](self->_allTouchLocationsByIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_firstTouchLocationsByIdentifier, "removeAllObjects");
  -[VOTBrailleGestureManager setDidMoveFingersTooFarForInput:](self, "setDidMoveFingersTooFarForInput:", 0LL);
  -[VOTBrailleGestureManager setDidEnterInvalidGesture:](self, "setDidEnterInvalidGesture:", 0LL);
  -[VOTBrailleGestureManager setLastPrintBrailleCharacter:](self, "setLastPrintBrailleCharacter:", 0LL);
  -[VOTBrailleGestureManager _updateDotNumberCirclesForPrintBraille:]( self,  "_updateDotNumberCirclesForPrintBraille:",  0LL);
  -[VOTBrailleGestureManager _endExploringDotPatterns](self, "_endExploringDotPatterns");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager speakingDelayTimer](self, "speakingDelayTimer"));
  [v5 cancel];

  if (v3) {
    -[VOTBrailleGestureManager setCalibrationStartTouchPoints:](self, "setCalibrationStartTouchPoints:", 0LL);
  }
}

- (void)_handleFingersOnScreen:(id)a3 didAddOrRemoveFingers:(BOOL)a4
{
  BOOL v38 = a4;
  id v5 = a3;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_allTouchLocationsByIdentifier,  "setObject:forKeyedSubscript:",  v11,  v10);

        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_firstTouchLocationsByIdentifier,  "objectForKeyedSubscript:",  v10));
        if (v12)
        {
          if (!-[VOTBrailleGestureManager didMoveFingersTooFarForInput](self, "didMoveFingersTooFarForInput"))
          {
            double v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_allTouchLocationsByIdentifier,  "objectForKeyedSubscript:",  v10));
            objc_msgSend(v13, "ax_CGPointValue");
            double v15 = v14;
            double v17 = v16;
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_firstTouchLocationsByIdentifier,  "objectForKeyedSubscript:",  v10));
            objc_msgSend(v18, "ax_CGPointValue");
            double DistanceBetweenPoints = SCRCMathGetDistanceBetweenPoints(v15, v17, v19, v20);

            if (DistanceBetweenPoints > 45.0) {
              -[VOTBrailleGestureManager setDidMoveFingersTooFarForInput:]( self,  "setDidMoveFingersTooFarForInput:",  1LL);
            }
          }
        }

        else
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_firstTouchLocationsByIdentifier,  "setObject:forKeyedSubscript:",  v22,  v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v7);
  }

  id v23 = -[VOTBrailleGestureManager _newBrailleInput](self, "_newBrailleInput");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  v44 = v24;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  [v23 setSeriesOfTouchPoints:v25];

  gestureTranslator = self->_gestureTranslator;
  id v39 = 0LL;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator printBrailleForInput:error:]( gestureTranslator,  "printBrailleForInput:error:",  v23,  &v39));
  id v28 = v39;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
  if ([v29 isEqualToString:@"VOTBrailleGestureErrorDomain"])
  {
    id v30 = [v28 code];

    if (v30 == (id)1 && !-[VOTBrailleGestureManager didEnterInvalidGesture](self, "didEnterInvalidGesture"))
    {
      id v31 = sub_10004A988(off_1001AC148, @"braille.too.many.touches.format", 0LL);
      double v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      uint64_t v33 = AXFormatInteger(-[VOTBrailleGestureManager _numberOfDots](self, "_numberOfDots") >> 1);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      double v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v32, v34));
      -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:](self, "_speakText:useKeyboardLanguage:", v35, 0LL);

      -[VOTBrailleGestureManager setDidEnterInvalidGesture:](self, "setDidEnterInvalidGesture:", 1LL);
    }
  }

  else
  {
  }

  id v36 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager lastPrintBrailleCharacter](self, "lastPrintBrailleCharacter"));
  unsigned __int8 v37 = [v36 isEqualToString:v27];

  if ((v37 & 1) == 0)
  {
    -[VOTBrailleGestureManager setLastPrintBrailleCharacter:](self, "setLastPrintBrailleCharacter:", v27);
    if (-[VOTBrailleGestureManager isExploring](self, "isExploring"))
    {
      -[VOTBrailleGestureManager _speakPrintBrailleForExploration](self, "_speakPrintBrailleForExploration");
    }

    else if (!v38)
    {
      -[VOTBrailleGestureManager _updateDotNumberCirclesForPrintBraille:]( self,  "_updateDotNumberCirclesForPrintBraille:",  0LL);
      -[VOTBrailleGestureManager setShouldUpdateDotPositions:](self, "setShouldUpdateDotPositions:", 0LL);
    }

    if (-[VOTBrailleGestureManager shouldUpdateDotPositions](self, "shouldUpdateDotPositions")) {
      -[VOTBrailleGestureManager _updateDotNumberCirclesForPrintBraille:]( self,  "_updateDotNumberCirclesForPrintBraille:",  v27);
    }
  }

  if (v38 && !-[VOTBrailleGestureManager isSplitting](self, "isSplitting")) {
    -[VOTBrailleGestureManager _scheduleExploringModeIfNeeded](self, "_scheduleExploringModeIfNeeded");
  }
}

- (int64_t)valueChangeOriginator
{
  return 3LL;
}

- (id)_newBrailleInput
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___VOTBrailleGestureInput);
  int v4 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _languageCodeForSpeakingAndBrailleTranslation]( self,  "_languageCodeForSpeakingAndBrailleTranslation"));
  -[VOTBrailleGestureInput setLanguageCode:](v3, "setLanguageCode:", v4);

  return v3;
}

- (void)_updateDotNumberCirclesForPrintBraille:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D9850;
  v7[3] = &unk_100179EF0;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = v8;
  -[VOTBrailleGestureManager _enumerateDotNumbersForPrintBraille:usingBlock:]( self,  "_enumerateDotNumbersForPrintBraille:usingBlock:",  v4,  v7);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
  [v6 highlightBrailleDots:v5];
}

- (void)_scheduleExploringModeIfNeeded
{
  if (!-[VOTBrailleGestureManager isExploring](self, "isExploring"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager warningTonesTimer](self, "warningTonesTimer"));

    if (!v3)
    {
      id v4 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
      -[VOTBrailleGestureManager setWarningTonesTimer:](self, "setWarningTonesTimer:", v4);

      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager warningTonesTimer](self, "warningTonesTimer"));
      [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager warningTonesTimer](self, "warningTonesTimer"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000D9980;
    v7[3] = &unk_100176D38;
    void v7[4] = self;
    [v6 afterDelay:v7 processBlock:1.0];
  }

- (BOOL)_isNextBrailleUsageEvent:(id)a3
{
  return 0;
}

- (BOOL)_isPreviousBrailleUsageEvent:(id)a3
{
  return 0;
}

- (BOOL)_isTranslateImmediatelyEvent:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSITranslateImmediately];

  return v4;
}

- (BOOL)_isToggleLockedConfigurationEvent:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSIOrientationLock];

  return v4;
}

- (BOOL)_isCarriageReturnSwipeEvent:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 command]);
  unsigned __int8 v4 = [v3 isEqualToString:kVOTEventCommandBSIQuickAction];

  return v4;
}

- (BOOL)_isSelectEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 command]);
  if ([v4 isEqualToString:kVOTEventCommandSelectLeft])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 command]);
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandSelectRight];
  }

  return v5;
}

- (BOOL)_isAdjustTextSegmentEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 command]);
  if ([v4 isEqualToString:kVOTEventCommandNextTextSegment])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 command]);
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandPreviousTextSegment];
  }

  return v5;
}

- (BOOL)_isAdjustTextSegmentTypeEvent:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 command]);
  if ([v4 isEqualToString:kVOTEventCommandNextTextSegmentType])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 command]);
    unsigned __int8 v5 = [v6 isEqualToString:kVOTEventCommandPreviousTextSegmentType];
  }

  return v5;
}

- (void)_inputBrailleFromTouchPoints:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));

    -[VOTBrailleGestureManager _inputBrailleFromSeriesOfTouchPoints:]( self,  "_inputBrailleFromSeriesOfTouchPoints:",  v5,  v6);
  }

- (void)_inputBrailleFromSeriesOfTouchPoints:(id)a3
{
  id v5 = a3;
  if (-[VOTBrailleGestureManager isExploring](self, "isExploring")) {
    *(void *)&double v4 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTBrailleGestureManager.m",  1722LL,  "-[VOTBrailleGestureManager _inputBrailleFromSeriesOfTouchPoints:]",  @"While exploring, we should not input any Braille.").n128_u64[0];
  }
  -[VOTBrailleGestureManager _handleTouchPoints:](self, "_handleTouchPoints:", v5, v4);
}

- (id)_printBrailleForTouchPoints:(id)a3
{
  id v4 = a3;
  id v5 = -[VOTBrailleGestureManager _newBrailleInput](self, "_newBrailleInput");
  id v9 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  [v5 setSeriesOfTouchPoints:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator printBrailleForInput:error:]( self->_gestureTranslator,  "printBrailleForInput:error:",  v5,  0LL));
  return v7;
}

- (void)_handleTranslateImmediately
{
  if (-[VOTBrailleGestureManager _shouldUseContractedBraille](self, "_shouldUseContractedBraille")
    || -[VOTBrailleGestureManager _requiresLaTeXInput](self, "_requiresLaTeXInput"))
  {
    id v8 = +[VOTOutputRequest createRequest](&OBJC_CLASS___VOTOutputRequest, "createRequest");
    id v3 = sub_10004A988(off_1001AC148, @"braille.translate.event", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = [v8 addString:v4];

    if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 lastAction]);
      [v6 setObject:&off_1001873C0 forVariant:32];
    }

    [v8 setCannotBeInterrupted:1];
    [v8 send];
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
    -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v7);

    -[VOTBrailleGestureManager clearCurrentString](self, "clearCurrentString");
  }

  else
  {
    -[VOTBrailleGestureManager _playBonk](self, "_playBonk");
  }

- (id)_languageCodeForBrailleTable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedBrailleGesturesInputTable]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 language]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);

  return v5;
}

- (id)_languageCodeForSpellChecking
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForBrailleTable](self, "_languageCodeForBrailleTable"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByReplacingOccurrencesOfString:@"-" withString:@"_"]);

  return v3;
}

- (id)_languageCodeForSpeakingAndBrailleTranslation
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForBrailleTable](self, "_languageCodeForBrailleTable"));
  uint64_t v4 = VOTLogBrailleGestures(v2, v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v25 = 138543362;
    uint64_t v26 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Language code from keyboard in app is %{public}@",  (uint8_t *)&v25,  0xCu);
  }

  uint64_t v6 = AXCRemapLanguageCodeToFallbackIfNeccessary(v2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = AXLanguageConvertToCanonicalForm(v7);
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);

  uint64_t v10 = AXRetrieveSupportedAccessibilityLanguages();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  unsigned int v12 = v11;
  if (!v11 || !v9) {
    goto LABEL_8;
  }
  id v13 = -[__CFString rangeOfString:](v9, "rangeOfString:", @"-");
  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v14 = objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v9, "substringToIndex:", v13)),
        v9,
        id v9 = (__CFString *)v14,
        ![v12 containsObject:v14]))
  {
  }

  else
  {
LABEL_8:
    if (v9) {
      goto LABEL_17;
    }
  }

  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 systemSpokenLanguage]);

  uint64_t v18 = VOTLogBrailleGestures(v16, v17);
  double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    uint64_t v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Language code from workspace is %{public}@",  (uint8_t *)&v25,  0xCu);
  }

  if (!v9)
  {
    uint64_t v22 = VOTLogBrailleGestures(v20, v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Had to fall back to using English.",  (uint8_t *)&v25,  2u);
    }

    id v9 = @"en";
  }

- (BOOL)_handleCarriageReturnSwipe
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager delegate](self, "delegate"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DA290;
  v5[3] = &unk_100179F18;
  v5[4] = self;
  [v3 gesturedTextInputManager:self accessCurrentGesturedTextInputElement:v5];

  return 1;
}

- (void)handleBrailleGestureWithLeftPatternDictionary:(id)a3 rightPatternDictionary:(id)a4
{
  id v6 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithDictionaryRepresentation:",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[VOTBrailleGestureHalfPattern halfPatternWithDictionaryRepresentation:]( &OBJC_CLASS___VOTBrailleGestureHalfPattern,  "halfPatternWithDictionaryRepresentation:",  v6));

  uint64_t v8 = -[VOTBrailleGesturePattern initWithLeftDots:rightDots:]( objc_alloc(&OBJC_CLASS___VOTBrailleGesturePattern),  "initWithLeftDots:rightDots:",  v10,  v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator printBrailleForGesturePattern:]( self->_gestureTranslator,  "printBrailleForGesturePattern:",  v8));
  -[VOTBrailleGestureManager _handlePrintBraille:](self, "_handlePrintBraille:", v9);
}

- (void)_handlePrintBraille:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  if ((AXDeviceSupportsManyTouches() & 1) == 0
    && -[VOTBrailleGestureManager overridePrintBrailleWithAllSixDots](self, "overridePrintBrailleWithAllSixDots"))
  {

    uint64_t v4 = @"⠿";
  }

  if (!-[VOTBrailleGestureManager usage](self, "usage")) {
    -[VOTBrailleGestureManager _typePrintBraille:](self, "_typePrintBraille:", v4);
  }
}

- (void)_issueCommands:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    unint64_t v4 = 0LL;
    do
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v4, 1));
      -[VOTBrailleGestureManager _issueSingleCommand:](self, "_issueSingleCommand:", v5);

      ++v4;
    }

    while (v4 < (unint64_t)[v6 length]);
  }
}

- (void)_issueSingleCommand:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager commands](self, "commands"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    id v7 = (void *)VOTSharedWorkspace;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent touchEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "touchEventWithCommand:info:",  v6,  0LL));
    [v7 dispatchCommand:v8 bypassGesturedInput:1];

    uint64_t v11 = VOTLogBrailleGestures(v9, v10);
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Issued %@ for Braille chord %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)_typePrintBraille:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[VOTBrailleGestureManager mode](self, "mode");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
  unsigned int v7 = [v6 isActiveResponder];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
  unsigned int v9 = [v8 shouldPlayKeyboardSecureClickSound];

  unsigned int v43 = v7;
  if (v5 - 5 >= 0xFFFFFFFFFFFFFFFELL) {
    unsigned int v10 = (-[VOTBrailleGestureManager _canUseContractedBraille](self, "_canUseContractedBraille") | v7) ^ 1 | v9;
  }
  else {
    unsigned int v10 = 1;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translatedTextForPrintBraille:mode:]( self->_gestureTranslator,  "translatedTextForPrintBraille:mode:",  v4,  v5));
  gestureTranslator = self->_gestureTranslator;
  int v13 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _languageCodeForSpeakingAndBrailleTranslation]( self,  "_languageCodeForSpeakingAndBrailleTranslation"));
  -[VOTBrailleGestureTranslator addPrintBrailleToBuffer:language:]( gestureTranslator,  "addPrintBrailleToBuffer:language:",  v4,  v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentString](self, "currentString"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  v5));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 commonPrefixWithString:v11 options:0]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v16, "length")));

  uint64_t v20 = VOTLogBrailleGestures(v18, v19);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478595;
    v45 = v14;
    __int16 v46 = 2113;
    id v47 = v4;
    __int16 v48 = 2113;
    v49 = v11;
    __int16 v50 = 2113;
    v51 = v17;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "existingText = \"%{private}@\", printBraille = \"%{private}@\", translatedText = \"%{private}@\", textToBeInserted = \"%{private}@\"",  buf,  0x2Au);
  }

  if (v5 == 4) {
    id v22 = v4;
  }
  else {
    id v22 = v11;
  }
  -[VOTBrailleGestureManager _flashInsertedTextIfAllowed:](self, "_flashInsertedTextIfAllowed:", v22);
  if (v10) {
    -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v15);
  }
  if (v14 == v11 || [v14 isEqualToString:v11])
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
    if (![v23 shouldEchoCharacter])
    {
LABEL_30:

      goto LABEL_31;
    }

    id v24 = [v4 length];

    if (v24)
    {
      int v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unint64_t v26 = (unint64_t)[v25 voiceOverBrailleGesturesTypingFeedback];

      if ((v26 & 0xFFFFFFFFFFFFFFFDLL) == 0)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUnichar:]( NSString,  "stringWithUnichar:",  objc_msgSend( v4,  "characterAtIndex:",  objc_msgSend( v4,  "rangeOfComposedCharacterSequenceAtIndex:",  (char *)objc_msgSend(v4, "length") - 1))));
        id v23 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _spokenStringForPrintBraille:useLongForm:]( self,  "_spokenStringForPrintBraille:useLongForm:",  v27,  1LL));

        uint64_t v30 = VOTLogBrailleGestures(v28, v29);
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
LABEL_27:
        sub_1000F597C();
LABEL_28:

        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
        unsigned __int8 v42 = [v41 shouldPlayKeyboardSecureClickSound];

        if ((v42 & 1) == 0) {
          -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:]( self,  "_speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:",  v23,  v43,  0LL,  1LL,  0LL,  0LL);
        }
        goto LABEL_30;
      }
    }
  }

  else
  {
    double v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unint64_t v33 = (unint64_t)[v32 voiceOverBrailleGesturesTypingFeedback];

    if ((v33 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      char v34 = 1;
    }
    else {
      char v34 = v10;
    }
    if ((v34 & 1) == 0)
    {
      if (v5 == 4)
      {
        unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUnichar:]( NSString,  "stringWithUnichar:",  objc_msgSend( v4,  "characterAtIndex:",  objc_msgSend( v4,  "rangeOfComposedCharacterSequenceAtIndex:",  (char *)objc_msgSend(v4, "length") - 1))));
        id v23 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _spokenStringForPrintBraille:useLongForm:]( self,  "_spokenStringForPrintBraille:useLongForm:",  v37,  1LL));

        uint64_t v40 = VOTLogBrailleGestures(v38, v39);
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }

      if (v5 == 3)
      {
        double v35 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
        unsigned __int8 v36 = [v35 shouldPlayKeyboardSecureClickSound];

        if ((v36 & 1) == 0) {
          -[VOTBrailleGestureManager _speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:]( self,  "_speakText:useKeyboardLanguage:shouldQueue:isInsert:isDelete:speakLiterally:",  v11,  v43,  0LL,  1LL,  0LL,  1LL);
        }
      }
    }
  }

- (void)_handleTouchPoints:(id)a3
{
  id v4 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_handleTouchPoints:",  v4);
  id v5 = -[VOTBrailleGestureManager _newBrailleInput](self, "_newBrailleInput");
  [v5 setSeriesOfTouchPoints:v4];
  gestureTranslator = self->_gestureTranslator;
  id v16 = 0LL;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator printBrailleForAllTouchPointsInInput:shouldLearn:error:]( gestureTranslator,  "printBrailleForAllTouchPointsInInput:shouldLearn:error:",  v5,  1LL,  &v16));
  id v8 = v16;
  unsigned int v10 = v8;
  if (!v7 || (id v8 = [v7 length]) == 0)
  {
    uint64_t v15 = VOTLogBrailleGestures(v8, v9);
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000F59DC();
    }
    goto LABEL_10;
  }

  -[VOTBrailleGestureManager _handlePrintBraille:](self, "_handlePrintBraille:", v7);
  if (!-[VOTBrailleGestureManager usage](self, "usage")
    && -[VOTBrailleGestureManager usesTypingSoundFeedback](self, "usesTypingSoundFeedback"))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BSIDidType](&OBJC_CLASS___VOSOutputEvent, "BSIDidType"));
    [v11 sendEvent:v12];
  }

  if (-[VOTBrailleGestureManager usesHapticFeedback](self, "usesHapticFeedback"))
  {
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BSIDidEnterChord](&OBJC_CLASS___VOSOutputEvent, "BSIDidEnterChord"));
    -[os_log_s sendEvent:](v13, "sendEvent:", v14);

LABEL_10:
  }
}

- (void)_applyCandidateInDirection:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
  uint64_t v7 = VOTLogBrailleGestures(v5, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    uint64_t v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Translate existing input: %@",  (uint8_t *)&v16,  0xCu);
  }

  if (!-[VOTBrailleGestureCandidateManager isActive](self->_candidateManager, "isActive"))
  {
    candidateManager = self->_candidateManager;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForSpellChecking](self, "_languageCodeForSpellChecking"));
    -[VOTBrailleGestureCandidateManager analyzeString:language:](candidateManager, "analyzeString:language:", v5, v10);

    goto LABEL_9;
  }

  if (a3 == 2)
  {
    if (-[VOTBrailleGestureCandidateManager hasPreviousCandidate](self->_candidateManager, "hasPreviousCandidate"))
    {
      -[VOTBrailleGestureCandidateManager moveToPreviousCandidate](self->_candidateManager, "moveToPreviousCandidate");
      goto LABEL_9;
    }
  }

  else if (a3 == 1 {
         && -[VOTBrailleGestureCandidateManager hasNextCandidate](self->_candidateManager, "hasNextCandidate"))
  }
  {
    -[VOTBrailleGestureCandidateManager moveToNextCandidate](self->_candidateManager, "moveToNextCandidate");
LABEL_9:
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureCandidateManager currentCandidateSurfaceString]( self->_candidateManager,  "currentCandidateSurfaceString"));
    goto LABEL_13;
  }

  uint64_t v11 = 0LL;
LABEL_13:
  id v12 = -[VOTBrailleGestureManager _outputChosenCandidate:](self, "_outputChosenCandidate:", v11);
  uint64_t v14 = VOTLogBrailleGestures(v12, v13);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    uint64_t v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Candidate presented: %@", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_applyNextCandidate
{
}

- (void)_applyPreviousCandidate
{
}

- (void)_insertCurrentSelectedCandidate
{
  if (-[VOTBrailleGestureCandidateManager isActive](self->_candidateManager, "isActive"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureCandidateManager currentCandidateSurfaceString]( self->_candidateManager,  "currentCandidateSurfaceString"));
    -[VOTBrailleGestureManager updateWithString:](self, "updateWithString:", v3);
    -[VOTBrailleGestureCandidateManager didSelectCurrentCandidate](self->_candidateManager, "didSelectCurrentCandidate");
    -[VOTBrailleGestureCandidateManager deactivate](self->_candidateManager, "deactivate");
  }

- (void)_outputChosenCandidate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForSpellChecking](self, "_languageCodeForSpellChecking"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptionOfWord:v4 forLanguage:v6]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager _languageCodeForSpellChecking](self, "_languageCodeForSpellChecking"));
    LOWORD(v10) = 0;
    -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:]( self,  "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:",  v7,  0LL,  0LL,  0LL,  0LL,  0LL,  v10,  v8);
  }

  else
  {
    id v9 = 0LL;
    -[VOTBrailleGestureManager _playBonk](self, "_playBonk");
  }

  -[VOTBrailleGestureManager _flashInsertedTextIfAllowed:](self, "_flashInsertedTextIfAllowed:", a3);
}

- (void)_updateBrailleUI
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureTranslator dotNumberPositions](self->_gestureTranslator, "dotNumberPositions"));
  uint64_t v5 = VOTLogBrailleGestures(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "updating BSI UI with dot positions: %@",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
  objc_msgSend( v7,  "updateBrailleUIWithOrientation:dotPositions:typingMode:",  -[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"),  v3,  -[VOTBrailleGestureManager typingMode](self, "typingMode"));
}

- (void)_flashInsertedTextIfAllowed:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTGesturedTextInputManager currentElementAttributes](self, "currentElementAttributes"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v6 = [v5 voiceOverTouchBrailleGesturesDisplaysEnteredText];

  if (v6)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    [v4 flashBrailleInsertedText:v7];
LABEL_4:
  }
}

- (void)_updateDotPositions
{
  gestureTranslator = self->_gestureTranslator;
  int64_t v4 = -[VOTBrailleGestureManager typingMode](self, "typingMode");
  double v5 = sub_10004B1F8(-[VOTBrailleGestureManager keyboardOrientation](self, "keyboardOrientation"));
  -[VOTBrailleGestureTranslator setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:]( gestureTranslator,  "setTypingMode:keyboardSize:shouldUseEightDotBraille:shouldReverseDots:",  v4,  -[VOTBrailleGestureManager _shouldUseEightDotBraille](self, "_shouldUseEightDotBraille"),  -[VOTBrailleGestureManager _shouldReverseDots](self, "_shouldReverseDots"),  v5,  v6);
  -[VOTBrailleGestureManager _updateBrailleUI](self, "_updateBrailleUI");
}

- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4
{
}

- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5
{
}

- (void)_speakText:(id)a3 useKeyboardLanguage:(BOOL)a4 shouldQueue:(BOOL)a5 isInsert:(BOOL)a6 isDelete:(BOOL)a7 speakLiterally:(BOOL)a8
{
  BYTE1(v8) = a8;
  LOBYTE(v8) = a7;
  -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:]( self,  "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:",  a3,  0LL,  a4,  a5,  a6,  0LL,  v8,  0LL);
}

- (void)_speakText:(id)a3 hint:(id)a4
{
  LOWORD(v4) = 0;
  -[VOTBrailleGestureManager _speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:]( self,  "_speakText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:",  a3,  a4,  0LL,  0LL,  0LL,  0LL,  v4,  0LL);
}

- (void)_speakText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11
{
  LOWORD(v11) = __PAIR16__(a10, a9);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _outputRequestForText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiterally:otherLanguage:]( self,  "_outputRequestForText:hint:useKeyboardLanguage:shouldQueue:isInsert:isSuggestion:isDelete:speakLiter ally:otherLanguage:",  a3,  a4,  a5,  a6,  a7,  a8,  v11,  a11));
  [v12 send];
}

- (id)_outputRequestForText:(id)a3 hint:(id)a4 useKeyboardLanguage:(BOOL)a5 shouldQueue:(BOOL)a6 isInsert:(BOOL)a7 isSuggestion:(BOOL)a8 isDelete:(BOOL)a9 speakLiterally:(BOOL)a10 otherLanguage:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a3;
  id v51 = a4;
  id v18 = a11;
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___VOTOutputRequest);
  uint64_t v20 = v19;
  if (v13) {
    -[VOTOutputRequest setDoesNotInterrupt:](v19, "setDoesNotInterrupt:", 1LL);
  }
  if (a5)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureManager _languageCodeForSpeakingAndBrailleTranslation]( self,  "_languageCodeForSpeakingAndBrailleTranslation"));
    id v22 = -[VOTOutputRequest addString:withLanguage:](v20, "addString:withLanguage:", v17, v21);
  }

  else
  {
    id v23 = -[VOTOutputRequest addString:withLanguage:](v20, "addString:withLanguage:", v17, v18);
  }

  unsigned int v24 = [(id)VOTSharedWorkspace typingPitchChangeEnabled];
  BOOL v25 = a9;
  if ((v12 || a9 || v11) && v24)
  {
    id v49 = v18;
    if (a9)
    {
      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v27 = [v26 voiceOverDeletionFeedback];

      if (v27 == (id)1) {
        double v28 = 0.75;
      }
      else {
        double v28 = 1.0;
      }
    }

    else
    {
      double v29 = 1.5;
      if (!v11) {
        double v29 = 1.0;
      }
      if (v12) {
        double v28 = 1.0;
      }
      else {
        double v28 = v29;
      }
    }

    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int16 v50 = v20;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](v20, "outputActions"));
    id v31 = [v30 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v53;
      float v34 = v28;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(v30);
          }
          unsigned __int8 v36 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 string]);
          unsigned int v38 = sub_10004A070(v37);

          if (v38) {
            *(float *)&double v39 = 1.5;
          }
          else {
            *(float *)&double v39 = v34;
          }
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v39));
          [v36 setObject:v40 forVariant:32];

          if (a10) {
            [v36 setObject:&__kCFBooleanTrue forVariant:28];
          }
        }

        id v32 = [v30 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }

      while (v32);
    }

    uint64_t v20 = v50;
    id v18 = v49;
    BOOL v25 = a9;
  }

  if (v25)
  {
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v42 = [v41 voiceOverDeletionFeedback];

    if (v42 == (id)2)
    {
      unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(-[VOTOutputRequest outputActions](v20, "outputActions"));
      [v43 enumerateObjectsUsingBlock:&stru_100179F38];
    }
  }

  if ([v51 length])
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    unsigned int v45 = [v44 hintsEnabled];

    if (v45)
    {
      LODWORD(v46) = 1061997773;
      -[VOTOutputRequest addPause:](v20, "addPause:", v46);
      id v47 = -[VOTOutputRequest addString:](v20, "addString:", v51);
      -[VOTOutputRequest setCompletionBlock:](v20, "setCompletionBlock:", &stru_100179F58);
    }
  }

  return v20;
}

- (void)_playBonk
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent BoundaryEncountered](&OBJC_CLASS___VOSOutputEvent, "BoundaryEncountered"));
  [v3 sendEvent:v2];
}

- (void)_playWarningTone
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent FolderWillOpen](&OBJC_CLASS___VOSOutputEvent, "FolderWillOpen"));
  [v3 sendEvent:v2];
}

- (void)_playWarningTones:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  -[VOTBrailleGestureManager _playWarningTone](self, "_playWarningTone");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager warningTonesTimer](self, "warningTonesTimer"));

  if (v7)
  {
    if (!-[VOTBrailleGestureManager isSplitting](self, "isSplitting"))
    {
      if (a3 < 2)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000DB838;
        v20[3] = &unk_100179F80;
        v20[4] = self;
        id v21 = v6;
        dispatch_async(&_dispatch_main_q, v20);
        uint64_t v10 = v21;
      }

      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000DB790;
        block[3] = &unk_100177048;
        block[4] = self;
        unint64_t v24 = a3;
        id v23 = v6;
        dispatch_async(&_dispatch_main_q, block);
        uint64_t v10 = v23;
      }
    }
  }

  else
  {
    uint64_t v11 = VOTLogBrailleGestures(v8, v9);
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000F5A48(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_cancelWarningTones
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTBrailleGestureManager warningTonesTimer](self, "warningTonesTimer"));
  [v3 cancel];

  -[VOTBrailleGestureManager setWarningTonesTimer:](self, "setWarningTonesTimer:", 0LL);
}

- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4
{
}

- (void)_announceRespectingSoundSettingsRequest:(id)a3 event:(id)a4 hint:(id)a5
{
  id v20 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v10 = (unint64_t)[v9 voiceOverTouchBrailleGesturesSoundOption];

  if (v20 && (v10 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (v8
      && (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance")),
          unsigned __int8 v12 = [v11 voiceOverHintsEnabled],
          v11,
          (v12 & 1) != 0))
    {
      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___VOTOutputRequest);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v15 = -[VOTOutputRequest addString:withLanguage:](v13, "addString:withLanguage:", v20, v14);

      LODWORD(v16) = 1061997773;
      -[VOTOutputRequest addPause:](v13, "addPause:", v16);
      id v17 = -[VOTOutputRequest addString:](v13, "addString:", v8);
      -[VOTOutputRequest send](v13, "send");
    }

    else
    {
      uint64_t v13 = (VOTOutputRequest *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v18 = sub_10000BBB0(v20, 1, v13);
    }
  }

  if (v7 && v10 - 1 <= 1)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    [v19 sendEvent:v7];
  }
}

- (id)nameSearcherEntriesPassingSearchFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( -[VOTBrailleGestureTranslator translateExistingInputWithMode:]( self->_gestureTranslator,  "translateExistingInputWithMode:",  -[VOTBrailleGestureManager mode](self, "mode")));
  if (v5) {
    id v6 = (__CFString *)v5;
  }
  else {
    id v6 = &stru_10017A920;
  }
  BOOL v25 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  unint64_t v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        char v28 = 0;
        gestureTranslator = self->_gestureTranslator;
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name", v24));
        unsigned __int8 v13 = -[VOTBrailleGestureTranslator isExistingInputContainedIn:withMode:isPrefix:]( gestureTranslator,  "isExistingInputContainedIn:withMode:isPrefix:",  v12,  -[VOTBrailleGestureManager mode](self, "mode"),  &v28);

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedLowercaseString]);
        double v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedLowercaseString](v6, "localizedLowercaseString"));
        unsigned int v17 = [v15 hasPrefix:v16];

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        unsigned int v19 = [v18 localizedCaseInsensitiveContainsString:v6];

        if ((v13 & 1) != 0 || v19)
        {
          if (v28) {
            int v20 = 1;
          }
          else {
            int v20 = v17;
          }
          if (v20) {
            id v21 = v25;
          }
          else {
            id v21 = v24;
          }
          -[NSMutableArray addObject:](v21, "addObject:", v10);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v8);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObjectsFromArray:](v25, "arrayByAddingObjectsFromArray:", v24));
  return v22;
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3, a4));
  if ([v6 voiceOverTouchBrailleGesturesShouldUseLockedConfiguration])
  {
  }

  else
  {
    unsigned int v5 = -[VOTGesturedTextInputManager isActive](self, "isActive");

    if (v5)
    {
      -[VOTBrailleGestureManager _updateBrailleTypingPropertiesAndDelayAnnouncement:]( self,  "_updateBrailleTypingPropertiesAndDelayAnnouncement:",  0LL);
      -[VOTBrailleGestureManager _updateBrailleUI](self, "_updateBrailleUI");
    }
  }

- (VOTBrailleGestureManagerDelegate)brailleGestureManagerDelegate
{
  return (VOTBrailleGestureManagerDelegate *)objc_loadWeakRetained((id *)&self->_brailleGestureManagerDelegate);
}

- (void)setBrailleGestureManagerDelegate:(id)a3
{
}

- (int64_t)usage
{
  return self->_usage;
}

- (int64_t)typingMode
{
  return self->_typingMode;
}

- (unint64_t)translationOverride
{
  return self->_translationOverride;
}

- (void)setTranslationOverride:(unint64_t)a3
{
  self->_translationOverride = a3;
}

- (NSDictionary)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (BOOL)shouldUpdateDotPositions
{
  return self->_shouldUpdateDotPositions;
}

- (void)setShouldUpdateDotPositions:(BOOL)a3
{
  self->_shouldUpdateDotPositions = a3;
}

- (BOOL)isExploring
{
  return self->_exploring;
}

- (void)setExploring:(BOOL)a3
{
  self->_exploring = a3;
}

- (BOOL)isSplitting
{
  return self->_splitting;
}

- (void)setSplitting:(BOOL)a3
{
  self->_splitting = a3;
}

- (BOOL)didMoveFingersTooFarForInput
{
  return self->_didMoveFingersTooFarForInput;
}

- (void)setDidMoveFingersTooFarForInput:(BOOL)a3
{
  self->_didMoveFingersTooFarForInput = a3;
}

- (BOOL)didAnnounceExplorationMode
{
  return self->_didAnnounceExplorationMode;
}

- (void)setDidAnnounceExplorationMode:(BOOL)a3
{
  self->_didAnnounceExplorationMode = a3;
}

- (BOOL)didAnnounceBrailleTypingProperties
{
  return self->_didAnnounceBrailleTypingProperties;
}

- (void)setDidAnnounceBrailleTypingProperties:(BOOL)a3
{
  self->_didAnnounceBrailleTypingProperties = a3;
}

- (int64_t)keyboardOrientation
{
  return self->_keyboardOrientation;
}

- (void)setKeyboardOrientation:(int64_t)a3
{
  self->_keyboardOrientation = a3;
}

- (NSString)lastPrintBrailleCharacter
{
  return self->_lastPrintBrailleCharacter;
}

- (void)setLastPrintBrailleCharacter:(id)a3
{
}

- (NSDictionary)lastTouchLocationsByIdentifier
{
  return self->_lastTouchLocationsByIdentifier;
}

- (void)setLastTouchLocationsByIdentifier:(id)a3
{
}

- (AXDispatchTimer)speakingDelayTimer
{
  return self->_speakingDelayTimer;
}

- (void)setSpeakingDelayTimer:(id)a3
{
}

- (AXDispatchTimer)brailleTypingPropertiesAnnouncementTimer
{
  return self->_brailleTypingPropertiesAnnouncementTimer;
}

- (void)setBrailleTypingPropertiesAnnouncementTimer:(id)a3
{
}

- (AXDispatchTimer)warningTonesTimer
{
  return self->_warningTonesTimer;
}

- (void)setWarningTonesTimer:(id)a3
{
}

- (BOOL)didStartFullGesture
{
  return self->_didStartFullGesture;
}

- (void)setDidStartFullGesture:(BOOL)a3
{
  self->_didStartFullGesture = a3;
}

- (BOOL)didEnterInvalidGesture
{
  return self->_didEnterInvalidGesture;
}

- (void)setDidEnterInvalidGesture:(BOOL)a3
{
  self->_didEnterInvalidGesture = a3;
}

- (AXDispatchTimer)lockScreenDimmingTimer
{
  return self->_lockScreenDimmingTimer;
}

- (void)setLockScreenDimmingTimer:(id)a3
{
}

- (AXDispatchTimer)logBSIUsageTimer
{
  return self->_logBSIUsageTimer;
}

- (void)setLogBSIUsageTimer:(id)a3
{
}

- (AXDispatchTimer)initialOrientationTimer
{
  return self->_initialOrientationTimer;
}

- (void)setInitialOrientationTimer:(id)a3
{
}

- (BSInvalidatable)disableIdleTimerAssertion
{
  return self->_disableIdleTimerAssertion;
}

- (void)setDisableIdleTimerAssertion:(id)a3
{
}

- (BOOL)overridePrintBrailleWithAllSixDots
{
  return self->_overridePrintBrailleWithAllSixDots;
}

- (void)setOverridePrintBrailleWithAllSixDots:(BOOL)a3
{
  self->_overridePrintBrailleWithAllSixDots = a3;
}

- (VOTTextMovementManager)movementManager
{
  return self->_movementManager;
}

- (void)setMovementManager:(id)a3
{
}

- (BOOL)usesTypingSoundFeedback
{
  return self->_usesTypingSoundFeedback;
}

- (void)setUsesTypingSoundFeedback:(BOOL)a3
{
  self->_usesTypingSoundFeedback = a3;
}

- (BOOL)usesHapticFeedback
{
  return self->_usesHapticFeedback;
}

- (void)setUsesHapticFeedback:(BOOL)a3
{
  self->_usesHapticFeedback = a3;
}

- (NSArray)calibrationStartTouchPoints
{
  return self->_calibrationStartTouchPoints;
}

- (void)setCalibrationStartTouchPoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end