@interface VOTWorkspace
+ (id)sharedWorkspace;
- (AXCharacterSoundMap)characterSoundMap;
- (AXMDisplayManager)displayManager;
- (AXUISoftwareKeyboardManager)softwareKeyboardManager;
- (AXVoiceOverActivity)selectedActivity;
- (BOOL)_userHasDisabledUSBRM;
- (BOOL)accessoryShutdownInProgress;
- (BOOL)activeBrailleAlertsPreference;
- (BOOL)activeBrailleGeneralStatusCellPreference;
- (BOOL)activeBrailleTextStatusCellPreference;
- (BOOL)allowSingleLetterSearching;
- (BOOL)announceOrientationChanges;
- (BOOL)audioDestinationRequestExternal;
- (BOOL)brailleAlertsEnabled;
- (BOOL)brailleFormattingEnabled;
- (BOOL)brailleInputActive;
- (BOOL)brailleInputAllowsElementMovement;
- (BOOL)brailleInputShouldBeDeactivatedByEscape;
- (BOOL)brailleInputWantsToStayActive;
- (BOOL)buttonIconDetectionEnabled;
- (BOOL)captionPanelEnabled;
- (BOOL)directTouchElementsPresent;
- (BOOL)disableVoiceOverSettingOnStop;
- (BOOL)duckingTemporarilyDisabled;
- (BOOL)hintsEnabled;
- (BOOL)imageCaptionsEnabled;
- (BOOL)inPerformanceTestMode;
- (BOOL)inUnitTestMode;
- (BOOL)isAccessibilityEnabled;
- (BOOL)isAudioRoutedToSpeaker;
- (BOOL)isBaseSystemSpokenEqualToLocalization;
- (BOOL)isInternalInstall;
- (BOOL)isOnenessActive;
- (BOOL)isRingerSwitchSilent;
- (BOOL)isRingerSwitchSilentForUnitTesting;
- (BOOL)isSiriListening;
- (BOOL)isSiriTalking;
- (BOOL)isSystemBatteryLow;
- (BOOL)isSystemWideServerAlive;
- (BOOL)isVoiceOverTouchPreferenceEnabled;
- (BOOL)largeCursorEnabled;
- (BOOL)navigationStyleHonorsGroups;
- (BOOL)outputDisabled;
- (BOOL)overridePropertiesForTesting;
- (BOOL)pauseSpeechAndHaptics;
- (BOOL)perkinsChordKeyboardInputEnabled;
- (BOOL)perkinsKeyboardInputEnabled;
- (BOOL)playKeyboardClicksOnHWInput;
- (BOOL)reachabilityActive;
- (BOOL)screenCurtainEnabled;
- (BOOL)screenCurtainSuspended;
- (BOOL)screenOn;
- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5;
- (BOOL)soundEffectsEnabled;
- (BOOL)soundMuted;
- (BOOL)speakAutocorrectionsEnabled;
- (BOOL)speakingRateInRotor;
- (BOOL)speechLogging;
- (BOOL)speechMuted;
- (BOOL)supportsHomeGestures;
- (BOOL)systemVolumeControlsAvailablity;
- (BOOL)tapAndHoldMode;
- (BOOL)telephonyIsActive;
- (BOOL)textDetectionEnabled;
- (BOOL)typingPitchChangeEnabled;
- (BOOL)updateRotorWithElement;
- (BOOL)useDigitalCrownNavigation;
- (BOOL)useRingerSwitchForNotificationOutput;
- (BOOL)userRecentlyUnlockedDevice;
- (BOOL)userRecentlyUnlockedDeviceForUnitTesting;
- (BOOL)userUnlockedDevice;
- (BOOL)userUnlockedDeviceForUnitTesting;
- (BOOL)usesDisplayManager;
- (BOOL)voiceOverIsConfirmed;
- (BOOL)voiceOverIsIdle;
- (BOOL)voiceOverMuted;
- (BOOL)wasEnabledThroughAccessory;
- (BRLTTable)selectedBrailleGesturesInputTable;
- (BRLTTable)selectedBrailleInputTable;
- (BRLTTable)selectedBrailleTable;
- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3;
- (CGPoint)fingerPosition;
- (NSArray)activities;
- (NSArray)brailleLanguageRotorItems;
- (NSArray)focusedApplications;
- (NSArray)imageCaptioningDisabledApps;
- (NSArray)languageRotorItems;
- (NSArray)punctuationGroups;
- (NSMutableDictionary)websiteLanguageMappingOverrides;
- (NSNumber)unitTestSpeechRate;
- (NSString)additionalLanguageRotorItem;
- (NSString)previousRotorVoiceIdentifier;
- (NSString)reachabilityIdentifier;
- (NSString)selectedLanguage;
- (NSString)systemSpokenLanguage;
- (NSString)unitTestSystemSpokenLanguage;
- (OS_dispatch_queue)managedConfigurationQueue;
- (OS_os_transaction)votTransaction;
- (VOSCommandManager)userCommandManager;
- (VOTElement)currentElement;
- (VOTElementManagementProtocol)elementManager;
- (VOTEventFactory)eventFactory;
- (VOTRotorManagementProtocol)rotorManager;
- (VOTVisionEngine)visionEngine;
- (VOTWorkspace)init;
- (VOTWorkspaceUnitTestDelegate)unitTestDelegate;
- (_TtC3vot11VOTSettings)votSettings;
- (double)_updateMainScreenSize:(double)a3 scale:;
- (double)activeBrailleAutoAdvanceDuration;
- (double)lastHomeButtonPress;
- (double)lastKeyboardKeyPress;
- (double)lastLockButtonPress;
- (double)lastLockButtonPressTime;
- (double)lastSoundMuteToggleTime;
- (double)lastSpeechMuteToggleTime;
- (double)lastTelephonyCallActive;
- (double)reachabilityOffset;
- (double)screenOnTime;
- (double)speechRateFromSettings;
- (id)_assetUpdaterClient;
- (id)_systemBootTime;
- (id)_validateAssetFromResults:(id)a3;
- (id)applicationForCurrentElement;
- (id)applicationForElement:(id)a3;
- (id)applicationForPID:(int)a3;
- (id)currentElementRotorString;
- (id)defaultPunctuationGroup;
- (id)imageCaptionModelAssetPolicy;
- (id)keyboardPressInfo;
- (id)lastPostedEventForUnitTesting;
- (id)lastScreenChangeTime;
- (id)phoneticStringForCharacter:(id)a3 andVoiceIdentifier:(id)a4;
- (id)punctuationGroupForUUID:(id)a3;
- (id)punctuationGroupsUpdatedHandler;
- (id)selectedBrailleGesturesInputTable:(id)a3;
- (id)testingEventListener;
- (int)_callCenterQueue_currentCallState;
- (int)currentCallState;
- (int)currentCallStateForUnitTests;
- (int64_t)activeBrailleInputPreference;
- (int64_t)activeBrailleOutputPreference;
- (int64_t)applicationOrientation;
- (int64_t)bannerNotificationsOutput;
- (int64_t)brailleInputTypingMode;
- (int64_t)containerOutputFeedback;
- (int64_t)deviceOrientation;
- (int64_t)emojiFeedback;
- (int64_t)moreContentOutputFeedback;
- (int64_t)navigateImagesOption;
- (int64_t)navigationDirection;
- (int64_t)notificationsWhenLockedOutput;
- (int64_t)numberFeedback;
- (int64_t)rotorType;
- (int64_t)suppressSelectionChangeNotificationCount;
- (int64_t)suppressSelectionChangeNotificationSpeechOutputCount;
- (int64_t)suppressValueChangeNotificationCount;
- (int64_t)systemVisualizationState;
- (int64_t)tvInteractionMode;
- (int64_t)typingMode;
- (unint64_t)customContentImportance;
- (unint64_t)fingerCount;
- (void)_activeAudioRouteChanged:(id)a3;
- (void)_applyVoiceOverMigrations;
- (void)_archerNotifyUserOfNavigationChanges;
- (void)_attemptRecoveryFromCrashloopDueToVoiceMemoryPressure;
- (void)_callStatusChanged:(id)a3;
- (void)_checkVoiceOverWasConfirmed;
- (void)_crystalBMigrateDuckingVolumePreferences;
- (void)_handleSystemMuteKey:(id)a3;
- (void)_initialize;
- (void)_initializeCaptionModel;
- (void)_languageChanged;
- (void)_languageChangedInBuddy;
- (void)_localeChanged:(id)a3;
- (void)_migratePreferencesIfNeeded;
- (void)_postKeyboardEvent:(id)a3 modifiers:(id)a4 keyCode:(id)a5;
- (void)_postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(id)a5 keyCode:(id)a6;
- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 eventType:(unsigned int)a7;
- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 isKeyDown:(BOOL)a7;
- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 modifierState:(unsigned int)a4 isKeyDown:(BOOL)a5;
- (void)_postKeyboardEventsForModifiers:(unsigned int)a3 isKeyDown:(BOOL)a4;
- (void)_postNextLanguageEvent;
- (void)_preferenceUseDigitalCrownNavigationChanged;
- (void)_preferencesActivitiesChanged;
- (void)_preferencesAlwaysUseNemethForMathChange;
- (void)_preferencesCaptionPanelChanged;
- (void)_preferencesNavigateImagesOptionChange;
- (void)_preferencesScreenCurtainChanged:(id)a3;
- (void)_preferencesSelectedActivityChanged;
- (void)_preferencesSelectedLanguageChanged;
- (void)_preferencesSpeakHintsChange;
- (void)_preferencesSpeakNotifications;
- (void)_preferencesSpeakingRateInRotorChanged;
- (void)_preferencesSpeechRateChange;
- (void)_preferencesTypingModeChanged:(id)a3;
- (void)_preferencesTypingPitchChange;
- (void)_registerForPreferenceChanges;
- (void)_registerWithSpringBoard;
- (void)_registerWithSystem;
- (void)_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:(id)a3 preferredFallbackLanguage:(id)a4;
- (void)_resetOrientationAndAnnounce:(BOOL)a3 updateApplication:(BOOL)a4;
- (void)_screenChange:(id)a3;
- (void)_selectedBrailleGesturesInputTableChanged;
- (void)_selectedBrailleInputTableChanged;
- (void)_selectedBrailleTableChanged;
- (void)_selfDestruct;
- (void)_sendGreetingMessage;
- (void)_setDeviceOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4 updateApplication:(BOOL)a5;
- (void)_setUSBRMPreferenceDisabled;
- (void)_showConfirmPanel;
- (void)_showVOTNoHomeButtonGestureAlert;
- (void)_speakCorrectionsChanged;
- (void)_stopRunLoop;
- (void)_temporarilyChangeQuickNav:(id)a3;
- (void)_testFetchWebElementRects;
- (void)_tigrisMigrateLanguageRotors;
- (void)_updateScreenCurtainEnabled:(BOOL)a3;
- (void)_voiceOverTouchEnabledChange:(__CFString *)a3;
- (void)_voiceOverUsageConfirmed;
- (void)_yukonMigrateLanguageRotors;
- (void)addMisspellingsForString:(id)a3;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetController:(id)a3 didUpdateCatalogForPolicy:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)cancelTapAndHoldMode;
- (void)currentElementDidUpdate:(id)a3;
- (void)dealloc;
- (void)dispatchCommand:(id)a3;
- (void)dispatchCommand:(id)a3 bypassGesturedInput:(BOOL)a4;
- (void)handleAppleTVRemoteEvent:(id)a3 eventOrigin:(int64_t)a4 isRTL:(BOOL)a5;
- (void)handleBluetoothBrailleDisplayConnected;
- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4;
- (void)handleLockButtonPress:(id)a3;
- (void)handleMediaKeyPress:(id)a3;
- (void)handleMenuButtonPress:(id)a3;
- (void)handleOrientationChanged;
- (void)handlePlayPauseKeyPress:(id)a3;
- (void)handleProximityEvent:(id)a3;
- (void)handleReturnToSpringBoard;
- (void)handleSetForcedOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4;
- (void)handleSystemWideServerDied;
- (void)handleTurnOffSoundAndCurtainEvent:(id)a3;
- (void)handleUSBMFiBrailleDisplayConnected;
- (void)handleUnsetForcedOrientationAndAnnounce:(BOOL)a3;
- (void)handleVolumeButtonPress:(id)a3;
- (void)loadUIKit;
- (void)notePostedEventForUnitTesting:(id)a3;
- (void)outputRequestFinished:(id)a3;
- (void)performEjectButtonPress;
- (void)performHomeButtonPress;
- (void)performNextLanguageButtonPress;
- (void)performVolumeDownButtonPress;
- (void)performVolumeUpButtonPress;
- (void)postKeyboardEvent:(BOOL)a3 modifiers:(unsigned int)a4 keyCode:(unsigned __int16)a5;
- (void)postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(unsigned int)a5 keyCode:(unsigned __int16)a6;
- (void)preferencesBrailleLanguageRotorItemsChanged:(id)a3;
- (void)preferencesKeyboardClickStatusChange:(id)a3;
- (void)preferencesLanguageRotorItemsChanged:(id)a3;
- (void)punctuationGroupsChanged:(id)a3;
- (void)refreshBraille:(BOOL)a3 rotorSelection:(id)a4;
- (void)resetOrientation;
- (void)resetSystemBatteryLowState;
- (void)rotateDeviceOrientation:(BOOL)a3;
- (void)run;
- (void)screenLockOccurred;
- (void)setAccessoryShutdownInProgress:(BOOL)a3;
- (void)setActivities:(id)a3;
- (void)setAdditionalLanguageRotorItem:(id)a3;
- (void)setAllowSingleLetterSearching:(BOOL)a3;
- (void)setAudioDestinationRequestExternal:(BOOL)a3;
- (void)setBannerNotificationsOutput:(int64_t)a3;
- (void)setBrailleAlertsEnabled:(BOOL)a3;
- (void)setBrailleFormattingEnabled:(BOOL)a3;
- (void)setButtonIconDetectionEnabled:(BOOL)a3;
- (void)setCaptionPanelEnabled:(BOOL)a3;
- (void)setCharacterSoundMap:(id)a3;
- (void)setContainerOutputFeedback:(int64_t)a3;
- (void)setCurrentCallStateForUnitTests:(int)a3;
- (void)setCustomContentImportance:(unint64_t)a3;
- (void)setDisableVoiceOverSettingOnStop:(BOOL)a3;
- (void)setDisplayManager:(id)a3;
- (void)setDuckingTemporarilyDisabled:(BOOL)a3;
- (void)setElementManager:(id)a3;
- (void)setEmojiFeedback:(int64_t)a3;
- (void)setHintsEnabled:(BOOL)a3;
- (void)setImageCaptioningDisabledApps:(id)a3;
- (void)setImageCaptionsEnabled:(BOOL)a3;
- (void)setInPerformanceTestMode:(BOOL)a3;
- (void)setInUnitTestMode:(BOOL)a3;
- (void)setIsOnenessActive:(BOOL)a3;
- (void)setIsRingerSwitchSilentForUnitTesting:(BOOL)a3;
- (void)setIsSiriListening:(BOOL)a3;
- (void)setIsSiriTalking:(BOOL)a3;
- (void)setIsSystemBatteryLow:(BOOL)a3;
- (void)setLargeCursorEnabled:(BOOL)a3;
- (void)setLastHomeButtonPress:(double)a3;
- (void)setLastKeyboardKeyPress:(double)a3;
- (void)setLastLockButtonPress:(double)a3;
- (void)setLastSoundMuteToggleTime:(double)a3;
- (void)setLastSpeechMuteToggleTime:(double)a3;
- (void)setLastTelephonyCallActive:(double)a3;
- (void)setManagedConfigurationQueue:(id)a3;
- (void)setMoreContentOutputFeedback:(int64_t)a3;
- (void)setNavigateImagesOption:(int64_t)a3;
- (void)setNavigationDirection:(int64_t)a3;
- (void)setNotificationsWhenLockedOutput:(int64_t)a3;
- (void)setNumberFeedback:(int64_t)a3;
- (void)setOutputDisabled:(BOOL)a3;
- (void)setOverridePropertiesForTesting:(BOOL)a3;
- (void)setPauseSpeechAndHaptics:(BOOL)a3;
- (void)setPerkinsChordKeyboardInputEnabled:(BOOL)a3;
- (void)setPerkinsKeyboardInputEnabled:(BOOL)a3;
- (void)setPlayKeyboardClicksOnHWInput:(BOOL)a3;
- (void)setPreviousRotorVoiceIdentifier:(id)a3;
- (void)setPunctuationGroupsUpdatedHandler:(id)a3;
- (void)setReachabilityActive:(BOOL)a3;
- (void)setReachabilityIdentifier:(id)a3;
- (void)setReachabilityOffset:(double)a3;
- (void)setRotorManager:(id)a3;
- (void)setRotorType:(int64_t)a3;
- (void)setScreenCurtainEnabled:(BOOL)a3;
- (void)setScreenCurtainSuspended:(BOOL)a3;
- (void)setScreenOn:(BOOL)a3 silently:(BOOL)a4;
- (void)setScreenOnTime:(double)a3;
- (void)setSelectedActivity:(id)a3;
- (void)setSelectedBrailleGesturesInputTable:(id)a3;
- (void)setSelectedBrailleInputTable:(id)a3;
- (void)setSelectedBrailleTable:(id)a3;
- (void)setSelectedLanguage:(id)a3;
- (void)setSoundEffectsEnabled:(BOOL)a3;
- (void)setSoundMuted:(BOOL)a3;
- (void)setSpeakingRateInRotor:(BOOL)a3;
- (void)setSpeechLogging:(BOOL)a3;
- (void)setSpeechMuted:(BOOL)a3;
- (void)setSupportsHomeGestures:(BOOL)a3;
- (void)setSuppressSelectionChangeNotificationCount:(int64_t)a3;
- (void)setSuppressSelectionChangeNotificationSpeechOutputCount:(int64_t)a3;
- (void)setSuppressValueChangeNotificationCount:(int64_t)a3;
- (void)setSystemVisualizationState:(int64_t)a3;
- (void)setSystemVolumeControlsAvailablity:(BOOL)a3;
- (void)setTelephonyIsActive:(BOOL)a3;
- (void)setTestingEventListener:(id)a3;
- (void)setTextDetectionEnabled:(BOOL)a3;
- (void)setTvInteractionMode:(int64_t)a3;
- (void)setTvInteractionModeWithoutSaving:(int64_t)a3;
- (void)setTypingMode:(int64_t)a3;
- (void)setTypingPitchChangeEnabled:(BOOL)a3;
- (void)setUnitTestDelegate:(id)a3;
- (void)setUnitTestSpeechRate:(id)a3;
- (void)setUnitTestSystemSpokenLanguage:(id)a3;
- (void)setUpdateRotorWithElement:(BOOL)a3;
- (void)setUseDigitalCrownNavigationEnabled:(BOOL)a3;
- (void)setUseRingerSwitchForNotificationOutput:(BOOL)a3;
- (void)setUserCommandManager:(id)a3;
- (void)setUserRecentlyUnlockedDeviceForUnitTesting:(BOOL)a3;
- (void)setUserUnlockedDeviceForUnitTesting:(BOOL)a3;
- (void)setVisionEngine:(id)a3;
- (void)setVoiceOverIsIdle:(BOOL)a3;
- (void)setVoiceOverMuted:(BOOL)a3;
- (void)setVoiceOverMuted:(BOOL)a3 sendRequest:(BOOL)a4;
- (void)setVotSettings:(id)a3;
- (void)setVotTransaction:(id)a3;
- (void)setWasEnabledThroughAccessory:(BOOL)a3;
- (void)setWebsiteLanguageMappingOverrides:(id)a3;
- (void)softwareKeyboardManager:(id)a3 didSetHardwareKeyboardAttached:(BOOL)a4;
- (void)softwareKeyboardManagerDidChangeHardwareKeyboardAttached:(id)a3;
- (void)softwareKeyboardManagerWillUpdateKeyboardState:(id)a3;
- (void)startTapAndHoldMode:(BOOL)a3;
- (void)stop:(int)a3;
- (void)systemSpokenLanguageChanged:(id)a3;
- (void)temporarilyChangeQuickNavState:(BOOL)a3;
- (void)unitTestSetBrailleRotorItems:(id)a3;
- (void)unmuteEligibleEventOccured;
- (void)updateSelectedLanguage;
- (void)userInteractedWithDevice;
@end

@implementation VOTWorkspace

+ (id)sharedWorkspace
{
  return (id)VOTSharedWorkspace;
}

- (VOTWorkspace)init
{
  v2 = self;
  if (VOTSharedWorkspace)
  {
    v3 = (VOTWorkspace *)(id)VOTSharedWorkspace;
    goto LABEL_19;
  }

  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___VOTWorkspace;
  v4 = -[VOTWorkspace init](&v56, "init");
  v2 = v4;
  if (!v4)
  {
LABEL_18:
    v3 = 0LL;
    goto LABEL_19;
  }

  if (!-[VOTWorkspace isAccessibilityEnabled](v4, "isAccessibilityEnabled"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
    unsigned __int8 v45 = [v44 ignoreLogging];

    if ((v45 & 1) == 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
      uint64_t v47 = AXLoggerForFacility(v46);
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);

      os_log_type_t v49 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = AXColorizeFormatLog( 1LL,  @"VoiceOverTouch exiting because accessibility is not enabled. To enable do this: 'defaults write com.apple.Accessibility AccessibilityEnabled true'");
        v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        uint64_t v52 = _AXStringForArgs(v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138543362;
          v58 = v53;
          _os_log_impl((void *)&_mh_execute_header, v48, v49, "%{public}@", buf, 0xCu);
        }
      }
    }

    goto LABEL_18;
  }

  objc_storeStrong((id *)&VOTSharedWorkspace, v2);
  uint64_t v5 = AXDevicePrimeDisplayManager(-[VOTWorkspace setDisableVoiceOverSettingOnStop:](v2, "setDisableVoiceOverSettingOnStop:", 1LL));
  uint64_t v7 = _AXSVoiceOverTouchEnabled(v5, v6);
  uint64_t v9 = _AXSVoiceOverTouchUsageConfirmed(v7, v8);
  _AXSApplicationAccessibilityEnabled(v9);
  int64x2_t v55 = vdupq_n_s64(0xC1E6CEAF20000000LL);
  *(int64x2_t *)&v2->_lastLockButtonPress = v55;
  v2->_lastKeyboardKeyPress = -3061152000.0;
  v2->_lastDeviceInteractionEvent = CFAbsoluteTimeGetCurrent();
  v2->_lastUnmuteEvent = CFAbsoluteTimeGetCurrent();
  *(int64x2_t *)&v2->_screenOnTime = v55;
  v2->_lastPowerCheck = -3061152000.0;
  postKeyThreadKey = v2->_postKeyThreadKey;
  v2->_postKeyThreadKey = (NSString *)@"VOTPostKey";

  v11 = objc_alloc_init(&OBJC_CLASS___NSLock);
  systemLangaugeLock = v2->_systemLangaugeLock;
  v2->_systemLangaugeLock = v11;

  v2->_forcedOrientation = 0LL;
  dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
  dispatch_queue_t v15 = dispatch_queue_create("voiceover.keyposting.workspace", v14);
  keyPostingQueue = v2->_keyPostingQueue;
  v2->_keyPostingQueue = (OS_dispatch_queue *)v15;

  dispatch_queue_t v17 = dispatch_queue_create("voiceover.avaccessqueue.workspace", 0LL);
  avAccessQueue = v2->_avAccessQueue;
  v2->_avAccessQueue = (OS_dispatch_queue *)v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 preferenceForKey:@"WebsiteLanguageMappingOverride"]);

  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
  if ((objc_opt_isKindOfClass(v20, v22) & 1) == 0)
  {
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));

    v20 = (void *)v23;
  }

  id v24 = objc_msgSend(v20, "mutableCopy", *(_OWORD *)&v55);
  -[VOTWorkspace setWebsiteLanguageMappingOverrides:](v2, "setWebsiteLanguageMappingOverrides:", v24);

  v25 = objc_alloc_init(&OBJC_CLASS___AXCharacterSoundMap);
  characterSoundMap = v2->_characterSoundMap;
  v2->_characterSoundMap = v25;

  uint64_t v27 = AXLogSpeechAssetDownload();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace _assetUpdaterClient](v2, "_assetUpdaterClient"));
    *(_DWORD *)buf = 138477827;
    v58 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Retrieve cloud data: %{private}@", buf, 0xCu);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace _assetUpdaterClient](v2, "_assetUpdaterClient"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
  [v30 sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:3 targetAccessQueue:v31 completion:0];

  if ((AXDeviceIsAudioAccessory(v32, v33) & 1) == 0)
  {
    v34 = objc_alloc_init(&OBJC_CLASS___VOTVisionEngine);
    -[VOTWorkspace setVisionEngine:](v2, "setVisionEngine:", v34);
  }

  v35 = (UITextChecker *)-[UITextChecker _initWithAsynchronousLoading:]( objc_alloc(&OBJC_CLASS___UITextChecker),  "_initWithAsynchronousLoading:",  1LL);
  textChecker = v2->_textChecker;
  v2->_textChecker = v35;

  -[VOTWorkspace _applyVoiceOverMigrations](v2, "_applyVoiceOverMigrations");
  dispatch_queue_t v37 = dispatch_queue_create("com.apple.accessibility.VOT.MC", 0LL);
  managedConfigurationQueue = v2->_managedConfigurationQueue;
  v2->_managedConfigurationQueue = (OS_dispatch_queue *)v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 imageCaptioningDisabledApps]);
  -[VOTWorkspace setImageCaptioningDisabledApps:](v2, "setImageCaptioningDisabledApps:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v41 addObserver:v2 selector:"_screenChange:" name:@"UpdateElement" object:0];

  v42 = objc_alloc_init(&OBJC_CLASS____TtC3vot11VOTSettings);
  votSettings = v2->_votSettings;
  v2->_votSettings = v42;

  v2 = v2;
  v3 = v2;
LABEL_19:

  return v3;
}

- (void)_callStatusChanged:(id)a3
{
  unsigned int v4 = -[VOTWorkspace telephonyIsActive](self, "telephonyIsActive", a3);
  -[VOTWorkspace setTelephonyIsActive:]( self,  "setTelephonyIsActive:",  objc_msgSend((id)VOTSharedWorkspace, "_callCenterQueue_currentCallState") != 0);
  id v5 = (id)-[VOTWorkspace telephonyIsActive](self, "telephonyIsActive");
  if (v4 != (_DWORD)v5)
  {
    id v5 = (id)-[VOTWorkspace telephonyIsActive](self, "telephonyIsActive");
  }

  uint64_t v6 = VOTLogCommon(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = [(id)VOTSharedWorkspace telephonyIsActive];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Call status changed, updating call active status: %d",  (uint8_t *)v9,  8u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v8 callStatusChanged];
}

- (VOTEventFactory)eventFactory
{
  return self->_eventFactory;
}

- (void)_applyVoiceOverMigrations
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003DA6C;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_crystalBMigrateDuckingVolumePreferences
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"_AccessibilityMigration__DuckingVolumePrefs_18.2.1"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v5 voiceOverMediaDuckingAmount];
    double v7 = v6;

    if (v7 < 0.25)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v8 setVoiceOverMediaDuckingAmount:0.800000012];
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v9 voiceOverMediaDuckingAmount];
    double v11 = v10;

    if (v11 > 1.0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v12 voiceOverMediaDuckingAmount];
      double v14 = 2.0 - v13;
      dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v15 setVoiceOverMediaDuckingAmount:v14];
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v16 voiceOverEffectiveSpeakingVolume];
    float v18 = v17;

    if (v18 == 0.0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      LODWORD(v20) = 1.0;
      [v19 setVoiceOverEffectiveSpeakingVolume:v20];
    }

    id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v21 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration__DuckingVolumePrefs_18.2.1"];
  }

- (void)setHintsEnabled:(BOOL)a3
{
  self->_hintsEnabled = a3;
}

- (BOOL)hintsEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 hints]);
  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 hints]);
    unsigned __int8 hintsEnabled = [v7 BOOLValue];
  }

  else
  {
    unsigned __int8 hintsEnabled = self->_hintsEnabled;
  }

  return hintsEnabled;
}

- (BOOL)brailleFormattingEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleFormatting]);
  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleFormatting]);
    unsigned __int8 v8 = [v7 BOOLValue];
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v8 = [v7 voiceOverBrailleFormattingEnabled];
  }

  BOOL v9 = v8;

  return v9;
}

- (int64_t)containerOutputFeedback
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerFeedback]);
  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 containerFeedback]);
    id containerOutputFeedback = [v7 integerValue];
  }

  else
  {
    id containerOutputFeedback = (id)self->_containerOutputFeedback;
  }

  return (int64_t)containerOutputFeedback;
}

- (int64_t)activeBrailleInputPreference
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleInput]);
  if (v6)
  {
    uint64_t v7 = VOTLogActivities();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleInput]);
      int v14 = 138412290;
      dispatch_queue_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Using activity braille input: %@",  (uint8_t *)&v14,  0xCu);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleInput]);
    id v11 = [v10 integerValue];
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v11 = [v10 voiceOverTouchBrailleDisplayInputMode];
  }

  int64_t v12 = (int64_t)v11;

  return v12;
}

- (int64_t)activeBrailleOutputPreference
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleOutput]);
  if (v6)
  {
    uint64_t v7 = VOTLogActivities();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleOutput]);
      int v14 = 138412290;
      dispatch_queue_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Using activity braille output: %@",  (uint8_t *)&v14,  0xCu);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleOutput]);
    id v11 = [v10 integerValue];
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v11 = [v10 voiceOverTouchBrailleDisplayOutputMode];
  }

  int64_t v12 = (int64_t)v11;

  return v12;
}

- (BOOL)activeBrailleTextStatusCellPreference
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleStatusCellText]);
  if (v6)
  {
    uint64_t v7 = VOTLogActivities();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleStatusCellText]);
      int v14 = 138412290;
      dispatch_queue_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Using activity braille text status cell: %@",  (uint8_t *)&v14,  0xCu);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleStatusCellText]);
    unsigned __int8 v11 = [v10 BOOLValue];
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v11 = [v10 voiceOverTouchBrailleShowTextStyleStatus];
  }

  BOOL v12 = v11;

  return v12;
}

- (BOOL)brailleAlertsEnabled
{
  return -[VOTWorkspace activeBrailleAlertsPreference](self, "activeBrailleAlertsPreference");
}

- (BOOL)activeBrailleAlertsPreference
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleAlerts]);
  if (v6)
  {
    uint64_t v7 = VOTLogActivities();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleAlerts]);
      int v13 = 138412290;
      int v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Using activity braille alerts: %@",  (uint8_t *)&v13,  0xCu);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleAlerts]);
    unsigned __int8 brailleAlertsEnabled = [v10 BOOLValue];
  }

  else
  {
    unsigned __int8 brailleAlertsEnabled = self->_brailleAlertsEnabled;
  }

  return brailleAlertsEnabled;
}

- (BOOL)activeBrailleGeneralStatusCellPreference
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleStatusCellGeneral]);
  if (v6)
  {
    uint64_t v7 = VOTLogActivities();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleStatusCellGeneral]);
      int v14 = 138412290;
      dispatch_queue_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Using activity braille general status cell: %@",  (uint8_t *)&v14,  0xCu);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleStatusCellGeneral]);
    unsigned __int8 v11 = [v10 BOOLValue];
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v11 = [v10 voiceOverTouchBrailleShowGeneralStatus];
  }

  BOOL v12 = v11;

  return v12;
}

- (double)activeBrailleAutoAdvanceDuration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleAutoAdvanceDuration]);
  if (v6)
  {
    uint64_t v7 = VOTLogActivities();
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleAutoAdvanceDuration]);
      int v14 = 138412290;
      dispatch_queue_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Using activity braille auto advance duration: %@",  (uint8_t *)&v14,  0xCu);
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleAutoAdvanceDuration]);
    [v10 doubleValue];
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v10 voiceOverBrailleAutoAdvanceDuration];
  }

  double v12 = v11;

  return v12;
}

- (void)_screenChange:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 determineActivityForElement:v5]);

  if (v6) {
    -[VOTWorkspace _updateActivityListeners](self, "_updateActivityListeners");
  }
}

- (void)_tigrisMigrateLanguageRotors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"_AccessibilityMigration_MigrateLanguageRotors_11.0"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v5 = (id)_AXSVoiceOverTouchCopyLanguageRotorItems(1LL);
    id v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v34;
      uint64_t v9 = AXSpeechSourceKeyVoiceOver;
      uint64_t v30 = *(void *)v34;
      id v31 = v5;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          double v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v33 + 1) + 8 * (void)i),  "objectForKey:",  @"RotorItem",  v28,  v29));
          uint64_t v12 = AXLanguageConvertToCanonicalForm(v11);
          int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          char v32 = 0;
          int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
          dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 speechVoiceIdentifierForLanguage:v13 sourceKey:v9 exists:&v32]);

          if (!v32)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
            [v16 setSpeechVoiceIdentifier:v15 forLanguage:v13 sourceKey:v9];

            float v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemDataMigrator sharedInstance]( &OBJC_CLASS___AXSubsystemDataMigrator,  "sharedInstance"));
            unsigned __int8 v18 = [v17 ignoreLogging];

            if ((v18 & 1) == 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemDataMigrator identifier](&OBJC_CLASS___AXSubsystemDataMigrator, "identifier"));
              uint64_t v20 = AXLoggerForFacility(v19);
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

              os_log_type_t v22 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v21, v22))
              {
                uint64_t v23 = AXColorizeFormatLog( 1LL,  @"Setting the default voice for this language rotor %{public}@ to %{public}@");
                id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
                v28 = v13;
                v29 = v15;
                uint64_t v25 = _AXStringForArgs(v24);
                v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v21, v22))
                {
                  *(_DWORD *)buf = 138543362;
                  v38 = v26;
                  _os_log_impl((void *)&_mh_execute_header, v21, v22, "%{public}@", buf, 0xCu);
                }
              }

              uint64_t v8 = v30;
              id v5 = v31;
            }
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }

      while (v7);
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v27 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateLanguageRotors_11.0"];
  }

- (void)_yukonMigrateLanguageRotors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"_AccessibilityMigration_MigrateLanguageRotors_13.0"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    char v20 = 0;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    uint64_t v6 = AXSpeechSourceKeyVoiceOver;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 speechVoiceIdentifierForLanguage:@"en-IN" sourceKey:AXSpeechSourceKeyVoiceOver exists:&v20]);

    if (!v20)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [(id)v8 setSpeechVoiceIdentifier:v7 forLanguage:@"en-IN" sourceKey:v6];

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemDataMigrator sharedInstance](&OBJC_CLASS___AXSubsystemDataMigrator, "sharedInstance"));
      LOBYTE(v8) = [v9 ignoreLogging];

      if ((v8 & 1) == 0)
      {
        double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemDataMigrator identifier](&OBJC_CLASS___AXSubsystemDataMigrator, "identifier"));
        uint64_t v11 = AXLoggerForFacility(v10);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);

        os_log_type_t v13 = AXOSLogLevelFromAXLogLevel(1LL);
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = AXColorizeFormatLog(1LL, @"Setting the default voice for this language rotor en-IN to %{public}@");
          dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v19 = v7;
          uint64_t v16 = _AXStringForArgs(v15);
          float v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v12, v13))
          {
            *(_DWORD *)buf = 138543362;
            os_log_type_t v22 = v17;
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}@", buf, 0xCu);
          }
        }
      }
    }

    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", v19));
    [v18 setObject:&__kCFBooleanTrue forKey:@"_AccessibilityMigration_MigrateLanguageRotors_13.0"];
  }

- (void)_archerNotifyUserOfNavigationChanges
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v4 = [v3 BOOLForKey:@"_AccessibilityMigration_NotifyUserOfArcherNavigationChanges_14.0"];

  if ((v4 & 1) == 0)
  {
    -[VOTWorkspace setTvInteractionMode:](self, "setTvInteractionMode:", 1LL);
    id v5 = (const __CFString *)sub_10004A988(off_1001AC148, @"navigation.updates.alert.title", 0LL);
    uint64_t v6 = (const __CFString *)sub_10004A988(off_1001AC148, @"navigation.updates.alert.body", 0LL);
    CFUserNotificationDisplayNotice(0.0, 0LL, 0LL, 0LL, 0LL, v5, v6, 0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v7 setBool:1 forKey:@"_AccessibilityMigration_NotifyUserOfArcherNavigationChanges_14.0"];
  }

- (id)_assetUpdaterClient
{
  if (qword_1001ACE40 != -1) {
    dispatch_once(&qword_1001ACE40, &stru_100177808);
  }
  return (id)qword_1001ACE38;
}

- (BOOL)allowSingleLetterSearching
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 voiceOverTouchSingleLetterQuickNavEnabled];

  return v3;
}

- (void)setAllowSingleLetterSearching:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 setVoiceOverTouchSingleLetterQuickNavEnabled:v3];
}

- (void)setTvInteractionModeWithoutSaving:(int64_t)a3
{
  self->_tvInteractionMode = a3;
}

- (void)setTvInteractionMode:(int64_t)a3
{
  self->_tvInteractionMode = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 setVoiceOverPreferredTVInteractionMode:a3];
}

- (int64_t)tvInteractionMode
{
  return self->_tvInteractionMode;
}

- (BOOL)perkinsKeyboardInputEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 voiceOverTouchPerkinsKeyboardInputEnabled];

  return v3;
}

- (void)setPerkinsKeyboardInputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 setVoiceOverTouchPerkinsKeyboardInputEnabled:v3];
}

- (BOOL)perkinsChordKeyboardInputEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 voiceOverTouchPerkinsChordKeyboardInputEnabled];

  return v3;
}

- (void)setPerkinsChordKeyboardInputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 setVoiceOverTouchPerkinsChordKeyboardInputEnabled:v3];
}

- (void)softwareKeyboardManagerWillUpdateKeyboardState:(id)a3
{
  int64_t triggeredKBAttachState = self->_triggeredKBAttachState;
  BOOL v5 = triggeredKBAttachState < 1;
  int64_t v6 = triggeredKBAttachState - 1;
  if (!v5)
  {
    self->_int64_t triggeredKBAttachState = v6;
    uint64_t v7 = VOTLogKeyboard();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int64_t v9 = self->_triggeredKBAttachState;
      int v24 = 134217984;
      int64_t v25 = v9;
      double v10 = "Triggered KB attach state count is: %ld";
      uint64_t v11 = v8;
      uint32_t v12 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v24, v12);
      goto LABEL_13;
    }

    goto LABEL_13;
  }

  os_log_type_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCrashManager sharedInstance](&OBJC_CLASS___VOTCrashManager, "sharedInstance", a3));
  if (![v13 didStartFromCrashState])
  {

    goto LABEL_9;
  }

  BOOL originalKBAttachedStateIsValid = self->_originalKBAttachedStateIsValid;

  if (originalKBAttachedStateIsValid)
  {
LABEL_9:
    char v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace softwareKeyboardManager](self, "softwareKeyboardManager"));
    self->_BOOL originalKBAttachedState = [v20 isHardwareKeyboardAttached];

    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_originalKBAttachedState));
    [v18 setPreference:v21 forKey:@"kVOTOriginaKBAttachedKey"];

    goto LABEL_10;
  }

  dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 preferenceForKey:@"kVOTOriginaKBAttachedKey"]);
  self->_BOOL originalKBAttachedState = [v16 BOOLValue];

  uint64_t v17 = VOTLogKeyboard();
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
  {
    BOOL originalKBAttachedState = self->_originalKBAttachedState;
    int v24 = 67109120;
    LODWORD(v25) = originalKBAttachedState;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_INFO,  "Have to use what we stored for original KB state: %d",  (uint8_t *)&v24,  8u);
  }

- (void)softwareKeyboardManager:(id)a3 didSetHardwareKeyboardAttached:(BOOL)a4
{
  self->_isPostingKeyboardEvents = a4;
}

- (void)softwareKeyboardManagerDidChangeHardwareKeyboardAttached:(id)a3
{
}

- (BOOL)softwareKeyboardManagerShouldSetHardwareKeyboardAttached:(id)a3 hardwareKeyboardIsCurrentlyAttached:(BOOL)a4 newHardwareKeyboardAttachedValue:(BOOL *)a5
{
  BOOL originalKBAttachedState = self->_originalKBAttachedState;
  if (originalKBAttachedState != a4) {
    *a5 = originalKBAttachedState;
  }
  return originalKBAttachedState != a4;
}

- (BOOL)usesDisplayManager
{
  return AXDeviceIsAudioAccessory(self, a2) ^ 1;
}

- (void)_attemptRecoveryFromCrashloopDueToVoiceMemoryPressure
{
  uint64_t v3 = VOTLogCommon(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint32_t v12 = &off_100187550;
    __int16 v13 = 2112;
    uint64_t v14 = &off_100187410;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "VoiceOver appears to be crashlooping (crashcount=%@ within %@s). Switching to the default voice to reduce memory pressure",  (uint8_t *)&v11,  0x16u);
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
  if (v5)
  {
    -[VOTWorkspace _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:]( self,  "_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:",  v5,  v5);
    uint64_t v6 = AXLanguageCanonicalFormToGeneralLanguage(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7) {
      -[VOTWorkspace _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:]( self,  "_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:",  v7,  v5);
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  if (v8)
  {
    -[VOTWorkspace _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:]( self,  "_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:",  v8,  v8);
    uint64_t v9 = AXLanguageCanonicalFormToGeneralLanguage(v8);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10) {
      -[VOTWorkspace _replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:]( self,  "_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:preferredFallbackLanguage:",  v10,  v8);
    }
  }
}

- (void)_replaceHighMemoryVoiceIDWithDefaultVoiceIDForLanguage:(id)a3 preferredFallbackLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = VOTLogCommon(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v5;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Check if we should replace hi-memory voice with default. Replacee:%@. Preferred:%@",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  char v26 = 0;
  uint64_t v11 = AXSpeechSourceKeyVoiceOver;
  uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 speechVoiceIdentifierForLanguage:v5 sourceKey:AXSpeechSourceKeyVoiceOver exists:&v26]);
  uint64_t v13 = VOTLogCommon(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Current voiceID for language to replace: %@",  buf,  0xCu);
  }

  if (v12)
  {
    dispatch_queue_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 speechVoiceWithVoiceId:v12]);
    id v16 = [v15 footprint];
    if (v16 != (id)4)
    {
      id v16 = [v15 footprint];
      if (v16 != (id)5) {
        goto LABEL_19;
      }
    }

    uint64_t v17 = VOTLogCommon(v16);
    unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Current voice appears to be high-memory: %@",  buf,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultVoiceForLanguage:v6]);
    char v20 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
    uint64_t v21 = VOTLogCommon(v20);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Default voice for preferred fallback language: %@",  buf,  0xCu);
    }

    if (v20)
    {
      BOOL v23 = v19;
    }

    else
    {
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultVoiceForLanguage:v5]);

      char v20 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
      uint64_t v24 = VOTLogCommon(v20);
      int64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Default voice for preferred fallback language was nil. Trying langaugeToReplace. Deafult voice: %@",  buf,  0xCu);
      }

      if (!v20) {
        goto LABEL_18;
      }
    }

    [v10 setSpeechVoiceIdentifier:v20 forLanguage:v5 sourceKey:v11];

LABEL_18:
LABEL_19:
  }
}

- (void)_initialize
{
  uint64_t v3 = _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage(1LL, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCrashManager sharedInstance](&OBJC_CLASS___VOTCrashManager, "sharedInstance"));
  [v5 handleStartUp];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  [v6 setPreference:&__kCFBooleanTrue forKey:@"VOTIsRunningKey"];

  GSInitialize();
  +[AXEventKeyInfoRepresentation prepareForKeycodeTranslation]( &OBJC_CLASS___AXEventKeyInfoRepresentation,  "prepareForKeycodeTranslation");
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___AXUISoftwareKeyboardManager);
  softwareKeyboardManager = self->_softwareKeyboardManager;
  self->_softwareKeyboardManager = v7;

  -[AXUISoftwareKeyboardManager setDelegate:](self->_softwareKeyboardManager, "setDelegate:", self);
  +[AXUIElement applyElementAttributeCacheScheme:](&OBJC_CLASS___AXUIElement, "applyElementAttributeCacheScheme:", 1LL);
  if (-[VOTWorkspace usesDisplayManager](self, "usesDisplayManager"))
  {
    id v9 = -[AXMDisplayManager initAndWaitForMainDisplayConfiguration]( objc_alloc(&OBJC_CLASS___AXMDisplayManager),  "initAndWaitForMainDisplayConfiguration");
    -[VOTWorkspace setDisplayManager:](self, "setDisplayManager:", v9);

    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace displayManager](self, "displayManager"));
    sub_10004A170(v10);

    double v11 = *(double *)&xmmword_1001AD170;
    if (*(double *)&xmmword_1001AD170 <= 0.0) {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTWorkspace.m",  1012LL,  "-[VOTWorkspace _initialize]",  @"VOT display info should be initialized by now");
    }
    uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", v11));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    id v14 =  [v12 addObserverForName:AXMDisplayManagerMainDisplayWasUpdatedNotification object:0 queue:v13 usingBlock:&stru_100177848];
  }

  id v15 = -[VOSCommandManager initPreferringUserProfile]( objc_alloc(&OBJC_CLASS___VOSCommandManager),  "initPreferringUserProfile");
  -[VOTWorkspace setUserCommandManager:](self, "setUserCommandManager:", v15);

  objc_initWeak(&location, self);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_100040278;
  v88[3] = &unk_100176F08;
  objc_copyWeak(&v89, &location);
  id v17 = objc_loadWeakRetained(&location);
  [v16 registerUpdateBlock:v88 forRetrieveSelector:"voiceOverCustomCommandProfile" withListener:v17];

  objc_destroyWeak(&v89);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000402BC,  @"DBSMagnifyModeDidChangeNotification",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  if (_AXSVoiceOverTouchEnabled(v19, v20) || self->_inUnitTestMode)
  {
    self->_orientation = 1LL;
    self->_applicationOrientation = 1LL;
    self->_screenOn = 1;
    id v21 = +[VOTSystemServerInstance serverInstance](&OBJC_CLASS___VOTSystemServerInstance, "serverInstance");
    -[VOTWorkspace updateSelectedLanguage](self, "updateSelectedLanguage");
    uint64_t v22 = (NSMutableDictionary *)[objc_allocWithZone(NSMutableDictionary) init];
    appCache = self->_appCache;
    self->_appCache = v22;

    uint64_t v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    appCacheWithExactPID = self->_appCacheWithExactPID;
    self->_appCacheWithExactPID = v24;

    self->_appCacheLock._os_unfair_lock_opaque = 0;
    sub_10004B730();
    sub_10004B79C();
    -[VOTWorkspace _migratePreferencesIfNeeded](self, "_migratePreferencesIfNeeded");
    -[VOTWorkspace _registerForPreferenceChanges](self, "_registerForPreferenceChanges");
    char v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_textDetectionEnabled = [v26 voiceOverShouldSpeakDiscoveredText];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_buttonIconDetectionEnabled = [v27 voiceOverAutomaticButtonLabels];

    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_imageCaptionsEnabled = [v28 voiceOverImageCaptionsEnabled];

    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_customContentImportance = (unint64_t)[v29 voiceOverContentDescriptionLevel];

    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_id containerOutputFeedback = (int64_t)[v30 voiceOverContainerOutputFeedback];

    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_moreContentOutputFeedback = (int64_t)[v31 voiceOverMoreContentOutputFeedback];

    char v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_soundEffectsEnabled = [v32 voiceOverSoundEffectsEnabled];

    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_numberFeedback = (int64_t)[v33 voiceOverNumberFeedback];

    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_emojiFeedback = (int64_t)[v34 voiceOverVerbosityEmojiFeedback];

    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_unsigned __int8 brailleAlertsEnabled = [v35 voiceOverBrailleAlertsEnabled];

    self->_typingMode = _AXSVoiceOverTouchTypingMode(v36, v37, v38);
    -[VOTWorkspace systemSpokenLanguageChanged:](self, "systemSpokenLanguageChanged:", 0LL);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCrashManager sharedInstance](&OBJC_CLASS___VOTCrashManager, "sharedInstance"));
    BOOL v40 = (uint64_t)[v39 consecutiveCrashCount] > 8;

    if (v40) {
      -[VOTWorkspace _attemptRecoveryFromCrashloopDueToVoiceMemoryPressure]( self,  "_attemptRecoveryFromCrashloopDueToVoiceMemoryPressure");
    }
    id v41 = [objc_allocWithZone((Class)VOTElementManager) init];
    objc_storeStrong((id *)&self->_elementManager, v41);
    objc_storeStrong((id *)&self->_rotorManager, v41);
    objc_storeStrong((id *)&self->_directTouchManager, v41);
    v42 = (VOTKeyboardManager *)objc_claimAutoreleasedReturnValue( +[VOTKeyboardManager keyboardManager]( &OBJC_CLASS___VOTKeyboardManager,  "keyboardManager"));
    keyboardManager = self->_keyboardManager;
    self->_keyboardManager = v42;

    -[VOTKeyboardManager setCommandManager:](self->_keyboardManager, "setCommandManager:", self->_userCommandManager);
    v44 = (VOTEventFactory *)[objc_allocWithZone((Class)VOTEventFactory) init];
    eventFactory = self->_eventFactory;
    self->_eventFactory = v44;

    -[VOTEventFactory setElementManager:](self->_eventFactory, "setElementManager:", self->_elementManager);
    -[VOTEventFactory setRotorManager:](self->_eventFactory, "setRotorManager:", self->_rotorManager);
    -[VOTEventFactory setDirectTouchManager:](self->_eventFactory, "setDirectTouchManager:", self->_directTouchManager);
    -[VOTEventFactory setDelegate:](self->_eventFactory, "setDelegate:", self);
    self->_retryState.lastTime = -3061152000.0;
    self->_retryState.connected = 1;
    *(void *)&__int128 buf = kAXSVoiceOverTouchSpeakingRateChangedNotification;
    *((void *)&buf + 1) = kAXSVoiceOverTouchUsageConfirmedNotification;
    uint64_t v93 = kAXSVoiceOverTouchLanguageRotorChangedNotification;
    uint64_t v94 = kAXSVoiceOverTouchBrailleLanguageRotorChangedNotification;
    uint64_t v95 = kAXSVoiceOverTouchScreenCurtainNotification;
    v96 = @"com.apple.language.changed";
    v97 = @"com.apple.purplebuddy.LanguageResetReady";
    v98 = @"com.apple.preferences.sounds.changed";
    uint64_t v99 = kTTSPreferencesSpokenLanguageChangedNotification;
    v46 = CFNotificationCenterGetDarwinNotifyCenter();
    for (uint64_t i = 0LL; i != 72; i += 8LL)
      CFNotificationCenterAddObserver( v46,  self,  (CFNotificationCallback)sub_100040304,  *(CFStringRef *)((char *)&buf + i),  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver( LocalCenter,  self,  (CFNotificationCallback)sub_100040304,  kAXSVoiceOverTouchEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    os_log_type_t v49 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver( v49,  self,  (CFNotificationCallback)sub_100040304,  kAXSVoiceOverTouchTypingModeChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v51 = _AXSApplicationAccessibilityEnabled(v50);
    if (!(_DWORD)v51) {
      uint64_t v51 = _AXSApplicationAccessibilitySetEnabled(1LL);
    }
    -[VOTWorkspace setWasEnabledThroughAccessory:]( self,  "setWasEnabledThroughAccessory:",  _AXSVoiceOverTouchEnabledThroughAccessory(v51) != 0);
    AXPerformBlockOnMainThreadAfterDelay(&stru_100177868, v52, 1.0);
    id v53 = (id)-[VOTWorkspace voiceOverIsConfirmed](self, "voiceOverIsConfirmed");
    if ((v53 & 1) == 0)
    {
      -[VOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_checkVoiceOverWasConfirmed",  0LL,  30.0);
      id v53 = -[VOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_showConfirmPanel",  0LL,  0.5);
    }

    uint64_t HasHomeButton = AXDeviceHasHomeButton(v53);
    if ((_DWORD)HasHomeButton) {
      uint64_t IsPad = AXDeviceIsPad(HasHomeButton, v55);
    }
    else {
      uint64_t IsPad = 1LL;
    }
    if ((AXDeviceHasHomeButton(-[VOTWorkspace setSupportsHomeGestures:](self, "setSupportsHomeGestures:", IsPad)) & 1) == 0
      && !_AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription())
    {
      -[VOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_showVOTNoHomeButtonGestureAlert",  0LL,  0.5);
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
    uint64_t v91 = AVSystemController_ActiveAudioRouteDidChangeNotification;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL));
    [v58 setAttribute:v59 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    [v57 addObserver:self selector:"_activeAudioRouteChanged:" name:AVSystemController_ActiveAudioRouteDidChangeNotification object:v58];
    [v57 addObserver:self selector:"_localeChanged:" name:NSCurrentLocaleDidChangeNotification object:0];
    -[VOTWorkspace _activeAudioRouteChanged:](self, "_activeAudioRouteChanged:", 0LL);
    -[VOTWorkspace _preferencesTypingPitchChange](self, "_preferencesTypingPitchChange");
    -[VOTWorkspace preferencesLanguageRotorItemsChanged:](self, "preferencesLanguageRotorItemsChanged:", 0LL);
    -[VOTWorkspace preferencesBrailleLanguageRotorItemsChanged:]( self,  "preferencesBrailleLanguageRotorItemsChanged:",  0LL);
    -[VOTWorkspace _preferencesSpeakingRateInRotorChanged](self, "_preferencesSpeakingRateInRotorChanged");
    -[VOTWorkspace _preferencesAlwaysUseNemethForMathChange](self, "_preferencesAlwaysUseNemethForMathChange");
    -[VOTWorkspace _preferencesSpeakHintsChange](self, "_preferencesSpeakHintsChange");
    -[VOTWorkspace _preferencesNavigateImagesOptionChange](self, "_preferencesNavigateImagesOptionChange");
    -[VOTWorkspace _preferencesSpeakNotifications](self, "_preferencesSpeakNotifications");
    -[VOTWorkspace preferencesKeyboardClickStatusChange:](self, "preferencesKeyboardClickStatusChange:", 0LL);
    -[VOTWorkspace handleRingerSwitchSwitched:](self, "handleRingerSwitchSwitched:", 0LL);
    -[VOTWorkspace _preferencesActivitiesChanged](self, "_preferencesActivitiesChanged");
    -[VOTWorkspace _preferencesSelectedActivityChanged](self, "_preferencesSelectedActivityChanged");
    -[VOTWorkspace _preferencesCaptionPanelChanged](self, "_preferencesCaptionPanelChanged");
    -[VOTWorkspace _preferencesSelectedLanguageChanged](self, "_preferencesSelectedLanguageChanged");
    -[VOTWorkspace _selectedBrailleTableChanged](self, "_selectedBrailleTableChanged");
    -[VOTWorkspace _selectedBrailleInputTableChanged](self, "_selectedBrailleInputTableChanged");
    -[VOTWorkspace _selectedBrailleGesturesInputTableChanged](self, "_selectedBrailleGesturesInputTableChanged");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    -[VOTWorkspace setNavigationDirection:]( self,  "setNavigationDirection:",  [v60 voiceOverNavigationDirectionMode]);

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    -[VOTWorkspace setUpdateRotorWithElement:]( self,  "setUpdateRotorWithElement:",  [v61 voiceOverRotorUpdatesWithElement]);

    -[VOTWorkspace _sendGreetingMessage](self, "_sendGreetingMessage");
    -[VOTWorkspace _registerWithSystem](self, "_registerWithSystem");
    -[VOTWorkspace _registerForUserSwitches](self, "_registerForUserSwitches");
    v62 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v62, kAXSVoiceOverLaunchedNotification, 0LL, 0LL, 1u);
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    uint64_t v64 = AXSSVoiceOverPunctuationGroupsChangedNotification;
    [v63 addObserver:self selector:"punctuationGroupsChanged:" name:AXSSVoiceOverPunctuationGroupsChangedNotification object:0];

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v65 addObserver:self selector:"punctuationGroupsChanged:" name:v64 object:0];

    v66 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    [v66 sendTouchCancelledEvent];

    char v87 = 0;
    uint64_t BooleaniTunesPreference = _AXSAccessibilityGetBooleaniTunesPreference( kAXSVoiceOverTouchEnabledByiTunesPreference,  &v87);
    if (!(_DWORD)BooleaniTunesPreference) {
      uint64_t BooleaniTunesPreference = AXPerformBlockOnMainThreadAfterDelay(&stru_100177888, v68, 3600.0);
    }
    if (AXInPreboardScenario(BooleaniTunesPreference))
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      LODWORD(v70) = 0.75;
      [v69 setSystemVolume:v70];

      v71 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterAddObserver( v71,  0LL,  (CFNotificationCallback)sub_1000405C4,  AXInPreBoardScenarioUpdatedNotification,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    }

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDebugManager sharedInstance](&OBJC_CLASS___VOTDebugManager, "sharedInstance"));
    [v72 setElementManager:self->_elementManager];
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    self->_tvInteractionMode = (int64_t)[v73 voiceOverPreferredTVInteractionMode];

    -[VOTWorkspace _registerForExternalDevices](self, "_registerForExternalDevices");
    uint64_t v74 = VOTLogElement( -[VOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_registerForExternalDevices",  0LL,  5.0));
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
    if (os_signpost_enabled(v75))
    {
      *(_WORD *)v86 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v75,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "VOT-Startup",  "",  v86,  2u);
    }
  }

  else
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
    unsigned __int8 v77 = [v76 ignoreLogging];

    if ((v77 & 1) == 0)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
      uint64_t v79 = AXLoggerForFacility(v78);
      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);

      os_log_type_t v81 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v80, v81))
      {
        uint64_t v82 = AXColorizeFormatLog(1LL, @"The preference for VoiceOver is off, so turning myself off");
        v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
        uint64_t v84 = _AXStringForArgs(v83);
        v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v80, v81))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v85;
          _os_log_impl((void *)&_mh_execute_header, v80, v81, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
      }
    }

    _AXSVoiceOverTouchSetEnabled(0LL);
    -[VOTWorkspace stop:](self, "stop:", 1LL);
  }

  objc_destroyWeak(&location);
}

- (void)_initializeCaptionModel
{
  uint64_t v3 = VOTLogCommon(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting caption model retrieval", v8, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace imageCaptionModelAssetPolicy](self, "imageCaptionModelAssetPolicy"));
  id v6 = (AXAssetController *)objc_claimAutoreleasedReturnValue( +[AXAssetController assetControllerWithPolicy:qosClass:]( &OBJC_CLASS___AXAssetController,  "assetControllerWithPolicy:qosClass:",  v5,  25LL));
  assetController = self->_assetController;
  self->_assetController = v6;

  -[AXAssetController setUserInitiated:](self->_assetController, "setUserInitiated:", 1LL);
  -[AXAssetController addObserver:](self->_assetController, "addObserver:", self);
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:]( self->_assetController,  "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:",  1LL,  1LL,  0LL,  0LL);
}

- (id)imageCaptionModelAssetPolicy
{
  return +[AXImageCaptionModelAssetPolicy policy](&OBJC_CLASS___AXImageCaptionModelAssetPolicy, "policy");
}

- (void)_migratePreferencesIfNeeded
{
  v2 = (void *)CFPreferencesCopyAppValue(@"VoiceOverTypingMode", @"com.apple.VoiceOverTouch");
  if (v2)
  {
    id v3 = v2;
    _AXSVoiceOverTouchSetTypingMode([v2 integerValue]);
    CFPreferencesSetAppValue(@"VoiceOverTypingMode", 0LL, @"com.apple.VoiceOverTouch");
    v2 = v3;
  }
}

- (void)_registerForPreferenceChanges
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 registerUpdateBlock:&stru_1001778A8 forRetrieveSelector:"enableVoiceOverCaptions" withListener:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 registerUpdateBlock:&stru_1001778C8 forRetrieveSelector:"speakCorrectionsEnabled" withListener:self];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 registerUpdateBlock:&stru_1001778E8 forRetrieveSelector:"voiceOverHintsEnabled" withListener:self];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v6 registerUpdateBlock:&stru_100177908 forRetrieveSelector:"voiceOverPitchChangeEnabled" withListener:self];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v7 registerUpdateBlock:&stru_100177928 forRetrieveSelector:"voiceOverBannerNotificationOutput" withListener:self];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v8 registerUpdateBlock:&stru_100177948 forRetrieveSelector:"voiceOverLockedScreenNotificationOutput" withListener:self];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v9 registerUpdateBlock:&stru_100177968 forRetrieveSelector:"voiceOverUseRingerSwitchToControlNotificationOutput" withListener:self];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v10 registerUpdateBlock:&stru_100177988 forRetrieveSelector:"voiceOverSpeakingRateInRotorEnabled" withListener:self];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v11 registerUpdateBlock:&stru_1001779A8 forRetrieveSelector:"voiceOverNavigateImagesOption" withListener:self];

  uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v12 registerUpdateBlock:&stru_1001779C8 forRetrieveSelector:"voiceOverSpeakingRateForLanguage:" withListener:self];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v13 registerUpdateBlock:&stru_1001779E8 forRetrieveSelector:"voiceOverAlwaysUseNemethCodeForMathEnabled" withListener:self];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v14 registerUpdateBlock:&stru_100177A08 forRetrieveSelector:"voiceOverUseDigitalCrownNavigation" withListener:self];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v15 registerUpdateBlock:&stru_100177A28 forRetrieveSelector:"voiceOverActivities" withListener:self];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v16 registerUpdateBlock:&stru_100177A48 forRetrieveSelector:"voiceOverSelectedActivity" withListener:self];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100041020;
  v49[3] = &unk_100176D38;
  v49[4] = self;
  [v17 registerUpdateBlock:v49 forRetrieveSelector:"voiceOverDefaultPunctuationGroup" withListener:self];

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100041030;
  v48[3] = &unk_100176D38;
  v48[4] = self;
  [v18 registerUpdateBlock:v48 forRetrieveSelector:"voiceOverImageCaptionsEnabled" withListener:self];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_100041078;
  v47[3] = &unk_100176D38;
  v47[4] = self;
  [v19 registerUpdateBlock:v47 forRetrieveSelector:"voiceOverShouldSpeakDiscoveredText" withListener:self];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000410C0;
  v46[3] = &unk_100176D38;
  v46[4] = self;
  [v20 registerUpdateBlock:v46 forRetrieveSelector:"voiceOverAutomaticButtonLabels" withListener:self];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100041108;
  v45[3] = &unk_100176D38;
  v45[4] = self;
  [v21 registerUpdateBlock:v45 forRetrieveSelector:"voiceOverContentDescriptionLevel" withListener:self];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100041150;
  v44[3] = &unk_100176D38;
  v44[4] = self;
  [v22 registerUpdateBlock:v44 forRetrieveSelector:"voiceOverContainerOutputFeedback" withListener:self];

  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100041198;
  v43[3] = &unk_100176D38;
  v43[4] = self;
  [v23 registerUpdateBlock:v43 forRetrieveSelector:"voiceOverMoreContentOutputFeedback" withListener:self];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000411E0;
  v42[3] = &unk_100176D38;
  v42[4] = self;
  [v24 registerUpdateBlock:v42 forRetrieveSelector:"voiceOverSoundEffectsEnabled" withListener:self];

  int64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100041228;
  v41[3] = &unk_100176D38;
  v41[4] = self;
  [v25 registerUpdateBlock:v41 forRetrieveSelector:"voiceOverNumberFeedback" withListener:self];

  char v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100041270;
  v40[3] = &unk_100176D38;
  v40[4] = self;
  [v26 registerUpdateBlock:v40 forRetrieveSelector:"voiceOverVerbosityEmojiFeedback" withListener:self];

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000412B8;
  v39[3] = &unk_100176D38;
  v39[4] = self;
  [v27 registerUpdateBlock:v39 forRetrieveSelector:"voiceOverBrailleAlertsEnabled" withListener:self];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100041300;
  v38[3] = &unk_100176D38;
  v38[4] = self;
  [v28 registerUpdateBlock:v38 forRetrieveSelector:"imageCaptioningDisabledApps" withListener:self];

  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100041354;
  v37[3] = &unk_100176D38;
  v37[4] = self;
  [v29 registerUpdateBlock:v37 forRetrieveSelector:"voiceOverNavigationDirectionMode" withListener:self];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v30 registerUpdateBlock:&stru_100177A68 forRetrieveSelector:"voiceOverSelectedLanguage" withListener:self];

  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000413AC;
  v36[3] = &unk_100176D38;
  v36[4] = self;
  [v31 registerUpdateBlock:v36 forRetrieveSelector:"voiceOverRotorUpdatesWithElement" withListener:self];

  char v32 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v32 registerUpdateBlock:&stru_100177A88 forRetrieveSelector:"voiceOverBrailleTableIdentifier" withListener:self];

  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v33 registerUpdateBlock:&stru_100177AA8 forRetrieveSelector:"voiceOverTouchBrailleDisplayOutputTableIdentifier" withListener:self];

  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v34 registerUpdateBlock:&stru_100177AC8 forRetrieveSelector:"voiceOverTouchBrailleDisplayInputTableIdentifier" withListener:self];

  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v35 registerUpdateBlock:&stru_100177AE8 forRetrieveSelector:"voiceOverTouchBrailleGesturesInputTableIdentifier" withListener:self];
}

- (void)dealloc
{
  id v3 = (void *)VOTSharedWorkspace;
  VOTSharedWorkspace = 0LL;

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[NSLock lock](self->_systemLangaugeLock, "lock");
  -[NSLock unlock](self->_systemLangaugeLock, "unlock");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VOTWorkspace;
  -[VOTWorkspace dealloc](&v6, "dealloc");
}

- (void)_preferencesSelectedActivityChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 voiceOverSelectedActivity]);

  id v5 = self;
  objc_sync_enter(v5);
  selectedActivity = v5->_selectedActivity;
  v5->_selectedActivity = (AXVoiceOverActivity *)v4;

  objc_sync_exit(v5);
  -[VOTWorkspace _updateActivityListeners](v5, "_updateActivityListeners");
}

- (void)_preferencesSelectedLanguageChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100041574;
  v2[3] = &unk_100176D38;
  v2[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v2, a2);
}

- (void)currentElementDidUpdate:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100041624;
  v3[3] = &unk_100176D38;
  v3[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v3, a2);
}

- (void)addMisspellingsForString:(id)a3
{
  id v3 = a3;
  if ([v3 hasAttribute:UIAccessibilityTokenResolveMisspelledLocally])
  {
    uint64_t v4 = (char *)[v3 length];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIKeyboardInputModeController sharedInputModeController]( &OBJC_CLASS___UIKeyboardInputModeController,  "sharedInputModeController"));
    objc_super v6 = 0LL;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v20 = v7;
    while (1)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentInputMode", v20));
      if (!v8) {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 currentSystemInputMode]);
      }
      textChecker = self->_textChecker;
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryLanguage]);
      double v11 = (char *)-[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:language:]( textChecker,  "rangeOfMisspelledWordInString:range:startingAt:wrap:language:",  v3,  0LL,  v4,  v6,  0LL,  v10);
      NSUInteger v13 = v12;

      v24.id location = 0LL;
      v24.length = (NSUInteger)v4;
      v25.id location = (NSUInteger)v11;
      v25.length = v13;
      NSRange v14 = NSIntersectionRange(v24, v25);
      id v15 = objc_msgSend( v3,  "addAttribute:forKey:withRange:",  kCFBooleanTrue,  UIAccessibilityTokenMisspelled,  v14.location,  v14.length);
      uint64_t v17 = AXLogCommon(v15, v16);
      unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v14.location, v14.length));
        *(_DWORD *)__int128 buf = v20;
        BOOL v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "added: %@", buf, 0xCu);
      }

      objc_super v6 = &v11[v13];
      if (v6 >= v4) {
        goto LABEL_11;
      }
    }

LABEL_11:
  }
}

- (void)_preferencesActivitiesChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceOverActivities]);
  id v5 = [v4 copy];

  uint64_t v6 = VOTLogActivities();
  __int128 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Activities changed: new: %@",  (uint8_t *)&v17,  0xCu);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  -[VOTWorkspace setActivities:](v8, "setActivities:", v5);
  if (v8->_selectedActivity)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace activities](v8, "activities"));
    id v10 = [v9 indexOfObject:v8->_selectedActivity];

    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      selectedActivity = v8->_selectedActivity;
      v8->_selectedActivity = 0LL;
    }

    else
    {
      selectedActivity = (AXVoiceOverActivity *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace activities](v8, "activities"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[AXVoiceOverActivity objectAtIndexedSubscript:](selectedActivity, "objectAtIndexedSubscript:", v10));
      NSUInteger v13 = v8->_selectedActivity;
      v8->_selectedActivity = (AXVoiceOverActivity *)v12;
    }
  }

  objc_sync_exit(v8);

  uint64_t v14 = VOTLogActivities();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace activities](v8, "activities"));
    int v17 = 138412290;
    id v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "VO loading activities: %@", (uint8_t *)&v17, 0xCu);
  }
}

- (AXVoiceOverActivity)selectedActivity
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_selectedActivity;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)previousRotorVoiceIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_previousRotorVoiceIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)activities
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSArray copy](v2->_activities, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)isSystemWideServerAlive
{
  return self->_retryState.connected;
}

- (void)handleSystemWideServerDied
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
    uint64_t v6 = AXLoggerForFacility(v5);
    __int128 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(2LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(2LL, @"System wide server died: (connected: %d)");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      BOOL connected = self->_retryState.connected;
      uint64_t v11 = _AXStringForArgs(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}@", buf, 0xCu);
      }
    }
  }

  if (self->_retryState.connected)
  {
    self->_retryState.lastRecordedTimeOfDeath = CFAbsoluteTimeGetCurrent();
    self->_retryState.BOOL connected = 0;
    NSUInteger v13 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
    [v13 informConnectionDied];

    -[VOTEventFactory resetEventFactory](self->_eventFactory, "resetEventFactory");
    -[VOTElementManagementProtocol systemServerDied](self->_elementManager, "systemServerDied");
  }

  -[VOTEventFactory unregisterForEvents](self->_eventFactory, "unregisterForEvents", connected);
  +[VOTElement resetSystemAppElement](&OBJC_CLASS___VOTElement, "resetSystemAppElement");
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_retryState.lastTime > 60.0)
  {
    self->_retryState.double delay = 0.5;
    self->_retryState.count = 1;
LABEL_12:
    double delay = self->_retryState.delay;
    goto LABEL_13;
  }

  unsigned int v15 = self->_retryState.count + 1;
  self->_retryState.count = v15;
  HIDWORD(v16) = -858993459 * v15;
  LODWORD(v16) = -858993459 * v15;
  self->_retryState.count = 0;
  double delay = self->_retryState.delay + self->_retryState.delay;
  self->_retryState.double delay = delay;
LABEL_13:
  if (delay > 5.0)
  {
    self->_retryState.double delay = 5.0;
    double delay = 5.0;
  }

  self->_retryState.lastTime = Current;
  -[VOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_registerWithSystem",  0LL,  delay);
}

- (BOOL)isAccessibilityEnabled
{
  return AXAPIEnabled() != 0;
}

- (BOOL)isVoiceOverTouchPreferenceEnabled
{
  return _AXSVoiceOverTouchEnabled(self, a2) != 0;
}

- (void)_registerWithSpringBoard
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
  id v4 = [v3 isConnected];

  if (!self->_screenCurtainEnabled)
  {
    uint64_t v7 = _AXSVoiceOverTouchUsageConfirmed(v5, v6);
    if ((_DWORD)v7)
    {
      os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 preferenceForKey:@"ScreenCurtain"]);

      if (v9)
      {
        _AXSVoiceOverTouchSetScreenCurtainEnabled([v9 BOOLValue]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
        [v10 setPreference:0 forKey:@"ScreenCurtain"];
      }

      -[VOTWorkspace _updateScreenCurtainEnabled:](self, "_updateScreenCurtainEnabled:", 0LL);
    }

    else
    {
      uint64_t v5 = _AXSVoiceOverTouchSetScreenCurtainEnabled(v7);
    }
  }

  double lastRecordedTimeOfDeath = self->_retryState.lastRecordedTimeOfDeath;
  uint64_t v12 = VOTLogLifeCycle(v5);
  NSUInteger v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v25[0] = 67109120;
    v25[1] = lastRecordedTimeOfDeath > -3061152000.0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Will force screen curtain update %d",  (uint8_t *)v25,  8u);
  }

  -[VOTWorkspace _updateScreenCurtainEnabled:]( self,  "_updateScreenCurtainEnabled:",  lastRecordedTimeOfDeath > -3061152000.0);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 preferenceForKey:@"DeviceRotation"]);

  if (v15)
  {
    id v16 = [v15 BOOLValue];
    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
    [v17 setRotationCapabilityEnabled:v16];
  }

  else
  {
    LOBYTE(v16) = 1;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication"));
  unsigned __int8 v19 = [v18 isSystemSleeping];

  if ((v19 & 1) == 0)
  {
    id v20 = +[VOTOutputRequest createRequest](&OBJC_CLASS___VOTOutputRequest, "createRequest");
    if ((v16 & 1) == 0)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v22 = sub_10004AE68(off_1001AC148, @"rotation.capability.off", 0LL, v21);
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      id v24 = [v20 addString:v23 withLanguage:v21];
    }

    if ([v20 containsActions])
    {
      [v20 setGeneratesBraille:1];
      [v20 send];
    }
  }

  self->_retryState.double lastRecordedTimeOfDeath = -3061152000.0;
}

- (void)_updateScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int screenCurtainEnabled = self->_screenCurtainEnabled;
  uint64_t v6 = _AXSVoiceOverTouchScreenCurtainEnabled();
  if (screenCurtainEnabled != (_DWORD)v6 || v3)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
    [v9 setScreenCurtainEnabled:self->_screenCurtainEnabled];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    [v10 setScreenCurtainEnabled:self->_screenCurtainEnabled];

    if (!v3)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      if (self->_screenCurtainEnabled) {
        NSUInteger v13 = @"screen.curtain.on";
      }
      else {
        NSUInteger v13 = @"screen.curtain.off";
      }
      id v14 = sub_10004A988(off_1001AC148, v13, 0LL);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      [v12 speakSimpleString:v15];
    }

    uint64_t v16 = VOTLogLifeCycle(v11);
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      BOOL v18 = self->_screenCurtainEnabled;
      v19[0] = 67109376;
      v19[1] = v3;
      __int16 v20 = 1024;
      BOOL v21 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Updating screen curtain[%d] to value %d",  (uint8_t *)v19,  0xEu);
    }
  }

- (void)_registerWithSystem
{
  if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
  {
    BOOL v3 = -[VOTEventFactory registerForEvents](self->_eventFactory, "registerForEvents");
    if (v3 && (AXInPreboardScenario(v3) & 1) == 0)
    {
      uint64_t v4 = AXInCheckerBoardScenario();
      if ((v4 & 1) == 0 && (AXDeviceIsAudioAccessory(v4, v5) & 1) == 0)
      {
        if (self->_retryState.connected) {
          -[VOTElementManagementProtocol voiceOverDidRegisterWithSystem]( self->_elementManager,  "voiceOverDidRegisterWithSystem");
        }
        else {
          self->_retryState.BOOL connected = 1;
        }
        +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.25);
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
        [v6 setEventCaptureMode:1];

        -[VOTWorkspace _registerWithSpringBoard](self, "_registerWithSpringBoard");
        self->_vtwFlags.isInternalInstall = AXIsInternalInstall( -[VOTWorkspace resetSystemBatteryLowState]( self,  "resetSystemBatteryLowState"));
      }
    }
  }

- (id)_systemBootTime
{
  *(void *)uint64_t v7 = 0x1500000001LL;
  size_t v4 = 16LL;
  if (sysctl(v7, 2u, &v5, &v4, 0LL, 0LL) == -1) {
    v2 = 0LL;
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v6 / 1000000.0 + (double)v5));
  }
  return v2;
}

- (void)_sendGreetingMessage
{
  if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
  {
    id v3 = sub_10004A988(off_1001AC148, @"welcome.message", 0LL);
    id v25 = (id)objc_claimAutoreleasedReturnValue(v3);
    size_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCrashManager sharedInstance](&OBJC_CLASS___VOTCrashManager, "sharedInstance"));
    unsigned int v5 = [v4 didStartFromCrashState];

    if (v5)
    {
      if (AXIsInternalInstall(v6)
        && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration")),
            os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 preferenceForKey:@"VOTAlwaysSayVoiceOverOn"]),
            unsigned int v9 = [v8 BOOLValue],
            v8,
            v7,
            v9))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace _systemBootTime](self, "_systemBootTime"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        uint64_t v12 = v11;
        if (v10)
        {
          [v11 timeIntervalSinceDate:v10];
          if (v13 > 25.0)
          {
            BOOL v23 = @"Crashed";
            id v24 = @"__AXStringForVariablesSentinel";
            uint64_t v14 = __AXStringForVariables(v25);
            uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

            id v25 = (id)v15;
          }
        }
      }

      else
      {
        id v10 = v25;
        id v25 = 0LL;
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication", v23, v24));
    unsigned int v17 = [v16 isSystemSleeping];

    if (v25)
    {
      if ((v17 & 1) == 0)
      {
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
        if (![v18 isSiriTalkingOrListening])
        {
          unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
          unsigned __int8 v20 = [v19 isVoiceControlRunning];

          if ((v20 & 1) != 0)
          {
LABEL_19:

            return;
          }

          id v21 = sub_10000BBB0(v25, 1, 0LL);
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
          id v22 = (void *)objc_claimAutoreleasedReturnValue(+[VOSOutputEvent Startup](&OBJC_CLASS___VOSOutputEvent, "Startup"));
          [v18 sendEvent:v22];
        }

        goto LABEL_19;
      }
    }

    else if (!v17)
    {
      goto LABEL_19;
    }

    -[VOTElementManagementProtocol handleNotification:withData:forElement:]( self->_elementManager,  "handleNotification:withData:forElement:",  1004LL,  0LL,  0LL);
    goto LABEL_19;
  }

- (void)run
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  CFAbsoluteTime Current = CFRunLoopGetCurrent();
  self->_runLoop = Current;
  uint64_t v7 = objc_autoreleasePoolPush();
  self->_vtwFlags.isRunLoopEnabled = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"VOTDidLaunch", 0LL, 0LL, 1u);
  unsigned int v9 = (void *)os_transaction_create("com.apple.VoiceOverTouch");
  -[VOTWorkspace setVotTransaction:](self, "setVotTransaction:", v9);

  -[VOTWorkspace _initialize](self, "_initialize");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXPerformanceTestReportingServer server](&OBJC_CLASS___AXPerformanceTestReportingServer, "server"));
  [v10 voiceOverTouchDidLaunch];

  objc_autoreleasePoolPop(v7);
  do
  {
    uint64_t v11 = objc_autoreleasePoolPush();
    CFRunLoopRunSpecific(Current, kCFRunLoopDefaultMode, 1LL, v5);
    objc_autoreleasePoolPop(v11);
  }

  while (self->_vtwFlags.isRunLoopEnabled);
  if (-[VOTWorkspace disableVoiceOverSettingOnStop](self, "disableVoiceOverSettingOnStop"))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
    unsigned __int8 v13 = [v12 ignoreLogging];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
      uint64_t v15 = AXLoggerForFacility(v14);
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

      os_log_type_t v17 = AXOSLogLevelFromAXLogLevel(2LL);
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = AXColorizeFormatLog(2LL, @"Setting VoiceOver enabled NO on graceful stop");
        unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        uint64_t v20 = _AXStringForArgs(v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v16, v17))
        {
          int v22 = 138543362;
          BOOL v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}@", (uint8_t *)&v22, 0xCu);
        }
      }
    }

    _AXSVoiceOverTouchSetEnabled(0LL);
  }

- (void)loadUIKit
{
  if (qword_1001ACE48 != -1) {
    dispatch_once(&qword_1001ACE48, &stru_100177B08);
  }
}

- (BOOL)voiceOverIsConfirmed
{
}

- (void)_showConfirmPanel
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VOTSpringBoardConnection defaultConnection](&OBJC_CLASS___VOTSpringBoardConnection, "defaultConnection"));
  [v2 showSpringBoardVOConfirmation:1];
}

- (void)_showVOTNoHomeButtonGestureAlert
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VOTSpringBoardConnection defaultConnection](&OBJC_CLASS___VOTSpringBoardConnection, "defaultConnection"));
  [v2 showSpringboardNoHomeButtonGestureAlert];
}

- (void)_checkVoiceOverWasConfirmed
{
  if (!-[VOTWorkspace voiceOverIsConfirmed](self, "voiceOverIsConfirmed"))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
    [v2 showSpringBoardVOConfirmation:0];

    uint64_t v3 = _AXSVoiceOverTouchSetEnabled(0LL);
  }

- (void)_voiceOverUsageConfirmed
{
}

- (void)_voiceOverTouchEnabledChange:(__CFString *)a3
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
      uint64_t v8 = AXLoggerForFacility(v7);
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

      os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = AXColorizeFormatLog(1LL, @"Not processing VOT enabling changes because of testing");
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = _AXStringForArgs(v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v9, v10))
        {
          *(_DWORD *)__int128 buf = 138543362;
          v48 = v14;
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "%{public}@", buf, 0xCu);
        }
      }
    }
  }

  else
  {
    _AXSForcePreferenceUpdate(kAXSVoiceOverTouchEnabledPreference);
    uint64_t v15 = CFEqual(a3, kAXSVoiceOverTouchEnabledNotification);
    if ((_DWORD)v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
      unsigned __int8 v17 = [v16 ignoreLogging];

      if ((v17 & 1) == 0)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
        uint64_t v19 = AXLoggerForFacility(v18);
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

        os_log_type_t v21 = AXOSLogLevelFromAXLogLevel(1LL);
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = AXColorizeFormatLog(1LL, @"*** VoiceOverTouch received status pref change");
          BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          uint64_t v24 = _AXStringForArgs(v23);
          id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)__int128 buf = 138543362;
            v48 = v25;
            _os_log_impl((void *)&_mh_execute_header, v20, v21, "%{public}@", buf, 0xCu);
          }
        }
      }
    }

    if (self->_didSendShutdownSignal
      || (uint64_t v15 = -[VOTWorkspace isVoiceOverTouchPreferenceEnabled](self, "isVoiceOverTouchPreferenceEnabled"),
          (v15 & 1) != 0))
    {
      AXInPreboardScenario(v15);
      char v26 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
      unsigned __int8 v27 = [v26 ignoreLogging];

      if ((v27 & 1) == 0)
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
        uint64_t v29 = AXLoggerForFacility(v28);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);

        os_log_type_t v31 = AXOSLogLevelFromAXLogLevel(1LL);
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = AXColorizeFormatLog( 1LL,  @"*** VO not shutting down because VO:(%{public}@) is still enabled in prefs");
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VOTWorkspace isVoiceOverTouchPreferenceEnabled](self, "isVoiceOverTouchPreferenceEnabled")));
          uint64_t v34 = _AXStringForArgs(v33);
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

          if (os_log_type_enabled(v30, v31))
          {
            *(_DWORD *)__int128 buf = 138543362;
            v48 = v35;
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "%{public}@", buf, 0xCu);
          }
        }
      }
    }

    else
    {
      self->_didSendShutdownSignal = 1;
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
      unsigned __int8 v37 = [v36 ignoreLogging];

      if ((v37 & 1) == 0)
      {
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
        uint64_t v39 = AXLoggerForFacility(v38);
        BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);

        os_log_type_t v41 = AXOSLogLevelFromAXLogLevel(1LL);
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = AXColorizeFormatLog(1LL, @"*** VoiceOverTouch shutting down after speaking ");
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          uint64_t v44 = _AXStringForArgs(v43);
          unsigned __int8 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v40, v41))
          {
            *(_DWORD *)__int128 buf = 138543362;
            v48 = v45;
            _os_log_impl((void *)&_mh_execute_header, v40, v41, "%{public}@", buf, 0xCu);
          }
        }
      }

      -[VOTWorkspace stop:](self, "stop:", 0LL);
    }
  }

- (int64_t)typingMode
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 typingStyle]);
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 typingStyle]);
    int64_t typingMode = (int)[v7 intValue];
  }

  else
  {
    int64_t typingMode = self->_typingMode;
  }

  return typingMode;
}

- (void)setTypingMode:(int64_t)a3
{
  if (self->_typingMode != a3)
  {
    self->_int64_t typingMode = a3;
    _AXSVoiceOverTouchSetTypingMode(a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue( -[VOTEventFactory directInteractionKeyboardManager]( self->_eventFactory,  "directInteractionKeyboardManager"));
    [v4 updateTypingMode];
  }

- (void)dispatchCommand:(id)a3
{
}

- (void)dispatchCommand:(id)a3 bypassGesturedInput:(BOOL)a4
{
}

- (void)_postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(id)a5 keyCode:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v11 unsignedIntValue];
  id v14 = [v12 unsignedShortValue];
  -[VOTWorkspace _postKeyboardEventsForModifiers:isKeyDown:]( self,  "_postKeyboardEventsForModifiers:isKeyDown:",  v13,  1LL);
  -[VOTWorkspace _postKeyboardEventWithKeyCode:characters:originalCharacters:modifierState:isKeyDown:]( self,  "_postKeyboardEventWithKeyCode:characters:originalCharacters:modifierState:isKeyDown:",  v14,  v17,  v10,  v13,  1LL);
  -[VOTWorkspace _postKeyboardEventWithKeyCode:characters:originalCharacters:modifierState:isKeyDown:]( self,  "_postKeyboardEventWithKeyCode:characters:originalCharacters:modifierState:isKeyDown:",  v14,  v17,  v10,  v13,  0LL);
  -[VOTWorkspace _postKeyboardEventsForModifiers:isKeyDown:]( self,  "_postKeyboardEventsForModifiers:isKeyDown:",  v13,  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace unitTestDelegate](self, "unitTestDelegate"));

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace unitTestDelegate](self, "unitTestDelegate"));
    [v16 didPostKeyboardEventsWithCharacters:v17 originalCharacters:v10 modifiers:v11 keyCode:v12];
  }
}

- (void)_postKeyboardEventsForModifiers:(unsigned int)a3 isKeyDown:(BOOL)a4
{
  if (!a3) {
    return;
  }
  BOOL v4 = a4;
  char v5 = a3;
  if (a4) {
    LODWORD(v7) = 0;
  }
  else {
    LODWORD(v7) = a3;
  }
  if ((a3 & 1) != 0)
  {
    if (a4) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = a3 & 0xFFFFFFFE;
    }
    -[VOTWorkspace _postKeyboardEventWithKeyCode:modifierState:isKeyDown:]( self,  "_postKeyboardEventWithKeyCode:modifierState:isKeyDown:",  227LL,  v7,  a4);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }

  else if ((a3 & 2) == 0)
  {
    goto LABEL_7;
  }

  int v8 = v7 & 0xFFFFFFFD;
  if (v4) {
    int v9 = 2;
  }
  else {
    int v9 = 0;
  }
  LODWORD(v7) = v8 | v9;
  -[VOTWorkspace _postKeyboardEventWithKeyCode:modifierState:isKeyDown:]( self,  "_postKeyboardEventWithKeyCode:modifierState:isKeyDown:",  226LL,  v8 | v9,  v4);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      return;
    }
    goto LABEL_22;
  }

- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 modifierState:(unsigned int)a4 isKeyDown:(BOOL)a5
{
}

- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 isKeyDown:(BOOL)a7
{
  if (a7) {
    uint64_t v7 = 10LL;
  }
  else {
    uint64_t v7 = 11LL;
  }
  -[VOTWorkspace _postKeyboardEventWithKeyCode:characters:originalCharacters:modifierState:eventType:]( self,  "_postKeyboardEventWithKeyCode:characters:originalCharacters:modifierState:eventType:",  a3,  a4,  a5,  *(void *)&a6,  v7);
}

- (void)_postKeyboardEventWithKeyCode:(unsigned __int16)a3 characters:(id)a4 originalCharacters:(id)a5 modifierState:(unsigned int)a6 eventType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = a3;
  id v12 = a5;
  id v13 = a4;
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation keyRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "keyRepresentationWithType:",  v7));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v15 keyInfo]);
  [v14 setKeyCode:v10];
  [v14 setModifierState:v8];
  [v14 setUnmodifiedInput:v12];

  [v14 setModifiedInput:v13];
  -[VOTWorkspace handleKeyboardKeyEvent:eventOrigin:](self, "handleKeyboardKeyEvent:eventOrigin:", v15, 1LL);
  self->_lastKeyboardKeyPress = CFAbsoluteTimeGetCurrent();
  self->_isPostingKeyboardEvents = 1;
  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.00100000005);
}

- (void)_postKeyboardEvent:(id)a3 modifiers:(id)a4 keyCode:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  LODWORD(a4) = [a4 unsignedIntValue];
  unsigned __int16 v10 = (unsigned __int16)[v8 unsignedShortValue];

  LODWORD(v8) = [v9 BOOLValue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  _DWORD v19[2] = sub_1000432D0;
  v19[3] = &unk_100177B30;
  v19[4] = self;
  int v20 = (int)a4;
  char v21 = (char)v8;
  int v11 = objc_retainBlock(v19);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000432E4;
  v15[3] = &unk_100177B58;
  v15[4] = self;
  unsigned __int16 v17 = v10;
  int v16 = (int)a4;
  char v18 = (char)v8;
  id v12 = objc_retainBlock(v15);
  id v13 = v12;
  if ((_DWORD)v8)
  {
    id v12 = v11;
    id v14 = v13;
  }

  else
  {
    id v14 = v11;
  }

  ((void (*)(void))v12[2])();
  ((void (*)(void *))v14[2])(v14);
}

- (void)postKeyboardEvent:(BOOL)a3 modifiers:(unsigned int)a4 keyCode:(unsigned __int16)a5
{
  keyPostingQueue = (dispatch_queue_s *)self->_keyPostingQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100043368;
  v6[3] = &unk_100177B58;
  v6[4] = self;
  BOOL v9 = a3;
  unsigned int v7 = a4;
  unsigned __int16 v8 = a5;
  dispatch_async(keyPostingQueue, v6);
}

- (void)postKeyboardEventWithCharacters:(id)a3 originalCharacters:(id)a4 modifiers:(unsigned int)a5 keyCode:(unsigned __int16)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (v10 && v11)
  {
    keyPostingQueue = (dispatch_queue_s *)self->_keyPostingQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000434C0;
    v14[3] = &unk_100177B80;
    v14[4] = self;
    id v15 = v10;
    id v16 = v12;
    unsigned int v17 = a5;
    unsigned __int16 v18 = a6;
    dispatch_async(keyPostingQueue, v14);
  }
}

- (VOTElement)currentElement
{
  return (VOTElement *)-[VOTElementManagementProtocol currentElement](self->_elementManager, "currentElement");
}

- (NSArray)focusedApplications
{
  unsigned int v2 = -[VOTElementManagementProtocol isItemChooserVisible](self->_elementManager, "isItemChooserVisible");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
  BOOL v4 = v3;
  if (v2)
  {
    unsigned __int16 v8 = v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  }

  else
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 focusedApplications]);
  }

  unsigned __int8 v6 = (void *)v5;

  return (NSArray *)v6;
}

- (BOOL)brailleInputActive
{
  return -[VOTEventFactory brailleInputActive](self->_eventFactory, "brailleInputActive");
}

- (int64_t)brailleInputTypingMode
{
  return -[VOTEventFactory brailleInputTypingMode](self->_eventFactory, "brailleInputTypingMode");
}

- (BOOL)brailleInputAllowsElementMovement
{
  return -[VOTEventFactory brailleInputAllowsElementMovement](self->_eventFactory, "brailleInputAllowsElementMovement");
}

- (BOOL)brailleInputWantsToStayActive
{
  return -[VOTEventFactory brailleInputWantsToStayActive](self->_eventFactory, "brailleInputWantsToStayActive");
}

- (BOOL)brailleInputShouldBeDeactivatedByEscape
{
  return -[VOTEventFactory brailleInputShouldBeDeactivatedByEscape]( self->_eventFactory,  "brailleInputShouldBeDeactivatedByEscape");
}

- (void)_preferencesAlwaysUseNemethForMathChange
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  [v2 updateUsesNemethForMath];
}

- (void)_preferenceUseDigitalCrownNavigationChanged
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  self->_useDigitalCrownNavigation = [v3 voiceOverUseDigitalCrownNavigation];
}

- (void)setUseDigitalCrownNavigationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_useDigitalCrownNavigation = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 setVoiceOverUseDigitalCrownNavigation:v3];
}

- (void)_preferencesTypingPitchChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTWorkspace setTypingPitchChangeEnabled:]( self,  "setTypingPitchChangeEnabled:",  [v3 voiceOverPitchChangeEnabled]);
}

- (void)_preferencesSpeakHintsChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = [v3 voiceOverHintsEnabled];

  -[VOTWorkspace setHintsEnabled:](self, "setHintsEnabled:", v4);
}

- (void)_preferencesNavigateImagesOptionChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTWorkspace setNavigateImagesOption:]( self,  "setNavigateImagesOption:",  [v3 voiceOverNavigateImagesOption]);
}

- (void)_preferencesSpeechRateChange
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v2 resetSpeechRate];
}

- (void)_preferencesSpeakingRateInRotorChanged
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTWorkspace setSpeakingRateInRotor:]( self,  "setSpeakingRateInRotor:",  [v3 voiceOverSpeakingRateInRotorEnabled]);
}

- (void)_preferencesSpeakNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTWorkspace setNotificationsWhenLockedOutput:]( self,  "setNotificationsWhenLockedOutput:",  [v3 voiceOverLockedScreenNotificationOutput]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTWorkspace setBannerNotificationsOutput:]( self,  "setBannerNotificationsOutput:",  [v4 voiceOverBannerNotificationOutput]);

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTWorkspace setUseRingerSwitchForNotificationOutput:]( self,  "setUseRingerSwitchForNotificationOutput:",  [v5 voiceOverUseRingerSwitchToControlNotificationOutput]);
}

- (void)preferencesKeyboardClickStatusChange:(id)a3
{
}

- (void)preferencesLanguageRotorItemsChanged:(id)a3
{
  id v4 = (void *)_AXSVoiceOverTouchCopyLanguageRotorItems(1LL);
  -[NSLock lock](self->_systemLangaugeLock, "lock");
  id v5 = (NSArray *)[objc_allocWithZone(NSMutableArray) init];
  id v6 = [objc_allocWithZone(NSMutableDictionary) init];
  [v6 setObject:kCFBooleanTrue forKey:@"Default"];
  id v16 = v6;
  -[NSArray addObject:](v5, "addObject:", v6);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"Enabled"]);
        unsigned int v14 = [v13 BOOLValue];

        if (v14) {
          -[NSArray addObject:](v5, "addObject:", v12);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  if ((id)-[NSArray count](v5, "count") == (id)1) {
    -[NSArray removeAllObjects](v5, "removeAllObjects");
  }
  enabledLanguageRotorItems = self->_enabledLanguageRotorItems;
  self->_enabledLanguageRotorItems = v5;

  -[NSLock unlock](self->_systemLangaugeLock, "unlock");
}

- (void)preferencesBrailleLanguageRotorItemsChanged:(id)a3
{
  if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode", a3))
  {
    VOSCrystalMigrateBrailleTableReplacements();
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceOverBrailleLanguageRotorItems]);

    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", @"Enabled", (void)v18));
          unsigned int v14 = [v13 BOOLValue];

          if (v14) {
            -[NSArray addObject:](v6, "addObject:", v12);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v9);
    }

    enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
    self->_enabledBrailleLanguageRotorItems = v6;
    id v16 = v6;

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
    [v17 updateBrailleLanguage];
  }

- (void)_preferencesTypingModeChanged:(id)a3
{
  self->_int64_t typingMode = _AXSVoiceOverTouchTypingMode(self, a2, a3);
}

- (void)_preferencesScreenCurtainChanged:(id)a3
{
}

- (id)phoneticStringForCharacter:(id)a3 andVoiceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7
    || (id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer voiceForIdentifier:]( TTSSpeechSynthesizer,  "voiceForIdentifier:",  v7)),  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 language]),  v8,  !v9))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace selectedLanguage](self, "selectedLanguage"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace systemSpokenLanguage](self, "systemSpokenLanguage"));
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[AXCharacterSoundMap phoneticStringForCharacter:forLanguage:andVoiceIdentifier:]( self->_characterSoundMap,  "phoneticStringForCharacter:forLanguage:andVoiceIdentifier:",  v6,  v9,  v7));

  return v10;
}

- (void)setSelectedActivity:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 setVoiceOverSelectedActivity:v4];
}

- (void)systemSpokenLanguageChanged:(id)a3
{
  id v8 = (id)TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences(self, a2, a3);
  -[NSLock lock](self->_systemLangaugeLock, "lock");
  id v4 = (NSString *)[v8 copy];
  systemSpokenLanguage = self->_systemSpokenLanguage;
  self->_systemSpokenLanguage = v4;

  nullsub_2(-[NSLock unlock](self->_systemLangaugeLock, "unlock"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  [v6 updateBrailleLanguage];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v7 resetSpeechRate];
}

- (id)punctuationGroupForUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace punctuationGroups](self, "punctuationGroups"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100043EF8;
  v10[3] = &unk_100177BA8;
  id v11 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ax_filteredArrayUsingBlock:", v10));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);

  return v8;
}

- (NSArray)punctuationGroups
{
  id v2 = self;
  objc_sync_enter(v2);
  punctuationGroups = v2->_punctuationGroups;
  if (!punctuationGroups)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSSPunctuationManager sharedDatabase](&OBJC_CLASS___AXSSPunctuationManager, "sharedDatabase"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 punctuationGroups]);

    if (v5)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v7 = v2->_punctuationGroups;
      v2->_punctuationGroups = (NSMutableArray *)v6;

      -[NSMutableArray axSafelyAddObjectsFromArray:](v2->_punctuationGroups, "axSafelyAddObjectsFromArray:", v5);
      defaultPunctuationGroup = v2->_defaultPunctuationGroup;
      v2->_defaultPunctuationGroup = 0LL;
    }

    punctuationGroups = v2->_punctuationGroups;
  }

  id v9 = -[NSMutableArray copy](punctuationGroups, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v9;
}

- (id)defaultPunctuationGroup
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_defaultPunctuationGroup)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 voiceOverDefaultPunctuationGroup]);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[VOTWorkspace punctuationGroupForUUID:](v2, "punctuationGroupForUUID:", v4));
    defaultPunctuationGroup = v2->_defaultPunctuationGroup;
    v2->_defaultPunctuationGroup = (AXSSPunctuationGroup *)v5;

    if (!v2->_defaultPunctuationGroup)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[VOTWorkspace punctuationGroupForUUID:](v2, "punctuationGroupForUUID:", AXSSVoiceOverPunctuationGroupSome));
      id v8 = v2->_defaultPunctuationGroup;
      v2->_defaultPunctuationGroup = (AXSSPunctuationGroup *)v7;
    }
  }

  objc_sync_exit(v2);

  return v2->_defaultPunctuationGroup;
}

- (void)punctuationGroupsChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogPunctuationStorage();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Punctuation groups changed: %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000441B4;
  v8[3] = &unk_100176D38;
  v8[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v8, v7);
}

- (void)setVoiceOverMuted:(BOOL)a3
{
}

- (void)setVoiceOverMuted:(BOOL)a3 sendRequest:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (-[VOTWorkspace voiceOverIsConfirmed](self, "voiceOverIsConfirmed"))
  {
    self->_voiceOverMuted = v5;
    -[VOTWorkspace setSpeechMuted:](self, "setSpeechMuted:", v5);
    if (v4)
    {
      id v13 = [objc_allocWithZone((Class)VOTOutputRequest) init];
      if (self->_voiceOverMuted) {
        uint64_t v7 = @"voiceover.muted.off";
      }
      else {
        uint64_t v7 = @"voiceover.muted.on";
      }
      id v8 = sub_10004A988(off_1001AC148, v7, 0LL);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = [v13 addString:v9];

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 lastAction]);
      [v11 setObject:kCFBooleanTrue forVariant:25];

      [v13 setGeneratesBraille:1];
      if (self->_voiceOverMuted)
      {
        [v13 setCompletionBlock:&stru_100177BE8];
      }

      else
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[VOTOutputManager outputManagerIfExists]( &OBJC_CLASS___VOTOutputManager,  "outputManagerIfExists"));
        [v12 updateAudioSessionProperties];
      }

      [v13 send];
    }
  }

- (void)setScreenCurtainEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[VOTWorkspace voiceOverIsConfirmed](self, "voiceOverIsConfirmed"))
  {
    if (v3
      && ([(id)VOTSharedWorkspace loadUIKit],
          [(id)AXSafeClassFromString(@"UIApplication") isRunningInStoreDemoMode]))
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v5 = sub_10004AE68(off_1001AC148, @"screen.curtain.disabled.in.store.mode", 0LL, v16);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      id v7 = sub_10000BBB0(v6, 0, v16);

      _AXSVoiceOverTouchSetScreenCurtainEnabled(0LL);
    }

    else
    {
      self->_int screenCurtainEnabled = v3;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
      [v8 setScreenCurtainEnabled:self->_screenCurtainEnabled];

      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
      [v9 setScreenCurtainEnabled:self->_screenCurtainEnabled];

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
      if (self->_screenCurtainEnabled) {
        id v11 = @"screen.curtain.on";
      }
      else {
        id v11 = @"screen.curtain.off";
      }
      id v12 = sub_10004A988(off_1001AC148, v11, 0LL);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      [v10 speakSimpleString:v13];
    }
  }

- (void)setScreenCurtainSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[VOTWorkspace screenCurtainEnabled](self, "screenCurtainEnabled") && self->_screenCurtainSuspended != v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
    [v5 setScreenCurtainEnabled:!v3];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    [v6 setScreenCurtainEnabled:!v3];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    [v7 clearCursorFrame];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    if (self->_screenCurtainSuspended) {
      id v9 = @"screen.curtain.on";
    }
    else {
      id v9 = @"screen.curtain.off";
    }
    id v10 = sub_10004A988(off_1001AC148, v9, 0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v8 speakSimpleString:v11];
  }

  self->_screenCurtainSuspended = v3;
}

- (void)_stopRunLoop
{
  self->_vtwFlags.isRunLoopEnabled = 0;
  runLoop = self->_runLoop;
  if (runLoop) {
    CFRunLoopStop(runLoop);
  }
}

- (void)outputRequestFinished:(id)a3
{
  BOOL v4 = (VOTOutputRequest *)a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:",  self);
  completionRequest = self->_completionRequest;

  if (completionRequest == v4) {
    -[VOTWorkspace _stopRunLoop](self, "_stopRunLoop");
  }
}

- (void)stop:(int)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  [v5 unsetEventCaptureMode:1];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  [v6 setSoundCurtainEnabled:0];

  if (!self->_completionRequest)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManagerIfExists](&OBJC_CLASS___VOTOutputManager, "outputManagerIfExists"));
    [v7 stopSpeakingAtBoundary:0];
  }

  if (!byte_1001ACE50)
  {
    -[VOTEventFactory shutdown](self->_eventFactory, "shutdown");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    [v8 shutdown];

    if (!a3)
    {
      id v9 = (VOTOutputRequest *)[objc_allocWithZone((Class)VOTOutputRequest) init];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v11 = sub_10004AE68(off_1001AC148, @"voiceover.off", 0LL, v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = -[VOTOutputRequest addString:withLanguage:](v9, "addString:withLanguage:", v12, v10);

      -[VOTOutputRequest setLastSystemRequest:](v9, "setLastSystemRequest:", 1LL);
      -[VOTOutputRequest setCompletionDelegate:](v9, "setCompletionDelegate:", self);
      -[VOTOutputRequest setCannotBeInterrupted:](v9, "setCannotBeInterrupted:", 1LL);
      -[VOTOutputRequest setGeneratesBraille:](v9, "setGeneratesBraille:", 1LL);
      -[VOTOutputRequest send](v9, "send");
      completionRequest = self->_completionRequest;
      self->_completionRequest = v9;
    }

    if (self->_isPostingKeyboardEvents)
    {
      ++self->_triggeredKBAttachState;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace softwareKeyboardManager](self, "softwareKeyboardManager"));
      [v15 _overrideSetHardwareKeyboardAttached:self->_originalKBAttachedState];

      uint64_t v16 = VOTLogKeyboard();
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        BOOL originalKBAttachedState = self->_originalKBAttachedState;
        v23[0] = 67109120;
        v23[1] = originalKBAttachedState;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Resetting hw keyboard state to: %d",  (uint8_t *)v23,  8u);
      }
    }
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
  [v19 sendTouchCancelledEvent];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[VOTSpringBoardConnection defaultConnection]( &OBJC_CLASS___VOTSpringBoardConnection,  "defaultConnection"));
  [v20 setScreenCurtainEnabled:0];

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
  [v21 setScreenCurtainEnabled:0];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  [v22 setPreference:0 forKey:@"VOTIsRunningKey"];

  if (a3 == 1)
  {
    byte_1001ACE50 = 2;
LABEL_15:
    -[VOTWorkspace _stopRunLoop](self, "_stopRunLoop");
    goto LABEL_16;
  }

  if (byte_1001ACE50 == 2) {
    goto LABEL_15;
  }
  if (!byte_1001ACE50) {
    -[VOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "outputRequestFinished:",  self->_completionRequest,  5.0);
  }
LABEL_16:
  ++byte_1001ACE50;
}

- (BOOL)isInternalInstall
{
  return self->_vtwFlags.isInternalInstall;
}

- (void)_selfDestruct
{
  if (AXGuidedAccessGetAvailability(self, a2) != 6)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    v13[0] = @"com.apple.mediaserverd";
    v13[1] = AX_BackBoardBundleName;
    v13[2] = AX_SpringBoardBundleName;
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL, 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        id v7 = 0LL;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          pid_t v8 = AXPidForLaunchLabel(*(void *)(*((void *)&v9 + 1) + 8LL * (void)v7));
          kill(v8, 15);
          id v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }

      while (v5);
    }

    -[VOTWorkspace _stopRunLoop](self, "_stopRunLoop");
  }

- (void)handleVolumeButtonPress:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
  unsigned __int8 v5 = [v4 isSpeaking];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTEventFactory currentElement](self->_eventFactory, "currentElement"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 application]);
    unsigned __int8 v8 = [v7 isCameraIrisOpen];

    if ((v8 & 1) == 0)
    {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
      [v9 isMediaPlayingForApp:0 completionHandler:&stru_100177C28];
    }
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  if ([v10 helpEnabled] && objc_msgSend(v13, "subtype") != 226)
  {
    id v11 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v13];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:",  0LL,  v11));
    [v10 processHelpForEvent:v12];
  }
}

- (void)handleMenuButtonPress:(id)a3
{
  elementManager = self->_elementManager;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:",  kVOTEventCommandEscape,  0LL));
  -[VOTElementManagementProtocol handleEvent:](elementManager, "handleEvent:", v5);
}

- (void)handleAppleTVRemoteEvent:(id)a3 eventOrigin:(int64_t)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  switch([v7 type])
  {
    case 0x4B0u:
      unsigned __int8 v8 = &kVOTEventCommandSearchRotorUp;
      goto LABEL_13;
    case 0x4B1u:
    case 0x4B3u:
    case 0x4B5u:
    case 0x4B7u:
      goto LABEL_16;
    case 0x4B2u:
      unsigned __int8 v8 = &kVOTEventCommandSearchRotorDown;
      goto LABEL_13;
    case 0x4B4u:
      unsigned __int8 v8 = &kVOTEventCommandNextElement;
      __int128 v19 = &kVOTEventCommandPreviousElement;
      goto LABEL_11;
    case 0x4B6u:
      unsigned __int8 v8 = &kVOTEventCommandPreviousElement;
      __int128 v19 = &kVOTEventCommandNextElement;
LABEL_11:
      if (!v5) {
        unsigned __int8 v8 = v19;
      }
LABEL_13:
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[VOTEvent appleTVRemoteEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "appleTVRemoteEventWithCommand:info:",  *v8,  0LL));
      if (!v20) {
        goto LABEL_16;
      }
      id v13 = (os_log_s *)v20;
      -[VOTElementManagementProtocol updateNavigationModeForClassicRemote]( self->_elementManager,  "updateNavigationModeForClassicRemote");
      -[VOTElementManagementProtocol handleEvent:](self->_elementManager, "handleEvent:", v13);
      break;
    default:
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver sharedInstance](&OBJC_CLASS___AXSubsystemVoiceOver, "sharedInstance"));
      unsigned __int8 v10 = [v9 ignoreLogging];

      if ((v10 & 1) != 0) {
        goto LABEL_16;
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemVoiceOver identifier](&OBJC_CLASS___AXSubsystemVoiceOver, "identifier"));
      uint64_t v12 = AXLoggerForFacility(v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

      os_log_type_t v14 = AXOSLogLevelFromAXLogLevel(0LL);
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = AXColorizeFormatLog(0LL, @"Unhandled ATV Remote event: %@");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v17 = _AXStringForArgs(v16);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v13, v14))
        {
          *(_DWORD *)__int128 buf = 138543362;
          uint64_t v22 = v18;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}@", buf, 0xCu);
        }
      }

      break;
  }

LABEL_16:
}

- (void)handleKeyboardKeyEvent:(id)a3 eventOrigin:(int64_t)a4
{
}

- (void)handleTurnOffSoundAndCurtainEvent:(id)a3
{
}

- (id)keyboardPressInfo
{
  return -[VOTKeyboardManager threadSafe_keyDownInfo](self->_keyboardManager, "threadSafe_keyDownInfo");
}

- (void)_temporarilyChangeQuickNav:(id)a3
{
}

- (void)temporarilyChangeQuickNavState:(BOOL)a3
{
  keyPostingQueue = (dispatch_queue_s *)self->_keyPostingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000450A4;
  v4[3] = &unk_100177C50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(keyPostingQueue, v4);
}

- (void)_handleSystemMuteKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 eventRecord]);
  unsigned int v6 = [v5 originalType];

  if (v6 != 1026)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));
    if ([v7 isSystemMuted])
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 eventRecord]);
      -[VOTKeyboardManager postEvent:](self->_keyboardManager, "postEvent:", v8);
      id v9 = [v8 copy];

      [v9 setType:1026];
      [v9 setOriginalType:1026];
      -[VOTKeyboardManager postEvent:](self->_keyboardManager, "postEvent:", v9);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      _DWORD v19[2] = sub_1000452D4;
      v19[3] = &unk_100176D38;
      unsigned __int8 v10 = &v20;
      id v20 = v7;
      AXPerformBlockOnMainThreadAfterDelay(v19, v11, 0.5);
    }

    else
    {
      id v9 = +[VOTOutputRequest createRequest](&OBJC_CLASS___VOTOutputRequest, "createRequest");
      uint64_t v12 = off_1001AC148;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
      id v14 = sub_10004A988(v12, @"system.muted", v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = [v9 addString:v15];

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100045348;
      v17[3] = &unk_100177C78;
      unsigned __int8 v10 = (id *)v18;
      v18[0] = v4;
      v18[1] = self;
      [v9 setCompletionBlock:v17];
      [v9 send];
    }
  }
}

- (void)handleMediaKeyPress:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  id v5 = [objc_allocWithZone((Class)VOTKeyInfo) initWithEventRepresentation:v7];
  if ([v4 helpEnabled])
  {
    if ([v5 isMediaKey])
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent keyEventWithCommand:keyInfo:]( &OBJC_CLASS___VOTEvent,  "keyEventWithCommand:keyInfo:",  0LL,  v5));
      [v4 processHelpForEvent:v6];
    }
  }

  else if ([v7 originalType] == 1025 {
         || [v7 originalType] == 1026)
  }
  {
    -[VOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_handleSystemMuteKey:",  v5,  0.5);
  }

  else
  {
    -[VOTKeyboardManager postEvent:](self->_keyboardManager, "postEvent:", v7);
  }
}

- (void)handlePlayPauseKeyPress:(id)a3
{
}

- (void)handleLockButtonPress:(id)a3
{
  self->_lastLockButtonPress = CFAbsoluteTimeGetCurrent();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTCommandHelper commandHelper](&OBJC_CLASS___VOTCommandHelper, "commandHelper"));
  [v4 setHelpEnabled:0];

  -[VOTEventFactory resetEventFactory](self->_eventFactory, "resetEventFactory");
}

- (void)handleProximityEvent:(id)a3
{
  elementManager = self->_elementManager;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[VOTEvent internalEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "internalEventWithCommand:info:",  kVOTEventCommandCancelSpeaking,  0LL));
  -[VOTElementManagementProtocol handleEvent:](elementManager, "handleEvent:", v4);
}

- (void)handleOrientationChanged
{
}

- (void)handleSetForcedOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4
{
  if (a3)
  {
    if (self->_forcedOrientation != a3)
    {
      self->_forcedOrientation = a3;
      -[VOTWorkspace _resetOrientationAndAnnounce:updateApplication:]( self,  "_resetOrientationAndAnnounce:updateApplication:",  a4,  0LL);
    }
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/VoiceOverTouch/Sources/VOTWorkspace.m",  3235LL,  "-[VOTWorkspace handleSetForcedOrientation:shouldAnnounce:]",  @"Someone tried to force an ambiguous orientation, which won't work because we use that as our unset value");
  }

- (void)handleUnsetForcedOrientationAndAnnounce:(BOOL)a3
{
  if (self->_forcedOrientation)
  {
    self->_forcedOrientation = 0LL;
    -[VOTWorkspace _resetOrientationAndAnnounce:updateApplication:]( self,  "_resetOrientationAndAnnounce:updateApplication:",  a3,  0LL);
  }

- (BOOL)directTouchElementsPresent
{
  return -[VOTEventFactory directTouchElementsPresent](self->_eventFactory, "directTouchElementsPresent");
}

- (void)startTapAndHoldMode:(BOOL)a3
{
}

- (void)cancelTapAndHoldMode
{
}

- (void)handleReturnToSpringBoard
{
}

- (CGPoint)fingerPosition
{
  result.y = v3;
  result.x = v2;
  return result;
}

- (unint64_t)fingerCount
{
  return -[VOTEventFactory fingerCount](self->_eventFactory, "fingerCount");
}

- (void)_languageChanged
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
    uint64_t v5 = AXLoggerForFacility(v4);
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog(1LL, @"*** VoiceOver detected language change. Will restart VoiceOver now");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = _AXStringForArgs(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, v7))
      {
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  exit(1);
}

- (void)_languageChangedInBuddy
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle sharedInstance]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "sharedInstance"));
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemVoiceOverLifeCycle identifier]( &OBJC_CLASS___AXSubsystemVoiceOverLifeCycle,  "identifier"));
    uint64_t v5 = AXLoggerForFacility(v4);
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog(1LL, @"*** VoiceOver detected language change. Will restart VoiceOver now");
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = _AXStringForArgs(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, v7))
      {
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  exit(1);
}

- (void)_preferencesCaptionPanelChanged
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[VOTWorkspace setCaptionPanelEnabled:](self, "setCaptionPanelEnabled:", [v3 enableVoiceOverCaptions]);
}

- (void)_speakCorrectionsChanged
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  self->_vtwFlags.speakAutocorrectionsEnabled = [v3 speakCorrectionsEnabled];
}

- (BOOL)speakAutocorrectionsEnabled
{
  return self->_vtwFlags.speakAutocorrectionsEnabled;
}

- (BOOL)announceOrientationChanges
{
  return 0;
}

- (void)_setDeviceOrientation:(int64_t)a3 shouldAnnounce:(BOOL)a4 updateApplication:(BOOL)a5
{
  BOOL v5 = a5;
  if (self->_orientation > 1uLL)
  {
    self->_orientation = 1LL;
    if (a4) {
      unsigned int v7 = -[VOTWorkspace announceOrientationChanges](self, "announceOrientationChanges", a3);
    }
    else {
      unsigned int v7 = 0;
    }
  }

  else
  {
    if ((byte_1001ACE51 & 1) != 0) {
      return;
    }
    unsigned int v7 = 0;
    self->_orientation = 1LL;
  }

  id v33 = (id)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace selectedLanguage]);
  switch(self->_orientation)
  {
    case 0LL:
    case 1LL:
      -[VOTEventFactory setOrientation:](self->_eventFactory, "setOrientation:", 0LL);
      byte_1001ACE51 = 1;
      uint64_t v8 = off_1001AC148;
      id v9 = @"rotate.portrait";
      goto LABEL_12;
    case 2LL:
      -[VOTEventFactory setOrientation:](self->_eventFactory, "setOrientation:", 1LL);
      byte_1001ACE51 = 1;
      uint64_t v8 = off_1001AC148;
      id v9 = @"rotate.portrait.upsidedown";
LABEL_12:
      id v12 = sub_10004AE68(v8, v9, 0LL, v33);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v10 = 0LL;
      break;
    case 3LL:
      -[VOTEventFactory setOrientation:](self->_eventFactory, "setOrientation:", 3LL);
      byte_1001ACE51 = 1;
      id v13 = sub_10004AE68(off_1001AC148, @"rotate.landscape.left", 0LL, v33);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int HasHomeButton = AXDeviceHasHomeButton(v11);
      uint64_t v15 = off_1001AC148;
      if (HasHomeButton) {
        id v16 = @"landscape.right.hint";
      }
      else {
        id v16 = @"landscape.right.hint.charge.port";
      }
      goto LABEL_19;
    case 4LL:
      -[VOTEventFactory setOrientation:](self->_eventFactory, "setOrientation:", 2LL);
      byte_1001ACE51 = 1;
      id v17 = sub_10004AE68(off_1001AC148, @"rotate.landscape.right", 0LL, v33);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v18 = AXDeviceHasHomeButton(v11);
      uint64_t v15 = off_1001AC148;
      if (v18) {
        id v16 = @"landscape.left.hint";
      }
      else {
        id v16 = @"landscape.left.hint.charge.port";
      }
LABEL_19:
      id v19 = sub_10004AE68(v15, v16, 0LL, v33);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v19);
      break;
    default:
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      break;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementManagementProtocol currentElement](self->_elementManager, "currentElement"));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 application]);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication"));
  if (v7
    && -[VOTElementManagementProtocol shouldAllowSpeaking](self->_elementManager, "shouldAllowSpeaking"))
  {
    unsigned __int8 v23 = [v21 isTourGuideRunning];
  }

  else
  {
    unsigned __int8 v23 = 1;
  }

  if (([v22 isSystemSleeping] & 1) == 0)
  {
    char v24 = -[VOTWorkspace currentCallState](self, "currentCallState") ? 1 : v23;
    if ((v24 & 1) == 0)
    {
      id v25 = sub_10000BBB0(v11, 1, v33);
      if (v10)
      {
        if ([(id)VOTSharedWorkspace hintsEnabled])
        {
          id v26 = [objc_allocWithZone((Class)VOTOutputRequest) init];
          LODWORD(v27) = 1061997773;
          [v26 addPause:v27];
          id v28 = [v26 addString:v10 withLanguage:v33];
          [v26 send];
        }
      }
    }
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
  [v29 setCursorFrameForElement:0];

  if (v5)
  {
    elementManager = self->_elementManager;
    os_log_type_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    -[VOTElementManagementProtocol performSelector:withObject:afterDelay:]( elementManager,  "performSelector:withObject:afterDelay:",  "updateApplicationAndSpeak:",  v31,  0.35);
  }

  else
  {
    os_log_type_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager"));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
    [v31 setCursorFrameForElement:v32];
  }
}

- (BOOL)imageCaptionsEnabled
{
  return self->_imageCaptionsEnabled;
}

- (BOOL)textDetectionEnabled
{
  return self->_textDetectionEnabled;
}

- (BOOL)buttonIconDetectionEnabled
{
  return self->_buttonIconDetectionEnabled;
}

- (int64_t)deviceOrientation
{
  return self->_orientation;
}

- (int64_t)applicationOrientation
{
  return self->_applicationOrientation;
}

- (void)resetOrientation
{
}

- (void)_resetOrientationAndAnnounce:(BOOL)a3 updateApplication:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace applicationForCurrentElement]);
  id v8 = [v7 applicationOrientation];

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
    id v8 = [v9 applicationOrientation];
  }

  self->_applicationOrientation = (int64_t)v8;
  if (self->_forcedOrientation) {
    int64_t forcedOrientation = self->_forcedOrientation;
  }
  else {
    int64_t forcedOrientation = (int64_t)v8;
  }
  -[VOTWorkspace _setDeviceOrientation:shouldAnnounce:updateApplication:]( self,  "_setDeviceOrientation:shouldAnnounce:updateApplication:",  forcedOrientation,  v5,  v4);
}

- (void)rotateDeviceOrientation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement systemAppApplication](&OBJC_CLASS___VOTElement, "systemAppApplication"));
  id v5 = [v4 applicationOrientation];

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 1uLL:
      BOOL v6 = !v3;
      uint64_t v7 = 3LL;
      goto LABEL_9;
    case 2uLL:
      BOOL v8 = !v3;
      uint64_t v9 = 3LL;
      goto LABEL_5;
    case 3uLL:
      BOOL v8 = !v3;
      uint64_t v9 = 1LL;
LABEL_5:
      if (v8) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9;
      }
      goto LABEL_12;
    case 4uLL:
      BOOL v6 = !v3;
      uint64_t v7 = 1LL;
LABEL_9:
      if (v6) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
LABEL_12:
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[VOTElement systemWideElement](&OBJC_CLASS___VOTElement, "systemWideElement"));
      [v11 setDeviceOrientation:v10];

      break;
    default:
      return;
  }

- (void)resetSystemBatteryLowState
{
  int isSystemBatteryLow = self->_isSystemBatteryLow;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication"));
  unsigned int v5 = [v4 isSystemBatteryLow];

  if (isSystemBatteryLow != v5)
  {
    self->_isSystemBatteryLow ^= 1u;
    [(id)VOTSharedWorkspace refreshBraille:0 rotorSelection:0];
  }

- (void)performHomeButtonPress
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation buttonRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "buttonRepresentationWithType:",  1000LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  [v3 postEvent:v2 systemEvent:1];

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation buttonRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "buttonRepresentationWithType:",  1001LL));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  [v4 postEvent:v5 systemEvent:1];

  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.15);
}

- (void)performVolumeUpButtonPress
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v3 pressVolumeUpButtonDown];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 liftVolumeUpButtonUp];

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation buttonRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "buttonRepresentationWithType:",  1007LL));
  -[VOTWorkspace performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_wst_handleVolumeButtonPress:",  v5,  0LL);
}

- (void)performVolumeDownButtonPress
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v3 pressVolumeDownButtonDown];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v4 liftVolumeDownButtonUp];

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation buttonRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "buttonRepresentationWithType:",  1009LL));
  -[VOTWorkspace performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_wst_handleVolumeButtonPress:",  v5,  0LL);
}

- (void)performEjectButtonPress
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  unsigned __int8 v4 = [v3 handleShowOnscreenKeyboardToggle];

  if ((v4 & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation buttonRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "buttonRepresentationWithType:",  1029LL));
    -[VOTWorkspace performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_wst_handleMediaKeyPress:",  v5,  0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation buttonRepresentationWithType:]( &OBJC_CLASS___AXEventRepresentation,  "buttonRepresentationWithType:",  1030LL));

    -[VOTWorkspace performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_wst_handleMediaKeyPress:",  v6,  0LL);
  }

- (void)performNextLanguageButtonPress
{
  keyPostingQueue = (dispatch_queue_s *)self->_keyPostingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000461E8;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_async(keyPostingQueue, block);
}

- (void)_postNextLanguageEvent
{
}

- (void)refreshBraille:(BOOL)a3 rotorSelection:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent brailleEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "brailleEventWithCommand:info:",  kVOTEventCommandBrailleRefreshBrailleLine,  0LL));
  id v6 = v5;
  uint64_t v7 = &kCFBooleanTrue;
  if (!v4) {
    uint64_t v7 = &kCFBooleanFalse;
  }
  [v5 setObject:*v7 forIndex:106];
  if (v8) {
    [v6 setObject:v8 forIndex:109];
  }
  [(id)VOTSharedWorkspace dispatchCommand:v6];
}

- (void)setSpeechLogging:(BOOL)a3
{
  self->_vtwFlags.speechLogging = a3;
}

- (BOOL)speechLogging
{
  return self->_vtwFlags.speechLogging;
}

- (void)setSoundMuted:(BOOL)a3
{
  self->_soundMuted = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  -[VOTWorkspace setLastSoundMuteToggleTime:](self, "setLastSoundMuteToggleTime:", Current);
}

- (void)setSpeechMuted:(BOOL)a3
{
  self->_speechMuted = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  -[VOTWorkspace setLastSpeechMuteToggleTime:](self, "setLastSpeechMuteToggleTime:", Current);
}

- (BOOL)speechMuted
{
  return self->_speechMuted;
}

- (void)userInteractedWithDevice
{
  self->_lastDeviceInteractionEvent = CFAbsoluteTimeGetCurrent();
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  [v3 setLastUserInteractionTime:self->_lastDeviceInteractionEvent];
}

- (void)unmuteEligibleEventOccured
{
  self->_lastUnmuteEvent = CFAbsoluteTimeGetCurrent();
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  [v3 setLastUserInteractionTime:self->_lastUnmuteEvent];
}

- (void)screenLockOccurred
{
  self->_lastDeviceLock = CFAbsoluteTimeGetCurrent();
  -[VOTEventFactory screenLockOccurred](self->_eventFactory, "screenLockOccurred");
}

- (void)setScreenOn:(BOOL)a3 silently:(BOOL)a4
{
  self->_screenOn = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (a3)
  {
    self->_screenOnTime = Current;
    if (!a4) {
      -[VOTWorkspace unmuteEligibleEventOccured](self, "unmuteEligibleEventOccured");
    }
  }

  else
  {
    self->_screenOffTime = Current;
  }

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (BOOL)voiceOverIsIdle
{
  return 0;
}

- (double)speechRateFromSettings
{
  if (!self->_inUnitTestMode) {
    return _AXSVoiceOverTouchSpeakingRate();
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace unitTestSpeechRate](self, "unitTestSpeechRate"));

  if (!v3) {
    return _AXSVoiceOverTouchSpeakingRate();
  }
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace unitTestSpeechRate](self, "unitTestSpeechRate"));
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (int)_callCenterQueue_currentCallState
{
  return 0;
}

- (int)currentCallState
{
  if (self->_inUnitTestMode) {
    return -[VOTWorkspace currentCallStateForUnitTests](self, "currentCallStateForUnitTests");
  }
  else {
    return 0;
  }
}

- (void)_activeAudioRouteChanged:(id)a3
{
  avAccessQueue = (dispatch_queue_s *)self->_avAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046550;
  block[3] = &unk_100176D38;
  block[4] = self;
  dispatch_async(avAccessQueue, block);
}

- (void)_localeChanged:(id)a3
{
}

- (BOOL)tapAndHoldMode
{
  return -[VOTEventFactory tapAndHoldMode](self->_eventFactory, "tapAndHoldMode");
}

- (BOOL)isAudioRoutedToSpeaker
{
  return self->_vtwFlags.audioIsRoutedToSpeaker;
}

- (BOOL)userUnlockedDevice
{
  if (self->_inUnitTestMode && -[VOTWorkspace overridePropertiesForTesting](self, "overridePropertiesForTesting")) {
    return -[VOTWorkspace userUnlockedDeviceForUnitTesting](self, "userUnlockedDeviceForUnitTesting");
  }
  else {
    return self->_lastDeviceLock < self->_lastUnmuteEvent;
  }
}

- (BOOL)userRecentlyUnlockedDevice
{
  if (self->_inUnitTestMode && -[VOTWorkspace overridePropertiesForTesting](self, "overridePropertiesForTesting")) {
    return -[VOTWorkspace userRecentlyUnlockedDeviceForUnitTesting](self, "userRecentlyUnlockedDeviceForUnitTesting");
  }
  double Current = CFAbsoluteTimeGetCurrent();
  return Current - self->_lastLockButtonPress < 4.0 || Current - self->_lastHomeButtonPress < 4.0;
}

- (BOOL)isRingerSwitchSilent
{
  if (self->_inUnitTestMode && -[VOTWorkspace overridePropertiesForTesting](self, "overridePropertiesForTesting")) {
    return -[VOTWorkspace isRingerSwitchSilentForUnitTesting](self, "isRingerSwitchSilentForUnitTesting");
  }
  if ((byte_1001ACE52 & 1) == 0)
  {
    -[VOTWorkspace handleRingerSwitchSwitched:](self, "handleRingerSwitchSwitched:", 0LL);
    byte_1001ACE52 = 1;
  }

  return self->_vtwFlags.ringerSwitchSilent;
}

- (double)lastLockButtonPressTime
{
  return self->_lastLockButtonPress;
}

- (NSArray)languageRotorItems
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace additionalLanguageRotorItem](self, "additionalLanguageRotorItem"));

  if (v3)
  {
    uint64_t v15 = @"RotorItem";
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace additionalLanguageRotorItem](self, "additionalLanguageRotorItem"));
    id v16 = v4;
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  }

  -[NSLock lock](self->_systemLangaugeLock, "lock");
  enabledLanguageRotorItems = self->_enabledLanguageRotorItems;
  if (!enabledLanguageRotorItems)
  {
    -[VOTWorkspace preferencesLanguageRotorItemsChanged:](self, "preferencesLanguageRotorItemsChanged:", 0LL);
    enabledLanguageRotorItems = self->_enabledLanguageRotorItems;
  }

  id v6 = -[NSArray copy](enabledLanguageRotorItems, "copy");
  -[NSLock unlock](self->_systemLangaugeLock, "unlock");
  if (v6)
  {
    if (v3) {
      id v7 = (id)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObject:v3]);
    }
    else {
      id v7 = v6;
    }
    uint64_t v10 = v7;
  }

  else if (v3)
  {
    v13[0] = @"Default";
    v13[1] = @"RotorItem";
    v14[0] = &__kCFBooleanTrue;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace systemSpokenLanguage]);
    v14[1] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

    v12[0] = v3;
    v12[1] = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return (NSArray *)v10;
}

- (NSArray)brailleLanguageRotorItems
{
  enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
  if (!enabledBrailleLanguageRotorItems)
  {
    -[VOTWorkspace preferencesBrailleLanguageRotorItemsChanged:]( self,  "preferencesBrailleLanguageRotorItemsChanged:",  0LL);
    enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
  }

  return enabledBrailleLanguageRotorItems;
}

- (void)unitTestSetBrailleRotorItems:(id)a3
{
  id v6 = a3;
  if (-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
  {
    BOOL v4 = (NSArray *)[v6 copy];
    enabledBrailleLanguageRotorItems = self->_enabledBrailleLanguageRotorItems;
    self->_enabledBrailleLanguageRotorItems = v4;
  }
}

- (void)setSelectedLanguage:(id)a3
{
  id v8 = a3;
  -[NSLock lock](self->_systemLangaugeLock, "lock");
  if (([v8 isEqualToString:self->_selectedLanguage] & 1) == 0
    && ((p_selectedLanguage = &self->_selectedLanguage, v8) || *p_selectedLanguage))
  {
    objc_storeStrong((id *)p_selectedLanguage, a3);
    -[NSLock unlock](self->_systemLangaugeLock, "unlock");
    selectedLanguage = self->_selectedLanguage;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v7 setVoiceOverSelectedLanguage:selectedLanguage];
  }

  else
  {
    -[NSLock unlock](self->_systemLangaugeLock, "unlock");
  }
}

- (NSString)selectedLanguage
{
  id v3 = (NSString *)-[NSString copy](self->_selectedLanguage, "copy");
  if (AXDeviceIsAudioAccessory(v3, v4))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100046C08;
    block[3] = &unk_100176D38;
    block[4] = self;
    if (qword_1001ACE58 != -1) {
      dispatch_once(&qword_1001ACE58, block);
    }
    audioAccessoryInstalledAssetLanguage = self->_audioAccessoryInstalledAssetLanguage;
    if (audioAccessoryInstalledAssetLanguage)
    {
      id v6 = audioAccessoryInstalledAssetLanguage;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[VSMobileAssetsManager sharedManager](&OBJC_CLASS___VSMobileAssetsManager, "sharedManager"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeVoiceAssets]);

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 voiceData]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 languages]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

      if (v12)
      {
        id v13 = [v12 copy];

        id v14 = (NSString *)v13;
        id v3 = v14;
      }

      else
      {
        id v14 = 0LL;
      }

      id v6 = v3;
      uint64_t v15 = self->_audioAccessoryInstalledAssetLanguage;
      self->_audioAccessoryInstalledAssetLanguage = v14;

      id v3 = (NSString *)v8;
    }

    id v3 = v6;
  }

  -[NSLock unlock](self->_systemLangaugeLock, "unlock");
  if (!v3)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 determineActivityForElement:v18]);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 voiceIdentifier]);
    if (v20)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 voiceIdentifier]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[TTSSpeechSynthesizer voiceForIdentifier:]( &OBJC_CLASS___TTSSpeechSynthesizer,  "voiceForIdentifier:",  v21));
      id v16 = (NSString *)objc_claimAutoreleasedReturnValue([v22 language]);

      goto LABEL_15;
    }
  }

  id v16 = v3;
LABEL_15:

  return v16;
}

- (void)updateSelectedLanguage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v3 preferenceForKey:@"SelectedLanguage"]);

  if (v8)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
    [v4 setPreference:0 forKey:@"SelectedLanguage"];
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v4 voiceOverSelectedLanguage]);
  }

  uint64_t v5 = AXLanguageConvertToCanonicalForm(v8);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
  selectedLanguage = self->_selectedLanguage;
  self->_selectedLanguage = v6;

  -[NSLock unlock](self->_systemLangaugeLock, "unlock");
}

- (void)setSelectedBrailleTable:(id)a3
{
  id v13 = a3;
  if (([v13 isEqual:self->_selectedBrailleTable] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedBrailleTable, a3);
    if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v6 setVoiceOverBrailleTableIdentifier:v5];

      id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v8 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v7];
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v10 = [v9 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    if (v10)
    {
      objc_storeStrong((id *)&self->_selectedBrailleInputTable, a3);
      if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        [v12 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v11];
      }
    }
  }
}

- (BRLTTable)selectedBrailleTable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleTable]);
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = objc_alloc(&OBJC_CLASS___BRLTTable);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleTable]);
  uint64_t v9 = -[BRLTTable initWithIdentifier:](v7, "initWithIdentifier:", v8);

  uint64_t v10 = VOTLogActivities();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Using activity table: %@", (uint8_t *)&v13, 0xCu);
  }

  if (!v9) {
LABEL_5:
  }
    uint64_t v9 = self->_selectedBrailleTable;

  return v9;
}

- (void)_selectedBrailleTableChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 voiceOverTouchBrailleDisplayOutputTableIdentifier]);

  if (v7)
  {
    uint64_t v4 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v7);
    selectedBrailleTable = self->_selectedBrailleTable;
    self->_selectedBrailleTable = v4;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  [v6 updateBrailleLanguage];
}

- (void)setSelectedBrailleInputTable:(id)a3
{
  id v11 = a3;
  if (([v11 isEqual:self->_selectedBrailleInputTable] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedBrailleInputTable, a3);
    if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v6 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v5];
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v8 = [v7 voiceOverTouchBrailleDisplaySyncInputOutputTables];

    if (v8)
    {
      objc_storeStrong((id *)&self->_selectedBrailleTable, a3);
      if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        [v10 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v9];
      }
    }
  }
}

- (BRLTTable)selectedBrailleInputTable
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace elementManager](self, "elementManager"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace currentElement](self, "currentElement"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 determineActivityForElement:v4]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleInputTable]);
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = objc_alloc(&OBJC_CLASS___BRLTTable);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 brailleInputTable]);
  uint64_t v9 = -[BRLTTable initWithIdentifier:](v7, "initWithIdentifier:", v8);

  uint64_t v10 = VOTLogActivities();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Using activity input table: %@",  (uint8_t *)&v13,  0xCu);
  }

  if (!v9) {
LABEL_5:
  }
    uint64_t v9 = self->_selectedBrailleInputTable;

  return v9;
}

- (void)_selectedBrailleInputTableChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 voiceOverTouchBrailleDisplayInputTableIdentifier]);

  if (v7)
  {
    uint64_t v4 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v7);
    selectedBrailleInputTable = self->_selectedBrailleInputTable;
    self->_selectedBrailleInputTable = v4;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager"));
  [v6 updateBrailleLanguage];
}

- (void)setSelectedBrailleGesturesInputTable:(id)a3
{
  id v7 = a3;
  if (([v7 isEqual:self->_selectedBrailleGesturesInputTable] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedBrailleGesturesInputTable, a3);
    if (!-[VOTWorkspace inUnitTestMode](self, "inUnitTestMode"))
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v6 setVoiceOverTouchBrailleGesturesInputTableIdentifier:v5];
    }
  }
}

- (id)selectedBrailleGesturesInputTable:(id)a3
{
  return self->_selectedBrailleGesturesInputTable;
}

- (void)_selectedBrailleGesturesInputTableChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 voiceOverTouchBrailleGesturesInputTableIdentifier]);

  if (v6)
  {
    uint64_t v4 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v6);
    selectedBrailleGesturesInputTable = self->_selectedBrailleGesturesInputTable;
    self->_selectedBrailleGesturesInputTable = v4;
  }
}

- (BOOL)isBaseSystemSpokenEqualToLocalization
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace systemSpokenLanguage](self, "systemSpokenLanguage"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace selectedLanguage](self, "selectedLanguage"));
  if (v4)
  {
    if (v3)
    {
      id v5 = [v3 rangeOfString:@"-"];
      if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 substringToIndex:v5]);

        id v3 = (void *)v6;
      }

      id v7 = [v4 rangeOfString:@"-"];
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 substringToIndex:v7]);

        uint64_t v4 = (void *)v8;
      }

      unsigned __int8 v9 = [v3 isEqualToString:v4];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (id)applicationForCurrentElement
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementManagementProtocol currentElement](self->_elementManager, "currentElement"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace applicationForElement:](self, "applicationForElement:", v3));

  return v4;
}

- (id)applicationForElement:(id)a3
{
  id v4 = a3;
  if ([v4 isApplication])
  {
    uint64_t v5 = AXRetainAutorelease(v4);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
LABEL_5:
    id v7 = (id)v6;
    goto LABEL_15;
  }

  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 elementForAttribute:2017]);
    goto LABEL_5;
  }

  signed int v8 = [v4 pid];
  if (v8 != kAXUIServerFakePid && v8 <= -2) {
    int v10 = -v8;
  }
  else {
    int v10 = v8;
  }
  uint64_t v30 = 0LL;
  os_log_type_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_100047808;
  uint64_t v34 = sub_100047818;
  id v35 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100047820;
  v27[3] = &unk_100177CC8;
  uint64_t v29 = &v30;
  v27[4] = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10));
  id v28 = v11;
  AX_PERFORM_WITH_LOCK(&self->_appCacheLock, v27);
  id v12 = (void *)v31[5];
  if (!v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 elementForAttribute:2017]);
    id v14 = (void *)v31[5];
    v31[5] = v13;

    int v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    id v20 = sub_100047874;
    __int128 v21 = &unk_100177CF0;
    id v25 = &v30;
    int v26 = v10;
    id v22 = v4;
    unsigned __int8 v23 = self;
    id v24 = v11;
    AX_PERFORM_WITH_LOCK(&self->_appCacheLock, &v18);
    id v15 = objc_msgSend((id)v31[5], "copyWithCache", v18, v19, v20, v21);
    id v16 = (void *)v31[5];
    v31[5] = (uint64_t)v15;

    id v12 = (void *)v31[5];
  }

  id v7 = v12;

  _Block_object_dispose(&v30, 8);
LABEL_15:

  return v7;
}

- (id)applicationForPID:(int)a3
{
  uint64_t v7 = 0LL;
  signed int v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  int v10 = sub_100047808;
  id v11 = sub_100047818;
  id v12 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000479C4;
  v5[3] = &unk_100177D18;
  v5[4] = self;
  v5[5] = &v7;
  int v6 = a3;
  AX_PERFORM_WITH_LOCK(&self->_appCacheLock, v5);
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (VOTElementManagementProtocol)elementManager
{
  return self->_elementManager;
}

- (VOTRotorManagementProtocol)rotorManager
{
  return self->_rotorManager;
}

- (BOOL)outputDisabled
{
  return self->_outputDisabled;
}

- (BOOL)navigationStyleHonorsGroups
{
  return 0;
}

- (BOOL)_userHasDisabledUSBRM
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  BOOL v3 = [v2 userBoolValueForSetting:MCFeatureUSBRestrictedModeAllowed] == 2;

  return v3;
}

- (void)_setUSBRMPreferenceDisabled
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v2 setBoolValue:0 forSetting:MCFeatureUSBRestrictedModeAllowed];

  int v3 = _AXSGetUSBRMDisablers();
  _AXSSetUSBRMDisablers(v3 | 1u);
}

- (void)handleBluetoothBrailleDisplayConnected
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferenceForKey:@"kVOTBTAlwaysOnAsk"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
    [v5 setPreference:&__kCFBooleanTrue forKey:@"kVOTBTAlwaysOnAsk"];
  }

- (id)_validateAssetFromResults:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:]( &OBJC_CLASS___AXAsset,  "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:",  v3,  @"Stable",  @"en",  1LL,  0LL));
  if (!v4) {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXAsset newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:]( &OBJC_CLASS___AXAsset,  "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:",  v3,  @"Stable",  @"en",  0LL,  1LL));
  }

  return v4;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = VOTLogCommon(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Refreshed assets: %@ %@", buf, 0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace _validateAssetFromResults:](self, "_validateAssetFromResults:", v8));
  uint64_t v13 = VOTLogCommon(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Using asset: %@", buf, 0xCu);
  }

  if (v12)
  {
    id v15 = [v12 isInstalled];
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = VOTLogCommon(v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Downloading asset: %@", buf, 0xCu);
      }

      assetController = self->_assetController;
      id v20 = v12;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
      -[AXAssetController downloadAssets:successStartBlock:]( assetController,  "downloadAssets:successStartBlock:",  v19,  &stru_100177D38);
    }
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = VOTLogCommon();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Finished downloading: %@ %@",  (uint8_t *)&v12,  0x16u);
  }
}

- (void)assetController:(id)a3 didUpdateCatalogForPolicy:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = VOTLogCommon(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Did update catalog: %@ %@ %@",  (uint8_t *)&v13,  0x20u);
  }
}

- (void)handleUSBMFiBrailleDisplayConnected
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if (([v3 voiceOverUserDidReadUSBRestrictedModeAlert] & 1) == 0
    && !-[VOTWorkspace _userHasDisabledUSBRM](self, "_userHasDisabledUSBRM"))
  {

    goto LABEL_6;
  }

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v5 = [v4 voiceOverShouldDisallowUSBRestrictedMode];

  if (v5)
  {
LABEL_6:
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v6 setVoiceOverShouldDisallowUSBRestrictedMode:0];
  }

- (CGPoint)convertDevicePointToZoomedPoint:(CGPoint)a3
{
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSString)systemSpokenLanguage
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTWorkspace unitTestSystemSpokenLanguage](self, "unitTestSystemSpokenLanguage"));

  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTWorkspace unitTestSystemSpokenLanguage](self, "unitTestSystemSpokenLanguage"));
  }

  else
  {
    -[NSLock lock](self->_systemLangaugeLock, "lock");
    id v4 = -[NSString copy](self->_systemSpokenLanguage, "copy");
    -[NSLock unlock](self->_systemLangaugeLock, "unlock");
  }

  return (NSString *)v4;
}

- (void)setUnitTestSystemSpokenLanguage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputManager outputManager](&OBJC_CLASS___VOTOutputManager, "outputManager"));

  [v5 updateSupportedLanguageMap];
}

- (BOOL)soundMuted
{
  return self->_soundMuted;
}

- (BOOL)voiceOverMuted
{
  return self->_voiceOverMuted;
}

- (int64_t)navigateImagesOption
{
  return self->_navigateImagesOption;
}

- (void)setNavigateImagesOption:(int64_t)a3
{
  self->_navigateImagesOption = a3;
}

- (BOOL)typingPitchChangeEnabled
{
  return self->_typingPitchChangeEnabled;
}

- (void)setTypingPitchChangeEnabled:(BOOL)a3
{
  self->_typingPitchChangeEnabled = a3;
}

- (NSString)additionalLanguageRotorItem
{
  return self->additionalLanguageRotorItem;
}

- (void)setAdditionalLanguageRotorItem:(id)a3
{
}

- (double)lastHomeButtonPress
{
  return self->_lastHomeButtonPress;
}

- (void)setLastHomeButtonPress:(double)a3
{
  self->_lastHomeButtonPress = a3;
}

- (double)lastLockButtonPress
{
  return self->_lastLockButtonPress;
}

- (void)setLastLockButtonPress:(double)a3
{
  self->_lastLockButtonPress = a3;
}

- (double)lastKeyboardKeyPress
{
  return self->_lastKeyboardKeyPress;
}

- (void)setLastKeyboardKeyPress:(double)a3
{
  self->_lastKeyboardKeyPress = a3;
}

- (BOOL)screenCurtainEnabled
{
  return self->_screenCurtainEnabled;
}

- (BOOL)isSystemBatteryLow
{
  return self->_isSystemBatteryLow;
}

- (void)setIsSystemBatteryLow:(BOOL)a3
{
  self->_int isSystemBatteryLow = a3;
}

- (int64_t)rotorType
{
  return self->_cachedRotorType;
}

- (void)setRotorType:(int64_t)a3
{
  self->_cachedRotorType = a3;
}

- (BOOL)speakingRateInRotor
{
  return self->_speakingRateInRotor;
}

- (void)setSpeakingRateInRotor:(BOOL)a3
{
  self->_speakingRateInRotor = a3;
}

- (void)setOutputDisabled:(BOOL)a3
{
  self->_outputDisabled = a3;
}

- (BOOL)playKeyboardClicksOnHWInput
{
  return self->_playKeyboardClicksOnHWInput;
}

- (void)setPlayKeyboardClicksOnHWInput:(BOOL)a3
{
  self->_playKeyboardClicksOnHWInput = a3;
}

- (id)testingEventListener
{
  return self->testingEventListener;
}

- (void)setTestingEventListener:(id)a3
{
}

- (double)screenOnTime
{
  return self->_screenOnTime;
}

- (void)setScreenOnTime:(double)a3
{
  self->_screenOnTime = a3;
}

- (void)setPreviousRotorVoiceIdentifier:(id)a3
{
}

- (int64_t)notificationsWhenLockedOutput
{
  return self->notificationsWhenLockedOutput;
}

- (void)setNotificationsWhenLockedOutput:(int64_t)a3
{
  self->notificationsWhenLockedOutput = a3;
}

- (int64_t)bannerNotificationsOutput
{
  return self->bannerNotificationsOutput;
}

- (void)setBannerNotificationsOutput:(int64_t)a3
{
  self->bannerNotificationsOutput = a3;
}

- (BOOL)useRingerSwitchForNotificationOutput
{
  return self->useRingerSwitchForNotificationOutput;
}

- (void)setUseRingerSwitchForNotificationOutput:(BOOL)a3
{
  self->useRingerSwitchForNotificationOutput = a3;
}

- (double)lastSpeechMuteToggleTime
{
  return self->_lastSpeechMuteToggleTime;
}

- (void)setLastSpeechMuteToggleTime:(double)a3
{
  self->_lastSpeechMuteToggleTime = a3;
}

- (double)lastSoundMuteToggleTime
{
  return self->_lastSoundMuteToggleTime;
}

- (void)setLastSoundMuteToggleTime:(double)a3
{
  self->_lastSoundMuteToggleTime = a3;
}

- (void)setVoiceOverIsIdle:(BOOL)a3
{
  self->_voiceOverIsIdle = a3;
}

- (BOOL)screenCurtainSuspended
{
  return self->_screenCurtainSuspended;
}

- (BOOL)wasEnabledThroughAccessory
{
  return self->_wasEnabledThroughAccessory;
}

- (void)setWasEnabledThroughAccessory:(BOOL)a3
{
  self->_wasEnabledThroughAccessory = a3;
}

- (BOOL)supportsHomeGestures
{
  return self->_supportsHomeGestures;
}

- (void)setSupportsHomeGestures:(BOOL)a3
{
  self->_supportsHomeGestures = a3;
}

- (BOOL)accessoryShutdownInProgress
{
  return self->_accessoryShutdownInProgress;
}

- (void)setAccessoryShutdownInProgress:(BOOL)a3
{
  self->_accessoryShutdownInProgress = a3;
}

- (BOOL)inUnitTestMode
{
  return self->_inUnitTestMode;
}

- (void)setInUnitTestMode:(BOOL)a3
{
  self->_inUnitTestMode = a3;
}

- (BOOL)inPerformanceTestMode
{
  return self->_inPerformanceTestMode;
}

- (void)setInPerformanceTestMode:(BOOL)a3
{
  self->_inPerformanceTestMode = a3;
}

- (BOOL)isSiriTalking
{
  return self->_isSiriTalking;
}

- (void)setIsSiriTalking:(BOOL)a3
{
  self->_isSiriTalking = a3;
}

- (BOOL)isSiriListening
{
  return self->_isSiriListening;
}

- (void)setIsSiriListening:(BOOL)a3
{
  self->_isSiriListening = a3;
}

- (BOOL)isOnenessActive
{
  return self->_isOnenessActive;
}

- (void)setIsOnenessActive:(BOOL)a3
{
  self->_isOnenessActive = a3;
}

- (BOOL)duckingTemporarilyDisabled
{
  return self->_duckingTemporarilyDisabled;
}

- (void)setDuckingTemporarilyDisabled:(BOOL)a3
{
  self->_duckingTemporarilyDisabled = a3;
}

- (BOOL)pauseSpeechAndHaptics
{
  return self->_pauseSpeechAndHaptics;
}

- (void)setPauseSpeechAndHaptics:(BOOL)a3
{
  self->_pauseSpeechAndHaptics = a3;
}

- (unint64_t)customContentImportance
{
  return self->_customContentImportance;
}

- (void)setCustomContentImportance:(unint64_t)a3
{
  self->_customContentImportance = a3;
}

- (NSArray)imageCaptioningDisabledApps
{
  return self->_imageCaptioningDisabledApps;
}

- (void)setImageCaptioningDisabledApps:(id)a3
{
}

- (void)setContainerOutputFeedback:(int64_t)a3
{
  self->_id containerOutputFeedback = a3;
}

- (void)setBrailleFormattingEnabled:(BOOL)a3
{
  self->_brailleFormattingEnabled = a3;
}

- (int64_t)moreContentOutputFeedback
{
  return self->_moreContentOutputFeedback;
}

- (void)setMoreContentOutputFeedback:(int64_t)a3
{
  self->_moreContentOutputFeedback = a3;
}

- (void)setImageCaptionsEnabled:(BOOL)a3
{
  self->_imageCaptionsEnabled = a3;
}

- (void)setTextDetectionEnabled:(BOOL)a3
{
  self->_textDetectionEnabled = a3;
}

- (void)setButtonIconDetectionEnabled:(BOOL)a3
{
  self->_buttonIconDetectionEnabled = a3;
}

- (BOOL)soundEffectsEnabled
{
  return self->_soundEffectsEnabled;
}

- (void)setSoundEffectsEnabled:(BOOL)a3
{
  self->_soundEffectsEnabled = a3;
}

- (int64_t)numberFeedback
{
  return self->_numberFeedback;
}

- (void)setNumberFeedback:(int64_t)a3
{
  self->_numberFeedback = a3;
}

- (int64_t)emojiFeedback
{
  return self->_emojiFeedback;
}

- (void)setEmojiFeedback:(int64_t)a3
{
  self->_emojiFeedback = a3;
}

- (int64_t)navigationDirection
{
  return self->_navigationDirection;
}

- (void)setNavigationDirection:(int64_t)a3
{
  self->_navigationDirection = a3;
}

- (BOOL)captionPanelEnabled
{
  return self->_captionPanelEnabled;
}

- (void)setCaptionPanelEnabled:(BOOL)a3
{
  self->_captionPanelEnabled = a3;
}

- (double)lastTelephonyCallActive
{
  return self->_lastTelephonyCallActive;
}

- (void)setLastTelephonyCallActive:(double)a3
{
  self->_lastTelephonyCallActive = a3;
}

- (BRLTTable)selectedBrailleGesturesInputTable
{
  return self->_selectedBrailleGesturesInputTable;
}

- (BOOL)updateRotorWithElement
{
  return self->_updateRotorWithElement;
}

- (void)setUpdateRotorWithElement:(BOOL)a3
{
  self->_updateRotorWithElement = a3;
}

- (BOOL)largeCursorEnabled
{
  return self->_largeCursorEnabled;
}

- (void)setLargeCursorEnabled:(BOOL)a3
{
  self->_largeCursorEnabled = a3;
}

- (NSMutableDictionary)websiteLanguageMappingOverrides
{
  return self->_websiteLanguageMappingOverrides;
}

- (void)setWebsiteLanguageMappingOverrides:(id)a3
{
}

- (id)punctuationGroupsUpdatedHandler
{
  return self->_punctuationGroupsUpdatedHandler;
}

- (void)setPunctuationGroupsUpdatedHandler:(id)a3
{
}

- (BOOL)reachabilityActive
{
  return self->_reachabilityActive;
}

- (void)setReachabilityActive:(BOOL)a3
{
  self->_reachabilityActive = a3;
}

- (double)reachabilityOffset
{
  return self->_reachabilityOffset;
}

- (void)setReachabilityOffset:(double)a3
{
  self->_reachabilityOffset = a3;
}

- (BOOL)audioDestinationRequestExternal
{
  return self->_audioDestinationRequestExternal;
}

- (void)setAudioDestinationRequestExternal:(BOOL)a3
{
  self->_audioDestinationRequestExternal = a3;
}

- (void)setActivities:(id)a3
{
}

- (int64_t)suppressValueChangeNotificationCount
{
  return self->_suppressValueChangeNotificationCount;
}

- (void)setSuppressValueChangeNotificationCount:(int64_t)a3
{
  self->_suppressValueChangeNotificationCount = a3;
}

- (int64_t)suppressSelectionChangeNotificationCount
{
  return self->_suppressSelectionChangeNotificationCount;
}

- (void)setSuppressSelectionChangeNotificationCount:(int64_t)a3
{
  self->_suppressSelectionChangeNotificationCount = a3;
}

- (int64_t)suppressSelectionChangeNotificationSpeechOutputCount
{
  return self->_suppressSelectionChangeNotificationSpeechOutputCount;
}

- (void)setSuppressSelectionChangeNotificationSpeechOutputCount:(int64_t)a3
{
  self->_suppressSelectionChangeNotificationSpeechOutputCount = a3;
}

- (int64_t)systemVisualizationState
{
  return self->_systemVisualizationState;
}

- (void)setSystemVisualizationState:(int64_t)a3
{
  self->_systemVisualizationState = a3;
}

- (BOOL)systemVolumeControlsAvailablity
{
  return self->_systemVolumeControlsAvailablity;
}

- (void)setSystemVolumeControlsAvailablity:(BOOL)a3
{
  self->_systemVolumeControlsAvailablity = a3;
}

- (AXUISoftwareKeyboardManager)softwareKeyboardManager
{
  return self->_softwareKeyboardManager;
}

- (_TtC3vot11VOTSettings)votSettings
{
  return self->_votSettings;
}

- (void)setVotSettings:(id)a3
{
}

- (void)setBrailleAlertsEnabled:(BOOL)a3
{
  self->_unsigned __int8 brailleAlertsEnabled = a3;
}

- (VOTVisionEngine)visionEngine
{
  return self->_visionEngine;
}

- (void)setVisionEngine:(id)a3
{
}

- (AXMDisplayManager)displayManager
{
  return self->_displayManager;
}

- (void)setDisplayManager:(id)a3
{
}

- (VOSCommandManager)userCommandManager
{
  return self->_userCommandManager;
}

- (void)setUserCommandManager:(id)a3
{
}

- (BOOL)useDigitalCrownNavigation
{
  return self->_useDigitalCrownNavigation;
}

- (BOOL)telephonyIsActive
{
  return self->_telephonyIsActive;
}

- (void)setTelephonyIsActive:(BOOL)a3
{
  self->_telephonyIsActive = a3;
}

- (VOTWorkspaceUnitTestDelegate)unitTestDelegate
{
  return (VOTWorkspaceUnitTestDelegate *)objc_loadWeakRetained((id *)&self->_unitTestDelegate);
}

- (void)setUnitTestDelegate:(id)a3
{
}

- (BOOL)overridePropertiesForTesting
{
  return self->_overridePropertiesForTesting;
}

- (void)setOverridePropertiesForTesting:(BOOL)a3
{
  self->_overridePropertiesForTesting = a3;
}

- (BOOL)userRecentlyUnlockedDeviceForUnitTesting
{
  return self->_userRecentlyUnlockedDeviceForUnitTesting;
}

- (void)setUserRecentlyUnlockedDeviceForUnitTesting:(BOOL)a3
{
  self->_userRecentlyUnlockedDeviceForUnitTesting = a3;
}

- (BOOL)userUnlockedDeviceForUnitTesting
{
  return self->_userUnlockedDeviceForUnitTesting;
}

- (void)setUserUnlockedDeviceForUnitTesting:(BOOL)a3
{
  self->_userUnlockedDeviceForUnitTesting = a3;
}

- (BOOL)isRingerSwitchSilentForUnitTesting
{
  return self->_isRingerSwitchSilentForUnitTesting;
}

- (void)setIsRingerSwitchSilentForUnitTesting:(BOOL)a3
{
  self->_isRingerSwitchSilentForUnitTesting = a3;
}

- (int)currentCallStateForUnitTests
{
  return self->_currentCallStateForUnitTests;
}

- (void)setCurrentCallStateForUnitTests:(int)a3
{
  self->_currentCallStateForUnitTests = a3;
}

- (NSNumber)unitTestSpeechRate
{
  return self->_unitTestSpeechRate;
}

- (void)setUnitTestSpeechRate:(id)a3
{
}

- (NSString)unitTestSystemSpokenLanguage
{
  return self->_unitTestSystemSpokenLanguage;
}

- (NSString)reachabilityIdentifier
{
  return self->_reachabilityIdentifier;
}

- (void)setReachabilityIdentifier:(id)a3
{
}

- (BOOL)disableVoiceOverSettingOnStop
{
  return self->_disableVoiceOverSettingOnStop;
}

- (void)setDisableVoiceOverSettingOnStop:(BOOL)a3
{
  self->_disableVoiceOverSettingOnStop = a3;
}

- (AXCharacterSoundMap)characterSoundMap
{
  return self->_characterSoundMap;
}

- (void)setCharacterSoundMap:(id)a3
{
}

- (OS_dispatch_queue)managedConfigurationQueue
{
  return self->_managedConfigurationQueue;
}

- (void)setManagedConfigurationQueue:(id)a3
{
}

- (OS_os_transaction)votTransaction
{
  return self->_votTransaction;
}

- (void)setVotTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setRotorManager:(id)a3
{
}

- (void)setElementManager:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_elementManager, a3);
}

- (id)lastPostedEventForUnitTesting
{
  return (id)qword_1001ACE60;
}

- (void)notePostedEventForUnitTesting:(id)a3
{
}

- (id)lastScreenChangeTime
{
  return +[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:");
}

- (id)currentElementRotorString
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTElementManagementProtocol elementRotor](self->_elementManager, "elementRotor"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentRotorString]);

  return v3;
}

- (void)_testFetchWebElementRects
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue( -[VOTElementManagementProtocol valueForKey:]( self->_elementManager,  "valueForKey:",  @"_currentElement"));
  id v3 = [v2 doesHaveTraits:kAXWebContentTrait];
  if ((_DWORD)v3)
  {
    uint64_t v4 = VOTLogElement(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v5,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "FetchWebElementRects",  "",  buf,  2u);
    }

    uint64_t v6 = 2000LL;
    do
    {
      id v7 = [v2 updateFrame];
      --v6;
    }

    while (v6);
    uint64_t v8 = VOTLogElement(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "FetchWebElementRects",  "",  v10,  2u);
    }
  }
}

- (double)_updateMainScreenSize:(double)a3 scale:
{
  *(double *)&xmmword_1001AD170 = a1;
  *((double *)&xmmword_1001AD170 + 1) = a2;
  qword_1001AD180 = *(void *)&a3;
  double result = a1 * 0.5;
  *(double *)&xmmword_1001AD190 = result;
  *((double *)&xmmword_1001AD190 + 1) = a2 * 0.5;
  qword_1001AD1A0 = *(void *)&result;
  *(double *)algn_1001AD1A8 = a2 / 3.0;
  return result;
}

@end