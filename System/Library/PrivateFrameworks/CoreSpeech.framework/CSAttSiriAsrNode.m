@interface CSAttSiriAsrNode
+ (int64_t)endpointModeFromEndpointMetrics:(id)a3;
- (BOOL)_shouldDisableLocalSpeechRecognizerWithOption:(id)a3 audioRecordContext:(id)a4;
- (BOOL)didDetectedEndpoint;
- (BOOL)disableEndpointer;
- (BOOL)isFileLoggingEnabled;
- (BOOL)isReady;
- (BOOL)onDeviceAssistantSampled;
- (BOOL)onDeviceDictationSampled;
- (BOOL)shouldProcessAudio;
- (BOOL)shouldStopProcessASROnEndpoint;
- (BOOL)speechHasAcceptedResultCandidate;
- (CSAsset)prefetchedAsset;
- (CSAttSiriAsrNode)init;
- (CSAttSiriAsrNode)initWithAttSiriController:(id)a3;
- (CSAttSiriAsrNode)initWithLocalSpeechRecognizer:(id)a3 isFileLoggingEnabled:(BOOL)a4;
- (CSAttSiriController)attSiriController;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriUresNode)uresNode;
- (CSAudioProcessWaitingBuffer)audioWaitingBuffer;
- (CSAudioRecordContext)recordContext;
- (CSConnectionListener)localSRBridgeListener;
- (CSEndpointDelayReporter)endpointDelayReporter;
- (CSOSTransaction)asrResultDeliveryTransaction;
- (CSOSTransaction)recordingTransaction;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSpeechRecognitionSelfHelper)asrSelfHelper;
- (CSUncompressedAudioLogging)audioLogging;
- (CoreEmbeddedSpeechRecognizerProvider)interactiveLocalSpeechRecognizer;
- (CoreEmbeddedSpeechRecognizerProvider)presetLocalSpeechRecognizer;
- (LBLocalSpeechRecognitionSettings)speechRecognitionSettings;
- (NSArray)lastEndpointHintFeatures;
- (NSArray)requiredNodes;
- (NSString)language;
- (NSString)localSpeechRecognizerTaskString;
- (NSString)mhId;
- (NSString)requestId;
- (NSString)siriSessionUUID;
- (NSUUID)recordingToken;
- (OS_dispatch_queue)localSpeechRecognizerQueue;
- (OS_dispatch_queue)targetQueue;
- (double)detectedEndpointTime;
- (double)endpointStartTimeInSec;
- (double)firstWordDuration;
- (double)lastEndpointHintDuration;
- (double)leadingSilenceDuration;
- (double)localSpeechRecognizerDeliverAudioDuration;
- (id)_fetchInputOriginWithRecordContext:(id)a3;
- (id)_fetchRecognizerLanguageWithSiriLanguage:(id)a3 UILanguage:(id)a4 taskString:(id)a5 asrLocale:(id)a6;
- (id)_getAsrInputoriginFromContext:(id)a3;
- (id)_interactiveLocalSpeechRecognizer;
- (id)_sourceStringFromPreheatSource:(unint64_t)a3;
- (id)_stateToString:(unint64_t)a3;
- (int64_t)endpointMode;
- (int64_t)lastEndpointHintRCId;
- (unint64_t)audioSampleCountToSkip;
- (unint64_t)eagerResultId;
- (unint64_t)fetchCurrentState;
- (unint64_t)firstPartialResultTime;
- (unint64_t)lastEndpointEagerResultTime;
- (unint64_t)localSpeechRecognizerState;
- (unint64_t)recordingStartTime;
- (unint64_t)type;
- (unint64_t)voiceTriggerFireMachTime;
- (unsigned)activeChannel;
- (void)_adjustEndpointStartTimeWithVoiceTriggerEvent:(id)a3;
- (void)_clearAudioProcessWaitingBufferIfNeeded;
- (void)_clearEndpointHint;
- (void)_disableLocalSpeechRecognitionForRequestId:(id)a3 force:(BOOL)a4;
- (void)_enforceEndpointHintWithRequestId:(id)a3 rcId:(unint64_t)a4 shouldAccept:(BOOL)a5 featuresToLog:(id)a6;
- (void)_handleDidRecognizedFinalSpeechPackage:(id)a3 multiUserSpeechPackage:(id)a4 requestId:(id)a5 metadata:(id)a6;
- (void)_handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:(id)a3 multiUserSpeechPackage:(id)a4 requestId:(id)a5 rcId:(unint64_t)a6 metadata:(id)a7;
- (void)_handleShouldAcceptEagerResultWithRequestId:(id)a3 rcId:(unint64_t)a4 duration:(double)a5 shouldAccept:(BOOL)a6 featuresToLog:(id)a7;
- (void)_handleStopDeliverLocalSpeechRecognitionWithStopUresProcessing:(BOOL)a3;
- (void)_handleStopSpeechRecognitionTaskIfNeeded:(BOOL)a3;
- (void)_invalidateLocalSpeechRecognizer;
- (void)_markTimeToFirstWordMetric;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5;
- (void)_processAudioChunk:(id)a3 withReadyTimestamp:(id)a4;
- (void)_queryShouldAcceptEagerResultForDuration:(double)a3 requestId:(id)a4 rcId:(unint64_t)a5;
- (void)_releaseRecordingTransactionIfNeededWithToken:(id)a3;
- (void)_resetLocalSpeechRecognizerParameters;
- (void)_scheduleRecordingTransactionReleaseTimer;
- (void)_setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)_setRecordingStartTimeWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)_setupRecognizerStateForMagusAsrNode;
- (void)_startDeliverLocalSpeechRecognitionResultsWithRequestId:(id)a3;
- (void)_startLocalSpeechRecognizerIfNeeded;
- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3 stopUresProcessing:(BOOL)a4;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)disableLocalSpeechRecognitionForRequestId:(id)a3;
- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)localSpeechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10;
- (void)localSpeechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeMultiUserSpeechPackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didRecognizePartialPackage:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4 withMetadata:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didSelectRecognitionModelWithModelProperties:(id)a4;
- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3;
- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4;
- (void)preheatWithLanguage:(id)a3 shouldDownloadMissingAsset:(BOOL)a4;
- (void)prepareToStartSpeechRequestWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)registerEndpointerNode:(id)a3;
- (void)registerSSRNode:(id)a3;
- (void)registerUresNode:(id)a3;
- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6;
- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4;
- (void)setActiveChannel:(unsigned int)a3;
- (void)setAsrResultDeliveryTransaction:(id)a3;
- (void)setAsrSelfHelper:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioLogging:(id)a3;
- (void)setAudioSampleCountToSkip:(unint64_t)a3;
- (void)setAudioWaitingBuffer:(id)a3;
- (void)setDetectedEndpointTime:(double)a3;
- (void)setDidDetectedEndpoint:(BOOL)a3;
- (void)setDisableEndpointer:(BOOL)a3;
- (void)setEagerResultId:(unint64_t)a3;
- (void)setEndpointDelayReporter:(id)a3;
- (void)setEndpointMode:(int64_t)a3;
- (void)setEndpointStartTimeInSec:(double)a3;
- (void)setFirstPartialResultTime:(unint64_t)a3;
- (void)setFirstWordDuration:(double)a3;
- (void)setInteractiveLocalSpeechRecognizer:(id)a3;
- (void)setIsFileLoggingEnabled:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLastEndpointEagerResultTime:(unint64_t)a3;
- (void)setLastEndpointHintDuration:(double)a3;
- (void)setLastEndpointHintFeatures:(id)a3;
- (void)setLastEndpointHintRCId:(int64_t)a3;
- (void)setLeadingSilenceDuration:(double)a3;
- (void)setLocalSRBridgeListener:(id)a3;
- (void)setLocalSpeechRecognizerDeliverAudioDuration:(double)a3;
- (void)setLocalSpeechRecognizerQueue:(id)a3;
- (void)setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)setLocalSpeechRecognizerTaskString:(id)a3;
- (void)setMhId:(id)a3;
- (void)setOnDeviceAssistantSampled:(BOOL)a3;
- (void)setOnDeviceDictationSampled:(BOOL)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPresetLocalSpeechRecognizer:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingStartTime:(unint64_t)a3;
- (void)setRecordingToken:(id)a3;
- (void)setRecordingTransaction:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setShouldProcessAudio:(BOOL)a3;
- (void)setShouldStopProcessASROnEndpoint:(BOOL)a3;
- (void)setSiriSessionUUID:(id)a3;
- (void)setSpeechHasAcceptedResultCandidate:(BOOL)a3;
- (void)setSpeechRecognitionSettings:(id)a3;
- (void)setVoiceTriggerFireMachTime:(unint64_t)a3;
- (void)start;
- (void)startSpeechRecognitionResultsWithSettings:(id)a3;
- (void)stop;
- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)stopWithReason:(unint64_t)a3;
- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4;
- (void)updateTCUState:(id)a3;
- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11;
@end

@implementation CSAttSiriAsrNode

- (CSAttSiriAsrNode)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  v4 = -[CSAttSiriAsrNode initWithLocalSpeechRecognizer:isFileLoggingEnabled:]( self,  "initWithLocalSpeechRecognizer:isFileLoggingEnabled:",  0,  [v3 fileLoggingIsEnabled]);

  return v4;
}

- (CSAttSiriAsrNode)initWithLocalSpeechRecognizer:(id)a3 isFileLoggingEnabled:(BOOL)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSAttSiriAsrNode;
  v8 = -[CSAttSiriAsrNode init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    requiredNodes = v8->_requiredNodes;
    v8->_type = 2LL;
    v8->_requiredNodes = (NSArray *)&off_100239278;

    v9->_isReady = 0;
    targetQueue = v9->_targetQueue;
    v9->_targetQueue = 0LL;

    if (+[CSUtils supportsDispatchWorkloop](&OBJC_CLASS___CSUtils, "supportsDispatchWorkloop"))
    {
      dispatch_queue_t v12 = (dispatch_queue_t)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  @"localSpeechRecognizerQueue Queue",  kCSDefaultSerialQueueFixedPriority));
    }

    else
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CSUtils rootQueueWithFixedPriority:]( &OBJC_CLASS___CSUtils,  "rootQueueWithFixedPriority:",  kCSDefaultSerialQueueFixedPriority));
      v14 = v9->_targetQueue;
      v9->_targetQueue = (OS_dispatch_queue *)v13;

      dispatch_queue_t v12 = dispatch_queue_create_with_target_V2( (const char *)[@"localSpeechRecognizerQueue Queue" UTF8String],  0,  (dispatch_queue_t)v9->_targetQueue);
    }

    localSpeechRecognizerQueue = v9->_localSpeechRecognizerQueue;
    v9->_localSpeechRecognizerQueue = (OS_dispatch_queue *)v12;

    v9->_activeChannel = 0;
    requestId = v9->_requestId;
    v9->_requestId = 0LL;

    v9->_eagerResultId = 0LL;
    v9->_disableEndpointer = 0;
    v9->_endpointStartTimeInSec = 0.0;
    v9->_audioSampleCountToSkip = 0LL;
    -[CSAttSiriAsrNode _setLocalSpeechRecognizerState:](v9, "_setLocalSpeechRecognizerState:", 0LL);
    v9->_shouldProcessAudio = 0;
    objc_storeStrong((id *)&v9->_presetLocalSpeechRecognizer, a3);
    v9->_endpointMode = 0LL;
    v9->_isFileLoggingEnabled = a4;
    v9->_voiceTriggerFireMachTime = 0LL;
  }

  return v9;
}

- (CSAttSiriAsrNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriAsrNode init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)stop
{
}

- (void)stopWithReason:(unint64_t)a3
{
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSAttSiriAsrNode stopWithReason:]";
    __int16 v10 = 2050;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Reason : %{public}lu", buf, 0x16u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1EC0;
  v7[3] = &unk_10022F020;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)registerEndpointerNode:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1EB4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)registerUresNode:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1EA8;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)registerSSRNode:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1E9C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)_adjustEndpointStartTimeWithVoiceTriggerEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = kVTEIclientStartSampleCount;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kVTEIclientStartSampleCount]);
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = kVTEItriggerEndSampleCount;
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kVTEItriggerEndSampleCount]);

      if (v10)
      {
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);
        dispatch_queue_t v12 = [v11 unsignedIntegerValue];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
        unint64_t v14 = v12 - (_BYTE *)[v13 unsignedIntegerValue];

        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        double v16 = (float)((float)v14 / v15);
        self->_double endpointStartTimeInSec = v16;
        v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 136315394;
          v35 = "-[CSAttSiriAsrNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
          __int16 v36 = 2050;
          double v37 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Updated endpoint start time in sec : %{public}.3f",  (uint8_t *)&v34,  0x16u);
        }
      }
    }

    uint64_t v18 = kVTEIextraSamplesAtStart;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kVTEIextraSamplesAtStart]);

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v18]);
      self->_float audioSampleCountToSkip = (unint64_t)[v20 unsignedIntegerValue];

      double endpointStartTimeInSec = self->_endpointStartTimeInSec;
      float audioSampleCountToSkip = (float)self->_audioSampleCountToSkip;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      double v24 = (float)(audioSampleCountToSkip / v23);
      double v25 = 0.0;
      if (endpointStartTimeInSec > v24)
      {
        double v26 = self->_endpointStartTimeInSec;
        float v27 = (float)self->_audioSampleCountToSkip;
        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        double v25 = v26 - (float)(v27 / v28);
      }

      self->_double endpointStartTimeInSec = v25;
      v29 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v30 = self->_audioSampleCountToSkip;
        int v34 = 136315650;
        v35 = "-[CSAttSiriAsrNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
        __int16 v36 = 2050;
        double v37 = v25;
        __int16 v38 = 2050;
        unint64_t v39 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s Adjusted endpoint start time to : %{public}.3f, audioSampleCountToSkip : %{public}lu",  (uint8_t *)&v34,  0x20u);
      }
    }

    uint64_t v31 = kVTEItriggerFireMachTime;
    v32 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kVTEItriggerFireMachTime]);

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v31]);
      self->_voiceTriggerFireMachTime = (unint64_t)[v33 unsignedLongLongValue];
    }
  }
}

- (void)_setRecordingStartTimeWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  unsigned int v9 = [a4 isVoiceTriggered];
  if (v8
    && v9
    && (uint64_t v10 = kVTEItriggerEndMachTime,
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEItriggerEndMachTime]),
        v11,
        v11))
  {
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
    self->_recordingStartTime = (unint64_t)+[CSFTimeUtils absoluteHostTimeToContinuousHostTime:]( CSFTimeUtils,  "absoluteHostTimeToContinuousHostTime:",  [v12 unsignedLongLongValue]);
  }

  else
  {
    if ([v14 startRecordingHostTime]) {
      id v13 = +[CSFTimeUtils absoluteHostTimeToContinuousHostTime:]( CSFTimeUtils,  "absoluteHostTimeToContinuousHostTime:",  [v14 startRecordingHostTime]);
    }
    else {
      id v13 = (id)mach_continuous_time();
    }
    self->_recordingStartTime = (unint64_t)v13;
  }
}

- (void)_handleStopDeliverLocalSpeechRecognitionWithStopUresProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSAttSiriAsrNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 0LL);
  speechRecognitionSettings = self->_speechRecognitionSettings;
  self->_speechRecognitionSettings = 0LL;

  if (-[LBLocalSpeechRecognitionSettings speechRecognitionMode]( self->_speechRecognitionSettings,  "speechRecognitionMode") != (id)1)
  {
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
      [WeakRetained stopUresProcessingForRequest:self->_requestId];
    }

    requestId = self->_requestId;
    self->_requestId = 0LL;
  }

- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1DE4;
  block[3] = &unk_10022E7F8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)startSpeechRecognitionResultsWithSettings:(id)a3
{
  id v4 = a3;
  id v5 = [v4 speechRecognitionMode];
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1A88;
  block[3] = &unk_10022E7F8;
  block[4] = self;
  id v9 = v4;
  id v10 = v5;
  id v7 = v4;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_startDeliverLocalSpeechRecognitionResultsWithRequestId:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    int v16 = 136315394;
    v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2048;
    unint64_t v19 = localSpeechRecognizerState;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s _localSpeechRecognizerState:%lu",  (uint8_t *)&v16,  0x16u);
    id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    int v16 = 136315394;
    v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2112;
    unint64_t v19 = (unint64_t)requestId;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Start deliver asr results with requestId: %@",  (uint8_t *)&v16,  0x16u);
  }

  unint64_t v8 = self->_localSpeechRecognizerState;
  if (v8 != 3)
  {
    -[CSAttSiriAsrNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 2LL);
    if (v8 == 4)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioProcessWaitingBuffer uuid](self->_audioWaitingBuffer, "uuid"));
      unsigned int v10 = [v9 isEqualToString:self->_requestId];

      if (v10)
      {
        unint64_t v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Handle late start request from Request Dispatcher",  (uint8_t *)&v16,  0xCu);
        }

        -[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded](self, "_startLocalSpeechRecognizerIfNeeded");
        -[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]( self,  "_handleStopSpeechRecognitionTaskIfNeeded:",  1LL);
      }

      else
      {
        audioWaitingBuffer = self->_audioWaitingBuffer;
        if (audioWaitingBuffer)
        {
          id v13 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = v13;
            float v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioProcessWaitingBuffer uuid](audioWaitingBuffer, "uuid"));
            int v16 = 136315650;
            v17 = "-[CSAttSiriAsrNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
            __int16 v18 = 2112;
            unint64_t v19 = (unint64_t)v4;
            __int16 v20 = 2114;
            v21 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Clear audio waiting buffer since current requestId(%@) doesn't match expected one (%{public}@)",  (uint8_t *)&v16,  0x20u);
          }

          -[CSAttSiriAsrNode _clearAudioProcessWaitingBufferIfNeeded](self, "_clearAudioProcessWaitingBufferIfNeeded");
        }
      }
    }

    else if (v8 == 1)
    {
      -[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded](self, "_startLocalSpeechRecognizerIfNeeded");
    }
  }
}

- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    *(_DWORD *)buf = 136315906;
    int v16 = "-[CSAttSiriAsrNode stopSpeechRecognitionWithReason:requestId:]";
    __int16 v17 = 2050;
    unint64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = requestId;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Reason : %{public}lu, requestId: %@, cached requestId : %@",  buf,  0x2Au);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1960;
  block[3] = &unk_10022E7F8;
  id v12 = v6;
  id v13 = self;
  unint64_t v14 = a3;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)disableLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1950;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(localSpeechRecognizerQueue, v7);
}

- (void)_disableLocalSpeechRecognitionForRequestId:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSString *)a3;
  id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    unint64_t v11 = "-[CSAttSiriAsrNode _disableLocalSpeechRecognitionForRequestId:force:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s requestId : %@, force : %d",  (uint8_t *)&v10,  0x1Cu);
  }

  if (!v6 || -[NSString isEqualToString:](v6, "isEqualToString:", self->_siriSessionUUID) || v4)
  {
    -[CSAttSiriAsrNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 3LL);
    -[CSAttSiriAsrNode _clearAudioProcessWaitingBufferIfNeeded](self, "_clearAudioProcessWaitingBufferIfNeeded");
  }

  else
  {
    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      siriSessionUUID = self->_siriSessionUUID;
      int v10 = 136315394;
      unint64_t v11 = "-[CSAttSiriAsrNode _disableLocalSpeechRecognitionForRequestId:force:]";
      __int16 v12 = 2112;
      id v13 = siriSessionUUID;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s requestId doesn't match current siriSessionUUID (%@), ignore",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[CSAttSiriAsrNode pauseLocalSpeechRecognitionForRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1920;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v24 = "-[CSAttSiriAsrNode resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:]";
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000C18DC;
  v19[3] = &unk_10022E368;
  v19[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(localSpeechRecognizerQueue, v19);
}

- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11
{
  id v35 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  __int16 v25 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[CSAttSiriAsrNode updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:disambiguationAc"
          "tive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]";
    __int16 v47 = 2112;
    id v48 = v35;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C188C;
  block[3] = &unk_10022C6C0;
  void block[4] = self;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  id v41 = v21;
  id v42 = v22;
  id v43 = v23;
  id v44 = v24;
  id v27 = v24;
  id v28 = v23;
  id v29 = v22;
  id v30 = v21;
  id v31 = v20;
  id v32 = v19;
  id v33 = v18;
  id v34 = v17;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C17EC;
  block[3] = &unk_10022EA98;
  id v12 = v6;
  id v13 = v7;
  __int16 v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4
{
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[CSAttSiriAsrNode trpCandidateReadyForExecutionForRequestId:withTrpId:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Unimplemented method called",  (uint8_t *)&v5,  0xCu);
  }

- (void)updateTCUState:(id)a3
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    int v5 = "-[CSAttSiriAsrNode updateTCUState:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Unimplemented method called",  (uint8_t *)&v4,  0xCu);
  }

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C179C;
  v6[3] = &unk_10022EFA8;
  v6[4] = self;
  BOOL v7 = a4;
  dispatch_async(localSpeechRecognizerQueue, v6);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000C15AC;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(localSpeechRecognizerQueue, v8);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C14F8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v8 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1370;
  block[3] = &unk_10022E7F8;
  double v13 = a4;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_enforceEndpointHintWithRequestId:(id)a3 rcId:(unint64_t)a4 shouldAccept:(BOOL)a5 featuresToLog:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (self->_speechHasAcceptedResultCandidate)
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSAttSiriAsrNode _enforceEndpointHintWithRequestId:rcId:shouldAccept:featuresToLog:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Already accepted result candidate for request",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    self->_speechHasAcceptedResultCandidate = 1;
    if (self->_localSpeechRecognizerState == 2)
    {
      if (+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled"))
      {
        double v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[CSAttSiriAsrNode _enforceEndpointHintWithRequestId:rcId:shouldAccept:featuresToLog:]";
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s isMedocFeatureEnabled - don't need to send mitigationSignal",  (uint8_t *)&buf,  0xCu);
        }
      }

      else
      {
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v24 = 0x2020000000LL;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
        unsigned __int8 v15 = [WeakRetained getMitigationDecisionForRCId:a4 forRequestId:v10];

        unsigned __int8 v25 = v15;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode localSRBridgeListener](self, "localSRBridgeListener"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1000C1258;
        v17[3] = &unk_10022C6E8;
        p___int128 buf = &buf;
        unint64_t v21 = a4;
        BOOL v22 = a5;
        id v18 = v10;
        id v19 = v11;
        [v16 notifyClientsWithBlock:v17];

        _Block_object_dispose(&buf, 8);
      }
    }

    -[CSAttSiriAsrNode _clearEndpointHint](self, "_clearEndpointHint");
  }
}

- (void)_clearEndpointHint
{
  self->_lastEndpointHintDuration = 0.0;
  self->_lastEndpointHintRCId = -1LL;
  lastEndpointHintFeatures = self->_lastEndpointHintFeatures;
  self->_lastEndpointHintFeatures = 0LL;
}

- (void)start
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v7 = "-[CSAttSiriAsrNode start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1020;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)preheatWithLanguage:(id)a3 shouldDownloadMissingAsset:(BOOL)a4
{
  id v6 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C100C;
  block[3] = &unk_10022ECA8;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer](self, "_interactiveLocalSpeechRecognizer"));
    [v8 startMissingAssetDownload];
  }

  -[CSAttSiriAsrNode _preheatWithLanguage:preheatSource:](self, "_preheatWithLanguage:preheatSource:", v9, a4);
}

- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6) {
    id v8 = (NSString *)v6;
  }
  else {
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  }
  language = self->_language;
  self->_language = v8;

  id v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = self->_language;
    int v15 = 136315394;
    id v16 = "-[CSAttSiriAsrNode _preheatWithLanguage:preheatSource:]";
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Preheat local speech recognizer with language : %@",  (uint8_t *)&v15,  0x16u);
  }

  id v12 = [[SFEntitledAssetConfig alloc] initWithLanguage:self->_language assetType:3];
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _sourceStringFromPreheatSource:](self, "_sourceStringFromPreheatSource:", a4));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer](self, "_interactiveLocalSpeechRecognizer"));
  [v14 preheatSpeechRecognitionWithAssetConfig:v12 preheatSource:v13 modelOverrideURL:0];
}

- (void)prepareToStartSpeechRequestWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C0E20;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3 stopUresProcessing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  requestId = self->_requestId;
  if (requestId && !-[NSString isEqualToString:](requestId, "isEqualToString:", v6))
  {
    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = self->_requestId;
      int v10 = 136315906;
      BOOL v11 = "-[CSAttSiriAsrNode _stopPreviousRecognitionTaskIfNeededWithNewRequestId:stopUresProcessing:]";
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s cached requestId : %@, newRequestId : %@, stopUresProcessing : %d",  (uint8_t *)&v10,  0x26u);
    }

    -[CSAttSiriAsrNode _handleStopDeliverLocalSpeechRecognitionWithStopUresProcessing:]( self,  "_handleStopDeliverLocalSpeechRecognitionWithStopUresProcessing:",  v4);
  }
}

- (BOOL)_shouldDisableLocalSpeechRecognizerWithOption:(id)a3 audioRecordContext:(id)a4
{
  id v5 = a4;
  if (([a3 disableLocalSpeechRecognizer] & 1) == 0)
  {
    if (![v5 isDictation]
      || (+[CSUtils supportsDictationOnDevice](&OBJC_CLASS___CSUtils, "supportsDictationOnDevice") & 1) != 0)
    {
      BOOL v6 = 0;
      goto LABEL_6;
    }

    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[CSAttSiriAsrNode _shouldDisableLocalSpeechRecognizerWithOption:audioRecordContext:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Disable local SR for dictation",  (uint8_t *)&v9,  0xCu);
    }
  }

  BOOL v6 = 1;
LABEL_6:

  return v6;
}

- (void)setMhId:(id)a3
{
  BOOL v4 = (NSString *)a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSAttSiriAsrNode setMhId:]";
    __int16 v9 = 2112;
    int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s mhID : %@", (uint8_t *)&v7, 0x16u);
  }

  mhId = self->_mhId;
  self->_mhId = v4;
}

- (void)_startLocalSpeechRecognizerIfNeeded
{
  BOOL v3 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    id v5 = v3;
    double v6 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _stateToString:](self, "_stateToString:", localSpeechRecognizerState)));
    *(_DWORD *)__int128 buf = 136315394;
    v147 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
    __int16 v148 = 2114;
    double v149 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s current state = %{public}@", buf, 0x16u);
  }

  if (self->_localSpeechRecognizerState == 2)
  {
    int v7 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
    language = self->_language;
    self->_language = v7;

    *(_WORD *)&self->_didDetectedEndpoint = 0;
    self->_localSpeechRecognizerDeliverAudioDuration = 0.0;
    self->_lastEndpointEagerResultTime = 0LL;
    __int16 v9 = -[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:]( objc_alloc(&OBJC_CLASS___CSEndpointDelayReporter),  "initWithRequestMHUUID:turnIdentifier:",  0LL,  0LL);
    endpointDelayReporter = self->_endpointDelayReporter;
    self->_endpointDelayReporter = v9;

    -[CSAttSiriAsrNode _clearEndpointHint](self, "_clearEndpointHint");
    if (!self->_disableEndpointer)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[LBLocalSpeechRecognitionSettings getTaskStringFromSpeechRecognitionSettings:]( &OBJC_CLASS___LBLocalSpeechRecognitionSettings,  "getTaskStringFromSpeechRecognitionSettings:",  self->_speechRecognitionSettings));
      [WeakRetained processTaskString:v12];
    }

    id v13 = objc_loadWeakRetained((id *)&self->_ssrNode);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings sharedUserInfos]( self->_speechRecognitionSettings,  "sharedUserInfos"));
    [v13 cacheSharedUserInfos:v14];

    id v15 = self->_language;
    if (*(double *)&v15 != 0.0 && self->_localSpeechRecognizerTaskString)
    {
      if (self->_isFileLoggingEnabled)
      {
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
        BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v16 mhLogDirectory]);
        id v18 = (CSPlainAudioFileWriter *)objc_claimAutoreleasedReturnValue( +[CSUtils loggingFilePathWithDirectory:token:postfix:]( &OBJC_CLASS___CSUtils,  "loggingFilePathWithDirectory:token:postfix:",  v17,  @"localASR",  @"wav"));

        id v19 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));
        unint64_t v21 = -[CSPlainAudioFileWriter initWithURL:](v19, "initWithURL:", v20);
        audioFileWriter = self->_audioFileWriter;
        self->_audioFileWriter = v21;
      }

      else
      {
        id v18 = self->_audioFileWriter;
        self->_audioFileWriter = 0LL;
      }

      unsigned __int8 v125 = -[CSAudioRecordContext isVoiceTriggered](self->_recordContext, "isVoiceTriggered");
      v134 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings dictationUIInteractionId]( self->_speechRecognitionSettings,  "dictationUIInteractionId"));
      unsigned __int8 v129 = -[LBLocalSpeechRecognitionSettings shouldStoreAudioOnDevice]( self->_speechRecognitionSettings,  "shouldStoreAudioOnDevice");
      uint64_t v24 = objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings overrideModelPath]( self->_speechRecognitionSettings,  "overrideModelPath"));
      int v127 = CSShouldCensorSpeech();
      v132 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriAsrNode _fetchInputOriginWithRecordContext:]( self,  "_fetchInputOriginWithRecordContext:",  self->_recordContext));
      unsigned __int8 v124 = -[LBLocalSpeechRecognitionSettings deliverEagerPackage]( self->_speechRecognitionSettings,  "deliverEagerPackage");
      unsigned __int8 v25 = self->_language;
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings UILanguage](self->_speechRecognitionSettings, "UILanguage"));
      localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings asrLocale](self->_speechRecognitionSettings, "asrLocale"));
      v131 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriAsrNode _fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:]( self,  "_fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:",  v25,  v26,  localSpeechRecognizerTaskString,  v28));

      if (v24) {
        v130 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v24,  1LL));
      }
      else {
        v130 = 0LL;
      }
      double v29 = 0.0;
      double endpointStartTimeInSec = 0.0;
      if (-[CSAudioRecordContext isVoiceTriggered](self->_recordContext, "isVoiceTriggered"))
      {
        double endpointStartTimeInSec = self->_endpointStartTimeInSec;
        float audioSampleCountToSkip = (float)self->_audioSampleCountToSkip;
        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        double v29 = (float)(audioSampleCountToSkip / v32);
      }

      -[CSAttSiriAsrNode _resetLocalSpeechRecognizerParameters](self, "_resetLocalSpeechRecognizerParameters");
      v128 = (void *)v24;
      if (v134) {
        v133 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings applicationName]( self->_speechRecognitionSettings,  "applicationName"));
      }
      else {
        v133 = @"com.apple.siri.assistant";
      }
      id v33 = objc_alloc(&OBJC_CLASS___CESRSpeechParameters);
      requestId = self->_requestId;
      id v121 = v33;
      v122 = self->_localSpeechRecognizerTaskString;
      v120 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings recognitionOverrides]( self->_speechRecognitionSettings,  "recognitionOverrides"));
      unsigned __int8 v119 = -[LBLocalSpeechRecognitionSettings detectUtterances]( self->_speechRecognitionSettings,  "detectUtterances");
      unsigned __int8 v118 = -[LBLocalSpeechRecognitionSettings secureOfflineOnly]( self->_speechRecognitionSettings,  "secureOfflineOnly");
      unsigned __int8 v117 = -[LBLocalSpeechRecognitionSettings continuousListening]( self->_speechRecognitionSettings,  "continuousListening");
      unsigned __int8 v116 = -[LBLocalSpeechRecognitionSettings shouldHandleCapitalization]( self->_speechRecognitionSettings,  "shouldHandleCapitalization");
      -[LBLocalSpeechRecognitionSettings maximumRecognitionDuration]( self->_speechRecognitionSettings,  "maximumRecognitionDuration");
      double v35 = v34;
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings location](self->_speechRecognitionSettings, "location"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings jitGrammar](self->_speechRecognitionSettings, "jitGrammar"));
      HIDWORD(v114) = self->_disableEndpointer;
      unsigned __int8 v37 = -[LBLocalSpeechRecognitionSettings enableEmojiRecognition]( self->_speechRecognitionSettings,  "enableEmojiRecognition");
      unsigned __int8 v38 = -[LBLocalSpeechRecognitionSettings enableAutoPunctuation]( self->_speechRecognitionSettings,  "enableAutoPunctuation");
      unsigned __int8 v39 = -[LBLocalSpeechRecognitionSettings enableVoiceCommands]( self->_speechRecognitionSettings,  "enableVoiceCommands");
      id v40 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings sharedUserInfos]( self->_speechRecognitionSettings,  "sharedUserInfos"));
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings prefixText](self->_speechRecognitionSettings, "prefixText"));
      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings postfixText](self->_speechRecognitionSettings, "postfixText"));
      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings selectedText](self->_speechRecognitionSettings, "selectedText"));
      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings powerContext](self->_speechRecognitionSettings, "powerContext"));
      LOBYTE(v114) = -[LBLocalSpeechRecognitionSettings shouldGenerateVoiceCommandCandidates]( self->_speechRecognitionSettings,  "shouldGenerateVoiceCommandCandidates");
      BYTE4(v113) = v39;
      BYTE3(v113) = v38;
      BYTE2(v113) = v37;
      BYTE1(v113) = BYTE4(v114);
      LOBYTE(v113) = v124;
      LOBYTE(v112) = 0;
      HIBYTE(v111) = v116;
      BYTE6(v111) = v117;
      BYTE5(v111) = v129;
      BYTE4(v111) = v118;
      BYTE3(v111) = v125;
      BYTE2(v111) = v127;
      BYTE1(v111) = v119;
      LOBYTE(v111) = 0;
      id v126 = objc_msgSend( v121,  "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:p rofile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:far Field:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechA PIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:di sableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInf os:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:",  v131,  requestId,  v134,  v122,  0,  v133,  v35,  endpointStartTimeInSec,  v29,  0,  v120,  v130,  0,  0,  v111,  v112,  v132,  v36,  v115,  v113,  v40,  v41,  v42,  v43,  v44,  v114);

      v45 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v46 = self->_localSpeechRecognizerTaskString;
        speechRecognitionSettings = self->_speechRecognitionSettings;
        id v48 = v45;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings location](speechRecognitionSettings, "location"));
        if (v127) {
          v50 = @"YES";
        }
        else {
          v50 = @"NO";
        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings jitGrammar](self->_speechRecognitionSettings, "jitGrammar"));
        unsigned int v52 = -[LBLocalSpeechRecognitionSettings enableVoiceCommands]( self->_speechRecognitionSettings,  "enableVoiceCommands");
        *(_DWORD *)__int128 buf = 136316930;
        v147 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
        if (v52) {
          v53 = @"YES";
        }
        else {
          v53 = @"NO";
        }
        __int16 v148 = 2114;
        double v149 = *(double *)&v46;
        __int16 v150 = 2050;
        v151 = *(const char **)&endpointStartTimeInSec;
        __int16 v152 = 2114;
        v153 = v132;
        __int16 v154 = 2112;
        v155 = v49;
        __int16 v156 = 2114;
        v157 = v50;
        __int16 v158 = 2112;
        v159 = v51;
        __int16 v160 = 2114;
        v161 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "%s Calling local speech recognition with settings : task(%{public}@), endpointStart(%{public}.3f), inputOrigin (%{public}@), location(%@), shouldCensorSpeech(%{public}@), jitGrammar(%@), enableVoiceCommands(%{public}@)",  buf,  0x52u);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v55 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v55;
        double v57 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v54 UUIDString]));
        *(_DWORD *)__int128 buf = 136315394;
        v147 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
        __int16 v148 = 2112;
        double v149 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s Setting ASR UUID : %@", buf, 0x16u);
      }

      v143[0] = _NSConcreteStackBlock;
      v143[1] = 3221225472LL;
      v143[2] = sub_1000C0B00;
      v143[3] = &unk_10022C710;
      id v58 = v54;
      id v144 = v58;
      v59 = (void *)objc_claimAutoreleasedReturnValue([v126 mutatedCopyWithMutator:v143]);
      if (self->_voiceTriggerFireMachTime)
      {
        uint64_t v60 = mach_absolute_time();
        os_signpost_id_t v61 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
        v62 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        v63 = v62;
        if (v61 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v65 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        }

        else
        {
          if (os_signpost_enabled(v62))
          {
            unint64_t voiceTriggerFireMachTime = self->_voiceTriggerFireMachTime;
            *(_DWORD *)__int128 buf = 134349570;
            v147 = (const char *)voiceTriggerFireMachTime;
            __int16 v148 = 2080;
            double v149 = COERCE_DOUBLE("SiriX");
            __int16 v150 = 2080;
            v151 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v63,  OS_SIGNPOST_INTERVAL_BEGIN,  v61,  "ondevice_VoiceTriggerEndToASRStartLatency",  "%{public, signpost.description:begin_time}llu, %s %s",  buf,  0x20u);
          }

          v65 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_signpost_enabled(v65))
          {
            *(_DWORD *)__int128 buf = 134349570;
            v147 = (const char *)v60;
            __int16 v148 = 2080;
            double v149 = COERCE_DOUBLE("SiriX");
            __int16 v150 = 2080;
            v151 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v65,  OS_SIGNPOST_INTERVAL_END,  v61,  "ondevice_VoiceTriggerEndToASRStartLatency",  "%{public, signpost.description:end_time}llu, %s %s",  buf,  0x20u);
          }
        }

        double TimeInterval = CSMachAbsoluteTimeGetTimeInterval(v60 - self->_voiceTriggerFireMachTime);
        v67 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          float v68 = TimeInterval * 1000.0;
          *(_DWORD *)__int128 buf = 136315394;
          v147 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
          __int16 v148 = 2050;
          double v149 = v68;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "%s Voice trigger end to ASR Start Latency: %{public}.2f ms",  buf,  0x16u);
        }
      }

      *(_WORD *)&self->_onDeviceDictationSampled = 0;
      self->_unint64_t voiceTriggerFireMachTime = 0LL;
      if (!+[CSUtils isOnDeviceASRAudioLoggingEnabled]( &OBJC_CLASS___CSUtils,  "isOnDeviceASRAudioLoggingEnabled")
        || (v69 = (void *)objc_claimAutoreleasedReturnValue([v59 task]),
            unsigned int v70 = +[CESRUtilities isSamplingSupportedForTask:]( &OBJC_CLASS___CESRUtilities,  "isSamplingSupportedForTask:",  v69),  v69,  !v70))
      {
        v73 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315138;
          v147 = "-[CSAttSiriAsrNode _startLocalSpeechRecognizerIfNeeded]";
          _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "%s Request is ineligible for sampling. Disabling audio logging.",  buf,  0xCu);
        }

        audioLogging = self->_audioLogging;
        self->_audioLogging = 0LL;
        goto LABEL_62;
      }

      v71 = (void *)objc_claimAutoreleasedReturnValue([v59 task]);
      if ([v71 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation])
      {
        uint64_t v72 = 1LL;
      }

      else
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue([v59 task]);
        uint64_t v72 = (uint64_t)[v75 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch];
      }

      p_onDeviceAssistantSampled = &self->_onDeviceAssistantSampled;

      v77 = objc_alloc(&OBJC_CLASS___CSSpeechRecognitionSelfHelper);
      v78 = (void *)objc_claimAutoreleasedReturnValue([v59 task]);
      v79 = -[CSSpeechRecognitionSelfHelper initWithAsrId:taskName:isSamplingForDictation:]( v77,  "initWithAsrId:taskName:isSamplingForDictation:",  v58,  v78,  v72);
      asrSelfHelper = self->_asrSelfHelper;
      self->_asrSelfHelper = v79;

      if ((_DWORD)v72)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue( +[CESRDictationOnDeviceSampling sharedManager]( &OBJC_CLASS___CESRDictationOnDeviceSampling,  "sharedManager"));
        unsigned __int8 v82 = [v81 isRequestSelectedForSamplingFromConfigForLanguage:self->_language];
        p_onDeviceDictationSampled = &self->_onDeviceDictationSampled;
      }

      else
      {
        if ((v129 & 1) == 0)
        {
          BOOL *p_onDeviceAssistantSampled = 0;
          goto LABEL_56;
        }

        v81 = (void *)objc_claimAutoreleasedReturnValue( +[CESRAssistantOnDeviceSampling sharedManager]( &OBJC_CLASS___CESRAssistantOnDeviceSampling,  "sharedManager"));
        unsigned __int8 v82 = [v81 isRequestSelectedForSamplingForTask:self->_localSpeechRecognizerTaskString];
        p_onDeviceDictationSampled = &self->_onDeviceAssistantSampled;
      }

      BOOL *p_onDeviceDictationSampled = v82;

      if (*p_onDeviceAssistantSampled)
      {
        v84 = objc_alloc(&OBJC_CLASS___CSUncompressedAudioLogging);
        v85 = self->_requestId;
        v86 = (CSUncompressedAudioLogging *)objc_claimAutoreleasedReturnValue([v58 UUIDString]);
        v87 = self->_language;
        v88 = (void *)objc_claimAutoreleasedReturnValue([v59 task]);
        v89 = -[CSUncompressedAudioLogging initWithRequestId:asrId:languageCode:task:]( v84,  "initWithRequestId:asrId:languageCode:task:",  v85,  v86,  v87,  v88);
        v90 = self->_audioLogging;
        self->_audioLogging = v89;

LABEL_61:
        v98 = self->_asrSelfHelper;
        v99 = self->_audioLogging;
        v140[0] = _NSConcreteStackBlock;
        v140[1] = 3221225472LL;
        v140[2] = sub_1000C0B0C;
        v140[3] = &unk_10022EFF8;
        v141 = v98;
        v142 = self;
        audioLogging = v98;
        -[CSUncompressedAudioLogging prepareLogging:](v99, "prepareLogging:", v140);

LABEL_62:
        v100 = (__CFString *)v133;

        v101 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer]( self,  "_interactiveLocalSpeechRecognizer"));
        v139[0] = _NSConcreteStackBlock;
        v139[1] = 3221225472LL;
        v139[2] = sub_1000C0B2C;
        v139[3] = &unk_10022C738;
        v139[4] = self;
        [v101 startSpeechRecognitionWithParameters:v59 didStartHandlerWithInfo:v139];

        v102 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioProcessWaitingBuffer fetchAudioChunksFromBuffer]( self->_audioWaitingBuffer,  "fetchAudioChunksFromBuffer"));
        v103 = v102;
        if (v102)
        {
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          id v104 = [v102 countByEnumeratingWithState:&v135 objects:v145 count:16];
          if (v104)
          {
            id v105 = v104;
            uint64_t v106 = *(void *)v136;
            do
            {
              for (i = 0LL; i != v105; i = (char *)i + 1)
              {
                if (*(void *)v136 != v106) {
                  objc_enumerationMutation(v103);
                }
                v108 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)i);
                v109 = (void *)objc_claimAutoreleasedReturnValue([v108 audioChunk]);
                v110 = (void *)objc_claimAutoreleasedReturnValue([v108 bufferedTimestamp]);
                -[CSAttSiriAsrNode _processAudioChunk:withReadyTimestamp:]( self,  "_processAudioChunk:withReadyTimestamp:",  v109,  v110);
              }

              id v105 = [v103 countByEnumeratingWithState:&v135 objects:v145 count:16];
            }

            while (v105);
          }

          -[CSAttSiriAsrNode _clearAudioProcessWaitingBufferIfNeeded](self, "_clearAudioProcessWaitingBufferIfNeeded");
          v100 = (__CFString *)v133;
        }

        return;
      }

- (void)_processAudioChunk:(id)a3 withReadyTimestamp:(id)a4
{
  id v6 = a3;
  if (self->_localSpeechRecognizerTaskString)
  {
    id v7 = a4;
    float v8 = (float)(unint64_t)[v6 numSamples];
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_localSpeechRecognizerDeliverAudioDuration = self->_localSpeechRecognizerDeliverAudioDuration
                                                     + (float)(v8 / v9);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dataForChannel:self->_activeChannel]);
    audioFileWriter = self->_audioFileWriter;
    id v12 = v10;
    -[CSPlainAudioFileWriter addSamples:numSamples:]( audioFileWriter,  "addSamples:numSamples:",  [v12 bytes],  objc_msgSend(v6, "numSamples"));
    if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:]( &OBJC_CLASS___CSFLPCMTypeConverter,  "convertToShortLPCMBufFromFloatLPCMBuf:",  v12));

      id v12 = (id)v13;
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer](self, "_interactiveLocalSpeechRecognizer"));
    id v15 = [v6 hostTime];
    BOOL v17 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  CSMachAbsoluteTimeToMachContinuousTime(v15, v16));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v14 addAudioPacket:v12 packetRecordedTime:v18 packetReadyUpstreamTime:v7];

    -[CSUncompressedAudioLogging appendAudioData:](self->_audioLogging, "appendAudioData:", v12);
    id v19 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      id v20 = v19;
      int v21 = 136315394;
      BOOL v22 = "-[CSAttSiriAsrNode _processAudioChunk:withReadyTimestamp:]";
      __int16 v23 = 2050;
      id v24 = [v6 numSamples];
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Added %{public}lu samples to local speech recognizer",  (uint8_t *)&v21,  0x16u);
    }
  }
}

- (void)_handleStopSpeechRecognitionTaskIfNeeded:(BOOL)a3
{
  if (!self->_shouldProcessAudio && !a3) {
    return;
  }
  self->_shouldProcessAudio = 0;
  -[CSAttSiriAsrNode _scheduleRecordingTransactionReleaseTimer](self, "_scheduleRecordingTransactionReleaseTimer", a3);
  localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
  if (localSpeechRecognizerTaskString)
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v17 = 136315394;
      *(void *)&void v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = localSpeechRecognizerTaskString;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Stopping task %@", v17, 0x16u);
    }

    -[CoreEmbeddedSpeechRecognizerProvider finishAudio](self->_interactiveLocalSpeechRecognizer, "finishAudio");
    -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
  }

  unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
  if (localSpeechRecognizerState != 1)
  {
    float v9 = self->_localSpeechRecognizerTaskString;
    if (v9 && self->_interactiveLocalSpeechRecognizer)
    {
      if (localSpeechRecognizerState != 3)
      {
LABEL_22:
        recordContext = self->_recordContext;
        self->_recordContext = 0LL;

        self->_double endpointStartTimeInSec = 0.0;
        self->_float audioSampleCountToSkip = 0LL;
        -[CSAttSiriAsrNode _clearAudioProcessWaitingBufferIfNeeded](self, "_clearAudioProcessWaitingBufferIfNeeded");
        return;
      }

      int v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)BOOL v17 = 136315138;
        *(void *)&void v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
        BOOL v11 = "%s Complete task now since local SR is disabled";
        id v12 = v10;
        uint32_t v13 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, v17, v13);
      }
    }

    else
    {
      __int16 v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
        *(_DWORD *)BOOL v17 = 136315650;
        *(void *)&void v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
        *(_WORD *)&v17[12] = 2114;
        *(void *)&v17[14] = v9;
        *(_WORD *)&v17[22] = 2050;
        id v18 = interactiveLocalSpeechRecognizer;
        BOOL v11 = "%s Complete task now since taskString(%{public}@) or localSR(%{public}p) is nil";
        id v12 = v14;
        uint32_t v13 = 32;
        goto LABEL_20;
      }
    }

    -[CSAttSiriAsrNode _setLocalSpeechRecognizerState:]( self,  "_setLocalSpeechRecognizerState:",  0LL,  *(_OWORD *)v17,  *(void *)&v17[16],  v18);
    goto LABEL_22;
  }

  float v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)BOOL v17 = 136315138;
    *(void *)&void v17[4] = "-[CSAttSiriAsrNode _handleStopSpeechRecognitionTaskIfNeeded:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Request dispatcher didn't ask to start until end",  v17,  0xCu);
  }

  -[CSAttSiriAsrNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 4LL);
}

- (void)_scheduleRecordingTransactionReleaseTimer
{
  BOOL v3 = self->_recordingToken;
  BOOL v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    recordingToken = self->_recordingToken;
    *(_DWORD *)__int128 buf = 136315650;
    __int16 v14 = "-[CSAttSiriAsrNode _scheduleRecordingTransactionReleaseTimer]";
    __int16 v15 = 2114;
    uint64_t v16 = recordingToken;
    __int16 v17 = 2050;
    uint64_t v18 = 0x4014000000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Schedule RecordingTransactionReleaseTimer %{public}@ for %{public}lf seconds",  buf,  0x20u);
  }

  dispatch_time_t v6 = dispatch_time(0LL, 5000000000LL);
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C0AC4;
  block[3] = &unk_10022F0D8;
  objc_copyWeak(&v11, &location);
  int v10 = v3;
  float v8 = v3;
  dispatch_after(v6, localSpeechRecognizerQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_releaseRecordingTransactionIfNeededWithToken:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    recordingToken = self->_recordingToken;
    int v10 = 136315650;
    id v11 = "-[CSAttSiriAsrNode _releaseRecordingTransactionIfNeededWithToken:]";
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2114;
    __int16 v15 = recordingToken;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Token : %{public}@, currentToken : %{public}@",  (uint8_t *)&v10,  0x20u);
  }

  if ([v4 isEqual:self->_recordingToken])
  {
    -[CSAttSiriAsrNode _clearAudioProcessWaitingBufferIfNeeded](self, "_clearAudioProcessWaitingBufferIfNeeded");
    id v7 = self->_recordingToken;
    self->_recordingToken = 0LL;

    recordingTransaction = self->_recordingTransaction;
    self->_recordingTransaction = 0LL;
  }

  else
  {
    float v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[CSAttSiriAsrNode _releaseRecordingTransactionIfNeededWithToken:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s recordingToken doesn't match, ignore",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (id)_interactiveLocalSpeechRecognizer
{
  if (!+[CSUtils supportsSpeechRecognitionOnDevice]( &OBJC_CLASS___CSUtils,  "supportsSpeechRecognitionOnDevice")) {
    return 0LL;
  }
  if (!self->_interactiveLocalSpeechRecognizer)
  {
    presetLocalSpeechRecognizer = self->_presetLocalSpeechRecognizer;
    if (!presetLocalSpeechRecognizer)
    {
      if (+[CSUtils isASRViaSpeechAPIEnabled](&OBJC_CLASS___CSUtils, "isASRViaSpeechAPIEnabled"))
      {
        id v5 = (CoreEmbeddedSpeechRecognizerProvider *)[[CoreEmbeddedSpeechAnalyzer alloc] initWithDelegate:self instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
        interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
        self->_interactiveLocalSpeechRecognizer = v5;

        id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          return self->_interactiveLocalSpeechRecognizer;
        }
        float v8 = self->_interactiveLocalSpeechRecognizer;
        int v13 = 136315650;
        __int16 v14 = "-[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer]";
        __int16 v15 = 2112;
        uint64_t v16 = self;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        float v9 = "%s %@ created speech recognizer (v2) %@";
      }

      else
      {
        int v10 = (CoreEmbeddedSpeechRecognizerProvider *)[[CoreEmbeddedSpeechRecognizer alloc] initWithDelegate:self instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
        id v11 = self->_interactiveLocalSpeechRecognizer;
        self->_interactiveLocalSpeechRecognizer = v10;

        id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          return self->_interactiveLocalSpeechRecognizer;
        }
        __int16 v12 = self->_interactiveLocalSpeechRecognizer;
        int v13 = 136315650;
        __int16 v14 = "-[CSAttSiriAsrNode _interactiveLocalSpeechRecognizer]";
        __int16 v15 = 2112;
        uint64_t v16 = self;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        float v9 = "%s %@ created speech recognizer (v1) %@";
      }

      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0x20u);
      return self->_interactiveLocalSpeechRecognizer;
    }

    objc_storeStrong((id *)&self->_interactiveLocalSpeechRecognizer, presetLocalSpeechRecognizer);
  }

  return self->_interactiveLocalSpeechRecognizer;
}

- (void)_invalidateLocalSpeechRecognizer
{
  interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
  if (interactiveLocalSpeechRecognizer)
  {
    -[CoreEmbeddedSpeechRecognizerProvider invalidate](interactiveLocalSpeechRecognizer, "invalidate");
    id v4 = self->_interactiveLocalSpeechRecognizer;
    self->_interactiveLocalSpeechRecognizer = 0LL;
  }

  localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
  self->_localSpeechRecognizerTaskString = 0LL;
}

- (void)_resetLocalSpeechRecognizerParameters
{
  self->_eagerResultId = 0LL;
  self->_speechHasAcceptedResultCandidate = 0;
  self->_firstWordDuration = 0.0;
  self->_leadingSilenceDuration = 0.0;
  self->_firstPartialResultTime = 0LL;
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C0924;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePartialPackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C0730;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000C053C;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v6 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C03C8;
  block[3] = &unk_10022E7F8;
  void block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_queryShouldAcceptEagerResultForDuration:(double)a3 requestId:(id)a4 rcId:(unint64_t)a5
{
  id v8 = a4;
  if (self->_speechHasAcceptedResultCandidate)
  {
    id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[CSAttSiriAsrNode _queryShouldAcceptEagerResultForDuration:requestId:rcId:]";
      id v10 = "%s Skip query as already accepted result candidate for request";
      double v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, location, v13);
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
    unsigned int v15 = [WeakRetained getUsesAutomaticEndpointing];

    BOOL didDetectedEndpoint = self->_didDetectedEndpoint;
    if (self->_didDetectedEndpoint && v15)
    {
      objc_initWeak((id *)location, self);
      id v17 = objc_loadWeakRetained((id *)&self->_endpointerNode);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000C0360;
      v21[3] = &unk_10022C760;
      objc_copyWeak(v23, (id *)location);
      id v22 = v8;
      v23[1] = (id)a5;
      v23[2] = *(id *)&a3;
      [v17 shouldAcceptEagerResultForDuration:v21 resultsCompletionHandler:(double)(uint64_t)a3];

      objc_destroyWeak(v23);
      objc_destroyWeak((id *)location);
    }

    else
    {
      id v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = @"YES";
        *(void *)&location[4] = "-[CSAttSiriAsrNode _queryShouldAcceptEagerResultForDuration:requestId:rcId:]";
        else {
          id v20 = @"NO";
        }
        *(_DWORD *)id location = 136315650;
        __int16 v25 = 2114;
        id v26 = v20;
        if (!v15) {
          id v19 = @"NO";
        }
        __int16 v27 = 2114;
        id v28 = v19;
        id v10 = "%s didDetectedEndpoint = %{public}@, usesAutomaticEndpointing = %{public}@, waiting";
        double v11 = v18;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 32;
        goto LABEL_14;
      }
    }
  }
}

- (void)_handleShouldAcceptEagerResultWithRequestId:(id)a3 rcId:(unint64_t)a4 duration:(double)a5 shouldAccept:(BOOL)a6 featuresToLog:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000C01E4;
  v17[3] = &unk_10022C788;
  BOOL v22 = a6;
  double v20 = a5;
  void v17[4] = self;
  id v18 = v13;
  id v19 = v12;
  unint64_t v21 = a4;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(localSpeechRecognizerQueue, v17);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C0084;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000BFF0C;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BFD3C;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000BFB5C;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeMultiUserSpeechPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BF824;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_handleDidRecognizedFinalSpeechPackage:(id)a3 multiUserSpeechPackage:(id)a4 requestId:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int64_t lastEndpointHintRCId = self->_lastEndpointHintRCId;
  id v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (lastEndpointHintRCId < 0)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v23 = "-[CSAttSiriAsrNode _handleDidRecognizedFinalSpeechPackage:multiUserSpeechPackage:requestId:metadata:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s There is no valid RC to deliver, or previous RC already got accepted",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      __int16 v23 = "-[CSAttSiriAsrNode _handleDidRecognizedFinalSpeechPackage:multiUserSpeechPackage:requestId:metadata:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Enforce previous endpointHint", buf, 0xCu);
      int64_t lastEndpointHintRCId = self->_lastEndpointHintRCId;
    }

    -[CSAttSiriAsrNode _enforceEndpointHintWithRequestId:rcId:shouldAccept:featuresToLog:]( self,  "_enforceEndpointHintWithRequestId:rcId:shouldAccept:featuresToLog:",  self->_requestId,  lastEndpointHintRCId,  1LL,  self->_lastEndpointHintFeatures);
  }

  -[CSAttSiriAsrNode _markTimeToFirstWordMetric](self, "_markTimeToFirstWordMetric");
  if (self->_localSpeechRecognizerState == 2)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode localSRBridgeListener](self, "localSRBridgeListener"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000BF7B0;
    v17[3] = &unk_10022C7B0;
    void v17[4] = self;
    id v18 = v12;
    id v19 = v10;
    id v20 = v13;
    id v21 = v11;
    [v16 notifyClientsWithBlock:v17];
  }
}

- (void)_handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:(id)a3 multiUserSpeechPackage:(id)a4 requestId:(id)a5 rcId:(unint64_t)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (self->_speechHasAcceptedResultCandidate)
  {
    id v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      double v34 = "-[CSAttSiriAsrNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:multiUserSpeechPackage:requ"
            "estId:rcId:metadata:]";
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s Already accepted result candidate for request",  buf,  0xCu);
    }
  }

  else
  {
    +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenEndTimeFromSpeechPackage:",  v12);
    double v18 = v17 * 1000.0;
    id v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      double v34 = "-[CSAttSiriAsrNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:multiUserSpeechPackage:requ"
            "estId:rcId:metadata:]";
      __int16 v35 = 2048;
      double v36 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s SpeechPackage processed audio duration: %f ms",  buf,  0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
    [WeakRetained processResultCandidate:v12 forRCId:a6 forTask:self->_localSpeechRecognizerTaskString forRequestId:v14 completion:0];

    if (self->_localSpeechRecognizerState == 2)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode localSRBridgeListener](self, "localSRBridgeListener"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1000BF72C;
      v26[3] = &unk_10022C7D8;
      v26[4] = self;
      id v27 = v14;
      unint64_t v31 = a6;
      id v28 = v12;
      double v32 = v18;
      id v29 = v15;
      id v30 = v13;
      [v21 notifyClientsWithBlock:v26];
    }

    id v22 = objc_loadWeakRetained((id *)&self->_endpointerNode);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[LBLocalSpeechRecognitionSettings getTaskStringFromSpeechRecognitionSettings:]( &OBJC_CLASS___LBLocalSpeechRecognitionSettings,  "getTaskStringFromSpeechRecognitionSettings:",  self->_speechRecognitionSettings));
    [v22 processSpeechPackage:v12 taskName:v23];

    self->_lastEndpointHintDuration = v18;
    self->_int64_t lastEndpointHintRCId = a6;
    self->_lastEndpointEagerResultTime = mach_continuous_time();
    endpointDelayReporter = self->_endpointDelayReporter;
    +[CSAttSiriSpeechPackageHelper getLastTokenSilenceStartFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenSilenceStartFromSpeechPackage:",  v12);
    -[CSEndpointDelayReporter setUserSpeakingEndedTimeInMs:]( endpointDelayReporter,  "setUserSpeakingEndedTimeInMs:",  v25 * 1000.0);
    -[CSAttSiriAsrNode _queryShouldAcceptEagerResultForDuration:requestId:rcId:]( self,  "_queryShouldAcceptEagerResultForDuration:requestId:rcId:",  v14,  a6,  v18);
  }
}

- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000BF104;
  v15[3] = &unk_10022E368;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(localSpeechRecognizerQueue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  id v17 = a7;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000BEF60;
  v20[3] = &unk_10022C828;
  int64_t v22 = a4;
  int64_t v23 = a5;
  v20[4] = self;
  id v21 = v17;
  double v24 = a6;
  double v25 = a8;
  int64_t v26 = a9;
  double v27 = a10;
  id v19 = v17;
  dispatch_async(localSpeechRecognizerQueue, v20);
}

- (void)localSpeechRecognizer:(id)a3 didSelectRecognitionModelWithModelProperties:(id)a4
{
  id v5 = a4;
  id v6 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 modelRoot]);
    int v11 = 136315394;
    id v12 = "-[CSAttSiriAsrNode localSpeechRecognizer:didSelectRecognitionModelWithModelProperties:]";
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Received ASR datapack root directory: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 modelRoot]);
  [WeakRetained setASRModelRootDirectory:v10];
}

- (unint64_t)fetchCurrentState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 100LL;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BEF4C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)didDetectedEndpoint
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BEF38;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)shouldStopProcessASROnEndpoint
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BEF24;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)localSpeechRecognizerDeliverAudioDuration
{
  uint64_t v6 = 0LL;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BEF10;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)detectedEndpointTime
{
  uint64_t v6 = 0LL;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BEEFC;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(localSpeechRecognizerQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_fetchInputOriginWithRecordContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings inputOrigin](self->_speechRecognitionSettings, "inputOrigin"));
  if ([v4 isRequestFromTriggerless]
    && +[CSUtils supportMedocAnnounce](&OBJC_CLASS___CSUtils, "supportMedocAnnounce"))
  {

    uint64_t v6 = @"MagusFollowup";
  }

  else
  {
    if (!v5)
    {
      id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315394;
        id v10 = "-[CSAttSiriAsrNode _fetchInputOriginWithRecordContext:]";
        __int16 v11 = 2114;
        uint64_t v12 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Received inputOrigin: %{public}@ from Request Dispatcher, use hard-coded map",  (uint8_t *)&v9,  0x16u);
      }

      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _getAsrInputoriginFromContext:](self, "_getAsrInputoriginFromContext:", v4));
    }

    uint64_t v6 = v5;
  }

  return v6;
}

- (id)_getAsrInputoriginFromContext:(id)a3
{
  id v3 = a3;
  if ([v3 isVoiceTriggered]
    && ![v3 isRequestFromSpokenNotification])
  {
    id v4 = @"VoiceTrigger";
  }

  else
  {
    id v4 = @"HomeButton";
    if (([v3 isiOSButtonPress] & 1) == 0)
    {
      if ([v3 isRTSTriggered])
      {
        id v4 = @"RaiseToSpeak";
      }

      else if ([v3 isContinuousConversation])
      {
        id v4 = @"MagusFollowup";
      }
    }
  }

  return (id)v4;
}

- (void)_clearAudioProcessWaitingBufferIfNeeded
{
  if (self->_audioWaitingBuffer)
  {
    id v3 = objc_autoreleasePoolPush();
    audioWaitingBuffer = self->_audioWaitingBuffer;
    self->_audioWaitingBuffer = 0LL;

    objc_autoreleasePoolPop(v3);
  }

- (void)_setLocalSpeechRecognizerState:(unint64_t)a3
{
  id v5 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    id v7 = v5;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _stateToString:](self, "_stateToString:", localSpeechRecognizerState));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriAsrNode _stateToString:](self, "_stateToString:", a3));
    int v10 = 136315650;
    __int16 v11 = "-[CSAttSiriAsrNode _setLocalSpeechRecognizerState:]";
    __int16 v12 = 2114;
    __int16 v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s set current state from %{public}@ to %{public}@",  (uint8_t *)&v10,  0x20u);
  }

  self->_unint64_t localSpeechRecognizerState = a3;
}

- (id)_stateToString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"[Unknown]";
  }
  else {
    return off_10022C848[a3];
  }
}

- (id)_sourceStringFromPreheatSource:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = (id *)&CoreEmbeddedSpeechRecognizerSourceAssistant;
  }

  else
  {
    if (a3 != 2) {
      return 0LL;
    }
    id v3 = (id *)&CoreEmbeddedSpeechRecognizerSourceDictation;
  }

  return *v3;
}

- (id)_fetchRecognizerLanguageWithSiriLanguage:(id)a3 UILanguage:(id)a4 taskString:(id)a5 asrLocale:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  else {
    unsigned int v13 = [v11 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation] ^ 1;
  }
  if (v12) {
    unsigned int v13 = 1;
  }
  int v14 = v13 ^ 1;
  if (v12) {
    int v14 = 1;
  }
  if (v13) {
    id v15 = v12;
  }
  else {
    id v15 = v9;
  }
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = v9;
  }
  if (!v14) {
    id v15 = v16;
  }
  id v17 = v15;
  id v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    id v21 = "-[CSAttSiriAsrNode _fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:]";
    __int16 v22 = 2114;
    id v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Selected recognizer language : %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  return v17;
}

- (void)_markTimeToFirstWordMetric
{
  unint64_t recordingStartTime = self->_recordingStartTime;
  if (recordingStartTime
    && self->_firstPartialResultTime
    && self->_firstWordDuration > 0.0
    && self->_leadingSilenceDuration > 0.0)
  {
    os_signpost_id_t v4 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    uint64_t v6 = v5;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    }

    else
    {
      if (os_signpost_enabled(v5))
      {
        unint64_t v7 = self->_recordingStartTime;
        double leadingSilenceDuration = self->_leadingSilenceDuration;
        *(float *)&double leadingSilenceDuration = leadingSilenceDuration;
        id v9 = (char *)+[CSFTimeUtils secondsToHostTime:]( &OBJC_CLASS___CSFTimeUtils,  "secondsToHostTime:",  leadingSilenceDuration)
           + v7;
        double firstWordDuration = self->_firstWordDuration;
        *(float *)&double firstWordDuration = firstWordDuration;
        int v37 = 134349570;
        unsigned __int8 v38 = (char *)+[CSFTimeUtils secondsToHostTime:]( &OBJC_CLASS___CSFTimeUtils,  "secondsToHostTime:",  firstWordDuration)
            + (void)v9;
        __int16 v39 = 2080;
        id v40 = "SiriX";
        __int16 v41 = 2080;
        id v42 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "ondevice_TimeToFirstWord",  "%{public, signpost.description:begin_time}llu, %s %s",  (uint8_t *)&v37,  0x20u);
      }

      id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v11))
      {
        unint64_t firstPartialResultTime = self->_firstPartialResultTime;
        int v37 = 134349570;
        unsigned __int8 v38 = (const char *)firstPartialResultTime;
        __int16 v39 = 2080;
        id v40 = "SiriX";
        __int16 v41 = 2080;
        id v42 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_END,  v4,  "ondevice_TimeToFirstWord",  "%{public, signpost.description:end_time}llu, %s %s",  (uint8_t *)&v37,  0x20u);
      }
    }

    os_signpost_id_t v17 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    id v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    id v19 = v18;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      id v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    }

    else
    {
      if (os_signpost_enabled(v18))
      {
        unint64_t v20 = self->_recordingStartTime;
        int v37 = 134349314;
        unsigned __int8 v38 = (const char *)v20;
        __int16 v39 = 2080;
        id v40 = "SiriX";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "ondevice_LeadingSilence",  "%{public, signpost.description:begin_time}llu, %s",  (uint8_t *)&v37,  0x16u);
      }

      id v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v21))
      {
        unint64_t v22 = self->_recordingStartTime;
        double v23 = self->_leadingSilenceDuration;
        *(float *)&double v23 = v23;
        double v24 = (char *)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v23);
        int v37 = 134349314;
        unsigned __int8 v38 = &v24[v22];
        __int16 v39 = 2080;
        id v40 = "SiriX";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v17,  "ondevice_LeadingSilence",  "%{public, signpost.description:end_time}llu, %s",  (uint8_t *)&v37,  0x16u);
      }
    }

    os_signpost_id_t v25 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    int64_t v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    double v27 = v26;
    if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      unint64_t v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    }

    else
    {
      if (os_signpost_enabled(v26))
      {
        unint64_t v28 = self->_recordingStartTime;
        double v29 = self->_leadingSilenceDuration;
        *(float *)&double v29 = v29;
        id v30 = (char *)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v29);
        int v37 = 134349314;
        unsigned __int8 v38 = &v30[v28];
        __int16 v39 = 2080;
        id v40 = "SiriX";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_INTERVAL_BEGIN,  v25,  "ondevice_FirstWordDuration",  "%{public, signpost.description:begin_time}llu, %s",  (uint8_t *)&v37,  0x16u);
      }

      unint64_t v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v31))
      {
        unint64_t v32 = self->_recordingStartTime;
        double v33 = self->_leadingSilenceDuration;
        *(float *)&double v33 = v33;
        double v34 = (char *)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v33) + v32;
        double v35 = self->_firstWordDuration;
        *(float *)&double v35 = v35;
        double v36 = (char *)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v35);
        int v37 = 134349314;
        unsigned __int8 v38 = &v36[(void)v34];
        __int16 v39 = 2080;
        id v40 = "SiriX";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  v25,  "ondevice_FirstWordDuration",  "%{public, signpost.description:end_time}llu, %s",  (uint8_t *)&v37,  0x16u);
      }
    }
  }

  else
  {
    unsigned int v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = self->_firstPartialResultTime;
      double v15 = self->_firstWordDuration;
      double v16 = self->_leadingSilenceDuration;
      int v37 = 136316162;
      unsigned __int8 v38 = "-[CSAttSiriAsrNode _markTimeToFirstWordMetric]";
      __int16 v39 = 2048;
      id v40 = (const char *)recordingStartTime;
      __int16 v41 = 2048;
      id v42 = (const char *)v14;
      __int16 v43 = 2048;
      double v44 = v15;
      __int16 v45 = 2048;
      double v46 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Can't calculate TTFW due to missing metric: %llu %llu %f %f",  (uint8_t *)&v37,  0x34u);
    }
  }

- (void)_setupRecognizerStateForMagusAsrNode
{
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (void)setRequiredNodes:(id)a3
{
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (CSAttSiriController)attSiriController
{
  return (CSAttSiriController *)objc_loadWeakRetained((id *)&self->_attSiriController);
}

- (void)setAttSiriController:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return (CSAttSiriEndpointerNode *)objc_loadWeakRetained((id *)&self->_endpointerNode);
}

- (CSAttSiriUresNode)uresNode
{
  return (CSAttSiriUresNode *)objc_loadWeakRetained((id *)&self->_uresNode);
}

- (CSAttSiriSSRNode)ssrNode
{
  return (CSAttSiriSSRNode *)objc_loadWeakRetained((id *)&self->_ssrNode);
}

- (OS_dispatch_queue)localSpeechRecognizerQueue
{
  return self->_localSpeechRecognizerQueue;
}

- (void)setLocalSpeechRecognizerQueue:(id)a3
{
}

- (CoreEmbeddedSpeechRecognizerProvider)interactiveLocalSpeechRecognizer
{
  return self->_interactiveLocalSpeechRecognizer;
}

- (void)setInteractiveLocalSpeechRecognizer:(id)a3
{
}

- (CoreEmbeddedSpeechRecognizerProvider)presetLocalSpeechRecognizer
{
  return self->_presetLocalSpeechRecognizer;
}

- (void)setPresetLocalSpeechRecognizer:(id)a3
{
}

- (NSString)localSpeechRecognizerTaskString
{
  return self->_localSpeechRecognizerTaskString;
}

- (void)setLocalSpeechRecognizerTaskString:(id)a3
{
}

- (unint64_t)localSpeechRecognizerState
{
  return self->_localSpeechRecognizerState;
}

- (void)setLocalSpeechRecognizerState:(unint64_t)a3
{
  self->_unint64_t localSpeechRecognizerState = a3;
}

- (CSAudioProcessWaitingBuffer)audioWaitingBuffer
{
  return self->_audioWaitingBuffer;
}

- (void)setAudioWaitingBuffer:(id)a3
{
}

- (void)setLocalSpeechRecognizerDeliverAudioDuration:(double)a3
{
  self->_localSpeechRecognizerDeliverAudioDuration = a3;
}

- (unsigned)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unsigned int)a3
{
  self->_activeChannel = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (unint64_t)eagerResultId
{
  return self->_eagerResultId;
}

- (void)setEagerResultId:(unint64_t)a3
{
  self->_eagerResultId = a3;
}

- (BOOL)speechHasAcceptedResultCandidate
{
  return self->_speechHasAcceptedResultCandidate;
}

- (void)setSpeechHasAcceptedResultCandidate:(BOOL)a3
{
  self->_speechHasAcceptedResultCandidate = a3;
}

- (LBLocalSpeechRecognitionSettings)speechRecognitionSettings
{
  return self->_speechRecognitionSettings;
}

- (void)setSpeechRecognitionSettings:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setRecordContext:(id)a3
{
}

- (BOOL)shouldProcessAudio
{
  return self->_shouldProcessAudio;
}

- (void)setShouldProcessAudio:(BOOL)a3
{
  self->_shouldProcessAudio = a3;
}

- (int64_t)endpointMode
{
  return self->_endpointMode;
}

- (void)setEndpointMode:(int64_t)a3
{
  self->_endpointMode = a3;
}

- (CSOSTransaction)asrResultDeliveryTransaction
{
  return self->_asrResultDeliveryTransaction;
}

- (void)setAsrResultDeliveryTransaction:(id)a3
{
}

- (CSOSTransaction)recordingTransaction
{
  return self->_recordingTransaction;
}

- (void)setRecordingTransaction:(id)a3
{
}

- (NSString)siriSessionUUID
{
  return self->_siriSessionUUID;
}

- (void)setSiriSessionUUID:(id)a3
{
}

- (NSUUID)recordingToken
{
  return self->_recordingToken;
}

- (void)setRecordingToken:(id)a3
{
}

- (unint64_t)voiceTriggerFireMachTime
{
  return self->_voiceTriggerFireMachTime;
}

- (void)setVoiceTriggerFireMachTime:(unint64_t)a3
{
  self->_unint64_t voiceTriggerFireMachTime = a3;
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (BOOL)isFileLoggingEnabled
{
  return self->_isFileLoggingEnabled;
}

- (void)setIsFileLoggingEnabled:(BOOL)a3
{
  self->_isFileLoggingEnabled = a3;
}

- (double)endpointStartTimeInSec
{
  return self->_endpointStartTimeInSec;
}

- (void)setEndpointStartTimeInSec:(double)a3
{
  self->_double endpointStartTimeInSec = a3;
}

- (unint64_t)audioSampleCountToSkip
{
  return self->_audioSampleCountToSkip;
}

- (void)setAudioSampleCountToSkip:(unint64_t)a3
{
  self->_float audioSampleCountToSkip = a3;
}

- (void)setDidDetectedEndpoint:(BOOL)a3
{
  self->_BOOL didDetectedEndpoint = a3;
}

- (void)setDetectedEndpointTime:(double)a3
{
  self->_detectedEndpointTime = a3;
}

- (void)setShouldStopProcessASROnEndpoint:(BOOL)a3
{
  self->_shouldStopProcessASROnEndpoint = a3;
}

- (double)lastEndpointHintDuration
{
  return self->_lastEndpointHintDuration;
}

- (void)setLastEndpointHintDuration:(double)a3
{
  self->_lastEndpointHintDuration = a3;
}

- (int64_t)lastEndpointHintRCId
{
  return self->_lastEndpointHintRCId;
}

- (void)setLastEndpointHintRCId:(int64_t)a3
{
  self->_int64_t lastEndpointHintRCId = a3;
}

- (unint64_t)lastEndpointEagerResultTime
{
  return self->_lastEndpointEagerResultTime;
}

- (void)setLastEndpointEagerResultTime:(unint64_t)a3
{
  self->_lastEndpointEagerResultTime = a3;
}

- (NSArray)lastEndpointHintFeatures
{
  return self->_lastEndpointHintFeatures;
}

- (void)setLastEndpointHintFeatures:(id)a3
{
}

- (BOOL)disableEndpointer
{
  return self->_disableEndpointer;
}

- (void)setDisableEndpointer:(BOOL)a3
{
  self->_disableEndpointer = a3;
}

- (CSEndpointDelayReporter)endpointDelayReporter
{
  return self->_endpointDelayReporter;
}

- (void)setEndpointDelayReporter:(id)a3
{
}

- (unint64_t)recordingStartTime
{
  return self->_recordingStartTime;
}

- (void)setRecordingStartTime:(unint64_t)a3
{
  self->_unint64_t recordingStartTime = a3;
}

- (unint64_t)firstPartialResultTime
{
  return self->_firstPartialResultTime;
}

- (void)setFirstPartialResultTime:(unint64_t)a3
{
  self->_unint64_t firstPartialResultTime = a3;
}

- (double)firstWordDuration
{
  return self->_firstWordDuration;
}

- (void)setFirstWordDuration:(double)a3
{
  self->_double firstWordDuration = a3;
}

- (double)leadingSilenceDuration
{
  return self->_leadingSilenceDuration;
}

- (void)setLeadingSilenceDuration:(double)a3
{
  self->_double leadingSilenceDuration = a3;
}

- (CSUncompressedAudioLogging)audioLogging
{
  return self->_audioLogging;
}

- (void)setAudioLogging:(id)a3
{
}

- (BOOL)onDeviceDictationSampled
{
  return self->_onDeviceDictationSampled;
}

- (void)setOnDeviceDictationSampled:(BOOL)a3
{
  self->_onDeviceDictationSampled = a3;
}

- (BOOL)onDeviceAssistantSampled
{
  return self->_onDeviceAssistantSampled;
}

- (void)setOnDeviceAssistantSampled:(BOOL)a3
{
  self->_onDeviceAssistantSampled = a3;
}

- (CSSpeechRecognitionSelfHelper)asrSelfHelper
{
  return self->_asrSelfHelper;
}

- (void)setAsrSelfHelper:(id)a3
{
}

- (CSConnectionListener)localSRBridgeListener
{
  return self->_localSRBridgeListener;
}

- (void)setLocalSRBridgeListener:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (int64_t)endpointModeFromEndpointMetrics:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 endpointerType];
  if (v3 > 4) {
    return 0LL;
  }
  else {
    return qword_10018B248[v3];
  }
}

@end