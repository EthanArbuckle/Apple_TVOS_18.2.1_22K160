@interface CSSmartSiriVolumeSentinel
- (CSSmartSiriVolumeSentinel)initWithMainQueue:(id)a3 distanceQueue:(id)a4;
- (float)getMeanBufferStrengthForSoundType:(int64_t)a3;
- (float)getMusicLevelForLastVoiceTrigger;
- (float)getSpeechLevelForLastVoiceTrigger;
- (id).cxx_construct;
- (int64_t)getDistanceForLastVoiceTrigger;
- (pair<unsigned)getNoiseActivityForLastVoiceTrigger;
- (unint64_t)getVoiceTriggerTimeForLastVoiceTrigger;
- (void)_analyzeAudioBufferForDistance:(const float *)a3 numSamples:(unint64_t)a4 startSampleCount:(unint64_t)a5;
- (void)_analyzeAudioBufferForMusic:(const float *)a3 numSamples:(unint64_t)a4 startSampleCount:(unint64_t)a5;
- (void)_analyzeAudioBufferForNoise:(const float *)a3 numSamples:(unint64_t)a4 startSampleCount:(unint64_t)a5;
- (void)_reset;
- (void)_resetDistance;
- (void)_setDistanceParametersFromAsset:(id)a3;
- (void)_setLastVoiceTriggerMachTime:(unint64_t)a3;
- (void)_updateMusicStrengthForVoiceTriggerStartingAtSample:(unint64_t)a3 andEndingAtSample:(unint64_t)a4;
- (void)_updateNoiseActivityForVoiceTriggerStartingAtSample:(unint64_t)a3;
- (void)_updateSpeechStrengthForVoiceTriggerStartingAtSample:(unint64_t)a3 andEndingAtSample:(unint64_t)a4;
- (void)analyzeAudioBufferForSoundType:(int64_t)a3 data:(const float *)a4 numSamples:(unint64_t)a5 startSampleCount:(unint64_t)a6;
- (void)createDSPAccelerateSetupForSound:(int64_t)a3;
- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)resetDistanceParameters;
- (void)resetMusicBuffer;
- (void)resetParameters;
- (void)setAsset:(id)a3;
- (void)setDistanceAsset:(id)a3;
- (void)setDistanceModelPath;
- (void)setParametersFromAsset;
- (void)setupDistanceAudioStreamAnalyzer;
- (void)updateSpeechAndMusicStrengthsForVoiceTriggerStartingAtSample:(unint64_t)a3 andEndingAtSample:(unint64_t)a4 andVoiceTriggerMachTime:(unint64_t)a5;
@end

@implementation CSSmartSiriVolumeSentinel

- (CSSmartSiriVolumeSentinel)initWithMainQueue:(id)a3 distanceQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CSSmartSiriVolumeSentinel;
  v8 = -[CSSmartSiriVolumeSentinel init](&v28, "init");
  v10 = v8;
  if (v8)
  {
    if (v6)
    {
      v11 = (OS_dispatch_queue *)v6;
      mainQueue = v10->_mainQueue;
      v10->_mainQueue = v11;
    }

    else
    {
      id v13 = objc_msgSend((id)objc_opt_class(v8, v9), "description");
      mainQueue = (OS_dispatch_queue *) objc_claimAutoreleasedReturnValue(v13);
      dispatch_queue_t v14 = dispatch_queue_create((const char *)-[OS_dispatch_queue UTF8String](mainQueue, "UTF8String"), 0LL);
      v15 = v10->_mainQueue;
      v10->_mainQueue = (OS_dispatch_queue *)v14;
    }

    if (v7) {
      dispatch_queue_t v16 = (dispatch_queue_t)v7;
    }
    else {
      dispatch_queue_t v16 = dispatch_queue_create("CSSmartSiriVolumeSentinel Distance Processing", 0LL);
    }
    distanceEstimationQueue = v10->_distanceEstimationQueue;
    v10->_distanceEstimationQueue = (OS_dispatch_queue *)v16;

    v18 = -[CSAttSiriAudioSessionStateClient initWithDelegate:]( objc_alloc(&OBJC_CLASS___CSAttSiriAudioSessionStateClient),  "initWithDelegate:",  v10);
    siriStateClient = v10->_siriStateClient;
    v10->_siriStateClient = v18;

    v10->_latestAudioChunkSampleCountOnTTSStart = 0LL;
    v10->_latestNoiseBufferSampleCount = 0LL;
    v10->_wasTTSOngoing = 0;
    v20 = (dispatch_queue_s *)v10->_mainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001ED28;
    block[3] = &unk_10022F100;
    v21 = v10;
    v27 = v21;
    dispatch_async(v20, block);
    v22 = (dispatch_queue_s *)v21->_distanceEstimationQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001ED30;
    v24[3] = &unk_10022F100;
    v25 = v21;
    dispatch_async(v22, v24);
  }

  return v10;
}

- (void)setDistanceAsset:(id)a3
{
  id v4 = a3;
  distanceEstimationQueue = (dispatch_queue_s *)self->_distanceEstimationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001ECFC;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(distanceEstimationQueue, v7);
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001ECB0;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mainQueue, v7);
}

- (void)_setDistanceParametersFromAsset:(id)a3
{
  id v6 = a3;
  self->kSSVCADistanceInputBufferDurationSeconds = [v6 SSVCADistanceInputBufferDurationSeconds];
  [v6 SSVCAVoiceTriggerBasedTTSValidForSeconds];
  self->kSSVCAVoiceTriggerBasedTTSValidForSeconds = v4;
  [v6 SSVCADistanceModelConfidenceThreshold];
  self->kSSVCADistanceModelConfidenceThreshold = v5;
}

- (void)setParametersFromAsset
{
  self->kSSVCANoiseActivityThreshold = v3;
  self->kSSVCANoiseResultsBufferSize = -[CSAsset SSVCANoiseResultsBufferSize]( self->_currentAsset,  "SSVCANoiseResultsBufferSize");
  self->kSSVCAMusicResultsBufferSize = -[CSAsset SSVCAMusicResultsBufferSize]( self->_currentAsset,  "SSVCAMusicResultsBufferSize");
  -[CSAsset SSVCADefaultSpeechStrength](self->_currentAsset, "SSVCADefaultSpeechStrength");
  self->kSSVCADefaultSpeechStrength = v4;
  -[CSAsset SSVCADefaultMusicStrength](self->_currentAsset, "SSVCADefaultMusicStrength");
  self->kSSVCADefaultMusicStrength = v5;
  self->kSSVCANoiseActivityHistoricalSampleCount = -[CSAsset SSVCANoiseActivityHistoricalSampleCount]( self->_currentAsset,  "SSVCANoiseActivityHistoricalSampleCount");
  -[CSAsset SSVCAMusicHistoricalSamplesInSeconds](self->_currentAsset, "SSVCAMusicHistoricalSamplesInSeconds");
  self->kSSVCAMusicHistoricalSamplesInSeconds = v6;
  -[CSAsset SSVCAVoiceTriggerInitialSilenceDurationSeconds]( self->_currentAsset,  "SSVCAVoiceTriggerInitialSilenceDurationSeconds");
  self->kSSVCAVoiceTriggerInitialSilenceDurationSeconds = v7;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  self->_musicHistoricalSampleCount = (unint64_t)(float)(v8 * self->kSSVCAMusicHistoricalSamplesInSeconds);
}

- (void)resetParameters
{
  int v3 = 0;
  self->_defaultNoiseActivity.first = 0LL;
  self->_defaultNoiseActivity.second = 0.0;
  self->_lastVoiceTriggerMachTime = 0LL;
  do
  {
    end = self->_noiseDSPSingleChannelCoefs.__end_;
    value = self->_noiseDSPSingleChannelCoefs.__end_cap_.__value_;
    if (v3)
    {
      if (end >= value)
      {
        begin = self->_noiseDSPSingleChannelCoefs.__begin_;
        uint64_t v9 = end - begin;
        unint64_t v10 = v9 + 1;
        uint64_t v11 = (char *)value - (char *)begin;
        if (v11 >> 2 > v10) {
          unint64_t v10 = v11 >> 2;
        }
        else {
          unint64_t v12 = v10;
        }
        if (v12)
        {
          unint64_t v12 = (unint64_t)sub_10001EC7C(v12);
          begin = self->_noiseDSPSingleChannelCoefs.__begin_;
          end = self->_noiseDSPSingleChannelCoefs.__end_;
        }

        else
        {
          uint64_t v13 = 0LL;
        }

        v20 = (double *)(v12 + 8 * v9);
        double *v20 = 0.0;
        float v6 = v20 + 1;
        while (end != begin)
        {
          uint64_t v21 = *((void *)end-- - 1);
          *((void *)v20-- - 1) = v21;
        }

        self->_noiseDSPSingleChannelCoefs.__begin_ = v20;
        self->_noiseDSPSingleChannelCoefs.__end_ = v6;
        self->_noiseDSPSingleChannelCoefs.__end_cap_.__value_ = (double *)(v12 + 8 * v13);
        if (begin) {
          operator delete(begin);
        }
      }

      else
      {
        double *end = 0.0;
        float v6 = end + 1;
      }

      self->_noiseDSPSingleChannelCoefs.__end_ = v6;
      v23 = self->_musicDSPSingleChannelCoefs.__end_;
      v22 = self->_musicDSPSingleChannelCoefs.__end_cap_.__value_;
      if (v23 < v22)
      {
        double *v23 = 0.0;
        v24 = v23 + 1;
LABEL_51:
        v32 = v24;
        goto LABEL_66;
      }

      v25 = self->_musicDSPSingleChannelCoefs.__begin_;
      uint64_t v26 = v23 - v25;
      unint64_t v27 = v26 + 1;
      uint64_t v28 = (char *)v22 - (char *)v25;
      if (v28 >> 2 > v27) {
        unint64_t v27 = v28 >> 2;
      }
      else {
        unint64_t v29 = v27;
      }
      if (v29)
      {
        unint64_t v29 = (unint64_t)sub_10001EC7C(v29);
        v25 = self->_musicDSPSingleChannelCoefs.__begin_;
        v23 = self->_musicDSPSingleChannelCoefs.__end_;
      }

      else
      {
        uint64_t v30 = 0LL;
      }

      v31 = (double *)(v29 + 8 * v26);
      double *v31 = 0.0;
      v32 = v31 + 1;
      while (v23 != v25)
      {
        uint64_t v33 = *((void *)v23-- - 1);
        *((void *)v31-- - 1) = v33;
      }
    }

    else
    {
      if (end >= value)
      {
        dispatch_queue_t v14 = self->_noiseDSPSingleChannelCoefs.__begin_;
        uint64_t v15 = end - v14;
        unint64_t v16 = v15 + 1;
        uint64_t v17 = (char *)value - (char *)v14;
        if (v17 >> 2 > v16) {
          unint64_t v16 = v17 >> 2;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18)
        {
          unint64_t v18 = (unint64_t)sub_10001EC7C(v18);
          dispatch_queue_t v14 = self->_noiseDSPSingleChannelCoefs.__begin_;
          end = self->_noiseDSPSingleChannelCoefs.__end_;
        }

        else
        {
          uint64_t v19 = 0LL;
        }

        v34 = (double *)(v18 + 8 * v15);
        double *v34 = 1.0;
        float v7 = v34 + 1;
        while (end != v14)
        {
          uint64_t v35 = *((void *)end-- - 1);
          *((void *)v34-- - 1) = v35;
        }

        self->_noiseDSPSingleChannelCoefs.__begin_ = v34;
        self->_noiseDSPSingleChannelCoefs.__end_ = v7;
        self->_noiseDSPSingleChannelCoefs.__end_cap_.__value_ = (double *)(v18 + 8 * v19);
        if (v14) {
          operator delete(v14);
        }
      }

      else
      {
        double *end = 1.0;
        float v7 = end + 1;
      }

      self->_noiseDSPSingleChannelCoefs.__end_ = v7;
      v37 = self->_musicDSPSingleChannelCoefs.__end_;
      v36 = self->_musicDSPSingleChannelCoefs.__end_cap_.__value_;
      if (v37 < v36)
      {
        double *v37 = 1.0;
        v24 = v37 + 1;
        goto LABEL_51;
      }

      v25 = self->_musicDSPSingleChannelCoefs.__begin_;
      uint64_t v38 = v37 - v25;
      unint64_t v39 = v38 + 1;
      if ((unint64_t)(v38 + 1) >> 61) {
LABEL_68:
      }
        sub_10001E948();
      uint64_t v40 = (char *)v36 - (char *)v25;
      if (v40 >> 2 > v39) {
        unint64_t v39 = v40 >> 2;
      }
      else {
        unint64_t v29 = v39;
      }
      if (v29)
      {
        unint64_t v29 = (unint64_t)sub_10001EC7C(v29);
        v25 = self->_musicDSPSingleChannelCoefs.__begin_;
        v37 = self->_musicDSPSingleChannelCoefs.__end_;
      }

      else
      {
        uint64_t v30 = 0LL;
      }

      v31 = (double *)(v29 + 8 * v38);
      double *v31 = 1.0;
      v32 = v31 + 1;
      while (v37 != v25)
      {
        uint64_t v41 = *((void *)v37-- - 1);
        *((void *)v31-- - 1) = v41;
      }
    }

    self->_musicDSPSingleChannelCoefs.__begin_ = v31;
    self->_musicDSPSingleChannelCoefs.__end_ = v32;
    self->_musicDSPSingleChannelCoefs.__end_cap_.__value_ = (double *)(v29 + 8 * v30);
    if (v25) {
      operator delete(v25);
    }
LABEL_66:
    self->_musicDSPSingleChannelCoefs.__end_ = v32;
    ++v3;
  }

  while (v3 != 5);
}

- (void)setDistanceModelPath
{
  int v3 = (NSURL *)objc_claimAutoreleasedReturnValue( +[SNDistanceClassifier modelURLForCurrentProduct]( &OBJC_CLASS___SNDistanceClassifier,  "modelURLForCurrentProduct"));
  distanceModelPath = self->_distanceModelPath;
  self->_distanceModelPath = v3;

  float v5 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    float v6 = self->_distanceModelPath;
    int v7 = 136315394;
    float v8 = "-[CSSmartSiriVolumeSentinel setDistanceModelPath]";
    __int16 v9 = 2112;
    unint64_t v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s CSSmartSiriVolumeSentinel using distance model: %@",  (uint8_t *)&v7,  0x16u);
  }

- (void)resetDistanceParameters
{
  self->_distanceChannelCount = +[CSAsset SSVDefaultDistanceChannelCount]( &OBJC_CLASS___CSAsset,  "SSVDefaultDistanceChannelCount");
  self->_recentSpeakerDistanceUpdatedAtMachTime = 0LL;
}

- (void)createDSPAccelerateSetupForSound:(int64_t)a3
{
  if (a3 == 1)
  {
    unsigned int v13 = +[CSAsset SSVDefaultLKFSChannelCount](&OBJC_CLASS___CSAsset, "SSVDefaultLKFSChannelCount");
    self->_vDSP_Length musicChannelCount = v13;
    sub_10001EAC8((char **)&self->_musicDSPCoefs, 5LL * v13);
    if (self->_musicChannelCount)
    {
      uint64_t v14 = 0LL;
      vDSP_Length v15 = 0LL;
      do
      {
        begin = self->_musicDSPSingleChannelCoefs.__begin_;
        uint64_t v17 = &self->_musicDSPCoefs.__begin_[v14];
        __int128 v18 = *(_OWORD *)begin;
        __int128 v19 = *((_OWORD *)begin + 1);
        v17[4] = begin[4];
        *(_OWORD *)uint64_t v17 = v18;
        *((_OWORD *)v17 + 1) = v19;
        ++v15;
        vDSP_Length musicChannelCount = self->_musicChannelCount;
        v14 += 5LL;
      }

      while (v15 < musicChannelCount);
    }

    else
    {
      vDSP_Length musicChannelCount = 0LL;
    }

    self->_musicDSPConfig = vDSP_biquadm_CreateSetup(self->_musicDSPCoefs.__begin_, 1uLL, musicChannelCount);
    v24 = operator new(0x48uLL);
    sub_10001EBC8((uint64_t)v24, (float)self->kSSVCAMusicResultsBufferSize);
    value = self->_musicBuffer.__ptr_.__value_;
    self->_musicBuffer.__ptr_.__value_ = v24;
    if (value) {
      goto LABEL_18;
    }
  }

  else
  {
    if (!a3)
    {
      unsigned int v5 = +[CSAsset SSVDefaultNoiseChannelCount](&OBJC_CLASS___CSAsset, "SSVDefaultNoiseChannelCount");
      self->_vDSP_Length noiseChannelCount = v5;
      sub_10001EAC8((char **)&self->_noiseDSPCoefs, 5LL * v5);
      if (self->_noiseChannelCount)
      {
        uint64_t v6 = 0LL;
        vDSP_Length v7 = 0LL;
        do
        {
          float v8 = self->_noiseDSPSingleChannelCoefs.__begin_;
          __int16 v9 = &self->_noiseDSPCoefs.__begin_[v6];
          __int128 v10 = *(_OWORD *)v8;
          __int128 v11 = *((_OWORD *)v8 + 1);
          v9[4] = v8[4];
          *(_OWORD *)__int16 v9 = v10;
          *((_OWORD *)v9 + 1) = v11;
          ++v7;
          vDSP_Length noiseChannelCount = self->_noiseChannelCount;
          v6 += 5LL;
        }

        while (v7 < noiseChannelCount);
      }

      else
      {
        vDSP_Length noiseChannelCount = 0LL;
      }

      self->_noiseDSPConfig = vDSP_biquadm_CreateSetup(self->_noiseDSPCoefs.__begin_, 1uLL, noiseChannelCount);
      v22 = operator new(0x48uLL);
      sub_10001EBC8((uint64_t)v22, (float)self->kSSVCANoiseResultsBufferSize);
      value = self->_noiseBuffer.__ptr_.__value_;
      self->_noiseBuffer.__ptr_.__value_ = v22;
      if (!value) {
        return;
      }
LABEL_18:
      sub_10001DF1C(value);
      return;
    }

    uint64_t v21 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315394;
      uint64_t v26 = "-[CSSmartSiriVolumeSentinel createDSPAccelerateSetupForSound:]";
      __int16 v27 = 2050;
      int64_t v28 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s CSSmartSiriVolumeSentinel Unknown Sound Type: %{public}ld",  (uint8_t *)&v25,  0x16u);
    }
  }

- (void)_resetDistance
{
  int v3 = objc_alloc_init(&OBJC_CLASS___MLModelConfiguration);
  soundClassificationModelConfig = self->_soundClassificationModelConfig;
  self->_soundClassificationModelConfig = v3;

  -[MLModelConfiguration setComputeUnits:](self->_soundClassificationModelConfig, "setComputeUnits:", 0LL);
  distanceModelPath = self->_distanceModelPath;
  uint64_t v6 = self->_soundClassificationModelConfig;
  id v21 = 0LL;
  vDSP_Length v7 = (MLModel *)objc_claimAutoreleasedReturnValue( +[MLModel modelWithContentsOfURL:configuration:error:]( &OBJC_CLASS___MLModel,  "modelWithContentsOfURL:configuration:error:",  distanceModelPath,  v6,  &v21));
  id v8 = v21;
  soundClassificationModel = self->_soundClassificationModel;
  self->_soundClassificationModel = v7;

  if (v8)
  {
    __int128 v10 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CSSmartSiriVolumeSentinel _resetDistance]";
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s CSSmartSiriVolumeSentinel distance estimation model returned during initialization: %@",  buf,  0x16u);
    }
  }

  __int128 v11 = -[SNClassifySoundRequest initWithMLModel:error:]( objc_alloc(&OBJC_CLASS___SNClassifySoundRequest),  "initWithMLModel:error:",  self->_soundClassificationModel,  0LL);
  classifySoundRequest = self->_classifySoundRequest;
  self->_classifySoundRequest = v11;

  CMTimeMake(&v20, self->kSSVCADistanceInputBufferDurationSeconds, 1);
  CMTime v19 = v20;
  -[SNClassifySoundRequest setWindowDuration:](self->_classifySoundRequest, "setWindowDuration:", &v19);
  -[SNClassifySoundRequest setOverlapFactor:](self->_classifySoundRequest, "setOverlapFactor:", 0.0);
  unsigned int v13 = -[AVAudioChannelLayout initWithLayoutTag:]( objc_alloc(&OBJC_CLASS___AVAudioChannelLayout),  "initWithLayoutTag:",  self->_distanceChannelCount | 0x930000);
  speechDistanceChannelLayout = self->_speechDistanceChannelLayout;
  self->_speechDistanceChannelLayout = v13;

  vDSP_Length v15 = objc_alloc(&OBJC_CLASS___AVAudioFormat);
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  uint64_t v17 = -[AVAudioFormat initStandardFormatWithSampleRate:channelLayout:]( v15,  "initStandardFormatWithSampleRate:channelLayout:",  self->_speechDistanceChannelLayout,  v16);
  speechDistanceAudioFmt = self->_speechDistanceAudioFmt;
  self->_speechDistanceAudioFmt = v17;

  self->_recentSpeakerDistance = 0LL;
  self->_recentSpeakerDistanceUpdatedAtMachTime = 0LL;
}

- (void)_reset
{
  noiseDSPConfig = self->_noiseDSPConfig;
  if (noiseDSPConfig) {
    vDSP_biquadm_ResetState(noiseDSPConfig);
  }
  musicDSPConfig = self->_musicDSPConfig;
  if (musicDSPConfig) {
    vDSP_biquadm_ResetState(musicDSPConfig);
  }
  value = self->_musicBuffer.__ptr_.__value_;
  value[3] = 0LL;
  value[4] = 0LL;
  uint64_t v6 = self->_noiseBuffer.__ptr_.__value_;
  v6[3] = 0LL;
  v6[4] = 0LL;
}

- (void)updateSpeechAndMusicStrengthsForVoiceTriggerStartingAtSample:(unint64_t)a3 andEndingAtSample:(unint64_t)a4 andVoiceTriggerMachTime:(unint64_t)a5
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001EA2C;
  v6[3] = &unk_10022B8D8;
  v6[4] = self;
  v6[5] = a5;
  v6[6] = a3;
  v6[7] = a4;
  dispatch_async(mainQueue, v6);
}

- (void)_updateSpeechStrengthForVoiceTriggerStartingAtSample:(unint64_t)a3 andEndingAtSample:(unint64_t)a4
{
  uint64_t v6 = self;
  unint64_t kSSVCANoiseResultsBufferSize = self->kSSVCANoiseResultsBufferSize;
  if (kSSVCANoiseResultsBufferSize >> 60) {
    size_t v8 = -1LL;
  }
  else {
    size_t v8 = 16 * kSSVCANoiseResultsBufferSize;
  }
  __int16 v9 = (char *)operator new[](v8);
  __int128 v10 = v9;
  if (kSSVCANoiseResultsBufferSize)
  {
    __int128 v11 = v9;
    do
    {
      *(void *)__int128 v11 = 0LL;
      *((_DWORD *)v11 + 2) = 0;
      v11 += 16;
    }

    while (v11 != &v9[16 * kSSVCANoiseResultsBufferSize]);
  }

  value = (uint64_t *)v6->_noiseBuffer.__ptr_.__value_;
  if (!value)
  {
    CMTime v19 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSSmartSiriVolumeSentinel _updateSpeechStrengthForVoiceTriggerStartingAtSample:andEndingAtSample:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s CSSmartSiriVolumeSentinel noiseBuffer not allocated",  buf,  0xCu);
    }

    __int128 v18 = 0LL;
    goto LABEL_46;
  }

  unint64_t v13 = value[4];
  unint64_t v14 = value[2];
  BOOL v25 = v13 >= v14;
  unint64_t v15 = v13 - v14;
  if (v25) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = 0LL;
  }
  sub_10001E1A8(buf, value, v16, value[4]);
  uint64_t v17 = *(char **)buf;
  operator delete[](v10);
  if (v13 == v16)
  {
    __int128 v18 = 0LL;
LABEL_45:
    __int128 v10 = v17;
LABEL_46:
    float kSSVCADefaultSpeechStrength = v6->kSSVCADefaultSpeechStrength;
    uint64_t v17 = v10;
    goto LABEL_47;
  }

  uint64_t v40 = v6;
  __int128 v18 = 0LL;
  CMTime v20 = 0LL;
  unint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  unint64_t v23 = v13 - v16;
  do
  {
    unint64_t v24 = *(void *)&v17[16 * v22];
    BOOL v25 = v24 <= a3 || v24 >= a4;
    if (!v25)
    {
      uint64_t v26 = &v17[16 * v22 + 8];
      if ((unint64_t)v20 >= v21)
      {
        uint64_t v27 = (v20 - v18) >> 2;
        unint64_t v28 = v27 + 1;
        else {
          unint64_t v29 = v28;
        }
        if (v29) {
          unint64_t v29 = (unint64_t)sub_10001E95C(v29);
        }
        else {
          uint64_t v30 = 0LL;
        }
        v31 = (char *)(v29 + 4 * v27);
        *(_DWORD *)v31 = *(_DWORD *)v26;
        v32 = v31 + 4;
        while (v20 != v18)
        {
          int v33 = *((_DWORD *)v20 - 1);
          v20 -= 4;
          *((_DWORD *)v31 - 1) = v33;
          v31 -= 4;
        }

        unint64_t v21 = v29 + 4 * v30;
        if (v18) {
          operator delete(v18);
        }
        __int128 v18 = v31;
        CMTime v20 = v32;
      }

      else
      {
        *(_DWORD *)CMTime v20 = *(_DWORD *)v26;
        v20 += 4;
      }
    }

    ++v22;
  }

  while (v22 != v23);
  uint64_t v6 = v40;
  if (v20 == v18) {
    goto LABEL_45;
  }
  unint64_t v34 = (v20 - v18) >> 2;
  if (v34 <= 1) {
    unint64_t v34 = 1LL;
  }
  double v35 = 0.0;
  float v36 = 0.0;
  v37 = (float *)v18;
  do
  {
    float v38 = *v37++;
    float v36 = v36 + v38;
    double v35 = v35 + 1.0;
    --v34;
  }

  while (v34);
  float kSSVCADefaultSpeechStrength = v36 / v35;
LABEL_47:
  v6->_recentSpeechStrength = kSSVCADefaultSpeechStrength;
  if (v17) {
    operator delete[](v17);
  }
  if (v18) {
    operator delete(v18);
  }
}

- (void)_updateMusicStrengthForVoiceTriggerStartingAtSample:(unint64_t)a3 andEndingAtSample:(unint64_t)a4
{
  uint64_t v6 = self;
  unint64_t kSSVCAMusicResultsBufferSize = self->kSSVCAMusicResultsBufferSize;
  if (kSSVCAMusicResultsBufferSize >> 60) {
    size_t v8 = -1LL;
  }
  else {
    size_t v8 = 16 * kSSVCAMusicResultsBufferSize;
  }
  __int16 v9 = (char *)operator new[](v8);
  __int128 v10 = v9;
  if (kSSVCAMusicResultsBufferSize)
  {
    __int128 v11 = v9;
    do
    {
      *(void *)__int128 v11 = 0LL;
      *((_DWORD *)v11 + 2) = 0;
      v11 += 16;
    }

    while (v11 != &v9[16 * kSSVCAMusicResultsBufferSize]);
  }

  value = (uint64_t *)v6->_musicBuffer.__ptr_.__value_;
  uint64_t v41 = v6;
  if (!value)
  {
    CMTime v20 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSSmartSiriVolumeSentinel _updateMusicStrengthForVoiceTriggerStartingAtSample:andEndingAtSample:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s CSSmartSiriVolumeSentinel musicBuffer not allocated",  buf,  0xCu);
    }

    CMTime v19 = 0LL;
    uint64_t v6 = v41;
    goto LABEL_47;
  }

  unint64_t v13 = value[4];
  unint64_t v14 = value[2];
  BOOL v15 = v13 >= v14;
  unint64_t v16 = v13 - v14;
  if (v15) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = 0LL;
  }
  sub_10001E1A8(buf, value, v17, value[4]);
  __int128 v18 = *(char **)buf;
  operator delete[](v10);
  if (v13 == v17)
  {
    CMTime v19 = 0LL;
LABEL_46:
    __int128 v10 = v18;
LABEL_47:
    float kSSVCADefaultMusicStrength = v6->kSSVCADefaultMusicStrength;
    __int128 v18 = v10;
    goto LABEL_48;
  }

  CMTime v19 = 0LL;
  unint64_t v21 = 0LL;
  unint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  unint64_t v24 = v13 - v17;
  do
  {
    unint64_t v25 = *(void *)&v18[16 * v23];
    if (v25 < a4 && v25 > a3 - v6->_musicHistoricalSampleCount)
    {
      uint64_t v27 = &v18[16 * v23 + 8];
      if ((unint64_t)v21 >= v22)
      {
        uint64_t v28 = (v21 - v19) >> 2;
        unint64_t v29 = v28 + 1;
        else {
          unint64_t v30 = v29;
        }
        if (v30) {
          unint64_t v30 = (unint64_t)sub_10001E95C(v30);
        }
        else {
          uint64_t v31 = 0LL;
        }
        v32 = (char *)(v30 + 4 * v28);
        *(_DWORD *)v32 = *(_DWORD *)v27;
        int v33 = v32 + 4;
        while (v21 != v19)
        {
          int v34 = *((_DWORD *)v21 - 1);
          v21 -= 4;
          *((_DWORD *)v32 - 1) = v34;
          v32 -= 4;
        }

        unint64_t v22 = v30 + 4 * v31;
        if (v19) {
          operator delete(v19);
        }
        CMTime v19 = v32;
        unint64_t v21 = v33;
        uint64_t v6 = v41;
      }

      else
      {
        *(_DWORD *)unint64_t v21 = *(_DWORD *)v27;
        v21 += 4;
      }
    }

    ++v23;
  }

  while (v23 != v24);
  if (v21 == v19) {
    goto LABEL_46;
  }
  unint64_t v35 = (v21 - v19) >> 2;
  if (v35 <= 1) {
    unint64_t v35 = 1LL;
  }
  double v36 = 0.0;
  float v37 = 0.0;
  float v38 = (float *)v19;
  do
  {
    float v39 = *v38++;
    float v37 = v37 + v39;
    double v36 = v36 + 1.0;
    --v35;
  }

  while (v35);
  float kSSVCADefaultMusicStrength = v37 / v36;
LABEL_48:
  v6->_recentMusicStrength = kSSVCADefaultMusicStrength;
  if (v18) {
    operator delete[](v18);
  }
  if (v19) {
    operator delete(v19);
  }
}

- (void)_updateNoiseActivityForVoiceTriggerStartingAtSample:(unint64_t)a3
{
  unint64_t kSSVCANoiseResultsBufferSize = self->kSSVCANoiseResultsBufferSize;
  if (kSSVCANoiseResultsBufferSize >> 60) {
    size_t v6 = -1LL;
  }
  else {
    size_t v6 = 16 * kSSVCANoiseResultsBufferSize;
  }
  vDSP_Length v7 = (char *)operator new[](v6);
  size_t v8 = v7;
  if (kSSVCANoiseResultsBufferSize)
  {
    __int16 v9 = v7;
    do
    {
      *(void *)__int16 v9 = 0LL;
      *((_DWORD *)v9 + 2) = 0;
      v9 += 16;
    }

    while (v9 != &v7[16 * kSSVCANoiseResultsBufferSize]);
  }

  value = (uint64_t *)self->_noiseBuffer.__ptr_.__value_;
  if (value)
  {
    unint64_t v11 = value[4];
    unint64_t v12 = value[2];
    BOOL v13 = v11 >= v12;
    unint64_t v14 = v11 - v12;
    if (v13) {
      unint64_t v15 = v14;
    }
    else {
      unint64_t v15 = 0LL;
    }
    sub_10001E1A8(v42, value, v15, value[4]);
    unint64_t v16 = *(void **)v42;
    operator delete[](v8);
    if (v11 == v15)
    {
      unint64_t v17 = 0LL;
      __int128 v18 = 0LL;
    }

    else
    {
      unint64_t v17 = 0LL;
      __int128 v18 = 0LL;
      unint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      unint64_t v22 = v11 - v15;
      do
      {
        if (v16[2 * v21] < a3)
        {
          uint64_t v23 = &v16[2 * v21 + 1];
          if ((unint64_t)v18 >= v20)
          {
            uint64_t v24 = (v18 - v17) >> 2;
            unint64_t v25 = v24 + 1;
            else {
              unint64_t v26 = v25;
            }
            if (v26) {
              unint64_t v26 = (unint64_t)sub_10001E95C(v26);
            }
            else {
              uint64_t v27 = 0LL;
            }
            uint64_t v28 = (char *)(v26 + 4 * v24);
            *(_DWORD *)uint64_t v28 = *v23;
            unint64_t v29 = v28 + 4;
            while (v18 != v17)
            {
              int v30 = *((_DWORD *)v18 - 1);
              v18 -= 4;
              *((_DWORD *)v28 - 1) = v30;
              v28 -= 4;
            }

            unint64_t v20 = v26 + 4 * v27;
            if (v17) {
              operator delete(v17);
            }
            unint64_t v17 = v28;
            __int128 v18 = v29;
          }

          else
          {
            *(_DWORD *)__int128 v18 = *v23;
            v18 += 4;
          }
        }

        ++v21;
      }

      while (v21 != v22);
    }

    size_t v8 = v16;
  }

  else
  {
    CMTime v19 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v42 = 136315138;
      *(void *)&v42[4] = "-[CSSmartSiriVolumeSentinel _updateNoiseActivityForVoiceTriggerStartingAtSample:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s CSSmartSiriVolumeSentinel noiseBuffer not allocated",  v42,  0xCu);
    }

    unint64_t v17 = 0LL;
    __int128 v18 = 0LL;
  }

  unint64_t kSSVCANoiseActivityHistoricalSampleCount = self->kSSVCANoiseActivityHistoricalSampleCount;
  unint64_t v32 = (v18 - v17) >> 2;
  if (kSSVCANoiseActivityHistoricalSampleCount < v32)
  {
    int v33 = &v17[4 * v32 + -4 * kSSVCANoiseActivityHistoricalSampleCount];
    if (v17 != v33)
    {
      uint64_t v34 = v18 - v33;
      if (v18 != v33) {
        memmove(v17, v33, v18 - v33);
      }
      unint64_t v32 = v34 >> 2;
      __int128 v18 = &v17[v34 & 0xFFFFFFFFFFFFFFFCLL];
    }
  }

  if (v18 == v17)
  {
    unint64_t first = self->_defaultNoiseActivity.first;
    float second = self->_defaultNoiseActivity.second;
  }

  else
  {
    unint64_t first = 0LL;
    if (v32 <= 1) {
      unint64_t v32 = 1LL;
    }
    float v36 = 0.0;
    float v37 = (float *)v17;
    unint64_t v38 = v32;
    do
    {
      float v39 = *v37++;
      float v40 = v39;
      if (v39 > self->kSSVCANoiseActivityThreshold) {
        ++first;
      }
      float v36 = v36 + v40;
      --v38;
    }

    while (v38);
    float second = v36 / (float)v32;
  }

  self->_recentNoiseActivity.unint64_t first = first;
  self->_recentNoiseActivity.float second = second;
  if (v8) {
    operator delete[](v8);
  }
  if (v17) {
    operator delete(v17);
  }
}

- (float)getSpeechLevelForLastVoiceTrigger
{
  return self->_recentSpeechStrength;
}

- (float)getMusicLevelForLastVoiceTrigger
{
  return self->_recentMusicStrength;
}

- (pair<unsigned)getNoiseActivityForLastVoiceTrigger
{
  uint64_t v2 = *(void *)&self->_recentNoiseActivity.second;
  unint64_t first = self->_recentNoiseActivity.first;
  result.float second = *(float *)&v2;
  result.unint64_t first = first;
  return result;
}

- (unint64_t)getVoiceTriggerTimeForLastVoiceTrigger
{
  return self->_lastVoiceTriggerMachTime;
}

- (int64_t)getDistanceForLastVoiceTrigger
{
  uint64_t v6 = 0LL;
  vDSP_Length v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 3LL;
  distanceEstimationQueue = (dispatch_queue_s *)self->_distanceEstimationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001E774;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(distanceEstimationQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setLastVoiceTriggerMachTime:(unint64_t)a3
{
  self->_lastVoiceTriggerMachTime = a3;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 classifications]);
  vDSP_Length v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  distanceEstimationQueue = (dispatch_queue_s *)self->_distanceEstimationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001E514;
  v10[3] = &unk_10022EFD0;
  id v11 = v7;
  unint64_t v12 = self;
  id v9 = v7;
  dispatch_async(distanceEstimationQueue, v10);
}

- (void)analyzeAudioBufferForSoundType:(int64_t)a3 data:(const float *)a4 numSamples:(unint64_t)a5 startSampleCount:(unint64_t)a6
{
  if (a3 == 2)
  {
    -[CSSmartSiriVolumeSentinel _analyzeAudioBufferForDistance:numSamples:startSampleCount:]( self,  "_analyzeAudioBufferForDistance:numSamples:startSampleCount:",  a4,  a5,  a6);
  }

  else if (a3 == 1)
  {
    -[CSSmartSiriVolumeSentinel _analyzeAudioBufferForMusic:numSamples:startSampleCount:]( self,  "_analyzeAudioBufferForMusic:numSamples:startSampleCount:",  a4,  a5,  a6);
  }

  else if (a3)
  {
    vDSP_Length v7 = (os_log_s *)CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[CSSmartSiriVolumeSentinel analyzeAudioBufferForSoundType:data:numSamples:startSampleCount:]";
      __int16 v10 = 2050;
      int64_t v11 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s CSSmartSiriVolumeSentinel Unknown Sound Type: %{public}ld",  (uint8_t *)&v8,  0x16u);
    }
  }

  else
  {
    -[CSSmartSiriVolumeSentinel _analyzeAudioBufferForNoise:numSamples:startSampleCount:]( self,  "_analyzeAudioBufferForNoise:numSamples:startSampleCount:",  a4,  a5,  a6);
  }

- (void)setupDistanceAudioStreamAnalyzer
{
  int64_t v3 = -[SNAudioStreamAnalyzer initWithFormat:]( objc_alloc(&OBJC_CLASS___SNAudioStreamAnalyzer),  "initWithFormat:",  self->_speechDistanceAudioFmt);
  speechDistanceStreamAnalyzer = self->_speechDistanceStreamAnalyzer;
  self->_speechDistanceStreamAnalyzer = v3;

  -[SNAudioStreamAnalyzer addRequest:withObserver:error:]( self->_speechDistanceStreamAnalyzer,  "addRequest:withObserver:error:",  self->_classifySoundRequest,  self,  0LL);
}

- (void)_analyzeAudioBufferForDistance:(const float *)a3 numSamples:(unint64_t)a4 startSampleCount:(unint64_t)a5
{
  id v9 = objc_autoreleasePoolPush();
  __int16 v10 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]( objc_alloc(&OBJC_CLASS___AVAudioPCMBuffer),  "initWithPCMFormat:frameCapacity:",  self->_speechDistanceAudioFmt,  a4);
  -[AVAudioPCMBuffer setFrameLength:](v10, "setFrameLength:", a4);
  if (self->_distanceChannelCount)
  {
    unint64_t v11 = 0LL;
    size_t v12 = 4 * a4;
    uint64_t v13 = 16LL;
    do
    {
      memcpy( *(void **)((char *)-[AVAudioPCMBuffer mutableAudioBufferList](v10, "mutableAudioBufferList") + v13),  a3,  v12);
      ++v11;
      a3 = (const float *)((char *)a3 + v12);
      v13 += 16LL;
    }

    while (v11 < self->_distanceChannelCount);
  }

  -[SNAudioStreamAnalyzer analyzeAudioBuffer:atAudioFramePosition:]( self->_speechDistanceStreamAnalyzer,  "analyzeAudioBuffer:atAudioFramePosition:",  v10,  a5);

  objc_autoreleasePoolPop(v9);
}

- (void)_analyzeAudioBufferForNoise:(const float *)a3 numSamples:(unint64_t)a4 startSampleCount:(unint64_t)a5
{
  float __C = 0.0;
  if (self->_noiseDSPConfig)
  {
    __chkstk_darwin();
    __int16 v10 = (char *)&__src - ((v9 + 15) & 0xFFFFFFFF0LL);
    uint64_t noiseChannelCount = self->_noiseChannelCount;
    if ((_DWORD)noiseChannelCount)
    {
      size_t v12 = v10;
      do
      {
        *v12++ = v8;
        v8 += 4 * a4;
        --noiseChannelCount;
      }

      while (noiseChannelCount);
      unint64_t v13 = 0LL;
      float v14 = 0.0;
      do
      {
        vDSP_rmsqv(*(const float **)&v10[8 * v13], 1LL, &__C, a4);
        float v14 = v14 + __C;
        ++v13;
        unint64_t v15 = self->_noiseChannelCount;
      }

      while (v13 < v15);
      float v16 = v14 / (float)v15;
    }

    else
    {
      float v16 = NAN;
    }
  }

  else
  {
    float v16 = 0.0;
  }

  unint64_t __src = a5;
  self->_latestNoiseBufferSampleCount = a5 + a4;
  float v18 = v16;
  sub_10001E3C0((unint64_t *)self->_noiseBuffer.__ptr_.__value_, (char *)&__src, 1uLL);
}

- (void)_analyzeAudioBufferForMusic:(const float *)a3 numSamples:(unint64_t)a4 startSampleCount:(unint64_t)a5
{
  float __C = 0.0;
  if (self->_musicDSPConfig)
  {
    __chkstk_darwin();
    __int16 v10 = (char *)&__src - ((v9 + 15) & 0xFFFFFFFF0LL);
    uint64_t musicChannelCount = self->_musicChannelCount;
    if ((_DWORD)musicChannelCount)
    {
      size_t v12 = v10;
      do
      {
        *v12++ = v8;
        v8 += 4 * a4;
        --musicChannelCount;
      }

      while (musicChannelCount);
      unint64_t v13 = 0LL;
      float v14 = 0.0;
      do
      {
        vDSP_rmsqv(*(const float **)&v10[8 * v13], 1LL, &__C, a4);
        float v14 = v14 + __C;
        ++v13;
        unint64_t v15 = self->_musicChannelCount;
      }

      while (v13 < v15);
      float v16 = v14 / (float)v15;
    }

    else
    {
      float v16 = NAN;
    }
  }

  else
  {
    float v16 = 0.0;
  }

  unint64_t __src = a5;
  float v18 = v16;
  sub_10001E3C0((unint64_t *)self->_musicBuffer.__ptr_.__value_, (char *)&__src, 1uLL);
}

- (float)getMeanBufferStrengthForSoundType:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v5 = 40LL;
LABEL_5:
    unint64_t v6 = (unint64_t)(&self->super.isa)[v5];
    if (v6 >> 60) {
      size_t v7 = -1LL;
    }
    else {
      size_t v7 = 16 * v6;
    }
    uint64_t v8 = (char *)operator new[](v7);
    uint64_t v9 = v8;
    if (v6)
    {
      __int16 v10 = v8;
      do
      {
        *(void *)__int16 v10 = 0LL;
        *((_DWORD *)v10 + 2) = 0;
        v10 += 16;
      }

      while (v10 != &v8[16 * v6]);
    }

    if (a3)
    {
      value = (uint64_t *)self->_musicBuffer.__ptr_.__value_;
      if (value)
      {
        unint64_t v12 = value[4];
        unint64_t v13 = value[2];
        BOOL v14 = v12 >= v13;
        unint64_t v15 = v12 - v13;
        if (v14) {
          unint64_t v16 = v15;
        }
        else {
          unint64_t v16 = 0LL;
        }
        goto LABEL_22;
      }

      unint64_t v26 = (os_log_s *)CSLogCategoryASV;
      float v18 = 0.0;
      if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unint64_t v29 = 136315138;
        *(void *)&v29[4] = "-[CSSmartSiriVolumeSentinel getMeanBufferStrengthForSoundType:]";
        uint64_t v27 = "%s CSSmartSiriVolumeSentinel musicBuffer not allocated";
        goto LABEL_32;
      }
    }

    else
    {
      value = (uint64_t *)self->_noiseBuffer.__ptr_.__value_;
      if (value)
      {
        unint64_t v12 = value[4];
        unint64_t v19 = value[2];
        BOOL v14 = v12 >= v19;
        unint64_t v20 = v12 - v19;
        if (v14) {
          unint64_t v16 = v20;
        }
        else {
          unint64_t v16 = 0LL;
        }
LABEL_22:
        sub_10001E1A8(v29, value, v16, value[4]);
        unint64_t v21 = v12 - v16;
        unint64_t v22 = *(char **)v29;
        operator delete[](v9);
        uint64_t v9 = v22;
        if (v21)
        {
          float v23 = 0.0;
          uint64_t v24 = 8LL;
          unint64_t v25 = v21;
          do
          {
            float v23 = v23 + *(float *)&v22[v24];
            v24 += 16LL;
            --v25;
          }

          while (v25);
          float v18 = v23 / (float)v21;
        }

        else
        {
          float v18 = 0.0;
          if (!v22) {
            return v18;
          }
        }

        goto LABEL_33;
      }

      unint64_t v26 = (os_log_s *)CSLogCategoryASV;
      float v18 = 0.0;
      if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unint64_t v29 = 136315138;
        *(void *)&v29[4] = "-[CSSmartSiriVolumeSentinel getMeanBufferStrengthForSoundType:]";
        uint64_t v27 = "%s CSSmartSiriVolumeSentinel noiseBuffer not allocated";
LABEL_32:
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v27, v29, 0xCu);
      }
    }

- (void)resetMusicBuffer
{
  value = self->_musicBuffer.__ptr_.__value_;
  value[3] = 0LL;
  value[4] = 0LL;
}

- (void)notifySiriSessionStateTTSOngoing:(BOOL)a3
{
  mainQueue = (dispatch_queue_s *)self->_mainQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001DF5C;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mainQueue, v4);
}

- (void).cxx_destruct
{
  value = self->_musicBuffer.__ptr_.__value_;
  self->_musicBuffer.__ptr_.__value_ = 0LL;
  if (value) {
    sub_10001DF1C(value);
  }
  float v4 = self->_noiseBuffer.__ptr_.__value_;
  self->_noiseBuffer.__ptr_.__value_ = 0LL;
  if (v4) {
    sub_10001DF1C(v4);
  }
  begin = self->_musicDSPCoefs.__begin_;
  if (begin)
  {
    self->_musicDSPCoefs.__end_ = begin;
    operator delete(begin);
  }

  unint64_t v6 = self->_noiseDSPCoefs.__begin_;
  if (v6)
  {
    self->_noiseDSPCoefs.__end_ = v6;
    operator delete(v6);
  }

  size_t v7 = self->_musicDSPSingleChannelCoefs.__begin_;
  if (v7)
  {
    self->_musicDSPSingleChannelCoefs.__end_ = v7;
    operator delete(v7);
  }

  uint64_t v8 = self->_noiseDSPSingleChannelCoefs.__begin_;
  if (v8)
  {
    self->_noiseDSPSingleChannelCoefs.__end_ = v8;
    operator delete(v8);
  }

  objc_storeStrong((id *)&self->_speechDistanceChannelLayout, 0LL);
  objc_storeStrong((id *)&self->_speechDistanceAudioFmt, 0LL);
  objc_storeStrong((id *)&self->_speechDistanceStreamAnalyzer, 0LL);
  objc_storeStrong((id *)&self->_soundClassificationModel, 0LL);
  objc_storeStrong((id *)&self->_soundClassificationModelConfig, 0LL);
  objc_storeStrong((id *)&self->_distanceModelPath, 0LL);
  objc_storeStrong((id *)&self->_classifySoundRequest, 0LL);
  objc_storeStrong((id *)&self->_distanceEstimationQueue, 0LL);
  objc_storeStrong((id *)&self->_mainQueue, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0LL;
  *((_DWORD *)self + 36) = 0;
  *((void *)self + 19) = 0LL;
  *((_DWORD *)self + 40) = 0;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  return self;
}

@end