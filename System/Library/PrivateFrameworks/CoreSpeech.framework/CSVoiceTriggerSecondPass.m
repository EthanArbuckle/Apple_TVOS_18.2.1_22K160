@interface CSVoiceTriggerSecondPass
+ (id)secondPassAudioLogDirectory;
+ (id)secondPassAudioLoggingFilePathWithDeviceId:(id)a3;
+ (id)stringForSecondPassResult:(unint64_t)a3;
+ (id)timeStampString;
- (BOOL)_isBuiltInFirstPassSource:(unint64_t)a3;
- (BOOL)_isFirstPassSourceExclave:(unint64_t)a3;
- (BOOL)_shouldLogMediaplayState:(unint64_t)a3;
- (BOOL)_usePHS;
- (BOOL)cancelSecondPassTrigger;
- (BOOL)didWakeAP;
- (BOOL)firstTimeAssetConfigured;
- (BOOL)hasLoggedSecondPass;
- (BOOL)hasTriggerCandidate;
- (BOOL)isAdBlockerMatchedBeforeSetResultCompletion;
- (BOOL)isPSRAudioFlushed;
- (BOOL)isStartSampleCountMarked;
- (BOOL)secondPassHasMadeDecision;
- (BOOL)shouldUsePHS;
- (BOOL)supportsMph;
- (CSAsset)currentAsset;
- (CSAudioCircularBuffer)audioBuffer;
- (CSAudioStream)audioStream;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSAudioTimeConverter)exclaveAudioTimeConverter;
- (CSExclaveSecondPassVoiceTriggerAnalyzing)exclaveClient;
- (CSPhraseDetector)phraseDetector;
- (CSPhraseNDEAPIScorer)phraseNDEAPIScorer;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSpeechManager)speechManager;
- (CSVTSecondPassLatencyMetrics)secondPassLatencyMetrics;
- (CSVoiceTriggerAwareZeroFilter)zeroFilter;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics;
- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3;
- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 speechManager:(id)a4 supportsMphDetection:(BOOL)a5 secondPassQueue:(id)a6;
- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 targetQueue:(id)a4;
- (CSVoiceTriggerSecondPassConfig)config;
- (NSDictionary)firstPassChannelSelectionScores;
- (NSMutableArray)assetConfigWaitingBuffer;
- (NSMutableDictionary)storedFirstPassInfo;
- (NSString)UUID;
- (NSString)audioProviderUUID;
- (NSString)currentLocale;
- (NSString)firstPassDeviceId;
- (NSUUID)secondPassCompleteWatchDogToken;
- (NSUUID)secondPassRejectionMHUUID;
- (OS_dispatch_queue)queue;
- (SSRSpeakerRecognitionContext)ssrContext;
- (SSRSpeakerRecognitionController)speakerRecognitionController;
- (double)cumulativeDowntime;
- (double)cumulativeUptime;
- (double)lastAggTime;
- (float)firstPassChannelSelectionDelaySeconds;
- (float)firstPassMasterChannelScoreBoost;
- (float)firstPassOnsetScore;
- (float)firstPassVoiceIsolationChannelScoreBoost;
- (float)mediaVolume;
- (float)phsRejectLoggingThreshold;
- (float)secondPassCompleteWatchDogTimeoutSec;
- (float)secondPassPrependingSec;
- (id)_fetchSiriLocale;
- (id)_getAudioTimeConverter;
- (id)_getExclaveAudioTimeConverter;
- (id)_getFirstPassTriggerSourceAsString:(unint64_t)a3;
- (id)_getVoiceTriggerInfoWithKeywordDetectorResult:(id)a3;
- (id)_runRecognizersWithChunk:(id)a3;
- (id)_voiceTriggerSecondPassLatencyMetrics;
- (id)resultCompletion;
- (int)modelFileDescriptor;
- (int64_t)mediaPlayingState;
- (os_unfair_lock_s)secondpassTriggerCancellationLock;
- (unint64_t)AOPVTTriggerLength;
- (unint64_t)activeChannel;
- (unint64_t)analyzerPrependingSamples;
- (unint64_t)analyzerTrailingSamples;
- (unint64_t)earlyDetectFiredMachTime;
- (unint64_t)extraSamplesAtStart;
- (unint64_t)firstPassFireHostTime;
- (unint64_t)firstPassOnsetChannel;
- (unint64_t)firstPassSource;
- (unint64_t)firstPassTriggerFireSampleCount;
- (unint64_t)firstPassTriggerStartSampleCount;
- (unint64_t)numAnalyzedSamples;
- (unint64_t)numProcessedSamples;
- (unint64_t)prewarmMmapedSize;
- (unint64_t)processedSampleCountsInPending;
- (unint64_t)secondPassAnalyzerStartSampleCount;
- (unint64_t)secondPassCheckerExecutionTime;
- (unint64_t)secondPassClient;
- (unint64_t)secondPassTimeout;
- (unint64_t)selectedChannelFromFirstPass;
- (unint64_t)timeBasedEstimatedTriggerLength;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4;
- (void)_addDeviceStatusInfoToDict:(id)a3;
- (void)_addLosingPhraseResultstoVTEI:(id)a3 withLosingPhraseResults:(id)a4;
- (void)_addPHSInfoToVTEI:(id)a3 fromSpeakerInfo:(id)a4 withThreshold:(float)a5;
- (void)_addRejectStatsToDict:(id)a3;
- (void)_analyzeForChannel:(unint64_t)a3 keywordDetectorResult:(id)a4 losingPhraseResults:(id)a5;
- (void)_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:(id)a3 completion:(id)a4;
- (void)_clearSecondPassCompletionWatchDog;
- (void)_clearTriggerCandidate;
- (void)_didStartAudioStream:(BOOL)a3;
- (void)_didStopAudioStream;
- (void)_getDidWakeAP:(id)a3;
- (void)_handleAudioChunk:(id)a3 shouldPreprocessedByZeroFilter:(BOOL)a4;
- (void)_handlePHSResults:(id)a3 voiceTriggerEventInfo:(id)a4 forPhId:(unint64_t)a5;
- (void)_handleResultCompletion:(unint64_t)a3 voiceTriggerInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5 error:(id)a6;
- (void)_handleSecondPassSuccess:(id)a3;
- (void)_handleVoiceTriggerFirstPassFromAOP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5;
- (void)_handleVoiceTriggerFirstPassFromAP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5;
- (void)_handleVoiceTriggerFirstPassFromExclave:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5;
- (void)_handleVoiceTriggerFirstPassFromHearst:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8;
- (void)_handleVoiceTriggerFirstPassFromHearstAP:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8;
- (void)_handleVoiceTriggerFirstPassFromJarvis:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7;
- (void)_handleVoiceTriggerFirstPassFromRemora:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7;
- (void)_initializeMediaPlayingState;
- (void)_logRejectionEventToSELF:(id)a3 result:(unint64_t)a4;
- (void)_logSecondPassResult:(unint64_t)a3 withVTEI:(id)a4;
- (void)_logUptimeWithVTSwitchChanged:(BOOL)a3 VTEnabled:(BOOL)a4;
- (void)_mmapModelForPreWarm;
- (void)_notifySecondPassReject:(id)a3 result:(unint64_t)a4 isSecondChanceCandidate:(BOOL)a5;
- (void)_prepareStartAudioStream;
- (void)_processSecondPassInExclave:(id)a3;
- (void)_reportDiagnosticsForDelayedVTLaunchIfNeeded:(float)a3;
- (void)_reportModelProcessingLatency;
- (void)_requestStartAudioStreamWitContext:(id)a3 audioProviderUUID:(id)a4 startStreamOption:(id)a5 completion:(id)a6;
- (void)_reset;
- (void)_resetStartAnalyzeTime;
- (void)_resetUpTime;
- (void)_resetVoiceTriggerLatencyMetrics;
- (void)_scheduleDidStartSecondPassCompletionWatchDogWithToken:(id)a3;
- (void)_scheduleSecondPassCompletionWatchDog;
- (void)_setAsset:(id)a3;
- (void)_setKeywordDetectorStartMachTime:(unint64_t)a3 detectorEndMachTime:(unint64_t)a4 lastAudioPacketAnalyzedMachTime:(unint64_t)a5;
- (void)_setStartAnalyzeTime:(unint64_t)a3;
- (void)_syncVoiceProfileEmbeddingsToExclave;
- (void)_unmapForPrewarmLoadedGraph;
- (void)_voiceTriggerFirstPassDidDetectKeywordFrom:(id)a3 completion:(id)a4;
- (void)adBlockerHasMatchWithVoiceTrigger:(BOOL)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7;
- (void)cancelCurrentRequest;
- (void)dealloc;
- (void)forceCancelSecondPassTrigger;
- (void)handleVoiceTriggerSecondPassFrom:(id)a3 completion:(id)a4;
- (void)prewarm;
- (void)prewarmModelGraph;
- (void)reset;
- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4;
- (void)setAOPVTTriggerLength:(unint64_t)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnalyzerPrependingSamples:(unint64_t)a3;
- (void)setAnalyzerTrailingSamples:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setAssetConfigWaitingBuffer:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioProviderUUID:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setCancelSecondPassTrigger:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setCumulativeDowntime:(double)a3;
- (void)setCumulativeUptime:(double)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentLocale:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidWakeAP:(BOOL)a3;
- (void)setEarlyDetectFiredMachTime:(unint64_t)a3;
- (void)setExclaveAudioTimeConverter:(id)a3;
- (void)setExclaveClient:(id)a3;
- (void)setExtraSamplesAtStart:(unint64_t)a3;
- (void)setFirstPassChannelSelectionDelaySeconds:(float)a3;
- (void)setFirstPassChannelSelectionScores:(id)a3;
- (void)setFirstPassDeviceId:(id)a3;
- (void)setFirstPassFireHostTime:(unint64_t)a3;
- (void)setFirstPassMasterChannelScoreBoost:(float)a3;
- (void)setFirstPassOnsetChannel:(unint64_t)a3;
- (void)setFirstPassOnsetScore:(float)a3;
- (void)setFirstPassSource:(unint64_t)a3;
- (void)setFirstPassTriggerFireSampleCount:(unint64_t)a3;
- (void)setFirstPassTriggerStartSampleCount:(unint64_t)a3;
- (void)setFirstPassVoiceIsolationChannelScoreBoost:(float)a3;
- (void)setFirstTimeAssetConfigured:(BOOL)a3;
- (void)setFirstpassMetrics:(id)a3;
- (void)setHasLoggedSecondPass:(BOOL)a3;
- (void)setHasTriggerCandidate:(BOOL)a3;
- (void)setIsAdBlockerMatchedBeforeSetResultCompletion:(BOOL)a3;
- (void)setIsPSRAudioFlushed:(BOOL)a3;
- (void)setIsStartSampleCountMarked:(BOOL)a3;
- (void)setLastAggTime:(double)a3;
- (void)setMediaPlayingState:(int64_t)a3;
- (void)setMediaVolume:(float)a3;
- (void)setModelFileDescriptor:(int)a3;
- (void)setNumAnalyzedSamples:(unint64_t)a3;
- (void)setNumProcessedSamples:(unint64_t)a3;
- (void)setPhraseDetector:(id)a3;
- (void)setPhraseNDEAPIScorer:(id)a3;
- (void)setPhsRejectLoggingThreshold:(float)a3;
- (void)setPrewarmMmapedSize:(unint64_t)a3;
- (void)setPrewarmModelGraph:(void *)a3;
- (void)setProcessedSampleCountsInPending:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setResultCompletion:(id)a3;
- (void)setSecondPassAnalyzerStartSampleCount:(unint64_t)a3;
- (void)setSecondPassCheckerExecutionTime:(unint64_t)a3;
- (void)setSecondPassClient:(unint64_t)a3;
- (void)setSecondPassCompleteWatchDogTimeoutSec:(float)a3;
- (void)setSecondPassCompleteWatchDogToken:(id)a3;
- (void)setSecondPassHasMadeDecision:(BOOL)a3;
- (void)setSecondPassLatencyMetrics:(id)a3;
- (void)setSecondPassPrependingSec:(float)a3;
- (void)setSecondPassRejectionMHUUID:(id)a3;
- (void)setSecondPassTimeout:(unint64_t)a3;
- (void)setSecondpassTriggerCancellationLock:(os_unfair_lock_s)a3;
- (void)setSelectedChannelFromFirstPass:(unint64_t)a3;
- (void)setShouldUsePHS:(BOOL)a3;
- (void)setSpeakerRecognitionController:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSsrContext:(id)a3;
- (void)setStoredFirstPassInfo:(id)a3;
- (void)setSupportsMph:(BOOL)a3;
- (void)setSupportsMultiPhraseDetection:(BOOL)a3;
- (void)setTimeBasedEstimatedTriggerLength:(unint64_t)a3;
- (void)setZeroFilter:(id)a3;
- (void)start;
- (void)voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:(id)a3 bestStartSampleCount:(unint64_t)a4 bestEndSampleCount:(unint64_t)a5;
- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5;
@end

@implementation CSVoiceTriggerSecondPass

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 speechManager:(id)a4 supportsMphDetection:(BOOL)a5 secondPassQueue:(id)a6
{
  BOOL v9 = a3;
  id v11 = a4;
  id v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerSecondPass;
  v13 = -[CSVoiceTriggerSecondPass init](&v34, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_speechManager, a4);
    if (v12)
    {
      v15 = (OS_dispatch_queue *)v12;
      queue = (dispatch_queue_s *)v14->_queue;
      v14->_queue = v15;
    }

    else
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
      queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_queue_t v18 = dispatch_queue_create_with_target_V2("VoiceTrigger Second Pass Queue", 0LL, queue);
      v19 = v14->_queue;
      v14->_queue = (OS_dispatch_queue *)v18;
    }

    v14->_firstPassSource = 0LL;
    v14->_shouldUsePHS = v9;
    v14->_numProcessedSamples = 0LL;
    v14->_numAnalyzedSamples = 0LL;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v14->_secondPassTimeout = (unint64_t)(float)(v20 * 3.0);
    v14->_secondPassCompleteWatchDogTimeoutSec = 20.0;
    -[CSVoiceTriggerSecondPass _clearTriggerCandidate](v14, "_clearTriggerCandidate");
    *(_OWORD *)&v14->_lastAggTime = 0u;
    *(_OWORD *)&v14->_cumulativeDowntime = 0u;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerEnabledMonitor sharedInstance]( &OBJC_CLASS___CSVoiceTriggerEnabledMonitor,  "sharedInstance"));
    [v21 addObserver:v14];

    -[CSVoiceTriggerSecondPass _initializeMediaPlayingState](v14, "_initializeMediaPlayingState");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 UUIDString]);
    UUID = v14->_UUID;
    v14->_UUID = (NSString *)v23;

    v14->_firstTimeAssetConfigured = 0;
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    assetConfigWaitingBuffer = v14->_assetConfigWaitingBuffer;
    v14->_assetConfigWaitingBuffer = (NSMutableArray *)v25;

    v14->_firstPassFireHostTime = 0LL;
    v14->_prewarmMmapedSize = 0LL;
    v14->_prewarmModelGraph = 0LL;
    v14->_supportsMph = a5;
    *(_WORD *)&v14->_isPSRAudioFlushed = 0;
    v14->_AOPVTTriggerLength = 0LL;
    v14->_timeBasedEstimatedTriggerLength = 0LL;
    if (+[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"))
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue( +[CSExclaveMessageHandlingFactory exclaveSecondPassVoiceTriggerAnalyzer]( &OBJC_CLASS___CSExclaveMessageHandlingFactory,  "exclaveSecondPassVoiceTriggerAnalyzer"));
      exclaveClient = v14->_exclaveClient;
      v14->_exclaveClient = (CSExclaveSecondPassVoiceTriggerAnalyzing *)v27;

      v29 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]";
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s Initializing Secure VoiceTriggerSecondPass",  buf,  0xCu);
      }

      -[CSExclaveSecondPassVoiceTriggerAnalyzing initializeSecondPass](v14->_exclaveClient, "initializeSecondPass");
    }

    v30 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](v14, "UUID"));
      *(_DWORD *)buf = 136315650;
      v36 = "-[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]";
      __int16 v37 = 2114;
      v38 = v32;
      __int16 v39 = 1024;
      BOOL v40 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:initialized with PHS : %d",  buf,  0x1Cu);
    }

    v14->_cancelSecondPassTrigger = 0;
    v14->_secondpassTriggerCancellationLock._os_unfair_lock_opaque = 0;
  }

  return v14;
}

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 targetQueue:(id)a4
{
  BOOL v4 = a3;
  dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("VoiceTrigger Second Pass Queue", 0LL, (dispatch_queue_t)a4);
  v7 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]( self,  "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:",  v4,  0LL,  0LL,  v6);

  return v7;
}

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3
{
  return -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]( self,  "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:",  a3,  0LL,  0LL,  0LL);
}

- (void)dealloc
{
  v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSVoiceTriggerSecondPass dealloc]";
    __int16 v9 = 2114;
    v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:deallocated",  buf,  0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerSecondPass;
  -[CSVoiceTriggerSecondPass dealloc](&v6, "dealloc");
}

- (void)setSpeechManager:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3970;
  block[3] = &unk_10022EFD0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(queue, block);
}

- (void)setSupportsMultiPhraseDetection:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A3818;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async_and_wait(queue, v4);
}

- (void)start
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v3 addObserver:self];
}

- (void)prewarm
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A376C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_mmapModelForPreWarm
{
  if (CSIsHorseman(self, a2))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPassConfig configPathRecognizer](self->_config, "configPathRecognizer"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSMil2BnnsUtils readBnnsIrFromModelConfig:modelType:]( &OBJC_CLASS___CSMil2BnnsUtils,  "readBnnsIrFromModelConfig:modelType:",  v3,  1LL));

    id v10 = 0LL;
    id v5 = +[CSUtils mmapWithFile:mappedSizeOut:](&OBJC_CLASS___CSUtils, "mmapWithFile:mappedSizeOut:", v4, &v10);
    id v6 = v10;
    v7 = v6;
    self->_prewarmModelGraph = v5;
    if (v6) {
      self->_unint64_t prewarmMmapedSize = (unint64_t)[v6 unsignedLongValue];
    }
    id v8 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t prewarmMmapedSize = self->_prewarmMmapedSize;
      *(_DWORD *)buf = 136315394;
      id v12 = "-[CSVoiceTriggerSecondPass _mmapModelForPreWarm]";
      __int16 v13 = 2048;
      unint64_t v14 = prewarmMmapedSize;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s mmap with model size: %lu", buf, 0x16u);
    }
  }

- (void)setFirstPassSource:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A3760;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setFirstPassDeviceId:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A3754;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setSecondPassClient:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A3724;
  block[3] = &unk_10022BEB0;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (id)_getAudioTimeConverter
{
  audioTimeConverter = self->_audioTimeConverter;
  if (!audioTimeConverter)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioStream](self, "audioStream"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 streamProvider]);
    id v6 = [v5 audioStreamId];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioTimeConverterPool sharedInstance](&OBJC_CLASS___CSAudioTimeConverterPool, "sharedInstance"));
    id v8 = (CSAudioTimeConverter *)objc_claimAutoreleasedReturnValue([v7 converterForAudioStreamId:v6]);
    __int16 v9 = self->_audioTimeConverter;
    self->_audioTimeConverter = v8;

    audioTimeConverter = self->_audioTimeConverter;
  }

  return audioTimeConverter;
}

- (id)_getExclaveAudioTimeConverter
{
  exclaveAudioTimeConverter = self->_exclaveAudioTimeConverter;
  if (!exclaveAudioTimeConverter)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioTimeConverterPool sharedInstance](&OBJC_CLASS___CSAudioTimeConverterPool, "sharedInstance"));
    id v5 = (CSAudioTimeConverter *)objc_claimAutoreleasedReturnValue([v4 defaultExclaveConverter]);
    id v6 = self->_exclaveAudioTimeConverter;
    self->_exclaveAudioTimeConverter = v5;

    exclaveAudioTimeConverter = self->_exclaveAudioTimeConverter;
  }

  return exclaveAudioTimeConverter;
}

- (id)_fetchSiriLocale
{
  if (self->_firstPassDeviceId && self->_secondPassClient == 5)
  {
    currentLocale = self->_currentLocale;
    if (!currentLocale)
    {
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithEndpointId:fallbackLanguage:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithEndpointId:fallbackLanguage:"));
      id v5 = self->_currentLocale;
      self->_currentLocale = v4;

      currentLocale = self->_currentLocale;
    }

    id v6 = currentLocale;
  }

  else
  {
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue( +[CSUtils getSiriLanguageWithFallback:]( &OBJC_CLASS___CSUtils,  "getSiriLanguageWithFallback:",  @"en-US"));
  }

  return v6;
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A371C;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  self->_isPSRAudioFlushed = 0;
  self->_numProcessedSamples = 0LL;
  self->_numAnalyzedSamples = 0LL;
  -[CSPhraseDetector reset](self->_phraseDetector, "reset");
  self->_processedSampleCountsInPending = 0LL;
  self->_secondPassCheckerExecutionTime = 0LL;
  -[CSVoiceTriggerSecondPass _resetStartAnalyzeTime](self, "_resetStartAnalyzeTime");
  self->_secondPassHasMadeDecision = 0;
  id v3 =  -[SSRSpeakerRecognitionController resetWithContext:]( self->_speakerRecognitionController,  "resetWithContext:",  self->_ssrContext);
  currentLocale = self->_currentLocale;
  self->_currentLocale = 0LL;

  self->_cancelSecondPassTrigger = 0;
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  id v7[2] = sub_1000A3710;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v5)
  {
    objc_super v34 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    v22 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
    __int16 v92 = 2114;
    unint64_t v93 = (unint64_t)v35;
    _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:asset is nil, stop initialization",  buf,  0x16u);

LABEL_35:
    goto LABEL_57;
  }

  objc_storeStrong((id *)&self->_currentAsset, a3);
  id v6 = (CSVoiceTriggerSecondPassConfig *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:]( &OBJC_CLASS___CSVoiceTriggerSecondPassConfigDecoder,  "decodeConfigFrom:forFirstPassSource:",  self->_currentAsset,  self->_firstPassSource));
  config = self->_config;
  self->_config = v6;

  -[CSVoiceTriggerSecondPassConfig preTriggerAudioTime](self->_config, "preTriggerAudioTime");
  float v9 = v8;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  self->_extraSamplesAtStart = (unint64_t)(float)(v9 * v10);
  -[CSVoiceTriggerSecondPassConfig prependingAudioTime](self->_config, "prependingAudioTime");
  float v12 = v11;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  self->_analyzerPrependingSamples = (unint64_t)(float)(v12 * v13);
  -[CSVoiceTriggerSecondPassConfig trailingAudioTime](self->_config, "trailingAudioTime");
  float v15 = v14;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  self->_analyzerTrailingSamples = (unint64_t)(float)(v15 * v16);
  -[CSVoiceTriggerSecondPassConfig prependingAudioTime](self->_config, "prependingAudioTime");
  self->_float secondPassPrependingSec = v17;
  if (!self->_phraseDetector)
  {
    dispatch_queue_t v18 = objc_alloc_init(&OBJC_CLASS___CSPhraseDetector);
    phraseDetector = self->_phraseDetector;
    self->_phraseDetector = v18;
  }

  float v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics]( self,  "_voiceTriggerSecondPassLatencyMetrics"));
  [v20 setSecondPassAssetLoadStartTime:mach_absolute_time()];

  -[CSPhraseDetector setConfig:](self->_phraseDetector, "setConfig:", self->_config);
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics]( self,  "_voiceTriggerSecondPassLatencyMetrics"));
  [v21 setSecondPassAssetLoadCompleteTime:mach_absolute_time()];

  if (!self->_firstTimeAssetConfigured)
  {
    self->_firstTimeAssetConfigured = 1;
    __int16 v39 = self->_config;
    if (v39)
    {
      unint64_t firstPassSource = self->_firstPassSource;
      if (firstPassSource == 12 || firstPassSource == 2)
      {
        unint64_t AOPVTTriggerLength = self->_AOPVTTriggerLength;
        if (AOPVTTriggerLength)
        {
          float v42 = (float)AOPVTTriggerLength;
          float secondPassPrependingSec = self->_secondPassPrependingSec;
          +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
          self->_secondPassTimeout = v45;
          v46 = (os_log_s *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
            __int16 v92 = 2048;
            unint64_t v93 = v45;
            _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%s AOP trigger length to override secondpass timeout: %lu",  buf,  0x16u);
          }

          __int16 v39 = self->_config;
        }

        if (-[CSVoiceTriggerSecondPassConfig useTimeBasedTriggerLength](v39, "useTimeBasedTriggerLength"))
        {
          unint64_t timeBasedEstimatedTriggerLength = self->_timeBasedEstimatedTriggerLength;
          if (timeBasedEstimatedTriggerLength)
          {
            float v48 = (float)timeBasedEstimatedTriggerLength;
            float v49 = self->_secondPassPrependingSec;
            +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
            unint64_t v51 = (unint64_t)(float)((float)(v48 + (float)(v49 * v50)) + (float)self->_analyzerTrailingSamples);
            self->_secondPassTimeout = v51;
            v52 = (os_log_s *)CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
              __int16 v92 = 2048;
              unint64_t v93 = v51;
              _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "%s Timebased trigger length to override secondpass timeout: %lu",  buf,  0x16u);
            }
          }
        }
      }
    }
  }

  if (!-[CSVoiceTriggerSecondPass _usePHS](self, "_usePHS"))
  {
    v36 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      *(_DWORD *)buf = 136315650;
      v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
      __int16 v92 = 2114;
      unint64_t v93 = (unint64_t)v38;
      __int16 v94 = 1026;
      LODWORD(v95) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Not creating SAT objects: usePHS %{public}d",  buf,  0x1Cu);
    }

    goto LABEL_56;
  }

  v22 = self->_currentAsset;
  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale"));
  if (!v23)
  {
    v53 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      v79 = v53;
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      *(_DWORD *)buf = 136315394;
      v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
      __int16 v92 = 2114;
      unint64_t v93 = (unint64_t)v80;
      _os_log_error_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get language code!!!",  buf,  0x16u);
    }

    -[CSVoiceTriggerSecondPass _reset](self, "_reset");
    goto LABEL_35;
  }

  v24 = (void *)v23;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
  uint64_t v26 = SSRSpeakerRecognitionSiriAppDomain;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( [v25 provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriAppDomain withLocale:v24]);

  if ([v27 count])
  {
    if ((unint64_t)[v27 count] >= 2)
    {
      v28 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        v83 = v28;
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        *(_DWORD *)buf = 136315906;
        v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
        __int16 v92 = 2114;
        unint64_t v93 = (unint64_t)v84;
        __int16 v94 = 2114;
        v95 = v24;
        __int16 v96 = 2114;
        v97 = v27;
        _os_log_error_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: More than one Siri voice profile present for %{public}@ - %{publi c}@, trigger cleanup",  buf,  0x2Au);
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
      [v29 triggerInvalidSiriProfileCleanupFromPersonalDevicesForLanguage:v24 appDomain:v26];
    }

    if ([v5 useSpeakerRecognitionAsset])
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSRAssetManager sharedManager](&OBJC_CLASS___SSRAssetManager, "sharedManager"));
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v31 installedSpeakerRecognitionAssetForLanguage:v24]);

      if (v32)
      {
        v33 = (os_log_s *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          __int16 v92 = 2112;
          unint64_t v93 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s Found speaker recognition asset:%@",  buf,  0x16u);
        }

        v22 = (os_log_s *)v32;
      }

      else
      {
        v22 = self->_currentAsset;
        v56 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          v57 = v56;
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
          *(_DWORD *)buf = 136315394;
          v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          __int16 v92 = 2114;
          unint64_t v93 = (unint64_t)v58;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Falling back to VT-assets",  buf,  0x16u);
        }
      }
    }

    v88[0] = SSRSpeakerRecognitionStyleKey;
    v88[1] = SSRSpeakerRecognitionAssetKey;
    v89[0] = &off_100238940;
    v89[1] = v22;
    v88[2] = SSRSpeakerRecognitionMaxAudioDurationSecs;
    LODWORD(v30) = 2.5;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v30));
    v89[2] = v59;
    v88[3] = SSRSpeakerRecognitionProfileArrayKey;
    v60 = (void *)objc_claimAutoreleasedReturnValue([v27 objectAtIndexedSubscript:0]);
    v87 = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v87, 1LL));
    v88[4] = SSRSpeakerRecognitionLocaleKey;
    v89[3] = v61;
    v89[4] = v24;
    v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  5LL));

    id v86 = 0LL;
    v63 = -[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]( objc_alloc(&OBJC_CLASS___SSRSpeakerRecognitionContext),  "initWithVoiceRecognitionContext:error:",  v62,  &v86);
    id v64 = v86;
    ssrContext = self->_ssrContext;
    self->_ssrContext = v63;

    if (!self->_ssrContext || v64)
    {
      v73 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        v74 = v73;
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        v76 = (void *)objc_claimAutoreleasedReturnValue([v64 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
        __int16 v92 = 2114;
        unint64_t v93 = (unint64_t)v75;
        __int16 v94 = 2112;
        v95 = v76;
        v77 = "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to create SSR context with error %@";
LABEL_52:
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, v77, buf, 0x20u);
      }
    }

    else
    {
      v66 = objc_alloc(&OBJC_CLASS___SSRSpeakerRecognitionController);
      v67 = self->_ssrContext;
      id v85 = 0LL;
      v68 = -[SSRSpeakerRecognitionController initWithContext:withDelegate:error:]( v66,  "initWithContext:withDelegate:error:",  v67,  self,  &v85);
      id v64 = v85;
      speakerRecognitionController = self->_speakerRecognitionController;
      self->_speakerRecognitionController = v68;

      if (self->_speakerRecognitionController && !v64)
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs"));
        v71 = (void *)objc_claimAutoreleasedReturnValue([v70 firstObject]);
        [v71 speakerRejectLoggingThreshold];
        self->_phsRejectLoggingThreshold = v72;

        int v55 = 0;
        goto LABEL_54;
      }

      v78 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        v74 = v78;
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        v76 = (void *)objc_claimAutoreleasedReturnValue([v64 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
        __int16 v92 = 2114;
        unint64_t v93 = (unint64_t)v75;
        __int16 v94 = 2112;
        v95 = v76;
        v77 = "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to create SSR controller with error %@";
        goto LABEL_52;
      }
    }

    -[CSVoiceTriggerSecondPass _reset](self, "_reset");

    int v55 = 1;
LABEL_54:

    goto LABEL_55;
  }

  v54 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    v81 = v54;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315650;
    v91 = "-[CSVoiceTriggerSecondPass _setAsset:]";
    __int16 v92 = 2114;
    unint64_t v93 = (unint64_t)v82;
    __int16 v94 = 2114;
    v95 = v24;
    _os_log_error_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: Failed to retrieve voice profiles for %{public}@",  buf,  0x20u);
  }

  -[CSVoiceTriggerSecondPass _reset](self, "_reset");
  int v55 = 1;
LABEL_55:

  if (!v55)
  {
LABEL_56:
    -[CSVoiceTriggerSecondPass _reset](self, "_reset");
    -[CSVoiceTriggerSecondPass _unmapForPrewarmLoadedGraph](self, "_unmapForPrewarmLoadedGraph");
    -[CSVoiceTriggerSecondPass _mmapModelForPreWarm](self, "_mmapModelForPreWarm");
  }

- (BOOL)_usePHS
{
  else {
    return 0;
  }
}

- (void)_initializeMediaPlayingState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSMediaPlayingMonitor sharedInstance](&OBJC_CLASS___CSMediaPlayingMonitor, "sharedInstance"));
  [v3 addObserver:self];
  [v3 initializeMediaPlayingState];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000A3640;
  v6[3] = &unk_10022E4A8;
  v6[4] = self;
  [v3 mediaPlayingStateWithCompletion:v6];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSVolumeMonitor sharedInstance](&OBJC_CLASS___CSVolumeMonitor, "sharedInstance"));
  [v4 addObserver:self];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A3698;
  v5[3] = &unk_10022BED8;
  v5[4] = self;
  [v4 musicVolumeWithCompletion:v5];
}

- (void)_clearTriggerCandidate
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v6 = 136315394;
    v7 = "-[CSVoiceTriggerSecondPass _clearTriggerCandidate]";
    __int16 v8 = 2114;
    float v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Clearing VoiceTrigger candidate in the second pass",  (uint8_t *)&v6,  0x16u);
  }

  self->_hasTriggerCandidate = 0;
}

- (void)_requestStartAudioStreamWitContext:(id)a3 audioProviderUUID:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v49 = a3;
  id v48 = a4;
  id v46 = a5;
  id v10 = a6;
  objc_initWeak(&location, self);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1000A34E4;
  v55[3] = &unk_10022BF00;
  objc_copyWeak(&v57, &location);
  id v43 = v10;
  id v56 = v43;
  float v11 = objc_retainBlock(v55);
  float v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics]( self,  "_voiceTriggerSecondPassLatencyMetrics"));
  [v12 setSecondPassAudioStreamStartTime:mach_absolute_time()];

  speechManager = self->_speechManager;
  if (speechManager)
  {
    float v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSSpeechManager audioProviderWithUUID:](speechManager, "audioProviderWithUUID:", v48, v43, &v57));
    if (!v14)
    {
      float v15 = self->_speechManager;
      id v54 = 0LL;
      float v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager audioProviderWithContext:error:]( v15,  "audioProviderWithContext:error:",  v49,  &v54));
      id v47 = v54;
      goto LABEL_6;
    }

    goto LABEL_5;
  }

  float v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon",  v43,  &v57));
  float v14 = (void *)objc_claimAutoreleasedReturnValue([v16 audioProviderWithUUID:v48]);

  if (v14)
  {
LABEL_5:
    id v47 = 0LL;
    goto LABEL_6;
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v53 = 0LL;
  float v14 = (void *)objc_claimAutoreleasedReturnValue([v38 audioProviderWithContext:v49 error:&v53]);
  id v47 = v53;

LABEL_6:
  float v17 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    id v19 = (id)objc_claimAutoreleasedReturnValue([v49 deviceId]);
    float v20 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
    *(_DWORD *)buf = 136315906;
    v60 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
    __int16 v61 = 2114;
    id v62 = v18;
    __int16 v63 = 2112;
    id v64 = v19;
    __int16 v65 = 2112;
    v66 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:DeviceID : %@, audioProviderUUID : %@",  buf,  0x2Au);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
  -[CSVoiceTriggerSecondPass setAudioProviderUUID:](self, "setAudioProviderUUID:", v21);

  v22 = (os_log_s *)CSLogCategoryVT;
  uint64_t v23 = v22;
  if (v14)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      *(_DWORD *)buf = 136315394;
      v60 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
      __int16 v61 = 2114;
      id v62 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Start audio stream with request",  buf,  0x16u);
    }

    if ([v49 isBuiltInVoiceTriggered])
    {
      uint64_t v26 = objc_alloc_init(&OBJC_CLASS___CSAudioStreamRequest);
      -[CSAudioStreamRequest setClientIdentity:](v26, "setClientIdentity:", 2LL);
      if (-[CSVoiceTriggerSecondPass _isFirstPassSourceExclave:]( self,  "_isFirstPassSourceExclave:",  self->_firstPassSource))
      {
        -[CSAudioStreamRequest setRequestExclaveAudio:](v26, "setRequestExclaveAudio:", 1LL);
      }
    }

    else
    {
      uint64_t v26 = 0LL;
    }

    uint64_t v27 = (objc_class *)objc_opt_class(self, v25);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v52 = 0LL;
    double v30 = (void *)objc_claimAutoreleasedReturnValue([v14 audioStreamWithRequest:v26 streamName:v29 error:&v52]);
    id v31 = v52;

    uint64_t v32 = (os_log_s *)CSLogCategoryVT;
    v33 = v32;
    if (v30)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = (id)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v30 name]);
        *(_DWORD *)buf = 136315650;
        v60 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
        __int16 v61 = 2114;
        id v62 = v34;
        __int16 v63 = 2114;
        id v64 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Has received audio stream : %{public}@",  buf,  0x20u);
      }

      -[CSVoiceTriggerSecondPass setAudioStream:](self, "setAudioStream:", v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioStream](self, "audioStream"));
      [v36 setDelegate:self];

      -[CSVoiceTriggerSecondPass _prepareStartAudioStream](self, "_prepareStartAudioStream");
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioStream](self, "audioStream"));
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = sub_1000A3568;
      v50[3] = &unk_10022E6A0;
      v50[4] = self;
      unint64_t v51 = v11;
      [v37 startAudioStreamWithOption:v46 completion:v50];
    }

    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v41 = (id)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        float v42 = (void *)objc_claimAutoreleasedReturnValue([v31 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        v60 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
        __int16 v61 = 2114;
        id v62 = v41;
        __int16 v63 = 2114;
        id v64 = v42;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get audio stream : %{public}@",  buf,  0x20u);
      }

      ((void (*)(void *, void, id))v11[2])(v11, 0LL, v31);
    }
  }

  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v39 = (id)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      BOOL v40 = (void *)objc_claimAutoreleasedReturnValue([v47 localizedDescription]);
      *(_DWORD *)buf = 136315650;
      v60 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
      __int16 v61 = 2114;
      id v62 = v39;
      __int16 v63 = 2114;
      id v64 = v40;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Getting audio stream provider has failed : %{public}@",  buf,  0x20u);
    }

    ((void (*)(void *, void, id))v11[2])(v11, 0LL, v47);
  }

  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
}

- (void)_handleVoiceTriggerFirstPassFromExclave:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  float v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassDetectedChannel]);
  self->_unint64_t activeChannel = (unint64_t)[v11 unsignedIntegerValue];

  float v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
  unint64_t firstPassSource = self->_firstPassSource;
  if (firstPassSource - 13 < 2) {
    goto LABEL_4;
  }
  if (firstPassSource == 12)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    double v58 = 0.0;
    uint64_t v53 = 0LL;
    id v54 = &v53;
    uint64_t v55 = 0x2020000000LL;
    uint64_t v56 = 0LL;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472LL;
    v52[2] = sub_1000A3450;
    v52[3] = &unk_10022BF28;
    v52[4] = buf;
    v52[5] = &v53;
    -[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:]( self,  "_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:",  v8,  v52);
    self->_unint64_t secondPassTimeout = v54[3];
    [v12 setRequestHistoricalAudioDataWithHostTime:1];
    [v12 setStartRecordingHostTime:*(void *)(*(void *)&buf[8] + 24)];
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);
LABEL_11:
    unint64_t secondPassTimeout = self->_secondPassTimeout;
    +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
    float v28 = v27;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    if ((float)(v28 * v29) < (float)secondPassTimeout)
    {
      double v30 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        id v43 = v30;
        float v44 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        unint64_t v45 = self->_secondPassTimeout;
        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2050;
        double v58 = (float)((float)v45 / v46);
        _os_log_error_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size",  buf,  0x20u);
      }

      +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
      float v32 = v31;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      self->_unint64_t secondPassTimeout = (unint64_t)(float)(v32 * v33);
    }

    id v34 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t v37 = self->_secondPassTimeout;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2050;
      double v58 = *(double *)&v37;
      __int16 v59 = 2050;
      double v60 = (float)((float)v37 / v38);
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs)",  buf,  0x2Au);
    }

    -[CSExclaveSecondPassVoiceTriggerAnalyzing startSecondPassVoiceTriggerWithFirstPassSource:enablePHS:supportMultiPhrase:activeChannel:]( self->_exclaveClient,  "startSecondPassVoiceTriggerWithFirstPassSource:enablePHS:supportMultiPhrase:activeChannel:",  self->_firstPassSource,  -[CSVoiceTriggerSecondPass _usePHS](self, "_usePHS"),  self->_supportsMph,  LODWORD(self->_activeChannel));
    id v39 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000A346C;
    v50[3] = &unk_10022E650;
    id v40 = v10;
    id v51 = v40;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:",  v39,  v9,  v12,  v50);
    -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v40);
    id v41 = v51;
    goto LABEL_18;
  }

  if (firstPassSource == 11)
  {
LABEL_4:
    float v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassStartSampleCount]);
    self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v14 unsignedIntegerValue];

    float v15 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v16 = v15;
      float v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t activeChannel = self->_activeChannel;
      double v19 = *(double *)&self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2050;
      double v58 = *(double *)&activeChannel;
      __int16 v59 = 2050;
      double v60 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu",  buf,  0x2Au);
    }

    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
    unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    BOOL v22 = firstPassTriggerStartSampleCount >= analyzerPrependingSamples;
    unint64_t v23 = firstPassTriggerStartSampleCount - analyzerPrependingSamples;
    if (v22) {
      unint64_t v24 = v23;
    }
    else {
      unint64_t v24 = 0LL;
    }
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassFireSampleCount]);
    self->_firstPassTriggerFireSampleCount = (unint64_t)[v25 unsignedIntegerValue];

    self->_unint64_t secondPassTimeout = self->_firstPassTriggerFireSampleCount - v24 + self->_analyzerTrailingSamples;
    [v12 setRequestHistoricalAudioDataSampleCount:1];
    [v12 setStartRecordingSampleCount:v24];
    goto LABEL_11;
  }

  float v42 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    id v47 = v42;
    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    unint64_t v49 = self->_firstPassSource;
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2050;
    double v58 = *(double *)&v49;
    _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Not valid firstPass source for Exclave : %{public}lu",  buf,  0x20u);
  }

  if (v10)
  {
    id v39 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassResultHolder),  "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:",  4LL,  0LL,  0LL);
    id v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v10 + 2))(v10, v39, v41);
LABEL_18:
  }
}

- (void)_handleVoiceTriggerFirstPassFromAP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = kVTEIfirstPassDetectedChannel;
  id v11 = a4;
  float v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
  self->_unint64_t selectedChannelFromFirstPass = (unint64_t)[v12 unsignedIntegerValue];

  if (-[CSVoiceTriggerSecondPass _shouldRequestSingleChannelFromAudioProvider]( self,  "_shouldRequestSingleChannelFromAudioProvider"))
  {
    unint64_t selectedChannelFromFirstPass = 0LL;
  }

  else
  {
    unint64_t selectedChannelFromFirstPass = self->_selectedChannelFromFirstPass;
  }

  self->_unint64_t activeChannel = selectedChannelFromFirstPass;
  -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:");
  float v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassChannelSelectionScores]);
  firstPassChannelSelectionScores = self->_firstPassChannelSelectionScores;
  self->_firstPassChannelSelectionScores = v14;

  float v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassChannelSelectionDelaySeconds]);
  [v16 floatValue];
  self->_firstPassChannelSelectionDelaySeconds = v17;

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassMasterChannelScoreBoost]);
  [v18 floatValue];
  self->_firstPassMasterChannelScoreBoost = v19;

  float v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassOnsetScore]);
  [v20 floatValue];
  self->_firstPassOnsetScore = v21;

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassOnsetChannel]);
  self->_firstPassOnsetChannel = (unint64_t)[v22 unsignedIntegerValue];

  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassStartSampleCount]);
  self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v23 unsignedIntegerValue];

  unint64_t v24 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = v24;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    unint64_t activeChannel = self->_activeChannel;
    unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    *(_DWORD *)buf = 136315906;
    __int16 v61 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
    __int16 v62 = 2114;
    __int16 v63 = v26;
    __int16 v64 = 2050;
    double v65 = *(double *)&activeChannel;
    __int16 v66 = 2050;
    double v67 = *(double *)&firstPassTriggerStartSampleCount;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu",  buf,  0x2Au);
  }

  unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
  unint64_t v30 = self->_firstPassTriggerStartSampleCount;
  BOOL v31 = v30 >= analyzerPrependingSamples;
  unint64_t v32 = v30 - analyzerPrependingSamples;
  if (v31) {
    unint64_t v33 = v32;
  }
  else {
    unint64_t v33 = 0LL;
  }
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kVTEIfirstPassFireSampleCount]);
  self->_firstPassTriggerFireSampleCount = (unint64_t)[v34 unsignedIntegerValue];

  unint64_t v35 = self->_analyzerTrailingSamples + self->_firstPassTriggerFireSampleCount;
  unint64_t v57 = v33;
  self->_float secondPassTimeout = v35 - v33;
  +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
  float v37 = v36;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  if ((float)(v37 * v38) < (float)(v35 - v33))
  {
    id v39 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = v39;
      id v54 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      float secondPassTimeout = (float)self->_secondPassTimeout;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      *(_DWORD *)buf = 136315650;
      __int16 v61 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
      __int16 v62 = 2114;
      __int16 v63 = v54;
      __int16 v64 = 2050;
      double v65 = (float)(secondPassTimeout / v56);
      _os_log_error_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer si ze, set to ring buffer size",  buf,  0x20u);
    }

    +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
    float v41 = v40;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_float secondPassTimeout = (unint64_t)(float)(v41 * v42);
  }

  id v43 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    float v44 = v43;
    id v45 = v9;
    id v46 = v11;
    id v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    unint64_t v48 = self->_secondPassTimeout;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    *(_DWORD *)buf = 136316418;
    __int16 v61 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
    __int16 v62 = 2114;
    __int16 v63 = v47;
    __int16 v64 = 2050;
    double v65 = *(double *)&v48;
    __int16 v66 = 2050;
    double v67 = (float)((float)v48 / v49);
    __int16 v68 = 2050;
    unint64_t v69 = v57;
    __int16 v70 = 2050;
    unint64_t v71 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{publ ic}tu to %{public}tu",  buf,  0x3Eu);

    id v11 = v46;
    id v9 = v45;
  }

  float v50 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
  id v51 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
  if (-[CSVoiceTriggerSecondPass _shouldRequestSingleChannelFromAudioProvider]( self,  "_shouldRequestSingleChannelFromAudioProvider"))
  {
    [v51 setRequireSingleChannelLookup:1];
    [v51 setSelectedChannel:LODWORD(self->_selectedChannelFromFirstPass)];
  }

  [v51 setRequestHistoricalAudioDataSampleCount:1];
  [v51 setStartRecordingSampleCount:v57];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_1000A33D8;
  v58[3] = &unk_10022E650;
  id v59 = v9;
  id v52 = v9;
  -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:",  v50,  v11,  v51,  v58);

  -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v52);
}

- (void)_handleVoiceTriggerFirstPassFromHearst:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (a3 == 3)
  {
    id v38 = v16;
    id v39 = v14;
    self->_unint64_t activeChannel = 0LL;
    -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", 0LL);
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_unint64_t secondPassTimeout = (unint64_t)(float)(v19 + v19);
    float v20 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v21 = v20;
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      *(_DWORD *)buf = 136315650;
      id v43 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearst:deviceId:audioProviderUUID:firstPassInfo:r"
            "tModelRequestOptions:completion:]";
      __int16 v44 = 2114;
      id v45 = v22;
      __int16 v46 = 1026;
      int v47 = secondPassTimeout;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Setting second pass timeout for hearst : %{public}d",  buf,  0x1Cu);
    }

    unint64_t v24 = objc_alloc(&OBJC_CLASS___CSPhraseNDEAPIScorer);
    currentAsset = self->_currentAsset;
    config = self->_config;
    unint64_t firstPassSource = self->_firstPassSource;
    unint64_t activeChannel = self->_activeChannel;
    float v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale"));
    unint64_t v30 = -[CSPhraseNDEAPIScorer initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:]( v24,  "initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:",  currentAsset,  config,  firstPassSource,  activeChannel,  v29,  1LL,  v17);
    phraseNDEAPIScorer = self->_phraseNDEAPIScorer;
    self->_phraseNDEAPIScorer = v30;

    -[CSPhraseNDEAPIScorer setDelegate:](self->_phraseNDEAPIScorer, "setDelegate:", self);
    id v14 = v39;
    unint64_t v32 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForHearstVoiceTriggerWithDeviceId:",  v39));
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
    [v33 setDisableBoostForDoAP:1];
    [v33 setRequestHistoricalAudioDataSampleCount:1];
    [v33 setStartRecordingSampleCount:0];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_1000A3360;
    v40[3] = &unk_10022E650;
    id v34 = v18;
    id v41 = v34;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:",  v32,  v15,  v33,  v40);
    -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v34);

    id v16 = v38;
    goto LABEL_8;
  }

  unint64_t v35 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    float v36 = v35;
    float v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    id v43 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearst:deviceId:audioProviderUUID:firstPassInfo:rtM"
          "odelRequestOptions:completion:]";
    __int16 v44 = 2114;
    id v45 = v37;
    _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Hearst",  buf,  0x16u);

    if (!v18) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  if (v18)
  {
LABEL_7:
    unint64_t v32 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassResultHolder),  "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:",  4LL,  0LL,  0LL);
    unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v18 + 2))(v18, v32, v33);
LABEL_8:
  }

- (void)_handleVoiceTriggerFirstPassFromRemora:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a3 == 7)
  {
    self->_unint64_t activeChannel = 0LL;
    -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", 0LL);
    uint64_t v74 = kVTEIfirstPassStartSampleCount;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:"));
    self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v16 unsignedIntegerValue];

    id v17 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      float v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t activeChannel = self->_activeChannel;
      unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      __int16 v80 = 2114;
      uint64_t v81 = (uint64_t)v19;
      __int16 v82 = 2050;
      double v83 = *(double *)&activeChannel;
      __int16 v84 = 2050;
      double v85 = *(double *)&firstPassTriggerStartSampleCount;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu",  buf,  0x2Au);
    }

    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
    unint64_t v23 = self->_firstPassTriggerStartSampleCount;
    BOOL v24 = v23 >= analyzerPrependingSamples;
    unint64_t v25 = v23 - analyzerPrependingSamples;
    if (v24) {
      unint64_t v26 = v25;
    }
    else {
      unint64_t v26 = 0LL;
    }
    float v27 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:kVTEIfirstPassEndSampleCount]);
    float v28 = (char *)[v27 unsignedIntegerValue] + self->_analyzerTrailingSamples;

    self->_float secondPassTimeout = (unint64_t)&v28[-v26];
    +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
    float v30 = v29;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    if ((float)(v30 * v31) < (float)(unint64_t)&v28[-v26])
    {
      unint64_t v32 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        __int16 v70 = v32;
        unint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        float secondPassTimeout = (float)self->_secondPassTimeout;
        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        *(_DWORD *)buf = 136315650;
        v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
        __int16 v80 = 2114;
        uint64_t v81 = (uint64_t)v71;
        __int16 v82 = 2050;
        double v83 = (float)(secondPassTimeout / v73);
        _os_log_error_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size",  buf,  0x20u);
      }

      +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
      float v34 = v33;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      self->_float secondPassTimeout = (unint64_t)(float)(v34 * v35);
    }

    float v36 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v37 = v36;
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      id v39 = v13;
      id v40 = v12;
      unint64_t v41 = self->_secondPassTimeout;
      float v42 = (float)v41;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      *(_DWORD *)buf = 136316418;
      v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      __int16 v80 = 2114;
      uint64_t v81 = (uint64_t)v38;
      __int16 v82 = 2050;
      double v83 = *(double *)&v41;
      id v12 = v40;
      id v13 = v39;
      __int16 v84 = 2050;
      double v85 = (float)(v42 / v43);
      __int16 v86 = 2050;
      unint64_t v87 = v26;
      __int16 v88 = 2050;
      v89 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{pu blic}tu to %{public}tu",  buf,  0x3Eu);
    }

    id v75 = v12;
    __int16 v44 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForRemoraVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForRemoraVoiceTriggerWithDeviceId:",  v12));
    id v45 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
    [v45 setRequestHistoricalAudioDataSampleCount:1];
    [v45 setStartRecordingSampleCount:0];
    if (!v14) {
      goto LABEL_18;
    }
    uint64_t v46 = kVTEIfirstPassSampleCountFromHistoricalBuffer;
    int v47 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:kVTEIfirstPassSampleCountFromHistoricalBuffer]);

    if (v47)
    {
      unint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v46]);
      unsigned int v49 = [v48 unsignedIntValue];

      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      float v51 = (float)v49 / v50;
      uint64_t v52 = mach_absolute_time();
      *(float *)&double v53 = v51;
      uint64_t v54 = v52 - (void)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v53);
      uint64_t v55 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        *(_DWORD *)buf = 136315906;
        v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
        __int16 v80 = 2048;
        uint64_t v81 = v52;
        __int16 v82 = 2048;
        double v83 = v51;
        __int16 v84 = 2048;
        double v85 = *(double *)&v54;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s current host:%llu delta:%f estimatedStartHostTime : %llu",  buf,  0x2Au);
      }
    }

    else
    {
      uint64_t v58 = kVTEItotalSampleCount;
      uint64_t v59 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:kVTEItotalSampleCount]);
      if (!v59) {
        goto LABEL_18;
      }
      double v60 = (void *)v59;
      __int16 v61 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v74]);

      if (!v61) {
        goto LABEL_18;
      }
      __int16 v62 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v58]);
      unsigned int v63 = [v62 unsignedIntValue];

      __int16 v64 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v74]);
      unsigned int v65 = [v64 unsignedIntValue];

      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      float v51 = (float)(v63 - v65 + 8000) / v66;
      uint64_t v52 = mach_absolute_time();
      *(float *)&double v67 = v51;
      uint64_t v54 = v52 - (void)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v67);
      uint64_t v55 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
    }

    [v45 setEstimatedStartHostTime:v54];
LABEL_18:
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_1000A32E8;
    v76[3] = &unk_10022E650;
    id v56 = v15;
    id v77 = v56;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:",  v44,  v13,  v45,  v76);
    -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v56);

    id v12 = v75;
LABEL_22:

    goto LABEL_23;
  }

  unint64_t v57 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    __int16 v68 = v57;
    unint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    v79 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    __int16 v80 = 2114;
    uint64_t v81 = (uint64_t)v69;
    _os_log_error_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Remora",  buf,  0x16u);

    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }

  if (v15)
  {
LABEL_21:
    __int16 v44 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassResultHolder),  "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:",  4LL,  0LL,  0LL);
    id v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v15 + 2))(v15, v44, v45);
    goto LABEL_22;
  }

- (void)_handleVoiceTriggerFirstPassFromHearstAP:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (a3 == 6)
  {
    id v48 = v15;
    id v49 = v14;
    self->_unint64_t activeChannel = 0LL;
    -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", 0LL);
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_unint64_t secondPassTimeout = (unint64_t)(float)(v19 + v19);
    float v20 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v21 = v20;
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      *(_DWORD *)buf = 136315650;
      double v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo"
            ":rtModelRequestOptions:completion:]";
      __int16 v54 = 2114;
      uint64_t v55 = v22;
      __int16 v56 = 1026;
      LODWORD(v57) = secondPassTimeout;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Setting second pass timeout for hearst : %{public}d",  buf,  0x1Cu);
    }

    BOOL v24 = objc_alloc(&OBJC_CLASS___CSPhraseNDEAPIScorer);
    currentAsset = self->_currentAsset;
    config = self->_config;
    unint64_t firstPassSource = self->_firstPassSource;
    unint64_t activeChannel = self->_activeChannel;
    float v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale"));
    float v30 = -[CSPhraseNDEAPIScorer initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:]( v24,  "initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:",  currentAsset,  config,  firstPassSource,  activeChannel,  v29,  0LL,  v17);
    phraseNDEAPIScorer = self->_phraseNDEAPIScorer;
    self->_phraseNDEAPIScorer = v30;

    unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kVTEIfirstPassStartSampleCount]);
    self->_unint64_t firstPassTriggerStartSampleCount = (unint64_t)[v32 unsignedIntegerValue];

    float v33 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v34 = v33;
      float v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t v36 = self->_activeChannel;
      unint64_t firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      double v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo"
            ":rtModelRequestOptions:completion:]";
      __int16 v54 = 2114;
      uint64_t v55 = v35;
      __int16 v56 = 2050;
      unint64_t v57 = v36;
      __int16 v58 = 2050;
      unint64_t v59 = firstPassTriggerStartSampleCount;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu",  buf,  0x2Au);
    }

    unint64_t analyzerPrependingSamples = self->_analyzerPrependingSamples;
    unint64_t v39 = self->_firstPassTriggerStartSampleCount;
    BOOL v40 = v39 >= analyzerPrependingSamples;
    unint64_t v41 = v39 - analyzerPrependingSamples;
    if (v40) {
      unint64_t v42 = v41;
    }
    else {
      unint64_t v42 = 0LL;
    }
    id v14 = v49;
    float v43 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForHearstVoiceTriggerWithDeviceId:",  v49));
    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
    [v44 setDisableBoostForDoAP:1];
    [v44 setRequestHistoricalAudioDataSampleCount:1];
    [v44 setStartRecordingSampleCount:v42];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000A3260;
    v50[3] = &unk_10022E6A0;
    void v50[4] = self;
    id v51 = v18;
    id v15 = v48;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:",  v43,  v48,  v44,  v50);

    goto LABEL_13;
  }

  id v45 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    uint64_t v46 = v45;
    int v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    double v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo:r"
          "tModelRequestOptions:completion:]";
    __int16 v54 = 2114;
    uint64_t v55 = v47;
    _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Hearst",  buf,  0x16u);

    if (!v18) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  if (v18)
  {
LABEL_12:
    float v43 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassResultHolder),  "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:",  4LL,  0LL,  0LL);
    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v18 + 2))(v18, v43, v44);
LABEL_13:
  }

- (void)_handleVoiceTriggerFirstPassFromJarvis:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7
{
  id v59 = a4;
  id v58 = a5;
  id v12 = a6;
  id v13 = (void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))a7;
  if (a3 != 4)
  {
    id v14 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      if (!v13) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    uint64_t v52 = v14;
    double v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    unsigned int v63 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    __int16 v64 = 2114;
    unsigned int v65 = v53;
    _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Jarvis",  buf,  0x16u);

    if (v13)
    {
LABEL_4:
      id v15 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassResultHolder),  "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:",  4LL,  0LL,  0LL);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
      v13[2](v13, v15, v16);
    }
  }

- (void)handleVoiceTriggerSecondPassFrom:(id)a3 completion:(id)a4
{
}

- (void)forceCancelSecondPassTrigger
{
  p_secondpassTriggerCancellationLock = &self->_secondpassTriggerCancellationLock;
  os_unfair_lock_lock(&self->_secondpassTriggerCancellationLock);
  self->_cancelSecondPassTrigger = 1;
  os_unfair_lock_unlock(p_secondpassTriggerCancellationLock);
}

- (void)cancelCurrentRequest
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    id v9 = "-[CSVoiceTriggerSecondPass cancelCurrentRequest]";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Cancel VoiceTrigger second pass request has received",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A2FE8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_isBuiltInFirstPassSource:(unint64_t)a3
{
  return a3 == 5 || a3 - 1 < 2 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 8 || a3 - 11 < 2;
}

- (void)_voiceTriggerFirstPassDidDetectKeywordFrom:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (unint64_t)[v6 firstPassSource];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceId]);
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 audioProviderUUID]);
  id v11 = (NSUUID *)objc_claimAutoreleasedReturnValue([v6 firstPassTriggerInfo]);
  unsigned __int8 v37 = [v6 isSecondChanceRun];
  self->_firstPassFireHostTime = 0LL;
  uint64_t v12 = kVTEIFirstPassFireHostTime;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", kVTEIFirstPassFireHostTime));

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12));
    self->_firstPassFireHostTime = (unint64_t)[v14 unsignedLongValue];
  }

  id v15 = (os_log_s *)CSLogCategoryVT;
  if ((!v11 || !v8) && os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v49 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
    __int16 v50 = 2050;
    unint64_t v51 = v8;
    __int16 v52 = 2114;
    double v53 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s There are nils in starting second pass with firstPassSource: %{public}lu firstPassInfo: %{public}@",  buf,  0x20u);
    id v15 = (os_log_s *)CSLogCategoryVT;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    secondPassRejectionMHUUID = self->_secondPassRejectionMHUUID;
    *(_DWORD *)buf = 136315650;
    id v49 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
    __int16 v50 = 2114;
    unint64_t v51 = (unint64_t)v17;
    __int16 v52 = 2112;
    double v53 = secondPassRejectionMHUUID;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass generated mhUUID for rejections: %@",  buf,  0x20u);
  }

  if (v8 != 4)
  {
    float v19 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v20 = v19;
      float v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      *(_DWORD *)buf = 136315394;
      id v49 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
      __int16 v50 = 2114;
      unint64_t v51 = (unint64_t)v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Sending early detect notification upon first pass trigger",  buf,  0x16u);
    }

    self->_earlyDetectFiredMachTime = mach_absolute_time();
  }

  if (-[CSVoiceTriggerSecondPass _isBuiltInFirstPassSource:](self, "_isBuiltInFirstPassSource:", v8)) {
    notify_post("com.apple.voicetrigger.builtin.EarlyDetect");
  }
  if (v8 != 4)
  {
    kdebug_trace(722469264LL, 0LL, 0LL, 0LL, 0LL);
    if (v8 <= 0xC)
    {
      if (((1LL << v8) & 0x1B06) != 0) {
        goto LABEL_23;
      }
      if (v8 == 5) {
        goto LABEL_36;
      }
    }
  }

  if (!-[CSVoiceTriggerSecondPass _isFirstPassSourceExclave:](self, "_isFirstPassSourceExclave:", v8))
  {
    if (v8 != 3)
    {
      if (v8 == 7)
      {
        id v22 = (id)objc_claimAutoreleasedReturnValue(+[CSSiriLauncher sharedLauncher](&OBJC_CLASS___CSSiriLauncher, "sharedLauncher"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_1000A279C;
        v46[3] = &unk_10022E730;
        v46[4] = self;
        [v22 notifyRemoraVoiceTriggerPrewarm:v11 deviceId:v9 completion:v46];
        goto LABEL_35;
      }

      if (v8 != 6) {
        goto LABEL_36;
      }
    }

    id v22 = (id)objc_claimAutoreleasedReturnValue(+[CSSiriLauncher sharedLauncher](&OBJC_CLASS___CSSiriLauncher, "sharedLauncher"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1000A2614;
    v47[3] = &unk_10022E730;
    v47[4] = self;
    [v22 notifyBluetoothDeviceVoiceTriggerPrewarm:v11 deviceId:v9 completion:v47];
LABEL_35:

    goto LABEL_36;
  }

- (void)_logRejectionEventToSELF:(id)a3 result:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!self->_hasLoggedSecondPass)
  {
    id v13 = v6;
    int v8 = CSIsInternalBuild();
    id v7 = v13;
    if (v8)
    {
      storedFirstPassInfo = self->_storedFirstPassInfo;
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _getFirstPassTriggerSourceAsString:]( self,  "_getFirstPassTriggerSourceAsString:",  self->_firstPassSource));
      -[NSMutableDictionary setObject:forKey:]( storedFirstPassInfo,  "setObject:forKey:",  v10,  kVTEIfirstPassTriggerSource);

      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger]( &OBJC_CLASS___CSFVoiceTriggerEventInfoSelfLogger,  "sharedLogger"));
      [v11 logStartEventWithFirstPassStartedInfo:self->_storedFirstPassInfo withMHUUID:self->_secondPassRejectionMHUUID];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSFVoiceTriggerEventInfoSelfLogger sharedLogger]( &OBJC_CLASS___CSFVoiceTriggerEventInfoSelfLogger,  "sharedLogger"));
      [v12 logRejectEventWithVTEI:v13 withMHUUID:self->_secondPassRejectionMHUUID withSecondPassResult:a4];

      id v7 = v13;
      self->_hasLoggedSecondPass = 1;
    }
  }
}

- (void)_notifySecondPassReject:(id)a3 result:(unint64_t)a4 isSecondChanceCandidate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    float v30 = "-[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]";
    __int16 v31 = 2114;
    id v32 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:",  buf,  0x16u);
  }

  id v12 = [v8 mutableCopy];
  -[CSVoiceTriggerSecondPass _addDeviceStatusInfoToDict:](self, "_addDeviceStatusInfoToDict:", v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_secondPassRejectionMHUUID, "UUIDString"));
  [v12 setObject:v13 forKey:kVTEISecondPassRejectionMHUUID];

  id v14 = v12;
  -[CSVoiceTriggerSecondPass _reportModelProcessingLatency](self, "_reportModelProcessingLatency");
  self->_secondPassHasMadeDecision = 1;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioStream](self, "audioStream"));

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioStream](self, "audioStream"));
    float v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    unint64_t v23 = sub_1000A2558;
    unsigned __int8 v24 = &unk_10022BFC8;
    unsigned int v25 = self;
    unint64_t v27 = a4;
    id v26 = v14;
    BOOL v28 = v5;
    [v16 stopAudioStreamWithOption:0 completion:&v21];
  }

  else
  {
    id v18 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v30 = "-[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s audioStream not existing", buf, 0xCu);
    }

    id v17 = -[CSVoiceTriggerSecondPass _handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:]( self,  "_handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:",  a4,  v14,  v5,  0LL);
  }

  if (CSIsInternalBuild(v17))
  {
    if (a4 == 9) {
      uint64_t v19 = 4705LL;
    }
    else {
      uint64_t v19 = 4704LL;
    }
    -[CSVoiceTriggerSecondPass _logRejectionEventToSELF:result:]( self,  "_logRejectionEventToSELF:result:",  v14,  a4,  v21,  v22,  v23,  v24,  v25);
    float v20 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v20 logEventWithType:v19 context:v14];
  }
}

- (void)_prepareStartAudioStream
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v14 = 136315394;
    id v15 = "-[CSVoiceTriggerSecondPass _prepareStartAudioStream]";
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:",  (uint8_t *)&v14,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v7 = [v6 secondPassAudioLoggingEnabled];

  if (v7)
  {
    if (self->_firstPassSource == 7) {
      firstPassDeviceId = self->_firstPassDeviceId;
    }
    else {
      firstPassDeviceId = 0LL;
    }
    id v9 = (CSPlainAudioFileWriter *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPass secondPassAudioLoggingFilePathWithDeviceId:]( &OBJC_CLASS___CSVoiceTriggerSecondPass,  "secondPassAudioLoggingFilePathWithDeviceId:",  firstPassDeviceId));
    __int16 v10 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
    id v12 = -[CSPlainAudioFileWriter initWithURL:](v10, "initWithURL:", v11);
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v12;
  }

  else
  {
    id v9 = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;
  }
}

- (void)_didStartAudioStream:(BOOL)a3
{
  BOOL v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v8 = 136315394;
    id v9 = "-[CSVoiceTriggerSecondPass _didStartAudioStream:]";
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:",  (uint8_t *)&v8,  0x16u);
  }

  kdebug_trace(722472280LL, 0LL, 0LL, 0LL, 0LL);
  if (!a3)
  {
    -[CSPhraseDetector reset](self->_phraseDetector, "reset");
    -[CSVoiceTriggerSecondPass _clearTriggerCandidate](self, "_clearTriggerCandidate");
    -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
    -[SSRSpeakerRecognitionController endAudio](self->_speakerRecognitionController, "endAudio");
  }

- (void)_didStopAudioStream
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v6 = 136315394;
    unsigned int v7 = "-[CSVoiceTriggerSecondPass _didStopAudioStream]";
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:",  (uint8_t *)&v6,  0x16u);
  }

  kdebug_trace(722472284LL, 0LL, 0LL, 0LL, 0LL);
  -[CSPhraseDetector reset](self->_phraseDetector, "reset");
  -[CSVoiceTriggerSecondPass _clearTriggerCandidate](self, "_clearTriggerCandidate");
  -[SSRSpeakerRecognitionController endAudio](self->_speakerRecognitionController, "endAudio");
  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  BOOL v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSVoiceTriggerSecondPass audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A2550;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000A1964;
  v15[3] = &unk_10022BFF0;
  v15[4] = self;
  v15[5] = a7;
  id v9 = objc_retainBlock(v15);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A2524;
  block[3] = &unk_10022C878;
  id v13 = v9;
  unint64_t v14 = a7;
  void block[4] = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)_processSecondPassInExclave:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_secondPassHasMadeDecision)
  {
    int v6 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = v6;
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      *(_DWORD *)buf = 136315394;
      id v15 = "-[CSVoiceTriggerSecondPass _processSecondPassInExclave:]";
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:second pass has made decision, skip processing",  buf,  0x16u);
    }
  }

  else
  {
    BOOL v9 = self->_numAnalyzedSamples >= self->_secondPassTimeout;
    exclaveClient = self->_exclaveClient;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000A16AC;
    v11[3] = &unk_10022C018;
    v11[4] = self;
    id v12 = v4;
    BOOL v13 = v9;
    -[CSExclaveSecondPassVoiceTriggerAnalyzing processSecondPassVoiceTriggerWithShouldFlushAudio:result:]( exclaveClient,  "processSecondPassVoiceTriggerWithShouldFlushAudio:result:",  v9,  v11);
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000A14E4;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_handleAudioChunk:(id)a3 shouldPreprocessedByZeroFilter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentAsset)
  {
    if (self->_secondPassHasMadeDecision)
    {
      id v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = v7;
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        int v38 = 136315394;
        unint64_t v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
        __int16 v40 = 2114;
        id v41 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:second pass has made decision, skip processing",  (uint8_t *)&v38,  0x16u);
LABEL_5:

LABEL_13:
      }
    }

    else
    {
      if (v4)
      {
        unint64_t v11 = qword_10027FEB0;
        if (!(v11 % +[CSUtils loggingHeartbeatRate](&OBJC_CLASS___CSUtils, "loggingHeartbeatRate")))
        {
          id v12 = (void *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v13 = v12;
            unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
            int v38 = 136315394;
            unint64_t v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
            __int16 v40 = 2114;
            id v41 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Preprocessing through zero-filter for this trigger event",  (uint8_t *)&v38,  0x16u);
          }
        }

        ++qword_10027FEB0;
        zeroFilter = self->_zeroFilter;
        __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 dataForChannel:0]);
        -[CSVoiceTriggerAwareZeroFilter processBuffer:atTime:]( zeroFilter,  "processBuffer:atTime:",  v8,  [v6 hostTime]);
        goto LABEL_13;
      }

      if (!self->_numProcessedSamples)
      {
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics]( self,  "_voiceTriggerSecondPassLatencyMetrics"));
        [v16 setSecondPassFirstAudioPacketReceptionTime:mach_absolute_time()];
      }

      -[CSVoiceTriggerSecondPass _setStartAnalyzeTime:]( self,  "_setStartAnalyzeTime:",  [v6 startSampleCount]);
      unint64_t numProcessedSamples = self->_numProcessedSamples;
      id v18 = (char *)[v6 numSamples] + numProcessedSamples;
      uint64_t v19 = mach_absolute_time();
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      if ((unint64_t)v18 >= secondPassTimeout)
      {
        unint64_t v25 = self->_numProcessedSamples;
        unint64_t v26 = secondPassTimeout - v25;
        if ((uint64_t)(secondPassTimeout - v25) >= 1)
        {
          unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 subChunkFrom:0 numSamples:secondPassTimeout - v25]);
          id v28 = -[CSVoiceTriggerSecondPass _runRecognizersWithChunk:](self, "_runRecognizersWithChunk:", v27);
          self->_numAnalyzedSamples += v26;
          audioFileWriter = self->_audioFileWriter;
          id v30 = objc_claimAutoreleasedReturnValue([v27 data]);
          -[CSPlainAudioFileWriter addSamples:numSamples:]( audioFileWriter,  "addSamples:numSamples:",  [v30 bytes],  objc_msgSend(v27, "numSamples"));
        }

        self->_processedSampleCountsInPending += (unint64_t)[v6 numSamples] - v26;
        __int16 v31 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = v31;
          id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
          unint64_t v34 = self->_secondPassTimeout;
          int v38 = 136315650;
          unint64_t v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
          __int16 v40 = 2114;
          id v41 = v33;
          __int16 v42 = 2050;
          unint64_t v43 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Stop feeding audio at sampleCount: %{public}tu",  (uint8_t *)&v38,  0x20u);
        }

        speakerRecognitionController = self->_speakerRecognitionController;
        if (speakerRecognitionController)
        {
          -[SSRSpeakerRecognitionController endAudio](speakerRecognitionController, "endAudio");
          self->_isPSRAudioFlushed = 1;
        }

        uint64_t v36 = mach_absolute_time();
        float v21 = (void *)objc_claimAutoreleasedReturnValue( -[CSPhraseDetector getAnalyzedResultFromFlushedAudio]( self->_phraseDetector,  "getAnalyzedResultFromFlushedAudio"));
        self->_secondPassCheckerExecutionTime += mach_absolute_time() - v36;
        unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue( -[CSPhraseDetector getLosingPhraseResultsWithDetectedPhId:]( self->_phraseDetector,  "getLosingPhraseResultsWithDetectedPhId:",  [v21 phId]));
        -[CSVoiceTriggerSecondPass _setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:]( self,  "_setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:",  v19,  mach_absolute_time(),  v19);
        -[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]( self,  "_analyzeForChannel:keywordDetectorResult:losingPhraseResults:",  self->_activeChannel,  v21,  v37);
      }

      else
      {
        float v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _runRecognizersWithChunk:](self, "_runRecognizersWithChunk:", v6));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSPhraseDetector getLosingPhraseResultsWithDetectedPhId:]( self->_phraseDetector,  "getLosingPhraseResultsWithDetectedPhId:",  [v21 phId]));
        -[CSVoiceTriggerSecondPass _setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:]( self,  "_setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:",  v19,  mach_absolute_time(),  v19);
        -[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]( self,  "_analyzeForChannel:keywordDetectorResult:losingPhraseResults:",  self->_activeChannel,  v21,  v22);
        self->_numAnalyzedSamples += (unint64_t)[v6 numSamples];
        unint64_t v23 = self->_audioFileWriter;
        id v24 = objc_claimAutoreleasedReturnValue([v6 data]);
        -[CSPlainAudioFileWriter addSamples:numSamples:]( v23,  "addSamples:numSamples:",  [v24 bytes],  objc_msgSend(v6, "numSamples"));

        self->_numProcessedSamples += (unint64_t)[v6 numSamples];
      }
    }
  }

  else
  {
    __int16 v10 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = v10;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      int v38 = 136315394;
      unint64_t v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
      __int16 v40 = 2114;
      id v41 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Could not find Assets. Cannot process Audio",  (uint8_t *)&v38,  0x16u);
      goto LABEL_5;
    }
  }
}

- (id)_runRecognizersWithChunk:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = mach_absolute_time();
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSPhraseDetector getAnalyzedResultFromAudioChunk:]( self->_phraseDetector,  "getAnalyzedResultFromAudioChunk:",  v4));
  self->_secondPassCheckerExecutionTime += mach_absolute_time() - v5;
  -[CSPhraseNDEAPIScorer processAudioChunk:activeChannel:]( self->_phraseNDEAPIScorer,  "processAudioChunk:activeChannel:",  v4,  self->_activeChannel);
  if (self->_speakerRecognitionController)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dataForChannel:self->_activeChannel]);
    if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
    {
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataForChannel:self->_activeChannel]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:]( &OBJC_CLASS___CSFLPCMTypeConverter,  "convertToShortLPCMBufFromFloatLPCMBuf:",  v8));

      id v7 = (void *)v9;
    }

    -[SSRSpeakerRecognitionController processAudio:withNumberOfSamples:]( self->_speakerRecognitionController,  "processAudio:withNumberOfSamples:",  v7,  [v4 numSamples]);
  }

  return v6;
}

- (id)_getVoiceTriggerInfoWithKeywordDetectorResult:(id)a3
{
  id v4 = a3;
  id v148 = [v4 phId];
  v152 = (void *)objc_claimAutoreleasedReturnValue( -[CSPhraseDetector phraseDetectorInfoFromPhId:]( self->_phraseDetector,  "phraseDetectorInfoFromPhId:",  v148));
  v137 = (void *)objc_claimAutoreleasedReturnValue([v152 phraseConfig]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ndapiResult]);
  [v4 combinedScore];
  int v145 = v6;
  id v7 = (char *)[v5 samplesFed];
  v143 = v7;
  __int16 v8 = (char *)[v5 bestStart];
  uint64_t v9 = [v5 bestEnd];
  __int16 v10 = (char *)[v5 samplesAtFire] + self->_processedSampleCountsInPending;
  v141 = v10;
  v151 = v5;
  id v11 = [v5 startSampleCount];
  unint64_t v142 = self->_numAnalyzedSamples + self->_secondPassAnalyzerStartSampleCount;
  else {
    unint64_t extraSamplesAtStart = self->_extraSamplesAtStart;
  }
  unint64_t v144 = extraSamplesAtStart;
  BOOL v13 = &v8[-extraSamplesAtStart];
  unint64_t v14 = v9 - &v8[-extraSamplesAtStart];
  id v15 = v13;
  float v16 = (float)v14;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  double v18 = (float)(v16 / v17);
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  double v20 = (float)((float)(unint64_t)(v10 - v15) / v19);
  float v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter"));
  v139 = v15;
  id v146 = [v21 hostTimeFromSampleCount:v15];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter"));
  v140 = v9;
  id v147 = [v22 hostTimeFromSampleCount:v9];

  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[CSBatteryMonitor sharedInstance](&OBJC_CLASS___CSBatteryMonitor, "sharedInstance"));
  BOOL v153 = [v23 batteryState] == 2;

  -[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:]( self,  "_logUptimeWithVTSwitchChanged:VTEnabled:",  0LL,  1LL);
  v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_cumulativeUptime));
  v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_cumulativeDowntime));
  +[CSUtils systemUpTime](&OBJC_CLASS___CSUtils, "systemUpTime");
  double v25 = v24;
  unint64_t v26 = &v7[(void)v11];
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  double v28 = (float)((float)(unint64_t)(v26 - v15) / v27);
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  double v30 = v25 - v28;
  double v31 = v25 - (float)((float)(unint64_t)(v26 - v9) / v29);
  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPassConfig configPathNDAPI](self->_config, "configPathNDAPI"));
  id v33 = (void *)v32;
  if (v32) {
    unint64_t v34 = (__CFString *)v32;
  }
  else {
    unint64_t v34 = @"n/a";
  }
  float v35 = v34;

  uint64_t v36 = objc_claimAutoreleasedReturnValue(-[CSAsset hashFromResourcePath](self->_currentAsset, "hashFromResourcePath"));
  unsigned __int8 v37 = (void *)v36;
  if (v36) {
    int v38 = (__CFString *)v36;
  }
  else {
    int v38 = @"n/a";
  }
  unint64_t v39 = v38;

  uint64_t v40 = objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale"));
  double TimeInterval = CSMachAbsoluteTimeGetTimeInterval(self->_earlyDetectFiredMachTime);
  float secondPassAnalyzerStartSampleCount = (float)self->_secondPassAnalyzerStartSampleCount;
  [v137 preTriggerSilenceOffset];
  float v44 = v43;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  unint64_t v136 = (unint64_t)(float)(secondPassAnalyzerStartSampleCount + (float)(v44 * v45));
  unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  float v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](self->_currentAsset, "configVersion"));
  [v46 setObject:v47 forKey:kVTEIconfigVersion];

  float v48 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils deviceBuildVersion](&OBJC_CLASS___CSUtils, "deviceBuildVersion"));
  [v46 setObject:v48 forKey:kVTEIbuildVersion];

  v150 = v35;
  [v46 setObject:v35 forKey:kVTEIconfigPath];
  [v46 setObject:v39 forKey:kVTEIConfigDataHash];

  id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v153));
  [v46 setObject:v49 forKey:kVTEIOnBatteryPower];

  __int16 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_didWakeAP));
  [v46 setObject:v50 forKey:kVTEIDidWakeAP];

  [v46 setObject:&__kCFBooleanFalse forKey:kVTEISatBeingTrained];
  unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 isSecondChance]));
  [v46 setObject:v51 forKey:kVTEIisSecondChance];

  v149 = (void *)v40;
  [v46 setObject:v40 forKey:kVTEILanguageCode];
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  __int16 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v46 setObject:v52 forKey:kVTEIhardwareSamplerate];

  double v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v136));
  [v46 setObject:v53 forKey:kVTEIclientStartSampleCount];

  __int16 v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v139));
  [v46 setObject:v54 forKey:kVTEItriggerStartSampleCount];

  float v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v140));
  [v46 setObject:v55 forKey:kVTEItriggerEndSampleCount];

  __int16 v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v141));
  [v46 setObject:v56 forKey:kVTEItriggerFireSampleCount];

  unint64_t v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_secondPassAnalyzerStartSampleCount));
  [v46 setObject:v57 forKey:kVTEIsecondPassAnalyzerStartSampleCount];

  id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v142));
  [v46 setObject:v58 forKey:kVTEIsecondPassAnalyzerEndSampleCount];

  [v46 setObject:&off_1002382D0 forKey:kVTEItriggerStartSeconds];
  id v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
  [v46 setObject:v59 forKey:kVTEItriggerEndSeconds];

  double v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  [v46 setObject:v60 forKey:kVTEItriggerFireSeconds];

  __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v30));
  [v46 setObject:v61 forKey:kVTEItriggerStartTime];

  __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v31));
  [v46 setObject:v62 forKey:kVTEItriggerEndTime];

  unsigned int v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v31 - v30));
  [v46 setObject:v63 forKey:kVTEItriggerDuration];

  __int16 v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25));
  [v46 setObject:v64 forKey:kVTEItriggerFiredTime];

  unsigned int v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v143));
  [v46 setObject:v65 forKey:kVTEItotalSamplesAtEndOfCapture];

  __int16 v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v139));
  [v46 setObject:v66 forKey:kVTEItotalSamplesAtTriggerStart];

  double v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v140));
  [v46 setObject:v67 forKey:kVTEItotalSamplesAtTriggerEnd];

  [v138 doubleValue];
  __int16 v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v46 setObject:v68 forKey:kVTEIVTuptime];

  [v135 doubleValue];
  double v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v46 setObject:v69 forKey:kVTEIVTdowntime];

  __int16 v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", TimeInterval));
  [v46 setObject:v70 forKey:kVTEIearlyDetectFiredTime];

  LODWORD(v71) = v145;
  __int16 v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v71));
  [v46 setObject:v72 forKey:kVTEItriggerScore];

  float v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v144));
  [v46 setObject:v73 forKey:kVTEIextraSamplesAtStart];

  __int16 v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_analyzerPrependingSamples));
  [v46 setObject:v74 forKey:kVTEIanalyzerPrependingSamples];

  unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_analyzerTrailingSamples));
  uint64_t v76 = kVTEIanalyzerTrailingSamples;
  [v46 setObject:v75 forKey:kVTEIanalyzerTrailingSamples];

  [v152 effectiveKeywordThreshold];
  unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v46 setObject:v77 forKey:kVTEIeffectiveThreshold];

  [v152 effectiveKeywordThreshold];
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v46 setObject:v78 forKey:kVTEIthreshold];

  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_earlyDetectFiredMachTime));
  [v46 setObject:v79 forKey:kVTEIearlyDetectFiredMachTime];

  __int16 v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v146));
  [v46 setObject:v80 forKey:kVTEItriggerStartMachTime];

  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v147));
  [v46 setObject:v81 forKey:kVTEItriggerEndMachTime];

  [v46 setObject:&__kCFBooleanFalse forKey:kVTEIisContinuous];
  __int16 v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v148));
  [v46 setObject:v82 forKey:kVTEITriggeredPhId];

  double v83 = (void *)objc_claimAutoreleasedReturnValue([v137 name]);
  if (v83)
  {
    __int16 v84 = (void *)objc_claimAutoreleasedReturnValue([v137 name]);
    [v46 setObject:v84 forKey:kVTEITriggeredPh];
  }

  unsigned int v85 = -[CSVoiceTriggerSecondPass _shouldRequestSingleChannelFromAudioProvider]( self,  "_shouldRequestSingleChannelFromAudioProvider");
  uint64_t v86 = 28LL;
  if (v85) {
    uint64_t v86 = 29LL;
  }
  unint64_t v87 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (&self->super.isa)[v86]));
  [v46 setObject:v87 forKey:kVTEIactiveChannel];

  [v138 doubleValue];
  __int16 v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v46 setObject:v88 forKey:kVTEIuptime];

  [v135 doubleValue];
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v46 setObject:v89 forKey:kVTEIdowntime];

  id v90 = [v4 isRunningQuasar];
  if ((_DWORD)v90)
  {
    [v4 recognizerScore];
    __int16 v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    [v46 setObject:v92 forKey:kVTEIrecognizerScore];

    [v137 recognizerScoreOffset];
    unint64_t v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    [v46 setObject:v93 forKey:kVTEIrecognizerThresholdOffset];

    [v137 recognizerScoreScaleFactor];
    __int16 v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
    [v46 setObject:v94 forKey:kVTEIrecognizerScaleFactor];
  }

  if (CSIsHorseman(v90, v91))
  {
    firstPassChannelSelectionScores = self->_firstPassChannelSelectionScores;
    if (firstPassChannelSelectionScores)
    {
      uint64_t v97 = objc_opt_class(&OBJC_CLASS___NSDictionary, v95);
      if ((objc_opt_isKindOfClass(firstPassChannelSelectionScores, v97) & 1) != 0) {
        [v46 setObject:self->_firstPassChannelSelectionScores forKey:kVTEIfirstPassChannelSelectionScores];
      }
    }

    v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_firstPassTriggerStartSampleCount));
    [v46 setObject:v98 forKey:kVTEIfirstPassStartSampleCount];

    v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_firstPassTriggerFireSampleCount));
    [v46 setObject:v99 forKey:kVTEIfirstPassFireSampleCount];

    *(float *)&double v100 = self->_firstPassChannelSelectionDelaySeconds;
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v100));
    [v46 setObject:v101 forKey:kVTEIfirstPassChannelSelectionDelaySeconds];

    *(float *)&double v102 = self->_firstPassMasterChannelScoreBoost;
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v102));
    [v46 setObject:v103 forKey:kVTEIfirstPassMasterChannelScoreBoost];

    v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_firstPassOnsetChannel));
    [v46 setObject:v104 forKey:kVTEIfirstPassOnsetChannel];

    *(float *)&double v105 = self->_firstPassOnsetScore;
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v105));
    [v46 setObject:v106 forKey:kVTEIfirstPassOnsetScore];
  }

  v107 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _getFirstPassTriggerSourceAsString:]( self,  "_getFirstPassTriggerSourceAsString:",  self->_firstPassSource));
  [v46 setObject:v107 forKey:kVTEIfirstPassTriggerSource];

  firstpassMetrics = self->_firstpassMetrics;
  if (firstpassMetrics)
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFirstPassMetrics firstPassInfoGeneratedTime]( firstpassMetrics,  "firstPassInfoGeneratedTime"));
    [v46 setObject:v109 forKey:kVTEIFirstPassInfoGeneratedTime];

    v110 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerFirstPassMetrics firstPassInfoProcessedTime]( self->_firstpassMetrics,  "firstPassInfoProcessedTime"));
    [v46 setObject:v110 forKey:kVTEIFirstPassInfoProcessedTime];
  }

  unsigned int v111 = +[CSUtils supportJarvisVoiceTrigger](&OBJC_CLASS___CSUtils, "supportJarvisVoiceTrigger");
  unint64_t firstPassSource = self->_firstPassSource;
  if (v111 && firstPassSource == 4)
  {
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v114 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  (unint64_t)(float)(v113 * 0.5)));
    [v46 setObject:v114 forKey:v76];

    unint64_t firstPassSource = self->_firstPassSource;
  }

  if (-[CSVoiceTriggerSecondPass _shouldLogMediaplayState:](self, "_shouldLogMediaplayState:", firstPassSource))
  {
    int64_t mediaPlayingState = self->_mediaPlayingState;
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", mediaPlayingState == 1));
    [v46 setObject:v116 forKey:kVTEIisMediaPlaying];

    if (mediaPlayingState == 1)
    {
      *(float *)&double v117 = self->_mediaVolume;
      v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v117));
      [v46 setObject:v118 forKey:kVTEImediaVolume];
    }
  }

  v119 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioProviderUUID](self, "audioProviderUUID"));

  if (v119)
  {
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioProviderUUID](self, "audioProviderUUID"));
    [v46 setObject:v120 forKey:kVTEIAudioProviderUUID];
  }

  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v122 = (void *)objc_claimAutoreleasedReturnValue([v121 UUIDString]);
  [v46 setObject:v122 forKey:kVTEISelfLoggingUUID];

  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (secondPassLatencyMetrics)
  {
    v124 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassAssetQueryStartTime]( secondPassLatencyMetrics,  "secondPassAssetQueryStartTime"))));
    [v46 setObject:v124 forKey:kVTEISecondPassAssetQueryStartTime];

    v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassAssetQueryCompleteTime]( self->_secondPassLatencyMetrics,  "secondPassAssetQueryCompleteTime"))));
    [v46 setObject:v125 forKey:kVTEISecondPassAssetQueryCompleteTime];

    v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassAssetLoadStartTime]( self->_secondPassLatencyMetrics,  "secondPassAssetLoadStartTime"))));
    [v46 setObject:v126 forKey:kVTEISecondPassAssetLoadStartTime];

    v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassAssetLoadCompleteTime]( self->_secondPassLatencyMetrics,  "secondPassAssetLoadCompleteTime"))));
    [v46 setObject:v127 forKey:kVTEISecondPassAssetLoadCompleteTime];

    v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassAudioStreamStartTime]( self->_secondPassLatencyMetrics,  "secondPassAudioStreamStartTime"))));
    [v46 setObject:v128 forKey:kVTEISecondPassAudioStreamStartTime];

    v129 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassAudioStreamReadyTime]( self->_secondPassLatencyMetrics,  "secondPassAudioStreamReadyTime"))));
    [v46 setObject:v129 forKey:kVTEISecondPassAudioStreamReadyTime];

    v130 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassFirstAudioPacketReceptionTime]( self->_secondPassLatencyMetrics,  "secondPassFirstAudioPacketReceptionTime"))));
    [v46 setObject:v130 forKey:kVTEISecondPassFirstAudioPacketReceptionTime];

    v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassLastAudioPacketReceptionTime]( self->_secondPassLatencyMetrics,  "secondPassLastAudioPacketReceptionTime"))));
    [v46 setObject:v131 forKey:kVTEISecondPassLastAudioPacketReceptionTime];

    v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassCheckerModelKeywordDetectionStartTime]( self->_secondPassLatencyMetrics,  "secondPassCheckerModelKeywordDetectionStartTime"))));
    [v46 setObject:v132 forKey:kVTEISecondPassCheckerModelKeywordDetectionStartTime];

    v133 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  +[CSFTimeUtils hostTimeToNs:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToNs:",  -[CSVTSecondPassLatencyMetrics secondPassCheckerModelKeywordDetectionEndTime]( self->_secondPassLatencyMetrics,  "secondPassCheckerModelKeywordDetectionEndTime"))));
    [v46 setObject:v133 forKey:kVTEISecondPassCheckerModelKeywordDetectionEndTime];
  }

  return v46;
}

- (void)_addLosingPhraseResultstoVTEI:(id)a3 withLosingPhraseResults:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v5 count] != (id)-1)
  {
    unint64_t v7 = 0LL;
    do
    {
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary", v21));
      [v6 addObject:v8];

      ++v7;
    }

    while (v7 < (unint64_t)[v5 count] + 1);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = kVTEIrecognizerScore;
    uint64_t v13 = kVTEItriggerScore;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (v15)
        {
          float v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
          [v15 recognizerScore];
          float v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
          [v16 setObject:v17 forKey:v12];

          [v15 combinedScore];
          double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
          [v16 setObject:v18 forKey:v13];

          id v19 = [v16 copy];
          objc_msgSend(v6, "setObject:atIndexedSubscript:", v19, objc_msgSend(v15, "phId"));
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v10);
  }

  if ([v6 count])
  {
    id v20 = [v6 copy];
    [v21 setObject:v20 forKey:kVTEILosingPhraseScores];
  }
}

- (void)_setKeywordDetectorStartMachTime:(unint64_t)a3 detectorEndMachTime:(unint64_t)a4 lastAudioPacketAnalyzedMachTime:(unint64_t)a5
{
  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (secondPassLatencyMetrics)
  {
    -[CSVTSecondPassLatencyMetrics setSecondPassCheckerModelKeywordDetectionStartTime:]( secondPassLatencyMetrics,  "setSecondPassCheckerModelKeywordDetectionStartTime:",  a3);
    -[CSVTSecondPassLatencyMetrics setSecondPassCheckerModelKeywordDetectionEndTime:]( self->_secondPassLatencyMetrics,  "setSecondPassCheckerModelKeywordDetectionEndTime:",  a4);
    -[CSVTSecondPassLatencyMetrics setSecondPassLastAudioPacketReceptionTime:]( self->_secondPassLatencyMetrics,  "setSecondPassLastAudioPacketReceptionTime:",  a5);
  }

  else
  {
    id v9 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CSVoiceTriggerSecondPass _setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s nil second pass metrics instance",  (uint8_t *)&v10,  0xCu);
    }
  }

- (void)_analyzeForChannel:(unint64_t)a3 keywordDetectorResult:(id)a4 losingPhraseResults:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [v7 decision];
  if (v9)
  {
    id v10 = v9;
    if (v9 == (id)1)
    {
      id v11 = [v7 phId];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs"));
      id v13 = [v12 count];

      unint64_t v14 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315394;
        uint64_t v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
        __int16 v33 = 2048;
        id v34 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Asset config supports %lu phrase(s)",  (uint8_t *)&v31,  0x16u);
      }

      BOOL v15 = (unint64_t)v13 <= 1 || !self->_supportsMph;
      if (!v15 || !v11)
      {
        float v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _getVoiceTriggerInfoWithKeywordDetectorResult:]( self,  "_getVoiceTriggerInfoWithKeywordDetectorResult:",  v7));
        -[CSVoiceTriggerSecondPass _addLosingPhraseResultstoVTEI:withLosingPhraseResults:]( self,  "_addLosingPhraseResultstoVTEI:withLosingPhraseResults:",  v17,  v8);
        -[CSPhraseDetector reset](self->_phraseDetector, "reset");
        speakerRecognitionController = self->_speakerRecognitionController;
        if (speakerRecognitionController)
        {
          if (!self->_isPSRAudioFlushed)
          {
            -[SSRSpeakerRecognitionController endAudio](speakerRecognitionController, "endAudio");
            self->_isPSRAudioFlushed = 1;
            speakerRecognitionController = self->_speakerRecognitionController;
          }

          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( -[SSRSpeakerRecognitionController getLatestSpeakerInfo]( speakerRecognitionController,  "getLatestSpeakerInfo"));
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey]);

          if (v24)
          {
            -[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]( self,  "_handlePHSResults:voiceTriggerEventInfo:forPhId:",  v23,  v17,  [v7 phId]);
          }

          else
          {
            double v28 = (void *)CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              float v29 = v28;
              double v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
              int v31 = 136315394;
              uint64_t v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
              __int16 v33 = 2114;
              id v34 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Scores not available, ignoring for now !",  (uint8_t *)&v31,  0x16u);
            }

            -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v17);
          }

          goto LABEL_32;
        }

        if (!+[CSUtils supportRemoraVoiceTrigger](&OBJC_CLASS___CSUtils, "supportRemoraVoiceTrigger")
          || (os_unfair_lock_lock(&self->_secondpassTriggerCancellationLock),
              BOOL cancelSecondPassTrigger = self->_cancelSecondPassTrigger,
              self->_BOOL cancelSecondPassTrigger = 0,
              os_unfair_lock_unlock(&self->_secondpassTriggerCancellationLock),
              !cancelSecondPassTrigger))
        {
          float v27 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerStatistics sharedInstance]( &OBJC_CLASS___CSVoiceTriggerStatistics,  "sharedInstance"));
          [v27 resetPHSRejectCount];

          -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v17);
          goto LABEL_32;
        }

        -[CSPhraseDetector reset](self->_phraseDetector, "reset");
        self->_unint64_t secondPassTimeout = 0LL;
        id v18 = [v7 isSecondChanceCandidate];
        id v19 = self;
        id v20 = v17;
        uint64_t v21 = 6LL;
        goto LABEL_23;
      }

      float v16 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315138;
        uint64_t v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s Report as rejection since the detected phId is not the default",  (uint8_t *)&v31,  0xCu);
      }

      float v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _getVoiceTriggerInfoWithKeywordDetectorResult:]( self,  "_getVoiceTriggerInfoWithKeywordDetectorResult:",  v7));
      -[CSVoiceTriggerSecondPass _addLosingPhraseResultstoVTEI:withLosingPhraseResults:]( self,  "_addLosingPhraseResultstoVTEI:withLosingPhraseResults:",  v17,  v8);
    }

    else
    {
      float v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSVoiceTriggerSecondPass _getVoiceTriggerInfoWithKeywordDetectorResult:]( self,  "_getVoiceTriggerInfoWithKeywordDetectorResult:",  v7));
      -[CSVoiceTriggerSecondPass _addLosingPhraseResultstoVTEI:withLosingPhraseResults:]( self,  "_addLosingPhraseResultstoVTEI:withLosingPhraseResults:",  v17,  v8);
      if (v10 == (id)2)
      {
        -[CSPhraseDetector reset](self->_phraseDetector, "reset");
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerDataCollector sharedInstance]( &OBJC_CLASS___CSVoiceTriggerDataCollector,  "sharedInstance"));
        [v25 addVTRejectEntry:v17 truncateData:1];

        id v18 = [v7 isSecondChanceCandidate];
        id v19 = self;
        id v20 = v17;
        uint64_t v21 = 3LL;
        goto LABEL_23;
      }

      if (v10 != (id)3)
      {
LABEL_32:
        -[CSVoiceTriggerSecondPass _resetVoiceTriggerLatencyMetrics](self, "_resetVoiceTriggerLatencyMetrics");

        goto LABEL_33;
      }
    }

    -[CSPhraseDetector reset](self->_phraseDetector, "reset");
    self->_unint64_t secondPassTimeout = 0LL;
    id v18 = [v7 isSecondChanceCandidate];
    id v19 = self;
    id v20 = v17;
    uint64_t v21 = 2LL;
LABEL_23:
    -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]( v19,  "_notifySecondPassReject:result:isSecondChanceCandidate:",  v20,  v21,  v18);
    goto LABEL_32;
  }

- (void)voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:(id)a3 bestStartSampleCount:(unint64_t)a4 bestEndSampleCount:(unint64_t)a5
{
  float v6 = (float)(a5 - a4);
  float secondPassPrependingSec = self->_secondPassPrependingSec;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate", a3);
  id v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    unint64_t secondPassTimeout = self->_secondPassTimeout;
    float v13 = self->_secondPassPrependingSec;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    unint64_t analyzerTrailingSamples = self->_analyzerTrailingSamples;
    int v16 = 136316162;
    float v17 = "-[CSVoiceTriggerSecondPass voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:bestStartSampleCount:bestEndSampleCount:]";
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 1026;
    int v21 = secondPassTimeout;
    __int16 v22 = 1026;
    int v23 = (int)(float)(v13 * v14);
    __int16 v24 = 1026;
    int v25 = analyzerTrailingSamples;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Setting unint64_t secondPassTimeout = %{public}d, PrependingSamples = %{public}d, an alyzerTrailingSamples = %{public}d",  (uint8_t *)&v16,  0x28u);
  }

- (void)_reportModelProcessingLatency
{
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    unint64_t secondPassCheckerExecutionTime = self->_secondPassCheckerExecutionTime;
    +[CSFTimeUtils hostTimeToSeconds:](&OBJC_CLASS___CSFTimeUtils, "hostTimeToSeconds:", secondPassCheckerExecutionTime);
    double v8 = v7;
    id v9 = -[SSRSpeakerRecognitionController getPSRProcessingTime]( self->_speakerRecognitionController,  "getPSRProcessingTime");
    +[CSFTimeUtils hostTimeToSeconds:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToSeconds:",  -[SSRSpeakerRecognitionController getPSRProcessingTime]( self->_speakerRecognitionController,  "getPSRProcessingTime"));
    int v11 = 136316418;
    uint64_t v12 = "-[CSVoiceTriggerSecondPass _reportModelProcessingLatency]";
    __int16 v13 = 2114;
    float v14 = v5;
    __int16 v15 = 2048;
    unint64_t v16 = secondPassCheckerExecutionTime;
    __int16 v17 = 2048;
    double v18 = v8;
    __int16 v19 = 2048;
    id v20 = v9;
    __int16 v21 = 2048;
    double v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:secondPassChecker processing time: %lu, %.3f seconds\n speakerRecognition processing time: %lu, %.3f seconds",  (uint8_t *)&v11,  0x3Eu);
  }

- (void)_handleSecondPassSuccess:(id)a3
{
  id v4 = a3;
  id v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = v5;
    float v7 = (char *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v61 = 136315394;
    __int16 v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
    __int16 v63 = 2114;
    __int16 v64 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:",  (uint8_t *)&v61,  0x16u);
  }

  -[CSVoiceTriggerSecondPass _reportModelProcessingLatency](self, "_reportModelProcessingLatency");
  uint64_t v8 = mach_absolute_time();
  id v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    float v10 = v9;
    int v11 = (char *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v61 = 136315650;
    __int16 v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
    __int16 v63 = 2114;
    __int16 v64 = v11;
    __int16 v65 = 2048;
    double v66 = *(double *)&v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Marking SecondPassTriggerMachAbsoluteTime: %llu",  (uint8_t *)&v61,  0x20u);
  }

  self->_secondPassHasMadeDecision = 1;
  kdebug_trace(722472288LL, 0LL, 0LL, 0LL, 0LL);
  id v12 = [v4 mutableCopy];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v8));
  [v12 setObject:v13 forKey:kVTEItriggerFireMachTime];

  float v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kVTEITriggeredPhId]);
  id v15 = [v14 unsignedIntegerValue];

  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass config](self, "config"));
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 phraseConfigs]);
  id v18 = [v17 count];

  __int16 v19 = 0LL;
  if (v18 > v15)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass config](self, "config"));
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 phraseConfigs]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndex:v15]);

    if (v19)
    {
      [v19 twoShotFeedbackDelay];
      double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
      uint64_t v23 = kVTEItwoShotAudibleFeedbackDelay;
      [v12 setObject:v22 forKey:kVTEItwoShotAudibleFeedbackDelay];

      if (self->_firstPassSource == 7)
      {
        [v19 remoraTwoShotFeedbackDelay];
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
        [v12 setObject:v24 forKey:v23];
      }
    }
  }

  -[CSPhraseNDEAPIScorer currentShadowMicScore](self->_phraseNDEAPIScorer, "currentShadowMicScore");
  int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v12 setObject:v25 forKey:kVTEIShadowMicScore];

  -[CSPhraseNDEAPIScorer shadowMicScoreThresholdForVAD](self->_phraseNDEAPIScorer, "shadowMicScoreThresholdForVAD");
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v12 setObject:v26 forKey:kVTEIShadowMicScoreThresholdForVAD];

  -[CSVoiceTriggerSecondPass _addDeviceStatusInfoToDict:](self, "_addDeviceStatusInfoToDict:", v12);
  id v27 = v12;

  -[CSVoiceTriggerSecondPass _resetUpTime](self, "_resetUpTime");
  -[CSVoiceTriggerAwareZeroFilter flush](self->_zeroFilter, "flush");
  -[CSVoiceTriggerSecondPass _didStopAudioStream](self, "_didStopAudioStream");
  -[CSVoiceTriggerSecondPass _handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:]( self,  "_handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:",  1LL,  v27,  0LL,  0LL);
  double v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioStream](self, "audioStream"));

  if (v28)
  {
    float v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass audioStream](self, "audioStream"));
    [v29 stopAudioStreamWithOption:0 completion:0];
  }

  else
  {
    double v30 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v61 = 136315138;
      __int16 v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s audioStream not existing",  (uint8_t *)&v61,  0xCu);
    }
  }

  int v31 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerDataCollector sharedInstance]( &OBJC_CLASS___CSVoiceTriggerDataCollector,  "sharedInstance"));
  [v31 addVTAcceptEntryAndSubmit:v27];

  uint64_t v32 = kVTEItriggerEndMachTime;
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:kVTEItriggerEndMachTime]);

  if (v33)
  {
    os_signpost_id_t v34 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    float v35 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    uint64_t v36 = v35;
    if (v34 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      unint64_t v39 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    }

    else
    {
      if (os_signpost_enabled(v35))
      {
        unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v32]);
        int v38 = (const char *)[v37 unsignedLongLongValue];
        int v61 = 134349570;
        __int16 v62 = v38;
        __int16 v63 = 2080;
        __int16 v64 = "SiriX";
        __int16 v65 = 2080;
        double v66 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v36,  OS_SIGNPOST_INTERVAL_BEGIN,  v34,  "VoiceTriggerLatency",  "%{public, signpost.description:begin_time}llu, %s %s",  (uint8_t *)&v61,  0x20u);
      }

      unint64_t v39 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_signpost_enabled(v39))
      {
        int v61 = 134349570;
        __int16 v62 = (const char *)v8;
        __int16 v63 = 2080;
        __int16 v64 = "SiriX";
        __int16 v65 = 2080;
        double v66 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v39,  OS_SIGNPOST_INTERVAL_END,  v34,  "VoiceTriggerLatency",  "%{public, signpost.description:end_time}llu, %s %s",  (uint8_t *)&v61,  0x20u);
      }
    }

    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v32]);
    id v41 = (const char *)(v8 - (void)[v40 unsignedLongValue]);

    __int16 v42 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      float v43 = v42;
      +[CSFTimeUtils hostTimeToSeconds:](&OBJC_CLASS___CSFTimeUtils, "hostTimeToSeconds:", v41);
      int v61 = 136315650;
      __int16 v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
      __int16 v63 = 2048;
      __int16 v64 = v41;
      __int16 v65 = 2048;
      double v66 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%s Reporting VT Latency: %lu, %.3f seconds",  (uint8_t *)&v61,  0x20u);
    }

    float v45 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v32]);
    unint64_t v46 = (const char *)[v45 unsignedLongValue];

    +[CSFTimeUtils hostTimeToSeconds:](&OBJC_CLASS___CSFTimeUtils, "hostTimeToSeconds:", v41);
    -[CSVoiceTriggerSecondPass _reportDiagnosticsForDelayedVTLaunchIfNeeded:]( self,  "_reportDiagnosticsForDelayedVTLaunchIfNeeded:");
    unint64_t firstPassFireHostTime = self->_firstPassFireHostTime;
    if (firstPassFireHostTime)
    {
      float v48 = &v46[-firstPassFireHostTime];
      if ((unint64_t)v46 >= firstPassFireHostTime)
      {
        __int16 v54 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          float v55 = v54;
          +[CSFTimeUtils hostTimeToSeconds:](&OBJC_CLASS___CSFTimeUtils, "hostTimeToSeconds:", v48);
          int v61 = 136315650;
          __int16 v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
          __int16 v63 = 2048;
          __int16 v64 = v48;
          __int16 v65 = 2048;
          double v66 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s Reporting First Pass fire ahead: %lu, %.3f seconds",  (uint8_t *)&v61,  0x20u);
        }
      }

      else
      {
        os_signpost_id_t v49 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
        __int16 v50 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        unint64_t v51 = v50;
        if (v49 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          __int16 v52 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        }

        else
        {
          if (os_signpost_enabled(v50))
          {
            int v61 = 134349570;
            __int16 v62 = v46;
            __int16 v63 = 2080;
            __int16 v64 = "SiriX";
            __int16 v65 = 2080;
            double v66 = COERCE_DOUBLE("enableTelemetry=YES");
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v51,  OS_SIGNPOST_INTERVAL_BEGIN,  v49,  "firstPassReportFireLatency",  "%{public, signpost.description:begin_time}llu, %s %s",  (uint8_t *)&v61,  0x20u);
          }

          __int16 v52 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_signpost_enabled(v52))
          {
            unint64_t v53 = self->_firstPassFireHostTime;
            int v61 = 134349570;
            __int16 v62 = (const char *)v53;
            __int16 v63 = 2080;
            __int16 v64 = "SiriX";
            __int16 v65 = 2080;
            double v66 = COERCE_DOUBLE("enableTelemetry=YES");
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v52,  OS_SIGNPOST_INTERVAL_END,  v49,  "firstPassReportFireLatency",  "%{public, signpost.description:end_time}llu, %s %s",  (uint8_t *)&v61,  0x20u);
          }
        }

        unint64_t v57 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          id v58 = (const char *)(self->_firstPassFireHostTime - (void)v46);
          id v59 = v57;
          +[CSFTimeUtils hostTimeToSeconds:](&OBJC_CLASS___CSFTimeUtils, "hostTimeToSeconds:", v58);
          int v61 = 136315650;
          __int16 v62 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
          __int16 v63 = 2048;
          __int16 v64 = v58;
          __int16 v65 = 2048;
          double v66 = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%s Reporting First Pass fire delay: %lu, %.3f seconds",  (uint8_t *)&v61,  0x20u);
        }
      }
    }
  }
}

- (void)_reportDiagnosticsForDelayedVTLaunchIfNeeded:(float)a3
{
  if (a3 > 20.0)
  {
    id v5 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      float v7 = v5;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
      int v10 = 136315650;
      int v11 = "-[CSVoiceTriggerSecondPass _reportDiagnosticsForDelayedVTLaunchIfNeeded:]";
      __int16 v12 = 2048;
      double v13 = a3;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Report unexpectedly long launch latency %{publlic}.3f AudioTimeConverter: %@",  (uint8_t *)&v10,  0x20u);
    }

    float v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    [v6 submitVoiceTriggerIssueReport:kCSDiagnosticReporterVoiceTriggerLaunchDelayTooHigh];
  }

- (void)_logUptimeWithVTSwitchChanged:(BOOL)a3 VTEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[CSUtils systemUpTime](&OBJC_CLASS___CSUtils, "systemUpTime");
  double v8 = v7;
  double lastAggTime = self->_lastAggTime;
  if (lastAggTime > 0.0)
  {
    double v10 = v8 - lastAggTime;
    if (v5)
    {
      if (v4)
      {
        self->_cumulativeDowntime = v10 + self->_cumulativeDowntime;
        int v11 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v12 = v11;
          double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
          int v16 = 136315650;
          __int16 v17 = "-[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:]";
          __int16 v18 = 2114;
          __int16 v19 = v13;
          __int16 v20 = 2050;
          double v21 = v10;
          __int16 v14 = "%s CSVoiceTriggerSecondPass[%{public}@]:VT switch toggled: VoiceTrigger has been INACTIVE for an interva"
                "l of %{public}5.3f seconds.";
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x20u);
        }
      }

      else
      {
        self->_cumulativeUptime = v10 + self->_cumulativeUptime;
        id v15 = (void *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v12 = v15;
          double v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
          int v16 = 136315650;
          __int16 v17 = "-[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:]";
          __int16 v18 = 2114;
          __int16 v19 = v13;
          __int16 v20 = 2050;
          double v21 = v10;
          __int16 v14 = "%s CSVoiceTriggerSecondPass[%{public}@]:VT switch toggled: VoiceTrigger has been ACTIVE for an interval "
                "of %{public}5.3f seconds.";
          goto LABEL_10;
        }
      }
    }

    else if (v4)
    {
      self->_cumulativeUptime = v10 + self->_cumulativeUptime;
    }

    else
    {
      self->_cumulativeDowntime = v10 + self->_cumulativeDowntime;
    }
  }

  self->_double lastAggTime = v8;
}

- (void)_resetUpTime
{
  self->_cumulativeUptime = 0.0;
  self->_cumulativeDowntime = 0.0;
  id v3 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = v3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v6 = 136315394;
    double v7 = "-[CSVoiceTriggerSecondPass _resetUpTime]";
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:VoiceTrigger uptime/downtime reset",  (uint8_t *)&v6,  0x16u);
  }

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A1498;
  v5[3] = &unk_10022EFA8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(queue, v5);
}

- (void)_handleVoiceTriggerFirstPassFromAOP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[CSConfig channelForProcessedInput](&OBJC_CLASS___CSConfig, "channelForProcessedInput");
  self->_unint64_t activeChannel = (unint64_t)v11;
  -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", v11);
  uint64_t v49 = 0LL;
  __int16 v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  uint64_t v52 = 0LL;
  uint64_t v45 = 0LL;
  unint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  uint64_t v48 = 0LL;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000A1404;
  v44[3] = &unk_10022BF28;
  v44[4] = &v49;
  v44[5] = &v45;
  -[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:]( self,  "_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:",  v8,  v44);
  unint64_t v12 = v46[3];
  self->_unint64_t secondPassTimeout = v12;
  +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
  float v14 = v13;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  if ((float)(v14 * v15) < (float)v12)
  {
    int v16 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v37 = (id)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t secondPassTimeout = self->_secondPassTimeout;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      float v40 = v39;
      +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
      *(_DWORD *)buf = 136315906;
      __int16 v54 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
      __int16 v55 = 2114;
      id v56 = v37;
      __int16 v57 = 2050;
      double v58 = (float)((float)secondPassTimeout / v40);
      __int16 v59 = 2050;
      double v60 = v41;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the max size of %{ public}.2fs, set to max size",  buf,  0x2Au);
    }

    +[CSConfig inputRecordingDurationInSecs](&OBJC_CLASS___CSConfig, "inputRecordingDurationInSecs");
    float v18 = v17;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_unint64_t secondPassTimeout = (unint64_t)(float)(v18 * v19);
  }

  __int16 v20 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    unint64_t v22 = self->_secondPassTimeout;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    *(_DWORD *)buf = 136315906;
    __int16 v54 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
    __int16 v55 = 2114;
    id v56 = v21;
    __int16 v57 = 2050;
    double v58 = *(double *)&v22;
    __int16 v59 = 2050;
    double v60 = (float)((float)v22 / v23);
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs)",  buf,  0x2Au);
  }

  if (CSIsIOS(v24, v25)
    && (+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS") & 1) == 0)
  {
    unsigned int v26 = +[CSUtils supportZeroFilter:]( &OBJC_CLASS___CSUtils,  "supportZeroFilter:",  +[CSConfig inputRecordingNumberOfChannels]( &OBJC_CLASS___CSConfig,  "inputRecordingNumberOfChannels")) ^ 1;
  }

  else
  {
    unsigned int v26 = 0;
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v28 = [v27 programmableAudioInjectionEnabled];

  if ((v26 & ~v28 & 1) != 0)
  {
    float v29 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      double v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      *(_DWORD *)buf = 136315394;
      __int16 v54 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
      __int16 v55 = 2114;
      id v56 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:Using zero filter for AOP trigger",  buf,  0x16u);
    }

    int v31 = objc_alloc_init(&OBJC_CLASS___CSVoiceTriggerAwareZeroFilter);
    zeroFilter = self->_zeroFilter;
    self->_zeroFilter = v31;

    -[CSVoiceTriggerAwareZeroFilter setDelegate:](self->_zeroFilter, "setDelegate:", self);
    __int16 v33 = self->_zeroFilter;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    -[CSVoiceTriggerAwareZeroFilter resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:]( v33,  "resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:",  1LL,  0LL);
  }

  os_signpost_id_t v34 = objc_alloc_init(&OBJC_CLASS___CSAudioStartStreamOption);
  -[CSAudioStartStreamOption setRequestHistoricalAudioDataWithHostTime:]( v34,  "setRequestHistoricalAudioDataWithHostTime:",  1LL);
  -[CSAudioStartStreamOption setStartRecordingHostTime:](v34, "setStartRecordingHostTime:", v50[3]);
  -[CSAudioStartStreamOption setStartAlertBehavior:](v34, "setStartAlertBehavior:", 0LL);
  -[CSAudioStartStreamOption setStopAlertBehavior:](v34, "setStopAlertBehavior:", 0LL);
  -[CSAudioStartStreamOption setErrorAlertBehavior:](v34, "setErrorAlertBehavior:", 0LL);
  float v35 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000A1420;
  v42[3] = &unk_10022E650;
  id v36 = v10;
  id v43 = v36;
  -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:",  v35,  v9,  v34,  v42);
  -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v36);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
}

- (void)_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, void, unint64_t))a4;
  uint64_t v8 = mach_absolute_time();
  LODWORD(v9) = 1.5;
  id v10 = +[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v9);
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  float v12 = v11;
  float v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trigger-time"]);

  float v14 = &AFBTProductIDSupportsAnnounce_ptr;
  if (!v13)
  {
    int v16 = (_BYTE *)(v8 - (void)v10);
    unint64_t AOPVTTriggerLength = (unint64_t)(float)(v12 * 1.5);
    uint64_t v24 = (void *)CSLogCategoryVT;
    if (!os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    uint64_t v25 = v24;
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    int v47 = 136315394;
    uint64_t v48 = "-[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:]";
    __int16 v49 = 2114;
    __int16 v50 = v26;
    _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get AOP trigger-time",  (uint8_t *)&v47,  0x16u);
    goto LABEL_14;
  }

  float v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trigger-time"]);
  int v16 = [v15 unsignedLongLongValue];

  +[CSFTimeUtils hostTimeToSeconds:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeToSeconds:",  mach_absolute_time() - (void)v16);
  float v18 = v17;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  self->_unint64_t timeBasedEstimatedTriggerLength = (unint64_t)(float)(v18 * v19);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trigger-length"]);
  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"trigger-length"]);
    p_unint64_t AOPVTTriggerLength = &self->_AOPVTTriggerLength;
    self->_unint64_t AOPVTTriggerLength = (unint64_t)[v21 unsignedLongValue];
  }

  else
  {
    p_unint64_t AOPVTTriggerLength = &self->_AOPVTTriggerLength;
    self->_unint64_t AOPVTTriggerLength = self->_timeBasedEstimatedTriggerLength;
  }

  unint64_t AOPVTTriggerLength = self->_AOPVTTriggerLength;
  config = self->_config;
  unint64_t v28 = AOPVTTriggerLength;
  if (!config)
  {
LABEL_10:
    if (v28 < 0x13881) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  if ((-[CSVoiceTriggerSecondPassConfig useTimeBasedTriggerLength](config, "useTimeBasedTriggerLength") & 1) == 0)
  {
    unint64_t v28 = *p_AOPVTTriggerLength;
    goto LABEL_10;
  }

- (void)_addRejectStatsToDict:(id)a3
{
  id v12 = a3;
  +[CSUtils systemUpTime](&OBJC_CLASS___CSUtils, "systemUpTime");
  double v4 = v3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerStatistics sharedInstance](&OBJC_CLASS___CSVoiceTriggerStatistics, "sharedInstance"));
  [v5 getLastPHSRejectTime];
  double v7 = v6;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerStatistics sharedInstance](&OBJC_CLASS___CSVoiceTriggerStatistics, "sharedInstance"));
  id v9 = [v8 getPHSRejectCount];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v9));
  [v12 setObject:v10 forKey:kVTEILastConsecutivePHSRejects];

  if (v9)
  {
    float v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4 - v7));
    [v12 setObject:v11 forKey:kVTEIDeltaTimeFromlastPHSReject];
  }

  else
  {
    [v12 setObject:&off_100238958 forKey:kVTEIDeltaTimeFromlastPHSReject];
  }
}

- (void)_addDeviceStatusInfoToDict:(id)a3
{
  id v11 = a3;
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kVTEItriggerStartMachTime]);
  id v4 = [v3 longLongValue];

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSGestureMonitor sharedInstance](&OBJC_CLASS___CSGestureMonitor, "sharedInstance"));
    id v6 = [v5 isTriggerHandheld];

    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSSiriAssertionMonitor sharedInstance](&OBJC_CLASS___CSSiriAssertionMonitor, "sharedInstance"));
    id v8 = [v7 isEnabled];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
    [v11 setObject:v9 forKey:kVTEIDeviceHandHeld];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    [v11 setObject:v10 forKey:kVTEISiriIsActiveOrOtherAssertion];
  }
}

- (void)_getDidWakeAP:(id)a3
{
  self->_didWakeAP = 0;
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"trigger-woke-ap"]);
    BOOL v5 = v4;
    if (v4)
    {
      double v7 = v4;
      unsigned int v6 = [v4 BOOLValue];
      BOOL v5 = v7;
      if (v6) {
        self->_didWakeAP = 1;
      }
    }
  }

- (void)_addPHSInfoToVTEI:(id)a3 fromSpeakerInfo:(id)a4 withThreshold:(float)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = kSSRSpeakerRecognitionKnownUserScoresKey;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey]);

  if (v10
    && (id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]),
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]),
        float v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]),
        v12,
        v11,
        v13))
  {
    uint64_t v14 = kSSRSpeakerRecognitionKnownUserPSRScoresKey;
    float v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRScoresKey]);

    if (v15)
    {
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v14]);
      float v17 = v16;
      if (v16)
      {
        float v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v13]);

        if (v18)
        {
          float v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v13]);
          [v20 floatValue];
          int v22 = v21;

          float v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v13]);
          [v23 floatValue];
          int v25 = v24;

          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionCombinationWeight]);
          [v26 floatValue];
          int v28 = v27;

          LODWORD(v29) = v22;
          double v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v29));
          [v7 setObject:v30 forKey:kVTEItdsrCombinedScore];

          LODWORD(v31) = v25;
          float v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v31));
          [v7 setObject:v32 forKey:kVTEItdsrScore];

          *(float *)&double v33 = a5;
          os_signpost_id_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v33));
          [v7 setObject:v34 forKey:kVTEItdsrCombinedThreshold];

          LODWORD(v35) = v28;
          float v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v35));
          [v7 setObject:v36 forKey:kVTEItdsrCombinationWeight];
        }
      }
    }

    uint64_t v37 = kSSRSpeakerRecognitionKnownUserSATScoresKey;
    double v38 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATScoresKey]);

    if (v38)
    {
      float v39 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v37]);
      id v40 = v39;
      if (v39)
      {
        double v41 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v13]);

        if (v41)
        {
          __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:v13]);
          [v42 floatValue];
          int v44 = v43;

          LODWORD(v45) = v44;
          unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v45));
          [v7 setObject:v46 forKey:kVTEIsatScore];

          *(float *)&double v47 = a5;
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v47));
          [v7 setObject:v48 forKey:kVTEIsatThreshold];
        }
      }
    }

    uint64_t v49 = kSSRSpeakerRecognitionSATAdditionalContextKey;
    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionSATAdditionalContextKey]);

    if (v50)
    {
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v49]);
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 objectForKeyedSubscript:kSSRSpeakerRecognitionNumSpeakerVector]);
      unint64_t v53 = v52;
      if (v52)
      {
        __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:v13]);

        if (v54)
        {
          __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:v13]);
          id v56 = [v55 unsignedIntegerValue];

          __int16 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v56));
          [v7 setObject:v57 forKey:kVTEIsatNumberTrainingUtterances];
        }
      }
    }

    uint64_t v58 = kSSRSpeakerRecognitionPSRAdditionalContextKey;
    __int16 v59 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionPSRAdditionalContextKey]);

    if (v59)
    {
      double v60 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v58]);
      int v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:kSSRSpeakerRecognitionNumSpeakerVector]);
      __int16 v62 = v61;
      if (v61)
      {
        __int16 v63 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:v13]);

        if (v63)
        {
          __int16 v64 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:v13]);
          id v65 = [v64 unsignedIntegerValue];

          double v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v65));
          [v7 setObject:v66 forKey:kVTEIsatNumberTrainingUtterances];
        }
      }
    }

    uint64_t v67 = kSSRSpeakerRecognitionNumEnrollmentUtterances;
    __int16 v68 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionNumEnrollmentUtterances]);

    if (v68)
    {
      double v69 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v67]);
      __int16 v70 = v69;
      if (v69)
      {
        double v71 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKeyedSubscript:v13]);

        if (v71)
        {
          __int16 v72 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:v13]);
          id v73 = [v72 unsignedIntegerValue];

          __int16 v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v73));
          [v7 setObject:v74 forKey:kVTEINumHSUtterances];
        }
      }
    }

    uint64_t v75 = kSSRSpeakerRecognitionKnownUserPSRExpScoresKey;
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRExpScoresKey]);

    if (v76)
    {
      unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v75]);
      v78 = v77;
      if (v77)
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKeyedSubscript:v13]);

        if (v79)
        {
          __int16 v80 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKeyedSubscript:v13]);
          [v80 floatValue];
          int v82 = v81;

          LODWORD(v83) = v82;
          __int16 v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v83));
          [v7 setObject:v84 forKey:kVTEItriggerExplicitTDSRSatScore];
        }
      }
    }

    uint64_t v85 = kSSRSpeakerRecognitionKnownUserSATExpScoresKey;
    uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATExpScoresKey]);

    if (v86)
    {
      unint64_t v87 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v85]);
      __int16 v88 = v87;
      if (v87)
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue([v87 objectForKeyedSubscript:v13]);

        if (v89)
        {
          id v90 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:v13]);
          [v90 floatValue];
          int v92 = v91;

          LODWORD(v93) = v92;
          __int16 v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v93));
          [v7 setObject:v94 forKey:kVTEItriggerExplicitSatScore];
        }
      }
    }
  }

  else
  {
    uint64_t v95 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v96 = 136315394;
      uint64_t v97 = "-[CSVoiceTriggerSecondPass _addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:]";
      __int16 v98 = 2112;
      id v99 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_ERROR,  "%s ERR: No known voice profile reported in %@",  (uint8_t *)&v96,  0x16u);
    }

    float v13 = 0LL;
  }
}

- (void)_handlePHSResults:(id)a3 voiceTriggerEventInfo:(id)a4 forPhId:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [a4 mutableCopy];
  uint64_t v9 = kSSRSpeakerRecognitionKnownUserScoresKey;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRScoresKey]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATScoresKey]);
  float v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserPSRExpScoresKey]);
  int v96 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserSATExpScoresKey]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);
  id v15 = [v14 count];

  if (v15)
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSSRSpeakerRecognitionPSRAdditionalContextKey]);
    uint64_t v17 = kSSRSpeakerRecognitionNumSpeakerVector;
    float v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:kSSRSpeakerRecognitionNumSpeakerVector]);

    float v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kSSRSpeakerRecognitionSATAdditionalContextKey]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v17]);

    __int16 v94 = v20;
    if (v18)
    {
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v18 allValues]);
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
      unsigned int v88 = [v22 unsignedIntValue];

      __int16 v20 = v94;
    }

    else
    {
      unsigned int v88 = -1;
    }

    v89 = v18;
    if (v20)
    {
      int v24 = (void *)objc_claimAutoreleasedReturnValue([v20 allValues]);
      int v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);
      unsigned int v87 = [v25 unsignedIntValue];
    }

    else
    {
      unsigned int v87 = -1;
    }

    double v93 = -1000.0;
    id v90 = v10;
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 firstObject]);
    [v27 floatValue];
    float v29 = v28;

    double v30 = (void *)objc_claimAutoreleasedReturnValue([v11 allValues]);
    double v31 = (void *)objc_claimAutoreleasedReturnValue([v30 firstObject]);
    double v32 = -1000.0;
    double v33 = v13;
    if (v31)
    {
      os_signpost_id_t v34 = (void *)objc_claimAutoreleasedReturnValue([v11 allValues]);
      double v35 = (void *)objc_claimAutoreleasedReturnValue([v34 firstObject]);
      [v35 floatValue];
      float v37 = v36;

      float v13 = v33;
      double v32 = v37;
    }

    double v86 = v32;
    int v92 = v11;

    double v38 = (void *)objc_claimAutoreleasedReturnValue([v12 allValues]);
    float v39 = (void *)objc_claimAutoreleasedReturnValue([v38 firstObject]);
    id v40 = v12;
    double v41 = -1000.0;
    if (v39)
    {
      __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v40 allValues]);
      int v43 = (void *)objc_claimAutoreleasedReturnValue([v42 firstObject]);
      [v43 floatValue];
      float v45 = v44;

      float v13 = v33;
      double v41 = v45;
    }

    int v91 = v40;

    unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v13 allValues]);
    double v47 = (void *)objc_claimAutoreleasedReturnValue([v46 firstObject]);
    double v48 = -1000.0;
    if (v47)
    {
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v13 allValues]);
      __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 firstObject]);
      [v50 floatValue];
      float v52 = v51;

      double v48 = v52;
    }

    unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v96 allValues]);
    __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 firstObject]);
    if (v54)
    {
      __int16 v55 = (void *)objc_claimAutoreleasedReturnValue([v96 allValues]);
      id v56 = (void *)objc_claimAutoreleasedReturnValue([v55 firstObject]);
      [v56 floatValue];
      double v93 = v57;
    }

    -[CSAsset satScoreThresholdForPhId:](self->_currentAsset, "satScoreThresholdForPhId:", a5);
    float v59 = v58;
    -[CSVoiceTriggerSecondPass _addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:]( self,  "_addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:",  v8,  v7);
    if (CSIsInternalBuild(-[CSVoiceTriggerSecondPass _addRejectStatsToDict:](self, "_addRejectStatsToDict:", v8)))
    {
      double v60 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
      unsigned int v61 = [v60 isReducedPHSThresholdEnabled];

      if (v61)
      {
        __int16 v62 = (os_log_s *)CSLogCategoryVT;
        float v59 = 0.0;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "%s Override PHS threshold to 0", buf, 0xCu);
        }
      }
    }

    __int16 v63 = (void *)CSLogCategoryVT;
    BOOL v64 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    if (v29 >= v59)
    {
      float v13 = v33;
      __int16 v72 = v89;
      if (v64)
      {
        unint64_t v77 = v63;
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        *(_DWORD *)buf = 136317442;
        __int16 v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
        __int16 v99 = 2114;
        double v100 = v78;
        __int16 v101 = 2050;
        double v102 = v29;
        __int16 v103 = 1026;
        unsigned int v104 = v87;
        __int16 v105 = 1026;
        unsigned int v106 = v88;
        __int16 v107 = 2050;
        double v108 = v86;
        __int16 v109 = 2050;
        double v110 = v48;
        __int16 v111 = 2050;
        double v112 = v41;
        __int16 v113 = 2050;
        double v114 = v93;
        __int16 v115 = 2050;
        double v116 = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Accept: Score %{public}.3f(%{public}d, %{public}d), PSR = [%{publi c}.3f, %{public}.3f], SAT = [%{public}.3f, %{public}.3f] Threshold %{public}f \n",  buf,  0x5Eu);
      }

      objc_msgSend(v8, "setObject:forKey:", &__kCFBooleanTrue, kVTEIsatTriggered, *(void *)&v86);
      v79 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerStatistics sharedInstance]( &OBJC_CLASS___CSVoiceTriggerStatistics,  "sharedInstance"));
      [v79 resetPHSRejectCount];

      -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v8);
      id v12 = v91;
      id v11 = v92;
      id v10 = v90;
      __int16 v80 = v94;
    }

    else
    {
      if (v64)
      {
        id v65 = v63;
        double v66 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
        *(_DWORD *)buf = 136317442;
        __int16 v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
        __int16 v99 = 2114;
        double v100 = v66;
        __int16 v101 = 2050;
        double v102 = v29;
        __int16 v103 = 1026;
        unsigned int v104 = v87;
        __int16 v105 = 1026;
        unsigned int v106 = v88;
        __int16 v107 = 2050;
        double v108 = v86;
        __int16 v109 = 2050;
        double v110 = v48;
        __int16 v111 = 2050;
        double v112 = v41;
        __int16 v113 = 2050;
        double v114 = v93;
        __int16 v115 = 2050;
        double v116 = v59;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Reject: Score %{public}f(%{public}d, %{public}d) PSR = [%{public}. 3f, %{public}.3f], SAT = [%{public}.3f, %{public}.3f] Threshold %{public}f \n",  buf,  0x5Eu);
      }

      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kVTEItriggerScore, *(void *)&v86));
      [v67 floatValue];
      float v69 = v68;

      [v8 setObject:&__kCFBooleanFalse forKey:kVTEIsatTriggered];
      __int16 v70 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs"));
      id v71 = [v70 count];

      __int16 v72 = v89;
      if ((unint64_t)v71 <= a5)
      {
        float v76 = INFINITY;
      }

      else
      {
        id v73 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs"));
        __int16 v74 = (void *)objc_claimAutoreleasedReturnValue([v73 objectAtIndex:a5]);
        [v74 keywordRejectLoggingThreshold];
        float v76 = v75;
      }

      id v12 = v91;
      id v11 = v92;
      float v13 = v33;
      __int16 v80 = v94;
      id v10 = v90;
      if (v29 >= self->_phsRejectLoggingThreshold && v69 >= v76)
      {
        int v81 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerDataCollector sharedInstance]( &OBJC_CLASS___CSVoiceTriggerDataCollector,  "sharedInstance"));
        [v81 addVTRejectEntry:v8 truncateData:0];
      }

      int v82 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerStatistics sharedInstance]( &OBJC_CLASS___CSVoiceTriggerStatistics,  "sharedInstance"));
      [v82 incrementPHSRejectCount];

      -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]( self,  "_notifySecondPassReject:result:isSecondChanceCandidate:",  v8,  9LL,  0LL);
    }
  }

  else
  {
    float v23 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      double v83 = v23;
      __int16 v84 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      double v85 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]));
      *(_DWORD *)buf = 136315650;
      __int16 v98 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
      __int16 v99 = 2114;
      double v100 = v84;
      __int16 v101 = 2114;
      double v102 = v85;
      _os_log_error_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_ERROR,  "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: Failed to retrieve PHS score, letting trigger through - %{public}@",  buf,  0x20u);
    }

    -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v8);
  }
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)CSLogCategoryVT;
  BOOL v6 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    id v8 = v5;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[CSVoiceTriggerSecondPass CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    __int16 v15 = 2114;
    int v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:audiomxd/bridgeaudiod recovered from crash",  buf,  0x16u);
  }

  uint64_t v10 = CSIsHorseman(v6, v7);
  if ((v10 & 1) != 0 || CSHasAOP(v10))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A13FC;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A13F4;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A13E8;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A13D8;
  v5[3] = &unk_10022E8F8;
  v5[4] = self;
  float v6 = a4;
  dispatch_async(queue, v5);
}

- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  unint64_t v9 = (unint64_t)[v8 length] >> 2;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter"));
  id v11 = [v10 sampleCountFromHostTime:a5];

  id v12 = objc_alloc(&OBJC_CLASS___CSAudioChunk);
  uint64_t v13 = +[CSConfig inputRecordingSampleByteDepth](&OBJC_CLASS___CSConfig, "inputRecordingSampleByteDepth");
  LOBYTE(v14) = +[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat");
  id v15 = [v12 initWithData:v8 numChannels:1 numSamples:v9 sampleByteDepth:v13 startSampleCount:v11 hostTime:a5 remoteVAD:0 isFloat:v14];

  -[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]( self,  "_handleAudioChunk:shouldPreprocessedByZeroFilter:",  v15,  0LL);
}

- (id)_getFirstPassTriggerSourceAsString:(unint64_t)a3
{
  if (a3 <= 0xE && ((0x7BFFu >> a3) & 1) != 0) {
    double v3 = (__CFString *)*(id *)*(&off_10022C0B8 + a3);
  }
  else {
    double v3 = &stru_10022F858;
  }

  return v3;
}

- (void)_logSecondPassResult:(unint64_t)a3 withVTEI:(id)a4
{
  id v6 = a4;
  uint64_t v7 = kVTEIrecognizerScore;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEIrecognizerScore]);
  float v9 = 0.0;
  float v10 = 0.0;
  if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
    [v11 floatValue];
    float v10 = v12;
  }

  uint64_t v13 = kVTEItriggerScore;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEItriggerScore]);
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
    [v15 floatValue];
    float v9 = v16;
  }

  uint64_t v17 = kVTEIsatScore;
  float v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEIsatScore]);
  double v19 = 0.0;
  double v20 = 0.0;
  if (v18)
  {
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v17]);
    [v21 floatValue];
    float v23 = v22;

    double v20 = v23;
  }

  uint64_t v24 = kVTEItdsrScore;
  int v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEItdsrScore]);
  if (v25)
  {
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v24]);
    [v26 floatValue];
    double v19 = v27;
  }

  double v67 = v19;

  uint64_t v28 = kVTEItdsrCombinedScore;
  float v29 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEItdsrCombinedScore]);
  double v30 = 0.0;
  double v31 = 0.0;
  if (v29)
  {
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v28]);
    [v32 floatValue];
    double v31 = v33;
  }

  uint64_t v34 = kVTEItotalSamplesAtEndOfCapture;
  double v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEItotalSamplesAtEndOfCapture]);
  if (v35)
  {
    float v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v34]);
    float v37 = (float)(unint64_t)[v36 unsignedIntegerValue];
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    double v30 = (float)(v37 / v38);
  }

  uint64_t v39 = kVTEIeffectiveThreshold;
  id v40 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEIeffectiveThreshold]);
  double v41 = 0.0;
  double v42 = 0.0;
  if (v40)
  {
    int v43 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v39]);
    [v43 floatValue];
    double v42 = v44;
  }

  uint64_t v45 = kVTEItdsrCombinedThreshold;
  unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEItdsrCombinedThreshold]);
  if (v46)
  {
    double v47 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v45]);
    [v47 floatValue];
    double v41 = v48;
  }

  uint64_t v49 = kVTEIsatNumberTrainingUtterances;
  __int16 v50 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEIsatNumberTrainingUtterances]);
  if (v50)
  {
    float v51 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v49]);
    id v52 = [v51 unsignedIntegerValue];
  }

  else
  {
    id v52 = 0LL;
  }

  uint64_t v53 = kVTEIfirstPassTriggerSource;
  __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEIfirstPassTriggerSource]);
  if (v54) {
    __int16 v55 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v53]);
  }
  else {
    __int16 v55 = @"n/a";
  }

  id v56 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPass stringForSecondPassResult:]( &OBJC_CLASS___CSVoiceTriggerSecondPass,  "stringForSecondPassResult:",  a3));
  float v57 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale"));
  float v58 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kVTEITriggeredPhId]);
  id v59 = [v58 unsignedIntegerValue];

  double v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecondPass Result Summary: \nLocale: %@\nAllowMultiPhrase: %d\nFirstPassSource: %@\nAnalyzedSecs: %.3f\nNdapiScore: %.3f\nCheckerScore: %.3f\nCombinedVTScore: %.3f\nEffectiveThreshold: %.3f\n",  v57,  self->_supportsMph,  v55,  *(void *)&v30,  (float)(v9 - v10),  v10,  v9,  *(void *)&v42));
  unsigned int v61 = v60;
  if (self->_speakerRecognitionController)
  {
    uint64_t v62 = objc_claimAutoreleasedReturnValue( objc_msgSend( v60,  "stringByAppendingFormat:",  @"\nPHS Summary: \nDNNScore: %.3f\nLSTMScore: %.3f\nCombinedPHSScore: %.3f\nNumSATVectors: %lu\ntdsrCombinedThreshold: %.3f\n",  *(void *)&v20,  *(void *)&v67,  *(void *)&v31,  v52,  *(void *)&v41));

    unsigned int v61 = (void *)v62;
  }

  __int16 v63 = (void *)objc_claimAutoreleasedReturnValue(+[CSPowerLogger sharedPowerLogger](&OBJC_CLASS___CSPowerLogger, "sharedPowerLogger"));
  *(float *)&double v64 = v9;
  [v63 powerLogSecondPassWithResult:a3 withSecondPassScore:v59 withPhId:v64];

  id v65 = (void *)objc_claimAutoreleasedReturnValue([v61 stringByAppendingFormat:@"\nDecision: %@", v56]);
  double v66 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    float v69 = "-[CSVoiceTriggerSecondPass _logSecondPassResult:withVTEI:]";
    __int16 v70 = 2114;
    id v71 = v65;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "KeyLog - %s %{public}@", buf, 0x16u);
  }
}

- (BOOL)_shouldLogMediaplayState:(unint64_t)a3
{
  uint64_t v4 = (uint64_t)+[CSUtils supportHearstVoiceTrigger](&OBJC_CLASS___CSUtils, "supportHearstVoiceTrigger");
  if (!(_DWORD)v4 || (uint64_t v4 = 1LL, a3 != 3) && a3 != 6)
  {
    uint64_t v6 = CSIsIOS(v4, v5);
    if ((_DWORD)v6 && a3 - 1 < 0xB && ((0x581u >> (a3 - 1)) & 1) != 0)
    {
      LOBYTE(v4) = 1;
    }

    else
    {
      LOBYTE(v4) = CSIsHorseman(v6, v7);
      if (a3 != 1) {
        LOBYTE(v4) = 0;
      }
    }
  }

  return v4;
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_float secondPassAnalyzerStartSampleCount = 0LL;
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_unint64_t secondPassAnalyzerStartSampleCount = a3;
    uint64_t v4 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerSecondPass UUID](self, "UUID"));
      unint64_t secondPassAnalyzerStartSampleCount = self->_secondPassAnalyzerStartSampleCount;
      int v8 = 136315650;
      float v9 = "-[CSVoiceTriggerSecondPass _setStartAnalyzeTime:]";
      __int16 v10 = 2114;
      id v11 = v6;
      __int16 v12 = 2050;
      unint64_t v13 = secondPassAnalyzerStartSampleCount;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerSecondPass[%{public}@]:set StartAnalyzeSampleCount = %{public}llu",  (uint8_t *)&v8,  0x20u);
    }
  }

- (void)_handleResultCompletion:(unint64_t)a3 voiceTriggerInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v14 = a4;
  id v10 = a6;
  -[CSVoiceTriggerSecondPass _logSecondPassResult:withVTEI:](self, "_logSecondPassResult:withVTEI:", a3, v14);
  resultCompletion = (void (**)(id, CSVoiceTriggerSecondPassResultHolder *, id))self->_resultCompletion;
  if (resultCompletion)
  {
    __int16 v12 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassResultHolder),  "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:",  a3,  v14,  v7);
    resultCompletion[2](resultCompletion, v12, v10);

    id v13 = self->_resultCompletion;
    self->_resultCompletion = 0LL;
  }
}

- (void)_scheduleSecondPassCompletionWatchDog
{
  double v3 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  objc_storeStrong((id *)&self->_secondPassCompleteWatchDogToken, v3);
  uint64_t v4 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    double secondPassCompleteWatchDogTimeoutSec = self->_secondPassCompleteWatchDogTimeoutSec;
    *(_DWORD *)buf = 136315650;
    id v15 = "-[CSVoiceTriggerSecondPass _scheduleSecondPassCompletionWatchDog]";
    __int16 v16 = 2114;
    uint64_t v17 = secondPassCompleteWatchDogToken;
    __int16 v18 = 2050;
    double v19 = secondPassCompleteWatchDogTimeoutSec;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Schedule secondPassComplete WDT %{public}@ for %{public}lf seconds",  buf,  0x20u);
  }

  dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(float)(self->_secondPassCompleteWatchDogTimeoutSec * 1000000000.0));
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A139C;
  block[3] = &unk_10022F0D8;
  objc_copyWeak(&v12, &location);
  id v11 = v3;
  float v9 = v3;
  dispatch_after(v7, queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_scheduleDidStartSecondPassCompletionWatchDogWithToken:(id)a3
{
  uint64_t v4 = (NSUUID *)a3;
  uint64_t v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    int v11 = 136315650;
    id v12 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
    __int16 v13 = 2114;
    double v14 = *(double *)&v4;
    __int16 v15 = 2114;
    __int16 v16 = secondPassCompleteWatchDogToken;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s secondPassComplete WDT did fire : %{public}@, currentToken : %{public}@",  (uint8_t *)&v11,  0x20u);
  }

  if (-[NSUUID isEqual:](v4, "isEqual:", self->_secondPassCompleteWatchDogToken))
  {
    -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]( self,  "_notifySecondPassReject:result:isSecondChanceCandidate:",  0LL,  10LL,  0LL);
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    [v7 submitVoiceTriggerIssueReport:kCSDiagnosticReporterVoiceTriggerSecondPassCompleteWatchDogFire];

    int v8 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      double secondPassCompleteWatchDogTimeoutSec = self->_secondPassCompleteWatchDogTimeoutSec;
      int v11 = 136315650;
      id v12 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
      __int16 v13 = 2050;
      double v14 = secondPassCompleteWatchDogTimeoutSec;
      __int16 v15 = 2114;
      __int16 v16 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Secondpass didn't complete within %{public}lf seconds with token: %{public}@",  (uint8_t *)&v11,  0x20u);
    }
  }

  else
  {
    id v10 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s secondPassComplete WDT token doesn't match. Ignore this fire",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)_clearSecondPassCompletionWatchDog
{
  double v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    int v6 = 136315394;
    dispatch_time_t v7 = "-[CSVoiceTriggerSecondPass _clearSecondPassCompletionWatchDog]";
    __int16 v8 = 2114;
    float v9 = secondPassCompleteWatchDogToken;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Clearing secondPassCompletion WatchDogTimer : %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  uint64_t v5 = self->_secondPassCompleteWatchDogToken;
  self->_secondPassCompleteWatchDogToken = 0LL;
}

- (void)adBlockerHasMatchWithVoiceTrigger:(BOOL)a3
{
  if (!a3)
  {
    unint64_t firstPassSource = self->_firstPassSource;
    if (firstPassSource == 11 || firstPassSource == 1)
    {
      int v6 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        __int16 v8 = "-[CSVoiceTriggerSecondPass adBlockerHasMatchWithVoiceTrigger:]";
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Adblocker notified second pass will reject",  (uint8_t *)&v7,  0xCu);
      }

      if (self->_resultCompletion) {
        -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]( self,  "_notifySecondPassReject:result:isSecondChanceCandidate:",  0LL,  11LL,  0LL);
      }
      else {
        self->_isAdBlockerMatchedBeforeSetResultCompletion = 1;
      }
    }
  }

- (void)setResultCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_isAdBlockerMatchedBeforeSetResultCompletion)
  {
    int v6 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[CSVoiceTriggerSecondPass setResultCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Ads is detected before result completion is set. Notifying VT reject because Ads was detected",  (uint8_t *)&v11,  0xCu);
    }

    self->_isAdBlockerMatchedBeforeSetResultCompletion = 0;
    id v7 = objc_retainBlock(v5);
    id resultCompletion = self->_resultCompletion;
    self->_id resultCompletion = v7;

    -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]( self,  "_notifySecondPassReject:result:isSecondChanceCandidate:",  0LL,  11LL,  0LL);
  }

  else
  {
    id v9 = objc_retainBlock(v4);
    id v10 = self->_resultCompletion;
    self->_id resultCompletion = v9;
  }
}

- (id)_voiceTriggerSecondPassLatencyMetrics
{
  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (!secondPassLatencyMetrics)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___CSVTSecondPassLatencyMetrics);
    uint64_t v5 = self->_secondPassLatencyMetrics;
    self->_secondPassLatencyMetrics = v4;

    secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  }

  return secondPassLatencyMetrics;
}

- (void)_resetVoiceTriggerLatencyMetrics
{
  firstpassMetrics = self->_firstpassMetrics;
  self->_firstpassMetrics = 0LL;

  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  self->_secondPassLatencyMetrics = 0LL;
}

- (void)_unmapForPrewarmLoadedGraph
{
  double v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t prewarmMmapedSize = self->_prewarmMmapedSize;
    int v6 = 136315394;
    id v7 = "-[CSVoiceTriggerSecondPass _unmapForPrewarmLoadedGraph]";
    __int16 v8 = 2048;
    unint64_t v9 = prewarmMmapedSize;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s unmapping for graph with size: %lu",  (uint8_t *)&v6,  0x16u);
  }

  size_t v5 = self->_prewarmMmapedSize;
  if (v5)
  {
    munmap(self->_prewarmModelGraph, v5);
    self->_unint64_t prewarmMmapedSize = 0LL;
    self->_prewarmModelGraph = 0LL;
  }

- (BOOL)_isFirstPassSourceExclave:(unint64_t)a3
{
  return a3 - 11 < 4;
}

- (void)_syncVoiceProfileEmbeddingsToExclave
{
  ssrContext = self->_ssrContext;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000A109C;
  v6[3] = &unk_10022C040;
  v6[4] = self;
  +[SSRSpeakerProfileEmbeddingExtractor extractPSRVoiceProfileWithContext:completion:]( &OBJC_CLASS___SSRSpeakerProfileEmbeddingExtractor,  "extractPSRVoiceProfileWithContext:completion:",  ssrContext,  v6);
  id v4 = self->_ssrContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A121C;
  v5[3] = &unk_10022C040;
  v5[4] = self;
  +[SSRSpeakerProfileEmbeddingExtractor extractSATVoiceProfileWithContext:completion:]( &OBJC_CLASS___SSRSpeakerProfileEmbeddingExtractor,  "extractSATVoiceProfileWithContext:completion:",  v4,  v5);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (float)secondPassCompleteWatchDogTimeoutSec
{
  return self->_secondPassCompleteWatchDogTimeoutSec;
}

- (void)setSecondPassCompleteWatchDogTimeoutSec:(float)a3
{
  self->_double secondPassCompleteWatchDogTimeoutSec = a3;
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
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

- (CSVoiceTriggerSecondPassConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (void)setAudioProviderUUID:(id)a3
{
}

- (CSPhraseDetector)phraseDetector
{
  return self->_phraseDetector;
}

- (void)setPhraseDetector:(id)a3
{
}

- (CSPhraseNDEAPIScorer)phraseNDEAPIScorer
{
  return self->_phraseNDEAPIScorer;
}

- (void)setPhraseNDEAPIScorer:(id)a3
{
}

- (SSRSpeakerRecognitionController)speakerRecognitionController
{
  return self->_speakerRecognitionController;
}

- (void)setSpeakerRecognitionController:(id)a3
{
}

- (SSRSpeakerRecognitionContext)ssrContext
{
  return self->_ssrContext;
}

- (void)setSsrContext:(id)a3
{
}

- (id)resultCompletion
{
  return self->_resultCompletion;
}

- (unint64_t)secondPassTimeout
{
  return self->_secondPassTimeout;
}

- (void)setSecondPassTimeout:(unint64_t)a3
{
  self->_unint64_t secondPassTimeout = a3;
}

- (unint64_t)numProcessedSamples
{
  return self->_numProcessedSamples;
}

- (void)setNumProcessedSamples:(unint64_t)a3
{
  self->_unint64_t numProcessedSamples = a3;
}

- (unint64_t)numAnalyzedSamples
{
  return self->_numAnalyzedSamples;
}

- (void)setNumAnalyzedSamples:(unint64_t)a3
{
  self->_numAnalyzedSamples = a3;
}

- (float)secondPassPrependingSec
{
  return self->_secondPassPrependingSec;
}

- (void)setSecondPassPrependingSec:(float)a3
{
  self->_float secondPassPrependingSec = a3;
}

- (float)phsRejectLoggingThreshold
{
  return self->_phsRejectLoggingThreshold;
}

- (void)setPhsRejectLoggingThreshold:(float)a3
{
  self->_phsRejectLoggingThreshold = a3;
}

- (unint64_t)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (void)setExtraSamplesAtStart:(unint64_t)a3
{
  self->_unint64_t extraSamplesAtStart = a3;
}

- (unint64_t)analyzerPrependingSamples
{
  return self->_analyzerPrependingSamples;
}

- (void)setAnalyzerPrependingSamples:(unint64_t)a3
{
  self->_unint64_t analyzerPrependingSamples = a3;
}

- (unint64_t)analyzerTrailingSamples
{
  return self->_analyzerTrailingSamples;
}

- (void)setAnalyzerTrailingSamples:(unint64_t)a3
{
  self->_unint64_t analyzerTrailingSamples = a3;
}

- (BOOL)shouldUsePHS
{
  return self->_shouldUsePHS;
}

- (void)setShouldUsePHS:(BOOL)a3
{
  self->_shouldUsePHS = a3;
}

- (unint64_t)earlyDetectFiredMachTime
{
  return self->_earlyDetectFiredMachTime;
}

- (void)setEarlyDetectFiredMachTime:(unint64_t)a3
{
  self->_earlyDetectFiredMachTime = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_unint64_t activeChannel = a3;
}

- (unint64_t)selectedChannelFromFirstPass
{
  return self->_selectedChannelFromFirstPass;
}

- (void)setSelectedChannelFromFirstPass:(unint64_t)a3
{
  self->_unint64_t selectedChannelFromFirstPass = a3;
}

- (unint64_t)processedSampleCountsInPending
{
  return self->_processedSampleCountsInPending;
}

- (void)setProcessedSampleCountsInPending:(unint64_t)a3
{
  self->_processedSampleCountsInPending = a3;
}

- (unint64_t)firstPassTriggerStartSampleCount
{
  return self->_firstPassTriggerStartSampleCount;
}

- (void)setFirstPassTriggerStartSampleCount:(unint64_t)a3
{
  self->_unint64_t firstPassTriggerStartSampleCount = a3;
}

- (unint64_t)firstPassTriggerFireSampleCount
{
  return self->_firstPassTriggerFireSampleCount;
}

- (void)setFirstPassTriggerFireSampleCount:(unint64_t)a3
{
  self->_firstPassTriggerFireSampleCount = a3;
}

- (NSDictionary)firstPassChannelSelectionScores
{
  return self->_firstPassChannelSelectionScores;
}

- (void)setFirstPassChannelSelectionScores:(id)a3
{
}

- (float)firstPassChannelSelectionDelaySeconds
{
  return self->_firstPassChannelSelectionDelaySeconds;
}

- (void)setFirstPassChannelSelectionDelaySeconds:(float)a3
{
  self->_firstPassChannelSelectionDelaySeconds = a3;
}

- (float)firstPassMasterChannelScoreBoost
{
  return self->_firstPassMasterChannelScoreBoost;
}

- (void)setFirstPassMasterChannelScoreBoost:(float)a3
{
  self->_firstPassMasterChannelScoreBoost = a3;
}

- (float)firstPassVoiceIsolationChannelScoreBoost
{
  return self->_firstPassVoiceIsolationChannelScoreBoost;
}

- (void)setFirstPassVoiceIsolationChannelScoreBoost:(float)a3
{
  self->_firstPassVoiceIsolationChannelScoreBoost = a3;
}

- (float)firstPassOnsetScore
{
  return self->_firstPassOnsetScore;
}

- (void)setFirstPassOnsetScore:(float)a3
{
  self->_firstPassOnsetScore = a3;
}

- (unint64_t)firstPassOnsetChannel
{
  return self->_firstPassOnsetChannel;
}

- (void)setFirstPassOnsetChannel:(unint64_t)a3
{
  self->_firstPassOnsetChannel = a3;
}

- (unint64_t)firstPassFireHostTime
{
  return self->_firstPassFireHostTime;
}

- (void)setFirstPassFireHostTime:(unint64_t)a3
{
  self->_unint64_t firstPassFireHostTime = a3;
}

- (BOOL)didWakeAP
{
  return self->_didWakeAP;
}

- (void)setDidWakeAP:(BOOL)a3
{
  self->_didWakeAP = a3;
}

- (BOOL)hasTriggerCandidate
{
  return self->_hasTriggerCandidate;
}

- (void)setHasTriggerCandidate:(BOOL)a3
{
  self->_hasTriggerCandidate = a3;
}

- (BOOL)isStartSampleCountMarked
{
  return self->_isStartSampleCountMarked;
}

- (void)setIsStartSampleCountMarked:(BOOL)a3
{
  self->_isStartSampleCountMarked = a3;
}

- (unint64_t)secondPassAnalyzerStartSampleCount
{
  return self->_secondPassAnalyzerStartSampleCount;
}

- (void)setSecondPassAnalyzerStartSampleCount:(unint64_t)a3
{
  self->_unint64_t secondPassAnalyzerStartSampleCount = a3;
}

- (double)lastAggTime
{
  return self->_lastAggTime;
}

- (void)setLastAggTime:(double)a3
{
  self->_double lastAggTime = a3;
}

- (double)cumulativeUptime
{
  return self->_cumulativeUptime;
}

- (void)setCumulativeUptime:(double)a3
{
  self->_cumulativeUptime = a3;
}

- (double)cumulativeDowntime
{
  return self->_cumulativeDowntime;
}

- (void)setCumulativeDowntime:(double)a3
{
  self->_cumulativeDowntime = a3;
}

- (unint64_t)secondPassCheckerExecutionTime
{
  return self->_secondPassCheckerExecutionTime;
}

- (void)setSecondPassCheckerExecutionTime:(unint64_t)a3
{
  self->_unint64_t secondPassCheckerExecutionTime = a3;
}

- (CSAudioCircularBuffer)audioBuffer
{
  return (CSAudioCircularBuffer *)objc_loadWeakRetained((id *)&self->_audioBuffer);
}

- (void)setAudioBuffer:(id)a3
{
}

- (unint64_t)firstPassSource
{
  return self->_firstPassSource;
}

- (NSString)firstPassDeviceId
{
  return self->_firstPassDeviceId;
}

- (unint64_t)secondPassClient
{
  return self->_secondPassClient;
}

- (NSString)currentLocale
{
  return self->_currentLocale;
}

- (void)setCurrentLocale:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (BOOL)secondPassHasMadeDecision
{
  return self->_secondPassHasMadeDecision;
}

- (void)setSecondPassHasMadeDecision:(BOOL)a3
{
  self->_secondPassHasMadeDecision = a3;
}

- (int64_t)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setMediaPlayingState:(int64_t)a3
{
  self->_int64_t mediaPlayingState = a3;
}

- (float)mediaVolume
{
  return self->_mediaVolume;
}

- (void)setMediaVolume:(float)a3
{
  self->_mediaVolume = a3;
}

- (NSUUID)secondPassCompleteWatchDogToken
{
  return self->_secondPassCompleteWatchDogToken;
}

- (void)setSecondPassCompleteWatchDogToken:(id)a3
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

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)exclaveAudioTimeConverter
{
  return self->_exclaveAudioTimeConverter;
}

- (void)setExclaveAudioTimeConverter:(id)a3
{
}

- (NSMutableDictionary)storedFirstPassInfo
{
  return self->_storedFirstPassInfo;
}

- (void)setStoredFirstPassInfo:(id)a3
{
}

- (NSUUID)secondPassRejectionMHUUID
{
  return self->_secondPassRejectionMHUUID;
}

- (void)setSecondPassRejectionMHUUID:(id)a3
{
}

- (BOOL)hasLoggedSecondPass
{
  return self->_hasLoggedSecondPass;
}

- (void)setHasLoggedSecondPass:(BOOL)a3
{
  self->_hasLoggedSecondPass = a3;
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (void)setFirstpassMetrics:(id)a3
{
}

- (CSVTSecondPassLatencyMetrics)secondPassLatencyMetrics
{
  return self->_secondPassLatencyMetrics;
}

- (void)setSecondPassLatencyMetrics:(id)a3
{
}

- (BOOL)supportsMph
{
  return self->_supportsMph;
}

- (void)setSupportsMph:(BOOL)a3
{
  self->_supportsMph = a3;
}

- (CSVoiceTriggerAwareZeroFilter)zeroFilter
{
  return self->_zeroFilter;
}

- (void)setZeroFilter:(id)a3
{
}

- (unint64_t)prewarmMmapedSize
{
  return self->_prewarmMmapedSize;
}

- (void)setPrewarmMmapedSize:(unint64_t)a3
{
  self->_unint64_t prewarmMmapedSize = a3;
}

- (void)prewarmModelGraph
{
  return self->_prewarmModelGraph;
}

- (void)setPrewarmModelGraph:(void *)a3
{
  self->_prewarmModelGraph = a3;
}

- (int)modelFileDescriptor
{
  return self->_modelFileDescriptor;
}

- (void)setModelFileDescriptor:(int)a3
{
  self->_modelFileDescriptor = a3;
}

- (BOOL)isPSRAudioFlushed
{
  return self->_isPSRAudioFlushed;
}

- (void)setIsPSRAudioFlushed:(BOOL)a3
{
  self->_isPSRAudioFlushed = a3;
}

- (unint64_t)AOPVTTriggerLength
{
  return self->_AOPVTTriggerLength;
}

- (void)setAOPVTTriggerLength:(unint64_t)a3
{
  self->_unint64_t AOPVTTriggerLength = a3;
}

- (unint64_t)timeBasedEstimatedTriggerLength
{
  return self->_timeBasedEstimatedTriggerLength;
}

- (void)setTimeBasedEstimatedTriggerLength:(unint64_t)a3
{
  self->_unint64_t timeBasedEstimatedTriggerLength = a3;
}

- (CSExclaveSecondPassVoiceTriggerAnalyzing)exclaveClient
{
  return self->_exclaveClient;
}

- (void)setExclaveClient:(id)a3
{
}

- (BOOL)isAdBlockerMatchedBeforeSetResultCompletion
{
  return self->_isAdBlockerMatchedBeforeSetResultCompletion;
}

- (void)setIsAdBlockerMatchedBeforeSetResultCompletion:(BOOL)a3
{
  self->_isAdBlockerMatchedBeforeSetResultCompletion = a3;
}

- (BOOL)cancelSecondPassTrigger
{
  return self->_cancelSecondPassTrigger;
}

- (void)setCancelSecondPassTrigger:(BOOL)a3
{
  self->_BOOL cancelSecondPassTrigger = a3;
}

- (os_unfair_lock_s)secondpassTriggerCancellationLock
{
  return self->_secondpassTriggerCancellationLock;
}

- (void)setSecondpassTriggerCancellationLock:(os_unfair_lock_s)a3
{
  self->_secondpassTriggerCancellationLock = a3;
}

- (void).cxx_destruct
{
}

+ (id)secondPassAudioLoggingFilePathWithDeviceId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPass secondPassAudioLogDirectory]( &OBJC_CLASS___CSVoiceTriggerSecondPass,  "secondPassAudioLogDirectory"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[CSVoiceTriggerSecondPass timeStampString](&OBJC_CLASS___CSVoiceTriggerSecondPass, "timeStampString"));
  int v6 = (void *)v5;
  if (v3) {
    id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@.wav",  v5,  v3,  @"-activation");
  }
  else {
    id v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.wav",  v5,  @"-activation",  v11);
  }
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:v8]);
  return v9;
}

+ (id)secondPassAudioLogDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 voiceTriggerAudioLogDirectory]);

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0LL;
  }

  else
  {
    id v11 = 0LL;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      id v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        unint64_t v9 = v7;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        __int16 v13 = "+[CSVoiceTriggerSecondPass secondPassAudioLogDirectory]";
        __int16 v14 = 2114;
        __int16 v15 = v4;
        __int16 v16 = 2114;
        uint64_t v17 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      id v4 = @"/tmp";
    }
  }

  return v4;
}

+ (id)timeStampString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

+ (id)stringForSecondPassResult:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"n/a";
  }
  else {
    return off_10022C060[a3];
  }
}

@end