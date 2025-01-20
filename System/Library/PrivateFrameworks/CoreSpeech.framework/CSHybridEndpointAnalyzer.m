@interface CSHybridEndpointAnalyzer
- (BOOL)_multimodalEndpointerEnabled;
- (BOOL)_shouldProvideTwoShotFeedbackWithRecordContext;
- (BOOL)canProcessCurrentRequest;
- (BOOL)didAddAudio;
- (BOOL)didCommunicateEndpoint;
- (BOOL)didDetectSpeech;
- (BOOL)didNotifyTwoShot;
- (BOOL)didReceiveASRFeatures;
- (BOOL)didTimestampFirstAudioPacket;
- (BOOL)epResult;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeout;
- (BOOL)recordingDidStop;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)speechEndpointDetected;
- (BOOL)useDefaultASRFeaturesOnClientLag;
- (CSASRFeatures)lastKnownASRFeatures;
- (CSAsset)currentAsset;
- (CSAudioRecordContext)recordContext;
- (CSEndpointAnalyzerDelegate)delegate;
- (CSEndpointAnalyzerImplDelegate)implDelegate;
- (CSHybridEndpointAnalyzer)init;
- (NSDate)firstAudioPacketTimestamp;
- (NSDate)lastASRFeatureTimestamp;
- (NSMutableArray)asrFeatureLatencies;
- (NSString)endpointerModelVersion;
- (NSString)mhId;
- (OSDAnalyzer)osdAnalyzer;
- (OSDFeatures)lastKnownOSDFeatures;
- (OSDFeatures)osdFeaturesAtEndpoint;
- (OS_dispatch_queue)apQueue;
- (OS_dispatch_queue)asrFeaturesQueue;
- (OS_dispatch_queue)hybridClassifierQueue;
- (OS_dispatch_queue)osdQueue;
- (OS_dispatch_queue)stateSerialQueue;
- (_EAREndpointer)hybridClassifier;
- (double)asrFeaturesWarmupLatency;
- (double)automaticEndpointingSuspensionEndTime;
- (double)clampedASRFeatureLatencyMsForClientLag;
- (double)clientLagThresholdMs;
- (double)delay;
- (double)endWaitTime;
- (double)firstAudioSampleSensorTimestamp;
- (double)hepAudioOriginInMs;
- (double)interspeechWaitTime;
- (double)lastEndOfVoiceActivityTime;
- (double)lastKnownASRFeatureLatency;
- (double)lastReportedEndpointTimeMs;
- (double)lastStartOfVoiceActivityTime;
- (double)minimumDurationForEndpointer;
- (double)postVoiceTriggerSilence;
- (double)processedAudioInSeconds;
- (double)startWaitTime;
- (double)twoShotSilenceThresholdInMs;
- (double)vtExtraAudioAtStartInMs;
- (float)lastEndpointPosterior;
- (id)_getCSHybridEndpointerConfigForAsset:(id)a3;
- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4;
- (int64_t)endpointStyle;
- (int64_t)fetchCurrentEndpointerOperationMode;
- (unint64_t)activeChannel;
- (unint64_t)anchorMachAbsTime;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)numSamplesProcessed;
- (unint64_t)numSamplesProcessedBeforeAnchorTime;
- (unint64_t)vtEndInSampleCount;
- (void)CSAssetManagerDidDownloadNewAsset:(id)a3;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)_emitEndpointDetectedEventWithEndpointTimeMs:(double)a3 endpointBufferHostTime:(unint64_t)a4 endpointerFeatures:(id)a5 endpointerDecisionLagInNs:(double)a6 extraDelayMs:(unint64_t)a7 endpointScore:(double)a8 asrFeaturesLatencies:(id)a9;
- (void)_loadAndSetupEndpointerAssetIfNecessary;
- (void)_readParametersFromHEPAsset:(id)a3;
- (void)_updateAssetWithCurrentLanguage;
- (void)_updateAssetWithLanguage:(id)a3;
- (void)handleVoiceTriggerWithActivationInfo:(id)a3;
- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnchorMachAbsTime:(unint64_t)a3;
- (void)setApQueue:(id)a3;
- (void)setAsrFeatureLatencies:(id)a3;
- (void)setAsrFeaturesQueue:(id)a3;
- (void)setAsrFeaturesWarmupLatency:(double)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setCanProcessCurrentRequest:(BOOL)a3;
- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3;
- (void)setClientLagThresholdMs:(double)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAddAudio:(BOOL)a3;
- (void)setDidCommunicateEndpoint:(BOOL)a3;
- (void)setDidDetectSpeech:(BOOL)a3;
- (void)setDidNotifyTwoShot:(BOOL)a3;
- (void)setDidReceiveASRFeatures:(BOOL)a3;
- (void)setDidTimestampFirstAudioPacket:(BOOL)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointStyle:(int64_t)a3;
- (void)setEndpointerModelVersion:(id)a3;
- (void)setEpResult:(BOOL)a3;
- (void)setFirstAudioPacketTimestamp:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setHepAudioOriginInMs:(double)a3;
- (void)setHybridClassifier:(id)a3;
- (void)setHybridClassifierQueue:(id)a3;
- (void)setImplDelegate:(id)a3;
- (void)setInterspeechWaitTime:(double)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeout:(BOOL)a3;
- (void)setLastASRFeatureTimestamp:(id)a3;
- (void)setLastEndpointPosterior:(float)a3;
- (void)setLastKnownASRFeatureLatency:(double)a3;
- (void)setLastKnownASRFeatures:(id)a3;
- (void)setLastKnownOSDFeatures:(id)a3;
- (void)setLastReportedEndpointTimeMs:(double)a3;
- (void)setMhId:(id)a3;
- (void)setMinimumDurationForEndpointer:(double)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3;
- (void)setOsdAnalyzer:(id)a3;
- (void)setOsdFeaturesAtEndpoint:(id)a3;
- (void)setOsdQueue:(id)a3;
- (void)setPostVoiceTriggerSilence:(double)a3;
- (void)setProcessedAudioInSeconds:(double)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingDidStop:(BOOL)a3;
- (void)setSaveSamplesSeenInReset:(BOOL)a3;
- (void)setSpeechEndpointDetected:(BOOL)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setStateSerialQueue:(id)a3;
- (void)setTwoShotSilenceThresholdInMs:(double)a3;
- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)stopEndpointer;
- (void)terminateProcessing;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
@end

@implementation CSHybridEndpointAnalyzer

- (CSHybridEndpointAnalyzer)init
{
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS___CSHybridEndpointAnalyzer;
  v2 = -[CSHybridEndpointAnalyzer init](&v57, "init");
  v3 = v2;
  if (v2)
  {
    v2->_didCommunicateEndpoint = 0;
    v2->_speechEndpointDetected = 0;
    v2->_didAddAudio = 0;
    v2->_vtEndInSampleCount = 0LL;
    v2->_numSamplesProcessed = 0LL;
    v2->_lastEndpointPosterior = 0.0;
    v5 = 0LL;
    if ((+[CSUtils supportsDispatchWorkloop](&OBJC_CLASS___CSUtils, "supportsDispatchWorkloop") & 1) == 0) {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils rootQueueWithFixedPriority:]( &OBJC_CLASS___CSUtils,  "rootQueueWithFixedPriority:",  kCSDefaultSerialQueueFixedPriority));
    }
    id v6 = objc_msgSend((id)objc_opt_class(v3, v4), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.stateserialqueue",  v8));

    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:]( v3,  "_getSerialQueueWithName:targetQueue:",  v9,  v5));
    stateSerialQueue = v3->_stateSerialQueue;
    v3->_stateSerialQueue = (OS_dispatch_queue *)v10;

    id v13 = objc_msgSend((id)objc_opt_class(v3, v12), "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.asrFeaturesQueue",  v15));

    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:]( v3,  "_getSerialQueueWithName:targetQueue:",  v16,  v5));
    asrFeaturesQueue = v3->_asrFeaturesQueue;
    v3->_asrFeaturesQueue = (OS_dispatch_queue *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSLanguageCodeUpdateMonitor sharedInstance]( &OBJC_CLASS___CSLanguageCodeUpdateMonitor,  "sharedInstance"));
    [v19 addObserver:v3];

    v20 = objc_alloc_init(&OBJC_CLASS___CSAssetDownloadingOption);
    -[CSAssetDownloadingOption setAllowEndpointAssetDownloading:](v20, "setAllowEndpointAssetDownloading:", 1LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
    [v21 setAssetDownloadingOption:v20];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
    [v22 addObserver:v3 forAssetType:1];

    v23 = (dispatch_queue_s *)v3->_stateSerialQueue;
    block = _NSConcreteStackBlock;
    uint64_t v53 = 3221225472LL;
    v54 = sub_100088114;
    v55 = &unk_10022F100;
    v24 = v3;
    v56 = v24;
    dispatch_async(v23, &block);
    id v26 = objc_msgSend((id)objc_opt_class(v24, v25), "description");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 lowercaseString]);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.apQueue",  v28,  block,  v53,  v54,  v55));

    uint64_t v30 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:]( v24,  "_getSerialQueueWithName:targetQueue:",  v29,  v5));
    apQueue = v24->_apQueue;
    v24->_apQueue = (OS_dispatch_queue *)v30;

    id v33 = objc_msgSend((id)objc_opt_class(v24, v32), "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lowercaseString]);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.hybridClassifierfQueue",  v35));

    uint64_t v37 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:]( v24,  "_getSerialQueueWithName:targetQueue:",  v36,  v5));
    hybridClassifierQueue = v24->_hybridClassifierQueue;
    v24->_hybridClassifierQueue = (OS_dispatch_queue *)v37;

    id v40 = objc_msgSend((id)objc_opt_class(v24, v39), "description");
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 lowercaseString]);
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.osdQueue",  v42));

    uint64_t v44 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:]( v24,  "_getSerialQueueWithName:targetQueue:",  v43,  v5));
    osdQueue = v24->_osdQueue;
    v24->_osdQueue = (OS_dispatch_queue *)v44;

    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v24->_currentRequestSampleRate = (unint64_t)v46;
    v47 = -[CSASRFeatures initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:]( objc_alloc(&OBJC_CLASS___CSASRFeatures),  "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudio DurationInMilliseconds:acousticEndpointerScore:",  0LL,  0LL,  &__NSArray0__struct,  @"SearchOrMessaging",  0LL,  8.98999977,  0.997685015,  0.0);
    lastKnownASRFeatures = v24->_lastKnownASRFeatures;
    v24->_lastKnownASRFeatures = v47;

    v24->_lastKnownASRFeatureLatency = -0.01;
    v24->_epResult = 0;
    v49 = -[OSDFeatures initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:]( objc_alloc(&OBJC_CLASS___OSDFeatures),  "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:",  0.0,  0.0,  0.0,  0.0);
    lastKnownOSDFeatures = v24->_lastKnownOSDFeatures;
    v24->_lastKnownOSDFeatures = v49;

    *(_OWORD *)&v24->_clientLagThresholdMs = xmmword_10018B330;
    v24->_useDefaultASRFeaturesOnClientLag = 1;
  }

  return v3;
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  v5 = (dispatch_queue_s *)a4;
  if (v5) {
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2( (const char *)[a3 UTF8String], 0, v5);
  }
  else {
    dispatch_queue_t v6 = (dispatch_queue_t)objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  a3,  kCSDefaultSerialQueueFixedPriority));
  }
  dispatch_queue_t v7 = v6;

  return v7;
}

- (void)_loadAndSetupEndpointerAssetIfNecessary
{
  currentAsset = self->_currentAsset;
  if (currentAsset)
  {
LABEL_2:
    -[CSHybridEndpointAnalyzer _readParametersFromHEPAsset:](self, "_readParametersFromHEPAsset:", currentAsset);
    uint64_t v4 = objc_alloc(&OBJC_CLASS____EAREndpointer);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](self->_currentAsset, "path"));
    id v18 = 0LL;
    dispatch_queue_t v6 = -[_EAREndpointer initWithConfiguration:modelVersion:](v4, "initWithConfiguration:modelVersion:", v5, &v18);
    dispatch_queue_t v7 = (NSString *)v18;

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
      [v8 submitEndpointerIssueReport:kCSDiagnosticReporterEndpointerModelVersionIsNil];

      v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "%s endpointerModelVersion is still nil after fetching it from EAREndpointer",  buf,  0xCu);
      }
    }

    endpointerModelVersion = self->_endpointerModelVersion;
    self->_endpointerModelVersion = v7;

    return;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
  uint64_t v12 = (CSAsset *)objc_claimAutoreleasedReturnValue([v11 assetForCurrentLanguageOfType:1]);
  id v13 = self->_currentAsset;
  self->_currentAsset = v12;

  currentAsset = self->_currentAsset;
  v14 = (void *)CSLogContextFacilityCoreSpeech;
  BOOL v15 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (currentAsset)
  {
    if (v15)
    {
      v16 = v14;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](currentAsset, "path"));
      *(_DWORD *)buf = 136315650;
      v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
      __int16 v21 = 2114;
      v22 = currentAsset;
      __int16 v23 = 2114;
      v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s HEP Asset: %{public}@, path: %{public}@",  buf,  0x20u);

      currentAsset = self->_currentAsset;
    }

    goto LABEL_2;
  }

  if (v15)
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "%s Failed to get HEP asset",  buf,  0xCu);
  }

- (NSString)endpointerModelVersion
{
  endpointerModelVersion = self->_endpointerModelVersion;
  if (!endpointerModelVersion)
  {
    stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008810C;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async_and_wait(stateSerialQueue, block);
    endpointerModelVersion = self->_endpointerModelVersion;
  }

  return endpointerModelVersion;
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_recordingDidStop)
  {
    dispatch_queue_t v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSHybridEndpointAnalyzer processAudioSamplesAsynchronously:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s HEP::RecordingDidStop: Ignoring processAudioSamplesAsynchronously: Not queueing",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100087CC0;
    block[3] = &unk_10022EFD0;
    block[4] = self;
    id v8 = v4;
    id v16 = v8;
    dispatch_async_and_wait(stateSerialQueue, block);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2020000000LL;
    uint64_t v19 = 0LL;
    v9 = (dispatch_queue_s *)self->_stateSerialQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100087DD4;
    v14[3] = &unk_10022EF80;
    v14[4] = self;
    v14[5] = &buf;
    dispatch_async_and_wait(v9, v14);
    apQueue = (dispatch_queue_s *)self->_apQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100087DE8;
    v11[3] = &unk_10022D958;
    v11[4] = self;
    id v12 = v8;
    p___int128 buf = &buf;
    dispatch_async(apQueue, v11);

    _Block_object_dispose(&buf, 8);
  }
}

- (void)updateEndpointerThreshold:(float)a3
{
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    dispatch_queue_t v6 = "-[CSHybridEndpointAnalyzer updateEndpointerThreshold:]";
    __int16 v7 = 2050;
    double v8 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Updated endpointer threshold: %{public}f",  (uint8_t *)&v5,  0x16u);
  }

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  BOOL v3 = a3;
  -[_EAREndpointer updateEndpointerDelayedTriggerSwitch:]( self->_hybridClassifier,  "updateEndpointerDelayedTriggerSwitch:");
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    dispatch_queue_t v6 = "-[CSHybridEndpointAnalyzer updateEndpointerDelayedTrigger:]";
    __int16 v7 = 1026;
    BOOL v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Updated endpointer delayed trigger: %{public}d",  (uint8_t *)&v5,  0x12u);
  }

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v5 = a3;
  dispatch_queue_t v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSHybridEndpointAnalyzer processASRFeatures:fromServer:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s EARSPG: CSASRFeatures: %{public}@", buf, 0x16u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  uint64_t v14 = 0LL;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100087BFC;
  block[3] = &unk_10022EF80;
  block[4] = self;
  void block[5] = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  id v8 = [v5 processedAudioDurationInMilliseconds];
  if (*(double *)(*(void *)&buf[8] + 24LL) <= (double)(uint64_t)v8)
  {
    asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100087C10;
    v10[3] = &unk_10022EFD0;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(asrFeaturesQueue, v10);
  }

  _Block_object_dispose(buf, 8);
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6 = a4;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100087700;
  block[3] = &unk_10022C878;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(hybridClassifierQueue, block);
}

- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_recordingDidStop)
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s HEP::RecordingDidStop: Ignoring silenceScoreEstimateAvailable, Not queuing",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    [v7 processedAudioMs];
    float v11 = v10;
    [v8 silenceDurationMs];
    double v13 = v12;
    uint64_t v14 = qword_10027FE50;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_10027FE50, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace(722472236LL, 0LL, 0LL, 0LL, 0LL);
      uint64_t v14 = qword_10027FE50;
    }

    qword_10027FE50 = v14 + 1;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v51 = 0x2020000000LL;
    uint64_t v52 = 0LL;
    uint64_t v43 = 0LL;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x2020000000LL;
    v42[0] = 0LL;
    v42[1] = v42;
    v42[2] = 0x2020000000LL;
    stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100086050;
    block[3] = &unk_10022CBE0;
    block[4] = self;
    void block[5] = &v43;
    void block[6] = v42;
    block[7] = &buf;
    float v41 = v11;
    dispatch_async_and_wait(stateSerialQueue, block);
    uint64_t v36 = 0LL;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2020000000LL;
    char v39 = 0;
    float v18 = v13;
    uint64_t v19 = (dispatch_queue_s *)self->_stateSerialQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100086098;
    v35[3] = &unk_10022EF80;
    v35[4] = self;
    v35[5] = &v36;
    dispatch_async_and_wait(v19, v35);
    if (*((_BYTE *)v37 + 24) && !self->_didDetectSpeech)
    {
      v20 = (dispatch_queue_s *)self->_stateSerialQueue;
      if (v11 <= 300.0 || v18 >= 0.001)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_1000861A4;
        v32[3] = &unk_10022E8F8;
        v32[4] = self;
        float v33 = v11;
        __int16 v21 = v32;
      }

      else
      {
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_1000860D0;
        v34[3] = &unk_10022EF80;
        v34[4] = self;
        v34[5] = &buf;
        __int16 v21 = v34;
      }

      dispatch_async_and_wait(v20, v21);
    }

    if (*((_BYTE *)v44 + 24))
    {
      v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)float v46 = 136315394;
        v47 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]";
        __int16 v48 = 2050;
        double v49 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s Already communicated end-pt: Not scheduling work for hybridClassifierQueue for silposnf=%{public}f",  v46,  0x16u);
      }
    }

    else
    {
      unsigned __int8 v23 = -[CSHybridEndpointAnalyzer _multimodalEndpointerEnabled](self, "_multimodalEndpointerEnabled");
      hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000862D8;
      v25[3] = &unk_10022BB98;
      v25[4] = self;
      v27 = &v43;
      float v30 = v18;
      id v26 = v8;
      p___int128 buf = &buf;
      v29 = v42;
      unsigned __int8 v31 = v23;
      dispatch_async(hybridClassifierQueue, v25);
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100086044;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
}

- (void)_emitEndpointDetectedEventWithEndpointTimeMs:(double)a3 endpointBufferHostTime:(unint64_t)a4 endpointerFeatures:(id)a5 endpointerDecisionLagInNs:(double)a6 extraDelayMs:(unint64_t)a7 endpointScore:(double)a8 asrFeaturesLatencies:(id)a9
{
  id v16 = a5;
  id v43 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  if (self->_mhId)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointFeaturesAtEndpoint);
    objc_msgSend(v17, "setWordCount:", objc_msgSend(v16, "wordCount"));
    *(float *)&double v18 = (float)(uint64_t)[v16 trailingSilenceDuration];
    objc_msgSend( v17,  "setTrailingSilenceDurationInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v18));
    [v16 clientSilenceFramesCountMs];
    *(float *)&double v19 = v19;
    objc_msgSend( v17,  "setClientSilenceFramesCountInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v19));
    [v16 endOfSentenceLikelihood];
    *(float *)&double v20 = v20;
    [v17 setEndOfSentenceLikelihood:v20];
    [v16 serverFeaturesLatency];
    objc_msgSend( v17,  "setServerFeaturesLatencyInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:"));
    [v16 clientSilenceProbability];
    *(float *)&double v21 = v21;
    [v17 setClientSilenceProbability:v21];
    *(void *)&__int128 v66 = 0LL;
    *((void *)&v66 + 1) = &v66;
    uint64_t v67 = 0x3032000000LL;
    v68 = sub_100085074;
    v69 = sub_100085084;
    id v70 = 0LL;
    uint64_t v58 = 0LL;
    v59 = &v58;
    uint64_t v60 = 0x2020000000LL;
    uint64_t v61 = 0LL;
    uint64_t v54 = 0LL;
    v55 = (double *)&v54;
    uint64_t v56 = 0x2020000000LL;
    uint64_t v57 = 0LL;
    uint64_t v50 = 0LL;
    uint64_t v51 = (double *)&v50;
    uint64_t v52 = 0x2020000000LL;
    uint64_t v53 = 0LL;
    stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100085FC0;
    block[3] = &unk_10022CBB8;
    block[4] = self;
    void block[5] = &v66;
    void block[6] = &v58;
    block[7] = &v54;
    void block[8] = &v50;
    dispatch_async_and_wait(stateSerialQueue, block);
    uint64_t v45 = 0LL;
    float v46 = &v45;
    uint64_t v47 = 0x2020000000LL;
    char v48 = 0;
    apQueue = (dispatch_queue_s *)self->_apQueue;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100086030;
    v44[3] = &unk_10022EF80;
    v44[4] = self;
    v44[5] = &v45;
    dispatch_async_and_wait(apQueue, v44);
    id v42 = objc_alloc_init(&OBJC_CLASS___SISchemaVersion);
    v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v66 + 1) + 40) configVersion]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 componentsSeparatedByString:@"."]);

    if ([v25 count] == (id)2)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:0]);
      objc_msgSend(v42, "setMajor:", objc_msgSend(v26, "intValue"));

      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:1]);
      objc_msgSend(v42, "setMinor:", objc_msgSend(v27, "intValue"));
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHStatisticDistributionInfoFromDictionary:",  v43));
    id v29 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointerTimeoutMetadata);
    [v29 setIsTimeout:self->_isRequestTimeout];
    id v30 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointDetected);
    [v30 setEndpointerType:3];
    *(float *)&double v31 = a3;
    objc_msgSend( v30,  "setEndpointAudioDurationInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v31));
    objc_msgSend( v30,  "setFirstBufferTimeInNs:",  +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", v59[3]));
    objc_msgSend( v30,  "setEndpointedBufferTimeInNs:",  +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", a4));
    [v30 setEndpointFeaturesAtEndpoint:v17];
    *(float *)&double v32 = a6;
    objc_msgSend( v30,  "setEndpointerDecisionLagInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v32));
    *(float *)&double v33 = (float)a7;
    objc_msgSend( v30,  "setExtraDelayInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v33));
    [v30 setEndpointModelConfigVersion:v42];
    [v30 setDerivedBufferTimeFromHistoricalAudio:*((unsigned __int8 *)v46 + 24)];
    double v34 = v51[3];
    *(float *)&double v34 = v34;
    objc_msgSend( v30,  "setAudioSkippedDurationInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v34));
    double v35 = v55[3];
    *(float *)&double v35 = v35;
    objc_msgSend( v30,  "setEndpointResetPositionInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v35));
    *(float *)&double v36 = a8;
    [v30 setEndpointerScore:v36];
    [v30 setAsrFeatureLatencyDistribution:v28];
    [v30 setTimeoutMetadata:v29];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHClientEventByMhUUID:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHClientEventByMhUUID:",  self->_mhId));
    [v37 setEndpointDetected:v30];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v38 emitMessage:v37];

    char v39 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      *(_DWORD *)__int128 buf = 136315394;
      v63 = "-[CSHybridEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTimeMs:endpointBufferHostTime:endpointerFea"
            "tures:endpointerDecisionLagInNs:extraDelayMs:endpointScore:asrFeaturesLatencies:]";
      __int16 v64 = 2112;
      v65 = mhId;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@",  buf,  0x16u);
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v66, 8);
  }

  else
  {
    float v41 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v66) = 136315138;
      *(void *)((char *)&v66 + 4) = "-[CSHybridEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTimeMs:endpointBu"
                                      "fferHostTime:endpointerFeatures:endpointerDecisionLagInNs:extraDelayMs:endpointSco"
                                      "re:asrFeaturesLatencies:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v66,  0xCu);
    }
  }
}

- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085A3C;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(stateSerialQueue, block);
}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4 = a3;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085820;
  block[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(stateSerialQueue, block);
}

- (void)terminateProcessing
{
  self->_recordingDidStop = 1;
  apQueue = (dispatch_queue_s *)self->_apQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085810;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(apQueue, block);
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSHybridEndpointAnalyzer recordingStoppedForReason:]";
    __int16 v8 = 2050;
    int64_t v9 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s CSHybridEndpointAnalyzer recordingStoppedForReason: %{public}ld",  (uint8_t *)&v6,  0x16u);
  }

  -[CSHybridEndpointAnalyzer terminateProcessing](self, "terminateProcessing");
}

- (void)stopEndpointer
{
  BOOL v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSHybridEndpointAnalyzer stopEndpointer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[CSHybridEndpointAnalyzer terminateProcessing](self, "terminateProcessing");
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  return 0LL;
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  self->_recordingDidStop = 0;
  __int16 v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2114;
    double v32 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s sampleRate=%{public}lu, recordContext=%{public}@",  buf,  0x20u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  double v32 = sub_100085074;
  double v33 = sub_100085084;
  id v34 = 0LL;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008508C;
  block[3] = &unk_10022D958;
  void block[4] = self;
  id v10 = v7;
  uint64_t v25 = v10;
  id v26 = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  float v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)&buf[8] + 40LL);
    *(_DWORD *)v27 = 136315394;
    *(void *)&v27[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s CSEndpointAsset exists: %{public}@",  v27,  0x16u);
  }

  if (!*(void *)(*(void *)&buf[8] + 40LL))
  {
    id v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentLanguageCode]);
      *(_DWORD *)v27 = 136315394;
      *(void *)&v27[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s No asset for CSHybridEndpointer for currentLanguage: %{public}@. Fallback to VAD2",  v27,  0x16u);
    }
  }

  apQueue = (dispatch_queue_s *)self->_apQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000850D4;
  v23[3] = &unk_10022EF80;
  v23[4] = self;
  v23[5] = buf;
  dispatch_async(apQueue, v23);
  *(void *)v27 = 0LL;
  *(void *)&v27[8] = v27;
  *(void *)&v27[16] = 0x3032000000LL;
  v28 = sub_100085074;
  id v29 = sub_100085084;
  id v30 = 0LL;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000852B0;
  v22[3] = &unk_10022BBC0;
  v22[4] = self;
  v22[5] = buf;
  v22[6] = v27;
  v22[7] = a3;
  dispatch_async_and_wait(hybridClassifierQueue, v22);
  asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100085600;
  v21[3] = &unk_10022EF80;
  v21[4] = self;
  v21[5] = v27;
  dispatch_async_and_wait(asrFeaturesQueue, v21);
  double v19 = (dispatch_queue_s *)self->_stateSerialQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100085794;
  v20[3] = &unk_10022F020;
  v20[4] = self;
  v20[5] = a3;
  dispatch_async_and_wait(v19, v20);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_readParametersFromHEPAsset:(id)a3
{
  id v4 = a3;
  asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100084E78;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(asrFeaturesQueue, v7);
}

- (double)lastEndOfVoiceActivityTime
{
  return 0.0;
}

- (double)lastStartOfVoiceActivityTime
{
  return 0.0;
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSHybridEndpointAnalyzer CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Language changed to: %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  -[CSHybridEndpointAnalyzer _updateAssetWithLanguage:](self, "_updateAssetWithLanguage:", v5);
}

- (void)CSAssetManagerDidDownloadNewAsset:(id)a3
{
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[CSHybridEndpointAnalyzer CSAssetManagerDidDownloadNewAsset:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s New hybrid endpoint asset downloaded",  (uint8_t *)&v5,  0xCu);
  }

  -[CSHybridEndpointAnalyzer _updateAssetWithCurrentLanguage](self, "_updateAssetWithCurrentLanguage");
}

- (void)_updateAssetWithLanguage:(id)a3
{
  id v4 = a3;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100084D58;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(stateSerialQueue, v7);
}

- (void)_updateAssetWithCurrentLanguage
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v4 currentLanguageCode]);
  -[CSHybridEndpointAnalyzer _updateAssetWithLanguage:](self, "_updateAssetWithLanguage:", v3);
}

- (id)_getCSHybridEndpointerConfigForAsset:(id)a3
{
  id v3 = a3;
  else {
    int v5 = @"cs_hep.json";
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 resourcePath]);

  int v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 stringByAppendingPathComponent:v5]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(v6) = [v8 fileExistsAtPath:v7];

  if ((v6 & 1) != 0)
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v7));
    if (v9)
    {
      id v17 = 0LL;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v9,  0LL,  &v17));
      id v11 = v17;
      if (v11)
      {
        uint64_t v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315650;
          double v19 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
          __int16 v20 = 2114;
          double v21 = v7;
          __int16 v22 = 2114;
          id v23 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Could not decode contents of: %{public}@: err: %{public}@",  buf,  0x20u);
        }

        id v13 = 0LL;
      }

      else
      {
        id v13 = v10;
      }
    }

    else
    {
      BOOL v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315394;
        double v19 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
        __int16 v20 = 2114;
        double v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }

      id v13 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315394;
      double v19 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
      __int16 v20 = 2114;
      double v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    }

    id v13 = 0LL;
  }

  return v13;
}

- (BOOL)_shouldProvideTwoShotFeedbackWithRecordContext
{
  unsigned __int8 v3 = -[CSAudioRecordContext isRequestFromTriggerless]( self->_recordContext,  "isRequestFromTriggerless");
  unsigned __int8 v4 = -[CSAudioRecordContext isGibraltarVoiceTriggered]( self->_recordContext,  "isGibraltarVoiceTriggered");
  return -[CSAudioRecordContext isVoiceTriggered](self->_recordContext, "isVoiceTriggered") & ((v4 | v3) ^ 1);
}

- (BOOL)_multimodalEndpointerEnabled
{
  return 0;
}

- (CSEndpointAnalyzerDelegate)delegate
{
  return (CSEndpointAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CSEndpointAnalyzerImplDelegate)implDelegate
{
  return (CSEndpointAnalyzerImplDelegate *)objc_loadWeakRetained((id *)&self->_implDelegate);
}

- (void)setImplDelegate:(id)a3
{
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (int64_t)endpointStyle
{
  return self->_endpointStyle;
}

- (void)setEndpointStyle:(int64_t)a3
{
  self->_endpointStyle = a3;
}

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (void)setStartWaitTime:(double)a3
{
  self->_startWaitTime = a3;
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (void)setEndWaitTime:(double)a3
{
  self->_endWaitTime = a3;
}

- (double)interspeechWaitTime
{
  return self->_interspeechWaitTime;
}

- (void)setInterspeechWaitTime:(double)a3
{
  self->_interspeechWaitTime = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return self->_automaticEndpointingSuspensionEndTime;
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  self->_automaticEndpointingSuspensionEndTime = a3;
}

- (double)minimumDurationForEndpointer
{
  return self->_minimumDurationForEndpointer;
}

- (void)setMinimumDurationForEndpointer:(double)a3
{
  self->_minimumDurationForEndpointer = a3;
}

- (BOOL)saveSamplesSeenInReset
{
  return self->_saveSamplesSeenInReset;
}

- (void)setSaveSamplesSeenInReset:(BOOL)a3
{
  self->_saveSamplesSeenInReset = a3;
}

- (BOOL)canProcessCurrentRequest
{
  return self->_canProcessCurrentRequest;
}

- (void)setCanProcessCurrentRequest:(BOOL)a3
{
  self->_canProcessCurrentRequest = a3;
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (OS_dispatch_queue)apQueue
{
  return self->_apQueue;
}

- (void)setApQueue:(id)a3
{
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numSamplesProcessedBeforeAnchorTime
{
  return self->_numSamplesProcessedBeforeAnchorTime;
}

- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3
{
  self->_numSamplesProcessedBeforeAnchorTime = a3;
}

- (unint64_t)anchorMachAbsTime
{
  return self->_anchorMachAbsTime;
}

- (void)setAnchorMachAbsTime:(unint64_t)a3
{
  self->_anchorMachAbsTime = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (BOOL)isRequestTimeout
{
  return self->_isRequestTimeout;
}

- (void)setIsRequestTimeout:(BOOL)a3
{
  self->_isRequestTimeout = a3;
}

- (BOOL)didAddAudio
{
  return self->_didAddAudio;
}

- (void)setDidAddAudio:(BOOL)a3
{
  self->_didAddAudio = a3;
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setOsdAnalyzer:(id)a3
{
}

- (OSDFeatures)osdFeaturesAtEndpoint
{
  return self->_osdFeaturesAtEndpoint;
}

- (void)setOsdFeaturesAtEndpoint:(id)a3
{
}

- (_EAREndpointer)hybridClassifier
{
  return self->_hybridClassifier;
}

- (void)setHybridClassifier:(id)a3
{
}

- (void)setEndpointerModelVersion:(id)a3
{
}

- (OS_dispatch_queue)asrFeaturesQueue
{
  return self->_asrFeaturesQueue;
}

- (void)setAsrFeaturesQueue:(id)a3
{
}

- (CSASRFeatures)lastKnownASRFeatures
{
  return self->_lastKnownASRFeatures;
}

- (void)setLastKnownASRFeatures:(id)a3
{
}

- (OSDFeatures)lastKnownOSDFeatures
{
  return self->_lastKnownOSDFeatures;
}

- (void)setLastKnownOSDFeatures:(id)a3
{
}

- (NSMutableArray)asrFeatureLatencies
{
  return self->_asrFeatureLatencies;
}

- (void)setAsrFeatureLatencies:(id)a3
{
}

- (double)lastKnownASRFeatureLatency
{
  return self->_lastKnownASRFeatureLatency;
}

- (void)setLastKnownASRFeatureLatency:(double)a3
{
  self->_lastKnownASRFeatureLatency = a3;
}

- (BOOL)epResult
{
  return self->_epResult;
}

- (void)setEpResult:(BOOL)a3
{
  self->_epResult = a3;
}

- (double)asrFeaturesWarmupLatency
{
  return self->_asrFeaturesWarmupLatency;
}

- (void)setAsrFeaturesWarmupLatency:(double)a3
{
  self->_asrFeaturesWarmupLatency = a3;
}

- (NSDate)lastASRFeatureTimestamp
{
  return self->_lastASRFeatureTimestamp;
}

- (void)setLastASRFeatureTimestamp:(id)a3
{
}

- (BOOL)didReceiveASRFeatures
{
  return self->_didReceiveASRFeatures;
}

- (void)setDidReceiveASRFeatures:(BOOL)a3
{
  self->_didReceiveASRFeatures = a3;
}

- (double)clientLagThresholdMs
{
  return self->_clientLagThresholdMs;
}

- (void)setClientLagThresholdMs:(double)a3
{
  self->_clientLagThresholdMs = a3;
}

- (double)clampedASRFeatureLatencyMsForClientLag
{
  return self->_clampedASRFeatureLatencyMsForClientLag;
}

- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3
{
  self->_clampedASRFeatureLatencyMsForClientLag = a3;
}

- (BOOL)useDefaultASRFeaturesOnClientLag
{
  return self->_useDefaultASRFeaturesOnClientLag;
}

- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3
{
  self->_useDefaultASRFeaturesOnClientLag = a3;
}

- (OS_dispatch_queue)hybridClassifierQueue
{
  return self->_hybridClassifierQueue;
}

- (void)setHybridClassifierQueue:(id)a3
{
}

- (double)lastReportedEndpointTimeMs
{
  return self->_lastReportedEndpointTimeMs;
}

- (void)setLastReportedEndpointTimeMs:(double)a3
{
  self->_lastReportedEndpointTimeMs = a3;
}

- (double)processedAudioInSeconds
{
  return self->_processedAudioInSeconds;
}

- (void)setProcessedAudioInSeconds:(double)a3
{
  self->_processedAudioInSeconds = a3;
}

- (float)lastEndpointPosterior
{
  return self->_lastEndpointPosterior;
}

- (void)setLastEndpointPosterior:(float)a3
{
  self->_lastEndpointPosterior = a3;
}

- (OS_dispatch_queue)stateSerialQueue
{
  return self->_stateSerialQueue;
}

- (void)setStateSerialQueue:(id)a3
{
}

- (BOOL)didCommunicateEndpoint
{
  return self->_didCommunicateEndpoint;
}

- (void)setDidCommunicateEndpoint:(BOOL)a3
{
  self->_didCommunicateEndpoint = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (double)hepAudioOriginInMs
{
  return self->_hepAudioOriginInMs;
}

- (void)setHepAudioOriginInMs:(double)a3
{
  self->_hepAudioOriginInMs = a3;
}

- (double)twoShotSilenceThresholdInMs
{
  return self->_twoShotSilenceThresholdInMs;
}

- (void)setTwoShotSilenceThresholdInMs:(double)a3
{
  self->_twoShotSilenceThresholdInMs = a3;
}

- (BOOL)didNotifyTwoShot
{
  return self->_didNotifyTwoShot;
}

- (void)setDidNotifyTwoShot:(BOOL)a3
{
  self->_didNotifyTwoShot = a3;
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setRecordContext:(id)a3
{
}

- (BOOL)speechEndpointDetected
{
  return self->_speechEndpointDetected;
}

- (void)setSpeechEndpointDetected:(BOOL)a3
{
  self->_speechEndpointDetected = a3;
}

- (NSDate)firstAudioPacketTimestamp
{
  return self->_firstAudioPacketTimestamp;
}

- (void)setFirstAudioPacketTimestamp:(id)a3
{
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (BOOL)didTimestampFirstAudioPacket
{
  return self->_didTimestampFirstAudioPacket;
}

- (void)setDidTimestampFirstAudioPacket:(BOOL)a3
{
  self->_didTimestampFirstAudioPacket = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
}

- (OS_dispatch_queue)osdQueue
{
  return self->_osdQueue;
}

- (void)setOsdQueue:(id)a3
{
}

- (BOOL)didDetectSpeech
{
  return self->_didDetectSpeech;
}

- (void)setDidDetectSpeech:(BOOL)a3
{
  self->_didDetectSpeech = a3;
}

- (double)postVoiceTriggerSilence
{
  return self->_postVoiceTriggerSilence;
}

- (void)setPostVoiceTriggerSilence:(double)a3
{
  self->_postVoiceTriggerSilence = a3;
}

- (void).cxx_destruct
{
}

@end