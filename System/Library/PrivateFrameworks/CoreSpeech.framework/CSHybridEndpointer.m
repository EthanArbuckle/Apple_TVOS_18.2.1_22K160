@interface CSHybridEndpointer
- (BOOL)_multimodalEndpointerEnabled;
- (BOOL)_shouldProvideTwoShotFeedbackWithRecordContext;
- (BOOL)_useEnhancedEndpointer;
- (BOOL)canProcessCurrentRequest;
- (BOOL)didCommunicateEndpoint;
- (BOOL)didDetectSpeech;
- (BOOL)didNotifyTwoShot;
- (BOOL)didReceiveASRFeatures;
- (BOOL)didReceiveRCFeatures;
- (BOOL)didTimestampFirstAudioPacket;
- (BOOL)disableRCSelection;
- (BOOL)enhancedEndpointerDefaultResult;
- (BOOL)epResult;
- (BOOL)hasAcceptedEagerResult;
- (BOOL)isASRFeatureFromServer;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeout;
- (BOOL)recordingDidStop;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4;
- (BOOL)speechEndpointDetected;
- (BOOL)useDefaultASRFeaturesOnClientLag;
- (CSASRFeatures)lastKnownASRFeatures;
- (CSASRFeatures)lastKnownRCFeatures;
- (CSAsset)currentAsset;
- (CSAudioRecordContext)recordContext;
- (CSEndpointAnalyzerDelegate)delegate;
- (CSEndpointAnalyzerImplDelegate)implDelegate;
- (CSEnhancedEndpointer)enhancedEndpointer;
- (CSHybridEndpointer)init;
- (NSDate)firstAudioPacketTimestamp;
- (NSDate)lastASRFeatureTimestamp;
- (NSDictionary)enhancedEndpointerTaskThresholdMap;
- (NSDictionary)taskEnhancedEndpointerMap;
- (NSDictionary)taskThresholdMap;
- (NSMutableArray)asrFeaturesLatencies;
- (NSString)endpointerModelVersion;
- (NSString)mhId;
- (OSDFeatures)lastKnownOSDFeatures;
- (OSDFeatures)osdFeaturesAtEndpoint;
- (OS_dispatch_queue)asrFeaturesQueue;
- (OS_dispatch_queue)hybridClassifierQueue;
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
- (double)lastKnownRCFeatureLatency;
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
- (int64_t)endpointerOperationMode;
- (int64_t)fetchCurrentEndpointerOperationMode;
- (unint64_t)activeChannel;
- (unint64_t)anchorMachAbsTime;
- (unint64_t)audioDeliveryHostTimeDelta;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)extraDelayFrequency;
- (unint64_t)numSamplesProcessedBeforeAnchorTime;
- (unint64_t)vtEndInSampleCount;
- (void)_generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:(double)a3 osdFeatures:(id)a4 completion:(id)a5;
- (void)_processEnhancedEndpointerTaskString:(id)a3;
- (void)_readParametersFromHEPAsset:(id)a3;
- (void)_shouldAcceptEagerResultForDuration:(double)a3 asrFeatures:(id)a4 lastReportedEndpointTimeMs:(double)a5 osdFeatures:(id)a6 resultsCompletionHandler:(id)a7;
- (void)_swapEnhancedEndpointerModelForTaskString:(id)a3;
- (void)_updateCurrentAsset:(id)a3;
- (void)_updateEndpointerDelayedTriggerByMhId:(id)a3;
- (void)endpointerAssetManagerDidUpdateAsset:(id)a3;
- (void)handleVoiceTriggerWithActivationInfo:(id)a3;
- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6;
- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4;
- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5;
- (void)processRCFeatures:(id)a3;
- (void)processTaskString:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnchorMachAbsTime:(unint64_t)a3;
- (void)setAsrFeaturesLatencies:(id)a3;
- (void)setAsrFeaturesQueue:(id)a3;
- (void)setAsrFeaturesWarmupLatency:(double)a3;
- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setCanProcessCurrentRequest:(BOOL)a3;
- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3;
- (void)setClientLagThresholdMs:(double)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCommunicateEndpoint:(BOOL)a3;
- (void)setDidDetectSpeech:(BOOL)a3;
- (void)setDidNotifyTwoShot:(BOOL)a3;
- (void)setDidReceiveASRFeatures:(BOOL)a3;
- (void)setDidReceiveRCFeatures:(BOOL)a3;
- (void)setDidTimestampFirstAudioPacket:(BOOL)a3;
- (void)setDisableRCSelection:(BOOL)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointStyle:(int64_t)a3;
- (void)setEndpointerModelVersion:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setEnhancedEndpointer:(id)a3;
- (void)setEnhancedEndpointerDefaultResult:(BOOL)a3;
- (void)setEnhancedEndpointerTaskThresholdMap:(id)a3;
- (void)setEpResult:(BOOL)a3;
- (void)setExtraDelayFrequency:(unint64_t)a3;
- (void)setFirstAudioPacketTimestamp:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setHasAcceptedEagerResult:(BOOL)a3;
- (void)setHepAudioOriginInMs:(double)a3;
- (void)setHybridClassifier:(id)a3;
- (void)setHybridClassifierQueue:(id)a3;
- (void)setImplDelegate:(id)a3;
- (void)setInterspeechWaitTime:(double)a3;
- (void)setIsASRFeatureFromServer:(BOOL)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeout:(BOOL)a3;
- (void)setLastASRFeatureTimestamp:(id)a3;
- (void)setLastEndpointPosterior:(float)a3;
- (void)setLastKnownASRFeatureLatency:(double)a3;
- (void)setLastKnownASRFeatures:(id)a3;
- (void)setLastKnownOSDFeatures:(id)a3;
- (void)setLastKnownRCFeatureLatency:(double)a3;
- (void)setLastKnownRCFeatures:(id)a3;
- (void)setLastReportedEndpointTimeMs:(double)a3;
- (void)setMhId:(id)a3;
- (void)setMinimumDurationForEndpointer:(double)a3;
- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3;
- (void)setOsdFeaturesAtEndpoint:(id)a3;
- (void)setPostVoiceTriggerSilence:(double)a3;
- (void)setProcessedAudioInSeconds:(double)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingDidStop:(BOOL)a3;
- (void)setSaveSamplesSeenInReset:(BOOL)a3;
- (void)setSpeechEndpointDetected:(BOOL)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setStateSerialQueue:(id)a3;
- (void)setTaskEnhancedEndpointerMap:(id)a3;
- (void)setTaskThresholdMap:(id)a3;
- (void)setTwoShotSilenceThresholdInMs:(double)a3;
- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5;
- (void)stopEndpointer;
- (void)terminateProcessing;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
- (void)updateEnhancedEndpointerDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6;
@end

@implementation CSHybridEndpointer

- (CSHybridEndpointer)init
{
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___CSHybridEndpointer;
  v2 = -[CSHybridEndpointer init](&v43, "init");
  v3 = v2;
  if (v2)
  {
    v2->_didCommunicateEndpoint = 0;
    v2->_speechEndpointDetected = 0;
    v2->_recordingDidStop = 0;
    v2->_lastEndpointPosterior = 0.0;
    v2->_endpointerOperationMode = 0LL;
    v5 = 0LL;
    if ((+[CSUtils supportsDispatchWorkloop](&OBJC_CLASS___CSUtils, "supportsDispatchWorkloop") & 1) == 0) {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils rootQueueWithFixedPriority:]( &OBJC_CLASS___CSUtils,  "rootQueueWithFixedPriority:",  kCSDefaultSerialQueueFixedPriority));
    }
    id v6 = objc_msgSend((id)objc_opt_class(v3, v4), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lowercaseString]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.stateserialqueue",  v8));

    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointer _getSerialQueueWithName:targetQueue:]( v3,  "_getSerialQueueWithName:targetQueue:",  v9,  v5));
    stateSerialQueue = v3->_stateSerialQueue;
    v3->_stateSerialQueue = (OS_dispatch_queue *)v10;

    id v13 = objc_msgSend((id)objc_opt_class(v3, v12), "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.asrFeaturesQueue",  v15));

    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointer _getSerialQueueWithName:targetQueue:]( v3,  "_getSerialQueueWithName:targetQueue:",  v16,  v5));
    asrFeaturesQueue = v3->_asrFeaturesQueue;
    v3->_asrFeaturesQueue = (OS_dispatch_queue *)v17;

    v19 = (dispatch_queue_s *)v3->_stateSerialQueue;
    block = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472LL;
    v40 = sub_1000CEA58;
    v41 = &unk_10022F100;
    v20 = v3;
    v42 = v20;
    dispatch_async(v19, &block);
    id v22 = objc_msgSend((id)objc_opt_class(v20, v21), "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lowercaseString]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.cs.%@.hybridClassifierfQueue",  v24,  block,  v39,  v40,  v41));

    uint64_t v26 = objc_claimAutoreleasedReturnValue( -[CSHybridEndpointer _getSerialQueueWithName:targetQueue:]( v20,  "_getSerialQueueWithName:targetQueue:",  v25,  v5));
    hybridClassifierQueue = v20->_hybridClassifierQueue;
    v20->_hybridClassifierQueue = (OS_dispatch_queue *)v26;

    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v20->_currentRequestSampleRate = (unint64_t)v28;
    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[CSASRFeatures initialASRFeatures](&OBJC_CLASS___CSASRFeatures, "initialASRFeatures"));
    lastKnownASRFeatures = v20->_lastKnownASRFeatures;
    v20->_lastKnownASRFeatures = (CSASRFeatures *)v29;

    *(int64x2_t *)&v20->_lastKnownASRFeatureLatency = vdupq_n_s64(0xBF847AE147AE147BLL);
    v20->_epResult = 0;
    v31 = -[OSDFeatures initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:]( objc_alloc(&OBJC_CLASS___OSDFeatures),  "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:",  0.0,  0.0,  0.0,  0.0);
    lastKnownOSDFeatures = v20->_lastKnownOSDFeatures;
    v20->_lastKnownOSDFeatures = v31;

    *(_OWORD *)&v20->_clientLagThresholdMs = xmmword_10018B330;
    v20->_useDefaultASRFeaturesOnClientLag = 1;
    taskThresholdMap = v20->_taskThresholdMap;
    v20->_extraDelayFrequency = 1000LL;
    v20->_taskThresholdMap = 0LL;

    enhancedEndpointerTaskThresholdMap = v20->_enhancedEndpointerTaskThresholdMap;
    v20->_enhancedEndpointerTaskThresholdMap = 0LL;

    uint64_t v35 = objc_claimAutoreleasedReturnValue( +[CSASRFeatures initialResultCandidateFeatures]( &OBJC_CLASS___CSASRFeatures,  "initialResultCandidateFeatures"));
    lastKnownRCFeatures = v20->_lastKnownRCFeatures;
    v20->_lastKnownRCFeatures = (CSASRFeatures *)v35;

    *(_WORD *)&v20->_hasAcceptedEagerResult = 0;
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

- (NSString)endpointerModelVersion
{
  endpointerModelVersion = self->_endpointerModelVersion;
  if (!endpointerModelVersion)
  {
    stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CE8CC;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async_and_wait(stateSerialQueue, block);
    endpointerModelVersion = self->_endpointerModelVersion;
  }

  return endpointerModelVersion;
}

- (void)_updateCurrentAsset:(id)a3
{
  v5 = (CSAsset *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  currentAsset = self->_currentAsset;
  dispatch_queue_t v7 = (os_log_s *)CSLogCategoryEP;
  BOOL v8 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
  if (currentAsset == v5)
  {
    if (v8)
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSHybridEndpointer _updateCurrentAsset:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s New asset is the same as current asset - no update needed.",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    if (v8)
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSHybridEndpointer _updateCurrentAsset:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Updating current asset.",  (uint8_t *)&v9,  0xCu);
    }

    objc_storeStrong((id *)&self->_currentAsset, a3);
    -[CSHybridEndpointer _readParametersFromHEPAsset:](self, "_readParametersFromHEPAsset:", self->_currentAsset);
  }
}

- (void)updateEndpointerThreshold:(float)a3
{
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000CE800;
  v4[3] = &unk_10022E8F8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(hybridClassifierQueue, v4);
}

- (void)updateEnhancedEndpointerDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6
{
  if (self->_recordingDidStop)
  {
    dispatch_queue_t v6 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSHybridEndpointer updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPart"
            "ial:relaxedThresholdRC:]";
      __int16 v15 = 2080;
      v16 = "Don't update thresholds";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }

  else
  {
    hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CE708;
    block[3] = &unk_10022CAA0;
    block[4] = self;
    float v9 = a3;
    float v10 = a4;
    float v11 = a5;
    float v12 = a6;
    dispatch_async(hybridClassifierQueue, block);
  }

- (void)_updateEndpointerDelayedTriggerByMhId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  uint64_t v8 = 0LL;
  float v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 1000LL;
  asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CE6F4;
  v7[3] = &unk_10022EF80;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_async_and_wait(asrFeaturesQueue, v7);
  unint64_t v6 = (unint64_t)[v4 hash];
  if (v6 % v9[3] == 1) {
    -[CSHybridEndpointer updateEndpointerDelayedTrigger:](self, "updateEndpointerDelayedTrigger:", 1LL);
  }
  _Block_object_dispose(&v8, 8);
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  if (self->_recordingDidStop)
  {
    v3 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v8 = "-[CSHybridEndpointer updateEndpointerDelayedTrigger:]";
      __int16 v9 = 2080;
      uint64_t v10 = "Don't update trigger switch";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }

  else
  {
    hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000CE610;
    v5[3] = &unk_10022EFA8;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async(hybridClassifierQueue, v5);
  }

- (void)setEndpointerOperationMode:(int64_t)a3
{
  float v5 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v9 = "-[CSHybridEndpointer setEndpointerOperationMode:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CE4C8;
  v7[3] = &unk_10022F020;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(stateSerialQueue, v7);
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CE3D8;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_async_and_wait(stateSerialQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (os_log_s *)CSLogCategoryEP;
  if (self->_recordingDidStop)
  {
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer processASRFeatures:fromServer:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Don't process ASR features";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer processASRFeatures:fromServer:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s EARSPG: CSASRFeatures: %{public}@",  buf,  0x16u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    uint64_t v16 = 0LL;
    stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CE264;
    block[3] = &unk_10022EF80;
    block[4] = self;
    void block[5] = buf;
    dispatch_async_and_wait(stateSerialQueue, block);
    id v9 = [v6 processedAudioDurationInMilliseconds];
    if (*(double *)(*(void *)&buf[8] + 24LL) <= (double)(uint64_t)v9)
    {
      asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000CE278;
      v11[3] = &unk_10022ECA8;
      v11[4] = self;
      BOOL v13 = a4;
      id v12 = v6;
      dispatch_async(asrFeaturesQueue, v11);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)processTaskString:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CDF88;
  v7[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
}

- (void)_processEnhancedEndpointerTaskString:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  int v41 = 0;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  int v37 = 0;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  int v33 = 0;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  int v29 = 0;
  asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
  uint64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1000CDD8C;
  v19 = &unk_10022CAC8;
  v20 = self;
  id v6 = v4;
  id v21 = v6;
  id v22 = &v38;
  v23 = &v34;
  v24 = &v30;
  v25 = &v26;
  dispatch_async_and_wait(asrFeaturesQueue, &v16);
  if (*((float *)v39 + 6) > 0.0 && *((float *)v35 + 6) > 0.0)
  {
    -[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]( self,  "_swapEnhancedEndpointerModelForTaskString:",  v6,  v16,  v17,  v18,  v19,  v20);
    LODWORD(v7) = *((_DWORD *)v39 + 6);
    LODWORD(v8) = *((_DWORD *)v35 + 6);
    LODWORD(v9) = *((_DWORD *)v31 + 6);
    LODWORD(v10) = *((_DWORD *)v27 + 6);
    -[CSHybridEndpointer updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:relaxedThresholdRC:]( self,  "updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:relaxedThresholdRC:",  v7,  v8,  v9,  v10);
    uint64_t v11 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = *((float *)v39 + 6);
      double v13 = *((float *)v35 + 6);
      double v14 = *((float *)v31 + 6);
      double v15 = *((float *)v27 + 6);
      *(_DWORD *)buf = 136316418;
      objc_super v43 = "-[CSHybridEndpointer _processEnhancedEndpointerTaskString:]";
      __int16 v44 = 2114;
      id v45 = v6;
      __int16 v46 = 2050;
      double v47 = v12;
      __int16 v48 = 2050;
      double v49 = v13;
      __int16 v50 = 2050;
      double v51 = v14;
      __int16 v52 = 2050;
      double v53 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Updated enhanced endpointer thresholds for task %{public}@ - defaultThresholdPartial: %{public}f, defaultThre sholdRC: %{public}f, relaxedThresholdPartial: %{public}f, relaxedThresholdRC: %{public}f",  buf,  0x3Eu);
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)_swapEnhancedEndpointerModelForTaskString:(id)a3
{
  id v4 = (char *)a3;
  if (self->_recordingDidStop)
  {
    float v5 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      uint64_t v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      __int16 v17 = 2080;
      v18 = "Don't switch enhanced endpointer models";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Recording stopped: %s",  (uint8_t *)&v15,  0x16u);
    }

    goto LABEL_13;
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  taskEnhancedEndpointerMap = self->_taskEnhancedEndpointerMap;
  if (!taskEnhancedEndpointerMap)
  {
    double v10 = (os_log_s *)CSLogCategoryEP;
    if (!os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    int v15 = 136315138;
    uint64_t v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
    double v12 = "%s Expected _taskEnhancedEndpointerMap to be non-nil.";
    double v13 = v10;
    uint32_t v14 = 12;
LABEL_17:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v15, v14);
    goto LABEL_13;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](taskEnhancedEndpointerMap, "objectForKey:", v4));
  if (!v7)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_taskEnhancedEndpointerMap,  "objectForKey:",  @"SearchOrMessaging"));
    double v8 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      __int16 v17 = 2114;
      v18 = v4;
      __int16 v19 = 2114;
      v20 = @"SearchOrMessaging";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s No enhanced endpointer model for task %{public}@, falling back to default task %{public}@",  (uint8_t *)&v15,  0x20u);
    }

    if (!v7)
    {
      uint64_t v11 = (os_log_s *)CSLogCategoryEP;
      if (!os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_FAULT)) {
        goto LABEL_13;
      }
      int v15 = 136315650;
      uint64_t v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      __int16 v17 = 2114;
      v18 = v4;
      __int16 v19 = 2114;
      v20 = @"SearchOrMessaging";
      double v12 = "%s Unable to find enhanced endpointer model for task %{public}@ or default task %{public}@";
      double v13 = v11;
      uint32_t v14 = 32;
      goto LABEL_17;
    }
  }

  objc_storeStrong((id *)&self->_enhancedEndpointer, v7);
  double v9 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    uint64_t v16 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
    __int16 v17 = 2114;
    v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Swapping enhanced endpointer model to model for %{public}@ (or default)",  (uint8_t *)&v15,  0x16u);
  }

LABEL_13:
}

- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  [v6 totalAudioRecorded];
  uint64_t v8 = v7;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 asrFeaturesAtEndpoint]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v6 osdFeaturesAtEndpoint]);
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000CDD14;
  v15[3] = &unk_10022CB18;
  v15[4] = self;
  id v16 = v9;
  double v19 = a3;
  uint64_t v20 = v8;
  id v17 = v10;
  v18 = &v21;
  id v12 = v10;
  id v13 = v9;
  dispatch_async_and_wait(hybridClassifierQueue, v15);
  LOBYTE(hybridClassifierQueue) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)hybridClassifierQueue;
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v9 totalAudioRecorded];
  uint64_t v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 asrFeaturesAtEndpoint]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 osdFeaturesAtEndpoint]);

  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000CDD00;
  v18[3] = &unk_10022CB40;
  v18[4] = self;
  id v19 = v12;
  double v22 = a3;
  uint64_t v23 = v11;
  id v20 = v13;
  id v21 = v8;
  id v15 = v8;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(hybridClassifierQueue, v18);
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6 = a4;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x3032000000LL;
  v15[3] = sub_1000CA7E8;
  v15[4] = sub_1000CA7F8;
  id v16 = 0LL;
  asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CDCC8;
  block[3] = &unk_10022EF80;
  block[4] = self;
  void block[5] = v15;
  dispatch_async_and_wait(asrFeaturesQueue, block);
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000CDCDC;
  v10[3] = &unk_10022CB68;
  double v13 = a3;
  id v11 = v6;
  id v12 = v15;
  v10[4] = self;
  id v9 = v6;
  dispatch_async(hybridClassifierQueue, v10);

  _Block_object_dispose(v15, 8);
}

- (void)_shouldAcceptEagerResultForDuration:(double)a3 asrFeatures:(id)a4 lastReportedEndpointTimeMs:(double)a5 osdFeatures:(id)a6 resultsCompletionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  uint32_t v14 = (void (**)(id, void, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  if (self->_hasAcceptedEagerResult)
  {
    id v15 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Rejecting RC: Already accepted an earlier RC for this request",  buf,  0xCu);
    }

    double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3)));
    *(double *)v59 = v16;
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
    v59[1] = v17;
    v18 = v59;
LABEL_9:
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    v14[2](v14, 0LL, v20);
LABEL_10:

    goto LABEL_11;
  }

  if (self->_disableRCSelection)
  {
    id v19 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Rejecting RC: ASR is running on-device (full UoD)",  buf,  0xCu);
    }

    double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3)));
    *(double *)v58 = v16;
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
    v58[1] = v17;
    v18 = v58;
    goto LABEL_9;
  }

  double v21 = a5 - (double)(uint64_t)[v12 processedAudioDurationInMilliseconds];
  double v22 = a5 - a3;
  if (a5 - a3 < 0.0)
  {
    uint64_t v23 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      double v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      __int16 v50 = 2050;
      double v51 = a3;
      __int16 v52 = 2050;
      double v53 = a5;
      __int16 v54 = 2050;
      double v55 = v21;
      __int16 v56 = 2050;
      double v57 = a5 - a3;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s Accepting RC: RCTime < 0: ASR's processedAudioDuration(%{public}f) > lastReportedEndpointTimeMs(%{public}f): asrFeatureLatency: %{public}f, rcTimeMs: %{public}f",  buf,  0x34u);
    }

    double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3)));
    *(double *)double v47 = v16;
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
    v47[1] = v17;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
    v14[2](v14, 1LL, v20);
    goto LABEL_10;
  }

  if (v21 < 0.0)
  {
    char v24 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      double v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      __int16 v50 = 2050;
      double v51 = a3;
      __int16 v52 = 2050;
      double v53 = a5;
      __int16 v54 = 2050;
      double v55 = v21;
      __int16 v56 = 2050;
      double v57 = a5 - a3;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Rejecting RC: SFLatency < 0: ASR's processedAudioDuration(%{public}f): lastReportedEndpointTimeMs(%{public}f) : asrFeatureLatency: %{public}f, rcTimeMs: %{public}f",  buf,  0x34u);
    }

    double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3)));
    *(double *)__int16 v46 = v16;
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
    v46[1] = v17;
    v18 = v46;
    goto LABEL_9;
  }

  id v25 = objc_alloc(&OBJC_CLASS____EAREndpointFeatures);
  id v26 = [v12 wordCount];
  id v27 = [v12 trailingSilenceDuration];
  [v12 eosLikelihood];
  double v29 = v28;
  [v12 acousticEndpointerScore];
  double v31 = v30;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v12 pauseCounts]);
  [v12 silencePosterior];
  double v34 = v33;
  [v13 silenceFramesCountMs];
  double v36 = v35;
  [v13 silenceProbability];
  double v38 = v37;
  [v13 silenceDurationMs];
  *(float *)&double v40 = v39;
  *(float *)&double v41 = v21;
  double v16 = COERCE_DOUBLE( [v25 initWithWordCount:v26 trailingSilenceDuration:v27 endOfSentenceLikelihood:v32 acousticEndpointerScore:(uint64_t)v22 pauseCounts:v29 silenc ePosterior:v31 clientSilenceFramesCountMs:v34 clientSilenceProbability:v36 silencePosteriorNF:v38 serverFeaturesLatency:v40 eagerResultEndTime:v41]);

  hybridClassifier = self->_hybridClassifier;
  id v45 = 0LL;
  id v43 = -[_EAREndpointer acceptEagerResultWithFeatures:featuresToLog:]( hybridClassifier,  "acceptEagerResultWithFeatures:featuresToLog:",  *(void *)&v16,  &v45);
  id v17 = v45;
  __int16 v44 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    double v49 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:re"
          "sultsCompletionHandler:]";
    __int16 v50 = 2114;
    double v51 = v16;
    __int16 v52 = 1026;
    LODWORD(v53) = (_DWORD)v43;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s rcEpFeatures: %{public}@ shouldAccept: %{public}d",  buf,  0x1Cu);
  }

  ((void (**)(id, id, void *))v14)[2](v14, v43, v17);
  self->_hasAcceptedEagerResult = (char)v43;
LABEL_11:
}

- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6
{
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CDC9C;
  block[3] = &unk_10022CB90;
  block[4] = self;
  void block[5] = a3;
  BOOL v8 = a5;
  void block[6] = a4;
  block[7] = a6;
  dispatch_async(hybridClassifierQueue, block);
}

- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4
{
  id v6 = a3;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CDBB8;
  block[3] = &unk_10022E7F8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async_and_wait(stateSerialQueue, block);
}

- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_recordingDidStop)
  {
    id v10 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Don't process OSD features";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }

  else
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v68 = sub_1000CA7E8;
    v69 = sub_1000CA7F8;
    id v70 = 0LL;
    hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CBD18;
    block[3] = &unk_10022EF80;
    void block[5] = buf;
    block[4] = self;
    dispatch_async_and_wait(hybridClassifierQueue, block);
    if ([v9 length]
      && ([v9 isEqualToString:*(void *)(*(void *)&buf[8] + 40)] & 1) == 0)
    {
      char v24 = (os_log_s *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)v65 = 136315650;
        *(void *)&v65[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
        *(_WORD *)&v65[12] = 2112;
        *(void *)&v65[14] = v25;
        *(_WORD *)&v65[22] = 2112;
        id v66 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s MHID mismatch: Endpointer = %@, OSD = %@, don't process OSD features",  v65,  0x20u);
      }
    }

    else
    {
      [v8 processedAudioMs];
      double v13 = v12;
      [v8 silenceDurationMs];
      double v15 = v14;
      uint64_t v16 = qword_10027FF98;
      if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_10027FF98, 1) <= 0x888888888888888uLL)
      {
        kdebug_trace(722472236LL, 0LL, 0LL, 0LL, 0LL);
        uint64_t v16 = qword_10027FF98;
      }

      qword_10027FF98 = v16 + 1;
      float v17 = v13;
      float v18 = v15;
      *(void *)v65 = 0LL;
      *(void *)&v65[8] = v65;
      *(void *)&v65[16] = 0x2020000000LL;
      v59[0] = 0LL;
      v59[1] = v59;
      void v59[2] = 0x2020000000LL;
      v58[0] = 0LL;
      v58[1] = v58;
      void v58[2] = 0x2020000000LL;
      v57[0] = 0LL;
      v57[1] = v57;
      v57[2] = 0x2020000000LL;
      id v19 = (dispatch_queue_s *)self->_hybridClassifierQueue;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_1000CBD2C;
      v56[3] = &unk_10022CBB8;
      v56[4] = self;
      v56[5] = v65;
      v56[6] = v59;
      v56[7] = v57;
      v56[8] = v58;
      dispatch_async(v19, v56);
      v55[0] = 0LL;
      v55[1] = v55;
      v55[2] = 0x2020000000LL;
      v55[3] = 0LL;
      uint64_t v52 = 0LL;
      double v53 = &v52;
      uint64_t v54 = 0x2020000000LL;
      v51[0] = 0LL;
      v51[1] = v51;
      v51[2] = 0x2020000000LL;
      stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_1000CBD7C;
      v49[3] = &unk_10022CBE0;
      v49[4] = self;
      v49[5] = &v52;
      v49[6] = v51;
      v49[7] = v55;
      float v50 = v17;
      dispatch_async_and_wait(stateSerialQueue, v49);
      uint64_t v45 = 0LL;
      __int16 v46 = &v45;
      uint64_t v47 = 0x2020000000LL;
      char v48 = 0;
      double v21 = (dispatch_queue_s *)self->_stateSerialQueue;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_1000CBDC4;
      v44[3] = &unk_10022EF80;
      v44[4] = self;
      v44[5] = &v45;
      dispatch_async_and_wait(v21, v44);
      if (*((_BYTE *)v46 + 24) && !self->_didDetectSpeech)
      {
        double v22 = (dispatch_queue_s *)self->_stateSerialQueue;
        if (v17 <= 300.0 || v18 >= 0.001)
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_1000CBED0;
          v41[3] = &unk_10022E8F8;
          v41[4] = self;
          float v42 = v17;
          uint64_t v23 = v41;
        }

        else
        {
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_1000CBDFC;
          v43[3] = &unk_10022EF80;
          v43[4] = self;
          v43[5] = v55;
          uint64_t v23 = v43;
        }

        dispatch_async_and_wait(v22, v23);
      }

      if (*((_BYTE *)v53 + 24))
      {
        id v26 = (os_log_s *)CSLogCategoryEP;
        if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v61 = 136315394;
          v62 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
          __int16 v63 = 2050;
          double v64 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s Already communicated end-pt: Not scheduling work for hybridClassifierQueue for silposnf=%{public}f",  v61,  0x16u);
        }
      }

      else
      {
        unsigned __int8 v27 = -[CSHybridEndpointer _multimodalEndpointerEnabled](self, "_multimodalEndpointerEnabled");
        double v28 = (dispatch_queue_s *)self->_hybridClassifierQueue;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_1000CC004;
        v29[3] = &unk_10022CCD0;
        v29[4] = self;
        double v31 = &v52;
        float v39 = v15;
        id v30 = v8;
        uint64_t v32 = v55;
        unsigned __int8 v40 = v27;
        double v33 = v51;
        double v34 = v65;
        double v35 = v59;
        double v36 = v57;
        double v38 = a4;
        double v37 = v58;
        dispatch_async(v28, v29);
      }

      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(v51, 8);
      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(v55, 8);
      _Block_object_dispose(v57, 8);
      _Block_object_dispose(v58, 8);
      _Block_object_dispose(v59, 8);
      _Block_object_dispose(v65, 8);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)_generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:(double)a3 osdFeatures:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v112 = _NSConcreteStackBlock;
  uint64_t v113 = 3221225472LL;
  v114 = sub_1000CBD04;
  v115 = &unk_10022CCF8;
  id v9 = a5;
  id v116 = v9;
  id v10 = objc_retainBlock(&v112);
  double v11 = (double)-[CSASRFeatures processedAudioDurationInMilliseconds]( self->_lastKnownASRFeatures,  "processedAudioDurationInMilliseconds");
  if (v11 <= a3)
  {
    objc_msgSend(v8, "processedAudioMs", v11);
    if (self->_didReceiveASRFeatures) {
      double v42 = a3
    }
          - (double)-[CSASRFeatures processedAudioDurationInMilliseconds]( self->_lastKnownASRFeatures,  "processedAudioDurationInMilliseconds");
    else {
      double v42 = v41;
    }
    if (-[CSHybridEndpointer _useEnhancedEndpointer](self, "_useEnhancedEndpointer"))
    {
      uint64_t v49 = -[CSASRFeatures processedAudioDurationInMilliseconds]( self->_lastKnownRCFeatures,  "processedAudioDurationInMilliseconds");
      if (self->_didReceiveRCFeatures) {
        double lastKnownRCFeatureLatency = self->_lastKnownRCFeatureLatency;
      }
      else {
        double lastKnownRCFeatureLatency = (double)v49;
      }
      id v93 = objc_alloc(&OBJC_CLASS___CSEnhancedEndpointerFeatures);
      int64_t v94 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownASRFeatures, "trailingSilenceDuration");
      [v8 silenceFramesCountMs];
      double v96 = v95;
      -[CSASRFeatures eosLikelihood](self->_lastKnownASRFeatures, "eosLikelihood");
      double v98 = exp(-v97);
      int64_t v99 = -[CSASRFeatures wordCount](self->_lastKnownASRFeatures, "wordCount");
      [v8 silenceProbability];
      double v101 = v100;
      int64_t v102 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownRCFeatures, "trailingSilenceDuration");
      -[CSASRFeatures eosLikelihood](self->_lastKnownRCFeatures, "eosLikelihood");
      double v104 = exp(-v103);
      int64_t v105 = -[CSASRFeatures wordCount](self->_lastKnownRCFeatures, "wordCount");
      -[CSASRFeatures silencePosterior](self->_lastKnownASRFeatures, "silencePosterior");
      double v107 = v106;
      -[CSASRFeatures acousticEndpointerScore](self->_lastKnownASRFeatures, "acousticEndpointerScore");
      double v109 = v108;
      [v8 silenceDurationMs];
      *(float *)&double v110 = v110;
      LODWORD(v111) = LODWORD(v110);
      id v92 = objc_msgSend( v93,  "initWithTrailingSilenceDuration:clientSilenceFramesCount:endOfSentenceLikelihood:wordCount:serverFeaturesL atency:clientSilenceProbability:rcTrailingSilenceDuration:rcEndOfSentenceLikelihood:rcWordCount:rcServerFe aturesLatency:silencePosterior:acousticEndpointerScore:silencePosteriorNF:",  v94,  v99,  v102,  v105,  v96,  v98,  v42,  v101,  v104,  lastKnownRCFeatureLatency,  v107,  v109,  v111,  v112,  v113,  v114,  v115);
      unsigned __int8 v40 = 0LL;
      goto LABEL_26;
    }

    id v51 = objc_alloc(&OBJC_CLASS____EAREndpointFeatures);
    int64_t v52 = -[CSASRFeatures wordCount](self->_lastKnownASRFeatures, "wordCount");
    int64_t v53 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownASRFeatures, "trailingSilenceDuration");
    -[CSASRFeatures eosLikelihood](self->_lastKnownASRFeatures, "eosLikelihood");
    double v55 = v54;
    -[CSASRFeatures acousticEndpointerScore](self->_lastKnownASRFeatures, "acousticEndpointerScore");
    double v57 = v56;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CSASRFeatures pauseCounts](self->_lastKnownASRFeatures, "pauseCounts"));
    -[CSASRFeatures silencePosterior](self->_lastKnownASRFeatures, "silencePosterior");
    double v60 = v59;
    [v8 silenceFramesCountMs];
    double v62 = v61;
    [v8 silenceProbability];
    double v64 = v63;
    [v8 silenceDurationMs];
    *(float *)&double v66 = v65;
    *(float *)&double v67 = v42;
    v68 = v51;
    int64_t v69 = v52;
    int64_t v70 = v53;
    double v71 = v55;
    double v72 = v57;
    v73 = v58;
    double v74 = v60;
    double v75 = v62;
    double v76 = v64;
    goto LABEL_22;
  }

  double v12 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    lastKnownASRFeatures = self->_lastKnownASRFeatures;
    double v14 = v12;
    double v15 = COERCE_DOUBLE((id)-[CSASRFeatures processedAudioDurationInMilliseconds]( lastKnownASRFeatures,  "processedAudioDurationInMilliseconds"));
    *(_DWORD *)buf = 136315650;
    v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
    __int16 v121 = 2050;
    double v122 = v15;
    __int16 v123 = 2050;
    double v124 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s ClientLag: asrProcessedAudioMs(%{public}ld) > effectiveClientProcessedAudioMs(%{public}f)",  buf,  0x20u);
  }

  double v16 = a3
      - (double)-[CSASRFeatures processedAudioDurationInMilliseconds]( self->_lastKnownASRFeatures,  "processedAudioDurationInMilliseconds");
  double clientLagThresholdMs = self->_clientLagThresholdMs;
  if (v16 <= clientLagThresholdMs)
  {
    BOOL useDefaultASRFeaturesOnClientLag = self->_useDefaultASRFeaturesOnClientLag;
    id v19 = (os_log_s *)CSLogCategoryEP;
    BOOL v20 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
    if (useDefaultASRFeaturesOnClientLag)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315394;
        v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
        __int16 v121 = 2050;
        double v122 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s ClientLag: Using DefaultServerFeatures with disconnected-state sfLatency: %{public}f",  buf,  0x16u);
      }

      double v21 = (void *)objc_claimAutoreleasedReturnValue( -[_EAREndpointer defaultServerEndpointFeatures]( self->_hybridClassifier,  "defaultServerEndpointFeatures"));
      id v22 = objc_alloc(&OBJC_CLASS____EAREndpointFeatures);
      id v23 = [v21 wordCount];
      id v24 = [v21 trailingSilenceDuration];
      [v21 endOfSentenceLikelihood];
      double v26 = v25;
      [v21 acousticEndpointerScore];
      double v28 = v27;
      [v21 silencePosterior];
      double v30 = v29;
      [v8 silenceFramesCountMs];
      double v32 = v31;
      [v8 silenceProbability];
      double v34 = v33;
      [v8 silenceDurationMs];
      float v36 = v35;
      [v8 processedAudioMs];
      *(float *)&double v38 = v37;
      *(float *)&double v39 = v36;
      unsigned __int8 v40 = (NSError *)[v22 initWithWordCount:v23 trailingSilenceDuration:v24 endOfSentenceLikelihood:&__NSArray0__struct acousticEndpointerScore:0 pause Counts:v26 silencePosterior:v28 clientSilenceFramesCountMs:v30 clientSilenceProbability:v32 silencePosteriorNF:v34  serverFeaturesLatency:v39 eagerResultEndTime:v38];

      goto LABEL_23;
    }

    if (v20)
    {
      double clampedASRFeatureLatencyMsForClientLag = self->_clampedASRFeatureLatencyMsForClientLag;
      *(_DWORD *)buf = 136315394;
      v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
      __int16 v121 = 2050;
      double v122 = clampedASRFeatureLatencyMsForClientLag;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s ClientLag: Using ServerFeatures with ClampedSFLatency: %{public}f",  buf,  0x16u);
    }

    id v78 = objc_alloc(&OBJC_CLASS____EAREndpointFeatures);
    int64_t v79 = -[CSASRFeatures wordCount](self->_lastKnownASRFeatures, "wordCount");
    int64_t v80 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownASRFeatures, "trailingSilenceDuration");
    -[CSASRFeatures eosLikelihood](self->_lastKnownASRFeatures, "eosLikelihood");
    double v82 = v81;
    -[CSASRFeatures acousticEndpointerScore](self->_lastKnownASRFeatures, "acousticEndpointerScore");
    double v84 = v83;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CSASRFeatures pauseCounts](self->_lastKnownASRFeatures, "pauseCounts"));
    -[CSASRFeatures silencePosterior](self->_lastKnownASRFeatures, "silencePosterior");
    double v86 = v85;
    [v8 silenceFramesCountMs];
    double v88 = v87;
    [v8 silenceProbability];
    double v90 = v89;
    [v8 silenceDurationMs];
    *(float *)&double v66 = v91;
    *(float *)&double v67 = self->_clampedASRFeatureLatencyMsForClientLag;
    v68 = v78;
    int64_t v69 = v79;
    int64_t v70 = v80;
    double v71 = v82;
    double v72 = v84;
    v73 = v58;
    double v74 = v86;
    double v75 = v88;
    double v76 = v90;
LABEL_22:
    unsigned __int8 v40 = (NSError *)[v68 initWithWordCount:v69 trailingSilenceDuration:v70 endOfSentenceLikelihood:v73 acousticEndpointerScore:0 pauseCo unts:v71 silencePosterior:v72 clientSilenceFramesCountMs:v74 clientSilenceProbability:v75 silencePosteriorNF:v76 serv erFeaturesLatency:v66 eagerResultEndTime:v67];

LABEL_23:
    id v92 = 0LL;
LABEL_26:
    ((void (*)(void ***, void, NSError *, id))v10[2])(v10, 0LL, v40, v92);

    goto LABEL_27;
  }

  id v43 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v120 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
    __int16 v121 = 2050;
    double v122 = v16;
    __int16 v123 = 2050;
    double v124 = clientLagThresholdMs;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%s ClientLag: Not invoking HybridClassifier: sfLatency > clientLagThreshold: %{public}f > %{public}f",  buf,  0x20u);
  }

  __int16 v44 = objc_alloc(&OBJC_CLASS___NSError);
  uint64_t v45 = CSErrorDomain;
  v117[0] = @"sfLatency";
  __int16 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v16));
  v117[1] = @"clientLagThreshold";
  v118[0] = v46;
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_clientLagThresholdMs));
  v118[1] = v47;
  char v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v118,  v117,  2LL));
  unsigned __int8 v40 = -[NSError initWithDomain:code:userInfo:](v44, "initWithDomain:code:userInfo:", v45, 2302LL, v48);

  ((void (*)(void ***, NSError *, void, void))v10[2])(v10, v40, 0LL, 0LL);
LABEL_27:
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CBCD8;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
}

- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CB754;
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
  block[2] = sub_1000CB538;
  block[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(stateSerialQueue, block);
}

- (void)terminateProcessing
{
  int64_t v3 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSHybridEndpointer terminateProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  self->_recordingDidStop = 1;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CB500;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(hybridClassifierQueue, block);
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  float v5 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[CSHybridEndpointer recordingStoppedForReason:]";
    __int16 v8 = 2050;
    int64_t v9 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s CSHybridEndpointer recordingStoppedForReason: %{public}ld",  (uint8_t *)&v6,  0x16u);
  }

  -[CSHybridEndpointer terminateProcessing](self, "terminateProcessing");
}

- (void)stopEndpointer
{
  int64_t v3 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    float v5 = "-[CSHybridEndpointer stopEndpointer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[CSHybridEndpointer terminateProcessing](self, "terminateProcessing");
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  BOOL v5 = a5;
  __int16 v8 = (uint64_t (*)(uint64_t, uint64_t))a4;
  self->_recordingDidStop = 0;
  int64_t v9 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2114;
    double v32 = v8;
    LOWORD(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 2) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s sampleRate=%{public}lu, recordContext=%{public}@, disableRCSelection=%d",  buf,  0x26u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  double v32 = sub_1000CA7E8;
  double v33 = sub_1000CA7F8;
  id v34 = 0LL;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CA800;
  block[3] = &unk_10022D958;
  void block[4] = self;
  double v11 = v8;
  float v25 = v11;
  double v26 = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  id v12 = (os_log_s *)CSLogCategoryAsset;
  if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)&buf[8] + 40LL);
    *(_DWORD *)float v27 = 136315394;
    *(void *)&v27[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&v27[12] = 2114;
    *(void *)&v27[14] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s CSEndpointAsset exists: %{public}@",  v27,  0x16u);
  }

  if (!*(void *)(*(void *)&buf[8] + 40LL))
  {
    double v14 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSAssetManager sharedManager](&OBJC_CLASS___CSAssetManager, "sharedManager"));
      double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 currentLanguageCode]);
      *(_DWORD *)float v27 = 136315394;
      *(void *)&v27[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
      *(_WORD *)&v27[12] = 2114;
      *(void *)&v27[14] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s No asset for CSHybridEndpointer for currentLanguage: %{public}@. Fallback to NNVAD",  v27,  0x16u);
    }
  }

  *(void *)float v27 = 0LL;
  *(void *)&v27[8] = v27;
  *(void *)&v27[16] = 0x3032000000LL;
  double v28 = sub_1000CA7E8;
  float v29 = sub_1000CA7F8;
  id v30 = 0LL;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000CA848;
  v22[3] = &unk_10022CD70;
  BOOL v23 = v5;
  v22[4] = self;
  v22[5] = buf;
  v22[6] = v27;
  v22[7] = a3;
  dispatch_async_and_wait(hybridClassifierQueue, v22);
  asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000CAFD4;
  v21[3] = &unk_10022EF80;
  v21[4] = self;
  v21[5] = v27;
  dispatch_async_and_wait(asrFeaturesQueue, v21);
  id v19 = (dispatch_queue_s *)self->_stateSerialQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000CB17C;
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  asrFeaturesQueue = (dispatch_queue_s *)self->_asrFeaturesQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CA4E0;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
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

- (void)endpointerAssetManagerDidUpdateAsset:(id)a3
{
  id v4 = a3;
  stateSerialQueue = (dispatch_queue_s *)self->_stateSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CA4D4;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateSerialQueue, v7);
}

- (id)_getCSHybridEndpointerConfigForAsset:(id)a3
{
  id v3 = a3;
  else {
    BOOL v5 = @"cs_hep.json";
  }
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 resourcePath]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 stringByAppendingPathComponent:v5]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LOBYTE(v6) = [v8 fileExistsAtPath:v7];

  if ((v6 & 1) != 0)
  {
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v7));
    if (v9)
    {
      id v17 = 0LL;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v9,  0LL,  &v17));
      id v11 = v17;
      if (v11)
      {
        id v12 = (os_log_s *)CSLogCategoryEP;
        if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v19 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
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
      double v15 = (os_log_s *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v19 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
        __int16 v20 = 2114;
        double v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }

      id v13 = 0LL;
    }
  }

  else
  {
    double v14 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
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

- (BOOL)_useEnhancedEndpointer
{
  return self->_enhancedEndpointer != 0LL;
}

- (void)processRCFeatures:(id)a3
{
  id v4 = a3;
  hybridClassifierQueue = (dispatch_queue_s *)self->_hybridClassifierQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000CA3C4;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);
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

- (CSASRFeatures)lastKnownRCFeatures
{
  return self->_lastKnownRCFeatures;
}

- (void)setLastKnownRCFeatures:(id)a3
{
}

- (NSMutableArray)asrFeaturesLatencies
{
  return self->_asrFeaturesLatencies;
}

- (void)setAsrFeaturesLatencies:(id)a3
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

- (double)lastKnownRCFeatureLatency
{
  return self->_lastKnownRCFeatureLatency;
}

- (void)setLastKnownRCFeatureLatency:(double)a3
{
  self->_double lastKnownRCFeatureLatency = a3;
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
  self->_double clientLagThresholdMs = a3;
}

- (double)clampedASRFeatureLatencyMsForClientLag
{
  return self->_clampedASRFeatureLatencyMsForClientLag;
}

- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3
{
  self->_double clampedASRFeatureLatencyMsForClientLag = a3;
}

- (BOOL)useDefaultASRFeaturesOnClientLag
{
  return self->_useDefaultASRFeaturesOnClientLag;
}

- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3
{
  self->_BOOL useDefaultASRFeaturesOnClientLag = a3;
}

- (unint64_t)extraDelayFrequency
{
  return self->_extraDelayFrequency;
}

- (void)setExtraDelayFrequency:(unint64_t)a3
{
  self->_extraDelayFrequency = a3;
}

- (NSDictionary)taskThresholdMap
{
  return self->_taskThresholdMap;
}

- (void)setTaskThresholdMap:(id)a3
{
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

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (BOOL)isASRFeatureFromServer
{
  return self->_isASRFeatureFromServer;
}

- (void)setIsASRFeatureFromServer:(BOOL)a3
{
  self->_isASRFeatureFromServer = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
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

- (int64_t)endpointerOperationMode
{
  return self->_endpointerOperationMode;
}

- (CSEnhancedEndpointer)enhancedEndpointer
{
  return self->_enhancedEndpointer;
}

- (void)setEnhancedEndpointer:(id)a3
{
}

- (NSDictionary)taskEnhancedEndpointerMap
{
  return self->_taskEnhancedEndpointerMap;
}

- (void)setTaskEnhancedEndpointerMap:(id)a3
{
}

- (BOOL)enhancedEndpointerDefaultResult
{
  return self->_enhancedEndpointerDefaultResult;
}

- (void)setEnhancedEndpointerDefaultResult:(BOOL)a3
{
  self->_enhancedEndpointerDefaultResult = a3;
}

- (BOOL)didReceiveRCFeatures
{
  return self->_didReceiveRCFeatures;
}

- (void)setDidReceiveRCFeatures:(BOOL)a3
{
  self->_didReceiveRCFeatures = a3;
}

- (NSDictionary)enhancedEndpointerTaskThresholdMap
{
  return self->_enhancedEndpointerTaskThresholdMap;
}

- (void)setEnhancedEndpointerTaskThresholdMap:(id)a3
{
}

- (BOOL)hasAcceptedEagerResult
{
  return self->_hasAcceptedEagerResult;
}

- (void)setHasAcceptedEagerResult:(BOOL)a3
{
  self->_hasAcceptedEagerResult = a3;
}

- (BOOL)disableRCSelection
{
  return self->_disableRCSelection;
}

- (void)setDisableRCSelection:(BOOL)a3
{
  self->_disableRCSelection = a3;
}

- (void).cxx_destruct
{
}

@end