@interface CSAttSiriSpeechRecognitionNode
+ (int64_t)endpointModeFromEndpointMetrics:(id)a3;
- (BOOL)_shouldDisableLocalSpeechRecognizerWithOption:(id)a3 audioRecordContext:(id)a4;
- (BOOL)_shouldTriggerEagerResultForInterval:(double)a3;
- (BOOL)didDetectedEndpoint;
- (BOOL)disableEndpointer;
- (BOOL)isReady;
- (BOOL)onDeviceAssistantSampled;
- (BOOL)onDeviceDictationSampled;
- (BOOL)shouldProcessAudio;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSpeechRecognitionNode)init;
- (CSAttSiriSpeechRecognitionNode)initWithAttSiriController:(id)a3;
- (CSAttSiriSpeechRecognitionNode)initWithLocalSpeechRecognizer:(id)a3 fileLoggingDecisionBuilder:(id)a4;
- (CSAudioProcessWaitingBuffer)audioWaitingBuffer;
- (CSAudioRecordContext)recordContext;
- (CSEndpointDelayReporter)endpointDelayReporter;
- (CSOSTransaction)asrResultDeliveryTransaction;
- (CSOSTransaction)recordingTransaction;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSpeechRecognitionSelfHelper)asrSelfHelper;
- (CSUncompressedAudioLogging)audioLogging;
- (CoreEmbeddedSpeechRecognizerProvider)interactiveLocalSpeechRecognizer;
- (CoreEmbeddedSpeechRecognizerProvider)presetLocalSpeechRecognizer;
- (LBLocalSpeechRecognitionSettings)speechRecognitionSettings;
- (NSArray)requiredNodes;
- (NSHashTable)endpointFeatureReceivers;
- (NSHashTable)recognitionTaskCompletionReceivers;
- (NSHashTable)resultCandidateReceivers;
- (NSHashTable)speechRecognitionReceivers;
- (NSMutableArray)detectedEndpointTimes;
- (NSString)language;
- (NSString)localSpeechRecognizerTaskString;
- (NSString)mhId;
- (NSString)requestId;
- (NSString)siriSessionUUID;
- (NSUUID)recordingToken;
- (OS_dispatch_queue)localSpeechRecognizerQueue;
- (double)endpointStartTimeInSec;
- (double)localSpeechRecognizerDeliverAudioDuration;
- (double)timeToSpeakFirstWord;
- (id)_fetchInputOriginWithRecordContext:(id)a3;
- (id)_fetchRecognizerLanguageWithSiriLanguage:(id)a3 UILanguage:(id)a4 taskString:(id)a5 asrLocale:(id)a6;
- (id)_getAsrInputoriginFromContext:(id)a3;
- (id)_interactiveLocalSpeechRecognizer;
- (id)_sourceStringFromPreheatSource:(unint64_t)a3;
- (id)_stateToString:(unint64_t)a3;
- (id)fileLoggingDecisionBuilder;
- (int64_t)endpointMode;
- (unint64_t)audioSampleCountToSkip;
- (unint64_t)eagerResultId;
- (unint64_t)fetchCurrentState;
- (unint64_t)firstPartialResultTime;
- (unint64_t)lastEndpointEagerResultTime;
- (unint64_t)localSpeechRecognizerState;
- (unint64_t)recordingStartTime;
- (unint64_t)speechRecognitionMode;
- (unint64_t)type;
- (unint64_t)voiceTriggerFireMachTime;
- (unsigned)activeChannel;
- (void)_adjustEndpointStartTimeWithVoiceTriggerEvent:(id)a3;
- (void)_clearAudioProcessWaitingBufferIfNeeded;
- (void)_disableLocalSpeechRecognitionForRequestId:(id)a3 force:(BOOL)a4;
- (void)_handleDidRecognizedFinalSpeechPackage:(id)a3 multiUserSpeechPackage:(id)a4 requestId:(id)a5 metadata:(id)a6;
- (void)_handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:(id)a3 multiUserSpeechPackage:(id)a4 requestId:(id)a5 rcId:(unint64_t)a6 metadata:(id)a7;
- (void)_handleStopDeliverLocalSpeechRecognitionWithRequestId:(id)a3 reason:(unint64_t)a4;
- (void)_handleStopSpeechRecognitionTaskIfNeeded:(BOOL)a3;
- (void)_invalidateLocalSpeechRecognizer;
- (void)_markTimeToFirstWordMetric;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4;
- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5;
- (void)_processAudioChunk:(id)a3 withReadyTimestamp:(id)a4;
- (void)_releaseRecordingTransactionIfNeededWithToken:(id)a3;
- (void)_resetLocalSpeechRecognizerParameters;
- (void)_scheduleRecordingTransactionReleaseTimer;
- (void)_setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)_setRecordingStartTimeWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)_setUpAudioLogging;
- (void)_startDeliverLocalSpeechRecognitionResultsWithRequestId:(id)a3;
- (void)_startLocalSpeechRecognizerIfNeeded;
- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3;
- (void)_stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)addEndpointFeatureReceiver:(id)a3;
- (void)addRecognitionTaskCompletionReceiver:(id)a3;
- (void)addResultCandidateReceiver:(id)a3;
- (void)addSpeechRecognitionReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7;
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
- (void)preheatWithLanguage:(id)a3 source:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5;
- (void)prepareToStartSpeechRequestWithStartStreamOption:(id)a3 audioRecordContext:(id)a4 voiceTriggerInfo:(id)a5;
- (void)registerEndpointerNode:(id)a3;
- (void)registerSSRNode:(id)a3;
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
- (void)setDetectedEndpointTimes:(id)a3;
- (void)setDidDetectedEndpoint:(BOOL)a3;
- (void)setDisableEndpointer:(BOOL)a3;
- (void)setEagerResultId:(unint64_t)a3;
- (void)setEndpointDelayReporter:(id)a3;
- (void)setEndpointFeatureReceivers:(id)a3;
- (void)setEndpointMode:(int64_t)a3;
- (void)setEndpointStartTimeInSec:(double)a3;
- (void)setFileLoggingDecisionBuilder:(id)a3;
- (void)setFirstPartialResultTime:(unint64_t)a3;
- (void)setInteractiveLocalSpeechRecognizer:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLastEndpointEagerResultTime:(unint64_t)a3;
- (void)setLocalSpeechRecognizerDeliverAudioDuration:(double)a3;
- (void)setLocalSpeechRecognizerQueue:(id)a3;
- (void)setLocalSpeechRecognizerState:(unint64_t)a3;
- (void)setLocalSpeechRecognizerTaskString:(id)a3;
- (void)setMhId:(id)a3;
- (void)setOnDeviceAssistantSampled:(BOOL)a3;
- (void)setOnDeviceDictationSampled:(BOOL)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setPresetLocalSpeechRecognizer:(id)a3;
- (void)setRecognitionTaskCompletionReceivers:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingStartTime:(unint64_t)a3;
- (void)setRecordingToken:(id)a3;
- (void)setRecordingTransaction:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setResultCandidateReceivers:(id)a3;
- (void)setShouldProcessAudio:(BOOL)a3;
- (void)setSiriSessionUUID:(id)a3;
- (void)setSpeechRecognitionMode:(unint64_t)a3;
- (void)setSpeechRecognitionReceivers:(id)a3;
- (void)setSpeechRecognitionSettings:(id)a3;
- (void)setTimeToSpeakFirstWord:(double)a3;
- (void)setVoiceTriggerFireMachTime:(unint64_t)a3;
- (void)start;
- (void)startSpeechRecognitionResultsWithSettings:(id)a3;
- (void)stop;
- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4;
- (void)stopWithReason:(unint64_t)a3 stopStreamOption:(id)a4;
- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11;
@end

@implementation CSAttSiriSpeechRecognitionNode

- (CSAttSiriSpeechRecognitionNode)init
{
  return -[CSAttSiriSpeechRecognitionNode initWithLocalSpeechRecognizer:fileLoggingDecisionBuilder:]( self,  "initWithLocalSpeechRecognizer:fileLoggingDecisionBuilder:",  0LL,  &stru_10022B758);
}

- (CSAttSiriSpeechRecognitionNode)initWithLocalSpeechRecognizer:(id)a3 fileLoggingDecisionBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CSAttSiriSpeechRecognitionNode;
  v9 = -[CSAttSiriSpeechRecognitionNode init](&v28, "init");
  v10 = v9;
  if (v9)
  {
    requiredNodes = v9->_requiredNodes;
    v9->_type = 2LL;
    v9->_requiredNodes = (NSArray *)&off_100239200;

    v10->_isReady = 0;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  @"localSpeechRecognizerQueue Queue",  kCSDefaultSerialQueueFixedPriority));
    localSpeechRecognizerQueue = v10->_localSpeechRecognizerQueue;
    v10->_localSpeechRecognizerQueue = (OS_dispatch_queue *)v12;

    v10->_activeChannel = 0;
    requestId = v10->_requestId;
    v10->_requestId = 0LL;

    v10->_eagerResultId = 0LL;
    v10->_disableEndpointer = 0;
    v10->_endpointStartTimeInSec = 0.0;
    v10->_audioSampleCountToSkip = 0LL;
    -[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:](v10, "_setLocalSpeechRecognizerState:", 0LL);
    v10->_shouldProcessAudio = 0;
    objc_storeStrong((id *)&v10->_presetLocalSpeechRecognizer, a3);
    v10->_endpointMode = 0LL;
    id v15 = objc_retainBlock(v8);
    id fileLoggingDecisionBuilder = v10->_fileLoggingDecisionBuilder;
    v10->_id fileLoggingDecisionBuilder = v15;

    v10->_voiceTriggerFireMachTime = 0LL;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    speechRecognitionReceivers = v10->_speechRecognitionReceivers;
    v10->_speechRecognitionReceivers = (NSHashTable *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    resultCandidateReceivers = v10->_resultCandidateReceivers;
    v10->_resultCandidateReceivers = (NSHashTable *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    endpointFeatureReceivers = v10->_endpointFeatureReceivers;
    v10->_endpointFeatureReceivers = (NSHashTable *)v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    recognitionTaskCompletionReceivers = v10->_recognitionTaskCompletionReceivers;
    v10->_recognitionTaskCompletionReceivers = (NSHashTable *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    detectedEndpointTimes = v10->_detectedEndpointTimes;
    v10->_detectedEndpointTimes = (NSMutableArray *)v25;
  }

  return v10;
}

- (CSAttSiriSpeechRecognitionNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  v5 = -[CSAttSiriSpeechRecognitionNode init](self, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (void)stop
{
}

- (void)stopWithReason:(unint64_t)a3 stopStreamOption:(id)a4
{
  id v6 = a4;
  id v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    *(_DWORD *)buf = 136315650;
    v16 = "-[CSAttSiriSpeechRecognitionNode stopWithReason:stopStreamOption:]";
    __int16 v17 = 2050;
    unint64_t v18 = a3;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Reason : %{public}lu, option : %{public}@",  buf,  0x20u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000763B8;
  block[3] = &unk_10022E7F8;
  id v13 = v6;
  unint64_t v14 = a3;
  block[4] = self;
  id v11 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)addResultCandidateReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode localSpeechRecognizerQueue]( self,  "localSpeechRecognizerQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000763AC;
    v6[3] = &unk_10022EFD0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)addEndpointFeatureReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode localSpeechRecognizerQueue]( self,  "localSpeechRecognizerQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000763A0;
    v6[3] = &unk_10022EFD0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)addSpeechRecognitionReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode localSpeechRecognizerQueue]( self,  "localSpeechRecognizerQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100076394;
    v6[3] = &unk_10022EFD0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)addRecognitionTaskCompletionReceiver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode localSpeechRecognizerQueue]( self,  "localSpeechRecognizerQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100076388;
    v6[3] = &unk_10022EFD0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)registerEndpointerNode:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007637C;
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
  v7[2] = sub_100076370;
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
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kVTEItriggerEndSampleCount]);

      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);
        uint64_t v12 = [v11 unsignedIntegerValue];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
        unint64_t v14 = v12 - (_BYTE *)[v13 unsignedIntegerValue];

        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        double v16 = (float)((float)v14 / v15);
        self->_double endpointStartTimeInSec = v16;
        __int16 v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 136315394;
          v35 = "-[CSAttSiriSpeechRecognitionNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
          __int16 v36 = 2050;
          double v37 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Updated endpoint start time in sec : %{public}.3f",  (uint8_t *)&v34,  0x16u);
        }
      }
    }

    uint64_t v18 = kVTEIextraSamplesAtStart;
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kVTEIextraSamplesAtStart]);

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
        v35 = "-[CSAttSiriSpeechRecognitionNode _adjustEndpointStartTimeWithVoiceTriggerEvent:]";
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
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEItriggerEndMachTime]),
        v11,
        v11))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
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

- (void)_handleStopDeliverLocalSpeechRecognitionWithRequestId:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  if (self->_speechRecognitionMode != 1)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode speechRecognitionReceivers](self, "speechRecognitionReceivers", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v12, "didReceiveStopRecognitionRequest:stopReason:") & 1) != 0) {
            [v12 didReceiveStopRecognitionRequest:v6 stopReason:a4];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }
  }

  -[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 0LL);
  speechRecognitionSettings = self->_speechRecognitionSettings;
  self->_speechRecognitionSettings = 0LL;

  requestId = self->_requestId;
  self->_requestId = 0LL;
}

- (void)startSpeechRecognitionResultsWithSettings:(id)a3
{
  id v4 = a3;
  id v5 = [v4 speechRecognitionMode];
  -[CSAttSiriSpeechRecognitionNode setSpeechRecognitionMode:](self, "setSpeechRecognitionMode:", v5);
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075F1C;
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
    __int128 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2048;
    unint64_t v19 = localSpeechRecognizerState;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s _localSpeechRecognizerState:%lu",  (uint8_t *)&v16,  0x16u);
    id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestId = self->_requestId;
    int v16 = 136315394;
    __int128 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
    __int16 v18 = 2112;
    unint64_t v19 = (unint64_t)requestId;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Start deliver asr results with requestId: %@",  (uint8_t *)&v16,  0x16u);
  }

  unint64_t v8 = self->_localSpeechRecognizerState;
  if (v8 != 3)
  {
    -[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 2LL);
    if (v8 == 4)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioProcessWaitingBuffer uuid](self->_audioWaitingBuffer, "uuid"));
      unsigned int v10 = [v9 isEqualToString:self->_requestId];

      if (v10)
      {
        id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          __int128 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Handle late start request from Request Dispatcher",  (uint8_t *)&v16,  0xCu);
        }

        -[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]( self,  "_startLocalSpeechRecognizerIfNeeded");
        -[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]( self,  "_handleStopSpeechRecognitionTaskIfNeeded:",  1LL);
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
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioProcessWaitingBuffer uuid](audioWaitingBuffer, "uuid"));
            int v16 = 136315650;
            __int128 v17 = "-[CSAttSiriSpeechRecognitionNode _startDeliverLocalSpeechRecognitionResultsWithRequestId:]";
            __int16 v18 = 2112;
            unint64_t v19 = (unint64_t)v4;
            __int16 v20 = 2114;
            uint64_t v21 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Clear audio waiting buffer since current requestId(%@) doesn't match expected one (%{public}@)",  (uint8_t *)&v16,  0x20u);
          }

          -[CSAttSiriSpeechRecognitionNode _clearAudioProcessWaitingBufferIfNeeded]( self,  "_clearAudioProcessWaitingBufferIfNeeded");
        }
      }
    }

    else if (v8 == 1)
    {
      -[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded](self, "_startLocalSpeechRecognizerIfNeeded");
    }
  }
}

- (void)stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[CSAttSiriSpeechRecognitionNode stopSpeechRecognitionWithReason:requestId:]";
    __int16 v15 = 2050;
    unint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s Reason : %{public}lu, requestId : %@",  buf,  0x20u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075F0C;
  block[3] = &unk_10022E7F8;
  id v11 = v6;
  unint64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)_stopSpeechRecognitionWithReason:(unint64_t)a3 requestId:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!v6 || ([v6 isEqualToString:self->_requestId] & 1) == 0)
  {
    if (self->_requestId)
    {
      unint64_t v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315138;
        id v14 = "-[CSAttSiriSpeechRecognitionNode _stopSpeechRecognitionWithReason:requestId:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Received unexpected requestId",  (uint8_t *)&v13,  0xCu);
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
      [v9 submitASRIssueReport:kCSDiagnosticReporterReceivedInvalidRequestId];
    }

    if (!v7) {
      goto LABEL_9;
    }
  }

  if (![v7 isEqualToString:self->_requestId])
  {
    id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      requestId = self->_requestId;
      int v13 = 136315394;
      id v14 = "-[CSAttSiriSpeechRecognitionNode _stopSpeechRecognitionWithReason:requestId:]";
      __int16 v15 = 2112;
      unint64_t v16 = requestId;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s requestId doesn't match current one (%@), ignore",  (uint8_t *)&v13,  0x16u);
    }
  }

  else
  {
LABEL_9:
    -[CSAttSiriSpeechRecognitionNode _handleStopDeliverLocalSpeechRecognitionWithRequestId:reason:]( self,  "_handleStopDeliverLocalSpeechRecognitionWithRequestId:reason:",  self->_requestId,  a3);
    asrResultDeliveryTransaction = self->_asrResultDeliveryTransaction;
    self->_asrResultDeliveryTransaction = 0LL;

    if (a3 == 1)
    {
      -[CSAttSiriSpeechRecognitionNode _invalidateLocalSpeechRecognizer](self, "_invalidateLocalSpeechRecognizer");
      -[CSUncompressedAudioLogging endAudioWithCancellation:completion:]( self->_audioLogging,  "endAudioWithCancellation:completion:",  1LL,  0LL);
    }
  }
}

- (void)disableLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100075EFC;
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
    id v11 = "-[CSAttSiriSpeechRecognitionNode _disableLocalSpeechRecognitionForRequestId:force:]";
    __int16 v12 = 2112;
    int v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s requestId : %@, force : %d",  (uint8_t *)&v10,  0x1Cu);
  }

  if (!v6 || -[NSString isEqualToString:](v6, "isEqualToString:", self->_siriSessionUUID) || v4)
  {
    -[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 3LL);
    -[CSAttSiriSpeechRecognitionNode _clearAudioProcessWaitingBufferIfNeeded]( self,  "_clearAudioProcessWaitingBufferIfNeeded");
  }

  else
  {
    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      siriSessionUUID = self->_siriSessionUUID;
      int v10 = 136315394;
      id v11 = "-[CSAttSiriSpeechRecognitionNode _disableLocalSpeechRecognitionForRequestId:force:]";
      __int16 v12 = 2112;
      int v13 = siriSessionUUID;
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
    id v9 = "-[CSAttSiriSpeechRecognitionNode pauseLocalSpeechRecognitionForRequestId:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075ECC;
  block[3] = &unk_10022F100;
  block[4] = self;
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
    double v24 = "-[CSAttSiriSpeechRecognitionNode resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:]";
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100075E88;
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
    v46 = "-[CSAttSiriSpeechRecognitionNode updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:di"
          "sambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]";
    __int16 v47 = 2112;
    id v48 = v35;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s requestId : %@", buf, 0x16u);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075E38;
  block[3] = &unk_10022C6C0;
  block[4] = self;
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
  block[2] = sub_100075D98;
  block[3] = &unk_10022EA98;
  id v12 = v6;
  id v13 = v7;
  __int16 v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)attSiriAudioSrcNodeDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100075D48;
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
  v8[2] = sub_100075BD4;
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
  block[2] = sub_100075B20;
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
  block[2] = sub_100075AA0;
  block[3] = &unk_10022ECA8;
  void block[4] = self;
  id v12 = v8;
  BOOL v13 = a6;
  id v10 = v8;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  id v11 = a3;
  id v12 = a6;
  BOOL v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[CSAttSiriSpeechRecognitionNode attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSignal:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075918;
  block[3] = &unk_10022CAA0;
  void block[4] = self;
  void block[5] = a5;
  *(double *)&block[6] = a4;
  dispatch_async(localSpeechRecognizerQueue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
  unsigned int v16 = [WeakRetained getUsesAutomaticEndpointing];

  if (v16) {
    self->_endpointMode = 4LL;
  }
}

- (void)start
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSAttSiriSpeechRecognitionNode start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000756E8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)preheatWithLanguage:(id)a3 source:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5
{
  id v8 = a3;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000756D4;
  v11[3] = &unk_10022BFA0;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(localSpeechRecognizerQueue, v11);
}

- (void)_preheatWithLanguage:(id)a3 preheatSource:(unint64_t)a4 shouldDownloadMissingAsset:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]( self,  "_interactiveLocalSpeechRecognizer"));
    [v8 startMissingAssetDownload];
  }

  -[CSAttSiriSpeechRecognitionNode _preheatWithLanguage:preheatSource:]( self,  "_preheatWithLanguage:preheatSource:",  v9,  a4);
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
    id v11 = self->_language;
    int v15 = 136315394;
    unsigned int v16 = "-[CSAttSiriSpeechRecognitionNode _preheatWithLanguage:preheatSource:]";
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Preheat local speech recognizer with language : %@",  (uint8_t *)&v15,  0x16u);
  }

  id v12 = [[SFEntitledAssetConfig alloc] initWithLanguage:self->_language assetType:3];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _sourceStringFromPreheatSource:]( self,  "_sourceStringFromPreheatSource:",  a4));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]( self,  "_interactiveLocalSpeechRecognizer"));
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
  v15[2] = sub_100075454;
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

- (void)_stopPreviousRecognitionTaskIfNeededWithNewRequestId:(id)a3
{
  id v4 = a3;
  requestId = self->_requestId;
  if (requestId && !-[NSString isEqualToString:](requestId, "isEqualToString:", v4))
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = self->_requestId;
      int v8 = 136315650;
      id v9 = "-[CSAttSiriSpeechRecognitionNode _stopPreviousRecognitionTaskIfNeededWithNewRequestId:]";
      __int16 v10 = 2112;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s cached requestId : %@, newRequestId : %@",  (uint8_t *)&v8,  0x20u);
    }

    -[CSAttSiriSpeechRecognitionNode _handleStopDeliverLocalSpeechRecognitionWithRequestId:reason:]( self,  "_handleStopDeliverLocalSpeechRecognitionWithRequestId:reason:",  self->_requestId,  3LL);
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

    int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      __int16 v10 = "-[CSAttSiriSpeechRecognitionNode _shouldDisableLocalSpeechRecognizerWithOption:audioRecordContext:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Disable local SR for dictation",  (uint8_t *)&v9,  0xCu);
    }
  }

  BOOL v6 = 1;
LABEL_6:

  return v6;
}

- (void)setMhId:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[CSAttSiriSpeechRecognitionNode setMhId:]";
    __int16 v9 = 2112;
    __int16 v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s mhID : %@", (uint8_t *)&v7, 0x16u);
  }

  mhId = self->_mhId;
  self->_mhId = v4;
}

- (void)_setUpAudioLogging
{
  id fileLoggingDecisionBuilder = (uint64_t (**)(id, SEL))self->_fileLoggingDecisionBuilder;
  if (fileLoggingDecisionBuilder) {
    int v4 = fileLoggingDecisionBuilder[2](fileLoggingDecisionBuilder, a2);
  }
  else {
    int v4 = 0;
  }
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    id v19 = "-[CSAttSiriSpeechRecognitionNode _setUpAudioLogging]";
    __int16 v20 = 1024;
    LODWORD(v21) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s fileLogging enabled:%u", (uint8_t *)&v18, 0x12u);
  }

  if (v4)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v7 = [v6 isSpeechStudyLoggingEnabled];

    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mhLogDirectory]);
    if (v7) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[CSUtils loggingFilePathWithDirectory:requestId:token:postfix:]( &OBJC_CLASS___CSUtils,  "loggingFilePathWithDirectory:requestId:token:postfix:",  v9,  self->_requestId,  @"asr",  @"wav"));
    }
    else {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[CSUtils loggingFilePathWithDirectory:token:postfix:]( &OBJC_CLASS___CSUtils,  "loggingFilePathWithDirectory:token:postfix:",  v9,  @"localASR",  @"wav"));
    }
    id v11 = (CSPlainAudioFileWriter *)v10;

    __int16 v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      int v18 = 136315650;
      id v19 = "-[CSAttSiriSpeechRecognitionNode _setUpAudioLogging]";
      __int16 v20 = 2112;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = mhId;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s asrAudioLoggingPath:%@, mhID:%@",  (uint8_t *)&v18,  0x20u);
    }

    id v14 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
    id v16 = -[CSPlainAudioFileWriter initWithURL:](v14, "initWithURL:", v15);
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v16;
  }

  else
  {
    id v11 = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;
  }
}

- (void)_startLocalSpeechRecognizerIfNeeded
{
  v3 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localSpeechRecognizerState = self->_localSpeechRecognizerState;
    id v5 = v3;
    double v6 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode _stateToString:](self, "_stateToString:", localSpeechRecognizerState)));
    *(_DWORD *)buf = 136315394;
    v153 = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
    __int16 v154 = 2114;
    double v155 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s current state = %{public}@", buf, 0x16u);
  }

  if (self->_localSpeechRecognizerState == 2)
  {
    unsigned int v7 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
    language = self->_language;
    self->_language = v7;

    self->_didDetectedEndpoint = 0;
    self->_localSpeechRecognizerDeliverAudioDuration = 0.0;
    self->_lastEndpointEagerResultTime = 0LL;
    __int16 v9 = -[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:]( objc_alloc(&OBJC_CLASS___CSEndpointDelayReporter),  "initWithRequestMHUUID:turnIdentifier:",  0LL,  0LL);
    endpointDelayReporter = self->_endpointDelayReporter;
    self->_endpointDelayReporter = v9;

    -[NSMutableArray removeAllObjects](self->_detectedEndpointTimes, "removeAllObjects");
    if (!self->_disableEndpointer)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[LBLocalSpeechRecognitionSettings getTaskStringFromSpeechRecognitionSettings:]( &OBJC_CLASS___LBLocalSpeechRecognitionSettings,  "getTaskStringFromSpeechRecognitionSettings:",  self->_speechRecognitionSettings));
      [WeakRetained processTaskString:v12];
    }

    __int128 v149 = 0u;
    __int128 v150 = 0u;
    __int128 v147 = 0u;
    __int128 v148 = 0u;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode speechRecognitionReceivers](self, "speechRecognitionReceivers"));
    id v14 = [v13 countByEnumeratingWithState:&v147 objects:v168 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v148;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v148 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = *(void **)(*((void *)&v147 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector(v18, "didReceiveStartRecognitionRequest:taskName:sharedUserInfo:") & 1) != 0)
          {
            requestId = self->_requestId;
            localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
            id v21 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings sharedUserInfos]( self->_speechRecognitionSettings,  "sharedUserInfos"));
            [v18 didReceiveStartRecognitionRequest:requestId taskName:localSpeechRecognizerTaskString sharedUserInfo:v21];
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v147 objects:v168 count:16];
      }

      while (v15);
    }

    id v22 = objc_loadWeakRetained((id *)&self->_ssrNode);
    id v23 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings sharedUserInfos]( self->_speechRecognitionSettings,  "sharedUserInfos"));
    [v22 cacheSharedUserInfos:v23];

    id v24 = self->_language;
    if (*(double *)&v24 != 0.0 && self->_localSpeechRecognizerTaskString)
    {
      unsigned __int8 v127 = -[CSAudioRecordContext isVoiceTriggered](self->_recordContext, "isVoiceTriggered");
      v136 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings dictationUIInteractionId]( self->_speechRecognitionSettings,  "dictationUIInteractionId"));
      unsigned __int8 v131 = -[LBLocalSpeechRecognitionSettings shouldStoreAudioOnDevice]( self->_speechRecognitionSettings,  "shouldStoreAudioOnDevice");
      uint64_t v25 = objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings overrideModelPath]( self->_speechRecognitionSettings,  "overrideModelPath"));
      int v129 = CSShouldCensorSpeech();
      v134 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _fetchInputOriginWithRecordContext:]( self,  "_fetchInputOriginWithRecordContext:",  self->_recordContext));
      unsigned __int8 v126 = -[LBLocalSpeechRecognitionSettings deliverEagerPackage]( self->_speechRecognitionSettings,  "deliverEagerPackage");
      id v26 = self->_language;
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings UILanguage](self->_speechRecognitionSettings, "UILanguage"));
      id v28 = self->_localSpeechRecognizerTaskString;
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings asrLocale](self->_speechRecognitionSettings, "asrLocale"));
      v133 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:]( self,  "_fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:",  v26,  v27,  v28,  v29));

      -[CSAttSiriSpeechRecognitionNode _setUpAudioLogging](self, "_setUpAudioLogging");
      if (v25) {
        v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v25,  1LL));
      }
      else {
        v132 = 0LL;
      }
      double v31 = 0.0;
      double endpointStartTimeInSec = 0.0;
      if (-[CSAudioRecordContext isVoiceTriggered](self->_recordContext, "isVoiceTriggered"))
      {
        double endpointStartTimeInSec = self->_endpointStartTimeInSec;
        float audioSampleCountToSkip = (float)self->_audioSampleCountToSkip;
        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        double v31 = (float)(audioSampleCountToSkip / v34);
      }

      -[CSAttSiriSpeechRecognitionNode _resetLocalSpeechRecognizerParameters]( self,  "_resetLocalSpeechRecognizerParameters");
      v130 = (void *)v25;
      if (v136) {
        v135 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings applicationName]( self->_speechRecognitionSettings,  "applicationName"));
      }
      else {
        v135 = @"com.apple.siri.assistant";
      }
      id v35 = objc_alloc(&OBJC_CLASS___CESRSpeechParameters);
      v125 = self->_requestId;
      id v123 = v35;
      v124 = self->_localSpeechRecognizerTaskString;
      v122 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings recognitionOverrides]( self->_speechRecognitionSettings,  "recognitionOverrides"));
      unsigned __int8 v121 = -[LBLocalSpeechRecognitionSettings detectUtterances]( self->_speechRecognitionSettings,  "detectUtterances");
      unsigned __int8 v120 = -[LBLocalSpeechRecognitionSettings secureOfflineOnly]( self->_speechRecognitionSettings,  "secureOfflineOnly");
      unsigned __int8 v119 = -[LBLocalSpeechRecognitionSettings continuousListening]( self->_speechRecognitionSettings,  "continuousListening");
      unsigned __int8 v118 = -[LBLocalSpeechRecognitionSettings shouldHandleCapitalization]( self->_speechRecognitionSettings,  "shouldHandleCapitalization");
      -[LBLocalSpeechRecognitionSettings maximumRecognitionDuration]( self->_speechRecognitionSettings,  "maximumRecognitionDuration");
      double v37 = v36;
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings location](self->_speechRecognitionSettings, "location"));
      v117 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings jitGrammar](self->_speechRecognitionSettings, "jitGrammar"));
      HIDWORD(v116) = self->_disableEndpointer;
      unsigned __int8 v39 = -[LBLocalSpeechRecognitionSettings enableEmojiRecognition]( self->_speechRecognitionSettings,  "enableEmojiRecognition");
      unsigned __int8 v40 = -[LBLocalSpeechRecognitionSettings enableAutoPunctuation]( self->_speechRecognitionSettings,  "enableAutoPunctuation");
      unsigned __int8 v41 = -[LBLocalSpeechRecognitionSettings enableVoiceCommands]( self->_speechRecognitionSettings,  "enableVoiceCommands");
      id v42 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings sharedUserInfos]( self->_speechRecognitionSettings,  "sharedUserInfos"));
      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings prefixText](self->_speechRecognitionSettings, "prefixText"));
      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings postfixText](self->_speechRecognitionSettings, "postfixText"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings selectedText](self->_speechRecognitionSettings, "selectedText"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings powerContext](self->_speechRecognitionSettings, "powerContext"));
      LOBYTE(v116) = -[LBLocalSpeechRecognitionSettings shouldGenerateVoiceCommandCandidates]( self->_speechRecognitionSettings,  "shouldGenerateVoiceCommandCandidates");
      BYTE4(v115) = v41;
      BYTE3(v115) = v40;
      BYTE2(v115) = v39;
      BYTE1(v115) = BYTE4(v116);
      LOBYTE(v115) = v126;
      LOBYTE(v114) = 0;
      HIBYTE(v113) = v118;
      BYTE6(v113) = v119;
      BYTE5(v113) = v131;
      BYTE4(v113) = v120;
      BYTE3(v113) = v127;
      BYTE2(v113) = v129;
      BYTE1(v113) = v121;
      LOBYTE(v113) = 0;
      id v128 = objc_msgSend( v123,  "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:p rofile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:far Field:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechA PIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:di sableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInf os:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:",  v133,  v125,  v136,  v124,  0,  v135,  v37,  endpointStartTimeInSec,  v31,  0,  v122,  v132,  0,  0,  v113,  v114,  v134,  v38,  v117,  v115,  v42,  v43,  v44,  v45,  v46,  v116);

      __int16 v47 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = self->_localSpeechRecognizerTaskString;
        speechRecognitionSettings = self->_speechRecognitionSettings;
        v50 = v47;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings location](speechRecognitionSettings, "location"));
        if (v129) {
          v52 = @"YES";
        }
        else {
          v52 = @"NO";
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[LBLocalSpeechRecognitionSettings jitGrammar](self->_speechRecognitionSettings, "jitGrammar"));
        unsigned int v54 = -[LBLocalSpeechRecognitionSettings enableVoiceCommands]( self->_speechRecognitionSettings,  "enableVoiceCommands");
        *(_DWORD *)buf = 136316930;
        v153 = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
        if (v54) {
          v55 = @"YES";
        }
        else {
          v55 = @"NO";
        }
        __int16 v154 = 2114;
        double v155 = *(double *)&v48;
        __int16 v156 = 2050;
        v157 = *(const char **)&endpointStartTimeInSec;
        __int16 v158 = 2114;
        v159 = v134;
        __int16 v160 = 2112;
        v161 = v51;
        __int16 v162 = 2114;
        v163 = v52;
        __int16 v164 = 2112;
        v165 = v53;
        __int16 v166 = 2114;
        v167 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%s Calling local speech recognition with settings : task(%{public}@), endpointStart(%{public}.3f), inputOrigin (%{public}@), location(%@), shouldCensorSpeech(%{public}@), jitGrammar(%@), enableVoiceCommands(%{public}@)",  buf,  0x52u);
      }

      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v57 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v58 = v57;
        double v59 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v56 UUIDString]));
        *(_DWORD *)buf = 136315394;
        v153 = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
        __int16 v154 = 2112;
        double v155 = v59;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s Setting ASR UUID : %@", buf, 0x16u);
      }

      v145[0] = _NSConcreteStackBlock;
      v145[1] = 3221225472LL;
      v145[2] = sub_100075050;
      v145[3] = &unk_10022C710;
      id v60 = v56;
      id v146 = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue([v128 mutatedCopyWithMutator:v145]);
      if (self->_voiceTriggerFireMachTime)
      {
        uint64_t v62 = mach_absolute_time();
        os_signpost_id_t v63 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
        v64 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        v65 = v64;
        if (v63 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v67 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        }

        else
        {
          if (os_signpost_enabled(v64))
          {
            unint64_t voiceTriggerFireMachTime = self->_voiceTriggerFireMachTime;
            *(_DWORD *)buf = 134349570;
            v153 = (const char *)voiceTriggerFireMachTime;
            __int16 v154 = 2080;
            double v155 = COERCE_DOUBLE("SiriX");
            __int16 v156 = 2080;
            v157 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v65,  OS_SIGNPOST_INTERVAL_BEGIN,  v63,  "ondevice_VoiceTriggerEndToASRStartLatency",  "%{public, signpost.description:begin_time}llu, %s %s",  buf,  0x20u);
          }

          v67 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_signpost_enabled(v67))
          {
            *(_DWORD *)buf = 134349570;
            v153 = (const char *)v62;
            __int16 v154 = 2080;
            double v155 = COERCE_DOUBLE("SiriX");
            __int16 v156 = 2080;
            v157 = "enableTelemetry=YES";
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v67,  OS_SIGNPOST_INTERVAL_END,  v63,  "ondevice_VoiceTriggerEndToASRStartLatency",  "%{public, signpost.description:end_time}llu, %s %s",  buf,  0x20u);
          }
        }

        double TimeInterval = CSMachAbsoluteTimeGetTimeInterval(v62 - self->_voiceTriggerFireMachTime);
        v69 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          float v70 = TimeInterval * 1000.0;
          *(_DWORD *)buf = 136315394;
          v153 = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
          __int16 v154 = 2050;
          double v155 = v70;
          _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%s Voice trigger end to ASR Start Latency: %{public}.2f ms",  buf,  0x16u);
        }
      }

      *(_WORD *)&self->_onDeviceDictationSampled = 0;
      self->_unint64_t voiceTriggerFireMachTime = 0LL;
      if (!+[CSUtils isOnDeviceASRAudioLoggingEnabled]( &OBJC_CLASS___CSUtils,  "isOnDeviceASRAudioLoggingEnabled")
        || (v71 = (void *)objc_claimAutoreleasedReturnValue([v61 task]),
            unsigned int v72 = +[CESRUtilities isSamplingSupportedForTask:]( &OBJC_CLASS___CESRUtilities,  "isSamplingSupportedForTask:",  v71),  v71,  !v72))
      {
        v75 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v153 = "-[CSAttSiriSpeechRecognitionNode _startLocalSpeechRecognizerIfNeeded]";
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "%s Request is ineligible for sampling. Disabling audio logging.",  buf,  0xCu);
        }

        audioLogging = self->_audioLogging;
        self->_audioLogging = 0LL;
        goto LABEL_66;
      }

      v73 = (void *)objc_claimAutoreleasedReturnValue([v61 task]);
      if ([v73 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation])
      {
        uint64_t v74 = 1LL;
      }

      else
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue([v61 task]);
        uint64_t v74 = (uint64_t)[v77 isEqualToString:CoreEmbeddedSpeechRecognizerTaskWebSearch];
      }

      p_onDeviceAssistantSampled = &self->_onDeviceAssistantSampled;

      v79 = objc_alloc(&OBJC_CLASS___CSSpeechRecognitionSelfHelper);
      v80 = (void *)objc_claimAutoreleasedReturnValue([v61 task]);
      v81 = -[CSSpeechRecognitionSelfHelper initWithAsrId:taskName:isSamplingForDictation:]( v79,  "initWithAsrId:taskName:isSamplingForDictation:",  v60,  v80,  v74);
      asrSelfHelper = self->_asrSelfHelper;
      self->_asrSelfHelper = v81;

      if ((_DWORD)v74)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue( +[CESRDictationOnDeviceSampling sharedManager]( &OBJC_CLASS___CESRDictationOnDeviceSampling,  "sharedManager"));
        unsigned __int8 v84 = [v83 isRequestSelectedForSamplingFromConfigForLanguage:self->_language];
        p_onDeviceDictationSampled = &self->_onDeviceDictationSampled;
      }

      else
      {
        if ((v131 & 1) == 0)
        {
          BOOL *p_onDeviceAssistantSampled = 0;
          goto LABEL_63;
        }

        v83 = (void *)objc_claimAutoreleasedReturnValue( +[CESRAssistantOnDeviceSampling sharedManager]( &OBJC_CLASS___CESRAssistantOnDeviceSampling,  "sharedManager"));
        unsigned __int8 v84 = [v83 isRequestSelectedForSamplingForTask:self->_localSpeechRecognizerTaskString];
        p_onDeviceDictationSampled = &self->_onDeviceAssistantSampled;
      }

      BOOL *p_onDeviceDictationSampled = v84;

      if (*p_onDeviceAssistantSampled)
      {
        v86 = objc_alloc(&OBJC_CLASS___CSUncompressedAudioLogging);
        v87 = self->_requestId;
        v88 = (CSUncompressedAudioLogging *)objc_claimAutoreleasedReturnValue([v60 UUIDString]);
        v89 = self->_language;
        v90 = (void *)objc_claimAutoreleasedReturnValue([v61 task]);
        v91 = -[CSUncompressedAudioLogging initWithRequestId:asrId:languageCode:task:]( v86,  "initWithRequestId:asrId:languageCode:task:",  v87,  v88,  v89,  v90);
        v92 = self->_audioLogging;
        self->_audioLogging = v91;

LABEL_65:
        v99 = self->_asrSelfHelper;
        v100 = self->_audioLogging;
        v142[0] = _NSConcreteStackBlock;
        v142[1] = 3221225472LL;
        v142[2] = sub_10007505C;
        v142[3] = &unk_10022EFF8;
        v143 = v99;
        v144 = self;
        audioLogging = v99;
        -[CSUncompressedAudioLogging prepareLogging:](v100, "prepareLogging:", v142);

LABEL_66:
        v101 = (__CFString *)v135;

        v102 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]( self,  "_interactiveLocalSpeechRecognizer"));
        v141[0] = _NSConcreteStackBlock;
        v141[1] = 3221225472LL;
        v141[2] = sub_10007507C;
        v141[3] = &unk_10022C738;
        v141[4] = self;
        [v102 startSpeechRecognitionWithParameters:v61 didStartHandlerWithInfo:v141];

        v103 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioProcessWaitingBuffer fetchAudioChunksFromBuffer]( self->_audioWaitingBuffer,  "fetchAudioChunksFromBuffer"));
        v104 = v103;
        if (v103)
        {
          __int128 v139 = 0u;
          __int128 v140 = 0u;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          id v105 = [v103 countByEnumeratingWithState:&v137 objects:v151 count:16];
          if (v105)
          {
            id v106 = v105;
            uint64_t v107 = *(void *)v138;
            do
            {
              for (j = 0LL; j != v106; j = (char *)j + 1)
              {
                if (*(void *)v138 != v107) {
                  objc_enumerationMutation(v104);
                }
                v109 = *(void **)(*((void *)&v137 + 1) + 8LL * (void)j);
                v110 = (void *)objc_claimAutoreleasedReturnValue([v109 audioChunk]);
                v111 = (void *)objc_claimAutoreleasedReturnValue([v109 bufferedTimestamp]);
                -[CSAttSiriSpeechRecognitionNode _processAudioChunk:withReadyTimestamp:]( self,  "_processAudioChunk:withReadyTimestamp:",  v110,  v111);
              }

              id v106 = [v104 countByEnumeratingWithState:&v137 objects:v151 count:16];
            }

            while (v106);
          }

          -[CSAttSiriSpeechRecognitionNode _clearAudioProcessWaitingBufferIfNeeded]( self,  "_clearAudioProcessWaitingBufferIfNeeded");
          v101 = (__CFString *)v135;
        }

        return;
      }

- (BOOL)_shouldTriggerEagerResultForInterval:(double)a3
{
  id v5 = (char *)-[NSMutableArray count](self->_detectedEndpointTimes, "count") + 1;
  while (1)
  {
    double v6 = v5--;
    if (!v5) {
      break;
    }
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_detectedEndpointTimes,  "objectAtIndexedSubscript:",  v6 - 2));
    [v7 doubleValue];
    double v9 = v8;

    if (v9 < a3)
    {
      -[NSMutableArray removeObjectsInRange:](self->_detectedEndpointTimes, "removeObjectsInRange:", 0LL, v5);
      uint64_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        id v13 = "-[CSAttSiriSpeechRecognitionNode _shouldTriggerEagerResultForInterval:]";
        __int16 v14 = 2048;
        double v15 = a3;
        __int16 v16 = 2048;
        id v17 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Triggering eager RC generation at time %f, removing %lu entries",  (uint8_t *)&v12,  0x20u);
      }

      return v6 != (char *)1;
    }
  }

  return v6 != (char *)1;
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
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dataForChannel:self->_activeChannel]);
    audioFileWriter = self->_audioFileWriter;
    id v12 = v10;
    -[CSPlainAudioFileWriter addSamples:numSamples:]( audioFileWriter,  "addSamples:numSamples:",  [v12 bytes],  objc_msgSend(v6, "numSamples"));
    if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:]( &OBJC_CLASS___CSFLPCMTypeConverter,  "convertToShortLPCMBufFromFloatLPCMBuf:",  v12));

      id v12 = (id)v13;
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]( self,  "_interactiveLocalSpeechRecognizer"));
    id v15 = [v6 hostTime];
    id v17 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  CSMachAbsoluteTimeToMachContinuousTime(v15, v16));
    int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v14 addAudioPacket:v12 packetRecordedTime:v18 packetReadyUpstreamTime:v7];

    if (+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled")
      && -[CSAttSiriSpeechRecognitionNode _shouldTriggerEagerResultForInterval:]( self,  "_shouldTriggerEagerResultForInterval:",  self->_localSpeechRecognizerDeliverAudioDuration))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]( self,  "_interactiveLocalSpeechRecognizer"));
      [v19 requestEagerResult];
    }

    -[CSUncompressedAudioLogging appendAudioData:](self->_audioLogging, "appendAudioData:", v12);
    __int16 v20 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      id v21 = v20;
      int v22 = 136315394;
      id v23 = "-[CSAttSiriSpeechRecognitionNode _processAudioChunk:withReadyTimestamp:]";
      __int16 v24 = 2050;
      id v25 = [v6 numSamples];
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Added %{public}lu samples to local speech recognizer",  (uint8_t *)&v22,  0x16u);
    }
  }
}

- (void)_handleStopSpeechRecognitionTaskIfNeeded:(BOOL)a3
{
  if (!self->_shouldProcessAudio && !a3) {
    return;
  }
  self->_shouldProcessAudio = 0;
  -[CSAttSiriSpeechRecognitionNode _scheduleRecordingTransactionReleaseTimer]( self,  "_scheduleRecordingTransactionReleaseTimer",  a3);
  localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
  if (localSpeechRecognizerTaskString)
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v17 = 136315394;
      *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
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
        -[CSAttSiriSpeechRecognitionNode _clearAudioProcessWaitingBufferIfNeeded]( self,  "_clearAudioProcessWaitingBufferIfNeeded");
        return;
      }

      uint64_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v17 = 136315138;
        *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
        id v11 = "%s Complete task now since local SR is disabled";
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
        *(_DWORD *)id v17 = 136315650;
        *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
        *(_WORD *)&v17[12] = 2114;
        *(void *)&v17[14] = v9;
        *(_WORD *)&v17[22] = 2050;
        int v18 = interactiveLocalSpeechRecognizer;
        id v11 = "%s Complete task now since taskString(%{public}@) or localSR(%{public}p) is nil";
        id v12 = v14;
        uint32_t v13 = 32;
        goto LABEL_20;
      }
    }

    -[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:]( self,  "_setLocalSpeechRecognizerState:",  0LL,  *(_OWORD *)v17,  *(void *)&v17[16],  v18);
    goto LABEL_22;
  }

  float v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v17 = 136315138;
    *(void *)&v17[4] = "-[CSAttSiriSpeechRecognitionNode _handleStopSpeechRecognitionTaskIfNeeded:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Request dispatcher didn't ask to start until end",  v17,  0xCu);
  }

  -[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:](self, "_setLocalSpeechRecognizerState:", 4LL);
}

- (void)_scheduleRecordingTransactionReleaseTimer
{
  v3 = self->_recordingToken;
  int v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    recordingToken = self->_recordingToken;
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[CSAttSiriSpeechRecognitionNode _scheduleRecordingTransactionReleaseTimer]";
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
  block[2] = sub_100075014;
  block[3] = &unk_10022F0D8;
  objc_copyWeak(&v11, &location);
  uint64_t v10 = v3;
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
    id v11 = "-[CSAttSiriSpeechRecognitionNode _releaseRecordingTransactionIfNeededWithToken:]";
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2114;
    __int16 v15 = recordingToken;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Token : %{public}@, currentToken : %{public}@",  (uint8_t *)&v10,  0x20u);
  }

  if ([v4 isEqual:self->_recordingToken])
  {
    -[CSAttSiriSpeechRecognitionNode _clearAudioProcessWaitingBufferIfNeeded]( self,  "_clearAudioProcessWaitingBufferIfNeeded");
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
      id v11 = "-[CSAttSiriSpeechRecognitionNode _releaseRecordingTransactionIfNeededWithToken:]";
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
        __int16 v14 = "-[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]";
        __int16 v15 = 2112;
        uint64_t v16 = self;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        float v9 = "%s %@ created speech analyzer (v2) %@";
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
        __int16 v14 = "-[CSAttSiriSpeechRecognitionNode _interactiveLocalSpeechRecognizer]";
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
    id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      float v8 = "-[CSAttSiriSpeechRecognitionNode _invalidateLocalSpeechRecognizer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
      interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
    }

    -[CoreEmbeddedSpeechRecognizerProvider invalidate](interactiveLocalSpeechRecognizer, "invalidate");
    id v5 = self->_interactiveLocalSpeechRecognizer;
    self->_interactiveLocalSpeechRecognizer = 0LL;
  }

  localSpeechRecognizerTaskString = self->_localSpeechRecognizerTaskString;
  self->_localSpeechRecognizerTaskString = 0LL;
}

- (void)_resetLocalSpeechRecognizerParameters
{
  self->_eagerResultId = 0LL;
  self->_firstPartialResultTime = 0LL;
  self->_timeToSpeakFirstWord = 0.0;
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074E38;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100074C18;
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

- (void)localSpeechRecognizer:(id)a3 didRecognizePartialPackage:(id)a4 withMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000749F8;
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
  block[2] = sub_100074884;
  block[3] = &unk_10022E7F8;
  void block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
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
  v15[2] = sub_1000746D8;
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

- (void)localSpeechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007452C;
  block[3] = &unk_10022EA98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(localSpeechRecognizerQueue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074370;
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
  v15[2] = sub_100074190;
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
  block[2] = sub_100073E6C;
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
  id v29 = a4;
  id v11 = a5;
  id v12 = a6;
  -[CSAttSiriSpeechRecognitionNode _markTimeToFirstWordMetric](self, "_markTimeToFirstWordMetric");
  if (self->_localSpeechRecognizerState == 2)
  {
    if (-[LBLocalSpeechRecognitionSettings enableVoiceCommands]( self->_speechRecognitionSettings,  "enableVoiceCommands"))
    {
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode resultCandidateReceivers](self, "resultCandidateReceivers"));
      id v14 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v39;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
            if ((objc_opt_respondsToSelector( v18,  "didReceiveFinalResultWithRequestId:speechPackage:metadata:taskName:") & 1) != 0) {
              [v18 didReceiveFinalResultWithRequestId:v11 speechPackage:v10 metadata:v12 taskName:self->_localSpeechRecognizerTaskString];
            }
          }

          id v15 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }

        while (v15);
      }
    }

    else if (v29)
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode resultCandidateReceivers](self, "resultCandidateReceivers"));
      id v19 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v35;
        do
        {
          for (j = 0LL; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v13);
            }
            id v23 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
            if ((objc_opt_respondsToSelector( v23,  "didReceiveFinalResultWithRequestId:multiUserSpeechPackage:taskName:") & 1) != 0) {
              [v23 didReceiveFinalResultWithRequestId:v11 multiUserSpeechPackage:v29 taskName:self->_localSpeechRecognizerTaskString];
            }
          }

          id v20 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }

        while (v20);
      }
    }

    else
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode resultCandidateReceivers](self, "resultCandidateReceivers"));
      id v24 = [v13 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v31;
        do
        {
          for (k = 0LL; k != v25; k = (char *)k + 1)
          {
            if (*(void *)v31 != v26) {
              objc_enumerationMutation(v13);
            }
            id v28 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)k);
            if ((objc_opt_respondsToSelector(v28, "didReceiveFinalResultWithRequestId:speechPackage:taskName:") & 1) != 0) {
              [v28 didReceiveFinalResultWithRequestId:v11 speechPackage:v10 taskName:self->_localSpeechRecognizerTaskString];
            }
          }

          id v25 = [v13 countByEnumeratingWithState:&v30 objects:v42 count:16];
        }

        while (v25);
      }
    }
  }
}

- (void)_handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:(id)a3 multiUserSpeechPackage:(id)a4 requestId:(id)a5 rcId:(unint64_t)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v49 = a7;
  id v15 = v12;
  v50 = v15;
  id v48 = v13;
  if (v13)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 sharedUserIdSpeechPackageMap]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 allKeys]);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_ssrNode);
    id v19 = (void *)v17;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getSharedUserIdWithHighestVoiceIdScore:v17]);

    uint64_t v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (v20)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v67 = "-[CSAttSiriSpeechRecognitionNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:multiUserSp"
              "eechPackage:requestId:rcId:metadata:]";
        __int16 v68 = 2112;
        double v69 = *(double *)&v20;
        __int16 v70 = 2112;
        uint64_t v71 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Picked up top user: %@, from resultPackage: %@",  buf,  0x20u);
      }

      int v22 = (void *)objc_claimAutoreleasedReturnValue([v48 sharedUserIdSpeechPackageMap]);
      id v15 = (id)objc_claimAutoreleasedReturnValue([v22 objectForKey:v20]);
      id v23 = v50;
    }

    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v67 = "-[CSAttSiriSpeechRecognitionNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:multiUserSp"
              "eechPackage:requestId:rcId:metadata:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s No top user - using first (random) speech package",  buf,  0xCu);
      }

      int v22 = (void *)objc_claimAutoreleasedReturnValue([v48 sharedUserIdSpeechPackageMap]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allValues]);
      id v15 = (id)objc_claimAutoreleasedReturnValue([v23 firstObject]);
    }
  }

  +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenEndTimeFromSpeechPackage:",  v15);
  double v25 = v24 * 1000.0;
  uint64_t v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[CSAttSiriSpeechRecognitionNode _handleDidRecognizedSpeechPackageForEagerRecognitionCandidate:multiUserSpeech"
          "Package:requestId:rcId:metadata:]";
    __int16 v68 = 2048;
    double v69 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s SpeechPackage processed audio duration: %f ms",  buf,  0x16u);
  }

  if (-[LBLocalSpeechRecognitionSettings enableVoiceCommands]( self->_speechRecognitionSettings,  "enableVoiceCommands"))
  {
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode resultCandidateReceivers](self, "resultCandidateReceivers"));
    id v28 = [v27 countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (v28)
    {
      id v29 = v28;
      id v47 = v15;
      uint64_t v30 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v27);
          }
          __int128 v32 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          if ((objc_opt_respondsToSelector( v32,  "didReceiveResultCandidateWithRequestId:rcId:speechPackage:duration:metadata:taskName:") & 1) != 0) {
            [v32 didReceiveResultCandidateWithRequestId:v14 rcId:a6 speechPackage:v50 duration:v49 metadata:self->_localSpeechRecognizerTaskString taskName:v25];
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v59 objects:v65 count:16];
      }

      while (v29);
LABEL_43:
      id v15 = v47;
    }
  }

  else if (v48)
  {
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode resultCandidateReceivers](self, "resultCandidateReceivers"));
    id v33 = [v27 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v33)
    {
      id v34 = v33;
      id v35 = v15;
      uint64_t v36 = *(void *)v56;
      do
      {
        for (j = 0LL; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(v27);
          }
          __int128 v38 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
          if ((objc_opt_respondsToSelector( v38,  "didReceiveResultCandidateWithRequestId:rcId:multiUserSpeechPackage:topUserSpeechPackage:duration:taskName:") & 1) != 0) {
            [v38 didReceiveResultCandidateWithRequestId:v14 rcId:a6 multiUserSpeechPackage:v48 topUserSpeechPackage:v35 duration:self->_localSpeechRecognizerTaskString taskName:v25];
          }
        }

        id v34 = [v27 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }

      while (v34);
      id v15 = v35;
    }
  }

  else
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode resultCandidateReceivers](self, "resultCandidateReceivers"));
    id v39 = [v27 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v39)
    {
      id v40 = v39;
      id v47 = v15;
      uint64_t v41 = *(void *)v52;
      do
      {
        for (k = 0LL; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v52 != v41) {
            objc_enumerationMutation(v27);
          }
          id v43 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)k);
          if ((objc_opt_respondsToSelector( v43,  "didReceiveResultCandidateWithRequestId:rcId:inputOrigin:speechPackage:duration:taskName:") & 1) != 0)
          {
            id v44 = (void *)objc_claimAutoreleasedReturnValue( -[LBLocalSpeechRecognitionSettings inputOrigin]( self->_speechRecognitionSettings,  "inputOrigin"));
            [v43 didReceiveResultCandidateWithRequestId:v14 rcId:a6 inputOrigin:v44 speechPackage:v50 duration:self->_localSpeechRecognizerTaskString taskName:v25];
          }
        }

        id v40 = [v27 countByEnumeratingWithState:&v51 objects:v63 count:16];
      }

      while (v40);
      goto LABEL_43;
    }
  }

  self->_lastEndpointEagerResultTime = mach_continuous_time();
  endpointDelayReporter = self->_endpointDelayReporter;
  +[CSAttSiriSpeechPackageHelper getLastTokenSilenceStartFromSpeechPackage:]( &OBJC_CLASS___CSAttSiriSpeechPackageHelper,  "getLastTokenSilenceStartFromSpeechPackage:",  v50);
  -[CSEndpointDelayReporter setUserSpeakingEndedTimeInMs:]( endpointDelayReporter,  "setUserSpeakingEndedTimeInMs:",  v46 * 1000.0);
}

- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  localSpeechRecognizerQueue = (dispatch_queue_s *)self->_localSpeechRecognizerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100073918;
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
  v20[2] = sub_100073700;
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
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 modelRoot]);
    *(_DWORD *)buf = 136315394;
    double v24 = "-[CSAttSiriSpeechRecognitionNode localSpeechRecognizer:didSelectRecognitionModelWithModelProperties:]";
    __int16 v25 = 2114;
    int64_t v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Received ASR datapack root directory: %{public}@",  buf,  0x16u);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode speechRecognitionReceivers](self, "speechRecognitionReceivers", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v16, "didSelectRecognitionModelWithModelRoot:") & 1) != 0)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 modelRoot]);
          [v16 didSelectRecognitionModelWithModelRoot:v17];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v13);
  }
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
  v5[2] = sub_1000736EC;
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
  v5[2] = sub_1000736D8;
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
  v5[2] = sub_1000736C4;
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
        id v10 = "-[CSAttSiriSpeechRecognitionNode _fetchInputOriginWithRecordContext:]";
        __int16 v11 = 2114;
        uint64_t v12 = 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Received inputOrigin: %{public}@ from Request Dispatcher, use hard-coded map",  (uint8_t *)&v9,  0x16u);
      }

      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _getAsrInputoriginFromContext:]( self,  "_getAsrInputoriginFromContext:",  v4));
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
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSAttSiriSpeechRecognitionNode _stateToString:]( self,  "_stateToString:",  localSpeechRecognizerState));
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttSiriSpeechRecognitionNode _stateToString:](self, "_stateToString:", a3));
    int v10 = 136315650;
    __int16 v11 = "-[CSAttSiriSpeechRecognitionNode _setLocalSpeechRecognizerState:]";
    __int16 v12 = 2114;
    id v13 = v8;
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
    return off_10022B778[a3];
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
  __int128 v18 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    __int128 v21 = "-[CSAttSiriSpeechRecognitionNode _fetchRecognizerLanguageWithSiriLanguage:UILanguage:taskString:asrLocale:]";
    __int16 v22 = 2114;
    id v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Selected recognizer language : %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  return v17;
}

- (void)_markTimeToFirstWordMetric
{
  unint64_t recordingStartTime = self->_recordingStartTime;
  if (recordingStartTime && self->_firstPartialResultTime && self->_timeToSpeakFirstWord > 0.0)
  {
    os_signpost_id_t v4 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    uint64_t v6 = v5;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    }

    else
    {
      if (os_signpost_enabled(v5))
      {
        unint64_t v7 = self->_recordingStartTime;
        double timeToSpeakFirstWord = self->_timeToSpeakFirstWord;
        *(float *)&double timeToSpeakFirstWord = timeToSpeakFirstWord;
        int v14 = 134349570;
        id v15 = (char *)+[CSFTimeUtils secondsToHostTime:]( &OBJC_CLASS___CSFTimeUtils,  "secondsToHostTime:",  timeToSpeakFirstWord)
            + v7;
        __int16 v16 = 2080;
        id v17 = "SiriX";
        __int16 v18 = 2080;
        __int128 v19 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "ondevice_TimeToFirstWord",  "%{public, signpost.description:begin_time}llu, %s %s",  (uint8_t *)&v14,  0x20u);
      }

      id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v9))
      {
        unint64_t firstPartialResultTime = self->_firstPartialResultTime;
        int v14 = 134349570;
        id v15 = (const char *)firstPartialResultTime;
        __int16 v16 = 2080;
        id v17 = "SiriX";
        __int16 v18 = 2080;
        __int128 v19 = "enableTelemetry=YES";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  v4,  "ondevice_TimeToFirstWord",  "%{public, signpost.description:end_time}llu, %s %s",  (uint8_t *)&v14,  0x20u);
      }
    }
  }

  else
  {
    id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = self->_firstPartialResultTime;
      double v13 = self->_timeToSpeakFirstWord;
      int v14 = 136315906;
      id v15 = "-[CSAttSiriSpeechRecognitionNode _markTimeToFirstWordMetric]";
      __int16 v16 = 2048;
      id v17 = (const char *)recordingStartTime;
      __int16 v18 = 2048;
      __int128 v19 = (const char *)v12;
      __int16 v20 = 2048;
      double v21 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Can't calculate TTFW due to missing metric: %llu %llu %f",  (uint8_t *)&v14,  0x2Au);
    }
  }

- (CSAttSiriController)attSiriController
{
  return (CSAttSiriController *)objc_loadWeakRetained((id *)&self->_attSiriController);
}

- (void)setAttSiriController:(id)a3
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

- (NSString)mhId
{
  return self->_mhId;
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setPrefetchedAsset:(id)a3
{
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return (CSAttSiriEndpointerNode *)objc_loadWeakRetained((id *)&self->_endpointerNode);
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

- (NSHashTable)endpointFeatureReceivers
{
  return self->_endpointFeatureReceivers;
}

- (void)setEndpointFeatureReceivers:(id)a3
{
}

- (NSHashTable)resultCandidateReceivers
{
  return self->_resultCandidateReceivers;
}

- (void)setResultCandidateReceivers:(id)a3
{
}

- (NSHashTable)speechRecognitionReceivers
{
  return self->_speechRecognitionReceivers;
}

- (void)setSpeechRecognitionReceivers:(id)a3
{
}

- (NSHashTable)recognitionTaskCompletionReceivers
{
  return self->_recognitionTaskCompletionReceivers;
}

- (void)setRecognitionTaskCompletionReceivers:(id)a3
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

- (id)fileLoggingDecisionBuilder
{
  return self->_fileLoggingDecisionBuilder;
}

- (void)setFileLoggingDecisionBuilder:(id)a3
{
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
  self->_didDetectedEndpoint = a3;
}

- (NSMutableArray)detectedEndpointTimes
{
  return self->_detectedEndpointTimes;
}

- (void)setDetectedEndpointTimes:(id)a3
{
}

- (unint64_t)lastEndpointEagerResultTime
{
  return self->_lastEndpointEagerResultTime;
}

- (void)setLastEndpointEagerResultTime:(unint64_t)a3
{
  self->_lastEndpointEagerResultTime = a3;
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

- (double)timeToSpeakFirstWord
{
  return self->_timeToSpeakFirstWord;
}

- (void)setTimeToSpeakFirstWord:(double)a3
{
  self->_double timeToSpeakFirstWord = a3;
}

- (unint64_t)speechRecognitionMode
{
  return self->_speechRecognitionMode;
}

- (void)setSpeechRecognitionMode:(unint64_t)a3
{
  self->_speechRecognitionMode = a3;
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