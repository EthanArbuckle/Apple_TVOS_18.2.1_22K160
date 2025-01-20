@interface CSNNVADEndpointAnalyzer
+ (id)timeStampString;
- (AVAudioFormat)currentRequestAudioFormat;
- (BOOL)_shouldEnterTwoShotAtAudioTimeInSecs:(double)a3;
- (BOOL)canProcessCurrentRequest;
- (BOOL)didEnterTwoshot;
- (BOOL)finishedSkippingSamplesForVT;
- (BOOL)hasReportedFirstAudioSampleSensorTimestamp;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeout;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)shouldDetectTwoShot;
- (CSAudioFileWriter)audioFileWriter;
- (CSEndpointAnalyzerDelegate)delegate;
- (CSEndpointAnalyzerImplDelegate)implDelegate;
- (CSNNVADEndpointAnalyzer)init;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer;
- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3;
- (double)_trailingSilenceDurationAtEndpoint;
- (double)automaticEndpointingSuspensionEndTime;
- (double)delay;
- (double)endWaitTime;
- (double)firstAudioSampleSensorTimestamp;
- (double)interspeechWaitTime;
- (double)lastEndOfVoiceActivityTime;
- (double)lastStartOfVoiceActivityTime;
- (double)minimumDurationForEndpointer;
- (double)nnvadAudioOriginInMs;
- (double)startWaitTime;
- (double)vtEndInSecs;
- (double)vtExtraAudioAtStartInMs;
- (id)_pcmBufferForAudioChunk:(id)a3;
- (int64_t)endpointStyle;
- (int64_t)firstSampleId;
- (unint64_t)activeChannel;
- (unint64_t)anchorMachAbsTime;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)framePosition;
- (unint64_t)nnvadState;
- (unint64_t)numSamplesProcessedBeforeAnchorTime;
- (unint64_t)numSamplesReceived;
- (unint64_t)numSamplesSkippedForVT;
- (unint64_t)vtEndInSampleCount;
- (void)_checkSNObservationForEndpoint:(id)a3;
- (void)_checkSNObservationForStartpoint:(id)a3;
- (void)_emitEndpointDetectedEventWithEndpointTime:(double)a3 endpointBufferHostTime:(unint64_t)a4;
- (void)_reportAudioFirstBufferInfoIfNecessary;
- (void)_reportEndpointAtTsInSecs:(double)a3;
- (void)_reportStartpointAtTsInSecs:(double)a3;
- (void)_reportTwoShotAtTsInSecs:(double)a3;
- (void)handleVoiceTriggerWithActivationInfo:(id)a3;
- (void)preheat;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnchorMachAbsTime:(unint64_t)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setCurrentRequestAudioFormat:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidEnterTwoshot:(BOOL)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointStyle:(int64_t)a3;
- (void)setFinishedSkippingSamplesForVT:(BOOL)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setFirstSampleId:(int64_t)a3;
- (void)setFramePosition:(unint64_t)a3;
- (void)setHasReportedFirstAudioSampleSensorTimestamp:(BOOL)a3;
- (void)setImplDelegate:(id)a3;
- (void)setInterspeechWaitTime:(double)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeout:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setMinimumDurationForEndpointer:(double)a3;
- (void)setNnvadAudioOriginInMs:(double)a3;
- (void)setNnvadState:(unint64_t)a3;
- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3;
- (void)setNumSamplesReceived:(unint64_t)a3;
- (void)setNumSamplesSkippedForVT:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSaveSamplesSeenInReset:(BOOL)a3;
- (void)setShouldDetectTwoShot:(BOOL)a3;
- (void)setSnAudioStreamAnalyzer:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setVtEndInSecs:(double)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
- (void)stopEndpointer;
@end

@implementation CSNNVADEndpointAnalyzer

- (CSNNVADEndpointAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSNNVADEndpointAnalyzer;
  v2 = -[CSNNVADEndpointAnalyzer init](&v7, "init");
  if (v2)
  {
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v2->_currentRequestSampleRate = (unint64_t)v3;
    v2->_firstAudioSampleSensorTimestamp = 0.0;
    v2->_firstSampleId = -1LL;
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  @"com.apple.corespeech.nnvad",  kCSDefaultSerialQueueFixedPriority));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E714;
  block[3] = &unk_10022E7F8;
  v12 = self;
  unint64_t v13 = a3;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E504;
  block[3] = &unk_10022EFD0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(queue, block);
}

- (id)_pcmBufferForAudioChunk:(id)a3
{
  unint64_t activeChannel = self->_activeChannel;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataForChannel:activeChannel]);
  id v7 = [v5 numSamples];
  id v8 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]( objc_alloc(&OBJC_CLASS___AVAudioPCMBuffer),  "initWithPCMFormat:frameCapacity:",  self->_currentRequestAudioFormat,  v7);
  -[AVAudioPCMBuffer setFrameLength:](v8, "setFrameLength:", v7);
  id v9 = (void *)*((void *)-[AVAudioPCMBuffer mutableAudioBufferList](v8, "mutableAudioBufferList") + 2);
  id v10 = v6;
  id v11 = [v10 bytes];
  id v12 = [v5 numSamples];
  id v13 = [v5 sampleByteDepth];

  memcpy(v9, v11, (void)v13 * (void)v12);
  return v8;
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005E160;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopEndpointer
{
  float v3 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSNNVADEndpointAnalyzer stopEndpointer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  self->_nnvadState = 2LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E124;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005E03C;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_reportAudioFirstBufferInfoIfNecessary
{
  if (!self->_hasReportedFirstAudioSampleSensorTimestamp && self->_firstAudioSampleSensorTimestamp != 0.0)
  {
    float v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v3 logEventWithType:4710 machAbsoluteTime:(unint64_t)self->_firstAudioSampleSensorTimestamp context:0];

    self->_hasReportedFirstAudioSampleSensorTimestamp = 1;
  }

- (BOOL)_shouldEnterTwoShotAtAudioTimeInSecs:(double)a3
{
  if (!self->_shouldDetectTwoShot) {
    return 0;
  }
  if (self->_didEnterTwoshot) {
    return 0;
  }
  double vtEndInSecs = self->_vtEndInSecs;
  double v6 = a3 - vtEndInSecs;
  if (a3 - vtEndInSecs <= 0.55) {
    return 0;
  }
  id v7 = (os_log_s *)CSLogCategoryEP;
  BOOL v8 = 1;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEBUG))
  {
    double endWaitTime = self->_endWaitTime;
    int v11 = 136316674;
    id v12 = "-[CSNNVADEndpointAnalyzer _shouldEnterTwoShotAtAudioTimeInSecs:]";
    __int16 v13 = 2050;
    double v14 = a3;
    __int16 v15 = 2050;
    double v16 = vtEndInSecs;
    __int16 v17 = 2050;
    double v18 = endWaitTime;
    __int16 v19 = 2050;
    double v20 = v6;
    __int16 v21 = 2050;
    uint64_t v22 = 0x3FE199999999999ALL;
    __int16 v23 = 1026;
    int v24 = 1;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s CSEndpointerProxy: ep-time: %{public}f, triggerEnd: %{public}f, nnvadEndWaitTime: %{public}f, delta: %{public}f , legacyTwoShotThreshold: %{public}f, enterTwoShot: %{public}d",  (uint8_t *)&v11,  0x44u);
  }

  return v8;
}

- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3
{
  if (a3)
  {
    [a3 timeRange];
    double v4 = (double)v6;
  }

  else
  {
    double v4 = 0.0;
  }

  return self->_vtEndInSecs + v4 / (double)self->_currentRequestSampleRate;
}

- (void)_checkSNObservationForStartpoint:(id)a3
{
  id v4 = a3;
  -[CSNNVADEndpointAnalyzer _effectiveAudioTimeInSecsForSNObservation:]( self,  "_effectiveAudioTimeInSecsForSNObservation:",  v4);
  double v6 = v5;
  unsigned int v7 = [v4 detected];

  if (v7)
  {
    -[CSNNVADEndpointAnalyzer _reportStartpointAtTsInSecs:](self, "_reportStartpointAtTsInSecs:", v6);
  }

  else if (-[CSNNVADEndpointAnalyzer _shouldEnterTwoShotAtAudioTimeInSecs:]( self,  "_shouldEnterTwoShotAtAudioTimeInSecs:",  v6))
  {
    -[CSNNVADEndpointAnalyzer _reportTwoShotAtTsInSecs:](self, "_reportTwoShotAtTsInSecs:", v6);
  }

  else
  {
    double startWaitTime = self->_startWaitTime;
    if (v6 > startWaitTime)
    {
      id v9 = (os_log_s *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        int v11 = "-[CSNNVADEndpointAnalyzer _checkSNObservationForStartpoint:]";
        __int16 v12 = 2050;
        double v13 = v6;
        __int16 v14 = 2050;
        double v15 = startWaitTime;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s No Startpt detected even after %{public}f secs. startWaitTime=%{public}f secs",  (uint8_t *)&v10,  0x20u);
      }

      self->_isRequestTimeout = 1;
      -[CSNNVADEndpointAnalyzer _reportEndpointAtTsInSecs:](self, "_reportEndpointAtTsInSecs:", v6);
    }
  }

- (void)_checkSNObservationForEndpoint:(id)a3
{
  id v4 = a3;
  if (([v4 detected] & 1) == 0)
  {
    -[CSNNVADEndpointAnalyzer _effectiveAudioTimeInSecsForSNObservation:]( self,  "_effectiveAudioTimeInSecsForSNObservation:",  v4);
    double v6 = v5;
    double automaticEndpointingSuspensionEndTime = self->_automaticEndpointingSuspensionEndTime;
    if (v5 <= automaticEndpointingSuspensionEndTime)
    {
      BOOL v8 = (os_log_s *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        int v10 = "-[CSNNVADEndpointAnalyzer _checkSNObservationForEndpoint:]";
        __int16 v11 = 2050;
        double v12 = v6;
        __int16 v13 = 2050;
        double v14 = automaticEndpointingSuspensionEndTime;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Postponing endpt as Endpoint(%{public}f) < _automaticEndpointingSuspensionEndTime(%{public}f)",  (uint8_t *)&v9,  0x20u);
      }
    }

    else
    {
      -[CSNNVADEndpointAnalyzer _reportEndpointAtTsInSecs:](self, "_reportEndpointAtTsInSecs:", v5);
    }
  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (self->_nnvadState == 2)
  {
    int v9 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v15 = "-[CSNNVADEndpointAnalyzer request:didProduceResult:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Processing finished. Not scheduling",  buf,  0xCu);
    }
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005DF44;
    v11[3] = &unk_10022EFD0;
    id v12 = v7;
    __int16 v13 = self;
    dispatch_async(queue, v11);
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    int v9 = "-[CSNNVADEndpointAnalyzer request:didFailWithError:]";
    __int16 v10 = 2114;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s request: %{public}@, returnedError: %{public}@",  (uint8_t *)&v8,  0x20u);
  }
}

- (void)_reportEndpointAtTsInSecs:(double)a3
{
  self->_nnvadState = 2LL;
  double v5 = self->_vtExtraAudioAtStartInMs / 1000.0 + a3;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  unint64_t v7 = (unint64_t)(v5 * v6);
  unint64_t numSamplesProcessedBeforeAnchorTime = self->_numSamplesProcessedBeforeAnchorTime;
  unint64_t anchorMachAbsTime = self->_anchorMachAbsTime;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  id v10 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:]( &OBJC_CLASS___CSFTimeUtils,  "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:",  v7,  anchorMachAbsTime,  numSamplesProcessedBeforeAnchorTime);
  id v11 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAnchorTimeBuffered = self->_isAnchorTimeBuffered;
    int v22 = 136315650;
    __int16 v23 = "-[CSNNVADEndpointAnalyzer _reportEndpointAtTsInSecs:]";
    __int16 v24 = 2050;
    id v25 = v10;
    __int16 v26 = 1026;
    BOOL v27 = isAnchorTimeBuffered;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s endpointedBuffer.hostTime=%{public}llu, isAnchorTimeBuffered=%{public}d",  (uint8_t *)&v22,  0x1Cu);
  }

  id v13 = objc_alloc(&OBJC_CLASS___CSEndpointerMetrics);
  -[CSNNVADEndpointAnalyzer _trailingSilenceDurationAtEndpoint](self, "_trailingSilenceDurationAtEndpoint");
  double v15 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:]( v13,  "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribut ion:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:",  v10,  0LL,  0LL,  0LL,  0LL,  0LL,  a3 * 1000.0,  v14);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointer:self didDetectHardEndpointAtTime:v15 withMetrics:a3];

  id v17 = objc_loadWeakRetained((id *)&self->_implDelegate);
  if (v17)
  {
    double v18 = v17;
    id v19 = objc_loadWeakRetained((id *)&self->_implDelegate);
    char v20 = objc_opt_respondsToSelector(v19, "endpointer:reportEndpointBufferHostTime:firstBufferHostTime:");

    if ((v20 & 1) != 0)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_implDelegate);
      [v21 endpointer:self reportEndpointBufferHostTime:v10 firstBufferHostTime:(unint64_t)self->_firstAudioSampleSensorTimestamp];

      self->_hasReportedFirstAudioSampleSensorTimestamp = 1;
    }
  }

  -[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:]( self,  "_emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:",  v10,  a3);
}

- (void)setMhId:(id)a3
{
}

- (void)_emitEndpointDetectedEventWithEndpointTime:(double)a3 endpointBufferHostTime:(unint64_t)a4
{
  if (self->_mhId)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointDetected);
    [v7 setEndpointerType:2];
    *(float *)&double v8 = a3;
    objc_msgSend( v7,  "setEndpointAudioDurationInNs:",  +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:", v8));
    objc_msgSend( v7,  "setFirstBufferTimeInNs:",  +[CSFTimeUtils hostTimeToNs:]( CSFTimeUtils,  "hostTimeToNs:",  (unint64_t)self->_firstAudioSampleSensorTimestamp));
    objc_msgSend( v7,  "setEndpointedBufferTimeInNs:",  +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", a4));
    [v7 setDerivedBufferTimeFromHistoricalAudio:self->_isAnchorTimeBuffered];
    id v9 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointerTimeoutMetadata);
    [v9 setIsTimeout:self->_isRequestTimeout];
    [v7 setTimeoutMetadata:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHClientEventByMhUUID:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHClientEventByMhUUID:",  self->_mhId));
    [v10 setEndpointDetected:v7];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v11 emitMessage:v10];

    __int16 v12 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      int v15 = 136315394;
      double v16 = "-[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:]";
      __int16 v17 = 2112;
      double v18 = mhId;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@",  (uint8_t *)&v15,  0x16u);
    }
  }

  else
  {
    double v14 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      double v16 = "-[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v15,  0xCu);
    }
  }

- (void)_reportStartpointAtTsInSecs:(double)a3
{
  self->_nnvadState = 1LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointer:self didDetectStartpointAtTime:a3];
}

- (void)_reportTwoShotAtTsInSecs:(double)a3
{
  self->_didEnterTwoshot = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_implDelegate);
  [WeakRetained endpointer:self detectedTwoShotAtTime:a3];
}

- (BOOL)canProcessCurrentRequest
{
  return 1;
}

- (double)_trailingSilenceDurationAtEndpoint
{
  id v2 = [[SNDetectSpeechUtteranceRequest alloc] initWithRequestType:0];
  [v2 decisionDelay];
  double v4 = v3;

  return v4;
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005DF34;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setStartWaitTime:(double)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005DF24;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setEndWaitTime:(double)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005DF14;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)preheat
{
  id v2 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    double v4 = "-[CSNNVADEndpointAnalyzer preheat]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s No Preheat required", (uint8_t *)&v3, 0xCu);
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
  self->_unint64_t activeChannel = a3;
}

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return self->_automaticEndpointingSuspensionEndTime;
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

- (double)lastEndOfVoiceActivityTime
{
  return self->_lastEndOfVoiceActivityTime;
}

- (double)lastStartOfVoiceActivityTime
{
  return self->_lastStartOfVoiceActivityTime;
}

- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer
{
  return self->_snAudioStreamAnalyzer;
}

- (void)setSnAudioStreamAnalyzer:(id)a3
{
}

- (unint64_t)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unint64_t)a3
{
  self->_framePosition = a3;
}

- (unint64_t)nnvadState
{
  return self->_nnvadState;
}

- (void)setNnvadState:(unint64_t)a3
{
  self->_nnvadState = a3;
}

- (unint64_t)numSamplesReceived
{
  return self->_numSamplesReceived;
}

- (void)setNumSamplesReceived:(unint64_t)a3
{
  self->_numSamplesReceived = a3;
}

- (unint64_t)numSamplesProcessedBeforeAnchorTime
{
  return self->_numSamplesProcessedBeforeAnchorTime;
}

- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3
{
  self->_unint64_t numSamplesProcessedBeforeAnchorTime = a3;
}

- (unint64_t)anchorMachAbsTime
{
  return self->_anchorMachAbsTime;
}

- (void)setAnchorMachAbsTime:(unint64_t)a3
{
  self->_unint64_t anchorMachAbsTime = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_BOOL isAnchorTimeBuffered = a3;
}

- (BOOL)isRequestTimeout
{
  return self->_isRequestTimeout;
}

- (void)setIsRequestTimeout:(BOOL)a3
{
  self->_isRequestTimeout = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (AVAudioFormat)currentRequestAudioFormat
{
  return self->_currentRequestAudioFormat;
}

- (void)setCurrentRequestAudioFormat:(id)a3
{
}

- (double)vtEndInSecs
{
  return self->_vtEndInSecs;
}

- (void)setVtEndInSecs:(double)a3
{
  self->_double vtEndInSecs = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (double)nnvadAudioOriginInMs
{
  return self->_nnvadAudioOriginInMs;
}

- (void)setNnvadAudioOriginInMs:(double)a3
{
  self->_nnvadAudioOriginInMs = a3;
}

- (BOOL)shouldDetectTwoShot
{
  return self->_shouldDetectTwoShot;
}

- (void)setShouldDetectTwoShot:(BOOL)a3
{
  self->_shouldDetectTwoShot = a3;
}

- (BOOL)didEnterTwoshot
{
  return self->_didEnterTwoshot;
}

- (void)setDidEnterTwoshot:(BOOL)a3
{
  self->_didEnterTwoshot = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
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

- (BOOL)hasReportedFirstAudioSampleSensorTimestamp
{
  return self->_hasReportedFirstAudioSampleSensorTimestamp;
}

- (void)setHasReportedFirstAudioSampleSensorTimestamp:(BOOL)a3
{
  self->_hasReportedFirstAudioSampleSensorTimestamp = a3;
}

- (int64_t)firstSampleId
{
  return self->_firstSampleId;
}

- (void)setFirstSampleId:(int64_t)a3
{
  self->_firstSampleId = a3;
}

- (unint64_t)numSamplesSkippedForVT
{
  return self->_numSamplesSkippedForVT;
}

- (void)setNumSamplesSkippedForVT:(unint64_t)a3
{
  self->_numSamplesSkippedForVT = a3;
}

- (BOOL)finishedSkippingSamplesForVT
{
  return self->_finishedSkippingSamplesForVT;
}

- (void)setFinishedSkippingSamplesForVT:(BOOL)a3
{
  self->_finishedSkippingSamplesForVT = a3;
}

- (void).cxx_destruct
{
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

@end