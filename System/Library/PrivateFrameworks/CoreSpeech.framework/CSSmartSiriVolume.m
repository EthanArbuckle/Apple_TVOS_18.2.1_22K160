@interface CSSmartSiriVolume
- (CSAudioStream)audioStream;
- (CSPolicy)enablePolicy;
- (CSSmartSiriVolume)initWithSamplingRate:(float)a3;
- (OS_dispatch_source)listenPollingTimer;
- (float)_combineResultsWithOptimalFromNoise:(float)a3 andOptimalFromLkfs:(float)a4 withUserOffset:(float)a5;
- (float)_convertDB2Mag:(float)a3;
- (float)_deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:(float)a3;
- (float)_deviceSpecificLinearVolumeToDBMappingCSSSVDeviceSimple:(float)a3;
- (float)_estimatedTTSVolume:(float)a3 lowerLimit:(float)a4 upperLimit:(float)a5 TTSmappingInputRangeLow:(float)a6 TTSmappingInputRangeHigh:(float)a7 TTSmappingOutputRangeLow:(float)a8 TTSmappingOutputRangeHigh:(float)a9;
- (float)_getDeviceSimpleOutputLinearVolumeFordBFSValue:(float)a3;
- (float)_getDeviceSimpledBFSForOutputLinearVolume:(float)a3;
- (float)_getDevicedBFSForInputLinearVolume:(float)a3;
- (float)_getFloatBufferData:(id)a3;
- (float)_getMusicVolumeDBCSSSVDeviceDefault:(float)a3;
- (float)_getMusicVolumeDBCSSSVDeviceSimple:(float)a3;
- (float)_getUserOffsetFromMusicVolumeDB:(float)a3;
- (float)_scaleInputWithInRangeOutRange:(float)a3 minIn:(float)a4 maxIn:(float)a5 minOut:(float)a6 maxOut:(float)a7;
- (float)estimateSoundLevelbySoundType:(int64_t)a3;
- (float)estimatedTTSVolumeForNoiseLevelAndLKFS:(float)a3 LKFS:(float)a4;
- (id).cxx_construct;
- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5;
- (int64_t)listenPollingTimerCount;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4;
- (void)_pauseSSVProcessing;
- (void)_prepareSoundLevelBufferFromSamples:(unsigned int)a3 soundType:(int64_t)a4;
- (void)_processAudioChunk:(id)a3 soundType:(int64_t)a4;
- (void)_reset;
- (void)_resetStartAnalyzeTime;
- (void)_resumeSSVProcessing;
- (void)_setAsset:(id)a3;
- (void)_setDefaultParameters;
- (void)_setStartAnalyzeTime:(unint64_t)a3;
- (void)_startListenPolling;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopListening;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)didDetectKeywordWithResult:(id)a3;
- (void)didReceiveAlarmChanged:(int64_t)a3;
- (void)didReceiveAlarmVolumeChanged:(float)a3;
- (void)didReceiveMusicVolumeChanged:(float)a3;
- (void)didReceiveTimerChanged:(int64_t)a3;
- (void)fetchInitSystemVolumes;
- (void)initializeAlarmState;
- (void)initializeMediaPlayingState;
- (void)initializeTimerState;
- (void)prepareSoundLevelBufferFromSamples:(id)a3 soundType:(int64_t)a4 firedVoiceTriggerEvent:(BOOL)a5 triggerStartTimeSampleOffset:(unint64_t)a6 triggerEndTimeSampleOffset:(unint64_t)a7;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setEnablePolicy:(id)a3;
- (void)setListenPollingTimer:(id)a3;
- (void)setListenPollingTimerCount:(int64_t)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)startSmartSiriVolume;
@end

@implementation CSSmartSiriVolume

- (CSSmartSiriVolume)initWithSamplingRate:(float)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolume;
  v4 = -[CSSmartSiriVolume init](&v25, "init");
  v6 = v4;
  if (v4)
  {
    id v7 = objc_msgSend((id)objc_opt_class(v4, v5), "description");
    id v8 = objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    -[CSSmartSiriVolume _setDefaultParameters](v6, "_setDefaultParameters");
    float noiseMicSensitivityOffset = v6->_noiseMicSensitivityOffset;
    if ((id)+[CSAsset getSSVDeviceType](&OBJC_CLASS___CSAsset, "getSSVDeviceType") == (id)2) {
      float noiseMicSensitivityOffset = v6->_noiseMicSensitivityOffsetDeviceSimple;
    }
    -[CSSmartSiriVolume _convertDB2Mag:](v6, "_convertDB2Mag:", v12);
    float v14 = v13;
    v15 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSSmartSiriVolume initWithSamplingRate:]";
      __int16 v28 = 2050;
      double v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume init value for noise estimation %{public}f",  buf,  0x16u);
    }

    v16 = (char *)operator new(0xB8uLL);
    *((_DWORD *)v16 + 28) = 0;
    *(_OWORD *)v16 = 0u;
    *((_OWORD *)v16 + 1) = 0u;
    *((_OWORD *)v16 + 2) = 0u;
    *((_OWORD *)v16 + 3) = 0u;
    *((_OWORD *)v16 + 4) = 0u;
    *((_OWORD *)v16 + 5) = 0u;
    *((_DWORD *)v16 + 32) = 1084227584;
    *(void *)(v16 + 132) = 0x5F00000005LL;
    *((_DWORD *)v16 + 35) = 1119617024;
    v16[144] = 0;
    *((void *)v16 + 21) = 0LL;
    *((void *)v16 + 22) = 0LL;
    *((void *)v16 + 20) = 0LL;
    sub_10008C640((void **)&v6->_smartSiriVolumeNoiseLevel.__ptr_.__value_, v16);
    int v17 = a3;
    sub_10008F218( (uint64_t)v6->_smartSiriVolumeNoiseLevel.__ptr_.__value_,  a3,  (int)+[CSUtils getNumElementInBitset:]( &OBJC_CLASS___CSUtils,  "getNumElementInBitset:",  v6->_noiseLevelChannelBitset),  v6->_energyBufferSize,  v6->_noiseLowerPercentile,  v6->_noiseUpperPercentile,  v14,  v6->_noiseTimeConstant,  noiseMicSensitivityOffset);
    -[CSSmartSiriVolume _convertDB2Mag:](v6, "_convertDB2Mag:", v18);
    float v20 = v19;
    v21 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CSSmartSiriVolume initWithSamplingRate:]";
      __int16 v28 = 2050;
      double v29 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume init value for LKFS estimation %{public}f",  buf,  0x16u);
    }

    v22 = (char *)operator new(0xB8uLL);
    *((_DWORD *)v22 + 28) = 0;
    *(_OWORD *)v22 = 0u;
    *((_OWORD *)v22 + 1) = 0u;
    *((_OWORD *)v22 + 2) = 0u;
    *((_OWORD *)v22 + 3) = 0u;
    *((_OWORD *)v22 + 4) = 0u;
    *((_OWORD *)v22 + 5) = 0u;
    *((_DWORD *)v22 + 32) = 1084227584;
    *(void *)(v22 + 132) = 0x5F00000005LL;
    *((_DWORD *)v22 + 35) = 1119617024;
    v22[144] = 0;
    *((void *)v22 + 21) = 0LL;
    *((void *)v22 + 22) = 0LL;
    *((void *)v22 + 20) = 0LL;
    sub_10008C640((void **)&v6->_smartSiriVolumeLKFS.__ptr_.__value_, v22);
    *(float *)&double v23 = sub_10008F218( (uint64_t)v6->_smartSiriVolumeLKFS.__ptr_.__value_,  v17,  (int)+[CSUtils getNumElementInBitset:]( &OBJC_CLASS___CSUtils,  "getNumElementInBitset:",  v6->_LKFSChannelBitset),  v6->_energyBufferSize,  v6->_LKFSLowerPercentile,  v6->_LKFSUpperPercentile,  v20,  v6->_LKFSTimeConstant,  v6->_LKFSMicSensitivityOffset);
    -[CSSmartSiriVolume _reset](v6, "_reset", v23);
  }

  return v6;
}

- (void)startSmartSiriVolume
{
  v3 = (CSPolicy *)objc_claimAutoreleasedReturnValue( +[CSSmartSiriVolumeEnablePolicyFactory smartSiriVolumeEnablePolicy]( &OBJC_CLASS___CSSmartSiriVolumeEnablePolicyFactory,  "smartSiriVolumeEnablePolicy"));
  ssvEnablePolicy = self->_ssvEnablePolicy;
  self->_ssvEnablePolicy = v3;

  uint64_t v5 = self->_ssvEnablePolicy;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10008F098;
  v16[3] = &unk_10022E430;
  objc_copyWeak(&v17, &location);
  -[CSPolicy setCallback:](v5, "setCallback:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSSmartSiriVolumeRunPolicyFactory smartSiriVolumeRunPolicy]( &OBJC_CLASS___CSSmartSiriVolumeRunPolicyFactory,  "smartSiriVolumeRunPolicy"));
  -[CSSmartSiriVolume setEnablePolicy:](self, "setEnablePolicy:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolume enablePolicy](self, "enablePolicy"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10008F1B4;
  v14[3] = &unk_10022E430;
  objc_copyWeak(&v15, &location);
  [v7 setCallback:v14];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolume enablePolicy](self, "enablePolicy"));
  unsigned int v9 = [v8 isEnabled];

  if (v9)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10008F210;
    v13[3] = &unk_10022F100;
    v13[4] = self;
    dispatch_async(queue, v13);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v11 addObserver:self];

  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
  [v12 registerObserver:self];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_startListenPolling
{
  if (self->_isListenPollingStarting)
  {
    v2 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v5 = "-[CSSmartSiriVolume _startListenPolling]";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Already started listen polling, skip",  buf,  0xCu);
    }
  }

  else
  {
    self->_isListenPollingStarting = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10008F08C;
    v3[3] = &unk_10022E730;
    v3[4] = self;
    -[CSSmartSiriVolume _startListenPollingWithInterval:completion:]( self,  "_startListenPollingWithInterval:completion:",  v3,  1.0);
  }

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSSmartSiriVolume _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolume audioStream](self, "audioStream"));
  if ([v8 isStreaming])
  {
  }

  else
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolume enablePolicy](self, "enablePolicy"));
    unsigned int v10 = [v9 isEnabled];

    if (v10)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10008EE48;
      v12[3] = &unk_10022E628;
      v12[4] = self;
      double v14 = a3;
      id v13 = v6;
      -[CSSmartSiriVolume _startListenWithCompletion:](self, "_startListenWithCompletion:", v12);

      goto LABEL_11;
    }
  }

  v11 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSSmartSiriVolume _startListenPollingWithInterval:completion:]";
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
  v25[2] = sub_10008EB8C;
  v25[3] = &unk_10022E650;
  id v20 = a3;
  id v26 = v20;
  v4 = objc_retainBlock(v25);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v24 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 audioProviderWithContext:v5 error:&v24]);
  id v8 = v24;

  if (v7)
  {
    id v19 = v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  v5));
    [v9 setRequiresHistoricalBuffer:1];
    v11 = (objc_class *)objc_opt_class(self, v10);
    double v12 = NSStringFromClass(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v23 = 0LL;
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v19 audioStreamWithRequest:v9 streamName:v13 error:&v23]);
    id v15 = v23;

    if (v14)
    {
      -[CSSmartSiriVolume setAudioStream:](self, "setAudioStream:", v14);
      [v14 setDelegate:self];
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10008EBEC;
      v21[3] = &unk_10022E6A0;
      v21[4] = self;
      v22 = v4;
      [v14 startAudioStreamWithOption:v16 completion:v21];
    }

    else
    {
      id v17 = (os_log_s *)CSLogCategoryASV;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        double v18 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
        *(_DWORD *)buf = 136315394;
        __int16 v28 = "-[CSSmartSiriVolume _startListenWithCompletion:]";
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
  v3 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    unsigned int v9 = "-[CSSmartSiriVolume _stopListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolume audioStream](self, "audioStream"));
  BOOL v5 = v4 == 0LL;

  if (v5)
  {
    id v7 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      unsigned int v9 = "-[CSSmartSiriVolume _stopListening]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s No audio stream to stop, we shouldn't hit this",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSSmartSiriVolume audioStream](self, "audioStream"));
    [v6 stopAudioStreamWithOption:0 completion:&stru_10022BC58];
  }

- (void)initializeMediaPlayingState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSMediaPlayingMonitor sharedInstance](&OBJC_CLASS___CSMediaPlayingMonitor, "sharedInstance"));
  [v3 addObserver:self];
  [v3 initializeMediaPlayingState];
  v4 = (char *)[v3 mediaPlayingState];
  if ((unint64_t)(v4 - 1) > 1)
  {
    id v6 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v9 = "-[CSSmartSiriVolume initializeMediaPlayingState]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume haven't got MediaRemote callback yet, let's assume media is playing.",  buf,  0xCu);
    }
  }

  else
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008E990;
    v7[3] = &unk_10022F020;
    v7[4] = self;
    v7[5] = v4;
    dispatch_async(queue, v7);
  }
}

- (void)initializeAlarmState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSAlarmMonitor sharedInstance](&OBJC_CLASS___CSAlarmMonitor, "sharedInstance"));
  [v3 initializeAlarmState];
  v4 = (char *)[v3 alarmState];
  if ((unint64_t)(v4 - 1) <= 1)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10008E8AC;
    v6[3] = &unk_10022F020;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(queue, v6);
  }
}

- (void)initializeTimerState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSTimerMonitor sharedInstance](&OBJC_CLASS___CSTimerMonitor, "sharedInstance"));
  [v3 initializeTimerState];
  v4 = (char *)[v3 timerState];
  if ((unint64_t)(v4 - 1) <= 1)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10008E7C8;
    v6[3] = &unk_10022F020;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(queue, v6);
  }
}

- (void)fetchInitSystemVolumes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSVolumeMonitor sharedInstance](&OBJC_CLASS___CSVolumeMonitor, "sharedInstance"));
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10008E784;
  v6[3] = &unk_10022EFD0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008E778;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_currentAsset = &self->_currentAsset;
    objc_storeStrong((id *)&self->_currentAsset, a3);
    self->_noiseLevelChannelBitset = -[CSAsset SSVNoiseLevelChannelBitset]( self->_currentAsset,  "SSVNoiseLevelChannelBitset");
    self->_LKFSChannelBitset = -[CSAsset SSVLKFSChannelBitset](self->_currentAsset, "SSVLKFSChannelBitset");
    self->_energyBufferSize = -[CSAsset SSVEnergyBufferSize](self->_currentAsset, "SSVEnergyBufferSize");
    self->_noiseLowerPercentile = -[CSAsset SSVNoiseLowerPercentile](self->_currentAsset, "SSVNoiseLowerPercentile");
    self->_noiseUpperPercentile = -[CSAsset SSVNoiseUpperPercentile](self->_currentAsset, "SSVNoiseUpperPercentile");
    self->_LKFSLowerPercentile = -[CSAsset SSVLKFSLowerPercentile](self->_currentAsset, "SSVLKFSLowerPercentile");
    self->_LKFSUpperPercentile = -[CSAsset SSVLKFSUpperPercentile](self->_currentAsset, "SSVLKFSUpperPercentile");
    -[CSAsset SSVNoiseTimeConstant](self->_currentAsset, "SSVNoiseTimeConstant");
    self->_noiseTimeConstant = v7;
    -[CSAsset SSVNoiseMicSensitivityOffset](self->_currentAsset, "SSVNoiseMicSensitivityOffset");
    self->_float noiseMicSensitivityOffset = v8;
    -[CSAsset SSVNoiseMicSensitivityOffsetDeviceSimple](self->_currentAsset, "SSVNoiseMicSensitivityOffsetDeviceSimple");
    self->_noiseMicSensitivityOffsetDeviceSimple = v9;
    -[CSAsset SSVLKFSTimeConstant](self->_currentAsset, "SSVLKFSTimeConstant");
    self->_LKFSTimeConstant = v10;
    -[CSAsset SSVLKFSMicSensitivityOffset](self->_currentAsset, "SSVLKFSMicSensitivityOffset");
    self->_LKFSMicSensitivityOffset = v11;
    -[CSAsset SSVNoiseTTSMappingInputRangeLow](self->_currentAsset, "SSVNoiseTTSMappingInputRangeLow");
    self->_noiseTTSMappingInputRangeLow = v12;
    -[CSAsset SSVNoiseTTSMappingInputRangeHigh](self->_currentAsset, "SSVNoiseTTSMappingInputRangeHigh");
    self->_noiseTTSMappingInputRangeHigh = v13;
    -[CSAsset SSVNoiseTTSMappingOutputRangeLow](self->_currentAsset, "SSVNoiseTTSMappingOutputRangeLow");
    self->_noiseTTSMappingOutputRangeLow = v14;
    -[CSAsset SSVNoiseTTSMappingOutputRangeHigh](self->_currentAsset, "SSVNoiseTTSMappingOutputRangeHigh");
    self->_noiseTTSMappingOutputRangeHigh = v15;
    -[CSAsset SSVLKFSTTSMappingInputRangeLow](self->_currentAsset, "SSVLKFSTTSMappingInputRangeLow");
    self->_LKFSTTSMappingInputRangeLow = v16;
    -[CSAsset SSVLKFSTTSMappingInputRangeHigh](self->_currentAsset, "SSVLKFSTTSMappingInputRangeHigh");
    self->_LKFSTTSMappingInputRangeHigh = v17;
    -[CSAsset SSVLKFSTTSMappingOutputRangeLow](self->_currentAsset, "SSVLKFSTTSMappingOutputRangeLow");
    self->_LKFSTTSMappingOutputRangeLow = v18;
    -[CSAsset SSVLKFSTTSMappingOutputRangeHigh](self->_currentAsset, "SSVLKFSTTSMappingOutputRangeHigh");
    self->_LKFSTTSMappingOutputRangeHigh = v19;
    -[CSAsset SSVUserOffsetInputRangeLow](self->_currentAsset, "SSVUserOffsetInputRangeLow");
    self->_userOffsetInputRangeLow = v20;
    -[CSAsset SSVUserOffsetInputRangeHigh](self->_currentAsset, "SSVUserOffsetInputRangeHigh");
    self->_userOffsetInputRangeHigh = v21;
    -[CSAsset SSVUserOffsetOutputRangeLow](self->_currentAsset, "SSVUserOffsetOutputRangeLow");
    self->_userOffsetOutputRangeLow = v22;
    -[CSAsset SSVUserOffsetOutputRangeHigh](self->_currentAsset, "SSVUserOffsetOutputRangeHigh");
    self->_userOffsetOutputRangeHigh = v23;
    -[CSAsset SSVTTSVolumeLowerLimitDB](self->_currentAsset, "SSVTTSVolumeLowerLimitDB");
    self->_TTSVolumeLowerLimitDB = v24;
    -[CSAsset SSVTTSVolumeUpperLimitDB](self->_currentAsset, "SSVTTSVolumeUpperLimitDB");
    self->_TTSVolumeUpperLimitDB = v25;
    -[CSAsset SSVNoiseWeight](self->_currentAsset, "SSVNoiseWeight");
    self->_noiseWeight = v26;
    v27 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset SSVParameterDirectionary](*p_currentAsset, "SSVParameterDirectionary"));
      int v30 = 136315394;
      v31 = "-[CSSmartSiriVolume _setAsset:]";
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume configure: %{public}@",  (uint8_t *)&v30,  0x16u);
    }
  }

  else
  {
    __int16 v29 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136315138;
      v31 = "-[CSSmartSiriVolume _setAsset:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s asset is nil, use default parameters(this should not happen).",  (uint8_t *)&v30,  0xCu);
    }
  }
}

- (void)_reset
{
  p_floatBuffer = (char **)&self->_floatBuffer;
  unsigned int v4 = +[CSUtils getNumElementInBitset:]( &OBJC_CLASS___CSUtils,  "getNumElementInBitset:",  self->_noiseLevelChannelBitset);
  unsigned int v5 = +[CSUtils getNumElementInBitset:]( &OBJC_CLASS___CSUtils,  "getNumElementInBitset:",  self->_LKFSChannelBitset);
  if (v4 <= v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v4;
  }
  sub_1000479D0(p_floatBuffer, v6 << 10);
  *(_DWORD *)&self->_shouldPauseSSVProcess = 0;
  self->_mediaIsPlaying = 1;
  self->_processedSampleCount = 0LL;
  -[CSSmartSiriVolume _resetStartAnalyzeTime](self, "_resetStartAnalyzeTime");
}

- (void)_prepareSoundLevelBufferFromSamples:(unsigned int)a3 soundType:(int64_t)a4
{
  if (a4)
  {
    *(float *)&double v4 = self->_musicVolumeDB;
    -[CSSmartSiriVolume _convertDB2Mag:](self, "_convertDB2Mag:", v4);
    sub_10008E1A4((uint64_t)self->_smartSiriVolumeLKFS.__ptr_.__value_, (uint64_t)self->_floatBuffer.__begin_, a3);
    value = (uint64_t *)self->_smartSiriVolumeLKFS.__ptr_.__value_;
  }

  else
  {
    sub_10008E1A4((uint64_t)self->_smartSiriVolumeNoiseLevel.__ptr_.__value_, (uint64_t)self->_floatBuffer.__begin_, a3);
    value = (uint64_t *)self->_smartSiriVolumeNoiseLevel.__ptr_.__value_;
  }

  sub_10008E2B0(value);
  sub_10008E428((uint64_t)value, v8);
}

- (void)prepareSoundLevelBufferFromSamples:(id)a3 soundType:(int64_t)a4 firedVoiceTriggerEvent:(BOOL)a5 triggerStartTimeSampleOffset:(unint64_t)a6 triggerEndTimeSampleOffset:(unint64_t)a7
{
  id v12 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008E094;
  v15[3] = &unk_10022BC80;
  id v16 = v12;
  float v17 = self;
  BOOL v21 = a5;
  int64_t v18 = a4;
  unint64_t v19 = a6;
  unint64_t v20 = a7;
  id v14 = v12;
  dispatch_async(queue, v15);
}

- (void)_processAudioChunk:(id)a3 soundType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = qword_10027FE68;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_10027FE68, 2) <= 0x444444444444444uLL)
  {
    float v8 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSmartSiriVolume _processAudioChunk:soundType:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s SmartSiriVolume heartbeat = %{public}lld",  buf,  0x16u);
      uint64_t v7 = qword_10027FE68;
    }
  }

  qword_10027FE68 = v7 + 1;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  int v17 = 0;
  uint64_t v9 = 16LL;
  if (!a4) {
    uint64_t v9 = 15LL;
  }
  Class v10 = (&self->super.isa)[v9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10008DFD0;
  v12[3] = &unk_10022BCA8;
  id v11 = v6;
  id v13 = v11;
  id v14 = self;
  float v15 = buf;
  +[CSUtils iterateBitset:block:](&OBJC_CLASS___CSUtils, "iterateBitset:block:", v10, v12);
  -[CSSmartSiriVolume _prepareSoundLevelBufferFromSamples:soundType:]( self,  "_prepareSoundLevelBufferFromSamples:soundType:",  *(unsigned int *)(*(void *)&buf[8] + 24LL),  a4);

  _Block_object_dispose(buf, 8);
}

- (float)estimateSoundLevelbySoundType:(int64_t)a3
{
  uint64_t v7 = 0LL;
  float v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000LL;
  int v10 = -998637568;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008DD24;
  block[3] = &unk_10022D9D0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_pauseSSVProcessing
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008DC54;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_resumeSSVProcessing
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008DB88;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008DAB4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008D890;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSSmartSiriVolume audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v12 = 2050;
    int64_t v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s stream stopped unexpectedly : %{public}ld",  buf,  0x16u);
  }

  if (a4 != -11785)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008D828;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)didDetectKeywordWithResult:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume received VT event!",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008D270;
  v8[3] = &unk_10022EFD0;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (float)estimatedTTSVolumeForNoiseLevelAndLKFS:(float)a3 LKFS:(float)a4
{
  uint64_t v14 = 0LL;
  float v15 = (float *)&v14;
  uint64_t v16 = 0x2020000000LL;
  int v17 = -998637568;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2020000000LL;
  int v13 = -1041235968;
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2020000000LL;
  int v11 = -1041235968;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008CD3C;
  block[3] = &unk_10022BCD0;
  float v8 = a3;
  float v9 = a4;
  block[4] = self;
  void block[5] = v10;
  block[6] = v12;
  void block[7] = &v14;
  dispatch_sync(queue, block);
  float v5 = v15[6];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (float)_getDeviceSimpleOutputLinearVolumeFordBFSValue:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, -58.0), 0.0) + 58.0) * 0.017241, 0.0), 1.0);
}

- (float)_getDeviceSimpledBFSForOutputLinearVolume:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, 0.0), 1.0) / 0.017241) + -58.0, -58.0), 0.0);
}

- (float)_deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, -55.0), 0.0) + 55.0) * 0.018182, 0.0), 1.0);
}

- (float)_deviceSpecificLinearVolumeToDBMappingCSSSVDeviceSimple:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, 0.0), 1.0) / 0.018182) + -55.0, -55.0), 0.0);
}

- (float)_scaleInputWithInRangeOutRange:(float)a3 minIn:(float)a4 maxIn:(float)a5 minOut:(float)a6 maxOut:(float)a7
{
}

- (float)_estimatedTTSVolume:(float)a3 lowerLimit:(float)a4 upperLimit:(float)a5 TTSmappingInputRangeLow:(float)a6 TTSmappingInputRangeHigh:(float)a7 TTSmappingOutputRangeLow:(float)a8 TTSmappingOutputRangeHigh:(float)a9
{
  if (a3 < a4) {
    return a8;
  }
  if (a3 > a5) {
    return a9;
  }
  -[CSSmartSiriVolume _scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:]( self,  "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:");
  *(float *)&double v14 = 1.0 / (float)(expf(-v13) + 1.0);
  LODWORD(v15) = 0;
  LODWORD(v16) = 1.0;
  *(float *)&double v17 = a8;
  *(float *)&double v18 = a9;
  -[CSSmartSiriVolume _scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:]( self,  "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:",  v14,  v15,  v16,  v17,  v18);
  return result;
}

- (float)_combineResultsWithOptimalFromNoise:(float)a3 andOptimalFromLkfs:(float)a4 withUserOffset:(float)a5
{
  float v9 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    double v15 = "-[CSSmartSiriVolume _combineResultsWithOptimalFromNoise:andOptimalFromLkfs:withUserOffset:]";
    __int16 v16 = 2050;
    double v17 = a3;
    __int16 v18 = 2050;
    double v19 = a4;
    __int16 v20 = 2050;
    double v21 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume: TTS volume in dB from noise %{public}f, from LKFS %{public}f, with user offset %{public}f",  (uint8_t *)&v14,  0x2Au);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  if ([v10 smartSiriVolumeSoftVolumeEnabled])
  {
    BOOL v11 = !self->_shouldPauseLKFSProcess;

    if (!v11)
    {
      __int16 v12 = (os_log_s *)CSLogCategoryASV;
      if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        double v15 = "-[CSSmartSiriVolume _combineResultsWithOptimalFromNoise:andOptimalFromLkfs:withUserOffset:]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume: soft volume algorithm in use",  (uint8_t *)&v14,  0xCu);
      }

      return a3;
    }
  }

  else
  {
  }

  return a3;
}

- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10008CBB4;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)didReceiveAlarmChanged:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008CA28;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveTimerChanged:(int64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008C89C;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveMusicVolumeChanged:(float)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008C86C;
  v4[3] = &unk_10022E8F8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveAlarmVolumeChanged:(float)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008C85C;
  v4[3] = &unk_10022E8F8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(queue, v4);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v8 = "-[CSSmartSiriVolume CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s audiomxd/bridgeaudiod recovered from crash",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C7F4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C6D4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (float)_getFloatBufferData:(id)a3
{
  id v3 = a3;
  if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
  {
    id v4 = (float *)[v3 bytes];
  }

  else
  {
    id v5 = objc_claimAutoreleasedReturnValue( +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:]( &OBJC_CLASS___CSFLPCMTypeConverter, "convertToFloatLPCMBufFromShortLPCMBuf:", v3));
    id v4 = (float *)[v5 bytes];
  }

  return v4;
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_startAnalyzeSampleCount = 0LL;
  self->_samplesFed = 0LL;
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_startAnalyzeSampleCount = a3;
    self->_samplesFed = 0LL;
    id v4 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[CSSmartSiriVolume _setStartAnalyzeTime:]";
      __int16 v7 = 2050;
      unint64_t v8 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume: set StartAnalyzeSampleCount = %{public}lld",  (uint8_t *)&v5,  0x16u);
    }
  }

- (void)_setDefaultParameters
{
  *(_OWORD *)&self->_noiseLevelChannelBitset = xmmword_10018B340;
  *(_OWORD *)&self->_energyBufferSize = xmmword_10018B350;
  self->_LKFSUpperPercentile = 95;
  *(_OWORD *)&self->_noiseTimeConstant = xmmword_10018B360;
  *(_OWORD *)&self->_LKFSMicSensitivityOffset = xmmword_10018B370;
  *(_OWORD *)&self->_noiseTTSMappingOutputRangeHigh = xmmword_10018B380;
  *(_OWORD *)&self->_LKFSTTSMappingOutputRangeHigh = xmmword_10018B390;
  *(_OWORD *)&self->_userOffsetOutputRangeHigh = xmmword_10018B3A0;
}

- (float)_convertDB2Mag:(float)a3
{
  return __exp10f(a3 / 20.0);
}

- (float)_getDevicedBFSForInputLinearVolume:(float)a3
{
  if ((id)+[CSAsset getSSVDeviceType](&OBJC_CLASS___CSAsset, "getSSVDeviceType") == (id)2)
  {
    *(float *)&double v5 = a3;
    -[CSSmartSiriVolume _getMusicVolumeDBCSSSVDeviceSimple:](self, "_getMusicVolumeDBCSSSVDeviceSimple:", v5);
  }

  else
  {
    *(float *)&double v5 = a3;
    -[CSSmartSiriVolume _getMusicVolumeDBCSSSVDeviceDefault:](self, "_getMusicVolumeDBCSSSVDeviceDefault:", v5);
  }

  return result;
}

- (float)_getMusicVolumeDBCSSSVDeviceSimple:(float)a3
{
  return result;
}

- (float)_getMusicVolumeDBCSSSVDeviceDefault:(float)a3
{
  return result;
}

- (float)_getUserOffsetFromMusicVolumeDB:(float)a3
{
  if ((id)+[CSAsset getSSVDeviceType](&OBJC_CLASS___CSAsset, "getSSVDeviceType") != (id)2) {
    return a3;
  }
  *(float *)&double v5 = a3;
  -[CSSmartSiriVolume _deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:]( self,  "_deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:",  v5);
  -[CSSmartSiriVolume _getDeviceSimpledBFSForOutputLinearVolume:](self, "_getDeviceSimpledBFSForOutputLinearVolume:");
  return result;
}

- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5
{
  int v7 = v6;
  -[CSSmartSiriVolume estimateSoundLevelbySoundType:](self, "estimateSoundLevelbySoundType:", 1LL);
  LODWORD(v9) = v8;
  LODWORD(v10) = v7;
  -[CSSmartSiriVolume estimatedTTSVolumeForNoiseLevelAndLKFS:LKFS:]( self,  "estimatedTTSVolumeForNoiseLevelAndLKFS:LKFS:",  v10,  v9);
  float v12 = v11;
  float v13 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(+[CSVolumeMonitor sharedInstance](&OBJC_CLASS___CSVolumeMonitor, "sharedInstance"));
    [v14 musicVolume];
    int v19 = 136315650;
    __int16 v20 = "-[CSSmartSiriVolume getVolumeForTTSType:withOverrideMediaVolume:WithRequestTime:]";
    __int16 v21 = 2050;
    double v22 = v12;
    __int16 v23 = 2050;
    double v24 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s SmartSiriVolume: final estimated TTS volume %{public}f with music volume %{public}f",  (uint8_t *)&v19,  0x20u);
  }

  __int16 v16 = objc_alloc(&OBJC_CLASS___CSSmartSiriVolumeEstimate);
  *(float *)&double v17 = v12;
  return  -[CSSmartSiriVolumeEstimate initWithVolumeEstimate:debugLogFile:]( v16,  "initWithVolumeEstimate:debugLogFile:",  0LL,  v17);
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
  begin = self->_floatBuffer.__begin_;
  if (begin)
  {
    self->_floatBuffer.__end_ = begin;
    operator delete(begin);
  }

  sub_10008C640((void **)&self->_smartSiriVolumeLKFS.__ptr_.__value_, 0LL);
  sub_10008C640((void **)&self->_smartSiriVolumeNoiseLevel.__ptr_.__value_, 0LL);
  objc_storeStrong((id *)&self->_queue, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0LL;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end