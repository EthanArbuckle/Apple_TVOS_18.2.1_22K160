@interface CSEndpointerProxy
- (BOOL)_updateAccessibleEndpointerThresholdIfNeed;
- (BOOL)accessibleEndpointerEnabled;
- (BOOL)isWatchRTSTriggered;
- (BOOL)recordingDidStop;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4;
- (CSAudioRecordContext)recordContext;
- (CSEndpointAnalyzerDelegate)endpointerDelegate;
- (CSEndpointAnalyzerImpl)activeEndpointer;
- (CSEndpointAnalyzerImpl)hybridEndpointer;
- (CSEndpointAnalyzerImpl)nnvadEndpointer;
- (CSEndpointAnalyzerImplDelegate)endpointerImplDelegate;
- (CSEndpointerProxy)init;
- (double)automaticEndpointingSuspensionEndTime;
- (double)delay;
- (double)endWaitTime;
- (double)interspeechWaitTime;
- (double)lastEndOfVoiceActivityTime;
- (double)lastStartOfVoiceActivityTime;
- (double)minimumDurationForEndpointer;
- (double)postVoiceTriggerSilence;
- (double)startWaitTime;
- (id)cachedEndpointerMetrics;
- (id)endpointerModelVersion;
- (id)initForSidekick;
- (int64_t)endpointStyle;
- (int64_t)fetchCurrentEndpointerOperationMode;
- (unint64_t)endPointAnalyzerType;
- (void)_setupNNVADEndpointer;
- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6;
- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)endpointer:(id)a3 reportEndpointBufferHostTime:(unint64_t)a4 firstBufferHostTime:(unint64_t)a5;
- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6;
- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)preheat;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4;
- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5;
- (void)processRCFeatures:(id)a3;
- (void)processTaskString:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6;
- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3;
- (void)setAccessibleEndpointerEnabled:(BOOL)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setActiveEndpointer:(id)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointerDelegate:(id)a3;
- (void)setEndpointerImplDelegate:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setHybridEndpointer:(id)a3;
- (void)setNnvadEndpointer:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingDidStop:(BOOL)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5;
- (void)stopEndpointer;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
@end

@implementation CSEndpointerProxy

- (CSEndpointerProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSEndpointerProxy;
  v2 = -[CSEndpointerProxy init](&v8, "init");
  if (v2)
  {
    if (+[CSUtils supportHybridEndpointer](&OBJC_CLASS___CSUtils, "supportHybridEndpointer"))
    {
      unsigned int v3 = +[CSUtils isAttentiveSiriEnabled](&OBJC_CLASS___CSUtils, "isAttentiveSiriEnabled");
      v4 = &off_100228920;
      if (!v3) {
        v4 = off_100228918;
      }
      v5 = (CSEndpointAnalyzerImpl *)objc_alloc_init(*v4);
      hybridEndpointer = v2->_hybridEndpointer;
      v2->_hybridEndpointer = v5;

      -[CSEndpointAnalyzerImpl setDelegate:](v2->_hybridEndpointer, "setDelegate:", v2);
      -[CSEndpointAnalyzerImpl setImplDelegate:](v2->_hybridEndpointer, "setImplDelegate:", v2);
    }

    if (!v2->_hybridEndpointer)
    {
      -[CSEndpointerProxy _setupNNVADEndpointer](v2, "_setupNNVADEndpointer");
      objc_storeWeak((id *)&v2->_activeEndpointer, v2->_nnvadEndpointer);
    }
  }

  return v2;
}

- (id)initForSidekick
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSEndpointerProxy;
  v2 = -[CSEndpointerProxy init](&v6, "init");
  if (v2)
  {
    if (+[CSUtils supportHybridEndpointer](&OBJC_CLASS___CSUtils, "supportHybridEndpointer"))
    {
      unsigned int v3 = objc_alloc_init(&OBJC_CLASS___CSHybridEndpointAnalyzer);
      hybridEndpointer = v2->_hybridEndpointer;
      v2->_hybridEndpointer = (CSEndpointAnalyzerImpl *)v3;

      -[CSEndpointAnalyzerImpl setDelegate:](v2->_hybridEndpointer, "setDelegate:", v2);
      -[CSEndpointAnalyzerImpl setImplDelegate:](v2->_hybridEndpointer, "setImplDelegate:", v2);
    }

    if (!v2->_hybridEndpointer)
    {
      -[CSEndpointerProxy _setupNNVADEndpointer](v2, "_setupNNVADEndpointer");
      objc_storeWeak((id *)&v2->_activeEndpointer, v2->_nnvadEndpointer);
    }
  }

  return v2;
}

- (void)_setupNNVADEndpointer
{
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___CSNNVADEndpointAnalyzer);
  nnvadEndpointer = self->_nnvadEndpointer;
  self->_nnvadEndpointer = (CSEndpointAnalyzerImpl *)v3;

  -[CSEndpointAnalyzerImpl setDelegate:](self->_nnvadEndpointer, "setDelegate:", self);
  -[CSEndpointAnalyzerImpl setImplDelegate:](self->_nnvadEndpointer, "setImplDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", 0LL));
  LODWORD(self) = +[CSUtils isNNVADFallbackUnexpectedForLanguageCode:]( &OBJC_CLASS___CSUtils,  "isNNVADFallbackUnexpectedForLanguageCode:",  v5);

  if ((_DWORD)self)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[CSDiagnosticReporter sharedInstance](&OBJC_CLASS___CSDiagnosticReporter, "sharedInstance"));
    [v6 submitEndpointerIssueReport:kCSDiagnosticReporterEndpointerNNVADFallback];
  }

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 disableEndpointer])
  {
    v14 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315394;
      v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Endpointer is disabled in recordOption: %@",  (uint8_t *)&v27,  0x16u);
    }

    objc_storeWeak((id *)&self->_activeEndpointer, 0LL);
    goto LABEL_21;
  }

  self->_recordingDidStop = 0;
  id v15 = [v12 disableRCSelection];
  if (self->_hybridEndpointer)
  {
    kdebug_trace(722472152LL, 0LL, 0LL, 0LL, 0LL);
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]( self->_hybridEndpointer,  "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:",  a3,  v11,  v15);
    kdebug_trace(722472156LL, 0LL, 0LL, 0LL, 0LL);
    unsigned int v16 = -[CSEndpointAnalyzerImpl canProcessCurrentRequest]( self->_hybridEndpointer,  "canProcessCurrentRequest");
    v17 = (os_log_s *)CSLogCategoryEP;
    BOOL v18 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v27 = 136315138;
        v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s CSHybridEndpointer canProcessCurrentRequest",  (uint8_t *)&v27,  0xCu);
      }

      hybridEndpointer = self->_hybridEndpointer;
      goto LABEL_17;
    }

    if (v18)
    {
      int v27 = 136315138;
      v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s CSHybridEndpointer can NOT ProcessCurrentRequest, fallback to NNVAD",  (uint8_t *)&v27,  0xCu);
    }

    kdebug_trace(722472372LL, 0LL, 0LL, 0LL, 0LL);
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]( self->_nnvadEndpointer,  "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:",  a3,  v11,  v15);
  }

  else
  {
    kdebug_trace(722472372LL, 0LL, 0LL, 0LL, 0LL);
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]( self->_nnvadEndpointer,  "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:",  a3,  v11,  v15);
  }

  kdebug_trace(722472376LL, 0LL, 0LL, 0LL, 0LL);
  hybridEndpointer = self->_nnvadEndpointer;
LABEL_17:
  objc_storeWeak((id *)&self->_activeEndpointer, hybridEndpointer);
  p_activeEndpointer = &self->_activeEndpointer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v12 requestMHUUID]);
  [WeakRetained setMhId:v22];

  if ([v11 isVoiceTriggered])
  {
    id v23 = objc_loadWeakRetained((id *)&self->_activeEndpointer);
    [v23 handleVoiceTriggerWithActivationInfo:v13];
  }

  self->_accessibleEndpointerEnabled = -[CSEndpointerProxy _updateAccessibleEndpointerThresholdIfNeed]( self,  "_updateAccessibleEndpointerThresholdIfNeed");
  objc_storeStrong((id *)&self->_recordContext, a4);
  v24 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    id v26 = objc_loadWeakRetained((id *)p_activeEndpointer);
    int v27 = 136315394;
    v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
    __int16 v29 = 2114;
    id v30 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s _activeEndpointer=%{public}@",  (uint8_t *)&v27,  0x16u);
  }

- (id)cachedEndpointerMetrics
{
  v2 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSEndpointerProxy cachedEndpointerMetrics]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "%s Not supported in this call flow",  (uint8_t *)&v4,  0xCu);
  }

  return 0LL;
}

- (BOOL)_updateAccessibleEndpointerThresholdIfNeed
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v4 = [v3 accessibleEndpointerThreshold];

  if (v4 == (id)2)
  {
    v5 = @"accessible-extended";
    goto LABEL_5;
  }

  if (v4 == (id)3)
  {
    v5 = @"accessible-maximum";
LABEL_5:
    -[CSEndpointAnalyzerImpl processTaskString:](self->_hybridEndpointer, "processTaskString:", v5);
    return 1;
  }

  return 0;
}

- (void)stopEndpointer
{
  self->_recordingDidStop = 1;
  -[CSEndpointAnalyzerImpl stopEndpointer](self->_hybridEndpointer, "stopEndpointer");
  -[CSEndpointAnalyzerImpl stopEndpointer](self->_nnvadEndpointer, "stopEndpointer");
  objc_storeWeak((id *)&self->_activeEndpointer, 0LL);
}

- (BOOL)isWatchRTSTriggered
{
  int v3 = CSIsWatch(self, a2);
  if (v3) {
    LOBYTE(v3) = -[CSAudioRecordContext isRTSTriggered](self->_recordContext, "isRTSTriggered");
  }
  return v3;
}

- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3
{
  unsigned int v5 = +[CSUtils supportCSTwoShotDecision](&OBJC_CLASS___CSUtils, "supportCSTwoShotDecision");
  id v6 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    int v8 = 136315650;
    v9 = "-[CSEndpointerProxy resetForVoiceTriggerTwoShotWithSampleRate:]";
    __int16 v10 = 1026;
    unsigned int v11 = v5;
    __int16 v12 = 1026;
    unsigned int v13 = -[CSEndpointerProxy isWatchRTSTriggered](self, "isWatchRTSTriggered");
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s shouldUseCVT2ShotDecision: %{public}d, isWatchRTSTriggered=%{public}d",  (uint8_t *)&v8,  0x18u);
  }

  if (self->_nnvadEndpointer)
  {
    kdebug_trace(722472372LL, 0LL, 0LL, 0LL, 0LL);
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]( self->_nnvadEndpointer,  "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:",  a3,  0LL,  0LL);
    kdebug_trace(722472376LL, 0LL, 0LL, 0LL, 0LL);
  }

- (void)setActiveChannel:(unint64_t)a3
{
}

- (void)preheat
{
  int v3 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    unsigned int v5 = "-[CSEndpointerProxy preheat]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s preheat", (uint8_t *)&v4, 0xCu);
  }

  -[CSEndpointAnalyzerImpl preheat](self->_nnvadEndpointer, "preheat");
  -[CSEndpointAnalyzerImpl preheat](self->_hybridEndpointer, "preheat");
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v7 = a3;
  uint64_t v4 = qword_10027FED8;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_10027FED8, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace(722472212LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v4 = qword_10027FED8;
  }

  qword_10027FED8 = v4 + 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  [WeakRetained processAudioSamplesAsynchronously:v7];

  uint64_t v6 = qword_10027FEE0;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_10027FEE0, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace(722472216LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v6 = qword_10027FEE0;
  }

  qword_10027FEE0 = v6 + 1;
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  self->_recordingDidStop = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  [WeakRetained recordingStoppedForReason:a3];
}

- (double)lastStartOfVoiceActivityTime
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  [WeakRetained lastStartOfVoiceActivityTime];
  double v4 = v3;

  return v4;
}

- (void)setRequestMHUUID:(id)a3
{
  p_activeEndpointer = &self->_activeEndpointer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeEndpointer);
  [WeakRetained setMhId:v4];
}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    unsigned int v11 = "-[CSEndpointerProxy endpointer:didDetectStartpointAtTime:]";
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2050;
    double v15 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s endpointer: %{public}@: didDetectStartpointAtTime: %{public}f",  (uint8_t *)&v10,  0x20u);
  }

  if (self->_recordingDidStop)
  {
    int v8 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      unsigned int v11 = "-[CSEndpointerProxy endpointer:didDetectStartpointAtTime:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s EP_PROXY::RecordingDidStop: Ignoring startPoint-reporting",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    kdebug_trace(722472332LL, 0LL, 0LL, 0LL, 0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    [WeakRetained endpointer:self didDetectStartpointAtTime:a4];
  }
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  __int16 v12 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    v21 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v20, 0xCu);
  }

  if (self->_recordingDidStop)
  {
    id v13 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      v21 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s EP_PROXY::RecordingDidStop: Ignoring didDetectHardpoint-reporting",  (uint8_t *)&v20,  0xCu);
    }
  }

  else
  {
    kdebug_trace(722472336LL, 0LL, 0LL, 0LL, 0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    char v15 = objc_opt_respondsToSelector( WeakRetained,  "endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:");

    if ((v15 & 1) != 0)
    {
      unsigned int v16 = (void *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        id v18 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
        int v20 = 136316162;
        v21 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
        __int16 v22 = 2114;
        id v23 = v10;
        __int16 v24 = 2050;
        double v25 = a4;
        __int16 v26 = 2114;
        id v27 = v18;
        __int16 v28 = 2048;
        int64_t v29 = a6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "KeyLog - %s %{public}@: Endpointer didDetectHardEndpointAtTime:withMetrics:endpointerType: %{public}f, Calling Delegate: %{public}@, type %ld",  (uint8_t *)&v20,  0x34u);
      }

      id v19 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      [v19 endpointer:self didDetectHardEndpointAtTime:v11 withMetrics:a6 endpointerModelType:a4];
    }
  }
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (os_log_s *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    id v19 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v18, 0xCu);
  }

  if (self->_recordingDidStop)
  {
    id v11 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      id v19 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s EP_PROXY::RecordingDidStop: Ignoring didDetectHardEndpointAtTime-reporting",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    kdebug_trace(722472336LL, 0LL, 0LL, 0LL, 0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    char v13 = objc_opt_respondsToSelector(WeakRetained, "endpointer:didDetectHardEndpointAtTime:withMetrics:");

    if ((v13 & 1) != 0)
    {
      __int16 v14 = (void *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        char v15 = v14;
        id v16 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
        int v18 = 136315906;
        id v19 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
        __int16 v20 = 2114;
        id v21 = v8;
        __int16 v22 = 2050;
        double v23 = a4;
        __int16 v24 = 2114;
        id v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s %{public}@: Endpointer didDetectDefaultEndpointAtTime:withMetrics: %{public}f, CallingDelegate: %{public}@",  (uint8_t *)&v18,  0x2Au);
      }

      id v17 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      [v17 endpointer:self didDetectHardEndpointAtTime:v9 withMetrics:a4];
    }
  }
}

- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4
{
  id v6 = a3;
  p_endpointerImplDelegate = &self->_endpointerImplDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_endpointerImplDelegate);
  char v9 = objc_opt_respondsToSelector(WeakRetained, "endpointer:detectedTwoShotAtTime:");

  if ((v9 & 1) != 0)
  {
    id v10 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      char v13 = "-[CSEndpointerProxy endpointer:detectedTwoShotAtTime:]";
      __int16 v14 = 2050;
      double v15 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Reported 2-shot at: %{public}f secs",  (uint8_t *)&v12,  0x16u);
    }

    id v11 = objc_loadWeakRetained((id *)p_endpointerImplDelegate);
    [v11 endpointer:v6 detectedTwoShotAtTime:a4];
  }
}

- (void)endpointer:(id)a3 reportEndpointBufferHostTime:(unint64_t)a4 firstBufferHostTime:(unint64_t)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics", a3));
  [v7 logEventWithType:4710 machAbsoluteTime:a5 context:0];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  [v8 logEventWithType:4711 machAbsoluteTime:a4 context:0];
}

- (double)postVoiceTriggerSilence
{
  hybridEndpointer = self->_hybridEndpointer;
  -[CSEndpointAnalyzerImpl postVoiceTriggerSilence](hybridEndpointer, "postVoiceTriggerSilence");
  return result;
}

- (unint64_t)endPointAnalyzerType
{
  id WeakRetained = (CSEndpointAnalyzerImpl *)objc_loadWeakRetained((id *)&self->_activeEndpointer);
  unint64_t v4 = WeakRetained != self->_nnvadEndpointer;

  return v4;
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
}

- (void)processRCFeatures:(id)a3
{
}

- (void)processTaskString:(id)a3
{
}

- (id)endpointerModelVersion
{
  hybridEndpointer = self->_hybridEndpointer;
  unint64_t v4 = (void *)CSLogCategoryEP;
  BOOL v5 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
  if (hybridEndpointer)
  {
    if (v5)
    {
      id v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointAnalyzerImpl endpointerModelVersion](hybridEndpointer, "endpointerModelVersion"));
      int v10 = 136315394;
      id v11 = "-[CSEndpointerProxy endpointerModelVersion]";
      __int16 v12 = 2114;
      char v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Queried endpointerModelVersion: %{public}@",  (uint8_t *)&v10,  0x16u);

      hybridEndpointer = self->_hybridEndpointer;
    }

    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSEndpointAnalyzerImpl endpointerModelVersion](hybridEndpointer, "endpointerModelVersion"));
  }

  else
  {
    if (v5)
    {
      int v10 = 136315138;
      id v11 = "-[CSEndpointerProxy endpointerModelVersion]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "%s WARN: endpointerModelVersion called when CSHybridEndpointer is not available",  (uint8_t *)&v10,  0xCu);
    }

    id v8 = @"NA";
  }

  return v8;
}

- (void)updateEndpointerThreshold:(float)a3
{
  if (self->_accessibleEndpointerEnabled)
  {
    double v3 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      BOOL v5 = "-[CSEndpointerProxy updateEndpointerThreshold:]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Skip update endpointer threshold from server for accessible endpointer request",  (uint8_t *)&v4,  0xCu);
    }
  }

  else
  {
    -[CSEndpointAnalyzerImpl updateEndpointerThreshold:](self->_hybridEndpointer, "updateEndpointerThreshold:");
  }

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5
{
}

- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4
{
  return -[CSEndpointAnalyzerImpl shouldAcceptEagerResultForDurationSync:withEndpointerMetrics:]( self->_hybridEndpointer,  "shouldAcceptEagerResultForDurationSync:withEndpointerMetrics:",  a4,  a3);
}

- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6
{
}

- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  hybridEndpointer = self->_hybridEndpointer;
  if (hybridEndpointer)
  {
    -[CSEndpointAnalyzerImpl logFeaturesWithEvent:locale:](hybridEndpointer, "logFeaturesWithEvent:locale:", v6, v7);
  }

  else
  {
    char v9 = (os_log_s *)CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[CSEndpointerProxy logHybridEndpointFeaturesWithEvent:locale:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s WARN: logEndpointFeatures called when CSHybridEndpointer is not available",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)setStartWaitTime:(double)a3
{
}

- (void)setEndWaitTime:(double)a3
{
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
}

- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5
{
}

- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4
{
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  return (int64_t)-[CSEndpointAnalyzerImpl fetchCurrentEndpointerOperationMode]( self->_hybridEndpointer,  "fetchCurrentEndpointerOperationMode");
}

- (int64_t)endpointStyle
{
  return 0LL;
}

- (double)interspeechWaitTime
{
  return 0.0;
}

- (double)delay
{
  return 0.0;
}

- (double)minimumDurationForEndpointer
{
  return 0.0;
}

- (BOOL)saveSamplesSeenInReset
{
  return 0;
}

- (double)lastEndOfVoiceActivityTime
{
  return 0.0;
}

- (double)startWaitTime
{
  return 0.0;
}

- (double)endWaitTime
{
  return 0.0;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return 0.0;
}

- (CSEndpointAnalyzerDelegate)endpointerDelegate
{
  return (CSEndpointAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_endpointerDelegate);
}

- (void)setEndpointerDelegate:(id)a3
{
}

- (CSEndpointAnalyzerImplDelegate)endpointerImplDelegate
{
  return (CSEndpointAnalyzerImplDelegate *)objc_loadWeakRetained((id *)&self->_endpointerImplDelegate);
}

- (void)setEndpointerImplDelegate:(id)a3
{
}

- (CSEndpointAnalyzerImpl)activeEndpointer
{
  return (CSEndpointAnalyzerImpl *)objc_loadWeakRetained((id *)&self->_activeEndpointer);
}

- (void)setActiveEndpointer:(id)a3
{
}

- (CSEndpointAnalyzerImpl)hybridEndpointer
{
  return self->_hybridEndpointer;
}

- (void)setHybridEndpointer:(id)a3
{
}

- (CSEndpointAnalyzerImpl)nnvadEndpointer
{
  return self->_nnvadEndpointer;
}

- (void)setNnvadEndpointer:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setRecordContext:(id)a3
{
}

- (BOOL)accessibleEndpointerEnabled
{
  return self->_accessibleEndpointerEnabled;
}

- (void)setAccessibleEndpointerEnabled:(BOOL)a3
{
  self->_accessibleEndpointerEnabled = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
}

- (void).cxx_destruct
{
}

@end