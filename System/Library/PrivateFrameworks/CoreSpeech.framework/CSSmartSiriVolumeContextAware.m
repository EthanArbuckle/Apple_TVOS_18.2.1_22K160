@interface CSSmartSiriVolumeContextAware
- (BOOL)_isUserIntentValid:(id)a3;
- (CSAudioStream)audioStream;
- (CSPolicy)enablePolicy;
- (CSSmartSiriVolumeContextAware)initWithSamplingRate:(float)a3;
- (OS_dispatch_source)listenPollingTimer;
- (double)_compensateMicSensitivity:(float)a3;
- (double)_dBFSToLinearVolume:(float)a3;
- (double)_decibelToLinear:(float)a3;
- (double)_linearToDecibel:(float)a3;
- (double)_signalToSigmoidMusic:(float)a3;
- (double)_signalToSigmoidNoise:(float)a3;
- (double)_signalToSigmoidSpeech:(float)a3;
- (double)_thresholdCompensatedSpeechLevel:(float)a3 SpeakerDistance:(int64_t)a4;
- (float)_applyDropInCallAnnouncementBounds:(float)a3;
- (float)_applyTemporalSmoothingToSiriVolume:(float)a3 ArrivedAt:(int64_t)a4;
- (float)_computeTTSVolumeForSpeechLevel:(float)a3 andMusicLevel:(float)a4 andSpeakerDistance:(int64_t)a5 andNoiseActivityLevel:(float)a6 andNoiseActivityCount:(unint64_t)a7 wasVoiceTrigger:(BOOL)a8;
- (float)lowerBoundTTSVolumeWhenAdaptiveVolumeDisabled:(float)a3;
- (id).cxx_construct;
- (id)_copyHistoricalAudioBufferToEndWithProviderUUID:(id)a3 FromSample:(unint64_t)a4;
- (id)_timeStampString;
- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5;
- (int64_t)listenPollingTimerCount;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSAutomaticVolumeEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4;
- (void)_handleEnablePolicyEvent:(BOOL)a3;
- (void)_initUserIntentAndVolumeFromSavedState;
- (void)_initializeMediaPlaybackState;
- (void)_logSSVMetrics:(id)a3 toPath:(id)a4;
- (void)_processFloatAudioBuffer:(float *)a3 numSamples:(unint64_t)a4 numChannels:(unint64_t)a5 startSampleCount:(unint64_t)a6 soundType:(int64_t)a7;
- (void)_reset;
- (void)_resetDistance;
- (void)_setAsset:(id)a3;
- (void)_startListenPolling;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopListening;
- (void)_subChunkAndProcessAudioChunk:(id)a3 maxSamplesToHandle:(unint64_t)a4 ofType:(int64_t)a5;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)didDetectKeywordWithResult:(id)a3;
- (void)didReceiveMusicVolumeChanged:(float)a3;
- (void)setAsset:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setEnablePolicy:(id)a3;
- (void)setListenPollingTimer:(id)a3;
- (void)setListenPollingTimerCount:(int64_t)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)siriClientBehaviorMonitorReleasedAudioSession:(id)a3;
- (void)startSmartSiriVolume;
@end

@implementation CSSmartSiriVolumeContextAware

- (CSSmartSiriVolumeContextAware)initWithSamplingRate:(float)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeContextAware;
  v3 = -[CSSmartSiriVolumeContextAware init](&v15, "init");
  v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend((id)objc_opt_class(v3, v4), "description");
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    mainQueue = v5->_mainQueue;
    v5->_mainQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("CSSmartSiriVolumeContextAware Distance Processing", 0LL);
    distanceProcessingQueue = v5->_distanceProcessingQueue;
    v5->_distanceProcessingQueue = (OS_dispatch_queue *)v10;

    v12 = -[CSSmartSiriVolumeSentinel initWithMainQueue:distanceQueue:]( objc_alloc(&OBJC_CLASS___CSSmartSiriVolumeSentinel),  "initWithMainQueue:distanceQueue:",  v5->_mainQueue,  v5->_distanceProcessingQueue);
    ssvSentinel = v5->_ssvSentinel;
    v5->_ssvSentinel = v12;

    v5->_systemVolume = 0.5;
  }

  return v5;
}

- (void)startSmartSiriVolume
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100048250;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(mainQueue, block);
}

- (void)_handleEnablePolicyEvent:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_queue_t v10 = "-[CSSmartSiriVolumeContextAware _handleEnablePolicyEvent:]";
    __int16 v11 = 1026;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s SSV enabled : %{public}d", buf, 0x12u);
  }

  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004823C;
  v7[3] = &unk_10022EFA8;
  BOOL v8 = v3;
  v7[4] = self;
  dispatch_async(mainQueue, v7);
}

- (void)_initializeMediaPlaybackState
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSMediaPlayingMonitor sharedInstance](&OBJC_CLASS___CSMediaPlayingMonitor, "sharedInstance"));
  [v3 addObserver:self];
  [v3 initializeMediaPlayingState];
  uint64_t v4 = (char *)[v3 mediaPlayingState];
  if ((unint64_t)(v4 - 1) > 1)
  {
    id v6 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSmartSiriVolumeContextAware _initializeMediaPlaybackState]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolumeContextAware haven't got MediaRemote callback yet, let's assume media is not playing.",  buf,  0xCu);
    }

    self->_isMediaPlaybackOn = 0;
  }

  else
  {
    mainQueue = (dispatch_queue_s *)self->_mainQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100048158;
    v7[3] = &unk_10022F020;
    v7[4] = self;
    void v7[5] = v4;
    dispatch_async(mainQueue, v7);
  }
}

- (void)_startListenPolling
{
  if (self->_isListenPollingStarting)
  {
    v2 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v5 = "-[CSSmartSiriVolumeContextAware _startListenPolling]";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Already started listen polling, skip",  buf,  0xCu);
    }
  }

  else
  {
    self->_isListenPollingStarting = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10004814C;
    v3[3] = &unk_10022E730;
    v3[4] = self;
    -[CSSmartSiriVolumeContextAware _startListenPollingWithInterval:completion:]( self,  "_startListenPollingWithInterval:completion:",  v3,  1.0);
  }

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSSmartSiriVolumeContextAware _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolumeContextAware audioStream](self, "audioStream"));
  if ([v8 isStreaming])
  {
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolumeContextAware enablePolicy](self, "enablePolicy"));
    unsigned int v10 = [v9 isEnabled];

    if (v10)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100047F08;
      v12[3] = &unk_10022E628;
      v12[4] = self;
      double v14 = a3;
      id v13 = v6;
      -[CSSmartSiriVolumeContextAware _startListenWithCompletion:](self, "_startListenWithCompletion:", v12);

      goto LABEL_11;
    }
  }

  __int16 v11 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSSmartSiriVolumeContextAware _startListenPollingWithInterval:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Skip listen polling since audio is streaming / Siri disabled",  buf,  0xCu);
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
LABEL_11:
}

- (void)_startListenWithCompletion:(id)a3
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100047C4C;
  v25[3] = &unk_10022E650;
  id v20 = a3;
  id v26 = v20;
  uint64_t v4 = objc_retainBlock(v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v24 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audioProviderWithContext:v5 error:&v24]);
  id v8 = v24;

  if (v7)
  {
    id v19 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  v5));
    __int16 v11 = (objc_class *)objc_opt_class(self, v10);
    BOOL v12 = NSStringFromClass(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v23 = 0LL;
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v19 audioStreamWithRequest:v9 streamName:v13 error:&v23]);
    id v15 = v23;

    if (v14)
    {
      -[CSSmartSiriVolumeContextAware setAudioStream:](self, "setAudioStream:", v14);
      [v14 setDelegate:self];
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100047CAC;
      v21[3] = &unk_10022E6A0;
      v21[4] = self;
      v22 = v4;
      [v14 startAudioStreamWithOption:v16 completion:v21];
    }

    else
    {
      v17 = (os_log_s *)CSLogCategoryASV;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
        *(_DWORD *)buf = 136315394;
        v28 = "-[CSSmartSiriVolumeContextAware _startListenWithCompletion:]";
        __int16 v29 = 2114;
        v30 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Failed in requesting audio stream : %{public}@",  buf,  0x16u);
      }

      ((void (*)(void *, void, id))v4[2])(v4, 0LL, v15);
    }
  }

  else
  {
    ((void (*)(void *, void, id))v4[2])(v4, 0LL, v8);
  }
}

- (void)_stopListening
{
  BOOL v3 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[CSSmartSiriVolumeContextAware _stopListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolumeContextAware audioStream](self, "audioStream"));
  BOOL v5 = v4 == 0LL;

  if (v5)
  {
    id v7 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[CSSmartSiriVolumeContextAware _stopListening]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s No audio stream to stop, we shouldn't hit this",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolumeContextAware audioStream](self, "audioStream"));
    [v6 stopAudioStreamWithOption:0 completion:&stru_10022AFD8];
  }

- (void)setAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    mainQueue = (dispatch_queue_s *)self->_mainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100047AD0;
    block[3] = &unk_10022EFD0;
    block[4] = self;
    id v7 = v4;
    id v12 = v7;
    dispatch_async(mainQueue, block);
    distanceProcessingQueue = (dispatch_queue_s *)self->_distanceProcessingQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100047B08;
    v9[3] = &unk_10022EFD0;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(distanceProcessingQueue, v9);
  }
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  p_currentAsset = &self->_currentAsset;
  objc_storeStrong((id *)&self->_currentAsset, a3);
  self->_noiseChannelBitset = -[CSAsset SSVNoiseLevelChannelBitset](self->_currentAsset, "SSVNoiseLevelChannelBitset");
  self->_lkfsChannelBitset = -[CSAsset SSVLKFSChannelBitset](self->_currentAsset, "SSVLKFSChannelBitset");
  -[CSAsset SSVCAVoiceTriggerBasedTTSValidForSeconds](self->_currentAsset, "SSVCAVoiceTriggerBasedTTSValidForSeconds");
  self->kSSVCAVoiceTriggerBasedTTSValidForSeconds = v7;
  self->kSSVCASmartSiriVolumeUnsyncedMetricLogsToRetain = -[CSAsset SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain]( self->_currentAsset,  "SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain");
  self->kSSVCASmartSiriVolumeSyncedMetricLogsToRetain = -[CSAsset SSVCASmartSiriVolumeSyncedMetricLogsToRetain]( self->_currentAsset,  "SSVCASmartSiriVolumeSyncedMetricLogsToRetain");
  -[CSAsset SSVCAVoiceTriggerInitialSilenceDurationSeconds]( self->_currentAsset,  "SSVCAVoiceTriggerInitialSilenceDurationSeconds");
  self->kSSVCAVoiceTriggerInitialSilenceDurationSeconds = v8;
  self->kSSVCADistanceInputBufferDurationSeconds = -[CSAsset SSVCADistanceInputBufferDurationSeconds]( self->_currentAsset,  "SSVCADistanceInputBufferDurationSeconds");
  -[CSAsset SSVCAListenPollingIntervalAtStartInSeconds]( self->_currentAsset,  "SSVCAListenPollingIntervalAtStartInSeconds");
  self->kSSVCAListenPollingIntervalAtStartInSeconds = v9;
  self->kSSVCAAnnouncementStatusFetchTimeoutMs = -[CSAsset SSVCAAnnouncementStatusFetchTimeoutMs]( self->_currentAsset,  "SSVCAAnnouncementStatusFetchTimeoutMs");
  -[CSAsset SSVCADefaultOutputTTSVolume](self->_currentAsset, "SSVCADefaultOutputTTSVolume");
  self->kSSVCADefaultOutputTTSVolume = v10;
  self->kSSVCANoiseActivityCountThreshold = -[CSAsset SSVCANoiseActivityCountThreshold]( self->_currentAsset,  "SSVCANoiseActivityCountThreshold");
  -[CSAsset SSVCASpeakerDistanceFarBoostFactor](self->_currentAsset, "SSVCASpeakerDistanceFarBoostFactor");
  self->kSSVCASpeakerDistanceFarBoostFactor = v11;
  -[CSAsset SSVCASpeakerDistanceMidBoostFactor](self->_currentAsset, "SSVCASpeakerDistanceMidBoostFactor");
  self->kSSVCASpeakerDistanceMidBoostFactor = v12;
  -[CSAsset SSVCASpeakerDistanceNearBoostFactor](self->_currentAsset, "SSVCASpeakerDistanceNearBoostFactor");
  self->kSSVCASpeakerDistanceNearBoostFactor = v13;
  -[CSAsset SSVCADistanceModelConfidenceThreshold](self->_currentAsset, "SSVCADistanceModelConfidenceThreshold");
  self->kSSVCADistanceModelConfidenceThreshold = v14;
  -[CSAsset SSVCAMinimumLinearSoundLevel](self->_currentAsset, "SSVCAMinimumLinearSoundLevel");
  self->kSSVCAMinimumLinearSoundLevel = v15;
  -[CSAsset SSVCAMaximumLinearSoundLevel](self->_currentAsset, "SSVCAMaximumLinearSoundLevel");
  self->kSSVCAMaximumLinearSoundLevel = v16;
  -[CSAsset SSVCALinearToDecibelConstantMultiplier](self->_currentAsset, "SSVCALinearToDecibelConstantMultiplier");
  self->kSSVCALinearToDecibelConstantMultiplier = v17;
  -[CSAsset SSVCADecibelToLinearLogBase](self->_currentAsset, "SSVCADecibelToLinearLogBase");
  self->kSSVCADecibelToLinearLogBase = v18;
  -[CSAsset SSVCASignalToSigmoidNoiseDilationFactor](self->_currentAsset, "SSVCASignalToSigmoidNoiseDilationFactor");
  self->kSSVCASignalToSigmoidNoiseDilationFactor = v19;
  -[CSAsset SSVCASignalToSigmoidMusicDilationFactorDeviceDefault]( self->_currentAsset,  "SSVCASignalToSigmoidMusicDilationFactorDeviceDefault");
  self->kSSVCASignalToSigmoidMusicDilationFactorDeviceDefault = v20;
  -[CSAsset SSVCASignalToSigmoidMusicDilationFactorDeviceSimple]( self->_currentAsset,  "SSVCASignalToSigmoidMusicDilationFactorDeviceSimple");
  self->kSSVCASignalToSigmoidMusicDilationFactorDeviceSimple = v21;
  -[CSAsset SSVCASignalToSigmoidSpeechDilationFactor](self->_currentAsset, "SSVCASignalToSigmoidSpeechDilationFactor");
  self->kSSVCASignalToSigmoidSpeechDilationFactor = v22;
  -[CSAsset SSVCASignalToSigmoidNoiseVSpread](self->_currentAsset, "SSVCASignalToSigmoidNoiseVSpread");
  self->kSSVCASignalToSigmoidNoiseVSpread = v23;
  -[CSAsset SSVCASignalToSigmoidMusicVSpreadDeviceDefault]( self->_currentAsset,  "SSVCASignalToSigmoidMusicVSpreadDeviceDefault");
  self->kSSVCASignalToSigmoidMusicVSpreadDeviceDefault = v24;
  -[CSAsset SSVCASignalToSigmoidMusicVSpreadDeviceSimple]( self->_currentAsset,  "SSVCASignalToSigmoidMusicVSpreadDeviceSimple");
  self->kSSVCASignalToSigmoidMusicVSpreadDeviceSimple = v25;
  -[CSAsset SSVCASignalToSigmoidSpeechVSpread](self->_currentAsset, "SSVCASignalToSigmoidSpeechVSpread");
  self->kSSVCASignalToSigmoidSpeechVSpread = v26;
  -[CSAsset SSVCASignalToSigmoidNoiseVOffset](self->_currentAsset, "SSVCASignalToSigmoidNoiseVOffset");
  self->kSSVCASignalToSigmoidNoiseVOffset = v27;
  -[CSAsset SSVCASignalToSigmoidMusicVOffsetDeviceDefault]( self->_currentAsset,  "SSVCASignalToSigmoidMusicVOffsetDeviceDefault");
  self->kSSVCASignalToSigmoidMusicVOffsetDeviceDefault = v28;
  -[CSAsset SSVCASignalToSigmoidMusicVOffsetDeviceSimple]( self->_currentAsset,  "SSVCASignalToSigmoidMusicVOffsetDeviceSimple");
  self->kSSVCASignalToSigmoidMusicVOffsetDeviceSimple = v29;
  -[CSAsset SSVCASignalToSigmoidSpeechVOffset](self->_currentAsset, "SSVCASignalToSigmoidSpeechVOffset");
  self->kSSVCASignalToSigmoidSpeechVOffset = v30;
  -[CSAsset SSVCASignalToSigmoidNoiseHOffset](self->_currentAsset, "SSVCASignalToSigmoidNoiseHOffset");
  self->kSSVCASignalToSigmoidNoiseHOffset = v31;
  -[CSAsset SSVCASignalToSigmoidMusicHOffsetDeviceDefault]( self->_currentAsset,  "SSVCASignalToSigmoidMusicHOffsetDeviceDefault");
  self->kSSVCASignalToSigmoidMusicHOffsetDeviceDefault = v32;
  -[CSAsset SSVCASignalToSigmoidMusicHOffsetDeviceSimple]( self->_currentAsset,  "SSVCASignalToSigmoidMusicHOffsetDeviceSimple");
  self->kSSVCASignalToSigmoidMusicHOffsetDeviceSimple = v33;
  -[CSAsset SSVCASignalToSigmoidSpeechHOffset](self->_currentAsset, "SSVCASignalToSigmoidSpeechHOffset");
  self->kSSVCASignalToSigmoidSpeechHOffset = v34;
  -[CSAsset SSVCASignalToSigmoidMusicSteepnessDeviceDefault]( self->_currentAsset,  "SSVCASignalToSigmoidMusicSteepnessDeviceDefault");
  self->kSSVCASignalToSigmoidMusicSteepnessDeviceDefault = v35;
  -[CSAsset SSVCASignalToSigmoidMusicSteepnessDeviceSimple]( self->_currentAsset,  "SSVCASignalToSigmoidMusicSteepnessDeviceSimple");
  self->kSSVCASignalToSigmoidMusicSteepnessDeviceSimple = v36;
  -[CSAsset SSVCASignalToSigmoidNoiseSteepness](self->_currentAsset, "SSVCASignalToSigmoidNoiseSteepness");
  self->kSSVCASignalToSigmoidNoiseSteepness = v37;
  -[CSAsset SSVCASignalToSigmoidSpeechSteepness](self->_currentAsset, "SSVCASignalToSigmoidSpeechSteepness");
  self->kSSVCASignalToSigmoidSpeechSteepness = v38;
  -[CSAsset SSVCADBToTTSMinimumOutput](self->_currentAsset, "SSVCADBToTTSMinimumOutput");
  self->kSSVCADBToTTSMinimumOutput = v39;
  -[CSAsset SSVCADBToTTSMaximumOutput](self->_currentAsset, "SSVCADBToTTSMaximumOutput");
  self->kSSVCADBToTTSMaximumOutput = v40;
  -[CSAsset SSVCADBToTTSTransitionPoint](self->_currentAsset, "SSVCADBToTTSTransitionPoint");
  self->kSSVCADBToTTSTransitionPoint = v41;
  -[CSAsset SSVCADBToTTSPreTransitionOffset](self->_currentAsset, "SSVCADBToTTSPreTransitionOffset");
  self->kSSVCADBToTTSPreTransitionOffset = v42;
  -[CSAsset SSVCADBToTTSPreTransitionMultiplier](self->_currentAsset, "SSVCADBToTTSPreTransitionMultiplier");
  self->kSSVCADBToTTSPreTransitionMultiplier = v43;
  -[CSAsset SSVCADBToTTSPostTransitionOffset](self->_currentAsset, "SSVCADBToTTSPostTransitionOffset");
  self->kSSVCADBToTTSPostTransitionOffset = v44;
  -[CSAsset SSVCADBToTTSPostTransitionDC](self->_currentAsset, "SSVCADBToTTSPostTransitionDC");
  self->kSSVCADBToTTSPostTransitionDC = v45;
  -[CSAsset SSVCADBToTTSPostTransitionMultiplier](self->_currentAsset, "SSVCADBToTTSPostTransitionMultiplier");
  self->kSSVCADBToTTSPostTransitionMultiplier = v46;
  -[CSAsset SSVCADeviceSimpleOutputMinTargetDB](self->_currentAsset, "SSVCADeviceSimpleOutputMinTargetDB");
  self->kSSVCA_DEVICE_SIMPLE_OUTPUT_MIN_TARGET_DB = v47;
  -[CSAsset SSVCADeviceSimpleOutputMaxTargetDB](self->_currentAsset, "SSVCADeviceSimpleOutputMaxTargetDB");
  self->kSSVCA_DEVICE_SIMPLE_OUTPUT_MAX_TARGET_DB = v48;
  -[CSAsset SSVCADeviceSimpleOutputSlope](self->_currentAsset, "SSVCADeviceSimpleOutputSlope");
  self->kSSVCA_DEVICE_SIMPLE_OUTPUT_SLOPE = v49;
  -[CSAsset SSVCADeviceSimpleMinTargetDB](self->_currentAsset, "SSVCADeviceSimpleMinTargetDB");
  self->kSSVCA_DEVICE_SIMPLE_MIN_TARGET_DB = v50;
  -[CSAsset SSVCADeviceSimpleMaxTargetDB](self->_currentAsset, "SSVCADeviceSimpleMaxTargetDB");
  self->kSSVCA_DEVICE_SIMPLE_MAX_TARGET_DB = v51;
  -[CSAsset SSVCADeviceSimpleDBToSystemVolSlope](self->_currentAsset, "SSVCADeviceSimpleDBToSystemVolSlope");
  self->kSSVCA_DEVICE_SIMPLE_DB_TO_SYSTEM_VOL_SLOPE = v52;
  -[CSAsset SSVCADeviceSimpleMicSensitivityOffset](self->_currentAsset, "SSVCADeviceSimpleMicSensitivityOffset");
  self->kSSVCA_DEVICE_SIMPLE_MIC_SENSITIVITY_OFFSET = v53;
  self->kSSVCA_DEVICE_SIMPLE_PRE_TRIGGER_SILENCE_SAMPLE_COUNT = -[CSAsset SSVCADeviceSimplePreTriggerSilenceSampleCount]( self->_currentAsset,  "SSVCADeviceSimplePreTriggerSilenceSampleCount");
  self->kSSVCAUserIntentValidForSeconds = -[CSAsset SSVCAUserIntentValidForSeconds]( self->_currentAsset,  "SSVCAUserIntentValidForSeconds");
  -[CSAsset SSVCAUserIntentVolumeIncreaseFactor](self->_currentAsset, "SSVCAUserIntentVolumeIncreaseFactor");
  self->kSSVCAUserIntentVolumeIncreaseFactor = v54;
  -[CSAsset SSVCAUserIntentVolumeDecreaseFactor](self->_currentAsset, "SSVCAUserIntentVolumeDecreaseFactor");
  self->kSSVCAUserIntentVolumeDecreaseFactor = v55;
  -[CSAsset SSVCAUserIntentPermanentOffsetFactorDelta](self->_currentAsset, "SSVCAUserIntentPermanentOffsetFactorDelta");
  self->kSSVCAUserIntentPermanentOffsetFactorDelta = v56;
  -[CSAsset SSVCAUserIntentPermanentOffsetFactorLowerBound]( self->_currentAsset,  "SSVCAUserIntentPermanentOffsetFactorLowerBound");
  self->kSSVCAUserIntentPermanentOffsetFactorLowerBound = v57;
  -[CSAsset SSVCAUserIntentPermanentOffsetFactorUpperBound]( self->_currentAsset,  "SSVCAUserIntentPermanentOffsetFactorUpperBound");
  self->kSSVCAUserIntentPermanentOffsetFactorUpperBound = v58;
  -[CSAsset SSVCADeviceSimpleMinTTSVolume](self->_currentAsset, "SSVCADeviceSimpleMinTTSVolume");
  self->kSSVCA_DEVICE_SIMPLE_MIN_TTS_VOLUME = v59;
  -[CSAsset SSVCADeviceSimpleMaxTTSVolume](self->_currentAsset, "SSVCADeviceSimpleMaxTTSVolume");
  self->kSSVCA_DEVICE_SIMPLE_MAX_TTS_VOLUME = v60;
  -[CSAsset SSVCADeviceDefaultMinTTSVolume](self->_currentAsset, "SSVCADeviceDefaultMinTTSVolume");
  self->kSSVCA_DEVICE_DEFAULT_MIN_TTS_VOLUME = v61;
  -[CSAsset SSVCADeviceDefaultMaxTTSVolume](self->_currentAsset, "SSVCADeviceDefaultMaxTTSVolume");
  self->kSSVCA_DEVICE_DEFAULT_MAX_TTS_VOLUME = v62;
  -[CSAsset SSVCADeviceDefaultASVOffMinTTSVolume](self->_currentAsset, "SSVCADeviceDefaultASVOffMinTTSVolume");
  self->kSSVCA_DEVICE_DEFAULT_ASV_OFF_MIN_TTS_VOLUME = v63;
  -[CSAsset SSVCADeviceSimpleASVOffMinTTSVolume](self->_currentAsset, "SSVCADeviceSimpleASVOffMinTTSVolume");
  self->kSSVCA_DEVICE_SIMPLE_ASV_OFF_MIN_TTS_VOLUME = v64;
  -[CSAsset SSVCADeviceDefaultMicSensitivityOffset](self->_currentAsset, "SSVCADeviceDefaultMicSensitivityOffset");
  self->kSSVCA_DEVICE_DEFAULT_MIC_SENSITIVITY_OFFSET = v65;
  -[CSAsset SSVCAVolumeHalfLifeSeconds](self->_currentAsset, "SSVCAVolumeHalfLifeSeconds");
  self->kSSVCA_VOLUME_HALF_LIFE_SECONDS = v66;
  self->kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE = -[CSAsset SSVCAHistoricalVolumeBufferSize]( self->_currentAsset,  "SSVCAHistoricalVolumeBufferSize");
  -[CSAsset SSVCAMaximumCompensatedSpeechLevelNearField]( self->_currentAsset,  "SSVCAMaximumCompensatedSpeechLevelNearField");
  self->kSSVCAMaximumCompensatedSpeechLevelNearField = v67;
  -[CSAsset SSVCADropInCallAnnouncementMinTTSVolume](self->_currentAsset, "SSVCADropInCallAnnouncementMinTTSVolume");
  self->kSSVCADropInCallAnnouncementMinTTSVolume = v68;
  v69 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset SSVParameterDirectionary](*p_currentAsset, "SSVParameterDirectionary"));
    int v71 = 136315394;
    v72 = "-[CSSmartSiriVolumeContextAware _setAsset:]";
    __int16 v73 = 2114;
    v74 = v70;
    _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolumeContextAware configure: %{public}@",  (uint8_t *)&v71,  0x16u);
  }
}

- (void)_resetDistance
{
}

- (void)_reset
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSVolumeMonitor sharedInstance](&OBJC_CLASS___CSVolumeMonitor, "sharedInstance"));
  sub_1000479D0( (char **)&self->_noiseAudioFloatBuffer,  +[CSUtils getNumElementInBitset:]( &OBJC_CLASS___CSUtils,  "getNumElementInBitset:",  self->_noiseChannelBitset) << 10);
  sub_1000479D0( (char **)&self->_musicAudioFloatBuffer,  +[CSUtils getNumElementInBitset:]( &OBJC_CLASS___CSUtils,  "getNumElementInBitset:",  self->_lkfsChannelBitset) << 10);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  self->_BOOL isAdaptiveVolumeOn = [v4 smartSiriVolumeContextAwareEnabled];

  id v5 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAdaptiveVolumeOn = self->_isAdaptiveVolumeOn;
    int v19 = 136315394;
    float v20 = "-[CSSmartSiriVolumeContextAware _reset]";
    __int16 v21 = 1026;
    LODWORD(v22) = isAdaptiveVolumeOn;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Adaptive Volume Enable initialized to %{public}d",  (uint8_t *)&v19,  0x12u);
  }

  -[CSSmartSiriVolumeContextAware _initUserIntentAndVolumeFromSavedState]( self,  "_initUserIntentAndVolumeFromSavedState");
  [v3 musicVolume];
  float v8 = v7;
  self->_systemVolume = v7;
  float v9 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    float v20 = "-[CSSmartSiriVolumeContextAware _reset]";
    __int16 v21 = 2050;
    double v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s System volume has been initialized to %{public}f",  (uint8_t *)&v19,  0x16u);
  }

  float v10 = (float *)operator new(0x48uLL);
  float kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE = (float)self->kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE;
  *(void *)float v10 = 1LL;
  v10[2] = kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE;
  v10[3] = 1.0;
  unint64_t v12 = (unint64_t)kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE;
  else {
    size_t v13 = 16 * (unint64_t)kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE;
  }
  *((void *)v10 + 3) = 0LL;
  *((void *)v10 + 4) = 0LL;
  *((void *)v10 + 2) = v12;
  double v14 = (char *)operator new[](v13);
  float v15 = v14;
  if (v12)
  {
    float v16 = v14;
    do
    {
      *(void *)float v16 = 0LL;
      *((_DWORD *)v16 + 2) = 0;
      v16 += 16;
    }

    while (v16 != &v14[16 * v12]);
  }

  *((void *)v10 + 5) = v14;
  *((void *)v10 + 6) = 0LL;
  *((void *)v10 + 7) = 0LL;
  *((void *)v10 + 8) = 0LL;
  float v17 = operator new(8uLL);
  *((void *)v10 + 6) = v17;
  *v17++ = v15;
  *((void *)v10 + 7) = v17;
  *((void *)v10 + 8) = v17;
  value = self->_historicalSiriVolumes.__ptr_.__value_;
  self->_historicalSiriVolumes.__ptr_.__value_ = v10;
  if (value) {
    sub_10001DF1C(value);
  }
}

- (void)_initUserIntentAndVolumeFromSavedState
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___CSSmartSiriVolumeUserIntent);
  userIntent = self->_userIntent;
  self->_userIntent = v3;

  -[CSSmartSiriVolumeUserIntent initWithStoredInformationAndAsset:]( self->_userIntent,  "initWithStoredInformationAndAsset:",  self->_currentAsset);
}

- (void)_processFloatAudioBuffer:(float *)a3 numSamples:(unint64_t)a4 numChannels:(unint64_t)a5 startSampleCount:(unint64_t)a6 soundType:(int64_t)a7
{
  uint64_t v12 = qword_10027FD50;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_10027FD50, 2) <= 0x444444444444444uLL)
  {
    size_t v13 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSmartSiriVolumeContextAware _processFloatAudioBuffer:numSamples:numChannels:startSampleCount:soundType:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s SmartSiriVolumeContextAware heartbeat = %{public}lld",  buf,  0x16u);
      uint64_t v12 = qword_10027FD50;
    }
  }

  qword_10027FD50 = v12 + 1;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  int v26 = 0;
  uint64_t v17 = 0LL;
  float v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  if ((unint64_t)a7 >= 3)
  {
    float v15 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v21 = 136315394;
      double v22 = "-[CSSmartSiriVolumeContextAware _processFloatAudioBuffer:numSamples:numChannels:startSampleCount:soundType:]";
      __int16 v23 = 2050;
      int64_t v24 = a7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s SmartSiriVolumeContextAware Unknown Sound Type: %{public}ld",  v21,  0x16u);
    }
  }

  else
  {
    uint64_t v14 = *(&self->_noiseChannelBitset + a7);
    uint64_t v20 = *((void *)&self->_noiseAudioFloatBuffer.__begin_ + 3 * a7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100047968;
    v16[3] = &unk_10022B000;
    v16[6] = a3;
    v16[7] = a4;
    v16[4] = &v17;
    v16[5] = buf;
    +[CSUtils iterateBitset:block:](&OBJC_CLASS___CSUtils, "iterateBitset:block:", v14, v16);
    -[CSSmartSiriVolumeSentinel analyzeAudioBufferForSoundType:data:numSamples:startSampleCount:]( self->_ssvSentinel,  "analyzeAudioBufferForSoundType:data:numSamples:startSampleCount:",  a7,  v18[3],  a4,  a6);
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(buf, 8);
}

- (float)_computeTTSVolumeForSpeechLevel:(float)a3 andMusicLevel:(float)a4 andSpeakerDistance:(int64_t)a5 andNoiseActivityLevel:(float)a6 andNoiseActivityCount:(unint64_t)a7 wasVoiceTrigger:(BOOL)a8
{
  float v12 = 0.0;
  if (a8 && !self->_isMediaPlaybackOn)
  {
    a4 = 0.0;
    if (self->kSSVCANoiseActivityCountThreshold <= a7)
    {
      float v12 = a3;
    }

    else
    {
      else {
        uint64_t v13 = qword_10018B200[a5];
      }
      float v12 = *(float *)((char *)&self->super.isa + v13) * a3;
    }
  }

  *(float *)&double v14 = v12;
  -[CSSmartSiriVolumeContextAware _linearToDecibel:](self, "_linearToDecibel:", a5, a7, v14);
  float v16 = v15;
  *(float *)&double v15 = a4;
  -[CSSmartSiriVolumeContextAware _linearToDecibel:](self, "_linearToDecibel:", v15);
  float v18 = v17;
  *(float *)&double v17 = a6;
  -[CSSmartSiriVolumeContextAware _linearToDecibel:](self, "_linearToDecibel:", v17);
  float v20 = v19;
  *(float *)&double v19 = v16;
  -[CSSmartSiriVolumeContextAware _compensateMicSensitivity:](self, "_compensateMicSensitivity:", v19);
  float v22 = v21;
  *(float *)&double v21 = v20;
  -[CSSmartSiriVolumeContextAware _compensateMicSensitivity:](self, "_compensateMicSensitivity:", v21);
  float v24 = v23;
  *(float *)&double v23 = v22;
  -[CSSmartSiriVolumeContextAware _thresholdCompensatedSpeechLevel:SpeakerDistance:]( self,  "_thresholdCompensatedSpeechLevel:SpeakerDistance:",  a5,  v23);
  *(float *)&double v25 = v25;
  -[CSSmartSiriVolumeContextAware _signalToSigmoidSpeech:](self, "_signalToSigmoidSpeech:", v25);
  float v27 = v26;
  *(float *)&double v26 = v18;
  -[CSSmartSiriVolumeContextAware _signalToSigmoidMusic:](self, "_signalToSigmoidMusic:", v26);
  float v29 = v28;
  *(float *)&double v28 = v24;
  -[CSSmartSiriVolumeContextAware _signalToSigmoidNoise:](self, "_signalToSigmoidNoise:", v28);
  float v31 = v30;
  *(float *)&double v30 = v27;
  -[CSSmartSiriVolumeContextAware _dBFSToLinearVolume:](self, "_dBFSToLinearVolume:", v30);
  float v33 = v32;
  *(float *)&double v32 = v29;
  -[CSSmartSiriVolumeContextAware _dBFSToLinearVolume:](self, "_dBFSToLinearVolume:", v32);
  float v35 = v34;
  *(float *)&double v34 = v31;
  -[CSSmartSiriVolumeContextAware _dBFSToLinearVolume:](self, "_dBFSToLinearVolume:", v34);
  float v37 = v36;
  float v38 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 136315906;
    float v41 = "-[CSSmartSiriVolumeContextAware _computeTTSVolumeForSpeechLevel:andMusicLevel:andSpeakerDistance:andNoiseActiv"
          "ityLevel:andNoiseActivityCount:wasVoiceTrigger:]";
    __int16 v42 = 2050;
    double v43 = v37;
    __int16 v44 = 2050;
    double v45 = v35;
    __int16 v46 = 2050;
    double v47 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolumeContextAware TTS volume suggested by noise: %{public}f, music: %{public}f, speech: %{public}f",  (uint8_t *)&v40,  0x2Au);
  }

  return fmaxf(fmaxf(v33, v35), v37);
}

- (double)_linearToDecibel:(float)a3
{
  double kSSVCALinearToDecibelConstantMultiplier = self->kSSVCALinearToDecibelConstantMultiplier;
  return log10(fminf(fmaxf(self->kSSVCAMinimumLinearSoundLevel, a3), self->kSSVCAMaximumLinearSoundLevel))
       * kSSVCALinearToDecibelConstantMultiplier;
}

- (double)_decibelToLinear:(float)a3
{
  return fmin( fmax( self->kSSVCAMinimumLinearSoundLevel,  pow(self->kSSVCADecibelToLinearLogBase, (float)(a3 / self->kSSVCALinearToDecibelConstantMultiplier))),  self->kSSVCAMaximumLinearSoundLevel);
}

- (double)_compensateMicSensitivity:(float)a3
{
  id v5 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  uint64_t v6 = 384LL;
  if (v5 == (id)1) {
    uint64_t v6 = 452LL;
  }
  return (float)(*(float *)((char *)&self->super.isa + v6) + a3);
}

- (double)_signalToSigmoidNoise:(float)a3
{
  double kSSVCASignalToSigmoidNoiseVSpread = self->kSSVCASignalToSigmoidNoiseVSpread;
  double kSSVCASignalToSigmoidNoiseVOffset = self->kSSVCASignalToSigmoidNoiseVOffset;
  double kSSVCASignalToSigmoidNoiseSteepness = self->kSSVCASignalToSigmoidNoiseSteepness;
  return kSSVCASignalToSigmoidNoiseVSpread
       / (kSSVCASignalToSigmoidNoiseSteepness
        * exp(-(a3 - self->kSSVCASignalToSigmoidNoiseHOffset) / self->kSSVCASignalToSigmoidNoiseDilationFactor)
        + 1.0)
       + kSSVCASignalToSigmoidNoiseVOffset;
}

- (double)_signalToSigmoidSpeech:(float)a3
{
  double kSSVCASignalToSigmoidSpeechVSpread = self->kSSVCASignalToSigmoidSpeechVSpread;
  double kSSVCASignalToSigmoidSpeechVOffset = self->kSSVCASignalToSigmoidSpeechVOffset;
  double kSSVCASignalToSigmoidSpeechSteepness = self->kSSVCASignalToSigmoidSpeechSteepness;
  return kSSVCASignalToSigmoidSpeechVSpread
       / (kSSVCASignalToSigmoidSpeechSteepness
        * exp(-(a3 - self->kSSVCASignalToSigmoidSpeechHOffset) / self->kSSVCASignalToSigmoidSpeechDilationFactor)
        + 1.0)
       + kSSVCASignalToSigmoidSpeechVOffset;
}

- (double)_signalToSigmoidMusic:(float)a3
{
  id v5 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  uint64_t v6 = 256LL;
  if (v5 == (id)1) {
    uint64_t v6 = 252LL;
  }
  uint64_t v7 = 272LL;
  if (v5 == (id)1) {
    uint64_t v7 = 268LL;
  }
  uint64_t v8 = 288LL;
  if (v5 == (id)1) {
    uint64_t v8 = 284LL;
  }
  uint64_t v9 = 304LL;
  if (v5 == (id)1) {
    uint64_t v9 = 300LL;
  }
  float v10 = *(float *)((char *)&self->super.isa + v7);
  if (v5 == (id)1) {
    uint64_t v11 = 312LL;
  }
  else {
    uint64_t v11 = 316LL;
  }
  double v12 = *(float *)((char *)&self->super.isa + v11);
  double v13 = *(float *)((char *)&self->super.isa + v8);
  return v10
}

- (double)_dBFSToLinearVolume:(float)a3
{
  return (fminf( fmaxf(a3, self->kSSVCA_DEVICE_SIMPLE_OUTPUT_MIN_TARGET_DB),  self->kSSVCA_DEVICE_SIMPLE_OUTPUT_MAX_TARGET_DB)
        - self->kSSVCA_DEVICE_SIMPLE_OUTPUT_MIN_TARGET_DB)
       * self->kSSVCA_DEVICE_SIMPLE_OUTPUT_SLOPE;
}

- (double)_thresholdCompensatedSpeechLevel:(float)a3 SpeakerDistance:(int64_t)a4
{
  if (a4 == 3 || !a4) {
    return fminf(a3, self->kSSVCAMaximumCompensatedSpeechLevelNearField);
  }
  return a3;
}

- (BOOL)_isUserIntentValid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSince1970];
  uint64_t v7 = (uint64_t)(v6 - (double)(uint64_t)[v4 userIntentTime]);

  int64_t kSSVCAUserIntentValidForSeconds = self->kSSVCAUserIntentValidForSeconds;
  uint64_t v9 = (os_log_s *)CSLogCategoryASV;
  BOOL v10 = os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT);
  if (kSSVCAUserIntentValidForSeconds <= v7)
  {
    if (v10)
    {
      int v13 = 136315650;
      double v14 = "-[CSSmartSiriVolumeContextAware _isUserIntentValid:]";
      __int16 v15 = 2050;
      uint64_t v16 = v7;
      __int16 v17 = 2050;
      int64_t v18 = kSSVCAUserIntentValidForSeconds;
      uint64_t v11 = "%s SmartSiriVolumeContextAware user intent is NOT valid as %{public}lld greater equal %{public}llu";
      goto LABEL_6;
    }
  }

  else if (v10)
  {
    int v13 = 136315650;
    double v14 = "-[CSSmartSiriVolumeContextAware _isUserIntentValid:]";
    __int16 v15 = 2050;
    uint64_t v16 = v7;
    __int16 v17 = 2050;
    int64_t v18 = kSSVCAUserIntentValidForSeconds;
    uint64_t v11 = "%s SmartSiriVolumeContextAware user intent is valid as %{public}lld less than %{public}llu";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0x20u);
  }

  return kSSVCAUserIntentValidForSeconds > v7;
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  if ([v5 wasBuffered])
  {
    id v6 = [v5 numSamples];
    distanceProcessingQueue = (dispatch_queue_s *)self->_distanceProcessingQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100047894;
    v14[3] = &unk_10022E7F8;
    v15[0] = v5;
    v15[1] = v6;
    uint64_t v8 = (id *)v15;
    v14[4] = self;
    id v9 = v5;
    BOOL v10 = v14;
  }

  else
  {
    distanceProcessingQueue = (dispatch_queue_s *)self->_mainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000478EC;
    block[3] = &unk_10022EFD0;
    uint64_t v8 = &v13;
    block[4] = self;
    id v13 = v5;
    id v11 = v5;
    BOOL v10 = block;
  }

  dispatch_async(distanceProcessingQueue, v10);
}

- (void)_subChunkAndProcessAudioChunk:(id)a3 maxSamplesToHandle:(unint64_t)a4 ofType:(int64_t)a5
{
  id v8 = a3;
  id v9 = [v8 numSamples];
  else {
    unint64_t v10 = (unint64_t)v9;
  }
  if (v10)
  {
    uint64_t v11 = 0LL;
    while (1)
    {
      uint64_t v12 = v10 >= 0x400 ? 1024LL : v10;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 subChunkFrom:v11 numSamples:v12]);
      id v14 = [v13 numSamples];
      if (!v14) {
        break;
      }
      id v15 = objc_claimAutoreleasedReturnValue([v13 data]);
      -[CSSmartSiriVolumeContextAware _processFloatAudioBuffer:numSamples:numChannels:startSampleCount:soundType:]( self,  "_processFloatAudioBuffer:numSamples:numChannels:startSampleCount:soundType:",  [v15 bytes],  v14,  objc_msgSend(v8, "numChannels"),  (char *)objc_msgSend(v8, "startSampleCount") + v11,  a5);
      v10 -= (unint64_t)v14;

      v11 += (uint64_t)v14;
      if (!v10) {
        goto LABEL_15;
      }
    }

    uint64_t v16 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      int64_t v18 = "-[CSSmartSiriVolumeContextAware _subChunkAndProcessAudioChunk:maxSamplesToHandle:ofType:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Unable to process SSV since it failed to silce audio chunk",  (uint8_t *)&v17,  0xCu);
    }
  }

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[CSSmartSiriVolumeContextAware audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v12 = 2050;
    int64_t v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s stream stopped unexpectedly : %{public}ld",  buf,  0x16u);
  }

  if (a4 != -11785)
  {
    mainQueue = (dispatch_queue_s *)self->_mainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004782C;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(mainQueue, block);
  }
}

- (void)didDetectKeywordWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v17 = "-[CSSmartSiriVolumeContextAware didDetectKeywordWithResult:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolumeContextAware received VT event!",  buf,  0xCu);
  }

  distanceProcessingQueue = (dispatch_queue_s *)self->_distanceProcessingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004715C;
  block[3] = &unk_10022EFD0;
  id v7 = v4;
  id v14 = v7;
  id v15 = self;
  dispatch_async(distanceProcessingQueue, block);
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000474E8;
  v10[3] = &unk_10022EFD0;
  id v11 = v7;
  __int16 v12 = self;
  id v9 = v7;
  dispatch_async(mainQueue, v10);
}

- (id)_copyHistoricalAudioBufferToEndWithProviderUUID:(id)a3 FromSample:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audioProviderWithUUID:v5]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 audioChunkToEndFrom:a4]);
  return v8;
}

- (void)CSAutomaticVolumeEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100047070;
  v5[3] = &unk_10022EFA8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(mainQueue, v5);
}

- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100046F60;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(mainQueue, v5);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSSmartSiriVolumeContextAware CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s audiomxd/bridgeaudiod recovered from crash",  buf,  0xCu);
  }

  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046EF8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(mainQueue, block);
}

- (void)siriClientBehaviorMonitorReleasedAudioSession:(id)a3
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100046DF4;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(mainQueue, block);
}

- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5
{
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_100046034;
  v18[4] = sub_100046044;
  id v19 = 0LL;
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x2020000000LL;
  float kSSVCADefaultOutputTTSVolume = self->kSSVCADefaultOutputTTSVolume;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  int64_t v13 = sub_100046034;
  id v14 = sub_100046044;
  id v15 = 0LL;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004604C;
  block[3] = &unk_10022B028;
  void block[4] = self;
  void block[5] = v18;
  block[6] = v16;
  block[7] = &v10;
  block[9] = a3;
  block[10] = a5;
  block[8] = v9;
  dispatch_sync(mainQueue, block);
  id v6 = (id)v11[5];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

  return v6;
}

- (float)_applyTemporalSmoothingToSiriVolume:(float)a3 ArrivedAt:(int64_t)a4
{
  id v6 = self;
  unint64_t kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE = self->kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE;
  if (kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE >> 60) {
    size_t v8 = -1LL;
  }
  else {
    size_t v8 = 16 * kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE;
  }
  id v9 = (char *)operator new[](v8);
  uint64_t v10 = v9;
  if (kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE)
  {
    id v11 = v9;
    do
    {
      *(void *)id v11 = 0LL;
      *((_DWORD *)v11 + 2) = 0;
      v11 += 16;
    }

    while (v11 != &v9[16 * kSSVCA_HISTORICAL_VOLUME_BUFFER_SIZE]);
  }

  int64_t v60 = a4;
  float v61 = a3;
  value = (unint64_t *)v6->_historicalSiriVolumes.__ptr_.__value_;
  unint64_t v13 = value[2];
  if (*value)
  {
    unint64_t v14 = 0LL;
    id v15 = &v60;
    do
    {
      unint64_t v16 = value[3];
      int v17 = *(_OWORD **)(value[6] + 8 * v14);
      if (v13 == v16)
      {
        if (v13 < 2)
        {
          memcpy(v17, (char *)v15 + 16 - 16 * v13, 16 * v13);
          unint64_t v18 = 0LL;
        }

        else
        {
          _OWORD *v17 = *(_OWORD *)v15;
          unint64_t v18 = 1LL;
        }
      }

      else
      {
        v17[v16] = *(_OWORD *)v15;
        unint64_t v18 = v16 + 1;
      }

      ++v14;
      v15 += 2;
    }

    while (v14 < *value);
    id v19 = (uint64_t *)v6->_historicalSiriVolumes.__ptr_.__value_;
    unint64_t v20 = v19[2];
  }

  else
  {
    unint64_t v18 = value[3];
    unint64_t v20 = value[2];
    id v19 = (uint64_t *)v6->_historicalSiriVolumes.__ptr_.__value_;
  }

  uint64_t v21 = value[4] + 1;
  value[3] = v18 % v13;
  value[4] = v21;
  unint64_t v22 = v19[4];
  if (v22 >= v20) {
    unint64_t v23 = v22 - v20;
  }
  else {
    unint64_t v23 = 0LL;
  }
  unint64_t v24 = v22 - v23;
  if (v22 <= v23)
  {
    __int16 v42 = (os_log_s *)CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      float v63 = "copySamples";
      __int16 v64 = 2050;
      unint64_t v65 = v23;
      __int16 v66 = 2050;
      unint64_t v67 = v22;
      __int16 v68 = 2050;
      unint64_t v69 = v23;
      __int16 v70 = 2050;
      unint64_t v71 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, lat estSampleInBuffer=%{public}lu",  buf,  0x34u);
    }

    float v29 = 0LL;
  }

  else
  {
    unint64_t v54 = v23;
    unint64_t v55 = v19[4];
    uint64_t v25 = *v19;
    unint64_t v26 = *v19 * v24;
    if (v26 >> 60) {
      size_t v27 = -1LL;
    }
    else {
      size_t v27 = 16 * v26;
    }
    double v28 = (float *)operator new[](v27);
    float v29 = v28;
    unint64_t v59 = v24;
    if (v26)
    {
      double v30 = (char *)v28;
      do
      {
        *(void *)double v30 = 0LL;
        *((_DWORD *)v30 + 2) = 0;
        v30 += 16;
      }

      while (v30 != (char *)&v28[4 * v26]);
    }

    if (v25)
    {
      float v52 = v10;
      float v53 = v6;
      float v31 = v28;
      uint64_t v32 = 0LL;
      unint64_t v33 = v54 % v20;
      unint64_t v34 = v55 % v20;
      float v35 = (const void **)v19[6];
      unint64_t v36 = v20 - v54 % v20;
      uint64_t __n = 16 * v36;
      unint64_t v58 = v36;
      size_t v56 = 16 * (v59 - v36);
      float v37 = v28;
      do
      {
        float v38 = (char *)*v35;
        float v39 = (char *)*v35 + 16 * v33;
        if (v33 >= v34)
        {
          memcpy(v31, v39, __n);
          int v40 = &v37[4 * v32 * v59 + 4 * v58];
          float v39 = v38;
          size_t v41 = v56;
        }

        else
        {
          int v40 = v31;
          size_t v41 = 16 * v59;
        }

        memcpy(v40, v39, v41);
        ++v32;
        ++v35;
        v31 += 4 * v59;
        --v25;
      }

      while (v25);
      id v6 = v53;
      uint64_t v10 = v52;
      float v29 = v37;
    }

    unint64_t v24 = v59;
    unint64_t v23 = v54;
    unint64_t v22 = v55;
  }

  operator delete[](v10);
  if (v22 != v23)
  {
    float kSSVCA_VOLUME_HALF_LIFE_SECONDS = v6->kSSVCA_VOLUME_HALF_LIFE_SECONDS;
    if (v24 <= 1) {
      uint64_t v45 = 1LL;
    }
    else {
      uint64_t v45 = v24;
    }
    __int16 v46 = v29 + 2;
    float v47 = 0.0;
    float v48 = 0.0;
    do
    {
      float v49 = expf((float)((float)(unint64_t)(a4 - *((void *)v46 - 1)) * -0.69315) / kSSVCA_VOLUME_HALF_LIFE_SECONDS);
      float v50 = *v46;
      v46 += 4;
      float v48 = v48 + (float)(v49 * v50);
      float v47 = v47 + v49;
      --v45;
    }

    while (v45);
    a3 = v48 / v47;
LABEL_49:
    operator delete[](v29);
    return a3;
  }

  double v43 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v63 = "-[CSSmartSiriVolumeContextAware _applyTemporalSmoothingToSiriVolume:ArrivedAt:]";
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%s CSSmartSiriVolumeContextAware historical volume buffer empty. Returning latest volume",  buf,  0xCu);
  }

  if (v29) {
    goto LABEL_49;
  }
  return a3;
}

- (float)lowerBoundTTSVolumeWhenAdaptiveVolumeDisabled:(float)a3
{
  id v5 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  uint64_t v6 = 448LL;
  if (v5 == (id)1) {
    uint64_t v6 = 444LL;
  }
  return fmaxf(a3, *(float *)((char *)&self->super.isa + v6));
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x2020000000LL;
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100045EE0;
  block[3] = &unk_10022B050;
  float v5 = a3;
  void block[4] = self;
  void block[5] = v6;
  dispatch_async(mainQueue, block);
  _Block_object_dispose(v6, 8);
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100045C70;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mainQueue, v4);
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100045AFC;
  v4[3] = &unk_10022EFA8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(mainQueue, v4);
}

- (float)_applyDropInCallAnnouncementBounds:(float)a3
{
  float v4 = fmaxf(self->kSSVCADropInCallAnnouncementMinTTSVolume, a3);
  BOOL v5 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    size_t v8 = "-[CSSmartSiriVolumeContextAware _applyDropInCallAnnouncementBounds:]";
    __int16 v9 = 2050;
    double v10 = a3;
    __int16 v11 = 2050;
    double v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Applying drop-in announcement volume bounds. Before: %{public}f, After: %{public}f",  (uint8_t *)&v7,  0x20u);
  }

  return v4;
}

- (void)didReceiveMusicVolumeChanged:(float)a3
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100045A30;
  v4[3] = &unk_10022E8F8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(mainQueue, v4);
}

- (void)_logSSVMetrics:(id)a3 toPath:(id)a4
{
  id v19 = a3;
  id v18 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 ssvLogDirectory]);
  size_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"ssv_metrics.*"));
  +[CSUtils clearLogFilesInDirectory:matchingPattern:exceedNumber:]( &OBJC_CLASS___CSUtils,  "clearLogFilesInDirectory:matchingPattern:exceedNumber:",  v8,  v9,  self->kSSVCASmartSiriVolumeUnsyncedMetricLogsToRetain);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 ssvLogDirectory]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"synced.*"));
  +[CSUtils clearLogFilesInDirectory:matchingPattern:exceedNumber:]( &OBJC_CLASS___CSUtils,  "clearLogFilesInDirectory:matchingPattern:exceedNumber:",  v12,  v13,  self->kSSVCASmartSiriVolumeSyncedMetricLogsToRetain);

  id v20 = 0LL;
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v19,  3LL,  &v20));
  id v15 = v20;
  if (v15)
  {
    unint64_t v16 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
      *(_DWORD *)buf = 136315394;
      unint64_t v22 = "-[CSSmartSiriVolumeContextAware _logSSVMetrics:toPath:]";
      __int16 v23 = 2114;
      unint64_t v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s Error writing Smart Siri Volume Gen Two metrics: %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    [v14 writeToFile:v18 atomically:0];
  }
}

- (id)_timeStampString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  float v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (OS_dispatch_source)listenPollingTimer
{
  return self->_listenPollingTimer;
}

- (void)setListenPollingTimer:(id)a3
{
}

- (int64_t)listenPollingTimerCount
{
  return self->_listenPollingTimerCount;
}

- (void)setListenPollingTimerCount:(int64_t)a3
{
  self->_listenPollingTimerCount = a3;
}

- (CSPolicy)enablePolicy
{
  return self->_enablePolicy;
}

- (void)setEnablePolicy:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_historicalSiriVolumes.__ptr_.__value_;
  self->_historicalSiriVolumes.__ptr_.__value_ = 0LL;
  if (value) {
    sub_10001DF1C(value);
  }
  objc_storeStrong((id *)&self->_userIntent, 0LL);
  objc_storeStrong((id *)&self->_currentAsset, 0LL);
  objc_storeStrong((id *)&self->_ssvSentinel, 0LL);
  begin = self->_distanceAudioFloatBuffer.__begin_;
  if (begin)
  {
    self->_distanceAudioFloatBuffer.__end_ = begin;
    operator delete(begin);
  }

  float v5 = self->_musicAudioFloatBuffer.__begin_;
  if (v5)
  {
    self->_musicAudioFloatBuffer.__end_ = v5;
    operator delete(v5);
  }

  uint64_t v6 = self->_noiseAudioFloatBuffer.__begin_;
  if (v6)
  {
    self->_noiseAudioFloatBuffer.__end_ = v6;
    operator delete(v6);
  }

  objc_storeStrong((id *)&self->_distanceProcessingQueue, 0LL);
  objc_storeStrong((id *)&self->_mainQueue, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0LL;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 11) = 0LL;
  return self;
}

@end