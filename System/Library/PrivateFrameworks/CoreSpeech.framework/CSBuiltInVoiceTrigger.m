@interface CSBuiltInVoiceTrigger
- (BOOL)_hasHFPDuringPhoneCall;
- (BOOL)_hasHearstRoutedAndNotInSplitter;
- (BOOL)_hasPhoneCallOnNonBargeInDevice;
- (BOOL)_isBuiltInAOPVoiceTriggerEvent:(id)a3;
- (BOOL)_isVoiceTriggerStateTransitionEvent:(id)a3;
- (BOOL)_shouldCancelSecondPassResultWithVoiceTriggerInfo:(id)a3;
- (BOOL)_shouldCheckHearstStatus;
- (BOOL)_shouldEnableAOPVoiceTrigger;
- (BOOL)_shouldEnableAPVoiceTrigger;
- (BOOL)_shouldHandleAOPVoiceTrigger;
- (BOOL)_shouldReuseBuiltInAudioProvider;
- (BOOL)_shouldSecondPassKeepAlive;
- (BOOL)_shouldSkipAudioChunkHandling;
- (BOOL)firstTimeAssetConfigured;
- (BOOL)hasTriggerPending;
- (BOOL)isFirstExclaveAudioBuffer;
- (BOOL)isJarvisConnected;
- (BOOL)isListenPollingStarting;
- (BOOL)isPhraseSpotterBypassed;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (BOOL)shouldDisableOnSpeakerVerificationInSplitterMode;
- (BOOL)voiceTriggerEnabled;
- (CSAdBlockerProviding)adBlocker;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor;
- (CSAudioStream)audioStream;
- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4;
- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4 withAudioRouteChangeMonitor:(id)a5;
- (CSExclaveAssetsControlling)exclaveAssetsController;
- (CSExclaveFirstPassVoiceTriggerAnalyzing)exclaveClient;
- (CSKeywordAnalyzerNDAPIResult)lastTriggeredOnsetResult;
- (CSKeywordAnalyzerNDAPIResult)onsetResult;
- (CSOSTransaction)secondPassTransaction;
- (CSPolicy)voiceTriggerAPModeSuspendPolicy;
- (CSPolicy)voiceTriggerStartPolicy;
- (CSSecondPassProgressDelegate)secondPassProgressDelegate;
- (CSSpeechManager)speechManager;
- (CSStateCapture)stateCapture;
- (CSStateMachine)stateMachine;
- (CSVoiceTriggerAlwaysOnProcessor)alwaysOnProcessorController;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassConfig)firstPassConfig;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSDictionary)channelSelectionScores;
- (NSMutableArray)assetConfigWaitingBuffer;
- (NSMutableArray)audioStreamHoldings;
- (NSMutableArray)keywordAnalyzersNDAPI;
- (NSNumber)firstPassMyriadGoodness;
- (NSString)name;
- (OS_dispatch_group)recordingWillStartGroup;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)validationTimer;
- (float)bestScore;
- (id)_eventName:(unint64_t)a3;
- (id)_firstPassVoiceTriggerSignalEstimate;
- (id)_stateName:(unint64_t)a3;
- (id)_voiceTriggerFirstPassInfoFromAP;
- (int64_t)_currentJarvisTriggerMode;
- (int64_t)hearstRouteStatus;
- (unint64_t)_currentState;
- (unint64_t)attSiriState;
- (unint64_t)bestChannel;
- (unint64_t)channelSelectionDelay;
- (unint64_t)currentSplitterState;
- (unint64_t)delayInSamplesRequiredForChannelSelection;
- (unint64_t)heartbeatFactor;
- (unint64_t)lastSelfTriggerDetectedStartMachTime;
- (unint64_t)lastTriggeredBestChannel;
- (unint64_t)onsetChannel;
- (unint64_t)phoneCallState;
- (unint64_t)processingChunkSamples;
- (unsigned)jarvisTriggerModeLogHeartbeat;
- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5;
- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)CSVoiceTriggerXPCServiceProxy:(id)a3 bypassPhraseSpotter:(BOOL)a4;
- (void)_APModeValidationTimerFired;
- (void)_addAudioStreamHold:(id)a3;
- (void)_cancelAllAudioStreamHold;
- (void)_cancelLastAudioStreamHold;
- (void)_createSecondPassIfNeededWithFirstPassSource:(unint64_t)a3;
- (void)_handleAudioChunk:(id)a3;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_handleVoiceTriggerSecondPassWithSource:(unint64_t)a3 deviceId:(id)a4 event:(id)a5 audioProviderUUID:(id)a6 firstPassInfo:(id)a7;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_notifyEvent:(unint64_t)a3;
- (void)_receivedHearstRoutedEvent:(int64_t)a3;
- (void)_receivedJarvisConnectionEvent:(BOOL)a3;
- (void)_reportVoiceTriggerFirstPassFireFromAPWithSource:(unint64_t)a3 voiceTriggerFirstPassInfo:(id)a4;
- (void)_requestStartAudioStreamWithSource:(unint64_t)a3 context:(id)a4 completion:(id)a5;
- (void)_reset;
- (void)_resetFirstExclaveAudioBufferMarkerIfNeeded;
- (void)_setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4;
- (void)_setIsSecondPassRunning:(BOOL)a3;
- (void)_setupStateMachine;
- (void)_startAOPVoiceTrigger;
- (void)_startAPVoiceTriggerWithCompletion:(id)a3;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_startVoiceTriggerWithCompletion:(id)a3;
- (void)_stopAOPVoiceTrigger;
- (void)_stopAPVoiceTrigger;
- (void)_stopListening;
- (void)_teardownSecondPassIfNeeded;
- (void)_transitAOPModeIfNeeded:(BOOL)a3;
- (void)_transitAOPModeIfNeededAsync:(BOOL)a3;
- (void)_transitAOPModeIfNeededSync:(BOOL)a3;
- (void)_transitVoiceTriggerStatus:(BOOL)a3 force:(BOOL)a4;
- (void)_updateCurrentSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)attSiriStateMonitor:(id)a3 didRecieveAttSiriStateChange:(unint64_t)a4;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7;
- (void)cancelSecondPassRunning;
- (void)didIgnoreEvent:(int64_t)a3 from:(int64_t)a4;
- (void)didTransitFrom:(int64_t)a3 to:(int64_t)a4 by:(int64_t)a5;
- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4;
- (void)reset;
- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4;
- (void)setAdBlocker:(id)a3;
- (void)setAlwaysOnProcessorController:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4;
- (void)setAssetConfigWaitingBuffer:(id)a3;
- (void)setAttSiriState:(unint64_t)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioRouteChangeMonitor:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHoldings:(id)a3;
- (void)setBestChannel:(unint64_t)a3;
- (void)setBestScore:(float)a3;
- (void)setChannelSelectionDelay:(unint64_t)a3;
- (void)setChannelSelectionScores:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentSplitterState:(unint64_t)a3;
- (void)setDelayInSamplesRequiredForChannelSelection:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExclaveAssetsController:(id)a3;
- (void)setExclaveClient:(id)a3;
- (void)setFirstPassConfig:(id)a3;
- (void)setFirstPassMyriadGoodness:(id)a3;
- (void)setFirstTimeAssetConfigured:(BOOL)a3;
- (void)setHasTriggerPending:(BOOL)a3;
- (void)setHearstRouteStatus:(int64_t)a3;
- (void)setHeartbeatFactor:(unint64_t)a3;
- (void)setIsFirstExclaveAudioBuffer:(BOOL)a3;
- (void)setIsJarvisConnected:(BOOL)a3;
- (void)setIsListenPollingStarting:(BOOL)a3;
- (void)setIsPhraseSpotterBypassed:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setJarvisTriggerModeLogHeartbeat:(unsigned __int8)a3;
- (void)setKeywordAnalyzersNDAPI:(id)a3;
- (void)setLastSelfTriggerDetectedStartMachTime:(unint64_t)a3;
- (void)setLastTriggeredBestChannel:(unint64_t)a3;
- (void)setLastTriggeredOnsetResult:(id)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setName:(id)a3;
- (void)setOnsetChannel:(unint64_t)a3;
- (void)setOnsetResult:(id)a3;
- (void)setPhoneCallState:(unint64_t)a3;
- (void)setProcessingChunkSamples:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingWillStartGroup:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSecondPassProgressDelegate:(id)a3;
- (void)setSecondPassTransaction:(id)a3;
- (void)setShouldDisableOnSpeakerVerificationInSplitterMode:(BOOL)a3;
- (void)setSpeechManager:(id)a3;
- (void)setStateCapture:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setValidationTimer:(id)a3;
- (void)setVoiceTriggerAPModeSuspendPolicy:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)setVoiceTriggerStartPolicy:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
@end

@implementation CSBuiltInVoiceTrigger

- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4 withAudioRouteChangeMonitor:(id)a5
{
  v8 = (dispatch_queue_s *)a3;
  id v9 = a4;
  id v10 = a5;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___CSBuiltInVoiceTrigger;
  v11 = -[CSBuiltInVoiceTrigger init](&v48, "init");
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("VoiceTrigger First Pass Queue", 0LL);
    v13 = (void *)*((void *)v11 + 7);
    *((void *)v11 + 7) = v12;

    if (v8) {
      dispatch_set_target_queue(*((dispatch_object_t *)v11 + 7), v8);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"builtInVoiceTrigger-%@",  v15));
    [v11 setName:v16];

    if (CSHasAOP([v11 _setupStateMachine]))
    {
      v17 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerAlwaysOnProcessor);
      v18 = (void *)*((void *)v11 + 27);
      *((void *)v11 + 27) = v17;
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAPModeSuspendPolicyFactory policy]( &OBJC_CLASS___CSVoiceTriggerAPModeSuspendPolicyFactory,  "policy"));
    v20 = (void *)*((void *)v11 + 25);
    *((void *)v11 + 25) = v19;

    if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[CSExclaveMessageHandlingFactory exclaveFirstPassVoiceTriggerAnalyzer]( &OBJC_CLASS___CSExclaveMessageHandlingFactory,  "exclaveFirstPassVoiceTriggerAnalyzer"));
      v22 = (void *)*((void *)v11 + 44);
      *((void *)v11 + 44) = v21;

      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[CSExclaveMessageHandlingFactory exclaveAssetsController]( &OBJC_CLASS___CSExclaveMessageHandlingFactory,  "exclaveAssetsController"));
      v24 = (void *)*((void *)v11 + 45);
      *((void *)v11 + 45) = v23;

      [v11 _resetFirstExclaveAudioBufferMarkerIfNeeded];
    }

    if ([v11 _shouldSecondPassKeepAlive])
    {
      v25 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPass),  "initWithPHSEnabled:",  1LL);
      v26 = (void *)*((void *)v11 + 20);
      *((void *)v11 + 20) = v25;

      [*((id *)v11 + 20) setSecondPassClient:1];
      v27 = (void *)objc_claimAutoreleasedReturnValue([v11 delegate]);
      [*((id *)v11 + 20) setDelegate:v27];
    }

    v28 = (void **)(v11 + 304);
    objc_storeStrong((id *)v11 + 38, a4);
    if (!*((void *)v11 + 38))
    {
      uint64_t v29 = objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
      v30 = *v28;
      *v28 = (void *)v29;
    }

    v31 = (void **)(v11 + 296);
    objc_storeStrong((id *)v11 + 37, a5);
    if (!*((void *)v11 + 37))
    {
      uint64_t v32 = objc_claimAutoreleasedReturnValue(+[CSAudioRouteChangeMonitor sharedInstance](&OBJC_CLASS___CSAudioRouteChangeMonitor, "sharedInstance"));
      v33 = *v31;
      *v31 = (void *)v32;
    }

    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy]( &OBJC_CLASS___CSBuiltInVoiceTriggerEnabledPolicy,  "builtInVoiceTriggerEnabledPolicy"));
    v35 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v34;

    dispatch_group_t v36 = dispatch_group_create();
    v37 = (void *)*((void *)v11 + 28);
    *((void *)v11 + 28) = v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v39 = (void *)*((void *)v11 + 22);
    *((void *)v11 + 22) = v38;

    v11[13] = 0;
    *((void *)v11 + 29) = 0LL;
    v11[15] = 0;
    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v41 = (void *)*((void *)v11 + 31);
    *((void *)v11 + 31) = v40;

    *((void *)v11 + 39) = 0LL;
    +[CSConfig inputRecordingBufferDuration](&OBJC_CLASS___CSConfig, "inputRecordingBufferDuration");
    *((void *)v11 + 40) = (unint64_t)(2.0 / v42);
    v11[17] = 0;
    v43 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerUserSelectedPhrase),  "initWithEndpointId:",  0LL);
    v44 = (void *)*((void *)v11 + 43);
    *((void *)v11 + 43) = v43;

    v45 = objc_alloc_init(&OBJC_CLASS___CSStateCapture);
    v46 = (void *)*((void *)v11 + 41);
    *((void *)v11 + 41) = v45;
  }

  return (CSBuiltInVoiceTrigger *)v11;
}

- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4
{
  return -[CSBuiltInVoiceTrigger initWithTargetQueue:withSpeechManager:withAudioRouteChangeMonitor:]( self,  "initWithTargetQueue:withSpeechManager:withAudioRouteChangeMonitor:",  a3,  a4,  0LL);
}

- (void)start
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_group_t v36 = "-[CSBuiltInVoiceTrigger start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
  voiceTriggerStartPolicy = self->_voiceTriggerStartPolicy;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10013EB8C;
  v33[3] = &unk_10022E430;
  objc_copyWeak(&v34, (id *)buf);
  -[CSPolicy setCallback:](voiceTriggerStartPolicy, "setCallback:", v33);
  if (-[CSPolicy isEnabled](self->_voiceTriggerStartPolicy, "isEnabled"))
  {
    -[CSBuiltInVoiceTrigger _transitVoiceTriggerStatus:force:](self, "_transitVoiceTriggerStatus:force:", 1LL, 0LL);
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013EC88;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }

  voiceTriggerAPModeSuspendPolicy = self->_voiceTriggerAPModeSuspendPolicy;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10013EC90;
  v30[3] = &unk_10022E430;
  objc_copyWeak(&v31, (id *)buf);
  if (CSHasAOP(-[CSPolicy setCallback:](voiceTriggerAPModeSuspendPolicy, "setCallback:", v30)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSDeviceActivationEventNotificationHandler sharedInstance]( &OBJC_CLASS___CSDeviceActivationEventNotificationHandler,  "sharedInstance"));
    [v7 setDelegate:self forType:1];
    [v7 start];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
  [v8 registerObserver:self];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v9 addObserver:self];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVCRecordingClientMonitor sharedInstance]( &OBJC_CLASS___CSAVVCRecordingClientMonitor,  "sharedInstance"));
  [v10 addObserver:self];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
  [v11 addObserver:self];

  dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSAttSiriStateMonitor sharedInstance](&OBJC_CLASS___CSAttSiriStateMonitor, "sharedInstance"));
  [v12 addObserver:self];

  v13 = (dispatch_queue_s *)self->_queue;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10013ED80;
  v29[3] = &unk_10022F100;
  v29[4] = self;
  dispatch_async(v13, v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
  [v14 addObserver:self];

  -[CSAudioRouteChangeMonitor addObserver:](self->_audioRouteChangeMonitor, "addObserver:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSBluetoothWirelessSplitterMonitor sharedInstance]( &OBJC_CLASS___CSBluetoothWirelessSplitterMonitor,  "sharedInstance"));
  [v15 addObserver:self];

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSBluetoothWirelessSplitterMonitor sharedInstance]( &OBJC_CLASS___CSBluetoothWirelessSplitterMonitor,  "sharedInstance"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10013EDEC;
  v28[3] = &unk_10022E480;
  v28[4] = self;
  [v16 splitterState:v28];

  if (CSIsASMacWithAOP(v17, v18)
    && +[CSUtils supportHearstVoiceTrigger](&OBJC_CLASS___CSUtils, "supportHearstVoiceTrigger"))
  {
    -[CSAudioRouteChangeMonitor addObserver:](self->_audioRouteChangeMonitor, "addObserver:", self);
    audioRouteChangeMonitor = self->_audioRouteChangeMonitor;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10013EE48;
    v27[3] = &unk_10022E4A8;
    v27[4] = self;
    -[CSAudioRouteChangeMonitor getHearstRouteStatus:](audioRouteChangeMonitor, "getHearstRouteStatus:", v27);
  }

  v20 = self->_audioRouteChangeMonitor;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10013EEA0;
  v26[3] = &unk_10022E4A8;
  v26[4] = self;
  -[CSAudioRouteChangeMonitor getHearstRouteStatus:](v20, "getHearstRouteStatus:", v26);
  uint64_t v21 = self->_audioRouteChangeMonitor;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10013EEF8;
  v25[3] = &unk_10022E4D0;
  v25[4] = self;
  -[CSAudioRouteChangeMonitor getJarvisConnected:](v21, "getJarvisConnected:", v25);
  -[CSStateCapture start](self->_stateCapture, "start");
  stateCapture = self->_stateCapture;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10013EF54;
  v23[3] = &unk_10022E520;
  objc_copyWeak(&v24, (id *)buf);
  -[CSStateCapture setStateCaptureBlock:](stateCapture, "setStateCaptureBlock:", v23);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

- (void)setAdBlocker:(id)a3
{
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013EB84;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  self->_hasTriggerPending = 0;
  self->_bestScore = -INFINITY;
  onsetResult = self->_onsetResult;
  self->_bestChannel = 0LL;
  self->_onsetResult = 0LL;

  self->_onsetChannel = 0LL;
  self->_channelSelectionDelay = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->_keywordAnalyzersNDAPI;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "reset", (void)v11);
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  channelSelectionScores = self->_channelSelectionScores;
  self->_channelSelectionScores = v9;
}

- (void)setSecondPassProgressDelegate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013EB40;
  block[3] = &unk_10022F0D8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setAsset:(id)a3
{
}

- (void)setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v14 = "-[CSBuiltInVoiceTrigger setAsset:forceExclaveToUsePreInstalledAsset:]";
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  [v6 logAssetVersionForInsight];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013EB30;
  block[3] = &unk_10022ECA8;
  void block[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)_setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v7)
  {
    if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
    {
      BOOL v8 = [v7 assetVariant] == (id)2;
      if (v4)
      {
        id v9 = (os_log_s *)CSLogCategoryVT;
        BOOL v8 = 0LL;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]";
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Falling back to preinstalled assets for EK",  buf,  0xCu);
          BOOL v8 = 0LL;
        }
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
      -[CSExclaveAssetsControlling setAssetForLocale:isOTA:completion:]( self->_exclaveAssetsController,  "setAssetForLocale:isOTA:completion:",  v10,  v8,  &stru_10022E560);
    }

    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerFirstPassConfigDecoder decodeConfigFrom:]( &OBJC_CLASS___CSVoiceTriggerFirstPassConfigDecoder,  "decodeConfigFrom:",  self->_currentAsset));
    -[CSBuiltInVoiceTrigger setFirstPassConfig:](self, "setFirstPassConfig:", v11);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
    [v12 delaySecondsForChannelSelection];
    float v14 = v13;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_delayInSamplesRequiredForChannelSelection = (unint64_t)(float)(v14 * v15);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
    [v16 processingChunkSeconds];
    float v18 = v17;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_processingChunkSamples = (unint64_t)(float)(v18 * v19);

    keywordAnalyzersNDAPI = self->_keywordAnalyzersNDAPI;
    if (keywordAnalyzersNDAPI)
    {
      -[NSMutableArray removeAllObjects](keywordAnalyzersNDAPI, "removeAllObjects");
    }

    else
    {
      v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      uint64_t v23 = self->_keywordAnalyzersNDAPI;
      self->_keywordAnalyzersNDAPI = v22;
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[CSPowerLogger sharedPowerLogger](&OBJC_CLASS___CSPowerLogger, "sharedPowerLogger"));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
    id v26 = [v25 isEnabled];
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](self->_currentAsset, "configVersion"));
    [v24 powerLogSiriConfigWithVoiceTriggerEnabled:v26 withLanguage:v27 withModelVersion:v28];

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 configPathNDAPI]);

    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self->_currentAsset, "resourcePath"));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
    id v33 = [v32 processingChannelsBitset];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10013E794;
    v36[3] = &unk_10022E588;
    id v34 = v30;
    id v37 = v34;
    uint64_t v38 = self;
    id v35 = v31;
    id v39 = v35;
    +[CSUtils iterateBitset:block:](&OBJC_CLASS___CSUtils, "iterateBitset:block:", v33, v36);

    -[CSBuiltInVoiceTrigger _reset](self, "_reset");
    if (-[CSBuiltInVoiceTrigger _shouldEnableAOPVoiceTrigger](self, "_shouldEnableAOPVoiceTrigger")) {
      -[CSBuiltInVoiceTrigger _startAOPVoiceTrigger](self, "_startAOPVoiceTrigger");
    }
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", v7);
    if (!self->_firstTimeAssetConfigured) {
      self->_firstTimeAssetConfigured = 1;
    }
  }

  else
  {
    uint64_t v21 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]";
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s asset is nil, stop initialization",  buf,  0xCu);
    }
  }
}

- (void)_setIsSecondPassRunning:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isSecondPassRunning = a3;
  p_secondPassProgressDelegate = &self->_secondPassProgressDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
  if (WeakRetained)
  {
    BOOL v8 = WeakRetained;
    int v9 = CSIsHorseman(WeakRetained, v7);

    if (v9)
    {
      if (v3)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10013E620;
        v14[3] = &unk_10022E5B0;
        v14[4] = self;
        +[CSMyriadPHash signalEstimateWithBuilder:](&OBJC_CLASS___CSMyriadPHash, "signalEstimateWithBuilder:", v14);
        double v11 = v10;
        id v12 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
        [v12 secondPassDidStartForClient:1 deviceId:0 withFirstPassEstimate:v11];
      }

      else
      {
        id v13 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
        [v13 secondPassDidStopForClient:1 deviceId:0];
      }
    }
  }

- (void)_transitVoiceTriggerStatus:(BOOL)a3 force:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013E404;
  v5[3] = &unk_10022E5D8;
  BOOL v6 = a3;
  v5[4] = self;
  BOOL v7 = a4;
  dispatch_async(queue, v5);
}

- (void)_transitAOPModeIfNeededAsync:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013E3F4;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_transitAOPModeIfNeededSync:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013E3E4;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_transitAOPModeIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    int v7 = 136315650;
    BOOL v8 = "-[CSBuiltInVoiceTrigger _transitAOPModeIfNeeded:]";
    __int16 v9 = 1024;
    unsigned int v10 = -[CSBuiltInVoiceTrigger voiceTriggerEnabled](self, "voiceTriggerEnabled");
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s voiceTriggerEnabled : %d, enable AOP mode : %d",  (uint8_t *)&v7,  0x18u);
  }

  if (-[CSBuiltInVoiceTrigger voiceTriggerEnabled](self, "voiceTriggerEnabled")) {
    -[CSBuiltInVoiceTrigger _notifyEvent:](self, "_notifyEvent:", v3);
  }
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if (-[CSPolicy isEnabled](self->_voiceTriggerAPModeSuspendPolicy, "isEnabled"))
  {
    BOOL v8 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Skip listen polling since VoiceTrigger AP mode is disabled",  buf,  0xCu);
    }

    -[CSBuiltInVoiceTrigger _notifyEvent:](self, "_notifyEvent:", 1LL);
  }

  else
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger audioStream](self, "audioStream"));
    if ([v9 isStreaming])
    {
    }

    else
    {
      BOOL voiceTriggerEnabled = self->_voiceTriggerEnabled;

      if (voiceTriggerEnabled)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_10013E1DC;
        v12[3] = &unk_10022E628;
        v12[4] = self;
        double v14 = a3;
        id v13 = v6;
        -[CSBuiltInVoiceTrigger _startListenWithCompletion:](self, "_startListenWithCompletion:", v12);

        goto LABEL_15;
      }
    }

    __int16 v11 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Skip listen polling since audio is streaming / VoiceTrigger disabled",  buf,  0xCu);
    }
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
LABEL_15:
}

- (void)_startListenWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v19 = "-[CSBuiltInVoiceTrigger _startListenWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10013DDD4;
  v16[3] = &unk_10022E650;
  id v6 = v4;
  id v17 = v6;
  int v7 = objc_retainBlock(v16);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
  unint64_t phoneCallState = self->_phoneCallState;
  uint64_t v10 = 8LL;
  if (phoneCallState != 2 && phoneCallState != 4)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXRingtoneMonitor sharedInstance](&OBJC_CLASS___CSMXRingtoneMonitor, "sharedInstance"));
    unsigned __int8 v12 = [v11 isAnyRingtoneCurrentlyPlaying];

    if ((v12 & 1) != 0)
    {
      uint64_t v10 = 8LL;
    }

    else
    {
      if (self->_phoneCallState != 3)
      {
        uint64_t v10 = 1LL;
        goto LABEL_10;
      }

      uint64_t v10 = 9LL;
    }
  }

  [v8 setIsRequestDuringActiveCall:1];
LABEL_10:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10013DDE8;
  v14[3] = &unk_10022E6A0;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  -[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]( self,  "_requestStartAudioStreamWithSource:context:completion:",  v10,  v8,  v14);
}

- (void)_requestStartAudioStreamWithSource:(unint64_t)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10013DDC0;
  v34[3] = &unk_10022E650;
  id v9 = a5;
  id v35 = v9;
  uint64_t v10 = objc_retainBlock(v34);
  unsigned int v11 = -[CSBuiltInVoiceTrigger _shouldReuseBuiltInAudioProvider](self, "_shouldReuseBuiltInAudioProvider");
  if (a3 == 1)
  {
    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CSSpeechManager audioProviderWithStreamID:](self->_speechManager, "audioProviderWithStreamID:", 1LL));
      if (v12)
      {
        id v13 = (void *)v12;
        -[CSBuiltInVoiceTrigger setAudioProvider:](self, "setAudioProvider:", v12);
        double v14 = objc_alloc_init(&OBJC_CLASS___CSAudioStreamRequest);
        id v15 = 0LL;
LABEL_8:
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
        uint64_t v18 = objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  v17));

        double v14 = (CSAudioStreamRequest *)v18;
LABEL_9:
        -[CSAudioStreamRequest setRequiresHistoricalBuffer:](v14, "setRequiresHistoricalBuffer:", 1LL);
        -[CSAudioStreamRequest setClientIdentity:](v14, "setClientIdentity:", 2LL);
        if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
        {
          if ((+[CSUtils isHypotheticalAudioRouteBluetoothFromAudioSessinoId:]( &OBJC_CLASS___CSUtils,  "isHypotheticalAudioRouteBluetoothFromAudioSessinoId:",  0LL) & 1) == 0)
          {
            -[CSAudioStreamRequest setRequestExclaveAudio:](v14, "setRequestExclaveAudio:", 1LL);
            v20 = (os_log_s *)CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v37 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Asking Exclave Audio", buf, 0xCu);
            }
          }
        }

        uint64_t v21 = (objc_class *)objc_opt_class(self, v19);
        v22 = NSStringFromClass(v21);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v32 = 0LL;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v13 audioStreamWithRequest:v14 streamName:v23 error:&v32]);
        id v25 = v32;

        if (v24)
        {
          -[CSBuiltInVoiceTrigger setAudioStream:](self, "setAudioStream:", v24);
          [v24 setDelegate:self];
        }

        else
        {
          id v26 = (void *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
          {
            v28 = v26;
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedDescription]);
            *(_DWORD *)buf = 136315394;
            id v37 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
            __int16 v38 = 2114;
            id v39 = v29;
            _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s Failed to get audio stream : %{public}@",  buf,  0x16u);
          }
        }

        ((void (*)(void *, BOOL, id))v10[2])(v10, v24 != 0LL, v25);

        goto LABEL_21;
      }
    }
  }

  speechManager = self->_speechManager;
  id v33 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager audioProviderWithContext:error:]( speechManager,  "audioProviderWithContext:error:",  v8,  &v33));
  id v15 = v33;
  if (v13)
  {
    -[CSBuiltInVoiceTrigger setAudioProvider:](self, "setAudioProvider:", v13);
    double v14 = objc_alloc_init(&OBJC_CLASS___CSAudioStreamRequest);
    if (a3 > 0xC || ((1LL << a3) & 0x1306) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  v27 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    v30 = v27;
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
    *(_DWORD *)buf = 136315394;
    id v37 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
    __int16 v38 = 2114;
    id v39 = v31;
    _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s Getting audio stream provider has failed : %{public}@",  buf,  0x16u);
  }

  ((void (*)(void *, void, id))v10[2])(v10, 0LL, v15);
LABEL_21:
}

- (BOOL)_shouldReuseBuiltInAudioProvider
{
  uint64_t v2 = CSIsIOS(self);
  if ((_DWORD)v2
    && (uint64_t v2 = (uint64_t)+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"), (v2 & 1) != 0))
  {
    return 0;
  }

  else
  {
    return CSIsOSX(v2, v3) ^ 1;
  }

- (void)_stopListening
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger audioStream](self, "audioStream"));

  if (v3)
  {
    id v4 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[CSBuiltInVoiceTrigger _stopListening]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Waiting for recordingWillStartGroup before scheduling stopAudioStream",  buf,  0xCu);
    }

    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013DC08;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_group_notify((dispatch_group_t)recordingWillStartGroup, queue, block);
  }

- (void)_startVoiceTriggerWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  BOOL v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if (self->_isListenPollingStarting)
  {
    id v6 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Already started listen polling, skip",  buf,  0xCu);
    }

    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    self->_isListenPollingStarting = 1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10013DAF0;
    v7[3] = &unk_10022E6A0;
    v7[4] = self;
    id v8 = v4;
    -[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]( self,  "_startListenPollingWithInterval:completion:",  v7,  1.0);
  }
}

- (void)_startAPVoiceTriggerWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[CSBuiltInVoiceTrigger _startAPVoiceTriggerWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
  {
    id v6 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSBuiltInVoiceTrigger _startAPVoiceTriggerWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ExclaveClient BargeIn start", buf, 0xCu);
    }

    -[CSExclaveFirstPassVoiceTriggerAnalyzing startBargeInVoiceTrigger]( self->_exclaveClient,  "startBargeInVoiceTrigger");
  }

  validationTimer = self->_validationTimer;
  if (validationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)validationTimer);
    id v8 = self->_validationTimer;
    self->_validationTimer = 0LL;
  }

  id v9 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  uint64_t v10 = self->_validationTimer;
  self->_validationTimer = v9;

  dispatch_time_t v11 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer((dispatch_source_t)self->_validationTimer, v11, 0x1A3185C5000uLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  uint64_t v12 = self->_validationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10013DAC4;
  handler[3] = &unk_10022E920;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
  dispatch_resume((dispatch_object_t)self->_validationTimer);
  -[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:](self, "_startVoiceTriggerWithCompletion:", v4);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_APModeValidationTimerFired
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013D950;
  v4[3] = &unk_10022E920;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_startAOPVoiceTrigger
{
  if (self->_currentAsset && CSHasAOP(self))
  {
    uint64_t v3 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[CSBuiltInVoiceTrigger _startAOPVoiceTrigger]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }

    if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
    {
      objc_initWeak((id *)buf, self);
      alwaysOnProcessorController = self->_alwaysOnProcessorController;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_10013D82C;
      v5[3] = &unk_10022E708;
      objc_copyWeak(&v6, (id *)buf);
      -[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]( alwaysOnProcessorController,  "disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:",  v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      -[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]( self->_alwaysOnProcessorController,  "enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:",  self->_currentAsset,  0LL);
    }
  }

- (BOOL)_shouldEnableAOPVoiceTrigger
{
  return (CSIsHorseman(self, a2) & 1) == 0 && (id)-[CSBuiltInVoiceTrigger _currentState](self, "_currentState") != (id)3;
}

- (BOOL)_shouldEnableAPVoiceTrigger
{
  unint64_t v3 = -[CSBuiltInVoiceTrigger _currentState](self, "_currentState");
  if (v3 != 1) {
    LOBYTE(v3) = (id)-[CSBuiltInVoiceTrigger _currentState](self, "_currentState") == (id)2;
  }
  return v3;
}

- (BOOL)_shouldHandleAOPVoiceTrigger
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSUserSessionActiveMonitor sharedInstance]( &OBJC_CLASS___CSUserSessionActiveMonitor,  "sharedInstance"));
  unsigned __int8 v4 = [v3 isUserActive];

  if ((v4 & 1) == 0)
  {
    id v5 = (os_log_s *)CSLogCategoryVT;
    BOOL v9 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    int v19 = 136315138;
    v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
    id v8 = "%s User doesn't have ownership of AOP. ignore AOP trigger notification";
    goto LABEL_7;
  }

  if (self->_isPhraseSpotterBypassed)
  {
    id v5 = (os_log_s *)CSLogCategoryVT;
    BOOL v6 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v6) {
      return result;
    }
    int v19 = 136315138;
    v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
    id v8 = "%s phraseSpotter bypassed, ignore AOP trigger notification";
    goto LABEL_7;
  }

  if (-[CSBuiltInVoiceTrigger _shouldCheckHearstStatus](self, "_shouldCheckHearstStatus")
    && -[CSBuiltInVoiceTrigger _hasHearstRoutedAndNotInSplitter](self, "_hasHearstRoutedAndNotInSplitter"))
  {
    id v5 = (os_log_s *)CSLogCategoryVT;
    BOOL v10 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v10)
    {
      int v19 = 136315138;
      v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
      id v8 = "%s Has hearst routed and not in splitter ignore AOP trigger notification";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v19, 0xCu);
      return 0;
    }
  }

  else if (-[CSBuiltInVoiceTrigger _hasPhoneCallOnNonBargeInDevice](self, "_hasPhoneCallOnNonBargeInDevice"))
  {
    id v5 = (os_log_s *)CSLogCategoryVT;
    BOOL v11 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v11)
    {
      int v19 = 136315138;
      v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
      id v8 = "%s Is in phone call state but we are a non barge in device";
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    unsigned int v13 = [v12 isStreaming];

    if (v13)
    {
      id v5 = (os_log_s *)CSLogCategoryVT;
      BOOL v14 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v14)
      {
        int v19 = 136315138;
        v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        id v8 = "%s Siri Client is already streaming, ignore AOP trigger notification";
        goto LABEL_7;
      }
    }

    else if (-[CSBuiltInVoiceTrigger _shouldCheckHearstStatus](self, "_shouldCheckHearstStatus") {
           && self->_currentSplitterState == 4)
    }
    {
      id v5 = (os_log_s *)CSLogCategoryVT;
      BOOL v15 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v15)
      {
        int v19 = 136315138;
        v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        id v8 = "%s Device has wireless splitter mode with two hearst, ignore AOP trigger notification";
        goto LABEL_7;
      }
    }

    else
    {
      id v16 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSBuiltInVoiceTrigger _stateName:]( self,  "_stateName:",  -[CSBuiltInVoiceTrigger _currentState](self, "_currentState")));
        int v19 = 136315394;
        v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        __int16 v21 = 2114;
        v22 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s VoiceTrigger current state : %{public}@",  (uint8_t *)&v19,  0x16u);
      }

      return !-[CSBuiltInVoiceTrigger _currentState](self, "_currentState")
          || (id)-[CSBuiltInVoiceTrigger _currentState](self, "_currentState") == (id)2;
    }
  }

  return result;
}

- (BOOL)_hasPhoneCallOnNonBargeInDevice
{
  if (self->_phoneCallState - 2 < 3) {
    return +[CSUtils isIOSDeviceSupportingBargeIn]( &OBJC_CLASS___CSUtils,  "isIOSDeviceSupportingBargeIn") ^ 1;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXRingtoneMonitor sharedInstance](&OBJC_CLASS___CSMXRingtoneMonitor, "sharedInstance"));
  unsigned int v3 = [v2 isAnyRingtoneCurrentlyPlaying];

  if (v3) {
    return +[CSUtils isIOSDeviceSupportingBargeIn]( &OBJC_CLASS___CSUtils,  "isIOSDeviceSupportingBargeIn") ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)_hasHearstRoutedAndNotInSplitter
{
  unint64_t currentSplitterState = self->_currentSplitterState;
  int64_t hearstRouteStatus = self->_hearstRouteStatus;
  BOOL isJarvisConnected = self->_isJarvisConnected;
  if (isJarvisConnected) {
    BOOL isJarvisConnected = -[CSBuiltInVoiceTrigger _currentJarvisTriggerMode](self, "_currentJarvisTriggerMode") != -1;
  }
  return currentSplitterState - 5 < 0xFFFFFFFFFFFFFFFDLL && (unint64_t)(hearstRouteStatus - 1) < 2
      || isJarvisConnected;
}

- (BOOL)_shouldCheckHearstStatus
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriEnabledMonitor sharedInstance](&OBJC_CLASS___CSSiriEnabledMonitor, "sharedInstance"));
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)_isBuiltInAOPVoiceTriggerEvent:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)1)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activationInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"VoiceTriggerEnabledKey"]);
    BOOL v6 = v5 == 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isVoiceTriggerStateTransitionEvent:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)1)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activationInfo]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"VoiceTriggerEnabledKey"]);
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_stopAPVoiceTrigger
{
  if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
  {
    id v3 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v13 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ExclaveClient BargeIn stop", buf, 0xCu);
    }

    -[CSExclaveFirstPassVoiceTriggerAnalyzing stopBargeInVoiceTrigger](self->_exclaveClient, "stopBargeInVoiceTrigger");
  }

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger audioStream](self, "audioStream"));

  if (v4)
  {
    validationTimer = self->_validationTimer;
    if (validationTimer)
    {
      dispatch_source_cancel((dispatch_source_t)validationTimer);
      BOOL v6 = self->_validationTimer;
      self->_validationTimer = 0LL;
    }

    int v7 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v13 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Waiting for recordingWillStartGroup before scheduling stopAudioStream",  buf,  0xCu);
    }

    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013D5F4;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_group_notify((dispatch_group_t)recordingWillStartGroup, queue, block);
  }

  else
  {
    BOOL v10 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v13 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s skip stopAPVoiceTrigger as audioStream not existing",  buf,  0xCu);
    }
  }

- (void)_stopAOPVoiceTrigger
{
  if (CSHasAOP(self))
  {
    id v3 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[CSBuiltInVoiceTrigger _stopAOPVoiceTrigger]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
    }

    -[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]( self->_alwaysOnProcessorController,  "disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:",  0LL);
  }

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  BOOL v6 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v10 = "-[CSBuiltInVoiceTrigger audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v11 = 2050;
    int64_t v12 = a4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s stream stopped unexpectedly : %{public}ld",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10013D5A0;
  v8[3] = &unk_10022F020;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10013D16C;
  v8[3] = &unk_10022F020;
  v8[4] = self;
  v8[5] = a7;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10013D008;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_resetFirstExclaveAudioBufferMarkerIfNeeded
{
  if (!self->_isFirstExclaveAudioBuffer)
  {
    id v3 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[CSBuiltInVoiceTrigger _resetFirstExclaveAudioBufferMarkerIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
    }

    -[CSBuiltInVoiceTrigger setIsFirstExclaveAudioBuffer:](self, "setIsFirstExclaveAudioBuffer:", 1LL);
  }

- (BOOL)_shouldSkipAudioChunkHandling
{
  if (!self->_currentAsset)
  {
    id v7 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Could not find Assets. Cannot process Audio",  (uint8_t *)&v17,  0xCu);
    }

    return 1;
  }

  if (self->_isSecondPassRunning || self->_isSiriClientListening || self->_attSiriState == 2) {
    return 1;
  }
  BOOL v3 = -[CSBuiltInVoiceTrigger _hasHearstRoutedAndNotInSplitter](self, "_hasHearstRoutedAndNotInSplitter");
  BOOL v4 = v3;
  if ((CSIsHorseman(v3, v5) & 1) != 0) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = -[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall");
  }
  if (!self->_voiceTriggerEnabled
    || self->_isPhraseSpotterBypassed
    || ((!-[CSBuiltInVoiceTrigger _shouldCheckHearstStatus](self, "_shouldCheckHearstStatus") || !v4) | v6) != 1
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVCRecordingClientMonitor sharedInstance]( CSAVVCRecordingClientMonitor,  "sharedInstance")),  v10 = [v9 numOfAVVCRecordingClients],  v9,  (unint64_t)v10 >= 2))
  {
    uint64_t v11 = qword_1002801D0;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_1002801D0, 1) <= 0x1999999999999999uLL)
    {
      int64_t v12 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        BOOL voiceTriggerEnabled = self->_voiceTriggerEnabled;
        BOOL isPhraseSpotterBypassed = self->_isPhraseSpotterBypassed;
        BOOL v15 = v12;
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSAVVCRecordingClientMonitor sharedInstance]( &OBJC_CLASS___CSAVVCRecordingClientMonitor,  "sharedInstance"));
        int v17 = 136316674;
        uint64_t v18 = "-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling]";
        __int16 v19 = 1026;
        BOOL v20 = voiceTriggerEnabled;
        __int16 v21 = 1026;
        BOOL v22 = isPhraseSpotterBypassed;
        __int16 v23 = 1026;
        BOOL v24 = v4;
        __int16 v25 = 1026;
        unsigned int v26 = v6;
        __int16 v27 = 2050;
        id v28 = [v16 numOfAVVCRecordingClients];
        __int16 v29 = 2050;
        uint64_t v30 = qword_1002801D0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Bypass audio here because ::                   1> VoiceTrigger enabled = %{public}d;                   2> p"
          "hrase spotter bypassed = %{public}d;                   3> should ignore due to hearst routed and not in splitt"
          "er = %{public}d;                   4> has HFP during call = %{public}d;                   5> AVVC recording cl"
          "ient # = %{public}lu                   heartbeat = %{public}lld",
          (uint8_t *)&v17,
          0x38u);

        uint64_t v11 = qword_1002801D0;
      }
    }

    qword_1002801D0 = v11 + 1;
    return 1;
  }

  return 0;
}

- (void)_handleAudioChunk:(id)a3
{
  id v20 = a3;
  uint64_t v4 = qword_1002801D8;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002801D8, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace(722472260LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v4 = qword_1002801D8;
  }

  qword_1002801D8 = v4 + 1;
  if (!-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling](self, "_shouldSkipAudioChunkHandling"))
  {
    context = objc_autoreleasePoolPush();
    uint64_t v5 = (char *)[v20 numSamples];
    if (v5)
    {
      uint64_t v6 = 0LL;
      do
      {
        __int16 v19 = v5;
        else {
          unint64_t processingChunkSamples = (unint64_t)v5;
        }
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v8 = self->_keywordAnalyzersNDAPI;
        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v22;
          do
          {
            for (i = 0LL; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              unsigned int v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
              BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v20,  "subChunkFrom:numSamples:forChannel:",  v6,  processingChunkSamples,  objc_msgSend(v13, "activeChannel")));
              BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 getBestAnalyzedResultsFromChannelSelectedAudioChunk:v14]);
              -[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]( self,  "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:",  v13,  v15,  [v13 activeChannel]);
            }

            id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
          }

          while (v10);
        }

        unint64_t channelSelectionDelay = self->_channelSelectionDelay;
        if (self->_hasTriggerPending && channelSelectionDelay >= self->_delayInSamplesRequiredForChannelSelection)
        {
          int v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSBuiltInVoiceTrigger _voiceTriggerFirstPassInfoFromAP]( self,  "_voiceTriggerFirstPassInfoFromAP"));
          -[CSBuiltInVoiceTrigger _reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:]( self,  "_reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:",  1LL,  v17);

          -[CSBuiltInVoiceTrigger _reset](self, "_reset");
        }

        else
        {
          self->_unint64_t channelSelectionDelay = channelSelectionDelay + processingChunkSamples;
        }

        v6 += processingChunkSamples;
        uint64_t v5 = &v19[-processingChunkSamples];
      }

      while (v19 != (char *)processingChunkSamples);
    }

    objc_autoreleasePoolPop(context);
  }
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v8 = a3;
  double v9 = COERCE_DOUBLE(a4);
  [*(id *)&v9 bestScore];
  float v11 = v10;
  if (v9 != 0.0)
  {
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v13 = [v12 firstPassDebuggingEnabled];

    if (v13)
    {
      BOOL v14 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = v14;
        [*(id *)&v9 bestScore];
        *(_DWORD *)buf = 136316162;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2048;
        double v53 = v16;
        __int16 v54 = 2048;
        double v55 = COERCE_DOUBLE([*(id *)&v9 bestStart]);
        __int16 v56 = 2048;
        id v57 = [*(id *)&v9 bestEnd];
        __int16 v58 = 1024;
        LODWORD(v59) = a5;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s First Pass Score : %lf, First Pass Best Start : %llu, First Pass Best End : %llu, CHANNEL : %d",  buf,  0x30u);
      }
    }
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  if ([v17 firstPassDebuggingEnabled])
  {
  }

  else
  {
    unint64_t v18 = qword_1002801E0 % self->_heartbeatFactor;

    if (!v18)
    {
      __int16 v19 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = v11;
        __int16 v54 = 2050;
        double v55 = *(double *)&a5;
        __int16 v56 = 2050;
        id v57 = (id)qword_1002801E0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s NDAPI first pass best score = %{public}.3f for channel = %{public}tu, heartbeat = %{public}lld",  buf,  0x2Au);
      }
    }
  }

  if (!self->_hasTriggerPending)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
    [v20 threshold];
    float v22 = v21;

    if (v11 >= v22)
    {
      __int128 v23 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v24 = v23;
        id v25 = [*(id *)&v9 samplesAtFire];
        id v26 = [*(id *)&v9 phId];
        unint64_t delayInSamplesRequiredForChannelSelection = self->_delayInSamplesRequiredForChannelSelection;
        *(_DWORD *)buf = 136316418;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = *(double *)&a5;
        __int16 v54 = 2050;
        double v55 = v11;
        __int16 v56 = 2050;
        id v57 = v25;
        __int16 v58 = 2048;
        id v59 = v26;
        __int16 v60 = 2050;
        unint64_t v61 = delayInSamplesRequiredForChannelSelection;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s NDAPI in channel: %{public}tu passed threshold with score %{public}.3f at sample %{public}tu, best = %tu, s etting up decision delay in samples: %{public}tu",  buf,  0x3Eu);

        __int128 v23 = (void *)CSLogCategoryVT;
      }

      self->_hasTriggerPending = 1;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = *(double *)&a5;
        __int16 v54 = 2114;
        double v55 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_DEFAULT,  "%s Set to use the alignment of channel %{public}tu that first crossed the threshold: %{public}@",  buf,  0x20u);
      }

      objc_storeStrong((id *)&self->_onsetResult, a4);
      self->_bestScore = -INFINITY;
      self->_bestChannel = 0LL;
      self->_onsetChannel = a5;
      self->_unint64_t channelSelectionDelay = 0LL;
    }

    if (!self->_hasTriggerPending) {
      goto LABEL_39;
    }
  }

  if (!self->_channelSelectionDelay)
  {
    -[CSKeywordAnalyzerNDAPIResult bestScore](self->_onsetResult, "bestScore");
    if (v11 > v28)
    {
      __int16 v29 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = *(double *)&a5;
        __int16 v54 = 2114;
        double v55 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s Update to use the alignment of channel %{public}tu: %{public}@",  buf,  0x20u);
      }

      objc_storeStrong((id *)&self->_onsetResult, a4);
      self->_onsetChannel = a5;
    }
  }

  if (self->_channelSelectionDelay >= self->_delayInSamplesRequiredForChannelSelection)
  {
    uint64_t v30 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v30;
      id v32 = [*(id *)&v9 samplesAtFire];
      *(_DWORD *)buf = 136315906;
      v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
      __int16 v52 = 2050;
      double v53 = v11;
      __int16 v54 = 2050;
      double v55 = *(double *)&a5;
      __int16 v56 = 2050;
      id v57 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s NDAPI first pass best score for channel selection = %{public}.3f for channel = %{public}tu at sample %{public}tu",  buf,  0x2Au);
    }

    if (-[CSVoiceTriggerFirstPassConfig masterChannel](self->_firstPassConfig, "masterChannel") == (_DWORD)a5)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
      [v33 masterChannelScoreBoost];
      float v11 = v11 + v34;

      id v35 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_group_t v36 = v35;
        id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
        [v37 masterChannelScoreBoost];
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = v11;
        __int16 v54 = 2050;
        double v55 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%s Boosting master channel (ch0) score to %{public}.3f by %{public}.3f for stream selection",  buf,  0x20u);
      }
    }

    if (-[CSVoiceTriggerFirstPassConfig voiceIsolationChannel]( self->_firstPassConfig,  "voiceIsolationChannel") == (_DWORD)a5)
    {
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
      [v39 voiceIsolationChannelScoreBoost];
      float v11 = v11 + v40;

      v41 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        double v42 = v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
        [v43 masterChannelScoreBoost];
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = v11;
        __int16 v54 = 2050;
        double v55 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s Boosting voice isolation channel (ch0) score to %{public}.3f by %{public}.3f for stream selection",  buf,  0x20u);
      }
    }

    v45 = (NSDictionary *)-[NSDictionary mutableCopy](self->_channelSelectionScores, "mutableCopy");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ch%tu", a5));
    *(float *)&double v47 = v11;
    objc_super v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v47));
    -[NSDictionary setObject:forKey:](v45, "setObject:forKey:", v48, v46);

    channelSelectionScores = self->_channelSelectionScores;
    self->_channelSelectionScores = v45;

    if (v11 > self->_bestScore)
    {
      self->_bestScore = v11;
      self->_bestChannel = a5;
    }
  }

  if (!self->_hasTriggerPending) {
LABEL_39:
  }
    [v8 resetBest];
}

- (BOOL)_hasHFPDuringPhoneCall
{
  BOOL result = (self->_phoneCallState - 2 < 3
         || (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXRingtoneMonitor sharedInstance](&OBJC_CLASS___CSMXRingtoneMonitor, "sharedInstance")),
             unsigned int v4 = [v3 isAnyRingtoneCurrentlyPlaying],
             v3,
             v4))
        && self->_hearstRouteStatus == 2;
  return result;
}

- (id)_voiceTriggerFirstPassInfoFromAP
{
  v18[0] = kVTEIfirstPassDetectedChannel;
  int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_bestChannel));
  v19[0] = v17;
  v18[1] = kVTEIfirstPassScore;
  *(float *)&double v3 = self->_bestScore;
  float v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v3));
  v19[1] = v16;
  v18[2] = kVTEIfirstPassStartSampleCount;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSKeywordAnalyzerNDAPIResult bestStart](self->_onsetResult, "bestStart")));
  v19[2] = v4;
  v18[3] = kVTEIfirstPassEndSampleCount;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSKeywordAnalyzerNDAPIResult bestEnd](self->_onsetResult, "bestEnd")));
  v19[3] = v5;
  v18[4] = kVTEIfirstPassFireSampleCount;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSKeywordAnalyzerNDAPIResult samplesAtFire](self->_onsetResult, "samplesAtFire")));
  channelSelectionScores = self->_channelSelectionScores;
  v19[4] = v6;
  v19[5] = channelSelectionScores;
  v18[5] = kVTEIfirstPassChannelSelectionScores;
  v18[6] = kVTEIfirstPassChannelSelectionDelaySeconds;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
  [v8 delaySecondsForChannelSelection];
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v19[6] = v9;
  v18[7] = kVTEIfirstPassMasterChannelScoreBoost;
  float v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig"));
  [v10 masterChannelScoreBoost];
  float v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v19[7] = v11;
  v18[8] = kVTEIfirstPassOnsetChannel;
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_onsetChannel));
  v19[8] = v12;
  v18[9] = kVTEIfirstPassOnsetScore;
  -[CSKeywordAnalyzerNDAPIResult bestScore](self->_onsetResult, "bestScore");
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v19[9] = v13;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  10LL));

  return v14;
}

- (void)_reportVoiceTriggerFirstPassFireFromAPWithSource:(unint64_t)a3 voiceTriggerFirstPassInfo:(id)a4
{
  id v6 = a4;
  if (a3 == 1 || a3 == 11)
  {
    -[CSBuiltInVoiceTrigger _addAudioStreamHold:](self, "_addAudioStreamHold:", @"APVoiceTriggerDetected");
    objc_storeStrong((id *)&self->_lastTriggeredOnsetResult, self->_onsetResult);
    self->_lastTriggeredBestChannel = self->_onsetChannel;
    if (self->_phoneCallState - 2 < 3
      || (id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSMXRingtoneMonitor sharedInstance](&OBJC_CLASS___CSMXRingtoneMonitor, "sharedInstance")),
          unsigned int v8 = [v7 isAnyRingtoneCurrentlyPlaying],
          v7,
          v8))
    {
      if (-[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall")) {
        +[CSMyriadNotifier notifyInEarMyriadTrigger](&OBJC_CLASS___CSMyriadNotifier, "notifyInEarMyriadTrigger");
      }
      unsigned int v9 = -[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall");
      unint64_t phoneCallState = self->_phoneCallState;
      if (a3 == 11 && v9)
      {
        if (phoneCallState == 3) {
          a3 = 9LL;
        }
        else {
          a3 = 8LL;
        }
      }

      else
      {
        BOOL v12 = phoneCallState == 3;
        unint64_t v13 = 8LL;
        if (v12) {
          unint64_t v13 = 9LL;
        }
        unint64_t v14 = 13LL;
        if (v12) {
          unint64_t v14 = 14LL;
        }
        if (a3 == 11) {
          a3 = v14;
        }
        else {
          a3 = v13;
        }
      }
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider"));
    float v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUID]);
    -[CSBuiltInVoiceTrigger _handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:]( self,  "_handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:",  a3,  0LL,  0LL,  v16,  v6);
  }

  else
  {
    float v11 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      unint64_t v18 = "-[CSBuiltInVoiceTrigger _reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s The first pass source is not from AP, skip handling!",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (void)_handleVoiceTriggerSecondPassWithSource:(unint64_t)a3 deviceId:(id)a4 event:(id)a5 audioProviderUUID:(id)a6 firstPassInfo:(id)a7
{
  id v12 = a4;
  id v33 = a5;
  id v31 = a6;
  id v13 = a7;
  unint64_t v14 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    float v40 = "-[CSBuiltInVoiceTrigger _handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:]";
    __int16 v41 = 2114;
    id v42 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  uint64_t v15 = mach_absolute_time();
  if (v33) {
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:]( CSVoiceTriggerFirstPassMetrics,  "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:",  [v33 hosttime],  v15));
  }
  else {
    id v32 = 0LL;
  }
  id v16 = [v13 mutableCopy];
  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v15));
  [v16 setObject:v17 forKeyedSubscript:kVTEIFirstPassFireHostTime];

  if (+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS"))
  {
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSHostLauncherDarwin sharedInstance](&OBJC_CLASS___CSHostLauncherDarwin, "sharedInstance"));
    [v18 wakeHostForVoiceTrigger];
  }

  -[CSBuiltInVoiceTrigger _setIsSecondPassRunning:](self, "_setIsSecondPassRunning:", 1LL);
  objc_initWeak((id *)buf, self);
  -[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]( self,  "_createSecondPassIfNeededWithFirstPassSource:",  a3);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adBlocker);
  [WeakRetained setRequestMHUUID:v19];

  id v21 = objc_loadWeakRetained((id *)&self->_adBlocker);
  [v21 registerObserver:self->_voiceTriggerSecondPass];

  id v22 = objc_loadWeakRetained((id *)&self->_adBlocker);
  [v22 startAdBlockerMatching];

  __int128 v23 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassRequestOption);
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 UUID]);
  id v26 = [v16 copy];
  __int16 v27 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:]( v23,  "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMe trics:rtModelRequestOptions:",  a3,  v12,  v25,  v26,  v19,  -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance]( self->_secondChanceContext,  "shouldRunAsSecondChance"),  v32,  0LL);

  -[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:]( self->_voiceTriggerSecondPass,  "setSupportsMultiPhraseDetection:",  -[CSVoiceTriggerUserSelectedPhrase multiPhraseSelected](self->_multiPhraseSelectedStatus, "multiPhraseSelected"));
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10013CCE4;
  v34[3] = &unk_10022E780;
  v38[1] = (id)a3;
  id v29 = v13;
  id v35 = v29;
  objc_copyWeak(v38, (id *)buf);
  id v30 = v12;
  id v36 = v30;
  id v37 = self;
  -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:]( voiceTriggerSecondPass,  "handleVoiceTriggerSecondPassFrom:completion:",  v27,  v34);
  kdebug_trace(722472272LL, 0LL, 0LL, 0LL, 0LL);

  objc_destroyWeak(v38);
  objc_destroyWeak((id *)buf);
}

- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  float v11 = (void *)objc_claimAutoreleasedReturnValue([v8 voiceTriggerEventInfo]);
  uint64_t v12 = (uint64_t)[v8 result];
  unsigned int v13 = -[CSBuiltInVoiceTrigger _shouldCancelSecondPassResultWithVoiceTriggerInfo:]( self,  "_shouldCancelSecondPassResultWithVoiceTriggerInfo:",  v11);
  unint64_t v14 = (os_log_s *)CSLogCategoryVT;
  if (v13)
  {
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Cancel second pass since self-trigger was detected within short time window",  buf,  0xCu);
      unint64_t v14 = (os_log_s *)CSLogCategoryVT;
    }

    uint64_t v12 = 6LL;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    *(_DWORD *)buf = 136315906;
    __int16 v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
    __int16 v53 = 1024;
    *(_DWORD *)__int16 v54 = v12;
    *(_WORD *)&v54[4] = 2114;
    *(void *)&v54[6] = v11;
    __int16 v55 = 2114;
    __int16 v56 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Second Pass Result, %d, %{public}@, %{public}@",  buf,  0x26u);
  }

  id v17 = [v11 mutableCopy];
  if (-[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall"))
  {
    unint64_t v18 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s HFP during phone call. We will set value to ignore pocket detection.",  buf,  0xCu);
    }

    [v17 setValue:&__kCFBooleanTrue forKey:kVTEIHFPDuringCall];
  }

  if (+[CSUtils isVoiceTriggerFromExclaveWithVTEI:]( &OBJC_CLASS___CSUtils,  "isVoiceTriggerFromExclaveWithVTEI:",  v17)) {
    __int16 v19 = &__kCFBooleanTrue;
  }
  else {
    __int16 v19 = &__kCFBooleanFalse;
  }
  [v17 setValue:v19 forKey:kVTEIExclaveVoiceTrigger];
  switch(v12)
  {
    case 1LL:
      id v20 = v10;
      id v21 = v9;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v23 = objc_opt_respondsToSelector(WeakRetained, "voiceTriggerDidDetectKeyword:deviceId:completion:");

      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      id v25 = v24;
      if ((v23 & 1) != 0)
      {
        [v24 voiceTriggerDidDetectKeyword:v17 deviceId:v21 completion:0];
      }

      else
      {
        char v46 = objc_opt_respondsToSelector(v24, "voiceTriggerDidDetectKeyword:deviceId:");

        id v29 = v21;
        if ((v46 & 1) == 0) {
          goto LABEL_41;
        }
        id v25 = objc_loadWeakRetained((id *)&self->_delegate);
        [v25 voiceTriggerDidDetectKeyword:v17 deviceId:v21];
      }

      id v29 = v21;
      goto LABEL_41;
    case 2LL:
      id v20 = v10;
      id v26 = v9;
      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      char v28 = objc_opt_respondsToSelector(v27, "voiceTriggerDidRejected:deviceId:");

      id v29 = v26;
      if ((v28 & 1) == 0) {
        goto LABEL_31;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_delegate);
      [v30 voiceTriggerDidRejected:v17 deviceId:v26];
      goto LABEL_30;
    case 3LL:
      id v20 = v10;
      id v31 = v9;
      id v32 = objc_loadWeakRetained((id *)&self->_delegate);
      char v33 = objc_opt_respondsToSelector(v32, "voiceTriggerDidDetectNearMiss:deviceId:");

      id v29 = v31;
      if ((v33 & 1) == 0) {
        goto LABEL_31;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_delegate);
      [v30 voiceTriggerDidDetectNearMiss:v17 deviceId:v31];
      goto LABEL_30;
    case 9LL:
      id v20 = v10;
      id v39 = v9;
      id v40 = objc_loadWeakRetained((id *)&self->_delegate);
      char v41 = objc_opt_respondsToSelector(v40, "voiceTriggerDidDetectSpeakerReject:");

      id v29 = v39;
      if ((v41 & 1) == 0) {
        goto LABEL_31;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_delegate);
      [v30 voiceTriggerDidDetectSpeakerReject:v17];
LABEL_30:

LABEL_31:
      id v42 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
        __int16 v53 = 1026;
        *(_DWORD *)__int16 v54 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s Notifying audioProviderInvalidation due to VoiceTrigger result(%{public}d) so Siri client needs to setContext again",  buf,  0x12u);
      }

      -[CSAudioProvider notifyProviderContextChanged](self->_audioProvider, "notifyProviderContextChanged");
      break;
    default:
      id v34 = v9;
      id v35 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        objc_super v48 = v35;
        v49 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        __int16 v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
        __int16 v53 = 2114;
        *(void *)__int16 v54 = v49;
        _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%s VoiceTrigger Second Pass has failed : %{public}@",  buf,  0x16u);
      }

      id v20 = v10;
      id v36 = objc_loadWeakRetained((id *)&self->_delegate);
      char v37 = objc_opt_respondsToSelector(v36, "voiceTriggerDidRejected:deviceId:");

      id v29 = v34;
      if ((v37 & 1) != 0)
      {
        id v38 = objc_loadWeakRetained((id *)&self->_delegate);
        [v38 voiceTriggerDidRejected:v17 deviceId:v34];
      }

      if (v12 != 1 && v12 != 8) {
        goto LABEL_31;
      }
LABEL_41:
      double v47 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
        __int16 v53 = 1026;
        *(_DWORD *)__int16 v54 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "%s Not notifying audioProviderInvalidation since VoiceTrigger result is %{public}d",  buf,  0x12u);
      }

      break;
  }

  if ([v8 isSecondChanceCandidate])
  {
    v43 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondChanceContext),  "initWithWindowStartTime:",  mach_absolute_time());
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v43;
  }

  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0LL;
  }

  queue = (dispatch_queue_s *)self->_queue;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10013CC98;
  v50[3] = &unk_10022F020;
  v50[4] = self;
  v50[5] = v12;
  dispatch_async(queue, v50);
}

- (BOOL)_shouldCancelSecondPassResultWithVoiceTriggerInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4
    && (uint64_t v6 = kVTEItriggerStartMachTime,
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kVTEItriggerStartMachTime]),
        v7,
        v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    id v9 = (char *)[v8 unsignedLongLongValue];

    id v10 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t lastSelfTriggerDetectedStartMachTime = self->_lastSelfTriggerDetectedStartMachTime;
      int v18 = 136315650;
      __int16 v19 = "-[CSBuiltInVoiceTrigger _shouldCancelSecondPassResultWithVoiceTriggerInfo:]";
      __int16 v20 = 2048;
      id v21 = v9;
      __int16 v22 = 2048;
      unint64_t v23 = lastSelfTriggerDetectedStartMachTime;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s secondPassTriggerStartHostTime = %llu, _unint64_t lastSelfTriggerDetectedStartMachTime = %llu",  (uint8_t *)&v18,  0x20u);
    }

    unint64_t v13 = self->_lastSelfTriggerDetectedStartMachTime;
    LODWORD(v11) = 0.5;
    unint64_t v14 = (char *)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v11);
    uint64_t v15 = &v9[-v13];
    BOOL v16 = v15 <= v14;
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  if (a5)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013CBDC;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013CB24;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013CA74;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10013C9B4;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  id v4 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSBuiltInVoiceTrigger CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod crashed", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013C954;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSBuiltInVoiceTrigger CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s audiomxd/bridgeaudiod recovered from crash",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013C904;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerXPCServiceProxy:(id)a3 bypassPhraseSpotter:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013C8F4;
  v5[3] = &unk_10022EFA8;
  void v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(queue, v5);
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013C40C;
  block[3] = &unk_10022E7D0;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)_addAudioStreamHold:(id)a3
{
  id v4 = a3;
  id v6 = [[CSAudioStreamHoldRequestOption alloc] initWithTimeout:2 clientIdentity:0 requireRecordModeLock:0 requireListeningMicIndicatorLock:5.0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioProvider holdAudioStreamWithDescription:option:]( self->_audioProvider,  "holdAudioStreamWithDescription:option:",  v4,  v6));

  -[NSMutableArray addObject:](self->_audioStreamHoldings, "addObject:", v5);
}

- (void)_cancelLastAudioStreamHold
{
  if (-[NSMutableArray count](self->_audioStreamHoldings, "count"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_audioStreamHoldings, "lastObject"));
    double v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider"));
    [v3 cancelAudioStreamHold:v4];

    -[NSMutableArray removeLastObject](self->_audioStreamHoldings, "removeLastObject");
  }

- (void)_cancelAllAudioStreamHold
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  double v3 = self->_audioStreamHoldings;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider", (void)v10));
        [v9 cancelAudioStreamHold:v8];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_audioStreamHoldings, "removeAllObjects");
}

- (BOOL)_shouldSecondPassKeepAlive
{
  uint64_t v2 = CSIsHorseman(self, a2);
  if ((v2 & 1) != 0) {
    return 1;
  }
  else {
    return CSIsBridgeOS(v2, v3);
  }
}

- (void)_createSecondPassIfNeededWithFirstPassSource:(unint64_t)a3
{
  if (!self->_voiceTriggerSecondPass)
  {
    if (-[CSBuiltInVoiceTrigger _shouldSecondPassKeepAlive](self, "_shouldSecondPassKeepAlive"))
    {
      id v5 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315138;
        id v17 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s SecondPass shouldn't be created here",  (uint8_t *)&v16,  0xCu);
      }
    }

    else
    {
      uint64_t v6 = -[CSOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CSOSTransaction),  "initWithDescription:",  @"VoiceTrigger SecondPass");
      secondPassTransaction = self->_secondPassTransaction;
      self->_secondPassTransaction = v6;

      BOOL v8 = !self->_shouldDisableOnSpeakerVerificationInSplitterMode;
      if (self->_shouldDisableOnSpeakerVerificationInSplitterMode)
      {
        id v9 = (os_log_s *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          id v17 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Disable PHS since wireless splitter includes non-DoAP device, and non-DoAP device is in contacts",  (uint8_t *)&v16,  0xCu);
        }
      }

      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
      unsigned int v11 = [v10 bypassPersonalizedHeySiri];

      if (v11)
      {
        __int128 v12 = (os_log_s *)CSLogCategoryVT;
        BOOL v8 = 0LL;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          id v17 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Disable PHS since bypass personalized HeySiri is enabled in internal settings",  (uint8_t *)&v16,  0xCu);
          BOOL v8 = 0LL;
        }
      }

      __int128 v13 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPass),  "initWithPHSEnabled:",  v8);
      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      self->_voiceTriggerSecondPass = v13;

      -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", a3);
      -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 1LL);
      -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger delegate](self, "delegate"));
      -[CSVoiceTriggerSecondPass setDelegate:](self->_voiceTriggerSecondPass, "setDelegate:", v15);

      -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
    }
  }

- (void)_teardownSecondPassIfNeeded
{
  if (!-[CSBuiltInVoiceTrigger _shouldSecondPassKeepAlive](self, "_shouldSecondPassKeepAlive"))
  {
    uint64_t v3 = objc_autoreleasePoolPush();
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = 0LL;

    objc_autoreleasePoolPop(v3);
    secondPassTransaction = self->_secondPassTransaction;
    self->_secondPassTransaction = 0LL;
  }

- (void)_notifyEvent:(unint64_t)a3
{
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger _eventName:](self, "_eventName:", a3));
    int v8 = 136315394;
    id v9 = "-[CSBuiltInVoiceTrigger _notifyEvent:]";
    __int16 v10 = 2114;
    unsigned int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s event : %{public}@", (uint8_t *)&v8, 0x16u);
  }

  -[CSStateMachine performTransitionForEvent:](self->_stateMachine, "performTransitionForEvent:", a3);
}

- (void)_setupStateMachine
{
  uint64_t v3 = -[CSStateMachine initWithInitialState:](objc_alloc(&OBJC_CLASS___CSStateMachine), "initWithInitialState:", 3LL);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v3;

  -[CSStateMachine setDelegate:](self->_stateMachine, "setDelegate:", self);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 1LL, 0LL, 1LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 1LL, 3LL, 4LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 0LL, 2LL, 0LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 0LL, 3LL, 4LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2LL, 2LL, 2LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2LL, 0LL, 1LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2LL, 1LL, 3LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2LL, 3LL, 4LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 3LL, 1LL, 0LL);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 3LL, 0LL, 1LL);
}

- (unint64_t)_currentState
{
  return (unint64_t)-[CSStateMachine currentState](self->_stateMachine, "currentState");
}

- (void)cancelSecondPassRunning
{
  if (CSIsHorseman(self, a2))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013C34C;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(queue, block);
  }

- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013C32C;
  block[3] = &unk_10022E7F8;
  unsigned int v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013C31C;
  block[3] = &unk_10022E458;
  void block[4] = self;
  void block[5] = a4;
  BOOL v7 = a5;
  dispatch_async(queue, block);
}

- (void)_updateCurrentSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentSplitterState = self->_currentSplitterState;
    BOOL shouldDisableOnSpeakerVerificationInSplitterMode = self->_shouldDisableOnSpeakerVerificationInSplitterMode;
    int v10 = 136316162;
    unsigned int v11 = "-[CSBuiltInVoiceTrigger _updateCurrentSplitterState:shouldDisableSpeakerVerificationInSplitterMode:]";
    __int16 v12 = 1026;
    int v13 = currentSplitterState;
    __int16 v14 = 1026;
    int v15 = a3;
    __int16 v16 = 1026;
    BOOL v17 = shouldDisableOnSpeakerVerificationInSplitterMode;
    __int16 v18 = 1026;
    BOOL v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Received Wireless Splitter State Change : %{public}d -> %{public}d, shouldDisableSpeakerVerification : %{public }d -> %{public}d",  (uint8_t *)&v10,  0x24u);
  }

  self->_unint64_t currentSplitterState = a3;
  self->_BOOL shouldDisableOnSpeakerVerificationInSplitterMode = v4;
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013C1E8;
  v5[3] = &unk_10022F020;
  void v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_receivedJarvisConnectionEvent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"Diconnect";
    if (v3) {
      id v6 = @"Connect";
    }
    int v7 = 136315394;
    id v8 = "-[CSBuiltInVoiceTrigger _receivedJarvisConnectionEvent:]";
    __int16 v9 = 2114;
    int v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Received Jarvis %{public}@ event",  (uint8_t *)&v7,  0x16u);
  }

  self->_BOOL isJarvisConnected = v3;
  -[CSBuiltInVoiceTrigger _forceUpdateCarPlayEndpointWithJarvisConnected:]( self,  "_forceUpdateCarPlayEndpointWithJarvisConnected:",  v3);
}

- (void)_receivedHearstRoutedEvent:(int64_t)a3
{
  id v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSBuiltInVoiceTrigger _receivedHearstRoutedEvent:]";
    __int16 v8 = 2050;
    int64_t v9 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Received Hearst event: %{public}ld",  (uint8_t *)&v6,  0x16u);
  }

  self->_int64_t hearstRouteStatus = a3;
}

- (int64_t)_currentJarvisTriggerMode
{
  return -1LL;
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013C184;
  v5[3] = &unk_10022F020;
  void v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)attSiriStateMonitor:(id)a3 didRecieveAttSiriStateChange:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013C0C4;
  v5[3] = &unk_10022F020;
  void v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)didTransitFrom:(int64_t)a3 to:(int64_t)a4 by:(int64_t)a5
{
  int64_t v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = v9;
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger _stateName:](self, "_stateName:", a3));
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger _stateName:](self, "_stateName:", a4));
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger _eventName:](self, "_eventName:", a5));
    *(_DWORD *)buf = 136315906;
    __int16 v20 = "-[CSBuiltInVoiceTrigger didTransitFrom:to:by:]";
    __int16 v21 = 2114;
    __int16 v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s from:%{public}@ to:%{public}@ by:%{public}@",  buf,  0x2Au);
  }

  if (a3 == 3)
  {
    -[CSBuiltInVoiceTrigger _startAOPVoiceTrigger](self, "_startAOPVoiceTrigger");
    switch(a4)
    {
      case 0LL:
        goto LABEL_11;
      case 1LL:
        queue = (dispatch_queue_s *)self->_queue;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10013C0AC;
        v18[3] = &unk_10022F100;
        v18[4] = self;
        int v15 = v18;
        goto LABEL_10;
      case 2LL:
        goto LABEL_9;
      case 3LL:
        goto LABEL_13;
      default:
        return;
    }
  }

  else if (a4)
  {
    if (a4 == 3)
    {
LABEL_13:
      -[CSBuiltInVoiceTrigger _stopAPVoiceTrigger](self, "_stopAPVoiceTrigger");
      -[CSBuiltInVoiceTrigger _stopAOPVoiceTrigger](self, "_stopAOPVoiceTrigger");
    }

    else if (a4 == 2)
    {
LABEL_9:
      queue = (dispatch_queue_s *)self->_queue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10013C0B8;
      v17[3] = &unk_10022F100;
      v17[4] = self;
      int v15 = v17;
LABEL_10:
      dispatch_async(queue, v15);
    }
  }

  else
  {
LABEL_11:
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerInfo sharedInstance](&OBJC_CLASS___CSVoiceTriggerInfo, "sharedInstance"));
    [v16 setFirstPassRunningMode:0];

    if (a3 != 3) {
      -[CSBuiltInVoiceTrigger _stopAPVoiceTrigger](self, "_stopAPVoiceTrigger");
    }
  }

- (void)didIgnoreEvent:(int64_t)a3 from:(int64_t)a4
{
  int v7 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = v7;
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger _eventName:](self, "_eventName:", a3));
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSBuiltInVoiceTrigger _stateName:](self, "_stateName:", a4));
    int v11 = 136315650;
    __int16 v12 = "-[CSBuiltInVoiceTrigger didIgnoreEvent:from:]";
    __int16 v13 = 2114;
    __int16 v14 = v9;
    __int16 v15 = 2114;
    __int16 v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Ignore event(%{public}@) from(%{public}@) since we don't have transition",  (uint8_t *)&v11,  0x20u);
  }

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[CSPowerLogger sharedPowerLogger](&OBJC_CLASS___CSPowerLogger, "sharedPowerLogger", a3));
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](self->_currentAsset, "configVersion"));
  [v8 powerLogSiriConfigWithVoiceTriggerEnabled:v4 withLanguage:v6 withModelVersion:v7];
}

- (id)_stateName:(unint64_t)a3
{
  v10[0] = &off_100238EB0;
  v10[1] = &off_100238EC8;
  v11[0] = @"FirstPassRunning";
  v11[1] = @"FirstPassRunningAOPOnly";
  v10[2] = &off_100238EE0;
  v10[3] = &off_100238EF8;
  v11[2] = @"FirstPassStateAOPtoAPTransition";
  v11[3] = @"FirstPassStateStop";
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v7]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"unknown(%tu)", a3));
  }

  return v8;
}

- (id)_eventName:(unint64_t)a3
{
  v10[0] = &off_100238EC8;
  v10[1] = &off_100238EB0;
  v11[0] = @"kCSFirstPassEventBargeInOn";
  v11[1] = @"kCSFirstPassEventBargeInOff";
  v10[2] = &off_100238EE0;
  v10[3] = &off_100238EF8;
  v11[2] = @"kCSFirstPassEventStartAPFailed";
  v11[3] = @"kCSFirstPassEventStartAPSucceed";
  void v10[4] = &off_100238F10;
  void v11[4] = @"kCSFirstPassEventStopped";
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  5LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  if (v6)
  {
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v7]);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"unknown(%tu)", a3));
  }

  return v8;
}

- (id)_firstPassVoiceTriggerSignalEstimate
{
  if (CSIsHorseman(self, a2))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10013BF44;
    v9[3] = &unk_10022E5B0;
    v9[4] = self;
    +[CSMyriadPHash signalEstimateWithBuilder:](&OBJC_CLASS___CSMyriadPHash, "signalEstimateWithBuilder:", v9);
    double v4 = v3;
    id v5 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      int v11 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]";
      __int16 v12 = 2049;
      unint64_t v13 = *(void *)&v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s signal estimate: %{private}f", buf, 0x16u);
    }

    double v6 = v4;
  }

  else
  {
    int v7 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      int v11 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]";
      __int16 v12 = 2049;
      unint64_t v13 = 0xBFF0000000000000LL;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s signal estimate: %{private}f", buf, 0x16u);
    }

    double v6 = -1.0;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v6));
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSSecondPassProgressDelegate)secondPassProgressDelegate
{
  return (CSSecondPassProgressDelegate *)objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
}

- (CSPolicy)voiceTriggerStartPolicy
{
  return self->_voiceTriggerStartPolicy;
}

- (void)setVoiceTriggerStartPolicy:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_BOOL voiceTriggerEnabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (NSMutableArray)keywordAnalyzersNDAPI
{
  return self->_keywordAnalyzersNDAPI;
}

- (void)setKeywordAnalyzersNDAPI:(id)a3
{
}

- (CSVoiceTriggerFirstPassConfig)firstPassConfig
{
  return self->_firstPassConfig;
}

- (void)setFirstPassConfig:(id)a3
{
}

- (BOOL)hasTriggerPending
{
  return self->_hasTriggerPending;
}

- (void)setHasTriggerPending:(BOOL)a3
{
  self->_hasTriggerPending = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (unint64_t)bestChannel
{
  return self->_bestChannel;
}

- (void)setBestChannel:(unint64_t)a3
{
  self->_bestChannel = a3;
}

- (CSKeywordAnalyzerNDAPIResult)onsetResult
{
  return self->_onsetResult;
}

- (void)setOnsetResult:(id)a3
{
}

- (CSKeywordAnalyzerNDAPIResult)lastTriggeredOnsetResult
{
  return self->_lastTriggeredOnsetResult;
}

- (void)setLastTriggeredOnsetResult:(id)a3
{
}

- (unint64_t)lastTriggeredBestChannel
{
  return self->_lastTriggeredBestChannel;
}

- (void)setLastTriggeredBestChannel:(unint64_t)a3
{
  self->_lastTriggeredBestChannel = a3;
}

- (unint64_t)onsetChannel
{
  return self->_onsetChannel;
}

- (void)setOnsetChannel:(unint64_t)a3
{
  self->_onsetChannel = a3;
}

- (unint64_t)channelSelectionDelay
{
  return self->_channelSelectionDelay;
}

- (void)setChannelSelectionDelay:(unint64_t)a3
{
  self->_unint64_t channelSelectionDelay = a3;
}

- (unint64_t)delayInSamplesRequiredForChannelSelection
{
  return self->_delayInSamplesRequiredForChannelSelection;
}

- (void)setDelayInSamplesRequiredForChannelSelection:(unint64_t)a3
{
  self->_unint64_t delayInSamplesRequiredForChannelSelection = a3;
}

- (NSDictionary)channelSelectionScores
{
  return self->_channelSelectionScores;
}

- (void)setChannelSelectionScores:(id)a3
{
}

- (unint64_t)processingChunkSamples
{
  return self->_processingChunkSamples;
}

- (void)setProcessingChunkSamples:(unint64_t)a3
{
  self->_unint64_t processingChunkSamples = a3;
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
}

- (NSMutableArray)audioStreamHoldings
{
  return self->_audioStreamHoldings;
}

- (void)setAudioStreamHoldings:(id)a3
{
}

- (CSOSTransaction)secondPassTransaction
{
  return self->_secondPassTransaction;
}

- (void)setSecondPassTransaction:(id)a3
{
}

- (BOOL)isPhraseSpotterBypassed
{
  return self->_isPhraseSpotterBypassed;
}

- (void)setIsPhraseSpotterBypassed:(BOOL)a3
{
  self->_BOOL isPhraseSpotterBypassed = a3;
}

- (int64_t)hearstRouteStatus
{
  return self->_hearstRouteStatus;
}

- (void)setHearstRouteStatus:(int64_t)a3
{
  self->_int64_t hearstRouteStatus = a3;
}

- (CSPolicy)voiceTriggerAPModeSuspendPolicy
{
  return self->_voiceTriggerAPModeSuspendPolicy;
}

- (void)setVoiceTriggerAPModeSuspendPolicy:(id)a3
{
}

- (CSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (CSVoiceTriggerAlwaysOnProcessor)alwaysOnProcessorController
{
  return self->_alwaysOnProcessorController;
}

- (void)setAlwaysOnProcessorController:(id)a3
{
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setRecordingWillStartGroup:(id)a3
{
}

- (unint64_t)currentSplitterState
{
  return self->_currentSplitterState;
}

- (void)setCurrentSplitterState:(unint64_t)a3
{
  self->_unint64_t currentSplitterState = a3;
}

- (BOOL)shouldDisableOnSpeakerVerificationInSplitterMode
{
  return self->_shouldDisableOnSpeakerVerificationInSplitterMode;
}

- (void)setShouldDisableOnSpeakerVerificationInSplitterMode:(BOOL)a3
{
  self->_BOOL shouldDisableOnSpeakerVerificationInSplitterMode = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)firstTimeAssetConfigured
{
  return self->_firstTimeAssetConfigured;
}

- (void)setFirstTimeAssetConfigured:(BOOL)a3
{
  self->_firstTimeAssetConfigured = a3;
}

- (NSMutableArray)assetConfigWaitingBuffer
{
  return self->_assetConfigWaitingBuffer;
}

- (void)setAssetConfigWaitingBuffer:(id)a3
{
}

- (OS_dispatch_source)validationTimer
{
  return self->_validationTimer;
}

- (void)setValidationTimer:(id)a3
{
}

- (NSNumber)firstPassMyriadGoodness
{
  return self->_firstPassMyriadGoodness;
}

- (void)setFirstPassMyriadGoodness:(id)a3
{
}

- (unint64_t)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(unint64_t)a3
{
  self->_unint64_t phoneCallState = a3;
}

- (unint64_t)attSiriState
{
  return self->_attSiriState;
}

- (void)setAttSiriState:(unint64_t)a3
{
  self->_attSiriState = a3;
}

- (BOOL)isJarvisConnected
{
  return self->_isJarvisConnected;
}

- (void)setIsJarvisConnected:(BOOL)a3
{
  self->_BOOL isJarvisConnected = a3;
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor
{
  return self->_audioRouteChangeMonitor;
}

- (void)setAudioRouteChangeMonitor:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (unint64_t)lastSelfTriggerDetectedStartMachTime
{
  return self->_lastSelfTriggerDetectedStartMachTime;
}

- (void)setLastSelfTriggerDetectedStartMachTime:(unint64_t)a3
{
  self->_unint64_t lastSelfTriggerDetectedStartMachTime = a3;
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (CSStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
}

- (unsigned)jarvisTriggerModeLogHeartbeat
{
  return self->_jarvisTriggerModeLogHeartbeat;
}

- (void)setJarvisTriggerModeLogHeartbeat:(unsigned __int8)a3
{
  self->_jarvisTriggerModeLogHeartbeat = a3;
}

- (BOOL)isFirstExclaveAudioBuffer
{
  return self->_isFirstExclaveAudioBuffer;
}

- (void)setIsFirstExclaveAudioBuffer:(BOOL)a3
{
  self->_isFirstExclaveAudioBuffer = a3;
}

- (CSAdBlockerProviding)adBlocker
{
  return (CSAdBlockerProviding *)objc_loadWeakRetained((id *)&self->_adBlocker);
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
}

- (CSExclaveFirstPassVoiceTriggerAnalyzing)exclaveClient
{
  return self->_exclaveClient;
}

- (void)setExclaveClient:(id)a3
{
}

- (CSExclaveAssetsControlling)exclaveAssetsController
{
  return self->_exclaveAssetsController;
}

- (void)setExclaveAssetsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end