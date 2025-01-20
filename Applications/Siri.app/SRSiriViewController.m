@interface SRSiriViewController
+ (double)_contentWidthForWidth:(double)result isPhone:(BOOL)a4 isZoomed:(BOOL)a5 isLargeFormatPad:(BOOL)a6;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)_speechIdentifierForConversationItem:(id)a3;
- ($C83F3EDC964651441187CDEAB72D1F66)keyboardInfoForSiriPresentation:(SEL)a3;
- (AFConversationStore)_conversationStore;
- (AFManagedStorageConnection)_domainObjectStorageConnection;
- (AFUIAudioPlayer)_audioMessagePlayer;
- (AFUIAudioPlayer)_voicemailPlayer;
- (AFUISiriLanguage)_language;
- (AFUISiriSession)_session;
- (BOOL)_isAcousticIdAllowed;
- (BOOL)_isAudioPlayerPlaying;
- (BOOL)_isIdleTimerEnabled;
- (BOOL)_isKeyboardLoweredAfterResponse;
- (BOOL)_isReadingBulletinContentInCarPlayOutsideOfSiriSession;
- (BOOL)_isRequestActive;
- (BOOL)_isSiriIdleAndQuiet;
- (BOOL)_isSpeechSynthesisSpeaking;
- (BOOL)_isStartRequestAceCommandSent;
- (BOOL)_isUserUtteranceTapToEditInProgress;
- (BOOL)_isWaitingForStartRequest;
- (BOOL)_languageMatchesConversation:(id)a3;
- (BOOL)_listenAfterSpeakingForRepeatable;
- (BOOL)_listenAfterSpeakingForRequestFinished;
- (BOOL)_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:(id)a3;
- (BOOL)_presentationSupportsConversationDidChangeWithTransaction:(id)a3;
- (BOOL)_reflectionDialogHasBeenPlayed;
- (BOOL)_resumesInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)_shouldLowerKeyboardForAddViewsCommand:(id)a3;
- (BOOL)_shouldShowDownloadAssetsNotificationPrompt;
- (BOOL)_siriIsShowingPasscodeUnlock;
- (BOOL)_suppressTTSForErrorsAndInterstitials;
- (BOOL)_usesEventDrivenIdleAndQuietUpdates;
- (BOOL)inTextInputModeForSiriPresentation:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAutorotate;
- (BOOL)siriPresentation:(id)a3 itemAtIndexPathIsVirgin:(id)a4;
- (BOOL)siriPresentationIsPresentingSystemUI:(id)a3;
- (BOOL)siriPresentationShouldDelaySuggestions:(id)a3;
- (BOOL)siriSessionShouldRequestUpdateForViewWithIdentifier:(id)a3;
- (BOOL)textInputEnabled;
- (CGRect)_statusBarFrame;
- (CGRect)_systemContentFrame;
- (CGRect)frameForApplication:(id)a3;
- (CGRect)statusBarFrameForSiriPresentation:(id)a3;
- (NSMutableArray)_conversations;
- (NSMutableArray)_repeatablePhrases;
- (NSMutableSet)_completedCommandAppPunchOutIds;
- (NSString)_currentAVRecordRoute;
- (NSString)_utteranceToSpeakAfterClearScreenCommand;
- (NSTimer)_idleTimer;
- (SASRequestOptions)_requestOptions;
- (SAUISayIt)previousSayItCommand;
- (SRPreferences)_preferences;
- (SRSiriViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SRUIFAceCommandRecords)_aceCommandRecords;
- (SiriUIPresentation)presentation;
- (UIView)inputAccessoryView;
- (double)_bottomContentInset;
- (double)_statusViewHeight;
- (double)contentWidthForForSiriPresentation:(id)a3;
- (double)statusViewHeightForSiriPresentation:(id)a3;
- (id)_aceCommandWithIdentifier:(id)a3;
- (id)_activeConversation;
- (id)_activeConversationItemAtIndexPath:(id)a3;
- (id)_analytics;
- (id)_configuredSpeakableUtteranceParserForCommand:(id)a3 context:(id)a4 speakableText:(id)a5 subCompletion:(id)a6 speakPreparation:(id *)a7 speakCompletion:(id *)a8;
- (id)_conversationWithIdentifier:(id)a3;
- (id)_delayedConversationItemRevisionIdentifiers;
- (id)_dialogPhaseForItemAtIndexPath:(id)a3;
- (id)_host;
- (id)_hostWithErrorHandler:(id)a3;
- (id)_instrumentationManager;
- (id)_metricsContextForItemWithAceCommandId:(id)a3;
- (id)_pendingPreSynthesisTasks;
- (id)_presentationViewController;
- (id)_presentedConversationItemRevisionIdentifiers;
- (id)_previousConversation;
- (id)_punchoutMetricsAceCommandIdForItemWithIdentifier:(id)a3;
- (id)_startNewConversation;
- (id)_uiPresentationIdentifier;
- (id)activeRequestOptionsForSiriPresentation:(id)a3;
- (id)audioPlayer:(id)a3 audioURLForCommand:(id)a4;
- (id)conversationIdentifiersForSiriPresentation:(id)a3;
- (id)domainObjectForIdentifier:(id)a3;
- (id)effectiveCoreLocationBundleForSiriPresentation:(id)a3;
- (id)localeForSiriPresentation:(id)a3;
- (id)preferredFocusEnvironments;
- (id)removeAlternativeFeatureViews:(id)a3;
- (id)sessionInfoForSiriPresentation:(id)a3;
- (id)siriPresentation:(id)a3 aceCommandIdentifierForItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 aceObjectForItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 additionalSpeechInterpretationsForRefId:(id)a4;
- (id)siriPresentation:(id)a3 conversationWithIdentifier:(id)a4;
- (id)siriPresentation:(id)a3 dialogPhaseForItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 domainObjectForIdentifier:(id)a4;
- (id)siriPresentation:(id)a3 identifierOfItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 indexPathForItemWithIdentifier:(id)a4;
- (id)siriPresentation:(id)a3 updatedUserUtteranceForRefId:(id)a4;
- (int)_instrumentationPresentationForPresentationOptions:(int64_t)a3;
- (int)_instrumentationResponseModeForMode:(unint64_t)a3;
- (int)_mapSiriTransitionState:(int64_t)a3;
- (int64_t)_presentationOptions;
- (int64_t)_siriState;
- (int64_t)_viewModeFromPresentationOptions:(int64_t)a3;
- (int64_t)siriPresentation:(id)a3 numberOfChildrenForItemAtIndexPath:(id)a4;
- (int64_t)siriPresentation:(id)a3 presentationStateForItemAtIndexPath:(id)a4;
- (int64_t)siriPresentation:(id)a3 typeOfItemAtIndexPath:(id)a4;
- (int64_t)siriPresentationStateForSiriPresentation:(id)a3;
- (int64_t)siriStateForSiriPresentation:(id)a3;
- (unint64_t)_MDModeToSRModeConverter:(unint64_t)a3;
- (unint64_t)_SRModeToMDModeConverter:(unint64_t)a3;
- (unint64_t)_currentModeWithModeProvider:(id)a3;
- (unint64_t)_readoutResultFromTTSResult:(int64_t)a3 error:(id)a4;
- (unint64_t)_readoutResultFromTitleResult:(unint64_t)a3 messageResult:(unint64_t)a4;
- (unint64_t)_responseModeToMDModeConverter:(id)a3;
- (unint64_t)_wasSiriIdleAndQuiet;
- (unint64_t)siriDeviceLockStateForSiriPresentation:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activateConversation:(id)a3;
- (void)_activeRequestOptionsDidChange;
- (void)_addErrorUtterance:(id)a3;
- (void)_audioSessionRouteDidChange:(id)a3;
- (void)_cancelCurrentAudioMessagePlayback:(id)a3;
- (void)_cancelCurrentTTS:(id)a3;
- (void)_cancelIdleTimer;
- (void)_cancelLastRootProvisionalSnippetFromLastRequestInConversation:(id)a3;
- (void)_cancelSpeechSynthesis;
- (void)_checkAndUpdateSiriIdleAndQuietStatusIfNeeded;
- (void)_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded;
- (void)_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:(id)a3;
- (void)_connectionWasInterrupted;
- (void)_connectionWasInvalidated;
- (void)_delayAceCommandSuccess:(id)a3 forDuration:(double)a4;
- (void)_deleteConversationWithIdentifier:(id)a3;
- (void)_deletePreviousConversation;
- (void)_didCompleteActionForAceCommand:(id)a3 success:(BOOL)a4;
- (void)_didReceiveAceCommand:(id)a3;
- (void)_didReceiveAceCommand:(id)a3 completion:(id)a4;
- (void)_didStartActionForAceCommand:(id)a3;
- (void)_didStartActionForItemAtIndexPath:(id)a3 inConversation:(id)a4;
- (void)_dismissWithReason:(int64_t)a3;
- (void)_displayNotReadyError:(id)a3;
- (void)_emitRenderingEnded;
- (void)_emitRenderingStarted;
- (void)_fetchAttendingState:(id)a3;
- (void)_handleRequestError:(id)a3 completion:(id)a4;
- (void)_idleTimerFired:(id)a3;
- (void)_insertUserUtteranceViewForSuggestion:(id)a3;
- (void)_insertUserUtteranceViewForText:(id)a3;
- (void)_invalidateConnection;
- (void)_logAceObjectPresented:(id)a3 dialogPhase:(id)a4;
- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5;
- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5 dialogIdentifierOverride:(id)a6;
- (void)_logPatternExecutedEventForAddViewsCommand:(id)a3;
- (void)_logRevealSpeechCommandReceived:(id)a3;
- (void)_notifyPromptedUserForInput;
- (void)_openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 conversationId:(id)a6 completion:(id)a7;
- (void)_performAceCommand:(id)a3 conversationIdentifier:(id)a4 turnIdentifier:(id)a5 completion:(id)a6;
- (void)_performAppPunchOutCommand:(id)a3 completion:(id)a4;
- (void)_performAppPunchOutCommand:(id)a3 conversationItemIdentifier:(id)a4 completion:(id)a5;
- (void)_performGenericAceCommand:(id)a3 turnIdentifier:(id)a4 completion:(id)a5;
- (void)_performSayItCommand:(id)a3;
- (void)_presentAuthenticationDialogWithText:(id)a3;
- (void)_processAddViewsCommand:(id)a3 forMode:(unint64_t)a4 completion:(id)a5;
- (void)_reflectionDialogHasBeenPlayed:(BOOL)a3;
- (void)_removePreviousConversationFromStore;
- (void)_rescheduleIdleTimerIfNeeded;
- (void)_resetContext;
- (void)_restorePreviousConversation;
- (void)_saveConversationWithCompletion:(id)a3;
- (void)_scheduleAudioResumptionAfterDelayInSec:(double)a3;
- (void)_scheduleIdleTimer;
- (void)_scheduleInterruptedAudioResumingIfNeeded;
- (void)_setAceCommandRecords:(id)a3;
- (void)_setAcousticIdAllowed:(BOOL)a3;
- (void)_setAudioMessagePlayer:(id)a3;
- (void)_setAudioPlayerIsPlaying:(BOOL)a3;
- (void)_setConversations:(id)a3;
- (void)_setCurrentAVRecordRoute:(id)a3;
- (void)_setDelayedConversationItemRevisionIdentifiers:(id)a3;
- (void)_setIdleTimer:(id)a3;
- (void)_setIdleTimerEnabled:(BOOL)a3;
- (void)_setKeyboardLoweredAfterResponse:(BOOL)a3;
- (void)_setListenAfterSpeakingForRepeatable:(BOOL)a3;
- (void)_setListenAfterSpeakingForRequestFinished:(BOOL)a3;
- (void)_setPresentation:(id)a3;
- (void)_setPresentedConversationItemRevisionIdentifiers:(id)a3;
- (void)_setReadingBulletinContentInCarPlayOutsideOfSiriSession:(BOOL)a3;
- (void)_setRepeatablePhrases:(id)a3;
- (void)_setRequestActive:(BOOL)a3;
- (void)_setRequestOptions:(id)a3;
- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3;
- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3 minimized:(BOOL)a4;
- (void)_setSiriState:(int64_t)a3;
- (void)_setStartRequestAceCommandSent:(BOOL)a3;
- (void)_setStatusBarFrame:(CGRect)a3;
- (void)_setStatusViewHeight:(double)a3;
- (void)_setUserUtteranceTapToEditInProgress:(BOOL)a3;
- (void)_setUtteranceToSpeakAfterClearScreenCommand:(id)a3;
- (void)_setVoicemailPlayer:(id)a3;
- (void)_setWaitingForStartRequest:(BOOL)a3;
- (void)_setWasSiriIdleAndQuiet:(unint64_t)a3;
- (void)_setupXPCListener;
- (void)_sharePatternIdFromAddViewsCommand:(id)a3;
- (void)_shouldShowDownloadAssetsNotificationPrompt:(BOOL)a3;
- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifier:(id)a4 delayed:(BOOL)a5;
- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifierDidBecomeReady:(id)a4;
- (void)_speakText:(id)a3 audioData:(id)a4 ignoreMuteSwitch:(BOOL)a5 identifier:(id)a6 sessionId:(id)a7 preferredVoice:(id)a8 language:(id)a9 gender:(id)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 speakableUtteranceParser:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17 preparation:(id)a18 completion:(id)a19;
- (void)_speakText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 provisionally:(BOOL)a7 eligibleAfterDuration:(double)a8 delayed:(BOOL)a9 canUseServerTTS:(BOOL)a10 speakableUtteranceParser:(id)a11 analyticsContext:(id)a12 speakableContextInfo:(id)a13 preparation:(id)a14 completion:(id)a15;
- (void)_startListenAfterSpeaking;
- (void)_startListenAfterSpeakingRequest;
- (void)_startRequestWithOptions:(id)a3;
- (void)_synthesizePhoneticText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6;
- (void)_synthesizeProvisionalText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6;
- (void)_synthesizeSpeechWithText:(id)a3 identifier:(id)a4 sessionId:(id)a5 isPhonetic:(BOOL)a6 provisionally:(BOOL)a7 completion:(id)a8;
- (void)_synthesizeText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6;
- (void)_testDidReceiveAceCommand:(id)a3 completion:(id)a4;
- (void)_updateKeyboardState:(BOOL)a3 minimized:(BOOL)a4;
- (void)_updateKeyboardStateWithError:(id)a3;
- (void)_updateKeyboardStatusForAddViewsCommand:(id)a3;
- (void)_updateLanguageCode;
- (void)aceCommandRecords:(id)a3 didChangeResultForCommand:(id)a4 completion:(id)a5;
- (void)alertDidBeginPlaying:(id)a3;
- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4;
- (void)audioPlayer:(id)a3 didFinishPlayback:(id)a4;
- (void)audioPlayerStartPlaying:(id)a3;
- (void)cancelRequestForSiriPresentation:(id)a3;
- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4;
- (void)conversation:(id)a3 didRemoveItemsWithIdentifiers:(id)a4 atIndexPaths:(id)a5 parentItemIdentifiers:(id)a6;
- (void)dealloc;
- (void)didBeginProcessingConversationItems;
- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4;
- (void)didReceiveBugButtonLongPress;
- (void)didReceiveHelpAction;
- (void)didReceiveOrbViewTapToCancelRequest;
- (void)didReceiveReportBugAction;
- (void)didReceiveShortTapActionWIthRequestOptions:(id)a3;
- (void)disableIdleTimerForSiriPresentation:(id)a3;
- (void)dismissSiriPresentation:(id)a3 withReason:(int64_t)a4;
- (void)dismissSiriResults;
- (void)enableIdleTimerForSiriPresentation:(id)a3;
- (void)forceAudioSessionInactiveForSiriPresentation:(id)a3;
- (void)getScreenshotImageForSiriPresentation:(id)a3 withCompletion:(id)a4;
- (void)handlePasscodeUnlockForSiriPresentation:(id)a3 withCompletion:(id)a4;
- (void)hasContentAtPoint:(id)a3 completion:(id)a4;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3;
- (void)hostApplicationPresentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4;
- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3;
- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4;
- (void)hostApplicationRequestsEmitUIStateTransitionForSiriDismissalWithReason:(int)a3 completion:(id)a4;
- (void)hostApplicationRequestsScreenshotWithCompletion:(id)a3;
- (void)hostApplicationWillEnterForeground;
- (void)hostApplicationWillResignActive;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)notifyClientStateManagerSpeakingBegan:(id)a3;
- (void)notifyClientStateManagerSpeakingEnded:(id)a3;
- (void)notifyClientStateManagerTransactionBegan:(id)a3;
- (void)notifyClientStateManagerTransactionEnded:(id)a3;
- (void)orchestrationDidPresentResponseFullyInApp;
- (void)preloadPluginBundles;
- (void)preloadPresentationBundleWithIdentifier:(id)a3;
- (void)runPPTWithOptions:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setCompletedCommandAppPunchOutIds:(id)a3;
- (void)setDockFrameValue:(id)a3;
- (void)setDomainObject:(id)a3 forIdentifier:(id)a4;
- (void)setHostFrontMostAppOrientation:(int64_t)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setPresentation:(id)a3;
- (void)setPresentation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPreviousSayItCommand:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setSession:(id)a3;
- (void)setStatusBarFrameValue:(id)a3;
- (void)setStatusViewHeightNumber:(id)a3;
- (void)setSystemContentFrame:(CGRect)a3;
- (void)setWaitingForTelephonyToStart:(BOOL)a3;
- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4;
- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidDeactivateWithCompletion:(id)a3;
- (void)siriDidHidePasscodeUnlock;
- (void)siriKeyboardViewDidChange:(id *)a3;
- (void)siriPresentation:(id)a3 activateConversationWithIdentifier:(id)a4;
- (void)siriPresentation:(id)a3 addSelectionResponse:(id)a4;
- (void)siriPresentation:(id)a3 deleteConversationWithIdentifier:(id)a4;
- (void)siriPresentation:(id)a3 didChangePeekMode:(unint64_t)a4;
- (void)siriPresentation:(id)a3 didChangeVisualState:(unint64_t)a4;
- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forConversationItemWithIdentifier:(id)a6 userSelectionResults:(id)a7;
- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forItemAtIndexPath:(id)a6;
- (void)siriPresentation:(id)a3 didDelayPresentationOfItemsWithIdentifiers:(id)a4;
- (void)siriPresentation:(id)a3 didDismissViewController:(id)a4;
- (void)siriPresentation:(id)a3 didEditSpeechRecognized:(id)a4 forInterval:(double)a5;
- (void)siriPresentation:(id)a3 didPresentConversationItemsWithIdentifiers:(id)a4;
- (void)siriPresentation:(id)a3 didPresentIntentWithBundleId:(id)a4;
- (void)siriPresentation:(id)a3 didPresentItemsAtIndexPaths:(id)a4;
- (void)siriPresentation:(id)a3 didPresentViewController:(id)a4;
- (void)siriPresentation:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4;
- (void)siriPresentation:(id)a3 didScrollForInterval:(double)a4 metricsContext:(id)a5;
- (void)siriPresentation:(id)a3 didShowAceViewWithIdentifier:(id)a4 aceViewClass:(Class)a5 metricsContext:(id)a6 forInterval:(double)a7;
- (void)siriPresentation:(id)a3 didShowGuideStartTime:(id)a4 endTime:(id)a5;
- (void)siriPresentation:(id)a3 didShowTipWithIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 flowID:(id)a7;
- (void)siriPresentation:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5;
- (void)siriPresentation:(id)a3 inputTypeDidChange:(int64_t)a4;
- (void)siriPresentation:(id)a3 insertAceViews:(id)a4 withDialogPhase:(id)a5 asItemsAtIndexPaths:(id)a6;
- (void)siriPresentation:(id)a3 openURL:(id)a4 conversationId:(id)a5 completion:(id)a6;
- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 completion:(id)a6;
- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 turnIdentifier:(id)a6 completion:(id)a7;
- (void)siriPresentation:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4;
- (void)siriPresentation:(id)a3 removeItemsAtIndexPaths:(id)a4;
- (void)siriPresentation:(id)a3 requestHostBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6;
- (void)siriPresentation:(id)a3 requestsAttendingStateWithCompletion:(id)a4;
- (void)siriPresentation:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)siriPresentation:(id)a3 requestsTouchPassThroughEnabled:(BOOL)a4;
- (void)siriPresentation:(id)a3 setBugReportingAvailable:(BOOL)a4;
- (void)siriPresentation:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5;
- (void)siriPresentation:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5;
- (void)siriPresentation:(id)a3 setHelpButtonEmphasized:(BOOL)a4;
- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5;
- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)siriPresentation:(id)a3 setStatusViewDisabled:(BOOL)a4;
- (void)siriPresentation:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)siriPresentation:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4;
- (void)siriPresentation:(id)a3 setTypeToSiriViewHidden:(BOOL)a4;
- (void)siriPresentation:(id)a3 siriRequestEnteredWithText:(id)a4;
- (void)siriPresentation:(id)a3 startEditedRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6;
- (void)siriPresentation:(id)a3 startRequestForSuggestion:(id)a4 inputType:(int64_t)a5;
- (void)siriPresentation:(id)a3 startRequestForText:(id)a4;
- (void)siriPresentation:(id)a3 startRequestWithOptions:(id)a4;
- (void)siriPresentation:(id)a3 synthesizeSpeechWithPhoneticText:(id)a4 completion:(id)a5;
- (void)siriPresentation:(id)a3 synthesizeSpeechWithText:(id)a4 completion:(id)a5;
- (void)siriPresentation:(id)a3 viewDidAppearWithAceObject:(id)a4;
- (void)siriPresentation:(id)a3 viewDidAppearWithClassDescriptor:(id)a4 identifier:(id)a5;
- (void)siriPresentation:(id)a3 viewDidDisappearWithClassDescriptor:(id)a4 identifier:(id)a5;
- (void)siriPresentation:(id)a3 willBeginEditingOfType:(int64_t)a4;
- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4;
- (void)siriPresentation:(id)a3 willDiscardConversationItemsWithIdentifiers:(id)a4;
- (void)siriPresentation:(id)a3 willDismissViewController:(id)a4;
- (void)siriPresentation:(id)a3 willPresentViewController:(id)a4;
- (void)siriPresentationCancelHIDEventDefferal:(id)a3;
- (void)siriPresentationClearContext:(id)a3;
- (void)siriPresentationDidDismissBugReporter:(id)a3;
- (void)siriPresentationDidEndEditing:(id)a3;
- (void)siriPresentationDidHideKeyboard:(id)a3;
- (void)siriPresentationDidHideUnlockScreen:(id)a3;
- (void)siriPresentationDidPresentBugReporter:(id)a3;
- (void)siriPresentationDidPresentConversationFromBreadcrumb:(id)a3;
- (void)siriPresentationDidPresentDynamicSnippetWithInfo:(id)a3;
- (void)siriPresentationDidPresentUserInterface:(id)a3;
- (void)siriPresentationDidRequestRestartSpeechSynthesis:(id)a3;
- (void)siriPresentationDidResignFirstResponder:(id)a3;
- (void)siriPresentationKeyboardViewDidAppear:(id)a3;
- (void)siriPresentationMicButtonLongPressBegan:(id)a3;
- (void)siriPresentationMicButtonLongPressEnded:(id)a3;
- (void)siriPresentationMicButtonWasTapped:(id)a3;
- (void)siriPresentationPresentAcousticIDSpinner:(id)a3;
- (void)siriPresentationPulseHelpButton:(id)a3;
- (void)siriPresentationRemoveAcousticIDSpinner:(id)a3;
- (void)siriPresentationRequestsHIDEventDefferal:(id)a3;
- (void)siriPresentationRequestsStartAttendingForNonSpeechRequest:(id)a3 deviceID:(id)a4;
- (void)siriPresentationWillSendStartRequest:(id)a3;
- (void)siriResultsDidDismissInTamaleForSiriPresentation:(id)a3;
- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3;
- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4;
- (void)siriSessionDidBeginTaskWithIdentifier:(id)a3;
- (void)siriSessionDidChangeLockState:(unint64_t)a3;
- (void)siriSessionDidChangeNetworkAvailability;
- (void)siriSessionDidDetectMusic;
- (void)siriSessionDidDetectSpeechStartpoint;
- (void)siriSessionDidEnterLatencyState;
- (void)siriSessionDidFinishAcousticIDRequestWithSuccess:(BOOL)a3;
- (void)siriSessionDidFinishRequestWithError:(id)a3;
- (void)siriSessionDidInitializeSessionInfo:(id)a3;
- (void)siriSessionDidReceiveAddContentToViewCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveAddViewsCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveAppPunchOutCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveAudioSessionInterruptionBeganWithUserInfo:(id)a3 machAbsoluteTime:(unint64_t)a4;
- (void)siriSessionDidReceiveClearScreenCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveCloseAssistantCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveDisambiguationItemSelected:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveExtendCurrentTTSCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveGetResponseAlternativesPlaybackCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveGuideUpdateCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveHideSiriOverlayCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveLatencyInformation:(id)a3;
- (void)siriSessionDidReceiveLaunchTVRemoteCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveListenForPronunciationCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveOpenLinkCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePaginateListCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePlayContentCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePlayNotificationSound:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePlayVoicemailCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePreSynthesizeTTSCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveRepeatItCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveRevealRecognizedSpeechCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIChangePrimaryUtteranceCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIShowFullScreenEffectCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIShowRequestHandlingStatusCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIShowSpeechAlternativesCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSayItCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSetSuggestedUtterancesCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSetUIGuidedAccessCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveShowHelpCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveShowNextCardCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveShowNextSnippetCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSmsPlayAudioCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSnippetConfigurationRequestCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSpeechPartialResultCommand:(id)a3;
- (void)siriSessionDidReceiveSpeechRecognizedCommand:(id)a3;
- (void)siriSessionDidReceiveStartGenAIEnablementFlowCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveStartImmersiveExperienceCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveUpdateViewsCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveUpdateVisualResponseSnippetCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4;
- (void)siriSessionDidStartAcousticIDRequest;
- (void)siriSessionDidStartNewTurn:(id)a3;
- (void)siriSessionDidStartNewTurn:(id)a3 associatedLaunchStartContext:(id)a4 machAbsoluteTime:(double)a5 linkPreviousTurn:(BOOL)a6;
- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6;
- (void)siriSessionDidUpdateAudioSessionID:(unsigned int)a3;
- (void)siriSessionDidUpdateRecognitionWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)siriSessionDidUpdateSessionInfo:(id)a3;
- (void)siriSessionGetRequestContextWithCompletionHandler:(id)a3;
- (void)siriSessionIsPresentingApplePaySheet;
- (void)siriSessionIsPresentingLocalAuthenticationUI;
- (void)siriSessionOpenURL:(id)a3 completionHandler:(id)a4;
- (void)siriSessionRequestedCancelPhotoSelectionWithAnimation:(BOOL)a3;
- (void)siriSessionRequestedPhotoSelectionWithSearchString:(id)a3 completion:(id)a4;
- (void)siriSessionRequestsDismissalForReason:(int64_t)a3;
- (void)siriSessionRequestsInstrumentingMessage:(id)a3 machAbsoluteTime:(double)a4;
- (void)siriSessionRequestsPlayPhaticWithCompletion:(id)a3;
- (void)siriSessionRequestsReadoutOfBulletin:(id)a3 completion:(id)a4;
- (void)siriSessionRequestsTTSDuckToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)siriSessionRequestsToShowAssetsDownloadNotificationPrompt;
- (void)siriSessionResultForAceCommand:(id)a3 completion:(id)a4;
- (void)siriSessionSpeechRecordingDidCancel;
- (void)siriSessionSpeechRecordingDidChangeAVRecordRoute:(id)a3;
- (void)siriSessionSpeechRecordingDidEnd;
- (void)siriSessionSpeechRecordingDidFailWithError:(id)a3;
- (void)siriSessionWillCancelRequest;
- (void)siriSessionWillDismissAudioRoutePicker;
- (void)siriSessionWillProcessAceCommand:(id)a3;
- (void)siriSessionWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)siriSessionWillShowAudioRoutePicker;
- (void)siriSessionWillStartRequest;
- (void)siriSessionWillStartRequestWithOptions:(id)a3 completion:(id)a4;
- (void)siriSessionWillStartUIRequestWithText:(id)a3 completionHandler:(id)a4;
- (void)siriWillActivateFromSource:(int64_t)a3;
- (void)siriWillBePresented:(int64_t)a3;
- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4;
- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3;
- (void)siriWillShowPasscodeUnlock;
- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3;
- (void)siriWillStopAttending:(id)a3;
- (void)speechSynthesisDidFinish:(id)a3;
- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3;
- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4;
- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3;
- (void)speechSynthesisGetPreparedTextForIdentifier:(id)a3 completion:(id)a4;
- (void)startRequestForSuggestion:(id)a3 inputType:(int64_t)a4;
- (void)startRequestForText:(id)a3;
- (void)stopRecordingSpeechForSiriPresentation:(id)a3;
- (void)toggleHomeAffordanceHidden:(BOOL)a3;
- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3;
- (void)updateEdgeLightWindowLevel:(int64_t)a3;
- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)userTouchedSnippet;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SRSiriViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFUIViewControllerHosting);
}

+ (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFUIViewControllerServing));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFUISiriSession));
  [v2 setInterface:v3 forSelector:"setSession:" argumentIndex:0 ofReply:0];

  objc_opt_class(&OBJC_CLASS___NSArray, v4);
  v38[0] = v5;
  *(void *)&double v7 = objc_opt_class(&OBJC_CLASS___AceObject, v6).n128_u64[0];
  v38[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

  [v2 setClasses:v10 forSelector:"siriSessionGetRequestContextWithCompletionHandler:" argumentIndex:0 ofReply:1];
  objc_opt_class(&OBJC_CLASS___NSArray, v11);
  uint64_t v13 = v12;
  *(void *)&double v15 = objc_opt_class(&OBJC_CLASS___AFSpeechPhrase, v14).n128_u64[0];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v13, v15, v16, 0LL));
  [v2 setClasses:v17 forSelector:"siriSessionDidUpdateRecognitionWithPhrases:utterances:refId:" argumentIndex:0 ofReply:0];

  objc_opt_class(&OBJC_CLASS___NSArray, v18);
  uint64_t v20 = v19;
  *(void *)&double v22 = objc_opt_class(&OBJC_CLASS___AFSpeechUtterance, v21).n128_u64[0];
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v20, v22, v23, 0LL));
  [v2 setClasses:v24 forSelector:"siriSessionDidUpdateRecognitionWithPhrases:utterances:refId:" argumentIndex:1 ofReply:0];

  *(void *)&double v26 = objc_opt_class(&OBJC_CLASS___SRUIFSiriSessionInfo, v25).n128_u64[0];
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v27, v26, 0LL));
  [v2 setClasses:v28 forSelector:"siriSessionDidInitializeSessionInfo:" argumentIndex:0 ofReply:0];

  *(void *)&double v30 = objc_opt_class(&OBJC_CLASS___SRUIFSiriSessionInfo, v29).n128_u64[0];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v31, v30, 0LL));
  [v2 setClasses:v32 forSelector:"siriSessionDidUpdateSessionInfo:" argumentIndex:0 ofReply:0];

  *(void *)&double v34 = objc_opt_class(&OBJC_CLASS___SAVCSPlayContent, v33).n128_u64[0];
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v35, v34, 0LL));
  [v2 setClasses:v36 forSelector:"siriSessionDidReceivePlayContentCommand:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  char v6 = objc_opt_respondsToSelector(v5, "_setForcedUserInterfaceLayoutDirection:");

  if ((v6 & 1) != 0)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    objc_msgSend(v7, "_setForcedUserInterfaceLayoutDirection:", SiriLanguageIsRTL(v7, v8));
  }

  else
  {
    v9 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006A440(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 0LL);
  -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController viewWillAppear:](&v17, "viewWillAppear:", v3);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController viewDidLoad](&v4, "viewDidLoad");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v3 logEventWithType:1502 context:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController viewDidAppear:](&v9, "viewDidAppear:", a3);
  [UIApp finishedIPTest:SUICPPTTestNameSiriBringupToSiriProcessViewControllerAppeared];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v4 logEventWithType:1513 context:0];

  objc_initWeak(&location, self);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SiriSharedUIReplayUtilityWrapper sharedInstance]( &OBJC_CLASS___SiriSharedUIReplayUtilityWrapper,  "sharedInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016640;
  v6[3] = &unk_1000BA260;
  objc_copyWeak(&v7, &location);
  [v5 registerReplayCallback:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v9 = "-[SRSiriViewController viewDidDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v6 logEventWithType:1514 context:0];

  -[SRSiriViewController _invalidateConnection](self, "_invalidateConnection");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:](self, "_setShowKeyboardIfTextInputEnabled:", 0LL);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  kdebug_trace(722469688LL, 0LL, 0LL, 0LL, 0LL);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v8,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
  [v7 animateAlongsideTransition:0 completion:&stru_1000BA2A0];
}

- (void)_setupXPCListener
{
  BOOL v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v9 = "-[SRSiriViewController _setupXPCListener]";
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s #xpcSiriApp Setting up XPC Listener in %@",  buf,  0x16u);
  }

  objc_super v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.siri.app");
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", &_dispatch_main_q);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000169F8;
  block[3] = &unk_1000B9F38;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  char v6 = (NSXPCListener *)a3;
  id v7 = a4;
  listener = self->_listener;
  objc_super v9 = (os_log_s *)AFSiriLogContextConnection;
  if (listener == v6)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "-[SRSiriViewController listener:shouldAcceptNewConnection:]";
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s #xpcSiriApp Accepting new XPC Connection: %@",  buf,  0x16u);
    }

    uint64_t v11 = &_dispatch_main_q;
    objc_initWeak((id *)buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100016DE8;
    v29[3] = &unk_1000BA2C8;
    uint64_t v12 = &_dispatch_main_q;
    double v30 = &_dispatch_main_q;
    objc_copyWeak(&v31, (id *)buf);
    [v7 setInvalidationHandler:v29];
    uint64_t v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    uint64_t v25 = sub_100016E8C;
    double v26 = &unk_1000BA2C8;
    uint64_t v13 = &_dispatch_main_q;
    uint64_t v27 = &_dispatch_main_q;
    objc_copyWeak(&v28, (id *)buf);
    [v7 setInterruptionHandler:&v23];
    *(void *)&double v15 = objc_opt_class(self, v14).n128_u64[0];
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_remoteViewControllerInterface", v15, v23, v24, v25, v26));
    [v7 setRemoteObjectInterface:v17];

    *(void *)&double v19 = objc_opt_class(self, v18).n128_u64[0];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_exportedInterface", v19));
    [v7 setExportedInterface:v21];

    [v7 setExportedObject:self];
    [v7 _setQueue:&_dispatch_main_q];
    [v7 resume];
    objc_storeStrong((id *)&self->_connection, a4);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }

  else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = self->_listener;
    *(_DWORD *)buf = 136315906;
    uint64_t v33 = "-[SRSiriViewController listener:shouldAcceptNewConnection:]";
    __int16 v34 = 2112;
    id v35 = v7;
    __int16 v36 = 2112;
    v37 = v6;
    __int16 v38 = 2112;
    v39 = v10;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s #xpcSiriApp Was asked to accept new connection from %@ for %@ instead of %@",  buf,  0x2Au);
  }

  return listener == v6;
}

- (void)_connectionWasInvalidated
{
  unsigned int v3 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  objc_super v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v6 = 136315650;
    id v7 = "-[SRSiriViewController _connectionWasInvalidated]";
    __int16 v8 = 1024;
    unsigned int v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = connection;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #xpcSiriApp Connection from SpringBoard/CarPlay was invalidated pid=%d _connection=%@",  (uint8_t *)&v6,  0x1Cu);
  }

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0LL);
}

- (void)_connectionWasInterrupted
{
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006A4B0();
  }
}

- (SRSiriViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  __int16 v8 = -[SRSiriViewController initWithNibName:bundle:](&v41, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SRApplication sharedApplication](&OBJC_CLASS___SRApplication, "sharedApplication"));
    [v9 setDataSource:v8];

    __int16 v10 = objc_alloc_init(&OBJC_CLASS___SRPreferences);
    preferences = v8->_preferences;
    v8->_preferences = v10;

    uint64_t v12 = -[AFUISiriLanguage initWithDelegate:](objc_alloc(&OBJC_CLASS___AFUISiriLanguage), "initWithDelegate:", v8);
    language = v8->_language;
    v8->_language = v12;

    -[SRSiriViewController _updateLanguageCode](v8, "_updateLanguageCode");
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    conversations = v8->_conversations;
    v8->_conversations = (NSMutableArray *)v14;

    id v16 = -[SRSiriViewController _startNewConversation](v8, "_startNewConversation");
    objc_super v17 = objc_alloc_init(&OBJC_CLASS___AFConversationStore);
    conversationStore = v8->_conversationStore;
    v8->_conversationStore = v17;

    double v19 = objc_alloc_init(&OBJC_CLASS___AFManagedStorageConnection);
    domainObjectStorageConnection = v8->_domainObjectStorageConnection;
    v8->_domainObjectStorageConnection = v19;

    uint64_t v21 = objc_alloc_init(&OBJC_CLASS___SRUIFAceCommandRecords);
    aceCommandRecords = v8->_aceCommandRecords;
    v8->_aceCommandRecords = v21;

    -[SRUIFAceCommandRecords setDelegate:](v8->_aceCommandRecords, "setDelegate:", v8);
    uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    repeatablePhrases = v8->_repeatablePhrases;
    v8->_repeatablePhrases = v23;

    v8->_acousticIdAllowed = 0;
    uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    synthesisPreparationDictionary = v8->_synthesisPreparationDictionary;
    v8->_synthesisPreparationDictionary = v25;

    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___SRModeProvider);
    modeProvider = v8->_modeProvider;
    v8->_modeProvider = v27;

    uint64_t v29 = objc_alloc_init(&OBJC_CLASS___SRUIFAnalyticsSupplement);
    analyticsSupplement = v8->_analyticsSupplement;
    v8->_analyticsSupplement = v29;

    id v31 = objc_alloc_init(&OBJC_CLASS___SRUIFSpeechSynthesizer);
    ttsManager = v8->_ttsManager;
    v8->_ttsManager = v31;

    -[SRUIFSpeechSynthesizer setDelegate:](v8->_ttsManager, "setDelegate:", v8);
    -[SRUIFSpeechSynthesizer setClientStateManagerDelegate:](v8->_ttsManager, "setClientStateManagerDelegate:", v8);
    uint64_t v33 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v34 = v8->_ttsManager;
      *(_DWORD *)buf = 136315394;
      v43 = "-[SRSiriViewController initWithNibName:bundle:]";
      __int16 v44 = 2112;
      v45 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s #tts 3 created _ttsManager:%@",  buf,  0x16u);
    }

    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[AFUIDisambiguationAnalyticsManager sharedManager]( &OBJC_CLASS___AFUIDisambiguationAnalyticsManager,  "sharedManager"));
    [v35 setDataSource:v8];

    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v36 addObserver:v8 selector:"_audioSessionRouteDidChange:" name:AVAudioSessionRouteChangeNotification object:0];

    -[SRSiriViewController _setupXPCListener](v8, "_setupXPCListener");
    objc_initWeak((id *)buf, v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017490;
    block[3] = &unk_1000BA2F0;
    objc_copyWeak(&v40, (id *)buf);
    v8->_mainRunLoopObserverRef = CFRunLoopObserverCreateWithHandler(0LL, 0x81uLL, 1u, 0LL, block);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v8->_mainRunLoopObserverRef, (CFRunLoopMode)UITrackingRunLoopMode);
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)dealloc
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _idleTimer](self, "_idleTimer"));
  [v3 invalidate];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];

  if (self->_mainRunLoopObserverRef)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveObserver(Main, self->_mainRunLoopObserverRef, (CFRunLoopMode)UITrackingRunLoopMode);
    CFRelease(self->_mainRunLoopObserverRef);
  }

  id v6 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[SRSiriViewController dealloc]";
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s #xpcSiriApp invalidating connection because of dealloc self=%@",  buf,  0x16u);
  }

  -[SRSiriViewController _invalidateConnection](self, "_invalidateConnection");
  id v7 = objc_alloc_init(&OBJC_CLASS___SRBackgroundTaskManager);
  objc_setAssociatedObject( self->_listener,  @"NSXPCListenerInstanceAssociatedBackgroundTaskManagerIdentifier",  v7,  (void *)1);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0LL);
  -[NSXPCListener invalidate](self->_listener, "invalidate");

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController dealloc](&v8, "dealloc");
}

- (void)_invalidateConnection
{
  unsigned int v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v5 = 136315650;
    id v6 = "-[SRSiriViewController _invalidateConnection]";
    __int16 v7 = 2112;
    objc_super v8 = connection;
    __int16 v9 = 2112;
    __int16 v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s #xpcSiriApp %@ %@",  (uint8_t *)&v5,  0x20u);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (BOOL)shouldAutorotate
{
  if ((SiriUIDeviceIsZoomed(self, a2) & 1) != 0) {
    return 0;
  }
  else {
    return SiriUIIsAllOrientationsSupported();
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((SiriUIDeviceIsZoomed(self, a2) & 1) != 0 || (SiriUIIsAllOrientationsSupported() & 1) == 0) {
    return 2LL;
  }
  else {
    return 30LL;
  }
}

- (void)_cancelLastRootProvisionalSnippetFromLastRequestInConversation:(id)a3
{
  id v3 = a3;
  [v3 removeTransientItems];
  uint64_t v4 = (uint64_t)[v3 numberOfChildrenForItemWithIdentifier:0];
  if (v4 >= 1)
  {
    uint64_t v5 = v4 + 1;
    while (1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](&OBJC_CLASS___NSIndexPath, "indexPathWithIndex:", v5 - 2));
      __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 itemAtIndexPath:v6]);
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 aceObject]);
      if ([v7 type] == (id)1) {
        break;
      }
      if ([v7 presentationState] == (id)2)
      {
        objc_opt_class(&OBJC_CLASS___SAUISnippet, v9);
        if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        {
          objc_opt_class(&OBJC_CLASS___SAUIPronunciationSnippet, v11);
          char isKindOfClass = objc_opt_isKindOfClass(v8, v12);
          uint64_t v14 = (os_log_s *)AFSiriLogContextConnection;
          BOOL v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
          if ((isKindOfClass & 1) != 0)
          {
            if (v15)
            {
              int v17 = 136315138;
              uint64_t v18 = "-[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:]";
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Not canceling SAUIPronunciationSnippet",  (uint8_t *)&v17,  0xCu);
            }
          }

          else
          {
            if (v15)
            {
              int v17 = 136315394;
              uint64_t v18 = "-[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:]";
              __int16 v19 = 2112;
              id v20 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Canceling provisional %@",  (uint8_t *)&v17,  0x16u);
            }

            id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
            [v3 cancelItemWithIdentifier:v16];

            [v3 setSynchronizedWithServer:0];
          }

          break;
        }
      }
    }
  }

- (id)_host
{
  return -[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", 0LL);
}

- (id)_hostWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  a3);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController viewDidMoveToWindow:shouldAppearOrDisappear:]( &v4,  "viewDidMoveToWindow:shouldAppearOrDisappear:",  a3,  a4);
}

- (id)preferredFocusEnvironments
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
  objc_super v4 = (void *)v3;
  if (v3)
  {
    uint64_t v10 = v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
    id v6 = -[SRSiriViewController preferredFocusEnvironments](&v9, "preferredFocusEnvironments");
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v6);
  }

  __int16 v7 = (void *)v5;

  return v7;
}

- (void)setBottomContentInset:(double)a3
{
  if (vabdd_f64(self->_bottomContentInset, a3) >= 0.00000011920929)
  {
    self->_bottomContentInset = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    if ((objc_opt_respondsToSelector(v4, "setBottomContentInset:") & 1) != 0) {
      [v4 setBottomContentInset:self->_bottomContentInset];
    }
  }

- (void)setSystemContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  self->_systemContentFrame = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v7, "setTopContentInset:animated:") & 1) != 0)
  {
    v8.origin.CGFloat x = x;
    v8.origin.CGFloat y = y;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    [v7 setTopContentInset:1 animated:CGRectGetMaxY(v8)];
  }
}

- (void)_setStatusBarFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_statusBarFrame = &self->_statusBarFrame;
  if (!CGRectEqualToRect(self->_statusBarFrame, a3))
  {
    p_statusBarFrame->origin.CGFloat x = x;
    p_statusBarFrame->origin.CGFloat y = y;
    p_statusBarFrame->size.CGFloat width = width;
    p_statusBarFrame->size.CGFloat height = height;
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    if ((objc_opt_respondsToSelector(v9, "statusBarFrameDidChange") & 1) != 0) {
      [v9 statusBarFrameDidChange];
    }
  }

- (void)setStatusBarFrameValue:(id)a3
{
}

- (void)setDockFrameValue:(id)a3
{
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v12, "dockFrameDidChange:") & 1) != 0) {
    objc_msgSend(v12, "dockFrameDidChange:", v5, v7, v9, v11);
  }
}

- (void)_setStatusViewHeight:(double)a3
{
  self->_statusViewHeight = a3;
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v3, "statusViewHeightDidChange") & 1) != 0) {
    [v3 statusViewHeightDidChange];
  }
}

- (void)setStatusViewHeightNumber:(id)a3
{
}

- (id)_activeConversation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastObject]);

  return v3;
}

- (id)_conversationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  BOOL v15 = sub_100017EF4;
  id v16 = sub_100017F04;
  id v17 = 0LL;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100017F0C;
  v9[3] = &unk_1000BA318;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_resetContext
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v2 resetContextTypes:7];
}

- (void)_activateConversation:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _previousConversation](self, "_previousConversation"));

  unsigned __int8 v8 = [v5 containsObject:v4];
  [v5 removeObject:v4];
  [v5 addObject:v4];
  if (v7 == v4)
  {
    unsigned int v10 = [v4 isSynchronizedWithServer];
    double v11 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        int v15 = 136315138;
        id v16 = "-[SRSiriViewController _activateConversation:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Rolling back the last clear context for server synchronized conversation",  (uint8_t *)&v15,  0xCu);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
      [v13 rollbackClearContext];
    }

    else
    {
      if (v12)
      {
        int v15 = 136315138;
        id v16 = "-[SRSiriViewController _activateConversation:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Clearing context for non synchronized conversation",  (uint8_t *)&v15,  0xCu);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
      [v13 clearContext];
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    [v14 setAlertContext];
  }

  else if ((v8 & 1) == 0 && (unint64_t)[v5 count] >= 2)
  {
    double v9 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "-[SRSiriViewController _activateConversation:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Resetting context for more than one conversation loaded",  (uint8_t *)&v15,  0xCu);
    }

    -[SRSiriViewController _resetContext](self, "_resetContext");
  }

  if (v6) {
    -[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:]( self,  "_cancelLastRootProvisionalSnippetFromLastRequestInConversation:",  v6);
  }
}

- (void)_removePreviousConversationFromStore
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversationStore](self, "_conversationStore"));
  [v2 removeConversationWithIdentifier:AFUIPreviousConversationIdentifier completionBlock:&stru_1000BA358];
}

- (void)_saveConversationWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = AFUIPreviousConversationIdentifier;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v7, "canSaveConversations") & 1) != 0)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned __int8 v9 = [v8 canSaveConversations];

    if ((v9 & 1) == 0)
    {
      unsigned int v10 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "-[SRSiriViewController _saveConversationWithCompletion:]";
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s #conversation Presentation does not support conversation saving; not saving conversation { conversation: %@ }",
          buf,
          0x16u);
      }

      if (v4) {
        v4[2](v4);
      }
      goto LABEL_11;
    }
  }

  else
  {
  }

  double v11 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[SRSiriViewController _saveConversationWithCompletion:]";
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #conversation Saving conversation to store { identifier: %@, conversation: %@ }",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, self);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversationStore](self, "_conversationStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001855C;
  v13[3] = &unk_1000BA380;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v5;
  id v15 = v6;
  id v16 = v4;
  [v12 saveConversation:v15 withIdentifier:v14 completionBlock:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
LABEL_11:
}

- (void)_deleteConversationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _previousConversation](self, "_previousConversation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v7 = [v4 isEqual:v6];

  if (v7) {
    -[SRSiriViewController _removePreviousConversationFromStore](self, "_removePreviousConversationFromStore");
  }
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000187D8;
  v12[3] = &unk_1000BA3A8;
  id v11 = v4;
  id v13 = v11;
  id v9 = [v8 indexOfObjectPassingTest:v12];

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
    [v10 removeObjectAtIndex:v9];
  }
}

- (void)_deletePreviousConversation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _previousConversation](self, "_previousConversation"));
  if (v3)
  {
    id v5 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
    -[SRSiriViewController _deleteConversationWithIdentifier:](self, "_deleteConversationWithIdentifier:", v4);

    id v3 = v5;
  }
}

- (id)_startNewConversation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

  if (v3) {
    -[SRSiriViewController _saveConversationWithCompletion:](self, "_saveConversationWithCompletion:", 0LL);
  }
  id v4 = objc_alloc(&OBJC_CLASS___AFConversation);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 spokenLanguageCode]);
  unsigned int v7 = -[AFConversation initWithLanguageCode:](v4, "initWithLanguageCode:", v6);

  -[AFConversation setDelegate:](v7, "setDelegate:", self);
  -[SRSiriViewController _activateConversation:](self, "_activateConversation:", v7);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  LOBYTE(v6) = objc_opt_respondsToSelector(v8, "siriDidStartNewConversationWithIdentifier:");

  if ((v6 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[AFConversation identifier](v7, "identifier"));
    [v9 siriDidStartNewConversationWithIdentifier:v10];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AFConversation identifier](v7, "identifier"));

  return v11;
}

- (void)_restorePreviousConversation
{
  unsigned __int8 v3 = -[SRPreferences siriIsActive](self->_preferences, "siriIsActive");
  -[SRPreferences setSiriIsActive:](self->_preferences, "setSiriIsActive:", 1LL);
  if ((v3 & 1) == 0)
  {
    if ((self->_lockState & 2) != 0)
    {
      id v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315394;
        *(void *)&location[4] = "-[SRSiriViewController _restorePreviousConversation]";
        __int16 v9 = 2112;
        uint64_t v10 = AFUIPreviousConversationIdentifier;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #conversation Host not allowing SR to load previous conversation { identifier: %@ }",  location,  0x16u);
      }
    }

    else
    {
      objc_initWeak((id *)location, self);
      conversationStore = self->_conversationStore;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100018B24;
      v6[3] = &unk_1000BA420;
      objc_copyWeak(&v7, (id *)location);
      -[AFConversationStore fetchConversationWithIdentifier:completionBlock:]( conversationStore,  "fetchConversationWithIdentifier:completionBlock:",  AFUIPreviousConversationIdentifier,  v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak((id *)location);
    }
  }

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  unsigned int v7 = -[SRSiriViewController textInputEnabled](self, "textInputEnabled");
  if (a3 == 1 && v7) {
    -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:]( self,  "_setShowKeyboardIfTextInputEnabled:minimized:",  1LL,  +[UIKeyboard isInHardwareKeyboardMode](&OBJC_CLASS___UIKeyboard, "isInHardwareKeyboardMode") ^ 1);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SRSiriViewController;
  -[SRSiriViewController motionEnded:withEvent:](&v8, "motionEnded:withEvent:", a3, v6);
}

- (id)_previousConversation
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations"));
  unsigned __int8 v3 = (char *)[v2 count];
  else {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectAtIndex:v3 - 2]);
  }

  return v4;
}

- (BOOL)_languageMatchesConversation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 spokenLanguageCode]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);

  LOBYTE(v4) = [v6 isEqualToString:v7];
  return (char)v4;
}

- (id)_delayedConversationItemRevisionIdentifiers
{
  delayedConversationItemRevisionIdentifiers = self->_delayedConversationItemRevisionIdentifiers;
  if (!delayedConversationItemRevisionIdentifiers)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_delayedConversationItemRevisionIdentifiers;
    self->_delayedConversationItemRevisionIdentifiers = v4;

    delayedConversationItemRevisionIdentifiers = self->_delayedConversationItemRevisionIdentifiers;
  }

  return delayedConversationItemRevisionIdentifiers;
}

- (id)_presentedConversationItemRevisionIdentifiers
{
  presentedConversationItemRevisionIdentifiers = self->_presentedConversationItemRevisionIdentifiers;
  if (!presentedConversationItemRevisionIdentifiers)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_presentedConversationItemRevisionIdentifiers;
    self->_presentedConversationItemRevisionIdentifiers = v4;

    presentedConversationItemRevisionIdentifiers = self->_presentedConversationItemRevisionIdentifiers;
  }

  return presentedConversationItemRevisionIdentifiers;
}

- (id)_pendingPreSynthesisTasks
{
  pendingPreSynthesisTasks = self->_pendingPreSynthesisTasks;
  if (!pendingPreSynthesisTasks)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_pendingPreSynthesisTasks;
    self->_pendingPreSynthesisTasks = v4;

    pendingPreSynthesisTasks = self->_pendingPreSynthesisTasks;
  }

  return pendingPreSynthesisTasks;
}

- (NSMutableSet)_completedCommandAppPunchOutIds
{
  completedCommandAppPunchOutIds = self->_completedCommandAppPunchOutIds;
  if (!completedCommandAppPunchOutIds)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v5 = self->_completedCommandAppPunchOutIds;
    self->_completedCommandAppPunchOutIds = v4;

    completedCommandAppPunchOutIds = self->_completedCommandAppPunchOutIds;
  }

  return completedCommandAppPunchOutIds;
}

- (void)setHostFrontMostAppOrientation:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[SRApplication sharedApplication](&OBJC_CLASS___SRApplication, "sharedApplication"));
  [v4 setFrontMostAppOrientation:a3];
}

- (void)siriWillActivateFromSource:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v6 = objc_opt_respondsToSelector(v5, "siriWillActivateFromSource:");

  if ((v6 & 1) != 0)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v7 siriWillActivateFromSource:a3];
  }

  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = v5;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    int v17 = 136315394;
    uint64_t v18 = "-[SRSiriViewController siriDidActivateFromSource:]";
    __int16 v19 = 2112;
    __int16 v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s source: %@", (uint8_t *)&v17, 0x16u);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v9 = objc_opt_respondsToSelector(v8, "siriDidActivateFromSource:");

  if ((v9 & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v10 siriDidActivateFromSource:a3];
  }

  testingContext = self->_testingContext;
  if (testingContext)
  {
    uint64_t v12 = SUICPPTTestNameKey;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](testingContext, "objectForKey:", SUICPPTTestNameKey));
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_testingContext, "objectForKey:", v12));
      unsigned __int8 v16 = [v15 hasPrefix:SUICPPTSiriBringupTestPrefix];

      if ((v16 & 1) == 0) {
        -[SRSiriViewController runPPTWithOptions:](self, "runPPTWithOptions:", self->_testingContext);
      }
    }
  }

- (void)siriWillBePresented:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v6 = objc_opt_respondsToSelector(v5, "siriWillBePresented:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v7 siriWillBePresented:a3];
  }

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }

  char v6 = objc_alloc_init(&OBJC_CLASS___SRPreferences);
  if ([UIApp activeInterfaceOrientation]) {
    -[SRPreferences setLastKnownInterfaceOrientation:]( v6,  "setLastKnownInterfaceOrientation:",  [UIApp activeInterfaceOrientation]);
  }
  id v7 = dispatch_group_create();
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v9 = objc_opt_respondsToSelector(v8, "siriDidDeactivateWithCompletion:");

  if ((v9 & 1) != 0)
  {
    dispatch_group_enter(v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100019ABC;
    v32[3] = &unk_1000BA078;
    uint64_t v33 = v7;
    [v10 siriDidDeactivateWithCompletion:v32];

    id v11 = v33;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v13 = objc_opt_respondsToSelector(v12, "siriDidDeactivate");

    if ((v13 & 1) == 0) {
      goto LABEL_10;
    }
    id v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    -[dispatch_group_s siriDidDeactivate](v11, "siriDidDeactivate");
  }

LABEL_10:
  id v14 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s #tts Siri deactivating. Cancelling any in flight TTS so we can release the audio session",  (uint8_t *)&buf,  0xCu);
  }

  -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  BOOL v16 = [v15 requestSource] == (id)8;

  if (v16
    && (id)-[SRSiriViewController _siriState](self, "_siriState") != (id)3
    && -[SRSiriViewController _siriState](self, "_siriState"))
  {
    *(void *)v39 = 0LL;
    *(void *)&v39[8] = v39;
    *(void *)&v39[16] = 0x2050000000LL;
    int v17 = (void *)qword_1000D9B08;
    uint64_t v40 = qword_1000D9B08;
    if (!qword_1000D9B08)
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      uint64_t v35 = (uint64_t)sub_100031DEC;
      __int16 v36 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000BA448;
      v37 = (void (*)(uint64_t))v39;
      sub_100031DEC((uint64_t)&buf);
      int v17 = *(void **)(*(void *)&v39[8] + 24LL);
    }

    id v18 = v17;
    _Block_object_dispose(v39, 8);
    [v18 notifyVoiceTriggeredSiriSessionCancelled];
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _preferences](self, "_preferences"));
  [v19 setSiriIsActive:0];

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v21 = objc_alloc_init(&OBJC_CLASS___NSIndexPath);
  BOOL v22 = (uint64_t)[v20 numberOfChildrenForItemAtIndexPath:v21] > 0;

  if (v22)
  {
    dispatch_group_enter(v7);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100019AC4;
    v30[3] = &unk_1000BA078;
    id v31 = v7;
    -[SRSiriViewController _saveConversationWithCompletion:](self, "_saveConversationWithCompletion:", v30);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000LL;
  __int16 v36 = sub_100017EF4;
  v37 = sub_100017F04;
  __int16 v38 = objc_alloc_init(&OBJC_CLASS___SRBackgroundTaskManager);
  uint64_t v23 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = *(void *)(*((void *)&buf + 1) + 40LL);
    *(_DWORD *)v39 = 136315394;
    *(void *)&v39[4] = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    *(_WORD *)&v39[12] = 2112;
    *(void *)&v39[14] = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s Taking %@ to flush instrumentation",  v39,  0x16u);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100019ACC;
  v29[3] = &unk_1000BA448;
  void v29[4] = &buf;
  [v25 boostQueuedMessagesAndPerformOnQueueCompletion:v29 timeout:2.0];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100019BA0;
  v27[3] = &unk_1000BA470;
  id v28 = v4;
  id v26 = v4;
  dispatch_group_notify(v7, &_dispatch_main_q, v27);

  _Block_object_dispose(&buf, 8);
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "didReceiveOrbViewTapToCancelRequest");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 didReceiveOrbViewTapToCancelRequest];
  }

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v6 = objc_opt_respondsToSelector(v5, "siriWillShowPasscodeUnlockAndCancelRequest:");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  id v9 = v7;
  if ((v6 & 1) != 0)
  {
    [v7 siriWillShowPasscodeUnlockAndCancelRequest:v3];
  }

  else
  {
    char v8 = objc_opt_respondsToSelector(v7, "siriWillShowPasscodeUnlock");

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 siriWillShowPasscodeUnlock];
  }
}

- (void)siriWillShowPasscodeUnlock
{
}

- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation", a3));
  char v5 = objc_opt_respondsToSelector(v4, "siriWillHidePasscodeUnlock");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v6 siriWillHidePasscodeUnlock];
  }

- (void)siriDidHidePasscodeUnlock
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "siriDidHidePasscodeUnlock");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 siriDidHidePasscodeUnlock];
  }

- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[SRSiriViewController showAppUnlockForAppId:completion:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Tried to show AppUnlock for appId=%@, but AppProtection is not available on this platform.",  (uint8_t *)&v8,  0x16u);
  }

  v6[2](v6, 1LL);
}

- (void)startRequestForText:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

  if ([v6 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v8 = objc_opt_respondsToSelector(v7, "siriWillStartTextInputRequest");

    if ((v8 & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      [v9 siriWillStartTextInputRequest];
    }

    __int16 v10 = -[SASRequestOptions initWithRequestSource:]( objc_alloc(&OBJC_CLASS___SASRequestOptions),  "initWithRequestSource:",  23LL);
    -[SASRequestOptions setText:](v10, "setText:", v6);
    objc_storeStrong((id *)&self->_requestText, v6);
    -[SRSiriViewController _startRequestWithOptions:](self, "_startRequestWithOptions:", v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    [v11 serviceDidResetTextInput];
  }

  else
  {
    uint64_t v12 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006A76C(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)startRequestForSuggestion:(id)a3 inputType:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByTrimmingCharactersInSet:v7]);

  if ([v8 length])
  {
    id v9 = -[SASRequestOptions initWithRequestSource:]( objc_alloc(&OBJC_CLASS___SASRequestOptions),  "initWithRequestSource:",  50LL);
    -[SASRequestOptions setText:](v9, "setText:", v8);
    __int16 v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      uint64_t Description = SASRequestInputTypeGetDescription(a4);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(Description);
      int v14 = 136315394;
      uint64_t v15 = "-[SRSiriViewController startRequestForSuggestion:inputType:]";
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s #suggestions startRequestForSuggestion inputType: %@",  (uint8_t *)&v14,  0x16u);
    }

    -[SASRequestOptions setPreviousInteractionInputType:](v9, "setPreviousInteractionInputType:", a4);
    objc_storeStrong((id *)&self->_requestText, v8);
    -[SRSiriViewController _startRequestWithOptions:](self, "_startRequestWithOptions:", v9);
  }
}

- (void)siriKeyboardViewDidChange:(id *)a3
{
  if (a3)
  {
    id v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
      sub_10006A7DC((uint64_t)self, v5, (uint64_t)a3);
    }
    p_keyboardInfo = &self->_keyboardInfo;
    __int128 v8 = *(_OWORD *)&a3->var3.origin.y;
    __int128 v7 = *(_OWORD *)&a3->var3.size.height;
    *(_OWORD *)&self->_keyboardInfo.enabled = *(_OWORD *)&a3->var0;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.CGFloat y = v8;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.CGFloat height = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v10 = objc_opt_respondsToSelector(v9, "updateKeyboardInfo:");

    if ((v10 & 1) != 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      __int128 v12 = *(_OWORD *)&p_keyboardInfo->keyboardFrame.origin.y;
      v13[0] = *(_OWORD *)&p_keyboardInfo->enabled;
      v13[1] = v12;
      v13[2] = *(_OWORD *)&p_keyboardInfo->keyboardFrame.size.height;
      [v11 updateKeyboardInfo:v13];
    }
  }

- (BOOL)_siriIsShowingPasscodeUnlock
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "siriIsShowingPasscodeUnlock");

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  unsigned __int8 v6 = [v5 siriIsShowingPasscodeUnlock];

  return v6;
}

- (void)setSession:(id)a3
{
  id v5 = (AFUISiriSession *)a3;
  if (self->_session != v5)
  {
    unsigned __int8 v6 = v5;
    objc_storeStrong((id *)&self->_session, a3);
    id v5 = v6;
  }
}

- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v4 serviceDidRequestKeyboard:v3];
}

- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3 minimized:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v6 serviceDidRequestKeyboard:v5 minimized:v4];
}

- (void)didReceiveHelpAction
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "didReceiveHelpAction");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 didReceiveHelpAction];
  }

- (void)didReceiveReportBugAction
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "didReceiveReportBugAction");

  if ((v4 & 1) != 0)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v13 didReceiveReportBugAction];
  }

  else
  {
    id v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006A8B8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

- (void)didReceiveBugButtonLongPress
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "didReceiveBugButtonLongPress");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 didReceiveBugButtonLongPress];
  }

- (void)didReceiveShortTapActionWIthRequestOptions:(id)a3
{
  id v7 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v5 = objc_opt_respondsToSelector(v4, "shortTapActionWithRequestOptions:");

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v6 shortTapActionWithRequestOptions:v7];
  }
}

- (void)_dismissWithReason:(int64_t)a3
{
  char v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t Name = SASDismissalReasonGetName(a3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v14 = 136315394;
    uint64_t v15 = "-[SRSiriViewController _dismissWithReason:]";
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #punchout 9 %@", (uint8_t *)&v14, 0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v10 = objc_opt_respondsToSelector(v9, "dismissalUserInfo");

  if ((v10 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dismissalUserInfo]);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_1000BA4B0));
  [v13 serviceRequestsDismissalWithUserInfo:v12 withReason:a3];
}

- (void)hostApplicationWillResignActive
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "hostApplicationWillResignActive");

  if ((v4 & 1) != 0)
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 hostApplicationWillResignActive];
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v6 hostWillResignActive];
}

- (void)hostApplicationWillEnterForeground
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "hostApplicationWillEnterForeground");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 hostApplicationWillEnterForeground];
  }

- (void)hostApplicationDidBecomeActive
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "hostApplicationDidBecomeActive");

  if ((v4 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 hostApplicationDidBecomeActive];
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v6 hostDidBecomeActive];
}

- (void)setWaitingForTelephonyToStart:(BOOL)a3
{
  self->_waitingForTelephonyToStart = a3;
}

- (void)hostApplicationRequestsEmitUIStateTransitionForSiriDismissalWithReason:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v9 = (void (**)(id, void *))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
  [v5 emitUIStateTransitionForSiriDismissalWithReason:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentInstrumentationTurnContext]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 turnIdentifier]);

  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v5 emitInstrumentation:v4];
}

- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v7 emitInstrumentation:v6 atTime:a4];
}

- (void)hostApplicationRequestsScreenshotWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, void))a3;
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSiriViewController hostApplicationRequestsScreenshotWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #screenshot: unsupported platform",  (uint8_t *)&v5,  0xCu);
  }

  if (v3) {
    v3[2](v3, 0LL);
  }
}

- (void)hasContentAtPoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (!self->_preventOutsideTouchesFromDismissingSiri)
  {
    if (!v6)
    {
      uint64_t v10 = 1LL;
      if (!v7) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }

    id v11 = [v6 CGPointValue];
    double v13 = v12;
    double v15 = v14;
    if (!SiriUIIsValidPoint(v11))
    {
      char v18 = 1;
LABEL_17:
      uint64_t v10 = v18 & 1;
      if (v8) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
    if ((objc_opt_respondsToSelector(v16, "hasContentAtPoint:") & 1) != 0
      && (objc_msgSend(v16, "hasContentAtPoint:", v13, v15) & 1) == 0)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController parentViewController](self, "parentViewController"));
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 presentedViewController]);

      if (!v20
        || (id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 view]),
            [v21 frame],
            v46.CGFloat x = v13,
            v46.CGFloat y = v15,
            BOOL v22 = CGRectContainsPoint(v47, v46),
            v21,
            !v22))
      {
        v37 = v16;
        __int16 v38 = v8;

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:]( &OBJC_CLASS___UIWindow,  "allWindowsIncludingInternalWindows:onlyVisibleWindows:",  1LL,  0LL));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 window]);

        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v27 = v24;
        id v28 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v28)
        {
          id v29 = v28;
          char v18 = 0;
          uint64_t v30 = *(void *)v40;
          do
          {
            for (i = 0LL; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v40 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
              if (v32 != v26)
              {
                uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "hitTest:withEvent:", 0, v13, v15));
                if (v33)
                {
                  __int16 v34 = (os_log_s *)AFSiriLogContextConnection;
                  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)__int128 buf = 136315138;
                    v45 = "-[SRSiriViewController hasContentAtPoint:completion:]";
                    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s #dismissal - found content at point in additional windows used by Siri, but not owned by Siri.",  buf,  0xCu);
                  }

                  char v18 = 1;
                }
              }
            }

            id v29 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
          }

          while (v29);
        }

        else
        {
          char v18 = 0;
        }

        if ((v18 & 1) == 0)
        {
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[SiriSharedUIReplayUtilityWrapper sharedInstance]( &OBJC_CLASS___SiriSharedUIReplayUtilityWrapper,  "sharedInstance"));
          unsigned int v36 = objc_msgSend(v35, "hasContentAtPoint:", v13, v15);

          if (v36) {
            char v18 = 1;
          }
        }

        __int16 v16 = v37;
        uint64_t v8 = v38;
        goto LABEL_13;
      }

      uint64_t v23 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        v45 = "-[SRSiriViewController hasContentAtPoint:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s #dismissal - found content at point in presented alert view controller",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v17 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        v45 = "-[SRSiriViewController hasContentAtPoint:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s #dismissal - found content at point in Presentation",  buf,  0xCu);
      }
    }

    char v18 = 1;
LABEL_13:

    goto LABEL_17;
  }

  uint64_t v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v45 = "-[SRSiriViewController hasContentAtPoint:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s #dismissal - skipping content at point because _preventOutsideTouchesFromDismissingSiri is YES",  buf,  0xCu);
  }

  if (v8)
  {
    uint64_t v10 = 1LL;
LABEL_18:
    v8[2](v8, v10);
  }

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_10006A994(v7, a3, a4);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v8, "didDetectGestureEvent:inRegion:") & 1) != 0) {
    [v8 didDetectGestureEvent:a3 inRegion:a4];
  }
}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  id v7 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v6, "siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:") & 1) != 0)
  {
    [v6 siriWillBeginTearDownForDismissalReason:a3 withOriginalDismissalOptions:v7];
  }

  else if ((objc_opt_respondsToSelector(v6, "siriWillBeginTearDownForDismissalReason:") & 1) != 0)
  {
    [v6 siriWillBeginTearDownForDismissalReason:a3];
  }
}

- (void)dismissSiriResults
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v2, "dismissSiriResults") & 1) != 0) {
    [v2 dismissSiriResults];
  }
}

- (void)hostApplicationPresentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4
{
  self->_presentationState = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "presentationStateUpdatedFromPresentationState:toPresentationState:");

  if ((v8 & 1) != 0)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
    [v9 presentationStateUpdatedFromPresentationState:a3 toPresentationState:a4];
  }

- (void)hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL requestActive = self->_requestActive;
    BOOL listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
    int v8 = 136315650;
    id v9 = "-[SRSiriViewController hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:]";
    __int16 v10 = 1024;
    BOOL v11 = requestActive;
    __int16 v12 = 1024;
    BOOL v13 = listenAfterSpeakingForRequestFinished;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Request Active:%d, LAS: %d",  (uint8_t *)&v8,  0x18u);
  }

  if (!self->_requestActive && self->_listenAfterSpeakingForRequestFinished)
  {
    -[SRSiriViewController _startListenAfterSpeaking](self, "_startListenAfterSpeaking");
    -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]( self,  "_setListenAfterSpeakingForRequestFinished:",  0LL);
  }
}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_10006AA40(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v15, "animatedDisappearanceDidBeginWithDuration:reason:") & 1) != 0) {
    [v15 animatedDisappearanceDidBeginWithDuration:a4 reason:a3];
  }
}

- (void)setPresentation:(id)a3
{
}

- (void)setPresentation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v9 = (SiriUIPresentation *)a3;
  uint64_t v10 = (Block_layout *)a5;
  uint64_t v11 = v10;
  p_presentation = &self->_presentation;
  if (self->_presentation != v9)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 window]);
    [v14 frame];
    v54.origin.CGFloat x = CGRectZero.origin.x;
    v54.origin.CGFloat y = CGRectZero.origin.y;
    v54.size.CGFloat width = CGRectZero.size.width;
    v54.size.CGFloat height = CGRectZero.size.height;
    BOOL v15 = CGRectEqualToRect(v53, v54);

    if (v15)
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 window]);
      char v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      [v18 bounds];
      objc_msgSend(v17, "setFrame:");
    }

    uint64_t v19 = *p_presentation;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
    id v21 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v22 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (!v22) {
        goto LABEL_14;
      }
      uint64_t v23 = &stru_1000BC638;
      *(_DWORD *)__int128 buf = 136315906;
      CGPoint v46 = "-[SRSiriViewController setPresentation:animated:completion:]";
      if (v6) {
        uint64_t v23 = @" (animated)";
      }
      __int16 v47 = 2112;
      v48 = v19;
      __int16 v49 = 2112;
      v50 = v9;
      __int16 v51 = 2112;
      v52 = v23;
      uint64_t v24 = "%s Transitioning from presentation %@ to presentation %@%@";
      uint64_t v25 = v21;
      uint32_t v26 = 42;
    }

    else
    {
      if (!v22) {
        goto LABEL_14;
      }
      *(_DWORD *)__int128 buf = 136315394;
      CGPoint v46 = "-[SRSiriViewController setPresentation:animated:completion:]";
      __int16 v47 = 2112;
      v48 = v9;
      uint64_t v24 = "%s Setting initial presentation to %@";
      uint64_t v25 = v21;
      uint32_t v26 = 22;
    }

    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_14:
    if ((objc_opt_respondsToSelector(*p_presentation, "setDataSource:") & 1) != 0) {
      -[SiriUIPresentation setDataSource:](*p_presentation, "setDataSource:", 0LL);
    }
    if ((objc_opt_respondsToSelector(*p_presentation, "setDelegate:") & 1) != 0) {
      -[SiriUIPresentation setDelegate:](*p_presentation, "setDelegate:", 0LL);
    }
    objc_storeStrong((id *)&self->_presentation, a3);
    if ((objc_opt_respondsToSelector(*p_presentation, "setDelegate:") & 1) != 0) {
      -[SiriUIPresentation setDelegate:](*p_presentation, "setDelegate:", self);
    }
    if ((objc_opt_respondsToSelector(*p_presentation, "setDataSource:") & 1) != 0) {
      -[SiriUIPresentation setDataSource:](*p_presentation, "setDataSource:", self);
    }
    if ((objc_opt_respondsToSelector(*p_presentation, "setBottomContentInset:") & 1) != 0) {
      -[SiriUIPresentation setBottomContentInset:](*p_presentation, "setBottomContentInset:", self->_bottomContentInset);
    }
    if ((objc_opt_respondsToSelector(*p_presentation, "shouldAllowTouchPassThrough") & 1) != 0) {
      uint64_t v27 = -[SiriUIPresentation shouldAllowTouchPassThrough]( *p_presentation,  "shouldAllowTouchPassThrough") ^ 1;
    }
    else {
      uint64_t v27 = 1LL;
    }
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 layer]);
    [v29 setHitTestsAsOpaque:v27];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
    if (v30)
    {
      -[SRSiriViewController addChildViewController:](self, "addChildViewController:", v30);
      [v30 didMoveToParentViewController:self];
      if (v6 && v20)
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_10001B844;
        v42[3] = &unk_1000BA108;
        id v43 = v20;
        __int16 v44 = v11;
        -[SRSiriViewController transitionFromViewController:toViewController:duration:options:animations:completion:]( self,  "transitionFromViewController:toViewController:duration:options:animations:completion:",  v43,  v30,  5242880LL,  0LL,  v42,  0.2);

LABEL_47:
        goto LABEL_48;
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 view]);
      [v31 setAutoresizingMask:18];

      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 view]);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
      [v33 bounds];
      objc_msgSend(v32, "setFrame:");

      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v30 view]);
      [v34 addSubview:v35];

      if (v20) {
        goto LABEL_34;
      }
      if (v19)
      {
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
        __int16 v38 = v40;
        if (v11) {
          __int128 v41 = v11;
        }
        else {
          __int128 v41 = &stru_1000BA4F0;
        }
        [v40 serviceViewControllerRequestsPresentation:v41];
        goto LABEL_46;
      }
    }

    else if (v20)
    {
LABEL_34:
      [v20 willMoveToParentViewController:0];
      unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue([v20 view]);
      [v36 removeFromSuperview];

      [v20 removeFromParentViewController];
      if (v30) {
        goto LABEL_35;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
      __int16 v38 = v37;
      if (v11) {
        __int128 v39 = v11;
      }
      else {
        __int128 v39 = &stru_1000BA510;
      }
      [v37 serviceViewControllerRequestsDismissalWithDismissalReason:0 completion:v39];
LABEL_46:

      goto LABEL_47;
    }

- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v20 = a4;
  uint64_t v10 = (void (**)(id, void))a6;
  id v11 = a3;
  -[SRSiriViewController _restorePreviousConversation](self, "_restorePreviousConversation");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SRSiriPresentationPluginHost sharedSiriPresentationPluginHost]( &OBJC_CLASS___SRSiriPresentationPluginHost,  "sharedSiriPresentationPluginHost"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 presentationWithIdentifier:v11 delegate:self dataSource:self]);

  objc_opt_class(self->_presentation, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
  {
    if (v10) {
      v10[2](v10, 0LL);
    }
  }

  else
  {
    if ((objc_opt_respondsToSelector(v13, "setShouldSuppressErrorTTS:") & 1) != 0)
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:AFUIPresentationPropertiesShouldSuppressErrorTTSKey]);
      objc_msgSend(v13, "setShouldSuppressErrorTTS:", objc_msgSend(v16, "BOOLValue"));
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:AFUIPresentationPropertiesRequestSourceKey]);
    if (v17 && (objc_opt_respondsToSelector(v13, "siriWillActivateFromSource:") & 1) != 0) {
      objc_msgSend(v13, "siriWillActivateFromSource:", objc_msgSend(v17, "integerValue"));
    }
    char v18 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:AFUIPresentationPropertiesShowsSensitiveUIKey]);
    id v19 = [v18 BOOLValue];

    if (v17 && (objc_opt_respondsToSelector(v13, "setShowsSensitiveUI:") & 1) != 0) {
      [v13 setShowsSensitiveUI:v19];
    }
    -[SRSiriViewController setPresentation:animated:completion:]( self,  "setPresentation:animated:completion:",  v13,  v7,  v10);
  }
}

- (CGRect)frameForApplication:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation", a3));
  char v5 = objc_opt_respondsToSelector(v4, "effectiveContentFrame");

  if ((v5 & 1) == 0) {
    goto LABEL_3;
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  [v6 effectiveContentFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v26.origin.CGFloat x = CGRectZero.origin.x;
  v26.origin.CGFloat y = CGRectZero.origin.y;
  v26.size.CGFloat width = CGRectZero.size.width;
  v26.size.CGFloat height = CGRectZero.size.height;
  v24.origin.CGFloat x = v8;
  v24.origin.CGFloat y = v10;
  v24.size.CGFloat width = v12;
  v24.size.CGFloat height = v14;
  if (CGRectEqualToRect(v24, v26))
  {
LABEL_3:
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    [v15 frame];
    CGFloat v8 = v16;
    CGFloat v10 = v17;
    CGFloat v12 = v18;
    CGFloat v14 = v19;
  }

  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)_openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 conversationId:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  double v16 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _punchoutMetricsAceCommandIdForItemWithIdentifier:]( self,  "_punchoutMetricsAceCommandIdForItemWithIdentifier:",  v14));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10001BD20;
  v31[3] = &unk_1000BA538;
  id v17 = v15;
  id v32 = v17;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", v31));
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001BD38;
  v23[3] = &unk_1000BA560;
  objc_copyWeak(&v28, &location);
  id v19 = v12;
  id v24 = v19;
  id v20 = v13;
  id v25 = v20;
  BOOL v29 = v9;
  id v21 = v17;
  id v27 = v21;
  id v22 = v16;
  id v26 = v22;
  [v18 openURL:v19 bundleId:v20 inPlace:v9 completion:v23];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_delayAceCommandSuccess:(id)a3 forDuration:(double)a4
{
  id v6 = a3;
  double v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v8 = v7;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    *(_DWORD *)__int128 buf = 136315650;
    double v16 = "-[SRSiriViewController _delayAceCommandSuccess:forDuration:]";
    __int16 v17 = 2048;
    double v18 = a4;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #aceCommandRecord scheduling a delayed action of %f seconds for command %@",  buf,  0x20u);
  }

  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
  objc_initWeak((id *)buf, self);
  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(a4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C008;
  block[3] = &unk_1000BA588;
  v14[1] = *(id *)&a4;
  id v13 = v6;
  id v11 = v6;
  objc_copyWeak(v14, (id *)buf);
  dispatch_after(v10, &_dispatch_main_q, block);
  objc_destroyWeak(v14);

  objc_destroyWeak((id *)buf);
}

- (void)_didReceiveAceCommand:(id)a3
{
}

- (void)_didReceiveAceCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[SRSiriViewController _didReceiveAceCommand:completion:]";
    __int16 v12 = 2112;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s %@ received ACE command: %@",  (uint8_t *)&v10,  0x20u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  [v9 registerAceCommand:v6 completion:v7];
}

- (void)_didStartActionForAceCommand:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "_afui_updateMapsAnalytics") & 1) != 0) {
    objc_msgSend(v4, "_afui_updateMapsAnalytics");
  }
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  [v5 recordActionStartedForAceCommand:v4];

  if (-[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
  {
    objc_opt_class(&OBJC_CLASS___SASSpeechPartialResult, v6);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v4, v7);
    if ((isKindOfClass & 1) != 0)
    {
      if (AFIsInternalInstall(isKindOfClass, v9))
      {
        id v21 = @"bestTextInterpretation";
        int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
        id v22 = v10;
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      }

      else
      {
        id v11 = 0LL;
      }

      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
      __int16 v17 = v16;
      uint64_t v18 = 1505LL;
LABEL_14:
      [v16 logEventWithType:v18 context:v11];

      goto LABEL_15;
    }

    objc_opt_class(&OBJC_CLASS___SASSpeechRecognized, v9);
    uint64_t v13 = objc_opt_isKindOfClass(v4, v12);
    if ((v13 & 1) != 0)
    {
      if (AFIsInternalInstall(v13, v14))
      {
        __int16 v19 = @"bestTextInterpretation";
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
        id v20 = v15;
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      }

      else
      {
        id v11 = 0LL;
      }

      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
      __int16 v17 = v16;
      uint64_t v18 = 1507LL;
      goto LABEL_14;
    }
  }

- (void)_didStartActionForItemAtIndexPath:(id)a3 inConversation:(id)a4
{
  char v5 = (void *)objc_claimAutoreleasedReturnValue([a4 itemAtIndexPath:a3]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 aceCommandIdentifier]);

  uint64_t v6 = v8;
  if (v8)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v8));
    -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v7);

    uint64_t v6 = v8;
  }
}

- (id)_aceCommandWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 aceCommandWithIdentifier:v4]);

  return v6;
}

- (void)_speakText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 provisionally:(BOOL)a7 eligibleAfterDuration:(double)a8 delayed:(BOOL)a9 canUseServerTTS:(BOOL)a10 speakableUtteranceParser:(id)a11 analyticsContext:(id)a12 speakableContextInfo:(id)a13 preparation:(id)a14 completion:(id)a15
{
  BYTE2(v15) = a10;
  BYTE1(v15) = a9;
  LOBYTE(v15) = a7;
  -[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:]( self,  "_speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfte rDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:",  a3,  0LL,  0LL,  a4,  a5,  a6,  a8,  0LL,  0LL,  v15,  a11,  a12,  a13,  a14,  a15);
}

- (void)_speakText:(id)a3 audioData:(id)a4 ignoreMuteSwitch:(BOOL)a5 identifier:(id)a6 sessionId:(id)a7 preferredVoice:(id)a8 language:(id)a9 gender:(id)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 speakableUtteranceParser:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17 preparation:(id)a18 completion:(id)a19
{
  id v24 = a3;
  id v25 = a4;
  id v37 = a6;
  id v38 = a7;
  id v39 = a8;
  id v40 = a9;
  id v26 = a10;
  id v41 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_10001C930;
  v60[3] = &unk_1000BA5B0;
  id v30 = a19;
  id v61 = v30;
  id v31 = objc_retainBlock(v60);
  id v32 = (void (**)(void, void, void))v31;
  if (v24)
  {
    id v31 = [v24 length];
    if (!v25 && !v31) {
      goto LABEL_4;
    }
  }

  else if (!v25)
  {
LABEL_4:
    v32[2](v32, 2LL, 0LL);
    goto LABEL_11;
  }

  if ((AFDeviceSupportsTTS(v31) & 1) != 0)
  {
    objc_initWeak(location, self);
    session = self->_session;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10001C944;
    v42[3] = &unk_1000BA628;
    objc_copyWeak(v56, location);
    CGRect v53 = v32;
    id v43 = v25;
    id v44 = v37;
    id v45 = v38;
    BOOL v57 = a11;
    v56[1] = *(id *)&a12;
    id v54 = v30;
    BOOL v58 = a14;
    id v46 = v24;
    id v47 = v41;
    id v55 = v29;
    id v48 = v39;
    id v49 = v40;
    id v50 = v26;
    BOOL v59 = a13;
    id v51 = v27;
    id v52 = v28;
    -[AFUISiriSession forceAudioSessionActiveWithCompletion:](session, "forceAudioSessionActiveWithCompletion:", v42);

    objc_destroyWeak(v56);
    objc_destroyWeak(location);
  }

  else
  {
    id v33 = v26;
    __int16 v34 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:"
                                      "preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseS"
                                      "erverTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s TTS not available on certain devices, marking as finished",  (uint8_t *)location,  0xCu);
    }

    v32[2](v32, 1LL, 0LL);
    id v26 = v33;
  }

- (void)_didCompleteActionForAceCommand:(id)a3 success:(BOOL)a4
{
  BOOL v29 = a4;
  id v6 = a3;
  objc_opt_class(&OBJC_CLASS___SAUISayIt, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0
    && !-[SRSiriViewController _presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:]( self,  "_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:",  v6))
  {
    id v27 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      unsigned int v36 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s #tts 33 NOT recording SAUISayIt completed for SAUISayIt=%@",  buf,  0x16u);
    }

    objc_storeStrong((id *)&self->_previousSayItCommand, a3);
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
    [v13 recordActionStoppedForAceCommand:v6];
    goto LABEL_20;
  }

  uint64_t v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315650;
    unsigned int v36 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 1024;
    BOOL v40 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s #tts 33 recording command completed for aceCommand=%@ success=%i",  buf,  0x1Cu);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  [v10 recordActionCompletedForAceCommand:v6 success:v29];

  objc_opt_class(&OBJC_CLASS___SAUIAddViews, v11);
  if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
  {
    id v13 = v6;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "af_dialogPhase"));
    unsigned __int8 v15 = [v14 isReflectionDialogPhase];

    if ((v15 & 1) == 0)
    {
      id v28 = v6;
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 refId]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 pendingAddViewsWithReflectionDialogPhaseWithRefId:v17]);

      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            id v25 = (os_log_s *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 136315650;
              unsigned int v36 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
              __int16 v37 = 2112;
              id v38 = v24;
              __int16 v39 = 1024;
              BOOL v40 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s #tts recording reflectionDialogPhase command completed command=%@ success=%i",  buf,  0x1Cu);
            }

            id v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
            [v26 recordActionCompletedForAceCommand:v24 success:1];
          }

          id v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v21);
      }

      id v6 = v28;
    }

- (BOOL)_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  char v6 = objc_opt_respondsToSelector(v5, "shouldProceedToNextCommandAtSpeechSynthesisEnd");

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
    id v8 = [v7 performSelector:"shouldProceedToNextCommandAtSpeechSynthesisEnd"];
    BOOL v9 = v8 != 0LL;

    int v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
      id v13 = @"doesn't allow";
      int v15 = 136315906;
      double v16 = "-[SRSiriViewController _presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:]";
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      if (v8) {
        id v13 = @"allows";
      }
      __int16 v19 = 2112;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s #tts presentation:%@ %@ recording SAUISayIt=%@ completed",  (uint8_t *)&v15,  0x2Au);
    }
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_synthesizeSpeechWithText:(id)a3 identifier:(id)a4 sessionId:(id)a5 isPhonetic:(BOOL)a6 provisionally:(BOOL)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  if (a8) {
    int v15 = (Block_layout *)a8;
  }
  else {
    int v15 = &stru_1000BA668;
  }
  id v16 = a5;
  id v17 = a4;
  uint64_t v18 = objc_retainBlock(v15);
  __int16 v19 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v22 = "-[SRSiriViewController _synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:]";
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s #tts Enqueueing text=\"%@\"", buf, 0x16u);
  }

  *(_WORD *)((char *)&v20 + 1) = 256;
  LOBYTE(v20) = a7;
  -[SRUIFSpeechSynthesizer enqueueText:identifier:sessionId:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:]( self->_ttsManager,  "enqueueText:identifier:sessionId:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServer TTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:",  v14,  v17,  v16,  0LL,  0LL,  v10,  0.4,  v20,  0LL,  v18,  0LL,  0LL);
}

- (void)_synthesizePhoneticText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
}

- (void)_synthesizeProvisionalText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
}

- (void)_synthesizeText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
}

- (void)_cancelSpeechSynthesis
{
  BOOL v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[SRSiriViewController _cancelSpeechSynthesis]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[SRUIFSpeechSynthesizer cancel](self->_ttsManager, "cancel");
  -[SRSiriViewController notifyClientStateManagerSpeakingEnded:](self, "notifyClientStateManagerSpeakingEnded:", 0LL);
}

- (BOOL)_isSpeechSynthesisSpeaking
{
  return self->_synthesisIsSpeaking;
}

+ (id)_speechIdentifierForConversationItem:(id)a3
{
  id v3 = a3;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aceObject]);
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);

  if (!v5) {
    char v5 = (void *)objc_claimAutoreleasedReturnValue([v3 aceCommandIdentifier]);
  }

  return v5;
}

- (void)speechSynthesisGetPreparedTextForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  synthesisPreparationDictionarCGFloat y = self->_synthesisPreparationDictionary;
  id v8 = (void (**)(id, void, uint64_t))a4;
  BOOL v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( synthesisPreparationDictionary,  "objectForKey:",  v6));
  BOOL v10 = (os_log_s *)AFSiriLogContextConnection;
  if (v9)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[SRSiriViewController speechSynthesisGetPreparedTextForIdentifier:completion:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s #tts 11 A Getting text for preparation identifier %@",  (uint8_t *)&v11,  0x16u);
    }

    ((void (**)(void, void (**)(id, void, uint64_t)))v9)[2](v9, v8);
  }

  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006AC08();
    }
    v8[2](v8, 0LL, 1LL);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_synthesisPreparationDictionary, "removeObjectForKey:", v6);
}

- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    BOOL v10 = "-[SRSiriViewController speechSynthesisDidStartSpeakingWithIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts identifier=%@", (uint8_t *)&v9, 0x16u);
  }

  [UIApp finishedIPTest:SUICPPTTestNameSiriBringupToCarPlayMessageReading];
  self->_synthesisIsSpeaking = 1;
  self->_ttsSpokenForRequest = 1;
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v7 = objc_opt_respondsToSelector(v6, "siriDidStartSpeakingWithIdentifier:");

  if ((v7 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v8 siriDidStartSpeakingWithIdentifier:v4];
  }
}

- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v24 = "-[SRSiriViewController speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:]";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 1024;
    BOOL v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #tts #punchout 6 identifier=%@ queueIsEmpty=%i",  buf,  0x1Cu);
  }

  self->_synthesisIsSpeaking = 0;
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v9 = objc_opt_respondsToSelector(v8, "siriDidStopSpeakingWithIdentifier:speechQueueIsEmpty:");

  if ((v9 & 1) != 0)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v10 siriDidStopSpeakingWithIdentifier:v6 speechQueueIsEmpty:v4];
  }

  if (v4 && self->_ttsDelayedBlocks)
  {
    __int16 v11 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v24 = "-[SRSiriViewController speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s #punchout 7 executing _ttsDelayedBlocks",  buf,  0xCu);
    }

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v12 = self->_ttsDelayedBlocks;
    id v13 = -[AFQueue countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8LL * (void)v16) + 16LL))(*(void *)(*((void *)&v18 + 1) + 8LL * (void)v16));
          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = -[AFQueue countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v14);
    }

    ttsDelayedBlocks = self->_ttsDelayedBlocks;
    self->_ttsDelayedBlocks = 0LL;
  }
}

- (void)speechSynthesisDidFinish:(id)a3
{
}

- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3
{
}

- (void)notifyClientStateManagerTransactionBegan:(id)a3
{
}

- (void)notifyClientStateManagerTransactionEnded:(id)a3
{
}

- (void)notifyClientStateManagerSpeakingBegan:(id)a3
{
}

- (void)notifyClientStateManagerSpeakingEnded:(id)a3
{
  BOOL v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSiriViewController notifyClientStateManagerSpeakingEnded:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v5, 0xCu);
  }

  -[AFUISiriSession notifyStateManagerSpeakingEnded](self->_session, "notifyStateManagerSpeakingEnded");
}

- (id)domainObjectForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _domainObjectStorageConnection](self, "_domainObjectStorageConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);

  char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domainObjectForKey:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", v7));

  return v8;
}

- (void)setDomainObject:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _domainObjectStorageConnection](self, "_domainObjectStorageConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionary]);

  char v9 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
  [v10 setDomainObject:v8 forKey:v9];
}

- (void)audioPlayerStartPlaying:(id)a3
{
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates")) {
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
  }
}

- (void)audioPlayer:(id)a3 didFinishPlayback:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  -[SRSiriViewController _setAudioPlayerIsPlaying:](self, "_setAudioPlayerIsPlaying:", 0LL);
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates")) {
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v7 forceAudioSessionActive];

  objc_opt_class(&OBJC_CLASS___SABaseClientBoundCommand, v8);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    -[SRSiriViewController _didCompleteActionForAceCommand:success:]( self,  "_didCompleteActionForAceCommand:success:",  v6,  1LL);
  }

  else
  {
    objc_opt_class(&OBJC_CLASS___SAUISnippet, v10);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v17 conversationItemIdentifier]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 itemWithIdentifier:v13]);

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 aceCommandIdentifier]);
      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v15));
        -[SRSiriViewController _didCompleteActionForAceCommand:success:]( self,  "_didCompleteActionForAceCommand:success:",  v16,  1LL);
        [v17 setConversationItemIdentifier:0];
      }
    }
  }
}

- (id)audioPlayer:(id)a3 audioURLForCommand:(id)a4
{
  id v4 = a4;
  objc_opt_class(&OBJC_CLASS___SASmsPlayAudio, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
    if (!v8) {
      goto LABEL_16;
    }
  }

  else
  {
    objc_opt_class(&OBJC_CLASS___SAUISnippet, v7);
    if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
    {
      uint64_t v8 = 0LL;
LABEL_16:
      __int128 v19 = 0LL;
      goto LABEL_19;
    }

    id v10 = v4;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    objc_opt_class(&OBJC_CLASS___SASmsSms, v12);
    char isKindOfClass = objc_opt_isKindOfClass(v11, v13);

    if ((isKindOfClass & 1) != 0) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 context]);
    }
    else {
      uint64_t v8 = 0LL;
    }

    if (!v8) {
      goto LABEL_16;
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 messageType]);
  unsigned __int8 v16 = [v15 isEqualToString:SASmsSmsMessageTypeAudioMessageValue];

  if ((v16 & 1) == 0)
  {
    __int128 v20 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006AC74(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_16;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](&OBJC_CLASS___SiriUISnippetManager, "sharedInstance"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 speakableProviderForObject:v8]);

  if (v18 && (objc_opt_respondsToSelector(v18, "attachmentURLForExpression:") & 1) != 0) {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 attachmentURLForExpression:SASmsSmsDeferredMessageKeyValue]);
  }
  else {
    __int128 v19 = 0LL;
  }

LABEL_19:
  return v19;
}

- (void)aceCommandRecords:(id)a3 didChangeResultForCommand:(id)a4 completion:(id)a5
{
  id v10 = a5;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  uint64_t v9 = v8;
  if (v10) {
    [v8 resultDidChangeForAceCommand:v7 completion:v10];
  }
  else {
    [v8 resultDidChangeForAceCommand:v7];
  }
}

- (void)siriSessionRequestsToShowAssetsDownloadNotificationPrompt
{
}

- (void)siriSessionWillProcessAceCommand:(id)a3
{
  id v7 = a3;
  if ((_os_feature_enabled_impl("ResponseFramework", "Enabled") & 1) != 0) {
    id v4 = (__objc2_class *)&OBJC_CLASS___MDDialogTransformer;
  }
  else {
    id v4 = &OBJC_CLASS___SRModeDialogTransformer;
  }
  if ((-[__objc2_class supportsTransformationForAceCommand:]( v4,  "supportsTransformationForAceCommand:",  v7) & 1) == 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    [v5 logClientFeedbackPresented:v7 dialogIdentifierProvider:v6];
  }
}

- (void)siriSessionResultForAceCommand:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  id v9 = [v10 resultForAceCommand:v8];

  (*((void (**)(id, id))a4 + 2))(v7, v9);
}

- (void)siriSessionWillStartRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = v6;
  else {
    BOOL v9 = 0LL;
  }
  [v8 setAcousticIdEnabled:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v11 = objc_opt_respondsToSelector(v10, "configureOptionsForImminentRequest:");

  uint64_t v12 = v8;
  if ((v11 & 1) != 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 configureOptionsForImminentRequest:v8]);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 requestInfo]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 speechRequestOptions]);

  if ([v15 activationEvent] == (id)5)
  {
    unsigned __int8 v16 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      BOOL ttsSpokenForRequest = self->_ttsSpokenForRequest;
      int v21 = 136315394;
      uint64_t v22 = "-[SRSiriViewController siriSessionWillStartRequestWithOptions:completion:]";
      __int16 v23 = 1024;
      LODWORD(v24) = ttsSpokenForRequest;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s ttsSpokenForRequest: %d",  (uint8_t *)&v21,  0x12u);
    }

    if (self->_ttsSpokenForRequest) {
      uint64_t v18 = 1LL;
    }
    else {
      uint64_t v18 = 3LL;
    }
    [v15 setPresentationMode:v18];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 requestInfo]);
    [v19 setSpeechRequestOptions:v15];
  }

  if ([v12 requestSource] == (id)42) {
    -[SRSiriViewController _setWaitingForStartRequest:](self, "_setWaitingForStartRequest:", 1LL);
  }
  -[SRModeProvider setRequestOptions:](self->_modeProvider, "setRequestOptions:", v12);
  __int128 v20 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    uint64_t v22 = "-[SRSiriViewController siriSessionWillStartRequestWithOptions:completion:]";
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Modified options:%@",  (uint8_t *)&v21,  0x16u);
  }

  if (v7) {
    v7[2](v7, v12);
  }
}

- (void)_updateKeyboardStateWithError:(id)a3
{
  id v14 = a3;
  BOOL lastMinimized = self->_lastMinimized;
  if (-[SRSiriViewController _siriIsShowingPasscodeUnlock](self, "_siriIsShowingPasscodeUnlock"))
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = lastMinimized;
    goto LABEL_24;
  }

  if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)20)
  {
    uint64_t v5 = 1LL;
    uint64_t v6 = 1LL;
    goto LABEL_24;
  }

  if (-[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
  {
    if (!self->_keyboardEnabled)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      goto LABEL_24;
    }

    uint64_t v6 = +[UIKeyboard isInHardwareKeyboardMode](&OBJC_CLASS___UIKeyboard, "isInHardwareKeyboardMode") ^ 1;
  }

  else if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23)
  {
    if (self->_keyboardEnabled) {
      unsigned int v7 = +[UIKeyboard isInHardwareKeyboardMode](&OBJC_CLASS___UIKeyboard, "isInHardwareKeyboardMode") ^ 1;
    }
    else {
      unsigned int v7 = 0;
    }
    BOOL v9 = [v14 code] != (id)207 && objc_msgSend(v14, "code") != (id)203;
    uint64_t v6 = v9 & v7;
  }

  else
  {
    uint64_t v6 = lastMinimized || self->_requestOptions == 0LL;
  }

  uint64_t v5 = 1LL;
LABEL_24:
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v11 = objc_opt_respondsToSelector(v10, "currentSnippetContainsFooterButtons");

  if ((v11 & 1) != 0)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned int v13 = [v12 currentSnippetContainsFooterButtons];

    uint64_t v6 = v13 | v6;
  }

  -[SRSiriViewController _updateKeyboardState:minimized:](self, "_updateKeyboardState:minimized:", v5, v6);
}

- (void)siriSessionWillStartRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  id v4 = [v3 inputType];

  if (v4 == (id)2)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    [v5 serviceDidRequestKeyboard:0];
  }

  if (-[SRSiriViewController _isSpeechSynthesisSpeaking](self, "_isSpeechSynthesisSpeaking"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    [v6 emitUserBargeInEventForBargedInTurn];
  }

  -[SRSiriViewController _setRequestActive:](self, "_setRequestActive:", 1LL);
  -[SRSiriViewController _setWaitingForStartRequest:](self, "_setWaitingForStartRequest:", 0LL);
  -[SRSiriViewController _reflectionDialogHasBeenPlayed:](self, "_reflectionDialogHasBeenPlayed:", 0LL);
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded");
  self->_delaySessionEndForInPlacePunchout = 0;
  self->_keyboardEnabled = 1;
  -[SRSiriViewController _setKeyboardLoweredAfterResponse:](self, "_setKeyboardLoweredAfterResponse:", 0LL);
  -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]( self,  "_setListenAfterSpeakingForRequestFinished:",  0LL);
  -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  if (-[SRSiriViewController _isUserUtteranceTapToEditInProgress](self, "_isUserUtteranceTapToEditInProgress")) {
    -[SASRequestOptions setRequestSource:](self->_requestOptions, "setRequestSource:", 32LL);
  }
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "siriRequestWillStartWithRequestOptions:");

  if ((v8 & 1) != 0)
  {
    if ((-[SASRequestOptions isForBluetoothCar](self->_requestOptions, "isForBluetoothCar") & 1) != 0
      || -[SASRequestOptions isForEyesFree](self->_requestOptions, "isForEyesFree"))
    {
      BOOL v9 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        unsigned __int8 v16 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s This is either a bluetooth car request or an eyes free request",  (uint8_t *)&v15,  0xCu);
      }

      id v10 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        unsigned __int8 v16 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Emitting BT Car InvocationContext",  (uint8_t *)&v15,  0xCu);
      }

      char v11 = objc_alloc_init(&OBJC_CLASS___SRCarInvocationSourceInstrumentationSender);
      -[SRCarInvocationSourceInstrumentationSender sendBTCarInvocationContext](v11, "sendBTCarInvocationContext");
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v12 siriRequestWillStartWithRequestOptions:self->_requestOptions];
  }

  unint64_t v13 = (unint64_t)-[SASRequestOptions requestSource](self->_requestOptions, "requestSource");
  if (v13 == 50)
  {
    -[SRSiriViewController _insertUserUtteranceViewForSuggestion:]( self,  "_insertUserUtteranceViewForSuggestion:",  self->_requestText);
  }

  else if (v13 == 23)
  {
    -[SRSiriViewController _insertUserUtteranceViewForText:]( self,  "_insertUserUtteranceViewForText:",  self->_requestText);
  }

  else if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 0x18)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SASRequestOptions text](self->_requestOptions, "text"));
    -[SRSiriViewController _insertUserUtteranceViewForText:](self, "_insertUserUtteranceViewForText:", v14);
  }

- (void)siriSessionWillStartUIRequestWithText:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, uint64_t))a4;
  if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled]( &OBJC_CLASS___AFSystemAssistantExperienceStatusManager,  "isSAEEnabled"))
  {
    -[SRSiriViewController _insertUserUtteranceViewForText:](self, "_insertUserUtteranceViewForText:", v6);
    if (v7) {
      v7[2](v7, 1LL);
    }
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___SAUIUserUtteranceView);
    [v8 setText:v6];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    [v8 setAceId:v10];

    char v11 = objc_alloc_init(&OBJC_CLASS___SAUIAddViews);
    id v17 = v8;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    -[SAUIAddViews setViews:](v11, "setViews:", v12);

    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    -[SAUIAddViews setAceId:](v11, "setAceId:", v14);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001EE3C;
    v15[3] = &unk_1000BA690;
    unsigned __int8 v16 = v7;
    -[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]( self,  "siriSessionDidReceiveAddViewsCommand:completion:",  v11,  v15);
  }
}

- (void)siriSessionWillCancelRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _utteranceToSpeakAfterClearScreenCommand]( self,  "_utteranceToSpeakAfterClearScreenCommand"));
  id v4 = [v3 length];

  if (v4)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[AFSpeakableUtteranceParser sruif_speakableUtteranceParserForCurrentLanguage]( &OBJC_CLASS___AFSpeakableUtteranceParser,  "sruif_speakableUtteranceParserForCurrentLanguage"));
    [v7 setHandleTTSCodes:1];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _utteranceToSpeakAfterClearScreenCommand]( self,  "_utteranceToSpeakAfterClearScreenCommand"));
    LOBYTE(v6) = 1;
    -[SRSiriViewController _speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:]( self,  "_speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakab leUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:",  v5,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v6,  v7,  0LL,  0LL,  0LL,  0LL);

    -[SRSiriViewController _setUtteranceToSpeakAfterClearScreenCommand:]( self,  "_setUtteranceToSpeakAfterClearScreenCommand:",  0LL);
  }

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v5, "siriAudioRecordingDidChangePowerLevel:") & 1) != 0)
  {
    *(float *)&double v4 = a3;
    [v5 siriAudioRecordingDidChangePowerLevel:v4];
  }
}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v9, "siriAudioRecordingDidChangePowerLevel:peakLevel:") & 1) != 0)
  {
    *(float *)&double v7 = a3;
    *(float *)&double v8 = a4;
    [v9 siriAudioRecordingDidChangePowerLevel:v7 peakLevel:v8];
  }
}

- (void)siriSessionDidFinishRequestWithError:(id)a3
{
  double v4 = (__CFString *)a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"success";
    if (v4) {
      uint64_t v6 = v4;
    }
    *(_DWORD *)__int128 buf = 136315394;
    unint64_t v13 = "-[SRSiriViewController siriSessionDidFinishRequestWithError:]";
    __int16 v14 = 2112;
    int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #session %@", buf, 0x16u);
  }

  if (-[SRSiriViewController textInputEnabled](self, "textInputEnabled")
    && -[SRSiriViewController _isRequestActive](self, "_isRequestActive")
    && !-[SRSiriViewController _isUserUtteranceTapToEditInProgress](self, "_isUserUtteranceTapToEditInProgress"))
  {
    -[SRSiriViewController _updateKeyboardStateWithError:](self, "_updateKeyboardStateWithError:", v4);
    requestText = self->_requestText;
    self->_requestText = (NSString *)&stru_1000BC638;
  }

  BOOL listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
  -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]( self,  "_setListenAfterSpeakingForRequestFinished:",  0LL);
  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001F1CC;
  v9[3] = &unk_1000BA6B8;
  BOOL v11 = listenAfterSpeakingForRequestFinished;
  objc_copyWeak(&v10, (id *)buf);
  -[SRSiriViewController _handleRequestError:completion:](self, "_handleRequestError:completion:", v4, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  objc_msgSend( v11,  "processSessionEvent:isSpeechSynthesisSpeaking:machAbsoluteTime:",  a5,  -[SRSiriViewController _isSpeechSynthesisSpeaking](self, "_isSpeechSynthesisSpeaking"),  a6);

  if (a4 != a3)
  {
    objc_initWeak((id *)location, self);
    __int16 v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472LL;
    unsigned int v36 = sub_10001F688;
    __int16 v37 = &unk_1000BA6E0;
    objc_copyWeak(v38, (id *)location);
    v38[1] = (id)a3;
    void v38[2] = (id)a4;
    v38[3] = *(id *)&a6;
    uint64_t v12 = objc_retainBlock(&v34);
    unint64_t v13 = v12;
    if (self->_initialInstrumentationTurnReceieved)
    {
      ((void (*)(void ***))v12[2])(v12);
    }

    else
    {
      instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
      if (!instrumentationStateTransitionsPendingInitialTurn)
      {
        int v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v34, v35, v36, v37));
        unsigned __int8 v16 = self->_instrumentationStateTransitionsPendingInitialTurn;
        self->_instrumentationStateTransitionsPendingInitialTurn = v15;

        instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
      }

      id v17 = objc_retainBlock(v13);
      -[NSMutableArray addObject:](instrumentationStateTransitionsPendingInitialTurn, "addObject:", v17);
    }

    objc_destroyWeak(v38);
    objc_destroyWeak((id *)location);
  }

  else {
    int64_t v18 = qword_100082A08[a4 - 1];
  }
  self->_siriState = v18;
  -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded",  v34,  v35,  v36,  v37);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _voicemailPlayer](self, "_voicemailPlayer"));
  [v19 stopPlaying];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  [v20 stopPlaying];

  int v21 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v21;
    uint64_t Description = SRUIFSiriSessionStateGetDescription(a3);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(Description);
    uint64_t v25 = SRUIFSiriSessionStateGetDescription(a4);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = SRUIFSiriSessionEventGetDescription(a5);
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[SRSiriViewController siriSessionDidTransitionFromState:toState:event:machAbsoluteTransitionTime:]";
    __int16 v40 = 2112;
    id v41 = v24;
    __int16 v42 = 2112;
    id v43 = v26;
    __int16 v44 = 2112;
    id v45 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s #state changing fromState: %@ toState: %@, event: %@",  location,  0x2Au);
  }

  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v30 = objc_opt_respondsToSelector(v29, "siriDidTransitionFromState:event:");

  if ((v30 & 1) != 0)
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    __int128 v32 = v31;
    else {
      uint64_t v33 = qword_100082A08[a3 - 1];
    }
    objc_msgSend(v31, "siriDidTransitionFromState:event:", v33, sub_10001F7CC((uint64_t)v31, a5));
  }

- (void)siriSessionDidStartNewTurn:(id)a3
{
  id v4 = a3;
  -[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:]( self,  "siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:",  v4,  0LL,  0LL,  (double)mach_absolute_time());
}

- (void)siriSessionDidStartNewTurn:(id)a3 associatedLaunchStartContext:(id)a4 machAbsoluteTime:(double)a5 linkPreviousTurn:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = v12;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 turnIdentifier]);
    *(_DWORD *)__int128 buf = 136315650;
    id v41 = "-[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:]";
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    id v45 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s #instrumentation %@ indicates a new turn %@ has started",  buf,  0x20u);
  }

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentInstrumentationTurnContext]);
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 turnIdentifier]);

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
  [v19 storeCurrentInstrumentationTurnContext:v10];

  if (v11)
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    [v20 emitInstrumentation:v11 atTime:(unint64_t)a5];
  }

  if (v6)
  {
    int v21 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v21;
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v10 turnIdentifier]);
      *(_DWORD *)__int128 buf = 136315650;
      id v41 = "-[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:]";
      __int16 v42 = 2112;
      id v43 = v18;
      __int16 v44 = 2112;
      id v45 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s #instrumentation linking previous turn %@ with the new turn %@",  buf,  0x20u);
    }

    id v24 = objc_alloc_init(&OBJC_CLASS___SISchemaConversationTrace);
    if (v18)
    {
      uint64_t Bytes = AFTurnIdentifierGetBytes(v18);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(Bytes);
    }

    else
    {
      uint64_t v27 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006ACE4(v27, v10);
      }
      uint64_t v26 = 0LL;
    }

    [v24 setPreviousTurnID:v26];
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    [v28 emitInstrumentation:v24];
  }

  self->_initialInstrumentationTurnReceieved = 1;
  if (-[NSMutableArray count](self->_instrumentationStateTransitionsPendingInitialTurn, "count"))
  {
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    BOOL v29 = self->_instrumentationStateTransitionsPendingInitialTurn;
    id v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v36;
      do
      {
        uint64_t v33 = 0LL;
        do
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(v29);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v35 + 1) + 8LL * (void)v33) + 16LL))(*(void *)(*((void *)&v35 + 1) + 8LL * (void)v33));
          uint64_t v33 = (char *)v33 + 1;
        }

        while (v31 != v33);
        id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
      }

      while (v31);
    }

    instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
    self->_instrumentationStateTransitionsPendingInitialTurn = 0LL;
  }
}

- (void)siriSessionRequestsInstrumentingMessage:(id)a3 machAbsoluteTime:(double)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v7 emitInstrumentation:v6 atTime:(unint64_t)a4];
}

- (void)siriSessionGetRequestContextWithCompletionHandler:(id)a3
{
  double v8 = (void (**)(id, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v5 = objc_opt_respondsToSelector(v4, "requestContext");

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestContext]);
  }

  else
  {
    id v7 = 0LL;
  }

  v8[2](v8, v7);
}

- (void)siriSessionDidChangeNetworkAvailability
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "siriNetworkAvailabilityDidChange");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 siriNetworkAvailabilityDidChange];
  }

- (void)siriSessionDidChangeLockState:(unint64_t)a3
{
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    unint64_t lockState = self->_lockState;
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v12 = "-[SRSiriViewController siriSessionDidChangeLockState:]";
    __int16 v13 = 2048;
    unint64_t v14 = lockState;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s old lockState=%zd, new lockState=%zd",  buf,  0x20u);
  }

  BOOL v7 = self->_lockState == 0;
  self->_unint64_t lockState = a3;
  if ((((a3 != 0) ^ v7) & 1) == 0)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___SISchemaDeviceLockStateChanged);
    [v8 setIsDeviceLocked:a3 != 0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    [v9 emitInstrumentation:v8];
  }

  if (!a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001FEA8;
    block[3] = &unk_1000BA078;
    void block[4] = self;
    if (qword_1000D9B00 != -1) {
      dispatch_once(&qword_1000D9B00, block);
    }
  }

- (void)siriSessionDidReceiveOpenLinkCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 ref]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scheme]);
  if (![v9 caseInsensitiveCompare:@"prefs"]
    || ![v9 caseInsensitiveCompare:@"audio-player-event"])
  {
    goto LABEL_16;
  }

  if (![v9 caseInsensitiveCompare:@"http"]
    || ![v9 caseInsensitiveCompare:@"https"])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 host]);
    if ([v10 caseInsensitiveCompare:@"apple.com"])
    {
      id v11 = [v10 rangeOfString:@".apple.com" options:13];

      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_7;
      }
    }

    else
    {
    }

- (void)siriSessionOpenURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL delaySessionEndForInPlacePunchout = self->_delaySessionEndForInPlacePunchout;
  id v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"Replace";
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v22 = "-[SRSiriViewController siriSessionOpenURL:completionHandler:]";
    __int16 v23 = 2112;
    if (delaySessionEndForInPlacePunchout) {
      id v10 = @"InPlace";
    }
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s #punchout 1 Performing %@ punchout of URL: %@",  buf,  0x20u);
  }

  -[SRSiriViewController _openURL:bundleId:inPlace:conversationId:completion:]( self,  "_openURL:bundleId:inPlace:conversationId:completion:",  v6,  0LL,  delaySessionEndForInPlacePunchout,  0LL,  v7);
  if (delaySessionEndForInPlacePunchout)
  {
    if (!self->_ttsDelayedBlocks)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___AFQueue);
      ttsDelayedBlocks = self->_ttsDelayedBlocks;
      self->_ttsDelayedBlocks = v11;
    }

    objc_initWeak((id *)buf, self);
    unsigned int v13 = self->_ttsDelayedBlocks;
    __int16 v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    id v17 = sub_10002047C;
    int64_t v18 = &unk_1000BA730;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v6;
    unint64_t v14 = objc_retainBlock(&v15);
    -[AFQueue enqueueObject:](v13, "enqueueObject:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)siriSessionRequestsDismissalForReason:(int64_t)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t Name = SASDismissalReasonGetName(a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v9 = 136315394;
    id v10 = "-[SRSiriViewController siriSessionRequestsDismissalForReason:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Siri Session is requesting dismissal %@",  (uint8_t *)&v9,  0x16u);
  }

  -[SRSiriViewController _dismissWithReason:](self, "_dismissWithReason:", a3);
}

- (void)siriSessionIsPresentingLocalAuthenticationUI
{
  *(void *)&double v3 = objc_opt_class(self, a2).n128_u64[0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v4, v3));
  id v6 = (id)objc_claimAutoreleasedReturnValue( [v5 assistantUILocalizedStringForKey:@"ASSISTANT_PRESENTING_LOCAL_AUTHENTICATION_UI" table:0]);

  -[SRSiriViewController _presentAuthenticationDialogWithText:](self, "_presentAuthenticationDialogWithText:", v6);
}

- (void)siriSessionIsPresentingApplePaySheet
{
  *(void *)&double v3 = objc_opt_class(self, a2).n128_u64[0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v4, v3));
  id v6 = (id)objc_claimAutoreleasedReturnValue( [v5 assistantUILocalizedStringForKey:@"ASSISTANT_PRESENTING_APPLE_PAY_SHEET" table:0]);

  -[SRSiriViewController _presentAuthenticationDialogWithText:](self, "_presentAuthenticationDialogWithText:", v6);
}

- (void)_presentAuthenticationDialogWithText:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = objc_alloc_init(&OBJC_CLASS___SAUIAddViews);
  -[SAUIAddViews setDialogPhase:](v5, "setDialogPhase:", SAUIDialogPhaseStatusValue);
  id v6 = objc_alloc_init(&OBJC_CLASS___SAUIAssistantUtteranceView);
  [v6 setText:v4];
  [v6 setSpeakableText:v4];

  [v11 addObject:v6];
  -[SAUIAddViews setViews:](v5, "setViews:", v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAddViews dictionary](v5, "dictionary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", v7));

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  [v8 setAceId:v10];

  -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:]( self,  "_performGenericAceCommand:turnIdentifier:completion:",  v8,  0LL,  0LL);
}

- (void)siriSessionDidReceiveSpeechRecognizedCommand:(id)a3
{
  id v4 = a3;
  if (AFIsInternalInstall(v4, v5))
  {
    int64_t v18 = @"bestTextInterpretation";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
    id v19 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v8 logEventWithType:1506 context:v7];

  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v4);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v9 addItemForSpeechRecognizedCommand:v4];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_userUtteranceValue"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bestTextInterpretation]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SiriSharedUIReplayUtilityWrapper sharedInstance]( &OBJC_CLASS___SiriSharedUIReplayUtilityWrapper,  "sharedInstance"));
  [v12 speechRecognized:v11];

  unsigned int v13 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    __int16 v15 = "-[SRSiriViewController siriSessionDidReceiveSpeechRecognizedCommand:]";
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Speech Recognized: %@",  (uint8_t *)&v14,  0x16u);
  }
}

- (void)siriSessionDidRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v8 addAdditionalSpeechInterpretation:v7 refId:v6];
}

- (void)siriSessionDidUpdateRecognitionWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v11 addRecognitionUpdateWithPhrases:v10 utterances:v9 refId:v8];
}

- (void)siriSessionDidReceiveSpeechPartialResultCommand:(id)a3
{
  id v4 = a3;
  if (AFIsInternalInstall(v4, v5))
  {
    id v19 = @"bestTextInterpretation";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
    id v20 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v8 logEventWithType:1504 context:v7];

  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v4);
  id v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    __int16 v16 = "-[SRSiriViewController siriSessionDidReceiveSpeechPartialResultCommand:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Did receive partial speech result %@",  (uint8_t *)&v15,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v10 addItemForPartialResultCommand:v4];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v12 = objc_opt_respondsToSelector(v11, "siriDidUpdateASRWithRecognition:");

  if ((v12 & 1) != 0)
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "af_bestTextInterpretation"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v14 siriDidUpdateASRWithRecognition:v13];
  }
}

- (id)removeAlternativeFeatureViews:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v10);
        objc_opt_class(&OBJC_CLASS___SAARParaphrasedAlternativeResultsPod, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
        {
          objc_opt_class(&OBJC_CLASS___SAARParaphrasedSuggestedResultsPod, v7);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0) {
            -[NSMutableArray addObject:](v4, "addObject:", v11);
          }
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  [v3 setViews:v4];
  return v3;
}

- (BOOL)_shouldLowerKeyboardForAddViewsCommand:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 views]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 firstObject]);
  objc_opt_class(&OBJC_CLASS___SAUIAssistantTipView, v6);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "af_dialogPhase"));
  LOBYTE(v5) = [v9 isReflectionDialogPhase];

  char v10 = 0;
  if ((v5 & 1) == 0 && (isKindOfClass & 1) == 0)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      int v14 = 0;
      int v15 = 0;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v11);
          }
          __int128 v18 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 listenAfterSpeaking]);
          v14 |= [v19 BOOLValue];

          v15 |= SiriUIAceViewHasButtons(v18);
        }

        id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v13);
      char v10 = v14 ^ 1 | v15;
    }

    else
    {
      char v10 = 1;
    }
  }

  return v10 & 1;
}

- (void)_updateKeyboardState:(BOOL)a3 minimized:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!-[SRSiriViewController _isKeyboardLoweredAfterResponse](self, "_isKeyboardLoweredAfterResponse"))
  {
    if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23)
    {
      objc_initWeak(&location, self);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100021124;
      v8[3] = &unk_1000BA758;
      objc_copyWeak(&v9, &location);
      BOOL v10 = v4;
      BOOL v11 = v5;
      [v7 serviceDidRequestCurrentTextInput:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }

    else if (-[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
    {
      -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:]( self,  "_setShowKeyboardIfTextInputEnabled:minimized:",  v5,  v4);
      -[SRSiriViewController _setKeyboardLoweredAfterResponse:](self, "_setKeyboardLoweredAfterResponse:", v4);
    }
  }

- (void)_updateKeyboardStatusForAddViewsCommand:(id)a3
{
  if (-[SRSiriViewController _shouldLowerKeyboardForAddViewsCommand:]( self,  "_shouldLowerKeyboardForAddViewsCommand:",  a3))
  {
    uint64_t v4 = +[UIKeyboard isInHardwareKeyboardMode](&OBJC_CLASS___UIKeyboard, "isInHardwareKeyboardMode") ^ 1;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23
    || (_DWORD)v4 && -[SASRequestOptions inputType](self->_requestOptions, "inputType") == (id)2)
  {
    -[SRSiriViewController _updateKeyboardState:minimized:]( self,  "_updateKeyboardState:minimized:",  -[SRSiriViewController textInputEnabled](self, "textInputEnabled"),  v4);
  }

- (void)siriSessionDidReceiveAddViewsCommand:(id)a3 completion:(id)a4
{
  id v129 = a3;
  v128 = (void (**)(id, void *))a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SiriSharedUIReplayUtilityWrapper sharedInstance]( &OBJC_CLASS___SiriSharedUIReplayUtilityWrapper,  "sharedInstance"));
  [v6 receivedCommand:v129];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "didReceiveAddViewsDialogPhaseForSuggestions:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "af_dialogPhase"));
    [v9 didReceiveAddViewsDialogPhaseForSuggestions:v10];
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v129 views]);
  id v12 = objc_alloc(&OBJC_CLASS___NSMutableString);
  *(void *)&double v14 = objc_opt_class(v129, v13).n128_u64[0];
  uint64_t v16 = v15;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "aceId", v14));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v129 refId]);
  v132 = -[NSMutableString initWithFormat:](v12, "initWithFormat:", @"<%@: %@ refId:%@>\n", v16, v17, v18);

  __int128 v138 = 0u;
  __int128 v139 = 0u;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  id obj = v11;
  id v19 = [obj countByEnumeratingWithState:&v136 objects:v147 count:16];
  if (v19)
  {
    char v131 = 0;
    uint64_t v20 = *(void *)v137;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v137 != v20) {
          objc_enumerationMutation(obj);
        }
        __int128 v22 = *(void **)(*((void *)&v136 + 1) + 8LL * (void)i);
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[SiriUIUtilities descriptionForAceView:]( &OBJC_CLASS___SiriUIUtilities,  "descriptionForAceView:",  v22));
        -[NSMutableString appendFormat:](v132, "appendFormat:", @"%@\n", v23);

        __int128 v24 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_opt_class(v22, v25);
          id v27 = v26;
          *(_DWORD *)__int128 buf = 136315394;
          v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
          __int16 v143 = 2112;
          id v144 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s #modes SAUIAddViews view class: %@",  buf,  0x16u);
        }

        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v22 dialog]);
        BOOL v29 = v28 == 0LL;

        if (!v29)
        {
          id v30 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 136315138;
            v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
          }

          char v131 = 1;
        }

        id v31 = (void *)objc_claimAutoreleasedReturnValue([v22 aceId]);
        BOOL v32 = v31 == 0LL;

        if (v32)
        {
          __int16 v34 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 136315394;
            v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
            __int16 v143 = 2112;
            id v144 = v22;
            _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s View missing aceID can result in TTS speaking AddViews and SayIt out of order %@",  buf,  0x16u);
          }

          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
          uint64_t v36 = AFAnalyticsContextCreateWithCommand(v129);
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          [v35 logEventWithType:1449 context:v37];
        }

        objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView, v33);
        if ((objc_opt_isKindOfClass(v22, v38) & 1) != 0)
        {
          __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v22 dialogIdentifier]);
          -[SRSiriViewController disableTouchIDFaceIDIfNecessaryForDucID:]( self,  "disableTouchIDFaceIDIfNecessaryForDucID:",  v39);

          __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v22 listenAfterSpeaking]);
          self->_keyboardEnabled = [v40 BOOLValue] ^ 1;
        }

        responseViewId = self->_responseViewId;
        self->_responseViewId = 0LL;

        objc_opt_class(&OBJC_CLASS___SAUIPluginSnippet, v42);
        if ((objc_opt_isKindOfClass(v22, v43) & 1) != 0)
        {
          id v45 = (void *)objc_claimAutoreleasedReturnValue([v22 responseViewId]);
          BOOL v46 = v45 == 0LL;

          if (!v46)
          {
            id v47 = (NSString *)objc_claimAutoreleasedReturnValue([v22 responseViewId]);
            id v48 = self->_responseViewId;
            self->_responseViewId = v47;
          }
        }

        objc_opt_class(&OBJC_CLASS___SACardSnippet, v44);
        if ((objc_opt_isKindOfClass(v22, v49) & 1) != 0)
        {
          id v50 = (void *)objc_claimAutoreleasedReturnValue([v22 responseViewId]);
          BOOL v51 = v50 == 0LL;

          if (!v51)
          {
            id v52 = (NSString *)objc_claimAutoreleasedReturnValue([v22 responseViewId]);
            CGRect v53 = self->_responseViewId;
            self->_responseViewId = v52;

            id v54 = objc_alloc(&OBJC_CLASS___VRXVisualResponseShown);
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v22 cardData]);
            id v56 = [v54 initWithCardData:v55 responseViewId:self->_responseViewId];

            BOOL v57 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
            BOOL v58 = (void *)objc_claimAutoreleasedReturnValue([v57 currentInstrumentationTurnContext]);
            BOOL v59 = (void *)objc_claimAutoreleasedReturnValue([v58 turnIdentifier]);

            [v56 emitWithTurnIdentifier:v59];
          }
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue([v22 dialog]);

        if (v60)
        {
          id v61 = (void *)objc_claimAutoreleasedReturnValue([v22 dialog]);
          v62 = (void *)objc_claimAutoreleasedReturnValue([v61 dialogIdentifier]);
          -[SRSiriViewController disableTouchIDFaceIDIfNecessaryForDucID:]( self,  "disableTouchIDFaceIDIfNecessaryForDucID:",  v62);
        }

        if (!self->_listenAfterSpeakingForRequestFinished)
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue([v22 listenAfterSpeaking]);
          unsigned int v64 = [v63 BOOLValue];

          if (v64)
          {
            -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]( self,  "_setListenAfterSpeakingForRequestFinished:",  1LL);
            v65 = (void *)objc_claimAutoreleasedReturnValue([v22 listenAfterSpeakingBehavior]);
            v66 = (NSString *)objc_claimAutoreleasedReturnValue([v65 startAlertSoundID]);
            startRecordingSoundId = self->_startRecordingSoundId;
            self->_startRecordingSoundId = v66;
          }
        }

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
        char v69 = objc_opt_respondsToSelector(v68, "delayDismissalAfterIdleFires:");

        if ((v69 & 1) != 0)
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
          v71 = (void *)objc_claimAutoreleasedReturnValue([v22 delayDismissalMs]);
          [v70 delayDismissalAfterIdleFires:v71];
        }
      }

      id v19 = [obj countByEnumeratingWithState:&v136 objects:v147 count:16];
    }

    while (v19);
  }

  else
  {
    char v131 = 0;
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v73 = objc_opt_respondsToSelector(v72, "handleFeedbackForm:");

  if ((v73 & 1) != 0)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v129 feedbackForm]);
    [v74 handleFeedbackForm:v75];
  }

  v76 = (void *)objc_claimAutoreleasedReturnValue([v129 requestEndBehavior]);
  if (v76)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v78 = objc_opt_respondsToSelector(v77, "handleRequestEndBehavior:isAttending:");

    if ((v78 & 1) != 0)
    {
      objc_initWeak((id *)buf, self);
      v133[0] = _NSConcreteStackBlock;
      v133[1] = 3221225472LL;
      v133[2] = sub_100022254;
      v133[3] = &unk_1000BA780;
      objc_copyWeak(&v135, (id *)buf);
      id v134 = v129;
      -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", v133);

      objc_destroyWeak(&v135);
      objc_destroyWeak((id *)buf);
    }
  }

  id v79 = v129;
  -[SRSiriViewController _logPatternExecutedEventForAddViewsCommand:]( self,  "_logPatternExecutedEventForAddViewsCommand:",  v79);
  -[SRSiriViewController _sharePatternIdFromAddViewsCommand:](self, "_sharePatternIdFromAddViewsCommand:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue([v79 responseMode]);
  unint64_t v81 = -[SRSiriViewController _responseModeToMDModeConverter:](self, "_responseModeToMDModeConverter:", v80);

  v82 = (void *)objc_claimAutoreleasedReturnValue([v79 responseMode]);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v82 lowercaseString]);

  v84 = (NSString *)objc_claimAutoreleasedReturnValue([v79 refId]);
  addViewsRefId = self->_addViewsRefId;
  self->_addViewsRefId = v84;

  v86 = (void *)objc_claimAutoreleasedReturnValue([v79 responseMode]);
  self->_addViewsMode = -[SRSiriViewController _responseModeToMDModeConverter:]( self,  "_responseModeToMDModeConverter:",  v86);

  v87 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
  {
    id v88 = (id)objc_claimAutoreleasedReturnValue([v79 patternId]);
    *(_DWORD *)__int128 buf = 136315394;
    v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
    __int16 v143 = 2112;
    id v144 = v88;
    _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "%s #modes SAUIAddViews patternId: [%@]",  buf,  0x16u);
  }

  v89 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    v90 = self->_responseViewId;
    *(_DWORD *)__int128 buf = 136315394;
    v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
    __int16 v143 = 2112;
    id v144 = v90;
    _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "%s #modes SAUIAddViews responseViewId: [%@]",  buf,  0x16u);
  }

  v91 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
  {
    v92 = "false";
    if ((v131 & 1) != 0) {
      v92 = "true";
    }
    *(_DWORD *)__int128 buf = 136315394;
    v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
    __int16 v143 = 2080;
    id v144 = (id)v92;
    _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "%s #modes snippetViewContainsDialog: %s",  buf,  0x16u);
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue([v79 patternId]);
  if (v93 || -[NSString length](self->_responseViewId, "length"))
  {

    if ((v131 & 1) == 0)
    {
      v100 = v79;
      goto LABEL_65;
    }
  }

  v94 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "%s #modes non-RF response - setting currentMode as computed mode passed from MAF through addViews for iOS bridging",  buf,  0xCu);
  }

  id v95 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "sruif_dialogPhase"));
  unsigned int v96 = -[SRSiriViewController _suppressTTSForErrorsAndInterstitials](self, "_suppressTTSForErrorsAndInterstitials");

  if (v96)
  {
    id v95 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v95,  OS_LOG_TYPE_DEFAULT,  "%s #modes Applying DisplayOnly mode to suppress interstitials from being spoken",  buf,  0xCu);
    }

    unint64_t v81 = 2LL;
LABEL_60:
  }

  v97 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t Name = MDModeGetName(v81);
    id v99 = (id)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)__int128 buf = 136315650;
    v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
    __int16 v143 = 2112;
    id v144 = v99;
    __int16 v145 = 2112;
    v146 = v132;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "%s #modes %@ %@", buf, 0x20u);
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue( +[MDDialogTransformer transformAddViews:forMode:]( &OBJC_CLASS___MDDialogTransformer,  "transformAddViews:forMode:",  v79,  v81));
LABEL_65:
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  BOOL v102 = [v101 requestSource] == (id)52;

  if (v102)
  {
    v103 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_DEFAULT,  "%s #modes Applying DisplayOnly mode to suppress TTS from being spoken for quickTypeTamale",  buf,  0xCu);
    }

    uint64_t v104 = objc_claimAutoreleasedReturnValue( +[MDDialogTransformer transformAddViews:forMode:]( &OBJC_CLASS___MDDialogTransformer,  "transformAddViews:forMode:",  v100,  2LL));
    unint64_t v81 = 2LL;
    v100 = (void *)v104;
  }

  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "sruif_dialogPhase"));
  unsigned int v106 = [v105 isReflectionDialogPhase];

  if (v106) {
    -[SRSiriViewController _reflectionDialogHasBeenPlayed:](self, "_reflectionDialogHasBeenPlayed:", 1LL);
  }
  if ((id)-[SRSiriViewController _presentationOptions](self, "_presentationOptions") == (id)2) {
    int64_t v107 = 4LL;
  }
  else {
    int64_t v107 = +[SRVisualResponseTransformer currentIdiom](&OBJC_CLASS___SRVisualResponseTransformer, "currentIdiom");
  }
  id v108 = (id)objc_claimAutoreleasedReturnValue( +[SRVisualResponseTransformer transformVisualResponse:forMode:idiom:shouldHideSnippet:]( &OBJC_CLASS___SRVisualResponseTransformer,  "transformVisualResponse:forMode:idiom:shouldHideSnippet:",  v100,  -[SRSiriViewController _MDModeToSRModeConverter:](self, "_MDModeToSRModeConverter:", v81),  v107,  0LL));

  v109 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v110 = objc_opt_respondsToSelector(v109, "siriResponseModeDidChange:");

  if ((v110 & 1) != 0)
  {
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v111 siriResponseModeDidChange:v81];
  }

  v112 = (void *)objc_claimAutoreleasedReturnValue([v108 views]);
  BOOL v113 = [v112 count] == 0;

  if (v113)
  {
    v122 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      v142 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "%s System UI Presented. Resetting ASR",  buf,  0xCu);
    }

    v123 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v124 = objc_opt_respondsToSelector(v123, "resetViewsAndClearASR:");

    if ((v124 & 1) != 0)
    {
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      [v125 resetViewsAndClearASR:1];
    }

    v126 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
      sub_10006AD8C(v79, v126);
    }

    if (v128)
    {
      v121 = (void *)objc_claimAutoreleasedReturnValue([v79 aceId]);
      v127 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v121));
      v128[2](v128, v127);

      goto LABEL_87;
    }
  }

  else
  {
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    [v114 logClientFeedbackPresented:v108 dialogIdentifierProvider:v115];

    analyticsSupplement = self->_analyticsSupplement;
    uint64_t v117 = -[SRSiriViewController _instrumentationResponseModeForMode:]( self,  "_instrumentationResponseModeForMode:",  v81);
    id v140 = v108;
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v140, 1LL));
    -[SRUIFAnalyticsSupplement didComputeMode:forAceCommand:generatedAceCommands:]( analyticsSupplement,  "didComputeMode:forAceCommand:generatedAceCommands:",  v117,  v79,  v118);

    -[SRSiriViewController _processAddViewsCommand:forMode:completion:]( self,  "_processAddViewsCommand:forMode:completion:",  v108,  -[SRSiriViewController _MDModeToSRModeConverter:](self, "_MDModeToSRModeConverter:", v81),  v128);
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    int v120 = objc_opt_respondsToSelector(v119, "didReceiveAddViewsSignalForSuggestions:currentMode:");

    if ((v120 & 1) != 0)
    {
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      [v121 didReceiveAddViewsSignalForSuggestions:self->_addViewsRefId currentMode:v83];
LABEL_87:
    }
  }
}

- (void)siriSessionRequestsTTSDuckToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[SRSiriViewController siriSessionRequestsTTSDuckToVolume:rampTime:completion:]";
    __int16 v13 = 2048;
    double v14 = a3;
    __int16 v15 = 2048;
    double v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Ducking TTS to %f over time %f",  (uint8_t *)&v11,  0x20u);
  }

  *(float *)&double v10 = a3;
  -[SRUIFSpeechSynthesizer duckTTSVolumeTo:rampTime:completion:]( self->_ttsManager,  "duckTTSVolumeTo:rampTime:completion:",  v8,  v10,  a4);
}

- (void)siriSessionWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v5 = objc_opt_respondsToSelector(v4, "siriWillProcessAppLaunchWithBundleIdentifier:");

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v6 siriWillProcessAppLaunchWithBundleIdentifier:v7];
  }
}

- (void)siriSessionDidEnterLatencyState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "siriDidEnterLatencyState");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 siriDidEnterLatencyState];
  }

- (void)siriSessionDidReceiveLatencyInformation:(id)a3
{
  id v7 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v5 = objc_opt_respondsToSelector(v4, "siriDidReceiveLatencyInformation:");

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v6 siriDidReceiveLatencyInformation:v7];
  }
}

- (void)siriSessionDidBeginTaskWithIdentifier:(id)a3
{
  id v7 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v5 = objc_opt_respondsToSelector(v4, "siriDidBeginTaskWithIdentifier:");

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v6 siriDidBeginTaskWithIdentifier:v7];
  }
}

- (void)siriSessionDidReceiveStartImmersiveExperienceCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "siriDidReceiveStartImmersiveExperienceCommand:completion:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 siriDidReceiveStartImmersiveExperienceCommand:v10 completion:v6];
  }
}

- (void)siriSessionDidReceiveStartGenAIEnablementFlowCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "siriDidReceiveStartGenAIEnablementFlowCommand:completion:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 siriDidReceiveStartGenAIEnablementFlowCommand:v10 completion:v6];
  }
}

- (void)orchestrationDidPresentResponseFullyInApp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "didPresentResponseFullyInApp");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 didPresentResponseFullyInApp];
  }

- (void)_processAddViewsCommand:(id)a3 forMode:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v11 = objc_opt_respondsToSelector(v10, "prepareAddViewsCommandForConversation:");

  double v14 = v9;
  if ((v11 & 1) != 0)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v15 prepareAddViewsCommandForConversation:v9]);
  }

  if (SiriUIDisableAlternativesFeature(v12, v13))
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[SRSiriViewController removeAlternativeFeatureViews:](self, "removeAlternativeFeatureViews:", v14));

    double v14 = (void *)v16;
  }

  if (-[SRSiriViewController textInputEnabled](self, "textInputEnabled")) {
    -[SRSiriViewController _updateKeyboardStatusForAddViewsCommand:]( self,  "_updateKeyboardStatusForAddViewsCommand:",  v14);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100022990;
  v25[3] = &unk_1000BA690;
  id v17 = v8;
  id v26 = v17;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v14, v25);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 dialogPhase]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFDialogPhase dialogPhaseForAceDialogPhase:]( &OBJC_CLASS___AFDialogPhase,  "dialogPhaseForAceDialogPhase:",  v18));

  if (([v19 isTemporary] & 1) == 0
    && ([v19 isConfirmedDialogPhase] & 1) == 0
    && ([v19 isCancelledDialogPhase] & 1) == 0)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _repeatablePhrases](self, "_repeatablePhrases"));
    [v20 removeAllObjects];

    repeatableAudioSayit = self->_repeatableAudioSayit;
    self->_repeatableAudioSayit = 0LL;
  }

  if (![v19 isTemporary] || objc_msgSend(v19, "isConfirmationDialogPhase"))
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    [v22 requestDidPresentViewForUICommand:v14];
  }

  if ([v19 isErrorDialogPhase])
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    [v23 requestDidPresentViewForErrorCommand:v14];
  }

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v24 addItemsForAddViewsCommand:v14];
}

- (void)siriSessionDidReceiveClearScreenCommand:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v6 = (void (**)(id, id))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v15);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v15);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "startNewConversation");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 startNewConversation];
  }

  else
  {
    id v10 = -[SRSiriViewController _startNewConversation](self, "_startNewConversation");
  }

  char v11 = (void *)objc_claimAutoreleasedReturnValue([v15 initialView]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 speakableText]);

  if ([v12 length]) {
    -[SRSiriViewController _setUtteranceToSpeakAfterClearScreenCommand:]( self,  "_setUtteranceToSpeakAfterClearScreenCommand:",  v12);
  }
  -[SRSiriViewController _didCompleteActionForAceCommand:success:]( self,  "_didCompleteActionForAceCommand:success:",  v15,  1LL);
  if (v6)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v15 aceId]);
    [v13 setRefId:v14];

    v6[2](v6, v13);
  }
}

- (void)siriSessionDidReceivePlayVoicemailCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, a4);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _voicemailPlayer](self, "_voicemailPlayer"));
  [v7 setPlaybackCommand:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _voicemailPlayer](self, "_voicemailPlayer"));
  [v8 startPlaying];
}

- (AFUIAudioPlayer)_voicemailPlayer
{
  voicemailPlayer = self->_voicemailPlayer;
  if (!voicemailPlayer)
  {
    char v4 = (AFUIAudioPlayer *)objc_claimAutoreleasedReturnValue(+[AFUIAudioPlayer voicemailPlayer](&OBJC_CLASS___AFUIAudioPlayer, "voicemailPlayer"));
    id v5 = self->_voicemailPlayer;
    self->_voicemailPlayer = v4;

    -[AFUIAudioPlayer setDelegate:](self->_voicemailPlayer, "setDelegate:", self);
    voicemailPlayer = self->_voicemailPlayer;
  }

  return voicemailPlayer;
}

- (id)_configuredSpeakableUtteranceParserForCommand:(id)a3 context:(id)a4 speakableText:(id)a5 subCompletion:(id)a6 speakPreparation:(id *)a7 speakCompletion:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v39 = a6;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AFSpeakableUtteranceParser sruif_speakableUtteranceParserForCurrentLanguage]( &OBJC_CLASS___AFSpeakableUtteranceParser,  "sruif_speakableUtteranceParserForCurrentLanguage"));
  [v15 setHandleTTSCodes:1];
  id v16 = [v13 conformsToProtocol:&OBJC_PROTOCOL___SAAceIdentifiable];
  if ((_DWORD)v16)
  {
    id v18 = v13;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
    id v13 = v18;
    if ([v19 isAMOSIdentifier])
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController domainObjectForIdentifier:](self, "domainObjectForIdentifier:", v19));
    }
  }

  uint64_t v55 = 0LL;
  id v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  char v58 = 0;
  if (AFIsInternalInstall(v16, v17))
  {
    objc_opt_class(&OBJC_CLASS___AceObject, v20);
    if ((objc_opt_isKindOfClass(v12, v21) & 1) != 0)
    {
      unsigned __int8 v22 = +[SRUIFUtilities shouldRedactSpeakableTextForAceObject:]( &OBJC_CLASS___SRUIFUtilities,  "shouldRedactSpeakableTextForAceObject:",  v12);
      *((_BYTE *)v56 + 24) = v22;
    }
  }

  if (!objc_msgSend( v15,  "sruif_hasExternalDomainsForStringWithFormat:shouldRedactLog:",  v14,  *((unsigned __int8 *)v56 + 24))) {
    goto LABEL_15;
  }
  objc_opt_class(&OBJC_CLASS___AceObject, v23);
  if ((objc_opt_isKindOfClass(v13, v24) & 1) == 0)
  {
    id v27 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_opt_class(v13, v28);
      sub_10006AE5C(v29, (uint64_t)v59, v27);
    }

LABEL_15:
    id v26 = 0LL;
    goto LABEL_16;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUISnippetManager sharedInstance](&OBJC_CLASS___SiriUISnippetManager, "sharedInstance"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 speakableProviderForObject:v13]);

  if (v26) {
    [v15 registerProvider:v26 forNamespace:_AFSpeakableUtteranceParserObjDomain];
  }
LABEL_16:
  if ((objc_opt_respondsToSelector(v26, "setAssistantBulletin:") & 1) != 0
    && (objc_opt_respondsToSelector(v26, "identifier") & 1) != 0)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
    objc_initWeak(&location, self);
    if (v30)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_100023050;
      v48[3] = &unk_1000BA7F8;
      objc_copyWeak(&v53, &location);
      id v31 = v30;
      id v49 = v31;
      id v50 = v26;
      id v51 = v15;
      id v52 = v14;
      BOOL v32 = objc_retainBlock(v48);

      objc_destroyWeak(&v53);
      goto LABEL_22;
    }
  }

  else
  {
    objc_initWeak(&location, self);
  }

  id v31 = 0LL;
  BOOL v32 = 0LL;
LABEL_22:
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10002334C;
  v42[3] = &unk_1000BA820;
  objc_copyWeak(&v47, &location);
  BOOL v46 = &v55;
  id v33 = v14;
  id v43 = v33;
  id v34 = v12;
  id v44 = v34;
  id v35 = v39;
  id v45 = v35;
  uint64_t v36 = objc_retainBlock(v42);
  if (a7) {
    *a7 = [v32 copy];
  }
  if (a8) {
    *a8 = [v36 copy];
  }
  id v37 = v15;

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v55, 8);
  return v37;
}

- (void)siriSessionDidReceiveSmsPlayAudioCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, a4);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  [v7 setPlaybackCommand:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  [v8 startPlaying];
}

- (AFUIAudioPlayer)_audioMessagePlayer
{
  audioMessagePlayer = self->_audioMessagePlayer;
  if (!audioMessagePlayer)
  {
    char v4 = (AFUIAudioPlayer *)objc_claimAutoreleasedReturnValue(+[AFUIAudioPlayer audioMessagePlayer](&OBJC_CLASS___AFUIAudioPlayer, "audioMessagePlayer"));
    id v5 = self->_audioMessagePlayer;
    self->_audioMessagePlayer = v4;

    -[AFUIAudioPlayer setDelegate:](self->_audioMessagePlayer, "setDelegate:", self);
    audioMessagePlayer = self->_audioMessagePlayer;
  }

  return audioMessagePlayer;
}

- (void)siriSessionDidReceivePlayNotificationSound:(id)a3 completion:(id)a4
{
  id v7 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v7, a4);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v7);
  -[AFUISiriSession forceAudioSessionActive](self->_session, "forceAudioSessionActive");
  id v8 = [[TLAlertConfiguration alloc] initWithType:2];
  [v8 setShouldIgnoreRingerSwitch:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TLAlert alertWithConfiguration:](&OBJC_CLASS___TLAlert, "alertWithConfiguration:", v8));
  [v9 setPlaybackObserver:self];
  p_currentNotificationSound = &self->_currentNotificationSound;
  objc_storeStrong((id *)p_currentNotificationSound, a3);
  char v11 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *p_currentNotificationSound;
    int v13 = 136315650;
    id v14 = "-[SRSiriViewController siriSessionDidReceivePlayNotificationSound:completion:]";
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Playing notification sound %@ for command %@ ",  (uint8_t *)&v13,  0x20u);
  }

  [v9 playWithCompletionHandler:&stru_1000BA840];
}

- (void)alertDidBeginPlaying:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v10 = "-[SRSiriViewController alertDidBeginPlaying:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Alert %@ began playing", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  dispatch_time_t v6 = dispatch_time(0LL, 1500000000LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100023A68;
  v7[3] = &unk_1000BA730;
  objc_copyWeak(&v8, (id *)buf);
  v7[4] = self;
  dispatch_after(v6, &_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)siriSessionDidReceiveSayItCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  addViewsRefId = self->_addViewsRefId;
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 refId]);
  LODWORD(addViewsRefId) = -[NSString isEqualToString:](addViewsRefId, "isEqualToString:", v11);

  if (!(_DWORD)addViewsRefId || self->_addViewsMode != 2)
  {
    id v19 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v19;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIUtilities descriptionForSayIt:](&OBJC_CLASS___SiriUIUtilities, "descriptionForSayIt:", v9));
      *(_DWORD *)__int128 buf = 136315394;
      id v30 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
      __int16 v31 = 2112;
      BOOL v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s #modes %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_previousSayItCommand, a3);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100023E6C;
    v27[3] = &unk_1000BA690;
    id v28 = v8;
    -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v9, v27);
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    [v22 requestDidPresentViewForUICommand:v9];

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 audioData]);
    if (v23)
    {
    }

    else
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v9 languageCode]);
      if (!v24) {
        goto LABEL_12;
      }
      uint64_t v25 = (void *)v24;
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 message]);

      if (!v26) {
        goto LABEL_12;
      }
    }

    objc_storeStrong((id *)&self->_repeatableAudioSayit, a3);
LABEL_12:
    -[SRSiriViewController _performSayItCommand:](self, "_performSayItCommand:", v9);
    __int16 v17 = v28;
    goto LABEL_13;
  }

  id v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t addViewsMode = self->_addViewsMode;
    id v14 = v12;
    uint64_t Name = MDModeGetName(addViewsMode);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)__int128 buf = 136315394;
    id v30 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
    __int16 v31 = 2112;
    BOOL v32 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s #modes Suppressing SayIt command because the mode is %@",  buf,  0x16u);
  }

  if (v8)
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 refId]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v17));
    (*((void (**)(id, void *))v8 + 2))(v8, v18);

LABEL_13:
  }
}

- (void)siriSessionDidReceiveRepeatItCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]( self,  "_setListenAfterSpeakingForRequestFinished:",  self->_listenAfterSpeakingForRepeatable);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  void v38[2] = sub_1000242A0;
  v38[3] = &unk_1000BA690;
  id v19 = v7;
  id v39 = v19;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, v38);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v8 requestDidPresentViewForUICommand:v6];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _repeatablePhrases](self, "_repeatablePhrases"));
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  id v37 = [v20 count];
  if (self->_repeatableAudioSayit)
  {
    -[SRSiriViewController _performSayItCommand:](self, "_performSayItCommand:");
  }

  else if (v35[3])
  {
    -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
    objc_initWeak(&location, self);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id obj = v20;
    id v9 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_1000242F4;
          v22[3] = &unk_1000BA890;
          uint64_t v24 = &v34;
          objc_copyWeak(&v25, &location);
          id v23 = v6;
          -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  v12,  v13,  v14,  v22);

          objc_destroyWeak(&v25);
        }

        id v9 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
      }

      while (v9);
    }

    objc_destroyWeak(&location);
  }

  else
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 contingency]);

    if (v15)
    {
      -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v6);
      objc_initWeak(&location, self);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 contingency]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1000242B4;
      v30[3] = &unk_1000BA868;
      objc_copyWeak(&v32, &location);
      id v31 = v6;
      -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  v16,  v17,  v18,  v30);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }

  _Block_object_dispose(&v34, 8);
}

- (void)siriSessionDidReceiveShowHelpCommand:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SRSiriViewController _setShowKeyboardIfTextInputEnabled:minimized:]( self,  "_setShowKeyboardIfTextInputEnabled:minimized:",  1LL,  1LL);
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v7, v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v8 requestDidPresentViewForUICommand:v7];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v9 addItemsForShowHelpCommand:v7];
}

- (void)siriSessionDidReceiveUpdateViewsCommand:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "prepareUpdateViewsCommandForConversation:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 prepareUpdateViewsCommandForConversation:v13]);

    id v11 = (id)v10;
  }

  else
  {
    id v11 = v13;
  }

  id v14 = v11;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v11, v6);
  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v14);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v12 updateWithUpdateViewsCommand:v14];

  -[SRSiriViewController _didCompleteActionForAceCommand:success:]( self,  "_didCompleteActionForAceCommand:success:",  v14,  1LL);
}

- (void)siriSessionDidReceiveAppPunchOutCommand:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue([v8 aceId]);

  if (v10) {
    -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v8);
  }
  objc_initWeak(&location, self);
  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100024708;
    v15[3] = &unk_1000BA8B8;
    id v11 = v15;
    uint64_t v10 = &v18;
    objc_copyWeak(&v18, &location);
    id v4 = &v16;
    id v16 = v8;
    id v5 = &v17;
    id v17 = v9;
  }

  else
  {
    id v11 = 0LL;
  }

  uint64_t v12 = objc_retainBlock(v11);
  id v13 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v21 = "-[SRSiriViewController siriSessionDidReceiveAppPunchOutCommand:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Waking system for app punchout", buf, 0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v14 wakeSystemForReason:PBSWakeReasonSiriCommand];

  -[SRSiriViewController _performAppPunchOutCommand:completion:]( self,  "_performAppPunchOutCommand:completion:",  v8,  v12);
  if (v9)
  {

    objc_destroyWeak(v10);
  }

  objc_destroyWeak(&location);
}

- (void)siriSessionDidReceiveCloseAssistantCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_msgSend(v6, "reason", kdebug_trace(722468952, 0, 0, 0, 0).n128_f64[0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unsigned int v10 = [v9 isEqualToString:SAUICloseAssistantReasonEMPTY_RECOGNITIONValue];

  if (v10) {
    uint64_t v11 = 53LL;
  }
  else {
    uint64_t v11 = 10LL;
  }
  if (-[SASRequestOptions isForAppleTV](self->_requestOptions, "isForAppleTV"))
  {
    uint64_t v12 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      *(_DWORD *)__int128 buf = 136315650;
      id v23 = "-[SRSiriViewController siriSessionDidReceiveCloseAssistantCommand:completion:]";
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      __int128 v27 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s #tv #dismissal Received Close Assistant command %@, aceId: %@",  buf,  0x20u);
    }

    -[SRSiriViewController _dismissWithReason:](self, "_dismissWithReason:", v11);
    if (v7)
    {
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v15));
      v7[2](v7, v16);
    }
  }

  else
  {
    objc_initWeak((id *)buf, self);
    ttsManager = self->_ttsManager;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100024A90;
    v18[3] = &unk_1000BA908;
    objc_copyWeak(v21, (id *)buf);
    uint64_t v20 = v7;
    id v19 = v6;
    v21[1] = (id)v11;
    -[SRUIFSpeechSynthesizer isSynthesisQueueEmpty:](ttsManager, "isSynthesisQueueEmpty:", v18);

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)siriSessionDidReceiveListenForPronunciationCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  ttsManager = self->_ttsManager;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100024FB0;
  _OWORD v13[3] = &unk_1000BA930;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  -[SRUIFSpeechSynthesizer enqueueText:identifier:sessionId:completion:]( ttsManager,  "enqueueText:identifier:sessionId:completion:",  0LL,  v9,  v10,  v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)siriSessionDidReceiveSetSuggestedUtterancesCommand:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v14);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "updateSuggestedUtterances:forLanguage:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v14 utterances]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 language]);
    [v9 updateSuggestedUtterances:v10 forLanguage:v11];
  }

  if (v6)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 aceId]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v12));
    v6[2](v6, v13);
  }
}

- (void)siriSessionDidReceiveGetResponseAlternativesPlaybackCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "handleGetResponseAlternativesPlayback:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 handleGetResponseAlternativesPlayback:v12];
  }

  if (v6)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 aceId]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v10));
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSAUIShowFullScreenEffectCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "showFullScreenEffect:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 showFullScreenEffect:v12];
  }

  if (v6)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 aceId]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v10));
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSAUIShowSpeechAlternativesCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "showSpeechAlternatives:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 showSpeechAlternatives:v12];
  }

  if (v6)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 aceId]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v10));
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSAUIShowRequestHandlingStatusCommand:(id)a3 completion:(id)a4
{
  id v20 = a3;
  id v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v20);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "showRequestHandlingStatus:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 showRequestHandlingStatus:v20];
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v20 requestHandlingStatus]);

    if (!v10) {
      goto LABEL_13;
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v20 requestHandlingStatus]);
    unsigned __int8 v12 = [v11 isEqualToString:SAUIShowRequestHandlingStatusRequestHandlingStatusASR_NL_ON_SERVERValue];

    if ((v12 & 1) != 0)
    {
      uint64_t v13 = 1LL;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v20 requestHandlingStatus]);
      unsigned __int8 v15 = [v14 isEqualToString:SAUIShowRequestHandlingStatusRequestHandlingStatusASR_ON_DEVICE_NL_ON_SERVERValue];

      if ((v15 & 1) != 0)
      {
        uint64_t v13 = 2LL;
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v20 requestHandlingStatus]);
        unsigned int v17 = [v16 isEqualToString:SAUIShowRequestHandlingStatusRequestHandlingStatusASR_NL_ON_DEVICEValue];

        if (v17) {
          uint64_t v13 = 3LL;
        }
        else {
          uint64_t v13 = 0LL;
        }
      }
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    [v9 setRequestHandlingStatus:v13];
  }

LABEL_13:
  if (v6)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v20 aceId]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v18));
    v6[2](v6, v19);
  }
}

- (void)siriSessionDidReceiveSAUIChangePrimaryUtteranceCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v12);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "changeUtterance:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v9 changeUtterance:v12];
  }

  if (v6)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 aceId]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v10));
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSetUIGuidedAccessCommand:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = (void (**)(id, id))a4;
  else {
    unsigned int v7 = [v17 value] ^ 1;
  }
  if (([v17 dryRun] & 1) != 0 || v7)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    [v12 setErrorCode:SASettingValueUnchangedErrorCode];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Guided Access is already off"));
    [v12 setReason:v13];
  }

  else
  {
    AvailabilitCGFloat y = ((uint64_t (*)(void))AXGuidedAccessGetAvailability)();
    if (!_AXSGuidedAccessEnabled())
    {
      _AXSTripleClickAddOption(7LL);
      uint64_t v9 = _AXSGuidedAccessSetEnabled(1LL);
      AvailabilitCGFloat y = AXGuidedAccessGetAvailability(v9);
    }

    switch(Availability)
    {
      case 0LL:
        -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v17);
        id v12 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v17 aceId]);
        [v12 setRefId:v15];

        if (v6) {
          v6[2](v6, v12);
        }
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_1000BA950));
        [v16 serviceStartGuidedAccess];

        goto LABEL_15;
      case 1LL:
      case 2LL:
      case 4LL:
      case 5LL:
      case 6LL:
      case 12LL:
      case 14LL:
        uint64_t v10 = SASettingGuidedAccessTemporarilyUnavailableErrorCode;
        id v11 = @"Guided Access not available Right Now";
        goto LABEL_12;
      case 3LL:
        uint64_t v10 = SASettingGuidedAccessUnavailableInRestoreOrUpdateErrorCode;
        id v11 = @"Guided Access not available while restoring or updating";
        goto LABEL_12;
      case 7LL:
      case 8LL:
      case 9LL:
      case 10LL:
      case 13LL:
        uint64_t v10 = SASettingGuidedAccessUnavailableForAppErrorCode;
        id v11 = @"Guided Access can not be started over this application";
        goto LABEL_12;
      case 11LL:
        uint64_t v10 = SASettingGuidedAccessPasscodeRequiredErrorCode;
        id v11 = @"Guided Access requires a pin code to be set.";
        goto LABEL_12;
      default:
        uint64_t v10 = -1LL;
        id v11 = @"Guided Access failed for an unknown reason.";
LABEL_12:
        -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v17);
        id v12 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
        [v12 setErrorCode:v10];
        [v12 setReason:v11];
        break;
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 aceId]);
  [v12 setRefId:v14];

  if (v6) {
    v6[2](v6, v12);
  }
LABEL_15:
}

- (void)siriSessionDidReceiveHideSiriOverlayCommand:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, id))a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "dismissRecordingOverlayAndHideSnippets:");

  if ((v8 & 1) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    objc_msgSend(v9, "dismissRecordingOverlayAndHideSnippets:", objc_msgSend(v13, "hideSnippets"));

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    [v10 requestDidPresentViewForUICommand:v13];

    if (v6)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 aceId]);
      [v11 setRefId:v12];

      v6[2](v6, v11);
    }
  }
}

- (void)siriSessionDidReceiveAddContentToViewCommand:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, id))a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v8 = objc_opt_respondsToSelector(v7, "siriDidReceiveAdditionalContent:");

  if ((v8 & 1) != 0)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned int v10 = [v9 siriDidReceiveAdditionalContent:v13];

    if (v10)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    }

    else
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
      objc_msgSend( v11,  "setReason:",  @"The target view could either not be found, was not eligible, or couldn't be delivered the payload");
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 aceId]);
    [v11 setRefId:v12];

    if (v6) {
      v6[2](v6, v11);
    }
  }
}

- (void)siriSessionDidReceiveGuideUpdateCommand:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFUIGuideCacheManager sharedManager](&OBJC_CLASS___AFUIGuideCacheManager, "sharedManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100025CBC;
  v10[3] = &unk_1000BA978;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v7 updateCacheWithGuideUpdate:v8 completion:v10];
}

- (void)siriSessionDidReceiveShowNextCardCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, id))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCardLoadingMonitor sharedInstance](&OBJC_CLASS___SRUIFCardLoadingMonitor, "sharedInstance"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v10 cardSnippet]);
  [v6 broadcastCardSnippet:v7];

  if (v5)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 aceId]);
    [v8 setRefId:v9];

    v5[2](v5, v8);
  }
}

- (void)siriSessionDidReceiveShowNextSnippetCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCardLoadingMonitor sharedInstance](&OBJC_CLASS___SRUIFCardLoadingMonitor, "sharedInstance"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v10 visualResponse]);
  [v6 broadcastVisualResponseSnippet:v7];

  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 aceId]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v8));
    v5[2](v5, v9);
  }
}

- (void)siriSessionDidReceiveUpdateVisualResponseSnippetCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v9 = objc_opt_respondsToSelector(v8, "didReceiveUpdateVisualResponseCommand:");

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    id v11 = [v10 didReceiveUpdateVisualResponseCommand:v6];

    id v12 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 viewId]);
      uint64_t v15 = NSStringFromBOOL(v11);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v21 = 136315650;
      unsigned __int8 v22 = "-[SRSiriViewController siriSessionDidReceiveUpdateVisualResponseSnippetCommand:completion:]";
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s command with viewId: %@ handled by presentation: %@",  (uint8_t *)&v21,  0x20u);
    }

    -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, 0LL);
    if (v7)
    {
      if ((_DWORD)v11)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
        uint64_t v18 = objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v17));
LABEL_11:
        id v20 = (void *)v18;
        v7[2](v7, v18);

        goto LABEL_12;
      }

- (void)siriSessionDidReceivePreSynthesizeTTSCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_10006B314(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000262B4;
  v18[3] = &unk_1000BA9C8;
  objc_copyWeak(&v21, &location);
  id v16 = v6;
  id v19 = v16;
  id v17 = v7;
  id v20 = v17;
  SiriUIInvokeOnMainQueue(v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)siriSessionDidReceiveDisambiguationItemSelected:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AFUIDisambiguationAnalyticsManager sharedManager]( &OBJC_CLASS___AFUIDisambiguationAnalyticsManager,  "sharedManager"));
  [v6 logDisambiguationItemSelected:v9];

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 refId]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v7));
    v5[2](v5, v8);
  }
}

- (void)siriSessionSpeechRecordingDidChangeAVRecordRoute:(id)a3
{
  id v7 = a3;
  -[SRSiriViewController _setCurrentAVRecordRoute:](self, "_setCurrentAVRecordRoute:");
  [UIApp finishedIPTest:SUICPPTTestNameSiriBringupTVSyntheticSpeechCapturedToSpeechRecording];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v5 = objc_opt_respondsToSelector(v4, "speechRecordingDidBeginOnRecordRoute:");

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v6 speechRecordingDidBeginOnRecordRoute:v7];
  }
}

- (void)siriSessionSpeechRecordingDidEnd
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "speechRecordingDidEndForRequest:onAVRecordRoute:");

  if ((v4 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _currentAVRecordRoute](self, "_currentAVRecordRoute"));
    [v7 speechRecordingDidEndForRequest:v5 onAVRecordRoute:v6];
  }

- (void)siriSessionSpeechRecordingDidCancel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "speechRecordingDidCancelForRequest:onAVRecordRoute:");

  if ((v4 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _currentAVRecordRoute](self, "_currentAVRecordRoute"));
    [v7 speechRecordingDidCancelForRequest:v5 onAVRecordRoute:v6];
  }

- (void)siriSessionSpeechRecordingDidFailWithError:(id)a3
{
  id v9 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v5 = objc_opt_respondsToSelector(v4, "speechRecordingDidFailForRequest:onAVRecordRoute:withError:");

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _currentAVRecordRoute](self, "_currentAVRecordRoute"));
    [v6 speechRecordingDidFailForRequest:v7 onAVRecordRoute:v8 withError:v9];
  }
}

- (BOOL)siriSessionShouldRequestUpdateForViewWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  unsigned __int8 v6 = [v5 containsItemForAceViewWithIdentifier:v4];

  return v6;
}

- (void)siriSessionDidDetectMusic
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "siriDidDetectMusic");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 siriDidDetectMusic];
  }

- (void)siriSessionDidDetectSpeechStartpoint
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "speechRecordingDidDetectSpeechStartpoint");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 speechRecordingDidDetectSpeechStartpoint];
  }

- (void)siriSessionDidUpdateAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[SRSiriViewController siriSessionDidUpdateAudioSessionID:]";
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts 4 %u", (uint8_t *)&v10, 0x12u);
  }

  -[SRUIFSpeechSynthesizer setAudioSessionID:](self->_ttsManager, "setAudioSessionID:", v3);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  if ([v7 isAnnounceRequest])
  {

LABEL_6:
LABEL_7:
    -[SRUIFSpeechSynthesizer prewarmIfNeeded](self->_ttsManager, "prewarmIfNeeded");
    return;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  unsigned __int8 v9 = [v8 isForStark];

  if ((v9 & 1) != 0) {
    goto LABEL_7;
  }
}

- (void)siriSessionDidReceiveAudioSessionInterruptionBeganWithUserInfo:(id)a3 machAbsoluteTime:(unint64_t)a4
{
  id v9 = objc_alloc_init(&OBJC_CLASS___SISchemaPNRFatalErrorInfo);
  [v9 setErrorDomain:kAFAssistantErrorDomain];
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", 48LL));
  [v9 setErrorCode:v6];

  id v7 = objc_alloc_init(&OBJC_CLASS___SISchemaPNRFatalError);
  [v7 setError:v9];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v8 emitInstrumentation:v7 atTime:a4];
}

- (void)siriSessionRequestsPlayPhaticWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v11 = "-[SRSiriViewController siriSessionRequestsPlayPhaticWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 5", buf, 0xCu);
  }

  ttsManager = self->_ttsManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100026C7C;
  v8[3] = &unk_1000BA5B0;
  id v9 = v4;
  id v7 = v4;
  -[SRUIFSpeechSynthesizer enqueuePhaticWithCompletion:](ttsManager, "enqueuePhaticWithCompletion:", v8);
}

- (void)siriSessionWillShowAudioRoutePicker
{
}

- (void)siriSessionWillDismissAudioRoutePicker
{
}

- (void)siriSessionDidInitializeSessionInfo:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_siriSessionInfo, a3);
  if ((objc_opt_respondsToSelector(self->_presentation, "siriSessionDidInitializeSessionInfo:") & 1) != 0) {
    -[SiriUIPresentation siriSessionDidInitializeSessionInfo:]( self->_presentation,  "siriSessionDidInitializeSessionInfo:",  v5);
  }
}

- (void)siriSessionDidUpdateSessionInfo:(id)a3
{
  id v4 = a3;
  -[SRUIFSiriSessionInfo applyInfo:](self->_siriSessionInfo, "applyInfo:");
  if ((objc_opt_respondsToSelector(self->_presentation, "siriSessionDidUpdateSessionInfo:") & 1) != 0) {
    -[SiriUIPresentation siriSessionDidUpdateSessionInfo:](self->_presentation, "siriSessionDidUpdateSessionInfo:", v4);
  }
}

- (void)siriSessionDidReceivePlayContentCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector(self->_presentation, "handlePlayContentCommand:completion:") & 1) != 0) {
    -[SiriUIPresentation handlePlayContentCommand:completion:]( self->_presentation,  "handlePlayContentCommand:completion:",  v7,  v6);
  }
}

- (void)siriSessionDidReceiveLaunchTVRemoteCommand:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 hashedRouteId]);
  id v8 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v7,  0LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100026FD8;
  v12[3] = &unk_1000BA9F0;
  id v14 = v5;
  id v15 = v6;
  id v13 = objc_alloc_init(&OBJC_CLASS___AFSecurityConnection);
  id v9 = v5;
  id v10 = v6;
  id v11 = v13;
  [v11 processData:v8 usingProcedure:2 completion:v12];
}

- (void)siriSessionDidReceiveSnippetConfigurationRequestCommand:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v27 = objc_alloc_init(&OBJC_CLASS___SAUISize);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v8, "maxSizeForSnippet") & 1) != 0)
  {
    [v8 maxSizeForSnippet];
    double v10 = v9;
    [v27 setWidth:(uint64_t)v11];
    [v27 setHeight:(uint64_t)v10];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](&OBJC_CLASS___UIWindow, "_applicationKeyWindow"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 windowScene]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 screen]);
    [v14 scale];
    objc_msgSend(v27, "setScale:");
  }

  id v15 = objc_alloc_init(&OBJC_CLASS___SAUISnippetDisplayConfigurationResponse);
  [v15 setEstimatedVisibleSnippetDisplaySize:v27];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);

  [v15 setRefId:v16];
  [v15 setAccessibilityDifferentiateWithoutColor:UIAccessibilityShouldDifferentiateWithoutColor()];
  [v15 setAccessibilityInvertColors:UIAccessibilityIsInvertColorsEnabled()];
  [v15 setAccessibilityReduceMotion:UIAccessibilityIsReduceMotionEnabled()];
  id v17 = [v15 setAccessibilityReduceTransparency:UIAccessibilityIsReduceTransparencyEnabled()];
  int IsRTL = SiriSharedUILanguageIsRTL(v17);
  id v19 = &SAUITextDirectionRightToLeftValue;
  if (!IsRTL) {
    id v19 = &SAUITextDirectionLeftToRightValue;
  }
  [v15 setTextDirection:*v19];
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 traitCollection]);

  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 aceDisplayColorScheme]);
  [v15 setDisplayColorScheme:v22];

  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 aceDisplayColorGamut]);
  [v15 setDisplayGamut:v23];

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 aceDynamicTypeSize]);
  [v15 setDynamicTypeSize:v24];

  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 aceTextLegibilityWeight]);
  [v15 setTextLegibilityWeight:v25];

  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v21 aceDisplayContrast]);
  [v15 setDisplayContrast:v26];

  v6[2](v6, v15);
}

- (void)siriPresentation:(id)a3 requestHostBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v10 requestHostBlurVisible:v7 reason:a5 fence:v9];
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

  if (v8 == v6) {
    -[SRSiriViewController _deletePreviousConversation](self, "_deletePreviousConversation");
  }
  id v9 = objc_alloc_init(&OBJC_CLASS___NSArray);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 insertedItemIndexPaths]);

  if (v10)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v7 insertedItemIndexPaths]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v9, "arrayByAddingObjectsFromArray:", v11));

    id v9 = (NSArray *)v12;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedItemIndexPaths]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedItemIndexPaths]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v9, "arrayByAddingObjectsFromArray:", v14));

    id v9 = (NSArray *)v15;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v16 = v9;
  id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      id v20 = 0LL;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        -[SRSiriViewController _didStartActionForItemAtIndexPath:inConversation:]( self,  "_didStartActionForItemAtIndexPath:inConversation:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v20),  v6,  (void)v25);
        id v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    }

    while (v18);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  -[SRUIFAnalyticsSupplement storeDialogPhasesForItemsAtIndexPaths:forConversation:]( self->_analyticsSupplement,  "storeDialogPhasesForItemsAtIndexPaths:forConversation:",  v16,  v6);
  if (-[SRSiriViewController _presentationSupportsConversationDidChangeWithTransaction:]( self,  "_presentationSupportsConversationDidChangeWithTransaction:",  v21))
  {
    [v21 conversation:v6 didChangeWithTransaction:v7];
  }

  else
  {
    if ((objc_opt_respondsToSelector(v21, "conversation:didUpdateItemsAtIndexPaths:") & 1) != 0)
    {
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v7 updatedItemIndexPaths]);
      if ([v22 count]) {
        [v21 conversation:v6 didUpdateItemsAtIndexPaths:v22];
      }
    }

    if ((objc_opt_respondsToSelector(v21, "conversation:didInsertItemsAtIndexPaths:") & 1) != 0)
    {
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 insertedItemIndexPaths]);
      if ([v23 count]) {
        [v21 conversation:v6 didInsertItemsAtIndexPaths:v23];
      }
    }

    if ((objc_opt_respondsToSelector(v21, "conversation:didChangePresentationStateForItemsAtIndexPaths:") & 1) != 0)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v7 presentationStateChangedItemIndexPaths]);
      if ([v24 count]) {
        [v21 conversation:v6 didChangePresentationStateForItemsAtIndexPaths:v24];
      }
    }
  }
}

- (BOOL)_presentationSupportsConversationDidChangeWithTransaction:(id)a3
{
  return objc_opt_respondsToSelector(a3, "conversation:didChangeWithTransaction:") & 1;
}

- (void)conversation:(id)a3 didRemoveItemsWithIdentifiers:(id)a4 atIndexPaths:(id)a5 parentItemIdentifiers:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

  if (v13 == v15) {
    -[SRSiriViewController _deletePreviousConversation](self, "_deletePreviousConversation");
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector( v14,  "conversation:didRemoveItemsWithIdentifiers:atIndexPaths:parentItemIdentifiers:") & 1) != 0) {
    [v14 conversation:v15 didRemoveItemsWithIdentifiers:v10 atIndexPaths:v11 parentItemIdentifiers:v12];
  }
}

- (void)siriSessionDidReceiveExtendCurrentTTSCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  self->_BOOL delaySessionEndForInPlacePunchout = 1;
  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[SRSiriViewController siriSessionDidReceiveExtendCurrentTTSCommand:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #punchout received request to delay current session end for In Place Punchout",  (uint8_t *)&v11,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v9));
  v7[2](v7, v10);
}

- (void)siriSessionDidReceiveRevealRecognizedSpeechCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v9 = objc_opt_respondsToSelector(v8, "didReceiveRevealRecognizedSpeechCommand:");

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v10 didReceiveRevealRecognizedSpeechCommand:v6];

    -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, 0LL);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v11));
  }

  else
  {
    id v13 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "-[SRSiriViewController siriSessionDidReceiveRevealRecognizedSpeechCommand:completion:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s presentation does not implement didReceiveRevealRecognizedSpeechCommand for command:%@",  (uint8_t *)&v15,  0x16u);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[SACommandFailed sruif_commandFailedWithRefId:]( &OBJC_CLASS___SACommandFailed,  "sruif_commandFailedWithRefId:",  v11));
  }

  id v14 = (void *)v12;
  v7[2](v7, v12);

  -[SRSiriViewController _logRevealSpeechCommandReceived:](self, "_logRevealSpeechCommandReceived:", v6);
}

- (void)siriSessionDidReceivePaginateListCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v9 = objc_opt_respondsToSelector(v8, "didReceivePaginateListCommand:completion:");

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v10 didReceivePaginateListCommand:v6 completion:v7];

    -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, 0LL);
  }

  else
  {
    int v11 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      int v15 = "-[SRSiriViewController siriSessionDidReceivePaginateListCommand:completion:]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s presentation does not implement didReceivePaginateListCommand for command:%@",  (uint8_t *)&v14,  0x16u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandFailed sruif_commandFailedWithRefId:]( &OBJC_CLASS___SACommandFailed,  "sruif_commandFailedWithRefId:",  v12));
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

- (int64_t)siriStateForSiriPresentation:(id)a3
{
  return self->_siriState;
}

- (int64_t)siriPresentationStateForSiriPresentation:(id)a3
{
  return self->_presentationState;
}

- (id)conversationIdentifiersForSiriPresentation:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversations](self, "_conversations", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      char v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "identifier", (void)v12));
        [v4 addObject:v10];

        char v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)siriPresentation:(id)a3 conversationWithIdentifier:(id)a4
{
  return -[SRSiriViewController _conversationWithIdentifier:](self, "_conversationWithIdentifier:", a4);
}

- (void)siriPresentation:(id)a3 deleteConversationWithIdentifier:(id)a4
{
}

- (void)siriPresentation:(id)a3 activateConversationWithIdentifier:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _conversationWithIdentifier:](self, "_conversationWithIdentifier:", a4));
  -[SRSiriViewController _activateConversation:](self, "_activateConversation:", v5);
}

- (id)siriPresentation:(id)a3 identifierOfItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifierOfItemAtIndexPath:v5]);

  return v7;
}

- (id)siriPresentation:(id)a3 indexPathForItemWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexPathForItemWithIdentifier:v5]);

  return v7;
}

- (id)_activeConversationItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  return v6;
}

- (int64_t)siriPresentation:(id)a3 typeOfItemAtIndexPath:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _activeConversationItemAtIndexPath:]( self,  "_activeConversationItemAtIndexPath:",  a4));
  id v5 = (char *)[v4 type];

  else {
    return (int64_t)v5;
  }
}

- (int64_t)siriPresentation:(id)a3 numberOfChildrenForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v7 = [v6 numberOfChildrenForItemAtIndexPath:v5];

  return (int64_t)v7;
}

- (id)siriPresentation:(id)a3 aceObjectForItemAtIndexPath:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _activeConversationItemAtIndexPath:]( self,  "_activeConversationItemAtIndexPath:",  a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceObject]);

  return v5;
}

- (id)siriPresentation:(id)a3 aceCommandIdentifierForItemAtIndexPath:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _activeConversationItemAtIndexPath:]( self,  "_activeConversationItemAtIndexPath:",  a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceCommandIdentifier]);

  return v5;
}

- (id)siriPresentation:(id)a3 dialogPhaseForItemAtIndexPath:(id)a4
{
  return -[SRSiriViewController _dialogPhaseForItemAtIndexPath:](self, "_dialogPhaseForItemAtIndexPath:", a4);
}

- (void)siriPresentation:(id)a3 insertAceViews:(id)a4 withDialogPhase:(id)a5 asItemsAtIndexPaths:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v12 insertItemsForAceViews:v11 withDialogPhase:v10 atIndexPaths:v9];
}

- (void)siriPresentation:(id)a3 removeItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v6 removeItemsAtIndexPaths:v5];
}

- (void)siriPresentation:(id)a3 addSelectionResponse:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v6 addSelectionResponse:v5];
}

- (id)siriPresentation:(id)a3 domainObjectForIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController domainObjectStoreForSiriPresentation:]( self,  "domainObjectStoreForSiriPresentation:",  a3));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 domainObjectForIdentifier:v6]);

  return v8;
}

- (void)siriPresentation:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[SRSiriViewController domainObjectStoreForSiriPresentation:]( self,  "domainObjectStoreForSiriPresentation:",  a3));
  [v10 setDomainObject:v9 forIdentifier:v8];
}

- (BOOL)siriPresentation:(id)a3 itemAtIndexPathIsVirgin:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _activeConversationItemAtIndexPath:]( self,  "_activeConversationItemAtIndexPath:",  a4));
  unsigned __int8 v5 = [v4 isVirgin];

  return v5;
}

- (id)sessionInfoForSiriPresentation:(id)a3
{
  return self->_siriSessionInfo;
}

- (double)contentWidthForForSiriPresentation:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view", a3));
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v23.origin.CGFloat x = v6;
  v23.origin.CGFloat y = v8;
  v23.size.CGFloat width = v10;
  v23.size.CGFloat height = v12;
  double Width = CGRectGetWidth(v23);
  __n128 v15 = objc_opt_class(self, v14);
  id v17 = v16;
  uint64_t IsPhone = SiriUIDeviceIsPhone(v15);
  uint64_t IsZoomed = SiriUIDeviceIsZoomed(IsPhone, v19);
  uint64_t IsLargeFormatPad = SiriUIDeviceIsLargeFormatPad();
  _[v17 _contentWidthForWidth:IsPhone isPhone:IsZoomed isZoomed:IsLargeFormatPad isLargeFormatPad:Width];
  return result;
}

+ (double)_contentWidthForWidth:(double)result isPhone:(BOOL)a4 isZoomed:(BOOL)a5 isLargeFormatPad:(BOOL)a6
{
  if (a4)
  {
    CGFloat v6 = (double *)&SiriUIPhoneMaxContentWidth;
  }

  else
  {
    if (a6) {
      return SiriUILargeFormatPadContentWidth;
    }
    CGFloat v6 = (double *)&SiriUIPadZoomedMaxContentWidth;
    if (!a5) {
      CGFloat v6 = (double *)&SiriUIPadMaxContentWidth;
    }
  }

  if (*v6 <= result) {
    return *v6;
  }
  return result;
}

- (BOOL)textInputEnabled
{
  if ((objc_opt_respondsToSelector(self->_presentation, "supportsTextInput") & 1) == 0
    || !-[SASRequestOptions isTypeToSiriRequest](self->_requestOptions, "isTypeToSiriRequest"))
  {
    return 0;
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  unsigned __int8 v4 = [v3 supportsTextInput];

  return v4;
}

- (CGRect)statusBarFrameForSiriPresentation:(id)a3
{
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (double)statusViewHeightForSiriPresentation:(id)a3
{
  if (-[SRSiriViewController textInputEnabled](self, "textInputEnabled", a3)
    && (!self->_requestActive || -[SASRequestOptions inputType](self->_requestOptions, "inputType") != (id)2))
  {
    return 0.0;
  }

  -[SRSiriViewController _statusViewHeight](self, "_statusViewHeight");
  return result;
}

- ($C83F3EDC964651441187CDEAB72D1F66)keyboardInfoForSiriPresentation:(SEL)a3
{
  CGSize size = self[2].var3.size;
  *(CGPoint *)&retstr->var0 = self[2].var3.origin;
  *(CGSize *)&retstr->var3.origin.CGFloat y = size;
  *(_OWORD *)&retstr->var3.size.CGFloat height = *(_OWORD *)&self[2].var4;
  return self;
}

- (id)activeRequestOptionsForSiriPresentation:(id)a3
{
  if (!-[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet", a3)
    || (-[SASRequestOptions isTypeToSiriRequest](self->_requestOptions, "isTypeToSiriRequest") & 1) != 0
    || -[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)53)
  {
    id v4 = -[SASRequestOptions copy](self->_requestOptions, "copy");
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void)siriPresentation:(id)a3 startRequestWithOptions:(id)a4
{
}

- (void)siriPresentation:(id)a3 startRequestForText:(id)a4
{
  id v5 = a4;
  if ([v5 length]) {
    -[SRSiriViewController startRequestForText:](self, "startRequestForText:", v5);
  }
}

- (void)siriPresentation:(id)a3 startRequestForSuggestion:(id)a4 inputType:(int64_t)a5
{
  id v7 = a4;
  if ([v7 length]) {
    -[SRSiriViewController startRequestForSuggestion:inputType:](self, "startRequestForSuggestion:inputType:", v7, a5);
  }
}

- (void)siriPresentationKeyboardViewDidAppear:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  char v5 = objc_opt_respondsToSelector(v4, "presentationDidPresentKeyboard");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    [v6 presentationDidPresentKeyboard];
  }

- (void)stopRecordingSpeechForSiriPresentation:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  [v3 stopRecordingSpeech];
}

- (void)cancelRequestForSiriPresentation:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  [v3 cancelSpeechRequest];
}

- (void)siriResultsDidDismissInTamaleForSiriPresentation:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_1000BAA10));
  [v3 siriResultsDidDismissInTamale];
}

- (void)forceAudioSessionInactiveForSiriPresentation:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  [v3 forceAudioSessionInactive];
}

- (void)dismissSiriPresentation:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    CGFloat v10 = "-[SRSiriViewController dismissSiriPresentation:withReason:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #idleTimer cancelling idle timer",  (uint8_t *)&v9,  0xCu);
  }

  if (-[SRSiriViewController _isReadingBulletinContentInCarPlayOutsideOfSiriSession]( self,  "_isReadingBulletinContentInCarPlayOutsideOfSiriSession"))
  {
    CGFloat v8 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      CGFloat v10 = "-[SRSiriViewController dismissSiriPresentation:withReason:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #cmas #carPlay received a dismissal request while we are reading bulletin content outside of a Siri session. Cancelling speech synthesis.",  (uint8_t *)&v9,  0xCu);
    }

    -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  }

  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 0LL);
  -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
  -[SRSiriViewController _dismissWithReason:](self, "_dismissWithReason:", a4);
}

- (void)siriWillStopAttending:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SRSiriViewController siriWillStopAttending:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #autodismiss telling session to stop attending for attention loss",  (uint8_t *)&v6,  0xCu);
  }

  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v5 stopAttending];
}

- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifier:(id)a4 delayed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  -[SRSiriViewController _setStartRequestAceCommandSent:](self, "_setStartRequestAceCommandSent:", 0LL);
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  if ([v10 containsItemWithIdentifier:v9])
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 itemWithIdentifier:v9]);
    CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue([v11 aceCommandIdentifier]);
    if (v12)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v12));
      if (v13)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
        id v15 = [v14 resultForAceCommand:v13];

        if (v15 != (id)2)
        {
          id v16 = [v11 type];
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 aceObject]);
          *(void *)&double v19 = objc_opt_class(self, v18).n128_u64[0];
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_speechIdentifierForConversationItem:", v11, v19));
          char v58 = v17;
          BOOL v50 = v5;
          uint64_t v55 = v13;
          if (v16 != (id)3)
          {
            id v54 = 0LL;
            __int128 v28 = 0LL;
            id v56 = 0LL;
            uint64_t v22 = 0LL;
            unsigned __int8 v49 = 1;
LABEL_25:
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472LL;
            v63[2] = sub_100028E70;
            v63[3] = &unk_1000BA000;
            id v64 = v8;
            id v65 = v10;
            id v66 = v9;
            id v33 = v11;
            id v67 = v33;
            v60 = (void *)v22;
            v62 = v28;
            id v48 = objc_retainBlock(v63);
            id v53 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:]( self,  "_configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPre paration:speakCompletion:",  v55,  v22,  v28));
            id v34 = 0LL;
            id v52 = 0LL;
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 dialogPhase]);
            unsigned int v46 = [v35 isExpository];

            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v33 dialogPhase]);
            uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 aceDialogPhaseValue]);

            id v47 = (void *)v37;
            if (v37)
            {
              v68 = @"dialogPhase";
              uint64_t v69 = v37;
              id v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
            }

            else
            {
              id v51 = 0LL;
            }

            objc_opt_class(&OBJC_CLASS___SAAceView, v38);
            if ((objc_opt_isKindOfClass(v58, v39) & 1) != 0)
            {
              __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v33 aceObject]);
              id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 preferredSpeakableTextVoice]);
            }

            else
            {
              id v41 = 0LL;
            }

            LOBYTE(v45) = v49;
            uint64_t v42 = v60;
            -[SRSiriViewController _speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:]( self,  "_speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS :speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:",  v62,  v57,  v56,  v41,  v46,  v50,  0.4,  v45,  v53,  v51,  v54,  v34,  v52);
            if (v62)
            {
              id v43 = (void *)objc_claimAutoreleasedReturnValue([v33 aceObject]);
              id v44 = (void *)objc_claimAutoreleasedReturnValue([v33 dialogPhase]);
              -[SRSiriViewController _logAceObjectSpoken:dialogPhase:speakableText:]( self,  "_logAceObjectSpoken:dialogPhase:speakableText:",  v43,  v44,  v62);

              uint64_t v42 = v60;
            }

            __int128 v13 = v55;
            goto LABEL_34;
          }

          id v21 = v17;
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 context]);
          id v56 = (void *)objc_claimAutoreleasedReturnValue([v21 refId]);
          unsigned __int8 v49 = [v21 canUseServerTTS];
          objc_opt_class(&OBJC_CLASS___SAUIDisambiguationList, v23);
          if ((objc_opt_isKindOfClass(v21, v24) & 1) != 0) {
            uint64_t v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sruif_combinedSpeakableText"));
          }
          else {
            uint64_t v25 = objc_claimAutoreleasedReturnValue([v21 speakableText]);
          }
          id v61 = (void *)v25;
          if ((AFDeviceSupportsTTS(v25) & 1) != 0)
          {
            if (!v61)
            {
              id v61 = 0LL;
              goto LABEL_24;
            }

            uint64_t v59 = v22;
            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
            char v30 = objc_opt_respondsToSelector(v29, "updateFeedbackFormWithSpeakableText:");

            if ((v30 & 1) != 0)
            {
              id v31 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
              [v31 updateFeedbackFormWithSpeakableText:v61];
            }
          }

          else
          {
            uint64_t v59 = v22;
            id v32 = (os_log_s *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 136315138;
              v71 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s #tts Device does not support tts, overriding speakable text since tts is not supported",  buf,  0xCu);
            }

            id v61 = 0LL;
          }

          uint64_t v22 = v59;
LABEL_24:
          id v54 = (void *)objc_claimAutoreleasedReturnValue([v21 speakableContextInfo]);

          __int128 v28 = v61;
          goto LABEL_25;
        }
      }
    }

    else
    {
      __int128 v27 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        v71 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
        __int16 v72 = 2112;
        id v73 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s Not speaking conversation item:%@. Item missing aceCommandIdentifier.",  buf,  0x16u);
      }

      if ((objc_opt_respondsToSelector(v8, "siriDidFinishActionsForConversationItemWithIdentifier:inConversation:") & 1) == 0) {
        goto LABEL_35;
      }
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      [v8 siriDidFinishActionsForConversationItemWithIdentifier:v13 inConversation:v10];
    }

- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifierDidBecomeReady:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 itemWithIdentifier:v5]);

  *(void *)&double v8 = objc_opt_class(self, v7).n128_u64[0];
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_speechIdentifierForConversationItem:", v11, v8));
  -[SRUIFSpeechSynthesizer processDelayedItem:](self->_ttsManager, "processDelayedItem:", v10);
}

- (void)siriPresentationDidPresentUserInterface:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 serviceDidPresentUserInterface];
}

- (void)siriPresentation:(id)a3 didPresentConversationItemsWithIdentifiers:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v33;
    *(void *)&__int128 v8 = 136315394LL;
    __int128 v29 = v8;
    uint64_t v30 = *(void *)v33;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v11);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", v29));
        unsigned int v14 = [v13 containsItemWithIdentifier:v12];

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 itemWithIdentifier:v12]);

          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 revisionIdentifier]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _presentedConversationItemRevisionIdentifiers]( self,  "_presentedConversationItemRevisionIdentifiers"));
          unsigned int v19 = [v18 containsObject:v17];

          if (v19)
          {
            id v20 = (os_log_s *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = v29;
              uint64_t v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
              __int16 v38 = 2112;
              uint64_t v39 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Ignoring conversation item because we have already presented it { item: %@ }",  buf,  0x16u);
            }
          }

          else
          {
            id v21 = v6;
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _delayedConversationItemRevisionIdentifiers]( self,  "_delayedConversationItemRevisionIdentifiers"));
            unsigned int v23 = [v22 containsObject:v17];

            uint64_t v24 = (os_log_s *)AFSiriLogContextConnection;
            BOOL v25 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
            if (v23)
            {
              if (v25)
              {
                *(_DWORD *)__int128 buf = v29;
                uint64_t v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
                __int16 v38 = 2112;
                uint64_t v39 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Delayed conversation item was presented; processing { item: %@ }",
                  buf,
                  0x16u);
              }

              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _delayedConversationItemRevisionIdentifiers]( self,  "_delayedConversationItemRevisionIdentifiers"));
              [v26 removeObject:v17];

              -[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifierDidBecomeReady:]( self,  "_siriPresentation:speakTextForConversationItemIdentifierDidBecomeReady:",  v31,  v12);
              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _presentedConversationItemRevisionIdentifiers]( self,  "_presentedConversationItemRevisionIdentifiers"));
              [v27 addObject:v17];
            }

            else
            {
              if (v25)
              {
                *(_DWORD *)__int128 buf = v29;
                uint64_t v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
                __int16 v38 = 2112;
                uint64_t v39 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Conversation item was presented for the first time; processing { item: %@ }",
                  buf,
                  0x16u);
              }

              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _presentedConversationItemRevisionIdentifiers]( self,  "_presentedConversationItemRevisionIdentifiers"));
              [v28 addObject:v17];

              -[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]( self,  "_siriPresentation:speakTextForConversationItemIdentifier:delayed:",  v31,  v12,  0LL);
            }

            id v6 = v21;
            uint64_t v10 = v30;
          }
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v9);
  }
}

- (void)siriPresentation:(id)a3 didPresentItemsAtIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      unsigned int v14 = 0LL;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "identifierOfItemAtIndexPath:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)v14),  (void)v16));
        [v9 addObject:v15];

        unsigned int v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v12);
  }

  -[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]( self,  "siriPresentation:didPresentConversationItemsWithIdentifiers:",  v6,  v9);
}

- (void)siriPresentation:(id)a3 willDiscardConversationItemsWithIdentifiers:(id)a4
{
  id v5 = a4;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&__int128 v7 = 136315394LL;
    __int128 v19 = v7;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", v19));
        unsigned int v13 = [v12 containsItemWithIdentifier:v11];

        if (v13)
        {
          unsigned int v14 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = v19;
            BOOL v25 = "-[SRSiriViewController siriPresentation:willDiscardConversationItemsWithIdentifiers:]";
            __int16 v26 = 2112;
            uint64_t v27 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Discarded conversation item with identifier %@",  buf,  0x16u);
          }

          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 itemWithIdentifier:v11]);

          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 aceCommandIdentifier]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandWithIdentifier:](self, "_aceCommandWithIdentifier:", v17));
          -[SRSiriViewController _didCompleteActionForAceCommand:success:]( self,  "_didCompleteActionForAceCommand:success:",  v18,  1LL);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v8);
  }
}

- (void)siriPresentation:(id)a3 didDelayPresentationOfItemsWithIdentifiers:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&__int128 v8 = 136315394LL;
    __int128 v22 = v8;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v11);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", v22));
        unsigned int v14 = [v13 containsItemWithIdentifier:v12];

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 itemWithIdentifier:v12]);

          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 revisionIdentifier]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _delayedConversationItemRevisionIdentifiers]( self,  "_delayedConversationItemRevisionIdentifiers"));
          unsigned __int8 v19 = [v18 containsObject:v17];

          if ((v19 & 1) == 0)
          {
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _delayedConversationItemRevisionIdentifiers]( self,  "_delayedConversationItemRevisionIdentifiers"));
            [v20 addObject:v17];

            __int128 v21 = (os_log_s *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = v22;
              __int128 v29 = "-[SRSiriViewController siriPresentation:didDelayPresentationOfItemsWithIdentifiers:]";
              __int16 v30 = 2112;
              id v31 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Processed but delaying presentation for conversation item with identifier %@",  buf,  0x16u);
            }

            -[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]( self,  "_siriPresentation:speakTextForConversationItemIdentifier:delayed:",  v23,  v12,  1LL);
          }
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v9);
  }
}

- (unint64_t)siriDeviceLockStateForSiriPresentation:(id)a3
{
  return self->_lockState;
}

- (void)siriPresentation:(id)a3 synthesizeSpeechWithText:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002996C;
  v8[3] = &unk_1000BA5B0;
  id v9 = a5;
  id v7 = v9;
  -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  a4,  0LL,  0LL,  v8);
}

- (void)siriPresentation:(id)a3 synthesizeSpeechWithPhoneticText:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100029A10;
  v8[3] = &unk_1000BA5B0;
  id v9 = a5;
  id v7 = v9;
  -[SRSiriViewController _synthesizePhoneticText:identifier:sessionId:completion:]( self,  "_synthesizePhoneticText:identifier:sessionId:completion:",  a4,  0LL,  0LL,  v8);
}

- (int64_t)siriPresentation:(id)a3 presentationStateForItemAtIndexPath:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _activeConversationItemAtIndexPath:]( self,  "_activeConversationItemAtIndexPath:",  a4));
  id v5 = [v4 presentationState];

  return (int64_t)v5;
}

- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forConversationItemWithIdentifier:(id)a6 userSelectionResults:(id)a7
{
  id v25 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  uint64_t v15 = mach_absolute_time();
  if ([v14 containsItemWithIdentifier:v12])
  {
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 itemWithIdentifier:v12]);
    if ([v16 type] == (id)1)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 aceObject]);
      objc_msgSend(v17, "sruif_setRecognitionWithCorrectedSpeech:", v25);
    }

    double v18 = (double)v15;
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 indexPathForItemWithIdentifier:v12]);
    [v14 removeItemsFollowingItemAtIndexPath:v19];

    if ((char *)-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") - 23 <= (char *)2)
    {
      -[SASRequestOptions setText:](self->_requestOptions, "setText:", 0LL);
      requestText = self->_requestText;
      self->_requestText = (NSString *)&stru_1000BC638;
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 currentInstrumentationTurnContext]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 turnIdentifier]);

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
    [v24 startCorrectedRequestWithText:v25 correctionIdentifier:v11 userSelectionResults:v13 turnIdentifier:v23 machAbsoluteTime:v18];
  }
}

- (void)siriPresentation:(id)a3 startEditedRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 currentInstrumentationTurnContext]);
  id v16 = (id)objc_claimAutoreleasedReturnValue([v13 turnIdentifier]);

  double v14 = (double)mach_absolute_time();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v15 startCorrectedRequestWithText:v11 correctionIdentifier:v10 userSelectionResults:v9 turnIdentifier:v16 machAbsoluteTime:v14];
}

- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forItemAtIndexPath:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v15 = (id)objc_claimAutoreleasedReturnValue([v14 identifierOfItemAtIndexPath:v10]);

  -[SRSiriViewController siriPresentation:didCorrectRecognition:correctionIdentifier:forConversationItemWithIdentifier:userSelectionResults:]( self,  "siriPresentation:didCorrectRecognition:correctionIdentifier:forConversationItemWithIdentifier:userSelectionResults:",  v13,  v12,  v11,  v15,  0LL);
}

- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 completion:(id)a6
{
}

- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 turnIdentifier:(id)a6 completion:(id)a7
{
}

- (void)_performAceCommand:(id)a3 conversationIdentifier:(id)a4 turnIdentifier:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  NSExceptionName v11 = (NSExceptionName)a5;
  id v12 = a6;
  id v13 = objc_msgSend(v14, "sruif_aceCommandType");
  if (v13 == (id)1) {
    goto LABEL_5;
  }
  if (v13 == (id)2)
  {
    -[SRSiriViewController _performAppPunchOutCommand:conversationItemIdentifier:completion:]( self,  "_performAppPunchOutCommand:conversationItemIdentifier:completion:",  v14,  v10,  v12);
    goto LABEL_7;
  }

  if (!v13)
  {
    NSExceptionName v11 = NSInvalidArgumentException;
    self = (SRSiriViewController *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot perform non-command: %@",  v14));
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  self,  0LL));

    objc_exception_throw(v10);
LABEL_5:
    -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:]( self,  "_performGenericAceCommand:turnIdentifier:completion:",  v14,  v11,  v12);
  }

- (void)siriPresentation:(id)a3 openURL:(id)a4 conversationId:(id)a5 completion:(id)a6
{
}

- (id)effectiveCoreLocationBundleForSiriPresentation:(id)a3
{
  return +[AFUISiriSession effectiveCoreLocationBundle]( &OBJC_CLASS___AFUISiriSession,  "effectiveCoreLocationBundle",  a3);
}

- (void)enableIdleTimerForSiriPresentation:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSiriViewController enableIdleTimerForSiriPresentation:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Enabling idle timer at the presentation's request",  (uint8_t *)&v5,  0xCu);
  }

  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 1LL);
  -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
}

- (void)disableIdleTimerForSiriPresentation:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSiriViewController disableIdleTimerForSiriPresentation:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Disabling idle timer at the presentation's request",  (uint8_t *)&v5,  0xCu);
  }

  -[SRSiriViewController _setIdleTimerEnabled:](self, "_setIdleTimerEnabled:", 0LL);
  -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
}

- (void)siriPresentation:(id)a3 setStatusViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 setStatusViewHidden:v4];
}

- (void)siriPresentation:(id)a3 setTypeToSiriViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  char v7 = objc_opt_respondsToSelector(v6, "setTypeToSiriViewHidden:");

  if ((v7 & 1) != 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    [v8 setTypeToSiriViewHidden:v4];
  }

- (void)siriPresentation:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if ((SiriUIDeviceIsPad(self, a2, a3) & 1) == 0
    && +[AFSystemAssistantExperienceStatusManager isSAEEnabled]( &OBJC_CLASS___AFSystemAssistantExperienceStatusManager,  "isSAEEnabled"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
    [v9 setHitTestsAsOpaque:v6];
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v10 setFullScreenDimmingLayerVisible:v6 animated:v5];
}

- (void)siriPresentation:(id)a3 inputTypeDidChange:(int64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 inputTypeDidChange:a4];
}

- (void)siriPresentation:(id)a3 setStatusViewDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 setStatusViewDisabled:v4];
}

- (void)siriPresentation:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 setStatusViewUserInteractionEnabled:v4];
}

- (void)siriPresentation:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceWillPresentViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 didPresentViewController:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceDidPresentViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 willDismissViewController:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceWillDismissViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 didDismissViewController:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceDidDismissViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4
{
}

- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v7 setStatusBarHidden:v6 animated:v5];
}

- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002A4EC;
  v12[3] = &unk_1000BAA38;
  id v13 = v9;
  id v11 = v9;
  [v10 setStatusBarHidden:v7 animated:v6 completion:v12];
}

- (void)siriPresentation:(id)a3 setHelpButtonEmphasized:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 setHelpButtonEmphasized:v4];
}

- (void)siriPresentationPulseHelpButton:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 pulseHelpButton];
}

- (BOOL)siriPresentationShouldDelaySuggestions:(id)a3
{
  if (!-[SRSiriViewController textInputEnabled](self, "textInputEnabled", a3)
    || (id v4 = -[SASRequestOptions requestSource](self->_requestOptions, "requestSource"), v4 != (id)1))
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (void)siriPresentation:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 setBugReportingAvailable:v4];
}

- (void)siriPresentationDidPresentBugReporter:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  char v5 = objc_opt_respondsToSelector(v4, "serviceDidPresentBugReporter");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    [v6 serviceDidPresentBugReporter];
  }

- (void)siriPresentationDidDismissBugReporter:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  char v5 = objc_opt_respondsToSelector(v4, "serviceDidDismissBugReporter");

  if ((v5 & 1) != 0)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    [v6 serviceDidDismissBugReporter];
  }

- (void)getScreenshotImageForSiriPresentation:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002A76C;
    v7[3] = &unk_1000BAA60;
    id v8 = v5;
    [v6 getScreenshotWithReplyHandler:v7];
  }
}

- (void)siriPresentationPresentAcousticIDSpinner:(id)a3
{
  id v7 = objc_alloc_init(&OBJC_CLASS___SAAIStartSession);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  [v7 setAceId:v5];

  -[SRSiriViewController _didReceiveAceCommand:](self, "_didReceiveAceCommand:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v6 addItemForMusicStartSessionCommand:v7];
}

- (void)siriPresentationRemoveAcousticIDSpinner:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation", a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 lastItem]);

  if ([v8 type] == (id)5)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
    [v7 removeItemsWithIdentifiers:v6];
  }
}

- (void)siriPresentation:(id)a3 didEditSpeechRecognized:(id)a4 forInterval:(double)a5
{
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___AFMetrics);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 refId]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
  id v12 = [v8 initWithOriginalCommandId:v9 category:4 duration:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v11 recordUIMetrics:v12];
}

- (void)siriPresentation:(id)a3 didScrollForInterval:(double)a4 metricsContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _punchoutMetricsAceCommandIdForItemWithIdentifier:]( self,  "_punchoutMetricsAceCommandIdForItemWithIdentifier:",  v11));

      id v9 = (id)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _metricsContextForItemWithAceCommandId:]( self,  "_metricsContextForItemWithAceCommandId:",  v12));
    }
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%.02f", *(void *)&a4));
  id v14 = (void *)v13;
  if (v9)
  {
    v22[0] = @"metricsContext";
    v22[1] = @"duration";
    v23[0] = v9;
    v23[1] = v13;
    id v15 = v23;
    id v16 = (const __CFString **)v22;
    uint64_t v17 = 2LL;
  }

  else
  {
    __int128 v20 = @"duration";
    uint64_t v21 = v13;
    id v15 = &v21;
    id v16 = &v20;
    uint64_t v17 = 1LL;
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v16,  v17));
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v19 logEventWithType:1432 context:v18];
}

- (void)siriPresentation:(id)a3 didShowAceViewWithIdentifier:(id)a4 aceViewClass:(Class)a5 metricsContext:(id)a6 forInterval:(double)a7
{
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  unsigned int v14 = [v13 containsItemWithIdentifier:v11];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 itemWithIdentifier:v11]);

    objc_initWeak(&location, self);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    double v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10002ACB8;
    v20[3] = &unk_1000BAAB0;
    v23[1] = a5;
    id v21 = v12;
    id v22 = v16;
    void v23[2] = *(id *)&a7;
    id v19 = v16;
    objc_copyWeak(v23, &location);
    dispatch_async(v18, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
}

- (void)siriPresentation:(id)a3 didShowTipWithIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 flowID:(id)a7
{
  id v20 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = a4;
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  unsigned int v15 = [v14 containsItemWithIdentifier:v13];

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKKnowledgeStore defaultSynchedKnowledgeStore]( &OBJC_CLASS___CKKnowledgeStore,  "defaultSynchedKnowledgeStore"));
    id v17 = [[CKPermanentEventStore alloc] initWithKnowledgeStore:v16];
    double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  v12,  @"TipOnScreen"));
    id v19 = [[CKEvent alloc] initWithIdentifier:v18 startDate:v20 endDate:v11 metadata:0];
    [v17 recordEvent:v19 completionHandler:&stru_1000BAAD0];
  }
}

- (void)siriPresentation:(id)a3 didShowGuideStartTime:(id)a4 endTime:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[CKKnowledgeStore defaultSynchedKnowledgeStore]( &OBJC_CLASS___CKKnowledgeStore,  "defaultSynchedKnowledgeStore"));
  id v8 = [[CKPermanentEventStore alloc] initWithKnowledgeStore:v10];
  id v9 = [[CKEvent alloc] initWithIdentifier:@"SiriGuideShown" startDate:v7 endDate:v6 metadata:0];

  [v8 recordEvent:v9 completionHandler:&stru_1000BAAF0];
}

- (void)handlePasscodeUnlockForSiriPresentation:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v6 handlePasscodeUnlockWithCompletion:v5];
}

- (void)siriPresentationMicButtonWasTapped:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 serviceDidDetectMicButtonTap];
}

- (void)siriPresentationMicButtonLongPressBegan:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 serviceDidDetectMicButtonLongPressBegan];
}

- (void)siriPresentationMicButtonLongPressEnded:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 serviceDidDetectMicButtonLongPressEnded];
}

- (void)siriPresentation:(id)a3 didChangePeekMode:(unint64_t)a4
{
  if (a4 - 1 >= 3) {
    unint64_t v4 = 0LL;
  }
  else {
    unint64_t v4 = a4;
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 servicePresentationDidChangePeekMode:v4];
}

- (void)siriPresentation:(id)a3 didChangeVisualState:(unint64_t)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 servicePresentationDidChangeVisualState:a4];
}

- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v5 serviceViewControllerWillChangeKeyboardVisibility:v4];
}

- (void)siriPresentation:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4
{
  self->_preventOutsideTouchesFromDismissingSiri = a4;
}

- (void)siriPresentation:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v6 serviceViewControllerRequestsKeyboardWithCompletion:v5];
}

- (void)siriPresentation:(id)a3 willBeginEditingOfType:(int64_t)a4
{
  if (a4 == 1) {
    -[SRSiriViewController _setUserUtteranceTapToEditInProgress:](self, "_setUserUtteranceTapToEditInProgress:", 1LL);
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v5 serviceWillBeginEditing];
}

- (void)siriPresentationDidEndEditing:(id)a3
{
}

- (void)siriPresentationDidResignFirstResponder:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 serviceDidEndEditing];
}

- (void)siriPresentationRequestsHIDEventDefferal:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 serviceRequestsHIDEventDefferal];
}

- (void)siriPresentationCancelHIDEventDefferal:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host", a3));
  [v3 serviceCancelHIDEventDefferal];
}

- (void)siriPresentation:(id)a3 requestsTouchPassThroughEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"Disabling";
    if (v4) {
      id v7 = @"Enabling";
    }
    int v10 = 136315394;
    id v11 = "-[SRSiriViewController siriPresentation:requestsTouchPassThroughEnabled:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s %@ touch pass through on SRSiriViewController",  (uint8_t *)&v10,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController view](self, "view"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
  [v9 setHitTestsAsOpaque:!v4];
}

- (void)siriPresentation:(id)a3 didPresentIntentWithBundleId:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v6 servicePresentedIntentWithBundleId:v5];
}

- (void)siriPresentationClearContext:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session", a3));
  [v3 clearContext];
}

- (id)siriPresentation:(id)a3 additionalSpeechInterpretationsForRefId:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 additionalSpeechInterpretationsForRefId:v5]);

  return v7;
}

- (id)siriPresentation:(id)a3 updatedUserUtteranceForRefId:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 updatedUserUtteranceForRefId:v5]);

  return v7;
}

- (void)siriPresentationDidPresentConversationFromBreadcrumb:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v4 serviceDidPresentConversationFromBreadcrumb];
}

- (BOOL)inTextInputModeForSiriPresentation:(id)a3
{
  BOOL v4 = -[SRSiriViewController textInputEnabled](self, "textInputEnabled", a3);
  if (v4) {
    LOBYTE(v4) = !self->_requestActive
  }
              || -[SASRequestOptions requestSource](self->_requestOptions, "requestSource") != (id)8
              && (!SiriUIIsHTTForTextInputEnabled()
               || -[SASRequestOptions inputType](self->_requestOptions, "inputType") != (id)2)
              || self->_keyboardInfo.keyboardHeight > 0.0;
  return v4;
}

- (void)siriPresentationDidHideUnlockScreen:(id)a3
{
}

- (void)siriPresentationDidHideKeyboard:(id)a3
{
}

- (void)siriPresentationWillSendStartRequest:(id)a3
{
}

- (void)siriPresentationRequestsStartAttendingForNonSpeechRequest:(id)a3 deviceID:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v6 startAttendingWithDeviceID:v5];
}

- (id)localeForSiriPresentation:(id)a3
{
  BOOL v4 = objc_alloc(&OBJC_CLASS___NSLocale);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 spokenLanguageCode]);
  id v7 = -[NSLocale initWithLocaleIdentifier:](v4, "initWithLocaleIdentifier:", v6);

  return v7;
}

- (void)siriPresentationDidRequestRestartSpeechSynthesis:(id)a3
{
  if (self->_previousSayItCommand) {
    -[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]( self,  "siriSessionDidReceiveSayItCommand:completion:");
  }
}

- (void)siriPresentationDidPresentDynamicSnippetWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v5 siriUIDidPresentDynamicSnippetWithInfo:v4];
}

- (void)userTouchedSnippet
{
}

- (void)siriPresentation:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[SRSiriViewController siriPresentation:handleStartLocalRequest:turnIdentifier:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Handling startLocalRequest : %@",  (uint8_t *)&v12,  0x16u);
  }

  double v10 = (double)mach_absolute_time();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v11 performAceCommand:v7 turnIdentifier:v8 machAbsoluteTime:v10];
}

- (void)_emitRenderingStarted
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUIRenderingStarted);
  [v3 setExists:1];
  id v4 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUIRenderingContext);
  [v4 setStartedOrChanged:v3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v5 emitInstrumentation:v4];

  self->_os_signpost_id_t uiRenderSignpost = os_signpost_id_generate(AFSiriLogContextPerformance);
  id v6 = (os_log_s *)AFSiriLogContextPerformance;
  id v7 = v6;
  os_signpost_id_t uiRenderSignpost = self->_uiRenderSignpost;
  if (uiRenderSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v9 = 136315394;
    double v10 = "SiriX";
    __int16 v11 = 2080;
    int v12 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  uiRenderSignpost,  "UIRenderTime",  "%s %s",  (uint8_t *)&v9,  0x16u);
  }
}

- (void)_emitRenderingEnded
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUIRenderingEnded);
  [v3 setExists:1];
  id v4 = objc_alloc_init(&OBJC_CLASS___SISchemaUEIUIRenderingContext);
  [v4 setEnded:v3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v5 emitInstrumentation:v4];

  id v6 = (os_log_s *)AFSiriLogContextPerformance;
  id v7 = v6;
  os_signpost_id_t uiRenderSignpost = self->_uiRenderSignpost;
  if (uiRenderSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)int v9 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  uiRenderSignpost,  "UIRenderTime",  "",  v9,  2u);
  }
}

- (void)didBeginProcessingConversationItems
{
}

- (void)siriPresentation:(id)a3 viewDidAppearWithAceObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedClassName]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
  -[SRSiriViewController siriPresentation:viewDidAppearWithClassDescriptor:identifier:]( self,  "siriPresentation:viewDidAppearWithClassDescriptor:identifier:",  v7,  v8,  v9);

  double v10 = (void *)objc_claimAutoreleasedReturnValue( -[SRUIFAnalyticsSupplement dialogPhaseForAceObject:]( self->_analyticsSupplement,  "dialogPhaseForAceObject:",  v6));
  if (!v10)
  {
    __int16 v11 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "-[SRSiriViewController siriPresentation:viewDidAppearWithAceObject:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Dialog phase is unexpectedly nil for aceObject : %@",  (uint8_t *)&v12,  0x16u);
    }
  }

  -[SRSiriViewController _logAceObjectPresented:dialogPhase:](self, "_logAceObjectPresented:dialogPhase:", v6, v10);
}

- (void)siriPresentation:(id)a3 viewDidAppearWithClassDescriptor:(id)a4 identifier:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  -[SRSiriViewController _emitRenderingEnded](self, "_emitRenderingEnded");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v10 length]) {
    [v8 setObject:v10 forKeyedSubscript:@"viewClass"];
  }
  if ([v7 length]) {
    [v8 setObject:v7 forKeyedSubscript:@"identifier"];
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v9 logEventWithType:1461 context:v8];
}

- (void)siriPresentation:(id)a3 viewDidDisappearWithClassDescriptor:(id)a4 identifier:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v10 length]) {
    [v8 setObject:v10 forKeyedSubscript:@"viewClass"];
  }
  if ([v7 length]) {
    [v8 setObject:v7 forKeyedSubscript:@"identifier"];
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v9 logEventWithType:1462 context:v8];
}

- (void)toggleHomeAffordanceHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v4 toggleHomeAffordanceHidden:v3];
}

- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v4 toggleSiriHomeAffordanceGestureControl:v3];
}

- (BOOL)siriPresentationIsPresentingSystemUI:(id)a3
{
  return 0;
}

- (void)updateEdgeLightWindowLevel:(int64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _host](self, "_host"));
  [v4 updateEdgeLightWindowLevel:a3];
}

- (void)_insertUserUtteranceViewForText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    __int128 v24 = self;
    id v5 = objc_alloc_init(&OBJC_CLASS___SASToken);
    [v5 setText:v4];
    id v6 = objc_alloc_init(&OBJC_CLASS___SASInterpretation);
    id v28 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    [v6 setTokens:v7];

    id v8 = objc_alloc_init(&OBJC_CLASS___SASPhrase);
    id v27 = v6;
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    [v8 setInterpretations:v9];

    id v10 = objc_alloc_init(&OBJC_CLASS___SASRecognition);
    id v26 = v8;
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    [v10 setPhrases:v11];

    id v12 = objc_alloc_init(&OBJC_CLASS___SASSpeechRecognized);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    [v12 setAceId:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
    [v12 setRefId:v16];

    [v12 setTitle:v4];
    [v12 setRecognition:v10];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    [v12 setSessionId:v18];

    id v19 = objc_alloc_init(&OBJC_CLASS___SASSpeechPartialResult);
    id v25 = v5;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    [v19 setTokens:v20];

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
    [v19 setAceId:v22];

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 refId]);
    [v19 setRefId:v23];

    -[SRSiriViewController siriSessionDidReceiveSpeechPartialResultCommand:]( v24,  "siriSessionDidReceiveSpeechPartialResultCommand:",  v19);
    -[SRSiriViewController siriSessionDidReceiveSpeechRecognizedCommand:]( v24,  "siriSessionDidReceiveSpeechRecognizedCommand:",  v12);
  }
}

- (void)_insertUserUtteranceViewForSuggestion:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SASToken);
    [v4 setText:v3];
    id v5 = objc_alloc_init(&OBJC_CLASS___SASInterpretation);
    id v25 = v4;
    id v29 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    [v5 setTokens:v6];

    id v7 = objc_alloc_init(&OBJC_CLASS___SASPhrase);
    id v28 = v5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    [v7 setInterpretations:v8];

    id v9 = objc_alloc_init(&OBJC_CLASS___SASRecognition);
    id v27 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    [v9 setPhrases:v10];

    id v11 = objc_alloc_init(&OBJC_CLASS___SASSpeechRecognized);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    [v11 setAceId:v13];

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    [v11 setRefId:v15];

    [v11 setTitle:v3];
    [v11 setRecognition:v9];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    [v11 setSessionId:v17];

    double v18 = (void *)objc_claimAutoreleasedReturnValue([v11 recognition]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 refId]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionId]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "af_userUtteranceValueWithRefId:sessionId:", v19, v20));

    id v22 = [[SRUIFSpeechRecognitionHypothesis alloc] initWithUserUtterance:v21 backingAceObject:0 isFinal:1];
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    LOBYTE(v4) = objc_opt_respondsToSelector(v23, "updateSpeechRecognitionHypothesisForSuggestion:");

    if ((v4 & 1) != 0)
    {
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      [v24 updateSpeechRecognitionHypothesisForSuggestion:v22];

      -[SRSiriViewController siriSessionDidReceiveSpeechRecognizedCommand:]( self,  "siriSessionDidReceiveSpeechRecognizedCommand:",  v11);
    }
  }
}

- (void)siriSessionRequestsReadoutOfBulletin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #cmas #carPlay %@", buf, 0x16u);
  }

  if (v6)
  {
    __int128 v24 = (void (**)(void, void))v7;
    -[SRSiriViewController _setReadingBulletinContentInCarPlayOutsideOfSiriSession:]( self,  "_setReadingBulletinContentInCarPlayOutsideOfSiriSession:",  1LL);
    id v9 = dispatch_group_create();
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    uint64_t v45 = 0LL;
    v39[0] = 0LL;
    v39[1] = v39;
    v39[2] = 0x2020000000LL;
    v39[3] = 0LL;
    objc_initWeak(&location, self);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
    id v11 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v40 = 136315394;
      id v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      __int16 v42 = 2112;
      id v43 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #cmas #carPlay Title of emergency bulletin to speak: %@",  v40,  0x16u);
    }

    id v12 = [v10 length];
    if (v12)
    {
      dispatch_group_enter(v9);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10002CB2C;
      v34[3] = &unk_1000BA890;
      uint64_t v36 = buf;
      objc_copyWeak(&v37, &location);
      __int128 v35 = v9;
      -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  v10,  0LL,  0LL,  v34);

      objc_destroyWeak(&v37);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 message]);
    __int16 v14 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v40 = 136315394;
      id v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      __int16 v42 = 2112;
      id v43 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s #cmas #carPlay Message of emergency bulletin to speak: %@",  v40,  0x16u);
    }

    if ([v13 length])
    {
      dispatch_group_enter(v9);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10002CB94;
      v30[3] = &unk_1000BA890;
      __int128 v32 = v39;
      objc_copyWeak(&v33, &location);
      id v31 = v9;
      -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  v13,  0LL,  0LL,  v30);

      objc_destroyWeak(&v33);
    }

    else if (!v12)
    {
      id v16 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006B68C(v16, v17, v18, v19, v20, v21, v22, v23);
      }
      v24[2](v24, 4LL);
      goto LABEL_16;
    }

    id v15 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v40 = 136315138;
      id v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s #cmas #carPlay Waiting for synthesis to complete",  v40,  0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002CBFC;
    block[3] = &unk_1000BAB58;
    objc_copyWeak(&v29, &location);
    id v27 = buf;
    id v28 = v39;
    void block[4] = self;
    id v26 = v24;
    dispatch_group_notify(v9, &_dispatch_main_q, block);

    objc_destroyWeak(&v29);
LABEL_16:

    objc_destroyWeak(&location);
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

    id v7 = v24;
  }
}

- (unint64_t)_readoutResultFromTTSResult:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  if (a3 == 1
    && +[SRUIFSpeechSynthesisUtility isSpeechSynthesisErrorUserCancelled:]( &OBJC_CLASS___SRUIFSpeechSynthesisUtility,  "isSpeechSynthesisErrorUserCancelled:",  v5))
  {
    id v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = "-[SRSiriViewController _readoutResultFromTTSResult:error:]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s #cmas #carPlay received a user cancelled voice services error, setting state to AFUIBulletinReadoutResultSynt hesisCancelled. %@",  (uint8_t *)&v8,  0x16u);
    }

    a3 = 3LL;
  }

  else
  {
    if (v5 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006B76C();
    }
  }

  return a3;
}

- (unint64_t)_readoutResultFromTitleResult:(unint64_t)a3 messageResult:(unint64_t)a4
{
  unint64_t result = 2LL;
  if (a3 != 2 && a4 != 2)
  {
    unint64_t result = 3LL;
    if (a3 != 3 && a4 != 3)
    {
      if (a3 == 1 && !a4 || a3 <= 1 && a4 == 1)
      {
        return 1LL;
      }

      else
      {
        id v7 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          sub_10006B7D8(v7, a3, a4);
        }
        return 0LL;
      }
    }
  }

  return result;
}

- (void)_activeRequestOptionsDidChange
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController presentation](self, "presentation"));
  if ((objc_opt_respondsToSelector(v2, "activeRequestOptionsDidChange") & 1) != 0) {
    [v2 activeRequestOptionsDidChange];
  }
}

- (void)_setRequestOptions:(id)a3
{
}

- (void)setRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[SRSiriViewController setRequestOptions:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  -[SRSiriViewController _setRequestOptions:](self, "_setRequestOptions:", v4);
  -[SRModeProvider setRequestOptions:](self->_modeProvider, "setRequestOptions:", v4);
  id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v4 testingContext]);
  testingContext = self->_testingContext;
  self->_testingContext = v6;

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v9 = objc_opt_respondsToSelector(v8, "configureForRequestOptions:");

  if ((v9 & 1) != 0)
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v10 configureForRequestOptions:v4];
  }
}

- (void)_startRequestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "-[SRSiriViewController _startRequestWithOptions:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentInstrumentationTurnContext]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 turnIdentifier]);

  if (v8) {
    [v4 setPreviousTurnIdentifier:v8];
  }
  -[SRSiriViewController _setWaitingForStartRequest:](self, "_setWaitingForStartRequest:", 1LL);
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates")) {
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
  }
  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_1000BAB78));
  [v9 serviceStartRequestWithOptions:v4];
}

- (void)siriPresentation:(id)a3 siriRequestEnteredWithText:(id)a4
{
}

- (void)siriSessionDidStartAcousticIDRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "acousticIDRequestDidStart");

  if ((v4 & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v5 acousticIDRequestDidStart];
  }

- (void)siriSessionDidFinishAcousticIDRequestWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v6 = objc_opt_respondsToSelector(v5, "acousticIDRequestDidFinishWithSuccess:");

  if ((v6 & 1) != 0)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v7 acousticIDRequestDidFinishWithSuccess:v3];
  }

- (void)siriSessionRequestedCancelPhotoSelectionWithAnimation:(BOOL)a3
{
  phPicker = self->_phPicker;
  if (phPicker) {
    -[SiriSharedUIPhPicker dismissPhotoPickerIfExistsWithAnimation:]( phPicker,  "dismissPhotoPickerIfExistsWithAnimation:",  a3);
  }
}

- (void)siriSessionRequestedPhotoSelectionWithSearchString:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  phPicker = self->_phPicker;
  if (!phPicker)
  {
    int v8 = objc_alloc_init(&OBJC_CLASS___SiriSharedUIPhPicker);
    char v9 = self->_phPicker;
    self->_phPicker = v8;

    phPicker = self->_phPicker;
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentationViewController](self, "_presentationViewController"));
  -[SiriSharedUIPhPicker presentPhotoPicker:withSearchString:completion:]( phPicker,  "presentPhotoPicker:withSearchString:completion:",  v10,  v11,  v6);
}

- (int64_t)_presentationOptions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  unsigned __int8 v4 = [v3 isForBluetoothCar];

  if ((v4 & 1) != 0) {
    return 8LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v7 = objc_opt_respondsToSelector(v6, "options");

  if ((v7 & 1) == 0) {
    return 0LL;
  }
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  id v9 = [v8 options];

  return (int64_t)v9;
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[SRSiriPresentationPluginHost sharedSiriPresentationPluginHost]( &OBJC_CLASS___SRSiriPresentationPluginHost,  "sharedSiriPresentationPluginHost"));
  [v4 preloadPresentationBundleWithIdentifier:v3];
}

- (void)preloadPluginBundles
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SiriUICardProviderRegistry sharedInstance](&OBJC_CLASS___SiriUICardProviderRegistry, "sharedInstance"));
  [v2 preloadProviders];
}

- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5
{
  self->_unint64_t lockState = a5;
  -[SRSiriViewController updateToPresentationWithIdentifier:presentationProperties:animated:completion:]( self,  "updateToPresentationWithIdentifier:presentationProperties:animated:completion:",  a3,  a4,  0LL,  0LL);
}

- (void)_setPresentation:(id)a3
{
}

- (id)_presentationViewController
{
  if ((objc_opt_respondsToSelector(self->_presentation, "viewController") & 1) != 0) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIPresentation viewController](self->_presentation, "viewController"));
  }
  else {
    id v3 = 0LL;
  }
  return v3;
}

- (void)_updateLanguageCode
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _language](self, "_language"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 spokenLanguageCode]);

  AFUISetLanguageCode(v3);
}

- (id)_dialogPhaseForItemAtIndexPath:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _activeConversationItemAtIndexPath:]( self,  "_activeConversationItemAtIndexPath:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dialogPhase]);

  return v4;
}

- (void)_performGenericAceCommand:(id)a3 turnIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = mach_absolute_time();
  objc_opt_class(&OBJC_CLASS___SAUISayIt, v12);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    -[SRSiriViewController _performSayItCommand:](self, "_performSayItCommand:", v8);
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  objc_opt_class(&OBJC_CLASS___SAUICancelCurrentTTS, v14);
  if ((objc_opt_isKindOfClass(v8, v15) & 1) != 0)
  {
    -[SRSiriViewController _cancelCurrentTTS:](self, "_cancelCurrentTTS:", v8);
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  objc_opt_class(&OBJC_CLASS___SASmsCancelCurrentAudioPlayBack, v16);
  if ((objc_opt_isKindOfClass(v8, v17) & 1) != 0)
  {
    -[SRSiriViewController _cancelCurrentAudioMessagePlayback:](self, "_cancelCurrentAudioMessagePlayback:", v8);
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  double v18 = (double)v11;
  if (self->_previousSayItCommand)
  {
    uint64_t v19 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      previousSayItCommand = self->_previousSayItCommand;
      int v23 = 136315650;
      __int128 v24 = "-[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:]";
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = previousSayItCommand;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s #tts recording _previousSayItCommand completed before processing ace command=%@, previousSayItCommand=%@",  (uint8_t *)&v23,  0x20u);
    }

    -[SRSiriViewController _didCompleteActionForAceCommand:success:]( self,  "_didCompleteActionForAceCommand:success:",  self->_previousSayItCommand,  1LL);
    uint64_t v21 = self->_previousSayItCommand;
    self->_previousSayItCommand = 0LL;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v22 performAceCommand:v8 turnIdentifier:v9 machAbsoluteTime:v18];

  if (v10) {
LABEL_15:
  }
    v10[2](v10, 1LL);
LABEL_16:
}

- (void)_performSayItCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 context]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  id v31 = 0LL;
  id v32 = 0LL;
  id v28 = (void *)v5;
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:]( self,  "_configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:",  v4,  v5,  v6,  0LL,  &v32,  &v31));
  id v30 = v32;
  id v29 = v31;

  if (!self->_listenAfterSpeakingForRequestFinished)
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v4 listenAfterSpeaking]);
    unsigned int v8 = [v7 BOOLValue];

    if (v8)
    {
      -[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]( self,  "_setListenAfterSpeakingForRequestFinished:",  1LL);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 listenAfterSpeakingBehavior]);
      int v10 = (NSString *)objc_claimAutoreleasedReturnValue([v9 startAlertSoundID]);
      startRecordingSoundId = self->_startRecordingSoundId;
      self->_startRecordingSoundId = v10;
    }
  }

  -[SRSiriViewController _didStartActionForAceCommand:](self, "_didStartActionForAceCommand:", v4);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceName]);

  if (v12)
  {
    uint64_t v13 = self;
    id v14 = objc_alloc_init(&OBJC_CLASS___SAVoice);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 voiceName]);
    [v14 setName:v15];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
    uint64_t v17 = v14;
    [v14 setLanguageString:v16];
  }

  else
  {
    uint64_t v13 = self;
    uint64_t v17 = 0LL;
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 audioData]);
  unsigned int v26 = objc_msgSend(v4, "sruif_ignoresMuteSwitch");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
  int v23 = (void *)objc_claimAutoreleasedReturnValue([v4 gender]);
  BYTE2(v25) = [v4 canUseServerTTS];
  LOWORD(v25) = 0;
  -[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:]( v13,  "_speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfte rDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:",  v18,  v19,  v26,  v20,  v21,  v17,  0.0,  v22,  v23,  v25,  v27,  0LL,  0LL,  v30,  v29);

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  -[SRSiriViewController _logAceObjectSpoken:dialogPhase:speakableText:]( v13,  "_logAceObjectSpoken:dialogPhase:speakableText:",  v4,  0LL,  v24);
}

- (void)_cancelCurrentTTS:(id)a3
{
}

- (void)_cancelCurrentAudioMessagePlayback:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer", a3));
  [v4 stopPlaying];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _audioMessagePlayer](self, "_audioMessagePlayer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playbackCommand]);
  -[SRSiriViewController audioPlayer:didFinishPlayback:](self, "audioPlayer:didFinishPlayback:", v7, v6);
}

- (void)_performAppPunchOutCommand:(id)a3 completion:(id)a4
{
}

- (void)_performAppPunchOutCommand:(id)a3 conversationItemIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleId]);
  if (v11)
  {
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 punchOutUri]);

    if (!v12)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        sub_10006B8F8();
        if (!v10) {
          goto LABEL_22;
        }
      }

      else if (!v10)
      {
        goto LABEL_22;
      }

      v10[2](v10, 0LL);
      goto LABEL_22;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
  if (!v13)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SRSiriViewController _punchoutMetricsAceCommandIdForItemWithIdentifier:]( self,  "_punchoutMetricsAceCommandIdForItemWithIdentifier:",  v9));
    if (!v13) {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 aceId]);
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleId]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v13, v14));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _completedCommandAppPunchOutIds](self, "_completedCommandAppPunchOutIds"));
  unsigned __int8 v17 = [v16 containsObject:v15];

  if ((v17 & 1) == 0)
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _completedCommandAppPunchOutIds](self, "_completedCommandAppPunchOutIds"));
    [v18 addObject:v15];

    objc_initWeak(location, self);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10002E174;
    v48[3] = &unk_1000BABA0;
    objc_copyWeak(&v52, location);
    id v49 = v13;
    id v19 = v8;
    id v50 = v19;
    uint64_t v20 = v10;
    id v51 = v20;
    __int16 v40 = objc_retainBlock(v48);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 alternativePunchOut]);

    if (v21)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 alternativePunchOut]);
      -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:]( self,  "_performGenericAceCommand:turnIdentifier:completion:",  v22,  0LL,  v20);
    }

    else
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10002E27C;
      v45[3] = &unk_1000BABC8;
      id v23 = v19;
      id v46 = v23;
      id v37 = v40;
      id v47 = v37;
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", v45));
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      uint64_t v25 = objc_opt_respondsToSelector(v24, "shouldPunchOutInPlace");

      if ((v25 & 1) != 0)
      {
        unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
        unsigned int v39 = [v26 shouldPunchOutInPlace];

        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
          sub_10006B964();
        }
      }

      else
      {
        __int16 v27 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
          sub_10006B9F4(v27, v28, v29, v30, v31, v32, v33, v34);
        }
        unsigned int v39 = 0;
      }

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v23 punchOutUri]);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleId]);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_10002E2EC;
      v41[3] = &unk_1000BAC40;
      id v43 = v37;
      id v42 = v23;
      objc_copyWeak(&v44, location);
      [v38 openURL:v35 bundleId:v36 inPlace:v39 completion:v41];

      objc_destroyWeak(&v44);
      uint64_t v22 = v46;
    }

    objc_destroyWeak(&v52);
    objc_destroyWeak(location);
  }

LABEL_22:
}

- (void)_cancelIdleTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _idleTimer](self, "_idleTimer"));

  if (v3)
  {
    id v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[SRSiriViewController _cancelIdleTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #idleTimer", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _idleTimer](self, "_idleTimer"));
    [v5 invalidate];

    -[SRSiriViewController _setIdleTimer:](self, "_setIdleTimer:", 0LL);
  }

- (void)_scheduleIdleTimer
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v4 = objc_opt_respondsToSelector(v3, "idleTimerInterval");

  double v5 = 5.0;
  if ((v4 & 1) != 0)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    [v6 idleTimerInterval];
    double v5 = v7;
  }

  id v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[SRSiriViewController _scheduleIdleTimer]";
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #idleTimer idleTimerInterval=%f seconds",  (uint8_t *)&v10,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_idleTimerFired:",  0LL,  0LL,  v5));
  -[SRSiriViewController _setIdleTimer:](self, "_setIdleTimer:", v9);
}

- (void)_rescheduleIdleTimerIfNeeded
{
  unsigned int v3 = -[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet");
  unsigned int v4 = -[SRSiriViewController _isIdleTimerEnabled](self, "_isIdleTimerEnabled");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v6 = objc_opt_respondsToSelector(v5, "isPresentingUIFromRemoteDevice");

  if ((v6 & 1) != 0)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned int v8 = [v7 isPresentingUIFromRemoteDevice];
  }

  else
  {
    unsigned int v8 = 0;
  }

  id v9 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    uint64_t v11 = "-[SRSiriViewController _rescheduleIdleTimerIfNeeded]";
    __int16 v12 = 1024;
    unsigned int v13 = v3;
    __int16 v14 = 1024;
    unsigned int v15 = v4;
    __int16 v16 = 1024;
    unsigned int v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s #idleTimer idleAndQuiet=%i idleTimerEnabled=%i isPresentingUIFromRemoteDevice:%i",  (uint8_t *)&v10,  0x1Eu);
  }

  if ((v4 & (v3 | v8)) == 1) {
    -[SRSiriViewController _scheduleIdleTimer](self, "_scheduleIdleTimer");
  }
  else {
    -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
  }
}

- (void)_idleTimerFired:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation", a3));
  char v5 = objc_opt_respondsToSelector(v4, "shouldDismissForIdling");

  if ((v5 & 1) != 0)
  {
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned int v7 = [v6 shouldDismissForIdling];
  }

  else
  {
    unsigned int v7 = 0;
  }

  unsigned int v8 = -[SRSiriViewController _isIdleTimerEnabled](self, "_isIdleTimerEnabled");
  unsigned int v9 = -[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet");
  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v11 = objc_opt_respondsToSelector(v10, "isPresentingUIFromRemoteDevice");

  if ((v11 & 1) != 0)
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    unsigned int v13 = [v12 isPresentingUIFromRemoteDevice];
  }

  else
  {
    unsigned int v13 = 0;
  }

  __int16 v14 = (os_log_s *)AFSiriLogContextConnection;
  BOOL v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
  if ((v7 & v8 & (v9 | v13)) == 1)
  {
    if (v15)
    {
      int v19 = 136315138;
      uint64_t v20 = "-[SRSiriViewController _idleTimerFired:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s #idleTimer Dismissing Siri",  (uint8_t *)&v19,  0xCu);
    }

    -[SRSiriViewController _cancelIdleTimer](self, "_cancelIdleTimer");
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v17 = objc_opt_respondsToSelector(v16, "siriWillDismissWithReason:completion:");

    if ((v17 & 1) != 0)
    {
      double v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
      [v18 siriWillDismissWithReason:1 completion:0];
    }

    -[SRSiriViewController _dismissWithReason:](self, "_dismissWithReason:", 4LL);
  }

  else
  {
    if (v15)
    {
      int v19 = 136316162;
      uint64_t v20 = "-[SRSiriViewController _idleTimerFired:]";
      __int16 v21 = 1024;
      unsigned int v22 = v7;
      __int16 v23 = 1024;
      unsigned int v24 = v9;
      __int16 v25 = 1024;
      unsigned int v26 = v8;
      __int16 v27 = 1024;
      unsigned int v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s #idleTimer Not dismissing Siri - readyToDismiss:%d idleAndQuiet:%d idleTimerEnabled:%d isPresentingUIFromRemoteDevice:%d",  (uint8_t *)&v19,  0x24u);
    }

    -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
  }

- (BOOL)_isSiriIdleAndQuiet
{
  int64_t siriState = self->_siriState;
  if (siriState) {
    BOOL v4 = siriState == 3;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  unsigned int v6 = -[SRSiriViewController _isRequestActive](self, "_isRequestActive");
  unsigned int v7 = -[SRSiriViewController _isSpeechSynthesisSpeaking](self, "_isSpeechSynthesisSpeaking");
  unsigned int v8 = -[SRSiriViewController _isAudioPlayerPlaying](self, "_isAudioPlayerPlaying");
  unsigned int v9 = -[SRSiriViewController _isWaitingForStartRequest](self, "_isWaitingForStartRequest");
  BOOL delaySessionEndForInPlacePunchout = self->_delaySessionEndForInPlacePunchout;
  int v11 = v9 ^ 1;
  if (self->_delaySessionEndForInPlacePunchout) {
    int v11 = 0;
  }
  if ((v8 & 1) != 0) {
    int v11 = 0;
  }
  if ((v7 & 1) != 0) {
    int v11 = 0;
  }
  if ((v6 & 1) != 0) {
    int v11 = 0;
  }
  if (v5 == 1) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }
  unsigned int v13 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = @"NO ";
    int v16 = 136316930;
    char v17 = "-[SRSiriViewController _isSiriIdleAndQuiet]";
    __int16 v18 = 2112;
    if (v12) {
      __int16 v14 = @"YES";
    }
    int v19 = v14;
    __int16 v20 = 1024;
    int v21 = v5;
    __int16 v22 = 1024;
    unsigned int v23 = v6;
    __int16 v24 = 1024;
    unsigned int v25 = v7;
    __int16 v26 = 1024;
    unsigned int v27 = v8;
    __int16 v28 = 1024;
    unsigned int v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = delaySessionEndForInPlacePunchout;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s #idle %@ - inIdleState:%d requestActive:%d speaking:%d audioPlaying:%d waitingForStartRequest:%d delayingSessio nEndForInPlacePunchout:%d",  (uint8_t *)&v16,  0x3Au);
  }

  return v12;
}

- (void)_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:(id)a3
{
  unsigned int v8 = (void (**)(id, BOOL))a3;
  BOOL v4 = -[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet");
  unint64_t v5 = -[SRSiriViewController _wasSiriIdleAndQuiet](self, "_wasSiriIdleAndQuiet");
  if (v4) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  -[SRSiriViewController _setWasSiriIdleAndQuiet:](self, "_setWasSiriIdleAndQuiet:", v6);
  if (v5 != v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _hostWithErrorHandler:](self, "_hostWithErrorHandler:", &stru_1000BAC60));
    [v7 siriIdleAndQuietStatusDidChange:v4];

    -[SRSiriViewController _scheduleInterruptedAudioResumingIfNeeded](self, "_scheduleInterruptedAudioResumingIfNeeded");
    if (v8) {
      v8[2](v8, v4);
    }
  }
}

- (void)_checkAndUpdateSiriIdleAndQuietStatusIfNeeded
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002EF4C;
  v3[3] = &unk_1000BA050;
  objc_copyWeak(&v4, &location);
  -[SRSiriViewController _checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:]( self,  "_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:",  v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_scheduleInterruptedAudioResumingIfNeeded
{
  if (!self->_waitingForTelephonyToStart)
  {
    if (-[SRSiriViewController _isSiriIdleAndQuiet](self, "_isSiriIdleAndQuiet"))
    {
      objc_initWeak(&location, self);
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472LL;
      v3[2] = sub_10002F24C;
      v3[3] = &unk_1000BA050;
      objc_copyWeak(&v4, &location);
      -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }

- (void)_scheduleAudioResumptionAfterDelayInSec:(double)a3
{
  unint64_t v5 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315394;
    int v10 = "-[SRSiriViewController _scheduleAudioResumptionAfterDelayInSec:]";
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Scheduling interrupted audio to be resumed in %lf seconds",  buf,  0x16u);
  }

  objc_initWeak((id *)buf, self);
  dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F48C;
  block[3] = &unk_1000B9F38;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_after(v6, &_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded
{
  if (-[SRSiriViewController _usesEventDrivenIdleAndQuietUpdates](self, "_usesEventDrivenIdleAndQuietUpdates")) {
    -[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded]( self,  "_checkAndUpdateSiriIdleAndQuietStatusIfNeeded");
  }
  else {
    -[SRSiriViewController _rescheduleIdleTimerIfNeeded](self, "_rescheduleIdleTimerIfNeeded");
  }
}

- (BOOL)_resumesInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v4, "shouldResumeInterruptedAudioPlaybackForAttendingState:") & 1) != 0) {
    unsigned __int8 v5 = [v4 shouldResumeInterruptedAudioPlaybackForAttendingState:v3];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_usesEventDrivenIdleAndQuietUpdates
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v2, "shouldUseEventDrivenIdleAndQuietUpdates") & 1) != 0) {
    unsigned __int8 v3 = [v2 shouldUseEventDrivenIdleAndQuietUpdates];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)_handleRequestError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006BBB4();
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SRErrorUtility userStringForError:reflectionDialogWasPlayed:]( &OBJC_CLASS___SRErrorUtility,  "userStringForError:reflectionDialogWasPlayed:",  v6,  -[SRSiriViewController _reflectionDialogHasBeenPlayed](self, "_reflectionDialogHasBeenPlayed")));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    [v9 emitRequestFailedWithError:v6];

    int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v10 isEqualToString:kAFAssistantErrorDomain])
    {
      id v11 = [v6 code];

      if (v11 == (id)6)
      {
        double v12 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315394;
          char v17 = "-[SRSiriViewController _handleRequestError:completion:]";
          __int16 v18 = 2114;
          id v19 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s #errorHandling handling kAFErrorNotReady: %{public}@ locally",  buf,  0x16u);
        }

        -[SRSiriViewController _displayNotReadyError:](self, "_displayNotReadyError:", v7);
        goto LABEL_20;
      }
    }

    else
    {
    }

    if (v8)
    {
      -[SRSiriViewController _addErrorUtterance:](self, "_addErrorUtterance:", v8);
      if (!-[SRSiriViewController _suppressTTSForErrorsAndInterstitials](self, "_suppressTTSForErrorsAndInterstitials"))
      {
        unsigned int v13 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315394;
          char v17 = "-[SRSiriViewController _handleRequestError:completion:]";
          __int16 v18 = 2112;
          id v19 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s #errorHandling speaking error TTS with error string: '%@'",  buf,  0x16u);
        }

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        id v14[2] = sub_10002F934;
        v14[3] = &unk_1000BA5B0;
        id v15 = v7;
        -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  v8,  0LL,  0LL,  v14);

        goto LABEL_20;
      }
    }

    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      sub_10006BB48();
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }

    if (!v7)
    {
LABEL_20:

      goto LABEL_21;
    }

- (void)_displayNotReadyError:(id)a3
{
  id v4 = a3;
  *(void *)&double v6 = objc_opt_class(self, v5).n128_u64[0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v7, v6));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assistantUILocalizedStringForKey:@"ASSISTANT_NOT_READY_TITLE" table:0]);

  *(void *)&double v11 = objc_opt_class(self, v10).n128_u64[0];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v12, v11));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 assistantUILocalizedStringForKey:@"ASSISTANT_NOT_READY_MESSAGE" table:0]);

  -[SRSiriViewController _addErrorUtterance:](self, "_addErrorUtterance:", v9);
  -[SRSiriViewController _addErrorUtterance:](self, "_addErrorUtterance:", v14);
  -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  v9,  0LL,  0LL,  0LL);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002FA98;
  v16[3] = &unk_1000BA5B0;
  id v17 = v4;
  id v15 = v4;
  -[SRSiriViewController _synthesizeText:identifier:sessionId:completion:]( self,  "_synthesizeText:identifier:sessionId:completion:",  v14,  0LL,  0LL,  v16);
}

- (void)_logRevealSpeechCommandReceived:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 recognition]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 utterances]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    double v10 = 0.0;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)i), "confidenceScore", (void)v16);
        double v10 = v10 + v12;
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v8);
  }

  else
  {
    double v10 = 0.0;
  }

  if ([v6 count]) {
    double v10 = v10 / (double)(unint64_t)[v6 count];
  }
  __int16 v20 = @"confidenceScore";
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10, (void)v16));
  int v21 = v13;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _analytics](self, "_analytics"));
  [v15 logEventWithType:1459 context:v14];
}

- (unint64_t)_currentModeWithModeProvider:(id)a3
{
  return (unint64_t)_[a3 currentMode];
}

- (id)_analytics
{
  return +[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics");
}

- (id)_instrumentationManager
{
  return +[SRUIFInstrumentationManager sharedManager](&OBJC_CLASS___SRUIFInstrumentationManager, "sharedManager");
}

- (void)_addErrorUtterance:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SAUIAddViews);
  -[SAUIAddViews setDialogPhase:](v5, "setDialogPhase:", SAUIDialogPhaseErrorValue);
  id v6 = objc_alloc_init(&OBJC_CLASS___SAUIAssistantUtteranceView);
  [v6 setText:v4];

  [v11 addObject:v6];
  -[SAUIAddViews setViews:](v5, "setViews:", v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAddViews dictionary](v5, "dictionary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", v7));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
  [v8 setAceId:v10];

  -[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:]( self,  "_performGenericAceCommand:turnIdentifier:completion:",  v8,  0LL,  0LL);
}

- (void)_audioSessionRouteDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey]);
  id v6 = [v5 unsignedIntegerValue];

  if (v6 == (id)2) {
    -[SRSiriViewController _cancelSpeechSynthesis](self, "_cancelSpeechSynthesis");
  }
}

- (void)_startListenAfterSpeaking
{
  if (-[SASRequestOptions requestSource](self->_requestOptions, "requestSource") == (id)23
    || -[SASRequestOptions isSuggestionSourceWithTextInput]( self->_requestOptions,  "isSuggestionSourceWithTextInput"))
  {
    unsigned __int8 v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      requestOptions = self->_requestOptions;
      uint64_t v5 = v3;
      uint64_t Name = SASRequestSourceGetName(-[SASRequestOptions requestSource](requestOptions, "requestSource"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
      __int16 v20 = 2112;
      int v21 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #tts Not listening after speaking because requestSource == %@",  buf,  0x16u);
    }

    return;
  }

  if (!-[SASRequestOptions isForAppleTV](self->_requestOptions, "isForAppleTV"))
  {
LABEL_11:
    if (-[SRSiriViewController _isStartRequestAceCommandSent](self, "_isStartRequestAceCommandSent"))
    {
      id v11 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        __int128 v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
        double v12 = "%s #tts Not listening after speaking because SAStartRequest was sent during TTS";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }

    else
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      unsigned int v14 = [v13 listenAfterSpeakingDisabled];

      if (!v14)
      {
        objc_initWeak((id *)buf, self);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1000301A4;
        v16[3] = &unk_1000BA050;
        objc_copyWeak(&v17, (id *)buf);
        -[SRSiriViewController _fetchAttendingState:](self, "_fetchAttendingState:", v16);
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
        return;
      }

      id v11 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        __int128 v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
        double v12 = "%s #tts Not listening after speaking because listenAfterSpeakingDisabled == YES";
        goto LABEL_17;
      }
    }

    self->_keyboardEnabled = 1;
    return;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASRequestOptions requestInfo](self->_requestOptions, "requestInfo"));
  if (objc_msgSend(v8, "afui_isRemoteHeadsetActivation"))
  {

    goto LABEL_9;
  }

  unsigned __int8 v9 = -[SASRequestOptions afui_isTVFollowUpHearstActivation]( self->_requestOptions,  "afui_isTVFollowUpHearstActivation");

  if ((v9 & 1) != 0)
  {
LABEL_9:
    double v10 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s #tts #tv Allowing listening after speaking for multi-turn request on AppleTV when auto endpointing is on",  buf,  0xCu);
    }

    goto LABEL_11;
  }

  id v15 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int128 v19 = "-[SRSiriViewController _startListenAfterSpeaking]";
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s #tts #tv Not listening after speaking because requestSource is one of the request sources for AppleTV.",  buf,  0xCu);
  }

- (void)siriPresentation:(id)a3 requestsAttendingStateWithCompletion:(id)a4
{
}

- (void)_fetchAttendingState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030368;
  v7[3] = &unk_1000BAA38;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAttendingState:v7];
}

- (void)_notifyPromptedUserForInput
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v2 promptedUserForInput];
}

- (void)_startListenAfterSpeakingRequest
{
  unsigned __int8 v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v20 = "-[SRSiriViewController _startListenAfterSpeakingRequest]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s #tts Start listening. Starting new request after TTS completed",  buf,  0xCu);
  }

  id v4 = objc_alloc(&OBJC_CLASS___SASRequestOptions);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier"));
  id v6 = -[SASRequestOptions initWithRequestSource:uiPresentationIdentifier:]( v4,  "initWithRequestSource:uiPresentationIdentifier:",  9LL,  v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  -[SASRequestOptions setIsForBluetoothCar:](v6, "setIsForBluetoothCar:", [v7 isForBluetoothCar]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originalRequestOptions]);
  if (v9)
  {
    -[SASRequestOptions setOriginalRequestOptions:](v6, "setOriginalRequestOptions:", v9);
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    -[SASRequestOptions setOriginalRequestOptions:](v6, "setOriginalRequestOptions:", v10);
  }

  -[SASRequestOptions setStartRecordingSoundId:](v6, "setStartRecordingSoundId:", self->_startRecordingSoundId);
  id v11 = [[AFSpeechRequestOptions alloc] initWithActivationEvent:5];
  double v12 = (void *)objc_opt_new(&OBJC_CLASS___AFRequestInfo);
  [v12 setSpeechRequestOptions:v11];
  -[SASRequestOptions setRequestInfo:](v6, "setRequestInfo:", v12);
  objc_initWeak((id *)buf, self);
  ttsManager = self->_ttsManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100030614;
  v15[3] = &unk_1000BACB0;
  objc_copyWeak(&v18, (id *)buf);
  unsigned int v14 = v6;
  __int128 v16 = v14;
  id v17 = self;
  -[SRUIFSpeechSynthesizer isSynthesisQueueEmpty:](ttsManager, "isSynthesisQueueEmpty:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (id)_punchoutMetricsAceCommandIdForItemWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation")),
        unsigned int v6 = [v5 containsItemWithIdentifier:v4],
        v5,
        v6)
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation")),
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemWithIdentifier:v4]),
        v7,
        v8))
  {
    while (1)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 aceCommandIdentifier]);
      if (v9) {
        break;
      }
      double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 parentOfItemWithIdentifier:v11]);

      id v8 = (void *)v12;
      if (!v12)
      {
        unsigned int v13 = 0LL;
        goto LABEL_10;
      }
    }

    unsigned int v13 = (void *)v9;
LABEL_10:
  }

  else
  {
    unsigned int v13 = 0LL;
  }

  return v13;
}

- (id)_metricsContextForItemWithAceCommandId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _aceCommandRecords](self, "_aceCommandRecords"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 aceCommandWithIdentifier:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);

    id v8 = 0LL;
    if (v4 && v7)
    {
      v15[0] = @"i";
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
      v15[1] = @"a";
      v16[0] = v9;
      v16[1] = v4;
      double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

      id v14 = 0LL;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v10,  0LL,  &v14));
      id v12 = v14;
      if (v11)
      {
        id v8 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v11, 4LL);
      }

      else
      {
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          sub_10006BC20();
        }
        id v8 = 0LL;
      }
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_uiPresentationIdentifier
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiPresentationIdentifier]);
  id v5 = [v4 length];

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 uiPresentationIdentifier]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    char v9 = objc_opt_respondsToSelector(v8, "options");

    if ((v9 & 1) != 0
      && (double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation")),
          id v11 = (char *)[v10 options],
          v10,
          (unint64_t)(v11 - 1) <= 7))
    {
      id v7 = off_1000BACE8[(void)(v11 - 1)];
    }

    else
    {
      id v7 = @"com.apple.siri.Compact";
    }
  }

  return v7;
}

- (void)_logAceObjectPresented:(id)a3 dialogPhase:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  objc_opt_class(&OBJC_CLASS___SASSpeechPartialResult, v7);
  if ((objc_opt_isKindOfClass(v23, v8) & 1) != 0)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v23 aceId]);
    [v10 emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier:v11];
LABEL_7:

    goto LABEL_8;
  }

  objc_opt_class(&OBJC_CLASS___SASSpeechRecognized, v9);
  if ((objc_opt_isKindOfClass(v23, v12) & 1) != 0)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v23 aceId]);
    [v10 emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier:v11];
    goto LABEL_7;
  }

  objc_opt_class(&OBJC_CLASS___SAUIRevealRecognizedSpeech, v13);
  if ((objc_opt_isKindOfClass(v23, v14) & 1) != 0)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v23 aceId]);
    [v10 emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier:v11];
    goto LABEL_7;
  }

  uint64_t v15 = -[SRSiriViewController _instrumentationPresentationForPresentationOptions:]( self,  "_instrumentationPresentationForPresentationOptions:",  -[SRSiriViewController _presentationOptions](self, "_presentationOptions"));
  analyticsSupplement = self->_analyticsSupplement;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v23 refId]);
  id v18 = -[SRUIFAnalyticsSupplement computedModeForRefId:](analyticsSupplement, "computedModeForRefId:", v17);

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  char v20 = objc_opt_respondsToSelector(v19, "viewRegionForPresentedAceObject:");

  if ((v20 & 1) != 0)
  {
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
    id v22 = [v21 viewRegionForPresentedAceObject:v23];
  }

  else
  {
    id v22 = 0LL;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v10 emitUUFRShownForAceObject:v23 presentationType:v15 dialogPhase:v6 mode:v18 viewRegion:v22];
LABEL_8:
}

- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5
{
}

- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5 dialogIdentifierOverride:(id)a6
{
  id v23 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = -[SRSiriViewController _instrumentationPresentationForPresentationOptions:]( self,  "_instrumentationPresentationForPresentationOptions:",  -[SRSiriViewController _presentationOptions](self, "_presentationOptions"));
  objc_opt_class(&OBJC_CLASS___SABaseClientBoundCommand, v14);
  if ((objc_opt_isKindOfClass(v23, v15) & 1) == 0)
  {
    analyticsSupplement = self->_analyticsSupplement;
    id v16 = (id)objc_claimAutoreleasedReturnValue([v23 refId]);
    id v18 = -[SRUIFAnalyticsSupplement computedModeForRefId:](analyticsSupplement, "computedModeForRefId:", v16);
LABEL_9:
    id v21 = v18;
    goto LABEL_10;
  }

  id v16 = v23;
  if ((_os_feature_enabled_impl("ResponseFramework", "Enabled") & 1) == 0)
  {
    if (+[SRModeDialogTransformer supportsTransformationForAceCommand:]( &OBJC_CLASS___SRModeDialogTransformer,  "supportsTransformationForAceCommand:",  v16))
    {
      goto LABEL_7;
    }

- (int)_instrumentationResponseModeForMode:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return dword_100082AC0[a3];
  }
}

- (int)_mapSiriTransitionState:(int64_t)a3
{
  else {
    return dword_100082A28[a3];
  }
}

- (int)_instrumentationPresentationForPresentationOptions:(int64_t)a3
{
  else {
    return dword_100082A3C[a3];
  }
}

- (unint64_t)_MDModeToSRModeConverter:(unint64_t)a3
{
  if (a3 > 3) {
    return 1LL;
  }
  else {
    return qword_100082A60[a3];
  }
}

- (unint64_t)_SRModeToMDModeConverter:(unint64_t)a3
{
  if (a3 == 2) {
    return 2LL;
  }
  else {
    return a3 != 0;
  }
}

- (unint64_t)_responseModeToMDModeConverter:(id)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  if ([v3 isEqualToString:@"displayonly"])
  {
    unint64_t v4 = 2LL;
  }

  else
  {
    if (([v3 isEqualToString:@"displayforward"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"voiceonly"])
      {
        unint64_t v4 = 0LL;
        goto LABEL_9;
      }

      if ([v3 isEqualToString:@"voiceforward"])
      {
        unint64_t v4 = 3LL;
        goto LABEL_9;
      }

      id v6 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        uint64_t v8 = "-[SRSiriViewController _responseModeToMDModeConverter:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s #modes Incompatible ResponseMode sent via addViews. Defaulting to DisplayForward",  (uint8_t *)&v7,  0xCu);
      }
    }

    unint64_t v4 = 1LL;
  }

- (BOOL)_suppressTTSForErrorsAndInterstitials
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 requestInfo]);
  id v5 = [v4 activationEvent];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _requestOptions](self, "_requestOptions"));
  if ([v6 requestSource] == (id)26 || v5 == (id)6)
  {
  }

  else
  {

    if (v5 != (id)9) {
      return -[SRModeProvider displayOnlyModeForInterstitialsAndErrors]( self->_modeProvider,  "displayOnlyModeForInterstitialsAndErrors");
    }
  }

  int v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[SRSiriViewController _suppressTTSForErrorsAndInterstitials]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #errorHandling suppressing interstitial and error TTS for spoken messages",  (uint8_t *)&v9,  0xCu);
  }

  return 1;
}

- (void)_setListenAfterSpeakingForRequestFinished:(BOOL)a3
{
  self->_BOOL listenAfterSpeakingForRequestFinished = a3;
  unint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
    int v6 = 136315394;
    int v7 = "-[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]";
    __int16 v8 = 1024;
    BOOL v9 = listenAfterSpeakingForRequestFinished;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s listenAfterSpeaking - %d",  (uint8_t *)&v6,  0x12u);
  }

- (void)_sharePatternIdFromAddViewsCommand:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 patternId]);

  if (v4)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "views", 0));
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v17;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v10);
          objc_opt_class(&OBJC_CLASS___SAUIVisualResponseSnippet, v7);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            id v13 = v11;
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 patternId]);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 viewId]);

            +[VRXVisualResponseProvider setPatternId:forViewId:]( &OBJC_CLASS___VRXVisualResponseProvider,  "setPatternId:forViewId:",  v14,  v15);
          }

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }
  }
}

- (void)_logPatternExecutedEventForAddViewsCommand:(id)a3
{
  id v14 = a3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v14 patternId]);
  if (v4)
  {

LABEL_4:
    id v5 = objc_alloc(&OBJC_CLASS___VRXPatternExecutedInstrumentationEvent);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v14 patternId]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v14 patternType]);
    responseViewId = self->_responseViewId;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v14 responseMode]);
    id v10 = [v5 initWithPatternId:v6 patternType:v7 responseViewId:responseViewId responseMode:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentInstrumentationTurnContext]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 turnIdentifier]);

    [v10 emitWithTurnIdentifier:v13];
    goto LABEL_5;
  }

  if (-[NSString length](self->_responseViewId, "length")) {
    goto LABEL_4;
  }
LABEL_5:
}

- (int64_t)_viewModeFromPresentationOptions:(int64_t)a3
{
  else {
    return qword_100082A80[a3 - 1];
  }
}

- (void)_setConversations:(id)a3
{
}

- (void)_setPresentedConversationItemRevisionIdentifiers:(id)a3
{
}

- (void)_setDelayedConversationItemRevisionIdentifiers:(id)a3
{
}

- (void)_setAceCommandRecords:(id)a3
{
}

- (SiriUIPresentation)presentation
{
  return self->_presentation;
}

- (AFUISiriSession)_session
{
  return self->_session;
}

- (SRPreferences)_preferences
{
  return self->_preferences;
}

- (CGRect)_statusBarFrame
{
  double x = self->_statusBarFrame.origin.x;
  double y = self->_statusBarFrame.origin.y;
  double width = self->_statusBarFrame.size.width;
  double height = self->_statusBarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_statusViewHeight
{
  return self->_statusViewHeight;
}

- (double)_bottomContentInset
{
  return self->_bottomContentInset;
}

- (CGRect)_systemContentFrame
{
  double x = self->_systemContentFrame.origin.x;
  double y = self->_systemContentFrame.origin.y;
  double width = self->_systemContentFrame.size.width;
  double height = self->_systemContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (AFConversationStore)_conversationStore
{
  return self->_conversationStore;
}

- (NSMutableArray)_conversations
{
  return self->_conversations;
}

- (AFUISiriLanguage)_language
{
  return self->_language;
}

- (void)_setVoicemailPlayer:(id)a3
{
}

- (void)_setAudioMessagePlayer:(id)a3
{
}

- (SRUIFAceCommandRecords)_aceCommandRecords
{
  return self->_aceCommandRecords;
}

- (void)setCompletedCommandAppPunchOutIds:(id)a3
{
}

- (SASRequestOptions)_requestOptions
{
  return self->_requestOptions;
}

- (NSString)_currentAVRecordRoute
{
  return self->_currentAVRecordRoute;
}

- (void)_setCurrentAVRecordRoute:(id)a3
{
}

- (int64_t)_siriState
{
  return self->_siriState;
}

- (void)_setSiriState:(int64_t)a3
{
  self->_int64_t siriState = a3;
}

- (NSTimer)_idleTimer
{
  return self->__idleTimer;
}

- (void)_setIdleTimer:(id)a3
{
}

- (BOOL)_isIdleTimerEnabled
{
  return self->__idleTimerEnabled;
}

- (void)_setIdleTimerEnabled:(BOOL)a3
{
  self->__idleTimerEnabled = a3;
}

- (BOOL)_isAcousticIdAllowed
{
  return self->_acousticIdAllowed;
}

- (void)_setAcousticIdAllowed:(BOOL)a3
{
  self->_acousticIdAllowed = a3;
}

- (unint64_t)_wasSiriIdleAndQuiet
{
  return self->_wasSiriIdleAndQuiet;
}

- (void)_setWasSiriIdleAndQuiet:(unint64_t)a3
{
  self->_wasSiriIdleAndQuiet = a3;
}

- (AFManagedStorageConnection)_domainObjectStorageConnection
{
  return self->_domainObjectStorageConnection;
}

- (BOOL)_isWaitingForStartRequest
{
  return self->_waitingForStartRequest;
}

- (void)_setWaitingForStartRequest:(BOOL)a3
{
  self->_waitingForStartRequest = a3;
}

- (BOOL)_isRequestActive
{
  return self->_requestActive;
}

- (void)_setRequestActive:(BOOL)a3
{
  self->_BOOL requestActive = a3;
}

- (BOOL)_isUserUtteranceTapToEditInProgress
{
  return self->_userUtteranceTapToEditInProgress;
}

- (void)_setUserUtteranceTapToEditInProgress:(BOOL)a3
{
  self->_userUtteranceTapToEditInProgress = a3;
}

- (NSMutableArray)_repeatablePhrases
{
  return self->_repeatablePhrases;
}

- (void)_setRepeatablePhrases:(id)a3
{
}

- (BOOL)_listenAfterSpeakingForRepeatable
{
  return self->_listenAfterSpeakingForRepeatable;
}

- (void)_setListenAfterSpeakingForRepeatable:(BOOL)a3
{
  self->_listenAfterSpeakingForRepeatable = a3;
}

- (BOOL)_isStartRequestAceCommandSent
{
  return self->_startRequestAceCommandSent;
}

- (void)_setStartRequestAceCommandSent:(BOOL)a3
{
  self->_startRequestAceCommandSent = a3;
}

- (BOOL)_isAudioPlayerPlaying
{
  return self->_audioPlayerIsPlaying;
}

- (void)_setAudioPlayerIsPlaying:(BOOL)a3
{
  self->_audioPlayerIsPlaying = a3;
}

- (BOOL)_isKeyboardLoweredAfterResponse
{
  return self->_keyboardLoweredAfterResponse;
}

- (void)_setKeyboardLoweredAfterResponse:(BOOL)a3
{
  self->_keyboardLoweredAfterResponse = a3;
}

- (NSString)_utteranceToSpeakAfterClearScreenCommand
{
  return self->_utteranceToSpeakAfterClearScreenCommand;
}

- (void)_setUtteranceToSpeakAfterClearScreenCommand:(id)a3
{
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
}

- (SAUISayIt)previousSayItCommand
{
  return self->_previousSayItCommand;
}

- (void)setPreviousSayItCommand:(id)a3
{
}

- (BOOL)_listenAfterSpeakingForRequestFinished
{
  return self->_listenAfterSpeakingForRequestFinished;
}

- (BOOL)_isReadingBulletinContentInCarPlayOutsideOfSiriSession
{
  return self->_readingBulletinContentInCarPlayOutsideOfSiriSession;
}

- (void)_setReadingBulletinContentInCarPlayOutsideOfSiriSession:(BOOL)a3
{
  self->_readingBulletinContentInCarPlayOutsideOfSiriSession = a3;
}

- (BOOL)_reflectionDialogHasBeenPlayed
{
  return self->_reflectionDialogHasBeenPlayed;
}

- (void)_reflectionDialogHasBeenPlayed:(BOOL)a3
{
  self->_reflectionDialogHasBeenPlayed = a3;
}

- (BOOL)_shouldShowDownloadAssetsNotificationPrompt
{
  return self->_shouldShowDownloadAssetsNotificationPrompt;
}

- (void)_shouldShowDownloadAssetsNotificationPrompt:(BOOL)a3
{
  self->_shouldShowDownloadAssetsNotificationPrompt = a3;
}

- (void).cxx_destruct
{
}

- (void)runPPTWithOptions:(id)a3
{
  id v8 = a3;
  uint64_t v4 = SUICPPTTestNameKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:SUICPPTTestNameKey]);

  id v6 = v8;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v4]);

    id v6 = v8;
  }
}

- (void)_testDidReceiveAceCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  -[SRSiriViewController _didReceiveAceCommand:completion:](self, "_didReceiveAceCommand:completion:", v6, a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _activeConversation](self, "_activeConversation"));
  [v7 addItemsForAddViewsCommand:v6];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _session](self, "_session"));
  [v8 stopRecordingSpeech];
}

@end