@interface CSContinuousAudioFingerprintProvider
- (BOOL)isListenPollingStarting;
- (CSAudioCircularBuffer)audioLoggingBuffer;
- (CSAudioStream)audioStream;
- (CSContinuousAudioFingerprintProvider)init;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSPolicy)enablePolicy;
- (NSHashTable)observers;
- (NSMutableDictionary)inUseServices;
- (OS_dispatch_queue)queue;
- (SHMutableSignature)fingerprintBuffer;
- (float)currentMaximumBufferSize;
- (unint64_t)frameSkipCounter;
- (unint64_t)frameSkipRate;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_handleEnablePolicyEvent:(BOOL)a3;
- (void)_reset;
- (void)_setMaximumBufferSizeFromInUseServices;
- (void)_startListenPolling;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopListening;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)registerObserver:(id)a3;
- (void)reset;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioLoggingBuffer:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setCurrentMaximumBufferSize:(float)a3;
- (void)setEnablePolicy:(id)a3;
- (void)setFingerprintBuffer:(id)a3;
- (void)setFrameSkipCounter:(unint64_t)a3;
- (void)setFrameSkipRate:(unint64_t)a3;
- (void)setInUseServices:(id)a3;
- (void)setIsListenPollingStarting:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)startWithUUID:(id)a3 withMaximumBufferSize:(float)a4;
- (void)stopWithUUID:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSContinuousAudioFingerprintProvider

- (CSContinuousAudioFingerprintProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSContinuousAudioFingerprintProvider;
  v2 = -[CSContinuousAudioFingerprintProvider init](&v13, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("CSContinuousAudioFingerprintProvider", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v2->_isListenPollingStarting = 0;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    inUseServices = v2->_inUseServices;
    v2->_inUseServices = v9;

    +[CSConfig defaultContinuousFingerprintBufferDuration]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDuration");
    *(float *)&double v11 = v11;
    v2->_currentMaximumBufferSize = *(float *)&v11;
    v2->_frameSkipCounter = 0LL;
  }

  return v2;
}

- (void)_setMaximumBufferSizeFromInUseServices
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v3 = self->_inUseServices;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    float v7 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_inUseServices,  "objectForKey:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11));
        if (v7 < (float)(int)[v9 intValue])
        {
          [v9 floatValue];
          float v7 = v10;
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  else
  {
    float v7 = 0.0;
  }

  self->_currentMaximumBufferSize = v7;
}

- (void)startWithUUID:(id)a3 withMaximumBufferSize:(float)a4
{
  id v6 = a3;
  float v7 = v6;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001251E4;
    block[3] = &unk_10022DE98;
    block[4] = self;
    id v11 = v6;
    float v12 = a4;
    dispatch_async(queue, block);
  }

  else
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v14 = "-[CSContinuousAudioFingerprintProvider startWithUUID:withMaximumBufferSize:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s UUID was nil will not start fingerprint provider",  buf,  0xCu);
    }
  }
}

- (void)stopWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100125004;
    v8[3] = &unk_10022EFD0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }

  else
  {
    float v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CSContinuousAudioFingerprintProvider stopWithUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s UUID was nil will not stop fingerprint provider",  buf,  0xCu);
    }
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100124EE4;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100124E38;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124E30;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  uint64_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    double currentMaximumBufferSize = self->_currentMaximumBufferSize;
    int v9 = 136315394;
    float v10 = "-[CSContinuousAudioFingerprintProvider _reset]";
    __int16 v11 = 2048;
    double v12 = currentMaximumBufferSize;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Resetting ContinuousAudioFingerprintProvider with buffer size: %f",  (uint8_t *)&v9,  0x16u);
  }

  id v5 = -[SHMutableSignature initWithMaximumSeconds:clipStyle:]( objc_alloc(&OBJC_CLASS___SHMutableSignature),  "initWithMaximumSeconds:clipStyle:",  1LL,  self->_currentMaximumBufferSize);
  fingerprintBuffer = self->_fingerprintBuffer;
  self->_fingerprintBuffer = v5;

  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    -[CSPlainAudioFileWriter endAudio](audioFileWriter, "endAudio");
    id v8 = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;
  }

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  float v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSContinuousAudioFingerprintProvider _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSContinuousAudioFingerprintProvider audioStream](self, "audioStream"));
  if ([v8 isStreaming])
  {
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSContinuousAudioFingerprintProvider enablePolicy](self, "enablePolicy"));
    unsigned int v10 = [v9 isEnabled];

    if (v10)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100124BF8;
      v12[3] = &unk_10022E628;
      v12[4] = self;
      double v14 = a3;
      id v13 = v6;
      -[CSContinuousAudioFingerprintProvider _startListenWithCompletion:](self, "_startListenWithCompletion:", v12);

      goto LABEL_11;
    }
  }

  __int16 v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSContinuousAudioFingerprintProvider _startListenPollingWithInterval:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Skip listen polling since audio is streaming / Siri disabled",  buf,  0xCu);
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
LABEL_11:
}

- (void)_startListenWithCompletion:(id)a3
{
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1001249A4;
  v38[3] = &unk_10022E650;
  id v4 = a3;
  id v39 = v4;
  id v5 = objc_retainBlock(v38);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
  float v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v37 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 audioProviderWithContext:v6 error:&v37]);
  id v9 = v37;

  if (v8)
  {
    id v10 = v8;
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v12 = [v11 isAdBlockerAudioLoggingEnabled];

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioTimeConverterPool sharedInstance]( &OBJC_CLASS___CSAudioTimeConverterPool,  "sharedInstance"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "converterForAudioStreamId:", objc_msgSend(v10, "audioStreamId")));

      v15 = objc_alloc(&OBJC_CLASS___CSAudioCircularBuffer);
      float currentMaximumBufferSize = self->_currentMaximumBufferSize;
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      LODWORD(v18) = v17;
      *(float *)&double v19 = currentMaximumBufferSize;
      v20 = -[CSAudioCircularBuffer initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:]( v15,  "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:",  1LL,  v14,  v19,  v18);
      audioLoggingBuffer = self->_audioLoggingBuffer;
      self->_audioLoggingBuffer = v20;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  v6,  v9));
    v24 = (objc_class *)objc_opt_class(self, v23);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    id v36 = 0LL;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v10 audioStreamWithRequest:v22 streamName:v26 error:&v36]);
    id v28 = v36;

    if (v27)
    {
      -[CSContinuousAudioFingerprintProvider setAudioStream:](self, "setAudioStream:", v27);
      [v27 setDelegate:self];
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1001249B8;
      v34[3] = &unk_10022E6A0;
      v34[4] = self;
      v35 = v5;
      [v27 startAudioStreamWithOption:v29 completion:v34];
    }

    else
    {
      v30 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue([v28 description]);
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSContinuousAudioFingerprintProvider _startListenWithCompletion:]";
        __int16 v42 = 2114;
        v43 = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Failed in requesting audio stream : %{public}@",  buf,  0x16u);
      }

      ((void (*)(void *, void, id))v5[2])(v5, 0LL, v28);
    }

    id v9 = v33;
  }

  else
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0LL, v9);
  }
}

- (void)_startListenPolling
{
  if (self->_isListenPollingStarting)
  {
    v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v5 = "-[CSContinuousAudioFingerprintProvider _startListenPolling]";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Already started listen polling, skip",  buf,  0xCu);
    }
  }

  else
  {
    self->_isListenPollingStarting = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100124998;
    v3[3] = &unk_10022E730;
    v3[4] = self;
    -[CSContinuousAudioFingerprintProvider _startListenPollingWithInterval:completion:]( self,  "_startListenPollingWithInterval:completion:",  v3,  1.0);
  }

- (void)_stopListening
{
  uint64_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[CSContinuousAudioFingerprintProvider _stopListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSContinuousAudioFingerprintProvider audioStream](self, "audioStream"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSContinuousAudioFingerprintProvider audioStream](self, "audioStream"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10012489C;
    v7[3] = &unk_10022E730;
    v7[4] = self;
    [v5 stopAudioStreamWithOption:0 completion:v7];
  }

  else
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[CSContinuousAudioFingerprintProvider _stopListening]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s No audio stream to stop, we shouldn't hit this",  buf,  0xCu);
    }
  }

- (void)_handleEnablePolicyEvent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSContinuousAudioFingerprintProvider _handleEnablePolicyEvent:]";
    __int16 v11 = 1026;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Siri enabled : %{public}d", buf, 0x12u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100124854;
  v7[3] = &unk_10022EFA8;
  BOOL v8 = v3;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSContinuousAudioFingerprintProvider audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v11 = 2050;
    int64_t v12 = a4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s stream stopped unexpectedly : %{public}ld",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001247E4;
  v8[3] = &unk_10022F020;
  v8[4] = self;
  void v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = qword_100280130;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_100280130, 1) <= 0x888888888888888uLL)
  {
    id v9 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      *(_DWORD *)buf = 136315650;
      v29 = "-[CSContinuousAudioFingerprintProvider audioStreamProvider:audioBufferAvailable:]";
      __int16 v30 = 1026;
      unsigned int v31 = [v7 numSamples];
      __int16 v32 = 2050;
      uint64_t v33 = qword_100280130;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s CSContinuousAudioFingerprintProvider has received %{public}d samples, heartbeat = %{public}lld",  buf,  0x1Cu);

      uint64_t v8 = qword_100280130;
    }
  }

  qword_100280130 = v8 + 1;
  unsigned int v11 = +[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat");
  int64_t v12 = objc_alloc(&OBJC_CLASS___AVAudioFormat);
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  double v14 = v13;
  if (v11) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = 3LL;
  }
  v16 = -[AVAudioFormat initWithCommonFormat:sampleRate:channels:interleaved:]( v12,  "initWithCommonFormat:sampleRate:channels:interleaved:",  v15,  1LL,  0LL,  v14);
  int v17 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]( [AVAudioPCMBuffer alloc],  "initWithPCMFormat:frameCapacity:",  v16,  [v7 numSamples]);
  -[AVAudioPCMBuffer setFrameLength:](v17, "setFrameLength:", -[AVAudioPCMBuffer frameCapacity](v17, "frameCapacity"));
  if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
  {
    double v18 = -[AVAudioPCMBuffer floatChannelData](v17, "floatChannelData");
    char v19 = 2;
  }

  else
  {
    double v18 = -[AVAudioPCMBuffer int16ChannelData](v17, "int16ChannelData");
    char v19 = 1;
  }

  v20 = *v18;
  id v21 = objc_claimAutoreleasedReturnValue([v7 dataForChannel:0]);
  memcpy(v20, [v21 bytes], (void)objc_msgSend(v7, "numSamples") << v19);

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012449C;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v26 = v7;
  v27 = v17;
  uint64_t v23 = v17;
  id v24 = v7;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[CSContinuousAudioFingerprintProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s audiomxd/bridgeaudiod recovered from crash",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100124444;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (SHMutableSignature)fingerprintBuffer
{
  return self->_fingerprintBuffer;
}

- (void)setFingerprintBuffer:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (CSAudioCircularBuffer)audioLoggingBuffer
{
  return self->_audioLoggingBuffer;
}

- (void)setAudioLoggingBuffer:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (NSMutableDictionary)inUseServices
{
  return self->_inUseServices;
}

- (void)setInUseServices:(id)a3
{
}

- (float)currentMaximumBufferSize
{
  return self->_currentMaximumBufferSize;
}

- (void)setCurrentMaximumBufferSize:(float)a3
{
  self->_float currentMaximumBufferSize = a3;
}

- (CSPolicy)enablePolicy
{
  return self->_enablePolicy;
}

- (void)setEnablePolicy:(id)a3
{
}

- (unint64_t)frameSkipCounter
{
  return self->_frameSkipCounter;
}

- (void)setFrameSkipCounter:(unint64_t)a3
{
  self->_frameSkipCounter = a3;
}

- (unint64_t)frameSkipRate
{
  return self->_frameSkipRate;
}

- (void)setFrameSkipRate:(unint64_t)a3
{
  self->_frameSkipRate = a3;
}

- (void).cxx_destruct
{
}

@end