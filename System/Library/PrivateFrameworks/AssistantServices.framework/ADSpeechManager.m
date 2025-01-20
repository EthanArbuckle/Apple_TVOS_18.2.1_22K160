@interface ADSpeechManager
+ (id)_ADSpeechManagerLowPriorityDispatchQueue;
+ (id)_badStateError;
+ (id)_speechCodecError;
+ (id)sharedManager;
- (ADAudioSessionCoordinator)audioSessionCoordinator;
- (AFAudioPowerUpdater)audioPowerUpdater;
- (AFAudioSessionAssertionAcquisitionService)audioSessionAssertionAcquisitionService;
- (AFDictationOptions)dictationOptions;
- (BOOL)_endSessionIfIdle;
- (BOOL)_releaseSession;
- (BOOL)_supportsVolumeService;
- (BOOL)isCapturing;
- (BOOL)isDriving;
- (BOOL)isLocallyRecognizing;
- (BOOL)isLocallyRecognizingInDictationMode;
- (BOOL)isStopped;
- (CSAudioSessionController)audioSessionController;
- (CSSiriAudioPlaybackService)audioPlaybackService;
- (NSArray)dictationLanguages;
- (NSArray)inlineItemList;
- (NSString)initialDictationLanguage;
- (NSString)primaryDictationLanguage;
- (id)_currentSpeechCaptureSource;
- (id)_initWithInstanceContext:(id)a3;
- (id)_interactiveLocalSpeechRecognizer;
- (id)_recordingInfo;
- (id)_speechCompressor;
- (id)_speechRecorder;
- (id)_startFixedPriorityCaptureForMode:(int64_t)a3 options:(id)a4 sessionUUID:(id)a5;
- (id)_volumeService;
- (id)context;
- (id)endpointerModelVersion;
- (id)getRecordingInfo;
- (id)startSpeechCaptureForDictationWithOptions:(id)a3 sessionUUID:(id)a4 secureOfflineOnly:(BOOL)a5;
- (id)startSpeechCaptureForRequestWithOptions:(id)a3 sessionUUID:(id)a4 language:(id)a5;
- (void)_addRecordStoppedCompletion:(id)a3;
- (void)_cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:(id)a3;
- (void)_cancelRecordingWithError:(id)a3 suppressAlert:(BOOL)a4;
- (void)_cleanUpDelegateInfo;
- (void)_fetchSmartSiriVolume:(BOOL)a3;
- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3 forceFetch:(BOOL)a4;
- (void)_getAdjustedSiriOutputVolumeLevelForAudioRoute:(id)a3 withCompletion:(id)a4;
- (void)_lastAudioBufferReceivedWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)_prepareAudioSystemWithContext:(id)a3 audioSessionAssertion:(id)a4 completion:(id)a5;
- (void)_recordingStoppedWithError:(id)a3 totalPacketCount:(int64_t)a4 endpointMode:(int64_t)a5 endpointerMetrics:(id)a6;
- (void)_startCaptureForMode:(int64_t)a3 options:(id)a4 context:(id)a5;
- (void)_stopSpeechCaptureWithOptions:(id)a3;
- (void)_tellDelegateAboutFingerprint:(id)a3 duration:(double)a4;
- (void)_tellDelegateAboutInputAveragePower:(float)a3 peak:(float)a4;
- (void)_tellDelegateAboutSpeechPackets:(id)a3 atTimestamp:(double)a4 count:(int64_t)a5;
- (void)_tellDelegateAudioFileDidFinish:(id)a3 error:(id)a4;
- (void)_tellDelegateDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5;
- (void)_tellDelegateDidSetAudioSessionActive:(BOOL)a3;
- (void)_tellDelegateEndpointWasDelayedForMusic;
- (void)_tellDelegateMusicWasDetected;
- (void)_tellDelegateQuickStopWasRequested;
- (void)_tellDelegateShutdownUIWasRequested;
- (void)_tellDelegateSpeechCanceled;
- (void)_tellDelegateSpeechEndpointWasDetectedAtTime:(double)a3;
- (void)_tellDelegateSpeechFailedWithError:(id)a3;
- (void)_tellDelegateSpeechFinished;
- (void)_tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)_tellDelegateSpeechRecognitionUpdateWillBegin;
- (void)_tellDelegateSpeechShouldPreheatWithRecordingInfo:(id)a3;
- (void)_tellDelegateSpeechStartedWithRecordingInfo:(id)a3;
- (void)_tellDelegateSpeechStartpointWasDetectedAtTime:(double)a3;
- (void)_tellDelegateSpeechWillBeginWithTimestamp:(double)a3 isFromFile:(BOOL)a4 isAudioPowerUpdateDisabled:(BOOL)a5;
- (void)_tellDelegateSpeechWillStopRecordingWithSignpostID:(unint64_t)a3;
- (void)_tellDelegateToPerformTwoShotPromptWithType:(int64_t)a3 completion:(id)a4;
- (void)_tellDelegateUpdateAudioInfo:(id)a3;
- (void)_tellDelegateWillSetAudioSessionActive:(BOOL)a3;
- (void)_updateAudioDeviceInfo:(id)a3;
- (void)_updateCapturingStateWithOptions:(id)a3;
- (void)_updateRecordRoute:(id)a3 andDeviceIdentifier:(id)a4;
- (void)_updateSiriOutputVolume:(BOOL)a3 completion:(id)a4;
- (void)_updateSpeechState:(int)a3;
- (void)addRecordedDictationAudioSampleData:(id)a3;
- (void)adjustSiriOutputVolumeForRouteIfNeeded:(id)a3;
- (void)asrBridgeReceivedEagerRecognitionCandidate:(id)a3 rawRecognitionResult:(id)a4 duration:(double)a5 sessionUUID:(id)a6;
- (void)asrBridgeReceivedFinalResult:(id)a3 speechPackage:(id)a4 sessionUUID:(id)a5;
- (void)asrBridgeReceivedPartialResult:(id)a3 language:(id)a4 tokens:(id)a5;
- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5;
- (void)audioSessionCoordinator:(id)a3 prepareAudioSessionWithContext:(id)a4;
- (void)audioSessionCoordinator:(id)a3 releaseAudioSessionWithContext:(id)a4;
- (void)cancelLocalRecognitionIfActive;
- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3;
- (void)deactivateAudioSessionIfNoActiveAssertions;
- (void)dealloc;
- (void)dictationSessionDidComplete;
- (void)disableDESWithCompletion:(id)a3;
- (void)eagerlyInitializeAudioRecording;
- (void)endSession;
- (void)endSession:(BOOL)a3 completion:(id)a4;
- (void)enforcePreviousEndpointHint;
- (void)getLastStartpointTimestampAndCurrentTime:(id)a3;
- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)getRecordingInfoUsingBlock:(id)a3;
- (void)getSpeechRecorderVTSatScore:(id)a3;
- (void)getVolumeServiceUsingBlock:(id)a3;
- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)localSpeechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4;
- (void)playRecordingStartAlert;
- (void)preheatRecognizerWithOptions:(id)a3;
- (void)preheatWithOptions:(id)a3;
- (void)prepareAudioSystemWithContext:(id)a3 completion:(id)a4;
- (void)resetLocalRecognizer;
- (void)setClientConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictationLanguages:(id)a3;
- (void)setDictationOptions:(id)a3;
- (void)setDirtySiriOutputVolumeHostTime:(unint64_t)a3;
- (void)setEARLanguageDetectorSpeechRequestId:(id)a3;
- (void)setEndpointerDelayedTrigger:(BOOL)a3;
- (void)setEndpointerThreshold:(double)a3;
- (void)setFingerprintWasRecognized;
- (void)setInitialDictationLanguage:(id)a3;
- (void)setInlineItemList:(id)a3;
- (void)setIsDriving:(BOOL)a3;
- (void)setPrimaryDictationLanguage:(id)a3;
- (void)setSpeechRecognizedContext:(id)a3;
- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3;
- (void)speechCapturing:(id)a3 didDetectEndpointAtTime:(double)a4;
- (void)speechCapturing:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6;
- (void)speechCapturing:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)speechCapturing:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5;
- (void)speechCapturing:(id)a3 didInterruptAudioSession:(id)a4;
- (void)speechCapturing:(id)a3 didLoseAudioSessionOwnerOrMediaServices:(id)a4;
- (void)speechCapturing:(id)a3 didReceiveFingerprint:(id)a4 duration:(double)a5;
- (void)speechCapturing:(id)a3 didSetAudioSessionActive:(BOOL)a4;
- (void)speechCapturing:(id)a3 languageDetectorDidFail:(id)a4;
- (void)speechCapturing:(id)a3 performTwoShotPromptWithType:(int64_t)a4 completion:(id)a5;
- (void)speechCapturing:(id)a3 willSetAudioSessionActive:(BOOL)a4;
- (void)speechCapturingDidDelayEndpointForMusic:(id)a3;
- (void)speechCapturingDidDetectMusic:(id)a3;
- (void)speechCapturingDidProvideConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10;
- (void)speechCapturingDidReceiveLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)speechCapturingDidRecordSpeechPackets:(id)a3 atTimestamp:(double)a4 totalPacketCount:(int64_t)a5;
- (void)speechCapturingDidRequestQuickStop:(id)a3;
- (void)speechCapturingDidRequestShutdownUI:(id)a3;
- (void)speechCapturingDidRequestUpdateSiriOutputVolume:(id)a3;
- (void)speechCapturingDidStartRecordingSuccessfully:(BOOL)a3 error:(id)a4 withInfo:(id)a5;
- (void)speechCapturingDidStopRecordingWithError:(id)a3 endpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6;
- (void)speechCapturingDidUpdateRecordingInfo:(id)a3;
- (void)speechCapturingWillStopRecording;
- (void)speechCapturingWillStopRecordingWithSignpostID:(unint64_t)a3;
- (void)startAcousticIDCaptureWithOptions:(id)a3 sessionUUID:(id)a4;
- (void)startRecordedDictationCaptureWithSessionUUID:(id)a3 narrowband:(BOOL)a4 secureOfflineOnly:(BOOL)a5;
- (void)startSpeechCaptureWithURL:(id)a3 isNarrowBand:(BOOL)a4 isDictation:(BOOL)a5 sessionUUID:(id)a6;
- (void)stopFingerprintingForSuccess:(BOOL)a3;
- (void)stopSpeechCaptureIfFingerprintingOnlyWithOptions:(id)a3;
- (void)stopSpeechCaptureWithOptions:(id)a3;
- (void)suppressAudioInterruptionEndedNotificationsAndEndSessionIfIdle:(id)a3;
- (void)suspendAutomaticEndpointingInRange:(AFTimeRange)a3;
- (void)updateASRFeatures:(id)a3;
- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5;
- (void)updateOptionsAfterRecognitionForElapsedTime:(double)a3 isFinal:(BOOL)a4;
- (void)updateSpeechOptions:(id)a3;
- (void)updateSpeechSynthesisRecord:(id)a3;
@end

@implementation ADSpeechManager

- (id)_initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___ADSpeechManager;
  v5 = -[ADSpeechManager init](&v43, "init");
  if (v5)
  {
    id v6 = sub_1001EB070((uint64_t)"ADSpeechManagerRootQueue");
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UNSPECIFIED, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);

    if (v7) {
      dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("ADSpeechManagerQueue", v11, v7);
    }
    else {
      dispatch_queue_t v12 = dispatch_queue_create("ADSpeechManagerQueue", v11);
    }
    v13 = (OS_dispatch_queue *)v12;

    queue = v5->_queue;
    v5->_queue = v13;

    v5->_speechState = 0;
    v15 = objc_alloc_init(&OBJC_CLASS___ADSpeechLog);
    speechLog = v5->_speechLog;
    v5->_speechLog = v15;

    if (v4) {
      v17 = (AFInstanceContext *)v4;
    }
    else {
      v17 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v17;

    if (-[AFInstanceContext isEndpoint](v5->_instanceContext, "isEndpoint"))
    {
      v19 = (CSAudioSessionController *)objc_claimAutoreleasedReturnValue(-[AFInstanceContext endpointUUID](v5->_instanceContext, "endpointUUID"));
      v20 = -[CSSpeechController initWithEndpointId:]( objc_alloc(&OBJC_CLASS___CSSpeechController),  "initWithEndpointId:",  v19);
      speechController = v5->_speechController;
      v5->_speechController = v20;

      v22 = -[CSAudioSessionController initWithEndpointId:]( objc_alloc(&OBJC_CLASS___CSAudioSessionController),  "initWithEndpointId:",  v19);
      audioSessionController = v5->_audioSessionController;
      v5->_audioSessionController = v22;
    }

    else
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[CSSpeechController sharedController](&OBJC_CLASS___CSSpeechController, "sharedController"));
      v25 = v5->_speechController;
      v5->_speechController = (CSSpeechController *)v24;

      uint64_t v26 = objc_claimAutoreleasedReturnValue(+[CSAudioSessionController sharedInstance](&OBJC_CLASS___CSAudioSessionController, "sharedInstance"));
      v19 = v5->_audioSessionController;
      v5->_audioSessionController = (CSAudioSessionController *)v26;
    }

    if (-[AFInstanceContext supportsAudioPowerUpdate](v5->_instanceContext, "supportsAudioPowerUpdate"))
    {
      v27 = -[ADAudioPowerCoreSpeechProvider initWithChannel:speechController:]( objc_alloc(&OBJC_CLASS___ADAudioPowerCoreSpeechProvider),  "initWithChannel:speechController:",  0LL,  v5->_speechController);
      v28 = -[AFAudioPowerUpdater initWithProvider:queue:frequency:delegate:]( objc_alloc(&OBJC_CLASS___AFAudioPowerUpdater),  "initWithProvider:queue:frequency:delegate:",  v27,  v5->_queue,  1LL,  v5);
      audioPowerUpdater = v5->_audioPowerUpdater;
      v5->_audioPowerUpdater = v28;
    }

    v30 = -[CSSiriAudioPlaybackService initWithAudioSessionController:]( objc_alloc(&OBJC_CLASS___CSSiriAudioPlaybackService),  "initWithAudioSessionController:",  v5->_audioSessionController);
    audioPlaybackService = v5->_audioPlaybackService;
    v5->_audioPlaybackService = v30;

    v32 = -[ADAudioSessionCoordinator initWithInstanceContext:delegate:]( objc_alloc(&OBJC_CLASS___ADAudioSessionCoordinator),  "initWithInstanceContext:delegate:",  v4,  v5);
    audioSessionCoordinator = v5->_audioSessionCoordinator;
    v5->_audioSessionCoordinator = v32;

    v34 = (dispatch_queue_s *)v5->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100321E50;
    block[3] = &unk_1004FD940;
    v42 = v5;
    dispatch_async(v34, block);
    v35 = v5->_queue;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_100321E70;
    v39[3] = &unk_1004FBBD0;
    v40 = v35;
    v37 = v35;
    [v36 addQueue:v37 heartBeatInterval:v39 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADSpeechManager;
  -[ADSpeechManager dealloc](&v4, "dealloc");
}

- (id)_speechRecorder
{
  speechRecorder = self->_speechRecorder;
  if (!speechRecorder)
  {
    objc_super v4 = objc_alloc(&OBJC_CLASS___CSSiriSpeechRecorder);
    queue = self->_queue;
    speechController = self->_speechController;
    audioSessionController = self->_audioSessionController;
    audioPlaybackService = self->_audioPlaybackService;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADExperimentManager sharedManager](&OBJC_CLASS___ADExperimentManager, "sharedManager"));
    dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
    v11 = -[CSSiriSpeechRecorder initWithQueue:speechController:audioSessionController:audioPlaybackService:experimentContext:]( v4,  "initWithQueue:speechController:audioSessionController:audioPlaybackService:experimentContext:",  queue,  speechController,  audioSessionController,  audioPlaybackService,  v10);
    dispatch_queue_t v12 = self->_speechRecorder;
    self->_speechRecorder = v11;

    v13 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      v14 = self->_speechRecorder;
      int v16 = 136315650;
      v17 = "-[ADSpeechManager _speechRecorder]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s %@ created local speech recorder %@",  (uint8_t *)&v16,  0x20u);
    }

    -[CSSiriSpeechRecorder setClientConfiguration:]( self->_speechRecorder,  "setClientConfiguration:",  self->_clientConfiguration);
    -[CSSiriSpeechRecorder setDelegate:](self->_speechRecorder, "setDelegate:", self);
    speechRecorder = self->_speechRecorder;
  }

  return speechRecorder;
}

- (void)getSpeechRecorderVTSatScore:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100321DFC;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)endpointerModelVersion
{
  return -[CSSpeechController endpointerModelVersion](self->_speechController, "endpointerModelVersion");
}

- (id)_speechCompressor
{
  speechCompressor = self->_speechCompressor;
  if (!speechCompressor)
  {
    id v4 = objc_alloc(&OBJC_CLASS___ADSpeechCompressor);
    queue = self->_queue;
    speechController = self->_speechController;
    audioSessionController = self->_audioSessionController;
    audioPlaybackService = self->_audioPlaybackService;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADExperimentManager sharedManager](&OBJC_CLASS___ADExperimentManager, "sharedManager"));
    dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 context]);
    v11 = -[ADSpeechCompressor initWithQueue:speechController:audioSessionController:audioPlaybackService:experimentContext:]( v4,  "initWithQueue:speechController:audioSessionController:audioPlaybackService:experimentContext:",  queue,  speechController,  audioSessionController,  audioPlaybackService,  v10);
    dispatch_queue_t v12 = self->_speechCompressor;
    self->_speechCompressor = v11;

    v13 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      speechRecorder = self->_speechRecorder;
      int v16 = 136315650;
      v17 = "-[ADSpeechManager _speechCompressor]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = speechRecorder;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s %@ created speech compressor %@",  (uint8_t *)&v16,  0x20u);
    }

    -[ADSpeechCompressor setDelegate:](self->_speechCompressor, "setDelegate:", self);
    speechCompressor = self->_speechCompressor;
  }

  return speechCompressor;
}

- (id)_currentSpeechCaptureSource
{
  currentCapturing = self->_currentCapturing;
  if (!currentCapturing)
  {
    id v4 = (CSSiriSpeechCapturing *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _speechRecorder](self, "_speechRecorder"));
    v5 = self->_currentCapturing;
    self->_currentCapturing = v4;

    id v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      v7 = self->_currentCapturing;
      int v9 = 136315394;
      dispatch_queue_attr_t v10 = "-[ADSpeechManager _currentSpeechCaptureSource]";
      __int16 v11 = 2112;
      dispatch_queue_t v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Speech capturing set to %@.",  (uint8_t *)&v9,  0x16u);
    }

    currentCapturing = self->_currentCapturing;
  }

  return currentCapturing;
}

- (void)_updateSpeechState:(int)a3
{
  unsigned int speechState = self->_speechState;
  if (speechState != a3)
  {
    id v6 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      id v8 = sub_10031DA50(speechState);
      int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = sub_10031DA50(a3);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v13 = 136315650;
      v14 = "-[ADSpeechManager _updateSpeechState:]";
      __int16 v15 = 2112;
      int v16 = v9;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s speechState: %@ -> %@",  (uint8_t *)&v13,  0x20u);
    }

    self->_unsigned int speechState = a3;
  }

  if ((a3 != 0) == (speechState == 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didChangeRecordingState:a3 != 0];
  }

- (void)_updateAudioDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = self->_audioDeviceInfo;
  id v6 = (CSAudioDeviceInfo *)v4;
  v7 = v6;
  if (v5 == v6)
  {
  }

  else
  {
    if (v6 && v5)
    {
      unsigned __int8 v8 = -[CSAudioDeviceInfo isEqual:](v5, "isEqual:", v6);

      if ((v8 & 1) != 0) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    int v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      audioDeviceInfo = self->_audioDeviceInfo;
      int v13 = 136315650;
      v14 = "-[ADSpeechManager _updateAudioDeviceInfo:]";
      __int16 v15 = 2112;
      int v16 = audioDeviceInfo;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s audioDeviceInfo: %@ -> %@",  (uint8_t *)&v13,  0x20u);
    }

    __int16 v11 = (CSAudioDeviceInfo *)-[CSAudioDeviceInfo copy](v7, "copy");
    dispatch_queue_t v12 = self->_audioDeviceInfo;
    self->_audioDeviceInfo = v11;
  }

- (void)_updateRecordRoute:(id)a3 andDeviceIdentifier:(id)a4
{
  id v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  recordRoute = self->_recordRoute;
  if (recordRoute != v6 && !-[NSString isEqualToString:](recordRoute, "isEqualToString:", v6))
  {
    int v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v10 = self->_recordRoute;
      int v18 = 136315650;
      v19 = "-[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:]";
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s recordRoute: %@ -> %@",  (uint8_t *)&v18,  0x20u);
    }

    __int16 v11 = (NSString *)-[NSString copy](v6, "copy");
    dispatch_queue_t v12 = self->_recordRoute;
    self->_recordRoute = v11;
  }

  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier != v7 && !-[NSString isEqualToString:](deviceIdentifier, "isEqualToString:", v7))
  {
    v14 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = self->_deviceIdentifier;
      int v18 = 136315650;
      v19 = "-[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:]";
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s deviceIdentifier: %@ -> %@",  (uint8_t *)&v18,  0x20u);
    }

    int v16 = (NSString *)-[NSString copy](v7, "copy");
    __int16 v17 = self->_deviceIdentifier;
    self->_deviceIdentifier = v16;
  }
}

- (BOOL)_releaseSession
{
  v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL isAudioSessionLikelyActive = self->_isAudioSessionLikelyActive;
    int v23 = 136315394;
    uint64_t v24 = "-[ADSpeechManager _releaseSession]";
    __int16 v25 = 1024;
    unsigned int v26 = isAudioSessionLikelyActive;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s isAudioSessionActive = %d (likely)",  (uint8_t *)&v23,  0x12u);
  }

  if (AFSupportsAudioSessionCoordination())
  {
    unsigned int v5 = -[ADAudioSessionCoordinator hasActiveAudioSessionAssertions]( self->_audioSessionCoordinator,  "hasActiveAudioSessionAssertions");
    id v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315394;
      uint64_t v24 = "-[ADSpeechManager _releaseSession]";
      __int16 v25 = 1024;
      unsigned int v26 = v5;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s hasActiveAudioSessionAssertions = %d",  (uint8_t *)&v23,  0x12u);
      id v6 = (os_log_s *)AFSiriLogContextSpeech;
    }

    BOOL isReleaseAudioSessionRequired = self->_isReleaseAudioSessionRequired;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315394;
      uint64_t v24 = "-[ADSpeechManager _releaseSession]";
      __int16 v25 = 1024;
      unsigned int v26 = isReleaseAudioSessionRequired;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s hasActivatedAudioSession = %d",  (uint8_t *)&v23,  0x12u);
      if (v5)
      {
LABEL_8:
        unsigned __int8 v8 = (os_log_s *)AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          int v23 = 136315138;
          uint64_t v24 = "-[ADSpeechManager _releaseSession]";
          int v9 = "%s Rejected releasing audio session because audio session coordinator has active assertions.";
LABEL_30:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v23, 0xCu);
          return 0;
        }

        return 0;
      }
    }

    else if (v5)
    {
      goto LABEL_8;
    }

    if (!isReleaseAudioSessionRequired)
    {
      unsigned __int8 v8 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        int v23 = 136315138;
        uint64_t v24 = "-[ADSpeechManager _releaseSession]";
        int v9 = "%s Skipped releasing audio session because audio session has not been activated and audio session coordinat"
             "or has no active assertions.";
        goto LABEL_30;
      }

      return 0;
    }
  }

  if (self->_prepareAudioSystemTransactionCount < 1)
  {
    v29 = @"wasAudioSessionActive";
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isAudioSessionLikelyActive));
    v30 = v12;
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v14 logEventWithType:246 context:v13 contextNoCopy:1];

    *(_WORD *)&self->_BOOL isAudioSessionLikelyActive = 0;
    self->_hasPreparedAudioSystemForPlayback = 0;
    self->_releasesAudioSessionWhenRecordingStopped = 0;
    self->_releasesAudioSessionWhenPrepareAudioSystemDone = 0;
    __int16 v15 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315138;
      uint64_t v24 = "-[ADSpeechManager _releaseSession]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Stopping audio playback, if any",  (uint8_t *)&v23,  0xCu);
    }

    -[CSSiriAudioPlaybackService stopAllRequestsSynchronously]( self->_audioPlaybackService,  "stopAllRequestsSynchronously");
    int v16 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315138;
      uint64_t v24 = "-[ADSpeechManager _releaseSession]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Stopped audio playback, if any",  (uint8_t *)&v23,  0xCu);
    }

    __int16 v17 = (CSSiriSpeechRecorder *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _currentSpeechCaptureSource](self, "_currentSpeechCaptureSource"));
    -[CSSiriSpeechRecorder releaseAudioSession](v17, "releaseAudioSession");
    speechRecorder = self->_speechRecorder;
    if (speechRecorder != v17) {
      -[CSSiriSpeechRecorder releaseAudioSession](speechRecorder, "releaseAudioSession");
    }
    -[ADSpeechManager _updateAudioDeviceInfo:](self, "_updateAudioDeviceInfo:", 0LL);
    -[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:]( self,  "_updateRecordRoute:andDeviceIdentifier:",  0LL,  0LL);
    *(_WORD *)&self->_hasFetchedSmartSiriVolume = 0;
    self->_dirtySiriOutputVolumeHostTime = 0LL;
    v19 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315650;
      uint64_t v24 = "-[ADSpeechManager _releaseSession]";
      __int16 v25 = 1024;
      unsigned int v26 = 0;
      __int16 v27 = 1024;
      int v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s hasFetchedSmartSiriVolume = %d, hasUpdatedSiriOutputVolume = %d",  (uint8_t *)&v23,  0x18u);
    }

    if (self->_volumeService && !-[ADSpeechManager _supportsVolumeService](self, "_supportsVolumeService"))
    {
      -[ADVolumeService invalidate](self->_volumeService, "invalidate");
      volumeService = self->_volumeService;
      self->_volumeService = 0LL;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    BOOL v11 = 1;
    [v21 logEventWithType:247 context:v13 contextNoCopy:1];
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      uint64_t v24 = "-[ADSpeechManager _releaseSession]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Deferred releasing audio session during audio system preparation.",  (uint8_t *)&v23,  0xCu);
    }

    BOOL v11 = 0;
    self->_releasesAudioSessionWhenPrepareAudioSystemDone = 1;
  }

  return v11;
}

- (void)dictationSessionDidComplete
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100321B9C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (id)_interactiveLocalSpeechRecognizer
{
  interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
  if (!interactiveLocalSpeechRecognizer)
  {
    id v4 = -[CoreEmbeddedSpeechRecognizer initWithDelegate:instanceUUID:]( objc_alloc(&OBJC_CLASS___CoreEmbeddedSpeechRecognizer),  "initWithDelegate:instanceUUID:",  self,  &CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive);
    unsigned int v5 = self->_interactiveLocalSpeechRecognizer;
    self->_interactiveLocalSpeechRecognizer = v4;

    id v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      v7 = self->_interactiveLocalSpeechRecognizer;
      int v9 = 136315650;
      id v10 = "-[ADSpeechManager _interactiveLocalSpeechRecognizer]";
      __int16 v11 = 2112;
      dispatch_queue_t v12 = self;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %@ created speech recognizer %@",  (uint8_t *)&v9,  0x20u);
    }

    interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
  }

  return interactiveLocalSpeechRecognizer;
}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100321B14;
  block[3] = &unk_1004FC838;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (void)disableDESWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100321AD4;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isLocallyRecognizing
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100321AB8;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isLocallyRecognizingInDictationMode
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100321A84;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancelLocalRecognitionIfActive
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100321998;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetLocalRecognizer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100321950;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_cleanUpDelegateInfo
{
  char v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ADSpeechManager _cleanUpDelegateInfo]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s ADSpeechManager no longer talking to delegate",  (uint8_t *)&v5,  0xCu);
  }

  -[AFAudioPowerUpdater endUpdate](self->_audioPowerUpdater, "endUpdate");
  self->_shouldTalkToDelegate = 0;
  self->_hasReceivedLastAudioBuffer = 0;
  self->_capturingMode = 0LL;
  capturingContext = self->_capturingContext;
  self->_capturingContext = 0LL;
}

- (void)_tellDelegateSpeechCanceled
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didCancelWithContext:self->_capturingContext];

    -[ADSpeechManager _cleanUpDelegateInfo](self, "_cleanUpDelegateInfo");
  }

  else
  {
    id v4 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[ADSpeechManager _tellDelegateSpeechCanceled]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_tellDelegateSpeechFailedWithError:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didFailWithError:v4 context:self->_capturingContext];

    -[ADSpeechManager _cleanUpDelegateInfo](self, "_cleanUpDelegateInfo");
  }

  else
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[ADSpeechManager _tellDelegateSpeechFailedWithError:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)_tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didReceiveLastAudioBufferWithEndpointMode:a3 totalPacketCount:a4 endpointerMetrics:v8 context:self->_capturingContext];
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      dispatch_queue_t v12 = "-[ADSpeechManager _tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)_tellDelegateSpeechFinished
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didFinishWithCapturingMode:self->_capturingMode context:self->_capturingContext];

    if (!self->_localSpeechRecognizerTask) {
      -[ADSpeechManager _cleanUpDelegateInfo](self, "_cleanUpDelegateInfo");
    }
  }

  else
  {
    id v4 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[ADSpeechManager _tellDelegateSpeechFinished]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v5,  0xCu);
    }
  }

- (void)_tellDelegateSpeechShouldPreheatWithRecordingInfo:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self preheatWithRecordingInfo:v4 context:self->_capturingContext];
  }

  else
  {
    uint64_t v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _tellDelegateSpeechShouldPreheatWithRecordingInfo:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)_tellDelegateSpeechRecognitionUpdateWillBegin
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self recognitionUpdateWillBeginForTask:self->_localSpeechRecognizerTask];
  }

  else
  {
    char v3 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v6 = "-[ADSpeechManager _tellDelegateSpeechRecognitionUpdateWillBegin]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  buf,  0xCu);
    }
  }

- (void)_tellDelegateSpeechWillBeginWithTimestamp:(double)a3 isFromFile:(BOOL)a4 isAudioPowerUpdateDisabled:(BOOL)a5
{
  if (self->_shouldTalkToDelegate)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = WeakRetained;
    if (v5)
    {
      [WeakRetained speechManager:self willStartRecordingAtTimestamp:v6 isFromFile:0 inputAudioPowerWrapper:self->_capturingContext context:a3];
    }

    else
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue(-[AFAudioPowerUpdater _createNewXPCWrapper](self->_audioPowerUpdater, "_createNewXPCWrapper"));
      [v12 speechManager:self willStartRecordingAtTimestamp:v6 isFromFile:v11 inputAudioPowerWrapper:self->_capturingContext context:a3];
    }
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[ADSpeechManager _tellDelegateSpeechWillBeginWithTimestamp:isFromFile:isAudioPowerUpdateDisabled:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  buf,  0xCu);
    }
  }

- (void)_tellDelegateSpeechStartedWithRecordingInfo:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didStartRecordingWithInfo:v4 context:self->_capturingContext];
  }

  else
  {
    BOOL v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _tellDelegateSpeechStartedWithRecordingInfo:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)_tellDelegateUpdateAudioInfo:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didUpdateRecordingWithInfo:v4 context:self->_capturingContext];
  }

  else
  {
    BOOL v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _tellDelegateUpdateAudioInfo:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)_tellDelegateAboutSpeechPackets:(id)a3 atTimestamp:(double)a4 count:(int64_t)a5
{
  id v8 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self capturedPackets:v8 atTimestamp:a5 totalCount:self->_capturingContext context:a4];
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[ADSpeechManager _tellDelegateAboutSpeechPackets:atTimestamp:count:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)_tellDelegateAboutFingerprint:(id)a3 duration:(double)a4
{
  id v6 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self capturedFingerprint:v6 duration:a4];
  }

  else
  {
    id v8 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[ADSpeechManager _tellDelegateAboutFingerprint:duration:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)_tellDelegateMusicWasDetected
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManagerDidDetectMusic:self];
  }

  else
  {
    char v3 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[ADSpeechManager _tellDelegateMusicWasDetected]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  buf,  0xCu);
    }
  }

- (void)_tellDelegateEndpointWasDelayedForMusic
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManagerDidDelayEndpointForMusic:self];
  }

  else
  {
    char v3 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[ADSpeechManager _tellDelegateEndpointWasDelayedForMusic]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  buf,  0xCu);
    }
  }

- (void)_tellDelegateAboutInputAveragePower:(float)a3 peak:(float)a4
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(float *)&double v7 = a3;
    *(float *)&double v8 = a4;
    [WeakRetained speechManager:self didUpdateInputAveragePower:v7 peakPower:v8];
  }

  else
  {
    int v9 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[ADSpeechManager _tellDelegateAboutInputAveragePower:peak:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Speech finished dropping callback",  buf,  0xCu);
    }
  }

- (void)_tellDelegateAudioFileDidFinish:(id)a3 error:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self didFinishWritingAudioFile:v8 error:v7 context:self->_capturingContext];
}

- (void)_tellDelegateSpeechStartpointWasDetectedAtTime:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didDetectStartpointAtTime:self->_capturingContext context:a3];
}

- (void)_tellDelegateSpeechEndpointWasDetectedAtTime:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didDetectEndpointAtTime:self->_capturingContext context:a3];
}

- (void)_tellDelegateToPerformTwoShotPromptWithType:(int64_t)a3 completion:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self performTwoShotPromptWithType:a3 context:self->_capturingContext completion:v7];
}

- (void)_tellDelegateQuickStopWasRequested
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didRequestQuickStopWithContext:self->_capturingContext];
}

- (void)_tellDelegateShutdownUIWasRequested
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didRequestShutdownUIWithContext:self->_capturingContext];
}

- (void)_tellDelegateWillSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self audioSessionWillBecomeActive:v3];
}

- (void)_tellDelegateDidSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self audioSessionDidBecomeActive:v3];
}

- (void)_tellDelegateDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self didDetectLanguage:v10 confidenceScores:v9 isConfident:v5];
}

- (void)_tellDelegateSpeechWillStopRecordingWithSignpostID:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self willStopRecordingWithSignpostID:a3];
}

- (void)_cancelRecordingWithError:(id)a3 suppressAlert:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSError *)a3;
  id v7 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    id v9 = v7;
    id v10 = sub_10031DA50(speechState);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v14 = 136315906;
    __int16 v15 = "-[ADSpeechManager _cancelRecordingWithError:suppressAlert:]";
    __int16 v16 = 2112;
    __int16 v17 = v6;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ %d %@", (uint8_t *)&v14, 0x26u);
  }

  recordingError = self->_recordingError;
  self->_recordingError = v6;

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _currentSpeechCaptureSource](self, "_currentSpeechCaptureSource"));
  [v13 cancelSpeechCaptureSuppressingAlert:v4];

  -[ADSpeechManager _updateSpeechState:](self, "_updateSpeechState:", 4LL);
}

- (void)_lastAudioBufferReceivedWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  id v9 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    int v11 = v9;
    id v12 = sub_10031DA50(speechState);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = 136316162;
    __int16 v15 = "-[ADSpeechManager _lastAudioBufferReceivedWithEndpointMode:totalPacketCount:endpointerMetrics:]";
    __int16 v16 = 2048;
    int64_t v17 = a3;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    int v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %zd %zd %@ %@", (uint8_t *)&v14, 0x34u);
  }

  self->_hasReceivedLastAudioBuffer = 1;
  -[ADSpeechManager _tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:]( self,  "_tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:",  a3,  a4,  v8);
}

- (void)_recordingStoppedWithError:(id)a3 totalPacketCount:(int64_t)a4 endpointMode:(int64_t)a5 endpointerMetrics:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    int v14 = v12;
    id v15 = sub_10031DA50(speechState);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v26 = 136316418;
    __int16 v27 = "-[ADSpeechManager _recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:]";
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2048;
    int64_t v31 = a5;
    __int16 v32 = 2048;
    int64_t v33 = a4;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    v37 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s error = %@, endpointMode = %zd, totalPacketCount = %zd, endpointerMetrics = %@, ADSpeechState = %@",  (uint8_t *)&v26,  0x3Eu);
  }

  int v17 = self->_speechState;
  -[ADSpeechManager _updateSpeechState:](self, "_updateSpeechState:", 0LL);
  if (v10)
  {
    -[ADSpeechManager _tellDelegateSpeechFailedWithError:](self, "_tellDelegateSpeechFailedWithError:", v10);
  }

  else if (v17 == 4)
  {
    -[ADSpeechManager _tellDelegateSpeechCanceled](self, "_tellDelegateSpeechCanceled");
  }

  else
  {
    if (!self->_hasReceivedLastAudioBuffer) {
      -[ADSpeechManager _lastAudioBufferReceivedWithEndpointMode:totalPacketCount:endpointerMetrics:]( self,  "_lastAudioBufferReceivedWithEndpointMode:totalPacketCount:endpointerMetrics:",  a5,  a4,  v11);
    }
    -[ADSpeechManager _tellDelegateSpeechFinished](self, "_tellDelegateSpeechFinished");
  }

  -[ADSpeechLog endSpeechLog](self->_speechLog, "endSpeechLog");
  self->_hasPreparedAudioSystemForPlayback = 0;
  if (self->_releasesAudioSessionWhenRecordingStopped)
  {
    __int16 v18 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315138;
      __int16 v27 = "-[ADSpeechManager _recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Asking AVVoiceController to release its audio session now because 'releasesAudioSessionWhenRecordingStopped' is set.",  (uint8_t *)&v26,  0xCu);
    }

    -[ADSpeechManager _releaseSession](self, "_releaseSession");
  }

  recordStoppedCompletion = (void (**)(id))self->_recordStoppedCompletion;
  if (recordStoppedCompletion)
  {
    __int16 v20 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      unsigned int v21 = self->_speechState;
      __int16 v22 = v20;
      id v23 = sub_10031DA50(v21);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      int v26 = 136315394;
      __int16 v27 = "-[ADSpeechManager _recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:]";
      __int16 v28 = 2112;
      id v29 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "%s Invoking recording stopped completion (state = %@)",  (uint8_t *)&v26,  0x16u);

      recordStoppedCompletion = (void (**)(id))self->_recordStoppedCompletion;
    }

    recordStoppedCompletion[2](recordStoppedCompletion);
    id v25 = self->_recordStoppedCompletion;
    self->_recordStoppedCompletion = 0LL;
  }
}

- (void)_updateCapturingStateWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADSpeechManager _updateCapturingStateWithOptions:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _currentSpeechCaptureSource](self, "_currentSpeechCaptureSource"));
    [v6 setSpeechRequestOptions:v4];
  }
}

- (void)speechCapturingDidStartRecordingSuccessfully:(BOOL)a3 error:(id)a4 withInfo:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v107 = "-[ADSpeechManager speechCapturingDidStartRecordingSuccessfully:error:withInfo:]";
    __int16 v108 = 1024;
    *(_DWORD *)v109 = v6;
    *(_WORD *)&v109[4] = 2112;
    *(void *)&v109[6] = v8;
    *(_WORD *)&v109[14] = 2112;
    *(void *)&v109[16] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s success = %d, error = %@, info = %@",  buf,  0x26u);
  }

  if (!v6)
  {
    -[ADSpeechManager _updateSpeechState:](self, "_updateSpeechState:", 0LL);
    -[ADSpeechManager _tellDelegateSpeechFailedWithError:](self, "_tellDelegateSpeechFailedWithError:", v8);
    goto LABEL_76;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 route]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceIdentifier]);
  -[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:](self, "_updateRecordRoute:andDeviceIdentifier:", v11, v12);

  -[ADSpeechManager _updateSpeechState:](self, "_updateSpeechState:", 2LL);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 codec]);
  if (v13)
  {
    v105 = self->_initialDictationLanguage;
    int v14 = (NSString *)objc_claimAutoreleasedReturnValue(-[AFDictationOptions offlineLanguage](self->_dictationOptions, "offlineLanguage"));
    id v15 = v14;
    if (!v14 && (v14 = self->_primaryDictationLanguage, (id v15 = v14) == 0LL)
      || !self->_localSpeechRecognizerTask
      || !AFOfflineDictationCapable(v14)
      || ([v9 isFingerprintOnly] & 1) != 0)
    {
      __int16 v16 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        localSpeechRecognizerTask = self->_localSpeechRecognizerTask;
        __int16 v18 = v16;
        int64_t v19 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", AFOfflineDictationCapable(v18));
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 136315906;
        v107 = "-[ADSpeechManager speechCapturingDidStartRecordingSuccessfully:error:withInfo:]";
        __int16 v108 = 2112;
        *(void *)v109 = v15;
        *(_WORD *)&v109[8] = 2112;
        *(void *)&v109[10] = localSpeechRecognizerTask;
        *(_WORD *)&v109[18] = 2112;
        *(void *)&v109[20] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Not starting local recognizer: language %@, task %@, dictation capable %@",  buf,  0x2Au);
      }

- (void)speechCapturingDidUpdateRecordingInfo:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 route]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceIdentifier]);
  -[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:](self, "_updateRecordRoute:andDeviceIdentifier:", v4, v5);

  -[ADSpeechManager _tellDelegateUpdateAudioInfo:](self, "_tellDelegateUpdateAudioInfo:", v6);
}

- (void)speechCapturingDidReceiveLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int speechState = self->_speechState;
  if (speechState > 4 || ((1 << speechState) & 0x13) == 0)
  {
    if (!self->_hasReceivedLastAudioBuffer) {
      -[ADSpeechManager _lastAudioBufferReceivedWithEndpointMode:totalPacketCount:endpointerMetrics:]( self,  "_lastAudioBufferReceivedWithEndpointMode:totalPacketCount:endpointerMetrics:",  a3,  a4,  v8);
    }
  }

  else
  {
    id v11 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      id v13 = sub_10031DA50(speechState);
      int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      int v15 = 136315394;
      __int16 v16 = "-[ADSpeechManager speechCapturingDidReceiveLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:]";
      __int16 v17 = 2112;
      __int16 v18 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Ignored because speech state is %@.",  (uint8_t *)&v15,  0x16u);
    }
  }
}

- (void)speechCapturingWillStopRecording
{
}

- (void)speechCapturingWillStopRecordingWithSignpostID:(unint64_t)a3
{
}

- (void)speechCapturingDidStopRecordingWithError:(id)a3 endpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  id v11 = a6;
  __int16 v16 = (NSError *)a3;
  dispatch_assert_queue_V2(queue);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  [v12 logVoiceRecordingEnd];

  recordingError = v16;
  if (!v16) {
    recordingError = self->_recordingError;
  }
  int v14 = recordingError;
  -[ADSpeechManager _recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:]( self,  "_recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:",  v14,  a5,  a4,  v11);

  int v15 = self->_recordingError;
  self->_recordingError = 0LL;
}

- (void)speechCapturingDidRecordSpeechPackets:(id)a3 atTimestamp:(double)a4 totalPacketCount:(int64_t)a5
{
  id v8 = a3;
  if (-[CSSiriSpeechRecordingContext wantsRecordedAudioBufferLogs]( self->_capturingContext,  "wantsRecordedAudioBufferLogs"))
  {
    id v9 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      int v11 = 136315906;
      id v12 = "-[ADSpeechManager speechCapturingDidRecordSpeechPackets:atTimestamp:totalPacketCount:]";
      __int16 v13 = 2048;
      id v14 = [v8 count];
      __int16 v15 = 2048;
      double v16 = a4;
      __int16 v17 = 2048;
      int64_t v18 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s packets.count = %llu, timestamp = %f, totalPacketCount = %lld",  (uint8_t *)&v11,  0x2Au);
    }
  }

  -[ADSpeechLog appendSpeechPackets:](self->_speechLog, "appendSpeechPackets:", v8);
  -[ADSpeechManager _tellDelegateAboutSpeechPackets:atTimestamp:count:]( self,  "_tellDelegateAboutSpeechPackets:atTimestamp:count:",  v8,  a5,  a4);
}

- (void)speechCapturing:(id)a3 didReceiveFingerprint:(id)a4 duration:(double)a5
{
}

- (void)speechCapturingDidDetectMusic:(id)a3
{
}

- (void)speechCapturingDidDelayEndpointForMusic:(id)a3
{
}

- (void)speechCapturing:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5
{
}

- (void)speechCapturing:(id)a3 didDetectStartpointAtTime:(double)a4
{
}

- (void)speechCapturing:(id)a3 didDetectEndpointAtTime:(double)a4
{
}

- (void)speechCapturing:(id)a3 performTwoShotPromptWithType:(int64_t)a4 completion:(id)a5
{
}

- (void)speechCapturingDidRequestQuickStop:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADSpeechManager speechCapturingDidRequestQuickStop:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[ADSpeechManager _tellDelegateQuickStopWasRequested](self, "_tellDelegateQuickStopWasRequested");
}

- (void)speechCapturingDidRequestShutdownUI:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADSpeechManager speechCapturingDidRequestShutdownUI:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[ADSpeechManager _tellDelegateShutdownUIWasRequested](self, "_tellDelegateShutdownUIWasRequested");
}

- (void)speechCapturingDidRequestUpdateSiriOutputVolume:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "-[ADSpeechManager speechCapturingDidRequestUpdateSiriOutputVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }

  if (sub_10033C888(self->_instanceContext))
  {
    -[ADSpeechManager _fetchSmartSiriVolume:](self, "_fetchSmartSiriVolume:", 1LL);
    -[ADSpeechManager _updateSiriOutputVolume:completion:](self, "_updateSiriOutputVolume:completion:", 1LL, 0LL);
  }
}

- (void)speechCapturing:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[ADSpeechManager speechCapturing:willSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v9, 0x12u);
  }

  uint64_t v8 = 210LL;
  if (!v4) {
    uint64_t v8 = 211LL;
  }
  *((_BYTE *)&self->super.isa + v8) = v4;
  -[ADSpeechManager _tellDelegateWillSetAudioSessionActive:](self, "_tellDelegateWillSetAudioSessionActive:", v4);
  -[ADAudioSessionCoordinator handleWillSetAudioSessionActive:]( self->_audioSessionCoordinator,  "handleWillSetAudioSessionActive:",  v4);
}

- (void)speechCapturing:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[ADSpeechManager speechCapturing:didSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v9, 0x12u);
  }

  uint64_t v8 = 210LL;
  if (!v4) {
    uint64_t v8 = 211LL;
  }
  *((_BYTE *)&self->super.isa + v8) = v4;
  self->_BOOL isAudioSessionLikelyActive = v4;
  -[ADSpeechManager _tellDelegateDidSetAudioSessionActive:](self, "_tellDelegateDidSetAudioSessionActive:", v4);
  -[ADAudioSessionCoordinator handleDidSetAudioSessionActive:]( self->_audioSessionCoordinator,  "handleDidSetAudioSessionActive:",  v4);
}

- (void)speechCapturing:(id)a3 didInterruptAudioSession:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[ADSpeechManager speechCapturing:didInterruptAudioSession:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v7, 0x16u);
  }

  self->_BOOL isAudioSessionLikelyActive = 0;
  self->_hasPreparedAudioSystemForPlayback = 0;
}

- (void)speechCapturing:(id)a3 didLoseAudioSessionOwnerOrMediaServices:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[ADSpeechManager speechCapturing:didLoseAudioSessionOwnerOrMediaServices:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v7, 0x16u);
  }

  self->_BOOL isAudioSessionLikelyActive = 0;
  self->_hasPreparedAudioSystemForPlayback = 0;
}

- (void)speechCapturing:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6
{
}

- (void)speechCapturing:(id)a3 languageDetectorDidFail:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self languageDetectorDidFail:v6];
}

- (void)speechCapturingDidProvideConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10
{
  p_delegate = &self->_delegate;
  id v18 = a10;
  id v19 = a9;
  id v20 = a5;
  id v21 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self didReceiveConfidenceScores:v21 classification:a4 classifiedUser:v20 unknownUserScore:a6 duration:a7 version:a8 thresholdin gType:v19 assetVersion:v18];
}

- (void)audioSessionCoordinator:(id)a3 prepareAudioSessionWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[ADSpeechManager audioSessionCoordinator:prepareAudioSessionWithContext:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s audioSessionCoordinator = %@, context = %@",  buf,  0x20u);
  }

  if (AFSupportsAudioSessionCoordination())
  {
    queue = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1003215F0;
    v10[3] = &unk_1004FD968;
    id v11 = v6;
    BOOL v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)audioSessionCoordinator:(id)a3 releaseAudioSessionWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[ADSpeechManager audioSessionCoordinator:releaseAudioSessionWithContext:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s audioSessionCoordinator = %@, context = %@",  buf,  0x20u);
  }

  if (AFSupportsAudioSessionCoordination())
  {
    queue = (dispatch_queue_s *)self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100321430;
    v10[3] = &unk_1004FD968;
    id v11 = v6;
    BOOL v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)setDirtySiriOutputVolumeHostTime:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100321360;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)getVolumeServiceUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10032131C;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getRecordingInfoUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003212D8;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)getRecordingInfo
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  __int16 v9 = sub_100321288;
  id v10 = sub_100321298;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1003212A0;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_recordingInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _speechRecorder](self, "_speechRecorder"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fetchRecordingInfo]);

  return v3;
}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  if (self->_audioPowerUpdater == a3) {
    -[ADSpeechManager _tellDelegateAboutInputAveragePower:peak:](self, "_tellDelegateAboutInputAveragePower:peak:");
  }
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003210E8;
  block[3] = &unk_1004FD4C0;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADSpeechManager localSpeechRecognizer:didProcessAudioDuration:]";
    __int16 v8 = 2048;
    double v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Processed %.2f", (uint8_t *)&v6, 0x16u);
  }

- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100320FB8;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100320E28;
  block[3] = &unk_1004FD4C0;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100320C98;
  block[3] = &unk_1004FD4C0;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100320A98;
  v15[3] = &unk_1004FD470;
  id v16 = v8;
  __int16 v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)eagerlyInitializeAudioRecording
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100320A8C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)preheatWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADSpeechManager preheatWithOptions:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s options = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100320A04;
  v8[3] = &unk_1004FD968;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)preheatRecognizerWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADSpeechManager preheatRecognizerWithOptions:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s options = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003209AC;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)prepareAudioSystemWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  audioSessionCoordinator = self->_audioSessionCoordinator;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10032086C;
  v20[3] = &unk_1004FBC60;
  id v9 = v6;
  id v21 = v9;
  id v10 = +[AFAssertionContext newWithBuilder:](&OBJC_CLASS___AFAssertionContext, "newWithBuilder:", v20);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADAudioSessionCoordinator acquireAudioSessionAssertionWithContext:relinquishmentHandler:]( audioSessionCoordinator,  "acquireAudioSessionAssertionWithContext:relinquishmentHandler:",  v10,  0LL));

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10032099C;
  block[3] = &unk_1004FDA30;
  void block[4] = self;
  id v17 = v9;
  id v18 = v11;
  id v19 = v7;
  id v13 = v7;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(queue, block);
}

- (void)_prepareAudioSystemWithContext:(id)a3 audioSessionAssertion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v55 = a5;
  id v10 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    __int16 v12 = v10;
    id v13 = sub_10031DA50(speechState);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 136315650;
    int v92 = "-[ADSpeechManager _prepareAudioSystemWithContext:audioSessionAssertion:completion:]";
    __int16 v93 = 2112;
    unint64_t v94 = (unint64_t)v8;
    __int16 v95 = 2112;
    v96 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Begin preparing audio system with context %@. (unsigned int speechState = %@)",  buf,  0x20u);
  }

  self->_BOOL isReleaseAudioSessionRequired = 1;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 speechRequestOptions]);
  uint64_t v16 = AFAnalyticsContextCreateWithSpeechRequestOptions(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v90[0] = v17;
  v88[0] = @"reason";
  uint64_t Name = AFSetAudioSessionActiveReasonGetName([v8 reason]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(Name);
  v88[1] = @"options";
  v89[0] = v19;
  uint64_t Names = AFSetAudioSessionActiveOptionsGetNames([v8 options]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(Names);
  v89[1] = v21;
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  2LL));
  v90[1] = v22;
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 2LL));
  uint64_t v24 = AFAnalyticsContextsMerge();
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  int v26 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v26 logEventWithType:244 context:v25 contextNoCopy:1];

  ++self->_prepareAudioSystemTransactionCount;
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _speechRecorder](self, "_speechRecorder"));
  id v28 = objc_alloc(&OBJC_CLASS___AFOneArgumentSafetyBlock);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_10031F3C4;
  v82[3] = &unk_1004FBCF0;
  v82[4] = self;
  id v29 = v27;
  id v83 = v29;
  id v30 = v8;
  id v84 = v30;
  id v58 = v9;
  id v85 = v58;
  id v57 = v25;
  id v86 = v57;
  id v56 = v55;
  id v87 = v56;
  int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 27LL));
  id v32 = [v28 initWithBlock:v82 defaultValue:v31];

  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_10031F9A4;
  v81[3] = &unk_1004FBD40;
  v81[4] = self;
  int64_t v33 = objc_retainBlock(v81);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_10031FB50;
  v79[3] = &unk_1004FBDB8;
  v79[4] = self;
  id v34 = v29;
  id v80 = v34;
  uint64_t v35 = objc_retainBlock(v79);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_10031FD30;
  v75[3] = &unk_1004FBDE0;
  id v36 = v30;
  id v76 = v36;
  v77 = self;
  id v37 = v34;
  id v78 = v37;
  v38 = objc_retainBlock(v75);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_100320094;
  v67[3] = &unk_1004FBE30;
  id v39 = v36;
  id v68 = v39;
  id v40 = v37;
  id v69 = v40;
  v70 = self;
  v41 = v33;
  id v72 = v41;
  v42 = v35;
  id v73 = v42;
  objc_super v43 = v38;
  id v74 = v43;
  id v44 = v32;
  id v71 = v44;
  uint64_t v45 = objc_retainBlock(v67);
  if (sub_10033C888(self->_instanceContext))
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue([v39 speechRequestOptions]);
    id v47 = [v46 smartSiriVolumeTTSType];

    if (v47 == (id)5)
    {
      uint64_t v48 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        int v92 = "-[ADSpeechManager _prepareAudioSystemWithContext:audioSessionAssertion:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "%s Received TTSTypeDropInCallAnnouncement, force fetching SSV.",  buf,  0xCu);
      }

      -[ADSpeechManager _fetchSmartSiriVolumeForType:forceFetch:]( self,  "_fetchSmartSiriVolumeForType:forceFetch:",  5LL,  1LL);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472LL;
      v65[2] = sub_100320224;
      v65[3] = &unk_1004FC838;
      v66 = v45;
      -[ADSpeechManager _updateSiriOutputVolume:completion:](self, "_updateSiriOutputVolume:completion:", 1LL, v65);
      v49 = v66;
      goto LABEL_14;
    }

    unint64_t dirtySiriOutputVolumeHostTime = self->_dirtySiriOutputVolumeHostTime;
    if (!dirtySiriOutputVolumeHostTime)
    {
      -[ADSpeechManager _fetchSmartSiriVolume:](self, "_fetchSmartSiriVolume:", 0LL);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_1003203CC;
      v59[3] = &unk_1004FC838;
      id v60 = v45;
      -[ADSpeechManager _updateSiriOutputVolume:completion:](self, "_updateSiriOutputVolume:completion:", 0LL, v59);
      v49 = v60;
LABEL_14:

      goto LABEL_15;
    }

    id v54 = v40;
    uint64_t v51 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v92 = "-[ADSpeechManager _prepareAudioSystemWithContext:audioSessionAssertion:completion:]";
      __int16 v93 = 2048;
      unint64_t v94 = dirtySiriOutputVolumeHostTime;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_INFO,  "%s Begin waiting for Siri output volume to update after host time %llu...",  buf,  0x16u);
    }

    uint64_t v52 = mach_absolute_time();
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _volumeService](self, "_volumeService"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_100320230;
    v61[3] = &unk_1004FBE58;
    unint64_t v63 = dirtySiriOutputVolumeHostTime;
    uint64_t v64 = v52;
    v61[4] = self;
    v62 = v45;
    [v53 waitUntilSiriOutputVolumeUpdatesAfterTimestamp:dirtySiriOutputVolumeHostTime withTimeout:v61 block:1.0];

    id v40 = v54;
  }

  else
  {
    ((void (*)(void *))v45[2])(v45);
  }

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031F3B8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setClientConfiguration:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031F370;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isCapturing
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10031F350;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isStopped
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10031F334;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)startSpeechCaptureForRequestWithOptions:(id)a3 sessionUUID:(id)a4 language:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10031F2B0;
  id v18 = &unk_1004FD968;
  id v19 = self;
  id v20 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  dispatch_async(queue, &v15);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ADSpeechManager _startFixedPriorityCaptureForMode:options:sessionUUID:]( self,  "_startFixedPriorityCaptureForMode:options:sessionUUID:",  1LL,  v12,  v11,  v15,  v16,  v17,  v18,  v19));

  return v13;
}

- (id)startSpeechCaptureForDictationWithOptions:(id)a3 sessionUUID:(id)a4 secureOfflineOnly:(BOOL)a5
{
  BOOL v5 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031F27C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  id v9 = a4;
  id v10 = a3;
  dispatch_async(queue, block);
  id v11 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[ADSpeechManager startSpeechCaptureForDictationWithOptions:sessionUUID:secureOfflineOnly:]";
    __int16 v18 = 1024;
    BOOL v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s secureOfflineOnly is %d", buf, 0x12u);
  }

  if (v5) {
    uint64_t v12 = 3LL;
  }
  else {
    uint64_t v12 = 2LL;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ADSpeechManager _startFixedPriorityCaptureForMode:options:sessionUUID:]( self,  "_startFixedPriorityCaptureForMode:options:sessionUUID:",  v12,  v10,  v9));

  return v13;
}

- (void)startAcousticIDCaptureWithOptions:(id)a3 sessionUUID:(id)a4
{
  id v4 =  -[ADSpeechManager _startFixedPriorityCaptureForMode:options:sessionUUID:]( self,  "_startFixedPriorityCaptureForMode:options:sessionUUID:",  4LL,  a3,  a4);
}

- (id)_startFixedPriorityCaptureForMode:(int64_t)a3 options:(id)a4 sessionUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 startContext]);
  [v10 logEventWithType:301 context:v11];

  uint64_t v12 = objc_alloc(&OBJC_CLASS___CSSiriSpeechRecordingContext);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 turnIdentifier]);
  id v14 = -[CSSiriSpeechRecordingContext initWithSessionUUID:turnIdentifier:]( v12,  "initWithSessionUUID:turnIdentifier:",  v9,  v13);

  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10031F230;
  v21[3] = &unk_1004FD510;
  int64_t v24 = a3;
  v21[4] = self;
  id v22 = v8;
  uint64_t v16 = v14;
  BOOL v23 = v16;
  id v17 = v8;
  dispatch_async(queue, v21);
  __int16 v18 = v23;
  BOOL v19 = v16;

  return v19;
}

- (void)_startCaptureForMode:(int64_t)a3 options:(id)a4 context:(id)a5
{
  id v8 = (NSString *)a4;
  id v9 = a5;
  id v10 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v75 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
    __int16 v76 = 2048;
    *(void *)v77 = a3;
    *(_WORD *)&v77[8] = 2112;
    id v78 = v8;
    __int16 v79 = 2112;
    id v80 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s mode = %zd, options = %@, context = %@",  buf,  0x2Au);
  }

  unsigned int speechState = self->_speechState;
  if (speechState)
  {
    uint64_t v12 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      id v47 = v12;
      id v48 = sub_10031DA50(speechState);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      *(_DWORD *)buf = 136315394;
      v75 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
      __int16 v76 = 2114;
      *(void *)v77 = v49;
      _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%s Asked to start recording when we're already in state %{public}@",  buf,  0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADSpeechManager _badStateError](&OBJC_CLASS___ADSpeechManager, "_badStateError"));
    [WeakRetained speechManager:self didFailWithError:v14 context:v9];
    goto LABEL_68;
  }

  self->_shouldTalkToDelegate = 1;
  self->_hasReceivedLastAudioBuffer = 0;
  self->_capturingMode = a3;
  objc_storeStrong((id *)&self->_capturingContext, a5);
  -[ADSpeechManager _updateAudioDeviceInfo:](self, "_updateAudioDeviceInfo:", 0LL);
  -[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:](self, "_updateRecordRoute:andDeviceIdentifier:", 0LL, 0LL);
  *(_WORD *)&self->_BOOL isReleaseAudioSessionRequired = 1;
  self->_releasesAudioSessionWhenRecordingStopped = 0;
  self->_releasesAudioSessionWhenPrepareAudioSystemDone = 0;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _speechRecorder](self, "_speechRecorder"));
  objc_storeStrong((id *)&self->_currentCapturing, v15);
  uint64_t v16 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    currentCapturing = self->_currentCapturing;
    *(_DWORD *)buf = 136315394;
    v75 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
    __int16 v76 = 2112;
    *(void *)v77 = currentCapturing;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Speech capturing set to %@.", buf, 0x16u);
  }

  [v15 prepareForMode:a3 withOptions:v8];
  unint64_t v18 = (unint64_t)-[NSString activationEvent](v8, "activationEvent");
  if (AFSpeechEventIsBluetooth(v18))
  {
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[ADBluetoothManager sharedInstance](&OBJC_CLASS___ADBluetoothManager, "sharedInstance"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString activationDeviceIdentifier](v8, "activationDeviceIdentifier"));
    [v19 prewarmDeviceWithIdentifier:v20];
  }

  if (-[NSString isMediaPlaying](v8, "isMediaPlaying"))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _volumeService](self, "_volumeService"));
    [v21 _mediaPlaybackVolume];
    float v23 = v22;

    int64_t v24 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v75 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
      __int16 v76 = 2048;
      *(double *)v77 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s mediaPlaybackVolume = %f", buf, 0x16u);
    }

    *(float *)&double v25 = v23;
    -[NSString setMediaPlaybackVolume:](v8, "setMediaPlaybackVolume:", v25);
  }

  uint64_t IsTVRemote = AFSpeechEventIsTVRemote(v18);
  char v27 = IsTVRemote;
  if ((_DWORD)IsTVRemote) {
    uint64_t IsTVRemote = (uint64_t)-[ADSpeechManager _updateCapturingStateWithOptions:]( self,  "_updateCapturingStateWithOptions:",  v8);
  }
  if ((unint64_t)(a3 - 1) > 1
    || (uint64_t IsTVRemote = AFIsNano(IsTVRemote), (IsTVRemote & 1) != 0)
    || v18 <= 0x10 && ((1LL << v18) & 0x18900) != 0)
  {
    if ((v27 & 1) != 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue([v15 recordingInfoForPreheatWithEvent:v18]);
  -[ADSpeechManager _tellDelegateSpeechShouldPreheatWithRecordingInfo:]( self,  "_tellDelegateSpeechShouldPreheatWithRecordingInfo:",  v50);

  if ((v27 & 1) == 0) {
LABEL_22:
  }
    uint64_t IsTVRemote = (uint64_t)-[ADSpeechManager _updateCapturingStateWithOptions:]( self,  "_updateCapturingStateWithOptions:",  v8);
LABEL_23:
  uint64_t v28 = AFIsATVOnly(IsTVRemote);
  int v29 = v28;
  if (a3 == 3)
  {
    unsigned int v30 = -[AFDictationOptions forceOfflineRecognition]( self->_dictationOptions,  "forceOfflineRecognition");
    int64_t v31 = (id *)&CoreEmbeddedSpeechRecognizerTaskDictation;
    if (!v30) {
      int64_t v31 = (id *)&CoreEmbeddedSpeechRecognizerTaskTshot;
    }
    objc_storeStrong((id *)&self->_localSpeechRecognizerTask, *v31);
    if (!v29) {
      goto LABEL_56;
    }
    uint64_t v32 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode(self->_primaryDictationLanguage);
    int64_t v33 = (NSString *)objc_claimAutoreleasedReturnValue(v32);
    if (v33)
    {
      id v34 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        primaryDictationLanguage = self->_primaryDictationLanguage;
        *(_DWORD *)buf = 136315650;
        v75 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
        __int16 v76 = 2112;
        *(void *)v77 = primaryDictationLanguage;
        *(_WORD *)&v77[8] = 2112;
        id v78 = v33;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Mapped %@ to %@", buf, 0x20u);
      }

      objc_storeStrong((id *)&self->_primaryDictationLanguage, v33);
    }

- (void)startRecordedDictationCaptureWithSessionUUID:(id)a3 narrowband:(BOOL)a4 secureOfflineOnly:(BOOL)a5
{
  id v8 = a3;
  id v9 = -[CSSiriSpeechRecordingContext initWithSessionUUID:turnIdentifier:]( objc_alloc(&OBJC_CLASS___CSSiriSpeechRecordingContext),  "initWithSessionUUID:turnIdentifier:",  v8,  0LL);

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031EA34;
  block[3] = &unk_1004FBEA8;
  void block[4] = self;
  id v13 = v9;
  BOOL v14 = a5;
  BOOL v15 = a4;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)addRecordedDictationAudioSampleData:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031E9F4;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startSpeechCaptureWithURL:(id)a3 isNarrowBand:(BOOL)a4 isDictation:(BOOL)a5 sessionUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = -[CSSiriSpeechRecordingContext initWithSessionUUID:turnIdentifier:]( objc_alloc(&OBJC_CLASS___CSSiriSpeechRecordingContext),  "initWithSessionUUID:turnIdentifier:",  v11,  0LL);

  queue = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10031E6A0;
  v16[3] = &unk_1004FBED0;
  v16[4] = self;
  id v17 = v12;
  BOOL v19 = a5;
  id v18 = v10;
  BOOL v20 = a4;
  id v14 = v10;
  BOOL v15 = v12;
  dispatch_async(queue, v16);
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v5 logEventWithType:304 context:0];

  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10031E320;
  v11[3] = &unk_1004FC4D0;
  v11[4] = self;
  BOOL v12 = a3;
  id v7 = v11;
  id v8 = queue;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031DD14;
  block[3] = &unk_1004FD990;
  dispatch_semaphore_t v14 = v9;
  id v15 = v7;
  id v10 = v9;
  dispatch_async(v8, block);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)stopSpeechCaptureWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stopContext]);
  [v5 logEventWithType:305 context:v6];

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10031E314;
  v13[3] = &unk_1004FD968;
  v13[4] = self;
  id v14 = v4;
  id v8 = v13;
  dispatch_semaphore_t v9 = queue;
  id v10 = v4;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031DD14;
  block[3] = &unk_1004FD990;
  dispatch_semaphore_t v16 = v11;
  id v17 = v8;
  BOOL v12 = v11;
  dispatch_async(v9, block);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)stopSpeechCaptureIfFingerprintingOnlyWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v5 logEventWithType:305 context:0];

  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10031E2F4;
  v12[3] = &unk_1004FD968;
  v12[4] = self;
  id v13 = v4;
  id v7 = v12;
  id v8 = queue;
  id v9 = v4;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031DD14;
  block[3] = &unk_1004FD990;
  dispatch_semaphore_t v15 = v10;
  id v16 = v7;
  dispatch_semaphore_t v11 = v10;
  dispatch_async(v8, block);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_stopSpeechCaptureWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activationEvent];
  id v6 = [v4 suppressStopAlert];
  id v7 = [v4 stopRecordingHostTime];
  unsigned int speechState = self->_speechState;
  if (speechState == 1)
  {
    dispatch_semaphore_t v11 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int64_t v24 = "-[ADSpeechManager _stopSpeechCaptureWithOptions:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Recording started stopping in record start completion",  buf,  0xCu);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10031E1C0;
    v18[3] = &unk_1004FBEF8;
    BOOL v19 = self;
    id v20 = v5;
    char v22 = (char)v6;
    id v21 = v7;
    BOOL v12 = v19;
    id v13 = objc_retainBlock(v18);
    id recordStartedCompletion = v12->_recordStartedCompletion;
    v12->_id recordStartedCompletion = v13;

    goto LABEL_9;
  }

  if (speechState != 2)
  {
    dispatch_semaphore_t v15 = (void *)AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    BOOL v12 = v15;
    id v16 = sub_10031DA50(speechState);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 136315394;
    int64_t v24 = "-[ADSpeechManager _stopSpeechCaptureWithOptions:]";
    __int16 v25 = 2114;
    int v26 = v17;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%s Error: asked to stop when we're in state %{public}@",  buf,  0x16u);

LABEL_9:
    goto LABEL_11;
  }

  id v9 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int64_t v24 = "-[ADSpeechManager _stopSpeechCaptureWithOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Stopping speech capture", buf, 0xCu);
  }

  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _currentSpeechCaptureSource](self, "_currentSpeechCaptureSource"));
  [v10 stopSpeechCaptureForEvent:v5 suppressAlert:v6 hostTime:v7];

  -[ADSpeechManager _updateSpeechState:](self, "_updateSpeechState:", 3LL);
LABEL_11:
  if (v4) {
    -[ADSpeechManager _updateCapturingStateWithOptions:](self, "_updateCapturingStateWithOptions:", v4);
  }
}

- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10031E1AC;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)endSession
{
  char v3 = (os_log_s *)AFSiriLogContextSpeech;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
  if (v4)
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADSpeechManager endSession]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  if (AFIsHorseman(v4))
  {
    -[ADSpeechManager endSession:completion:](self, "endSession:completion:", 0LL, 0LL);
  }

  else
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10031DD4C;
    v10[3] = &unk_1004FD940;
    void v10[4] = self;
    id v6 = v10;
    id v7 = queue;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    BOOL v12 = sub_10031DD14;
    id v13 = &unk_1004FD990;
    dispatch_semaphore_t v14 = v8;
    id v15 = v6;
    id v9 = v8;
    dispatch_async(v7, &buf);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }

- (void)endSession:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADSpeechManager endSession:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s onlyIfIdle = %d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  if (v4)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10031DD0C;
    v15[3] = &unk_1004FD940;
    void v15[4] = self;
    id v9 = v15;
    dispatch_semaphore_t v10 = queue;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    *(void *)__int128 buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10031DD14;
    id v17 = &unk_1004FD990;
    dispatch_semaphore_t v18 = v11;
    id v19 = v9;
    BOOL v12 = v11;
    dispatch_async(v10, buf);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    if (v6) {
      v6[2](v6);
    }
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10031DD40;
    block[3] = &unk_1004FD990;
    void block[4] = self;
    dispatch_semaphore_t v14 = v6;
    dispatch_async(queue, block);
  }
}

- (void)_cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    id v7 = v5;
    id v8 = sub_10031DA50(speechState);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)__int128 buf = 136315394;
    int64_t v31 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
    __int16 v32 = 2112;
    int64_t v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s state = %@", buf, 0x16u);
  }

  dispatch_semaphore_t v10 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10031DAE8;
  v28[3] = &unk_1004FBF20;
  id v11 = v4;
  id v29 = v11;
  BOOL v12 = -[AFSafetyBlock initWithBlock:](v10, "initWithBlock:", v28);
  objc_initWeak(&location, self);
  int v13 = self->_speechState;
  if ((v13 - 3) < 2)
  {
    id v17 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      int64_t v31 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Stopping, waiting for did stop to release session",  buf,  0xCu);
    }

    self->_releasesAudioSessionWhenRecordingStopped = 1;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10031DCFC;
    v20[3] = &unk_1004FD940;
    id v21 = v12;
    -[ADSpeechManager _addRecordStoppedCompletion:](self, "_addRecordStoppedCompletion:", v20);
  }

  else if (v13 == 2)
  {
    dispatch_semaphore_t v18 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      int64_t v31 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Recording, stopping record to release session",  buf,  0xCu);
    }

    self->_releasesAudioSessionWhenRecordingStopped = 1;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10031DCF4;
    v22[3] = &unk_1004FD940;
    float v23 = v12;
    -[ADSpeechManager _addRecordStoppedCompletion:](self, "_addRecordStoppedCompletion:", v22);
    -[ADSpeechManager _cancelRecordingWithError:suppressAlert:]( self,  "_cancelRecordingWithError:suppressAlert:",  0LL,  1LL);
  }

  else if (v13 == 1)
  {
    dispatch_semaphore_t v14 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      int64_t v31 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Started, waiting for did start to stop recording then release session",  buf,  0xCu);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10031DBAC;
    v24[3] = &unk_1004FBF48;
    objc_copyWeak(&v26, &location);
    __int16 v25 = v12;
    id v15 = objc_retainBlock(v24);
    id recordStartedCompletion = self->_recordStartedCompletion;
    self->_id recordStartedCompletion = v15;

    objc_destroyWeak(&v26);
  }

  else
  {
    id v19 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315138;
      int64_t v31 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s Asking AVVoiceController to release its audio session now",  buf,  0xCu);
    }

    -[ADSpeechManager _releaseSession](self, "_releaseSession");
    -[AFSafetyBlock invoke](v12, "invoke");
  }

  objc_destroyWeak(&location);
}

- (BOOL)_endSessionIfIdle
{
  int speechState = self->_speechState;
  id v4 = (os_log_s *)AFSiriLogContextSpeech;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
  if (speechState)
  {
    if (v5)
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _endSessionIfIdle]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s but we're NOT idle", (uint8_t *)&v7, 0xCu);
    }
  }

  else
  {
    if (v5)
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _endSessionIfIdle]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s and we're idle", (uint8_t *)&v7, 0xCu);
    }

    -[ADSpeechManager _releaseSession](self, "_releaseSession");
  }

  return speechState == 0;
}

- (void)suppressAudioInterruptionEndedNotificationsAndEndSessionIfIdle:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031D96C;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deactivateAudioSessionIfNoActiveAssertions
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031D84C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setFingerprintWasRecognized
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031D840;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)suspendAutomaticEndpointingInRange:(AFTimeRange)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031D800;
  block[3] = &unk_1004FBF70;
  void block[4] = self;
  AFTimeRange v5 = a3;
  dispatch_async(queue, block);
}

- (void)updateASRFeatures:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031D7C0;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateOptionsAfterRecognitionForElapsedTime:(double)a3 isFinal:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031D7A8;
  block[3] = &unk_1004FBF98;
  void block[4] = self;
  *(double *)&void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10031D764;
  v13[3] = &unk_1004FBFC0;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)enforcePreviousEndpointHint
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031D734;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)setSpeechRecognizedContext:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031D670;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)playRecordingStartAlert
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10031D640;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateSpeechOptions:(id)a3
{
  id v4 = a3;
  AFTimeRange v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v5 logEventWithType:303 context:0];

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10031D634;
  v8[3] = &unk_1004FD968;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)stopFingerprintingForSuccess:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10031D5E0;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)getLastStartpointTimestampAndCurrentTime:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031D5A0;
  v7[3] = &unk_1004FD990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031D560;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setEndpointerThreshold:(double)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10031D520;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setEndpointerDelayedTrigger:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10031D4E0;
  v4[3] = &unk_1004FC4D0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_addRecordStoppedCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id recordStoppedCompletion = self->_recordStoppedCompletion;
    if (recordStoppedCompletion)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10031D4B0;
      v11[3] = &unk_1004FBFE8;
      id v12 = objc_retainBlock(recordStoppedCompletion);
      id v13 = v4;
      id v6 = v12;
      id v7 = objc_retainBlock(v11);
      id v8 = self->_recordStoppedCompletion;
      self->_id recordStoppedCompletion = v7;
    }

    else
    {
      id v9 = objc_retainBlock(v4);
      id v10 = self->_recordStoppedCompletion;
      self->_id recordStoppedCompletion = v9;
    }
  }
}

- (void)setEARLanguageDetectorSpeechRequestId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031D45C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_supportsVolumeService
{
  else {
    return AFDeviceSupportsTTS();
  }
}

- (id)_volumeService
{
  if (!-[ADSpeechManager _supportsVolumeService](self, "_supportsVolumeService")) {
    return 0LL;
  }
  volumeService = self->_volumeService;
  if (!volumeService)
  {
    id v4 = -[ADVolumeService initWithQueue:instanceContext:speechController:]( objc_alloc(&OBJC_CLASS___ADVolumeService),  "initWithQueue:instanceContext:speechController:",  self->_queue,  self->_instanceContext,  self->_speechController);
    BOOL v5 = self->_volumeService;
    self->_volumeService = v4;

    -[ADVolumeService setClientConfiguration:]( self->_volumeService,  "setClientConfiguration:",  self->_clientConfiguration);
    *(_WORD *)&self->_hasFetchedSmartSiriVolume = 0;
    self->_unint64_t dirtySiriOutputVolumeHostTime = 0LL;
    id v6 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      id v9 = "-[ADSpeechManager _volumeService]";
      __int16 v10 = 1024;
      int v11 = 0;
      __int16 v12 = 1024;
      int v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s hasFetchedSmartSiriVolume = %d, hasUpdatedSiriOutputVolume = %d",  (uint8_t *)&v8,  0x18u);
    }

    volumeService = self->_volumeService;
  }

  return volumeService;
}

- (void)_fetchSmartSiriVolume:(BOOL)a3
{
}

- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3 forceFetch:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL hasFetchedSmartSiriVolume = self->_hasFetchedSmartSiriVolume;
    int v15 = 136315906;
    BOOL v16 = "-[ADSpeechManager _fetchSmartSiriVolumeForType:forceFetch:]";
    __int16 v17 = 1024;
    BOOL v18 = hasFetchedSmartSiriVolume;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s BOOL hasFetchedSmartSiriVolume = %d, forType = %lu, forceFetch = %d",  (uint8_t *)&v15,  0x22u);
  }

  if (!self->_hasFetchedSmartSiriVolume || v4)
  {
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _volumeService](self, "_volumeService"));
    int v11 = v10;
    if (v10)
    {
      *(_WORD *)&self->_BOOL hasFetchedSmartSiriVolume = 1;
      [v10 fetchSmartSiriVolumeForType:a3];
      __int16 v12 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        BOOL v13 = self->_hasFetchedSmartSiriVolume;
        BOOL hasUpdatedSiriOutputVolume = self->_hasUpdatedSiriOutputVolume;
        int v15 = 136315650;
        BOOL v16 = "-[ADSpeechManager _fetchSmartSiriVolumeForType:forceFetch:]";
        __int16 v17 = 1024;
        BOOL v18 = v13;
        __int16 v19 = 1024;
        LODWORD(v20) = hasUpdatedSiriOutputVolume;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s BOOL hasFetchedSmartSiriVolume = %d, hasUpdatedSiriOutputVolume = %d",  (uint8_t *)&v15,  0x18u);
      }
    }
  }

- (void)_updateSiriOutputVolume:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL hasUpdatedSiriOutputVolume = self->_hasUpdatedSiriOutputVolume;
    *(_DWORD *)__int128 buf = 136315650;
    int v15 = "-[ADSpeechManager _updateSiriOutputVolume:completion:]";
    __int16 v16 = 1024;
    BOOL v17 = hasUpdatedSiriOutputVolume;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s BOOL hasUpdatedSiriOutputVolume = %d, forceUpdate = %d",  buf,  0x18u);
  }

  if (self->_hasUpdatedSiriOutputVolume && !v4)
  {
    BOOL v11 = 0;
    if (!v6) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _volumeService](self, "_volumeService"));
  BOOL v11 = v10 != 0LL;
  if (v10)
  {
    self->_BOOL hasUpdatedSiriOutputVolume = 1;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10031D384;
    v12[3] = &unk_1004FC010;
    v12[4] = self;
    BOOL v13 = v6;
    [v10 updateSiriOutputVolume:v4 completion:v12];
  }

  if (v6)
  {
LABEL_12:
    if (!v11) {
      v6[2](v6);
    }
  }

- (void)adjustSiriOutputVolumeForRouteIfNeeded:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10031D00C;
  v7[3] = &unk_1004FD968;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_getAdjustedSiriOutputVolumeLevelForAudioRoute:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADSpeechManager _volumeService](self, "_volumeService"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 routeName]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10031C84C;
  v12[3] = &unk_1004FC0D0;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v8 getSiriOutputVolumeForAudioRoute:v10 withName:v9 completion:v12];
}

- (AFAudioSessionAssertionAcquisitionService)audioSessionAssertionAcquisitionService
{
  return (AFAudioSessionAssertionAcquisitionService *)self->_audioSessionCoordinator;
}

- (void)asrBridgeReceivedEagerRecognitionCandidate:(id)a3 rawRecognitionResult:(id)a4 duration:(double)a5 sessionUUID:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  if (+[AFFeatureFlags isSiriRequestDispatcherEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriRequestDispatcherEnabled"))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10031C74C;
    block[3] = &unk_1004FD4C0;
    void block[4] = self;
    id v12 = v8;
    id v13 = v9;
    dispatch_async(queue, block);
  }
}

- (void)asrBridgeReceivedFinalResult:(id)a3 speechPackage:(id)a4 sessionUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (+[AFFeatureFlags isSiriRequestDispatcherEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriRequestDispatcherEnabled"))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10031C650;
    block[3] = &unk_1004FD4C0;
    void block[4] = self;
    id v11 = v7;
    id v12 = v8;
    dispatch_async(queue, block);
  }
}

- (void)asrBridgeReceivedPartialResult:(id)a3 language:(id)a4 tokens:(id)a5
{
  id v6 = a5;
  if (+[AFFeatureFlags isSiriRequestDispatcherEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isSiriRequestDispatcherEnabled"))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10031C528;
    v8[3] = &unk_1004FD968;
    void v8[4] = self;
    id v9 = v6;
    dispatch_async(queue, v8);
  }
}

- (NSString)initialDictationLanguage
{
  return self->_initialDictationLanguage;
}

- (void)setInitialDictationLanguage:(id)a3
{
}

- (NSString)primaryDictationLanguage
{
  return self->_primaryDictationLanguage;
}

- (void)setPrimaryDictationLanguage:(id)a3
{
}

- (NSArray)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setDictationLanguages:(id)a3
{
}

- (AFDictationOptions)dictationOptions
{
  return self->_dictationOptions;
}

- (void)setDictationOptions:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)isDriving
{
  return self->_isDriving;
}

- (void)setIsDriving:(BOOL)a3
{
  self->_isDriving = a3;
}

- (NSArray)inlineItemList
{
  return self->_inlineItemList;
}

- (void)setInlineItemList:(id)a3
{
}

- (AFAudioPowerUpdater)audioPowerUpdater
{
  return self->_audioPowerUpdater;
}

- (ADAudioSessionCoordinator)audioSessionCoordinator
{
  return self->_audioSessionCoordinator;
}

- (CSAudioSessionController)audioSessionController
{
  return self->_audioSessionController;
}

- (CSSiriAudioPlaybackService)audioPlaybackService
{
  return self->_audioPlaybackService;
}

- (void).cxx_destruct
{
}

+ (id)_ADSpeechManagerLowPriorityDispatchQueue
{
  v2 = (void *)qword_1005785D8;
  if (!qword_1005785D8)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.siri.ADSpeechManager.lowPrioritySerial", v6);
    id v8 = (void *)qword_1005785D8;
    qword_1005785D8 = (uint64_t)v7;

    v2 = (void *)qword_1005785D8;
  }

  return v2;
}

+ (id)_badStateError
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  205LL,  0LL);
}

+ (id)_speechCodecError
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  202LL,  0LL);
}

+ (id)sharedManager
{
  if (qword_1005785E0 != -1) {
    dispatch_once(&qword_1005785E0, &stru_1004FBBA8);
  }
  return (id)qword_1005785E8;
}

@end