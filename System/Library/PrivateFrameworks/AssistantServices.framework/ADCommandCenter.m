@interface ADCommandCenter
+ (id)sharedCommandCenter;
+ (id)sharedQueue;
+ (int)_orchBluetoothStateEnumFromBluetoothState:(int64_t)a3;
+ (int64_t)_fetchBluetoothState;
- (ADCommandCenter)init;
- (ADCommandCenterClient)_currentClient;
- (ADCommandCenterCurrentRequest)_currentRequest;
- (ADCommandCenterRequestDelegate)_requestDelegate;
- (ADCommandCenterSpeechDelegate)_speechDelegate;
- (ADCommandCenterSpeechDelegate)_speechFileDelegate;
- (ADRequestDispatcherService)_requestDispatcherService;
- (ADResponseModeProvider)_responseModeProvider;
- (ADSpeechManager)_speechManager;
- (ADSyncControllerService)_syncControllerService;
- (AFBridgeConnectionListener)_uiBridgeServiceListener;
- (AFInstanceContext)_instanceContext;
- (BOOL)_acousticId_hasCommandForRefId:(id)a3;
- (BOOL)_areRequiredAssetsMissing;
- (BOOL)_assetsCheckRan;
- (BOOL)_callIsLikely;
- (BOOL)_context_bundleIdHasSupportForCarPlayRequiredMessageIntents:(id)a3;
- (BOOL)_deviceIsLocked;
- (BOOL)_didAlreadyAcceptResultCandidate:(id)a3;
- (BOOL)_hasActiveClientOrSyncingOrInCall;
- (BOOL)_hasCompletionForCommandId:(id)a3;
- (BOOL)_hasIncomingCall;
- (BOOL)_hasOutstandingAnchorsRequestId:(id)a3;
- (BOOL)_hasOutstandingRequestId:(id)a3;
- (BOOL)_hasOutstandingRequests;
- (BOOL)_hasOutstandingSyncChunkId:(id)a3;
- (BOOL)_hasRemoteExecutionContextForExecutionID:(id)a3;
- (BOOL)_hasRemoteExecutionContextForRequestID:(id)a3;
- (BOOL)_hasRootExecutionContextForRequestID:(id)a3;
- (BOOL)_isClientBoundCommand:(id)a3;
- (BOOL)_isFauxPeer:(id)a3;
- (BOOL)_isHeadGestureRecognitionAvailable;
- (BOOL)_isInCall;
- (BOOL)_isInCarDNDMode;
- (BOOL)_isInStarkMode;
- (BOOL)_isRelevantCancellationCommand:(id)a3;
- (BOOL)_isRequestDelaying;
- (BOOL)_isServerBoundCommand:(id)a3;
- (BOOL)_isTimeoutSuspended;
- (BOOL)_isWatchAuthenticated;
- (BOOL)_metrics_isAssistantOrDictationEnabled;
- (BOOL)_metrics_isSystemIdle;
- (BOOL)_outputVoice_setOutputVoice:(id)a3;
- (BOOL)_peerIsPairedPhone:(id)a3;
- (BOOL)_peerIsPairedWatch:(id)a3;
- (BOOL)_refIdIsSpeechStart:(id)a3;
- (BOOL)_remoteExecute_shouldSendCommandToPrimaryUser:(id)a3;
- (BOOL)_shouldDumpSiriOnDeviceAnalyticsBiomeStreams;
- (BOOL)_shouldIgnoreCommand:(id)a3 executionContext:(id)a4;
- (BOOL)_shouldImmediatelyDismissSiriDueToMissingRequiredAssets;
- (BOOL)_shouldRetryForError:(id)a3;
- (BOOL)_siriFullUODSupported;
- (BOOL)_siriHybridUODSupported;
- (BOOL)_siriSAESupported;
- (BOOL)_siriUODSupported;
- (BOOL)_speechDelegateHasReceivedPartialResult;
- (BOOL)_syncChunkWindowFull;
- (BOOL)_syncController_hasCommandForRefId:(id)a3;
- (BOOL)_sync_hasCommandForRefId:(id)a3;
- (BOOL)_sync_isRequestBlockingSync;
- (BOOL)_sync_isRequestBlockingSyncVerification;
- (BOOL)_sync_isSyncing;
- (BOOL)assistantSessionManager:(id)a3 shouldLogVisibleRequestFailureForError:(id)a4;
- (BOOL)assistantSessionManagerShouldAttemptRetry:(id)a3;
- (BOOL)canLogWithSpeechManager:(id)a3;
- (BOOL)isDeviceLocked;
- (BOOL)isDeviceShowingLockScreen;
- (BOOL)isHeadGestureRecognitionAvailable;
- (BOOL)isInCarDNDMode;
- (BOOL)isInStarkMode;
- (BOOL)isStereoPairLeader;
- (BOOL)isTimeoutSuspended;
- (NSDictionary)rootExecutionContexts;
- (NSMapTable)_clientBoundCommandLookup;
- (NSMapTable)_serverBoundCommandLookup;
- (NSString)_selectedSharedUserID;
- (OS_dispatch_queue)_queue;
- (SABaseCommand)_lastRequest;
- (id)_account;
- (id)_accounts;
- (id)_acousticIDHelper;
- (id)_activeAccountIdentifier;
- (id)_allAnchorsFromRequest:(id)a3 andResponse:(id)a4;
- (id)_appMetaDataForAppProxy:(id)a3 clientIdentifier:(id)a4 syncSlots:(id)a5;
- (id)_appMetaDataListFromVocabSources:(id)a3 appIdentifyingInfoList:(id)a4;
- (id)_approximatePreviousTTSInterval:(id)a3;
- (id)_assetManager;
- (id)_bargeInModes;
- (id)_beginRemoteExecutionContextForCommand:(id)a3 fromPeer:(id)a4 withRemoteExecutionInfo:(id)a5;
- (id)_contextManager;
- (id)_createDefaultRequestContextData:(BOOL)a3;
- (id)_createMuxStartAsrOnServerRequestWithSpeechRequest:(id)a3;
- (id)_createStartServerRequestWithStartRequest:(id)a3;
- (id)_deviceRouter;
- (id)_deviceSyncCoordinator;
- (id)_diagnosticsManager;
- (id)_directInvocationContextForSpeechRequestOptions:(id)a3 textToSpeechEnabled:(BOOL)a4;
- (id)_domainObjectCache;
- (id)_dumpAssistantState;
- (id)_dumpOnDeviceAnalyticsBiomeStream:(id)a3;
- (id)_dumpSiriOnDeviceAnalyticsBiomeStreams;
- (id)_emptyVerificationSyncAnchorForKey:(id)a3 appBundleID:(id)a4 syncSlotName:(id)a5;
- (id)_executionContextMatchingExecutionInfo:(id)a3 fallbackRequestID:(id)a4;
- (id)_executionDevicesForLocalRequestWithId:(id)a3;
- (id)_fetchComputedModeAndUpdateRequestDelegate;
- (id)_fetchUODStatusForLanguageCode:(id)a3;
- (id)_firstChanceServiceForCommand:(id)a3;
- (id)_flowServiceListener;
- (id)_getEventsDataForStream:(id)a3 numEvents:(int64_t *)a4;
- (id)_getPreheatOptionsForHorseman;
- (id)_handleConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10;
- (id)_handledCommandIdsForRequestId:(id)a3;
- (id)_headphonesAnnouncementRequestCapabilityManager;
- (id)_hubAccount;
- (id)_languageModelForSpeechRequest:(id)a3;
- (id)_locationManager;
- (id)_managedStoreObjectForKey:(id)a3;
- (id)_motionManager;
- (id)_offlineMetricsManager;
- (id)_powerAssertionManager;
- (id)_remoteExecute_primaryUserDevicesWithTypes:(unint64_t)a3;
- (id)_remoteExecutionContextForExecutionID:(id)a3;
- (id)_remoteRequestHelper;
- (id)_remoteSpeechRequestHelper;
- (id)_requestDelayManager;
- (id)_requestDispatcherSessionConfiguration;
- (id)_restrictedCommands;
- (id)_resultObjectCache;
- (id)_rootExecutionContextForRequestID:(id)a3;
- (id)_sendContextPromiseForTypes:(int64_t)a3;
- (id)_sendContextPromiseForTypes:(int64_t)a3 withAceId:(id)a4;
- (id)_serviceManager;
- (id)_sessionManager;
- (id)_sharedDataService;
- (id)_sharedMultiUserService;
- (id)_speechCapturingContext;
- (id)_speechCapturingContextForSessionUUID:(id)a3;
- (id)_startServerRequestWithSpeechRequest:(id)a3 recordingContext:(id)a4 recordingInfo:(id)a5;
- (id)_startServerRequestWithStartRequest:(id)a3 requestInfo:(id)a4;
- (id)_syncManager;
- (id)_syncRecordForKey:(id)a3 fromDomainObject:(id)a4 appMeta:(id)a5;
- (id)_testAgent;
- (id)_updateUODAssetStatusForLanguage:(id)a3;
- (id)acquireShutdownAssertion;
- (id)assistantSessionManagerCommandsToRestoreStateOnNewConnection:(id)a3;
- (id)dumpAssistantState;
- (id)getAssistantIdentifier;
- (int)getHomeDevicesAudioTopology;
- (int64_t)_context_deviceState;
- (unint64_t)callState;
- (unsigned)_sharedVoiceAudioSessionID;
- (void)UIService:(id)a3 didPresentUIResponseForCommand:(id)a4 withExecutionInfo:(id)a5;
- (void)UIService:(id)a3 executeHandler:(id)a4 forCommand:(id)a5;
- (void)_acceptResultCandidate:(id)a3 isMitigated:(BOOL)a4 featuresToLog:(id)a5 completion:(id)a6;
- (void)_accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4;
- (void)_acousticId_clearPartialResultTimer;
- (void)_acousticId_commandFailed:(id)a3;
- (void)_acousticId_handleFingerprint:(id)a3 duration:(double)a4;
- (void)_acousticId_musicWasDetected;
- (void)_acousticId_reset;
- (void)_acousticId_sessionFailed;
- (void)_acousticId_speechCaptureCompleted;
- (void)_acousticId_startSessionForSpeechRequest:(id)a3;
- (void)_acousticId_startSessionWithContext:(id)a3;
- (void)_addCompletion:(id)a3 forCommand:(id)a4 forKey:(id)a5;
- (void)_addExecutionDevice:(id)a3 forCommandExecutionContext:(id)a4;
- (void)_addHandledCommandId:(id)a3 forRequestId:(id)a4;
- (void)_addNetworkActivityTracingForLabel:(int64_t)a3 start:(BOOL)a4 withCompletionReason:(int64_t)a5 andError:(id)a6;
- (void)_addOutstandingAnchorsRequestId:(id)a3;
- (void)_addOutstandingRequestId:(id)a3 forReason:(id)a4;
- (void)_addOutstandingSyncChunkId:(id)a3;
- (void)_addPostCommandHandlingBlock:(id)a3 forCommandId:(id)a4 requestId:(id)a5;
- (void)_addRecordedSpeechSampleData:(id)a3 delegate:(id)a4;
- (void)_adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)_amosSADomainObjectCancel:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectCommit:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectCreate:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectDelete:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectPunchOut:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectRetrieve:(id)a3 completion:(id)a4;
- (void)_amosSADomainObjectUpdate:(id)a3 completion:(id)a4;
- (void)_attachPersonaIdIfNeeded:(id)a3 aceCommand:(id)a4;
- (void)_broadcastCommand:(id)a3;
- (void)_cancelCallKeepAlive;
- (void)_cancelCrossDeviceRequestOperationsForLocalRequestWithId:(id)a3;
- (void)_cancelCrossDeviceRequestOperationsForRemoteRequest;
- (void)_cancelCurrentRequestForReason:(int64_t)a3 andError:(id)a4 successorInfo:(id)a5;
- (void)_cancelLocalRecognitionIfRequired;
- (void)_cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5;
- (void)_cancelSessionManager;
- (void)_cancelSpeechForDelegate:(id)a3;
- (void)_cleanUpForFailureCommandWithRefId:(id)a3;
- (void)_clearAccount;
- (void)_clearAllExecutionDevices;
- (void)_clearContext;
- (void)_clearContextAndStartAssistantSession;
- (void)_clearContextAndStartDictationSessionWithLanguageCode:(id)a3 dictationOptions:(id)a4;
- (void)_clearQueuedLanguageCode;
- (void)_clearQueuedOutputVoice;
- (void)_clearRequestDelegateState;
- (void)_clearSpeechDelegateState;
- (void)_cloudSyncPreferenceDidChange;
- (void)_completeNotificationSearch:(id)a3 bulletins:(id)a4 completion:(id)a5;
- (void)_completeRequestForCurrentDelegate:(BOOL)a3 error:(id)a4;
- (void)_context_acknowledgeBulletinForObject:(id)a3;
- (void)_context_clearContextWithClearSiriKitContext:(BOOL)a3;
- (void)_context_fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)_context_fetchApplicationContextForApplicationInfos:(id)a3 completion:(id)a4;
- (void)_context_reset;
- (void)_context_rollbackClearContext;
- (void)_context_setAlertContextDirty;
- (void)_context_setApplicationContext:(id)a3;
- (void)_context_setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)_context_setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)_context_setSTApplicationContext:(id)a3;
- (void)_context_updateContext;
- (void)_context_willSetApplicationContextWithRefId:(id)a3;
- (void)_createAssistantLocallyIfNeeded:(BOOL)a3;
- (void)_createRootExecutionContextForRequestID:(id)a3;
- (void)_deleteAccountWithIdentifier:(id)a3;
- (void)_deleteSiriAudioDataOnDevice;
- (void)_deleteSiriHistoryOnDeviceOnDestroyAssistant;
- (void)_deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4;
- (void)_destroyActiveAccount;
- (void)_destroyRootExecutionContextForRequestID:(id)a3;
- (void)_dictationSessionDidComplete;
- (void)_didLaunchAppForRequestWithIdentifier:(id)a3;
- (void)_dispatchAndRemovePostCommandHandlingBlocksForCommandId:(id)a3 requestId:(id)a4;
- (void)_downloadMorphunAssets:(id)a3;
- (void)_emitAudioTopologyForRequestId:(id)a3;
- (void)_emitDeviceDynamicContextForRequest:(id)a3;
- (void)_emitTriggerWithCachingForUUID:(id)a3 namespace:(id)a4 requestID:(id)a5;
- (void)_endRemoteExecutionContext:(id)a3;
- (void)_endSessionForDelegate:(id)a3;
- (void)_endSpeechRequestForCommand:(id)a3 withError:(id)a4 suppressAlert:(BOOL)a5 secureOfflineOnlyDictation:(BOOL)a6;
- (void)_ensureBackgroundContextSentToServer;
- (void)_fetchAllAppSourcesForSyncingWithCustomVocabInfo:(id)a3 completion:(id)a4;
- (void)_fetchAndSendApplicationContextForApplicationInfos:(id)a3 fetchedOrderedContextDictionaries:(id)a4 applicationContexts:(id)a5 refID:(id)a6;
- (void)_fetchHubAccountInBackground;
- (void)_fetchStarkDeviceLockedStateWithCompletion:(id)a3;
- (void)_fetchSupportedLanguagesWithCompletion:(id)a3;
- (void)_finishVerificationWithKeys:(id)a3;
- (void)_firstChanceServiceChangeIdFrom:(id)a3 to:(id)a4;
- (void)_forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)_forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)_getDictationLanguages:(id)a3 options:(id)a4 speechOptions:(id)a5 delegate:(id)a6 completion:(id)a7;
- (void)_getOrderedContextDictionaryForTransformedAFApplicationContext:(id)a3 completion:(id)a4;
- (void)_getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4;
- (void)_getTransformedApplicationContextForContext:(id)a3 completion:(id)a4;
- (void)_handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7;
- (void)_handleBareRequestCompleted:(id)a3;
- (void)_handleClientReply:(id)a3 error:(id)a4 forSessionCommand:(id)a5;
- (void)_handleCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_handleCommandAndClientReply:(id)a3 executionContext:(id)a4 commandCompletion:(id)a5;
- (void)_handleCommandInAMOS:(id)a3 completion:(id)a4;
- (void)_handleCommandResponse:(id)a3 error:(id)a4 forCommand:(id)a5 executionContext:(id)a6 completion:(id)a7;
- (void)_handleExternalActivationRequest:(id)a3 completion:(id)a4;
- (void)_handleExtractSpeechDataCompleted:(id)a3 inResponseTo:(id)a4 completion:(id)a5;
- (void)_handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6;
- (void)_handleGenericConcreteAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6;
- (void)_handleIgnoredCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5;
- (void)_handleLocalSpeechRecognitionForOfflineSupport:(id)a3 logText:(BOOL)a4;
- (void)_handleNextCallbacksForReply:(id)a3 forCommand:(id)a4 forRequestId:(id)a5 withExecutionContext:(id)a6;
- (void)_handlePartialSpeechRecognitionForElapsedTime:(double)a3 WithDelegateBlock:(id)a4;
- (void)_handleQuickStopCommandRoutedFromRemote:(id)a3 completion:(id)a4;
- (void)_handleRemoteSpeechRequest:(id)a3 completion:(id)a4;
- (void)_handleSADOCommandIfServiceDoesNotUseAMOS:(id)a3 allowInterposing:(BOOL)a4 completion:(id)a5;
- (void)_handleSendCommands:(id)a3 forRequestDelegate:(id)a4 completion:(id)a5;
- (void)_handleServiceCommand:(id)a3 afterMyriadDecision:(BOOL)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_handleServiceCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_handleSpeechRecognizedWithDelegateBlock:(id)a3;
- (void)_handleSuspendClientEndpointer:(id)a3;
- (void)_handleValidatedSyncGetAnchorsResponse:(id)a3 forGetAnchors:(id)a4;
- (void)_invokeAllCompletionsWithError:(id)a3;
- (void)_invokeCompletionForCommand:(id)a3;
- (void)_listInstalledServicesWithCompletion:(id)a3;
- (void)_logAudioTopologyForRequestId:(id)a3;
- (void)_logCrossDeviceCommandEndedMetricsForCommand:(id)a3 targetProductType:(id)a4 targetDeviceID:(id)a5 targetDeviceContextIdentifier:(id)a6 targetProximity:(int64_t)a7 coreAnalyticsEvent:(id)a8 response:(id)a9 error:(id)a10;
- (void)_logExecuteOnRemoteRequestForRequestId:(id)a3 turnId:(id)a4 event:(int64_t)a5;
- (void)_metrics_awdRequestEnd;
- (void)_metrics_destroyAllMetrics;
- (void)_metrics_destroyAllMetricsIfNeeded;
- (void)_metrics_logSpeechRecognized:(id)a3 resultId:(id)a4;
- (void)_metrics_markLocalEagerRecognitionCandidate:(id)a3;
- (void)_metrics_markLocalPartialSpeechRecognition;
- (void)_metrics_markLocalSpeechCompletedWithStatistics:(id)a3;
- (void)_metrics_markLocalSpeechPackage:(id)a3 interactionId:(id)a4 optedIn:(BOOL)a5;
- (void)_metrics_markLocalSpeechStartedWithContext:(id)a3;
- (void)_metrics_processEventRecordsFromStore:(id)a3 batch:(id)a4 deliveryStream:(unint64_t)a5 eventStreamUID:(id)a6 streamSpeechId:(id)a7 untilLimit:(double)a8 uploadRecords:(id)a9 completion:(id)a10;
- (void)_metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4;
- (void)_metrics_recordCancellationMetrics;
- (void)_metrics_recordFailureMetricsForError:(id)a3;
- (void)_metrics_recordNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4;
- (void)_metrics_recordSNNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4;
- (void)_metrics_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4;
- (void)_metrics_sendMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 scheduledActivity:(BOOL)a7 completion:(id)a8;
- (void)_metrics_sendNextAnalyticsEventStreamToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 prioritizedEventStreamUID:(id)a6 deliveryStreamContinuations:(id *)a7 scheduledActivity:(BOOL)a8 completion:(id)a9;
- (void)_metrics_sendNextOfflineMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 completion:(id)a6;
- (void)_notifyUSTForAceCommand:(id)a3;
- (void)_notifyUSTForRequestCompleted:(id)a3;
- (void)_notifyUSTForRequestStarted:(id)a3;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_pauseRecognition;
- (void)_performCallbacksForCommand:(id)a3 reply:(id)a4 executionContext:(id)a5 error:(id)a6;
- (void)_postPersonalDomainActivityNotificationWithBody:(id)a3 command:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_postUpdatePersonalRequestSettingsNotification:(id)a3 forLocalizationKey:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_postWatchNotificationWithContext:(id)a3 withError:(id)a4;
- (void)_preheatAllServices;
- (void)_preheatCallbacksForCommand:(id)a3;
- (void)_preheatViaRequestDispatcher;
- (void)_preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5;
- (void)_prepareAndStartSyncVerification;
- (void)_prepareForAppLaunchForRequest:(id)a3;
- (void)_prepareForPhoneCall;
- (void)_processQueuedLanguageCode;
- (void)_processQueuedLanguageCodeAndOutputVoice;
- (void)_processQueuedOutputVoice;
- (void)_reallyCommitOrSaveMetrics:(id)a3;
- (void)_reallyEndSessionForDelegate:(id)a3;
- (void)_reallyHandleNewStartLocalRequest:(id)a3;
- (void)_reallyHandleNewStartRequest:(id)a3 info:(id)a4;
- (void)_refreshAssistantValidation;
- (void)_registerDomainSignalServiceWithServiceManager:(id)a3;
- (void)_registerNanoServicesWithServiceManager:(id)a3;
- (void)_registerOTTServicesWithServiceManager:(id)a3;
- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onDeviceForAssistantId:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8;
- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onDeviceForAssistantId:(id)a4 allowFallbackOnAWDL:(BOOL)a5 executionContext:(id)a6 completion:(id)a7;
- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onSpecifiedDeviceTypes:(unint64_t)a4 preferredMessagingOption:(unint64_t)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
- (void)_removeAllHandledCommandIds;
- (void)_removeAllPostCommandHandlingBlocks;
- (void)_removeAllSpeechCapturingContexts;
- (void)_removeDelegate:(id)a3;
- (void)_removeExecutionDevicesForLocalRequestWithId:(id)a3;
- (void)_removeFirstChanceServiceForAceId:(id)a3;
- (void)_removeHandledCommandIdsForRequestId:(id)a3;
- (void)_removeOutstandingAnchorsRequestId:(id)a3;
- (void)_removeOutstandingRequestId:(id)a3 forReason:(id)a4;
- (void)_removeOutstandingSyncChunkId:(id)a3;
- (void)_removePostCommandHandlingBlocksForRequestId:(id)a3;
- (void)_replaceRequestDelegate:(id)a3 reason:(int64_t)a4;
- (void)_replaceRequestDelegate:(id)a3 withInfo:(id)a4 reason:(int64_t)a5 andCompletion:(id)a6;
- (void)_replaceSpeechDelegateWhenReady:(id)a3 suppressAlert:(BOOL)a4 withCompletion:(id)a5;
- (void)_replaceSpeechDelegateWhenReady:(id)a3 waitForRecordingToFinish:(BOOL)a4 suppressAlert:(BOOL)a5 withCompletion:(id)a6;
- (void)_requestAnchorsForKeys:(id)a3 appSources:(id)a4 watchAppSources:(id)a5 forceReset:(BOOL)a6 includeAllKnownAnchors:(BOOL)a7 reasons:(id)a8;
- (void)_requestBarrier:(id)a3;
- (void)_requestBarrierIfNecessary:(id)a3;
- (void)_requestDidEnd;
- (void)_requestWillStartWithInfo:(id)a3 showNetworkActivityIndicator:(BOOL)a4;
- (void)_rescheduleValidationRefresh;
- (void)_resetPeerAccountSettingsWithSharedData:(id)a3;
- (void)_resetServices;
- (void)_resetSyncVerification;
- (void)_resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)_rollbackRequestForDelegate:(id)a3;
- (void)_runMaintenanceForServices:(id)a3 completion:(id)a4;
- (void)_saAIRequestSearch:(id)a3 completion:(id)a4;
- (void)_saAIRetrySearch:(id)a3 completion:(id)a4;
- (void)_saAISearchCompleted:(id)a3 completion:(id)a4;
- (void)_saAcknowledgeAlert:(id)a3 completion:(id)a4;
- (void)_saAddResultObjects:(id)a3 completion:(id)a4;
- (void)_saAssistantDestroyed:(id)a3 completion:(id)a4;
- (void)_saCancelCrossDeviceRequest:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saCancelSucceeded:(id)a3 completion:(id)a4;
- (void)_saClientSetupInfo:(id)a3 completion:(id)a4;
- (void)_saCommandFailed:(id)a3 completion:(id)a4;
- (void)_saCommandIgnored:(id)a3 completion:(id)a4;
- (void)_saDeviceConfiguration:(id)a3 completion:(id)a4;
- (void)_saDeviceMyriadConfiguration:(id)a3 completion:(id)a4;
- (void)_saDismissRemoteAnnouncement:(id)a3 completion:(id)a4;
- (void)_saDomainObjectCancel:(id)a3 completion:(id)a4;
- (void)_saDomainObjectCommit:(id)a3 completion:(id)a4;
- (void)_saDomainObjectCreate:(id)a3 completion:(id)a4;
- (void)_saDomainObjectDelete:(id)a3 completion:(id)a4;
- (void)_saDomainObjectPunchOut:(id)a3 completion:(id)a4;
- (void)_saDomainObjectRetrieve:(id)a3 completion:(id)a4;
- (void)_saDomainObjectUpdate:(id)a3 completion:(id)a4;
- (void)_saExecuteCallbacks:(id)a3 completion:(id)a4;
- (void)_saExecuteOnRemoteRequest:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saGetAssistantData:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saGetRequestOrigin:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saInitiateHandoffOnCompanion:(id)a3 completion:(id)a4;
- (void)_saLogNumericEvent:(id)a3 completion:(id)a4;
- (void)_saLogSignatureWithABC:(id)a3 completion:(id)a4;
- (void)_saLogStringEvent:(id)a3 completion:(id)a4;
- (void)_saNotificationSearch:(id)a3 completion:(id)a4;
- (void)_saPerformDataDetection:(id)a3 completion:(id)a4;
- (void)_saPerformRemoteAnnouncement:(id)a3 completion:(id)a4;
- (void)_saPing:(id)a3 completion:(id)a4;
- (void)_saPostCalendarActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saPostPersonalDomainActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saPostUpdatePersonalRequestSettingsNotification:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saQuickStop:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saReplayRequestFromDMHypothesis:(id)a3 completion:(id)a4;
- (void)_saRequestCompleted:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_saRollbackSucceeded:(id)a3 completion:(id)a4;
- (void)_saSASyncGetCachedSyncAnchors:(id)a3 completion:(id)a4;
- (void)_saSendCommands:(id)a3 completion:(id)a4;
- (void)_saSetClientData:(id)a3 completion:(id)a4;
- (void)_saSetDeviceTTSMuteState:(id)a3 completion:(id)a4;
- (void)_saSetHandoffPayload:(id)a3 completion:(id)a4;
- (void)_saSetLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4;
- (void)_saSetMultilingualDictationConfig:(id)a3 completion:(id)a4;
- (void)_saStartLocalRequest:(id)a3 completion:(id)a4;
- (void)_saStartUIRequest:(id)a3 completion:(id)a4;
- (void)_saStructuredDictationFailure:(id)a3 completion:(id)a4;
- (void)_saStructuredDictationResult:(id)a3 completion:(id)a4;
- (void)_saSyncChunkAccepted:(id)a3 completion:(id)a4;
- (void)_saSyncChunkDenied:(id)a3 completion:(id)a4;
- (void)_saSyncClientVerify:(id)a3 completion:(id)a4;
- (void)_saSyncFinished:(id)a3 completion:(id)a4;
- (void)_saSyncGetAnchors:(id)a3 completion:(id)a4;
- (void)_saSyncGetAnchorsResponse:(id)a3 completion:(id)a4;
- (void)_saSyncServerVerifyResponse:(id)a3 completion:(id)a4;
- (void)_saTTSGetSpeechSynthesisVolume:(id)a3 completion:(id)a4;
- (void)_saTTSSetSpeechSynthesisVolume:(id)a3 completion:(id)a4;
- (void)_saUnhandledObject:(id)a3 completion:(id)a4;
- (void)_saWaitForCommands:(id)a3 completion:(id)a4;
- (void)_sasAbortSpeechRequest:(id)a3 completion:(id)a4;
- (void)_sasClientBoundConfusionNetwork:(id)a3 completion:(id)a4;
- (void)_sasConfirmEndpoint:(id)a3 completion:(id)a4;
- (void)_sasExtractSpeechData:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_sasPronunciationRecognized:(id)a3 completion:(id)a4;
- (void)_sasResultCandidate:(id)a3 completion:(id)a4;
- (void)_sasServerEndpointFeatures:(id)a3 completion:(id)a4;
- (void)_sasSpeechFailure:(id)a3 completion:(id)a4;
- (void)_sasSpeechMultilingualSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_sasSpeechPartialResult:(id)a3 completion:(id)a4;
- (void)_sasSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5;
- (void)_sasSpeechServerEndpointIdentified:(id)a3 completion:(id)a4;
- (void)_sasSuspendClientEndpointer:(id)a3 completion:(id)a4;
- (void)_sasVoiceIdentificationSignal:(id)a3 completion:(id)a4;
- (void)_sasVoiceSearchFinalResult:(id)a3 completion:(id)a4;
- (void)_sasVoiceSearchPartialResult:(id)a3 completion:(id)a4;
- (void)_scheduleCallKeepAlive;
- (void)_sendAMOSCommand:(id)a3 domain:(id)a4 toBundleWithIdentifier:(id)a5 completion:(id)a6;
- (void)_sendAMOSCommandToService:(id)a3 responseHandler:(id)a4;
- (void)_sendCancelSpeechForCommand:(id)a3;
- (void)_sendCommandFailedForCommand:(id)a3 error:(id)a4;
- (void)_sendCommandFailedForCommand:(id)a3 reason:(id)a4;
- (void)_sendCommandToServer:(id)a3;
- (void)_sendCommandToServer:(id)a3 completion:(id)a4;
- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4;
- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4 completion:(id)a5;
- (void)_sendContextAndRestrictionsForSpeechRequestWithInfo:(id)a3;
- (void)_sendEnableServerEndpointerCommandWithRefID:(id)a3;
- (void)_sendGizmoSharedDataIfNeeded;
- (void)_sendLocationIfNeededForRequest;
- (void)_sendMetrics:(id)a3 requiresActiveSession:(BOOL)a4 batch:(id)a5 completion:(id)a6;
- (void)_sendRequestToServer:(id)a3;
- (void)_sendRestrictionsInPreparationForRequest;
- (void)_sendRollbackCommandForCommand:(id)a3;
- (void)_sendServiceCommand:(id)a3 completion:(id)a4;
- (void)_sendSessionObject:(id)a3 opportunistically:(BOOL)a4;
- (void)_sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4;
- (void)_sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)_sendStartSpeechCommandWithSpeechManager:(id)a3 info:(id)a4 context:(id)a5;
- (void)_sendSyncFinishedAndReferenceCurrentSyncPromise:(BOOL)a3;
- (void)_sendWillStopRecordingForCommand:(id)a3;
- (void)_sessionDidFailWithError:(id)a3;
- (void)_setActiveAccountIdentifier:(id)a3;
- (void)_setAlertContext;
- (void)_setBackgroundContext;
- (void)_setCallIsLikely:(BOOL)a3;
- (void)_setCarDNDRestriction:(BOOL)a3;
- (void)_setConfiguration:(id)a3 forClient:(id)a4;
- (void)_setCurrentRequest:(id)a3;
- (void)_setCurrentRequestWithCommand:(id)a3;
- (void)_setCurrentRequestWithRequestId:(id)a3;
- (void)_setFirstChanceService:(id)a3 forAceId:(id)a4;
- (void)_setHasIncomingCall:(BOOL)a3;
- (void)_setHeadGestureRecognitionAvailability:(BOOL)a3;
- (void)_setHeadphonesAuthenticated:(BOOL)a3;
- (void)_setIsInCall:(BOOL)a3;
- (void)_setIsTimeoutSuspended:(BOOL)a3;
- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4;
- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5;
- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5 withCompletion:(id)a6;
- (void)_setLanguageCodeIfNeeded;
- (void)_setLastRequest:(id)a3;
- (void)_setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4;
- (void)_setManagedStoreObject:(id)a3 forKey:(id)a4;
- (void)_setModesConfiguration:(id)a3;
- (void)_setRequestDispatcherService:(id)a3;
- (void)_setResponseModeProvider:(id)a3;
- (void)_setRestrictedAppContext;
- (void)_setSiriFullUODSupported:(BOOL)a3;
- (void)_setSiriHybridUODSupported:(BOOL)a3;
- (void)_setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6;
- (void)_setSiriSAESupported:(BOOL)a3;
- (void)_setSiriUODSupported:(BOOL)a3;
- (void)_setSpeechCapturingContext:(id)a3;
- (void)_setSpeechRecognizedContext:(id)a3;
- (void)_setStarkRestriction:(BOOL)a3;
- (void)_setSupportsCarPlayVehicleDataRestriction:(BOOL)a3;
- (void)_setSyncContext;
- (void)_setUIService:(id)a3;
- (void)_setWatchAuthenticated:(BOOL)a3;
- (void)_setupUIBridgeServiceListener;
- (void)_shutdownAfterDelay:(double)a3;
- (void)_shutdownSessionWhenIdle;
- (void)_signalUSTTestRequestWithStartRequest:(id)a3 requestInfo:(id)a4;
- (void)_speechCaptureCompleted;
- (void)_startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5;
- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7;
- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8;
- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8;
- (void)_startLanguageDetectionWaitTimer;
- (void)_startLocalRequest:(id)a3 withRequestInfo:(id)a4 forDelegate:(id)a5 suppressCancelationAlertIfCapturingSpeech:(BOOL)a6 completion:(id)a7;
- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4;
- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4 withInfo:(id)a5 options:(id)a6 suppressAlert:(BOOL)a7 completion:(id)a8;
- (void)_startObservingCallState;
- (void)_startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7;
- (void)_startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8;
- (void)_startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 withContext:(id)a5 completion:(id)a6;
- (void)_startRequest:(id)a3 withDelegate:(id)a4;
- (void)_startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5;
- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5;
- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)_startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5 completion:(id)a6;
- (void)_startUpdatingMotionActivity;
- (void)_stopLanguageDetectionWaitTimerIfNeeded;
- (void)_stopObservingCallStateWithCompletion:(id)a3;
- (void)_stopSpeechWithOptions:(id)a3 forDelegate:(id)a4;
- (void)_stopUpdatingMotionActivity;
- (void)_storeExtractedSpeechLocally:(id)a3;
- (void)_sync_assistantLoadedSyncRequest:(BOOL)a3;
- (void)_sync_commandFailed:(id)a3;
- (void)_sync_commandIgnored:(id)a3;
- (void)_sync_continueIfConditionsMet;
- (void)_sync_continueVerificationIfConditionsMet;
- (void)_sync_reset;
- (void)_sync_setSyncDelegate:(id)a3;
- (void)_sync_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4;
- (void)_sync_syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5 forSyncPromise:(id)a6;
- (void)_sync_syncIfNeeded;
- (void)_telephonyRequestCompleted;
- (void)_triggerABCforType:(id)a3 subType:(id)a4 context:(id)a5;
- (void)_trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7;
- (void)_trySendingShowRequestHandlingStatusForAsrOnDevice:(BOOL)a3 startSpeechRequestId:(id)a4;
- (void)_updateAutoDownloadedVoiceAssetsForOutputVoice;
- (void)_updateFlowContext;
- (void)_updateObjectFromService:(id)a3 sadIdentifier:(id)a4 completion:(id)a5;
- (void)_updateSharedDataFromPeers:(id)a3 completion:(id)a4;
- (void)_updateSharedDataWithPairedPeerData:(id)a3;
- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4;
- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4 allowUpdateInSpeechCompletion:(BOOL)a5;
- (void)_updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
- (void)_writeDataToDisk:(id)a3 withFileName:(id)a4;
- (void)_writeTextToDisk:(id)a3 withFileName:(id)a4;
- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4;
- (void)acousticIDHelper:(id)a3 didCompleteSessionSuccessfully:(BOOL)a4;
- (void)acousticIDHelperDidStartSession:(id)a3;
- (void)adCallStateChangedCallInProcess:(BOOL)a3;
- (void)adCallStateChangedCallIncoming:(BOOL)a3;
- (void)addRecordedSpeechSampleData:(id)a3 delegate:(id)a4;
- (void)addService:(id)a3;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)announceNotificationHandlingStateUpdatedToState:(int64_t)a3;
- (void)appLaunchHandler:(id)a3 didLaunchAppForRequestId:(id)a4;
- (void)areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:(id)a3;
- (void)assistantSessionManager:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5;
- (void)assistantSessionManager:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4;
- (void)assistantSessionManager:(id)a3 didObserverIntermediateError:(id)a4;
- (void)assistantSessionManager:(id)a3 receivedCommand:(id)a4;
- (void)assistantSessionManager:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5;
- (void)assistantSessionManager:(id)a3 willRetryOnError:(id)a4;
- (void)assistantSessionManagerConnectionDidBecomeActive:(id)a3;
- (void)assistantSessionManagerDidCreateAssistant:(id)a3;
- (void)assistantSessionManagerDidDestroyAssistant:(id)a3;
- (void)assistantSessionManagerSessionConnectionDidReset:(id)a3;
- (void)assistantSessionManagerSessionRemoteConnectionDidReset:(id)a3;
- (void)cancelCurrentRequest;
- (void)cancelCurrentRequestForReason:(int64_t)a3;
- (void)cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5;
- (void)cancelSpeechForDelegate:(id)a3;
- (void)clearContext;
- (void)clientConnected:(id)a3;
- (void)clientDisconnected:(id)a3;
- (void)contextManagerDidUpdateBackgroundContext:(id)a3;
- (void)dealloc;
- (void)defrost;
- (void)deleteAccountWithIdentifier:(id)a3;
- (void)destroyActiveAccount;
- (void)dictationRequestDidCompleteRecognitionWithError:(id)a3 secureOfflineOnlyRecognition:(BOOL)a4 sessionUUID:(id)a5 statistics:(id)a6;
- (void)dictationRequestDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4;
- (void)dictationRequestDidRecognizePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dictationRequestDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dictationRequestDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dictationRequestDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5;
- (void)dismissAssistant;
- (void)dismissAssistantWithReason:(int64_t)a3;
- (void)dismissedAllVisibleAssistantUIForReason:(id)a3;
- (void)endSessionForDelegate:(id)a3;
- (void)executeCommand:(id)a3 fromPeer:(id)a4 remoteExecutionInfo:(id)a5 reply:(id)a6;
- (void)extendRequestTimeoutBy:(double)a3 forRequestID:(id)a4;
- (void)failedToLaunchAppWithBundleIdentifier:(id)a3;
- (void)fetchAccounts:(id)a3;
- (void)fetchActiveAccount:(id)a3;
- (void)fetchActiveAccountIdentifier:(id)a3;
- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)fetchBulletinsOnLockScreenForNotificationManager:(id)a3 completion:(id)a4;
- (void)fetchContextForApplicationInfo:(id)a3 completion:(id)a4;
- (void)fetchLastLocationWithCompletion:(id)a3;
- (void)fetchLocationAuthorization:(id)a3;
- (void)fetchManagedStoreObjectForKey:(id)a3 completion:(id)a4;
- (void)fetchSupportedLanguages;
- (void)fetchSupportedLanguagesWithCompletion:(id)a3;
- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)getCrossDeviceContextWithCompletion:(id)a3;
- (void)getCurrentContextSnapshotWithCompletion:(id)a3;
- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getDeviceContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6;
- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4;
- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3;
- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6;
- (void)getSharedDataForPeer:(id)a3;
- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4;
- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7;
- (void)handleCommand:(id)a3 completion:(id)a4;
- (void)handleCommand:(id)a3 withExecutionContextMatchingInfo:(id)a4 completion:(id)a5;
- (void)handleExternalActivationRequest:(id)a3 completion:(id)a4;
- (void)handleFailedStartPlaybackWithDestination:(int64_t)a3 completion:(id)a4;
- (void)handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 targetReplyQueue:(id)a6 reply:(id)a7;
- (void)handleRemoteSpeechRequest:(id)a3 completion:(id)a4;
- (void)handleSpeechRecognized:(id)a3 completion:(id)a4;
- (void)handleSpeechServerEndpointIdentified:(id)a3 completion:(id)a4;
- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4;
- (void)isHeadGestureRecognitionAvailableWithCompletion:(id)a3;
- (void)isInCarDNDModeWithCompletion:(id)a3;
- (void)isWatchAuthenticatedWithCompletion:(id)a3;
- (void)listenForSharedDataFromCloud;
- (void)metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4;
- (void)notificationManagerDidChangeBulletins:(id)a3;
- (void)notifySpeechDetectedIsUndirected;
- (void)openApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5;
- (void)openURL:(id)a3 completion:(id)a4;
- (void)pauseRecognition;
- (void)postMUXTestResultCandidateWithRcId:(id)a3 sharedUserIdToSpeechRecognitionDict:(id)a4 voiceIdConfidenceScores:(id)a5;
- (void)postMUXTestResultSelectedWithRcId:(id)a3 voiceIdConfidenceScores:(id)a4;
- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4;
- (void)postTestResultSelectedWithRcId:(id)a3;
- (void)preheatServicesForDomain:(id)a3;
- (void)preheatWithRecordDeviceIdentifier:(id)a3;
- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5;
- (void)prepareForPhoneCall;
- (void)prepareForShutdown;
- (void)prepareForStartPlaybackWithDestination:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4;
- (void)refreshAssistantValidation;
- (void)releaseShutdownAssertion:(id)a3;
- (void)reloadServiceForNotification:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeService:(id)a3;
- (void)requestBarrier:(id)a3;
- (void)requestBarrierIfNecessary:(id)a3;
- (void)rescheduleValidationRefresh;
- (void)resetHubAccount;
- (void)resumeInterruptedAudioPlaybackIfNeeded;
- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)rollbackClearContext;
- (void)rollbackRequestForDelegate:(id)a3;
- (void)runBootTimeServiceMaintenanceWithCompletion:(id)a3;
- (void)runServiceMaintenanceWithCompletion:(id)a3;
- (void)sanityCheckAutodownloadedAssetsForced:(BOOL)a3;
- (void)selectResultWithResultCandidate:(id)a3 completionHandler:(id)a4;
- (void)sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4;
- (void)sendGizmoData;
- (void)sendMetricsToServerWithTimeout:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 ignoresMetricsSenderDisabledSetting:(BOOL)a7 scheduledActivity:(BOOL)a8 completion:(id)a9;
- (void)sendMultiUserInfoToMUX;
- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)setActiveAccountIdentifier:(id)a3;
- (void)setAlertContextDirty;
- (void)setApplicationContext:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setConfiguration:(id)a3 forClient:(id)a4;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setHeadphonesAuthenticated:(BOOL)a3;
- (void)setLanguageCode:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5;
- (void)setLanguageCode:(id)a3 withCompletion:(id)a4;
- (void)setLanguageCodeIfNeeded;
- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4;
- (void)setManagedStoreObject:(id)a3 forKey:(id)a4;
- (void)setModesConfiguration:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setOutputVoice:(id)a3 withCompletion:(id)a4;
- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)setQueuedLanguageCode:(id)a3;
- (void)setQueuedLanguageCode:(id)a3 andQueuedOutputVoice:(id)a4;
- (void)setQueuedOutputVoice:(id)a3;
- (void)setRemoraHostEnabled:(BOOL)a3;
- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6;
- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3;
- (void)setSyncDelegate:(id)a3;
- (void)setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4;
- (void)setWatchAuthenticated:(BOOL)a3;
- (void)set_clientBoundCommandLookup:(id)a3;
- (void)set_serverBoundCommandLookup:(id)a3;
- (void)set_syncControllerService:(id)a3;
- (void)set_uiBridgeServiceListener:(id)a3;
- (void)sharedDataConnection:(id)a3 didUpdateSharedData:(id)a4;
- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4;
- (void)shutdownSessionIfIdle;
- (void)speechManager:(id)a3 audioSessionDidBecomeActive:(BOOL)a4;
- (void)speechManager:(id)a3 audioSessionWillBecomeActive:(BOOL)a4;
- (void)speechManager:(id)a3 capturedFingerprint:(id)a4 duration:(double)a5;
- (void)speechManager:(id)a3 capturedPackets:(id)a4 atTimestamp:(double)a5 totalCount:(int64_t)a6 context:(id)a7;
- (void)speechManager:(id)a3 didBeginLocalRecognitionWithContext:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didCancelWithContext:(id)a4;
- (void)speechManager:(id)a3 didChangeRecordingState:(BOOL)a4;
- (void)speechManager:(id)a3 didDetectEndpointAtTime:(double)a4 context:(id)a5;
- (void)speechManager:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6;
- (void)speechManager:(id)a3 didDetectStartpointAtTime:(double)a4 context:(id)a5;
- (void)speechManager:(id)a3 didFailWithError:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 didFinishWithCapturingMode:(int64_t)a4 context:(id)a5;
- (void)speechManager:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5 context:(id)a6;
- (void)speechManager:(id)a3 didProduceLocalLoggablePackage:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didReceiveConfidenceScores:(id)a4 classification:(unint64_t)a5 classifiedUser:(id)a6 unknownUserScore:(int64_t)a7 duration:(int64_t)a8 version:(int64_t)a9 thresholdingType:(id)a10 assetVersion:(id)a11;
- (void)speechManager:(id)a3 didReceiveLastAudioBufferWithEndpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6 context:(id)a7;
- (void)speechManager:(id)a3 didRecognizePackage:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didRecognizeTokens:(id)a4 sessionUUID:(id)a5;
- (void)speechManager:(id)a3 didRequestQuickStopWithContext:(id)a4;
- (void)speechManager:(id)a3 didStartRecordingWithInfo:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 didUpdateRecordingWithInfo:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 languageDetectorDidFail:(id)a4;
- (void)speechManager:(id)a3 performTwoShotPromptWithType:(int64_t)a4 context:(id)a5 completion:(id)a6;
- (void)speechManager:(id)a3 preheatWithRecordingInfo:(id)a4 context:(id)a5;
- (void)speechManager:(id)a3 recognitionDidCompleteWithError:(id)a4 secureOfflineOnlyRecognition:(BOOL)a5 sessionUUID:(id)a6 statistics:(id)a7;
- (void)speechManager:(id)a3 recognitionUpdateWillBeginForTask:(id)a4;
- (void)speechManager:(id)a3 willStartRecordingAtTimestamp:(double)a4 isFromFile:(BOOL)a5 inputAudioPowerWrapper:(id)a6 context:(id)a7;
- (void)speechManager:(id)a3 willStopRecordingWithSignpostID:(unint64_t)a4;
- (void)speechManagerDidDelayEndpointForMusic:(id)a3;
- (void)speechManagerDidDetectMusic:(id)a3;
- (void)startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5;
- (void)startCloudKitSyncWeeklyForActivity:(id)a3;
- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7;
- (void)startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8;
- (void)startObservingCallState;
- (void)startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7;
- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8;
- (void)startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6;
- (void)startRemoteRequest:(id)a3 completion:(id)a4;
- (void)startRemoteRequest:(id)a3 onTargetDevice:(id)a4 completion:(id)a5;
- (void)startRequest:(id)a3 withDelegate:(id)a4;
- (void)startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5;
- (void)startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4;
- (void)startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5;
- (void)stopSpeechWithOptions:(id)a3 forDelegate:(id)a4;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5;
- (void)syncManager:(id)a3 chunkForSyncInfo:(id)a4 chunkInfo:(id)a5;
- (void)syncManager:(id)a3 finishedSyncForKeys:(id)a4 postNotification:(BOOL)a5;
- (void)syncManagerDidResetInProgressSync:(id)a3;
- (void)taskmaster:(id)a3 didLaunchApplicationForRequestWithId:(id)a4;
- (void)taskmaster:(id)a3 didReceivePunchoutOutcome:(id)a4;
- (void)telephonyRequestCompleted;
- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7;
- (void)updateSharedDataFromCloudPeers:(id)a3 completion:(id)a4;
- (void)updateSharedDataFromCompanion;
- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5;
- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4;
- (void)updateSharedDataWithCloudData:(id)a3 fromPeer:(id)a4;
- (void)updateSpeechOptions:(id)a3 forDelegate:(id)a4;
- (void)updateSpeechSynthesisRecord:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)willSetApplicationContextWithRefId:(id)a3;
- (void)withContextManager:(id)a3;
@end

@implementation ADCommandCenter

- (void)_logExecuteOnRemoteRequestForRequestId:(id)a3 turnId:(id)a4 event:(int64_t)a5
{
  id v20 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHClientEvent);
  id v9 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHClientEventMetadata);
  id v10 = [[SISchemaUUID alloc] initWithNSUUID:v20];
  [v9 setRequestId:v10];

  [v8 setEventMetadata:v9];
  id v11 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHExecuteOnRemoteRequestContext);
  switch(a5)
  {
    case 2LL:
      id v12 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHExecuteOnRemoteRequestFailed);
      [v11 setFailed:v12];
      [v11 setHasFailed:1];
      goto LABEL_7;
    case 1LL:
      id v12 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHExecuteOnRemoteRequestEnded);
      [v11 setEnded:v12];
      [v11 setHasEnded:1];
      goto LABEL_7;
    case 0LL:
      id v12 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHExecuteOnRemoteRequestStarted);
      [v11 setStartedOrChanged:v12];
      [v11 setHasStartedOrChanged:1];
LABEL_7:

      break;
  }

  [v8 setExecuteOnRemoteRequestContext:v11];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v13 emitMessage:v8];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  uint64_t v15 = ADCreateRequestLinkInfo(v14, 2LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v20 UUIDString]);
  uint64_t v18 = ADCreateRequestLinkInfo(v17, 1LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  ADEmitRequestLinkEventMessage(v16, v19);
}

- (void)_logAudioTopologyForRequestId:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
  id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = dispatch_queue_create("ADInstrumentationQueue", v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004DE84;
  v11[3] = &unk_1004FD968;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)_emitAudioTopologyForRequestId:(id)a3
{
  id v4 = a3;
  id v17 = objc_alloc_init(&OBJC_CLASS___HomeKitSchemaHKClientEvent);
  id v5 = objc_alloc_init(&OBJC_CLASS___HomeKitSchemaHomeKitEventMetadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v7 = [[SISchemaUUID alloc] initWithNSUUID:v6];
  [v5 setHkId:v7];

  [v17 setEventMetadata:v5];
  id v8 = objc_alloc_init(&OBJC_CLASS___HomeKitSchemaHKAudioTopologyReported);
  [v8 setHasAudioTopology:1];
  uint64_t v9 = -[ADCommandCenter getHomeDevicesAudioTopology](self, "getHomeDevicesAudioTopology");
  [v8 setAudioTopology:v9];
  if ((_DWORD)v9 == 4 || (_DWORD)v9 == 2) {
    objc_msgSend(v8, "setHasIsLeader:", -[ADCommandCenter isStereoPairLeader](self, "isStereoPairLeader"));
  }
  [v17 setAudioTopologyReported:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v10 emitMessage:v17];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  uint64_t v12 = ADCreateRequestLinkInfo(v11, 1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  uint64_t v15 = ADCreateRequestLinkInfo(v14, 39LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  ADEmitRequestLinkEventMessage(v13, v16);
}

- (int)getHomeDevicesAudioTopology
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"persistentGroupUUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2, "objectForKey:", @"tightSyncGroupUUID"));
  if (v3) {
    int v5 = 4;
  }
  else {
    int v5 = 2;
  }
  if (v3) {
    int v6 = 3;
  }
  else {
    int v6 = 1;
  }
  if (v4) {
    int v7 = v5;
  }
  else {
    int v7 = v6;
  }

  return v7;
}

- (BOOL)isStereoPairLeader
{
  v2 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
  unsigned __int8 v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"tightSyncIsGroupLeader");

  return v3;
}

- (id)_syncManager
{
  syncManager = self->_syncManager;
  if (!syncManager)
  {
    id v4 = objc_alloc(&OBJC_CLASS___ADSyncManager);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    int v7 = -[ADSyncManager initWithServiceManager:queue:](v4, "initWithServiceManager:queue:", v5, v6);
    id v8 = self->_syncManager;
    self->_syncManager = v7;

    syncManager = self->_syncManager;
  }

  return syncManager;
}

- (void)_resetSyncVerification
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
  if ([v4 isVerifying])
  {
    [v4 reset];
    verificationHelper = self->_verificationHelper;
    self->_verificationHelper = 0LL;
  }
}

- (void)_addOutstandingAnchorsRequestId:(id)a3
{
  id v4 = a3;
  outstandingAnchorsRequests = self->_outstandingAnchorsRequests;
  id v8 = v4;
  if (!outstandingAnchorsRequests)
  {
    int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    int v7 = self->_outstandingAnchorsRequests;
    self->_outstandingAnchorsRequests = v6;

    id v4 = v8;
    outstandingAnchorsRequests = self->_outstandingAnchorsRequests;
  }

  -[NSMutableSet addObject:](outstandingAnchorsRequests, "addObject:", v4);
}

- (void)_removeOutstandingAnchorsRequestId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    -[NSMutableSet removeObject:](self->_outstandingAnchorsRequests, "removeObject:", v4);
    id v5 = -[NSMutableSet count](self->_outstandingAnchorsRequests, "count");
    id v4 = v7;
    if (!v5)
    {
      outstandingAnchorsRequests = self->_outstandingAnchorsRequests;
      self->_outstandingAnchorsRequests = 0LL;

      id v4 = v7;
    }
  }
}

- (BOOL)_hasOutstandingAnchorsRequestId:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_outstandingAnchorsRequests, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)_addOutstandingSyncChunkId:(id)a3
{
  id v4 = a3;
  outstandingSyncChunks = self->_outstandingSyncChunks;
  id v8 = v4;
  if (!outstandingSyncChunks)
  {
    int v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v7 = self->_outstandingSyncChunks;
    self->_outstandingSyncChunks = v6;

    id v4 = v8;
    outstandingSyncChunks = self->_outstandingSyncChunks;
  }

  -[NSMutableSet addObject:](outstandingSyncChunks, "addObject:", v4);
}

- (void)_removeOutstandingSyncChunkId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    -[NSMutableSet removeObject:](self->_outstandingSyncChunks, "removeObject:", v4);
    id v5 = -[NSMutableSet count](self->_outstandingSyncChunks, "count");
    id v4 = v7;
    if (!v5)
    {
      outstandingSyncChunks = self->_outstandingSyncChunks;
      self->_outstandingSyncChunks = 0LL;

      id v4 = v7;
    }
  }
}

- (BOOL)_hasOutstandingSyncChunkId:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_outstandingSyncChunks, "containsObject:");
  }
  else {
    return 0;
  }
}

- (BOOL)_syncChunkWindowFull
{
  return (unint64_t)-[NSMutableSet count](self->_outstandingSyncChunks, "count") > 4;
}

- (id)_allAnchorsFromRequest:(id)a3 andResponse:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v17 = v4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 anchors]);
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "_af_isValid"))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_af_normalizedKey"));
          [v5 setObject:v11 forKey:v12];
        }

        else
        {
          v13 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[ADCommandCenter(Sync) _allAnchorsFromRequest:andResponse:]";
            __int16 v24 = 2112;
            v25 = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Ignoring invalid anchor from server: %@",  buf,  0x16u);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncBlacklist sharedInstance](&OBJC_CLASS___ADSyncBlacklist, "sharedInstance"));
  [v14 filterBlacklistedAnchorsFrom:v5 includingNewRestrictionsFromResponse:v17];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  return v15;
}

- (void)_handleValidatedSyncGetAnchorsResponse:(id)a3 forGetAnchors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _allAnchorsFromRequest:andResponse:]( self,  "_allAnchorsFromRequest:andResponse:",  v7,  v6));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 syncReason]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"+"]);
  if ([v8 isSyncing] && (objc_msgSend(v8, "isVerifying") & 1) == 0)
  {
    uint64_t v12 = (void *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentRequestId]);
      int v17 = 136315650;
      __int128 v18 = "-[ADCommandCenter(Sync) _handleValidatedSyncGetAnchorsResponse:forGetAnchors:]";
      __int16 v19 = 2112;
      __int128 v20 = v14;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Queuing anchors from %@ because we are already syncing; active request: %@",
        (uint8_t *)&v17,
        0x20u);
    }

    [v8 addQueuedAnchors:v9 forReasons:v11];
  }

  else
  {
    -[ADCommandCenter _resetSyncVerification](self, "_resetSyncVerification");
    [v8 prepareSyncWithAnchors:v9 forReasons:v11 delegate:self];
  }
}

- (id)_appMetaDataForAppProxy:(id)a3 clientIdentifier:(id)a4 syncSlots:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___SASyncAppMetaData);
  id v11 = sub_100057150(v9, v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  [v10 setAppIdentifyingInfo:v12];
  [v10 setSyncSlots:v7];

  uint64_t v13 = sub_10005709C(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
  [v10 setDeveloperMode:v14];

  return v10;
}

- (id)_appMetaDataListFromVocabSources:(id)a3 appIdentifyingInfoList:(id)a4
{
  v22 = self;
  id v23 = a3;
  id v5 = a4;
  id v6 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleId", v22));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v12));

        id v14 = objc_alloc_init(&OBJC_CLASS___SASyncAppMetaData);
        [v14 setAppIdentifyingInfo:v11];
        uint64_t v15 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_10005709C(v13));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v14 setDeveloperMode:v16];

        int v17 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentifier]);
        if (v17)
        {
          -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v14, v17);
        }

        else
        {
          __int128 v18 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v33 = "-[ADCommandCenter(Sync) _appMetaDataListFromVocabSources:appIdentifyingInfoList:]";
            __int16 v34 = 2112;
            v35 = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Malformed app source - no clientIdentifier: %@",  buf,  0x16u);
          }
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v8);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10005724C;
  v25[3] = &unk_1004EFCE0;
  v26 = v6;
  v27 = v22;
  __int16 v19 = v6;
  [v23 enumerateKeysAndObjectsUsingBlock:v25];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v19, "allValues"));

  return v20;
}

- (void)_fetchAllAppSourcesForSyncingWithCustomVocabInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    __int128 v30 = v6;
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v28 = self;
    uint64_t v12 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v14 = -[NSString initWithFormat:](v12, "initWithFormat:", @"ADCommandCenterSyncAppSourcesFetching-%@", v13);

    __int128 v29 = v14;
    uint64_t v15 = -[NSString UTF8String](v29, "UTF8String");
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create(v15, v17);

    __int16 v19 = dispatch_group_create();
    dispatch_group_enter(v19);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100056C1C;
    v39[3] = &unk_1004EE7B0;
    dispatch_queue_t v40 = v18;
    __int128 v20 = v10;
    v41 = v20;
    v42 = v19;
    __int16 v21 = v19;
    id v6 = v30;
    v22 = v21;
    id v23 = v18;
    +[NSExtension _intents_findAppsWithAnIntentsServiceExtension:]( &OBJC_CLASS___NSExtension,  "_intents_findAppsWithAnIntentsServiceExtension:",  v39);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100056CE8;
    block[3] = &unk_1004F73F0;
    v32 = v8;
    v33 = v28;
    id v34 = v30;
    v35 = v20;
    v36 = v11;
    v37 = v9;
    id v38 = v7;
    __int16 v24 = v9;
    v25 = v11;
    v26 = v20;
    v27 = v8;
    dispatch_group_notify(v22, v23, block);
  }
}

- (void)_requestAnchorsForKeys:(id)a3 appSources:(id)a4 watchAppSources:(id)a5 forceReset:(BOOL)a6 includeAllKnownAnchors:(BOOL)a7 reasons:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v44 = a4;
  id v42 = a5;
  id v15 = a8;
  dispatch_queue_attr_t v16 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
    __int16 v54 = 2112;
    id v55 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Asking for anchor keys %@", buf, 0x16u);
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager", v42));
  dispatch_queue_t v18 = v17;
  if (v10)
  {
    if ([v17 isSyncing])
    {
      __int16 v19 = (os_log_s *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Not forcing a reset since we're already in the middle of a sync. Wait and try again",  buf,  0xCu);
      }
    }

    else
    {
      [v18 _setForceResetOnNextSync:1];
      __int128 v20 = (os_log_s *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Forcing a reset sync", buf, 0xCu);
      }
    }
  }

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v21 beginUpdatingAssistantData];

  v22 = objc_alloc_init(&OBJC_CLASS___SASyncGetAnchors);
  -[SASyncGetAnchors setSources:](v22, "setSources:", v14);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsJoinedByString:@"+"]);
  -[SASyncGetAnchors setSyncReason:](v22, "setSyncReason:", v23);
  -[SASyncGetAnchors setIncludeAllKnownAnchors:](v22, "setIncludeAllKnownAnchors:", v9);
  -[SASyncGetAnchors setAppMetaDataList:](v22, "setAppMetaDataList:", v44);
  uint64_t v24 = SiriCoreUUIDStringCreate(-[SASyncGetAnchors setWatchAppMetaDataList:](v22, "setWatchAppMetaDataList:", v43));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[SASyncGetAnchors setAceId:](v22, "setAceId:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SASyncGetAnchors aceId](v22, "aceId"));
  v27 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[ADCommandCenter(Sync) _requestAnchorsForKeys:appSources:watchAppSources:forceReset:includeAllKnownAnchors:reasons:]";
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s Waiting for sync queue to start sync",  buf,  0xCu);
  }

  syncAnchorsRequestQueue = self->_syncAnchorsRequestQueue;
  if (!syncAnchorsRequestQueue)
  {
    __int128 v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    dispatch_queue_attr_t v30 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int128 v31 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v30);
    dispatch_queue_attr_t v32 = dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_UNSPECIFIED, 0);
    v33 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v32);

    if (v29) {
      dispatch_queue_t v34 = dispatch_queue_create_with_target_V2("SyncAnchorsQueue", v33, v29);
    }
    else {
      dispatch_queue_t v34 = dispatch_queue_create("SyncAnchorsQueue", v33);
    }
    v35 = (OS_dispatch_queue *)v34;

    v36 = self->_syncAnchorsRequestQueue;
    self->_syncAnchorsRequestQueue = v35;

    syncAnchorsRequestQueue = self->_syncAnchorsRequestQueue;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100056880;
  block[3] = &unk_1004F5640;
  id v46 = v26;
  id v47 = v15;
  v48 = syncAnchorsRequestQueue;
  v49 = self;
  v50 = v22;
  id v51 = v18;
  id v37 = v26;
  id v38 = v15;
  v39 = v48;
  dispatch_queue_t v40 = v22;
  id v41 = v18;
  dispatch_async(v39, block);
}

- (void)_sendSyncFinishedAndReferenceCurrentSyncPromise:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    outstandingSyncPromiseID = self->_outstandingSyncPromiseID;
    int v11 = 136315650;
    uint64_t v12 = "-[ADCommandCenter(Sync) _sendSyncFinishedAndReferenceCurrentSyncPromise:]";
    __int16 v13 = 2112;
    id v14 = outstandingSyncPromiseID;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s will reference promise %@: %d",  (uint8_t *)&v11,  0x1Cu);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___SASyncFinished);
  id v8 = v7;
  if (v3)
  {
    [v7 setRefId:self->_outstandingSyncPromiseID];
    BOOL v9 = self->_outstandingSyncPromiseID;
    self->_outstandingSyncPromiseID = 0LL;

    outstandingSyncPromiseKeys = self->_outstandingSyncPromiseKeys;
    self->_outstandingSyncPromiseKeys = 0LL;
  }

  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v8);
}

- (void)_saSyncGetAnchors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = v8;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 forceEagerDeserialization]);
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = "-[ADCommandCenter(Sync) _saSyncGetAnchors:completion:]";
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100056210;
  v20[3] = &unk_1004FD990;
  id v13 = v7;
  id v22 = v13;
  id v14 = v11;
  id v21 = v14;
  __int16 v15 = objc_retainBlock(v20);
  if (-[ADCommandCenter _sync_isRequestBlockingSyncVerification](self, "_sync_isRequestBlockingSyncVerification")
    || ([v12 isSyncing] & 1) != 0
    || [v12 isVerifying])
  {
    ((void (*)(void *))v15[2])(v15);
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10005627C;
    v16[3] = &unk_1004EE800;
    v16[4] = self;
    dispatch_queue_t v18 = v15;
    id v17 = v6;
    id v19 = v13;
    sub_1002D63C4(v16);
  }
}

- (void)_saSyncGetAnchorsResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    BOOL v16 = "-[ADCommandCenter(Sync) _saSyncGetAnchorsResponse:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  -[ADCommandCenter _removeOutstandingAnchorsRequestId:](self, "_removeOutstandingAnchorsRequestId:", v9);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getAnchorsRequest]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 aceId]);

  if ([v12 isEqualToString:v9])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 getAnchorsRequest]);
    -[ADCommandCenter _handleValidatedSyncGetAnchorsResponse:forGetAnchors:]( self,  "_handleValidatedSyncGetAnchorsResponse:forGetAnchors:",  v6,  v13);

    [v10 setGetAnchorsRequest:0];
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  id v14 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315650;
    BOOL v16 = "-[ADCommandCenter(Sync) _saSyncGetAnchorsResponse:completion:]";
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    __int128 v20 = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s %@ isn't the get anchors response we were expecting. getAnchorsRequest:%@",  (uint8_t *)&v15,  0x20u);
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  if (v7) {
LABEL_8:
  }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
LABEL_9:
}

- (void)_saSASyncGetCachedSyncAnchors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v17 = "-[ADCommandCenter(Sync) _saSASyncGetCachedSyncAnchors:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncSnapshot sharedInstance](&OBJC_CLASS___ADSyncSnapshot, "sharedInstance"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10005617C;
  v13[3] = &unk_1004FD6C8;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 fetchSentAnchorsOnQueue:v10 completion:v13];
}

- (void)_saSyncChunkDenied:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    id v13 = "-[ADCommandCenter(Sync) _saSyncChunkDenied:completion:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 current]);
  [v9 cancelSyncForAnchor:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  -[ADCommandCenter _removeOutstandingSyncChunkId:](self, "_removeOutstandingSyncChunkId:", v11);

  -[ADCommandCenter _sync_continueIfConditionsMet](self, "_sync_continueIfConditionsMet");
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_saSyncChunkAccepted:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[ADCommandCenter(Sync) _saSyncChunkAccepted:completion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  -[ADCommandCenter _removeOutstandingSyncChunkId:](self, "_removeOutstandingSyncChunkId:", v9);

  -[ADCommandCenter _sync_continueIfConditionsMet](self, "_sync_continueIfConditionsMet");
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_saSyncFinished:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    BOOL v9 = "-[ADCommandCenter(Sync) _saSyncFinished:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Server is done sending sync data",  (uint8_t *)&v8,  0xCu);
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_saSyncClientVerify:(id)a3 completion:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = (void (**)(id, id, void))a4;
  int v8 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    id v23 = "-[ADCommandCenter(Sync) _saSyncClientVerify:completion:]";
    __int16 v24 = 2112;
    __int16 v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v22, 0x16u);
  }

  outstandingSyncVerificationRequestID = self->_outstandingSyncVerificationRequestID;
  if (!outstandingSyncVerificationRequestID)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v13 lastSyncVerificationDate]);

    if (v11
      && ([v11 timeIntervalSinceNow], v14 > -86400.0)
      && (id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString aceId](v6, "aceId")),
          unsigned __int8 v16 = [v15 isEqualToString:@"ClientSideInitiatedSyncVerification"],
          v15,
          (v16 & 1) == 0))
    {
      id v19 = (os_log_s *)AFSiriLogContextSync;
      if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        id v23 = "-[ADCommandCenter(Sync) _saSyncClientVerify:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Already verified sync data over the last 24 hours, ignoring",  (uint8_t *)&v22,  0xCu);
      }

      if (v7)
      {
        id v20 = objc_alloc_init(&OBJC_CLASS___SACommandIgnored);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSString aceId](v6, "aceId"));
        [v20 setRefId:v21];

        v7[2](v7, v20, 0LL);
      }
    }

    else
    {
      __int16 v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString aceId](v6, "aceId"));
      __int16 v18 = self->_outstandingSyncVerificationRequestID;
      self->_outstandingSyncVerificationRequestID = v17;

      if (v7) {
        v7[2](v7, 0LL, 0LL);
      }
    }

    goto LABEL_13;
  }

  int v10 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315650;
    id v23 = "-[ADCommandCenter(Sync) _saSyncClientVerify:completion:]";
    __int16 v24 = 2112;
    __int16 v25 = outstandingSyncVerificationRequestID;
    __int16 v26 = 2112;
    v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Sync Verification request %@ is enqueued; ignoring %@",
      (uint8_t *)&v22,
      0x20u);
  }

  if (v7)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___SACommandIgnored);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSString aceId](v6, "aceId"));
    [v11 setRefId:v12];

    v7[2](v7, v11, 0LL);
LABEL_13:
  }
}

- (void)_saSyncServerVerifyResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    double v14 = "-[ADCommandCenter(Sync) _saSyncServerVerifyResponse:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }

  if (self->_needVerificationFullReport)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
    unsigned int v10 = [v9 isVerifying];

    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_syncDelegate);
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionary]);
      [WeakRetained adSyncVerificationServerReport:v12];
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (id)_emptyVerificationSyncAnchorForKey:(id)a3 appBundleID:(id)a4 syncSlotName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  unsigned int v10 = objc_alloc_init(&OBJC_CLASS___SASyncAnchor);
  -[SASyncAnchor setCount:](v10, "setCount:", -1LL);
  -[SASyncAnchor setKey:](v10, "setKey:", v9);

  if (v7)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___SASyncAppMetaData);
    if (v8)
    {
      id v17 = v8;
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
      [v11 setSyncSlots:v12];
    }

    id v13 = objc_alloc_init(&OBJC_CLASS___SASyncAppIdentifyingInfo);
    [v13 setBundleId:v7];
    uint64_t v14 = AFApplicationClientIdentifierForApp(v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v13 setClientIdentifier:v15];

    [v11 setAppIdentifyingInfo:v13];
    -[SASyncAnchor setAppMetaData:](v10, "setAppMetaData:", v11);
  }

  return v10;
}

- (void)_prepareAndStartSyncVerification
{
  BOOL v3 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v31 = "-[ADCommandCenter(Sync) _prepareAndStartSyncVerification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (self->_needVerificationFullReport)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SASyncServerVerify);
    [v4 setPerformInternalVerification:1];
    [v4 setFetchSyncDebugInfo:1];
    -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v4);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allSyncAnchorKeys]);

  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _emptyVerificationSyncAnchorForKey:appBundleID:syncSlotName:]( self,  "_emptyVerificationSyncAnchorForKey:appBundleID:syncSlotName:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v11),  0LL,  0LL));
        -[NSMutableArray addObject:](v5, "addObject:", v12);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v9);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allVocabSyncInfo]);
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  id v21 = sub_10005603C;
  int v22 = &unk_1004EFCE0;
  id v23 = self;
  __int16 v24 = v5;
  id v15 = v5;
  [v14 enumerateKeysAndObjectsUsingBlock:&v19];

  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager", v19, v20, v21, v22, v23));
  [v16 setIsVerifying:1];
  id v17 = objc_alloc_init(&OBJC_CLASS___ADSyncVerificationHelper);
  verificationHelper = self->_verificationHelper;
  self->_verificationHelper = v17;

  [v16 prepareSyncWithAnchors:v15 forReasons:&off_100512F70 delegate:self];
}

- (void)_finishVerificationWithKeys:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 setLastSyncVerificationDate:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADSyncVerificationHelper checksums](self->_verificationHelper, "checksums"));
  if ([v7 count])
  {
    id v8 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_queue_attr_t v30 = "-[ADCommandCenter(Sync) _finishVerificationWithKeys:]";
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Sending checksums for keys: %@", buf, 0x16u);
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___SASyncClientVerifyResult);
    [v9 setChecksums:v7];
    -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v9);
    outstandingSyncVerificationRequestID = self->_outstandingSyncVerificationRequestID;
    self->_outstandingSyncVerificationRequestID = 0LL;

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
    [v11 setIsVerifying:0];

    verificationHelper = self->_verificationHelper;
    self->_verificationHelper = 0LL;

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
    if (!v13)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
      [v14 setHasActiveRequest:0];
    }

    if (self->_shouldPostSyncVerifyFinishedNotification)
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v16 = v7;
      id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            -[NSMutableArray addObject:](v15, "addObject:", v21);

            uint64_t v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }

        while (v18);
      }

      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification notificationWithName:object:]( &OBJC_CLASS___NSNotification,  "notificationWithName:object:",  @"ADSyncVerificationFinishedNotification",  v15));
      [v22 postNotification:v23];

      self->_shouldPostSyncVerifyFinishedNotification = 0;
    }
  }

  -[ADCommandCenter _shutdownSessionWhenIdle](self, "_shutdownSessionWhenIdle", (void)v24);
}

- (void)syncManager:(id)a3 chunkForSyncInfo:(id)a4 chunkInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
  [v11 keepAlive];

  if ([v8 isVerifying])
  {
    verificationHelper = self->_verificationHelper;
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472LL;
    v80[2] = sub_100055FD8;
    v80[3] = &unk_1004EE828;
    v80[4] = self;
    -[ADSyncVerificationHelper handleSyncChunkInfo:withSyncInfo:completion:]( verificationHelper,  "handleSyncChunkInfo:withSyncInfo:completion:",  v10,  v9,  v80);
    -[ADCommandCenter _sync_continueVerificationIfConditionsMet](self, "_sync_continueVerificationIfConditionsMet");
    goto LABEL_41;
  }

  id v62 = v8;
  self->_needsToSendSyncFinished = 1;
  id v13 = objc_alloc_init(&OBJC_CLASS___SASyncChunk);
  uint64_t v14 = SiriCoreUUIDStringCreate(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v13 setAceId:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 key]);
  [v13 setKey:v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 appMetadata]);
  [v13 setAppMetaData:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 pre]);
  [v13 setPreGen:v18];

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 post]);
  [v13 setPostGen:v19];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 validity]);
  [v13 setValidity:v20];

  id v21 = objc_autoreleasePoolPush();
  int v22 = (void *)objc_claimAutoreleasedReturnValue([v10 toAdd]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 toRemove]);
  v67 = v13;
  if (!v22)
  {
    [v13 setToAdd:0];
    if (v23) {
      goto LABEL_5;
    }
LABEL_7:
    __int128 v28 = v13;
    [v13 setToRemove:0];
    goto LABEL_8;
  }

  id v24 = +[AceObject aceObjectArrayWithDictionaryArray:baseClass:]( &OBJC_CLASS___AceObject,  "aceObjectArrayWithDictionaryArray:baseClass:",  v22,  objc_opt_class(&OBJC_CLASS___SADomainObject));
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v13 setToAdd:v25];

  if (!v23) {
    goto LABEL_7;
  }
LABEL_5:
  id v26 = +[AceObject aceObjectArrayWithDictionaryArray:baseClass:]( &OBJC_CLASS___AceObject,  "aceObjectArrayWithDictionaryArray:baseClass:",  v23,  objc_opt_class(&OBJC_CLASS___SADomainObject));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  __int128 v28 = v13;
  [v13 setToRemove:v27];

LABEL_8:
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncSnapshot sharedInstance](&OBJC_CLASS___ADSyncSnapshot, "sharedInstance"));
  [v29 noteSendingChunk:v28];

  objc_autoreleasePoolPop(v21);
  dispatch_queue_attr_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  LODWORD(v29) = [v30 databaseSyncEnabled];

  if ((_DWORD)v29)
  {
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSyncDatabase currentSyncDatabase]( &OBJC_CLASS___SiriCoreSyncDatabase,  "currentSyncDatabase"));
    v65 = self;
    if ([v31 inTransaction])
    {
      id v32 = 0LL;
    }

    else
    {
      id v79 = 0LL;
      unsigned __int8 v33 = [v31 openWithError:&v79];
      id v34 = v79;
      if ((v33 & 1) == 0)
      {
        v35 = (os_log_s *)AFSiriLogContextSync;
        if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v83 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
          __int16 v84 = 2112;
          id v85 = v34;
          _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s Could not open sync database for sync chunk processing err: %@",  buf,  0x16u);
        }
      }

      id v78 = v34;
      unsigned __int8 v36 = [v31 beginTransactionWithError:&v78];
      id v32 = v78;

      if ((v36 & 1) == 0)
      {
        id v37 = (os_log_s *)AFSiriLogContextSync;
        if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v83 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
          __int16 v84 = 2112;
          id v85 = v32;
          _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s Could not begin sync database transaction for sync chunk processing err: %@",  buf,  0x16u);
        }
      }
    }

    v66 = v9;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "toAdd", v10));
    id v38 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v75;
      do
      {
        for (i = 0LL; i != v39; i = (char *)i + 1)
        {
          id v42 = v32;
          if (*(void *)v75 != v40) {
            objc_enumerationMutation(obj);
          }
          v43 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 identifier]);
          v45 = (void *)objc_claimAutoreleasedReturnValue([v28 key]);
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v66 appMetadata]);
          id v47 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _syncRecordForKey:fromDomainObject:appMeta:]( v65,  "_syncRecordForKey:fromDomainObject:appMeta:",  v45,  v43,  v46));

          id v73 = v42;
          LOBYTE(v43) = [v31 donate:v47 error:&v73];
          id v32 = v73;

          if ((v43 & 1) == 0)
          {
            v48 = (os_log_s *)AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v83 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
              __int16 v84 = 2112;
              id v85 = v44;
              __int16 v86 = 2112;
              id v87 = v32;
              _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%s Could not add to sync database for sync chunk add %@ err: %@",  buf,  0x20u);
            }
          }

          __int128 v28 = v67;
        }

        id v39 = [obj countByEnumeratingWithState:&v74 objects:v88 count:16];
      }

      while (v39);
    }

    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    id obja = (id)objc_claimAutoreleasedReturnValue([v28 toRemove]);
    id v49 = [obja countByEnumeratingWithState:&v69 objects:v81 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v70;
      self = v65;
      do
      {
        for (j = 0LL; j != v50; j = (char *)j + 1)
        {
          v53 = v32;
          if (*(void *)v70 != v51) {
            objc_enumerationMutation(obja);
          }
          __int16 v54 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)j);
          id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 identifier]);
          v56 = (void *)objc_claimAutoreleasedReturnValue([v67 key]);
          v57 = self;
          v58 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _syncRecordForKey:fromDomainObject:appMeta:]( self,  "_syncRecordForKey:fromDomainObject:appMeta:",  v56,  v54,  0LL));

          id v68 = v53;
          LOBYTE(v54) = [v31 remove:v58 error:&v68];
          id v32 = v68;

          if ((v54 & 1) == 0)
          {
            v59 = (os_log_s *)AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v83 = "-[ADCommandCenter(Sync) syncManager:chunkForSyncInfo:chunkInfo:]";
              __int16 v84 = 2112;
              id v85 = v55;
              __int16 v86 = 2112;
              id v87 = v32;
              _os_log_error_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "%s Could not add to sync database for sync chunk remove %@ err: %@",  buf,  0x20u);
            }
          }

          self = v57;
        }

        id v50 = [obja countByEnumeratingWithState:&v69 objects:v81 count:16];
      }

      while (v50);
    }

    else
    {
      self = v65;
    }

    id v10 = v61;
    id v8 = v62;
    id v9 = v66;
    __int128 v28 = v67;
  }

  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v28);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v28 aceId]);
  -[ADCommandCenter _addOutstandingSyncChunkId:](self, "_addOutstandingSyncChunkId:", v60);

LABEL_41:
}

- (id)_syncRecordForKey:(id)a3 fromDomainObject:(id)a4 appMeta:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSyncRecord syncRecordWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:]( &OBJC_CLASS___SiriCoreSyncRecord,  "syncRecordWithKey:identifier:priority:debugValue:dataValue:addedValue:appMeta:",  v9,  v11,  0LL,  0LL,  0LL,  0LL,  0LL));

  id v13 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:](v13, "encodeObject:", v7);
  -[NSKeyedArchiver finishEncoding](v13, "finishEncoding");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v13, "encodedData"));
  [v12 setDataValue:v14];

  if (v8)
  {
    id v15 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:](v15, "encodeObject:", v8);
    -[NSKeyedArchiver finishEncoding](v15, "finishEncoding");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v15, "encodedData"));
    [v12 setMetaValue:v16];
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 fullDescription]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 fullDescription]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"META:%@\nDATA:%@",  v17,  v18));
  [v12 setDebugValue:v19];

  return v12;
}

- (void)syncManager:(id)a3 finishedSyncForKeys:(id)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isVerifying])
  {
    -[ADCommandCenter _finishVerificationWithKeys:](self, "_finishVerificationWithKeys:", v9);
  }

  else
  {
    if (v5)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification notificationWithName:object:]( &OBJC_CLASS___NSNotification,  "notificationWithName:object:",  @"ADSyncFinishedNotification",  v9));
      [v10 postNotification:v11];
    }

    sub_1001EBDE4(@"sync_flag");
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 queuedAnchors]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 queuedReasons]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
    unsigned __int8 v15 = [v14 isSyncing];

    if ((v15 & 1) == 0)
    {
      id v16 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v9);
      id v17 = -[NSMutableSet isSubsetOfSet:](self->_outstandingSyncPromiseKeys, "isSubsetOfSet:", v16);
      if ([v12 count])
      {
        [v8 clearQueuedAnchorsAndReasons];
        [v8 setGetAnchorsRequest:0];
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
        [v8 prepareSyncWithAnchors:v12 forReasons:v18 delegate:self];

        if ((_DWORD)v17) {
          -[ADCommandCenter _sendSyncFinishedAndReferenceCurrentSyncPromise:]( self,  "_sendSyncFinishedAndReferenceCurrentSyncPromise:",  1LL);
        }
      }

      else
      {
        if (self->_needsToSendSyncFinished) {
          BOOL v19 = 1;
        }
        else {
          BOOL v19 = (int)v17;
        }
        self->_needsToSendSyncFinished = v19;
        if (v19)
        {
          self->_needsToSendSyncFinished = 0;
          -[ADCommandCenter _sendSyncFinishedAndReferenceCurrentSyncPromise:]( self,  "_sendSyncFinishedAndReferenceCurrentSyncPromise:",  v17);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));

          if (!v20)
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
            [v21 setHasActiveRequest:0];
          }
        }

        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_100055E14;
        v31[3] = &unk_1004F9100;
        v31[4] = self;
        id v32 = v9;
        id v33 = v8;
        sub_1002D63C4(v31);
      }

      -[NSMutableSet minusSet:](self->_outstandingSyncPromiseKeys, "minusSet:", v16);
      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      unsigned int v23 = [v22 databaseSyncEnabled];

      if (v23)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSyncDatabase currentSyncDatabase]( &OBJC_CLASS___SiriCoreSyncDatabase,  "currentSyncDatabase"));
        unsigned int v25 = [v24 inTransaction];

        if (v25)
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSyncDatabase currentSyncDatabase]( &OBJC_CLASS___SiriCoreSyncDatabase,  "currentSyncDatabase"));
          id v30 = 0LL;
          unsigned __int8 v27 = [v26 commitTransactionWithError:&v30];
          id v28 = v30;

          if ((v27 & 1) == 0)
          {
            __int128 v29 = (os_log_s *)AFSiriLogContextSync;
            if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v35 = "-[ADCommandCenter(Sync) syncManager:finishedSyncForKeys:postNotification:]";
              __int16 v36 = 2112;
              id v37 = v28;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Could not commit to sync database for sync chunk  err: %@",  buf,  0x16u);
            }
          }
        }
      }
    }
  }
}

- (void)syncManagerDidResetInProgressSync:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentClient](self, "_currentClient", a3));

  if (!v4) {
    -[ADCommandCenter _resetServices](self, "_resetServices");
  }
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSyncDatabase currentSyncDatabase](&OBJC_CLASS___SiriCoreSyncDatabase, "currentSyncDatabase"));
  id v9 = 0LL;
  unsigned __int8 v6 = [v5 rollbackTransactionWithError:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = (os_log_s *)AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v11 = "-[ADCommandCenter(Sync) syncManagerDidResetInProgressSync:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Could not rollback database after sync manager reset err: %@",  buf,  0x16u);
    }
  }
}

- (void)_sync_reset
{
}

- (BOOL)_sync_isSyncing
{
  return -[ADSyncManager isSyncing](self->_syncManager, "isSyncing");
}

- (BOOL)_sync_isRequestBlockingSync
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)_sync_isRequestBlockingSyncVerification
{
  if (-[ADCommandCenter _sync_isRequestBlockingSync](self, "_sync_isRequestBlockingSync")) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentClient](self, "_currentClient"));
  if (v4)
  {
    BOOL v3 = 1;
  }

  else
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechDelegate](self, "_speechDelegate"));
    BOOL v3 = v5 != 0LL;
  }

  return v3;
}

- (void)_sync_continueIfConditionsMet
{
  if (sub_1001EAC58())
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
    if ((!-[ADCommandCenter _sync_isRequestBlockingSync](self, "_sync_isRequestBlockingSync")
       || -[NSMutableSet count](self->_outstandingSyncPromiseKeys, "count"))
      && !-[ADCommandCenter _syncChunkWindowFull](self, "_syncChunkWindowFull")
      && !-[ADCommandCenter _isInCall](self, "_isInCall"))
    {
    }
  }

- (void)_sync_continueVerificationIfConditionsMet
{
  if (sub_1001EAC58())
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
    if (!-[ADCommandCenter _sync_isRequestBlockingSyncVerification](self, "_sync_isRequestBlockingSyncVerification")
      && !-[ADCommandCenter _isInCall](self, "_isInCall"))
    {
    }
  }

- (void)_sync_syncIfNeeded
{
  id v3 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCommandCenter(Sync) _sync_syncIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getAnchorsRequest]);

  if (!v5)
  {
    if ([v4 isSyncing])
    {
      -[ADCommandCenter _sync_continueIfConditionsMet](self, "_sync_continueIfConditionsMet");
    }

    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_100055D54;
      v6[3] = &unk_1004FDAA8;
      v6[4] = self;
      sub_1002D63C4(v6);
    }
  }
}

- (void)_cleanUpForFailureCommandWithRefId:(id)a3
{
  id v4 = a3;
  -[ADCommandCenter _removeOutstandingAnchorsRequestId:](self, "_removeOutstandingAnchorsRequestId:", v4);
  -[ADCommandCenter _removeOutstandingSyncChunkId:](self, "_removeOutstandingSyncChunkId:", v4);

  -[ADCommandCenter _sync_continueIfConditionsMet](self, "_sync_continueIfConditionsMet");
}

- (void)_sync_commandFailed:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 refId]);
  -[ADCommandCenter _cleanUpForFailureCommandWithRefId:](self, "_cleanUpForFailureCommandWithRefId:", v4);
}

- (void)_sync_commandIgnored:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 refId]);
  -[ADCommandCenter _cleanUpForFailureCommandWithRefId:](self, "_cleanUpForFailureCommandWithRefId:", v4);
}

- (void)_sync_assistantLoadedSyncRequest:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1001EAC58())
  {
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[ADCommandCenter(Sync) _sync_assistantLoadedSyncRequest:]";
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
    }

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
    if (([v6 isSyncing] & 1) == 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
      [v7 beginUpdatingAssistantData];
    }

    if (v3)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 syncKeysForReason:@"requested_by_server"]);
      sub_1002D66A8(v9);
    }
  }

- (BOOL)_sync_hasCommandForRefId:(id)a3
{
  id v4 = a3;
  if (-[ADCommandCenter _hasOutstandingSyncChunkId:](self, "_hasOutstandingSyncChunkId:", v4)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = -[ADCommandCenter _hasOutstandingAnchorsRequestId:](self, "_hasOutstandingAnchorsRequestId:", v4);
  }

  return v5;
}

- (void)_sync_syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5 forSyncPromise:(id)a6
{
  id v10 = a3;
  id v53 = a5;
  id obj = a6;
  id v54 = a6;
  v52 = v10;
  if ((sub_1001EAC58() & 1) != 0)
  {
    *(void *)v83 = 0LL;
    *(void *)&v83[8] = v83;
    *(void *)&v83[16] = 0x3032000000LL;
    __int16 v84 = sub_1000559E4;
    id v85 = sub_1000559F4;
    id v86 = [v10 mutableCopy];
    uint64_t v71 = 0LL;
    __int128 v72 = &v71;
    uint64_t v73 = 0x2020000000LL;
    char v74 = 0;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_1000559FC;
    v66[3] = &unk_1004EE850;
    id v68 = v83;
    __int128 v69 = &v71;
    v66[4] = self;
    BOOL v70 = a4;
    id v11 = v53;
    id v67 = v11;
    uint64_t v51 = objc_retainBlock(v66);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncManager](self, "_syncManager"));
    if ([*(id *)(*(void *)&v83[8] + 40) count])
    {
      BOOL v13 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      uint64_t v14 = -[NSMutableArray initWithCapacity:]( v13,  "initWithCapacity:",  [*(id *)(*(void *)&v83[8] + 40) count]);
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      id v15 = *(id *)(*(void *)&v83[8] + 40LL);
      id v16 = [v15 countByEnumeratingWithState:&v58 objects:v81 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v59;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v59 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)i);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 serviceForSyncAnchorKey:v19]);
            BOOL v22 = v21 == 0LL;

            if (v22)
            {
              unsigned int v23 = (os_log_s *)AFSiriLogContextSync;
              if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                id v78 = "-[ADCommandCenter(Sync) _sync_syncAnchorKeys:forceReset:reasons:forSyncPromise:]";
                __int16 v79 = 2112;
                uint64_t v80 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Not syncing %@ because there's no sync plugin for it",  buf,  0x16u);
              }

              uint64_t v76 = v19;
              id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v76,  1LL));
              sub_1002D6A38(v24);
            }

            else
            {
              -[NSMutableSet addObject:](v14, "addObject:", v19);
            }
          }

          id v16 = [v15 countByEnumeratingWithState:&v58 objects:v81 count:16];
        }

        while (v16);
      }

      objc_storeStrong((id *)(*(void *)&v83[8] + 40LL), v14);
      if (v54)
      {
        objc_storeStrong((id *)&self->_outstandingSyncPromiseID, obj);
        unsigned int v25 = objc_alloc(&OBJC_CLASS___NSMutableSet);
        id v26 = -[NSMutableSet initWithArray:](v25, "initWithArray:", *(void *)(*(void *)&v83[8] + 40LL));
        outstandingSyncPromiseKeys = self->_outstandingSyncPromiseKeys;
        self->_outstandingSyncPromiseKeys = v26;

        self->_needsToSendSyncFinished = 1;
      }
    }

    else
    {
      uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v63 = 0u;
      __int128 v62 = 0u;
      id v31 = v11;
      id v32 = [v31 countByEnumeratingWithState:&v62 objects:v82 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v63;
        do
        {
          for (j = 0LL; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v63 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v35 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)j);
            __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v12 syncKeysForReason:v35]);
            -[NSMutableSet addObjectsFromArray:](v14, "addObjectsFromArray:", v36);
            id v37 = v72;
            if (*((_BYTE *)v72 + 24))
            {
              unsigned __int8 v38 = 1;
            }

            else
            {
              unsigned __int8 v38 = [v12 shouldIncludeAllKnownSiriKitAnchorsForReason:v35];
              id v37 = v72;
            }

            *((_BYTE *)v37 + 24) = v38;
          }

          id v32 = [v31 countByEnumeratingWithState:&v62 objects:v82 count:16];
        }

        while (v32);
      }

      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v14, "allObjects"));
      id v40 = [v39 mutableCopy];
      id v41 = *(void **)(*(void *)&v83[8] + 40LL);
      *(void *)(*(void *)&v83[8] + 40LL) = v40;
    }

    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
    unsigned int v43 = [v12 shouldSyncThirdPartyUserVocabularyForSyncKeys:*(void *)(*(void *)&v83[8] + 40)];
    unsigned int v44 = [v12 shouldSyncIntentPolicyForSyncKeys:*(void *)(*(void *)&v83[8] + 40)];
    char v45 = v44;
    if (v43)
    {
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v42 allVocabSyncInfo]);
      if (![v46 count])
      {
        __int128 v75 = @"com.apple.siri.vocabularyupdates";
        id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
        sub_1002D6A38(v47);

        if (v54) {
          -[NSMutableSet removeObject:]( self->_outstandingSyncPromiseKeys,  "removeObject:",  @"com.apple.siri.vocabularyupdates");
        }
      }

      if ((v45 & 1) == 0)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _appMetaDataListFromVocabSources:appIdentifyingInfoList:]( self,  "_appMetaDataListFromVocabSources:appIdentifyingInfoList:",  v46,  0LL));
        id v49 = [v48 mutableCopy];
        ((void (*)(void *, id, void))v51[2])(v51, v49, 0LL);

LABEL_42:
LABEL_44:

        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(v83, 8);

        goto LABEL_45;
      }
    }

    else
    {
      if (!v44)
      {
        ((void (*)(void *, void, void))v51[2])(v51, 0LL, 0LL);
        goto LABEL_44;
      }

      id v46 = 0LL;
    }

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100055B5C;
    v55[3] = &unk_1004EE878;
    v55[4] = self;
    id v56 = v54;
    v57 = v51;
    -[ADCommandCenter _fetchAllAppSourcesForSyncingWithCustomVocabInfo:completion:]( self,  "_fetchAllAppSourcesForSyncingWithCustomVocabInfo:completion:",  v46,  v55);

    goto LABEL_42;
  }

  id v28 = (os_log_s *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v83 = 136315394;
    *(void *)&v83[4] = "-[ADCommandCenter(Sync) _sync_syncAnchorKeys:forceReset:reasons:forSyncPromise:]";
    *(_WORD *)&v83[12] = 2112;
    *(void *)&v83[14] = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Sync not allowed - posting sync finished notification for %@",  v83,  0x16u);
  }

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification notificationWithName:object:]( &OBJC_CLASS___NSNotification,  "notificationWithName:object:",  @"ADSyncFinishedNotification",  v10));
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v30 postNotification:v29];

LABEL_45:
}

- (void)_sync_setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4
{
  self->_shouldPostSyncVerifyFinishedNotification = a4;
  self->_needVerificationFullReport = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SASyncClientVerify);
  [v5 setAceId:@"ClientSideInitiatedSyncVerification"];
  -[ADCommandCenter _saSyncClientVerify:completion:](self, "_saSyncClientVerify:completion:", v5, 0LL);
}

- (void)_sync_setSyncDelegate:(id)a3
{
}

- (BOOL)_syncController_hasCommandForRefId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _syncControllerService](self, "_syncControllerService"));
  unsigned __int8 v6 = [v5 syncInProgressForRefId:v4];

  return v6;
}

- (id)_contextManager
{
  contextManager = self->_contextManager;
  if (!contextManager)
  {
    id v4 = -[ADContextManager initWithDelegate:](objc_alloc(&OBJC_CLASS___ADContextManager), "initWithDelegate:", self);
    id v5 = self->_contextManager;
    self->_contextManager = v4;

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextDonationService defaultService](&OBJC_CLASS___AFContextDonationService, "defaultService"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADContextManager localContextStore](self->_contextManager, "localContextStore"));
    [v6 setDonationService:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADNotificationManager sharedManager](&OBJC_CLASS___ADNotificationManager, "sharedManager"));
    [v8 addDelegate:self];

    contextManager = self->_contextManager;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADContextManager delegate](contextManager, "delegate"));

  if (!v9) {
    -[ADContextManager setDelegate:](self->_contextManager, "setDelegate:", self);
  }
  return self->_contextManager;
}

- (void)withContextManager:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10005E55C;
    v6[3] = &unk_1004FD990;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (id)_sendContextPromiseForTypes:(int64_t)a3
{
  return -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  a3,  0LL);
}

- (id)_sendContextPromiseForTypes:(int64_t)a3 withAceId:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___SAContextPromise);
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = v8;
  if ((v4 & 1) != 0)
  {
    -[NSMutableArray addObject:](v8, "addObject:", SAContextTypeAPPLICATION_CONTEXTValue);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }

  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }

  -[NSMutableArray addObject:](v9, "addObject:", SAContextTypeALERT_CONTEXTValue);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }

- (void)_context_rollbackClearContext
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter(Context) _context_rollbackClearContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  if (self->_lastClearContext)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___SARollbackRequest);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAClearContext aceId](self->_lastClearContext, "aceId"));
    [v4 setRequestId:v5];

    -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v4);
    -[ADCommandCenter _setBackgroundContext](self, "_setBackgroundContext");
  }

- (void)_context_clearContextWithClearSiriKitContext:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADCommandCenter(Context) _context_clearContextWithClearSiriKitContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  int v6 = objc_alloc_init(&OBJC_CLASS___SAClearContext);
  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v6);
  objc_storeStrong((id *)&self->_lastClearContext, v6);
  if (v3)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___SAIntentGroupSiriKitClearContext);
    [v7 setReason:@"client_clear_context"];
    -[ADCommandCenter handleCommand:completion:](self, "handleCommand:completion:", v7, 0LL);
  }

  -[ADCommandCenter _setBackgroundContext](self, "_setBackgroundContext");
}

- (void)_context_setAlertContextDirty
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADCommandCenter(Context) _context_setAlertContextDirty]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  [v4 setAlertContextDirty];
}

- (void)_context_updateContext
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[ADCommandCenter(Context) _context_updateContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if ((AFSupportsHALFlowRouting() & 1) == 0) {
    -[ADCommandCenter _updateFlowContext](self, "_updateFlowContext");
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  [v4 keepReportingNowPlayingTimingEventsHeuristically];
  if ([v4 alertContextIsDirty])
  {
    -[ADCommandCenter _setAlertContext](self, "_setAlertContext");
  }

  else if ((AFIsMac() & 1) == 0)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10005E4D4;
    v6[3] = &unk_1004F46C8;
    v6[4] = self;
    [v5 getContextCollectorDeviceIdentifiersWithCompletion:v6];
  }

  -[ADCommandCenter _setSyncContext](self, "_setSyncContext");
}

- (void)_setAlertContext
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(Context) _setAlertContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  [v4 clearAlertContextDirtyState];
  int v5 = dispatch_group_create();
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000LL;
  id v39 = sub_10005DCB4;
  id v40 = sub_10005DCC4;
  id v41 = 0LL;
  v35[0] = 0LL;
  v35[1] = v35;
  v35[2] = 0x3032000000LL;
  v35[3] = sub_10005DCB4;
  v35[4] = sub_10005DCC4;
  id v36 = 0LL;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x3032000000LL;
  v33[3] = sub_10005DCB4;
  v33[4] = sub_10005DCC4;
  id v34 = 0LL;
  if ((AFIsNano() & 1) == 0)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADNotificationManager sharedManager](&OBJC_CLASS___ADNotificationManager, "sharedManager"));
    [v6 setDataSource:self];
    dispatch_group_enter(v5);
    if (AFIsDeviceUnlocked())
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_10005E0FC;
      v32[3] = &unk_1004F30F0;
      v32[5] = &buf;
      id v7 = v32;
      v32[4] = v5;
      [v6 fetchAllBulletinsWithCompletion:v32];
    }

    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10005E148;
      v31[3] = &unk_1004F30F0;
      void v31[5] = &buf;
      id v7 = v31;
      v31[4] = v5;
      [v6 fetchBulletinsOnLockScreenWithCompletion:v31];
    }
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[ADClockService sharedService](&OBJC_CLASS___ADClockService, "sharedService"));
  id v9 = (void *)v8;
  if (v8)
  {
    dispatch_group_enter(v5);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10005E194;
    v27[3] = &unk_1004EE8A0;
    __int128 v29 = v35;
    id v30 = v33;
    id v28 = v5;
    [v9 getSnapshotsWithCompletion:v27];
  }

  uint64_t v10 = SiriCoreUUIDStringCreate(v8);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = SiriCoreUUIDStringCreate(  -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  32LL,  v11));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 =  -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  2LL,  v13);
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10005E21C;
  v19[3] = &unk_1004EE918;
  p___int128 buf = &buf;
  unsigned int v25 = v35;
  id v26 = v33;
  id v20 = v4;
  id v21 = self;
  id v22 = v11;
  id v23 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v4;
  dispatch_group_notify(v5, v15, v19);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&buf, 8);
}

- (void)_setBackgroundContext
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v15 = "-[ADCommandCenter(Context) _setBackgroundContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  uint64_t v5 = SiriCoreUUIDStringCreate([v4 clearBackgroundContextDirtyState]);
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_10005DF54;
  uint64_t v11 = &unk_1004EE940;
  uint64_t v12 = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v6 = v13;
  [v4 getBackgroundContext:&v8];
  id v7 =  -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  4LL,  v6,  v8,  v9,  v10,  v11,  v12);
}

- (void)_setSyncContext
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v6 = "-[ADCommandCenter(Context) _setSyncContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005DE30;
  v4[3] = &unk_1004FDAA8;
  v4[4] = self;
  sub_1002D63C4(v4);
}

- (void)_setRestrictedAppContext
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v4)
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(Context) _setRestrictedAppContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v5 = SiriCoreUUIDStringCreate(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_10005DCB4;
  id v31 = sub_10005DCC4;
  id v32 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10005DCCC;
  v24[3] = &unk_1004FBE80;
  id v7 = v6;
  id v26 = self;
  p___int128 buf = &buf;
  id v25 = v7;
  uint64_t v8 = objc_retainBlock(v24);
  uint64_t v10 = AFIsHorseman(v8, v9);
  if ((v10 & 1) != 0 || AFIsATV(v10, v11))
  {
    uint64_t v12 = _AFPreferencesNotificationPreviewRestrictedApps(  -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  16LL,  v7));
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    id v14 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v13;

    ((void (*)(void *))v8[2])(v8);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADNotificationManager sharedManager](&OBJC_CLASS___ADNotificationManager, "sharedManager"));
    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    uint64_t v19 = sub_10005DD2C;
    id v20 = &unk_1004FACB8;
    id v23 = &buf;
    id v21 = self;
    id v22 = v8;
    [v15 fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:&v17];

    id v16 =  -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  16LL,  v7,  v17,  v18,  v19,  v20,  v21);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)_updateFlowContext
{
  if (AFSupportsHALFlowRouting(self, a2))
  {
    BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v7 = "-[ADCommandCenter(Context) _updateFlowContext]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }

    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10005DB84;
    v5[3] = &unk_1004FDAA8;
    v5[4] = self;
    [v4 getContextSnapshotForCurrentRequestWithCompletion:v5];
  }

- (void)_ensureBackgroundContextSentToServer
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  unsigned int v4 = [v3 backgroundContextIsDirty];

  if (v4) {
    -[ADCommandCenter _setBackgroundContext](self, "_setBackgroundContext");
  }
}

- (void)_context_willSetApplicationContextWithRefId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[ADCommandCenter(Context) _context_willSetApplicationContextWithRefId:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 =  -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  1LL,  v4);
}

- (void)_context_setSTApplicationContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v11 = "-[ADCommandCenter(Context) _context_setSTApplicationContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _aceValue]);
    if ([v6 count])
    {
      id v7 = objc_alloc_init(&OBJC_CLASS___SASetApplicationContext);
      __int16 v9 = v6;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
      [v7 setOrderedContext:v8];

      -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v7);
    }
  }
}

- (void)_context_setApplicationContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v53 = "-[ADCommandCenter(Context) _context_setApplicationContext:]";
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  -[ADCommandCenter _ensureBackgroundContextSentToServer](self, "_ensureBackgroundContextSentToServer");
  id v34 = self;
  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v4);
  id v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v35 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 orderedContext]);
  id v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
    uint64_t v9 = *(void *)v47;
    uint64_t v36 = *(void *)v47;
    do
    {
      id v10 = 0LL;
      id v38 = v7;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(v8[470]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          id v40 = v10;
          id v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          id v13 = v11;
          id v14 = [v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v14)
          {
            id v15 = v14;
            id v16 = 0LL;
            uint64_t v17 = *(void *)v43;
            do
            {
              for (i = 0LL; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v43 != v17) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v19 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
                uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
                {
                  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[AceObject aceObjectWithDictionary:]( &OBJC_CLASS___AceObject,  "aceObjectWithDictionary:",  v19));
                  uint64_t v22 = objc_opt_class(&OBJC_CLASS___SAAppInfo);
                  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
                  {
                    id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 appIdentifyingInfo]);
                    uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 bundleId]);

                    id v16 = (void *)v24;
                  }

                  else
                  {
                    uint64_t v25 = objc_opt_class(&OBJC_CLASS___SADomainObject);
                    if ((objc_opt_isKindOfClass(v21, v25) & 1) != 0) {
                      -[NSMutableArray addObject:](v41, "addObject:", v21);
                    }
                  }
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }

            while (v15);
          }

          else
          {
            id v16 = 0LL;
          }

          id v26 = [[AFApplicationContext alloc] initWithAssociatedBundleIdentifier:v16 bulletin:0 aceContext:0 contextDictionary:0 aceContexts:v41];
          -[NSMutableArray addObject:](v37, "addObject:", v26);

          uint64_t v8 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
          id v7 = v38;
          uint64_t v9 = v36;
          id v10 = v40;
        }

        id v10 = (char *)v10 + 1;
      }

      while (v10 != v7);
      id v7 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v7);
  }

  id v27 = [[AFApplicationContextSnapshot alloc] initWithApplicationContexts:v37];
  id v28 = objc_alloc(&OBJC_CLASS___AFDeviceContextMetadata);
  uint64_t v29 = AFDeviceContextKeyApplication;
  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 15.0));
  id v32 = [v28 initWithType:v29 deliveryDate:v30 expirationDate:v31 redactedKeyPaths:0 historyConfiguration:0];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[AFContextDonationService defaultService](&OBJC_CLASS___AFContextDonationService, "defaultService"));
  [v33 registerContextTransformer:v34 forType:v29];
  [v33 donateContext:v27 withMetadata:v32 pushToRemote:0];
}

- (void)_context_fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  uint64_t v8 = (dispatch_group_s *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    __int128 v45 = "-[ADCommandCenter(Context) _context_fetchAppicationContextForApplicationInfo:supplementalContext:refID:]";
    __int16 v46 = 2112;
    __int128 v47 = v8;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s fetching context from %@, additional context provided: %@",  buf,  0x20u);
  }

  -[ADCommandCenter _ensureBackgroundContextSentToServer](self, "_ensureBackgroundContextSentToServer");
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sendContextPromiseForTypes:](self, "_sendContextPromiseForTypes:", 1LL));
  }
  id v13 = v12;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ([v9 count])
  {
    uint64_t v25 = v13;
    id v26 = v10;
    id v27 = v8;
    id v16 = dispatch_group_create();
    uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v45 = "-[ADCommandCenter(Context) _context_fetchAppicationContextForApplicationInfo:supplementalContext:refID:]";
      __int16 v46 = 2048;
      __int128 v47 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id obj = v9;
    id v18 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v40;
      do
      {
        id v21 = 0LL;
        do
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)v21);
          dispatch_group_enter(v16);
          id v23 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = 136315394;
            __int128 v45 = "-[ADCommandCenter(Context) _context_fetchAppicationContextForApplicationInfo:supplementalContext:refID:]";
            __int16 v46 = 2048;
            __int128 v47 = v16;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s #context Starting ordered fetch for context - %p",  buf,  0x16u);
          }

          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472LL;
          v34[2] = sub_10005D934;
          v34[3] = &unk_1004EE968;
          uint64_t v35 = v14;
          uint64_t v36 = self;
          id v37 = v16;
          id v38 = v15;
          -[ADCommandCenter _getTransformedApplicationContextForContext:completion:]( self,  "_getTransformedApplicationContextForContext:completion:",  v22,  v34);

          id v21 = (char *)v21 + 1;
        }

        while (v19 != v21);
        id v19 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }

      while (v19);
    }

    uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005D9E4;
    block[3] = &unk_1004F7698;
    void block[4] = self;
    uint64_t v8 = v27;
    id v30 = v27;
    id v31 = v15;
    id v32 = v14;
    id v13 = v25;
    id v33 = v25;
    dispatch_group_notify(v16, v24, block);

    id v10 = v26;
  }

  else
  {
    -[ADCommandCenter _fetchAndSendApplicationContextForApplicationInfos:fetchedOrderedContextDictionaries:applicationContexts:refID:]( self,  "_fetchAndSendApplicationContextForApplicationInfos:fetchedOrderedContextDictionaries:applicationContexts:refID:",  v8,  v15,  v14,  v13);
  }
}

- (void)_fetchAndSendApplicationContextForApplicationInfos:(id)a3 fetchedOrderedContextDictionaries:(id)a4 applicationContexts:(id)a5 refID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = SiriCoreUUIDStringCreate(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315906;
    uint64_t v29 = "-[ADCommandCenter(Context) _fetchAndSendApplicationContextForApplicationInfos:fetchedOrderedContextDictionarie"
          "s:applicationContexts:refID:]";
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    uint64_t v35 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s #context Starting app context fetch for - %@ with refId - %@, aceId - %@",  buf,  0x2Au);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  int64_t v18 = -[ADCommandCenter _context_deviceState](self, "_context_deviceState");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005D2AC;
  v23[3] = &unk_1004EEA08;
  v23[4] = self;
  id v24 = v11;
  id v25 = v13;
  id v26 = v15;
  id v27 = v12;
  id v19 = v12;
  id v20 = v15;
  id v21 = v13;
  id v22 = v11;
  [v17 getAppContextForDeviceState:v18 applicationInfos:v10 completion:v23];
}

- (void)_getTransformedApplicationContextForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = (void (**)(id, void *))a4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 associatedBundleIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bulletin]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 aceContext]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 contextDictionary]);
    id v12 = (void *)v11;
    if (v9)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 saNotificationObject]);
      uint64_t v14 = (void *)v13;
      if (v13)
      {
        uint64_t v25 = v13;
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
        if (!v8) {
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationId]);
        }
      }

      else
      {
        id v15 = 0LL;
      }

      goto LABEL_16;
    }

    if (v11
      && (![v8 caseInsensitiveCompare:@"com.apple.MobileSMS"]
       || -[ADCommandCenter _context_bundleIdHasSupportForCarPlayRequiredMessageIntents:]( self,  "_context_bundleIdHasSupportForCarPlayRequiredMessageIntents:",  v8)))
    {
      uint64_t AceDomainObjectsFromContext = AFMessagesGetAceDomainObjectsFromContext(v12);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(AceDomainObjectsFromContext);
    }

    else
    {
      if (!v10)
      {
        id v15 = 0LL;
        goto LABEL_16;
      }

      id v24 = v10;
      uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    }

    id v15 = (void *)v17;
LABEL_16:
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10005D264;
    v21[3] = &unk_1004F0D40;
    id v22 = v8;
    id v23 = v15;
    id v18 = v15;
    id v19 = v8;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 mutatedCopyWithMutator:v21]);
    v7[2](v7, v20);
  }
}

- (void)_getOrderedContextDictionaryForTransformedAFApplicationContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, NSMutableArray *))a4;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 associatedBundleIdentifier]);
    if (v8)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___SASyncAppIdentifyingInfo);
      [v9 setBundleId:v8];
      id v10 = objc_alloc_init(&OBJC_CLASS___SAAppInfo);
      [v10 setAppIdentifyingInfo:v9];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionary]);
      id v15 = v11;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
      -[NSMutableArray addObject:](v7, "addObject:", v12);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 aceContexts]);
    if (v13)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[AceObject dictionaryArrayWithAceObjectArray:]( &OBJC_CLASS___AceObject,  "dictionaryArrayWithAceObjectArray:",  v13));
      -[NSMutableArray addObject:](v7, "addObject:", v14);
    }

    v6[2](v6, v7);
  }
}

- (void)_context_setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6 = (dispatch_group_s *)a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    __int128 v61 = "-[ADCommandCenter(Context) _context_setOverriddenApplicationContext:withContext:]";
    __int16 v62 = 2112;
    __int128 v63 = v6;
    __int16 v64 = 2112;
    id v65 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  -[ADCommandCenter _ensureBackgroundContextSentToServer](self, "_ensureBackgroundContextSentToServer");
  if (v6)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___SASyncAppIdentifyingInfo);
    [v9 setBundleId:v6];
    id v10 = objc_alloc_init(&OBJC_CLASS___SAAppInfo);
    [v10 setAppIdentifyingInfo:v9];
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionary]);
    __int128 v59 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));
    -[NSMutableArray addObject:](v11, "addObject:", v13);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sendContextPromiseForTypes:](self, "_sendContextPromiseForTypes:", 1LL));
    id v15 = dispatch_group_create();
    if (-[dispatch_group_s caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", @"com.apple.mobilePhone"))
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___AFBulletin);
      if ((objc_opt_isKindOfClass(v7, v16) & 1) != 0)
      {
        __int128 v41 = v15;
        id v17 = v10;
        id v18 = v7;
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 saNotificationObject]);
        id v20 = (void *)v19;
        if (v19)
        {
          __int128 v44 = v14;
          uint64_t v58 = v19;
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v58,  1LL));
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[AceObject dictionaryArrayWithAceObjectArray:]( &OBJC_CLASS___AceObject,  "dictionaryArrayWithAceObjectArray:",  v21));
          -[NSMutableArray addObject:](v11, "addObject:", v22);

          uint64_t v14 = v44;
        }

        id v10 = v17;
        id v15 = v41;
      }

      else if (v7)
      {
        if (-[dispatch_group_s caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", @"com.apple.MobileSMS")
          && !-[ADCommandCenter _context_bundleIdHasSupportForCarPlayRequiredMessageIntents:]( self,  "_context_bundleIdHasSupportForCarPlayRequiredMessageIntents:",  v6))
        {
          if (!-[dispatch_group_s caseInsensitiveCompare:](v6, "caseInsensitiveCompare:", @"com.apple.siri"))
          {
            id v57 = v7;
            id v38 = v14;
            __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v57,  1LL));
            __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[AceObject dictionaryArrayWithAceObjectArray:]( &OBJC_CLASS___AceObject,  "dictionaryArrayWithAceObjectArray:",  v39));

            uint64_t v14 = v38;
            -[NSMutableArray addObject:](v11, "addObject:", v40);
          }
        }

        else
        {
          dispatch_group_enter(v15);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_10005D114;
          v50[3] = &unk_1004F9100;
          v50[4] = self;
          uint64_t v51 = v11;
          v52 = v15;
          [v25 getDomainObjectFromMessageContext:v7 completion:v50];
        }
      }
    }

    else
    {
      dispatch_group_enter(v15);
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___AFBulletin);
      id v42 = v10;
      id v43 = v9;
      __int128 v45 = v14;
      if ((objc_opt_isKindOfClass(v7, v23) & 1) != 0) {
        id v24 = v7;
      }
      else {
        id v24 = 0LL;
      }
      id v26 = objc_alloc_init(&OBJC_CLASS___SAPhoneSearch);
      [v26 setIsNew:&off_100513120];
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 date]);
      [v26 setStart:v27];

      id v28 = (void *)objc_claimAutoreleasedReturnValue([v24 endDate]);
      [v26 setEnd:v28];

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v24 sectionSubtype] == (id)3));
      [v26 setVoiceMail:v29];

      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v26 encodedClassName]);
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v30 serviceForDomain:@"com.apple.ace.phone" command:v31]);

      if (v32)
      {
        id v33 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          __int16 v34 = v33;
          __int128 v41 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v32 identifier]);
          *(_DWORD *)__int128 buf = 136315394;
          __int128 v61 = "-[ADCommandCenter(Context) _context_setOverriddenApplicationContext:withContext:]";
          __int16 v62 = 2112;
          __int128 v63 = v41;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "%s Dispatching phone search for overridden application context %@",  buf,  0x16u);
        }

        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472LL;
        v53[2] = sub_10005CF8C;
        v53[3] = &unk_1004EEA30;
        id v54 = v26;
        id v55 = self;
        id v56 = v15;
        [v32 handleCommand:v54 forDomain:@"com.apple.ace.phone" executionContext:0 reply:v53];
      }

      id v10 = v42;
      id v9 = v43;
      uint64_t v14 = v45;
    }

    uint64_t v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue", v41));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005D1D4;
    block[3] = &unk_1004FD4C0;
    __int128 v47 = v11;
    id v48 = v14;
    id v49 = self;
    id v36 = v14;
    id v37 = v11;
    dispatch_group_notify(v15, v35, block);
  }
}

- (BOOL)_context_bundleIdHasSupportForCarPlayRequiredMessageIntents:(id)a3
{
  id v3 = a3;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2050000000LL;
  id v4 = (void *)qword_1005779E0;
  uint64_t v27 = qword_1005779E0;
  if (!qword_1005779E0)
  {
    uint64_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    uint64_t v21 = (uint64_t)sub_10005CDC4;
    id v22 = &unk_1004FDB20;
    uint64_t v23 = &v24;
    sub_10005CDC4((uint64_t)&v19);
    id v4 = (void *)v25[3];
  }

  id v5 = v4;
  _Block_object_dispose(&v24, 8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appInfoWithAppProxy:v6]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedIntents]);
  uint64_t v19 = 0LL;
  uint64_t v20 = (uint64_t)&v19;
  uint64_t v21 = 0x2020000000LL;
  id v9 = (id *)qword_1005779F0;
  id v22 = (void *)qword_1005779F0;
  if (!qword_1005779F0)
  {
    id v10 = sub_10005CE88();
    id v9 = (id *)dlsym(v10, "INSendMessageIntentIdentifier");
    *(void *)(v20 + 24) = v9;
    qword_1005779F0 = (uint64_t)v9;
  }

  _Block_object_dispose(&v19, 8);
  if (v9)
  {
    id v11 = *v9;
    if (![v8 containsObject:v11])
    {
      unsigned __int8 v15 = 0;
      goto LABEL_12;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedIntents]);
    uint64_t v19 = 0LL;
    uint64_t v20 = (uint64_t)&v19;
    uint64_t v21 = 0x2020000000LL;
    uint64_t v13 = (void *)qword_1005779F8;
    id v22 = (void *)qword_1005779F8;
    if (!qword_1005779F8)
    {
      uint64_t v14 = sub_10005CE88();
      uint64_t v13 = dlsym(v14, "INSearchForMessagesIntentIdentifier");
      *(void *)(v20 + 24) = v13;
      qword_1005779F8 = (uint64_t)v13;
    }

    _Block_object_dispose(&v19, 8);
    if (v13)
    {
      unsigned __int8 v15 = [v12 containsObject:*v13];

LABEL_12:
      return v15;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINSearchForMessagesIntentIdentifier(void)"));
    objc_msgSend( v17,  "handleFailureInFunction:file:lineNumber:description:",  v18,  @"ADCommandCenter_Context.m",  62,  @"%s",  dlerror(),  v19);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getINSendMessageIntentIdentifier(void)"));
    objc_msgSend( v17,  "handleFailureInFunction:file:lineNumber:description:",  v18,  @"ADCommandCenter_Context.m",  63,  @"%s",  dlerror(),  v19);
  }

  __break(1u);
  return result;
}

- (int64_t)_context_deviceState
{
  int64_t v3 = -[ADCommandCenter _deviceIsLocked](self, "_deviceIsLocked");
  if (-[ADCommandCenter _isInStarkMode](self, "_isInStarkMode")) {
    return v3 | 2;
  }
  else {
    return v3;
  }
}

- (void)_context_setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v24 = "-[ADCommandCenter(Context) _context_setApplicationContextForApplicationInfos:withRefId:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v9 = -[ADCommandCenter _ensureBackgroundContextSentToServer](self, "_ensureBackgroundContextSentToServer");
  if (v7)
  {
    id v10 = v7;
  }

  else
  {
    uint64_t v11 = SiriCoreUUIDStringCreate(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v11);
  }

  id v12 = v10;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  int64_t v14 = -[ADCommandCenter _context_deviceState](self, "_context_deviceState");
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = sub_10005CCBC;
  uint64_t v20 = &unk_1004EEA58;
  uint64_t v21 = self;
  id v22 = v12;
  id v15 = v12;
  [v13 getAppContextForDeviceState:v14 applicationInfos:v6 completion:&v17];

  id v16 =  -[ADCommandCenter _sendContextPromiseForTypes:withAceId:]( self,  "_sendContextPromiseForTypes:withAceId:",  1LL,  v15,  v17,  v18,  v19,  v20,  v21);
}

- (void)_context_acknowledgeBulletinForObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
    [v5 markBulletinAsAcknolwedgedForDomainObject:v4];
  }

- (void)_context_fetchApplicationContextForApplicationInfos:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  int64_t v9 = -[ADCommandCenter _context_deviceState](self, "_context_deviceState");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005CCA8;
  v11[3] = &unk_1004F9E10;
  id v12 = v6;
  id v10 = v6;
  [v8 getAppContextForDeviceState:v9 applicationInfos:v7 completion:v11];
}

- (void)_context_reset
{
  if ((AFIsHorseman(self, a2) & 1) == 0 && (AFIsNano() & 1) == 0)
  {
    int64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      contextManager = self->_contextManager;
      int v5 = 136315394;
      id v6 = "-[ADCommandCenter(Context) _context_reset]";
      __int16 v7 = 2048;
      uint64_t v8 = contextManager;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Resetting ContextManager %p",  (uint8_t *)&v5,  0x16u);
    }

    -[ADContextManager reset](self->_contextManager, "reset");
    -[ADContextManager setDelegate:](self->_contextManager, "setDelegate:", 0LL);
  }

- (void)contextManagerDidUpdateBackgroundContext:(id)a3
{
  id v4 = a3;
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005CCA0;
  block[3] = &unk_1004FD940;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)fetchBulletinsOnLockScreenForNotificationManager:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005CC40;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)notificationManagerDidChangeBulletins:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005CC38;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)getRedactedContextForContextSnapshot:(id)a3 metadata:(id)a4 privacyPolicy:(int64_t)a5 completion:(id)a6
{
  id v7 = (void (*)(id, id, id))*((void *)a6 + 2);
  if (a5 == 10) {
    v7(a6, a3, a4);
  }
  else {
    ((void (*)(id, void, void, id))v7)(a6, 0LL, 0LL, a4);
  }
}

- (id)_testAgent
{
  uint64_t v2 = _AFPreferencesValueForKey(@"Unified Siri Test Enabled");
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {

    goto LABEL_14;
  }

  int64_t v14 = 0LL;
  if (!qword_100577E40)
  {
    *(_OWORD *)__int128 buf = off_1004F1BB8;
    *(void *)&buf[16] = 0LL;
    qword_100577E40 = _sl_dlopen(buf, &v14);
  }

  if (qword_100577E40)
  {
    id v5 = v14;
    if (!v14) {
      goto LABEL_7;
    }
  }

  else
  {
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *USTFoundationLibrary(void)"));
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v13,  @"ADCommandCenter_UnifiedSiriTest.m",  19,  @"%s",  v14);

    __break(1u);
  }

  free(v5);
LABEL_7:
  id v6 = sub_100111358();

  if (!v6)
  {
LABEL_14:
    id v11 = 0LL;
    return v11;
  }

  id v7 = (void *)qword_100577E38;
  if (!qword_100577E38)
  {
    id v8 = objc_alloc_init((Class)sub_100111358());
    id v9 = (void *)qword_100577E38;
    qword_100577E38 = (uint64_t)v8;

    id v10 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADCommandCenter(UnifiedSiriTest) _testAgent]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = qword_100577E38;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Created %@", buf, 0x16u);
    }

    id v7 = (void *)qword_100577E38;
  }

  id v11 = v7;
  return v11;
}

- (void)_notifyUSTForAceCommand:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 encodedClassName]);
    int v9 = 136315394;
    id v10 = "-[ADCommandCenter(UnifiedSiriTest) _notifyUSTForAceCommand:]";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Notify USTAgent for AceObject '%@'",  (uint8_t *)&v9,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _testAgent](self, "_testAgent"));
  [v8 logAceEvent:v4];
}

- (void)_notifyUSTForRequestStarted:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCommandCenter(UnifiedSiriTest) _notifyUSTForRequestStarted:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Notify USTAgent for RequestStarted with requestId '%@'",  (uint8_t *)&v7,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _testAgent](self, "_testAgent"));
  [v6 signalRequestStartedWithRequestId:v4];
}

- (void)_notifyUSTForRequestCompleted:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCommandCenter(UnifiedSiriTest) _notifyUSTForRequestCompleted:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Notify USTAgent for RequestCompleted with requestId '%@'",  (uint8_t *)&v7,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _testAgent](self, "_testAgent"));
  [v6 signalRequestCompletedForRequestId:v4];
}

- (void)_registerNanoServicesWithServiceManager:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ADSiriAppLaunchRequestHandler);
  -[ADSiriAppLaunchRequestHandler setDelegate:](v5, "setDelegate:", self);
  id v6 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v7 = SAAppsGroupIdentifier;
  v144 = -[ADServiceCommandType initWithDomainName:className:]( v6,  "initWithDomainName:className:",  SAAppsGroupIdentifier,  SAAppsLaunchAppClassIdentifier);
  id v8 = objc_alloc(&OBJC_CLASS___ADSiriTaskService);
  __int16 v9 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughRequestTransformer);
  id v10 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughResponseTransformer);
  __int16 v11 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( v8,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v144,  v9,  v10,  v5);
  [v4 addService:v11];

  id v12 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v140 = -[ADServiceCommandType initWithDomainName:className:]( v12,  "initWithDomainName:className:",  v7,  SAAppsCheckRestrictionClassIdentifier);
  uint64_t v13 = objc_alloc(&OBJC_CLASS___ADSiriTaskService);
  int64_t v14 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughRequestTransformer);
  id v15 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughResponseTransformer);
  id v16 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( v13,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v140,  v14,  v15,  v5);
  [v4 addService:v16];

  id v17 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v18 = -[ADServiceCommandType initWithDomainName:className:]( v17,  "initWithDomainName:className:",  v7,  SAAppsGetRestrictedAppsClassIdentifier);
  uint64_t v19 = objc_alloc(&OBJC_CLASS___ADSiriTaskService);
  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughRequestTransformer);
  uint64_t v21 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughResponseTransformer);
  id v22 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( v19,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v18,  v20,  v21,  v5);
  [v4 addService:v22];

  uint64_t v23 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v24 = -[ADServiceCommandType initWithDomainName:className:]( v23,  "initWithDomainName:className:",  v7,  SAAppsAppSearchClassIdentifier);
  __int16 v25 = objc_alloc(&OBJC_CLASS___ADSiriTaskService);
  id v26 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughRequestTransformer);
  uint64_t v27 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughResponseTransformer);
  id v28 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( v25,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v24,  v26,  v27,  v5);
  [v4 addService:v28];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.MobileSMS"));
  [v29 setDelegate:self];
  __int16 v30 = objc_alloc_init(&OBJC_CLASS___ADMessagesTransformer);
  id v31 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v32 = SASmsGroupIdentifier;
  id v33 = -[ADServiceCommandType initWithDomainName:className:]( v31,  "initWithDomainName:className:",  SASmsGroupIdentifier,  SASmsDraftShowClassIdentifier);
  __int16 v34 = objc_alloc(&OBJC_CLASS___ADSiriTaskService);
  uint64_t v35 = objc_alloc_init(&OBJC_CLASS___ADSiriRequestSucceededResponseTransformer);
  id v36 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( v34,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v33,  v30,  v35,  v29);
  [v4 addService:v36];

  id v37 = (void *)objc_claimAutoreleasedReturnValue( +[ADServiceCommandType domainObjectCommitTypeForDomainNamed:]( &OBJC_CLASS___ADServiceCommandType,  "domainObjectCommitTypeForDomainNamed:",  v32));
  id v38 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v37,  v30,  v30,  v29);
  [v4 addService:v38];

  __int128 v39 = -[ADManagedObjectService initWithDomainName:]( objc_alloc(&OBJC_CLASS___ADManagedObjectService),  "initWithDomainName:",  v32);
  [v4 addService:v39];

  __int128 v40 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  __int128 v41 = -[ADServiceCommandType initWithDomainName:className:]( v40,  "initWithDomainName:className:",  SACalendarGroupIdentifier,  SACalendarShowNextEventClassIdentifier);
  id v42 = objc_alloc(&OBJC_CLASS___ADSiriTaskService);
  id v43 = objc_alloc_init(&OBJC_CLASS___ADCalendarTransformer);
  __int128 v44 = objc_alloc_init(&OBJC_CLASS___ADCalendarTransformer);
  __int128 v45 = objc_alloc_init(&OBJC_CLASS___ADShowNextEventRequestHandler);
  __int16 v46 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( v42,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v41,  v43,  v44,  v45);
  [v4 addService:v46];

  __int128 v47 = objc_alloc_init(&OBJC_CLASS___ADTimerTransformer);
  id v48 = objc_alloc_init(&OBJC_CLASS___ADTimerRequestHandler);
  id v49 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v50 = SATimerGroupIdentifier;
  v145 = -[ADServiceCommandType initWithDomainName:className:]( v49,  "initWithDomainName:className:",  SATimerGroupIdentifier,  SATimerGetClassIdentifier);
  uint64_t v51 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v145,  v47,  v47,  v48);
  [v4 addService:v51];

  v52 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v141 = -[ADServiceCommandType initWithDomainName:className:]( v52,  "initWithDomainName:className:",  v50,  SATimerSetClassIdentifier);
  id v53 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v141,  v47,  v47,  v48);
  [v4 addService:v53];

  id v54 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v138 = -[ADServiceCommandType initWithDomainName:className:]( v54,  "initWithDomainName:className:",  v50,  SATimerPauseClassIdentifier);
  id v55 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v138,  v47,  v47,  v48);
  [v4 addService:v55];

  id v56 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  id v57 = -[ADServiceCommandType initWithDomainName:className:]( v56,  "initWithDomainName:className:",  v50,  SATimerResumeClassIdentifier);
  uint64_t v58 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v57,  v47,  v47,  v48);
  [v4 addService:v58];

  __int128 v59 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  __int128 v60 = -[ADServiceCommandType initWithDomainName:className:]( v59,  "initWithDomainName:className:",  v50,  SATimerCancelClassIdentifier);
  __int128 v61 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v60,  v47,  v47,  v48);
  [v4 addService:v61];

  __int16 v62 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  __int128 v63 = -[ADServiceCommandType initWithDomainName:className:]( v62,  "initWithDomainName:className:",  v50,  SATimerDismissClassIdentifier);
  __int16 v64 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v63,  v47,  v47,  v48);
  [v4 addService:v64];

  id v65 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.private.NanoTimer"));
  [v65 setDelegate:self];
  v66 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  id v67 = -[ADServiceCommandType initWithDomainName:className:]( v66,  "initWithDomainName:className:",  v50,  SATimerShowTimerAndPerformActionClassIdentifier);
  id v68 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v67,  v47,  v47,  v65);
  [v4 addService:v68];

  __int128 v69 = objc_alloc_init(&OBJC_CLASS___ADAlarmTransformer);
  BOOL v70 = objc_alloc_init(&OBJC_CLASS___ADAlarmRequestHandler);
  uint64_t v71 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v72 = SAAlarmGroupIdentifier;
  v146 = -[ADServiceCommandType initWithDomainName:className:]( v71,  "initWithDomainName:className:",  SAAlarmGroupIdentifier,  SAAlarmCreateClassIdentifier);
  uint64_t v73 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v146,  v69,  v69,  v70);
  [v4 addService:v73];

  char v74 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v142 = -[ADServiceCommandType initWithDomainName:className:]( v74,  "initWithDomainName:className:",  v72,  SAAlarmUpdateClassIdentifier);
  __int128 v75 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v142,  v69,  v69,  v70);
  [v4 addService:v75];

  uint64_t v76 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v139 = -[ADServiceCommandType initWithDomainName:className:]( v76,  "initWithDomainName:className:",  v72,  SAAlarmSearchClassIdentifier);
  __int128 v77 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v139,  v69,  v69,  v70);
  [v4 addService:v77];

  id v78 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  __int16 v79 = -[ADServiceCommandType initWithDomainName:className:]( v78,  "initWithDomainName:className:",  v72,  SAAlarmDeleteClassIdentifier);
  uint64_t v80 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v79,  v69,  v69,  v70);
  [v4 addService:v80];

  v81 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.NanoAlarm"));
  [v81 setDelegate:self];
  v82 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v83 = -[ADServiceCommandType initWithDomainName:className:]( v82,  "initWithDomainName:className:",  v72,  SAAlarmShowAndPerformAlarmActionClassIdentifier);
  __int16 v84 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v83,  v69,  v69,  v81);
  [v4 addService:v84];

  id v85 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  id v86 = -[ADServiceCommandType initWithDomainName:className:]( v85,  "initWithDomainName:className:",  v72,  SAAlarmDismissClassIdentifier);
  id v87 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v86,  v69,  v69,  v70);
  [v4 addService:v87];

  v88 = objc_alloc_init(&OBJC_CLASS___ADSettingsTransformer);
  v89 = objc_alloc_init(&OBJC_CLASS___ADSettingsRequestHandler);
  v90 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v91 = SASettingGroupIdentifier;
  v147 = -[ADServiceCommandType initWithDomainName:className:]( v90,  "initWithDomainName:className:",  SASettingGroupIdentifier,  SASettingGetAirplaneModeClassIdentifier);
  v92 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v147,  v88,  v88,  v89);
  [v4 addService:v92];

  v93 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v143 = -[ADServiceCommandType initWithDomainName:className:]( v93,  "initWithDomainName:className:",  v91,  SASettingSetAirplaneModeClassIdentifier);
  v94 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v143,  v88,  v88,  v89);
  [v4 addService:v94];

  v95 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v96 = -[ADServiceCommandType initWithDomainName:className:]( v95,  "initWithDomainName:className:",  v91,  SASettingGetVoiceOverClassIdentifier);
  v97 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v96,  v88,  v88,  v89);
  [v4 addService:v97];

  v98 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v99 = -[ADServiceCommandType initWithDomainName:className:]( v98,  "initWithDomainName:className:",  v91,  SASettingSetVoiceOverClassIdentifier);
  v100 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v99,  v88,  v88,  v89);
  [v4 addService:v100];

  v101 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v102 = -[ADServiceCommandType initWithDomainName:className:]( v101,  "initWithDomainName:className:",  v91,  SASettingShowAndPerformSettingsActionClassIdentifier);
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.NanoSettings"));
  [v103 setDelegate:self];
  v104 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v102,  v88,  v88,  v103);
  [v4 addService:v104];

  v105 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.NanoMaps"));
  [v105 setDelegate:self];
  v106 = objc_alloc_init(&OBJC_CLASS___ADMapsTransformer);
  v107 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v108 = SALocalSearchGroupIdentifier;
  v109 = -[ADServiceCommandType initWithDomainName:className:]( v107,  "initWithDomainName:className:",  SALocalSearchGroupIdentifier,  SALocalSearchShowMapPointsClassIdentifier);
  v110 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v109,  v106,  v106,  v105);
  [v4 addService:v110];

  v111 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v112 = -[ADServiceCommandType initWithDomainName:className:]( v111,  "initWithDomainName:className:",  v108,  SALocalSearchNavigationEndClassIdentifier);
  v113 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v112,  v106,  v106,  v105);
  [v4 addService:v113];

  v114 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v115 = -[ADServiceCommandType initWithDomainName:className:]( v114,  "initWithDomainName:className:",  v108,  SALocalSearchNavigationPromptManeuverClassIdentifier);
  v116 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v115,  v106,  v106,  v105);
  [v4 addService:v116];

  v117 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v118 = -[ADServiceCommandType initWithDomainName:className:]( v117,  "initWithDomainName:className:",  v108,  SALocalSearchShowLocalSearchResultClassIdentifier);
  v119 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v118,  v106,  v106,  v105);
  [v4 addService:v119];

  v120 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.SessionTrackerApp"));
  [v120 setDelegate:self];
  v121 = objc_alloc_init(&OBJC_CLASS___ADWorkoutTransformer);
  v122 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  uint64_t v123 = SAHLGroupIdentifier;
  v124 = -[ADServiceCommandType initWithDomainName:className:]( v122,  "initWithDomainName:className:",  SAHLGroupIdentifier,  SAHLStartWorkoutClassIdentifier);
  v125 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v124,  v121,  v121,  v120);
  [v4 addService:v125];

  v126 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v127 = -[ADServiceCommandType initWithDomainName:className:]( v126,  "initWithDomainName:className:",  v123,  SAHLSetWorkoutStateClassIdentifier);
  v128 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v127,  v121,  v121,  v120);
  [v4 addService:v128];

  v129 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.ActivityMonitorApp"));
  [v129 setDelegate:self];
  v130 = objc_alloc_init(&OBJC_CLASS___ADHealthTransformer);
  v131 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v132 = -[ADServiceCommandType initWithDomainName:className:]( v131,  "initWithDomainName:className:",  v123,  SAHLShowActivityClassIdentifier);
  v133 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v132,  v130,  v130,  v129);
  [v4 addService:v133];

  id v148 = (id)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.NanoMail"));
  [v148 setDelegate:self];
  v134 = objc_alloc_init(&OBJC_CLASS___ADMailTransformer);
  v135 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  v136 = -[ADServiceCommandType initWithDomainName:className:]( v135,  "initWithDomainName:className:",  SAEmailGroupIdentifier,  SAEmailSendClassIdentifier);
  v137 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v136,  v134,  v134,  v148);
  [v4 addService:v137];
}

- (void)taskmaster:(id)a3 didReceivePunchoutOutcome:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10013EB40;
  v8[3] = &unk_1004FD968;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)taskmaster:(id)a3 didLaunchApplicationForRequestWithId:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v12 = "-[ADCommandCenter(NanoServices) taskmaster:didLaunchApplicationForRequestWithId:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013EB34;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)appLaunchHandler:(id)a3 didLaunchAppForRequestId:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v12 = "-[ADCommandCenter(NanoServices) appLaunchHandler:didLaunchAppForRequestId:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013EB28;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (ADCommandCenter)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ADCommandCenter;
  id v2 = -[ADCommandCenter init](&v25, "init");
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    id v4 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v3;

    id v5 = (dispatch_queue_s *)(id)qword_1005780B0;
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UNSPECIFIED, 0);
    id v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);

    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("ADCommandCenterQueue", v9, v5);
    __int16 v11 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v10;

    *((void *)v2 + 64) = 0LL;
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
    __int16 v13 = (void *)*((void *)v2 + 85);
    *((void *)v2 + 85) = v12;

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    id v15 = [v14 assistantIsEnabled];
    unsigned int v16 = [v14 dictationIsEnabled];
    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v27 = "-[ADCommandCenter init]";
      __int16 v28 = 1024;
      unsigned int v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s assistantIsEnabled = %d", buf, 0x12u);
      id v17 = (os_log_s *)AFSiriLogContextDaemon;
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v27 = "-[ADCommandCenter init]";
      __int16 v28 = 1024;
      unsigned int v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s dictationIsEnabled = %d", buf, 0x12u);
    }

    [v2 _createAssistantLocallyIfNeeded:v15];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v18 setDeviceWasRedirectedToProduction:0];

    uint64_t v19 = (dispatch_queue_s *)*((void *)v2 + 1);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001E6EB0;
    v21[3] = &unk_1004F5068;
    char v23 = (char)v15;
    char v24 = v16;
    id v22 = v2;
    dispatch_async(v19, v21);
  }

  return (ADCommandCenter *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADCommandCenter;
  -[ADCommandCenter dealloc](&v3, "dealloc");
}

- (void)_addOutstandingRequestId:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_attr_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    __int16 v13 = "-[ADCommandCenter _addOutstandingRequestId:forReason:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s requestId = %@, reason = %@",  (uint8_t *)&v12,  0x20u);
  }

  if (v6)
  {
    outstandingRequestIds = self->_outstandingRequestIds;
    if (!outstandingRequestIds)
    {
      dispatch_queue_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int16 v11 = self->_outstandingRequestIds;
      self->_outstandingRequestIds = v10;

      outstandingRequestIds = self->_outstandingRequestIds;
    }

    -[NSMutableSet addObject:](outstandingRequestIds, "addObject:", v6);
    -[ADCommandCenter _createRootExecutionContextForRequestID:](self, "_createRootExecutionContextForRequestID:", v6);
  }
}

- (void)_removeOutstandingRequestId:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_attr_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    dispatch_queue_t v10 = "-[ADCommandCenter _removeOutstandingRequestId:forReason:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s requestId = %@, reason = %@",  (uint8_t *)&v9,  0x20u);
  }

  if (v6)
  {
    -[ADCommandCenter _removeHandledCommandIdsForRequestId:](self, "_removeHandledCommandIdsForRequestId:", v6);
    -[ADCommandCenter _removePostCommandHandlingBlocksForRequestId:]( self,  "_removePostCommandHandlingBlocksForRequestId:",  v6);
    -[ADCommandCenter _destroyRootExecutionContextForRequestID:](self, "_destroyRootExecutionContextForRequestID:", v6);
    -[NSMutableSet removeObject:](self->_outstandingRequestIds, "removeObject:", v6);
  }
}

- (BOOL)_hasOutstandingRequestId:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_outstandingRequestIds, "containsObject:");
  }
  else {
    return 0;
  }
}

- (BOOL)_hasOutstandingRequests
{
  return -[NSMutableSet count](self->_outstandingRequestIds, "count") != 0LL;
}

- (id)_executionContextMatchingExecutionInfo:(id)a3 fallbackRequestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || (dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 requestID]),
        int v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _rootExecutionContextForRequestID:]( self,  "_rootExecutionContextForRequestID:",  v8)),  v8,  !v9)
    && (dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 executionID]),
        int v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _remoteExecutionContextForExecutionID:]( self,  "_remoteExecutionContextForExecutionID:",  v10)),  v10,  !v9))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _rootExecutionContextForRequestID:](self, "_rootExecutionContextForRequestID:", v7));
  }

  return v9;
}

- (NSDictionary)rootExecutionContexts
{
  return (NSDictionary *)self->_rootExecutionContextsByRequestID;
}

- (BOOL)_hasRootExecutionContextForRequestID:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _rootExecutionContextForRequestID:](self, "_rootExecutionContextForRequestID:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)_rootExecutionContextForRequestID:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_rootExecutionContextsByRequestID,  "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (void)_createRootExecutionContextForRequestID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_rootExecutionContextsByRequestID, "objectForKey:", v4));

    if (!v5)
    {
      if (!self->_rootExecutionContextsByRequestID)
      {
        id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        rootExecutionContextsByRequestID = self->_rootExecutionContextsByRequestID;
        self->_rootExecutionContextsByRequestID = v6;
      }

      dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AFInstanceContext endpointInfo](self->_instanceContext, "endpointInfo"));
      int v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
      dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localPeerInfo]);

      id v11 = objc_alloc(&OBJC_CLASS___AFRequestHandlingContext);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 idsDeviceUniqueIdentifier]);
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 assistantIdentifier]);
      id v14 = [v11 initWithRequestID:v4 inputDeviceID:v12 inputAssistantID:v13];

      if (AFIsHorseman(v15, v16))
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 rootAfHomeInfoForThisDevice]);
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      uint64_t v19 = objc_alloc(&OBJC_CLASS___AFCommandExecutionInfo);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo turnIdentifier](self->_currentRequestInfo, "turnIdentifier"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[AFInstanceContext info](self->_instanceContext, "info"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _restrictedCommands](self, "_restrictedCommands"));
      char v23 = -[AFCommandExecutionInfo initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:requestHandlingContextSnapshot:deviceRestrictions:userInfo:]( v19,  "initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:r equestHandlingContextSnapshot:deviceRestrictions:userInfo:",  v4,  v4,  v20,  0LL,  v18,  v8,  v21,  0LL,  v14,  v22,  0LL);

      char v24 = -[ADCommandExecutionContext initWithInfo:]( objc_alloc(&OBJC_CLASS___ADCommandExecutionContext),  "initWithInfo:",  v23);
      -[NSMutableDictionary setObject:forKey:](self->_rootExecutionContextsByRequestID, "setObject:forKey:", v24, v4);
      objc_storeStrong((id *)&self->_mostRecentRootExecutionContext, v24);
      objc_initWeak(&location, self);
      dispatch_time_t v25 = dispatch_time(0LL, 305000000000LL);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001E6CEC;
      block[3] = &unk_1004FAF58;
      objc_copyWeak(&v29, &location);
      dispatch_after(v25, queue, block);
      uint64_t v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v32 = "-[ADCommandCenter _createRootExecutionContextForRequestID:]";
        __int16 v33 = 2112;
        __int16 v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
      }

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_destroyRootExecutionContextForRequestID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_rootExecutionContextsByRequestID, "objectForKey:", v4));
    if (v5)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_rootExecutionContextsByRequestID, "removeObjectForKey:", v4);
      if (!-[NSMutableDictionary count](self->_rootExecutionContextsByRequestID, "count"))
      {
        rootExecutionContextsByRequestID = self->_rootExecutionContextsByRequestID;
        self->_rootExecutionContextsByRequestID = 0LL;
      }

      id v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315394;
        int v9 = "-[ADCommandCenter _destroyRootExecutionContextForRequestID:]";
        __int16 v10 = 2112;
        id v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (BOOL)_hasRemoteExecutionContextForExecutionID:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _remoteExecutionContextForExecutionID:]( self,  "_remoteExecutionContextForExecutionID:",  a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)_remoteExecutionContextForExecutionID:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_remoteExecutionContextsByExecutionID,  "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (BOOL)_hasRemoteExecutionContextForRequestID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_remoteExecutionContextsByExecutionID, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) info]);
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_beginRemoteExecutionContextForCommand:(id)a3 fromPeer:(id)a4 withRemoteExecutionInfo:(id)a5
{
  uint64_t v7 = (ADCommandExecutionContext *)a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315906;
    id v43 = "-[ADCommandCenter _beginRemoteExecutionContextForCommand:fromPeer:withRemoteExecutionInfo:]";
    __int16 v44 = 2112;
    __int128 v45 = v7;
    __int16 v46 = 2112;
    id v47 = v8;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s command = %@, peer = %@, remoteExecutionInfo = %@",  buf,  0x2Au);
  }

  unsigned __int8 v11 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v11, "UUIDString"));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 currentHomeInfo]);
  __int128 v40 = v7;
  if ((AFIsHorseman(v12, v13) & 1) != 0)
  {
    __int128 v41 = v12;
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 currentHomeInfo]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v14 updatedHomeInfoForRootInfo:v15]);

    __int128 v41 = (void *)v16;
  }

  uint64_t v35 = objc_alloc(&OBJC_CLASS___ADCommandExecutionContext);
  __int16 v34 = objc_alloc(&OBJC_CLASS___AFCommandExecutionInfo);
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 turnId]);
  __int128 v39 = v8;
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v8 afPeerInfo]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointInfo]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v9 instanceInfo]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 speechInfo]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 requestHandlingContextSnapshot]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceRestrictions]);
  char v23 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  char v24 = (void *)v18;
  dispatch_time_t v25 = -[AFCommandExecutionInfo initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:requestHandlingContextSnapshot:deviceRestrictions:userInfo:]( v34,  "initWithExecutionID:requestID:turnId:originPeerInfo:currentHomeInfo:endpointInfo:instanceInfo:speechInfo:reque stHandlingContextSnapshot:deviceRestrictions:userInfo:",  v37,  v33,  v17,  v18,  v41,  v19,  v32,  v20,  v21,  v22,  v23);
  id v36 = -[ADCommandExecutionContext initWithInfo:](v35, "initWithInfo:", v25);

  remoteExecutionContextsByExecutionID = self->_remoteExecutionContextsByExecutionID;
  if (!remoteExecutionContextsByExecutionID)
  {
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int16 v28 = self->_remoteExecutionContextsByExecutionID;
    self->_remoteExecutionContextsByExecutionID = v27;

    remoteExecutionContextsByExecutionID = self->_remoteExecutionContextsByExecutionID;
  }

  -[NSMutableDictionary setObject:forKey:](remoteExecutionContextsByExecutionID, "setObject:forKey:", v36, v37);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _powerAssertionManager](self, "_powerAssertionManager"));
  [v29 takePowerAssertionWithName:v37];

  __int16 v30 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v43 = "-[ADCommandCenter _beginRemoteExecutionContextForCommand:fromPeer:withRemoteExecutionInfo:]";
    __int16 v44 = 2112;
    __int128 v45 = v36;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }

  return v36;
}

- (void)_endRemoteExecutionContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 executionID]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_remoteExecutionContextsByExecutionID,  "objectForKey:",  v6));

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _powerAssertionManager](self, "_powerAssertionManager"));
      [v8 releasePowerAssertionWithName:v6];

      -[NSMutableDictionary removeObjectForKey:](self->_remoteExecutionContextsByExecutionID, "removeObjectForKey:", v6);
      if (!-[NSMutableDictionary count](self->_remoteExecutionContextsByExecutionID, "count"))
      {
        remoteExecutionContextsByExecutionID = self->_remoteExecutionContextsByExecutionID;
        self->_remoteExecutionContextsByExecutionID = 0LL;
      }

      __int16 v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315394;
        id v12 = "-[ADCommandCenter _endRemoteExecutionContext:]";
        __int16 v13 = 2112;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)_addExecutionDevice:(id)a3 forCommandExecutionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 info]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 executionID]);

    if (v10)
    {
      executionDevicesByExecutionID = self->_executionDevicesByExecutionID;
      if (!executionDevicesByExecutionID)
      {
        id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int16 v13 = self->_executionDevicesByExecutionID;
        self->_executionDevicesByExecutionID = v12;

        executionDevicesByExecutionID = self->_executionDevicesByExecutionID;
      }

      id v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( executionDevicesByExecutionID,  "objectForKey:",  v10));
      if (!v14)
      {
        id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableDictionary setObject:forKey:](self->_executionDevicesByExecutionID, "setObject:forKey:", v14, v10);
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 afPeerInfo]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 managedPeerInfoMatchingPeerInfo:v15]);
      uint64_t v18 = (void *)v17;
      if (v17) {
        uint64_t v19 = (void *)v17;
      }
      else {
        uint64_t v19 = v15;
      }
      id v20 = v19;

      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v21 = v14;
      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v38,  16LL);
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v29;
        while (2)
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v29 != v24) {
              objc_enumerationMutation(v21);
            }
            if ((sub_10016A850(v20, *(void **)(*((void *)&v28 + 1) + 8LL * (void)i)) & 1) != 0)
            {

              goto LABEL_23;
            }
          }

          id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v38,  16LL);
          if (v23) {
            continue;
          }
          break;
        }
      }

      id v26 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315650;
        __int16 v33 = "-[ADCommandCenter _addExecutionDevice:forCommandExecutionContext:]";
        __int16 v34 = 2112;
        id v35 = v20;
        __int16 v36 = 2112;
        id v37 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s Added %@ for %@", buf, 0x20u);
      }

      -[NSMutableArray addObject:](v21, "addObject:", v20, (void)v28);
LABEL_23:
    }

    else
    {
      uint64_t v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v33 = "-[ADCommandCenter _addExecutionDevice:forCommandExecutionContext:]";
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s Missing executionID for %@", buf, 0x16u);
      }
    }
  }
}

- (id)_executionDevicesForLocalRequestWithId:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_executionDevicesByExecutionID, "objectForKey:", a3);
}

- (void)_removeExecutionDevicesForLocalRequestWithId:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[ADCommandCenter _removeExecutionDevicesForLocalRequestWithId:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v6, 0x16u);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_executionDevicesByExecutionID, "removeObjectForKey:", v4);
}

- (void)_clearAllExecutionDevices
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    int v6 = "-[ADCommandCenter _clearAllExecutionDevices]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }

  executionDevicesByExecutionID = self->_executionDevicesByExecutionID;
  self->_executionDevicesByExecutionID = 0LL;
}

- (void)_addCompletion:(id)a3 forCommand:(id)a4 forKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (v8 && v9 && v10)
  {
    if (!self->_aceCompletionMap)
    {
      id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      aceCompletionMap = self->_aceCompletionMap;
      self->_aceCompletionMap = v12;
    }

    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v24 = "-[ADCommandCenter _addCompletion:forCommand:forKey:]";
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Adding completion for %@", buf, 0x16u);
    }

    __int128 v15 = objc_alloc(&OBJC_CLASS___AFTwoArgumentSafetyBlock);
    uint64_t v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    uint64_t v19 = sub_1001E6BE0;
    id v20 = &unk_1004F8D20;
    id v21 = v9;
    id v22 = v8;
    uint64_t v16 = -[AFTwoArgumentSafetyBlock initWithBlock:](v15, "initWithBlock:", &v17);
    -[NSMutableDictionary setObject:forKey:](self->_aceCompletionMap, "setObject:forKey:", v16, v11, v17, v18, v19, v20);
  }
}

- (BOOL)_hasCompletionForCommandId:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_aceCompletionMap, "objectForKey:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_invokeCompletionForCommand:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    int v11 = "-[ADCommandCenter _invokeCompletionForCommand:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s command = %@", (uint8_t *)&v10, 0x16u);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_aceCompletionMap, "objectForKey:", v6));
    id v8 = v7;
    if (v7)
    {
      if (([v7 invokeWithValue:v4 andValue:0] & 1) == 0)
      {
        id v9 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v10 = 136315394;
          int v11 = "-[ADCommandCenter _invokeCompletionForCommand:]";
          __int16 v12 = 2112;
          id v13 = v6;
          _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Attempting to invoke completion block for command with msgId %@ again",  (uint8_t *)&v10,  0x16u);
        }
      }

      -[NSMutableDictionary removeObjectForKey:](self->_aceCompletionMap, "removeObjectForKey:", v6);
    }
  }
}

- (void)_invokeAllCompletionsWithError:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v23 = "-[ADCommandCenter _invokeAllCompletionsWithError:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s error = %@", buf, 0x16u);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  int v6 = self->_aceCompletionMap;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&__int128 v8 = 136315394LL;
    __int128 v16 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_aceCompletionMap,  "objectForKey:",  v12,  v16,  (void)v17));
        id v14 = v13;
        if (v13)
        {
          if (([v13 invokeWithValue:0 andValue:v4] & 1) == 0)
          {
            __int128 v15 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = v16;
              id v23 = "-[ADCommandCenter _invokeAllCompletionsWithError:]";
              __int16 v24 = 2112;
              id v25 = v12;
              _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Attempting to invoke completion block for command with msgId %@ again",  buf,  0x16u);
            }
          }
        }
      }

      id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v9);
  }

  -[NSMutableDictionary removeAllObjects](self->_aceCompletionMap, "removeAllObjects");
}

- (void)_addHandledCommandId:(id)a3 forRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v8 = v7;
  if (v6 && v7)
  {
    if (-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v7)
      || -[ADCommandCenter _hasRootExecutionContextForRequestID:](self, "_hasRootExecutionContextForRequestID:", v8))
    {
      handledCommandIdsByRequestId = self->_handledCommandIdsByRequestId;
      if (!handledCommandIdsByRequestId)
      {
        uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        int v11 = self->_handledCommandIdsByRequestId;
        self->_handledCommandIdsByRequestId = v10;

        handledCommandIdsByRequestId = self->_handledCommandIdsByRequestId;
      }

      __int16 v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](handledCommandIdsByRequestId, "objectForKey:", v8));
      if (!v12)
      {
        __int16 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        -[NSMutableDictionary setObject:forKey:](self->_handledCommandIdsByRequestId, "setObject:forKey:", v12, v8);
      }

      -[NSMutableSet addObject:](v12, "addObject:", v6);
    }

    else
    {
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315650;
        __int128 v15 = "-[ADCommandCenter _addHandledCommandId:forRequestId:]";
        __int16 v16 = 2112;
        id v17 = v6;
        __int16 v18 = 2112;
        __int128 v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Ignored command id %@ because request id %@ is unknown.",  (uint8_t *)&v14,  0x20u);
      }
    }
  }
}

- (void)_removeHandledCommandIdsForRequestId:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_handledCommandIdsByRequestId, "removeObjectForKey:");
  }
}

- (void)_removeAllHandledCommandIds
{
  handledCommandIdsByRequestId = self->_handledCommandIdsByRequestId;
  self->_handledCommandIdsByRequestId = 0LL;
}

- (id)_handledCommandIdsForRequestId:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    __int128 v8 = 0LL;
    goto LABEL_11;
  }

  if (!-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v4)
    && !-[ADCommandCenter _hasRootExecutionContextForRequestID:](self, "_hasRootExecutionContextForRequestID:", v4))
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      __int16 v12 = "-[ADCommandCenter _handledCommandIdsForRequestId:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Ignored because request id %@ is unknown.",  (uint8_t *)&v11,  0x16u);
    }

    goto LABEL_10;
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_handledCommandIdsByRequestId, "objectForKey:", v4));
  id v6 = v5;
  if (v5) {
    id v7 = [v5 copy];
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  __int128 v8 = v7;

LABEL_11:
  return v8;
}

- (void)_addPostCommandHandlingBlock:(id)a3 forCommandId:(id)a4 requestId:(id)a5
{
  __int128 v8 = (void (**)(void))a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (v8 && v9 && v10)
  {
    if (-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v10)
      || -[ADCommandCenter _hasRootExecutionContextForRequestID:](self, "_hasRootExecutionContextForRequestID:", v11))
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _handledCommandIdsForRequestId:](self, "_handledCommandIdsForRequestId:", v11));
      unsigned int v13 = [v12 containsObject:v9];

      if (v13)
      {
        v8[2](v8);
      }

      else
      {
        __int128 v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_postCommandHandlingBlockMap,  "objectForKey:",  v11));
        if (!v15)
        {
          __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          postCommandHandlingBlockMap = self->_postCommandHandlingBlockMap;
          if (!postCommandHandlingBlockMap)
          {
            id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            __int16 v18 = self->_postCommandHandlingBlockMap;
            self->_postCommandHandlingBlockMap = v17;

            postCommandHandlingBlockMap = self->_postCommandHandlingBlockMap;
          }

          -[NSMutableDictionary setObject:forKey:](postCommandHandlingBlockMap, "setObject:forKey:", v15, v11);
        }

        __int128 v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v15, "objectForKey:", v9));
        if (!v19)
        {
          __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v19, v9);
        }

        __int128 v20 = objc_retainBlock(v8);
        -[NSMutableArray addObject:](v19, "addObject:", v20);
      }
    }

    else
    {
      id v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315650;
        id v23 = "-[ADCommandCenter _addPostCommandHandlingBlock:forCommandId:requestId:]";
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        uint64_t v27 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Ignored post command handling block for command id %@ because request id %@ is unknown.",  (uint8_t *)&v22,  0x20u);
      }
    }
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      id v23 = "-[ADCommandCenter _addPostCommandHandlingBlock:forCommandId:requestId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Ignored because commandId, requestId and block are all required.",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)_dispatchAndRemovePostCommandHandlingBlocksForCommandId:(id)a3 requestId:(id)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_postCommandHandlingBlockMap, "objectForKey:", a4));
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
    [v7 removeObjectForKey:v6];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        unsigned int v13 = 0LL;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13) + 16LL))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13));
          unsigned int v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v11);
    }
  }
}

- (void)_removePostCommandHandlingBlocksForRequestId:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_postCommandHandlingBlockMap, "removeObjectForKey:");
  }
}

- (void)_removeAllPostCommandHandlingBlocks
{
  postCommandHandlingBlockMap = self->_postCommandHandlingBlockMap;
  self->_postCommandHandlingBlockMap = 0LL;
}

- (void)_setUIService:(id)a3
{
  id v4 = (ADUIService *)a3;
  -[ADUIService setDelegate:](self->_uiService, "setDelegate:", 0LL);
  uiService = self->_uiService;
  self->_uiService = v4;
  id v6 = v4;

  -[ADUIService setDelegate:](self->_uiService, "setDelegate:", self);
}

- (id)_domainObjectCache
{
  domainObjectCache = self->_domainObjectCache;
  if (!domainObjectCache)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADDomainObjectCache);
    int v5 = self->_domainObjectCache;
    self->_domainObjectCache = v4;

    domainObjectCache = self->_domainObjectCache;
  }

  return domainObjectCache;
}

- (void)_registerDomainSignalServiceWithServiceManager:(id)a3
{
  id v3 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___ADAceDomainSignalRequestHandler);
  id v4 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  int v5 = -[ADServiceCommandType initWithDomainName:className:]( v4,  "initWithDomainName:className:",  SAGroupIdentifier,  SAAceDomainSignalClassIdentifier);
  id v6 = objc_alloc(&OBJC_CLASS___ADSiriTaskService);
  id v7 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughRequestTransformer);
  __int128 v8 = objc_alloc_init(&OBJC_CLASS___ADAcePassthroughResponseTransformer);
  id v9 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( v6,  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v5,  v7,  v8,  v10);
  [v3 addService:v9];
}

- (void)_registerOTTServicesWithServiceManager:(id)a3
{
  id v3 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:]( &OBJC_CLASS___AFSiriTaskmaster,  "taskmasterForUIApplicationWithBundleIdentifier:",  @"com.apple.TVLive"));
  id v4 = objc_alloc_init(&OBJC_CLASS___ADOTTRequestTransformer);
  int v5 = objc_alloc_init(&OBJC_CLASS___ADSiriRequestSucceededResponseTransformer);
  id v6 = objc_alloc(&OBJC_CLASS___ADServiceCommandType);
  id v7 = -[ADServiceCommandType initWithDomainName:className:]( v6,  "initWithDomainName:className:",  SALCMGroupIdentifier,  SALCMShowChannelClassIdentifier);
  __int128 v8 = -[ADSiriTaskService initWithCommandType:requestTransformer:responseTransformer:requestHandler:]( objc_alloc(&OBJC_CLASS___ADSiriTaskService),  "initWithCommandType:requestTransformer:responseTransformer:requestHandler:",  v7,  v4,  v5,  v9);
  [v3 addService:v8];
}

- (id)_serviceManager
{
  serviceManager = self->_serviceManager;
  if (!serviceManager)
  {
    id v4 = -[ADServiceManager initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___ADServiceManager),  "initWithInstanceContext:",  self->_instanceContext);
    int v5 = self->_serviceManager;
    self->_serviceManager = v4;

    id v6 = self->_serviceManager;
    id v7 = objc_alloc_init(&OBJC_CLASS___ADSystemService);
    -[ADServiceManager addService:](v6, "addService:", v7);

    __int128 v8 = self->_serviceManager;
    id v9 = objc_alloc_init(&OBJC_CLASS___ADHomeKitService);
    -[ADServiceManager addService:](v8, "addService:", v9);

    id v10 = self->_serviceManager;
    id v11 = objc_alloc_init(&OBJC_CLASS___ADGenericIntentService);
    -[ADServiceManager addService:](v10, "addService:", v11);

    uint64_t v12 = self->_serviceManager;
    unsigned int v13 = objc_alloc_init(&OBJC_CLASS___ADDeleteSyncDataService);
    -[ADServiceManager addService:](v12, "addService:", v13);

    if (AFIsHorseman(v14, v15))
    {
      __int128 v16 = self->_serviceManager;
      __int128 v17 = objc_alloc_init(&OBJC_CLASS___ADCompanionRoutingService);
      -[ADServiceManager addService:](v16, "addService:", v17);

      __int16 v18 = self->_serviceManager;
      __int128 v19 = objc_alloc_init(&OBJC_CLASS___ADCompanionRoutingPhoneService);
      -[ADServiceManager addService:](v18, "addService:", v19);
    }

    -[ADCommandCenter _registerDomainSignalServiceWithServiceManager:]( self,  "_registerDomainSignalServiceWithServiceManager:",  self->_serviceManager);
    if (AFIsNano( -[ADCommandCenter _registerOTTServicesWithServiceManager:]( self,  "_registerOTTServicesWithServiceManager:",  self->_serviceManager))) {
      -[ADCommandCenter _registerNanoServicesWithServiceManager:]( self,  "_registerNanoServicesWithServiceManager:",  self->_serviceManager);
    }
    __int128 v20 = self->_serviceManager;
    id v21 = objc_alloc(&OBJC_CLASS___ADSettingsService);
    int v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 recordingInfoProvider]);
    __int16 v24 = -[ADSettingsService initWithRecordingInfoProvider:instanceContext:]( v21,  "initWithRecordingInfoProvider:instanceContext:",  v23,  self->_instanceContext);
    -[ADServiceManager addService:](v20, "addService:", v24);

    id v25 = self->_serviceManager;
    __int16 v26 = objc_alloc_init(&OBJC_CLASS___ADExtensionService);
    -[ADServiceManager addService:](v25, "addService:", v26);

    if (!self->_fauxUIService)
    {
      uint64_t v27 = objc_alloc_init(&OBJC_CLASS___ADFauxUIService);
      fauxUIService = self->_fauxUIService;
      self->_fauxUIService = v27;

      -[ADServiceManager addService:](self->_serviceManager, "addService:", self->_fauxUIService);
    }

    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 volumeTracker]);

    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( -[ADServiceManager serviceForIdentifier:]( self->_serviceManager,  "serviceForIdentifier:",  @"com.apple.mobileipod.assistant"));
    if (!v31)
    {
      uint64_t v32 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v44 = 136315138;
        __int128 v45 = "-[ADCommandCenter _serviceManager]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "%s No Media plugin could be found, but one was expected. Please file a radar on Siri Frameworks.",  (uint8_t *)&v44,  0xCu);
      }
    }

    __int16 v33 = self->_serviceManager;
    __int16 v34 = objc_alloc(&OBJC_CLASS___ADMediaRemoteService);
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    __int16 v36 = -[ADMediaRemoteService initWithQueue:volumeTracker:whaService:]( v34,  "initWithQueue:volumeTracker:whaService:",  v35,  v30,  v31);
    -[ADServiceManager addService:](v33, "addService:", v36);

    id v37 = self->_serviceManager;
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
    -[ADServiceManager addService:](v37, "addService:", v38);

    __int128 v39 = self->_serviceManager;
    __int128 v40 = objc_opt_new(&OBJC_CLASS___ADPostSiriEngagementService);
    -[ADServiceManager addService:](v39, "addService:", v40);

    if (AFDeviceSupportsSiriMUX()
      && (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint") & 1) == 0)
    {
      __int128 v41 = objc_alloc_init(&OBJC_CLASS___ADSyncControllerService);
      syncControllerService = self->_syncControllerService;
      self->_syncControllerService = v41;

      -[ADServiceManager addService:](self->_serviceManager, "addService:", self->_syncControllerService);
    }

    serviceManager = self->_serviceManager;
  }

  return serviceManager;
}

- (ADRequestDispatcherService)_requestDispatcherService
{
  requestDispatcherService = self->_requestDispatcherService;
  if (!requestDispatcherService)
  {
    id v4 = objc_alloc(&OBJC_CLASS___ADRequestDispatcherService);
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  self->_uiBridgeServiceListener,  0LL));
    id v6 = -[ADRequestDispatcherService initWithBridgeConnectionListeners:](v4, "initWithBridgeConnectionListeners:", v5);
    id v7 = self->_requestDispatcherService;
    self->_requestDispatcherService = v6;

    requestDispatcherService = self->_requestDispatcherService;
  }

  return requestDispatcherService;
}

- (id)_sessionManager
{
  sessionManager = self->_sessionManager;
  if (!sessionManager)
  {
    id v4 = objc_alloc(&OBJC_CLASS___ADSessionManager);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
    id v7 = -[ADSessionManager initOnQueue:account:instanceContext:]( v4,  "initOnQueue:account:instanceContext:",  v5,  v6,  self->_instanceContext);
    __int128 v8 = self->_sessionManager;
    self->_sessionManager = v7;

    id v9 = self->_sessionManager;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _hubAccount](self, "_hubAccount"));
    -[ADSessionManager setHubAccount:](v9, "setHubAccount:", v10);

    -[ADSessionManager setDelegate:](self->_sessionManager, "setDelegate:", self);
    id v11 = self->_sessionManager;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDelayManager](self, "_requestDelayManager"));
    -[ADSessionManager setInterceptor:](v11, "setInterceptor:", v12);

    -[ADCommandCenter _awdSessionStart](self, "_awdSessionStart");
    sessionManager = self->_sessionManager;
  }

  return sessionManager;
}

- (id)_resultObjectCache
{
  resultObjectCache = self->_resultObjectCache;
  if (!resultObjectCache)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADResultObjectCache);
    int v5 = self->_resultObjectCache;
    self->_resultObjectCache = v4;

    resultObjectCache = self->_resultObjectCache;
  }

  return resultObjectCache;
}

- (id)_diagnosticsManager
{
  diagnosticsManager = self->_diagnosticsManager;
  if (!diagnosticsManager)
  {
    id v4 = objc_alloc(&OBJC_CLASS___ADDiagnosticsManager);
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    id v6 = -[ADDiagnosticsManager initWithQueue:](v4, "initWithQueue:", v5);
    id v7 = self->_diagnosticsManager;
    self->_diagnosticsManager = v6;

    diagnosticsManager = self->_diagnosticsManager;
  }

  return diagnosticsManager;
}

- (id)_powerAssertionManager
{
  powerAssertionManager = self->_powerAssertionManager;
  if (!powerAssertionManager)
  {
    id v4 = -[AFPowerAssertionManager initWithIdentifier:]( objc_alloc(&OBJC_CLASS___AFPowerAssertionManager),  "initWithIdentifier:",  @"com.apple.assistand");
    int v5 = self->_powerAssertionManager;
    self->_powerAssertionManager = v4;

    powerAssertionManager = self->_powerAssertionManager;
  }

  return powerAssertionManager;
}

- (id)_remoteRequestHelper
{
  remoteRequestHelper = self->_remoteRequestHelper;
  if (!remoteRequestHelper)
  {
    id v4 = -[ADRemoteRequestHelper initWithQueue:]( objc_alloc(&OBJC_CLASS___ADRemoteRequestHelper),  "initWithQueue:",  self->_queue);
    int v5 = self->_remoteRequestHelper;
    self->_remoteRequestHelper = v4;

    remoteRequestHelper = self->_remoteRequestHelper;
  }

  return remoteRequestHelper;
}

- (id)_remoteSpeechRequestHelper
{
  remoteSpeechRequestHelper = self->_remoteSpeechRequestHelper;
  if (!remoteSpeechRequestHelper)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADRemoteSpeechRequestHelper);
    int v5 = self->_remoteSpeechRequestHelper;
    self->_remoteSpeechRequestHelper = v4;

    remoteSpeechRequestHelper = self->_remoteSpeechRequestHelper;
  }

  return remoteSpeechRequestHelper;
}

- (id)_deviceSyncCoordinator
{
  if (!self->_deviceSyncCoordinator && AFIsHorseman(self, a2))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___ADDeviceSyncCoordinator);
    deviceSyncCoordinator = self->_deviceSyncCoordinator;
    self->_deviceSyncCoordinator = v3;
  }

  return self->_deviceSyncCoordinator;
}

- (id)_requestDelayManager
{
  requestDelayManager = self->_requestDelayManager;
  if (!requestDelayManager)
  {
    id v4 = -[ADRequestDelayManager initWithQueue:]( objc_alloc(&OBJC_CLASS___ADRequestDelayManager),  "initWithQueue:",  self->_queue);
    int v5 = self->_requestDelayManager;
    self->_requestDelayManager = v4;

    requestDelayManager = self->_requestDelayManager;
  }

  return requestDelayManager;
}

- (id)_headphonesAnnouncementRequestCapabilityManager
{
  headphonesAnnouncementRequestCapabilityManager = self->_headphonesAnnouncementRequestCapabilityManager;
  if (!headphonesAnnouncementRequestCapabilityManager)
  {
    id v4 = -[AFSiriAnnouncementRequestCapabilityManager initWithPlatform:]( objc_alloc(&OBJC_CLASS___ADSiriAnnouncementRequestCapabilityManager),  "initWithPlatform:",  1LL);
    int v5 = self->_headphonesAnnouncementRequestCapabilityManager;
    self->_headphonesAnnouncementRequestCapabilityManager = v4;

    headphonesAnnouncementRequestCapabilityManager = self->_headphonesAnnouncementRequestCapabilityManager;
  }

  return headphonesAnnouncementRequestCapabilityManager;
}

- (id)_getPreheatOptionsForHorseman
{
  else {
    uint64_t v2 = 8LL;
  }
  return  -[AFSpeechRequestOptions initWithActivationEvent:]( objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions),  "initWithActivationEvent:",  v2);
}

- (id)_deviceRouter
{
  deviceRouter = self->_deviceRouter;
  if (!deviceRouter)
  {
    id v4 = -[ADDeviceRouter initWithQueue:](objc_alloc(&OBJC_CLASS___ADDeviceRouter), "initWithQueue:", self->_queue);
    int v5 = self->_deviceRouter;
    self->_deviceRouter = v4;

    deviceRouter = self->_deviceRouter;
  }

  return deviceRouter;
}

- (id)_flowServiceListener
{
  flowServiceListener = self->_flowServiceListener;
  if (!flowServiceListener)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADFlowServiceListener);
    int v5 = self->_flowServiceListener;
    self->_flowServiceListener = v4;

    flowServiceListener = self->_flowServiceListener;
  }

  return flowServiceListener;
}

- (void)_setupUIBridgeServiceListener
{
  char v3 = AFDeviceSupportsMedoc(self, a2);
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      int v11 = 136315138;
      uint64_t v12 = "-[ADCommandCenter _setupUIBridgeServiceListener]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Launching UIBridge service listener",  (uint8_t *)&v11,  0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFUIBridgeService));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFUIBridgeServiceDelegate));
    __int128 v8 = objc_alloc(&OBJC_CLASS___AFBridgeConnectionListener);
    id v9 = -[AFBridgeConnectionListener initWithBridgeName:machService:withServiceInterface:withDelegateInterface:]( v8,  "initWithBridgeName:machService:withServiceInterface:withDelegateInterface:",  @"UI",  kAssistantRequestDispatcherUIBridgeServiceName,  v6,  v7);
    uiBridgeServiceListener = self->_uiBridgeServiceListener;
    self->_uiBridgeServiceListener = v9;
  }

  else if (v5)
  {
    int v11 = 136315138;
    uint64_t v12 = "-[ADCommandCenter _setupUIBridgeServiceListener]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Medoc is not supported/enabled, skipping",  (uint8_t *)&v11,  0xCu);
  }

- (void)sendMultiUserInfoToMUX
{
  char v3 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v4)
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v9 = "-[ADCommandCenter sendMultiUserInfoToMUX]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (AFIsATV(v4, v5))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E6B4C;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (id)_motionManager
{
  motionManager = self->_motionManager;
  if (!motionManager)
  {
    BOOL v4 = objc_alloc_init(&OBJC_CLASS___ADMotionManager);
    uint64_t v5 = self->_motionManager;
    self->_motionManager = v4;

    motionManager = self->_motionManager;
  }

  return motionManager;
}

- (void)_startUpdatingMotionActivity
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _motionManager](self, "_motionManager"));
  char v3 = NSStringFromSelector(a2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v5 startUpdatingMotionActivityForReason:v4 completion:&stru_1004F5088];
}

- (void)_stopUpdatingMotionActivity
{
  motionManager = self->_motionManager;
  char v3 = NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[ADMotionManager stopUpdatingMotionActivityForReason:completion:]( motionManager,  "stopUpdatingMotionActivityForReason:completion:",  v4,  &stru_1004F50A8);
}

- (void)_cancelSessionManager
{
  sessionManager = self->_sessionManager;
  self->_sessionManager = 0LL;

  -[ADCommandCenter _awdSessionEnd](self, "_awdSessionEnd");
  -[ADLocationManager setNeedsToSendLocation:](self->_locationManager, "setNeedsToSendLocation:", 1LL);
}

- (void)_setCurrentRequestWithCommand:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(&OBJC_CLASS___ADCommandCenterCurrentRequest);
    -[ADCommandCenterCurrentRequest setCurrentRequestCommand:](v5, "setCurrentRequestCommand:", v4);
  }

  else
  {
    id v5 = 0LL;
  }

  -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", v5);
}

- (void)_setCurrentRequestWithRequestId:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(&OBJC_CLASS___ADCommandCenterCurrentRequest);
    -[ADCommandCenterCurrentRequest setCurrentRequestId:](v5, "setCurrentRequestId:", v4);
  }

  else
  {
    id v5 = 0LL;
  }

  -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", v5);
}

- (void)_setCurrentRequest:(id)a3
{
  id v5 = (ADCommandCenterCurrentRequest *)a3;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentRequest = self->_currentRequest;
    int v25 = 136315650;
    __int16 v26 = "-[ADCommandCenter _setCurrentRequest:]";
    __int16 v27 = 2112;
    __int128 v28 = currentRequest;
    __int16 v29 = 2112;
    __int128 v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v25, 0x20u);
  }

  __int128 v8 = self->_currentRequest;
  objc_storeStrong((id *)&self->_currentRequest, a3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestCommand](v5, "currentRequestCommand"));
  [v9 setCurrentRequest:v10];

  int v11 = self->_currentRequest;
  if (!v11 && v8)
  {
    requestEndCompletion = (void (**)(id))self->_requestEndCompletion;
    if (!requestEndCompletion) {
      goto LABEL_10;
    }
    unsigned int v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      __int16 v26 = "-[ADCommandCenter _setCurrentRequest:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Invoking Request End Completion",  (uint8_t *)&v25,  0xCu);
      requestEndCompletion = (void (**)(id))self->_requestEndCompletion;
    }

    requestEndCompletion[2](requestEndCompletion);
    id v14 = self->_requestEndCompletion;
    self->_requestEndCompletion = 0LL;

    int v11 = self->_currentRequest;
  }

  if (v11) {
    goto LABEL_14;
  }
LABEL_10:
  requestBarrier = (void (**)(id))self->_requestBarrier;
  if (requestBarrier)
  {
    __int128 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v25 = 136315138;
      __int16 v26 = "-[ADCommandCenter _setCurrentRequest:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Invoking Request Barrier",  (uint8_t *)&v25,  0xCu);
      requestBarrier = (void (**)(id))self->_requestBarrier;
    }

    requestBarrier[2](requestBarrier);
    id v17 = self->_requestBarrier;
    self->_requestBarrier = 0LL;

    int v11 = self->_currentRequest;
LABEL_14:
    if (v8) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }

  int v11 = 0LL;
  if (v8)
  {
LABEL_15:
    if (!v11)
    {
      __int16 v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        requestGroup = self->_requestGroup;
        int v25 = 136315650;
        __int16 v26 = "-[ADCommandCenter _setCurrentRequest:]";
        __int16 v27 = 2112;
        __int128 v28 = requestGroup;
        __int16 v29 = 2112;
        __int128 v30 = v8;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Leaving request group %@ because there is no current request and the previous request is %@...",  (uint8_t *)&v25,  0x20u);
      }

      dispatch_group_leave((dispatch_group_t)self->_requestGroup);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](v8, "currentRequestId"));
      -[ADCommandCenter _notifyUSTForRequestCompleted:](self, "_notifyUSTForRequestCompleted:", v19);
    }

    goto LABEL_24;
  }

- (id)_account
{
  account = self->_account;
  if (!account)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADCommandCenter _account]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s no saved account - fetching from ADAccount",  (uint8_t *)&v8,  0xCu);
    }

    id v5 = (ADAccount *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
    id v6 = self->_account;
    self->_account = v5;

    account = self->_account;
  }

  return account;
}

- (id)_hubAccount
{
  hubAccount = self->_hubAccount;
  if (!hubAccount)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    id v5 = (ADAccount *)objc_claimAutoreleasedReturnValue( +[ADAccount activeAccountForInstanceContext:]( &OBJC_CLASS___ADAccount,  "activeAccountForInstanceContext:",  v4));
    id v6 = self->_hubAccount;
    self->_hubAccount = v5;

    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = self->_hubAccount;
      int v10 = 136315395;
      int v11 = "-[ADCommandCenter _hubAccount]";
      __int16 v12 = 2113;
      unsigned int v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %{private}@", (uint8_t *)&v10, 0x16u);
    }

    hubAccount = self->_hubAccount;
  }

  return hubAccount;
}

- (void)_fetchHubAccountInBackground
{
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  int v10 = sub_1001D5E48;
  int v11 = sub_1001D5E58;
  char v3 = objc_alloc(&OBJC_CLASS___AFSettingsConnection);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
  __int16 v12 = -[AFSettingsConnection initWithInstanceContext:](v3, "initWithInstanceContext:", v4);

  id v5 = (void *)v8[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001E6814;
  v6[3] = &unk_1004F50D0;
  v6[4] = self;
  void v6[5] = &v7;
  [v5 fetchActiveAccount:v6];
  _Block_object_dispose(&v7, 8);
}

- (void)resetHubAccount
{
  char v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v7 = "-[ADCommandCenter resetHubAccount]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E67E4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_clearAccount
{
  account = self->_account;
  self->_account = 0LL;
}

- (ADSpeechManager)_speechManager
{
  speechManager = self->_speechManager;
  if (!speechManager)
  {
    id v4 = (OS_dispatch_group *)dispatch_group_create();
    speechRequestGroup = self->_speechRequestGroup;
    self->_speechRequestGroup = v4;

    id v6 = (ADSpeechManager *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
    uint64_t v7 = self->_speechManager;
    self->_speechManager = v6;

    -[ADSpeechManager setClientConfiguration:]( self->_speechManager,  "setClientConfiguration:",  self->_clientConfiguration);
    -[ADSpeechManager setDelegate:](self->_speechManager, "setDelegate:", self);
    speechManager = self->_speechManager;
  }

  return speechManager;
}

- (void)_requestWillStartWithInfo:(id)a3 showNetworkActivityIndicator:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v26 = "-[ADCommandCenter _requestWillStartWithInfo:showNetworkActivityIndicator:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v8 setHasActiveRequest:1];

  -[ADCommandCenter _setCallIsLikely:](self, "_setCallIsLikely:", 0LL);
  -[ADCommandCenter _awdRequestStart](self, "_awdRequestStart");
  objc_storeStrong((id *)&self->_currentRequestInfo, a3);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
  [v9 requestWillBeginWithInfo:self->_currentRequestInfo fromOrigin:5 client:self->_currentClient];

  int v10 = AFSupportsSCDAFramework();
  int v11 = (id *)&OBJC_CLASS___SCDAMonitor_ptr;
  if (!v10) {
    int v11 = (id *)&OBJC_CLASS___AFMyriadMonitor_ptr;
  }
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([*v11 sharedMonitor]);
  [v12 dequeueBlocksWaitingForMyriadDecision];

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 speechRequestOptions]);
  unsigned int v14 = [v13 isVoiceTrigger];

  else {
    uint64_t v15 = &OBJC_CLASS___AFMyriadMonitor;
  }
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sharedMonitor]);
  id v17 = v16;
  if (v14) {
    BOOL isInStarkMode = self->_isInStarkMode;
  }
  else {
    BOOL isInStarkMode = 1LL;
  }
  [v16 ignoreMyriadEvents:isInStarkMode];

  if (v6 || self->_requestDelegate)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001E66CC;
    v22[3] = &unk_1004FD968;
    id v23 = v19;
    __int16 v24 = self;
    id v21 = v19;
    [v20 updateLocationSnapshotWithCompletion:v22];
  }
}

- (void)_requestDidEnd
{
  char v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    int v11 = "-[ADCommandCenter _requestDidEnd]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v4 setHasActiveRequest:0];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
  [v5 requestDidEndWithInfo:self->_currentRequestInfo fromOrigin:5 client:self->_currentClient];

  -[ADCommandCenter _metrics_recordNetworkSnapshotForEvent:completion:]( self,  "_metrics_recordNetworkSnapshotForEvent:completion:",  2LL,  0LL);
  -[ADCommandCenter _metrics_recordSNNetworkSnapshotForEvent:completion:]( self,  "_metrics_recordSNNetworkSnapshotForEvent:completion:",  2LL,  0LL);
  -[ADCommandCenter _setSpeechCapturingContext:](self, "_setSpeechCapturingContext:", 0LL);
  requestAssertion = self->_requestAssertion;
  self->_requestAssertion = 0LL;

  int v7 = AFSupportsSCDAFramework();
  int v8 = (id *)&OBJC_CLASS___SCDAMonitor_ptr;
  if (!v7) {
    int v8 = (id *)&OBJC_CLASS___AFMyriadMonitor_ptr;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*v8 sharedMonitor]);
  [v9 dequeueBlocksWaitingForMyriadDecision];
}

- (void)_requestBarrierIfNecessary:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    if (self->_currentRequest)
    {
      -[ADCommandCenter _requestBarrier:](self, "_requestBarrier:", v4);
    }

    else
    {
      id v5 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        int v7 = "-[ADCommandCenter _requestBarrierIfNecessary:]";
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s No current request - Invoking Request Barrier",  (uint8_t *)&v6,  0xCu);
      }

      v4[2](v4);
    }
  }
}

- (void)_requestBarrier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_retainBlock(self->_requestBarrier);
    int v6 = v5;
    if (v5)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001E669C;
      v11[3] = &unk_1004FBFE8;
      id v12 = v5;
      id v13 = v4;
      int v7 = objc_retainBlock(v11);
      id requestBarrier = self->_requestBarrier;
      self->_id requestBarrier = v7;

      id v9 = v12;
    }

    else
    {
      id v10 = objc_retainBlock(v4);
      id v9 = self->_requestBarrier;
      self->_id requestBarrier = v10;
    }
  }
}

- (void)_clearRequestDelegateState
{
  char v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter _clearRequestDelegateState]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Clearing request delegate state",  (uint8_t *)&v4,  0xCu);
  }

  -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", 0LL);
  -[ADCommandCenter _setLastRequest:](self, "_setLastRequest:", 0LL);
}

- (void)_clearSpeechDelegateState
{
  char v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[ADCommandCenter _clearSpeechDelegateState]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Clearing speech delegate state",  (uint8_t *)&v11,  0xCu);
  }

  startSpeechCommand = self->_startSpeechCommand;
  self->_startSpeechCommand = 0LL;

  speechRecognitionResultUUID = self->_speechRecognitionResultUUID;
  self->_speechRecognitionResultUUID = 0LL;

  finishSpeechCommand = self->_finishSpeechCommand;
  self->_finishSpeechCommand = 0LL;

  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  self->_currentSpeechRequestOptions = 0LL;

  self->_startingPronunciationRequest = 0;
  pronunciationContext = self->_pronunciationContext;
  self->_pronunciationContext = 0LL;

  *(_DWORD *)&self->_speechDelegateHasReceivedSpeechRecognized = 0;
  speechDelegate = self->_speechDelegate;
  self->_speechDelegate = 0LL;

  *(_WORD *)&self->_isSmartLanguageSelectionActive = 0;
  id multilingualSpeechRecognizedCommandHandler = self->_multilingualSpeechRecognizedCommandHandler;
  self->_id multilingualSpeechRecognizedCommandHandler = 0LL;

  -[ADCommandCenter _stopLanguageDetectionWaitTimerIfNeeded](self, "_stopLanguageDetectionWaitTimerIfNeeded");
  -[ADCommandCenter _acousticId_clearPartialResultTimer](self, "_acousticId_clearPartialResultTimer");
}

- (void)_replaceRequestDelegate:(id)a3 reason:(int64_t)a4
{
}

- (void)_replaceRequestDelegate:(id)a3 withInfo:(id)a4 reason:(int64_t)a5 andCompletion:(id)a6
{
  unint64_t v11 = (unint64_t)a3;
  id v12 = a4;
  id v13 = a6;
  unsigned int v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    else {
      __int128 v16 = *(&off_1004FDBA8 + a5);
    }
    id v17 = v16;
    *(_DWORD *)__int128 buf = 136315394;
    id v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
    __int16 v43 = 2112;
    int v44 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ReplaceRequestDelegateReason: %@", buf, 0x16u);
  }

  p_unint64_t requestDelegate = (id *)&self->_requestDelegate;
  unint64_t requestDelegate = (unint64_t)self->_requestDelegate;
  if (v11 | requestDelegate)
  {
    if (requestDelegate == v11 || !requestDelegate)
    {
      if (!v11 || requestDelegate)
      {
LABEL_23:
        else {
          uint64_t v27 = qword_1003CA238[a5];
        }
        -[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]( self,  "_cancelCurrentRequestForReason:andError:successorInfo:",  v27,  0LL,  v12);
        -[ADCommandCenter _clearRequestDelegateState](self, "_clearRequestDelegateState");
        id v28 = objc_retainBlock(v13);
        id requestCompletion = self->_requestCompletion;
        self->_id requestCompletion = v28;

        __int128 v30 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v31 = self->_requestCompletion;
          uint64_t v32 = v30;
          __int16 v33 = (__CFString *)objc_retainBlock(v31);
          *(_DWORD *)__int128 buf = 136315394;
          id v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
          __int16 v43 = 2112;
          int v44 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "%s requestCompletion is set to %@.",  buf,  0x16u);
        }

        if (*p_requestDelegate != (id)v11)
        {
          __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
          id v35 = (void *)objc_claimAutoreleasedReturnValue( +[ADUIService serviceIdentifierForRequestDelegate:]( &OBJC_CLASS___ADUIService,  "serviceIdentifierForRequestDelegate:",  v11));
          __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v34 serviceForIdentifier:v35]);

          [v34 reprioritizeService:v36];
        }

        objc_storeStrong((id *)&self->_requestDelegate, a3);
        id v37 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v38 = (__CFString *)*p_requestDelegate;
          *(_DWORD *)__int128 buf = 136315394;
          id v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
          __int16 v43 = 2112;
          int v44 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "%s requestDelegate is set to %@.",  buf,  0x16u);
        }

        if (v11) {
          -[ADCommandCenter _requestWillStartWithInfo:showNetworkActivityIndicator:]( self,  "_requestWillStartWithInfo:showNetworkActivityIndicator:",  v12,  1LL);
        }
        goto LABEL_34;
      }

      int v22 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Informing session it's ok to send assistant data",  buf,  0xCu);
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
      [v23 beginUpdatingAssistantData];
LABEL_22:

      goto LABEL_23;
    }

    __int128 v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v42 = "-[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Interrupting current request delegate",  buf,  0xCu);
    }

    if ((unint64_t)a5 > 4)
    {
      __int128 v39 = @"ADReplaceRequestDelegateReason";
      uint64_t v21 = 5LL;
      if ((unint64_t)a5 > 6)
      {
        __int16 v24 = @"(unknown)";
        goto LABEL_21;
      }
    }

    else
    {
      uint64_t v21 = qword_1003CA270[a5];
      __int128 v39 = @"ADReplaceRequestDelegateReason";
    }

    __int16 v24 = *(&off_1004FDBA8 + a5);
LABEL_21:
    int v25 = v24;
    __int128 v40 = v25;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));

    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  v21,  v23,  v39));
    [*p_requestDelegate adRequestDidCompleteWithSuccess:0 error:v26];

    goto LABEL_22;
  }

- (void)_completeRequestForCurrentDelegate:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (v6 || !v4)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315650;
      int v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
      __int16 v23 = 1024;
      BOOL v24 = v4;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s success = %d, error = %@",  (uint8_t *)&v21,  0x1Cu);
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentRequestId]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assistantIdentifier]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentRequestId]);
      [v10 requestFailedWithAssistantId:v12 requestId:v14];
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    int v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v21, 0xCu);
  }

  if (v4) {
    -[ADCommandCenter _addNetworkActivityTracingForLabel:start:withCompletionReason:andError:]( self,  "_addNetworkActivityTracingForLabel:start:withCompletionReason:andError:",  1LL,  0LL,  2LL,  0LL);
  }
  unint64_t requestDelegate = self->_requestDelegate;
  if (requestDelegate)
  {
    -[ADCommandCenterRequestDelegate adRequestDidCompleteWithSuccess:error:]( requestDelegate,  "adRequestDidCompleteWithSuccess:error:",  v4,  v6);
    __int128 v16 = self->_requestDelegate;
    self->_unint64_t requestDelegate = 0LL;

    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      int v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s requestDelegate is set to nil.",  (uint8_t *)&v21,  0xCu);
    }
  }

  id requestCompletion = (void (**)(id, BOOL, id))self->_requestCompletion;
  if (requestCompletion)
  {
    requestCompletion[2](requestCompletion, v4, v6);
    id v19 = self->_requestCompletion;
    self->_id requestCompletion = 0LL;

    __int128 v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      int v22 = "-[ADCommandCenter _completeRequestForCurrentDelegate:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s requestCompletion invoked.",  (uint8_t *)&v21,  0xCu);
    }
  }
}

- (void)_replaceSpeechDelegateWhenReady:(id)a3 suppressAlert:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)_replaceSpeechDelegateWhenReady:(id)a3 waitForRecordingToFinish:(BOOL)a4 suppressAlert:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  unint64_t v11 = (ADCommandCenterSpeechDelegate *)a3;
  id v12 = (void (**)(void))a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v37 = "-[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  speechDelegate = self->_speechDelegate;
  BOOL v15 = speechDelegate == v11 && !v8;
  if (v15 || (speechManager = self->_speechManager) == 0LL || -[ADSpeechManager isStopped](speechManager, "isStopped"))
  {
    startSpeechCommand = self->_startSpeechCommand;
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___SASStartSpeechDictation);
    if ((objc_opt_isKindOfClass(startSpeechCommand, v18) & 1) != 0
      || -[ADSpeechManager isLocallyRecognizingInDictationMode]( self->_speechManager,  "isLocallyRecognizingInDictationMode"))
    {
      id v19 = self->_speechDelegate;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 209LL));
      -[ADCommandCenterSpeechDelegate adSpeechRecognitionDidFail:sessionUUID:]( v19,  "adSpeechRecognitionDidFail:sessionUUID:",  v20,  self->_speechCapturingContextSessionUUID);
    }

    -[ADCommandCenter _clearSpeechDelegateState](self, "_clearSpeechDelegateState");
    objc_storeStrong((id *)&self->_speechDelegate, a3);
    -[ADCommandCenter _setSpeechCapturingContext:](self, "_setSpeechCapturingContext:", 0LL);
    if (v12) {
      v12[2](v12);
    }
  }

  else
  {
    int v21 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v22 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (speechDelegate == v11)
    {
      if (v22)
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v37 = "-[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Waiting for recording to finish",  buf,  0xCu);
      }
    }

    else
    {
      if (v22)
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v37 = "-[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Interrupting current recording speech delegate",  buf,  0xCu);
      }

      -[ADSpeechManager cancelSpeechCaptureSuppressingAlert:]( self->_speechManager,  "cancelSpeechCaptureSuppressingAlert:",  v7);
      __int16 v23 = self->_speechDelegate;
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 209LL));
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
      -[ADCommandCenterSpeechDelegate adSpeechRecordingDidFail:context:]( v23,  "adSpeechRecordingDidFail:context:",  v24,  v25);

      id v26 = self->_speechDelegate;
      self->_speechDelegate = 0LL;

      -[ADCommandCenter _setSpeechCapturingContext:](self, "_setSpeechCapturingContext:", 0LL);
    }

    id v27 = objc_retainBlock(self->_speechCompletion);
    objc_initWeak((id *)buf, self);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1001E6618;
    v31[3] = &unk_1004F50F8;
    id v33 = v27;
    id v28 = v27;
    objc_copyWeak(&v35, (id *)buf);
    uint64_t v32 = v11;
    __int16 v34 = v12;
    __int16 v29 = objc_retainBlock(v31);
    id speechCompletion = self->_speechCompletion;
    self->_id speechCompletion = v29;

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_speechCaptureCompleted
{
  char v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    id v13 = "-[ADCommandCenter _speechCaptureCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }

  if (self->_currentClient
    || (BOOL v7 = self->_speechDelegate) != 0LL
    && !-[ADCommandCenterSpeechDelegate adSpeechSessionEnded](v7, "adSpeechSessionEnded"))
  {
    BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      currentClient = self->_currentClient;
      speechDelegate = self->_speechDelegate;
      int v12 = 136315650;
      id v13 = "-[ADCommandCenter _speechCaptureCompleted]";
      __int16 v14 = 2048;
      BOOL v15 = currentClient;
      __int16 v16 = 2048;
      id v17 = speechDelegate;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Ignored releasing audio session because current client is %p and speech delegate is %p.",  (uint8_t *)&v12,  0x20u);
    }
  }

  else
  {
    BOOL v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      id v13 = "-[ADCommandCenter _speechCaptureCompleted]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Asking speech manager to release audio session...",  (uint8_t *)&v12,  0xCu);
    }

    -[ADSpeechManager endSession](self->_speechManager, "endSession");
  }

  -[ADCommandCenter _acousticId_speechCaptureCompleted](self, "_acousticId_speechCaptureCompleted");
  id speechCompletion = (void (**)(id))self->_speechCompletion;
  if (speechCompletion)
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      id v13 = "-[ADCommandCenter _speechCaptureCompleted]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Invoking Speech Completion",  (uint8_t *)&v12,  0xCu);
      id speechCompletion = (void (**)(id))self->_speechCompletion;
    }

    speechCompletion[2](speechCompletion);
    id v11 = self->_speechCompletion;
    self->_id speechCompletion = 0LL;
  }

- (void)_didLaunchAppForRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  currentRequest = self->_currentRequest;
  if (!currentRequest
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](currentRequest, "currentRequestId")),
        unsigned int v7 = [v6 isEqualToString:v4],
        v6,
        v7))
  {
    BOOL v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADCommandCenter _didLaunchAppForRequestWithIdentifier:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Marking request did finish on app launch callback",  (uint8_t *)&v10,  0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, AFSiriDidLaunchAppNotification, 0LL, 0LL, 1u);
    +[AFAggregator logRequestLaunchedApp](&OBJC_CLASS___AFAggregator, "logRequestLaunchedApp");
  }
}

- (id)_languageModelForSpeechRequest:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ad_languageModel"));
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 languageCode]);
  }

  return v6;
}

- (void)_resetServices
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allServices]);
  [v4 makeObjectsPerformSelector:"resetExternalResources"];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  [v5 reloadServicesForAllPendingServiceNotifications];
}

- (void)_fetchStarkDeviceLockedStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001E65FC;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_preheatAllServices
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v3 allServices]);
  [v2 makeObjectsPerformSelector:"preheatDomain:" withObject:0];
}

- (BOOL)_refIdIsSpeechStart:(id)a3
{
  startSpeechCommand = self->_startSpeechCommand;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech aceId](startSpeechCommand, "aceId"));
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    int v10 = "-[ADCommandCenter _refIdIsSpeechStart:]";
    __int16 v11 = 2112;
    int v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s StartSpeech msg id is %@",  (uint8_t *)&v9,  0x16u);
  }

  unsigned __int8 v7 = [v5 isEqualToString:v4];

  return v7;
}

- (void)_sendSessionObject:(id)a3 opportunistically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v7 sendCommand:v6 opportunistically:v4 logEvent:0];
}

- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v7 sendCommand:v6 opportunistically:v4 logEvent:1];
}

- (void)_sendCommandToServer:(id)a3
{
}

- (void)_sendCommandToServer:(id)a3 completion:(id)a4
{
}

- (void)_sendCommandToServer:(id)a3 opportunistically:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = sub_1001DA584(v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  -[ADCommandCenter _addCompletion:forCommand:forKey:](self, "_addCompletion:forCommand:forKey:", v8, v9, v11);

  -[ADCommandCenter _sendCommandToServer:opportunistically:](self, "_sendCommandToServer:opportunistically:", v9, v5);
}

- (void)_sendRequestToServer:(id)a3
{
  id v5 = a3;
  id v6 = sub_1001DA584(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315394;
    BOOL v24 = "-[ADCommandCenter _sendRequestToServer:]";
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s command = %@", (uint8_t *)&v23, 0x16u);
  }

  id v9 = NSStringFromSelector(a2);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[ADCommandCenter _addOutstandingRequestId:forReason:](self, "_addOutstandingRequestId:forReason:", v7, v10);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___SARDStartServerRequest);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) == 0)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___SASStartAsrOnServerRequest);
    if ((objc_opt_isKindOfClass(v5, v12) & 1) == 0)
    {
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___SASMUXStartAsrOnServerRequest);
      if ((objc_opt_isKindOfClass(v5, v13) & 1) == 0)
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___SAStartRequest);
        if ((objc_opt_isKindOfClass(v5, v14) & 1) != 0
          || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___SASStartSpeechRequest), (objc_opt_isKindOfClass(v5, v15) & 1) != 0))
        {
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___SAStartRequest);
          objc_opt_isKindOfClass(v5, v16);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 origin]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
          id v19 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _requestDispatcherSessionConfiguration]( self,  "_requestDispatcherSessionConfiguration"));
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
          [v18 startUnderstandingOnServerRequestWithConfiguration:v19 requestId:v20 inputOrigin:v17];

          int v21 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
          -[ADCommandCenter _emitDeviceDynamicContextForRequest:](self, "_emitDeviceDynamicContextForRequest:", v21);
        }
      }
    }
  }

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v22 sendRawCommand:v5 opportunistically:0 logEvent:1];
}

- (void)_sendCommandFailedForCommand:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___SACommandFailed);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
  uint64_t v12 = -[SACommandFailed initWithReason:](v8, "initWithReason:", v9);

  id v10 = [v6 code];
  -[SACommandFailed setErrorCode:](v12, "setErrorCode:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);

  -[SACommandFailed setRefId:](v12, "setRefId:", v11);
  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v12);
}

- (void)_sendCommandFailedForCommand:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = -[SACommandFailed initWithReason:](objc_alloc(&OBJC_CLASS___SACommandFailed), "initWithReason:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);
  -[SACommandFailed setRefId:](v9, "setRefId:", v8);

  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v9);
}

- (void)_sendRollbackCommandForCommand:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter _sendRollbackCommandForCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___SARollbackRequest);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  [v6 setRequestId:v7];

  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v8 endRetryableRequestForCommand:v4];
}

- (void)_sendWillStopRecordingForCommand:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___SASWillStopRecording);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);

  [v6 setRefId:v5];
  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v6);
}

- (void)_sendCancelSpeechForCommand:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___SASCancelSpeech);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);

  [v7 setRefId:v5];
  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v6 endRetryableRequestForCommand:v7];
}

- (void)_triggerABCforType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if (AFIsInternalInstall(v8))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    id v11 = [v10 processIdentifier];
    [v9 reportIssueForType:v12 subType:v7 context:v8 processIdentifier:v11 walkboutStatus:byte_1005780A0];
  }
}

- (void)_reallyHandleNewStartRequest:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315394;
    BOOL v22 = "-[ADCommandCenter _reallyHandleNewStartRequest:info:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s startRequest = %@", (uint8_t *)&v21, 0x16u);
  }

  if (AFIsInternalInstall( -[ADCommandCenterClient adInvalidateCurrentUserActivity]( self->_currentClient,  "adInvalidateCurrentUserActivity")))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  byte_1005780A0));
    [v6 setIsCarryDevice:v9];
  }

  objc_msgSend( v6,  "setTextToSpeechIsMuted:",  -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);

  if (!v10)
  {
    uint64_t v12 = SiriCoreUUIDStringCreate(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v6 setAceId:v13];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]( self,  "_startServerRequestWithStartRequest:requestInfo:",  v6,  v7));
  if (!-[ADCommandCenter _areRequiredAssetsMissing](self, "_areRequiredAssetsMissing")) {
    goto LABEL_16;
  }
  uint64_t v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315138;
    BOOL v22 = "-[ADCommandCenter _reallyHandleNewStartRequest:info:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s _areRequiredAssetsMissing is true even when understanding on device is enabled",  (uint8_t *)&v21,  0xCu);
  }

  currentUodStatus = self->_currentUodStatus;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
  sub_1001E0AB0(currentUodStatus, v17);

  LODWORD(v17) = -[ADCommandCenter _shouldImmediatelyDismissSiriDueToMissingRequiredAssets]( self,  "_shouldImmediatelyDismissSiriDueToMissingRequiredAssets");
  uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (!(_DWORD)v17)
  {
    if (v19)
    {
      int v21 = 136315138;
      BOOL v22 = "-[ADCommandCenter _reallyHandleNewStartRequest:info:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s Not dismissing Siri request due to lack of assets.",  (uint8_t *)&v21,  0xCu);
    }

- (BOOL)_shouldImmediatelyDismissSiriDueToMissingRequiredAssets
{
  int v3 = AFDeviceSupportsDisablingServerFallbackWhenMissingAsset(self, a2);
  int v4 = AFDeviceSupportsSAE();
  int v5 = v4;
  BOOL v6 = ((v3 & 1) != 0 || v4) && !self->_isInStarkMode;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    BOOL isInStarkMode = self->_isInStarkMode;
    int v10 = 136316418;
    uint64_t v11 = "-[ADCommandCenter _shouldImmediatelyDismissSiriDueToMissingRequiredAssets]";
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = 0;
    __int16 v18 = 1024;
    BOOL v19 = isInStarkMode;
    __int16 v20 = 1024;
    BOOL v21 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s AFDeviceSupportsDisablingServerFallbackWhenMissingAsset = %u, AFDeviceSupportsSAE = %u, shouldAllowProceedingWi thoutNLRouterAsset = %u, while missing asset; #carplay active = %u; dismissing Siri right away: %u",
      (uint8_t *)&v10,
      0x2Au);
  }

  return v6;
}

- (void)_reallyHandleNewStartLocalRequest:(id)a3
{
  id v5 = a3;
  BOOL v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v29 = "-[ADCommandCenter _reallyHandleNewStartLocalRequest:]";
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s startLocalRequest = %@", buf, 0x16u);
  }

  -[ADCommandCenterClient adInvalidateCurrentUserActivity](self->_currentClient, "adInvalidateCurrentUserActivity");
  -[ADCommandCenter _setCurrentRequestWithCommand:](self, "_setCurrentRequestWithCommand:", v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
  id v8 = NSStringFromSelector(a2);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[ADCommandCenter _addOutstandingRequestId:forReason:](self, "_addOutstandingRequestId:forReason:", v7, v9);

  id v10 = -[AFSpeechRequestOptions activationEvent](self->_currentSpeechRequestOptions, "activationEvent");
  id v11 = sub_100344298((uint64_t)v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  if (!v12) {
    id v12 = SAInputOriginClientGeneratedValue;
  }
  int v13 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _createDefaultRequestContextData:]( self,  "_createDefaultRequestContextData:",  v10 == (id)17));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _requestDispatcherSessionConfiguration]( self,  "_requestDispatcherSessionConfiguration"));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
  [v14 startLocalRequestWithConfiguration:v15 requestId:v16 inputOrigin:v12 requestContextData:v13];

  int v17 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
  -[ADCommandCenter _emitDeviceDynamicContextForRequest:](self, "_emitDeviceDynamicContextForRequest:", v17);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientBoundCommands", 0));
  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      BOOL v22 = 0LL;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]( self,  "_handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:",  *(void *)(*((void *)&v23 + 1) + 8LL * (void)v22),  self->_currentClient,  1LL,  0LL);
        BOOL v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v20);
  }
}

- (void)_startLocalRequest:(id)a3 withRequestInfo:(id)a4 forDelegate:(id)a5 suppressCancelationAlertIfCapturingSpeech:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  __int16 v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"request = %@, requestInfo = %@, delegate = %@",  v12,  v13,  v14);
  int v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v32 = "-[ADCommandCenter _startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:]";
    __int16 v33 = 2112;
    __int16 v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v18 systemUptime];
  self->_requestEffectiveStartTime = v19;

  id v20 = self->_requestGroup;
  uint64_t v21 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v32 = "-[ADCommandCenter _startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:]";
    __int16 v33 = 2112;
    __int16 v34 = v20;
    __int16 v35 = 2112;
    __int16 v36 = v16;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s Entering request group %@ (%@)...",  buf,  0x20u);
  }

  dispatch_group_enter((dispatch_group_t)v20);
  -[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]( self,  "_replaceRequestDelegate:withInfo:reason:andCompletion:",  v14,  v13,  1LL,  v15);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1001E63F8;
  v26[3] = &unk_1004F7698;
  v26[4] = self;
  id v27 = v13;
  id v28 = v12;
  __int16 v29 = v20;
  __int16 v30 = v16;
  BOOL v22 = v16;
  __int128 v23 = v20;
  id v24 = v12;
  id v25 = v13;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:",  0LL,  v8,  v26);
}

- (void)_handleNextCallbacksForReply:(id)a3 forCommand:(id)a4 forRequestId:(id)a5 withExecutionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _resultObjectCache](self, "_resultObjectCache"));
  id v57 = 0LL;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 commandsForReply:v10 toCommand:v11 missingReferences:&v57]);
  id v16 = v57;
  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
  __int128 v41 = v12;
  if ([v17 isEqualToString:v12])
  {
    if (v15)
    {
      id v37 = v17;
      id v38 = v15;
      id v39 = v16;
      __int16 v35 = v14;
      id v36 = v11;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      id v18 = v15;
      id v19 = [v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v54;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v54 != v21) {
              objc_enumerationMutation(v18);
            }
            __int128 v23 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 refId]);

            if (!v24) {
              [v23 setRefId:v12];
            }
            id v25 = (os_log_s *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 136315394;
              __int128 v60 = "-[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]";
              __int16 v61 = 2112;
              id v62 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s Handling command from result object cache %@",  buf,  0x16u);
            }

            -[ADCommandCenter _handleCommandAndClientReply:executionContext:commandCompletion:]( self,  "_handleCommandAndClientReply:executionContext:commandCompletion:",  v23,  v13,  0LL);
          }

          id v20 = [v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }

        while (v20);
      }

      id v11 = v36;
      id v14 = v35;
      id v15 = v38;
      id v16 = v39;
LABEL_21:
      int v17 = v37;
      goto LABEL_22;
    }

    if (v16)
    {
      id v37 = v17;
      id v27 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        __int128 v60 = "-[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]";
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s Missing command identifiers, asking for objects from the server",  buf,  0xCu);
      }

      id v28 = -[ADMissingReferencesContext initWithMissingReferences:forRequestId:]( objc_alloc(&OBJC_CLASS___ADMissingReferencesContext),  "initWithMissingReferences:forRequestId:",  v16,  v12);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_1001E5EE0;
      v48[3] = &unk_1004F7698;
      v48[4] = self;
      id v49 = v10;
      id v29 = v11;
      id v50 = v29;
      id v40 = v16;
      id v30 = v12;
      id v51 = v30;
      id v31 = v13;
      id v52 = v31;
      -[ADMissingReferencesContext setFulfillmentBlock:](v28, "setFulfillmentBlock:", v48);
      [v14 addMissingReferencesContext:v28];
      uint64_t v32 = objc_alloc_init(&OBJC_CLASS___SAGetResultObjects);
      -[SAGetResultObjects setRefId:](v32, "setRefId:", v30);
      -[SAGetResultObjects setObjectIdentifiers:](v32, "setObjectIdentifiers:", v40);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_1001E5F98;
      v42[3] = &unk_1004F5148;
      __int16 v43 = v28;
      id v44 = v29;
      id v33 = v30;
      id v16 = v40;
      id v45 = v33;
      __int16 v46 = self;
      id v47 = v31;
      __int16 v34 = v28;
      -[ADCommandCenter _sendCommandToServer:opportunistically:completion:]( self,  "_sendCommandToServer:opportunistically:completion:",  v32,  0LL,  v42);

      id v15 = 0LL;
      goto LABEL_21;
    }
  }

  else
  {
    __int128 v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int128 v60 = "-[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]";
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Ignoring command whose request %@ is not the current request",  buf,  0x16u);
    }
  }

- (void)_cancelCurrentRequestForReason:(int64_t)a3 andError:(id)a4 successorInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentRequestId]);

  if (v12)
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315650;
      id v39 = "-[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]";
      __int16 v40 = 2048;
      int64_t v41 = a3;
      __int16 v42 = 2112;
      id v43 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Canceling current request with reason: %ld and error: %@",  (uint8_t *)&v38,  0x20u);
    }

    if (self->_requestEffectiveStartTime != 0.0)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      [v14 systemUptime];
      double v16 = v15 - self->_requestEffectiveStartTime;

      int v17 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v38 = 136315394;
        id v39 = "-[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]";
        __int16 v40 = 1024;
        LODWORD(v41) = (int)v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Logging Cancel for %d seconds",  (uint8_t *)&v38,  0x12u);
      }

      +[AFAggregator logRequestCancelAfterSeconds:](&OBJC_CLASS___AFAggregator, "logRequestCancelAfterSeconds:", v16);
      self->_requestEffectiveStartTime = 0.0;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenterCurrentRequest currentRequestCommand]( self->_currentRequest,  "currentRequestCommand"));

    if (v18)
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___SACancelRequest);
      [v19 setRefId:v12];
      [v19 setClientCancellationCode:a3];
      -[ADCommandCenter _sendRequestToServer:](self, "_sendRequestToServer:", v19);
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v20 requestWasCancelledWithInfo:self->_currentRequestInfo forReason:a3 origin:5 client:self->_currentClient successorInfo:v10];

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _resultObjectCache](self, "_resultObjectCache"));
    [v21 clearResultObjectsForRequestId:v12];

    -[ADCommandCenter _requestDidEnd](self, "_requestDidEnd");
    BOOL v22 = NSStringFromSelector(a2);
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[ADCommandCenter _removeOutstandingRequestId:forReason:](self, "_removeOutstandingRequestId:forReason:", v12, v23);

    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenterCurrentRequest currentRequestCommand]( self->_currentRequest,  "currentRequestCommand"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ad_parentRequest"));
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 aceId]);
    id v27 = NSStringFromSelector(a2);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[ADCommandCenter _removeOutstandingRequestId:forReason:](self, "_removeOutstandingRequestId:forReason:", v26, v28);

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 assistantIdentifier]);
    [v29 cancelOperationsForRequest:v12 forAssistantID:v31 fromRemote:0 reason:a3];

    -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", 0LL);
    -[ADCommandCenter _cancelCrossDeviceRequestOperationsForLocalRequestWithId:]( self,  "_cancelCrossDeviceRequestOperationsForLocalRequestWithId:",  v12);
    uint64_t v32 = 4LL;
    if (a3 != 3) {
      uint64_t v32 = 5LL;
    }
    if (a3 == 4) {
      uint64_t v33 = 3LL;
    }
    else {
      uint64_t v33 = v32;
    }
    -[ADCommandCenter _addNetworkActivityTracingForLabel:start:withCompletionReason:andError:]( self,  "_addNetworkActivityTracingForLabel:start:withCompletionReason:andError:",  1LL,  0LL,  v33,  v9);
  }

  id requestCompletion = (void (**)(id, void, void *))self->_requestCompletion;
  if (requestCompletion)
  {
    __int16 v35 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v38 = 136315138;
      id v39 = "-[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s Invoking request completion on request cancelation",  (uint8_t *)&v38,  0xCu);
      id requestCompletion = (void (**)(id, void, void *))self->_requestCompletion;
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 5LL));
    requestCompletion[2](requestCompletion, 0LL, v36);

    id v37 = self->_requestCompletion;
    self->_id requestCompletion = 0LL;
  }
}

- (void)_cancelCrossDeviceRequestOperationsForLocalRequestWithId:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001E5AE0;
  v8[3] = &unk_1004F9878;
  void v8[4] = self;
  id v4 = a3;
  id v5 = objc_retainBlock(v8);
  ((void (*)(void *, id))v5[2])(v5, v4);

  associatedRequestId = self->_associatedRequestId;
  if (associatedRequestId)
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v10 = "-[ADCommandCenter _cancelCrossDeviceRequestOperationsForLocalRequestWithId:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Cancelling associated request...",  buf,  0xCu);
      associatedRequestId = self->_associatedRequestId;
    }

    ((void (*)(void *, NSString *))v5[2])(v5, associatedRequestId);
  }
}

- (void)_cancelCrossDeviceRequestOperationsForRemoteRequest
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandExecutionContext creationDate]( self->_mostRecentVisibleRemoteExecutionContext,  "creationDate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandExecutionContext creationDate](self->_mostRecentRootExecutionContext, "creationDate"));
  id v5 = v4;
  if (self->_mostRecentVisibleRemoteExecutionContext && (!v4 || [v4 compare:v3] == (id)-1))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v6 timeIntervalSinceDate:v3];
    double v8 = v7;

    if (v8 < 300.0)
    {
      id v9 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v25 = "-[ADCommandCenter _cancelCrossDeviceRequestOperationsForRemoteRequest]";
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandExecutionContext info](self->_mostRecentVisibleRemoteExecutionContext, "info"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 originPeerInfo]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 requestID]);
      id v13 = objc_alloc_init(&OBJC_CLASS___SACancelCrossDeviceRequest);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);
      [v13 setAceId:v15];

      [v13 setRequestId:v12];
      [v13 setCancelAssociatedRequests:1];
      double v16 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v11);
      mostRecentVisibleRemoteExecutionContext = self->_mostRecentVisibleRemoteExecutionContext;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1001E5988;
      v21[3] = &unk_1004F5170;
      id v22 = v12;
      id v23 = v11;
      id v18 = v11;
      id v19 = v12;
      -[ADCommandCenter _remoteExecute_remoteDeviceExecuteCommand:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:]( self,  "_remoteExecute_remoteDeviceExecuteCommand:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:",  v13,  v16,  0LL,  0LL,  mostRecentVisibleRemoteExecutionContext,  v21);

      id v20 = self->_mostRecentVisibleRemoteExecutionContext;
      self->_mostRecentVisibleRemoteExecutionContext = 0LL;
    }
  }
}

- (BOOL)_isRelevantCancellationCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SACancelCrossDeviceRequest);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 requestId]);
    if (-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v6)) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = -[NSString isEqualToString:](self->_associatedRequestId, "isEqualToString:", v6);
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_hasActiveClientOrSyncingOrInCall
{
  return self->_currentClient
      || self->_requestDelegate
      || self->_speechDelegate
      || self->_speechFileDelegate
      || -[ADCommandCenter _sync_isSyncing](self, "_sync_isSyncing")
      || -[ADCommandCenter _isInCall](self, "_isInCall")
      || -[NSMutableSet count](self->_shutdownAssertions, "count") != 0LL;
}

- (void)_shutdownSessionWhenIdle
{
  uint64_t v3 = _AFPreferencesSessionShutdownDelayOverride(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v6 = v4;
  if (v4) {
    [v4 doubleValue];
  }
  else {
    double v5 = 60.0;
  }
  -[ADCommandCenter _shutdownAfterDelay:](self, "_shutdownAfterDelay:", v5);
}

- (void)_shutdownAfterDelay:(double)a3
{
  if (-[ADCommandCenter _hasActiveClientOrSyncingOrInCall](self, "_hasActiveClientOrSyncingOrInCall"))
  {
    double v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v19 = "-[ADCommandCenter _shutdownAfterDelay:]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Still active. Ignoring session shutdown request",  buf,  0xCu);
    }
  }

  else if (a3 <= 0.0)
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v19 = "-[ADCommandCenter _shutdownAfterDelay:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Shutting down session now...", buf, 0xCu);
    }

    -[ADCommandCenter _removeAllSpeechCapturingContexts](self, "_removeAllSpeechCapturingContexts");
    -[ADCommandCenter _removeAllHandledCommandIds](self, "_removeAllHandledCommandIds");
    -[ADCommandCenter _removeAllPostCommandHandlingBlocks](self, "_removeAllPostCommandHandlingBlocks");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 4LL));
    -[ADCommandCenter _invokeAllCompletionsWithError:](self, "_invokeAllCompletionsWithError:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
    [v13 cancel];

    -[ADCommandCenter _awdSessionEnd](self, "_awdSessionEnd");
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    [v14 networkActivityTracingCancel];

    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
    [v15 networkActivityTracingCancel:0];
  }

  else
  {
    dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(a3 / 3.0 * 1000000000.0));
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E57E8;
    block[3] = &unk_1004FD0A0;
    *(double *)&void block[5] = a3;
    void block[4] = self;
    dispatch_after(v6, queue, block);
    double v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v19 = "-[ADCommandCenter _shutdownAfterDelay:]";
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Delaying shutdown block for %f seconds...",  buf,  0x16u);
    }

    dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    id v10 = (dispatch_queue_s *)self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001E58D8;
    v16[3] = &unk_1004FD940;
    v16[4] = self;
    dispatch_after(v9, v10, v16);
  }

- (void)setSyncVerificationNeededAndFullReportNeeded:(BOOL)a3 shouldPostNotification:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001E57D4;
  v5[3] = &unk_1004F5068;
  v5[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(queue, v5);
}

- (id)_restrictedCommands
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL deviceIsLocked = self->_deviceIsLocked;
    BOOL v6 = v4;
    int v7 = AFHasUnlockedSinceBoot(v6);
    BOOL v8 = sub_1001EA768();
    BOOL deviceIsShowingLockScreen = self->_deviceIsShowingLockScreen;
    BOOL v10 = sub_1001EA7B4();
    BOOL isInStarkMode = self->_isInStarkMode;
    BOOL isInCarDNDMode = self->_isInCarDNDMode;
    BOOL isWatchAuthenticated = self->_isWatchAuthenticated;
    BOOL isHeadphonesAuthenticated = self->_isHeadphonesAuthenticated;
    BOOL isHeadGestureRecognitionAvailable = self->_isHeadGestureRecognitionAvailable;
    *(_DWORD *)__int128 buf = 136317698;
    id v31 = "-[ADCommandCenter _restrictedCommands]";
    __int16 v32 = 1024;
    BOOL v33 = deviceIsLocked;
    __int16 v34 = 1024;
    int v35 = v7;
    __int16 v36 = 1024;
    BOOL v37 = v8;
    __int16 v38 = 1024;
    BOOL v39 = deviceIsShowingLockScreen;
    __int16 v40 = 1024;
    BOOL v41 = v10;
    __int16 v42 = 1024;
    BOOL v43 = isInStarkMode;
    __int16 v44 = 1024;
    BOOL v45 = isInCarDNDMode;
    __int16 v46 = 1024;
    BOOL v47 = isWatchAuthenticated;
    __int16 v48 = 1024;
    BOOL v49 = isHeadphonesAuthenticated;
    __int16 v50 = 1024;
    BOOL v51 = isHeadGestureRecognitionAvailable;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s _deviceIsLocked=%d AFHasUnlockedSinceBoot=%d ADVoiceDialingDisabledWhileLocked=%d _deviceIsShowingLockScreen=%d ADControlCenterDisabledWhileLocked=%d _isInStarkMode=%d _isInCarDNDMode=%d _isWatchAuthenticated=%d _isheadphones Authenticated=%d _isHeadGestureRecognitionAvailable=%d",  buf,  0x48u);
  }

  if (!self->_deviceIsShowingLockScreen)
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  SANotificationGroupIdentifier,  SANotificationObjectClassIdentifier));
    -[NSMutableSet addObject:](v3, "addObject:", v16);
  }

  if (self->_deviceIsLocked)
  {
    BOOL v17 = sub_1001EA7B4();
    if (v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 controlCenterLockRestrictedCommands]);
      -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v19);
    }

    if ((AFHasUnlockedSinceBoot(v17) & 1) == 0)
    {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstUnlockRestrictedCommands]);
      -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v21);
    }

    if (sub_1001EA768())
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  SAPhoneGroupIdentifier,  SAPhoneCallClassIdentifier));
      -[NSMutableSet addObject:](v3, "addObject:", v22);
    }

    if (!self->_isHeadphonesAuthenticated) {
      -[NSMutableSet addObject:](v3, "addObject:", SADeviceRestrictionUNAUTHENTICATED_BY_HEADPHONES_STATEValue);
    }
    if (!self->_isWatchAuthenticated) {
      -[NSMutableSet addObject:](v3, "addObject:", SADeviceRestrictionUNAUTHENTICATED_BY_WATCH_PROXIMITYValue);
    }
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lockRestrictedCommands]);

    if (v24) {
      -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v24);
    }
  }

  if (self->_isInStarkMode)
  {
    -[NSMutableSet addObject:](v3, "addObject:", SADeviceRestrictionSTARKValue);
    if (self->_supportsCarPlayVehicleData) {
      -[NSMutableSet addObject:](v3, "addObject:", SADeviceRestrictionCAR_SUPPORTS_VEHICLE_DATAValue);
    }
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  SASmsGroupIdentifier,  SAUISayItClassIdentifier));
    -[NSMutableSet removeObject:](v3, "removeObject:", v25);

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  SAPhoneGroupIdentifier,  SAPhoneCallClassIdentifier));
    -[NSMutableSet removeObject:](v3, "removeObject:", v26);

    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  SAAppsGroupIdentifier,  SAAppsLaunchAppClassIdentifier));
    -[NSMutableSet removeObject:](v3, "removeObject:", v27);
  }

  else if (self->_isInCarDNDMode)
  {
    -[NSMutableSet addObject:](v3, "addObject:", SADeviceRestrictionCAR_DNDValue);
  }

  if (self->_isHeadGestureRecognitionAvailable) {
    -[NSMutableSet addObject:](v3, "addObject:", SADeviceRestrictionHEAD_GESTURE_RECOGNITIONValue);
  }
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v3, "allObjects"));

  return v28;
}

- (void)_sendRestrictionsInPreparationForRequest
{
  if (!self->_restrictionsWereSetForRequest)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SASetRestrictions);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _restrictedCommands](self, "_restrictedCommands"));
    [v3 setRestrictions:v4];

    -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v3);
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _headphonesAnnouncementRequestCapabilityManager]( self,  "_headphonesAnnouncementRequestCapabilityManager"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001E56C0;
    v6[3] = &unk_1004FBBD0;
    v6[4] = self;
    [v5 fetchAvailableAnnouncementRequestTypesWithCompletion:v6];

    self->_restrictionsWereSetForRequest = 1;
  }

- (void)_adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v4 adviseSessionArbiterToContinueWithPreviousWinner:v3];
}

- (void)_addNetworkActivityTracingForLabel:(int64_t)a3 start:(BOOL)a4 withCompletionReason:(int64_t)a5 andError:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  if (a3)
  {
    id v13 = v9;
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
    id v11 = v10;
    if (v7)
    {
      [v10 networkActivityStart:a3 activate:1];

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkActivityTracing sharedInstance]( &OBJC_CLASS___SNNetworkActivityTracing,  "sharedInstance"));
      [v12 networkActivityStart:a3 activate:1 completion:0];
    }

    else
    {
      [v10 networkActivityStop:a3 withReason:a5 andError:v13];

      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkActivityTracing sharedInstance]( &OBJC_CLASS___SNNetworkActivityTracing,  "sharedInstance"));
      [v12 networkActivityStop:a3 withReason:a5 andError:v13 completion:0];
    }

    id v9 = v13;
  }
}

- (BOOL)_shouldIgnoreCommand:(id)a3 executionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 refId]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 info]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 requestHandlingContextSnapshot]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 inputDeviceID]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 info]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 requestHandlingContextSnapshot]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 inputAssistantID]);

  if (v14 | v11)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localPeerInfo]);

    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assistantIdentifier]);
    if ([(id)v14 isEqualToString:v17])
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 idsDeviceUniqueIdentifier]);
      unsigned int v19 = [(id)v11 isEqualToString:v18];

      if (v19)
      {

        goto LABEL_10;
      }
    }

    else
    {
    }

    unsigned __int8 v22 = [v7 isFromRemote];

    if ((v22 & 1) == 0)
    {
LABEL_10:
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v7 info]);
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 requestID]);

      if (!(v8 | v24))
      {
        id v25 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)BOOL v33 = 136315650;
          *(void *)&v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
          *(_WORD *)&v33[12] = 2112;
          *(void *)&v33[14] = v6;
          *(_WORD *)&v33[22] = 2112;
          id v34 = v7;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s Handling %@ because both ref id and request id are nil. (executionContext = %@)",  v33,  0x20u);
        }

        goto LABEL_31;
      }

      if (v8)
      {
        if (!-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v8)
          && !-[ADCommandCenter _sync_hasCommandForRefId:](self, "_sync_hasCommandForRefId:", v8)
          && !-[ADCommandCenter _acousticId_hasCommandForRefId:](self, "_acousticId_hasCommandForRefId:", v8)
          && !-[ADCommandCenter _hasRootExecutionContextForRequestID:]( self,  "_hasRootExecutionContextForRequestID:",  v8)
          && !-[ADCommandCenter _syncController_hasCommandForRefId:](self, "_syncController_hasCommandForRefId:", v8))
        {
          __int128 v26 = (os_log_s *)AFSiriLogContextDaemon;
          if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_28;
          }
          *(_DWORD *)BOOL v33 = 136315394;
          *(void *)&v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
          *(_WORD *)&v33[12] = 2112;
          *(void *)&v33[14] = v6;
          id v27 = "%s Command %@ does not belong to an outstanding request or sync session or acoustic fingerprinting sessi"
                "on, and an associated local execution context can not be found.";
          goto LABEL_40;
        }
      }

      else if (!-[ADCommandCenter _isRelevantCancellationCommand:](self, "_isRelevantCancellationCommand:", v6))
      {
        __int128 v26 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_28;
        }
        *(_DWORD *)BOOL v33 = 136315394;
        *(void *)&v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
        *(_WORD *)&v33[12] = 2112;
        *(void *)&v33[14] = v6;
        id v27 = "%s Command %@ does not have ref id and is not relevant cancellation command.";
LABEL_40:
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, v27, v33, 0x16u);
LABEL_28:
        char v28 = 0;
        if (!v24) {
          goto LABEL_29;
        }
        goto LABEL_23;
      }

      char v28 = 1;
      if (!v24)
      {
LABEL_29:
        id v29 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_30;
        }
        *(_DWORD *)BOOL v33 = 136315394;
        *(void *)&v33[4] = "-[ADCommandCenter _shouldIgnoreCommand:executionContext:]";
        *(_WORD *)&v33[12] = 2112;
        *(void *)&v33[14] = v7;
        id v30 = "%s Execution context %@ does not have request id.";
        goto LABEL_35;
      }

- (void)_handleIgnoredCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, id, void))a5;
  uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315650;
    double v15 = "-[ADCommandCenter _handleIgnoredCommand:executionContext:completion:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s %@ (executionContext = %@)",  (uint8_t *)&v14,  0x20u);
    if (!v10) {
      goto LABEL_8;
    }
  }

  else if (!v10)
  {
    goto LABEL_8;
  }

  if (-[ADCommandCenter _isClientBoundCommand:](self, "_isClientBoundCommand:", v8)
    && !objc_msgSend(v8, "ad_requiresResponse"))
  {
    id v12 = 0LL;
  }

  else
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___SACommandIgnored);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 aceId]);
    [v12 setRefId:v13];
  }

  v10[2](v10, v12, 0LL);

LABEL_8:
  -[ADCommandCenter _invokeCompletionForCommand:](self, "_invokeCompletionForCommand:", v8);
}

- (void)_handleCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v12)
  {
    *(_DWORD *)__int128 buf = 136315650;
    BOOL v47 = "-[ADCommandCenter _handleCommand:executionContext:completion:]";
    __int16 v48 = 2112;
    id v49 = v8;
    __int16 v50 = 2112;
    id v51 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ (executionContext = %@)", buf, 0x20u);
  }

  if (AFIsInternalInstall(v12))
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    os_signpost_id_t v14 = os_signpost_id_generate(AFSiriLogContextDaemon);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        __int16 v16 = (char *)objc_opt_class(v8);
        *(_DWORD *)__int128 buf = 138412290;
        BOOL v47 = v16;
        id v17 = v16;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  v15,  "HandleCommand",  "type=%@",  buf,  0xCu);
      }
    }
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
  if (-[ADCommandCenter _shouldIgnoreCommand:executionContext:](self, "_shouldIgnoreCommand:executionContext:", v8, v9))
  {
    -[ADCommandCenter _handleIgnoredCommand:executionContext:completion:]( self,  "_handleIgnoredCommand:executionContext:completion:",  v8,  v9,  v10);
  }

  else
  {
    -[ADCommandCenter _preheatCallbacksForCommand:](self, "_preheatCallbacksForCommand:", v8);
    unsigned __int8 v19 = [v9 isFromRemote];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1001E55D8;
    v42[3] = &unk_1004F51B8;
    void v42[4] = self;
    id v20 = v8;
    id v43 = v20;
    id v21 = v9;
    id v44 = v21;
    id v22 = v10;
    id v45 = v22;
    id v23 = objc_retainBlock(v42);
    if (-[ADCommandCenter _isClientBoundCommand:](self, "_isClientBoundCommand:", v20))
    {
      BOOL v33 = v23;
      -[ADCommandCenter _notifyUSTForAceCommand:](self, "_notifyUSTForAceCommand:", v20);
      id v24 = v20;
      id v25 = self->_requestDelegate;
      id v32 = v10;
      if ((v19 & 1) != 0) {
        uint64_t v26 = 0LL;
      }
      else {
        uint64_t v26 = sub_1001770C0(v24);
      }
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_1001E55F0;
      v36[3] = &unk_1004F5570;
      id v37 = v18;
      __int16 v38 = self;
      BOOL v39 = v25;
      id v40 = v24;
      id v41 = v33;
      id v29 = v24;
      id v30 = v25;
      -[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]( self,  "_handleServiceCommand:afterMyriadDecision:executionContext:completion:",  v29,  v26,  v21,  v36);

      id v23 = v33;
    }

    else if (-[ADCommandCenter _isServerBoundCommand:](self, "_isServerBoundCommand:", v20))
    {
      id v27 = v20;
      unsigned int v28 = objc_msgSend(v27, "ad_willHaveReply");
      if (v22 && v28)
      {
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_1001E56B4;
        v34[3] = &unk_1004FC668;
        int v35 = v23;
        -[ADCommandCenter _sendCommandToServer:opportunistically:completion:]( self,  "_sendCommandToServer:opportunistically:completion:",  v27,  0LL,  v34);
      }

      else
      {
        -[ADCommandCenter _sendCommandToServer:opportunistically:]( self,  "_sendCommandToServer:opportunistically:",  v27,  0LL);
        ((void (*)(void *, void, void))v23[2])(v23, 0LL, 0LL);
      }

      id v31 = objc_msgSend(v27, "ad_getNetworkActivityTracingLabel");

      -[ADCommandCenter _addNetworkActivityTracingForLabel:start:withCompletionReason:andError:]( self,  "_addNetworkActivityTracingForLabel:start:withCompletionReason:andError:",  v31,  1LL,  0LL,  0LL);
    }

    -[ADCommandCenter _invokeCompletionForCommand:](self, "_invokeCompletionForCommand:", v20, v32);
  }
}

- (void)_handleCommandResponse:(id)a3 error:(id)a4 forCommand:(id)a5 executionContext:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v16) {
    (*((void (**)(id, id, id))v16 + 2))(v16, v12, v13);
  }
  id v34 = v13;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 aceId]);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 refId]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 info]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 requestID]);

  if (v19
    && (-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v19)
     || -[ADCommandCenter _hasRootExecutionContextForRequestID:](self, "_hasRootExecutionContextForRequestID:", v19))
    || v21
    && (-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v21)
     || -[ADCommandCenter _hasRootExecutionContextForRequestID:](self, "_hasRootExecutionContextForRequestID:", v21)))
  {
    -[ADCommandCenter _addHandledCommandId:forRequestId:](self, "_addHandledCommandId:forRequestId:", v18, v19);
    -[ADCommandCenter _dispatchAndRemovePostCommandHandlingBlocksForCommandId:requestId:]( self,  "_dispatchAndRemovePostCommandHandlingBlocksForCommandId:requestId:",  v18,  v19);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 originPeerInfo]);
  unsigned int v23 = objc_msgSend(v12, "ad_shouldBeHandledByClientAsResponseToCommand:fromPeer:", v14, v22);

  if (v23)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 encodedClassName]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v14 groupIdentifier]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
    BOOL v33 = (void *)v25;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v32 serviceForDomain:v25 command:v24]);
    if (v26)
    {
      id v31 = v24;
      id v27 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        unsigned int v28 = v27;
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
        *(_DWORD *)__int128 buf = 136315394;
        id v41 = "-[ADCommandCenter _handleCommandResponse:error:forCommand:executionContext:completion:]";
        __int16 v42 = 2112;
        id v43 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Dispatching response to service %@",  buf,  0x16u);
      }

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1001E5510;
      v35[3] = &unk_1004F7698;
      v35[4] = self;
      id v36 = v14;
      id v37 = v12;
      id v38 = v15;
      id v39 = v34;
      [v26 handleResponse:v37 toCommand:v36 completion:v35];

      id v24 = v31;
    }

    else
    {
      -[ADCommandCenter _performCallbacksForCommand:reply:executionContext:error:]( self,  "_performCallbacksForCommand:reply:executionContext:error:",  v14,  v12,  v15,  v34);
    }

    id v29 = v34;
  }

  else
  {
    id v29 = v34;
    -[ADCommandCenter _performCallbacksForCommand:reply:executionContext:error:]( self,  "_performCallbacksForCommand:reply:executionContext:error:",  v14,  v12,  v15,  v34);
  }
}

- (void)_preheatCallbacksForCommand:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ad_hasCallbacks"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      id v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Searching callbacks for phone call command",  (uint8_t *)&v14,  0xCu);
    }

    if (-[ADCommandCenter _callIsLikely](self, "_callIsLikely"))
    {
      id v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        id v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
        id v8 = "%s Call is already likely not checking again";
        id v9 = v7;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v14, 0xCu);
      }
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _resultObjectCache](self, "_resultObjectCache"));
      unsigned int v11 = [v10 callIsPossibleForRequestId:v5];

      id v12 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v13 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v13)
        {
          int v14 = 136315138;
          id v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Found phone call command",  (uint8_t *)&v14,  0xCu);
        }

        -[ADCommandCenter _setCallIsLikely:](self, "_setCallIsLikely:", 1LL);
        goto LABEL_14;
      }

      if (v13)
      {
        int v14 = 136315138;
        id v15 = "-[ADCommandCenter _preheatCallbacksForCommand:]";
        id v8 = "%s No phone call command found";
        id v9 = v12;
        goto LABEL_13;
      }
    }

- (void)_performCallbacksForCommand:(id)a3 reply:(id)a4 executionContext:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (objc_msgSend(v10, "ad_hasCallbacks"))
  {
    unsigned int v13 = objc_msgSend(v10, "ad_shouldIgnoreCallbacksOnReply");
    int v14 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v15 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        int v18 = 136315138;
        unsigned __int8 v19 = "-[ADCommandCenter _performCallbacksForCommand:reply:executionContext:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Ignoring callbacks in reply",  (uint8_t *)&v18,  0xCu);
      }
    }

    else
    {
      if (v15)
      {
        int v18 = 136315138;
        unsigned __int8 v19 = "-[ADCommandCenter _performCallbacksForCommand:reply:executionContext:error:]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s We're in a callback context, asking callback manager for next commands",  (uint8_t *)&v18,  0xCu);
      }

      if (a6) {
        id v16 = 0LL;
      }
      else {
        id v16 = v11;
      }
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 refId]);
      -[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]( self,  "_handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:",  v16,  v10,  v17,  v12);
    }
  }
}

- (void)_handleServiceCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]( self,  "_handleServiceCommand:afterMyriadDecision:executionContext:completion:",  v10,  sub_1001770C0(v10),  v9,  v8);
}

- (void)_handleServiceCommand:(id)a3 afterMyriadDecision:(BOOL)a4 executionContext:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!self->_disableServiceCommandExecution)
  {
    BOOL v51 = v8;
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 encodedClassName]);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v10 groupIdentifier]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceForDomain:v15 command:v14]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _firstChanceServiceForCommand:](self, "_firstChanceServiceForCommand:", v10));
    uint64_t v19 = objc_opt_class(v17);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0 && v18 != v17)
    {
      id v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        id v62 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v63 = 2112;
        *(void *)__int16 v64 = v18;
        *(_WORD *)&v64[8] = 2112;
        *(void *)&v64[10] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Using first chance service %@ instead of originally found service %@",  buf,  0x20u);
      }

      id v21 = v18;

      id v17 = v21;
    }

    id v22 = (void *)AFSiriLogContextDaemon;
    BOOL v23 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v17)
    {
      __int16 v46 = v18;
      BOOL v47 = v16;
      if (v23)
      {
        id v24 = v22;
        uint64_t v25 = (objc_class *)objc_opt_class(v10);
        uint64_t v26 = NSStringFromClass(v25);
        id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
        *(_DWORD *)__int128 buf = 136315650;
        id v62 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v63 = 2112;
        *(void *)__int16 v64 = v27;
        *(_WORD *)&v64[8] = 2112;
        *(void *)&v64[10] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Dispatching command %@ to service %@",  buf,  0x20u);
      }

      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_1001E4B28;
      v54[3] = &unk_1004F73F0;
      v54[4] = self;
      id v29 = v10;
      id v55 = v29;
      id v50 = v11;
      id v56 = v11;
      id v60 = v12;
      id v49 = v14;
      id v57 = v14;
      id v30 = v17;
      id v58 = v30;
      __int16 v48 = v15;
      id v31 = v15;
      id v59 = v31;
      id v45 = objc_retainBlock(v54);
      id v32 = (objc_class *)objc_opt_class(v29);
      BOOL v33 = NSStringFromClass(v32);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      int v35 = (void *)objc_claimAutoreleasedReturnValue([v29 aceId]);
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
      id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(Service: %@, Domain %@, Command: %@(%@), RequestId: %@"),  v30,  v31,  v34,  v35,  v36);

      id v38 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315650;
        id v62 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v63 = 1024;
        *(_DWORD *)__int16 v64 = v51;
        *(_WORD *)&v64[4] = 2112;
        *(void *)&v64[6] = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s Wait for Myriad decision: %d  with reason: %@",  buf,  0x1Cu);
      }

      int v18 = v46;
      id v16 = v47;
      if (v51)
      {
        int v39 = AFSupportsSCDAFramework();
        id v40 = (id *)&OBJC_CLASS___SCDAMonitor_ptr;
        if (!v39) {
          id v40 = (id *)&OBJC_CLASS___AFMyriadMonitor_ptr;
        }
        id v41 = (void *)objc_claimAutoreleasedReturnValue([*v40 sharedMonitor]);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_1001E4F78;
        v52[3] = &unk_1004FC010;
        v52[4] = self;
        __int16 v42 = v45;
        __int128 v53 = v45;
        [v41 waitForMyriadDecisionForReason:v37 withCompletion:v52];
      }

      else
      {
        __int16 v42 = v45;
        ((void (*)(void *))v45[2])(v45);
      }

      int v14 = v49;
      id v11 = v50;

      BOOL v15 = v48;
    }

    else
    {
      if (v23)
      {
        *(_DWORD *)__int128 buf = 136315650;
        id v62 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
        __int16 v63 = 2112;
        *(void *)__int16 v64 = v15;
        *(_WORD *)&v64[8] = 2112;
        *(void *)&v64[10] = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  OS_LOG_TYPE_INFO,  "%s Couldn't find service for %@ %@",  buf,  0x20u);
      }

      if (v12)
      {
        id v43 = v15;
        id v44 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 100LL));
        (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v44);

        BOOL v15 = v43;
      }
    }

    goto LABEL_27;
  }

  unsigned int v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v62 = "-[ADCommandCenter _handleServiceCommand:afterMyriadDecision:executionContext:completion:]";
    __int16 v63 = 2112;
    *(void *)__int16 v64 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Command %@ will not be executed because service command execution is disabled.",  buf,  0x16u);
  }

  if (v12)
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 46LL));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v14);
LABEL_27:
  }
}

- (void)_sendServiceCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E4810;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  unsigned int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_signalUSTTestRequestWithStartRequest:(id)a3 requestInfo:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 speechRequestOptions]);
  BOOL v8 = [v7 activationEvent] == (id)17;

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _fetchComputedModeAndUpdateRequestDelegate]( self,  "_fetchComputedModeAndUpdateRequestDelegate"));
  id v10 = objc_alloc(&OBJC_CLASS___SMTRequestContextData);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001E4684;
  v22[3] = &unk_1004F5208;
  id v23 = v9;
  id v24 = v6;
  uint64_t v25 = self;
  BOOL v26 = v8;
  id v11 = v6;
  id v21 = v9;
  id v12 = [v10 initWithBuilder:v22];
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assistantIdentifier]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 aceId]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 origin]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 knownLocation]);
  [v13 startTestSpeechRequestWithAssistantId:v15 requestId:v16 enableASR:0 inputOrigin:v17 location:v19 jitContext:0 overrideModelPath:0 requestContextData:v12];

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 aceId]);
  -[ADCommandCenter _emitDeviceDynamicContextForRequest:](self, "_emitDeviceDynamicContextForRequest:", v20);
}

- (void)postTestResultCandidateWithRcId:(id)a3 recognitionSausage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E45E0;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)postTestResultSelectedWithRcId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001E453C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)postMUXTestResultCandidateWithRcId:(id)a3 sharedUserIdToSpeechRecognitionDict:(id)a4 voiceIdConfidenceScores:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001E4494;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)postMUXTestResultSelectedWithRcId:(id)a3 voiceIdConfidenceScores:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E43F0;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (BOOL)_callIsLikely
{
  return self->_callIsLikely;
}

- (void)_setCallIsLikely:(BOOL)a3
{
  if (self->_callIsLikely != a3)
  {
    self->_callIsLikely = a3;
    -[ADSessionManager updateForCallIsLikelyDueToRequest:](self->_sessionManager, "updateForCallIsLikelyDueToRequest:");
  }

- (BOOL)_isInCall
{
  return self->_isInCall;
}

- (void)_setIsInCall:(BOOL)a3
{
  if (self->_isInCall != a3)
  {
    BOOL v3 = a3;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    id v6 = v5;
    if (v3) {
      uint64_t v7 = 4901LL;
    }
    else {
      uint64_t v7 = 4902LL;
    }
    [v5 logEventWithType:v7 context:0];

    self->_isInCall = v3;
    -[ADSessionManager updateForCallState:](self->_sessionManager, "updateForCallState:", v3);
    -[ADContextManager setBackgroundContextDirty](self->_contextManager, "setBackgroundContextDirty");
    if (self->_isInCall)
    {
      -[ADCommandCenter _scheduleCallKeepAlive](self, "_scheduleCallKeepAlive");
    }

    else
    {
      -[ADCommandCenter _setCallIsLikely:](self, "_setCallIsLikely:", 0LL);
      dispatch_time_t v8 = dispatch_time(0LL, 60000000000LL);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001E43E8;
      block[3] = &unk_1004FD940;
      void block[4] = self;
      dispatch_after(v8, queue, block);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 postNotificationName:@"ADCallStateDidChangeNotification" object:0];
  }

- (BOOL)_hasIncomingCall
{
  return self->_hasIncomingCall;
}

- (void)_setHasIncomingCall:(BOOL)a3
{
  if (self->_hasIncomingCall != a3)
  {
    self->_hasIncomingCall = a3;
    -[ADContextManager setBackgroundContextDirty](self->_contextManager, "setBackgroundContextDirty");
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 postNotificationName:@"ADCallStateDidChangeNotification" object:0];
  }

- (unint64_t)callState
{
  unint64_t result = (unint64_t)self->_callObserver;
  if (result) {
    return (unint64_t)_[(id)result currentCallState];
  }
  return result;
}

- (void)startObservingCallState
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E43E0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startObservingCallState
{
  if (!self->_callObserver)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___ADCallObserver);
    callObserver = self->_callObserver;
    self->_callObserver = v3;

    -[ADCallObserver startObservingCallStateWithDelegate:]( self->_callObserver,  "startObservingCallStateWithDelegate:",  self);
  }

- (void)_stopObservingCallStateWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  callObserver = self->_callObserver;
  if (callObserver)
  {
    uint64_t v7 = v4;
    -[ADCallObserver stopObservingCallStateWithCompletion:](callObserver, "stopObservingCallStateWithCompletion:", v4);
    id v6 = self->_callObserver;
    self->_callObserver = 0LL;

    -[ADCommandCenter _setIsInCall:](self, "_setIsInCall:", 0LL);
    -[ADCommandCenter _setHasIncomingCall:](self, "_setHasIncomingCall:", 0LL);
LABEL_5:
    id v4 = v7;
    goto LABEL_6;
  }

  if (v4)
  {
    uint64_t v7 = v4;
    v4[2](v4);
    goto LABEL_5;
  }

- (void)_cancelCallKeepAlive
{
  if (self->_callTransactionUUID)
  {
    callTransaction = self->_callTransaction;
    self->_callTransaction = 0LL;

    callTransactionUUID = self->_callTransactionUUID;
    self->_callTransactionUUID = 0LL;

    -[ADCommandCenter _shutdownSessionWhenIdle](self, "_shutdownSessionWhenIdle");
  }

- (void)_scheduleCallKeepAlive
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  objc_storeStrong((id *)&self->_callTransactionUUID, v3);
  double v5 = (OS_os_transaction *)os_transaction_create("com.apple.assistant.command-center.call", v4);
  callTransaction = self->_callTransaction;
  self->_callTransaction = v5;

  dispatch_time_t v7 = dispatch_time(0LL, 300000000000LL);
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001E43A4;
  v10[3] = &unk_1004FD968;
  v10[4] = self;
  id v11 = v3;
  id v9 = v3;
  dispatch_after(v7, queue, v10);
}

- (void)adCallStateChangedCallInProcess:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001E42B8;
  v4[3] = &unk_1004FC4D0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)adCallStateChangedCallIncoming:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001E41DC;
  v4[3] = &unk_1004FC4D0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (BOOL)_isRequestDelaying
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDelayManager](self, "_requestDelayManager"));
  unsigned __int8 v3 = [v2 isDelaying];

  return v3;
}

- (void)_handleBareRequestCompleted:(id)a3
{
  id v5 = a3;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315394;
    id v22 = "-[ADCommandCenter _handleBareRequestCompleted:]";
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s requestCompleted = %@", (uint8_t *)&v21, 0x16u);
  }

  dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 refId]);
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _resultObjectCache](self, "_resultObjectCache"));
  [v8 clearResultObjectsForRequestId:v7];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v9 endRetryableRequestForCommand:v5];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentRequestCommand]);
  -[ADCommandCenter _setLastRequest:](self, "_setLastRequest:", v11);

  -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", 0LL);
  -[ADCommandCenter _requestDidEnd](self, "_requestDidEnd");
  id v12 = NSStringFromSelector(a2);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[ADCommandCenter _removeOutstandingRequestId:forReason:](self, "_removeOutstandingRequestId:forReason:", v7, v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 refId]);
  if (!-[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v14)) {
    goto LABEL_8;
  }
  BOOL speechDelegateHasReceivedSpeechRecognized = self->_speechDelegateHasReceivedSpeechRecognized;

  if (!speechDelegateHasReceivedSpeechRecognized)
  {
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315138;
      id v22 = "-[ADCommandCenter _handleBareRequestCompleted:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failing speech request on request completed since we never got a speech recognized",  (uint8_t *)&v21,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 22LL));
    -[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]( self,  "_endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:",  v5,  v14,  0LL,  0LL);
LABEL_8:
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 refId]);
  -[ADCommandCenter _removeFirstChanceServiceForAceId:](self, "_removeFirstChanceServiceForAceId:", v17);

  -[ADCommandCenter _completeRequestForCurrentDelegate:error:]( self,  "_completeRequestForCurrentDelegate:error:",  1LL,  0LL);
  -[ADCommandCenter _sync_continueIfConditionsMet](self, "_sync_continueIfConditionsMet");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assistantIdentifier]);
  [v18 requestCompletedWithAssistantId:v20 requestId:v7];
}

- (void)_saRequestCompleted:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentRequestId]);
    *(_DWORD *)__int128 buf = 136315906;
    uint64_t v25 = "-[ADCommandCenter _saRequestCompleted:executionContext:completion:]";
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Request completed for id %@: %@ %@",  buf,  0x2Au);
  }

  if (objc_msgSend(v8, "ad_hasCallbacks"))
  {
    id v15 = [v8 copy];
    [v15 setCallbacks:0];
    id v16 = objc_alloc_init(&OBJC_CLASS___SAAddResultObjects);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 refId]);
    [v16 setRefId:v17];
    id v23 = v15;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    [v16 setObjects:v18];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[ADSessionManager sessionRequestIdForRefId:]( self->_sessionManager,  "sessionRequestIdForRefId:",  v17));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _resultObjectCache](self, "_resultObjectCache"));
    [v20 addResultObjects:v16 sessionRequestId:v19];

    int v21 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
    -[ADCommandCenter _handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:]( self,  "_handleNextCallbacksForReply:forCommand:forRequestId:withExecutionContext:",  v21,  v8,  v22,  v9);

    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  -[ADCommandCenter _handleBareRequestCompleted:](self, "_handleBareRequestCompleted:", v8);
  if (v10) {
LABEL_7:
  }
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
LABEL_8:
}

- (void)_saCommandFailed:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 refId]);
  id v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = v10;
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v7 reason]);
    int v27 = 136315650;
    __int16 v28 = "-[ADCommandCenter _saCommandFailed:completion:]";
    __int16 v29 = 2112;
    __int16 v30 = v9;
    __int16 v31 = 2114;
    id v32 = v26;
    _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s CommandFailed for refId: %@ reason: %{public}@",  (uint8_t *)&v27,  0x20u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v11 endRetryableRequestForCommand:v7];

  id v12 = NSStringFromSelector(a2);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[ADCommandCenter _removeOutstandingRequestId:forReason:](self, "_removeOutstandingRequestId:forReason:", v9, v13);

  if (-[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v9)
    || (id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SASFinishSpeech aceId](self->_finishSpeechCommand, "aceId")),
        unsigned int v15 = [v14 isEqualToString:v9],
        v14,
        v15))
  {
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315138;
      __int16 v28 = "-[ADCommandCenter _saCommandFailed:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s SpeechCommand failed",  (uint8_t *)&v27,  0xCu);
    }

    id v17 = [v7 errorCode];
    if (v17 == (id)SASDictationNotReadyErrorCode)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ad_error"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  6LL,  @"Speech not ready",  v18));
    }

    else
    {
      if ([v7 errorCode] == (id)1101 || objc_msgSend(v7, "errorCode") == (id)1107)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( AFError,  "errorWithCode:description:",  [v7 errorCode],  @"Local speech recognition failed"));
LABEL_16:
        -[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]( self,  "_endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:",  v7,  v19,  0LL,  0LL);
        goto LABEL_17;
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 reason]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ad_error"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2LL,  v18,  v24));
    }

    goto LABEL_16;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
  unsigned int v21 = [v20 isEqualToString:v9];

  if (!v21) {
    goto LABEL_18;
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 reason]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ad_error"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2LL,  v22,  v23));

  -[ADCommandCenter _completeRequestForCurrentDelegate:error:]( self,  "_completeRequestForCurrentDelegate:error:",  0LL,  v19);
  -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", 0LL);
  -[ADCommandCenter _requestDidEnd](self, "_requestDidEnd");
LABEL_17:

LABEL_18:
  -[ADCommandCenter _acousticId_commandFailed:](self, "_acousticId_commandFailed:", v7);
  -[ADCommandCenter _sync_commandFailed:](self, "_sync_commandFailed:", v7);
  if (v8) {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
  }
}

- (void)_saCommandIgnored:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315394;
    unsigned int v15 = "-[ADCommandCenter _saCommandIgnored:completion:]";
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s CommandIgnored for refId %@",  (uint8_t *)&v14,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v11 endRetryableRequestForCommand:v8];

  id v12 = NSStringFromSelector(a2);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[ADCommandCenter _removeOutstandingRequestId:forReason:](self, "_removeOutstandingRequestId:forReason:", v9, v13);

  -[ADCommandCenter _sync_commandIgnored:](self, "_sync_commandIgnored:", v8);
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_saSendCommands:(id)a3 completion:(id)a4
{
}

- (void)_handleSendCommands:(id)a3 forRequestDelegate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, SACommandSucceeded *, void))a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "commands", 0));
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      int v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v14);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___SAStartRequest);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
          -[ADCommandCenter _startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:]( self,  "_startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:",  v15,  v8,  0LL,  0LL,  1LL,  0LL);
        }
        else {
          -[ADCommandCenter _sendCommandToServer:opportunistically:]( self,  "_sendCommandToServer:opportunistically:",  v15,  0LL);
        }
        int v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  if (v9)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    v9[2](v9, v17, 0LL);
  }
}

- (void)_saAssistantDestroyed:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)_saCancelSucceeded:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)_saRollbackSucceeded:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0LL, 0LL);
  }
}

- (void)_saSetClientData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 holdToTalkThresholdInMilliseconds]);
    int v16 = 136315394;
    id v17 = "-[ADCommandCenter _saSetClientData:completion:]";
    __int16 v18 = 2112;
    __int128 v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s holdToTalkThresholdInMilliseconds: %@",  (uint8_t *)&v16,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v11 = [v10 ignoreServerManualEndpointingThreshold];

  if (v11)
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      id v17 = "-[ADCommandCenter _saSetClientData:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s ignoring server configured HTT threshold",  (uint8_t *)&v16,  0xCu);
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 holdToTalkThresholdInMilliseconds]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(uint64_t)[v14 integerValue] / 1000.0));
    [v13 setManualEndpointingThreshold:v15];
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_saSetHandoffPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, SACommandSucceeded *, void))a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v15 = "-[ADCommandCenter _saSetHandoffPayload:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v12 = 0LL;
  id v13 = 0LL;
  +[ADRemoteRequestHelper getInfoForHandoffPayload:userInfo:wepageURL:]( &OBJC_CLASS___ADRemoteRequestHelper,  "getInfoForHandoffPayload:userInfo:wepageURL:",  v6,  &v13,  &v12);
  id v9 = v13;
  id v10 = v12;
  -[ADCommandCenterClient adSetUserActivityInfo:webpageURL:]( self->_currentClient,  "adSetUserActivityInfo:webpageURL:",  v9,  v10);
  if (v7)
  {
    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    v7[2](v7, v11, 0LL);
  }
}

- (void)_saStartLocalRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, SACommandSucceeded *, void))a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    unsigned int v11 = "-[ADCommandCenter _saStartLocalRequest:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  -[ADCommandCenter _startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:]( self,  "_startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:",  v6,  0LL,  0LL,  0LL,  0LL);
  if (v7)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    v7[2](v7, v9, 0LL);
  }
}

- (void)_emitTriggerWithCachingForUUID:(id)a3 namespace:(id)a4 requestID:(id)a5
{
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter _emitTriggerWithCachingForUUID:namespace:requestID:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Not emitting trigger log as AIML experimentation framework not available on platform",  (uint8_t *)&v6,  0xCu);
  }

- (void)_saAddResultObjects:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v34 = a4;
  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objects]);
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v6 resultObjects]);
  id v29 = [v31 count];
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v7 count];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
    *(_DWORD *)__int128 buf = 136315906;
    __int16 v46 = "_LogARO";
    __int16 v47 = 2048;
    id v48 = v10;
    __int16 v49 = 2112;
    id v50 = v11;
    __int16 v51 = 2112;
    id v52 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Got AddResultObjects with %lu objects aceID=%@, refId=%@ ",  buf,  0x2Au);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  BOOL v33 = v6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objects", v29));
  id v14 = [v13 countByEnumeratingWithState:&v35 objects:buf count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          __int128 v19 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          __int128 v20 = v18;
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 encodedClassName]);
          id v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 aceId]);
          *(_DWORD *)int v39 = 136315650;
          id v40 = "_LogARO";
          __int16 v41 = 2112;
          __int16 v42 = v21;
          __int16 v43 = 2112;
          id v44 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s  - %@ %@", v39, 0x20u);
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v35 objects:buf count:16];
    }

    while (v15);
  }

  id v23 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = v30
        ? (__CFString *)objc_claimAutoreleasedReturnValue([v33 valueForKey:@"aceId"])
        : &stru_1004FECA0;
    *(_DWORD *)int v39 = 136315650;
    id v40 = "_LogARO";
    __int16 v41 = 2048;
    __int16 v42 = v30;
    __int16 v43 = 2112;
    id v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s And %lu resultObjects %@", v39, 0x20u);
    if (v30) {
  }
    }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v33 refId]);

  if (!v26) {
    [v33 setRefId:v25];
  }
  int v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADSessionManager sessionRequestIdForRefId:](self->_sessionManager, "sessionRequestIdForRefId:", v25));
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _resultObjectCache](self, "_resultObjectCache"));
  [v28 addResultObjects:v33 sessionRequestId:v27];

  if (v34) {
    (*((void (**)(id, void, void))v34 + 2))(v34, 0LL, 0LL);
  }
}

- (void)_saExecuteCallbacks:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, SACommandSucceeded *, void))a4;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 callbacks]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 commandReferences]);
    int v13 = 136315394;
    id v14 = "-[ADCommandCenter _saExecuteCallbacks:completion:]";
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s first callback ACE IDs: %@",  (uint8_t *)&v13,  0x16u);
  }

  if (objc_msgSend(v5, "ad_hasCallbacks"))
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    v6[2](v6, v12, 0LL);
  }

  else
  {
    v6[2](v6, 0LL, 0LL);
  }
}

- (void)_saInitiateHandoffOnCompanion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    BOOL v33 = "-[ADCommandCenter _saInitiateHandoffOnCompanion:completion:]";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AFSpeechRequestOptions turnIdentifier](self->_currentSpeechRequestOptions, "turnIdentifier"));
  -[AFRequestInfo setTurnIdentifier:](v9, "setTurnIdentifier:", v10);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 notificationText]);
  if (AFIsATV(v11, v12))
  {
    -[AFRequestInfo setIsATVHandoff:](v9, "setIsATVHandoff:", 1LL);
    int v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AFRequestInfo));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    __int16 v15 = v14;
    if (!v11) {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"ASSISTANT_SERVICES_ATV_REQUEST_HANDOFF_NOTIFICATION_BODY" value:0 table:0]);
    }
  }

  if (v11)
  {
    -[AFRequestInfo setHandoffNotification:](v9, "setHandoffNotification:", v11);
    -[AFRequestInfo setHandoffRequiresUserInteraction:](v9, "setHandoffRequiresUserInteraction:", 1LL);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 isSiriXRequest]);
  -[AFRequestInfo setIsSiriXRequest:](v9, "setIsSiriXRequest:", [v16 BOOLValue]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 handoffPayload]);
  -[AFRequestInfo _ad_setHandoffPayload:](v9, "_ad_setHandoffPayload:", v17);

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 targetDevice]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 assistantId]);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1001E40D4;
  v29[3] = &unk_1004FD6F0;
  id v20 = v6;
  id v30 = v20;
  id v21 = v7;
  id v31 = v21;
  id v22 = objc_retainBlock(v29);
  if (!AFIsATV(v22, v23) || v19)
  {
    -[ADCommandCenter startRemoteRequest:onTargetDevice:completion:]( self,  "startRemoteRequest:onTargetDevice:completion:",  v9,  v19,  v22);
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001E416C;
    v25[3] = &unk_1004F5230;
    void v25[4] = self;
    __int16 v26 = v9;
    int v27 = v22;
    id v28 = v21;
    [v24 getCompanionAssistantIdForRecognizedUser:v25];
  }
}

- (void)_saSetDeviceTTSMuteState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter _saSetDeviceTTSMuteState:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  -[ADCommandCenterClient adServerRequestsTTSStateUnmuted:]( self->_currentClient,  "adServerRequestsTTSStateUnmuted:",  [v6 textToSpeechIsMuted] ^ 1);
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_saPing:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, id, void))a4;
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___SAPong);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);

  [v6 setRefId:v7];
  if (v8) {
    v8[2](v8, v6, 0LL);
  }
}

- (void)_saWaitForCommands:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v5 refId]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 commandAceIds]);
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v58 = "-[ADCommandCenter _saWaitForCommands:completion:]";
    __int16 v59 = 2112;
    id v60 = v5;
    __int16 v61 = 2112;
    id v62 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ (commands = %@)", buf, 0x20u);
  }

  if (!-[ADCommandCenter _hasOutstandingRequestId:](self, "_hasOutstandingRequestId:", v38))
  {
    id v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315650;
      id v58 = "-[ADCommandCenter _saWaitForCommands:completion:]";
      __int16 v59 = 2112;
      id v60 = v5;
      __int16 v61 = 2112;
      id v62 = v38;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Ignored %@ because request id %@ is unknown.",  buf,  0x20u);
      if (!v6) {
        goto LABEL_24;
      }
    }

    else if (!v6)
    {
      goto LABEL_24;
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    goto LABEL_24;
  }

  int v9 = objc_alloc(&OBJC_CLASS___AFTwoArgumentSafetyBlock);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1001E3DD0;
  v54[3] = &unk_1004FC668;
  id v55 = v6;
  id v10 = -[AFTwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:]( v9,  "initWithBlock:defaultValue1:defaultValue2:",  v54,  0LL,  0LL);
  if ([v7 count])
  {
    id v35 = v6;
    unsigned int v11 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    queue = self->_queue;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_1001E3E64;
    v51[3] = &unk_1004FD968;
    BOOL v33 = v10;
    id v32 = v10;
    id v52 = v32;
    id v36 = v5;
    id v31 = v5;
    id v53 = v31;
    id v30 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v11,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v51,  30.0);
    -[AFWatchdogTimer start](v30, "start");
    int v13 = dispatch_group_create();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _handledCommandIdsForRequestId:](self, "_handledCommandIdsForRequestId:", v38));
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int16 v34 = v7;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)i);
          unsigned __int8 v21 = [v14 containsObject:v20];
          id v22 = (os_log_s *)AFSiriLogContextDaemon;
          BOOL v23 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
          if ((v21 & 1) != 0)
          {
            if (v23)
            {
              *(_DWORD *)__int128 buf = 136315394;
              id v58 = "-[ADCommandCenter _saWaitForCommands:completion:]";
              __int16 v59 = 2112;
              id v60 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Command %@ is already handled. No need to wait.",  buf,  0x16u);
            }
          }

          else
          {
            if (v23)
            {
              *(_DWORD *)__int128 buf = 136315394;
              id v58 = "-[ADCommandCenter _saWaitForCommands:completion:]";
              __int16 v59 = 2112;
              id v60 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Start waiting for command %@ ...",  buf,  0x16u);
            }

            dispatch_group_enter(v13);
            id v24 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472LL;
            v45[2] = sub_1001E3F34;
            v45[3] = &unk_1004FBA60;
            v45[4] = v20;
            __int16 v46 = v13;
            uint64_t v25 = -[AFSafetyBlock initWithBlock:](v24, "initWithBlock:", v45);
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472LL;
            v43[2] = sub_1001E3FF4;
            v43[3] = &unk_1004FD940;
            id v44 = v25;
            __int16 v26 = v25;
            -[ADCommandCenter _addPostCommandHandlingBlock:forCommandId:requestId:]( self,  "_addPostCommandHandlingBlock:forCommandId:requestId:",  v43,  v20,  v38);
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }

      while (v17);
    }

    int v27 = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E4000;
    block[3] = &unk_1004FD4C0;
    id v40 = v30;
    __int16 v41 = v32;
    id v42 = v31;
    id v28 = v30;
    dispatch_group_notify(v13, v27, block);

    id v6 = v35;
    id v5 = v36;
    id v10 = v33;
    id v7 = v34;
  }

  else
  {
    -[AFTwoArgumentSafetyBlock invokeWithValue:andValue:](v10, "invokeWithValue:andValue:", 0LL, 0LL);
  }

LABEL_24:
}

- (void)_saStartUIRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 startRequest]);
  -[AFRequestInfo setStartRequest:](v8, "setStartRequest:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 startLocalRequest]);
  -[AFRequestInfo setStartLocalRequest:](v8, "setStartLocalRequest:", v10);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001E3DB8;
  v12[3] = &unk_1004FC6E0;
  id v13 = v6;
  id v11 = v6;
  -[ADCommandCenter handleExternalActivationRequest:completion:]( self,  "handleExternalActivationRequest:completion:",  v8,  v12);
}

- (void)_saReplayRequestFromDMHypothesis:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
  -[AFRequestInfo setStartRequest:](v8, "setStartRequest:", v7);

  int v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v14 = "-[ADCommandCenter _saReplayRequestFromDMHypothesis:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001E3DA0;
  v11[3] = &unk_1004FC6E0;
  id v12 = v6;
  id v10 = v6;
  -[ADCommandCenter handleExternalActivationRequest:completion:]( self,  "handleExternalActivationRequest:completion:",  v8,  v11);
}

- (void)_saCancelCrossDeviceRequest:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestId]);
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v14 = v8;
    *(_DWORD *)__int128 buf = 136315650;
    id v17 = "-[ADCommandCenter _saCancelCrossDeviceRequest:executionContext:completion:]";
    __int16 v18 = 2112;
    __int128 v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = [v6 cancelAssociatedRequests];
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s %@, shouldCancelAssociatedRequest? %d",  buf,  0x1Cu);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
  if ([v9 isEqualToString:v7])
  {

LABEL_7:
    -[ADCommandCenter cancelCurrentRequest](self, "cancelCurrentRequest");
    -[ADCommandCenter _clearContext](self, "_clearContext");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001E3D50;
    v15[3] = &unk_1004F5250;
    v15[4] = mach_absolute_time();
    id v11 = +[AFSiriActivationContext newWithBuilder:](&OBJC_CLASS___AFSiriActivationContext, "newWithBuilder:", v15);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriActivationConnection sharedConnection]( &OBJC_CLASS___AFSiriActivationConnection,  "sharedConnection"));
    [v12 deactivateForReason:15 options:1 context:v11 completion:0];
LABEL_12:

    goto LABEL_13;
  }

  if (-[NSString isEqualToString:](self->_associatedRequestId, "isEqualToString:", v7))
  {
    unsigned __int8 v10 = [v6 cancelAssociatedRequests];

    if ((v10 & 1) != 0) {
      goto LABEL_7;
    }
  }

  else
  {
  }

  if (-[ADCommandCenter _hasRemoteExecutionContextForRequestID:](self, "_hasRemoteExecutionContextForRequestID:", v7)
    || self->_mostRecentVisibleRemoteExecutionContext)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assistantIdentifier]);
    [v11 cancelOperationsForRequest:v7 forAssistantID:v13 fromRemote:1 reason:2];

    goto LABEL_12;
  }

- (void)_saDeviceConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2112;
    double v39 = *(double *)&v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s deviceConfiguration = %@",  (uint8_t *)&v36,  0x16u);
  }

  [v5 initialInterstitialDelay];
  double v9 = v8;
  unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2048;
    double v39 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s initialInterstitialDelay = %f",  (uint8_t *)&v36,  0x16u);
  }

  _AFPreferencesSetInitialInterstitialDelay(0LL, v9);
  [v5 initialInterstitialDelayForCarPlay];
  double v12 = v11;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2048;
    double v39 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s initialInterstitialDelayForCarPlay = %f",  (uint8_t *)&v36,  0x16u);
  }

  _AFPreferencesSetInitialInterstitialDelay(6LL, v12);
  [v5 initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking];
  double v15 = v14;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 2048;
    double v39 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking = %f",  (uint8_t *)&v36,  0x16u);
  }

  _AFPreferencesSetInitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking(v15);
  unsigned int v17 = [v5 hasAudioSessionActivationDelay];
  __int16 v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v36 = 136315394;
    __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
    __int16 v38 = 1024;
    LODWORD(v39) = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s hasAudioSessionActivationDelay = %d",  (uint8_t *)&v36,  0x12u);
  }

  if (v17)
  {
    [v5 audioSessionActivationDelay];
    double v20 = v19;
    unsigned int v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v36 = 136315394;
      __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
      __int16 v38 = 2048;
      double v39 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s audioSessionActivationDelay = %f",  (uint8_t *)&v36,  0x16u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
    [v22 setServerAudioSessionActivationDelay:v23];

    [v5 mediaPlaybackVolumeThresholdForAudioSessionActivationDelay];
    double v25 = v24;
    __int16 v26 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v36 = 136315394;
      __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
      __int16 v38 = 2048;
      double v39 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s mediaPlaybackVolumeThresholdForAudioSessionActivationDelay = %f",  (uint8_t *)&v36,  0x16u);
    }

    int v27 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25));
    [v27 setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:v28];

    [v5 audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold];
    double v30 = v29;
    id v31 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v36 = 136315394;
      __int128 v37 = "-[ADCommandCenter _saDeviceConfiguration:completion:]";
      __int16 v38 = 2048;
      double v39 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold = %f",  (uint8_t *)&v36,  0x16u);
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v30));
    [v32 setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:v33];
  }

  else
  {
    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v34 setServerAudioSessionActivationDelay:0];

    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v35 setServerMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:0];

    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    [v32 setServerAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:0];
  }

  AFInternalPreferencesSynchronize();
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_saDeviceMyriadConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if ([v8 myriadServerProvisioning])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E3CF0;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    if (qword_100578058 != -1) {
      dispatch_once(&qword_100578058, block);
    }
    uint64_t v9 = arc4random_uniform(0xFFu);
    unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int16 v18 = "-[ADCommandCenter _saDeviceMyriadConfiguration:completion:]";
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Server sent Myriad device configuration. Notifying clients with state %llu",  buf,  0x16u);
    }

    [v6 deviceClass];
    [v8 setMyriadDeviceClass:(int)v11];
    [v6 deviceAdjustment];
    *(float *)&double v12 = v12;
    [v8 setMyriadDeviceAdjust:v12];
    [v6 deviceDelay];
    objc_msgSend(v8, "setMyriadDeviceDelay:");
    [v6 deviceTrumpDelay];
    objc_msgSend(v8, "setMyriadDeviceTrumpDelay:");
    [v8 setMyriadServerHasProvisioned:1];
    [v6 deviceVTEndtimeDistanceThreshold];
    int v13 = AFSupportsSCDAFramework(objc_msgSend(v8, "setMyriadDeviceVTEndTimeDistanceThreshold:"));
    double v14 = &qword_100578050;
    if (!v13) {
      double v14 = &qword_100578048;
    }
    [(id)*v14 publishState:v9];
  }

  else
  {
    double v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v18 = "-[ADCommandCenter _saDeviceMyriadConfiguration:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Server sent Myriad device configuration, but it was ignored",  buf,  0xCu);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_sasResultCandidate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s resultCandidate = %@", buf, 0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  if (-[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v9))
  {
    self->_hasReceivedAtLeastOneResultCandidate = 1;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 processedAudioDuration]);
    [v10 doubleValue];
    double v12 = v11;

    int v13 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      double v14 = v13;
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v6 resultId]);
      *(_DWORD *)__int128 buf = 136315906;
      id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2048;
      id v35 = v12;
      __int16 v36 = 2112;
      __int128 v37 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s %@ (processedAudioDuration = %f, resultId = %@)",  buf,  0x2Au);

      int v13 = (void *)AFSiriLogContextDaemon;
    }

    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      id v16 = v13;
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 resultId]);
      *(_DWORD *)__int128 buf = 136315906;
      id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
      __int16 v32 = 2112;
      id v33 = v17;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      __int128 v37 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Check if ResultCandidate has already been accepted rcId: %@ refId: %@ with resultId: %@",  buf,  0x2Au);
    }

    if (!-[ADCommandCenter _didAlreadyAcceptResultCandidate:](self, "_didAlreadyAcceptResultCandidate:", v6))
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      [v19 logEventWithType:308 context:0];

      uint64_t v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        BOOL speechHasAcceptedResultCandidate = self->_speechHasAcceptedResultCandidate;
        *(_DWORD *)__int128 buf = 136315394;
        id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
        __int16 v32 = 1024;
        LODWORD(v33) = speechHasAcceptedResultCandidate;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s forceAccept = %d", buf, 0x12u);
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
      BOOL v23 = self->_speechHasAcceptedResultCandidate;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1001E39E8;
      v25[3] = &unk_1004F52A0;
      void v25[4] = self;
      id v26 = v9;
      double v29 = v12;
      id v28 = v7;
      id v27 = v6;
      [v22 updateEndpointHintForRC:v27 forceAccept:v23 completion:v25];

      goto LABEL_16;
    }
  }

  else
  {
    double v24 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v31 = "-[ADCommandCenter _sasResultCandidate:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s ResultCandidate for a different request. Ignoring.",  buf,  0xCu);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
LABEL_16:
}

- (void)_acceptResultCandidate:(id)a3 isMitigated:(BOOL)a4 featuresToLog:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v11 refId]);
  if (-[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v14))
  {
    BOOL v45 = v8;
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v11 resultId]);
    id v16 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = v16;
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 aceId]);
      *(_DWORD *)__int128 buf = 136315906;
      __int128 v50 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
      __int16 v51 = 2112;
      id v52 = v18;
      __int16 v53 = 2112;
      __int128 v54 = v14;
      __int16 v55 = 2112;
      id v56 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Check if ResultCandidate has already been accepted rcId: %@ refId: %@ with resultId: %@",  buf,  0x2Au);
    }

    if (-[ADCommandCenter _didAlreadyAcceptResultCandidate:](self, "_didAlreadyAcceptResultCandidate:", v11))
    {
      if (v13) {
        (*((void (**)(id, void, void))v13 + 2))(v13, 0LL, 0LL);
      }
    }

    else
    {
      p_selectedResultCandidate = (id *)&self->_selectedResultCandidate;
      objc_storeStrong((id *)&self->_selectedResultCandidate, a3);
      unsigned int v21 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v24 = *p_selectedResultCandidate;
        double v25 = v21;
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 processedAudioDuration]);
        [v26 doubleValue];
        id v28 = v27;
        double v29 = (void *)objc_claimAutoreleasedReturnValue([*p_selectedResultCandidate resultId]);
        *(_DWORD *)__int128 buf = 136315906;
        __int128 v50 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
        __int16 v51 = 2112;
        id v52 = v24;
        __int16 v53 = 2048;
        __int128 v54 = v28;
        __int16 v55 = 2112;
        id v56 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s selectedResultCandidate = %@ (processedAudioDuration = %f, resultId = %@)",  buf,  0x2Au);
      }

      uint64_t v30 = AFAnalyticsContextCreateWithCommand(v11, v22, v23);
      id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v48[0] = v31;
      if (v12)
      {
        __int16 v46 = @"features";
        id v47 = v12;
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
      }

      else
      {
        __int16 v32 = &__NSDictionary0__struct;
      }

      v48[1] = v32;
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
      uint64_t v34 = AFAnalyticsContextsMerge();
      id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

      if (v12) {
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      }
      [v36 logEventWithType:310 context:v35];

      __int128 v37 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        __int16 v38 = v37;
        double v39 = (void *)objc_claimAutoreleasedReturnValue([v11 aceId]);
        *(_DWORD *)__int128 buf = 136315906;
        __int128 v50 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
        __int16 v51 = 2112;
        id v52 = v39;
        __int16 v53 = 2112;
        __int128 v54 = v14;
        __int16 v55 = 2112;
        id v56 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "%s Accepted this ResultCandidate aceId: %@ refId: %@ with resultId %@",  buf,  0x2Au);
      }

      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
      __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v11 aceId]);
      [v40 updateSelectedResultCandidateId:v41];

      if (v13)
      {
        id v42 = objc_alloc_init(&OBJC_CLASS___SAResultSelected);
        -[SAResultSelected setRefId:](v42, "setRefId:", v14);
        __int16 v43 = (void *)objc_claimAutoreleasedReturnValue([v11 processedAudioDuration]);
        -[SAResultSelected setProcessedAudioDuration:](v42, "setProcessedAudioDuration:", v43);

        -[SAResultSelected setResultId:](v42, "setResultId:", v15);
        id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45));
        -[SAResultSelected setIsMitigated:](v42, "setIsMitigated:", v44);

        (*((void (**)(id, SAResultSelected *, void))v13 + 2))(v13, v42, 0LL);
      }
    }
  }

  else
  {
    __int16 v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v50 = "-[ADCommandCenter _acceptResultCandidate:isMitigated:featuresToLog:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s ResultCandidate is out of scope in accept. Ignoring.",  buf,  0xCu);
    }

    if (v13) {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0LL, 0LL);
    }
  }
}

- (BOOL)_didAlreadyAcceptResultCandidate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_speechHasAcceptedResultCandidate
    && (self->_selectedResultCandidate
     || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 processedAudioDuration]),
         [v6 doubleValue],
         double v8 = v7,
         double v9 = self->_speechAcceptedResultCandidateDuration,
         v6,
         v8 < v9)))
  {
    unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      unsigned int v21 = "-[ADCommandCenter _didAlreadyAcceptResultCandidate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Already accepted result candidate for request",  (uint8_t *)&v20,  0xCu);
      unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      selectedResultCandidate = self->_selectedResultCandidate;
      id v12 = v10;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SASResultCandidate processedAudioDuration](selectedResultCandidate, "processedAudioDuration"));
      [v13 doubleValue];
      uint64_t v15 = v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SASResultCandidate resultId](self->_selectedResultCandidate, "resultId"));
      int v20 = 136315906;
      unsigned int v21 = "-[ADCommandCenter _didAlreadyAcceptResultCandidate:]";
      __int16 v22 = 2112;
      double v23 = *(double *)&selectedResultCandidate;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s selectedResultCandidate = %@ (processedAudioDuration = %f, resultId = %@)",  (uint8_t *)&v20,  0x2Au);

      unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
    }

    BOOL v17 = 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double speechAcceptedResultCandidateDuration = self->_speechAcceptedResultCandidateDuration;
      int v20 = 136315394;
      unsigned int v21 = "-[ADCommandCenter _didAlreadyAcceptResultCandidate:]";
      __int16 v22 = 2048;
      double v23 = speechAcceptedResultCandidateDuration;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s double speechAcceptedResultCandidateDuration = %f",  (uint8_t *)&v20,  0x16u);
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_sasSpeechServerEndpointIdentified:(id)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([a3 refId]);
  unsigned __int8 v8 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v7);

  double v9 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      int v12 = 136315138;
      id v13 = "-[ADCommandCenter _sasSpeechServerEndpointIdentified:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    [v11 enforcePreviousEndpointHint];

LABEL_8:
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    goto LABEL_9;
  }

  if (v10)
  {
    int v12 = 136315138;
    id v13 = "-[ADCommandCenter _sasSpeechServerEndpointIdentified:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s ServerEndpoint for a different request. Ignoring.",  (uint8_t *)&v12,  0xCu);
  }

  if (v6) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_setSpeechRecognizedContext:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v5 setSpeechRecognizedContext:v4];
}

- (void)_sasVoiceIdentificationSignal:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned __int8 v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if ((v9 & 1) != 0)
  {
    id v10 = [v6 recordUserAudio];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 resultCandidateId]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 selectedSharedUserId]);
    NSUInteger v13 = -[NSString length](self->_selectedSharedUserID, "length");
    if (v12)
    {
      if (v13) {
        goto LABEL_12;
      }
      objc_storeStrong((id *)&self->_selectedSharedUserID, v12);
      uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
      selectedSharedUserID = self->_selectedSharedUserID;
      *(_DWORD *)__int16 v24 = 136315394;
      *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = selectedSharedUserID;
      id v16 = "%s Updated _selectedSharedUserID from SASVoiceIdentificationSignal to: %@";
      BOOL v17 = v14;
      uint32_t v18 = 22;
    }

    else
    {
      if (!v13) {
        goto LABEL_12;
      }
      int v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
      *(_DWORD *)__int16 v24 = 136315138;
      *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
      id v16 = "%s Not updating _selectedSharedUserID with nil selectedSharedUserID from SASVoiceIdentificationSignal";
      BOOL v17 = v20;
      uint32_t v18 = 12;
    }

    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v16, v24, v18);
LABEL_12:
    unsigned int v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v24 = 136316162;
      *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
      *(_WORD *)&v24[12] = 2112;
      *(void *)&v24[14] = v6;
      *(_WORD *)&v24[22] = 1024;
      int v25 = (int)v10;
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      double v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s %@ (recordUserAudio = %d, resultCandidateId = %@, selectedSharedUserId = %@)",  v24,  0x30u);
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _speechCapturingContext]( self,  "_speechCapturingContext",  *(_OWORD *)v24,  *(void *)&v24[16]));
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v6 selectedSharedUserId]);
    [v22 updateAccessToRecordedAudioForVoiceIdentificationTraining:v10 forResultCandidateId:v11 sharedUserId:v23];

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    goto LABEL_15;
  }

  __int16 v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v24 = 136315138;
    *(void *)&void v24[4] = "-[ADCommandCenter _sasVoiceIdentificationSignal:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s VoiceIdentificationSignal for a different request. Ignoring.",  v24,  0xCu);
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
LABEL_15:
}

- (void)_sasSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, SACommandSucceeded *, void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
  unsigned __int8 v12 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v11);

  NSUInteger v13 = (void *)AFSiriLogContextDaemon;
  BOOL v14 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if ((v12 & 1) != 0)
  {
    if (v14)
    {
      uint64_t v15 = v13;
      *(_DWORD *)__int128 buf = 136315394;
      __int16 v32 = "-[ADCommandCenter _sasSpeechRecognized:executionContext:completion:]";
      __int16 v33 = 1024;
      unsigned int v34 = [v8 eager];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s isEager %d", buf, 0x12u);
    }

    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E37A4;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(v16, block);

    id v17 = [v8 copy];
    uint32_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _languageModelForSpeechRequest:]( self,  "_languageModelForSpeechRequest:",  self->_startSpeechCommand));
    id v19 = sub_1001E3564(v17, v18);
    int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v21 logEventWithType:1102 context:v20];

    -[ADCommandCenter _setSpeechRecognizedContext:](self, "_setSpeechRecognizedContext:", v20);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1001E3930;
    v28[3] = &unk_1004F52F0;
    id v22 = v8;
    id v29 = v22;
    [v9 updateInfoUsingBlock:v28];
    -[ADCommandCenter _cancelLocalRecognitionIfRequired](self, "_cancelLocalRecognitionIfRequired");
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001E39C4;
    v25[3] = &unk_1004FD4C0;
    void v25[4] = self;
    id v26 = v22;
    id v23 = v18;
    id v27 = v23;
    -[ADCommandCenter _handleSpeechRecognizedWithDelegateBlock:](self, "_handleSpeechRecognizedWithDelegateBlock:", v25);
    if (v10)
    {
      __int16 v24 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
      v10[2](v10, v24, 0LL);
    }
  }

  else
  {
    if (v14)
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v32 = "-[ADCommandCenter _sasSpeechRecognized:executionContext:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_INFO,  "%s SpeechRecognized for a different request. Ignoring.",  buf,  0xCu);
    }

    if (v10) {
      v10[2](v10, 0LL, 0LL);
    }
  }
}

- (void)_sasSpeechMultilingualSpeechRecognized:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);
  unsigned __int8 v12 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v11);

  NSUInteger v13 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v14 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if ((v12 & 1) != 0)
  {
    if (v14)
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v31 = "-[ADCommandCenter _sasSpeechMultilingualSpeechRecognized:executionContext:completion:]";
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    if (self->_isSmartLanguageSelectionActive)
    {
      objc_initWeak((id *)buf, self);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1001E317C;
      v26[3] = &unk_1004F7670;
      objc_copyWeak(&v29, (id *)buf);
      id v27 = v8;
      id v28 = v10;
      uint64_t v15 = objc_retainBlock(v26);
      id multilingualSpeechRecognizedCommandHandler = self->_multilingualSpeechRecognizedCommandHandler;
      self->_id multilingualSpeechRecognizedCommandHandler = v15;

      if (self->_hasReceivedDetectedLanguage)
      {
        id v17 = (void (**)(void))objc_retainBlock(self->_multilingualSpeechRecognizedCommandHandler);
        id v18 = self->_multilingualSpeechRecognizedCommandHandler;
        self->_id multilingualSpeechRecognizedCommandHandler = 0LL;

        v17[2](v17);
      }

      else
      {
        -[ADCommandCenter _startLanguageDetectionWaitTimer](self, "_startLanguageDetectionWaitTimer");
      }

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech ad_languageModel](self->_startSpeechCommand, "ad_languageModel"));
      if (v19)
      {
        int v20 = (void *)objc_claimAutoreleasedReturnValue([v8 speechRecognizedByLanguage]);
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v19]);

        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech aceId](self->_startSpeechCommand, "aceId"));
        [v21 setRefId:v22];

        -[ADCommandCenter _sasSpeechRecognized:executionContext:completion:]( self,  "_sasSpeechRecognized:executionContext:completion:",  v21,  v9,  v10);
      }

      else
      {
        id v23 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = v23;
          int v25 = (void *)objc_claimAutoreleasedReturnValue([v8 speechRecognizedByLanguage]);
          *(_DWORD *)__int128 buf = 136315650;
          id v31 = "-[ADCommandCenter _sasSpeechMultilingualSpeechRecognized:executionContext:completion:]";
          __int16 v32 = 2112;
          id v33 = v8;
          __int16 v34 = 2112;
          id v35 = v25;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s SASMultilingualSpeechRecognized failed to return speech recognized command for primary language\n %@ %@",  buf,  0x20u);
        }

        if (v10) {
          (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
        }
      }
    }
  }

  else
  {
    if (v14)
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v31 = "-[ADCommandCenter _sasSpeechMultilingualSpeechRecognized:executionContext:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Multilingual SpeechRecognized for a different request. Ignoring.",  buf,  0xCu);
    }

    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
  }
}

- (void)_sasPronunciationRecognized:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned __int8 v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if ((v9 & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001E312C;
    v11[3] = &unk_1004FD968;
    void v11[4] = self;
    id v12 = v6;
    -[ADCommandCenter _handleSpeechRecognizedWithDelegateBlock:](self, "_handleSpeechRecognizedWithDelegateBlock:", v11);
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      BOOL v14 = "-[ADCommandCenter _sasPronunciationRecognized:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s PronunciationRecognized for a different request. Ignoring",  buf,  0xCu);
    }
  }
}

- (void)_handlePartialSpeechRecognitionForElapsedTime:(double)a3 WithDelegateBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v7 updateOptionsAfterRecognitionForElapsedTime:0 isFinal:a3];

  if (self->_speechDelegateHasReceivedSpeechRecognized)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADCommandCenter _handlePartialSpeechRecognitionForElapsedTime:WithDelegateBlock:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Ignoring Partial, SpeechRecognized has already been received",  (uint8_t *)&v9,  0xCu);
    }
  }

  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)_handleSpeechRecognizedWithDelegateBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v5 updateOptionsAfterRecognitionForElapsedTime:1 isFinal:0.0];

  if (self->_speechDelegateHasReceivedSpeechRecognized)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v15 = "-[ADCommandCenter _handleSpeechRecognizedWithDelegateBlock:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Ignoring Recognition, SpeechRecognized has already been received",  buf,  0xCu);
    }
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001E308C;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(queue, block);
    if (v4) {
      v4[2](v4);
    }
    self->_BOOL speechDelegateHasReceivedSpeechRecognized = 1;
    startSpeechCommand = self->_startSpeechCommand;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___SASStartSpeechDictation);
    if ((objc_opt_isKindOfClass(startSpeechCommand, v9) & 1) != 0)
    {
      id v10 = self->_startSpeechCommand;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___SASStartVoiceSearchRequest);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
        -[ADCommandCenter _dictationSessionDidComplete](self, "_dictationSessionDidComplete");
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
    [v12 logSpeechRecognized];
  }
}

- (void)_sasSpeechPartialResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v28 = "-[ADCommandCenter _sasSpeechPartialResult:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned __int8 v10 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v9);

  if ((v10 & 1) != 0)
  {
    else {
      id v12 = 0LL;
    }
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001E2CAC;
    v25[3] = &unk_1004FD8D0;
    id v15 = v12;
    id v26 = v15;
    [v14 logEventWithType:1101 contextProvider:v25];

    if (sub_1001E2D4C(self->_currentRequest, v6))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedClassName]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      sub_1001E2E58(v16, v17, v18, 3LL);
    }

    self->_hasReceivedServerSpeechRecognitions = 1;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 tokens]);
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lastObject]);

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 endTime]);
    double v22 = (double)(uint64_t)[v21 longLongValue] / 1000.0;

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001E3048;
    v23[3] = &unk_1004FD968;
    v23[4] = self;
    id v24 = v6;
    -[ADCommandCenter _handlePartialSpeechRecognitionForElapsedTime:WithDelegateBlock:]( self,  "_handlePartialSpeechRecognitionForElapsedTime:WithDelegateBlock:",  v23,  v22);
    -[ADCommandCenter _acousticId_clearPartialResultTimer](self, "_acousticId_clearPartialResultTimer");
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }

  else
  {
    NSUInteger v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v28 = "-[ADCommandCenter _sasSpeechPartialResult:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Partial for a different request. Ignoring.",  buf,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)_saStructuredDictationResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    BOOL v14 = "-[ADCommandCenter _saStructuredDictationResult:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v13, 0x16u);
  }

  if ((objc_opt_respondsToSelector( self->_speechDelegate,  "adSpeechRecognizedStructuredResult:usingSpeechModel:sessionUUID:") & 1) != 0)
  {
    speechDelegate = self->_speechDelegate;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _languageModelForSpeechRequest:]( self,  "_languageModelForSpeechRequest:",  self->_startSpeechCommand));
    -[ADCommandCenterSpeechDelegate adSpeechRecognizedStructuredResult:usingSpeechModel:sessionUUID:]( speechDelegate,  "adSpeechRecognizedStructuredResult:usingSpeechModel:sessionUUID:",  v6,  v10,  0LL);
  }

  startSpeechCommand = self->_startSpeechCommand;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SASStartStructuredDictationSpeechRequest);
  if ((objc_opt_isKindOfClass(startSpeechCommand, v12) & 1) != 0) {
    -[ADCommandCenter _dictationSessionDidComplete](self, "_dictationSessionDidComplete");
  }
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_saStructuredDictationFailure:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v10 = v8;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 recognition]);
    int v12 = 136315394;
    int v13 = "-[ADCommandCenter _saStructuredDictationFailure:completion:]";
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ad_error"));
  -[ADCommandCenterSpeechDelegate adSpeechRecognitionDidFail:sessionUUID:]( self->_speechDelegate,  "adSpeechRecognitionDidFail:sessionUUID:",  v9,  self->_speechCapturingContextSessionUUID);
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_sasSpeechFailure:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned __int8 v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if ((v9 & 1) != 0)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 reasonDescription]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ad_error"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  203LL,  v10,  v11));

    -[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]( self,  "_endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:",  v6,  v12,  0LL,  0LL);
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }

  else
  {
    int v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      __int16 v15 = "-[ADCommandCenter _sasSpeechFailure:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Failure for a different request. Ignoring.",  (uint8_t *)&v14,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)_sasAbortSpeechRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned __int8 v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if ((v9 & 1) != 0)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 reason]);
    id v11 = [v10 isEqualToString:SASAbortSpeechRequestReasonACOUSTIC_ID_DETECTEDValue];
    if ((v11 & 1) != 0)
    {
      int v12 = 1;
      uint64_t v13 = 218LL;
    }

    else
    {
      id v11 = [v10 isEqualToString:SASAbortSpeechRequestReasonFALSE_TRIGGER_DETECTEDValue];
      int v12 = (int)v11;
      if ((_DWORD)v11) {
        uint64_t v13 = 219LL;
      }
      else {
        uint64_t v13 = 211LL;
      }
    }

    uint64_t v15 = AFIsNano(v11) | v12;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  v13,  v10,  0LL));
    -[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]( self,  "_endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:",  v6,  v16,  v15,  0LL);
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }

  else
  {
    int v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      id v18 = "-[ADCommandCenter _sasAbortSpeechRequest:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Abort for a different request. Ignoring.",  (uint8_t *)&v17,  0xCu);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }
  }
}

- (void)_sasVoiceSearchPartialResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned int v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if (v9)
  {
    if ((objc_opt_respondsToSelector(self->_speechDelegate, "adSpeechDidFindVoiceSearchPartialResult:") & 1) != 0) {
      -[ADCommandCenterSpeechDelegate adSpeechDidFindVoiceSearchPartialResult:]( self->_speechDelegate,  "adSpeechDidFindVoiceSearchPartialResult:",  v6);
    }
  }

  else
  {
    unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "-[ADCommandCenter _sasVoiceSearchPartialResult:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Got VoiceSearchPartialResult for something other than our current speech command. Ignoring.",  (uint8_t *)&v11,  0xCu);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_sasVoiceSearchFinalResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned int v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if (v9)
  {
    if ((objc_opt_respondsToSelector(self->_speechDelegate, "adSpeechDidFindVoiceSearchFinalResult:") & 1) != 0) {
      -[ADCommandCenterSpeechDelegate adSpeechDidFindVoiceSearchFinalResult:]( self->_speechDelegate,  "adSpeechDidFindVoiceSearchFinalResult:",  v6);
    }
    -[ADCommandCenter _dictationSessionDidComplete](self, "_dictationSessionDidComplete");
  }

  else
  {
    unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "-[ADCommandCenter _sasVoiceSearchFinalResult:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Got voiceSearchFinalResult for something other than our current speech command. Ignoring.",  (uint8_t *)&v11,  0xCu);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_sasSuspendClientEndpointer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned int v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if (v9)
  {
    -[ADCommandCenter _handleSuspendClientEndpointer:](self, "_handleSuspendClientEndpointer:", v6);
  }

  else
  {
    unsigned __int8 v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      int v12 = "-[ADCommandCenter _sasSuspendClientEndpointer:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Got suspendClientEndpointer for something other than our current speech command. Ignoring.",  (uint8_t *)&v11,  0xCu);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_handleSuspendClientEndpointer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioProcessedMs]);
  double v6 = (double)(unint64_t)[v5 unsignedLongLongValue] / 1000.0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 suspendDurationMs]);

  double v8 = (double)(unint64_t)[v7 unsignedLongLongValue] / 1000.0;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  objc_msgSend(v9, "suspendAutomaticEndpointingInRange:", v6, v8);
}

- (void)_sasConfirmEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned int v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if (v9)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 endpointConfirmationTimestamp]);
    double v11 = (double)(unint64_t)[v10 unsignedLongLongValue] / 1000.0;

    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001E2BFC;
    v15[3] = &unk_1004F5318;
    double v17 = v11;
    id v16 = (SACommandFailed *)v7;
    [v12 getLastStartpointTimestampAndCurrentTime:v15];

    uint64_t v13 = v16;
LABEL_7:

    goto LABEL_8;
  }

  int v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v19 = "-[ADCommandCenter _sasConfirmEndpoint:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Got confirmEndpointRequest for something other than our current speech command. Ignoring.",  buf,  0xCu);
  }

  if (v7)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    (*((void (**)(id, SACommandFailed *, void))v7 + 2))(v7, v13, 0LL);
    goto LABEL_7;
  }

- (void)_sasServerEndpointFeatures:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned int v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if (v9)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ad_csASRFeatures"));
    [v10 updateASRFeatures:v11];
  }

  else
  {
    int v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      int v14 = "-[ADCommandCenter _sasServerEndpointFeatures:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Got serverEndpointFeatures for something other than our current speech command. Ignoring.",  (uint8_t *)&v13,  0xCu);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_sasClientBoundConfusionNetwork:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 refId]);
  LOBYTE(self) = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v7);

  if ((self & 1) == 0)
  {
    double v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      unsigned __int8 v10 = "-[ADCommandCenter _sasClientBoundConfusionNetwork:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Got confusionNetwork for something other than our current speech command. Ignoring.",  (uint8_t *)&v9,  0xCu);
    }
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_saClientSetupInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
  unsigned int v9 = -[ADCommandCenter _refIdIsSpeechStart:](self, "_refIdIsSpeechStart:", v8);

  if (v9)
  {
    speechManager = self->_speechManager;
    [v6 threshold];
    -[ADSpeechManager setEndpointerThreshold:](speechManager, "setEndpointerThreshold:");
    -[ADSpeechManager setEndpointerDelayedTrigger:]( self->_speechManager,  "setEndpointerDelayedTrigger:",  [v6 delay]);
  }

  else
  {
    double v11 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = v11;
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 refId]);
      int v14 = 136315394;
      uint64_t v15 = "-[ADCommandCenter _saClientSetupInfo:completion:]";
      __int16 v16 = 2112;
      double v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Got clientSetupInfo for refId %@. Ignoring. ",  (uint8_t *)&v14,  0x16u);
    }
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_endSpeechRequestForCommand:(id)a3 withError:(id)a4 suppressAlert:(BOOL)a5 secureOfflineOnlyDictation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  int v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136316162;
    double v39 = "-[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]";
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    __int16 v44 = 1024;
    BOOL v45 = v7;
    __int16 v46 = 1024;
    BOOL v47 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s command %@ error %@ suppressAlert %d secureOfflineOnlyDictation %d",  buf,  0x2Cu);
  }

  unsigned int v13 = -[ADCommandCenterSpeechDelegate adWaitingForAudioFile]( self->_speechDelegate,  "adWaitingForAudioFile");
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
  if (self->_speechManagerState == 2)
  {
    if ((v13 & 1) != 0)
    {
      __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        double v39 = "-[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Recognition failed, but we're waiting to write an audio file. Don't cancel recording",  buf,  0xCu);
      }
    }

    else
    {
      [v14 cancelSpeechCaptureSuppressingAlert:v7];
      [v14 setContext:0];
      -[ADCommandCenterSpeechDelegate adSpeechRecordingDidEndWithContext:]( self->_speechDelegate,  "adSpeechRecordingDidEndWithContext:",  v15);
    }
  }

  if (self->_startSpeechCommand)
  {
    if (v11) {
      BOOL v17 = v6;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17 || !self->_speechDelegateHasReceivedSpeechRecognized) {
      goto LABEL_17;
    }
  }

  else if (v11 && v6)
  {
LABEL_17:
    speechDelegate = self->_speechDelegate;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionUUID]);
    -[ADCommandCenterSpeechDelegate adSpeechRecognitionDidFail:sessionUUID:]( speechDelegate,  "adSpeechRecognitionDidFail:sessionUUID:",  v11,  v19);
    goto LABEL_20;
  }

  if (!v6) {
    goto LABEL_21;
  }
  int v20 = self->_speechDelegate;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionUUID]);
  -[ADCommandCenterSpeechDelegate adSpeechLocalRecognitionDidSucceedWithSessionUUID:]( v20,  "adSpeechLocalRecognitionDidSucceedWithSessionUUID:",  v19);
LABEL_20:

LABEL_21:
  currentRequest = self->_currentRequest;
  if (v10 || !currentRequest || v6)
  {
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](currentRequest, "currentRequestId"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 refId]);
    unsigned int v24 = [v22 isEqualToString:v23];

    if (!v24)
    {
      if (v10 || !v11)
      {
        BOOL v30 = v11 == 0LL;
        id v29 = self;
      }

      else
      {
        id v29 = self;
        BOOL v30 = 0LL;
      }

      -[ADCommandCenter _completeRequestForCurrentDelegate:error:]( v29,  "_completeRequestForCurrentDelegate:error:",  v30,  v11);
      if (v13) {
        goto LABEL_28;
      }
LABEL_34:
      -[ADCommandCenter _clearSpeechDelegateState](self, "_clearSpeechDelegateState");
      goto LABEL_35;
    }
  }

  if (!v11) {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 212LL));
  }
  -[ADCommandCenter _completeRequestForCurrentDelegate:error:]( self,  "_completeRequestForCurrentDelegate:error:",  0LL,  v11);
  -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", 0LL);
  if (!v13) {
    goto LABEL_34;
  }
LABEL_28:
  id v25 = objc_retainBlock(self->_speechCompletion);
  objc_initWeak((id *)buf, self);
  __int16 v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472LL;
  __int16 v34 = sub_1001E2B30;
  id v35 = &unk_1004F5340;
  objc_copyWeak(&v37, (id *)buf);
  id v36 = v25;
  id v26 = v25;
  id v27 = objc_retainBlock(&v32);
  id speechCompletion = self->_speechCompletion;
  self->_id speechCompletion = v27;

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);
LABEL_35:
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager", v32, v33, v34, v35));
  [v31 endRetryableRequestForCommand:v10];

  -[ADCommandCenter _requestDidEnd](self, "_requestDidEnd");
}

- (void)_saAcknowledgeAlert:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, SACommandSucceeded *, void))a4;
  double v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "-[ADCommandCenter _saAcknowledgeAlert:completion:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 object]);
  -[ADCommandCenter _context_acknowledgeBulletinForObject:](self, "_context_acknowledgeBulletinForObject:", v9);

  if (v7)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    v7[2](v7, v10, 0LL);
  }
}

- (void)_saGetRequestOrigin:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v29 = "-[ADCommandCenter _saGetRequestOrigin:executionContext:completion:]";
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 requestID]);

  currentRequest = self->_currentRequest;
  if (currentRequest
    && (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](currentRequest, "currentRequestId")),
        unsigned __int8 v16 = [v15 isEqualToString:v13],
        v15,
        (v16 & 1) != 0))
  {
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001E2ABC;
    v23[3] = &unk_1004F5368;
    id v18 = &v24;
    id v24 = v10;
    id v19 = v10;
    [v17 updateLocationForCommand:v8 completion:v23];
  }

  else
  {
    int v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v29 = "-[ADCommandCenter _saGetRequestOrigin:executionContext:completion:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s Fetching location for request on a different device",  buf,  0xCu);
    }

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1001E27D4;
    v25[3] = &unk_1004FD6C8;
    id v18 = &v26;
    id v26 = v8;
    id v27 = v10;
    id v22 = v10;
    [v21 getContextSnapshotForForeignRequestID:v13 completion:v25];

    BOOL v17 = v27;
  }
}

- (void)_saGetAssistantData:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v14 = "-[ADCommandCenter _saGetAssistantData:executionContext:completion:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001E26F4;
  v11[3] = &unk_1004F5390;
  id v12 = v7;
  id v10 = v7;
  [v9 getAssistantDataWithCompletion:v11];
}

- (void)_saSetLatencyDiagnosticConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _diagnosticsManager](self, "_diagnosticsManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001E2680;
  v10[3] = &unk_1004F53B8;
  id v11 = v6;
  id v9 = v6;
  [v8 updateLatencyDiagnosticConfiguration:v7 completion:v10];
}

- (void)_saLogSignatureWithABC:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[ADCommandCenter _saLogSignatureWithABC:completion:]";
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 subType]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 subTypeContext]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v12 = [v11 processIdentifier];
  [v8 reportIssueForType:@"server_request" subType:v9 context:v10 processIdentifier:v12 walkboutStatus:byte_1005780A0];

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_saLogNumericEvent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v22 = "-[ADCommandCenter _saLogNumericEvent:completion:]";
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventName", SALogNumericEventEventNamePListKey));
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (const __CFString *)v8;
  }
  else {
    id v10 = &stru_1004FECA0;
  }
  v20[0] = v10;
  v19[1] = SALogNumericEventEventOperationPListKey;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 eventOperation]);
  id v12 = (void *)v11;
  if (v11) {
    int v13 = (const __CFString *)v11;
  }
  else {
    int v13 = &stru_1004FECA0;
  }
  v20[1] = v13;
  v19[2] = SALogNumericEventEventValuePListKey;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 eventValue]);
  __int16 v15 = (void *)v14;
  id v16 = &off_1005134F8;
  if (v14) {
    id v16 = (_UNKNOWN **)v14;
  }
  v20[2] = v16;
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v18 logEventWithType:140 context:v17];

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_saLogStringEvent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v19 = "-[ADCommandCenter _saLogStringEvent:completion:]";
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventName", SALogStringEventEventNamePListKey));
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (const __CFString *)v8;
  }
  else {
    id v10 = &stru_1004FECA0;
  }
  v17[0] = v10;
  v16[1] = SALogStringEventEventValuePListKey;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 eventValue]);
  id v12 = (void *)v11;
  if (v11) {
    int v13 = (const __CFString *)v11;
  }
  else {
    int v13 = &stru_1004FECA0;
  }
  v17[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v15 logEventWithType:141 context:v14];

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
}

- (void)_saTTSGetSpeechSynthesisVolume:(id)a3 completion:(id)a4
{
  double v6 = COERCE_DOUBLE(a3);
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v30 = "-[ADCommandCenter _saTTSGetSpeechSynthesisVolume:completion:]";
    __int16 v31 = 2112;
    double v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ttsGetSpeechSynthesisVolume = %@", buf, 0x16u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1001E24F8;
  v26[3] = &unk_1004F53E0;
  id v9 = v7;
  id v28 = v9;
  double v10 = COERCE_DOUBLE(*(id *)&v6);
  double v27 = v10;
  uint64_t v11 = objc_retainBlock(v26);
  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1001E2668;
    v24[3] = &unk_1004F5408;
    id v25 = v11;
    [v12 getCurrentAccessoryWithCompletion:v24];
  }

  else
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
    unsigned int v14 = [v13 smartSiriVolumeContextAwareEnabled];

    __int16 v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      __int16 v30 = "-[ADCommandCenter _saTTSGetSpeechSynthesisVolume:completion:]";
      __int16 v31 = 2112;
      double v32 = v10;
      __int16 v33 = 1024;
      unsigned int v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s ttsGetSpeechSynthesisVolume = %@, smartSiriVolumeContextAwareEnabled = %d",  buf,  0x1Cu);
    }

    if (v14)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSSpeechController sharedController](&OBJC_CLASS___CSSpeechController, "sharedController"));
      [v16 getVolumeForTTSType:2];
      float v18 = v17;

      id v19 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v30 = "-[ADCommandCenter _saTTSGetSpeechSynthesisVolume:completion:]";
        __int16 v31 = 2048;
        double v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s smartSiriVolume = %f", buf, 0x16u);
      }

      if (v9)
      {
        id v20 = objc_alloc_init(&OBJC_CLASS___SATTSGetSpeechSynthesisVolumeResponse);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v10 aceId]);
        [v20 setRefId:v21];

        *(float *)&double v22 = v18;
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v22));
        [v20 setVolumeLevel:v23];

        (*((void (**)(id, id, void))v9 + 2))(v9, v20, 0LL);
      }
    }

    else
    {
      -[ADCommandCenter _getSiriOutputVolumeForAudioRoute:completion:]( self,  "_getSiriOutputVolumeForAudioRoute:completion:",  0LL,  v11);
    }
  }
}

- (void)_saTTSSetSpeechSynthesisVolume:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSPreferences sharedPreferences](&OBJC_CLASS___CSPreferences, "sharedPreferences"));
  unsigned int v9 = [v8 smartSiriVolumeContextAwareEnabled];

  double v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 actionType]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 volumeValue]);
    *(_DWORD *)__int128 buf = 136316162;
    id v56 = "-[ADCommandCenter _saTTSSetSpeechSynthesisVolume:completion:]";
    __int16 v57 = 2112;
    id v58 = v6;
    __int16 v59 = 2112;
    id v60 = v12;
    __int16 v61 = 2112;
    id v62 = v13;
    __int16 v63 = 1024;
    unsigned int v64 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s ttsSetSpeechSynthesisVolume = %@ (actionType = %@, volumeLevel = %@), smartSiriVolumeContextAwareEnabled = %d",  buf,  0x30u);
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 actionType]);
  uint64_t v15 = SATTSSpeechVolumeActionTypeSETValue;
  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeSETValue])
  {
    uint64_t v16 = 1LL;
  }

  else if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeINCREASEValue])
  {
    uint64_t v16 = 2LL;
  }

  else if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeDECREASEValue])
  {
    uint64_t v16 = 3LL;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1001E2134;
    v52[3] = &unk_1004FD6F0;
    __int128 v54 = (SACommandSucceeded *)v7;
    id v17 = v6;
    id v53 = v17;
    float v18 = objc_retainBlock(v52);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 volumeValue]);
    [v19 floatValue];
    float v21 = v20;

    if ((unint64_t)(v16 - 2) >= 2)
    {
      if (v16 != 1)
      {
        id v36 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v56 = "-[ADCommandCenter _saTTSSetSpeechSynthesisVolume:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s Unsupported volume operation type.",  buf,  0xCu);
        }

        goto LABEL_26;
      }

      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_1001E2270;
      v49[3] = &unk_1004F5430;
      float v51 = v21;
      __int128 v50 = v18;
      [v28 getCurrentAccessoryWithCompletion:v49];

      id v24 = v50;
    }

    else
    {
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v17 volumeValue]);
      if (!v22) {
        float v21 = 0.1;
      }

      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_1001E228C;
      v45[3] = &unk_1004F5480;
      __int16 v46 = v18;
      uint64_t v47 = v16;
      float v48 = v21;
      [v23 getCurrentAccessoryWithCompletion:v45];

      id v24 = v46;
    }

LABEL_26:
    __int16 v33 = v54;
    goto LABEL_38;
  }

  if (!v9)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 volumeValue]);
    [v29 floatValue];
    int v31 = v30;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1001E233C;
    v42[3] = &unk_1004FD6F0;
    __int16 v44 = (SACommandSucceeded *)v7;
    id v43 = v6;
    LODWORD(v32) = v31;
    -[ADCommandCenter _setSiriOutputVolume:forAudioRoute:operationType:completion:]( self,  "_setSiriOutputVolume:forAudioRoute:operationType:completion:",  0LL,  v16,  v42,  v32);

    __int16 v33 = v44;
LABEL_38:

    goto LABEL_39;
  }

  uint64_t v25 = mach_absolute_time();
  if ([v14 isEqualToString:v15])
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[CSSpeechController sharedController](&OBJC_CLASS___CSSpeechController, "sharedController"));
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v6 volumeValue]);
    [v27 floatValue];
    objc_msgSend(v26, "setSmartSiriVolumePercentage:");

    goto LABEL_35;
  }

  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeINCREASEValue])
  {
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[CSSpeechController sharedController](&OBJC_CLASS___CSSpeechController, "sharedController"));
    id v26 = v34;
    uint64_t v35 = 1LL;
LABEL_29:
    [v34 setSmartSiriVolumeDirection:v35];
    goto LABEL_35;
  }

  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeDECREASEValue])
  {
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[CSSpeechController sharedController](&OBJC_CLASS___CSSpeechController, "sharedController"));
    id v26 = v34;
    uint64_t v35 = 0LL;
    goto LABEL_29;
  }

  if ([v14 isEqualToString:SATTSSpeechVolumeActionTypeENABLE_OFFSET_AND_INCREASEValue])
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[CSSpeechController sharedController](&OBJC_CLASS___CSSpeechController, "sharedController"));
    id v26 = v37;
    uint64_t v38 = 1LL;
  }

  else
  {
    if (![v14 isEqualToString:SATTSSpeechVolumeActionTypeENABLE_OFFSET_AND_DECREASEValue]) {
      goto LABEL_36;
    }
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[CSSpeechController sharedController](&OBJC_CLASS___CSSpeechController, "sharedController"));
    id v26 = v37;
    uint64_t v38 = 0LL;
  }

  [v37 setPermanentVolumeOffsetWithDirection:v38];
LABEL_35:

  double v39 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 volumeTracker]);
  [v40 setDirtySiriOutputVolumeHostTime:v25];

LABEL_36:
  if (v7)
  {
    __int16 v33 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    -[SACommandSucceeded setRefId:](v33, "setRefId:", v41);

    (*((void (**)(id, SACommandSucceeded *, void))v7 + 2))(v7, v33, 0LL);
    goto LABEL_38;
  }

- (void)_completeNotificationSearch:(id)a3 bulletins:(id)a4 completion:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, id, void))a5;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([a3 isOnDeviceSearch]);
  unsigned int v10 = [v9 BOOLValue];

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v16);
        if (v10) {
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 saOnDeviceNotificationObject]);
        }
        else {
          uint64_t v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "saNotificationObject", (void)v22));
        }
        id v19 = (void *)v18;
        -[NSMutableArray addObject:](v11, "addObject:", v18, (void)v22);

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v14);
  }

  if (v10) {
    float v20 = (objc_class *)&OBJC_CLASS___SAOnDeviceNotificationsSearchCompleted;
  }
  else {
    float v20 = (objc_class *)&OBJC_CLASS___SANotificationsSearchCompleted;
  }
  id v21 = objc_alloc_init(v20);
  [v21 setNotifications:v11];
  if (v8) {
    v8[2](v8, v21, 0LL);
  }
}

- (void)_saNotificationSearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 supportsSpokenNotifications]);
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    unsigned int v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v28 = "-[ADCommandCenter _saNotificationSearch:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Announcement notification search", buf, 0xCu);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler]( &OBJC_CLASS___ADExternalNotificationRequestHandler,  "sharedNotificationRequestHandler"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 afterNotificationId]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1001E1EC0;
    v24[3] = &unk_1004FC770;
    void v24[4] = self;
    id v25 = v6;
    id v26 = v7;
    id v13 = v7;
    id v14 = v6;
    [v11 fetchUnreadNotificationsFromThreadAfterNotificationWithID:v12 completion:v24];

    uint64_t v15 = v25;
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADNotificationManager sharedManager](&OBJC_CLASS___ADNotificationManager, "sharedManager"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 afterNotificationId]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1001E1ED4;
    void v20[3] = &unk_1004FC770;
    id v21 = v6;
    __int128 v22 = self;
    id v23 = v7;
    id v18 = v7;
    id v19 = v6;
    [v16 fetchBulletinsAfterBulletinWithID:v17 completion:v20];

    uint64_t v15 = v21;
  }
}

- (void)_saPerformRemoteAnnouncement:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[ADAnnounceDeviceSelector sharedDeviceSelector]( &OBJC_CLASS___ADAnnounceDeviceSelector,  "sharedDeviceSelector"));
  [v7 handleRemoteAnnounceRequest:v6 completion:v5];
}

- (void)_saDismissRemoteAnnouncement:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[ADAnnounceDeviceSelector sharedDeviceSelector]( &OBJC_CLASS___ADAnnounceDeviceSelector,  "sharedDeviceSelector"));
  [v7 handleRemoteDismissRequest:v6 completion:v5];
}

- (void)_saPostCalendarActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
  id v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AFRequestInfo));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"ASSISTANT_SERVICES_HOMEPOD_CALENDAR_ACTIVITY_NOTIFICATION_BODY" table:0 bundle:v13 languageCode:0]);

  -[ADCommandCenter _postPersonalDomainActivityNotificationWithBody:command:executionContext:completion:]( self,  "_postPersonalDomainActivityNotificationWithBody:command:executionContext:completion:",  v14,  v10,  v9,  v8);
}

- (void)_saPostPersonalDomainActivityNotification:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 notificationBody]);
  -[ADCommandCenter _postPersonalDomainActivityNotificationWithBody:command:executionContext:completion:]( self,  "_postPersonalDomainActivityNotificationWithBody:command:executionContext:completion:",  v11,  v10,  v9,  v8);
}

- (void)_postPersonalDomainActivityNotificationWithBody:(id)a3 command:(id)a4 executionContext:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id, void))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 info]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentHomeInfo]);

  if (v14 && ![v14 activityNotificationsEnabledForPersonalRequests]
    || (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager")),
        unsigned int v16 = [v15 areActivityNotificationsOffForAllHomes],
        v15,
        v16))
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___SACommandIgnored);
    v12[2](v12, v17, 0LL);
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 homeId]);
    id v19 = v9;
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v10 originatingDeviceName]);
    id v43 = v9;
    if (![v19 length])
    {
      float v20 = v19;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
      __int128 v22 = v18;
      id v23 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AFRequestInfo));
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v25 = objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"ASSISTANT_SERVICES_HOMEPOD_ACTIVITY_DEFAULT_BODY" table:0 bundle:v24 languageCode:0]);

      id v18 = v22;
      id v19 = (id)v25;
    }

    id v26 = -[ADUserNotificationServiceProvider initWithConnection:bundleIdentifier:notificationCategories:]( objc_alloc(&OBJC_CLASS___ADUserNotificationServiceProvider),  "initWithConnection:bundleIdentifier:notificationCategories:",  0LL,  @"com.apple.Home",  0LL);
    double v27 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
    __int16 v42 = v19;
    -[UNMutableNotificationContent setBody:](v27, "setBody:", v19);
    -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v27, "setShouldSuppressDefaultAction:", 1LL);
    if ([v18 length])
    {
      id v28 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        id v53 = "-[ADCommandCenter _postPersonalDomainActivityNotificationWithBody:command:executionContext:completion:]";
        __int16 v54 = 2112;
        __int16 v55 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s Adding home id: %@ to notification content's user info.",  buf,  0x16u);
      }

      uint64_t v50 = AFPersonalDomainsNotificationUserInfoHomeKey;
      float v51 = v18;
      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
      -[UNMutableNotificationContent setUserInfo:](v27, "setUserInfo:", v29);
    }

    -[UNMutableNotificationContent setCategoryIdentifier:]( v27,  "setCategoryIdentifier:",  @"PersonalRequestsActivityCategory");
    int v30 = objc_alloc(&OBJC_CLASS___NSString);
    __int16 v40 = v18;
    int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
    __int16 v33 = -[NSString initWithFormat:]( v30,  "initWithFormat:",  @"%@:%@",  @"com.apple.siri.PersonalRequestsActivity",  v32);

    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v11 info]);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1001E1BF8;
    v44[3] = &unk_1004F54A8;
    id v45 = v41;
    __int16 v46 = v27;
    uint64_t v47 = v33;
    float v48 = v26;
    __int128 v49 = v12;
    id v36 = v26;
    id v37 = v33;
    uint64_t v38 = v27;
    id v39 = v41;
    [v34 getLocalizedAccessoryCategoryForExecutionInfo:v35 completion:v44];

    id v9 = v43;
  }
}

- (void)_saPostUpdatePersonalRequestSettingsNotification:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = @"ADHomeKitAccessoryCategoryTypeHomePod";
  v23[1] = @"ADHomeKitAccessoryCategoryTypeRemoraSpeaker";
  v24[0] = @"ASSISTANT_SERVICES_HOMEPOD_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  v24[1] = @"ASSISTANT_SERVICES_REMORA_SPEAKER_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  v23[2] = @"ADHomeKitAccessoryCategoryTypeRemoraAccessory";
  v23[3] = @"ADHomeKitAccessoryCategoryTypeRemoraOtherDevice";
  v24[2] = @"ASSISTANT_SERVICES_REMORA_ACCESSORY_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  v24[3] = @"ASSISTANT_SERVICES_REMORA_DEVICE_PROMPT_ENABLE_PERSONAL_DOMAINS_NOTIFICATION_BODY";
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  4LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001E1AF8;
  v18[3] = &unk_1004F54A8;
  v18[4] = self;
  id v19 = v8;
  id v20 = v11;
  id v21 = v9;
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  id v17 = v8;
  [v12 getAccessoryCategoryForExecutionInfo:v13 completion:v18];
}

- (void)_postUpdatePersonalRequestSettingsNotification:(id)a3 forLocalizationKey:(id)a4 executionContext:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[ADUserNotificationServiceProvider initWithConnection:bundleIdentifier:notificationCategories:]( objc_alloc(&OBJC_CLASS___ADUserNotificationServiceProvider),  "initWithConnection:bundleIdentifier:notificationCategories:",  0LL,  @"com.apple.Home",  0LL);
  id v12 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  id v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AFRequestInfo));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:v9 table:0 bundle:v14 languageCode:0]);

  -[UNMutableNotificationContent setBody:](v12, "setBody:", v16);
  -[UNMutableNotificationContent setHasDefaultAction:](v12, "setHasDefaultAction:", 1LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 homeId]);

  id v18 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@?showEnablementSheet=%@",  @"com.apple.HOME-PRIVATE://personalRequestOptIn",  @"YES");
  if ([v17 length])
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingFormat:](v18, "stringByAppendingFormat:", @"&homeId=%@", v17));

    id v18 = (NSString *)v19;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));

  -[UNMutableNotificationContent setDefaultActionURL:](v12, "setDefaultActionURL:", v20);
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  @"com.apple.siri.PersonalRequestsActivity",  v12,  0LL));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001E1A40;
  v23[3] = &unk_1004FCC00;
  id v24 = v8;
  id v22 = v8;
  -[ADUserNotificationServiceProvider postNotificationRequest:completion:]( v11,  "postNotificationRequest:completion:",  v21,  v23);
}

- (void)_saUnhandledObject:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, SACommandFailed *, void))a4;
  -[ADCommandCenter _invokeCompletionForCommand:](self, "_invokeCompletionForCommand:", a3);
  if (v7)
  {
    id v6 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Unhandled Object");
    v7[2](v7, v6, 0LL);
  }
}

- (void)_sasExtractSpeechData:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 speechRequestId]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 audioOutputType]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 startTime]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 endTime]);
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136316418;
    double v32 = "-[ADCommandCenter _sasExtractSpeechData:executionContext:completion:]";
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    uint64_t v38 = v11;
    __int16 v39 = 2112;
    uint64_t v40 = v12;
    __int16 v41 = 2112;
    __int16 v42 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s extractSpeechData = %@ (speechRequestId = %@, audioOutputType = %@, startTime = %@, endTime = %@)",  buf,  0x3Eu);
  }

  uint64_t v25 = (void *)v12;
  if ([v11 isEqualToString:SASExtractSpeechDataAudioOutputTypeAudioFormatOpusValue])
  {
    uint64_t v15 = 3LL;
  }

  else if ([v11 isEqualToString:SASExtractSpeechDataAudioOutputTypeAudioFormatLinearPCMValue])
  {
    uint64_t v15 = 2LL;
  }

  else
  {
    uint64_t v15 = 3LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 startTime]);
  double v17 = (double)(uint64_t)[v16 longValue] / 1000.0;

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 endTime]);
  uint64_t v19 = [v18 longValue];
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 startTime]);
  double v21 = (double)(v19 - (_BYTE *)[v20 longValue]) / 1000.0;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001E18A8;
  v27[3] = &unk_1004F54D0;
  id v28 = v7;
  id v29 = v8;
  id v30 = v9;
  id v22 = v9;
  id v23 = v8;
  id v24 = v7;
  -[ADCommandCenter _trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:]( self,  "_trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:",  v10,  v15,  v27,  v17,  v21);
}

- (void)_storeExtractedSpeechLocally:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 speechData]);
  if (!v4
    || (id v5 = (void *)v4,
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 speechDataUrl]),
        v6,
        v5,
        !v6))
  {
    id v13 = (void *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    id v14 = v13;
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 speechData]);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 speechDataUrl]);
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v35 = "-[ADCommandCenter _storeExtractedSpeechLocally:]";
    __int16 v36 = 2112;
    __int16 v37 = v15;
    __int16 v38 = 2112;
    __int16 v39 = v16;
    _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s data = %@ or URL = %@ are missing",  buf,  0x20u);

    goto LABEL_25;
  }

  char v33 = 0;
  uint64_t v7 = CSSiriSpeechRecordingTrimmedAudioDirectoryPath();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v10 = [v9 fileExistsAtPath:v8 isDirectory:&v33];

  if (v10)
  {
    if (!v33)
    {
      id v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"File exists at path %@, but it is expected to be directory.",  v8);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  226LL,  v11));
      goto LABEL_11;
    }

- (void)_saSetMultilingualDictationConfig:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 multilingualTimeoutInMillis]);
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = _AFPreferencesMultilingualDictationTimeoutInMilliSeconds();
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 floatValue];
    double v14 = v13;
  }

  else
  {
    double v14 = 2000.0;
  }

  unsigned int v15 = [v5 multilingualDisabled];
  unsigned int v16 = [v6 isLanguageDetectorEnabledByServer];
  double v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136316162;
    double v21 = "-[ADCommandCenter _saSetMultilingualDictationConfig:completion:]";
    __int16 v22 = 2048;
    double v23 = v14;
    __int16 v24 = 2048;
    double v25 = v9;
    __int16 v26 = 1024;
    unsigned int v27 = v16;
    __int16 v28 = 1024;
    int v29 = v15 ^ 1;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Client timeout: %f server timeout: %f, client enabled %d, server enabled %d",  (uint8_t *)&v20,  0x2Cu);
  }

  if (v14 != v9)
  {
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
    _AFPreferencesSetMultilingualDictationTimeoutInMilliSeconds();
  }

  if (v15 == v16)
  {
    _AFPreferencesSetDictationLanguageDetectorEnabledByServer(v15 ^ 1);
    if (v15)
    {
      if ((objc_opt_respondsToSelector(self->_speechDelegate, "adSpeechLanguageDetectorFailedWithError:") & 1) != 0)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  2805LL,  @"Server has disabled smart language selection",  0LL));
        -[ADCommandCenterSpeechDelegate adSpeechLanguageDetectorFailedWithError:]( self->_speechDelegate,  "adSpeechLanguageDetectorFailedWithError:",  v19);
      }
    }
  }
}

- (void)_dictationSessionDidComplete
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v3 dictationSessionDidComplete];

  -[ADCommandCenter _setCurrentRequest:](self, "_setCurrentRequest:", 0LL);
  -[ADCommandCenter _requestDidEnd](self, "_requestDidEnd");
  -[ADCommandCenter _clearSpeechDelegateState](self, "_clearSpeechDelegateState");
}

- (void)_cancelLocalRecognitionIfRequired
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADCommandCenter _cancelLocalRecognitionIfRequired]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  self->_hasReceivedServerSpeechRecognitions = 1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v4 cancelLocalRecognitionIfActive];
}

- (void)_startLanguageDetectionWaitTimer
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v10 = "-[ADCommandCenter _startLanguageDetectionWaitTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  -[ADCommandCenter _stopLanguageDetectionWaitTimerIfNeeded](self, "_stopLanguageDetectionWaitTimerIfNeeded");
  uint64_t v4 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001E1794;
  v8[3] = &unk_1004FD940;
  void v8[4] = self;
  id v6 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v4,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v8,  1.0);
  languageDetectionWaitTimer = self->_languageDetectionWaitTimer;
  self->_languageDetectionWaitTimer = v6;

  -[AFWatchdogTimer start](self->_languageDetectionWaitTimer, "start");
}

- (void)_stopLanguageDetectionWaitTimerIfNeeded
{
  languageDetectionWaitTimer = self->_languageDetectionWaitTimer;
  if (languageDetectionWaitTimer)
  {
    uint64_t v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[ADCommandCenter _stopLanguageDetectionWaitTimerIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
      languageDetectionWaitTimer = self->_languageDetectionWaitTimer;
    }

    -[AFWatchdogTimer cancel](languageDetectionWaitTimer, "cancel");
    int v5 = self->_languageDetectionWaitTimer;
    self->_languageDetectionWaitTimer = 0LL;
  }

- (void)_saPerformDataDetection:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v19 = (void (**)(id, id, void))a4;
  id v28 = 0LL;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDataDetector dataDetectorWithTypes:error:]( &OBJC_CLASS___NSDataDetector,  "dataDetectorWithTypes:error:",  32LL,  &v28));
  id v18 = v28;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  int v20 = v5;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 detectionTargets]);
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v13 = objc_alloc_init(&OBJC_CLASS___SAPerformDataDetectionResult);
        [v13 setDetectionTarget:v12];
        double v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        id v15 = [v12 length];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1001E1684;
        v22[3] = &unk_1004F54F8;
        double v23 = v14;
        unsigned int v16 = v14;
        objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v12, 0, 0, v15, v22);
        [v13 setMatches:v16];
        -[NSMutableArray addObject:](v7, "addObject:", v13);
      }

      id v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v9);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___SAPerformDataDetectionResults);
  [v17 setResults:v7];
  if (v19) {
    v19[2](v19, v17, 0LL);
  }
}

- (void)assistantSessionManagerConnectionDidBecomeActive:(id)a3
{
}

- (void)assistantSessionManager:(id)a3 receivedCommand:(id)a4
{
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 refId]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _rootExecutionContextForRequestID:](self, "_rootExecutionContextForRequestID:", v6));

  -[ADCommandCenter _handleCommandAndClientReply:executionContext:commandCompletion:]( self,  "_handleCommandAndClientReply:executionContext:commandCompletion:",  v5,  v7,  0LL);
}

- (void)_handleCommandAndClientReply:(id)a3 executionContext:(id)a4 commandCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1001E0F14;
  id v18 = &unk_1004FDA30;
  id v22 = a5;
  uint64_t v19 = self;
  id v20 = v8;
  id v10 = v9;
  id v21 = v10;
  id v11 = v8;
  id v12 = v22;
  id v13 = objc_retainBlock(&v15);
  double v14 = v13;
  if (v10) {
    objc_msgSend(v10, "performBlock:", v13, v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else {
    ((void (*)(void ***))v13[2])(v13);
  }
}

- (void)_logCrossDeviceCommandEndedMetricsForCommand:(id)a3 targetProductType:(id)a4 targetDeviceID:(id)a5 targetDeviceContextIdentifier:(id)a6 targetProximity:(int64_t)a7 coreAnalyticsEvent:(id)a8 response:(id)a9 error:(id)a10
{
  id v30 = a3;
  id v12 = a6;
  id v13 = a8;
  id v14 = a9;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___SAQuickStop);
  if ((objc_opt_isKindOfClass(v30, v15) & 1) != 0)
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___SACommandSucceeded);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
    {
      id v17 = objc_alloc(&OBJC_CLASS___NSString);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v30 encodedClassName]);
      uint64_t v19 = -[NSString initWithFormat:](v17, "initWithFormat:", @"%@.succeeded", v18);
LABEL_13:
      __int128 v26 = v19;
      goto LABEL_14;
    }

    if (a10 || (uint64_t v27 = objc_opt_class(&OBJC_CLASS___SACommandFailed), (objc_opt_isKindOfClass(v14, v27) & 1) != 0))
    {
      id v22 = objc_alloc(&OBJC_CLASS___NSString);
      goto LABEL_12;
    }

- (void)_handleClientReply:(id)a3 error:(id)a4 forSessionCommand:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v27 = 136315906;
    id v28 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ %@ %@", (uint8_t *)&v27, 0x2Au);
  }

  if (objc_msgSend(v10, "ad_hasCallbacks")
    && (objc_msgSend(v10, "ad_sendReplyEvenIfCallbacksExist") & 1) == 0)
  {
    uint64_t v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_30;
    }
    int v27 = 136315138;
    id v28 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    uint64_t v20 = "%s Suppressing reply since it was handled in callbacks";
    goto LABEL_21;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___SACommandFailed);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    id v13 = v8;
    id v14 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v14;
      id v25 = [v13 errorCode];
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v13 reason]);
      int v27 = 136315650;
      id v28 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
      __int16 v29 = 2048;
      id v30 = v25;
      __int16 v31 = 2112;
      id v32 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s CommandFailed errorCode = %ld, reason %@",  (uint8_t *)&v27,  0x20u);
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 refId]);

  if (!v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 aceId]);
    [v8 setRefId:v16];
  }

  if (!objc_msgSend(v10, "ad_requiresResponse"))
  {
    if (v8)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 encodedClassName]);
      unsigned __int8 v18 = [v17 isEqualToString:SACommandSucceededClassIdentifier];

      if ((v18 & 1) == 0)
      {
        double v23 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v27 = 136315138;
          id v28 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Command does not require a response, but we have a reply, so sending it along anyway.",  (uint8_t *)&v27,  0xCu);
        }

        goto LABEL_28;
      }
    }

    uint64_t v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_30;
    }
    int v27 = 136315138;
    id v28 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    uint64_t v20 = "%s Command has an unnecessary response. Suppressing";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v27, 0xCu);
    goto LABEL_30;
  }

  if (!v8 && v9)
  {
    -[ADCommandCenter _sendCommandFailedForCommand:error:](self, "_sendCommandFailedForCommand:error:", v10, v9);
    goto LABEL_30;
  }

  if (!v8)
  {
    -[ADCommandCenter _sendCommandFailedForCommand:reason:]( self,  "_sendCommandFailedForCommand:reason:",  v10,  @"bad response");
    goto LABEL_30;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 aceId]);

  if (v21)
  {
LABEL_28:
    -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v8);
    goto LABEL_30;
  }

  id v22 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v27 = 136315138;
    id v28 = "-[ADCommandCenter _handleClientReply:error:forSessionCommand:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Command requires a response but it has no aceId to set as ref. Suppressing.",  (uint8_t *)&v27,  0xCu);
  }

- (void)_sessionDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
  if (!-[ADResultObjectCache hasResultObjectsForRequestId:]( self->_resultObjectCache,  "hasResultObjectsForRequestId:",  v5)
    || -[ADResultObjectCache hasMissingRefContextsForId:](self->_resultObjectCache, "hasMissingRefContextsForId:", v5)
    || (objc_msgSend(v4, "ad_isInAssistantErrorDomain") & 1) != 0)
  {
    if (objc_msgSend(v4, "ad_isInAssistantErrorDomain"))
    {
      id v6 = [v4 code];
      if (!v5 && v6 == (id)33) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingError:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingError:",  4LL,  0LL,  v4));

      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing"));
      [v8 networkActivityStop:1 withReason:4 andError:v7];

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SNNetworkActivityTracing sharedInstance]( &OBJC_CLASS___SNNetworkActivityTracing,  "sharedInstance"));
      [v9 networkActivityStop:1 withReason:4 andError:v7 completion:0];

      id v4 = (id)v7;
    }

    self->_sessionExperiencedError = 1;
    unsigned int v10 = -[ADSpeechManager isLocallyRecognizingInDictationMode]( self->_speechManager,  "isLocallyRecognizingInDictationMode");
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v12)
      {
        int v17 = 136315394;
        unsigned __int8 v18 = "-[ADCommandCenter _sessionDidFailWithError:]";
        __int16 v19 = 2112;
        id v20 = v4;
        id v13 = "%s Ignoring session error (%@) because the speech manager is doing local speech recognition in dictation mode";
        id v14 = v11;
        uint32_t v15 = 22;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, v15);
        goto LABEL_19;
      }

      goto LABEL_19;
    }

    if (v12)
    {
      int v17 = 136315138;
      unsigned __int8 v18 = "-[ADCommandCenter _sessionDidFailWithError:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Propagating session error because the speech manager is not doing local speech recognition or is not in dictation mode",  (uint8_t *)&v17,  0xCu);
    }

    -[ADCommandCenter _endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:]( self,  "_endSpeechRequestForCommand:withError:suppressAlert:secureOfflineOnlyDictation:",  0LL,  v4,  0LL,  0LL);
    -[ADCommandCenter _acousticId_sessionFailed](self, "_acousticId_sessionFailed");
LABEL_15:
    -[ADCommandCenter _invokeAllCompletionsWithError:](self, "_invokeAllCompletionsWithError:", v4);
    goto LABEL_19;
  }

  uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    unsigned __int8 v18 = "-[ADCommandCenter _sessionDidFailWithError:]";
    id v13 = "%s Ignoring session error since we're in a callback context";
    id v14 = v16;
    uint32_t v15 = 12;
    goto LABEL_18;
  }

- (BOOL)_shouldRetryForError:(id)a3
{
  if (!self->_requestDelegate && !self->_speechDelegate) {
    return 0;
  }
  resultObjectCache = self->_resultObjectCache;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId", a3));
  if (-[ADResultObjectCache hasResultObjectsForRequestId:](resultObjectCache, "hasResultObjectsForRequestId:", v5)) {
    BOOL v6 = self->_speechManagerState != 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)assistantSessionManager:(id)a3 shouldLogVisibleRequestFailureForError:(id)a4
{
  return !-[ADCommandCenter _shouldRetryForError:](self, "_shouldRetryForError:", a4);
}

- (void)assistantSessionManager:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    int v17 = "-[ADCommandCenter assistantSessionManager:receivedError:isRetryableError:]";
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v16, 0x16u);
    if (!v5) {
      goto LABEL_7;
    }
  }

  else if (!v5)
  {
    goto LABEL_7;
  }

  if (-[ADCommandCenter _shouldRetryForError:](self, "_shouldRetryForError:", v9))
  {
    -[ADCommandCenterRequestDelegate adRequestEncounteredIntermediateError:]( self->_requestDelegate,  "adRequestEncounteredIntermediateError:",  v9);
    if (self->_currentRequest) {
      -[ADSessionManager startRetry](self->_sessionManager, "startRetry");
    }
    goto LABEL_14;
  }

- (BOOL)assistantSessionManagerShouldAttemptRetry:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenterCurrentRequest currentRequestCommand]( self->_currentRequest,  "currentRequestCommand",  a3));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SASStartSpeechDictation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {

    goto LABEL_6;
  }

  unsigned int v6 = -[ADSpeechManager isLocallyRecognizing](self->_speechManager, "isLocallyRecognizing");

  if (!v6)
  {
LABEL_6:
    LOBYTE(v8) = self->_startSpeechCommand != 0LL;
    return v8;
  }

  uint64_t v7 = (os_log_s *)AFSiriLogContextSession;
  BOOL v8 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v8)
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter assistantSessionManagerShouldAttemptRetry:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Telling session not to retry because local dictation is active",  (uint8_t *)&v10,  0xCu);
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)assistantSessionManagerSessionConnectionDidReset:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADCommandCenter assistantSessionManagerSessionConnectionDidReset:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
  [v5 setNeedsToSendLocation:1];

  self->_restrictionsWereSetForRequest = 0;
}

- (void)assistantSessionManagerSessionRemoteConnectionDidReset:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADCommandCenter assistantSessionManagerSessionRemoteConnectionDidReset:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
  [v5 setNeedsToSendLocation:1];

  self->_restrictionsWereSetForRequest = 0;
  -[ADCommandCenter _sync_reset](self, "_sync_reset");
}

- (id)assistantSessionManagerCommandsToRestoreStateOnNewConnection:(id)a3
{
  if (!self->_isInStarkMode) {
    return 0LL;
  }
  id v3 = objc_alloc_init(&OBJC_CLASS___SAUpdateRestrictions);
  uint64_t v8 = SADeviceRestrictionSTARKValue;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  [v3 setRestrictionsToAdd:v4];

  id v7 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v5;
}

- (void)assistantSessionManager:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    int v10 = "-[ADCommandCenter assistantSessionManager:didChangeRequestIdFrom:toId:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Session is changing our request identifier from %@ to %@. Should not be called.",  (uint8_t *)&v9,  0x20u);
  }
}

- (void)assistantSessionManagerDidCreateAssistant:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v3 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
}

- (void)assistantSessionManagerDidDestroyAssistant:(id)a3
{
  id v4 = -[ADCommandCenter _shutdownSessionWhenIdle](self, "_shutdownSessionWhenIdle");
  if (AFSupportsRemoraHost(v4, v5))
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    if ([v13 assistantIsEnabled])
    {
LABEL_5:

      return;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    if ([v6 dictationIsEnabled])
    {

      goto LABEL_5;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v8 = [v7 remoraHostEnabled];

    if (v8)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
      [v9 resetSessionsAndMakeQuiet:0];

      int v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint32_t v15 = "-[ADCommandCenter assistantSessionManagerDidDestroyAssistant:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Sync now because Remora Host is enabled.",  buf,  0xCu);
      }

      id v11 = sub_1002D6574(@"requested_by_assistantd");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      -[ADCommandCenter syncAnchorKeys:forceReset:reasons:]( self,  "syncAnchorKeys:forceReset:reasons:",  v12,  1LL,  &off_100513018);
    }
  }

- (void)assistantSessionManager:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4
{
}

- (void)assistantSessionManager:(id)a3 willRetryOnError:(id)a4
{
  selectedResultCandidate = self->_selectedResultCandidate;
  self->_selectedResultCandidate = 0LL;
  id v6 = a4;

  self->_hasReceivedAtLeastOneResultCandidate = 0;
  -[ADCommandCenterRequestDelegate adRequestEncounteredIntermediateError:]( self->_requestDelegate,  "adRequestEncounteredIntermediateError:",  v6);
}

- (void)assistantSessionManager:(id)a3 didObserverIntermediateError:(id)a4
{
}

- (BOOL)canLogWithSpeechManager:(id)a3
{
  id v3 = a3;
  if (AFIsInternalInstall(v3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dictationOptions]);
    if ([v4 forceOfflineRecognition])
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      BOOL v6 = [v5 siriDataSharingOptInStatus] == (id)1;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)speechManager:(id)a3 recognitionUpdateWillBeginForTask:(id)a4
{
  id v5 = a4;
  BOOL v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v12 = "-[ADCommandCenter speechManager:recognitionUpdateWillBeginForTask:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001E0ECC;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)speechManager:(id)a3 preheatWithRecordingInfo:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  speechRequestGroup = self->_speechRequestGroup;
  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1001E0E84;
  v16[3] = &unk_1004FD470;
  id v17 = v9;
  __int16 v18 = self;
  id v19 = v8;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, v16);
}

- (void)_sendStartSpeechCommandWithSpeechManager:(id)a3 info:(id)a4 context:(id)a5
{
  id v8 = a3;
  v151 = (NSString *)a4;
  id v9 = a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    v158 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
    __int16 v159 = 2112;
    v160 = v151;
    __int16 v161 = 2112;
    id v162 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s info = %@, context = %@", buf, 0x20u);
  }

  -[ADCommandCenter _sendContextAndRestrictionsForSpeechRequestWithInfo:]( self,  "_sendContextAndRestrictionsForSpeechRequestWithInfo:",  v151);
  id v11 = &OBJC_CLASS___NSPredicate_ptr;
  if (-[NSString isDictation](v151, "isDictation"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 dictationOptions]);
    if ([v12 transcriptionMode])
    {
      if ([v12 transcriptionMode] != (id)3)
      {
        int v16 = (SASStartSpeechRequest *)objc_alloc_init(&OBJC_CLASS___SASStartStructuredDictationSpeechRequest);
        -[SASStartSpeechRequest setTextToSpeechIsMuted:]( v16,  "setTextToSpeechIsMuted:",  -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
        id v53 = [v12 transcriptionMode];
        if (v53 == (id)1)
        {
          __int16 v63 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315138;
            v158 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_INFO,  "%s starting location dictation request",  buf,  0xCu);
          }

          __int16 v55 = &SAStartStructuredDictationRequestStructuredDictationTypePLACEValue;
        }

        else
        {
          if (v53 != (id)2)
          {
LABEL_41:

            goto LABEL_42;
          }

          __int16 v54 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315138;
            v158 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "%s starting person dictation request",  buf,  0xCu);
          }

          __int16 v55 = &SAStartStructuredDictationRequestStructuredDictationTypePERSONValue;
        }

        -[SASStartSpeechRequest setStructuredDictationType:](v16, "setStructuredDictationType:", *v55);
        goto LABEL_41;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 dictationLanguages]);
      if ([v13 count])
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 dictationLanguages]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
      }

      else
      {
        id v15 = 0LL;
      }

      id v56 = objc_alloc_init(&OBJC_CLASS___SASPronunciationContext);
      pronunciationContext = self->_pronunciationContext;
      self->_pronunciationContext = v56;

      -[SASPronunciationContext setTokenOffset:](self->_pronunciationContext, "setTokenOffset:", &off_1005134F8);
      -[SASPronunciationContext setDomainObjectPropertyIdentifier:]( self->_pronunciationContext,  "setDomainObjectPropertyIdentifier:",  @"PhonemeTranscription");
      id v58 = self->_pronunciationContext;
      __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v12 orthography]);
      -[SASPronunciationContext setOrthography:](v58, "setOrthography:", v59);

      -[SASPronunciationContext setLanguage:](self->_pronunciationContext, "setLanguage:", v15);
      int v16 = (SASStartSpeechRequest *)objc_alloc_init(&OBJC_CLASS___SASStartPronunciationRequest);
      id v60 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
      __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v60 currentRequestCommand]);
      -[SASStartSpeechRequest ad_setParentRequest:](v16, "ad_setParentRequest:", v61);

      id v62 = (void *)objc_claimAutoreleasedReturnValue(-[AFSpeechRequestOptions serverCommandId](self->_currentSpeechRequestOptions, "serverCommandId"));
      -[SASStartSpeechRequest setRefId:](v16, "setRefId:", v62);

      -[SASStartSpeechRequest setContext:](v16, "setContext:", self->_pronunciationContext);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 dictationLanguages]);
      int v16 = (SASStartSpeechRequest *)objc_claimAutoreleasedReturnValue( +[SASStartSpeechDictation ad_startSpeechDictationWithAFDictationOptions:]( &OBJC_CLASS___SASStartSpeechDictation,  "ad_startSpeechDictationWithAFDictationOptions:",  v12));
      -[SASStartSpeechRequest setLanguages:](v16, "setLanguages:", v15);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localeIdentifier]);
      -[SASStartSpeechRequest setRegion:](v16, "setRegion:", v21);

      -[SASStartSpeechRequest setCensorSpeech:](v16, "setCensorSpeech:", sub_1001EA6E0(v22));
      double v23 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeechRequest applicationName](v16, "applicationName"));

      if (!v23)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
        -[SASStartSpeechRequest setApplicationName:](v16, "setApplicationName:", v25);
      }

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeechRequest applicationName](v16, "applicationName"));
      unsigned int v27 = [v26 isEqualToString:@"OnDeviceDictationAudioData"];

      if (v27)
      {
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v12 samplingInfo]);
        __int16 v29 = (void *)v28;
        if (v28) {
          id v30 = (const __CFString *)v28;
        }
        else {
          id v30 = &stru_1004FECA0;
        }
        -[SASStartSpeechRequest setSelectedText:](v16, "setSelectedText:", v30);
      }

      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeechRequest applicationVersion](v16, "applicationVersion"));

      if (!v31)
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForInfoDictionaryKey:kCFBundleVersionKey]);
        -[SASStartSpeechRequest setApplicationVersion:](v16, "setApplicationVersion:", v33);
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeechRequest interactionId](v16, "interactionId"));

      if (!v34)
      {
        uint64_t v36 = SiriCoreUUIDStringCreate(v35);
        __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        -[SASStartSpeechRequest setInteractionId:](v16, "setInteractionId:", v37);
      }
    }

    goto LABEL_41;
  }

  [v8 setDictationOptions:0];
  if (self->_startingPronunciationRequest)
  {
    int v16 = (SASStartSpeechRequest *)objc_alloc_init(&OBJC_CLASS___SASStartPronunciationRequest);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentRequestCommand]);
    -[SASStartSpeechRequest ad_setParentRequest:](v16, "ad_setParentRequest:", v18);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[AFSpeechRequestOptions serverCommandId](self->_currentSpeechRequestOptions, "serverCommandId"));
    -[SASStartSpeechRequest setRefId:](v16, "setRefId:", v19);

    -[SASStartSpeechRequest setContext:](v16, "setContext:", self->_pronunciationContext);
LABEL_42:
    float v51 = 0LL;
    uint64_t v50 = 0LL;
    goto LABEL_43;
  }

  __int16 v38 = objc_alloc_init(&OBJC_CLASS___SASStartSpeechRequest);
  if (AFIsHorseman(v38, v39))
  {
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 createSetRequestOrigin]);
    -[SASStartSpeechRequest setSetRequestOrigin:](v38, "setSetRequestOrigin:", v41);
  }

  -[SASStartSpeechRequest setTextToSpeechIsMuted:]( v38,  "setTextToSpeechIsMuted:",  -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _fetchComputedModeAndUpdateRequestDelegate]( self,  "_fetchComputedModeAndUpdateRequestDelegate"));
  -[SASStartSpeechRequest setResponseMode:](v38, "setResponseMode:", v42);
  id v43 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  -[SASStartSpeechRequest setAutoPunctuationEnabled:]( v38,  "setAutoPunctuationEnabled:",  [v43 dictationAutoPunctuationEnabled]);

  __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _bargeInModes](self, "_bargeInModes"));
  if ([v44 count]) {
    -[SASStartSpeechRequest setBargeInModes:](v38, "setBargeInModes:", v44);
  }
  id v45 = (void *)objc_claimAutoreleasedReturnValue([v8 endpointerModelVersion]);
  -[SASStartSpeechRequest setClientModelVersion:](v38, "setClientModelVersion:", v45);

  id v46 = -[ADCommandCenter _approximatePreviousTTSInterval:](self, "_approximatePreviousTTSInterval:", v38);
  uint64_t v47 = v38;
  if (self->_siriHybridUODSupported)
  {
    float v48 = v42;
    id v49 = (id)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _createMuxStartAsrOnServerRequestWithSpeechRequest:]( self,  "_createMuxStartAsrOnServerRequestWithSpeechRequest:",  v47));

    uint64_t v50 = 0LL;
    float v51 = v49;
    id v52 = v49;
    __int16 v42 = v48;
    int v16 = (SASStartSpeechRequest *)v52;
  }

  else
  {
    if (self->_siriFullUODSupported)
    {
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _startServerRequestWithSpeechRequest:recordingContext:recordingInfo:]( self,  "_startServerRequestWithSpeechRequest:recordingContext:recordingInfo:",  v47,  v9,  v151));
      float v51 = 0LL;
    }

    else
    {
      float v51 = 0LL;
      uint64_t v50 = 0LL;
    }

    int v16 = v47;
  }

  id v11 = &OBJC_CLASS___NSPredicate_ptr;
LABEL_43:
  if (!self->_currentSpeechRequestOptions)
  {
    id v64 = -[NSString isDictation](v151, "isDictation");
    if ((v64 & 1) == 0)
    {
      if (AFIsInternalInstall(v64))
      {
        id v65 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSymptomsReporter sharedInstance]( &OBJC_CLASS___SiriCoreSymptomsReporter,  "sharedInstance"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        id v67 = [v66 processIdentifier];
        [v65 reportIssueForType:@"start_speech_request_without_speech_request_options" subType:0 context:0 processIdentifier:v67 walkboutStatus:byte_1005780A0];
      }
    }
  }

  -[SASStartSpeechRequest ad_setAFSpeechRequestOptions:]( v16,  "ad_setAFSpeechRequestOptions:",  self->_currentSpeechRequestOptions);
  -[SASStartSpeechRequest ad_setCSSiriRecordingInfo:](v16, "ad_setCSSiriRecordingInfo:", v151);
  id v68 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionUUID]);
  -[SASStartSpeechRequest setAceId:](v16, "setAceId:", v68);

  if (AFIsInternalInstall(v69))
  {
    BOOL v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  byte_1005780A0));
    -[SASStartSpeechRequest setIsCarryDevice:](v16, "setIsCarryDevice:", v70);
  }

  uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _motionManager](self, "_motionManager"));
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v71 motionActivity]);
  -[SASStartSpeechRequest setMotionActivity:](v16, "setMotionActivity:", v72);

  v146 = v71;
  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue([v71 motionConfidence]);
  -[SASStartSpeechRequest setMotionConfidence:](v16, "setMotionConfidence:", v73);

  -[ADCommandCenterClient adInvalidateCurrentUserActivity](self->_currentClient, "adInvalidateCurrentUserActivity");
  v150 = v50;
  if (v50)
  {
    char v74 = v50;
    __int128 v75 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      v158 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
      __int16 v159 = 2112;
      v160 = v74;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_INFO,  "%s Sending %@ instead of StartSpeechRequest since session supports understanding on device",  buf,  0x16u);
    }
  }

  else
  {
    if (v51)
    {
      char v74 = v51;
      uint64_t v76 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_58;
      }
      __int128 v77 = v76;
      id v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSString origin](v74, "origin"));
      __int16 v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSString audioSource](v74, "audioSource"));
      *(_DWORD *)__int128 buf = 136315906;
      v158 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
      __int16 v159 = 2112;
      v160 = v74;
      __int16 v161 = 2112;
      id v162 = v78;
      __int16 v163 = 2112;
      v164 = v79;
      uint64_t v80 = "%s #AsrOnServer Sending %@ (origin = %@, source = %@)...instead of StartSpeechRequest since session supports"
            " understanding on device and ASR is on server.";
    }

    else
    {
      char v74 = v16;
      v81 = (void *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_58;
      }
      __int128 v77 = v81;
      id v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSString origin](v74, "origin"));
      __int16 v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSString audioSource](v74, "audioSource"));
      *(_DWORD *)__int128 buf = 136315906;
      v158 = "-[ADCommandCenter _sendStartSpeechCommandWithSpeechManager:info:context:]";
      __int16 v159 = 2112;
      v160 = v74;
      __int16 v161 = 2112;
      id v162 = v78;
      __int16 v163 = 2112;
      v164 = v79;
      uint64_t v80 = "%s Sending %@ (origin = %@, source = %@)...";
    }

    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, v80, buf, 0x2Au);

    uint64_t v50 = 0LL;
    id v11 = &OBJC_CLASS___NSPredicate_ptr;
  }

- (void)_trySendingShowRequestHandlingStatusForAsrOnDevice:(BOOL)a3 startSpeechRequestId:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id *)&SAUIShowRequestHandlingStatusAsrStatusON_DEVICEValue;
  if (!v4) {
    id v7 = (id *)&SAUIShowRequestHandlingStatusAsrStatusON_SERVERValue;
  }
  id v8 = *v7;
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v18 = "-[ADCommandCenter _trySendingShowRequestHandlingStatusForAsrOnDevice:startSpeechRequestId:]";
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s #AsrOnServer Sending SAUIShowRequestHandlingStatus with asrStatus = %@ for startSpeechRequestId = %@",  buf,  0x20u);
  }

  if (AFIsInternalInstall(v10))
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___SAUIShowRequestHandlingStatus);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    -[SAUIShowRequestHandlingStatus setAceId:](v11, "setAceId:", v13);

    -[SAUIShowRequestHandlingStatus setRefId:](v11, "setRefId:", v6);
    -[SAUIShowRequestHandlingStatus setAsrStatus:](v11, "setAsrStatus:", v8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001E09A8;
    v14[3] = &unk_1004F5170;
    id v15 = v8;
    id v16 = v6;
    -[ADCommandCenter handleCommand:completion:](self, "handleCommand:completion:", v11, v14);
  }
}

- (void)_sendEnableServerEndpointerCommandWithRefID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v6 = [v5 isAccessibleEndpointerEnabled];

  if (v6)
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADCommandCenter _sendEnableServerEndpointerCommandWithRefID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Don't enable server endpointer when accessible endpointer is enabled",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___SASEnableServerEndpointer);
    [v8 setRefId:v4];
    -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v8);
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADCommandCenter _sendEnableServerEndpointerCommandWithRefID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Sent enable server endpointer command.",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)_sendGizmoSharedDataIfNeeded
{
  if (AFSupportsPairedDevice(self, a2))
  {
    if ((AFIsNano() & 1) == 0) {
      -[ADCommandCenter sendGizmoData](self, "sendGizmoData");
    }
  }

- (void)_sendContextAndRestrictionsForSpeechRequestWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCommandCenter _sendContextAndRestrictionsForSpeechRequestWithInfo:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Recording info: %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDelayManager](self, "_requestDelayManager"));
  [v6 releaseStoredContextCommandsAndSendCommands:1];

  -[ADCommandCenter _sendRestrictionsInPreparationForRequest](self, "_sendRestrictionsInPreparationForRequest");
}

- (void)speechManager:(id)a3 willStartRecordingAtTimestamp:(double)a4 isFromFile:(BOOL)a5 inputAudioPowerWrapper:(id)a6 context:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    double v23 = "-[ADCommandCenter speechManager:willStartRecordingAtTimestamp:isFromFile:inputAudioPowerWrapper:context:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E0960;
  block[3] = &unk_1004F7D30;
  void block[4] = self;
  id v18 = v11;
  id v19 = v12;
  BOOL v21 = a5;
  double v20 = a4;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(queue, block);
}

- (void)speechManager:(id)a3 didStartRecordingWithInfo:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E0560;
  block[3] = &unk_1004FD470;
  void block[4] = self;
  id v12 = v9;
  id v34 = v12;
  id v13 = v10;
  id v35 = v13;
  id v14 = v8;
  id v36 = v14;
  dispatch_async(queue, block);
  id v15 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 route]);
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v38 = "-[ADCommandCenter speechManager:didStartRecordingWithInfo:context:]";
    __int16 v39 = 2112;
    uint64_t v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Recording started on route: %@", buf, 0x16u);
  }

  speechRequestGroup = self->_speechRequestGroup;
  id v19 = (dispatch_queue_s *)self->_queue;
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472LL;
  unsigned int v27 = sub_1001E0668;
  uint64_t v28 = &unk_1004FD470;
  __int16 v29 = self;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, v19, &v25);
  double v23 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing]( &OBJC_CLASS___SiriCoreNetworkActivityTracing,  "sharedNetworkActivityTracing",  v25,  v26,  v27,  v28,  v29));
  [v23 networkActivityStart:3 activate:1];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[SNNetworkActivityTracing sharedInstance](&OBJC_CLASS___SNNetworkActivityTracing, "sharedInstance"));
  [v24 networkActivityStart:3 activate:1 completion:0];
}

- (void)speechManager:(id)a3 didUpdateRecordingWithInfo:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  speechRequestGroup = self->_speechRequestGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E018C;
  block[3] = &unk_1004FD4C0;
  id v23 = v8;
  uint64_t v24 = self;
  id v13 = v9;
  id v25 = v13;
  id v14 = v8;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, block);
  id v15 = (dispatch_queue_s *)self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001E03B0;
  v18[3] = &unk_1004FD4C0;
  id v19 = v13;
  id v20 = self;
  id v21 = v10;
  id v16 = v10;
  id v17 = v13;
  dispatch_async(v15, v18);
}

- (void)speechManager:(id)a3 capturedPackets:(id)a4 atTimestamp:(double)a5 totalCount:(int64_t)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  if ([a7 wantsRecordedAudioBufferLogs])
  {
    id v14 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v15 = v14;
      *(_DWORD *)__int128 buf = 136315906;
      uint64_t v26 = "-[ADCommandCenter speechManager:capturedPackets:atTimestamp:totalCount:context:]";
      __int16 v27 = 2048;
      id v28 = [v13 count];
      __int16 v29 = 2048;
      double v30 = a5;
      __int16 v31 = 2048;
      int64_t v32 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s packets.count = %llu, timestamp = %f, count = %lld",  buf,  0x2Au);
    }
  }

  speechRequestGroup = self->_speechRequestGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DFF48;
  block[3] = &unk_1004FCF38;
  void block[4] = self;
  id v21 = v12;
  double v24 = a5;
  id v22 = v13;
  int64_t v23 = a6;
  id v18 = v13;
  id v19 = v12;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, block);
}

- (void)speechManager:(id)a3 capturedFingerprint:(id)a4 duration:(double)a5
{
  id v7 = a4;
  speechRequestGroup = self->_speechRequestGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DFF38;
  block[3] = &unk_1004FDA80;
  void block[4] = self;
  id v12 = v7;
  double v13 = a5;
  id v10 = v7;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, block);
}

- (void)speechManagerDidDetectMusic:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v9 = "-[ADCommandCenter speechManagerDidDetectMusic:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  speechRequestGroup = self->_speechRequestGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DFF30;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, block);
}

- (void)speechManagerDidDelayEndpointForMusic:(id)a3
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter speechManagerDidDelayEndpointForMusic:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

- (void)speechManager:(id)a3 didReceiveLastAudioBufferWithEndpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136316162;
    __int16 v29 = "-[ADCommandCenter speechManager:didReceiveLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:context:]";
    __int16 v30 = 2048;
    int64_t v31 = a4;
    __int16 v32 = 2048;
    int64_t v33 = a5;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s endpointMode = %zd, totalPacketCount = %zd, endpointerMetrics = %@, context = %@",  buf,  0x34u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DFCA0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  id v18 = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001DFD54;
  v21[3] = &unk_1004FCF38;
  int64_t v25 = a5;
  int64_t v26 = a4;
  id v22 = v12;
  id v23 = v13;
  double v24 = self;
  id v19 = v13;
  id v20 = v12;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, v18, v21);
}

- (void)speechManager:(id)a3 didFinishWithCapturingMode:(int64_t)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v28 = "-[ADCommandCenter speechManager:didFinishWithCapturingMode:context:]";
    __int16 v29 = 2048;
    int64_t v30 = a4;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s capturingMode = %zd, context = %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DFBD0;
  block[3] = &unk_1004FD968;
  void block[4] = self;
  id v12 = v9;
  id v26 = v12;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  id v14 = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001DFC18;
  v21[3] = &unk_1004FDA80;
  id v15 = v8;
  id v22 = v15;
  id v23 = self;
  int64_t v24 = a4;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, v14, v21);
  int v17 = AFIsNano(v16);
  if (a4 == 1 && v17)
  {
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    id v20 = (const char *)kAssistantDarwinNotificationSpeechCaptureFinished;
    if (v19)
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v28 = "-[ADCommandCenter speechManager:didFinishWithCapturingMode:context:]";
      __int16 v29 = 2080;
      int64_t v30 = kAssistantDarwinNotificationSpeechCaptureFinished;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Post XPC event to notifyd: %s", buf, 0x16u);
    }

    notify_post(v20);
  }
}

- (void)speechManager:(id)a3 didCancelWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v20 = "-[ADCommandCenter speechManager:didCancelWithContext:]";
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DFB10;
  block[3] = &unk_1004FD968;
  void block[4] = self;
  id v18 = v7;
  id v10 = v7;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  id v12 = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001DFB1C;
  v14[3] = &unk_1004FD968;
  id v15 = v6;
  uint64_t v16 = self;
  id v13 = v6;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, v12, v14);
}

- (void)speechManager:(id)a3 didFailWithError:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v29 = "-[ADCommandCenter speechManager:didFailWithError:context:]";
    __int16 v30 = 2112;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (!v10) {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 213LL));
  }
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DF920;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v14 = v10;
  id v26 = v14;
  id v27 = v11;
  id v15 = v11;
  dispatch_async(queue, block);
  speechRequestGroup = self->_speechRequestGroup;
  int v17 = (dispatch_queue_s *)self->_queue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001DF934;
  void v20[3] = &unk_1004FD510;
  id v21 = v9;
  id v22 = self;
  id v23 = v14;
  SEL v24 = a2;
  id v18 = v14;
  id v19 = v9;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, v17, v20);
}

- (void)speechManager:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5 context:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v22 = "-[ADCommandCenter speechManager:didFinishWritingAudioFile:error:context:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_1001DF8C4;
  v17[3] = &unk_1004FD470;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(queue, v17);
}

- (void)speechManager:(id)a3 didBeginLocalRecognitionWithContext:(id)a4 sessionUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DF854;
  block[3] = &unk_1004FD4C0;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)speechManager:(id)a3 didRecognizeTokens:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001DF5F4;
  v15[3] = &unk_1004FD470;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)speechManager:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4 sessionUUID:(id)a5
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001DF494;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)speechManager:(id)a3 didRecognizePackage:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001DEAD4;
  v15[3] = &unk_1004FD470;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)_handleLocalSpeechRecognitionForOfflineSupport:(id)a3 logText:(BOOL)a4
{
  id v6 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___SASSpeechRecognized);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 aceRecognition]);

  -[SASSpeechRecognized setRecognition:](v12, "setRecognition:", v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASStartSpeech aceId](self->_startSpeechCommand, "aceId"));
  uint64_t v9 = SiriCoreUUIDStringCreate(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[SASSpeechRecognized setAceId:](v12, "setAceId:", v10);

  -[SASSpeechRecognized setRefId:](v12, "setRefId:", v8);
  -[SASSpeechRecognized setSessionId:](v12, "setSessionId:", v8);
  if (a4)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASSpeechRecognized af_bestTextInterpretation](v12, "af_bestTextInterpretation"));
    -[ADCommandCenter _metrics_logSpeechRecognized:resultId:]( self,  "_metrics_logSpeechRecognized:resultId:",  v11,  @"0");
  }

  else
  {
    -[ADCommandCenter _metrics_logSpeechRecognized:resultId:]( self,  "_metrics_logSpeechRecognized:resultId:",  0LL,  @"0");
  }
}

- (void)speechManager:(id)a3 didProduceLocalLoggablePackage:(id)a4 sessionUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DE954;
  block[3] = &unk_1004FD4C0;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)speechManager:(id)a3 recognitionDidCompleteWithError:(id)a4 secureOfflineOnlyRecognition:(BOOL)a5 sessionUUID:(id)a6 statistics:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DE6A0;
  block[3] = &unk_1004F5690;
  BOOL v23 = a5;
  id v19 = v13;
  id v20 = v11;
  id v21 = self;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(queue, block);
}

- (void)speechManager:(id)a3 didDetectStartpointAtTime:(double)a4 context:(id)a5
{
  id v6 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001DE658;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)speechManager:(id)a3 didDetectEndpointAtTime:(double)a4 context:(id)a5
{
  id v7 = a3;
  speechRequestGroup = self->_speechRequestGroup;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DE584;
  block[3] = &unk_1004FDA80;
  id v12 = v7;
  id v13 = self;
  double v14 = a4;
  id v10 = v7;
  dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, block);
}

- (void)speechManager:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001DE384;
  v14[3] = &unk_1004FC250;
  void v14[4] = self;
  id v15 = v10;
  id v16 = v9;
  BOOL v17 = a6;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, v14);
}

- (void)speechManager:(id)a3 languageDetectorDidFail:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001DE334;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)speechManager:(id)a3 performTwoShotPromptWithType:(int64_t)a4 context:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001DDFBC;
  v14[3] = &unk_1004FBA38;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  int64_t v17 = a4;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (id)_directInvocationContextForSpeechRequestOptions:(id)a3 textToSpeechEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___SKIDirectInvocationContext);
  [v7 setVoiceTriggerEnabled:sub_1001EBF24(self->_instanceContext)];
  [v7 setTextToSpeechEnabled:v4];
  objc_msgSend(v7, "setEyesFree:", objc_msgSend(v6, "isEyesFree"));
  id v8 = [v6 activationEvent];

  id v9 = sub_100344298((uint64_t)v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 setInputOrigin:v10];

  [v7 setInteractionType:SAIntentGroupAceInteractionTypeDialogDrivenValue];
  return v7;
}

- (void)_handleQuickStopCommandRoutedFromRemote:(id)a3 completion:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001DDA18;
  v13[3] = &unk_1004F5708;
  id v14 = a3;
  id v15 = a4;
  id v6 = v15;
  id v7 = v14;
  id v8 = objc_retainBlock(v13);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001DDAD0;
  v11[3] = &unk_1004F5730;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 getLocalContextWithPrivacyClass:10 completion:v11];
}

- (void)_saQuickStop:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s %@ %@", buf, 0x20u);
  }

  if ((AFSupportsHALDeviceRouting() & 1) != 0)
  {
    if ([v9 isFromRemote])
    {
      -[ADCommandCenter _handleQuickStopCommandRoutedFromRemote:completion:]( self,  "_handleQuickStopCommandRoutedFromRemote:completion:",  v8,  v10);
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo speechRequestOptions](self->_currentRequestInfo, "speechRequestOptions"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _directInvocationContextForSpeechRequestOptions:textToSpeechEnabled:]( self,  "_directInvocationContextForSpeechRequestOptions:textToSpeechEnabled:",  v14,  -[ADCommandCenterClient adTextToSpeechIsMuted]( self->_currentClient,  "adTextToSpeechIsMuted") ^ 1));

      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SKIMediaControlsInvocation quickStopDirectInvocationPayload]( &OBJC_CLASS___SKIMediaControlsInvocation,  "quickStopDirectInvocationPayload"));
      if (!v16)
      {
        int64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315138;
          __int16 v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Nil payload returned by SKIMediaControlsInvocation",  buf,  0xCu);
        }
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:]( &OBJC_CLASS___SKIDirectInvocation,  "runSiriKitExecutorCommandWithContext:payload:",  v15,  v16));
      if (!v18)
      {
        id v19 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315650;
          __int16 v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
          __int16 v30 = 2112;
          id v31 = v15;
          __int16 v32 = 2112;
          id v33 = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Nil RunSKE command returned by SKIDirectInvocation for context: %@, payload: %@",  buf,  0x20u);
        }
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId"));
      id v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
        __int16 v30 = 2112;
        id v31 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s Current request ID: %@", buf, 0x16u);
      }

      [v18 setRefId:v20];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1001DD7BC;
      v25[3] = &unk_1004F8D20;
      id v26 = v8;
      id v27 = v10;
      -[ADCommandCenter _handleCommand:executionContext:completion:]( self,  "_handleCommand:executionContext:completion:",  v18,  v9,  v25);
    }
  }

  else
  {
    id v12 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v22 = v12;
      BOOL v23 = (void *)objc_opt_class(v8);
      *(_DWORD *)__int128 buf = 136315394;
      __int16 v29 = "-[ADCommandCenter _saQuickStop:executionContext:completion:]";
      __int16 v30 = 2112;
      id v31 = v23;
      id v24 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s %@ is not supported on this platform",  buf,  0x16u);
    }

    id v13 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Not supported on this platform");
    (*((void (**)(id, SACommandFailed *, void))v10 + 2))(v10, v13, 0LL);
  }
}

- (void)_handleExtractSpeechDataCompleted:(id)a3 inResponseTo:(id)a4 completion:(id)a5
{
  id v6 = a3;
  -[ADCommandCenter _storeExtractedSpeechLocally:](self, "_storeExtractedSpeechLocally:", v6);
  -[ADCommandCenter _invokeCompletionForCommand:](self, "_invokeCompletionForCommand:", v6);
}

- (void)speechManager:(id)a3 didRequestQuickStopWithContext:(id)a4
{
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADCommandCenter speechManager:didRequestQuickStopWithContext:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s This code path should not be used. Please file a radar.",  (uint8_t *)&v5,  0xCu);
  }

- (void)speechManager:(id)a3 didChangeRecordingState:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001DD6F4;
  v5[3] = &unk_1004FC4D0;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)speechManager:(id)a3 audioSessionWillBecomeActive:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001DD62C;
  v5[3] = &unk_1004FC4D0;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)speechManager:(id)a3 audioSessionDidBecomeActive:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001DD540;
  v5[3] = &unk_1004FC4D0;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)speechManager:(id)a3 didReceiveConfidenceScores:(id)a4 classification:(unint64_t)a5 classifiedUser:(id)a6 unknownUserScore:(int64_t)a7 duration:(int64_t)a8 version:(int64_t)a9 thresholdingType:(id)a10 assetVersion:(id)a11
{
  id v16 = a4;
  id v17 = a6;
  id v18 = a10;
  id v19 = a11;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DD500;
  block[3] = &unk_1004F5758;
  void block[4] = self;
  id v26 = v16;
  int64_t v31 = a7;
  int64_t v32 = a8;
  int64_t v33 = a9;
  id v27 = v17;
  id v28 = v18;
  id v29 = v19;
  unint64_t v30 = a5;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  dispatch_async(queue, block);
}

- (id)_sharedMultiUserService
{
  return +[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService");
}

- (id)_handleConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v64 = a9;
  id v63 = a10;
  id v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:durati"
                         "on:version:thresholdingType:assetVersion:]";
    *(_WORD *)&buf[12] = 2113;
    id v19 = v16;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s confidenceScores = %{private}@", buf, 0x16u);
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
  }

  else
  {
    id v19 = v16;
  }

  BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  int64_t v21 = a8;
  int64_t v22 = a6;
  id v23 = v17;
  id v24 = self;
  int64_t v25 = a7;
  int64_t v26 = v21;
  if (v20)
  {
    *(_DWORD *)__int128 buf = 136316931;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:durati"
                         "on:version:thresholdingType:assetVersion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2113;
    v88 = (uint64_t (*)(uint64_t, uint64_t))v17;
    *(_WORD *)v89 = 2048;
    *(void *)&v89[2] = v22;
    *(_WORD *)&v89[10] = 2048;
    *(void *)&v89[12] = v25;
    __int16 v90 = 2048;
    int64_t v91 = v21;
    __int16 v92 = 2112;
    id v93 = v64;
    __int16 v94 = 2112;
    id v95 = v63;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s classification = %ld, classifiedUser = %{private}@, unknownScore = %ld, duration = %ld, version = %ld, threshol dingType = %@, assetVersion = %@",  buf,  0x52u);
  }

  v24->_hasSentAtLeastOneUserConfidenceScore = 1;
  id v27 = objc_alloc_init(&OBJC_CLASS___SAConfidenceScores);
  id v28 = v19;
  uint64_t v29 = SiriCoreUUIDStringCreate(v27);
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  [v27 setAceId:v30];

  int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](v24, "_currentRequest"));
  int64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 currentRequestId]);
  [v27 setRefId:v32];

  [v27 setProcessedAudioDurationMilliseconds:v25];
  if ([v64 isEqualToString:kCSSpeakerIdentificationVTInvocationScoreThresholdingType])
  {
    int64_t v33 = (id *)&SAVoiceIDConfidenceScoresThresholdTypeVOICE_TRIGGERValue;
LABEL_10:
    id v34 = *v33;
    goto LABEL_12;
  }

  if ([v64 isEqualToString:kCSSpeakerIdentificationNonVTInvocationScoreThresholdingType])
  {
    int64_t v33 = (id *)&SAVoiceIDConfidenceScoresThresholdTypeTAP_INVOCATIONValue;
    goto LABEL_10;
  }

  id v34 = 0LL;
LABEL_12:
  id v62 = v34;
  [v27 setThresholdType:v34];
  [v27 setAssetVersion:v63];
  switch(a4)
  {
    case 0uLL:
      id v35 = [v27 setUserIdentityClassification:SAUserIdentityClassificationUnknownValue];
      break;
    case 1uLL:
      id v35 = [v27 setUserIdentityClassification:SAUserIdentityClassificationUnsure1Value];
      break;
    case 2uLL:
      id v35 = [v27 setUserIdentityClassification:SAUserIdentityClassificationUnsureNValue];
      break;
    case 3uLL:
      id v35 = [v27 setUserIdentityClassification:SAUserIdentityClassificationKnownValue];
      break;
    case 4uLL:
      id v35 = [v27 setUserIdentityClassification:SAUserIdentityClassificationConfidentValue];
      break;
    default:
      __int16 v36 = (os_log_s *)AFSiriLogContextDaemon;
      id v35 = (id)os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v35)
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:du"
                             "ration:version:thresholdingType:assetVersion:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s Invalid classification: %ld",  buf,  0x16u);
      }

      break;
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v88 = sub_1001D5E48;
  *(void *)v89 = sub_1001D5E58;
  *(void *)&v89[8] = 0LL;
  uint64_t v75 = 0LL;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x3032000000LL;
  id v78 = sub_1001D5E48;
  __int16 v79 = sub_1001D5E58;
  id v80 = 0LL;
  uint64_t v37 = AFIsInternalInstall(v35);
  if ((_DWORD)v37 && AFSupportsMultiUser(v37, v38))
  {
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserTestSupport sharedService](&OBJC_CLASS___ADMultiUserTestSupport, "sharedService"));
    uint64_t v40 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v39 getDebugVoiceIdScores]);

    __int16 v41 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v81 = 136315394;
      v82 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:th"
            "resholdingType:assetVersion:]";
      __int16 v83 = 2112;
      __int16 v84 = v40;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s Setting debug scores: %@", v81, 0x16u);
    }
  }

  else
  {
    uint64_t v40 = 0LL;
  }

  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  [v42 setRawScores:v28];

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_1001DD0E8;
  v65[3] = &unk_1004F5780;
  uint64_t v71 = &v75;
  v65[4] = v24;
  id v43 = v40;
  v66 = v43;
  id v44 = v28;
  id v67 = v44;
  id v68 = 0LL;
  id v45 = v23;
  uint64_t v69 = v45;
  uint64_t v72 = buf;
  int64_t v73 = v22;
  id v46 = v27;
  id v70 = v46;
  int64_t v74 = v26;
  uint64_t v47 = objc_retainBlock(v65);
  float v48 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    cachedConfidenceScoresFromRemote = v24->_cachedConfidenceScoresFromRemote;
    *(_DWORD *)v81 = 136315394;
    v82 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:thre"
          "sholdingType:assetVersion:]";
    __int16 v83 = 2112;
    __int16 v84 = cachedConfidenceScoresFromRemote;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s Using cached scores: %@", v81, 0x16u);
  }

  ((void (*)(void *, NSDictionary *))v47[2])(v47, v24->_cachedConfidenceScoresFromRemote);
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([(id)v76[5] objectForKey:v45]);
  if (v50)
  {

    goto LABEL_29;
  }

  id v52 = *(NSDictionary **)(*(void *)&buf[8] + 40LL);
  if (!v52)
  {
LABEL_29:
    float v51 = (os_log_s *)AFSiriLogContextDaemon;
    id v52 = v45;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v81 = 136315394;
      v82 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:th"
            "resholdingType:assetVersion:]";
      __int16 v83 = 2112;
      __int16 v84 = v45;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s Using classifiedUser: %@", v81, 0x16u);
      id v52 = v45;
    }

    goto LABEL_34;
  }

  id v53 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v81 = 136315651;
    v82 = "-[ADCommandCenter _handleConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:thre"
          "sholdingType:assetVersion:]";
    __int16 v83 = 2113;
    __int16 v84 = v45;
    __int16 v85 = 2113;
    id v86 = v52;
    _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s There is not a score for the classifiedUser %{private}@. Using highestScoreUser %{private}@",  v81,  0x20u);
    id v52 = *(NSDictionary **)(*(void *)&buf[8] + 40LL);
  }

- (void)speechManager:(id)a3 willStopRecordingWithSignpostID:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001DD0DC;
  v5[3] = &unk_1004FD0A0;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)UIService:(id)a3 executeHandler:(id)a4 forCommand:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a4;
  id v10 = a5;
  if (v9)
  {
    if (-[AFSpeechRequestOptions activationEvent](self->_currentSpeechRequestOptions, "activationEvent") != (id)17)
    {
LABEL_30:
      v9[2](v9);
      goto LABEL_31;
    }

    uint64_t v11 = objc_opt_class(&OBJC_CLASS___SAUICloseAssistant);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      id v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int64_t v31 = 136315138;
        *(void *)&void v31[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Unrelated reply to announced notification",  v31,  0xCu);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      id v14 = v13;
      uint64_t v15 = 6013LL;
      goto LABEL_20;
    }

    uint64_t v17 = objc_opt_class(&OBJC_CLASS___SAUIAddViews);
    if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 views]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

      uint64_t v19 = objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView);
      if ((objc_opt_isKindOfClass(v14, v19) & 1) != 0)
      {
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v14 dialogIdentifier]);
        if ([v20 isEqualToString:@"unsupportedFeatureIdiomDucs#unsupportedDuringRingingCall"])
        {
          int64_t v21 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int64_t v31 = 136315138;
            *(void *)&void v31[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Unrelated reply to announce call",  v31,  0xCu);
          }

          int64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
          [v22 logEventWithType:6013 context:0];

          v9[2](v9);
          goto LABEL_31;
        }
      }

      uint64_t v29 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int64_t v31 = 136315138;
        *(void *)&void v31[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s Related reply to triggerless request",  v31,  0xCu);
      }

      unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      [v30 logEventWithType:6011 context:0];

      goto LABEL_29;
    }

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___SAUIAddDialogs);
    if ((objc_opt_isKindOfClass(v10, v23) & 1) != 0)
    {
      id v24 = (os_log_s *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
LABEL_19:
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics", *(_OWORD *)v31));
        id v14 = v13;
        uint64_t v15 = 6011LL;
LABEL_20:
        [v13 logEventWithType:v15 context:0];
LABEL_29:

        goto LABEL_30;
      }

      *(_DWORD *)int64_t v31 = 136315138;
      *(void *)&void v31[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
      int64_t v25 = "%s Related reply to triggerless request";
    }

    else
    {
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___SAUIPlayNotificationSound);
      if ((objc_opt_isKindOfClass(v10, v26) & 1) == 0) {
        goto LABEL_30;
      }
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v10 notificationType]);
      unsigned int v28 = [v27 isEqualToString:SANotificationTypeConnectedCallValue];

      if (!v28) {
        goto LABEL_30;
      }
      id v24 = (os_log_s *)AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      *(_DWORD *)int64_t v31 = 136315138;
      *(void *)&void v31[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
      int64_t v25 = "%s Related reply to announce call request";
    }

    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v25, v31, 0xCu);
    goto LABEL_19;
  }

  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int64_t v31 = 136315138;
    *(void *)&void v31[4] = "-[ADCommandCenter UIService:executeHandler:forCommand:]";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s called with nil command handler; returning",
      v31,
      0xCu);
  }

- (void)UIService:(id)a3 didPresentUIResponseForCommand:(id)a4 withExecutionInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DCF54;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4
{
  if (AFSupportsRemoraHost(self, a2))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001DCE84;
    v6[3] = &unk_1004FB0E0;
    v6[4] = self;
    [v5 fetchHasActiveEndpointsWithCompletion:v6];
  }

- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4
{
  if (AFSupportsRemoraHost(self, a2))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001DCDB4;
    v6[3] = &unk_1004FB0E0;
    v6[4] = self;
    [v5 fetchHasActiveEndpointsWithCompletion:v6];
  }

- (void)_getDictationLanguages:(id)a3 options:(id)a4 speechOptions:(id)a5 delegate:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void *, void *))a7;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v23 = "-[ADCommandCenter _getDictationLanguages:options:speechOptions:delegate:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Language detector is unavailable/disabled. Falling back to non LID dictation flow",  buf,  0xCu);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 languageCodeOverride]);
  uint64_t v18 = AFOverrideLanguageCode(v11, v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (!v19)
  {
    BOOL v20 = 0LL;
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  int64_t v21 = v19;
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  if (v15) {
LABEL_5:
  }
    v15[2](v15, v19, v20);
LABEL_6:
}

- (void)_preheatViaRequestDispatcher
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  id v15 = (id)objc_claimAutoreleasedReturnValue([v3 languageCode]);

  if (self->_siriHybridUODSupported || self->_siriFullUODSupported)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 getDeviceOwnerSharedUserId]);
    id v9 = (void *)v8;
    id v10 = (void *)AFMultiUserDefaultSharedUserId;
    if (v8) {
      id v10 = (void *)v8;
    }
    id v11 = v10;

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assistantIdentifier]);
    [v12 prewarmWithAssistantId:v14 languageCode:v15 prewarmOptions:2 sharedUserId:v11];
  }
}

- (void)_preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  kdebug_trace(722470068LL, 0LL, 0LL, 0LL, 0LL);
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    id v16 = "-[ADCommandCenter _preheatWithStyle:forOptions:completion:]";
    __int16 v17 = 2048;
    int64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %ld %@", (uint8_t *)&v15, 0x20u);
  }

  id v11 = +[CSSiriVibrationManager sharedManager](&OBJC_CLASS___CSSiriVibrationManager, "sharedManager");
  if (a3 != 5)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
    [v12 preheatAndMakeQuiet:a3 == 1];
  }

  if (AFSpeechEventIsBluetooth([v8 activationEvent]))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 activationDeviceIdentifier]);
    [v13 prewarmDeviceWithIdentifier:v14];
  }

  if (v9) {
    v9[2](v9);
  }
}

- (void)_forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    int64_t v18 = "-[ADCommandCenter _forceAudioSessionActiveWithContext:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }

  id v9 = v6;
  unint64_t v10 = (unint64_t)[v9 options];
  if (self->_hasIncomingCall || self->_isInCall)
  {
    LODWORD(v11) = 1;
    -[AFSpeechRequestOptions setIsOnPhoneCall:](self->_currentSpeechRequestOptions, "setIsOnPhoneCall:", 1LL);
  }

  else
  {
    uint64_t v11 = (v10 >> 1) & 1;
  }

  id v12 = v9;
  if (self->_currentSpeechRequestOptions)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 speechRequestOptions]);
    if (v13) {
      LODWORD(v11) = 0;
    }

    id v12 = v9;
    if ((_DWORD)v11 == 1)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      void v16[2] = sub_1001DCDA4;
      v16[3] = &unk_1004FBBF8;
      void v16[4] = self;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 mutatedCopyWithMutator:v16]);

      id v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        int64_t v18 = "-[ADCommandCenter _forceAudioSessionActiveWithContext:completion:]";
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s context = %@ (updated)", buf, 0x16u);
      }
    }
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v15 prepareAudioSystemWithContext:v12 completion:v7];
}

- (void)_forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    unint64_t v10 = "-[ADCommandCenter _forceAudioSessionInactiveWithOptions:completion:]";
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s options = %lu", (uint8_t *)&v9, 0x16u);
  }

  speechManager = self->_speechManager;
  if (speechManager)
  {
    -[ADSpeechManager endSession:completion:](speechManager, "endSession:completion:", a3 & 1, v6);
  }

  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  uint64_t v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    uint64_t v4 = "-[ADCommandCenter resumeInterruptedAudioPlaybackIfNeeded]";
    __int16 v5 = 2080;
    id v6 = "-[ADCommandCenter resumeInterruptedAudioPlaybackIfNeeded]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s %s is not yet supported on this platform",  (uint8_t *)&v3,  0x16u);
  }

- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4
{
}

- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v70 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
    __int16 v71 = 2112;
    id v72 = v8;
    __int16 v73 = 2112;
    id v74 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 languageCodeWithFallback:0]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 outputVoiceWithFallback:0]);
  BOOL v67 = [v11 isUsingDefaultLanguageSettings] ^ v5;
  if (v67)
  {
    [v11 setIsUsingDefaultLanguageSettings:v5];
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v70 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
      __int16 v71 = 1024;
      LODWORD(v72) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Using default language settings: %d",  buf,  0x12u);
    }
  }

  id v68 = v12;
  if ([v8 isEqualToString:@"ADLanguageCodeKeepSame"])
  {
    int v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v70 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
      id v16 = "%s Keeping language code the same";
      __int16 v17 = v15;
      uint32_t v18 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

  if ((AFPreferencesLanguageIsSupported(v8) & 1) == 0)
  {
    uint64_t v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v70 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]";
      __int16 v71 = 2112;
      id v72 = v8;
      id v16 = "%s language code %@ is not supported for this device";
      __int16 v17 = v23;
      uint32_t v18 = 22;
      goto LABEL_15;
    }

- (void)_setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v8 = @"Unlocked";
    if (v5) {
      id v8 = @"Locked";
    }
    id v9 = @"Not on lock screen";
    unint64_t v12 = "-[ADCommandCenter _setLockState:showingLockScreen:]";
    int v11 = 136315650;
    id v14 = v8;
    __int16 v13 = 2112;
    if (v4) {
      id v9 = @"On Lock Screen";
    }
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@, %@", (uint8_t *)&v11, 0x20u);
  }

  if (self->_deviceIsLocked != v5)
  {
    self->_BOOL deviceIsLocked = v5;
    self->_int deviceIsShowingLockScreen = v4;
    goto LABEL_11;
  }

  int deviceIsShowingLockScreen = self->_deviceIsShowingLockScreen;
  self->_BOOL deviceIsLocked = v5;
  self->_int deviceIsShowingLockScreen = v4;
  if (deviceIsShowingLockScreen != v4) {
LABEL_11:
  }
    self->_restrictionsWereSetForRequest = 0;
}

- (void)_setHeadphonesAuthenticated:(BOOL)a3
{
  if (self->_isHeadphonesAuthenticated != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v6 = @"Not Authenticated";
      if (v3) {
        id v6 = @"Authenticated";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setHeadphonesAuthenticated:]";
      __int16 v9 = 2112;
      unint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s #HeadphonesAuth authenticated: %@",  (uint8_t *)&v7,  0x16u);
    }

    self->_BOOL isHeadphonesAuthenticated = v3;
    self->_restrictionsWereSetForRequest = 0;
  }

- (void)_setWatchAuthenticated:(BOOL)a3
{
  if (self->_isWatchAuthenticated != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v6 = @"Not Authenticated";
      if (v3) {
        id v6 = @"Authenticated";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setWatchAuthenticated:]";
      __int16 v9 = 2112;
      unint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s #WatchAuth authenticated: %@",  (uint8_t *)&v7,  0x16u);
    }

    self->_BOOL isWatchAuthenticated = v3;
    self->_restrictionsWereSetForRequest = 0;
  }

- (void)_setStarkRestriction:(BOOL)a3
{
  if (self->_isInStarkMode != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v6 = @"#CarPlay Remove Stark Restriction";
      if (v3) {
        id v6 = @"#CarPlay Add Stark Restriction";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setStarkRestriction:]";
      __int16 v9 = 2112;
      unint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }

    self->_BOOL isInStarkMode = v3;
    self->_restrictionsWereSetForRequest = 0;
  }

- (void)_setSupportsCarPlayVehicleDataRestriction:(BOOL)a3
{
  if (self->_supportsCarPlayVehicleData != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v6 = @"#CarPlay Remove supportsVehicleData Restriction";
      if (v3) {
        id v6 = @"#CarPlay Add supportsCarPlayVehicleData Restriction";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setSupportsCarPlayVehicleDataRestriction:]";
      __int16 v9 = 2112;
      unint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }

    self->_supportsCarPlayVehicleData = v3;
    self->_restrictionsWereSetForRequest = 0;
  }

- (void)_setCarDNDRestriction:(BOOL)a3
{
  if (self->_isInCarDNDMode != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v6 = @"#rhodes Remove Car DND Restriction";
      if (v3) {
        id v6 = @"#rhodes Add Car DND Restriction";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setCarDNDRestriction:]";
      __int16 v9 = 2112;
      unint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }

    self->_BOOL isInCarDNDMode = v3;
    self->_restrictionsWereSetForRequest = 0;
  }

- (void)_setHeadGestureRecognitionAvailability:(BOOL)a3
{
  if (self->_isHeadGestureRecognitionAvailable != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v6 = @"#Bobble Unset bobble availability";
      if (v3) {
        id v6 = @"#Bobble Set bobble availability";
      }
      int v7 = 136315394;
      id v8 = "-[ADCommandCenter _setHeadGestureRecognitionAvailability:]";
      __int16 v9 = 2112;
      unint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }

    self->_BOOL isHeadGestureRecognitionAvailable = v3;
    self->_restrictionsWereSetForRequest = 0;
  }

- (void)_setModesConfiguration:(id)a3
{
  id v4 = a3;
  if (!self->_responseModeProvider)
  {
    BOOL v5 = objc_alloc_init(&OBJC_CLASS___ADResponseModeProvider);
    responseModeProvider = self->_responseModeProvider;
    self->_responseModeProvider = v5;

    int v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v8 = self->_responseModeProvider;
      *(_DWORD *)__int128 buf = 136315394;
      int64_t v21 = "-[ADCommandCenter _setModesConfiguration:]";
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s #modes Creating ResponseModeProvider %@",  buf,  0x16u);
    }
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localContextWithPrivacyClass:10]);

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1001DCD1C;
  __int16 v17 = &unk_1004F57A8;
  id v11 = v10;
  id v18 = v11;
  __int16 v19 = self;
  unint64_t v12 = (ADResponseModeProvider *)objc_claimAutoreleasedReturnValue([v4 mutatedCopyWithMutator:&v14]);

  __int16 v13 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    int64_t v21 = "-[ADCommandCenter _setModesConfiguration:]";
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s #modes Updating modesconfiguration %@",  buf,  0x16u);
  }

  -[ADResponseModeProvider updateModesConfiguration:]( self->_responseModeProvider,  "updateModesConfiguration:",  v12,  v14,  v15,  v16,  v17);
}

- (void)_setIsTimeoutSuspended:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001DCD0C;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_prepareForAppLaunchForRequest:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001DCC3C;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setConfiguration:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  int v7 = (ADCommandCenterClient *)a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  id v9 = (id)os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if ((_DWORD)v9)
  {
    int v13 = 136315650;
    id v14 = "-[ADCommandCenter _setConfiguration:forClient:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s configuration = %@, client = %@",  (uint8_t *)&v13,  0x20u);
  }

  if (self->_currentClient == v7)
  {
    unint64_t v10 = (AFClientConfiguration *)[v6 copy];
    clientConfiguration = self->_clientConfiguration;
    self->_clientConfiguration = v10;

    -[ADSpeechManager setClientConfiguration:]( self->_speechManager,  "setClientConfiguration:",  self->_clientConfiguration);
    -[ADCommandCenter _setStarkRestriction:]( self,  "_setStarkRestriction:",  -[AFClientConfiguration isDeviceInStarkMode](self->_clientConfiguration, "isDeviceInStarkMode"));
    -[ADCommandCenter _setCarDNDRestriction:]( self,  "_setCarDNDRestriction:",  -[AFClientConfiguration isDeviceInCarDNDMode](self->_clientConfiguration, "isDeviceInCarDNDMode"));
    -[ADCommandCenter _setSupportsCarPlayVehicleDataRestriction:]( self,  "_setSupportsCarPlayVehicleDataRestriction:",  -[AFClientConfiguration supportsCarPlayVehicleData](self->_clientConfiguration, "supportsCarPlayVehicleData"));
    id v9 = -[ADCommandCenter _setWatchAuthenticated:]( self,  "_setWatchAuthenticated:",  -[AFClientConfiguration isDeviceWatchAuthenticated](self->_clientConfiguration, "isDeviceWatchAuthenticated"));
    if (v6) {
      goto LABEL_9;
    }
  }

  else if (v6)
  {
    goto LABEL_9;
  }

  uint64_t v12 = AFIsInternalInstall(v9);
  if ((_DWORD)v12) {
    byte_1005780A0 = AFFetchDeviceCarryStatus(v12);
  }
LABEL_9:
}

- (void)_endSessionForDelegate:(id)a3
{
  id v4 = a3;
  if (self->_deferredRequestEndIdentifier
    && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenterCurrentRequest currentRequestId](self->_currentRequest, "currentRequestId")),
        unsigned int v6 = [v5 isEqualToString:self->_deferredRequestEndIdentifier],
        v5,
        v6))
  {
    int v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v18 = "-[ADCommandCenter _endSessionForDelegate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s delaying session end because there is an active request",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v8 = self->_deferredRequestEndIdentifier;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001DCBE0;
    v13[3] = &unk_1004F9AA8;
    objc_copyWeak(&v16, (id *)buf);
    id v14 = v4;
    __int16 v15 = v8;
    id v9 = v8;
    unint64_t v10 = objc_retainBlock(v13);
    id requestEndCompletion = self->_requestEndCompletion;
    self->_id requestEndCompletion = v10;

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v18 = "-[ADCommandCenter _endSessionForDelegate:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s ending session immediately", buf, 0xCu);
    }

    -[ADCommandCenter _reallyEndSessionForDelegate:](self, "_reallyEndSessionForDelegate:", v4);
  }
}

- (void)_reallyEndSessionForDelegate:(id)a3
{
  id v4 = (ADCommandCenterSpeechDelegate *)a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    speechDelegate = self->_speechDelegate;
    unint64_t requestDelegate = self->_requestDelegate;
    *(_DWORD *)__int128 buf = 136315906;
    id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
    __int16 v28 = 2048;
    id v29 = v4;
    __int16 v30 = 2048;
    id v31 = speechDelegate;
    __int16 v32 = 2048;
    int64_t v33 = requestDelegate;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s delegate %p, _speechDelegate %p, _requestDelegate %p",  buf,  0x2Au);
  }

  if ((objc_opt_respondsToSelector(v4, "setAdSpeechSessionEnded:") & 1) != 0) {
    -[ADCommandCenterSpeechDelegate setAdSpeechSessionEnded:](v4, "setAdSpeechSessionEnded:", 1LL);
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001DCA78;
  v23[3] = &unk_1004FD968;
  id v8 = v4;
  id v24 = v8;
  int v25 = self;
  id v9 = objc_retainBlock(v23);
  unint64_t v10 = self->_speechDelegate;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  BOOL v13 = v10 == v8;
  if (v10 == v8)
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Asking command center to replace speech delegate with nil...",  buf,  0xCu);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1001DCBD4;
    v21[3] = &unk_1004FC838;
    __int16 v22 = v9;
    -[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:",  0LL,  0LL,  1LL,  v21);
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      __int16 v28 = 2048;
      id v29 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Ignored replacing speech delegate with nil because speech delegate is %p.",  buf,  0x16u);
    }

    ((void (*)(void *))v9[2])(v9);
  }

  id v14 = self->_requestDelegate;
  __int16 v15 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v16 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v14 == v8)
  {
    if (v16)
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Asking command center to replace request delegate with nil...",  buf,  0xCu);
    }

    -[ADCommandCenter _replaceRequestDelegate:reason:](self, "_replaceRequestDelegate:reason:", 0LL, 6LL);
    currentClient = self->_currentClient;
    __int16 v15 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (currentClient == v8 || !currentClient)
    {
      if (v19)
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Asking command center to reset request context...",  buf,  0xCu);
      }

      -[ADCommandCenter _context_reset](self, "_context_reset");
    }

    else if (v19)
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
      __int16 v28 = 2048;
      id v29 = currentClient;
      __int16 v17 = "%s Ignored resetting request context because current client is %p.";
      BOOL v13 = 1;
      goto LABEL_21;
    }

    BOOL v13 = 1;
    goto LABEL_26;
  }

  if (v16)
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v27 = "-[ADCommandCenter _reallyEndSessionForDelegate:]";
    __int16 v28 = 2048;
    id v29 = v14;
    __int16 v17 = "%s Ignored replacing request delegate with nil and resetting request context because request delegate is %p.";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v17, buf, 0x16u);
  }

- (void)_prepareForPhoneCall
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[ADCommandCenter _prepareForPhoneCall]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADCommandCenter _setCallIsLikely:](self, "_setCallIsLikely:", 1LL);
}

- (void)_telephonyRequestCompleted
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    BOOL v12 = "-[ADCommandCenter _telephonyRequestCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentRequestId]);

  if (-[ADCommandCenter _callIsLikely](self, "_callIsLikely") && v5)
  {
    unsigned int v6 = objc_alloc_init(&OBJC_CLASS___SARequestCompleted);
    uint64_t v7 = SiriCoreUUIDStringCreate(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SARequestCompleted setAceId:](v6, "setAceId:", v8);

    -[SARequestCompleted setRefId:](v6, "setRefId:", v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _rootExecutionContextForRequestID:](self, "_rootExecutionContextForRequestID:", v5));
    unint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      BOOL v12 = "-[ADCommandCenter _telephonyRequestCompleted]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Looking up and sending the SARequestCompleted callback for %@",  (uint8_t *)&v11,  0x16u);
    }

    -[ADCommandCenter _handleCommand:executionContext:completion:]( self,  "_handleCommand:executionContext:completion:",  v6,  v9,  0LL);
  }
}

- (void)_startRequest:(id)a3 withDelegate:(id)a4
{
  BOOL v5 = (ADCommandCenter *)a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v61 = "-[ADCommandCenter _startRequest:withDelegate:]";
    __int16 v62 = 2112;
    id v63 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter speechRequestOptions](v5, "speechRequestOptions"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_1001DC8C8;
  v58[3] = &unk_1004FD8D0;
  unint64_t v10 = v5;
  __int16 v59 = v10;
  [v9 logEventWithType:122 contextProvider:v58];

  int v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[ADRemoteRequestHelper completion]( self->_remoteRequestHelper,  "completion"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ADRemoteRequestHelper remoteRequestInfo](self->_remoteRequestHelper, "remoteRequestInfo"));
  __int16 v13 = (void *)v12;
  if (v12) {
    id v14 = (void *)v12;
  }
  else {
    id v14 = v10;
  }
  id v15 = v14;
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _ad_requestCommandWithRequestHelper:]( v10,  "_ad_requestCommandWithRequestHelper:",  self->_remoteRequestHelper));
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _ad_speechRequestOptionsWithClientConfiguration:]( v10,  "_ad_speechRequestOptionsWithClientConfiguration:",  self->_clientConfiguration));
  char v45 = v11;
  if (v16)
  {
    __int16 v42 = v8;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_1001DC8D0;
    v51[3] = &unk_1004F73F0;
    void v51[4] = self;
    id v18 = v16;
    id v52 = v16;
    id v41 = v6;
    id v19 = v6;
    id v53 = v19;
    id v54 = v15;
    id v55 = v17;
    id v56 = v10;
    __int16 v57 = v11;
    id v20 = objc_retainBlock(v51);
    int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 text]);
    __int16 v22 = self;
    if (v21 && (currentClient = self->_currentClient) != 0LL)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      void v48[2] = sub_1001DC954;
      v48[3] = &unk_1004F57D0;
      v48[4] = self;
      unsigned int v50 = v20;
      id v49 = v19;
      -[ADCommandCenterClient adStartUIRequestWithText:completion:]( currentClient,  "adStartUIRequestWithText:completion:",  v21,  v48);
    }

    else
    {
      ((void (*)(void *))v20[2])(v20);
    }

    BOOL v16 = v18;

    id v6 = v41;
    id v8 = v42;
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _ad_localRequestCommandWithRequestHelper:]( v10,  "_ad_localRequestCommandWithRequestHelper:",  self->_remoteRequestHelper));
    if (v24)
    {
      -[ADCommandCenter _startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:]( self,  "_startLocalRequest:withRequestInfo:forDelegate:suppressCancelationAlertIfCapturingSpeech:completion:",  v24,  v15,  v6,  1LL,  v45);
      __int16 v22 = self;
    }

    else
    {
      int v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter handoffURLString](v10, "handoffURLString"));

      if (v25)
      {
        id v43 = v8;
        id v26 = v6;
        id v27 = objc_alloc(&OBJC_CLASS___NSURL);
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter handoffURLString](v10, "handoffURLString"));
        id v29 = -[NSURL initWithString:](v27, "initWithString:", v28);

        if (v29)
        {
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472LL;
          v46[2] = sub_1001DC9E4;
          v46[3] = &unk_1004FDA58;
          uint64_t v47 = v45;
          __int16 v22 = self;
          -[ADCommandCenter _openURL:completion:](self, "_openURL:completion:", v29, v46);

          id v6 = v26;
          BOOL v16 = 0LL;
        }

        else
        {
          id v6 = v26;
          __int16 v22 = self;
          BOOL v16 = 0LL;
          if (v45)
          {
            id v31 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              remoteRequestHelper = self->_remoteRequestHelper;
              uint32_t v39 = v31;
              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoteRequestHelper remoteRequestInfo](remoteRequestHelper, "remoteRequestInfo"));
              *(_DWORD *)__int128 buf = 136315650;
              __int16 v61 = "-[ADCommandCenter _startRequest:withDelegate:]";
              __int16 v62 = 2112;
              id v63 = self;
              __int16 v64 = 2112;
              unsigned __int8 v65 = v40;
              _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "%s Don't know how to make a local request for this info %@ %@",  buf,  0x20u);

              id v6 = v26;
            }

            v45[2](v45, 0LL, 0LL);
            BOOL v16 = 0LL;
          }
        }

        id v8 = v43;
      }

      else
      {
        __int16 v22 = self;
        BOOL v16 = 0LL;
        if (v45)
        {
          __int16 v30 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            id v32 = v15;
            int64_t v33 = v8;
            id v34 = v6;
            id v35 = self->_remoteRequestHelper;
            __int16 v36 = v30;
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoteRequestHelper remoteRequestInfo](v35, "remoteRequestInfo"));
            *(_DWORD *)__int128 buf = 136315650;
            __int16 v61 = "-[ADCommandCenter _startRequest:withDelegate:]";
            __int16 v62 = 2112;
            id v63 = self;
            __int16 v64 = 2112;
            unsigned __int8 v65 = v37;
            _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s Don't know how to make a local request for this info %@ %@",  buf,  0x20u);

            id v6 = v34;
            id v8 = v33;
            id v15 = v32;
          }

          v45[2](v45, 0LL, 0LL);
          BOOL v16 = 0LL;
        }
      }
    }
  }

  -[ADRemoteRequestHelper setRemoteRequestInfo:](v22->_remoteRequestHelper, "setRemoteRequestInfo:", 0LL);
  -[ADRemoteRequestHelper setCompletion:](v22->_remoteRequestHelper, "setCompletion:", 0LL);
}

- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4
{
}

- (void)_startNonSpeechRequest:(id)a3 forDelegate:(id)a4 withInfo:(id)a5 options:(id)a6 suppressAlert:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = (NSString *)a4;
  id v16 = a5;
  id v17 = a6;
  id v31 = a8;
  id v18 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"request = %@, requestInfo = %@, speechOptions = %@, suppressAlert = %d, delegate = %@",  v14,  v16,  v17,  v9,  v15);
  id v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v42 = "-[ADCommandCenter _startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:]";
    __int16 v43 = 2112;
    id v44 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    id v19 = (os_log_s *)AFSiriLogContextDaemon;
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = v19;
    int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
    *(_DWORD *)__int128 buf = 136315906;
    __int16 v42 = "-[ADCommandCenter _startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:]";
    __int16 v43 = 2112;
    id v44 = v14;
    __int16 v45 = 2112;
    int v46 = v15;
    __int16 v47 = 2112;
    float v48 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s %@ %@ %@", buf, 0x2Au);
  }

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1001DC68C;
  v39[3] = &unk_1004FD8D0;
  id v23 = v17;
  id v40 = v23;
  [v22 logEventWithType:122 contextProvider:v39];

  id v24 = self->_requestGroup;
  int v25 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v42 = "-[ADCommandCenter _startNonSpeechRequest:forDelegate:withInfo:options:suppressAlert:completion:]";
    __int16 v43 = 2112;
    id v44 = v24;
    __int16 v45 = 2112;
    int v46 = v18;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s Entering request group %@ (%@)...",  buf,  0x20u);
  }

  dispatch_group_enter((dispatch_group_t)v24);
  -[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]( self,  "_replaceRequestDelegate:withInfo:reason:andCompletion:",  v15,  v16,  2LL,  v31);

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1001DC694;
  v32[3] = &unk_1004F5640;
  id v33 = v23;
  id v34 = self;
  id v35 = v14;
  id v36 = v16;
  uint64_t v37 = v24;
  uint64_t v38 = v18;
  id v26 = v18;
  id v27 = v24;
  id v28 = v16;
  id v29 = v14;
  id v30 = v23;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:",  0LL,  v9,  v32);
}

- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"speechOptions = %@, sessionUUID = %@, delegate = %@",  v11,  v12,  v10);
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    v82 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    __int16 v83 = 2112;
    __int16 v84 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  __int16 v64 = v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADUserProfileService sharedService](&OBJC_CLASS___ADUserProfileService, "sharedService"));
  [v16 syncUserProfileNamesIfNeeded];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_1001DC2D4;
  v79[3] = &unk_1004FD8D0;
  id v18 = v11;
  id v80 = v18;
  [v17 logEventWithType:120 contextProvider:v79];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
  v66 = v19;
  unint64_t v21 = (unint64_t)[v18 activationEvent];
  if (v21 == 5)
  {
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _lastRequest](self, "_lastRequest"));
    id v23 = (NSString *)objc_claimAutoreleasedReturnValue([v22 aceId]);
    associatedRequestId = self->_associatedRequestId;
    self->_associatedRequestId = v23;

    int v25 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    id v26 = self->_associatedRequestId;
    *(_DWORD *)__int128 buf = 136315394;
    v82 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    __int16 v83 = 2112;
    __int16 v84 = v26;
    id v27 = "%s _associatedRequestId set to %@";
    id v28 = v25;
    uint32_t v29 = 22;
  }

  else
  {
    selectedSharedUserID = self->_selectedSharedUserID;
    self->_selectedSharedUserID = 0LL;

    id v31 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    *(_DWORD *)__int128 buf = 136315138;
    v82 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    id v27 = "%s [[ADMultiUserService sharedService] selectedSharedUserID] cleared on new user initiated activation";
    id v28 = v31;
    uint32_t v29 = 12;
  }

  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
LABEL_9:
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[ADNotificationManager sharedManager](&OBJC_CLASS___ADNotificationManager, "sharedManager"));
  unsigned int v33 = [v32 hasIncomingCallNotification];

  id v34 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v60 = "NO";
    if (v33) {
      id v60 = "YES";
    }
    *(_DWORD *)__int128 buf = 136315394;
    v82 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
    __int16 v83 = 2080;
    __int16 v84 = (void *)v60;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "%s hasIncomingCallNotification: %s",  buf,  0x16u);
  }

  if (self->_isInCall) {
    uint64_t v35 = 1LL;
  }
  else {
    uint64_t v35 = v33;
  }
  [v18 setIsOnPhoneCall:v35];
  unsigned __int8 v65 = v12;
  BOOL v36 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
  __int16 v62 = v13;
  [v18 setSkipGeneratingSpeechPacket:v36];
  [v18 setHybridUODEnabled:self->_siriHybridUODSupported];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v18 notifyState]);

  if (!v37)
  {
    id v52 = 0LL;
    uint32_t v39 = 0LL;
    goto LABEL_28;
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( -[ADRemoteSpeechRequestHelper speechRequestOptions]( self->_remoteSpeechRequestHelper,  "speechRequestOptions"));
  uint32_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoteSpeechRequestHelper completion](self->_remoteSpeechRequestHelper, "completion"));
  -[ADRemoteSpeechRequestHelper reset](self->_remoteSpeechRequestHelper, "reset");
  if (!v38)
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoteRequestHelper remoteRequestInfo](self->_remoteRequestHelper, "remoteRequestInfo"));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v40 speechRequestOptions]);

    if (!v38)
    {
      id v52 = 0LL;
LABEL_28:
      id v63 = v52;
      if (!self->_speechManagerState) {
        self->_speechManagerState = 1LL;
      }
      unsigned int v61 = (v21 < 0x20) & (0x8200A120 >> v21);
      id v53 = self->_requestGroup;
      id v54 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315650;
        v82 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]";
        __int16 v83 = 2112;
        __int16 v84 = v53;
        __int16 v85 = 2112;
        id v86 = v64;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEBUG,  "%s Entering request group %@ (%@)...",  buf,  0x20u);
      }

      dispatch_group_enter((dispatch_group_t)v53);
      id v55 = [v18 activationEventMachAbsoluteTime];
      id v56 = [v18 activationEventTime];
      if (!v55)
      {
        if (v57 <= 0.0)
        {
          id v58 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
          goto LABEL_36;
        }

        id v55 = (id)AFGetMachAbsoluteTimeFromTimeInterval(v56);
      }

      id v58 = -[AFRequestInfo initWithTimestamp:](objc_alloc(&OBJC_CLASS___AFRequestInfo), "initWithTimestamp:", v55);
LABEL_36:
      id v44 = v58;
      -[AFRequestInfo setSpeechRequestOptions:](v58, "setSpeechRequestOptions:", v18);
      __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v18 turnIdentifier]);
      -[AFRequestInfo setTurnIdentifier:](v44, "setTurnIdentifier:", v59);

      -[ADCommandCenter _replaceRequestDelegate:withInfo:reason:andCompletion:]( self,  "_replaceRequestDelegate:withInfo:reason:andCompletion:",  v10,  v44,  0LL,  0LL);
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472LL;
      v67[2] = sub_1001DC304;
      v67[3] = &unk_1004F5818;
      v67[4] = self;
      id v18 = v18;
      id v68 = v18;
      uint64_t v69 = v53;
      id v70 = v64;
      float v51 = v64;
      id v49 = v10;
      unsigned int v50 = v65;
      id v71 = v65;
      id v72 = v49;
      float v48 = v62;
      id v73 = v62;
      id v46 = v39;
      id v74 = v46;
      __int16 v47 = v53;
      -[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:",  v72,  v61,  0LL,  v67);

      goto LABEL_37;
    }

    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[ADRemoteRequestHelper completion](self->_remoteRequestHelper, "completion"));
    __int16 v42 = v41;
    if (v41)
    {
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472LL;
      v77[2] = sub_1001DC2DC;
      v77[3] = &unk_1004FDA58;
      id v78 = v41;
      __int16 v43 = objc_retainBlock(v77);

      uint32_t v39 = v43;
    }

    -[ADRemoteRequestHelper setRemoteRequestInfo:](self->_remoteRequestHelper, "setRemoteRequestInfo:", 0LL);
    -[ADRemoteRequestHelper setCompletion:](self->_remoteRequestHelper, "setCompletion:", 0LL);
  }

  id v44 = (AFRequestInfo *)objc_claimAutoreleasedReturnValue([v38 audioFileURL]);
  if (!AFIsInternalInstall(v44) || !v44)
  {
    id v52 = v38;

    id v18 = v52;
    goto LABEL_28;
  }

  id v63 = v38;
  id v45 = +[AFSetAudioSessionActiveContext newWithBuilder:]( &OBJC_CLASS___AFSetAudioSessionActiveContext,  "newWithBuilder:",  &stru_1004F57F0);
  -[ADCommandCenter _forceAudioSessionActiveWithContext:completion:]( self,  "_forceAudioSessionActiveWithContext:completion:",  v45,  0LL);

  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_1001DC2EC;
  v75[3] = &unk_1004FC838;
  id v46 = v39;
  uint64_t v76 = (OS_dispatch_group *)v46;
  -[ADCommandCenter _startSpeechRequestWithURL:isNarrowBand:withDelegate:completion:]( self,  "_startSpeechRequestWithURL:isNarrowBand:withDelegate:completion:",  v44,  0LL,  v10,  v75);
  __int16 v47 = v76;
  float v48 = v13;
  id v49 = v10;
  float v51 = v64;
  unsigned int v50 = v65;
LABEL_37:
}

- (void)_startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    int v13 = 136315650;
    id v14 = "-[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2048;
    id v18 = [v9 activationEvent];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ Event %ld", (uint8_t *)&v13, 0x20u);
  }

  -[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]( self,  "_startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:",  v8,  v9,  v10,  0LL);
}

- (void)_startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"speechOptions = %@, sessionUUID = %@, delegate = %@",  v11,  v12,  v10);
  __int16 v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v28 = "-[ADCommandCenter _startRecordingForPendingSpeechRequestForDelegate:withOptions:sessionUUID:completion:]";
    __int16 v29 = 2112;
    id v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v16 = self->_requestGroup;
  __int16 v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v28 = "-[ADCommandCenter _startRecordingForPendingSpeechRequestForDelegate:withOptions:sessionUUID:completion:]";
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s Entering request group %@ (%@)...",  buf,  0x20u);
  }

  dispatch_group_enter((dispatch_group_t)v16);
  unsigned __int8 v18 = [v11 usePrelisteningMode];
  -[ADCommandCenter _setHeadphonesAuthenticated:]( self,  "_setHeadphonesAuthenticated:",  [v11 isHeadphonesAuthenticated]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001DBCF8;
  v22[3] = &unk_1004F95C8;
  void v22[4] = self;
  id v23 = v14;
  unsigned __int8 v26 = v18;
  id v24 = v16;
  id v25 = v13;
  id v19 = v16;
  uint64_t v20 = v14;
  id v21 = v13;
  -[ADCommandCenter _startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:]( self,  "_startSpeechRequestWithDelegate:withOptions:sessionUUID:completion:",  v10,  v11,  v12,  v22);
}

- (void)_startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5
{
  id v8 = (ADCommandCenterRequestDelegate *)a3;
  id v9 = a4;
  id v10 = (ADCommandCenterRequestDelegate *)a5;
  id v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    *(_DWORD *)__int128 buf = 136315650;
    id v27 = "-[ADCommandCenter _startSpeechPronunciationRequestWithDelegate:withOptions:pronunciationContext:]";
    __int16 v28 = 2112;
    __int16 v29 = v8;
    __int16 v30 = 2048;
    id v31 = [v9 activationEvent];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ Event %ld", buf, 0x20u);

    id v11 = (void *)AFSiriLogContextDaemon;
  }

  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
  {
    id v13 = v11;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 serverCommandId]);
    *(_DWORD *)__int128 buf = 136315650;
    id v27 = "-[ADCommandCenter _startSpeechPronunciationRequestWithDelegate:withOptions:pronunciationContext:]";
    __int16 v28 = 2112;
    __int16 v29 = v10;
    __int16 v30 = 2112;
    id v31 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Pronunciation Context: %@ refId %@",  buf,  0x20u);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001DBC24;
  v24[3] = &unk_1004FD8D0;
  id v16 = v9;
  id v25 = v16;
  [v15 logEventWithType:122 contextProvider:v24];

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serverCommandId]);
  if (v17)
  {
  }

  else if (self->_requestDelegate == v8)
  {
    -[ADCommandCenter _replaceRequestDelegate:reason:](self, "_replaceRequestDelegate:reason:", v8, 3LL);
  }

  BOOL v18 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
  [v16 setSkipGeneratingSpeechPacket:v18];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001DBC2C;
  v21[3] = &unk_1004FD4C0;
  void v21[4] = self;
  id v22 = v16;
  id v23 = v10;
  id v19 = v10;
  id v20 = v16;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:",  v8,  1LL,  0LL,  v21);
}

- (void)_startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001DBBC0;
  v18[3] = &unk_1004FD8D0;
  id v12 = v8;
  id v19 = v12;
  [v11 logEventWithType:122 contextProvider:v18];

  -[ADCommandCenter _replaceRequestDelegate:reason:](self, "_replaceRequestDelegate:reason:", v10, 5LL);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001DBBC8;
  v15[3] = &unk_1004FD4C0;
  void v15[4] = self;
  id v16 = v12;
  id v17 = v9;
  id v13 = v9;
  id v14 = v12;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:waitForRecordingToFinish:suppressAlert:withCompletion:",  v10,  1LL,  0LL,  v15);
}

- (void)_startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v22 = "-[ADCommandCenter _startSpeechRequestWithURL:isNarrowBand:withDelegate:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v14 logEventWithType:120 context:0];

  -[ADCommandCenter _replaceRequestDelegate:reason:](self, "_replaceRequestDelegate:reason:", v11, 0LL);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_1001DBB64;
  v17[3] = &unk_1004FBFC0;
  v17[4] = self;
  id v18 = v10;
  BOOL v20 = a4;
  id v19 = v12;
  id v15 = v12;
  id v16 = v10;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:",  v11,  0LL,  v17);
}

- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1001DB3F0;
  v54[3] = &unk_1004FD8D0;
  id v21 = v16;
  id v55 = v21;
  [v20 logEventWithType:121 contextProvider:v54];

  id v34 = v17;
  id v22 = dispatch_group_create();
  v52[0] = 0LL;
  v52[1] = v52;
  v52[2] = 0x3032000000LL;
  v52[3] = sub_1001D5E48;
  void v52[4] = sub_1001D5E58;
  id v53 = 0LL;
  v50[0] = 0LL;
  v50[1] = v50;
  v50[2] = 0x3032000000LL;
  v50[3] = sub_1001D5E48;
  v50[4] = sub_1001D5E58;
  id v51 = 0LL;
  id v23 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    double v57 = "-[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Entering _replaceSpeechDelegateWhenReady group",  buf,  0xCu);
  }

  dispatch_group_enter(v22);
  -[ADCommandCenter _replaceRequestDelegate:reason:](self, "_replaceRequestDelegate:reason:", 0LL, 4LL);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  void v48[2] = sub_1001DB3F8;
  v48[3] = &unk_1004FD940;
  id v24 = v22;
  id v49 = v24;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:",  v18,  0LL,  v48);
  id v25 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    double v57 = "-[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s Entering _getDictationLanguages group",  buf,  0xCu);
  }

  dispatch_group_enter(v24);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1001DB4AC;
  v44[3] = &unk_1004F5888;
  id v46 = v52;
  __int16 v47 = v50;
  unsigned __int8 v26 = v24;
  id v45 = v26;
  -[ADCommandCenter _getDictationLanguages:options:speechOptions:delegate:completion:]( self,  "_getDictationLanguages:options:speechOptions:delegate:completion:",  v14,  v15,  v21,  v18,  v44);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DB5BC;
  block[3] = &unk_1004F58B0;
  void block[4] = self;
  id v36 = v18;
  __int16 v42 = v52;
  __int16 v43 = v50;
  id v37 = v34;
  id v38 = v15;
  id v39 = v21;
  id v40 = v14;
  id v41 = v19;
  id v28 = v19;
  id v29 = v14;
  id v30 = v21;
  id v31 = v15;
  id v32 = v34;
  id v33 = v18;
  dispatch_group_notify(v26, queue, block);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);
}

- (void)_startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  BOOL v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"languageCode = %@, dictationOptions = %@, speechOptions = %@, sessionUUID = %@, delegate = %@",  v14,  v15,  v16,  v17,  v18);
  id v21 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v33 = "-[ADCommandCenter _startRecordingForPendingDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    __int16 v34 = 2112;
    uint64_t v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v22 = self->_requestGroup;
  id v23 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v33 = "-[ADCommandCenter _startRecordingForPendingDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]";
    __int16 v34 = 2112;
    uint64_t v35 = v22;
    __int16 v36 = 2112;
    id v37 = v20;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Entering request group %@ (%@)...",  buf,  0x20u);
  }

  dispatch_group_enter((dispatch_group_t)v22);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001DAE28;
  v27[3] = &unk_1004F95C8;
  void v27[4] = self;
  id v28 = v20;
  unsigned __int8 v31 = [v16 usePrelisteningMode];
  id v29 = v22;
  id v30 = v19;
  id v24 = v22;
  id v25 = v20;
  id v26 = v19;
  -[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]( self,  "_startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:",  v14,  v15,  v16,  v17,  v18,  v27);
}

- (void)_startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    id v19 = "-[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:]";
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v18, 0x20u);
  }

  -[ADCommandCenter _startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:]( self,  "_startDictationWithLanguageCode:options:speechOptions:sessionUUID:delegate:completion:",  v12,  v13,  v14,  v15,  v16,  0LL);
}

- (void)_startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v27 = "-[ADCommandCenter _startRecordedDictationWithLanguage:options:sessionUUID:narrowband:delegate:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v17 logEventWithType:121 context:0];

  -[ADCommandCenter _replaceRequestDelegate:reason:](self, "_replaceRequestDelegate:reason:", 0LL, 4LL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001DAD18;
  v21[3] = &unk_1004F5690;
  void v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  BOOL v25 = a6;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:",  v15,  0LL,  v21);
}

- (void)_addRecordedSpeechSampleData:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (ADCommandCenterSpeechDelegate *)a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _addRecordedSpeechSampleData:delegate:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  if (self->_speechDelegate == v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    [v9 addRecordedDictationAudioSampleData:v6];
  }
}

- (void)_startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v32 = "-[ADCommandCenter _startDictationWithURL:isNarrowBand:language:options:sessionUUID:delegate:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v20 logEventWithType:121 context:0];

  -[ADCommandCenter _replaceRequestDelegate:reason:](self, "_replaceRequestDelegate:reason:", 0LL, 4LL);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1001DAC18;
  v25[3] = &unk_1004F9258;
  void v25[4] = self;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  BOOL v30 = a4;
  id v29 = v17;
  id v21 = v17;
  id v22 = v14;
  id v23 = v15;
  id v24 = v16;
  -[ADCommandCenter _replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:]( self,  "_replaceSpeechDelegateWhenReady:suppressAlert:withCompletion:",  v18,  0LL,  v25);
}

- (void)_cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5
{
  id v8 = (ADCommandCenterRequestDelegate *)a3;
  id v9 = a5;
  int v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    uint64_t Name = AFRequestCancellationReasonGetName(a4);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v16 = 136315394;
    id v17 = "-[ADCommandCenter _cancelRequestForDelegate:reason:error:]";
    __int16 v18 = 2112;
    id v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Reason for cancelling the request - %@",  (uint8_t *)&v16,  0x16u);
  }

  if (self->_requestDelegate == v8)
  {
    if ((unint64_t)(self->_speechManagerState - 1) <= 1)
    {
      id v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315394;
        id v17 = "-[ADCommandCenter _cancelRequestForDelegate:reason:error:]";
        __int16 v18 = 1024;
        LODWORD(v19) = a4 == 1;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Cancelling speech capture (suppressing alert: %d)",  (uint8_t *)&v16,  0x12u);
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
      [v15 cancelSpeechCaptureSuppressingAlert:a4 == 1];
    }

    -[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]( self,  "_cancelCurrentRequestForReason:andError:successorInfo:",  a4,  v9,  0LL);
  }
}

- (void)_rollbackRequestForDelegate:(id)a3
{
  int v4 = (ADCommandCenterRequestDelegate *)a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _rollbackRequestForDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  if (self->_requestDelegate == v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRequestCommand]);

    if (v7)
    {
      id v8 = v7;
      -[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]( self,  "_cancelCurrentRequestForReason:andError:successorInfo:",  10LL,  0LL,  0LL);
    }

    else
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _lastRequest](self, "_lastRequest"));
      if (!v8)
      {
        id v9 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v10 = 136315138;
          id v11 = "-[ADCommandCenter _rollbackRequestForDelegate:]";
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Trying to rollback a request, but don't have one",  (uint8_t *)&v10,  0xCu);
        }

        id v8 = 0LL;
        goto LABEL_8;
      }
    }

    -[ADCommandCenter _sendRollbackCommandForCommand:](self, "_sendRollbackCommandForCommand:", v8);
LABEL_8:
  }
}

- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4
{
}

- (void)_updateSpeechOptions:(id)a3 forDelegate:(id)a4 allowUpdateInSpeechCompletion:(BOOL)a5
{
  id v8 = a3;
  id v9 = (ADCommandCenterSpeechDelegate *)a4;
  int v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (self->_speechDelegate == v9)
  {
    if (v8)
    {
      if (CSSiriSpeechRecordingGetUsesServerEndpointingFromRequestOptions(v8)
        && (CSSiriSpeechRecordingGetUsesServerEndpointingFromRequestOptions(self->_currentSpeechRequestOptions) & 1) == 0)
      {
        -[AFSpeechRequestOptions setEndpointerOperationMode:]( self->_currentSpeechRequestOptions,  "setEndpointerOperationMode:",  [v8 endpointerOperationMode]);
        speechRequestGroup = self->_speechRequestGroup;
        queue = (dispatch_queue_s *)self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1001DAAE8;
        block[3] = &unk_1004FD940;
        void block[4] = self;
        dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, block);
      }

      else
      {
        int v16 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Skipped enable server endpointer command because ADSpeechCapturingGetUsesServerEndpointingFromRequestOptions == NO",  buf,  0xCu);
        }
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
      [v19 updateSpeechOptions:v8];
    }
  }

  else
  {
    if (a5)
    {
      id v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (self->_speechCompletion)
      {
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s We're not the current delegate, but we have a speech completion. Will try to update in completion",  buf,  0xCu);
        }

        objc_initWeak((id *)buf, self);
        id v12 = objc_retainBlock(self->_speechCompletion);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1001DAA9C;
        v21[3] = &unk_1004FD808;
        id v24 = v12;
        id v13 = v12;
        objc_copyWeak(&v25, (id *)buf);
        id v22 = v8;
        id v23 = v9;
        id v14 = objc_retainBlock(v21);
        id speechCompletion = self->_speechCompletion;
        self->_id speechCompletion = v14;

        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
        goto LABEL_19;
      }
    }

    else
    {
      id v11 = (os_log_s *)AFSiriLogContextDaemon;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v27 = "-[ADCommandCenter _updateSpeechOptions:forDelegate:allowUpdateInSpeechCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Ignoring update speech options from invalid delegate",  buf,  0xCu);
    }
  }

- (void)_stopSpeechWithOptions:(id)a3 forDelegate:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (ADCommandCenterSpeechDelegate *)a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v15 = "-[ADCommandCenter _stopSpeechWithOptions:forDelegate:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (self->_speechDelegate == v7)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    [v10 stopSpeechCaptureWithOptions:v6];

    speechRequestGroup = self->_speechRequestGroup;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001DA9F8;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_group_notify((dispatch_group_t)speechRequestGroup, queue, block);
  }

  else
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v15 = "-[ADCommandCenter _stopSpeechWithOptions:forDelegate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Ignoring stop speech from invalid delegate",  buf,  0xCu);
    }
  }
}

- (void)_cancelSpeechForDelegate:(id)a3
{
  int v4 = (ADCommandCenterSpeechDelegate *)a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADCommandCenter _cancelSpeechForDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  if (self->_speechDelegate == v4)
  {
    if ((unint64_t)(self->_speechManagerState - 1) <= 1)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
      [v7 cancelSpeechCaptureSuppressingAlert:AFIsNano(v7)];

      -[ADCommandCenter _cancelCurrentRequestForReason:andError:successorInfo:]( self,  "_cancelCurrentRequestForReason:andError:successorInfo:",  12LL,  0LL,  0LL);
    }
  }

  else
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADCommandCenter _cancelSpeechForDelegate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Ignoring cancel speech from invalid delegate",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[ADCommandCenter _sendSpeechCorrectionInfo:forCorrectionContext:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___SASSpeechCorrectionStatistics);
  -[SASSpeechCorrectionStatistics ad_setAFSpeechCorrectionInfo:](v9, "ad_setAFSpeechCorrectionInfo:", v6);
  -[SASSpeechCorrectionStatistics ad_setAFCorrectionContext:](v9, "ad_setAFCorrectionContext:", v7);
  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v9);
}

- (void)_sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[ADCommandCenter _sendSpeechCorrectionInfo:interactionIdentifier:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [[LBLocalSpeechRecognizerClient alloc] initWithDelegate:0];
  [v8 sendSpeechCorrectionInfo:v5 interactionIdentifier:v6];
  [v8 invalidate];
}

- (void)_pauseRecognition
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    int v10 = "-[ADCommandCenter _pauseRecognition]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantIdentifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionUUID]);
  [v4 pauseDictationRecognitionWithAssistantId:v6 requestId:v8];
}

- (void)_resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    __int16 v18 = "-[ADCommandCenter _resumeRecognitionWithPrefixText:postfixText:selectedText:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v17, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assistantIdentifier]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionUUID]);
  [v12 resumeDictationRecognitionWithAssistantId:v14 requestId:v16 prefixText:v8 postfixText:v9 selectedText:v10];
}

- (void)_updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v17 = a10;
  id v27 = a9;
  id v26 = a8;
  id v24 = a7;
  id v25 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v29 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v28 assistantIdentifier]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sessionUUID]);
  [v29 updateVoiceCommandContextWithAssistantId:v23 requestId:v22 prefixText:v20 postfixText:v19 selectedText:v18 disambiguationActive:v25 cursorIn VisibleText:v24 favorCommandSuppression:v26 abortCommandSuppression:v27 undoEvent:v17];
}

- (void)_handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", a3));
  -[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]( self,  "_handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:",  v12,  v11,  v6,  v10);
}

- (void)_handleGenericConcreteAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, BOOL))a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315906;
    id v32 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 1024;
    BOOL v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ %@ %d", buf, 0x26u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentRequestCommand]);

  if (v12) {
    v12[2](v12, v15 != 0LL);
  }
  if (v15 && !v7)
  {
    __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v32 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Requested command conflicts with existing: %@",  buf,  0x16u);
    }

    goto LABEL_15;
  }

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___SABaseCommand);
  if ((objc_opt_isKindOfClass(v10, v17) & 1) == 0)
  {
    id v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)__int128 buf = 136315394;
    id v32 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    __int16 v33 = 2112;
    id v34 = v10;
    id v26 = "%s Ignoring invalid ace command %@";
    id v27 = v20;
LABEL_31:
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
    goto LABEL_15;
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___SASendCommands);
  if ((objc_opt_isKindOfClass(v10, v18) & 1) != 0)
  {
    id v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v32 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Handling generic send commands", buf, 0xCu);
    }

    -[ADCommandCenter _handleSendCommands:forRequestDelegate:completion:]( self,  "_handleSendCommands:forRequestDelegate:completion:",  v10,  v11,  0LL);
    goto LABEL_15;
  }

  if (-[ADCommandCenter _isServerBoundCommand:](self, "_isServerBoundCommand:", v10))
  {
    id v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v32 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Handling generic server bound command",  buf,  0xCu);
    }

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___SAStartRequest);
    if ((objc_opt_isKindOfClass(v10, v22) & 1) != 0)
    {
      -[ADCommandCenter _startNonSpeechRequest:forDelegate:](self, "_startNonSpeechRequest:forDelegate:", v10, v11);
    }

    else if (objc_msgSend(v10, "ad_willHaveReply"))
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1001DA8D4;
      v28[3] = &unk_1004F58D8;
      void v28[4] = self;
      id v29 = v10;
      id v30 = v11;
      -[ADCommandCenter _sendCommandToServer:opportunistically:completion:]( self,  "_sendCommandToServer:opportunistically:completion:",  v29,  0LL,  v28);
    }

    else
    {
      -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v10);
    }

    goto LABEL_15;
  }

  unsigned int v23 = -[ADCommandCenter _isClientBoundCommand:](self, "_isClientBoundCommand:", v10);
  id v24 = (os_log_s *)AFSiriLogContextDaemon;
  if (!v23)
  {
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)__int128 buf = 136315394;
    id v32 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    __int16 v33 = 2112;
    id v34 = v10;
    id v26 = "%s Don't know how to handle generic ace command %@";
    id v27 = v24;
    goto LABEL_31;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v32 = "-[ADCommandCenter _handleGenericConcreteAceCommand:withDelegate:interruptOutstandingRequest:reply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Handling generic client bound command",  buf,  0xCu);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v25 handleCommand:v10];

LABEL_15:
}

- (void)_setFirstChanceService:(id)a3 forAceId:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    firstChanceServices = self->_firstChanceServices;
    if (!firstChanceServices)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v9 = self->_firstChanceServices;
      self->_firstChanceServices = v8;

      firstChanceServices = self->_firstChanceServices;
    }

    -[NSMutableDictionary setObject:forKey:](firstChanceServices, "setObject:forKey:", v10, v6);
  }
}

- (void)_removeFirstChanceServiceForAceId:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_firstChanceServices, "removeObjectForKey:");
  }
}

- (id)_firstChanceServiceForCommand:(id)a3
{
  firstChanceServices = self->_firstChanceServices;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 refId]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](firstChanceServices, "objectForKey:", v4));

  return v5;
}

- (void)_firstChanceServiceChangeIdFrom:(id)a3 to:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_firstChanceServices, "objectForKey:", v9));
    id v8 = (void *)v7;
    if (v6 && v7) {
      -[NSMutableDictionary setObject:forKey:](self->_firstChanceServices, "setObject:forKey:", v7, v6);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_firstChanceServices, "removeObjectForKey:", v9);
  }
}

- (void)_handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v32 = "-[ADCommandCenter _handleAceCommand:afterCurrentRequest:waitForResponse:withDelegate:completion:]";
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s command = %@, delegate = %@", buf, 0x20u);
  }

  if (v10) {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  else {
    __int16 v16 = 0LL;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001D9B70;
  v23[3] = &unk_1004F73A0;
  id v17 = v12;
  id v24 = v17;
  id v18 = v16;
  id v25 = v18;
  BOOL v29 = v10;
  id v19 = v13;
  id v26 = v19;
  id v27 = self;
  BOOL v30 = a5;
  id v20 = v14;
  id v28 = v20;
  id v21 = objc_retainBlock(v23);
  uint64_t v22 = v21;
  if (v10) {
    dispatch_group_notify((dispatch_group_t)self->_requestGroup, (dispatch_queue_t)self->_queue, v21);
  }
  else {
    ((void (*)(void *))v21[2])(v21);
  }
}

- (void)_emitDeviceDynamicContextForRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D7FD8(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHDeviceDynamicContext);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _motionManager](self, "_motionManager"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 motionActivity]);

    if ([v9 isEqualToString:SAMotionActivityInVehicleStationaryValue])
    {
      uint64_t v10 = 4LL;
    }

    else if ([v9 isEqualToString:SAMotionActivityStationaryValue])
    {
      uint64_t v10 = 2LL;
    }

    else if (([v9 isEqualToString:SAMotionActivityWalkingValue] & 1) != 0 {
           || ([v9 isEqualToString:SAMotionActivityRunningValue] & 1) != 0
    }
           || ([v9 isEqualToString:SAMotionActivityCyclingValue] & 1) != 0)
    {
      uint64_t v10 = 1LL;
    }

    else if ([v9 isEqualToString:SAMotionActivityInVehicleMovingValue])
    {
      uint64_t v10 = 3LL;
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    [v7 setMotionActivity:v10];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    id v13 = [v12 thermalState];

    else {
      uint64_t v14 = 0LL;
    }
    [v7 setThermalState:v14];
    id v15 = objc_alloc_init(&OBJC_CLASS___SiriCoreWiFiManagerClient);
    objc_msgSend(v7, "setIsWifiEnabled:", objc_msgSend(v15, "isWifiEnabled"));
    objc_msgSend( v7,  "setBluetoothState:",  +[ADCommandCenter _orchBluetoothStateEnumFromBluetoothState:]( ADCommandCenter,  "_orchBluetoothStateEnumFromBluetoothState:",  +[ADCommandCenter _fetchBluetoothState](ADCommandCenter, "_fetchBluetoothState")));
    [v7 setIsChatGPTEnabled:0];
    id v16 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHClientEvent);
    [v16 setOrchDeviceDynamicContext:v7];
    id v17 = objc_alloc_init(&OBJC_CLASS___ORCHSchemaORCHClientEventMetadata);
    [v17 setRequestId:v6];
    [v16 setEventMetadata:v17];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v18 emitMessage:v16];
  }

  else
  {
    id v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      id v20 = "-[ADCommandCenter _emitDeviceDynamicContextForRequest:]";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s The requestId=%@ is malformed for request, not logging motion activity as a device dynamic context.",  (uint8_t *)&v19,  0x16u);
    }
  }
}

- (BOOL)_areRequiredAssetsMissing
{
  if ((AFShouldRunAsrOnServerForUOD(self, a2) & 1) != 0)
  {
    uint64_t v3 = 898LL;
LABEL_6:
    BOOL v5 = *((unsigned __int8 *)&self->super.isa + v3) == 0;
    goto LABEL_8;
  }

  if (AFDeviceSupportsSiriUOD())
  {
    int v4 = AFDeviceSupportsSAE();
    uint64_t v3 = 897LL;
    if (v4) {
      uint64_t v3 = 899LL;
    }
    goto LABEL_6;
  }

  BOOL v5 = 0;
LABEL_8:
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    BOOL siriHybridUODSupported = self->_siriHybridUODSupported;
    BOOL siriFullUODSupported = self->_siriFullUODSupported;
    BOOL siriSAESupported = self->_siriSAESupported;
    int v11 = 136316162;
    id v12 = "-[ADCommandCenter _areRequiredAssetsMissing]";
    __int16 v13 = 1024;
    BOOL v14 = v5;
    __int16 v15 = 1024;
    BOOL v16 = siriHybridUODSupported;
    __int16 v17 = 1024;
    BOOL v18 = siriFullUODSupported;
    __int16 v19 = 1024;
    BOOL v20 = siriSAESupported;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s #AsrOnServer assetsMissing = %d, _siriHybridUODSupported= %d, _siriFullUODSupported=%d, _siriSAESupported=%d",  (uint8_t *)&v11,  0x24u);
  }

  return v5;
}

- (void)_clearContext
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter _clearContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  -[ADDomainObjectCache reset](self->_domainObjectCache, "reset");
  self->_restrictionsWereSetForRequest = 0;
  selectedSharedUserID = self->_selectedSharedUserID;
  self->_selectedSharedUserID = 0LL;

  BOOL v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter _clearContext]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s _selectedSharedUserID cleared in _clearContext.",  (uint8_t *)&v6,  0xCu);
  }

  -[ADSessionManager resetWinningState](self->_sessionManager, "resetWinningState");
  -[ADCommandCenter _context_clearContextWithClearSiriKitContext:]( self,  "_context_clearContextWithClearSiriKitContext:",  0LL);
}

- (id)_updateUODAssetStatusForLanguage:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 languageCode]);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _fetchUODStatusForLanguageCode:](self, "_fetchUODStatusForLanguageCode:", v5));
  self->_BOOL siriHybridUODSupported = AFUODStatusSupportedHybrid(v7, v4);
  self->_int siriSAESupported = AFUODStatusSupportedSAE(v7, v4);
  else {
    int siriSAESupported = AFUODStatusSupportedFull(v7, v4);
  }
  self->_BOOL siriFullUODSupported = siriSAESupported;
  if (siriSAESupported && !self->_siriHybridUODSupported)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
    uint64_t v10 = v9;
    uint64_t v11 = 0LL;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
    uint64_t v10 = v9;
    uint64_t v11 = 1LL;
  }

  [v9 setAllowAdHocSendingLocationToServer:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  __int16 v13 = v12;
  BOOL v14 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
  [v12 setIsSiriFullUODSupported:v14];

  BOOL siriHybridUODSupported = 1;
  if (!self->_siriFullUODSupported) {
    BOOL siriHybridUODSupported = self->_siriHybridUODSupported;
  }
  self->_siriUODSupported = siriHybridUODSupported;
  self->_assetsCheckRan = 1;
  objc_storeStrong((id *)&self->_currentUodStatus, v7);
  BOOL v16 = self->_siriHybridUODSupported;
  if (self->_siriHybridUODSupported)
  {
    __int16 v17 = @"Hybrid";
  }

  else if (self->_siriSAESupported)
  {
    __int16 v17 = @"SAE";
  }

  else if (self->_siriFullUODSupported)
  {
    __int16 v17 = @"FullUOD";
  }

  else
  {
    __int16 v17 = @"Classic";
  }

  BOOL v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    currentUodStatus = self->_currentUodStatus;
    BOOL siriFullUODSupported = self->_siriFullUODSupported;
    BOOL v21 = self->_siriSAESupported;
    int v23 = 136316674;
    id v24 = "-[ADCommandCenter _updateUODAssetStatusForLanguage:]";
    __int16 v25 = 2112;
    id v26 = currentUodStatus;
    __int16 v27 = 1024;
    BOOL v28 = siriFullUODSupported;
    __int16 v29 = 1024;
    BOOL v30 = v16;
    __int16 v31 = 1024;
    BOOL v32 = v21;
    __int16 v33 = 2112;
    id v34 = v5;
    __int16 v35 = 2112;
    id v36 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s #AsrOnServer Siri understanding on device status: uodStatus:%@, _siriFullUODSupported:%d, _siriHybridUODSupport ed:%d, _siriSAESupported:%d, fetchLanguageCode:%@, orchestration mode chosen: %@",  (uint8_t *)&v23,  0x3Cu);
  }

  return v7;
}

- (id)_fetchUODStatusForLanguageCode:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate(v4);
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "AssetFetch",  (const char *)&unk_1004B87EF,  buf,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADAssetManager assetsAvailableStatusForLanguage:]( self->_assetManager,  "assetsAvailableStatusForLanguage:",  v5));
  uint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
  uint64_t v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)__int16 v13 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v6,  "AssetFetch",  (const char *)&unk_1004B87EF,  v13,  2u);
  }

  return v9;
}

- (void)_clearContextAndStartAssistantSession
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 languageCode]);

  if ((AFDeviceSupportsSiriUOD() & 1) != 0 || AFDeviceSupportsHybridUOD())
  {
    id v5 = -[ADCommandCenter _updateUODAssetStatusForLanguage:](self, "_updateUODAssetStatusForLanguage:", v4);
    BOOL v6 = self->_siriFullUODSupported && !self->_siriHybridUODSupported;
    -[ADSessionManager resetSessionsIfRequiredBasedOnOrchestrationMode:]( self->_sessionManager,  "resetSessionsIfRequiredBasedOnOrchestrationMode:",  v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _requestDispatcherSessionConfiguration]( self,  "_requestDispatcherSessionConfiguration"));
  [v7 startSessionWithConfiguration:v8];

  if (self->_serviceManager)
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001D9B34;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(v9, block);
  }
}

- (void)_clearContextAndStartDictationSessionWithLanguageCode:(id)a3 dictationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[ADCommandCenter _clearContext](self, "_clearContext");
  if ([v7 shouldClassifyIntent])
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      BOOL v20 = "-[ADCommandCenter _clearContextAndStartDictationSessionWithLanguageCode:dictationOptions:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s shouldClassifyIntent is YES; will update UoD status",
        buf,
        0xCu);
    }

    id v9 = -[ADCommandCenter _updateUODAssetStatusForLanguage:](self, "_updateUODAssetStatusForLanguage:", v6);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver]( &OBJC_CLASS___ADDictationOfflineStatusObserver,  "sharedDictationOfflineStatusObserver"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 offlineDictationStatus]);

  uint64_t v12 = AFIsDictationLanguageInstalledForOfflineRecognition(v6, v11);
  if ((_DWORD)v12) {
    uint64_t v13 = AFIsNLAssetAvailableFromUodStatus(self->_currentUodStatus);
  }
  else {
    uint64_t v13 = 0LL;
  }
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 assistantIdentifier]);
  objc_msgSend( v14,  "startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldClassifyIntent:understandingOnDevice:",  v16,  v6,  v12,  objc_msgSend(v7, "shouldClassifyIntent"),  v13);

  if (self->_serviceManager)
  {
    __int16 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001D9AF8;
    block[3] = &unk_1004FD940;
    void block[4] = self;
    dispatch_async(v17, block);
  }
}

- (void)_fetchSupportedLanguagesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v11 = "-[ADCommandCenter _fetchSupportedLanguagesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___SAGetSupportedLocales);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D9994;
  v8[3] = &unk_1004FC668;
  id v9 = v4;
  id v7 = v4;
  -[ADCommandCenter _sendCommandToServer:completion:](self, "_sendCommandToServer:completion:", v6, v8);
}

- (void)_getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _resultObjectCache](self, "_resultObjectCache"));
  id v16 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectsForIds:v6 missingReferences:&v16]);
  id v10 = v16;

  if ([v10 count])
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SAGetResultObjects);
    -[SAGetResultObjects setObjectIdentifiers:](v11, "setObjectIdentifiers:", v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001D9580;
    v12[3] = &unk_1004F51B8;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v6;
    id v15 = v7;
    -[ADCommandCenter _sendCommandToServer:opportunistically:completion:]( self,  "_sendCommandToServer:opportunistically:completion:",  v11,  0LL,  v12);
  }

  else if (v7)
  {
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0LL);
  }
}

- (id)_accounts
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountIdentifiers]);

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ADAccount accountForIdentifier:]( &OBJC_CLASS___ADAccount,  "accountForIdentifier:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9),  (void)v15));
        if (v10) {
          [v2 addObject:v10];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }

    while (v7);
  }

  uint64_t v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);
    *(_DWORD *)__int128 buf = 136315394;
    BOOL v20 = "-[ADCommandCenter _accounts]";
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  return v2;
}

- (void)_createAssistantLocallyIfNeeded:(BOOL)a3
{
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    __int128 v15 = "-[ADCommandCenter _createAssistantLocallyIfNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  id v7 = v6;
  if (a3)
  {
    if ([v6 needsDestruction])
    {
      [v7 setNeedsDestruction:0];
      [v7 setNeedsCreation:1];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
      [v8 unscheduleDestroyJob];

      [v7 save];
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 assistantIdentifier]);

    if (!v9)
    {
      [v7 clearAssistantData];
      [v7 updateAssistantIdentifiers];
      [v7 setNeedsCreation:1];
      [v7 save];
      else {
        id v10 = 0LL;
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      [v11 speechIdUpdatedForEndpointUUID:v10];

      dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_async(v13, &stru_1004F5998);
    }
  }

  else if ([v6 needsCreation])
  {
    [v7 setNeedsCreation:0];
    [v7 save];
  }
}

- (void)_deleteAccountWithIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[ADAccount accountForIdentifier:](&OBJC_CLASS___ADAccount, "accountForIdentifier:"));
    [v3 removeAndSave];
  }

- (id)_activeAccountIdentifier
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return v3;
}

- (void)_setActiveAccountIdentifier:(id)a3
{
  unsigned int v4 = +[ADAccount setActiveAccountIdentifier:](&OBJC_CLASS___ADAccount, "setActiveAccountIdentifier:", a3);
  -[ADCommandCenter _clearAccount](self, "_clearAccount");
  id v5 = sub_1002D6574(@"encryption_key_did_change");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[ADCommandCenter syncAnchorKeys:forceReset:reasons:]( self,  "syncAnchorKeys:forceReset:reasons:",  v6,  1LL,  &off_100513030);

  notify_post("com.apple.assistant.sync_needed");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v8 = [v7 postNotificationName:@"ADActiveAccountIdentifierDidChangeNotification" object:0];
  if (v4)
  {
    [v7 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];
    if ((-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint") & 1) == 0)
    {
      id v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315138;
        id v13 = "-[ADCommandCenter _setActiveAccountIdentifier:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Notifying remoras of new account",  (uint8_t *)&v12,  0xCu);
      }

      DistributedCenter = CFNotificationCenterGetDistributedCenter();
      CFNotificationCenterPostNotification( DistributedCenter,  AFSiriActiveAccountChangedDistributedNotification,  0LL,  0LL,  1u);
    }
  }
}

- (void)_destroyActiveAccount
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v33 = "-[ADCommandCenter _destroyActiveAccount]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 assistantIdentifier]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 speechIdentifier]);
  if (v5 | v6)
  {
    if ([v4 needsCreation])
    {
      [v4 setNeedsCreation:0];
      [v4 setNeedsDestruction:0];
      [v4 save];
    }

    else if (([v4 needsDestruction] & 1) == 0)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
      [v7 scheduleDestroyJob];

      [v4 setNeedsDestruction:1];
      [v4 save];
      unsigned int v8 = +[AFFeatureFlags isOnDeviceHistoryDeletionEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isOnDeviceHistoryDeletionEnabled");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      unsigned __int8 v10 = [v9 longLivedIdentifierUploadingEnabled];

      if (v8)
      {
        if ((v10 & 1) == 0)
        {
          uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315138;
            __int16 v33 = "-[ADCommandCenter _destroyActiveAccount]";
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s #RPI delete Siri History when Siri + Dictation are disabled",  buf,  0xCu);
          }

          -[ADCommandCenter _deleteSiriHistoryOnDeviceOnDestroyAssistant]( self,  "_deleteSiriHistoryOnDeviceOnDestroyAssistant");
        }
      }
    }

    +[_INVocabularyStoreManager deleteAllUserVocabularyFromAllAppsAsync]( &OBJC_CLASS____INVocabularyStoreManager,  "deleteAllUserVocabularyFromAllAppsAsync");
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    [v12 disableDESWithCompletion:&stru_1004F59B8];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADSyncSnapshot sharedInstance](&OBJC_CLASS___ADSyncSnapshot, "sharedInstance"));
    [v13 deleteSavedSnapshots];

    -[ADCommandCenter _metrics_destroyAllMetrics](self, "_metrics_destroyAllMetrics");
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
    [v14 resetSessionsAndMakeQuiet:0];

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int128 v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);
    __int128 v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.siri.duet", v18);
    AFDeleteCoreDuetEventsInStream(v19, AFSiriServiceStreamName);
    AFRecordCoreDuetContext(v19, @"siri.service", 0LL);

    BOOL v20 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);

    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringByAppendingPathComponent:@"SiriEdutainment"]);
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v31 = 0LL;
    unsigned int v25 = [v24 removeItemAtPath:v23 error:&v31];
    id v26 = v31;
    __int16 v27 = v26;
    if (v25)
    {
      BOOL v28 = (os_log_s *)AFSiriLogContextUtility;
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v33 = "ADDeleteItemAtPath";
        __int16 v34 = 2112;
        __int16 v35 = v23;
        __int16 v29 = "%s Successfully deleted item %@";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v29, buf, 0x16u);
      }
    }

    else
    {
      int found = AFIsFileNotFoundError(v26);
      BOOL v28 = (os_log_s *)AFSiriLogContextUtility;
      if (!found)
      {
        if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 136315650;
          __int16 v33 = "ADDeleteItemAtPath";
          __int16 v34 = 2112;
          __int16 v35 = v23;
          __int16 v36 = 2112;
          __int16 v37 = v27;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Failed to delete item at %@ - %@",  buf,  0x20u);
        }

        goto LABEL_21;
      }

      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315394;
        __int16 v33 = "ADDeleteItemAtPath";
        __int16 v34 = 2112;
        __int16 v35 = v23;
        __int16 v29 = "%s Not Found %@";
        goto LABEL_18;
      }
    }

- (void)_deleteSiriHistoryWithContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter _deleteSiriHistoryWithContext:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  -[ADCommandCenter _deleteSiriAudioDataOnDevice](self, "_deleteSiriAudioDataOnDevice");
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000LL;
  float v48 = sub_1001D5E48;
  id v49 = sub_1001D5E58;
  id v50 = 0LL;
  objc_initWeak(&location, self);
  id v9 = objc_alloc(&OBJC_CLASS___AFOneArgumentSafetyBlock);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1001D8F7C;
  v36[3] = &unk_1004F59E0;
  id v10 = v6;
  id v37 = v10;
  objc_copyWeak(&v40, &location);
  p___int128 buf = &buf;
  id v11 = v7;
  id v38 = v11;
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  0LL,  @"Completion block was dropped unexpectedly."));
  id v13 = [v9 initWithBlock:v36 defaultValue:v12];

  int v14 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1001D91AC;
  v34[3] = &unk_1004FD940;
  id v17 = v13;
  id v35 = v17;
  __int128 v18 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v14,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v16,  v34,  20.0);
  dispatch_queue_t v19 = *(void **)(*((void *)&buf + 1) + 40LL);
  *(void *)(*((void *)&buf + 1) + 40LL) = v18;

  [*(id *)(*((void *)&buf + 1) + 40) start];
  id v20 = objc_alloc_init(&OBJC_CLASS___SADeleteAssistantHistory);
  __int16 v21 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v21, "UUIDString"));
  [v20 setAceId:v22];

  int v23 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v42 = 136315394;
    __int16 v43 = "-[ADCommandCenter _deleteSiriHistoryWithContext:withCompletion:]";
    __int16 v44 = 2112;
    id v45 = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s request = %@", v42, 0x16u);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned int v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 _queue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D9200;
  block[3] = &unk_1004FD4C0;
  id v26 = v24;
  id v31 = v26;
  id v27 = v20;
  id v32 = v27;
  id v28 = v17;
  id v33 = v28;
  dispatch_async(v25, block);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  kAFSiriAndDictationHistoryDeletionRequestedDarwinNotification,  0LL,  0LL,  1u);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

- (void)_deleteSiriHistoryOnDeviceOnDestroyAssistant
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter _deleteSiriHistoryOnDeviceOnDestroyAssistant]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  -[ADCommandCenter _deleteSiriAudioDataOnDevice](self, "_deleteSiriAudioDataOnDevice");
  unsigned int v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter _deleteSiriHistoryOnDeviceOnDestroyAssistant]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s #RPI skipping SADeleteAssistantHistory because it is redundant with SADestroyAssistant.",  (uint8_t *)&v6,  0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  kAFSiriAndDictationHistoryDeletionRequestedDarwinNotification,  0LL,  0LL,  1u);
  sub_1001D8D40(0LL, 1);
}

- (void)_deleteSiriAudioDataOnDevice
{
  uint64_t v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADCommandCenter _deleteSiriAudioDataOnDevice]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1004F5A00);
}

- (void)_postWatchNotificationWithContext:(id)a3 withError:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (v5)
  {
    int v6 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 errorTitle]);
    id v7 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 errorBody]);
    unsigned int v8 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 errorButtonText]);
  }

  else
  {
    int v6 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 successTitle]);
    id v7 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 successBody]);
    unsigned int v8 = (const __CFString *)objc_claimAutoreleasedReturnValue([v10 successButtonText]);
  }

  id v9 = v8;
  if (v6 && v7 && v8)
  {
    CFUserNotificationDisplayNotice(0.0, 3uLL, 0LL, 0LL, 0LL, v6, v7, v8);
  }

  else if (!v6)
  {
    goto LABEL_10;
  }

  CFRelease(v6);
LABEL_10:
  if (v7) {
    CFRelease(v7);
  }
  if (v9) {
    CFRelease(v9);
  }
}

- (void)_refreshAssistantValidation
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADCommandCenter _refreshAssistantValidation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  [v4 refreshValidationData];
}

- (void)_rescheduleValidationRefresh
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    int v14 = "-[ADCommandCenter _rescheduleValidationRefresh]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if ([v4 assistantIsEnabled])
  {

LABEL_6:
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 validationExpiration]);

    if (v8)
    {
      [v8 timeIntervalSinceNow];
      if (v9 < 0.0) {
        double v10 = 0.0;
      }
      else {
        double v10 = v9;
      }
    }

    else
    {
      double v10 = 0.0;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
    [v11 scheduleValidationRefreshForInterval:v10];

    return;
  }

  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v6 = [v5 dictationIsEnabled];

  if ((v6 & 1) != 0) {
    goto LABEL_6;
  }
  int v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    int v14 = "-[ADCommandCenter _rescheduleValidationRefresh]";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Ignoring reschedule refresh request because assistant isn't enabled",  (uint8_t *)&v13,  0xCu);
  }

- (void)_handleExternalActivationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  unsigned int v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v42 = "-[ADCommandCenter _handleExternalActivationRequest:completion:]";
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1001D8854;
  v39[3] = &unk_1004FD8D0;
  id v10 = v6;
  id v40 = v10;
  [v9 logEventWithType:122 contextProvider:v39];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 speechRequestOptions]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 handoffURLString]);

  if (v12)
  {
    int v13 = objc_alloc(&OBJC_CLASS___NSURL);
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 handoffURLString]);
    dispatch_queue_attr_t v15 = -[NSURL initWithString:](v13, "initWithString:", v14);
    id v16 = sub_1001EADA8(v15);

    if (v7) {
      v7[2](v7, v16, 0LL);
    }
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _remoteRequestHelper](self, "_remoteRequestHelper"));
    [v17 setRemoteRequestInfo:v10];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1001D885C;
    v35[3] = &unk_1004FD4C0;
    id v36 = v11;
    id v18 = v10;
    id v37 = v18;
    id v38 = self;
    dispatch_queue_t v19 = objc_retainBlock(v35);
    if ([v18 handoffRequiresUserInteraction])
    {
      if (v7) {
        v7[2](v7, (id)1, 0LL);
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 userNotificationRequestForRemoteRequest]);
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[ADUserNotificationServiceProvider personalDomainNotificationProvider]( &OBJC_CLASS___ADUserNotificationServiceProvider,  "personalDomainNotificationProvider"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1001D89B8;
      v33[3] = &unk_1004F5A70;
      __int16 v34 = v19;
      [v21 postNotificationRequest:v20 options:1 responseHandler:v33];

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
      double v23 = 185.0;
    }

    else
    {
      [v17 setCompletion:v7];
      ((void (*)(void *))v19[2])(v19);
      id v22 = 0LL;
      double v23 = 5.0;
    }

    dispatch_time_t v24 = dispatch_time(0LL, (uint64_t)(v23 * 1000000000.0));
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001D8A20;
    block[3] = &unk_1004FD510;
    id v29 = v18;
    id v30 = v17;
    double v32 = v23;
    id v31 = v22;
    id v26 = v22;
    id v27 = v17;
    dispatch_after(v24, queue, block);
  }
}

- (void)_handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    int v13 = "-[ADCommandCenter _handleIntent:inBackgroundAppWithBundleId:reply:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriActivationConnection sharedConnection]( &OBJC_CLASS___AFSiriActivationConnection,  "sharedConnection"));
  [v11 handleIntent:v7 inBackgroundAppWithBundleId:v8 reply:v9];
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void))a4;
  currentClient = self->_currentClient;
  if (currentClient)
  {
    -[ADCommandCenterClient adRequestRequestedOpenURL:completion:]( currentClient,  "adRequestRequestedOpenURL:completion:",  v8,  v6);
  }

  else if (v6)
  {
    v6[2](v6, 0LL);
  }
}

- (void)_handleRemoteSpeechRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    dispatch_time_t v24 = "-[ADCommandCenter _handleRemoteSpeechRequest:completion:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001D8734;
  v21[3] = &unk_1004FD8D0;
  id v22 = v6;
  id v10 = v6;
  [v9 logEventWithType:120 contextProvider:v21];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _remoteSpeechRequestHelper](self, "_remoteSpeechRequestHelper"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 setSpeechRequestOptions:v10 withCompletion:v7]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
  [v13 startUISpeechRequest];

  dispatch_time_t v14 = dispatch_time(0LL, 5000000000LL);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D873C;
  block[3] = &unk_1004FD968;
  id v19 = v12;
  id v20 = v11;
  id v16 = v11;
  id v17 = v12;
  dispatch_after(v14, queue, block);
}

- (void)_setManagedStoreObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _domainObjectCache](self, "_domainObjectCache"));
  [v8 setDomainObject:v7 forKey:v6];
}

- (id)_managedStoreObjectForKey:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _domainObjectCache](self, "_domainObjectCache"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domainObjectForKey:v4]);

  return v6;
}

- (void)syncAnchorKeys:(id)a3 forceReset:(BOOL)a4 reasons:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001D8700;
  v13[3] = &unk_1004FC250;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)setSyncDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D86F4;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startCloudKitSyncWeeklyForActivity:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D8620;
  block[3] = &unk_1004FD940;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_removeDelegate:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v9 = "-[ADCommandCenter _removeDelegate:]";
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  -[ADCommandCenter _reallyEndSessionForDelegate:](self, "_reallyEndSessionForDelegate:", v4);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D85F8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)defrost
{
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4 completion:(id)a5
{
  id v8 = (AFSpeechRequestOptions *)a4;
  id v9 = a5;
  if (a3 == 2 && !v8)
  {
    else {
      uint64_t v10 = 8LL;
    }
    goto LABEL_9;
  }

  if (a3 == 4 && !v8)
  {
    uint64_t v10 = 13LL;
LABEL_9:
    id v8 = -[AFSpeechRequestOptions initWithActivationEvent:]( objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions),  "initWithActivationEvent:",  v10);
  }

  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AFInstanceContext audioDeviceIdentifier](self->_instanceContext, "audioDeviceIdentifier"));
    -[AFSpeechRequestOptions setActivationDeviceIdentifier:](v8, "setActivationDeviceIdentifier:", v11);
  }

  id v12 = v8;
  if (a3 != 3)
  {
    int v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v27 = "_ADPreheatSpeechWithStyle";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Preheating speech manager", buf, 0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
    [v14 preheatWithOptions:v12];
    [v14 preheatRecognizerWithOptions:v12];
  }

  if (AFIsNano(v15))
  {
    BOOL v16 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || a3 == 2;
    if (v16 && v12)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001D85E0;
      block[3] = &unk_1004FD940;
      void block[4] = self;
      dispatch_async(queue, block);
    }
  }

  id v18 = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001D85E8;
  v21[3] = &unk_1004FBA38;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v9;
  int64_t v24 = a3;
  id v19 = v9;
  id v20 = v12;
  dispatch_async(v18, v21);
}

- (void)preheatWithRecordDeviceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D8410;
  block[3] = &unk_1004FD940;
  id v10 = v4;
  dispatch_async(v6, block);

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D8588;
  v8[3] = &unk_1004FD940;
  void v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)preheatServicesForDomain:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D83D0;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D83C0;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D83B0;
  block[3] = &unk_1004FB930;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_downloadMorphunAssets:(id)a3
{
  if (a3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:"));
    id v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v12 = "-[ADCommandCenter _downloadMorphunAssets:]";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Starting Morphun assets download for %@",  buf,  0x16u);
    }

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = dispatch_queue_create("(ADCommandCenter) _downloadMorphunAssets", v6);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001D8144;
    block[3] = &unk_1004FD940;
    id v10 = v3;
    id v8 = v3;
    dispatch_async(v7, block);
  }

- (void)setAssistantEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v17 = "-[ADCommandCenter setAssistantEnabled:]";
    __int16 v18 = 1024;
    LODWORD(v19) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }

  -[ADCommandCenter _createAssistantLocallyIfNeeded:](self, "_createAssistantLocallyIfNeeded:", v3);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001D80D4;
  v13[3] = &unk_1004F5A90;
  BOOL v14 = v3;
  sub_1001D799C(v13);
  if (v3)
  {
    +[ADLocationManager prepareForAssistantEnablementInBackground]( &OBJC_CLASS___ADLocationManager,  "prepareForAssistantEnablementInBackground");
  }

  else
  {
    id v6 = sub_1001EBD70(@"session_did_finish_timestamp");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v15 = 0LL;
    unsigned __int8 v9 = [v8 removeItemAtPath:v7 error:&v15];
    id v10 = v15;
    unint64_t v11 = v10;
    if ((v9 & 1) == 0 && (AFIsFileNotFoundError(v10) & 1) == 0)
    {
      id v12 = (os_log_s *)AFSiriLogContextUtility;
      if (os_log_type_enabled(AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315650;
        id v17 = "ADClearTimestampForFileName";
        __int16 v18 = 2112;
        id v19 = v7;
        __int16 v20 = 2112;
        __int16 v21 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Failed to remove timestamp at %@: %@",  buf,  0x20u);
      }
    }
  }

- (void)setDictationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v8 = "-[ADCommandCenter setDictationEnabled:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D8088;
  v5[3] = &unk_1004F5A90;
  BOOL v6 = v3;
  sub_1001D799C(v5);
}

- (void)setRemoraHostEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (AFSupportsRemoraHost(self, a2))
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v8 = "-[ADCommandCenter setRemoraHostEnabled:]";
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1001D7990;
    v5[3] = &unk_1004F5A90;
    BOOL v6 = v3;
    sub_1001D799C(v5);
  }

- (void)setLanguageCode:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D7900;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_setLanguageCode:(id)a3 outputVoice:(id)a4 isDefaultValue:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 length];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v15 = v14;
  if (v13
    || (BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v14 languageCode]),
        id v17 = [v16 length],
        v16,
        v17))
  {
    id v18 = v10;
    if (([v18 isEqualToString:@"ADLanguageCodeKeepSame"] & 1) == 0)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 bestSupportedLanguageCodeForLanguageCode:v18]);

      id v18 = (id)v20;
    }

    -[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:]( self,  "_setLanguageCode:outputVoice:isDefaultValue:",  v18,  v11,  v7);
    -[ADCommandCenter _clearQueuedLanguageCode](self, "_clearQueuedLanguageCode");
    -[ADCommandCenter _clearQueuedOutputVoice](self, "_clearQueuedOutputVoice");
    if (!v11)
    {
      [v15 setInProgressOutputVoice:0];
      [v15 synchronize];
    }
  }

  else
  {
    __int16 v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      id v23 = "-[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:withCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Ignoring attempt to set the language based on current system config, because we already have a language code saved.",  (uint8_t *)&v22,  0xCu);
    }
  }

  if (v12) {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
  }
}

- (void)setLanguageCode:(id)a3 outputVoice:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D78EC;
  v15[3] = &unk_1004FDA30;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_setLanguageCodeIfNeeded
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if ([v3 assistantIsEnabled])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _languageCodeWithFallback:0]);
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 _outputVoiceWithFallback:0]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 languageCode]);
    unsigned __int8 v7 = [v6 isEqualToString:v4];

    if (![v4 length] || (v7 & 1) == 0)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v3 languageCode]);
      if (!v8) {
        id v8 = AFDefaultLanguageCode;
      }
      id v9 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315394;
        id v11 = "-[ADCommandCenter _setLanguageCodeIfNeeded]";
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s No language code saved, but Assistant is enabled - saving language: %@",  (uint8_t *)&v10,  0x16u);
      }

      -[ADCommandCenter _setLanguageCode:outputVoice:isDefaultValue:withCompletion:]( self,  "_setLanguageCode:outputVoice:isDefaultValue:withCompletion:",  v8,  0LL,  1LL,  0LL);
    }
  }
}

- (void)setLanguageCodeIfNeeded
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D78E4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setOutputVoice:(id)a3
{
}

- (void)setOutputVoice:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D7850;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setQueuedLanguageCode:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v11 = "-[ADCommandCenter setQueuedLanguageCode:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D7804;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)_processQueuedLanguageCode
{
  if (self->_hasQueuedLanguageCode)
  {
    BOOL v3 = self->_queuedLanguageCode;
    queuedLanguageCode = self->_queuedLanguageCode;
    self->_queuedLanguageCode = 0LL;

    self->_hasQueuedLanguageCode = 0;
    dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[ADCommandCenter _processQueuedLanguageCode]";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v6, 0x16u);
    }

    -[ADCommandCenter _setLanguageCode:outputVoice:](self, "_setLanguageCode:outputVoice:", v3, 0LL);
  }

- (void)_clearQueuedLanguageCode
{
  if (self->_hasQueuedLanguageCode)
  {
    BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      queuedLanguageCode = self->_queuedLanguageCode;
      int v6 = 136315394;
      id v7 = "-[ADCommandCenter _clearQueuedLanguageCode]";
      __int16 v8 = 2112;
      id v9 = queuedLanguageCode;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Ignoring queued language code: %@",  (uint8_t *)&v6,  0x16u);
    }

    dispatch_queue_attr_t v5 = self->_queuedLanguageCode;
    self->_queuedLanguageCode = 0LL;

    self->_hasQueuedLanguageCode = 0;
  }

- (void)setQueuedLanguageCode:(id)a3 andQueuedOutputVoice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v16 = "-[ADCommandCenter setQueuedLanguageCode:andQueuedOutputVoice:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D77A0;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)_processQueuedLanguageCodeAndOutputVoice
{
  if (self->_hasQueuedLanguageCode)
  {
    if (self->_hasQueuedOutputVoice)
    {
      BOOL v3 = self->_queuedLanguageCode;
      queuedLanguageCode = self->_queuedLanguageCode;
      self->_queuedLanguageCode = 0LL;

      self->_hasQueuedLanguageCode = 0;
      dispatch_queue_attr_t v5 = self->_queuedOutputVoice;
      queuedOutputVoice = self->_queuedOutputVoice;
      self->_queuedOutputVoice = 0LL;

      self->_hasQueuedOutputVoice = 0;
      id v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315650;
        id v9 = "-[ADCommandCenter _processQueuedLanguageCodeAndOutputVoice]";
        __int16 v10 = 2112;
        id v11 = v3;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v8, 0x20u);
      }

      -[ADCommandCenter _setLanguageCode:outputVoice:](self, "_setLanguageCode:outputVoice:", v3, v5);
    }

    else
    {
      -[ADCommandCenter _processQueuedLanguageCode](self, "_processQueuedLanguageCode");
    }
  }

  else if (self->_hasQueuedOutputVoice)
  {
    -[ADCommandCenter _processQueuedOutputVoice](self, "_processQueuedOutputVoice");
  }

- (void)setQueuedOutputVoice:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v11 = "-[ADCommandCenter setQueuedOutputVoice:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D7754;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)_processQueuedOutputVoice
{
  if (self->_hasQueuedOutputVoice)
  {
    BOOL v3 = self->_queuedOutputVoice;
    queuedOutputVoice = self->_queuedOutputVoice;
    self->_queuedOutputVoice = 0LL;

    self->_hasQueuedOutputVoice = 0;
    dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[ADCommandCenter _processQueuedOutputVoice]";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v6, 0x16u);
    }

    -[ADCommandCenter _setLanguageCode:outputVoice:]( self,  "_setLanguageCode:outputVoice:",  @"ADLanguageCodeKeepSame",  v3);
  }

- (void)_clearQueuedOutputVoice
{
  if (self->_hasQueuedOutputVoice)
  {
    BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      queuedOutputVoice = self->_queuedOutputVoice;
      int v6 = 136315394;
      id v7 = "-[ADCommandCenter _clearQueuedOutputVoice]";
      __int16 v8 = 2112;
      id v9 = queuedOutputVoice;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Ignoring queued output voice: %@",  (uint8_t *)&v6,  0x16u);
    }

    dispatch_queue_attr_t v5 = self->_queuedOutputVoice;
    self->_queuedOutputVoice = 0LL;

    self->_hasQueuedOutputVoice = 0;
  }

- (void)setLockState:(BOOL)a3 showingLockScreen:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D7740;
  v5[3] = &unk_1004F5068;
  void v5[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(queue, v5);
}

- (void)setHeadphonesAuthenticated:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D7730;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setWatchAuthenticated:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D7720;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setCarDNDActive:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D7710;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setModesConfiguration:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D7704;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setConfiguration:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D76F4;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)endSessionForDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D76E8;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startRequest:(id)a3 withDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D76D8;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)handleExternalActivationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D76C8;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)handleRemoteSpeechRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D76B8;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)startSpeechRequestWithDelegate:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace(722470072LL, 0LL, 0LL, 0LL, 0LL);
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v16 = "-[ADCommandCenter startSpeechRequestWithDelegate:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  sub_1001D6DC0(v7);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D7674;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)startRecordingForPendingSpeechRequestForDelegate:(id)a3 withOptions:(id)a4 sessionUUID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  kdebug_trace(722470072LL, 0LL, 0LL, 0LL, 0LL);
  id v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v26 = "-[ADCommandCenter startRecordingForPendingSpeechRequestForDelegate:withOptions:sessionUUID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  sub_1001D6DC0(v11);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6EEC;
  block[3] = &unk_1004FCBB0;
  void block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(queue, block);
}

- (void)startSpeechPronunciationRequestWithDelegate:(id)a3 withOptions:(id)a4 pronunciationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D6DB0;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)startAcousticIDRequestWithDelegate:(id)a3 withOptions:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D6DA0;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)startSpeechRequestWithURL:(id)a3 isNarrowBand:(BOOL)a4 withDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001D6D88;
  v13[3] = &unk_1004FC250;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)cancelRequestForDelegate:(id)a3 reason:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001D6D78;
  v13[3] = &unk_1004FD510;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)rollbackRequestForDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D6D6C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startRecordingForPendingDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6D54;
  block[3] = &unk_1004F73F0;
  void block[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  dispatch_async(queue, block);
}

- (void)startDictationWithLanguageCode:(id)a3 options:(id)a4 speechOptions:(id)a5 sessionUUID:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001D6D40;
  v23[3] = &unk_1004F5640;
  void v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)startRecordedDictationWithLanguage:(id)a3 options:(id)a4 sessionUUID:(id)a5 narrowband:(BOOL)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001D6D28;
  v21[3] = &unk_1004F9258;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  BOOL v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

- (void)addRecordedSpeechSampleData:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6D18;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)startDictationWithURL:(id)a3 isNarrowBand:(BOOL)a4 language:(id)a5 options:(id)a6 sessionUUID:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6D00;
  block[3] = &unk_1004F5B20;
  void block[4] = self;
  id v26 = v14;
  BOOL v31 = a4;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(queue, block);
}

- (void)sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6CF0;
  block[3] = &unk_1004FDA80;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D6CE4;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopSpeechWithOptions:(id)a3 forDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6CD4;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)cancelSpeechForDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D6CC8;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateSpeechOptions:(id)a3 forDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6CB8;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D6BBC;
  v4[3] = &unk_1004FC4D0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)handleFailedStartPlaybackWithDestination:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6AF4;
  block[3] = &unk_1004FB930;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)prepareForStartPlaybackWithDestination:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001D6758;
  v13[3] = &unk_1004FBA38;
  id v15 = v9;
  int64_t v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(queue, v13);
}

- (void)sendSpeechCorrectionInfo:(id)a3 forCorrectionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6748;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6738;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)pauseRecognition
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6730;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D6720;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v32 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D66E8;
  block[3] = &unk_1004F5B70;
  void block[4] = self;
  id v34 = v32;
  id v35 = v16;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v39 = v20;
  id v40 = v21;
  id v41 = v22;
  id v24 = v22;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v16;
  id v31 = v32;
  dispatch_async(queue, block);
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001D66A0;
  v9[3] = &unk_1004FC4D0;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)handleGenericAceCommand:(id)a3 withDelegate:(id)a4 interruptOutstandingRequest:(BOOL)a5 targetReplyQueue:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001D6544;
  v21[3] = &unk_1004F5B98;
  void v21[4] = self;
  id v22 = v12;
  BOOL v26 = a5;
  id v24 = v14;
  id v25 = v15;
  id v23 = v13;
  id v17 = v14;
  id v18 = v15;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

- (void)clearContext
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D653C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)rollbackClearContext
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6534;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D6528;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setApplicationContext:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D651C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D650C;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D64FC;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D64EC;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setAlertContextDirty
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D64E4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)getCurrentContextSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D64A4;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getCrossDeviceContextWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D639C;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getDeviceContextsForKeys:(id)a3 forRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D630C;
  block[3] = &unk_1004F95C8;
  id v18 = v11;
  id v19 = self;
  BOOL v22 = a5;
  id v20 = v10;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(queue, block);
}

- (void)getOriginDeviceInfoForContextIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D601C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)prepareForPhoneCall
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D6014;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)telephonyRequestCompleted
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D600C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)requestBarrier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D6000;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)requestBarrierIfNecessary:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5FF4;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendMetricsToServerWithTimeout:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 ignoresMetricsSenderDisabledSetting:(BOOL)a7 scheduledActivity:(BOOL)a8 completion:(id)a9
{
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1001D5F84;
  v36[3] = &unk_1004FC838;
  id v16 = a9;
  id v37 = v16;
  id v17 = objc_retainBlock(v36);
  id v18 = (void (**)(void))v17;
  if (a7
    || (id v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences")),
        unsigned int v20 = [v19 metricsSenderDisabled],
        v19,
        !v20))
  {
    if ((AFHasUnlockedSinceBoot(v17) & 1) != 0)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
      unsigned int v24 = [v23 isDictationHIPAACompliant];

      if (!v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
        [v25 systemUptime];
        double v27 = v26 + a3;

        queue = (dispatch_queue_s *)self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1001D5FD4;
        block[3] = &unk_1004F5BE8;
        void block[4] = self;
        double v31 = v27;
        BOOL v32 = a4;
        BOOL v33 = a5;
        BOOL v34 = a6;
        BOOL v35 = a8;
        id v30 = v18;
        dispatch_async(queue, block);

        goto LABEL_13;
      }

      id v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v39 = "-[ADCommandCenter sendMetricsToServerWithTimeout:requiresUnlimitedPower:requiresActiveSession:purgesOversi"
              "zedStorage:ignoresMetricsSenderDisabledSetting:scheduledActivity:completion:]";
        BOOL v22 = "%s Skipped sending metrics to server because we have HIPAA On-Device Dictation enabled.";
        goto LABEL_11;
      }
    }

    else
    {
      id v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v39 = "-[ADCommandCenter sendMetricsToServerWithTimeout:requiresUnlimitedPower:requiresActiveSession:purgesOversi"
              "zedStorage:ignoresMetricsSenderDisabledSetting:scheduledActivity:completion:]";
        BOOL v22 = "%s Skipped sending metrics to server because the device has not been unlocked since boot.";
        goto LABEL_11;
      }
    }
  }

  else
  {
    id v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v39 = "-[ADCommandCenter sendMetricsToServerWithTimeout:requiresUnlimitedPower:requiresActiveSession:purgesOversize"
            "dStorage:ignoresMetricsSenderDisabledSetting:scheduledActivity:completion:]";
      BOOL v22 = "%s Skipped sending metrics to server because metrics sender is disabled.";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
    }
  }

  v18[2](v18);
LABEL_13:
}

- (void)fetchSupportedLanguagesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5F78;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchSupportedLanguages
{
}

- (void)fetchAccounts:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5F1C;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deleteAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5F10;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchActiveAccount:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5EB4;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)getAssistantIdentifier
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter getAssistantIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1001D5E48;
  id v11 = sub_1001D5E58;
  id v12 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5E60;
  v7[3] = &unk_1004FCDB0;
  void v7[4] = self;
  void v7[5] = &buf;
  dispatch_sync(queue, v7);
  id v5 = *(id *)(*((void *)&buf + 1) + 40LL);
  _Block_object_dispose(&buf, 8);

  return v5;
}

- (void)fetchActiveAccountIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5DEC;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setActiveAccountIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5DE0;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)destroyActiveAccount
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5DD8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)refreshAssistantValidation
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5DD0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)rescheduleValidationRefresh
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5DC8;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)fetchManagedStoreObjectForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5D68;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)setManagedStoreObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5D58;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)fetchContextForApplicationInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5C74;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)clientConnected:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D59B8;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)clientDisconnected:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D558C;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addService:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D554C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeService:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D550C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)reloadServiceForNotification:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D54B4;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)openApplicationWithBundleID:(id)a3 URL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D5480;
  v15[3] = &unk_1004FDA30;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)openURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5470;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)dismissAssistant
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5464;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)dismissAssistantWithReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D5458;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)willProcessAppLaunchWithBundleIdentifier:(id)a3
{
}

- (void)failedToLaunchAppWithBundleIdentifier:(id)a3
{
}

- (BOOL)isDeviceLocked
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D5444;
  v5[3] = &unk_1004FCDB0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDeviceShowingLockScreen
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D5430;
  v5[3] = &unk_1004FCDB0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInStarkMode
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D541C;
  v5[3] = &unk_1004FCDB0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)isInCarDNDModeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5408;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isInCarDNDMode
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D53F4;
  v5[3] = &unk_1004FCDB0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)isHeadGestureRecognitionAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D53E0;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isHeadGestureRecognitionAvailable
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D53CC;
  v5[3] = &unk_1004FCDB0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)isWatchAuthenticatedWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D53B8;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)areAnnouncementRequestsPermittedByPresentationWhileActiveWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D5388;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)handleCommand:(id)a3 withExecutionContextMatchingInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v21 = "-[ADCommandCenter handleCommand:withExecutionContextMatchingInfo:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s command = %@, executionInfoToMatch = %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1001D5288;
  v16[3] = &unk_1004FDA30;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(queue, v16);
}

- (void)handleCommand:(id)a3 completion:(id)a4
{
}

- (BOOL)isTimeoutSuspended
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001D5274;
  v5[3] = &unk_1004FCDB0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)extendRequestTimeoutBy:(double)a3 forRequestID:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v14 = "-[ADCommandCenter extendRequestTimeoutBy:forRequestID:]";
    __int16 v15 = 2048;
    double v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s durationInSeconds: %f, requestID: %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5178;
  block[3] = &unk_1004FDA80;
  void block[4] = self;
  id v11 = v6;
  double v12 = a3;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D5134;
  block[3] = &unk_1004FCB38;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)prepareForShutdown
{
  dispatch_group_t v3 = dispatch_group_create();
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D500C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  dispatch_group_t v8 = v3;
  id v5 = v3;
  dispatch_group_async(v5, queue, v7);
  dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL);
  dispatch_group_wait(v5, v6);
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D4FFC;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)handleAceCommand:(id)a3 afterCurrentRequest:(BOOL)a4 waitForResponse:(BOOL)a5 withDelegate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D4FE4;
  block[3] = &unk_1004F5C10;
  void block[4] = self;
  id v20 = v12;
  BOOL v23 = a4;
  BOOL v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, block);
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001D4FA4;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)cancelCurrentRequest
{
}

- (void)cancelCurrentRequestForReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D4F90;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)acquireShutdownAssertion
{
  dispatch_group_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v13 = "-[ADCommandCenter acquireShutdownAssertion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001D4F40;
  v10[3] = &unk_1004FD968;
  void v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(queue, v10);
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (void)releaseShutdownAssertion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v12 = "-[ADCommandCenter releaseShutdownAssertion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001D4F28;
  v8[3] = &unk_1004FD968;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)shutdownSessionIfIdle
{
  dispatch_group_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v7 = "-[ADCommandCenter shutdownSessionIfIdle]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D4F1C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)selectResultWithResultCandidate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v16 = "-[ADCommandCenter selectResultWithResultCandidate:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D4F0C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)handleSpeechServerEndpointIdentified:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v16 = "-[ADCommandCenter handleSpeechServerEndpointIdentified:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D4EFC;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)handleSpeechRecognized:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v16 = "-[ADCommandCenter handleSpeechRecognized:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D4E8C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void)notifySpeechDetectedIsUndirected
{
  dispatch_group_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter notifySpeechDetectedIsUndirected]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s MAF: Obtained undirected speech decision from SRD.",  (uint8_t *)&v4,  0xCu);
  }

  dispatch_async((dispatch_queue_t)self->_queue, &stru_1004F5C30);
}

- (void)dictationRequestDidRecognizeTokens:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D4BD0;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)dictationRequestDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D4924;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)dictationRequestDidRecognizeFinalResultCandidatePackage:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D461C;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)dictationRequestDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D4320;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)dictationRequestDidRecognizePackage:(id)a3 nluResult:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D38A0;
  v15[3] = &unk_1004FD470;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)dictationRequestDidCompleteRecognitionWithError:(id)a3 secureOfflineOnlyRecognition:(BOOL)a4 sessionUUID:(id)a5 statistics:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D3550;
  block[3] = &unk_1004F5690;
  void block[4] = self;
  id v18 = v12;
  BOOL v21 = a4;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(queue, block);
}

- (id)_createMuxStartAsrOnServerRequestWithSpeechRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SASMUXStartAsrOnServerRequest);
  objc_msgSend( v5,  "setTextToSpeechIsMuted:",  -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bargeInModes]);
  [v5 setBargeInModes:v6];

  objc_msgSend(v5, "setAutoPunctuationEnabled:", objc_msgSend(v4, "autoPunctuationEnabled"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientModelVersion]);

  [v5 setClientModelVersion:v7];
  return v5;
}

- (id)_startServerRequestWithSpeechRequest:(id)a3 recordingContext:(id)a4 recordingInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___SARDStartServerRequest);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionUUID]);

  -[SARDStartServerRequest setAceId:](v11, "setAceId:", v12);
  -[SARDStartServerRequest setTextRequest:](v11, "setTextRequest:", 0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _motionManager](self, "_motionManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 motionConfidence]);
  -[SARDStartServerRequest setMotionConfidence:](v11, "setMotionConfidence:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 motionActivity]);
  -[SARDStartServerRequest setMotionActivity:](v11, "setMotionActivity:", v15);

  -[SARDStartServerRequest setTextToSpeechIsMuted:]( v11,  "setTextToSpeechIsMuted:",  -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 voiceTriggerEventInfo]);
  -[SARDStartServerRequest setVoiceTriggerEventInfo:](v11, "setVoiceTriggerEventInfo:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _fetchComputedModeAndUpdateRequestDelegate]( self,  "_fetchComputedModeAndUpdateRequestDelegate"));
  -[SARDStartServerRequest setResponseMode:](v11, "setResponseMode:", v17);
  -[SARDStartServerRequest ad_setAFSpeechRequestOptions:]( v11,  "ad_setAFSpeechRequestOptions:",  self->_currentSpeechRequestOptions);
  -[SARDStartServerRequest ad_setCSSiriRecordingInfo:](v11, "ad_setCSSiriRecordingInfo:", v8);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 bargeInModes]);
  -[SARDStartServerRequest setBargeInModes:](v11, "setBargeInModes:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 durationSincePreviousTTSStart]);
  -[SARDStartServerRequest setDurationSincePreviousTTSStart:](v11, "setDurationSincePreviousTTSStart:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 durationSincePreviousTTSFinish]);
  -[SARDStartServerRequest setDurationSincePreviousTTSFinish:](v11, "setDurationSincePreviousTTSFinish:", v20);

  if (AFIsInternalInstall(v21))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  byte_1005780A0));
    -[SARDStartServerRequest setIsCarryDevice:](v11, "setIsCarryDevice:", v22);
  }

  return v11;
}

- (id)_createStartServerRequestWithStartRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SARDStartServerRequest);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___SASStartCorrectedSpeechRequest);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = objc_alloc_init(&OBJC_CLASS___SARDStartCorrectedServerRequest);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 interactionId]);
    [v8 setInteractionIdToBeCorrected:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 utterance]);
    [v8 setUtteranceToBeCorrected:v10];

    id v5 = (SARDStartServerRequest *)v8;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  -[SARDStartServerRequest setAceId:](v5, "setAceId:", v11);

  -[SARDStartServerRequest setTextRequest:](v5, "setTextRequest:", 1LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  -[SARDStartServerRequest setInputOrigin:](v5, "setInputOrigin:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  -[SARDStartServerRequest setOrigin:](v5, "setOrigin:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _motionManager](self, "_motionManager"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 motionConfidence]);
  -[SARDStartServerRequest setMotionConfidence:](v5, "setMotionConfidence:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 motionActivity]);
  -[SARDStartServerRequest setMotionActivity:](v5, "setMotionActivity:", v16);

  -[SARDStartServerRequest setTextToSpeechIsMuted:]( v5,  "setTextToSpeechIsMuted:",  -[ADCommandCenterClient adTextToSpeechIsMuted](self->_currentClient, "adTextToSpeechIsMuted"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 turnId]);
  -[SARDStartServerRequest setTurnId:](v5, "setTurnId:", v17);

  if (AFIsInternalInstall(-[SARDStartServerRequest setEyesFree:](v5, "setEyesFree:", [v4 eyesFree])))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  byte_1005780A0));
    -[SARDStartServerRequest setIsCarryDevice:](v5, "setIsCarryDevice:", v18);
  }

  return v5;
}

- (id)_startServerRequestWithStartRequest:(id)a3 requestInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    v82 = "-[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (!self->_siriUODSupported
    && ([v6 isMemberOfClass:objc_opt_class(SAStartRequest)] & 1) == 0)
  {
    __int16 v42 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      __int16 v43 = v42;
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedClassName]);
      *(_DWORD *)__int128 buf = 136315650;
      v82 = "-[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]";
      __int16 v83 = 2112;
      __int16 v84 = v44;
      __int16 v85 = 2112;
      id v86 = v45;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "%s UOD is not supported and request %@ is of type %@ so must be handled on server",  buf,  0x20u);
    }

    goto LABEL_23;
  }

  id v80 = (id)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _createStartServerRequestWithStartRequest:]( self,  "_createStartServerRequestWithStartRequest:",  v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 speechRequestOptions]);
  id v10 = [v9 activationEvent];

  if (!self->_siriUODSupported)
  {
    BOOL v24 = v10 == (id)17;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
    double v26 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _requestDispatcherSessionConfiguration]( self,  "_requestDispatcherSessionConfiguration"));
    double v27 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 utterance]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _createDefaultRequestContextData:](self, "_createDefaultRequestContextData:", v24));
    [v25 startUnderstandingOnServerTextRequestWithConfiguration:v26 requestId:v27 inputOrigin:v28 utterance:v29 requestContextData:v30];

    double v31 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    -[ADCommandCenter _emitDeviceDynamicContextForRequest:](self, "_emitDeviceDynamicContextForRequest:", v31);

    goto LABEL_20;
  }

  if (AFDeviceSupportsSiriMUX())
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___SAStartMultiUserTestRequest);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      BOOL v12 = v10 == (id)17;
      id v13 = v6;
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDispatcherService](self, "_requestDispatcherService"));
      id v74 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
      id v72 = (void *)objc_claimAutoreleasedReturnValue([v74 assistantIdentifier]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 aceId]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 inputOrigin]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 utterance]);
      id v79 = v7;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 expectedSelectedSharedUserId]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 voiceIDConfidenceScores]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _createDefaultRequestContextData:]( self,  "_createDefaultRequestContextData:",  v12));
      [v76 startMultiUserTestRequestWithAssistantId:v72 requestId:v14 inputOrigin:v15 utterance:v16 expectedSelectedSharedUserId:v17 voiceIdCon fidenceScores:v18 requestContextData:v19];

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 aceId]);
      -[ADCommandCenter _emitDeviceDynamicContextForRequest:](self, "_emitDeviceDynamicContextForRequest:", v20);

LABEL_19:
      id v7 = v79;
LABEL_20:
      if (v80)
      {
        id v56 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          id v57 = v7;
          id v58 = v56;
          __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedClassName]);
          id v60 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
          *(_DWORD *)__int128 buf = 136315650;
          v82 = "-[ADCommandCenter _startServerRequestWithStartRequest:requestInfo:]";
          __int16 v83 = 2112;
          __int16 v84 = v59;
          __int16 v85 = 2112;
          id v86 = v60;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEBUG,  "%s Replaced current request %@ %@ with an SARDStartServerRequest",  buf,  0x20u);

          id v7 = v57;
        }

        goto LABEL_24;
      }

- (id)_createDefaultRequestContextData:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _fetchComputedModeAndUpdateRequestDelegate]( self,  "_fetchComputedModeAndUpdateRequestDelegate"));
  id v6 = objc_alloc(&OBJC_CLASS___SMTRequestContextData);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001D33C0;
  v10[3] = &unk_1004F5D68;
  id v11 = v5;
  BOOL v12 = self;
  BOOL v13 = a3;
  id v7 = v5;
  id v8 = [v6 initWithBuilder:v10];

  return v8;
}

- (id)_requestDispatcherSessionConfiguration
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001D32A8;
  v3[3] = &unk_1004F5D90;
  v3[4] = self;
  return [[SMTRequestDispatcherSessionConfiguration alloc] initWithBuilder:v3];
}

- (id)_assetManager
{
  return self->_assetManager;
}

- (void)pushMyriadAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D3204;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)pushSCDAAdvertisementContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D3160;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)getSpeakerCapabilityForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001D311C;
  v11[3] = &unk_1004FD990;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)getAccessoryInfoForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001D30D8;
  v11[3] = &unk_1004FD990;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)announceNotificationHandlingStateUpdatedToState:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D2FB0;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D2FA0;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_getSiriOutputVolumeForAudioRoute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v17 = "-[ADCommandCenter _getSiriOutputVolumeForAudioRoute:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s routeuint64_t Name = %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 volumeServiceProvider]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001D2CA4;
  v13[3] = &unk_1004F5DB8;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 getVolumeServiceUsingBlock:v13];
}

- (void)setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D2C90;
  block[3] = &unk_1004F5DE0;
  float v19 = a3;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (void)_setSiriOutputVolume:(float)a3 forAudioRoute:(id)a4 operationType:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315906;
    id v23 = "-[ADCommandCenter _setSiriOutputVolume:forAudioRoute:operationType:completion:]";
    __int16 v24 = 2048;
    double v25 = a3;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2048;
    int64_t v29 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s volume = %f, routeuint64_t Name = %@, operationType = %ld",  buf,  0x2Au);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 volumeServiceProvider]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_1001D29A0;
  v17[3] = &unk_1004F5E08;
  float v21 = a3;
  id v19 = v11;
  int64_t v20 = a5;
  id v18 = v10;
  id v15 = v11;
  id v16 = v10;
  [v14 getVolumeServiceUsingBlock:v17];
}

- (void)accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D2990;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_accessRecordedAudioWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v16 = "-[ADCommandCenter _accessRecordedAudioWithIdentifier:completion:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s identifier = %@", buf, 0x16u);
    }

    if (!v6) {
      id v6 = self->_speechCapturingContextSessionUUID;
    }
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _speechCapturingContextForSessionUUID:]( self,  "_speechCapturingContextForSessionUUID:",  v6));
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v16 = "-[ADCommandCenter _accessRecordedAudioWithIdentifier:completion:]";
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s speechCapturingContext = %@",  buf,  0x16u);
      if (v9) {
        goto LABEL_8;
      }
    }

    else if (v9)
    {
LABEL_8:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1001D2800;
      v13[3] = &unk_1004F5E30;
      void v13[4] = self;
      id v14 = v7;
      -[NSString acquireRecordedAudioWithHandler:](v9, "acquireRecordedAudioWithHandler:", v13);

LABEL_13:
      goto LABEL_14;
    }

    id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  225LL,  @"Unable to locate recorded audio because there's no active speech request and speech request id is not specified."));
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v16 = "-[ADCommandCenter _accessRecordedAudioWithIdentifier:completion:]";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }

    (*((void (**)(id, void, NSString *))v7 + 2))(v7, 0LL, v11);

    goto LABEL_13;
  }

- (void)trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  queue = (dispatch_queue_s *)self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  void v17[2] = sub_1001D27E8;
  v17[3] = &unk_1004F5E58;
  void v17[4] = self;
  id v18 = v12;
  double v20 = a4;
  double v21 = a5;
  int64_t v22 = a6;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(queue, v17);
}

- (void)_trimRecordedAudioWithIdentifier:(id)a3 offset:(double)a4 duration:(double)a5 outputFileType:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  if (v13)
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136316162;
      int64_t v22 = "-[ADCommandCenter _trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:]";
      __int16 v23 = 2112;
      double v24 = *(double *)&v12;
      __int16 v25 = 2048;
      double v26 = a4;
      __int16 v27 = 2048;
      double v28 = a5;
      __int16 v29 = 2048;
      int64_t v30 = a6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s identifier = %@, offset = %f, duration = %f, outputFileType = %ld",  buf,  0x34u);
      id v14 = (os_log_s *)AFSiriLogContextDaemon;
    }

    double v15 = fmax(a4, 0.0);
    if (a5 <= 0.0) {
      a5 = 60.0;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      int64_t v22 = "-[ADCommandCenter _trimRecordedAudioWithIdentifier:offset:duration:outputFileType:completion:]";
      __int16 v23 = 2048;
      double v24 = v15;
      __int16 v25 = 2048;
      double v26 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s offset = %f, duration = %f (effective)",  buf,  0x20u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    void v16[2] = sub_1001D1504;
    v16[3] = &unk_1004F5E80;
    double v18 = v15;
    double v19 = a5;
    int64_t v20 = a6;
    id v17 = v13;
    -[ADCommandCenter _accessRecordedAudioWithIdentifier:completion:]( self,  "_accessRecordedAudioWithIdentifier:completion:",  v12,  v16);
  }
}

- (void)getRecordedAudioDirectoryPathsWithCompletion:(id)a3
{
  if (a3)
  {
    dispatch_group_t v3 = (void (**)(id, void *, void))a3;
    uint64_t v4 = CSSiriSpeechRecordingRecordedAudioDirectoryPath();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v9[0] = v5;
    uint64_t v6 = CSSiriSpeechRecordingTrimmedAudioDirectoryPath();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9[1] = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 2LL));

    v3[2](v3, v8, 0LL);
  }

- (id)_speechCapturingContext
{
  return -[ADCommandCenter _speechCapturingContextForSessionUUID:]( self,  "_speechCapturingContextForSessionUUID:",  self->_speechCapturingContextSessionUUID);
}

- (void)_setSpeechCapturingContext:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    double v15 = "-[ADCommandCenter _setSpeechCapturingContext:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s speechCapturingContext = %@",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
  [v6 resignCurrent];

  if (v4)
  {
    id v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 sessionUUID]);
    speechCapturingContextsBySessionUUID = self->_speechCapturingContextsBySessionUUID;
    if (!speechCapturingContextsBySessionUUID)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v10 = self->_speechCapturingContextsBySessionUUID;
      self->_speechCapturingContextsBySessionUUID = v9;

      speechCapturingContextsBySessionUUID = self->_speechCapturingContextsBySessionUUID;
    }

    -[NSMutableDictionary setObject:forKey:](speechCapturingContextsBySessionUUID, "setObject:forKey:", v4, v7);
    id v11 = (NSString *)-[NSString copy](v7, "copy");
    speechCapturingContextSessionUUID = self->_speechCapturingContextSessionUUID;
    self->_speechCapturingContextSessionUUID = v11;
  }

  else
  {
    id v7 = self->_speechCapturingContextSessionUUID;
    self->_speechCapturingContextSessionUUID = 0LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechCapturingContext](self, "_speechCapturingContext"));
  [v13 becomeCurrent];
}

- (id)_speechCapturingContextForSessionUUID:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_speechCapturingContextsBySessionUUID,  "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (void)_removeAllSpeechCapturingContexts
{
  dispatch_group_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    int v14 = "-[ADCommandCenter _removeAllSpeechCapturingContexts]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }

  -[ADCommandCenter _setSpeechCapturingContext:](self, "_setSpeechCapturingContext:", 0LL);
  speechCapturingContextsBySessionUUID = self->_speechCapturingContextsBySessionUUID;
  self->_speechCapturingContextsBySessionUUID = 0LL;

  speechCapturingContextSessionUUID = self->_speechCapturingContextSessionUUID;
  self->_speechCapturingContextSessionUUID = 0LL;

  if (!AFIsInternalInstall(v6) || (_AFPreferencesKeepRecorededAudioFiles() & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v8 = CSSiriSpeechRecordingTrimmedAudioDirectoryPath();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 removeItemAtPath:v9 error:0];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v11 = CSSiriSpeechRecordingRecordedAudioDirectoryPath();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v10 removeItemAtPath:v12 error:0];
  }

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001D14F4;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_broadcastCommand:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int16 v16 = self;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allServices]);

  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___ADUIService);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 groupIdentifier]);
          int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
          double v15 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _rootExecutionContextForRequestID:]( v16,  "_rootExecutionContextForRequestID:",  v14));
          [v11 handleCommand:v4 forDomain:v13 executionContext:v15 reply:0];
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }
}

- (void)_listInstalledServicesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001D11C8;
  block[3] = &unk_1004FD990;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)_bargeInModes
{
  dispatch_group_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 = -[AFSpeechRequestOptions bargeInOptions](self->_currentSpeechRequestOptions, "bargeInOptions");
  if (!v4) {
    return v3;
  }
  char v5 = (char)v4;
  if ((v4 & 4) != 0)
  {
    -[NSMutableArray addObject:](v3, "addObject:", SASBargeInModeOVER_SIRI_OUTPUTValue);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
LABEL_10:
      -[NSMutableArray addObject:](v3, "addObject:", SASBargeInModeOVER_TIMERValue);
      if ((v5 & 8) == 0) {
        return v3;
      }
      goto LABEL_6;
    }
  }

  else if ((v4 & 1) == 0)
  {
    goto LABEL_4;
  }

  -[NSMutableArray addObject:](v3, "addObject:", SASBargeInModeOVER_MEDIAValue);
  if ((v5 & 0x10) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v5 & 8) != 0) {
LABEL_6:
  }
    -[NSMutableArray addObject:](v3, "addObject:", SASBargeInModeOVER_ALARMValue);
  return v3;
}

- (id)_approximatePreviousTTSInterval:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue( -[AFSpeechRequestOptions speechSynthesisRecord]( self->_currentSpeechRequestOptions,  "speechSynthesisRecord"));
  id v6 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds([v5 beginTimestamp]);
  uint64_t v8 = AFMachAbsoluteTimeGetMilliseconds([v6 endTimestamp]);
  id v9 = -[AFSpeechRequestOptions activationEventMachAbsoluteTime]( self->_currentSpeechRequestOptions,  "activationEventMachAbsoluteTime");
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (v9)
  {
    uint64_t v11 = AFMachAbsoluteTimeGetMilliseconds( -[AFSpeechRequestOptions activationEventMachAbsoluteTime]( currentSpeechRequestOptions,  "activationEventMachAbsoluteTime"));
    if (!v11) {
      goto LABEL_17;
    }
  }

  else
  {
    -[AFSpeechRequestOptions activationEventTime](currentSpeechRequestOptions, "activationEventTime");
    if (v12 <= 0.0) {
      goto LABEL_17;
    }
    -[AFSpeechRequestOptions activationEventTime](self->_currentSpeechRequestOptions, "activationEventTime");
    uint64_t v11 = (uint64_t)(v13 * 1000.0);
    if (!v11) {
      goto LABEL_17;
    }
  }

  if (Milliseconds < 1)
  {
    uint64_t v14 = 0LL;
    goto LABEL_11;
  }

  uint64_t v14 = v11 - Milliseconds;
  if (v4)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11 - Milliseconds));
    [v4 setDurationSincePreviousTTSStart:v15];

LABEL_11:
    if (v8 <= 0) {
      goto LABEL_17;
    }
    if (v4)
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11 - v8));
      [v4 setDurationSincePreviousTTSFinish:v16];
    }

    if (Milliseconds < 1) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  if (v8 <= 0)
  {
LABEL_17:
    __int128 v19 = 0LL;
    goto LABEL_18;
  }

- (unsigned)_sharedVoiceAudioSessionID
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager sharedManager](&OBJC_CLASS___ADSpeechManager, "sharedManager"));
  dispatch_group_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 audioSessionController]);
  unsigned int v4 = [v3 getAudioSessionID];

  return v4;
}

- (id)_fetchComputedModeAndUpdateRequestDelegate
{
  dispatch_group_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADResponseModeProvider fetchCurrentMode](self->_responseModeProvider, "fetchCurrentMode"));
  unint64_t requestDelegate = self->_requestDelegate;
  if (requestDelegate && (objc_opt_respondsToSelector(requestDelegate, "adRequestDidUpdateResponseMode:") & 1) != 0) {
    -[ADCommandCenterRequestDelegate adRequestDidUpdateResponseMode:]( self->_requestDelegate,  "adRequestDidUpdateResponseMode:",  v3);
  }
  return v3;
}

- (BOOL)_isClientBoundCommand:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMapTable objectForKey:](self->_clientBoundCommandLookup, "objectForKey:", objc_opt_class(v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v6)
  {
    LOBYTE(v8) = [v6 BOOLValue];
  }

  else
  {
    id v8 = [v4 conformsToProtocol:&OBJC_PROTOCOL___SAClientBoundCommand];
    clientBoundCommandLookup = self->_clientBoundCommandLookup;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[NSMapTable setObject:forKey:](clientBoundCommandLookup, "setObject:forKey:", v10, objc_opt_class(v4));
  }

  return (char)v8;
}

- (BOOL)_isServerBoundCommand:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMapTable objectForKey:](self->_serverBoundCommandLookup, "objectForKey:", objc_opt_class(v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v6)
  {
    LOBYTE(v8) = [v6 BOOLValue];
  }

  else
  {
    id v8 = [v4 conformsToProtocol:&OBJC_PROTOCOL___SAServerBoundCommand];
    serverBoundCommandLookup = self->_serverBoundCommandLookup;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    -[NSMapTable setObject:forKey:](serverBoundCommandLookup, "setObject:forKey:", v10, objc_opt_class(v4));
  }

  return (char)v8;
}

- (OS_dispatch_queue)_queue
{
  return self->_queue;
}

- (ADCommandCenterCurrentRequest)_currentRequest
{
  return self->_currentRequest;
}

- (SABaseCommand)_lastRequest
{
  return self->_lastRequest;
}

- (void)_setLastRequest:(id)a3
{
}

- (ADCommandCenterClient)_currentClient
{
  return self->_currentClient;
}

- (ADCommandCenterRequestDelegate)_requestDelegate
{
  return self->_requestDelegate;
}

- (ADCommandCenterSpeechDelegate)_speechDelegate
{
  return self->_speechDelegate;
}

- (ADCommandCenterSpeechDelegate)_speechFileDelegate
{
  return self->_speechFileDelegate;
}

- (BOOL)_speechDelegateHasReceivedPartialResult
{
  return self->_speechDelegateHasReceivedPartialResult;
}

- (BOOL)_deviceIsLocked
{
  return self->_deviceIsLocked;
}

- (BOOL)_isInStarkMode
{
  return self->_isInStarkMode;
}

- (BOOL)_isInCarDNDMode
{
  return self->_isInCarDNDMode;
}

- (BOOL)_isHeadGestureRecognitionAvailable
{
  return self->_isHeadGestureRecognitionAvailable;
}

- (BOOL)_isWatchAuthenticated
{
  return self->_isWatchAuthenticated;
}

- (BOOL)_isTimeoutSuspended
{
  return self->_isTimeoutSuspended;
}

- (NSString)_selectedSharedUserID
{
  return self->_selectedSharedUserID;
}

- (AFInstanceContext)_instanceContext
{
  return self->_instanceContext;
}

- (BOOL)_siriUODSupported
{
  return self->_siriUODSupported;
}

- (void)_setSiriUODSupported:(BOOL)a3
{
  self->_siriUODSupported = a3;
}

- (BOOL)_siriFullUODSupported
{
  return self->_siriFullUODSupported;
}

- (void)_setSiriFullUODSupported:(BOOL)a3
{
  self->_BOOL siriFullUODSupported = a3;
}

- (BOOL)_siriHybridUODSupported
{
  return self->_siriHybridUODSupported;
}

- (void)_setSiriHybridUODSupported:(BOOL)a3
{
  self->_BOOL siriHybridUODSupported = a3;
}

- (BOOL)_siriSAESupported
{
  return self->_siriSAESupported;
}

- (void)_setSiriSAESupported:(BOOL)a3
{
  self->_int siriSAESupported = a3;
}

- (BOOL)_assetsCheckRan
{
  return self->_assetsCheckRan;
}

- (AFBridgeConnectionListener)_uiBridgeServiceListener
{
  return self->_uiBridgeServiceListener;
}

- (void)set_uiBridgeServiceListener:(id)a3
{
}

- (ADSyncControllerService)_syncControllerService
{
  return self->_syncControllerService;
}

- (void)set_syncControllerService:(id)a3
{
}

- (void)_setRequestDispatcherService:(id)a3
{
}

- (NSMapTable)_serverBoundCommandLookup
{
  return self->_serverBoundCommandLookup;
}

- (void)set_serverBoundCommandLookup:(id)a3
{
}

- (NSMapTable)_clientBoundCommandLookup
{
  return self->_clientBoundCommandLookup;
}

- (void)set_clientBoundCommandLookup:(id)a3
{
}

- (ADResponseModeProvider)_responseModeProvider
{
  return self->_responseModeProvider;
}

- (void)_setResponseModeProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedCommandCenter
{
  if (qword_100578040 != -1) {
    dispatch_once(&qword_100578040, &stru_1004F5040);
  }
  return (id)qword_100578038;
}

+ (id)sharedQueue
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedCommandCenter]);
  dispatch_group_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _queue]);

  return v3;
}

+ (int64_t)_fetchBluetoothState
{
  id v7 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[CBController controllerInfoAndReturnError:]( &OBJC_CLASS___CBController,  "controllerInfoAndReturnError:",  &v7));
  id v3 = v7;
  if (v3)
  {
    id v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v9 = "+[ADCommandCenter _fetchBluetoothState]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%s Failed to fetch bluetooth controller info when logging bluetooth status: %@",  buf,  0x16u);
    }
  }

  id v5 = [v2 bluetoothState];

  return (int64_t)v5;
}

+ (int)_orchBluetoothStateEnumFromBluetoothState:(int64_t)a3
{
  else {
    return dword_1003C9EB8[a3 - 1];
  }
}

- (id)_acousticIDHelper
{
  acousticIDHelper = self->_acousticIDHelper;
  if (!acousticIDHelper)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADAcousticIDHelper);
    id v5 = self->_acousticIDHelper;
    self->_acousticIDHelper = v4;

    -[ADAcousticIDHelper setDelegate:](self->_acousticIDHelper, "setDelegate:", self);
    acousticIDHelper = self->_acousticIDHelper;
  }

  return acousticIDHelper;
}

- (void)_acousticId_startSessionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _acousticIDHelper](self, "_acousticIDHelper"));
  [v5 startNewAcousticIDSessionWithRequestId:v4 refId:0];
}

- (void)_acousticId_startSessionForSpeechRequest:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _acousticIDHelper](self, "_acousticIDHelper"));
  [v5 startNewAcousticIDSessionWithRequestId:0 refId:v4];
}

- (void)_acousticId_handleFingerprint:(id)a3 duration:(double)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _acousticIDHelper](self, "_acousticIDHelper"));
  if ([v7 shouldSendFingerprintForDuration:a4])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 searchCommandForFingerprintData:v6 withDuration:a4]);
    -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v8);
  }

  else
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADCommandCenter(AcousticId) _acousticId_handleFingerprint:duration:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Not sending SAAISearch because aidHelper said not to",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)_acousticId_musicWasDetected
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADAcousticIDHelper currentSession](self->_acousticIDHelper, "currentSession"));

  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 context]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 aceId]);
    -[ADCommandCenter _acousticId_startSessionForSpeechRequest:](self, "_acousticId_startSessionForSpeechRequest:", v6);

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentClient](self, "_currentClient"));
    [v7 adMusicWasDetected];
  }

- (BOOL)_acousticId_hasCommandForRefId:(id)a3
{
  return -[ADAcousticIDHelper hasRelatedCommandForRefId:](self->_acousticIDHelper, "hasRelatedCommandForRefId:", a3);
}

- (void)_acousticId_speechCaptureCompleted
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[ADAcousticIDHelper currentSession](self->_acousticIDHelper, "currentSession"));
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = -[ADAcousticIDHelper sessionIsComplete](self->_acousticIDHelper, "sessionIsComplete");

    if ((v5 & 1) == 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADAcousticIDHelper cancelSessionCommand](self->_acousticIDHelper, "cancelSessionCommand"));
      -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v6);

      -[ADAcousticIDHelper failCurrentSession](self->_acousticIDHelper, "failCurrentSession");
    }
  }

- (void)_acousticId_commandFailed:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _acousticIDHelper](self, "_acousticIDHelper"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v7 refId]);
  unsigned int v6 = [v4 hasRelatedCommandForRefId:v5];

  if (v6) {
    [v4 handleCommandFailed:v7];
  }
}

- (void)_acousticId_sessionFailed
{
}

- (void)_acousticId_reset
{
}

- (void)_acousticId_clearPartialResultTimer
{
  partialResultAcousticIDTimer = self->_partialResultAcousticIDTimer;
  if (partialResultAcousticIDTimer)
  {
    dispatch_source_cancel((dispatch_source_t)partialResultAcousticIDTimer);
    id v4 = self->_partialResultAcousticIDTimer;
    self->_partialResultAcousticIDTimer = 0LL;
  }

- (void)_saAIRequestSearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    double v13 = "-[ADCommandCenter(AcousticId) _saAIRequestSearch:completion:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentClient](self, "_currentClient"));
  [v9 adAcousticIDRequestWillStart];
  int v10 = -[AFSpeechRequestOptions initWithActivationEvent:]( objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions),  "initWithActivationEvent:",  5LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 acousticIdSearchSessionId]);
  -[ADCommandCenter _startAcousticIDRequestWithDelegate:withOptions:context:]( self,  "_startAcousticIDRequestWithDelegate:withOptions:context:",  v9,  v10,  v11);

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_saAISearchCompleted:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int128 v20 = "-[ADCommandCenter(AcousticId) _saAISearchCompleted:completion:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v9 setFingerprintWasRecognized];

  if (_AFPreferencesAcousticIDAutoEndpoint()
    && !-[ADCommandCenter _speechDelegateHasReceivedPartialResult](self, "_speechDelegateHasReceivedPartialResult")
    && !self->_partialResultAcousticIDTimer)
  {
    int v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int128 v20 = "-[ADCommandCenter(AcousticId) _saAISearchCompleted:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Scheduling partial result acoustic ID timer",  buf,  0xCu);
    }

    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    int v12 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v11);
    partialResultAcousticIDTimer = self->_partialResultAcousticIDTimer;
    self->_partialResultAcousticIDTimer = v12;

    __int16 v14 = self->_partialResultAcousticIDTimer;
    dispatch_time_t v15 = dispatch_time(0LL, 1000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    __int16 v16 = self->_partialResultAcousticIDTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001FDD54;
    handler[3] = &unk_1004FD940;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v16, handler);
    dispatch_resume((dispatch_object_t)self->_partialResultAcousticIDTimer);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _acousticIDHelper](self, "_acousticIDHelper"));
  [v17 handleSearchCompleted:v6];

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)_saAIRetrySearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[ADCommandCenter(AcousticId) _saAIRetrySearch:completion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _acousticIDHelper](self, "_acousticIDHelper"));
  [v9 handleRetrySearch:v6];

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)acousticIDHelperDidStartSession:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADCommandCenter(AcousticId) acousticIDHelperDidStartSession:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSession]);
  -[ADCommandCenter _sendCommandToServer:](self, "_sendCommandToServer:", v6);
}

- (void)acousticIDHelper:(id)a3 didCompleteSessionSuccessfully:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[ADCommandCenter(AcousticId) acousticIDHelper:didCompleteSessionSuccessfully:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v10, 0x12u);
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechManager](self, "_speechManager"));
  [v7 stopFingerprintingForSuccess:v4];
  id v8 = -[AFSpeechRequestOptions initWithActivationEvent:]( objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions),  "initWithActivationEvent:",  5LL);
  -[AFSpeechRequestOptions setSuppressStopAlert:](v8, "setSuppressStopAlert:", v4);
  [v7 stopSpeechCaptureIfFingerprintingOnlyWithOptions:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentClient](self, "_currentClient"));
  [v9 adAcousticIDRequestDidFinishSuccessfully:v4];
}

- (void)getSharedDataForPeer:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100248ED0;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)_sharedDataService
{
  sharedDataService = self->_sharedDataService;
  if (!sharedDataService)
  {
    id v4 = -[ADSharedDataService initWithDelegate:]( objc_alloc(&OBJC_CLASS___ADSharedDataService),  "initWithDelegate:",  self);
    unsigned __int8 v5 = self->_sharedDataService;
    self->_sharedDataService = v4;

    sharedDataService = self->_sharedDataService;
  }

  return sharedDataService;
}

- (void)_updateSharedDataWithPairedPeerData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v58 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataWithPairedPeerData:]";
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
    uint64_t v8 = AFSupportsPairedDevice(v6, v7);
    if ((_DWORD)v8 && (AFIsNano(v8) & 1) == 0)
    {
      sharedDataService = self->_sharedDataService;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_10024B670;
      v54[3] = &unk_1004F77D0;
      void v54[4] = self;
      id v55 = v6;
      id v56 = v4;
      -[ADSharedDataService deviceIsNearby:](sharedDataService, "deviceIsNearby:", v54);

LABEL_53:
      goto LABEL_54;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 peerHostname]);
    *(void *)&__int128 v53 = objc_claimAutoreleasedReturnValue([v4 hostname]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantId]);
    [v6 setPeerAssistantIdentifier:v10];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 loggingAssistantId]);
    [v6 setPeerLoggingAssistantIdentifier:v11];

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 speechId]);
    [v6 setPeerSpeechIdentifier:v12];

    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v4 hostname]);
    [v6 setPeerHostname:v13];

    [v6 save];
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 outputVoice]);
    -[ADCommandCenter _setLanguageCode:outputVoice:](self, "_setLanguageCode:outputVoice:", v14, v15);

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedUserId]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v4 loggingSharedUserId]);
    [v16 setSharedUserIdentifier:v17 loggingSharedUserIdentifier:v18];

    uint64_t v19 = _AFSupportPreferencesBoolValueForKey(kAFAssistantEnabledKey);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    uint64_t v21 = _AFSupportPreferencesBoolValueForKey(kAFDictationEnabledKey);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    uint64_t v25 = _AFPreferencesSiriDataSharingOptInStatus(v23, v24);
    double v26 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v27 = [v26 assistantIsEnabled];
    unsigned int v28 = [v26 dictationIsEnabled];
    if (v20)
    {
      unsigned int v29 = 0;
    }

    else
    {
      objc_msgSend(v26, "_setAssistantIsEnabledLocal:", objc_msgSend(v4, "siriEnabled"));
      unsigned int v29 = v27 ^ [v4 siriEnabled];
    }

    *((void *)&v53 + 1) = v9;
    if (v22)
    {
      int v30 = 0;
      if (v25) {
        goto LABEL_31;
      }
    }

    else
    {
      else {
        uint64_t v31 = (uint64_t)[v4 siriEnabled];
      }
      [v26 _setDictationIsEnabledLocal:v31];
      int v30 = v28 ^ v31;
      if (v25)
      {
LABEL_31:
        int v40 = _AFPreferencesCloudSyncEnabled();
        id v41 = [v4 cloudSyncEnabled];
        unsigned int v42 = v40 ^ v41;
        if ((v40 ^ v41) == 1)
        {
          _AFPreferencesEnableCloudSync();
          __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          _AFPreferencesSetCloudSyncEnabledModificationDate();
        }

        if (AFIsNano(v41))
        {
          int ShouldCensorSpeechInternal = _AFPreferencesShouldCensorSpeechInternal();
          if (ShouldCensorSpeechInternal != [v4 shouldCensorSpeech])
          {
            uint64_t v45 = _AFPreferencesSetShouldCensorSpeechInternal();
            AFBackedUpPreferencesSynchronize(v45);
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
            [v46 postNotificationName:@"ADShouldCensorSpeechDidChangeNotification" object:0];
          }
        }

        [v26 synchronize];
        if ((v29 | v30) == 1)
        {
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v47 postNotificationName:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];

          if (!v42)
          {
LABEL_38:
            if (!v29) {
              goto LABEL_45;
            }
            goto LABEL_42;
          }
        }

        else if (!v42)
        {
          goto LABEL_38;
        }

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification( DarwinNotifyCenter,  kAFCloudSyncPreferenceDidChangeDarwinNotification,  0LL,  0LL,  1u);
        if (!v29) {
          goto LABEL_45;
        }
LABEL_42:
        if (([v26 assistantIsEnabled] & 1) == 0
          && ((v30 ^ 1) & 1) == 0
          && ([v26 dictationIsEnabled] & 1) == 0)
        {
          id v52 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
          [v52 destroyActiveAccount];
          id v49 = (void *)*((void *)&v53 + 1);
          id v50 = (void *)v53;
          goto LABEL_51;
        }

- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 completion:(id)a4
{
}

- (void)updateSharedDataFromPeerUseCache:(BOOL)a3 allowCloudMessaging:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int128 v18 = "-[ADCommandCenter(SharedDataClient) updateSharedDataFromPeerUseCache:allowCloudMessaging:completion:]";
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10024B4C8;
  v12[3] = &unk_1004F7820;
  BOOL v15 = a3;
  BOOL v16 = v5;
  void v12[4] = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  id v14 = v8;
  id v10 = v8;
  id v11 = (dispatch_queue_s *)v13;
  dispatch_async(v11, v12);
}

- (void)sharedDataConnection:(id)a3 didUpdateSharedData:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v12 = "-[ADCommandCenter(SharedDataClient) sharedDataConnection:didUpdateSharedData:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_10024B4BC;
  v9[3] = &unk_1004FD968;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)listenForSharedDataFromCloud
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v12 = "-[ADCommandCenter(SharedDataClient) listenForSharedDataFromCloud]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
  id v5 = [v4 setSharedDataRequestObserver:&stru_1004F7860 withHandler:&unk_100578260];
  uint64_t v7 = AFIsHorseman(v5, v6);
  if ((v7 & 1) != 0 || AFIsATV(v7, v8))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10024B3B0;
    v10[3] = &unk_1004F7888;
    void v10[4] = self;
    [v4 setSharedDataObserver:v10 withHandle:&unk_100578268];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10024B3C0,  kAFCloudSyncPreferenceDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDrop);
  }
}

- (void)_cloudSyncPreferenceDidChange
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  dispatch_async(v2, &stru_1004F78A8);
}

- (void)updateSharedDataFromCompanion
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v7 = "-[ADCommandCenter(SharedDataClient) updateSharedDataFromCompanion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024B034;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_resetPeerAccountSettingsWithSharedData:(id)a3
{
  id v4 = (NSSet *)a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v52 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
    __int16 v53 = 2112;
    id v54 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _account](self, "_account"));
  uint64_t v8 = (NSSet *)objc_claimAutoreleasedReturnValue([v7 peerAssistantIdentifier]);
  uint64_t v9 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet assistantId](v4, "assistantId"));
  id v10 = v9;
  if (v8 == v9 || (-[NSSet isEqualToString:](v9, "isEqualToString:", v8) & 1) != 0)
  {
    int v11 = 0;
  }

  else
  {
    __int16 v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v52 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v53 = 2112;
      id v54 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Updating peer assistant id: %@", buf, 0x16u);
    }

    [v7 setPeerAssistantIdentifier:v10];
    int v11 = 1;
  }

  id v13 = (NSSet *)objc_claimAutoreleasedReturnValue([v7 peerSpeechIdentifier]);

  id v14 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet speechId](v4, "speechId"));
  if (v13 != v14 && (-[NSSet isEqualToString:](v14, "isEqualToString:", v13) & 1) == 0)
  {
    BOOL v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v52 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v53 = 2112;
      id v54 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Updating peer speech id: %@", buf, 0x16u);
    }

    [v7 setPeerSpeechIdentifier:v14];
    int v11 = 1;
  }

  BOOL v16 = (NSSet *)objc_claimAutoreleasedReturnValue([v7 peerUserAgentString]);

  uint64_t v17 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet userAgent](v4, "userAgent"));
  if (v16 != v17 && (-[NSSet isEqualToString:](v17, "isEqualToString:", v16) & 1) == 0)
  {
    __int128 v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v52 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v53 = 2112;
      id v54 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Updating peer user agent string: \"%@\"",  buf,  0x16u);
    }

    [v7 setPeerUserAgentString:v17];
    int v11 = 1;
  }

  __int16 v19 = (NSSet *)objc_claimAutoreleasedReturnValue([v7 peerLanguageCode]);

  BOOL v20 = (NSSet *)objc_claimAutoreleasedReturnValue(-[NSSet languageCode](v4, "languageCode"));
  if (v19 != v20 && (-[NSSet isEqualToString:](v20, "isEqualToString:", v19) & 1) == 0)
  {
    uint64_t v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v52 = "-[ADCommandCenter(SharedDataClient) _resetPeerAccountSettingsWithSharedData:]";
      __int16 v53 = 2112;
      id v54 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Updating peer language code: %@", buf, 0x16u);
    }

    [v7 setPeerLanguageCode:v20];
    int v11 = 1;
  }

  unsigned int v22 = [v7 peerSiriEnabled];
  id v23 = -[NSSet siriEnabled](v4, "siriEnabled");
  if (v22 != (_DWORD)v23)
  {
    [v7 setPeerSiriEnabled:v23];
    goto LABEL_27;
  }

  if (v11)
  {
LABEL_27:
    id v23 = [v7 save];
    int v25 = 1;
    if (!v4) {
      goto LABEL_28;
    }
    goto LABEL_31;
  }

  int v25 = 0;
  if (!v4)
  {
LABEL_28:
    if (!v25) {
      goto LABEL_52;
    }
    goto LABEL_49;
  }

- (void)updateSharedDataFromCloudPeers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    BOOL v16 = "-[ADCommandCenter(SharedDataClient) updateSharedDataFromCloudPeers:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024B024;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_updateSharedDataFromPeers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v17 = "-[ADCommandCenter(SharedDataClient) _updateSharedDataFromPeers:completion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s peers: %@", buf, 0x16u);
  }

  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024ADB4;
  block[3] = &unk_1004FD9E0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)updateSharedDataWithCloudData:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    id v15 = "-[ADCommandCenter(SharedDataClient) updateSharedDataWithCloudData:fromPeer:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }

  if (v6)
  {
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10024AB94;
    block[3] = &unk_1004FD4C0;
    id v11 = v6;
    id v12 = v7;
    id v13 = self;
    dispatch_async(v9, block);
  }
}

- (void)sendGizmoData
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v7 = "-[ADCommandCenter(SharedDataClient) sendGizmoData]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  sharedDataService = self->_sharedDataService;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10024AAAC;
  v5[3] = &unk_1004F78D0;
  void v5[4] = self;
  -[ADSharedDataService deviceIsNearby:](sharedDataService, "deviceIsNearby:", v5);
}

- (void)_runMaintenanceForServices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(ServiceMaintenance) _runMaintenanceForServices:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  serviceMaintenanceGroup = self->_serviceMaintenanceGroup;
  if (!serviceMaintenanceGroup)
  {
    id v10 = (OS_dispatch_group *)dispatch_group_create();
    id v11 = self->_serviceMaintenanceGroup;
    self->_serviceMaintenanceGroup = v10;

    serviceMaintenanceGroup = self->_serviceMaintenanceGroup;
  }

  id v12 = serviceMaintenanceGroup;
  id v13 = [v6 count];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v14 logEventWithType:1204 context:0];

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3042000000LL;
  uint64_t v32 = sub_1002648AC;
  uint64_t v33 = sub_1002648B8;
  id v34 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1002648C0;
  v24[3] = &unk_1004F84B0;
  id v29 = v13;
  id v15 = v12;
  int v25 = v15;
  p___int128 buf = &buf;
  id v16 = v6;
  id v26 = v16;
  unsigned int v27 = self;
  id v17 = [v24 copy];
  objc_storeWeak((id *)(*((void *)&buf + 1) + 40LL), v17);
  (*((void (**)(id, void))v17 + 2))(v17, 0LL);
  __int16 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100264BA0;
  block[3] = &unk_1004FBFE8;
  id v22 = v17;
  id v23 = v7;
  id v19 = v7;
  id v20 = v17;
  dispatch_group_notify(v15, v18, block);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&v34);
}

- (void)runServiceMaintenanceWithCompletion:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v8 = "-[ADCommandCenter(ServiceMaintenance) runServiceMaintenanceWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100264854;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)runBootTimeServiceMaintenanceWithCompletion:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v8 = "-[ADCommandCenter(ServiceMaintenance) runBootTimeServiceMaintenanceWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002647FC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (id)dumpAssistantState
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _dumpAssistantState](self, "_dumpAssistantState"));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v4);
  if (-[ADCommandCenter _shouldDumpSiriOnDeviceAnalyticsBiomeStreams]( self,  "_shouldDumpSiriOnDeviceAnalyticsBiomeStreams"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _dumpSiriOnDeviceAnalyticsBiomeStreams]( self,  "_dumpSiriOnDeviceAnalyticsBiomeStreams"));
    -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v5);
  }

  return v3;
}

- (id)_dumpAssistantState
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Dumping assistant state",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000LL;
  unsigned int v27 = sub_10026452C;
  unsigned int v28 = sub_10026453C;
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = objc_alloc(&OBJC_CLASS___NSArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssetManager sharedInstance](&OBJC_CLASS___ADAssetManager, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  uint64_t v9 = -[NSArray initWithObjects:](v4, "initWithObjects:", v5, v6, v7, v8, 0LL);

  id v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v21 = 136315394;
    id v22 = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Taking a state snapshot from providers: %@",  v21,  0x16u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100264544;
  v18[3] = &unk_1004F8500;
  id v11 = dispatch_group_create();
  id v19 = v11;
  p___int128 buf = &buf;
  -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v18);
  dispatch_time_t v12 = dispatch_time(0LL, 2000000000LL);
  if (dispatch_group_wait(v11, v12))
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v21 = 136315138;
      id v22 = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Timed out waiting for state chunks",  v21,  0xCu);
    }
  }

  id v14 = (NSArray *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) description]);
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v21 = 136315394;
    id v22 = "-[ADCommandCenter(ServiceMaintenance) _dumpAssistantState]";
    __int16 v23 = 2112;
    uint64_t v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Result: %@", v21, 0x16u);
  }

  -[ADCommandCenter _writeTextToDisk:withFileName:]( self,  "_writeTextToDisk:withFileName:",  v14,  @"assistant_dump.log");
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  *(void *)(*((void *)&buf + 1) + 40LL)));

  _Block_object_dispose(&buf, 8);
  return v16;
}

- (BOOL)_shouldDumpSiriOnDeviceAnalyticsBiomeStreams
{
  if ((AFIsInternalInstall(self) & 1) == 0)
  {
    uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v2 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (!v2) {
      return v2;
    }
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter(ServiceMaintenance) _shouldDumpSiriOnDeviceAnalyticsBiomeStreams]";
    id v4 = "%s Not dumping on device analytics Biome stream because not internal install.";
    goto LABEL_9;
  }

  if ((_AFPreferencesShouldWriteSODABiomeStreamsToSysdiagnose() & 1) == 0)
  {
    uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v2 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (!v2) {
      return v2;
    }
    int v6 = 136315138;
    id v7 = "-[ADCommandCenter(ServiceMaintenance) _shouldDumpSiriOnDeviceAnalyticsBiomeStreams]";
    id v4 = "%s Not dumping on device analytics Biome stream because setting not enabled.";
LABEL_9:
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v6, 0xCu);
    LOBYTE(v2) = 0;
    return v2;
  }

  LOBYTE(v2) = 1;
  return v2;
}

- (id)_dumpSiriOnDeviceAnalyticsBiomeStreams
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 136315138;
    id v37 = "-[ADCommandCenter(ServiceMaintenance) _dumpSiriOnDeviceAnalyticsBiomeStreams]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v36, 0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v6 = BiomeLibrary(v4, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 Siri]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 Metrics]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 OnDeviceDigestUsageMetrics]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _dumpOnDeviceAnalyticsBiomeStream:](self, "_dumpOnDeviceAnalyticsBiomeStream:", v10));
  -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v11);

  uint64_t v14 = BiomeLibrary(v12, v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 Siri]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 Metrics]);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 OnDeviceDigestSegmentsCohorts]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _dumpOnDeviceAnalyticsBiomeStream:](self, "_dumpOnDeviceAnalyticsBiomeStream:", v18));
  -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v19);

  uint64_t v22 = BiomeLibrary(v20, v21);
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 Siri]);
  int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 Metrics]);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 OnDeviceDigestExperimentMetrics]);
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _dumpOnDeviceAnalyticsBiomeStream:](self, "_dumpOnDeviceAnalyticsBiomeStream:", v26));
  -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v27);

  uint64_t v30 = BiomeLibrary(v28, v29);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 Siri]);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 SELFProcessedEvent]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _dumpOnDeviceAnalyticsBiomeStream:](self, "_dumpOnDeviceAnalyticsBiomeStream:", v33));
  -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v34);

  return v4;
}

- (id)_dumpOnDeviceAnalyticsBiomeStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v5;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter(ServiceMaintenance) _dumpOnDeviceAnalyticsBiomeStream:]";
    __int16 v18 = 2112;
    id v19 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Dumping data for stream %@", buf, 0x16u);
  }

  *(void *)__int128 buf = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _getEventsDataForStream:numEvents:]( self,  "_getEventsDataForStream:numEvents:",  v4,  buf));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.log", v7));

  -[ADCommandCenter _writeDataToDisk:withFileName:](self, "_writeDataToDisk:withFileName:", v6, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v15 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld events",  *(void *)buf));
  id v16 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));

  return v11;
}

- (id)_getEventsDataForStream:(id)a3 numEvents:(int64_t *)a4
{
  id v5 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  uint64_t v24 = 0LL;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  id v7 = [[BMPublisherOptions alloc] initWithStartDate:0 endDate:0 maxEvents:1000 lastN:0 reversed:1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 publisherWithOptions:v7]);

  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1002643C0;
  __int16 v18 = &unk_1004F8568;
  uint64_t v9 = v6;
  id v19 = v9;
  uint64_t v20 = &v21;
  id v10 = [v8 sinkWithCompletion:&stru_1004F8540 receiveInput:&v15];
  *a4 = v22[3];
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int64_t v13 = *a4;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier", v15, v16, v17, v18));
    *(_DWORD *)__int128 buf = 136315650;
    uint64_t v26 = "-[ADCommandCenter(ServiceMaintenance) _getEventsDataForStream:numEvents:]";
    __int16 v27 = 2048;
    int64_t v28 = v13;
    __int16 v29 = 2112;
    uint64_t v30 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Gathered %ld events for stream %@",  buf,  0x20u);
  }

  _Block_object_dispose(&v21, 8);
  return v9;
}

- (void)_writeTextToDisk:(id)a3 withFileName:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue([a3 stringByAppendingString:@"\n"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
  -[ADCommandCenter _writeDataToDisk:withFileName:](self, "_writeDataToDisk:withFileName:", v7, v6);
}

- (void)_writeDataToDisk:(id)a3 withFileName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = AFLogDirectory();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v5]);

  id v12 = 0LL;
  [v6 writeToFile:v9 options:1 error:&v12];

  id v10 = v12;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (v10)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315650;
      uint64_t v14 = "-[ADCommandCenter(ServiceMaintenance) _writeDataToDisk:withFileName:]";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Couldn't write to %@: %@", buf, 0x20u);
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v14 = "-[ADCommandCenter(ServiceMaintenance) _writeDataToDisk:withFileName:]";
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Written to %@", buf, 0x16u);
  }
}

- (id)_offlineMetricsManager
{
  offlineMetricsManager = self->_offlineMetricsManager;
  if (!offlineMetricsManager)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADOfflineMetricsManager);
    id v5 = self->_offlineMetricsManager;
    self->_offlineMetricsManager = v4;

    offlineMetricsManager = self->_offlineMetricsManager;
  }

  return offlineMetricsManager;
}

- (void)_reallyCommitOrSaveMetrics:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    __int16 v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (v4)
  {
    if (-[ADCommandCenter _metrics_isAssistantOrDictationEnabled](self, "_metrics_isAssistantOrDictationEnabled"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriDataSharingSensitivityManager shared]( &OBJC_CLASS___AFSiriDataSharingSensitivityManager,  "shared"));
      unsigned int v7 = [v6 isOptedOutOfMTE];

      if (!v7)
      {
        uint64_t v14 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_10026FA88;
        v24[3] = &unk_1004FBA60;
        void v24[4] = self;
        id v15 = v4;
        id v25 = v15;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10026FB20;
        v22[3] = &unk_1004FB0E0;
        uint64_t v16 = -[AFSafetyBlock initWithBlock:](v14, "initWithBlock:", v24);
        uint64_t v23 = v16;
        -[ADCommandCenter _sendMetrics:requiresActiveSession:batch:completion:]( self,  "_sendMetrics:requiresActiveSession:batch:completion:",  v15,  1LL,  0LL,  v22);
        dispatch_time_t v17 = dispatch_time(0LL, 8000000000LL);
        id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_10026FB34;
        void v20[3] = &unk_1004FD940;
        uint64_t v21 = v16;
        id v19 = v16;
        dispatch_after(v17, v18, v20);

        goto LABEL_14;
      }

      id v8 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = v8;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
        *(_DWORD *)__int128 buf = 136315650;
        __int16 v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
        __int16 v28 = 2112;
        __int16 v29 = v10;
        __int16 v30 = 2112;
        uint64_t v31 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s #MTEOptOut Dropped metrics (%@:%@) because device is opted out of MTE.",  buf,  0x20u);
LABEL_12:
      }
    }

    else
    {
      int64_t v13 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = v13;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
        *(_DWORD *)__int128 buf = 136315650;
        __int16 v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
        __int16 v28 = 2112;
        __int16 v29 = v10;
        __int16 v30 = 2112;
        uint64_t v31 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Dropped metrics (%@:%@) because Assistant and Dictation are not enabled.",  buf,  0x20u);
        goto LABEL_12;
      }
    }
  }

  else
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v27 = "-[ADCommandCenter(Metrics) _reallyCommitOrSaveMetrics:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s No metrics to send.", buf, 0xCu);
    }
  }

- (void)_sendMetrics:(id)a3 requiresActiveSession:(BOOL)a4 batch:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int64_t v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if (!v10)
  {
    uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    dispatch_time_t v17 = "%s No metrics to send.";
    goto LABEL_15;
  }

  if (!-[ADCommandCenter _metrics_isSystemIdle](self, "_metrics_isSystemIdle"))
  {
    [v11 markFailedWithType:3];
    uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    dispatch_time_t v17 = "%s Attempted to send metrics when system is busy.";
    goto LABEL_15;
  }

  if (!-[ADCommandCenter _metrics_isAssistantOrDictationEnabled](self, "_metrics_isAssistantOrDictationEnabled"))
  {
    [v11 markFailedWithType:4];
    uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    dispatch_time_t v17 = "%s Attempted to send metrics when Assistant and Dictation are disabled.";
    goto LABEL_15;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v15 = [v14 isDictationHIPAACompliant];

  if (v15)
  {
    [v11 markFailedWithType:7];
    uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    dispatch_time_t v17 = "%s Attempted to send metrics when HIPAA compliance for On-Device Dictation.";
    goto LABEL_15;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriDataSharingSensitivityManager shared]( &OBJC_CLASS___AFSiriDataSharingSensitivityManager,  "shared"));
  unsigned int v19 = [v18 isOptedOutOfMTE];

  if (v19)
  {
    [v11 markFailedWithType:8];
    uint64_t v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s #MTEOptOut Attempted to send metrics when device is opted out of MTE",  buf,  0xCu);
    }

    goto LABEL_16;
  }

  if (!v8
    || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager")),
        unsigned __int8 v22 = [v21 hasActiveSessionForSendingMetrics],
        v21,
        (v22 & 1) != 0))
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 aceId]);
    if (!v23)
    {
      uint64_t v24 = SiriCoreUUIDStringCreate(0LL);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v24);
      [v10 setAceId:v23];
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 category]);
    uint64_t v26 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v27 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)__int128 buf = 136315650;
        id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
        __int16 v40 = 2112;
        id v41 = v25;
        __int16 v42 = 2112;
        __int16 v43 = v23;
        __int16 v28 = "%s Sending metrics (%@:%@)...";
        __int16 v29 = v26;
        uint32_t v30 = 32;
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
      }
    }

    else if (v27)
    {
      *(_DWORD *)__int128 buf = 136315394;
      id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
      __int16 v40 = 2112;
      id v41 = v23;
      __int16 v28 = "%s Sending metrics (%@)...";
      __int16 v29 = v26;
      uint32_t v30 = 22;
      goto LABEL_31;
    }

    -[ADCommandCenter _sendCommandToServer:opportunistically:](self, "_sendCommandToServer:opportunistically:", v10, v8);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10026F804;
    v34[3] = &unk_1004F86F8;
    void v34[4] = self;
    id v35 = v25;
    id v36 = v23;
    id v37 = v12;
    id v32 = v23;
    id v33 = v25;
    [v31 barrier:v34];

    goto LABEL_18;
  }

  [v11 markFailedWithType:5];
  uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v39 = "-[ADCommandCenter(Metrics) _sendMetrics:requiresActiveSession:batch:completion:]";
    dispatch_time_t v17 = "%s Attempted to send metrics when session is inactive and active session is a requirement.";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v17, buf, 0xCu);
  }

- (BOOL)_metrics_isAssistantOrDictationEnabled
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  if (([v2 assistantIsEnabled] & 1) != 0
    || (id v3 = [v2 dictationIsEnabled], (v3 & 1) != 0)
    || AFSupportsRemoraHost(v3, v4) && ([v2 remoraHostEnabled] & 1) != 0)
  {
    BOOL v5 = 1;
  }

  else
  {
    unsigned int v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[ADCommandCenter(Metrics) _metrics_isAssistantOrDictationEnabled]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s NO (!assistantIsEnabled && !dictationIsEnabled)",  (uint8_t *)&v8,  0xCu);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_metrics_isSystemIdle
{
  if (-[ADCommandCenter _callIsLikely](self, "_callIsLikely"))
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v14 = 136315138;
      unsigned int v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
      BOOL v5 = "%s NO (callIsLikely == YES)";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v14, 0xCu);
      LOBYTE(v4) = 0;
      return v4;
    }

    return v4;
  }

  if (!-[ADCommandCenter _isInCall](self, "_isInCall"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));

    if (v6)
    {
      id v3 = (os_log_s *)AFSiriLogContextDaemon;
      int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v4)
      {
        int v14 = 136315138;
        unsigned int v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
        BOOL v5 = "%s NO (hasCurrentRequest == YES)";
        goto LABEL_16;
      }

      return v4;
    }

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentClient](self, "_currentClient"));
    if (v7
      || (unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _requestDelegate](self, "_requestDelegate"))) != 0LL
      || (unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechDelegate](self, "_speechDelegate"))) != 0LL)
    {

      goto LABEL_14;
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _speechFileDelegate](self, "_speechFileDelegate"));

    if (v8)
    {
LABEL_14:
      id v3 = (os_log_s *)AFSiriLogContextDaemon;
      int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v4)
      {
        int v14 = 136315138;
        unsigned int v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
        BOOL v5 = "%s NO (hasActiveClients == YES)";
        goto LABEL_16;
      }

      return v4;
    }

    unsigned int v9 = -[ADCommandCenter _isRequestDelaying](self, "_isRequestDelaying");
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        int v14 = 136315138;
        unsigned int v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
        id v12 = "%s NO (isRequestDelaying == YES)";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0xCu);
      }
    }

    else if (v11)
    {
      int v14 = 136315138;
      unsigned int v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
      id v12 = "%s YES";
      goto LABEL_24;
    }

    LOBYTE(v4) = v9 ^ 1;
    return v4;
  }

  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  int v4 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v4)
  {
    int v14 = 136315138;
    unsigned int v15 = "-[ADCommandCenter(Metrics) _metrics_isSystemIdle]";
    BOOL v5 = "%s NO (isInCall == YES)";
    goto LABEL_16;
  }

  return v4;
}

- (void)_metrics_markLocalSpeechStartedWithContext:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v4 logEventWithType:4401 context:v3];
}

- (void)_metrics_markLocalPartialSpeechRecognition
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v2 logEventWithType:4402 context:0];
}

- (void)_metrics_markLocalEagerRecognitionCandidate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 utterances]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (v5)
  {
    id v43 = v3;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 phrases]);
    __int16 v42 = v5;
    id v7 = v5;
    id v41 = [v7 confidenceScore];
    id v49 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    int v8 = AFIsInternalInstall(v49);
    uint64_t v45 = v7;
    if ([v6 count])
    {
      id v9 = 0LL;
      id v10 = 0LL;
      unint64_t v11 = 0LL;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      id v44 = v6;
      do
      {
        int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 interpretationIndices]);
        id v14 = [v13 count];

        id v15 = (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v11]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 interpretationIndices]);
        dispatch_time_t v17 = v6;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v11]);
        id v19 = [v18 unsignedIntegerValue];

        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 interpretations]);
        id v21 = [v20 count];

        if (v19 >= v21)
        {
          BOOL v5 = v42;
          id v3 = v43;
          id v38 = v49;
          id v34 = &__NSDictionary0__struct;
          id v6 = v17;
          goto LABEL_31;
        }

        uint64_t v47 = v15;
        unint64_t v48 = v11;
        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v15 interpretations]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:v19]);

        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        uint64_t v46 = v23;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 tokens]);
        id v25 = [v24 countByEnumeratingWithState:&v50 objects:buf count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v51;
          do
          {
            for (i = 0LL; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v51 != v27) {
                objc_enumerationMutation(v24);
              }
              __int16 v29 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
              id v30 = [v29 confidenceScore];
              id v31 = [v29 confidenceScore];
              if (v8)
              {
                if (([v29 removeSpaceBefore] & 1) == 0
                  && ([v10 removeSpaceAfter] & 1) == 0
                  && v10)
                {
                  -[NSMutableString appendString:](v49, "appendString:", @" ");
                }

                id v32 = (void *)objc_claimAutoreleasedReturnValue([v29 text]);
                -[NSMutableString appendString:](v49, "appendString:", v32);
                id v33 = v29;

                id v10 = v33;
              }
            }

            id v26 = [v24 countByEnumeratingWithState:&v50 objects:buf count:16];
          }

          while (v26);
        }

        unint64_t v11 = v48 + 1;
        id v6 = v44;
        id v7 = v45;
      }

      while (v48 + 1 < (unint64_t)[v44 count]);
    }

    else
    {
      id v10 = 0LL;
      id v9 = 0LL;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v54[0] = @"ConfidenceMean";
    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v41));
    v55[0] = v35;
    v54[1] = @"ConfidenceMax";
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
    v55[1] = v36;
    v54[2] = @"ConfidenceMin";
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
    v55[2] = v37;
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  3LL));

    if (v8)
    {
      id v34 = [v15 mutableCopy];
      id v38 = v49;
      [v34 setObject:v49 forKey:@"BestTranscription"];
      BOOL v5 = v42;
      id v3 = v43;
    }

    else
    {
      id v15 = v15;
      id v34 = v15;
      BOOL v5 = v42;
      id v3 = v43;
      id v38 = v49;
    }

- (void)_metrics_markLocalSpeechPackage:(id)a3 interactionId:(id)a4 optedIn:(BOOL)a5
{
  id v7 = a3;
  id v69 = a4;
  if (a5)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recognition]);
    id v9 = sub_10026F494(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 rawRecognition]);
    uint64_t v12 = sub_10026F494(v11);
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setValue:forKey:](v14, "setValue:forKey:", v10, @"recognition");
    -[NSMutableDictionary setValue:forKey:](v14, "setValue:forKey:", v13, @"rawRecognition");
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 dictionaryRepresentation]);
    id v68 = v14;
    -[NSMutableDictionary setValue:forKey:](v14, "setValue:forKey:", v15, @"speechPackage");
  }

  else
  {
    id v68 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 rawRecognition]);
  dispatch_time_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 utterances]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

  BOOL v67 = v16;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 phrases]);
  if ([v20 count])
  {
    unint64_t v21 = 0LL;
    id v70 = v20;
    id v71 = v19;
    do
    {
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v19 interpretationIndices]);
      id v23 = [v22 count];

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:v21]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v19 interpretationIndices]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndex:v21]);
      id v27 = [v26 unsignedIntegerValue];

      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v24 interpretations]);
      id v29 = [v28 count];

      if (v27 >= v29)
      {

        break;
      }

      id v30 = (void *)objc_claimAutoreleasedReturnValue([v24 interpretations]);
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndex:v27]);

      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 tokens]);
      id v33 = [v32 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v73;
        do
        {
          for (i = 0LL; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v73 != v35) {
              objc_enumerationMutation(v32);
            }
            id v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(*((void *)&v72 + 1) + 8 * (void)i) confidenceScore]));
            -[NSMutableArray addObject:](v17, "addObject:", v37);
          }

          id v34 = [v32 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }

        while (v34);
      }

      ++v21;
      uint64_t v20 = v70;
      id v19 = v71;
    }

    while (v21 < (unint64_t)[v70 count]);
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue([v7 rawRecognition]);
  double v39 = sub_10026F764(v38);

  __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v7 recognition]);
  double v41 = sub_10026F764(v40);

  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v7 rawRecognition]);
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 phrases]);
  id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 firstObject]);

  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 interpretations]);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 firstObject]);

  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 tokens]);
  unint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);

  [v48 startTime];
  double v50 = v49;

  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v7 rawRecognition]);
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v51 phrases]);
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v52 lastObject]);

  id v54 = (void *)objc_claimAutoreleasedReturnValue([v53 interpretations]);
  __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v54 firstObject]);

  id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 tokens]);
  id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 lastObject]);

  [v57 endTime];
  double v59 = v58;
  [v57 silenceStartTime];
  double v61 = v59 - v60;

  -[NSMutableDictionary setValue:forKey:](v68, "setValue:forKey:", v17, @"rawRecognitionTokenConfidenceScores");
  __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v39));
  -[NSMutableDictionary setValue:forKey:]( v68,  "setValue:forKey:",  v62,  @"rawRecognitionFirstTokenSilenceStartTime");

  id v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v41));
  -[NSMutableDictionary setValue:forKey:](v68, "setValue:forKey:", v63, @"recognitionFirstTokenSilenceStartTime");

  __int16 v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v50));
  -[NSMutableDictionary setValue:forKey:](v68, "setValue:forKey:", v64, @"rawRecognitionLeadingSilence");

  unsigned __int8 v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v61));
  -[NSMutableDictionary setValue:forKey:](v68, "setValue:forKey:", v65, @"rawRecognitionTrailingSilence");

  -[NSMutableDictionary setValue:forKey:](v68, "setValue:forKey:", v69, @"dictationUIInteractionIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v66 logEventWithType:4404 context:v68];
}

- (void)_metrics_markLocalSpeechCompletedWithStatistics:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v4 logEventWithType:4405 context:v3];
}

- (void)_metrics_logSpeechRecognized:(id)a3 resultId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10026F3D4;
  v10[3] = &unk_1004F9A30;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 logEventWithType:1102 contextProvider:v10];
}

- (void)_metrics_recordFailureMetricsForError:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10026F2A4;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_metrics_recordCancellationMetrics
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10026F1CC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_metrics_sendMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 purgesOversizedStorage:(BOOL)a6 scheduledActivity:(BOOL)a7 completion:(id)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = (void (**)(void))a8;
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315906;
    double v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSession"
          ":purgesOversizedStorage:scheduledActivity:completion:]";
    __int16 v40 = 2048;
    double v41 = a3;
    __int16 v42 = 1024;
    BOOL v43 = v11;
    __int16 v44 = 1024;
    BOOL v45 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s limit = %f, requiresUnlimitedPower = %d, requiresActiveSession = %d",  buf,  0x22u);
  }

  if (self->_isSendingAnalyticsEventStreamsAndOfflineMetrics)
  {
    uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)__int128 buf = 136315138;
    double v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSession"
          ":purgesOversizedStorage:scheduledActivity:completion:]";
    dispatch_time_t v17 = "%s Skipped sending metrics to server because it is already sending.";
    goto LABEL_6;
  }

  if (v10)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
    unsigned __int8 v19 = [v18 hasActiveSessionForSendingMetrics];

    if ((v19 & 1) == 0)
    {
      uint64_t v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        double v39 = "-[ADCommandCenter(Metrics) _metrics_sendMetricsToServerUntilLimit:requiresUnlimitedPower:requiresActiveSes"
              "sion:purgesOversizedStorage:scheduledActivity:completion:]";
        dispatch_time_t v17 = "%s Skipped sending metrics to server because the session is not active.";
        goto LABEL_6;
      }

- (void)_metrics_sendNextOfflineMetricsToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requiresAc"
          "tiveSession:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10026E4E8;
  v33[3] = &unk_1004FC838;
  id v12 = v10;
  id v34 = v12;
  int64_t v13 = objc_retainBlock(v33);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v14 systemUptime];
  double v16 = v15;

  if (v16 >= a3)
  {
    unsigned __int8 v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v36 = "-[ADCommandCenter(Metrics) _metrics_sendNextOfflineMetricsToServerUntilLimit:requiresUnlimitedPower:requires"
            "ActiveSession:completion:]";
      uint64_t v20 = "%s Attempted to send offline metrics when time limit is reached.";
      goto LABEL_15;
    }

- (void)_metrics_sendNextAnalyticsEventStreamToServerUntilLimit:(double)a3 requiresUnlimitedPower:(BOOL)a4 requiresActiveSession:(BOOL)a5 prioritizedEventStreamUID:(id)a6 deliveryStreamContinuations:(id *)a7 scheduledActivity:(BOOL)a8 completion:(id)a9
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v15 = a6;
  id v16 = a9;
  dispatch_time_t v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    unint64_t var3 = a7->var3;
    *(_DWORD *)__int128 buf = 136315394;
    id v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    __int16 v55 = 2048;
    unint64_t v56 = var3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Remaining batch runs: %lu", buf, 0x16u);
  }

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10026BE54;
  v51[3] = &unk_1004FC838;
  id v19 = v16;
  id v52 = v19;
  uint64_t v20 = objc_retainBlock(v51);
  unint64_t v21 = a7->var3;
  if (v21) {
    a7->unint64_t var3 = v21 - 1;
  }
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v22 systemUptime];
  double v24 = v23;

  if (v24 >= a3)
  {
    id v28 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v29 = "%s Attempted to send analytics event stream when time limit is reached.";
    goto LABEL_17;
  }

  if (!-[ADCommandCenter _metrics_isSystemIdle](self, "_metrics_isSystemIdle"))
  {
    id v28 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v29 = "%s Attempted to send analytics event stream when system is busy.";
    goto LABEL_17;
  }

  if (!-[ADCommandCenter _metrics_isAssistantOrDictationEnabled](self, "_metrics_isAssistantOrDictationEnabled"))
  {
    id v28 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)__int128 buf = 136315138;
    id v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:requ"
          "iresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
    id v29 = "%s Attempted to send analytics event stream when Assistant and Dictation are disabled.";
    goto LABEL_17;
  }

  BOOL v37 = v15;
  double v25 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned int v26 = [v25 isDictationHIPAACompliant];

  if (!v26)
  {
    double v30 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriDataSharingSensitivityManager shared]( &OBJC_CLASS___AFSiriDataSharingSensitivityManager,  "shared"));
    unsigned int v31 = [v30 isOptedOutOfMTE];

    if (!v31)
    {
      if (v12 && (IOPSDrawingUnlimitedPower() & 1) == 0)
      {
        id v27 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        *(_DWORD *)__int128 buf = 136315138;
        id v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:"
              "requiresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
        id v36 = "%s Attempted to send analytics event stream when the device is on battery.";
      }

      else
      {
        if (!v11
          || (BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager")),
              unsigned __int8 v33 = [v32 hasActiveSessionForSendingMetrics],
              v32,
              (v33 & 1) != 0))
        {
          id v34 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472LL;
          v39[2] = sub_10026BE68;
          v39[3] = &unk_1004F8960;
          void v39[4] = self;
          double v41 = v20;
          double v43 = a3;
          id v15 = v37;
          id v40 = v37;
          $85E40A55691FE2F31975A98F57E3065D var1 = a7->var1;
          $85E40A55691FE2F31975A98F57E3065D var0 = a7->var0;
          $85E40A55691FE2F31975A98F57E3065D v45 = var1;
          $85E40A55691FE2F31975A98F57E3065D var2 = a7->var2;
          unint64_t v47 = a7->var3;
          BOOL v48 = a8;
          BOOL v49 = v11;
          BOOL v50 = v12;
          id v42 = v19;
          [v34 accessStoreUsingBlock:v39];

          goto LABEL_21;
        }

        id v27 = (os_log_s *)AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        *(_DWORD *)__int128 buf = 136315138;
        id v54 = "-[ADCommandCenter(Metrics) _metrics_sendNextAnalyticsEventStreamToServerUntilLimit:requiresUnlimitedPower:"
              "requiresActiveSession:prioritizedEventStreamUID:deliveryStreamContinuations:scheduledActivity:completion:]";
        id v36 = "%s Skipped sending metrics to server because the session is not active.";
      }

- (void)_metrics_processEventRecordsFromStore:(id)a3 batch:(id)a4 deliveryStream:(unint64_t)a5 eventStreamUID:(id)a6 streamSpeechId:(id)a7 untilLimit:(double)a8 uploadRecords:(id)a9 completion:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  double v23 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315906;
    __int128 v51 = "-[ADCommandCenter(Metrics) _metrics_processEventRecordsFromStore:batch:deliveryStream:eventStreamUID:streamSpe"
          "echId:untilLimit:uploadRecords:completion:]";
    __int16 v52 = 2112;
    id v53 = v19;
    __int16 v54 = 2112;
    id v55 = v20;
    __int16 v56 = 2048;
    unint64_t v57 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s Fetching 128 events from event stream with UID %@ speechId %@ in delivery stream %tu",  buf,  0x2Au);
  }

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10026B36C;
  v45[3] = &unk_1004F89B0;
  id v24 = v17;
  id v46 = v24;
  unint64_t v49 = a5;
  id v25 = v18;
  id v47 = v25;
  id v26 = v22;
  id v48 = v26;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10026B408;
  v34[3] = &unk_1004F8A78;
  id v42 = v21;
  unint64_t v43 = a5;
  id v35 = v25;
  id v36 = v19;
  double v44 = a8;
  id v40 = objc_retainBlock(v45);
  id v41 = v26;
  BOOL v37 = self;
  id v38 = v20;
  id v39 = v24;
  id v27 = v24;
  id v28 = v20;
  id v29 = v21;
  id v30 = v26;
  id v31 = v19;
  BOOL v32 = v40;
  id v33 = v25;
  [v27 fetchEventRecords:128 eventStreamUID:v31 streamSpeechId:v28 deliveryStream:a5 completion:v34];
}

- (void)metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10026B35C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_metrics_publishDailyDeviceStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v24 = "-[ADCommandCenter(Metrics) _metrics_publishDailyDeviceStatus:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10026B33C;
  void v20[3] = &unk_1004FC838;
  id v9 = v7;
  id v21 = v9;
  id v10 = objc_retainBlock(v20);
  if (-[ADCommandCenter _metrics_isAssistantOrDictationEnabled](self, "_metrics_isAssistantOrDictationEnabled"))
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v12 = [v11 isDictationHIPAACompliant];

    if (!v12)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 wrapAsAnyEvent]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
      id v22 = v15;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10026B350;
      v18[3] = &unk_1004FC838;
      id v19 = v10;
      [v16 storeGenericInstrumentation:v17 completion:v18];

      goto LABEL_12;
    }

    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v24 = "-[ADCommandCenter(Metrics) _metrics_publishDailyDeviceStatus:completion:]";
      id v14 = "%s HIPAA On-Device Dictation enabled. Dropping DailyDeviceStatus.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, buf, 0xCu);
    }
  }

  else
  {
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v24 = "-[ADCommandCenter(Metrics) _metrics_publishDailyDeviceStatus:completion:]";
      id v14 = "%s Assistant and Dictation are disabled. Dropping DailyDeviceStatus.";
      goto LABEL_9;
    }
  }

  ((void (*)(void *))v10[2])(v10);
LABEL_12:
}

- (void)_metrics_sendEngagementFeedback:(int64_t)a3 voiceQueryIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___SAMetrics);
  -[SAMetrics setCategory:](v7, "setCategory:", @"SpotlightEngagementFeedback");
  -[SAMetrics setOriginalCommandId:](v7, "setOriginalCommandId:", v6);
  else {
    id v8 = *(&off_1004F8AC0 + a3);
  }
  v21[0] = @"type";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v21[1] = @"description";
  v22[0] = v9;
  v22[1] = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));

  id v19 = @"engagementInfo";
  id v20 = v10;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  -[SAMetrics setEventInformation:](v7, "setEventInformation:", v11);

  unsigned int v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    id v14 = "-[ADCommandCenter(Metrics) _metrics_sendEngagementFeedback:voiceQueryIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Sending engagement feedback %@ for aceId %@",  (uint8_t *)&v13,  0x20u);
  }

  -[ADCommandCenter _reallyCommitOrSaveMetrics:](self, "_reallyCommitOrSaveMetrics:", v7);
}

- (void)_metrics_destroyAllMetricsIfNeeded
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCommandCenter(Metrics) _metrics_destroyAllMetricsIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  if (!-[ADCommandCenter _metrics_isAssistantOrDictationEnabled](self, "_metrics_isAssistantOrDictationEnabled")) {
    -[ADCommandCenter _metrics_destroyAllMetrics](self, "_metrics_destroyAllMetrics");
  }
}

- (void)_metrics_destroyAllMetrics
{
  id v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADCommandCenter(Metrics) _metrics_destroyAllMetrics]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _offlineMetricsManager](self, "_offlineMetricsManager"));
  [v4 deleteAllMetrics];
}

- (void)_metrics_recordNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_10026AC8C;
  v9[3] = &unk_1004F8AA0;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getConnectionMetrics:v9];
}

- (void)_metrics_recordSNNetworkSnapshotForEvent:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sessionManager](self, "_sessionManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  void v9[2] = sub_10026A754;
  v9[3] = &unk_1004F8AA0;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  [v7 getSNConnectionMetrics:v9];
}

- (void)_metrics_awdRequestEnd
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10026A748;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)_outputVoice_setOutputVoice:(id)a3
{
  id v4 = a3;
  if (sub_1001EA0D0())
  {
    int v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      __int16 v15 = "-[ADCommandCenter(OutputVoice) _outputVoice_setOutputVoice:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v14, 0x16u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getValidOutputVoiceWithDialects:v4]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 outputVoiceWithFallback:0]);
    if ([v8 isEqual:v9]
      && ([v9 wasInitializedFromDictionaryRepresentation] & 1) != 0)
    {
      id v10 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315650;
        __int16 v15 = "-[ADCommandCenter(OutputVoice) _outputVoice_setOutputVoice:]";
        __int16 v16 = 2112;
        id v17 = v8;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s no need to change output voice to %@ because it is already set to %@",  (uint8_t *)&v14,  0x20u);
      }

      BOOL v11 = 0;
    }

    else
    {
      [v6 setOutputVoice:v8];
      [v6 synchronize];
      unsigned int v12 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v11 = 1;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315650;
        __int16 v15 = "-[ADCommandCenter(OutputVoice) _outputVoice_setOutputVoice:]";
        __int16 v16 = 2112;
        id v17 = v9;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s output voice changed from %@ to %@",  (uint8_t *)&v14,  0x20u);
      }
    }

    -[ADCommandCenter _updateAutoDownloadedVoiceAssetsForOutputVoice]( self,  "_updateAutoDownloadedVoiceAssetsForOutputVoice");
    VSPreferencesSetSpokenLanguageIdentifier([v4 languageCode]);
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_updateAutoDownloadedVoiceAssetsForOutputVoice
{
  id v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v25 = "-[ADCommandCenter(OutputVoice) _updateAutoDownloadedVoiceAssetsForOutputVoice]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  if ((sub_1001EA0D0() & 1) != 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 outputVoice]);

    int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "voiceNamesForOutputLanguageCode:gender:", v8, objc_msgSend(v4, "gender")));

      if (!v6 || ([v9 containsObject:v6] & 1) == 0)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
        if (v10 != v6)
        {
          BOOL v11 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 136315650;
            id v25 = "-[ADCommandCenter(OutputVoice) _updateAutoDownloadedVoiceAssetsForOutputVoice]";
            __int16 v26 = 2112;
            id v27 = v6;
            __int16 v28 = 2112;
            id v29 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Substituting subscription for output voice '%@' with subscription for preferred Siri voice '%@'",  buf,  0x20u);
          }

          id v12 = v10;

          id v6 = v12;
        }
      }

      int v13 = -[SiriTTSSynthesisVoice initWithLanguage:name:]( objc_alloc(&OBJC_CLASS___SiriTTSSynthesisVoice),  "initWithLanguage:name:",  v5,  v6);
      int v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
      __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 endpointUUID]);

      if (v15) {
        id v16 = [[SiriTTSDaemonSession alloc] initWithAccessoryId:v15];
      }
      else {
        id v16 = objc_alloc_init(&OBJC_CLASS___SiriTTSDaemonSession);
      }
      __int16 v18 = v16;
      double v23 = v13;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      void v21[2] = sub_1002702AC;
      v21[3] = &unk_1004FBD90;
      id v22 = v13;
      id v20 = v13;
      [v18 subscribeWithVoices:v19 reply:v21];
    }
  }

  else
  {
    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v25 = "-[ADCommandCenter(OutputVoice) _updateAutoDownloadedVoiceAssetsForOutputVoice]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Not updating auto-downloaded voice assets because the platform doesn't support TTS",  buf,  0xCu);
    }
  }

- (void)sanityCheckAutodownloadedAssetsForced:(BOOL)a3
{
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100270284;
  v6[3] = &unk_1004FC4D0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)_sendAMOSCommand:(id)a3 domain:(id)a4 toBundleWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceForIdentifier:v12]);

  if (v15)
  {
    if (![v15 isSystemService])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100278F58;
      v18[3] = &unk_1004FABE8;
      void v18[4] = self;
      id v19 = v10;
      id v20 = v13;
      [v15 handleCommand:v19 forDomain:v11 executionContext:0 reply:v18];

      goto LABEL_9;
    }

    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315650;
      id v22 = "-[ADCommandCenter(AMOS) _sendAMOSCommand:domain:toBundleWithIdentifier:completion:]";
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      id v17 = "%s Can't route to system service for command %@ identifier %@";
      goto LABEL_11;
    }
  }

  else
  {
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315650;
      id v22 = "-[ADCommandCenter(AMOS) _sendAMOSCommand:domain:toBundleWithIdentifier:completion:]";
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      id v17 = "%s No service connection for command %@ identifier %@";
LABEL_11:
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
      if (!v13) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }

  if (v13) {
LABEL_7:
  }
    (*((void (**)(id, void, void, void))v13 + 2))(v13, 0LL, 0LL, 0LL);
LABEL_9:
}

- (void)_handleSADOCommandIfServiceDoesNotUseAMOS:(id)a3 allowInterposing:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 encodedClassName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 domainFromSADObject]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serviceForDomain:v11 command:v10]);
  int v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315906;
    id v24 = "-[ADCommandCenter(AMOS) _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]";
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    __int16 v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Found service %@ for command %@ in domain %@",  buf,  0x2Au);
  }

  if (v13 && ([v13 usesManagedStorageForDomain:v11] & 1) == 0)
  {
    id v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v24 = "-[ADCommandCenter(AMOS) _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]";
      id v17 = "%s Service does NOT use AMOS for command";
      goto LABEL_15;
    }

- (void)_sendAMOSCommandToService:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _serviceManager](self, "_serviceManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 domainFromSADObject]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 encodedClassName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceForDomain:v9 command:v10]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 domainFromSADObject]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100278B78;
    v15[3] = &unk_1004F8D20;
    id v16 = v6;
    id v17 = v7;
    [v11 handleCommand:v16 forDomain:v12 executionContext:0 reply:v15];
  }

  else
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___SACommandIgnored);
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    [v13 setRefId:v14];

    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v13, 2LL);
  }
}

- (void)_amosSADomainObjectCreate:(id)a3 completion:(id)a4
{
  int v14 = (void (**)(id, id, void))a4;
  id v6 = a3;
  id v7 = sub_1001EA514((uint64_t)v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 object]);

  [v9 setIdentifier:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _domainObjectCache](self, "_domainObjectCache"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionary]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
  [v10 setDomainObject:v11 forKey:v12];

  id v13 = objc_alloc_init(&OBJC_CLASS___SADomainObjectCreateCompleted);
  -[SADomainObjectCreateCompleted setIdentifier:](v13, "setIdentifier:", v8);
  if (v14) {
    v14[2](v14, v13, 0LL);
  }
}

- (void)_saDomainObjectCreate:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100278B00;
  v7[3] = &unk_1004F8CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ADCommandCenter _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]( v8,  "_handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:",  v6,  1LL,  v7);
}

- (void)_amosSADomainObjectRetrieve:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  __int16 v25 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v8 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
  id v26 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _domainObjectCache](self, "_domainObjectCache"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    __int16 v27 = 0LL;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        unsigned int v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v14 identifier]);
        id v16 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 136315394;
          BOOL v37 = "-[ADCommandCenter(AMOS) _amosSADomainObjectRetrieve:completion:]";
          __int16 v38 = 2112;
          id v39 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Retrieve looking in amos for key %@",  buf,  0x16u);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray absoluteString](v15, "absoluteString"));
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v9 domainObjectForKey:v17]);

        if (v18)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[SADomainObject aceObjectWithDictionary:]( &OBJC_CLASS___SADomainObject,  "aceObjectWithDictionary:",  v18));
          [v19 setIdentifier:v15];
          -[NSMutableArray addObject:](v8, "addObject:", v19);
        }

        else
        {
          if (!v27) {
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v14 groupIdentifier]);
          }
          -[NSMutableArray addObject:](v26, "addObject:", v14);
        }
      }

      id v11 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }

    while (v11);
  }

  else
  {
    __int16 v27 = 0LL;
  }

  if (-[NSMutableArray count](v26, "count"))
  {
    id v20 = (os_log_s *)AFSiriLogContextDaemon;
    id v22 = v24;
    id v21 = v25;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      BOOL v37 = "-[ADCommandCenter(AMOS) _amosSADomainObjectRetrieve:completion:]";
      __int16 v38 = 2112;
      id v39 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Retrieve going to bundle for remaining identifiers %@",  buf,  0x16u);
    }

    [v25 setIdentifiers:v26];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100278A60;
    v29[3] = &unk_1004F8D48;
    id v30 = v8;
    id v31 = v24;
    -[ADCommandCenter _sendAMOSCommandToService:responseHandler:]( self,  "_sendAMOSCommandToService:responseHandler:",  v25,  v29);

    __int16 v23 = v30;
  }

  else
  {
    __int16 v23 = (NSMutableArray *)objc_alloc_init(&OBJC_CLASS___SADomainObjectRetrieveCompleted);
    -[NSMutableArray setObjects:](v23, "setObjects:", v8);
    id v22 = v24;
    id v21 = v25;
    if (v24) {
      (*((void (**)(id, NSMutableArray *, void))v24 + 2))(v24, v23, 0LL);
    }
  }
}

- (void)_saDomainObjectRetrieve:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002789E8;
  v7[3] = &unk_1004F8CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ADCommandCenter _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]( v8,  "_handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:",  v6,  0LL,  v7);
}

- (void)_updateObjectFromService:(id)a3 sadIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(&OBJC_CLASS___SADomainObjectRetrieve);
  uint64_t v12 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", v10, 0LL);

  -[SADomainObjectRetrieve setIdentifiers:](v11, "setIdentifiers:", v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100278650;
  v15[3] = &unk_1004F8D70;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v13 = v9;
  id v14 = v8;
  -[ADCommandCenter _sendAMOSCommandToService:responseHandler:]( self,  "_sendAMOSCommandToService:responseHandler:",  v11,  v15);
}

- (void)_amosSADomainObjectUpdate:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _domainObjectCache](self, "_domainObjectCache"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domainObjectForKey:v10]);
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v14 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v12)
  {
    id v21 = v8;
    if (v14)
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int16 v23 = "-[ADCommandCenter(AMOS) _amosSADomainObjectUpdate:completion:]";
      __int16 v24 = 2112;
      __int16 v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Updating store object %@", buf, 0x16u);
    }

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", v12));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 setFields]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 addFields]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 removeFields]);

    [v15 updateUsingSet:v16 add:v17 remove:v18];
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 dictionary]);
    [v11 setDomainObject:v19 forKey:v10];

    id v20 = objc_alloc_init(&OBJC_CLASS___SADomainObjectUpdateCompleted);
    [v20 setIdentifier:v9];
    if (v6) {
      v6[2](v6, v20, 0LL);
    }

    id v7 = v15;
    id v8 = v21;
  }

  else
  {
    if (v14)
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v23 = "-[ADCommandCenter(AMOS) _amosSADomainObjectUpdate:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Going to bundle for object update",  buf,  0xCu);
    }

    -[ADCommandCenter _updateObjectFromService:sadIdentifier:completion:]( self,  "_updateObjectFromService:sadIdentifier:completion:",  v7,  v8,  v6);
  }
}

- (void)_saDomainObjectUpdate:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002785D8;
  v7[3] = &unk_1004F8CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ADCommandCenter _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]( v8,  "_handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:",  v6,  0LL,  v7);
}

- (void)_amosSADomainObjectCancel:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = objc_alloc_init(&OBJC_CLASS___SADomainObjectCancelCompleted);
    (*((void (**)(id, SADomainObjectCancelCompleted *, void))a4 + 2))(v5, v6, 0LL);
  }

- (void)_saDomainObjectCancel:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100278560;
  v7[3] = &unk_1004F8CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ADCommandCenter _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]( v8,  "_handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:",  v6,  0LL,  v7);
}

- (void)_amosSADomainObjectDelete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);

  if ([v9 isAMOSIdentifier])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _domainObjectCache](self, "_domainObjectCache"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 oldIdForKey:v10]);
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      __int16 v23 = "-[ADCommandCenter(AMOS) _amosSADomainObjectDelete:completion:]";
      __int16 v24 = 2112;
      __int16 v25 = v9;
      __int16 v26 = 2112;
      __int16 v27 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s Removing object with identifier %@ old identifier %@ from amos",  buf,  0x20u);
    }

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned int v15 = v14;
    if (v12)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));
      [v15 setIdentifier:v16];
    }

    else
    {
      [v14 setIdentifier:0];
    }

    [v11 setDomainObject:0 forKey:v10];
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);

  if (v18)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1002784F0;
    void v20[3] = &unk_1004F8D98;
    id v21 = (SADomainObjectDeleteCompleted *)v7;
    -[ADCommandCenter _sendAMOSCommandToService:responseHandler:]( self,  "_sendAMOSCommandToService:responseHandler:",  v6,  v20);
    id v19 = v21;
LABEL_12:

    goto LABEL_13;
  }

  if (v7)
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___SADomainObjectDeleteCompleted);
    (*((void (**)(id, SADomainObjectDeleteCompleted *, void))v7 + 2))(v7, v19, 0LL);
    goto LABEL_12;
  }

- (void)_saDomainObjectDelete:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100278478;
  v7[3] = &unk_1004F8CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ADCommandCenter _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]( v8,  "_handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:",  v6,  0LL,  v7);
}

- (void)_amosSADomainObjectCommit:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _domainObjectCache](self, "_domainObjectCache"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domainObjectForKey:v10]);
  if (v12)
  {
    id v20 = self;
    id v13 = (SACommandFailed *)objc_claimAutoreleasedReturnValue([v11 oldIdForKey:v10]);
    if (v13) {
      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v13));
    }
    else {
      id v14 = v9;
    }
    id v16 = v14;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AceObject aceObjectWithDictionary:](&OBJC_CLASS___AceObject, "aceObjectWithDictionary:", v12));
    [v17 setIdentifier:v16];
    [v6 setIdentifier:v17];
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315650;
      __int16 v29 = "-[ADCommandCenter(AMOS) _amosSADomainObjectCommit:completion:]";
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      __int128 v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Committing %@ with oldId %@", buf, 0x20u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    void v21[2] = sub_100278248;
    v21[3] = &unk_1004F8DC0;
    id v22 = v9;
    id v23 = v17;
    id v24 = v11;
    id v25 = v10;
    id v26 = v6;
    id v27 = v7;
    id v19 = v17;
    -[ADCommandCenter _sendAMOSCommandToService:responseHandler:]( v20,  "_sendAMOSCommandToService:responseHandler:",  v26,  v21);
  }

  else
  {
    unsigned int v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315394;
      __int16 v29 = "-[ADCommandCenter(AMOS) _amosSADomainObjectCommit:completion:]";
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Object not found in AMOS %@",  buf,  0x16u);
    }

    id v13 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Object not found in amos");
    if (v7) {
      (*((void (**)(id, SACommandFailed *, void))v7 + 2))(v7, v13, 0LL);
    }
  }
}

- (void)_saDomainObjectCommit:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002781D0;
  v7[3] = &unk_1004F8CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ADCommandCenter _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]( v8,  "_handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:",  v6,  0LL,  v7);
}

- (void)_amosSADomainObjectPunchOut:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, SACommandFailed *, void))a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315138;
    id v10 = "-[ADCommandCenter(AMOS) _amosSADomainObjectPunchOut:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s We don't know how to generically punch out to domain objects. A non-ui plugin needs to handle this.",  (uint8_t *)&v9,  0xCu);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v6)
  {
LABEL_3:
    id v8 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"No plugin for command");
    v6[2](v6, v8, 0LL);
  }

- (void)_saDomainObjectPunchOut:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100278158;
  v7[3] = &unk_1004F8CF8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ADCommandCenter _handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:]( v8,  "_handleSADOCommandIfServiceDoesNotUseAMOS:allowInterposing:completion:",  v6,  0LL,  v7);
}

- (void)_handleCommandInAMOS:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, SACommandFailed *, void))a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SADomainObjectCreate);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    -[ADCommandCenter _amosSADomainObjectCreate:completion:](self, "_amosSADomainObjectCreate:completion:", v6, v7);
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___SADomainObjectRetrieve);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      -[ADCommandCenter _amosSADomainObjectRetrieve:completion:]( self,  "_amosSADomainObjectRetrieve:completion:",  v6,  v7);
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___SADomainObjectUpdate);
      if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
      {
        -[ADCommandCenter _amosSADomainObjectUpdate:completion:](self, "_amosSADomainObjectUpdate:completion:", v6, v7);
      }

      else
      {
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___SADomainObjectCancel);
        if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
        {
          -[ADCommandCenter _amosSADomainObjectCancel:completion:]( self,  "_amosSADomainObjectCancel:completion:",  v6,  v7);
        }

        else
        {
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___SADomainObjectDelete);
          if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
          {
            -[ADCommandCenter _amosSADomainObjectDelete:completion:]( self,  "_amosSADomainObjectDelete:completion:",  v6,  v7);
          }

          else
          {
            uint64_t v13 = objc_opt_class(&OBJC_CLASS___SADomainObjectCommit);
            if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0)
            {
              -[ADCommandCenter _amosSADomainObjectCommit:completion:]( self,  "_amosSADomainObjectCommit:completion:",  v6,  v7);
            }

            else
            {
              uint64_t v14 = objc_opt_class(&OBJC_CLASS___SADomainObjectPunchOut);
              if ((objc_opt_isKindOfClass(v6, v14) & 1) == 0)
              {
                unsigned int v15 = (os_log_s *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  int v17 = 136315394;
                  id v18 = "-[ADCommandCenter(AMOS) _handleCommandInAMOS:completion:]";
                  __int16 v19 = 2112;
                  id v20 = v6;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Unsuccessfully tried to handle non AMOS command as AMOS %@",  (uint8_t *)&v17,  0x16u);
                  if (!v7) {
                    goto LABEL_18;
                  }
                }

                else if (!v7)
                {
                  goto LABEL_18;
                }

                id v16 = -[SACommandFailed initWithReason:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithReason:",  @"Tried to handle non AMOS command as AMOS");
                v7[2](v7, v16, 0LL);

                goto LABEL_18;
              }

              -[ADCommandCenter _amosSADomainObjectPunchOut:completion:]( self,  "_amosSADomainObjectPunchOut:completion:",  v6,  v7);
            }
          }
        }
      }
    }
  }

- (void)executeCommand:(id)a3 fromPeer:(id)a4 remoteExecutionInfo:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  unsigned __int8 v15 = [v14 assistantIsEnabled];

  if ((v15 & 1) != 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[SABaseCommand aceObjectWithDictionary:]( &OBJC_CLASS___SABaseCommand,  "aceObjectWithDictionary:",  v10));
    [v16 setRefId:0];
    int v17 = -[AFCommandExecutionInfo initWithDictionaryRepresentation:]( objc_alloc(&OBJC_CLASS___AFCommandExecutionInfo),  "initWithDictionaryRepresentation:",  v12);
    id v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315906;
      __int16 v30 = "-[ADCommandCenter(RemoteExecute) executeCommand:fromPeer:remoteExecutionInfo:reply:]";
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      __int128 v34 = v16;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s peer = %@, command = %@, remoteExecutionInfo = %@",  buf,  0x2Au);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    [v19 sendPowerLogs:@"ExecuteOnRemoteRequest" peerInfo:v11];

    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002DD7C8;
    block[3] = &unk_1004FCBB0;
    void block[4] = self;
    id v25 = v16;
    id v26 = v11;
    id v27 = v17;
    id v28 = v13;
    id v21 = v17;
    id v22 = v16;
    dispatch_async(v20, block);
  }

  else
  {
    id v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v30 = "-[ADCommandCenter(RemoteExecute) executeCommand:fromPeer:remoteExecutionInfo:reply:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Rejecting remote command because Siri is disabled",  buf,  0xCu);
    }

    id v22 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 18LL));
    (*((void (**)(id, void, id))v13 + 2))(v13, 0LL, v22);
  }
}

- (void)_attachPersonaIdIfNeeded:(id)a3 aceCommand:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___SAUIAddViews);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  if ((isKindOfClass & 1) != 0) {
    [v5 setPersonaId:v9];
  }
}

- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    id v13 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteCommand:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }

  -[ADCommandCenter _remoteExecute_remoteDeviceExecuteCommand:onDeviceForAssistantId:executionContext:completion:]( self,  "_remoteExecute_remoteDeviceExecuteCommand:onDeviceForAssistantId:executionContext:completion:",  v8,  0LL,  v9,  v10);
}

- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onDeviceForAssistantId:(id)a4 executionContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315650;
    id v20 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteCommand:onDeviceForAssistantId:executionCon"
          "text:completion:]";
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Executing command %@ on device for assistant id %@",  (uint8_t *)&v19,  0x20u);
  }

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
  id v16 = v15;
  if (v11) {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 peerInfoForAssistantId:v11 allowNonPeers:1]);
  }
  else {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 companionPeer]);
  }
  id v18 = (void *)v17;
  -[ADCommandCenter _remoteExecute_remoteDeviceExecuteCommand:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:]( self,  "_remoteExecute_remoteDeviceExecuteCommand:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:",  v10,  v17,  0LL,  0LL,  v12,  v13);
}

- (void)_remoteExecute_remoteDeviceExecuteCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v54 = a5;
  id v13 = a3;
  id v14 = a4;
  id v55 = a6;
  id v56 = a7;
  id v15 = a8;
  id v16 = [v14 preferredMessagingOptionsForCommands];
  uint64_t v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    uint64_t Names = AFDeviceMessagingOptionsGetNames(v16);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(Names);
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteCommand:onPeer:allowsRelay:t"
                         "hroughProxyDevice:executionContext:completion:]";
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v68) = v54;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s preferred routing options: %@, allows relay: %d",  buf,  0x1Cu);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000LL;
  id v68 = sub_1002DC5B4;
  id v69 = sub_1002DC5C4;
  id v70 = 0LL;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v13 aceId]);
  id v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v23 = (id)objc_claimAutoreleasedReturnValue([v24 UUIDString]);
  }

  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1002DD4D4;
  v57[3] = &unk_1004FAAF8;
  id v25 = v15;
  id v59 = v25;
  double v60 = buf;
  id v26 = v23;
  id v58 = v26;
  id v27 = objc_retainBlock(v57);
  if ((v16 & 1) != 0 || !_AFPreferencesCompanionMessagingEnabled())
  {
    unint64_t v43 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 4kdebug_trace(722470064LL, 0LL, 0LL, 0LL, 0LL) = @"ids";

    double v44 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    uint64_t v47 = AFAnalyticsContextCreateWithCommand(v13, v45, v46);
    id v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    v62[1] = v26;
    v63[0] = v48;
    uint64_t v49 = *(void *)(*(void *)&buf[8] + 40LL);
    v61[0] = @"transport type";
    v61[1] = @"id";
    v62[0] = v49;
    BOOL v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v61,  2LL));
    v63[1] = v50;
    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL));
    uint64_t v52 = AFAnalyticsContextsMerge();
    id v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    [v44 logEventWithType:4801 context:v53];

    id v42 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
    [v42 startRemoteExecution:v13 onPeer:v14 allowsRelay:0 throughProxyDevice:0 executionContext:v56 completion:v27];
  }

  else
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 currentRequestId]);
    [v28 pushContextSnapshotForCurrentRequestWithID:v30 toDevice:v14];

    -[ADCommandCenter _addExecutionDevice:forCommandExecutionContext:]( self,  "_addExecutionDevice:forCommandExecutionContext:",  v14,  v56);
    __int16 v31 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 4kdebug_trace(722470064LL, 0LL, 0LL, 0LL, 0LL) = @"rapport";

    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    uint64_t v35 = AFAnalyticsContextCreateWithCommand(v13, v33, v34);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v65[1] = v26;
    v66[0] = v36;
    uint64_t v37 = *(void *)(*(void *)&buf[8] + 40LL);
    v64[0] = @"transport type";
    v64[1] = @"id";
    v65[0] = v37;
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v65,  v64,  2LL));
    v66[1] = v38;
    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 2LL));
    uint64_t v40 = AFAnalyticsContextsMerge();
    id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    [v32 logEventWithType:4801 context:v41];

    id v42 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
    [v42 startRemoteExecution:v13 onPeer:v14 allowsRelay:v54 throughProxyDevice:v55 executionContext:v56 completion:v27];
  }

  _Block_object_dispose(buf, 8);
}

- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onSpecifiedDeviceTypes:(unint64_t)a4 preferredMessagingOption:(unint64_t)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v33 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceTypes:pr"
          "eferredMessagingOption:allowFallbackOnAWDL:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _selectedSharedUserID](self, "_selectedSharedUserID"));
  if ([v18 length])
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v19 logEventWithType:6116 context:0];
  }

  if (-[ADCommandCenter _remoteExecute_shouldSendCommandToPrimaryUser:]( self,  "_remoteExecute_shouldSendCommandToPrimaryUser:",  v18))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( -[ADCommandCenter _remoteExecute_primaryUserDevicesWithTypes:]( self,  "_remoteExecute_primaryUserDevicesWithTypes:",  a4));
    if ([v20 count])
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1002DD3C0;
      v26[3] = &unk_1004FAB20;
      unint64_t v30 = a5;
      void v26[4] = self;
      id v27 = v14;
      BOOL v31 = v10;
      id v28 = v15;
      id v29 = v16;
      [v20 enumerateObjectsUsingBlock:v26];
    }

    else
    {
      id v25 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v33 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceType"
              "s:preferredMessagingOption:allowFallbackOnAWDL:executionContext:completion:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s No eligible devices from primary user found for specified device types. Skipping.",  buf,  0xCu);
      }
    }
  }

  else
  {
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sharedUsersBySharedUserID]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v18]);

    id v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v33 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceTypes:"
            "preferredMessagingOption:allowFallbackOnAWDL:executionContext:completion:]";
      __int16 v34 = 2112;
      uint64_t v35 = v18;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s Executing command on shared user companion device with sharedUserID: %@",  buf,  0x16u);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v20 companionAssistantID]);
    -[ADCommandCenter _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantId:allowFallbackOnAWDL:executionContext:completion:]( self,  "_remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantId:allowFallbackOnAWDL:executionContext:completion:",  v14,  v24,  v10,  v15,  v16);
  }
}

- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onDeviceForAssistantId:(id)a4 allowFallbackOnAWDL:(BOOL)a5 executionContext:(id)a6 completion:(id)a7
{
  BOOL v48 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v71 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantId:al"
          "lowFallbackOnAWDL:executionContext:completion:]";
    __int16 v72 = 2112;
    id v73 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Executing command on device for assistant id: %@",  buf,  0x16u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
  uint64_t v17 = v16;
  uint64_t v49 = v16;
  if (v12)
  {
    id v47 = v11;
    char v69 = 0;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_1002DD010;
    v67[3] = &unk_1004FD2E8;
    id v18 = v12;
    id v68 = v18;
    id v19 = +[AFPeerInfo newWithBuilder:](&OBJC_CLASS___AFPeerInfo, "newWithBuilder:", v67);
    id v20 = sub_10016563C(v19, &v69);
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (v69) {
      id v22 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v21);
    }
    else {
      id v22 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue([v17 peerInfoForAssistantId:v18 allowNonPeers:1]);
    }
    id v23 = v22;
    if (v22)
    {
      BOOL v24 = 0LL;
    }

    else
    {
      id v25 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v71 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantI"
              "d:allowFallbackOnAWDL:executionContext:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "%s Unable to retrieve peer info from device circle manager or peer cloud service",  buf,  0xCu);
      }

      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 idsDeviceUniqueIdentifierForDeviceWithAssistantId:v18]);

      id v28 = [v27 length];
      BOOL v24 = v28 == 0LL;
      id v29 = (os_log_s *)AFSiriLogContextDaemon;
      if (v28)
      {
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v71 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistan"
                "tId:allowFallbackOnAWDL:executionContext:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Creating faux peer element", buf, 0xCu);
        }

        unint64_t v30 = -[ADPeerInfo initWithUniqueIdentifer:]( objc_alloc(&OBJC_CLASS___ADPeerInfo),  "initWithUniqueIdentifer:",  v27);
      }

      else
      {
        BOOL v31 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
        if (v31)
        {
          *(_DWORD *)__int128 buf = 136315138;
          id v71 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistan"
                "tId:allowFallbackOnAWDL:executionContext:completion:]";
          _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "%s Falling back to basic peer info with only assistantId set",  buf,  0xCu);
        }

        if (AFIsInternalInstall(v31))
        {
          log = (os_log_s *)AFSiriLogContextPerformance;
          os_signpost_id_t v32 = os_signpost_id_generate(AFSiriLogContextPerformance);
          if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v33 = v32;
            if (os_signpost_enabled(log))
            {
              *(_WORD *)__int128 buf = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  log,  OS_SIGNPOST_EVENT,  v33,  "PeerWithOnlyAssistantId",  (const char *)&unk_1004B87EF,  buf,  2u);
            }
          }
        }

        unint64_t v30 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v19);
      }

      id v23 = v30;
    }

    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v18 uppercaseString]);
    -[ADPeerInfo setAssistantIdentifier:](v23, "setAssistantIdentifier:", v34);

    id v11 = v47;
    if (!v23) {
      goto LABEL_28;
    }
  }

  else
  {
    id v23 = (ADPeerInfo *)objc_claimAutoreleasedReturnValue([v16 companionPeer]);
    BOOL v24 = 0LL;
    if (!v23) {
      goto LABEL_28;
    }
  }

  if (!-[ADCommandCenter _isFauxPeer:](self, "_isFauxPeer:", v23))
  {
LABEL_31:
    -[ADCommandCenter _remoteExecute_remoteDeviceExecuteSerializedCommand:onPeer:allowsRelay:allowFallbackOnAWDL:executionContext:completion:]( self,  "_remoteExecute_remoteDeviceExecuteSerializedCommand:onPeer:allowsRelay:allowFallbackOnAWDL:executionContext:completion:",  v11,  v23,  v24,  v48,  v13,  v14);
    goto LABEL_32;
  }

- (void)_remoteExecute_remoteDeviceExecuteSerializedCommand:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  BOOL v54 = a5;
  id v56 = a3;
  id v13 = a4;
  id v57 = a7;
  id v14 = a8;
  id v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand"
                                    ":onPeer:allowsRelay:allowFallbackOnAWDL:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v84 = 0x3032000000LL;
  __int16 v85 = sub_1002DC5B4;
  id v86 = sub_1002DC5C4;
  id v87 = 0LL;
  BOOL v53 = v10;
  id v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v55 UUIDString]);
  uint64_t v17 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currentRequestId]);
  id v20 = -[NSUUID initWithUUIDString:](v17, "initWithUUIDString:", v19);

  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v57 info]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 turnId]);

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_1002DCA90;
  v67[3] = &unk_1004FAB98;
  id v23 = v14;
  id v71 = v23;
  void v67[4] = self;
  BOOL v24 = v20;
  id v68 = v24;
  id v25 = v22;
  id v69 = v25;
  p___int128 buf = &buf;
  id v26 = v16;
  id v70 = v26;
  id v27 = objc_retainBlock(v67);
  if (!v13)
  {
    uint64_t v35 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 4kdebug_trace(722470064LL, 0LL, 0LL, 0LL, 0LL) = @"ids";

    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    uint64_t v37 = *(void *)(*((void *)&buf + 1) + 40LL);
    v81[0] = @"transport type";
    v81[1] = @"id";
    v82[0] = v37;
    v82[1] = v26;
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v82,  v81,  2LL));
    [v36 logEventWithType:4801 context:v38];

    -[ADSharedDataService executeRemoteCommand:completion:]( self->_sharedDataService,  "executeRemoteCommand:completion:",  v56,  v27);
    -[ADCommandCenter _logExecuteOnRemoteRequestForRequestId:turnId:event:]( self,  "_logExecuteOnRemoteRequestForRequestId:turnId:event:",  v24,  v25,  0LL);
    goto LABEL_12;
  }

  if (-[ADCommandCenter _peerIsPairedWatch:](self, "_peerIsPairedWatch:", v13)
    || (BOOL v28 = -[ADCommandCenter _peerIsPairedPhone:](self, "_peerIsPairedPhone:", v13)))
  {
    unint64_t v30 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v79 = 136315138;
      id v80 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onPeer:allowsRelay:allo"
            "wFallbackOnAWDL:executionContext:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%s Sending command to paired watch or phone through Rapport.",  v79,  0xCu);
    }

    BOOL v31 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_1002DCE3C;
    v60[3] = &unk_1004FABC0;
    v65[1] = &buf;
    v65[0] = v27;
    id v61 = v26;
    id v62 = v56;
    id v63 = v13;
    BOOL v66 = v54;
    id v64 = v57;
    [v31 executeCommand:v62 onPeer:v63 executionContext:v64 completion:v60];

    -[ADCommandCenter _logExecuteOnRemoteRequestForRequestId:turnId:event:]( self,  "_logExecuteOnRemoteRequestForRequestId:turnId:event:",  v24,  v25,  0LL);
    os_signpost_id_t v32 = (void **)v65;
    os_signpost_id_t v33 = v61;
  }

  else
  {
    if (!AFSupportsHALOnDemandRapportConnection(v28, v29))
    {
      if (_AFPreferencesCompanionMessagingEnabled()
        && [v13 preferredMessagingOptionsForCommands] != (id)1)
      {
        if (!v54)
        {
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _contextManager](self, "_contextManager"));
          id v47 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _currentRequest](self, "_currentRequest"));
          BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v47 currentRequestId]);
          [v46 pushContextSnapshotForCurrentRequestWithID:v48 toDevice:v13];
        }

        -[ADCommandCenter _addExecutionDevice:forCommandExecutionContext:]( self,  "_addExecutionDevice:forCommandExecutionContext:",  v13,  v57);
        uint64_t v49 = *(void **)(*((void *)&buf + 1) + 40LL);
        *(void *)(*((void *)&buf + 1) + 4kdebug_trace(722470064LL, 0LL, 0LL, 0LL, 0LL) = @"rapport";

        BOOL v50 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
        uint64_t v51 = *(void *)(*((void *)&buf + 1) + 40LL);
        v75[0] = @"transport type";
        v75[1] = @"id";
        v76[0] = v51;
        v76[1] = v26;
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v76,  v75,  2LL));
        [v50 logEventWithType:4801 context:v52];

        -[ADCommandCenter _logExecuteOnRemoteRequestForRequestId:turnId:event:]( self,  "_logExecuteOnRemoteRequestForRequestId:turnId:event:",  v24,  v25,  0LL);
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
        [v34 startRemoteSerialzedCommandExecution:v56 onPeer:v13 allowsRelay:v54 allowFallbackOnAWDL:v53 executionContext:v57 completion:v27];
      }

      else
      {
        char v42 = *(void **)(*((void *)&buf + 1) + 40LL);
        *(void *)(*((void *)&buf + 1) + 4kdebug_trace(722470064LL, 0LL, 0LL, 0LL, 0LL) = @"ids";

        unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
        uint64_t v44 = *(void *)(*((void *)&buf + 1) + 40LL);
        v73[0] = @"transport type";
        v73[1] = @"id";
        v74[0] = v44;
        v74[1] = v26;
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  2LL));
        [v43 logEventWithType:4801 context:v45];

        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
        [v34 startRemoteSerialzedCommandExecution:v56 onPeer:v13 allowsRelay:v54 allowFallbackOnAWDL:0 executionContext:v57 completion:v27];
      }

      goto LABEL_10;
    }

    unsigned int v39 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v79 = 136315138;
      id v80 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_remoteDeviceExecuteSerializedCommand:onPeer:allowsRelay:allo"
            "wFallbackOnAWDL:executionContext:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%s Sending command to peer through #on-demand Rapport connection.",  v79,  0xCu);
    }

    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    v77[0] = @"transport type";
    v77[1] = @"id";
    v78[0] = @"rapport";
    v78[1] = v26;
    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v78,  v77,  2LL));
    [v40 logEventWithType:4801 context:v41];

    os_signpost_id_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_1002DD004;
    v58[3] = &unk_1004FC7C0;
    id v59 = v27;
    [v33 executeCommand:v56 onPeer:v13 executionContext:v57 throughOnDemandRapportConnection:v58];
    os_signpost_id_t v32 = (void **)&v59;
  }

  __int16 v34 = *v32;
LABEL_10:

LABEL_12:
  _Block_object_dispose(&buf, 8);
}

- (void)_saExecuteOnRemoteRequest:(id)a3 executionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v36 = "-[ADCommandCenter(RemoteExecute) _saExecuteOnRemoteRequest:executionContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 serializedCommand]);
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 personaId]);
    [v8 setPersonaId:0];
    id v30 = v9;
    [v9 setPersonaId:v13];
    -[ADCommandCenter _addNetworkActivityTracingForLabel:start:withCompletionReason:andError:]( self,  "_addNetworkActivityTracingForLabel:start:withCompletionReason:andError:",  7LL,  1LL,  0LL,  0LL);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1002DC8A8;
    v31[3] = &unk_1004FABE8;
    id v14 = v8;
    id v32 = v14;
    os_signpost_id_t v33 = self;
    id v34 = v10;
    uint64_t v29 = objc_retainBlock(v31);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteDevice]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 assistantId]);

    id v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ad_recipientDevicesType"));
    if ([v17 isEqualToString:@"MobileDevices"])
    {
      uint64_t v18 = 2LL;
    }

    else if ([v17 isEqualToString:@"HomeDevices"])
    {
      uint64_t v18 = 4LL;
    }

    else if ([v17 isEqualToString:@"Companion"])
    {
      uint64_t v18 = 1LL;
    }

    else if ([v17 isEqualToString:@"All"])
    {
      uint64_t v18 = 7LL;
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    id v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ad_preferredMessagingOption"));
    if ([v20 isEqualToString:@"IDS"])
    {
      uint64_t v21 = 1LL;
    }

    else if ([v20 isEqualToString:@"Rapport"])
    {
      uint64_t v21 = 2LL;
    }

    else if ([v20 isEqualToString:@"Bluetooth"])
    {
      uint64_t v21 = 1024LL;
    }

    else if ([v20 isEqualToString:@"Wifi"])
    {
      uint64_t v21 = 2048LL;
    }

    else if ([v20 isEqualToString:@"Cloud"])
    {
      uint64_t v21 = 4096LL;
    }

    else if ([v20 isEqualToString:@"All"])
    {
      uint64_t v21 = 7171LL;
    }

    else
    {
      uint64_t v21 = 0LL;
    }

    if ([v16 length] || !v18)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteDevice]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 assistantId]);
      id v27 = [v14 shouldFallbackOnAWDL];
      BOOL v28 = self;
      BOOL v24 = v29;
      id v9 = v30;
      -[ADCommandCenter _remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantId:allowFallbackOnAWDL:executionContext:completion:]( v28,  "_remoteExecute_remoteDeviceExecuteSerializedCommand:onDeviceForAssistantId:allowFallbackOnAWDL:executionContext:completion:",  v12,  v26,  v27,  v30,  v29);
    }

    else
    {
      id v22 = [v14 shouldFallbackOnAWDL];
      id v23 = self;
      BOOL v24 = v29;
      id v9 = v30;
      -[ADCommandCenter _remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceTypes:preferredMessagingOption:allowFallbackOnAWDL:executionContext:completion:]( v23,  "_remoteExecute_remoteDeviceExecuteSerializedCommand:onSpecifiedDeviceTypes:preferredMessagingOption:allowFallbac kOnAWDL:executionContext:completion:",  v12,  v18,  v21,  v22,  v30,  v29);
    }
  }

  else
  {
    id v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v36 = "-[ADCommandCenter(RemoteExecute) _saExecuteOnRemoteRequest:executionContext:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Unable to find command for remote execution",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 11LL));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v13);
  }
}

- (BOOL)_remoteExecute_shouldSendCommandToPrimaryUser:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryUser]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sharedUserID]);
    unsigned __int8 v8 = [v7 isEqualToString:v3];

    if ((v8 & 1) != 0)
    {
      BOOL v9 = 0LL;
      uint64_t v10 = 1LL;
      goto LABEL_7;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedUsersBySharedUserID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v3]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 companionAssistantID]);
    BOOL v9 = v14 == 0LL;
  }

  else
  {
    BOOL v9 = 0LL;
  }

  uint64_t v10 = 0LL;
LABEL_7:
  if (v4) {
    int v15 = v10;
  }
  else {
    int v15 = 1;
  }
  uint64_t v16 = v15 | v9;
  id v17 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    BOOL v19 = v4 == 0LL;
    id v20 = v17;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
    int v25 = 136316162;
    id v26 = "-[ADCommandCenter(RemoteExecute) _remoteExecute_shouldSendCommandToPrimaryUser:]";
    __int16 v27 = 2112;
    BOOL v28 = v21;
    __int16 v29 = 2112;
    id v30 = v22;
    __int16 v31 = 2112;
    id v32 = v23;
    __int16 v33 = 2112;
    id v34 = v24;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s shouldSendToPrimaryUser: %@ (isSharedUserNil=%@, isServerSelectedUserEqualToPrimaryUser=%@, isServerSelectedSha redUserInvalid=%@)",  (uint8_t *)&v25,  0x34u);
  }

  return v16;
}

- (id)_remoteExecute_primaryUserDevicesWithTypes:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peers]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002DC728;
  v11[3] = &unk_1004FAC08;
  void v11[4] = a3;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v11));
  [v7 filterUsingPredicate:v8];

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7));
  return v9;
}

- (void)startRemoteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002DC714;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 withContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v47 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 handoffOriginDeviceName]);

  if (!v13)
  {
    if ([v47 isEndpoint])
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentAccessoryInfo]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);

      [v10 setHandoffOriginDeviceName:v17];
    }

    else
    {
      uint64_t v18 = AFUserAssignedDeviceName();
      int v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
      [v10 setHandoffOriginDeviceName:v15];
    }
  }

  if (AFIsNano(v14))
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _sharedDataService](self, "_sharedDataService"));
    [v19 startRemoteRequest:v10 completion:v12];
  }

  else
  {
    id v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADCommandCenter(RemoteExecute) _startRemoteRequest:onPeer:withContext:completion:]";
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }

    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
    if (v11) {
      id v46 = v11;
    }
    else {
      id v46 = (id)objc_claimAutoreleasedReturnValue([v44 companionPeer]);
    }
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID", v44));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);

    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000LL;
    id v59 = sub_1002DC5B4;
    id v60 = sub_1002DC5C4;
    id v61 = 0LL;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    void v48[2] = sub_1002DC5CC;
    v48[3] = &unk_1004FAC30;
    id v50 = v12;
    uint64_t v51 = buf;
    id v23 = v22;
    id v49 = v23;
    BOOL v24 = objc_retainBlock(v48);
    int v25 = _AFPreferencesCompanionMessagingEnabled();
    id v26 = *(void **)(*(void *)&buf[8] + 40LL);
    if (v25)
    {
      *(void *)(*(void *)&buf[8] + 4kdebug_trace(722470064LL, 0LL, 0LL, 0LL, 0LL) = @"rapport";

      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      uint64_t v28 = AFAnalyticsContextCreateWithRequestInfo(v10);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v56[1] = v23;
      v57[0] = v29;
      uint64_t v30 = *(void *)(*(void *)&buf[8] + 40LL);
      v55[0] = @"transport type";
      v55[1] = @"id";
      v56[0] = v30;
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));
      v57[1] = v31;
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL));
      uint64_t v33 = AFAnalyticsContextsMerge();
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      [v27 logEventWithType:4803 context:v34];

      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
      [v35 startRemoteRequest:v10 onPeer:v46 completion:v24];
    }

    else
    {
      *(void *)(*(void *)&buf[8] + 4kdebug_trace(722470064LL, 0LL, 0LL, 0LL, 0LL) = @"ids";

      id v36 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      uint64_t v37 = AFAnalyticsContextCreateWithRequestInfo(v10);
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v53[1] = v23;
      v54[0] = v38;
      uint64_t v39 = *(void *)(*(void *)&buf[8] + 40LL);
      v52[0] = @"transport type";
      v52[1] = @"id";
      v53[0] = v39;
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  2LL));
      v54[1] = v40;
      id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
      uint64_t v42 = AFAnalyticsContextsMerge();
      unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      [v36 logEventWithType:4803 context:v43];

      [v45 startRemoteRequest:v10 onPeer:v46 completion:v24];
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
  -[ADCommandCenter _startRemoteRequest:onPeer:withContext:completion:]( self,  "_startRemoteRequest:onPeer:withContext:completion:",  v10,  v9,  v11,  v8);
}

- (void)startRemoteRequest:(id)a3 onTargetDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v12 = AFSupportsMultiUser(v10, v11);
  if (v9 && v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002DC384;
    v14[3] = &unk_1004FAC58;
    id v15 = v9;
    uint64_t v16 = self;
    id v17 = v8;
    id v18 = v10;
    [v13 getIDSIdentifierForAssistantId:v15 completion:v14];
  }

  else
  {
    -[ADCommandCenter startRemoteRequest:completion:](self, "startRemoteRequest:completion:", v8, v10);
  }
}

- (BOOL)_peerIsPairedWatch:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 rapportEffectiveIdentifier]);
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Watch"];

  return v4;
}

- (BOOL)_peerIsPairedPhone:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 rapportEffectiveIdentifier]);
  unsigned __int8 v4 = [v3 isEqualToString:@"BTPipe-Phone"];

  return v4;
}

- (BOOL)_isFauxPeer:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDeviceUniqueIdentifier]);
  if (v4)
  {
    BOOL v5 = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 idsIdentifier]);
    if (v6)
    {
      BOOL v5 = 0;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 rapportEffectiveIdentifier]);
      if (v7)
      {
        BOOL v5 = 0;
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 homeKitAccessoryIdentifier]);
        BOOL v5 = v8 == 0LL;
      }
    }
  }

  return v5;
}

- (id)_locationManager
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 locationManager]);

  return v3;
}

- (void)_sendLocationIfNeededForRequest
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _locationManager](self, "_locationManager"));
  if (([v3 needsToSendLocation] & 1) != 0
    || [v3 isNavigating])
  {
    [v3 setNeedsToSendLocation:0];
    unsigned __int8 v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v7 = "-[ADCommandCenter(LocationInternal) _sendLocationIfNeededForRequest]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Location manager says we need to send location for this request",  buf,  0xCu);
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10033E558;
    v5[3] = &unk_1004FCDD8;
    void v5[4] = self;
    [v3 updateLocationForCommand:0 completion:v5];
  }
}

- (void)fetchLocationAuthorization:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10033EA28;
    v6[3] = &unk_1004FD990;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)showingVisibleAssistantUIForReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10033E9E0;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)dismissedAllVisibleAssistantUIForReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10033E98C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchLastLocationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ADCommandCenter _queue](self, "_queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10033E934;
    v6[3] = &unk_1004FD990;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

@end