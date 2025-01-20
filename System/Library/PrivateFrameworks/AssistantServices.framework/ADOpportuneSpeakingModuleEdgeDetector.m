@interface ADOpportuneSpeakingModuleEdgeDetector
- (ADOpportuneSpeakingModuleEdgeDetector)initWithQueue:(id)a3 stateManager:(id)a4;
- (BOOL)isListening;
- (id)modeDescriptionFor:(unint64_t)a3;
- (unsigned)_framesPerSecondForOpportuneSpeakListeningType:(unint64_t)a3;
- (void)_didStartListening;
- (void)_didStopListening;
- (void)_handleFrame:(unint64_t)a3;
- (void)_initializeVoiceThresholdsForOpportuneSpeakListeningType:(unint64_t)a3;
- (void)_resetStateWithCompletion:(id)a3;
- (void)_restartAndExtendListening;
- (void)_scheduleTimerForMaxDelay:(float)a3;
- (void)_stopListeningWithCompletion:(id)a3;
- (void)_thresholdDetected;
- (void)dealloc;
- (void)listenForPauseWithOptions:(id)a3 forPause:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8;
- (void)listenForUserSpeechWithOptions:(id)a3 forVoice:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8;
- (void)opportuneSpeakListener:(id)a3 didStopUnexpectly:(BOOL)a4;
- (void)opportuneSpeakListener:(id)a3 hasRemoteVADAvailable:(BOOL)a4;
- (void)opportuneSpeakListener:(id)a3 hasVADAvailable:(BOOL)a4 withHostTime:(float)a5;
- (void)stopListening;
- (void)updateAttendingThreshold:(float)a3;
@end

@implementation ADOpportuneSpeakingModuleEdgeDetector

- (ADOpportuneSpeakingModuleEdgeDetector)initWithQueue:(id)a3 stateManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ADOpportuneSpeakingModuleEdgeDetector;
  v9 = -[ADOpportuneSpeakingModuleEdgeDetector init](&v19, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSUUID);
    uuid = v9->_uuid;
    v9->_uuid = v10;

    *(_WORD *)&v9->_currentHasAccel = 0;
    v9->_inVoice = 0;
    *(void *)&v9->_currentPausedFrameCount = 0LL;
    v9->_currentFrameCount = 0;
    id successCompletionBlock = v9->_successCompletionBlock;
    v9->_id successCompletionBlock = 0LL;

    id failCompletionBlock = v9->_failCompletionBlock;
    v9->_id failCompletionBlock = 0LL;

    v9->_isListening = 0;
    v9->_isStopping = 0;
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v9->_stateManager, a4);
    v14 = objc_alloc_init(&OBJC_CLASS___CSOpportuneSpeakListener);
    listener = v9->_listener;
    v9->_listener = v14;

    -[CSOpportuneSpeakListener setDelegate:](v9->_listener, "setDelegate:", v9);
    listeningOptions = v9->_listeningOptions;
    v9->_listeningOptions = 0LL;

    v9->_shouldStopListeningOnDetection = 1;
    v17 = v9;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADOpportuneSpeakingModuleEdgeDetector;
  -[ADOpportuneSpeakingModuleEdgeDetector dealloc](&v3, "dealloc");
}

- (unsigned)_framesPerSecondForOpportuneSpeakListeningType:(unint64_t)a3
{
  if (!a3) {
    return 50;
  }
  if (a3 == 1) {
    return 100;
  }
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  unsigned int result = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v5 = 136315138;
    v6 = "-[ADOpportuneSpeakingModuleEdgeDetector _framesPerSecondForOpportuneSpeakListeningType:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Invalid listeningType passed to _framesPerSecondForOpportuneSpeakListeningType",  (uint8_t *)&v5,  0xCu);
    return 0;
  }

  return result;
}

- (void)_initializeVoiceThresholdsForOpportuneSpeakListeningType:(unint64_t)a3
{
  if (a3 == 1)
  {
    self->_double voiceOnMin = _AFPreferencesAnnounceCallsVoiceOnMinRatio(self, a2);
    float v5 = _AFPreferencesAnnounceCallsVoiceOffMaxRatio();
  }

  else
  {
    if (a3) {
      goto LABEL_6;
    }
    self->_double voiceOnMin = _AFPreferencesAnnounceNotificationsVoiceOnMinRatio(self, a2);
    _AFPreferencesAnnounceNotificationsVoiceOffMaxRatio();
  }

  self->_double voiceOffMax = v5;
LABEL_6:
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    double voiceOnMin = self->_voiceOnMin;
    double voiceOffMax = self->_voiceOffMax;
    int v9 = 136315906;
    v10 = "-[ADOpportuneSpeakingModuleEdgeDetector _initializeVoiceThresholdsForOpportuneSpeakListeningType:]";
    __int16 v11 = 2048;
    double v12 = voiceOnMin;
    __int16 v13 = 2048;
    double v14 = voiceOffMax;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s Using voiceOnMin: %f, voiceOffMax: %f for listening type: %lu",  (uint8_t *)&v9,  0x2Au);
  }

- (void)_resetStateWithCompletion:(id)a3
{
  id v7 = a3;
  -[ADOpportuneSpeakingModuleEdgeDetector _didStopListening](self, "_didStopListening");
  self->_isListening = 0;
  id failCompletionBlock = self->_failCompletionBlock;
  self->_id failCompletionBlock = 0LL;

  id successCompletionBlock = self->_successCompletionBlock;
  self->_id successCompletionBlock = 0LL;

  v6 = v7;
  self->_inVoice = 0;
  *(void *)&self->_currentPausedFrameCount = 0LL;
  self->_currentFrameCount = 0;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }
}

- (void)_scheduleTimerForMaxDelay:(float)a3
{
  float v5 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000C4F54;
  v9[3] = &unk_1004FD940;
  v9[4] = self;
  id v7 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v5,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  dispatchQueue,  v9,  a3);
  timer = self->_timer;
  self->_timer = v7;

  -[AFWatchdogTimer start](self->_timer, "start");
}

- (void)listenForPauseWithOptions:(id)a3 forPause:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8
{
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a8;
  id v17 = a7;
  LODWORD(a8) = -[ADOpportuneSpeakingModuleEdgeDetector _framesPerSecondForOpportuneSpeakListeningType:]( self,  "_framesPerSecondForOpportuneSpeakListeningType:",  [v15 opportuneSpeakListeningType]);
  self->_inVoice = 0;
  *(void *)&self->_currentPausedFrameCount = 0LL;
  self->_currentFrameCount = 0;
  id v18 = objc_retainBlock(v17);

  id successCompletionBlock = self->_successCompletionBlock;
  self->_id successCompletionBlock = v18;

  id v20 = objc_retainBlock(v16);
  id failCompletionBlock = self->_failCompletionBlock;
  self->_id failCompletionBlock = v20;

  self->_thresholdFrameCount = (int)(float)((float)a8 * a4);
  self->_mode = 1LL;
  self->_isListening = 1;
  self->_isStopping = 0;
  v22 = (NSString *)objc_claimAutoreleasedReturnValue([v15 deviceId]);
  deviceID = self->_deviceID;
  self->_deviceID = v22;

  self->_maxDelay = a5;
  v24 = -[ADOpportuneSpeakingMovingAverageBuffer initWithSize:]( objc_alloc(&OBJC_CLASS___ADOpportuneSpeakingMovingAverageBuffer),  "initWithSize:",  (int)((double)a8 * 0.5));
  avbuffer = self->_avbuffer;
  self->_avbuffer = v24;

  self->_shouldStopListeningOnDetection = v10;
  objc_storeStrong((id *)&self->_listeningOptions, a3);
  -[ADOpportuneSpeakingModuleEdgeDetector _initializeVoiceThresholdsForOpportuneSpeakListeningType:]( self,  "_initializeVoiceThresholdsForOpportuneSpeakListeningType:",  [v15 opportuneSpeakListeningType]);
  v26 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v28 = @"NO";
    if (v10) {
      v28 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    v32 = "-[ADOpportuneSpeakingModuleEdgeDetector listenForPauseWithOptions:forPause:maxDelay:stopOnDetection:executeOnSuccess:onFail:]";
    __int16 v33 = 2112;
    v34 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s shouldStopListeningOnDetection:%@", buf, 0x16u);
  }

  *(float *)&double v27 = a5;
  -[ADOpportuneSpeakingModuleEdgeDetector _scheduleTimerForMaxDelay:](self, "_scheduleTimerForMaxDelay:", v27);
  listener = self->_listener;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000C4DE0;
  v30[3] = &unk_1004FAE50;
  v30[4] = self;
  -[CSOpportuneSpeakListener startListenWithOption:completion:](listener, "startListenWithOption:completion:", v15, v30);
}

- (void)listenForUserSpeechWithOptions:(id)a3 forVoice:(float)a4 maxDelay:(float)a5 stopOnDetection:(BOOL)a6 executeOnSuccess:(id)a7 onFail:(id)a8
{
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a8;
  id v17 = a7;
  unsigned int v18 = -[ADOpportuneSpeakingModuleEdgeDetector _framesPerSecondForOpportuneSpeakListeningType:]( self,  "_framesPerSecondForOpportuneSpeakListeningType:",  [v15 opportuneSpeakListeningType]);
  self->_inVoice = 0;
  *(void *)&self->_currentPausedFrameCount = 0LL;
  self->_currentFrameCount = 0;
  id v19 = objc_retainBlock(v17);

  id successCompletionBlock = self->_successCompletionBlock;
  self->_id successCompletionBlock = v19;

  id v21 = objc_retainBlock(v16);
  id failCompletionBlock = self->_failCompletionBlock;
  self->_id failCompletionBlock = v21;

  self->_thresholdFrameCount = (int)(float)((float)v18 * a4);
  self->_mode = 0LL;
  self->_isListening = 1;
  self->_isStopping = 0;
  v23 = (NSString *)objc_claimAutoreleasedReturnValue([v15 deviceId]);
  deviceID = self->_deviceID;
  self->_deviceID = v23;

  self->_maxDelay = a5;
  v25 = -[ADOpportuneSpeakingMovingAverageBuffer initWithSize:]( objc_alloc(&OBJC_CLASS___ADOpportuneSpeakingMovingAverageBuffer),  "initWithSize:",  self->_thresholdFrameCount);
  avbuffer = self->_avbuffer;
  self->_avbuffer = v25;

  self->_shouldStopListeningOnDetection = v10;
  objc_storeStrong((id *)&self->_listeningOptions, a3);
  -[ADOpportuneSpeakingModuleEdgeDetector _initializeVoiceThresholdsForOpportuneSpeakListeningType:]( self,  "_initializeVoiceThresholdsForOpportuneSpeakListeningType:",  [v15 opportuneSpeakListeningType]);
  double v27 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v29 = @"NO";
    if (v10) {
      v29 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[ADOpportuneSpeakingModuleEdgeDetector listenForUserSpeechWithOptions:forVoice:maxDelay:stopOnDetection:execu"
          "teOnSuccess:onFail:]";
    __int16 v34 = 2112;
    v35 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s shouldStopListeningOnDetection:%@", buf, 0x16u);
  }

  *(float *)&double v28 = a5;
  -[ADOpportuneSpeakingModuleEdgeDetector _scheduleTimerForMaxDelay:](self, "_scheduleTimerForMaxDelay:", v28);
  listener = self->_listener;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000C4C6C;
  v31[3] = &unk_1004FAE50;
  v31[4] = self;
  -[CSOpportuneSpeakListener startListenWithOption:completion:](listener, "startListenWithOption:completion:", v15, v31);
}

- (void)updateAttendingThreshold:(float)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C4B14;
  v4[3] = &unk_1004F06C0;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_handleFrame:(unint64_t)a3
{
  if (!a3) {
    goto LABEL_4;
  }
  if (a3 != 1)
  {
    __int16 v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v29 = 136315138;
      *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Invalid frame type passed to _handleFrame",  v29,  0xCu);
    }

    return;
  }

  if (!self->_currentHasAccel) {
    BOOL currentHasVAD = 0;
  }
  else {
LABEL_4:
  }
    BOOL currentHasVAD = self->_currentHasVAD;
  uint64_t v5 = _AFPreferencesOpportuneSpeakingEdgeDetectorSignalOverride();
  else {
    unsigned __int8 v6 = currentHasVAD;
  }
  -[ADOpportuneSpeakingMovingAverageBuffer add:](self->_avbuffer, "add:", v6);
  -[ADOpportuneSpeakingMovingAverageBuffer movingAverage](self->_avbuffer, "movingAverage");
  if (v7 > self->_voiceOnMin)
  {
    ++self->_currentVoiceFrameCount;
    if (!self->_inVoice)
    {
      id v8 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int currentFrameCount = self->_currentFrameCount;
        *(_DWORD *)v29 = 136315394;
        *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
        *(_WORD *)&v29[12] = 1024;
        *(_DWORD *)&v29[14] = currentFrameCount;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s OPPSPK - VOICE STARTS frame = %d",  v29,  0x12u);
      }

      self->_inVoice = 1;
    }

    uint64_t v10 = 64LL;
LABEL_22:
    *(_DWORD *)((char *)&self->super.isa + v10) = 0;
    goto LABEL_23;
  }

  -[ADOpportuneSpeakingMovingAverageBuffer movingAverage](self->_avbuffer, "movingAverage");
  if (v12 < self->_voiceOffMax)
  {
    ++self->_currentPausedFrameCount;
    if (self->_inVoice)
    {
      __int16 v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v14 = self->_currentFrameCount;
        *(_DWORD *)v29 = 136315394;
        *(void *)&v29[4] = "-[ADOpportuneSpeakingModuleEdgeDetector _handleFrame:]";
        *(_WORD *)&v29[12] = 1024;
        *(_DWORD *)&v29[14] = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s OPPSPK - VOICE ENDS frame = %d",  v29,  0x12u);
      }

      self->_inVoice = 0;
    }

    uint64_t v10 = 68LL;
    goto LABEL_22;
  }

- (void)_thresholdDetected
{
  if (self->_dispatchQueue)
  {
    BOOL shouldStopListeningOnDetection = self->_shouldStopListeningOnDetection;
    v4 = (os_log_s *)AFSiriLogContextDaemon;
    BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
    if (shouldStopListeningOnDetection)
    {
      if (v5)
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s OPPSPK - stop listening event detected, stopping listener",  (uint8_t *)&buf,  0xCu);
      }

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v14 = 0x3032000000LL;
      int v15 = sub_1000C4ABC;
      id v16 = sub_1000C4AE4;
      id v17 = objc_retainBlock(self->_successCompletionBlock);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000C4AEC;
      v12[3] = &unk_1004F0308;
      v12[4] = self;
      v12[5] = &buf;
      -[ADOpportuneSpeakingModuleEdgeDetector _stopListeningWithCompletion:](self, "_stopListeningWithCompletion:", v12);
      _Block_object_dispose(&buf, 8);
    }

    else
    {
      if (v5)
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s OPPSPK - stop listening event detected, not stopping listener",  (uint8_t *)&buf,  0xCu);
      }

      id successCompletionBlock = (uint64_t (**)(id, float))self->_successCompletionBlock;
      if (successCompletionBlock)
      {
        float v7 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s OPPSPK - will call completion but not stop listener",  (uint8_t *)&buf,  0xCu);
          id successCompletionBlock = (uint64_t (**)(id, float))self->_successCompletionBlock;
        }

        int v8 = successCompletionBlock[2](successCompletionBlock, self->_mostRecentAudioFrameHostTime);
        int v9 = (os_log_s *)AFSiriLogContextDaemon;
        BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
        if (v8)
        {
          if (v10)
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s OPPSPK - resetting state and continuing to send threshold events",  (uint8_t *)&buf,  0xCu);
          }

          self->_inVoice = 0;
          *(void *)&self->_int currentPausedFrameCount = 0LL;
        }

        else
        {
          if (v10)
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "-[ADOpportuneSpeakingModuleEdgeDetector _thresholdDetected]";
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s OPPSPK - done sending threshold events",  (uint8_t *)&buf,  0xCu);
          }

          id v11 = self->_successCompletionBlock;
          self->_id successCompletionBlock = 0LL;
        }
      }
    }
  }

- (void)_stopListeningWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_isStopping)
  {
    self->_isStopping = 1;
    -[AFWatchdogTimer cancel](self->_timer, "cancel");
    timer = self->_timer;
    self->_timer = 0LL;

    listener = self->_listener;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000C4920;
    v7[3] = &unk_1004F38E8;
    v7[4] = self;
    id v8 = v4;
    -[CSOpportuneSpeakListener stopListenWithStateReset:completion:]( listener,  "stopListenWithStateReset:completion:",  1LL,  v7);
  }
}

- (void)stopListening
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C486C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_restartAndExtendListening
{
  objc_super v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    float v7 = "-[ADOpportuneSpeakingModuleEdgeDetector _restartAndExtendListening]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s OPPSPK - Restarting listener to bypass 90 second recording limit",  buf,  0xCu);
  }

  self->_isStopping = 1;
  listener = self->_listener;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C4524;
  v5[3] = &unk_1004FAE50;
  v5[4] = self;
  -[CSOpportuneSpeakListener stopListenWithStateReset:completion:]( listener,  "stopListenWithStateReset:completion:",  0LL,  v5);
}

- (void)_didStartListening
{
}

- (void)_didStopListening
{
}

- (id)modeDescriptionFor:(unint64_t)a3
{
  if (a3) {
    return @"ADOSMED_PAUSE";
  }
  else {
    return @"ADOSMED_SPEECH";
  }
}

- (void)opportuneSpeakListener:(id)a3 hasRemoteVADAvailable:(BOOL)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C441C;
  v5[3] = &unk_1004FC4D0;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)opportuneSpeakListener:(id)a3 hasVADAvailable:(BOOL)a4 withHostTime:(float)a5
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C4304;
  v6[3] = &unk_1004F0330;
  v6[4] = self;
  BOOL v8 = a4;
  float v7 = a5;
  dispatch_async(dispatchQueue, v6);
}

- (void)opportuneSpeakListener:(id)a3 didStopUnexpectly:(BOOL)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C41C0;
  v5[3] = &unk_1004FC4D0;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(dispatchQueue, v5);
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void).cxx_destruct
{
}

@end