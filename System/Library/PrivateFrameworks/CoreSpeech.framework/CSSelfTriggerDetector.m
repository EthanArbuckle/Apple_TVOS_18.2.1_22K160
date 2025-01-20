@interface CSSelfTriggerDetector
+ (id)selfTriggerAudioLogDirectory;
+ (id)selfTriggerAudioLoggingFilePath;
+ (id)timeStampString;
- (BOOL)_isTelephonyTapAvailable;
- (BOOL)_shouldAddPowerLogs;
- (BOOL)_shouldReuseBuiltInAudioProvider;
- (BOOL)hasPendingNearMiss;
- (BOOL)isKeywordAnalyzerCorrupted;
- (BOOL)isListenPollingStarting;
- (BOOL)isSiriClientListening;
- (BOOL)selfTriggerEnabled;
- (CSAsset)currentAsset;
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)audioTapProvider;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSContinuousVoiceTriggerConfig)selfTriggerConfig;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzer;
- (CSOSTransaction)modelLoadTransaction;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSelfTriggerDetector)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 audioSourceType:(unint64_t)a5;
- (CSSpeechManager)speechManager;
- (NSHashTable)observers;
- (NSString)audioProviderUUID;
- (OS_dispatch_queue)queue;
- (unint64_t)_getPlaybackRouteType;
- (unint64_t)audioSourceType;
- (unint64_t)currentState;
- (unint64_t)mode;
- (unint64_t)nearMissCandidateDetectedSamples;
- (unint64_t)nearMissDelayTimeoutInSamples;
- (unint64_t)numAnalyzedSamples;
- (unint64_t)outputAudioChannel;
- (unint64_t)state;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4;
- (void)_addPowerLogsIfSupported:(unint64_t)a3;
- (void)_hardStopAndRestartAudioQueueIfNeeded;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_loadCurrentAssetToAnalyzer;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_startListenPolling;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopAudioFileWriter;
- (void)_stopListeningWithCompletion:(id)a3;
- (void)_transitCurrentStateTo:(unint64_t)a3;
- (void)_unloadCurrentAssetToAnalyzer;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)registerObserver:(id)a3;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioProviderUUID:(id)a3;
- (void)setAudioSourceType:(unint64_t)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioTapProvider:(id)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setHasPendingNearMiss:(BOOL)a3;
- (void)setIsKeywordAnalyzerCorrupted:(BOOL)a3;
- (void)setIsListenPollingStarting:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setKeywordAnalyzer:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setModelLoadTransaction:(id)a3;
- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3;
- (void)setNearMissDelayTimeoutInSamples:(unint64_t)a3;
- (void)setNumAnalyzedSamples:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setOutputAudioChannel:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSelfTriggerConfig:(id)a3;
- (void)setSelfTriggerEnabled:(BOOL)a3;
- (void)setSpeechManager:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
- (void)startAnalyze;
- (void)stopAnalyzeWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSSelfTriggerDetector

- (CSSelfTriggerDetector)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 audioSourceType:(unint64_t)a5
{
  v8 = (dispatch_queue_s *)a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSSelfTriggerDetector;
  id v10 = -[CSSelfTriggerDetector init](&v19, "init");
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("CSSelfVoiceTriggerDetector Queue", 0LL);
    v12 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v11;

    dispatch_set_target_queue(*((dispatch_object_t *)v10 + 2), v8);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    v14 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v13;

    objc_storeWeak((id *)v10 + 12, v9);
    *((void *)v10 + 13) = a5;
    *((void *)v10 + 15) = 0LL;
    v15 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = 0LL;

    *((_BYTE *)v10 + 8) = 0;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    *((_BYTE *)v10 + 12) = 0;
    *((void *)v10 + 18) = 0LL;
    *((void *)v10 + 19) = 0LL;
    *((void *)v10 + 17) = (unint64_t)(float)(v16 * 0.5);
  }

  v17 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSSelfTriggerDetector initWithTargetQueue:audioTapProvider:audioSourceType:]";
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Creating SelfTriggerDetector with audioSourceType(%lu)",  buf,  0x16u);
  }

  return (CSSelfTriggerDetector *)v10;
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000102AC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000102A4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  self->_hasPendingNearMiss = 0;
  self->_nearMissCandidateDetectedSamples = 0LL;
  self->_numAnalyzedSamples = 0LL;
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010298;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (unint64_t)currentState
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100010284;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100010278;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001026C;
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
    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v6 = (CSContinuousVoiceTriggerConfig *)objc_claimAutoreleasedReturnValue( +[CSContinuousVoiceTriggerConfigDecoder decodeConfigFrom:]( &OBJC_CLASS___CSContinuousVoiceTriggerConfigDecoder,  "decodeConfigFrom:",  self->_currentAsset));
    selfTriggerConfig = self->_selfTriggerConfig;
    self->_selfTriggerConfig = v6;

    if (self->_keywordAnalyzer || self->_isKeywordAnalyzerCorrupted) {
      -[CSSelfTriggerDetector _loadCurrentAssetToAnalyzer](self, "_loadCurrentAssetToAnalyzer");
    }
    -[CSSelfTriggerDetector _reset](self, "_reset");
  }

  else
  {
    id v8 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[CSSelfTriggerDetector _setAsset:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s asset is nil, stop initialization",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)_loadCurrentAssetToAnalyzer
{
  if (!self->_modelLoadTransaction)
  {
    unint64_t v3 = -[CSOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CSOSTransaction),  "initWithDescription:",  @"Transaction for STS model loading");
    modelLoadTransaction = self->_modelLoadTransaction;
    self->_modelLoadTransaction = v3;
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self->_currentAsset, "resourcePath"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSContinuousVoiceTriggerConfig configPathNDAPI](self->_selfTriggerConfig, "configPathNDAPI"));
  id v6 = -[CSKeywordAnalyzerNDAPI initWithConfigPath:resourcePath:]( objc_alloc(&OBJC_CLASS___CSKeywordAnalyzerNDAPI),  "initWithConfigPath:resourcePath:",  v5,  v13);
  keywordAnalyzer = self->_keywordAnalyzer;
  self->_keywordAnalyzer = v6;

  self->_isKeywordAnalyzerCorrupted = self->_keywordAnalyzer == 0LL;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  if (WeakRetained && (unint64_t audioSourceType = self->_audioSourceType, WeakRetained, audioSourceType == 1))
  {
    id v10 = self->_keywordAnalyzer;
    id v11 = 0LL;
  }

  else
  {
    v12 = self->_keywordAnalyzer;
    id v11 = +[CSConfig channelForOutputReference](&OBJC_CLASS___CSConfig, "channelForOutputReference");
    id v10 = v12;
  }

  -[CSKeywordAnalyzerNDAPI setActiveChannel:](v10, "setActiveChannel:", v11);
}

- (void)_unloadCurrentAssetToAnalyzer
{
  unint64_t v3 = objc_autoreleasePoolPush();
  keywordAnalyzer = self->_keywordAnalyzer;
  self->_keywordAnalyzer = 0LL;

  modelLoadTransaction = self->_modelLoadTransaction;
  self->_modelLoadTransaction = 0LL;

  objc_autoreleasePoolPop(v3);
}

- (void)startAnalyze
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010258;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startListenPolling
{
  if (self->_isListenPollingStarting)
  {
    v2 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v5 = "-[CSSelfTriggerDetector _startListenPolling]";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Already started listen polling, skip",  buf,  0xCu);
    }
  }

  else
  {
    self->_isListenPollingStarting = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10001024C;
    v3[3] = &unk_10022E730;
    v3[4] = self;
    -[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]( self,  "_startListenPollingWithInterval:completion:",  v3,  1.0);
  }

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioStream](self, "audioStream"));
  if ([v8 isStreaming])
  {
  }

  else
  {
    selfTriggerEnabled = self->_selfTriggerEnabled;

    if (selfTriggerEnabled)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100010044;
      v11[3] = &unk_10022E628;
      v11[4] = self;
      double v13 = a3;
      id v12 = v6;
      -[CSSelfTriggerDetector _startListenWithCompletion:](self, "_startListenWithCompletion:", v11);

      goto LABEL_11;
    }
  }

  id v10 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Skip listen polling since audio is streaming / selfTrigger disabled",  buf,  0xCu);
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
  }
LABEL_11:
}

- (void)_startListenWithCompletion:(id)a3
{
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10000FE74;
  v44[3] = &unk_10022E650;
  id v4 = a3;
  id v45 = v4;
  id v5 = objc_retainBlock(v44);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForBuiltInVoiceTrigger]( &OBJC_CLASS___CSAudioRecordContext,  "contextForBuiltInVoiceTrigger"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    int v9 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CSSelfTriggerDetector _startListenWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Using audio tapping provider for self-trigger",  buf,  0xCu);
    }

    goto LABEL_6;
  }

  if (-[CSSelfTriggerDetector _shouldReuseBuiltInAudioProvider](self, "_shouldReuseBuiltInAudioProvider"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 audioProviderWithStreamID:1]);

    if (v8)
    {
LABEL_6:
      id v39 = 0LL;
      goto LABEL_7;
    }
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  id v43 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v36 audioProviderWithContext:v6 error:&v43]);
  id v35 = v43;

  if (!v8)
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0LL, v35);
    goto LABEL_18;
  }

  id v39 = v35;
LABEL_7:
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  id v12 = [v11 copy];
  -[CSSelfTriggerDetector setAudioProviderUUID:](self, "setAudioProviderUUID:", v12);

  double v13 = objc_alloc_init(&OBJC_CLASS___CSAudioTimeConverter);
  audioTimeConverter = self->_audioTimeConverter;
  self->_audioTimeConverter = v13;

  v15 = objc_alloc_init(&OBJC_CLASS___CSAudioStreamRequest);
  float v16 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v17 = [v16 fileLoggingIsEnabled];

  if (v17) {
    -[CSAudioStreamRequest setRequiresHistoricalBuffer:](v15, "setRequiresHistoricalBuffer:", 1LL);
  }
  objc_super v19 = (objc_class *)objc_opt_class(self, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v42 = 0LL;
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v8 audioStreamWithRequest:v15 streamName:v21 error:&v42]);
  id v23 = v42;

  if (v22)
  {
    v37 = v6;
    id v38 = v4;
    -[CSSelfTriggerDetector setAudioStream:](self, "setAudioStream:", v22);
    [v22 setDelegate:self];
    uint64_t v24 = mach_absolute_time();
    LODWORD(v25) = 2.0;
    uint64_t v26 = v24 - (void)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v25);
    v27 = objc_alloc_init(&OBJC_CLASS___CSAudioStartStreamOption);
    -[CSAudioStartStreamOption setRequestHistoricalAudioDataWithHostTime:]( v27,  "setRequestHistoricalAudioDataWithHostTime:",  1LL);
    -[CSAudioStartStreamOption setStartRecordingHostTime:](v27, "setStartRecordingHostTime:", v26);
    -[CSAudioStartStreamOption setSkipAlertBehavior:](v27, "setSkipAlertBehavior:", 1LL);
    if (self->_mode == 1) {
      -[CSAudioStartStreamOption setRequestTelephonyDownlinkAudioTap:](v27, "setRequestTelephonyDownlinkAudioTap:", 1LL);
    }
    -[CSSelfTriggerDetector _loadCurrentAssetToAnalyzer](self, "_loadCurrentAssetToAnalyzer");
    -[CSSelfTriggerDetector _reset](self, "_reset");
    -[CSSelfTriggerDetector _transitCurrentStateTo:](self, "_transitCurrentStateTo:", 1LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v29 = [v28 isSelfTriggerFileLoggingEnabled];

    if (v29)
    {
      v30 = (CSPlainAudioFileWriter *)objc_claimAutoreleasedReturnValue( +[CSSelfTriggerDetector selfTriggerAudioLoggingFilePath]( &OBJC_CLASS___CSSelfTriggerDetector,  "selfTriggerAudioLoggingFilePath"));
      v31 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v30));
      v33 = -[CSPlainAudioFileWriter initWithURL:](v31, "initWithURL:", v32);
      audioFileWriter = self->_audioFileWriter;
      self->_audioFileWriter = v33;
    }

    else
    {
      v30 = self->_audioFileWriter;
      self->_audioFileWriter = 0LL;
    }

    id v4 = v38;
    id v35 = v39;

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10000FE88;
    v40[3] = &unk_10022E6A0;
    v40[4] = self;
    v41 = v5;
    [v22 startAudioStreamWithOption:v27 completion:v40];

    id v6 = v37;
  }

  else
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0LL, v23);
    id v35 = v39;
  }

LABEL_18:
}

- (void)stopAnalyzeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000FD90;
  v7[3] = &unk_10022EB58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_stopListeningWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioStream](self, "audioStream"));
  if (v5
    && (id v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioStream](self, "audioStream")),
        unsigned int v8 = [v7 isStreaming],
        v7,
        v6,
        v8))
  {
    -[CSSelfTriggerDetector _transitCurrentStateTo:](self, "_transitCurrentStateTo:", 3LL);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioStream](self, "audioStream"));
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    id v12 = sub_10000FBDC;
    double v13 = &unk_10022E6A0;
    v14 = self;
    id v15 = v4;
    [v9 stopAudioStreamWithOption:0 completion:&v10];
  }

  else
  {
    -[CSSelfTriggerDetector _unloadCurrentAssetToAnalyzer](self, "_unloadCurrentAssetToAnalyzer");
    -[CSSelfTriggerDetector _transitCurrentStateTo:](self, "_transitCurrentStateTo:", 0LL);
    if (v4) {
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1LL, 0LL);
    }
  }

  -[CSSelfTriggerDetector _stopAudioFileWriter](self, "_stopAudioFileWriter", v10, v11, v12, v13, v14);
}

- (BOOL)_shouldReuseBuiltInAudioProvider
{
  return CSIsOSX(self, a2) ^ 1;
}

- (BOOL)_isTelephonyTapAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  BOOL v4 = WeakRetained != 0LL;

  return v4;
}

- (unint64_t)_getPlaybackRouteType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSBuiltinSpeakerStateMonitor sharedInstance]( &OBJC_CLASS___CSBuiltinSpeakerStateMonitor,  "sharedInstance"));
  id v3 = [v2 currentBuiltinSpeakerState];

  if (v3 == (id)1) {
    return 1LL;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSBluetoothSpeakerStateMonitor sharedInstance]( &OBJC_CLASS___CSBluetoothSpeakerStateMonitor,  "sharedInstance"));
  unsigned int v6 = [v5 isActive];

  if (v6) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  unsigned int v6 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSSelfTriggerDetector audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v11 = 2050;
    int64_t v12 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s stream stopped unexpectedly : %{public}ld",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000FB80;
  v8[3] = &unk_10022F020;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000F86C;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a4;
  [v7 bestScore];
  float v9 = v8;
  unint64_t v10 = qword_10027FBE0;
  if (!(v10 % +[CSUtils loggingHeartbeatRate](&OBJC_CLASS___CSUtils, "loggingHeartbeatRate")))
  {
    __int16 v11 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isSiriClientListening) {
        int64_t v12 = @"YES";
      }
      else {
        int64_t v12 = @"NO";
      }
      unint64_t audioSourceType = self->_audioSourceType;
      selfTriggerConfig = self->_selfTriggerConfig;
      id v15 = v11;
      -[CSContinuousVoiceTriggerConfig threshold](selfTriggerConfig, "threshold");
      *(_DWORD *)buf = 136316418;
      v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
      __int16 v99 = 2050;
      double v100 = v9;
      __int16 v101 = 2050;
      double v102 = *(double *)&a5;
      __int16 v103 = 2114;
      v104 = v12;
      __int16 v105 = 2050;
      unint64_t v106 = audioSourceType;
      __int16 v107 = 2048;
      double v108 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Output NDAPI self trigger best score = %{public}f for channel = %{public}tu, client listening ? %{public}@, a udioSourceType %{public}lu, threshold = %f",  buf,  0x3Eu);
    }
  }

  ++qword_10027FBE0;
  if (!self->_isSiriClientListening)
  {
    -[CSContinuousVoiceTriggerConfig threshold](self->_selfTriggerConfig, "threshold");
    if (v9 >= v17)
    {
      id v39 = [v7 bestStart];
      v40 = [v7 bestEnd];
      v41 = [v7 samplesAtFire];
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      double v43 = (float)((float)(unint64_t)(v40 - v39) / v42);
      +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
      double v45 = (float)((float)(unint64_t)(v41 - v39) / v44);
      id v46 = -[CSAudioTimeConverter hostTimeFromSampleCount:](self->_audioTimeConverter, "hostTimeFromSampleCount:", v39);
      id v47 = -[CSAudioTimeConverter hostTimeFromSampleCount:](self->_audioTimeConverter, "hostTimeFromSampleCount:", v40);
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary")));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](self->_currentAsset, "configVersion"));

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset configVersion](self->_currentAsset, "configVersion"));
        [*(id *)&v23 setObject:v49 forKey:kVTEIconfigVersion];
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v39));
      [*(id *)&v23 setObject:v50 forKey:kVTEItriggerStartSampleCount];

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v40));
      [*(id *)&v23 setObject:v51 forKey:kVTEItriggerEndSampleCount];

      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v41));
      [*(id *)&v23 setObject:v52 forKey:kVTEItriggerFireSampleCount];

      [*(id *)&v23 setObject:&off_100238290 forKey:kVTEItriggerStartSeconds];
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v43));
      [*(id *)&v23 setObject:v53 forKey:kVTEItriggerEndSeconds];

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v45));
      [*(id *)&v23 setObject:v54 forKey:kVTEItriggerFireSeconds];

      *(float *)&double v55 = v9;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v55));
      [*(id *)&v23 setObject:v56 forKey:kVTEItriggerScore];

      -[CSContinuousVoiceTriggerConfig threshold](self->_selfTriggerConfig, "threshold");
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
      [*(id *)&v23 setObject:v57 forKey:kVTEIthreshold];

      v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v46));
      [*(id *)&v23 setObject:v58 forKey:kVTEItriggerStartMachTime];

      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v47));
      [*(id *)&v23 setObject:v59 forKey:kVTEItriggerEndMachTime];

      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
      [*(id *)&v23 setObject:v60 forKey:kVTEIactiveChannel];

      v61 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioProviderUUID](self, "audioProviderUUID"));
      if (v61)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioProviderUUID](self, "audioProviderUUID"));
        [*(id *)&v23 setObject:v62 forKey:kVTEIAudioProviderUUID];
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioTapProvider](self, "audioTapProvider"));

      if (v63) {
        [*(id *)&v23 setObject:&off_100238310 forKey:kVTEIAudioProviderType];
      }
      v64 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        double v65 = *(double *)&self->_audioSourceType;
        *(_DWORD *)buf = 136315650;
        v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v99 = 2050;
        double v100 = v65;
        __int16 v101 = 2114;
        double v102 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "%s Notifying self trigger detected with audioSourceType %{public}lu : %{public}@",  buf,  0x20u);
      }

      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      v66 = self->_observers;
      id v67 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v66,  "countByEnumeratingWithState:objects:count:",  &v91,  v96,  16LL);
      if (v67)
      {
        id v68 = v67;
        uint64_t v69 = *(void *)v92;
        do
        {
          for (i = 0LL; i != v68; i = (char *)i + 1)
          {
            if (*(void *)v92 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
            if ((objc_opt_respondsToSelector(v71, "selfTriggerDetector:didDetectSelfTrigger:") & 1) != 0) {
              [v71 selfTriggerDetector:self didDetectSelfTrigger:*(void *)&v23];
            }
          }

          id v68 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v66,  "countByEnumeratingWithState:objects:count:",  &v91,  v96,  16LL);
        }

        while (v68);
      }

      if (-[CSSelfTriggerDetector _shouldAddPowerLogs](self, "_shouldAddPowerLogs"))
      {
        unint64_t v72 = -[CSSelfTriggerDetector _getPlaybackRouteType](self, "_getPlaybackRouteType");
        v73 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
        if ([v73 phoneCallState] == (id)3)
        {
          BOOL v74 = 1LL;
        }

        else
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
          BOOL v74 = [v75 phoneCallState] == (id)4;
        }

        v76 = (void *)objc_claimAutoreleasedReturnValue(+[CSPowerLogger sharedPowerLogger](&OBJC_CLASS___CSPowerLogger, "sharedPowerLogger"));
        unint64_t v77 = self->_audioSourceType;
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v78 timeIntervalSince1970];
        objc_msgSend( v76,  "powerLogSelfTriggerSuppressionDetectedWithSpeakerType:withAudioSource:atTime:isPhoneCall:",  v72,  v77,  v74);
      }

      goto LABEL_52;
    }

    -[CSContinuousVoiceTriggerConfig loggingThreshold](self->_selfTriggerConfig, "loggingThreshold");
    if (v9 >= v18)
    {
      if (!self->_hasPendingNearMiss)
      {
        self->_hasPendingNearMiss = 1;
        double v79 = *(double *)&self->_numAnalyzedSamples;
        *(double *)&self->_unint64_t nearMissCandidateDetectedSamples = v79;
        v80 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_53;
        }
        unint64_t nearMissDelayTimeoutInSamples = self->_nearMissDelayTimeoutInSamples;
        *(_DWORD *)buf = 136315650;
        v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v99 = 2050;
        double v100 = v79;
        __int16 v101 = 2050;
        double v102 = *(double *)&nearMissDelayTimeoutInSamples;
        v82 = "%s Detected near miss candidate at %{public}tu, let's wait %{public}tu samples to log";
        v83 = v80;
        os_log_type_t v84 = OS_LOG_TYPE_DEFAULT;
        uint32_t v85 = 32;
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v83, v84, v82, buf, v85);
        goto LABEL_53;
      }

      unint64_t v20 = self->_nearMissDelayTimeoutInSamples;
      unint64_t nearMissCandidateDetectedSamples = self->_nearMissCandidateDetectedSamples;
      double v21 = *(double *)&self->_numAnalyzedSamples;
      if (v20 + nearMissCandidateDetectedSamples < *(void *)&v21)
      {
        __int16 v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
          __int16 v99 = 2048;
          double v100 = v21;
          __int16 v101 = 2048;
          double v102 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s SelfTrigger detected near miss at %lu samples with score %.3f",  buf,  0x20u);
        }

        double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary")));
        unint64_t v24 = (unint64_t)[v7 bestStart];
        float v25 = (float)(unint64_t)[v7 samplesAtFire];
        +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
        if ((float)(v26 + v26) <= v25)
        {
          float v27 = (float)(unint64_t)[v7 samplesAtFire];
          +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
          unint64_t v24 = (unint64_t)(float)(v27 + (float)(v28 * -2.0));
        }

        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v24));
        [*(id *)&v23 setObject:v29 forKey:kVTEItriggerStartSampleCount];

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioProviderUUID](self, "audioProviderUUID"));
        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioProviderUUID](self, "audioProviderUUID"));
          [*(id *)&v23 setObject:v31 forKey:kVTEIAudioProviderUUID];
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSSelfTriggerDetector audioTapProvider](self, "audioTapProvider"));

        if (v32) {
          [*(id *)&v23 setObject:&off_100238310 forKey:kVTEIAudioProviderType];
        }
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        v33 = self->_observers;
        id v34 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v87,  v95,  16LL);
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v88;
          do
          {
            for (j = 0LL; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v88 != v36) {
                objc_enumerationMutation(v33);
              }
              id v38 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)j);
              if ((objc_opt_respondsToSelector(v38, "selfTriggerDetector:didDetectNearMiss:") & 1) != 0) {
                objc_msgSend(v38, "selfTriggerDetector:didDetectNearMiss:", self, *(void *)&v23, (void)v87);
              }
            }

            id v35 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v33,  "countByEnumeratingWithState:objects:count:",  &v87,  v95,  16LL);
          }

          while (v35);
        }

LABEL_52:
        -[CSSelfTriggerDetector _reset](self, "_reset", (void)v87);

        goto LABEL_53;
      }

      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_10027FBE0, 1) <= 0x1999999999999999uLL)
      {
        v86 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
          __int16 v99 = 2050;
          *(void *)&double v100 = *(void *)&v21 - nearMissCandidateDetectedSamples + v20;
          v82 = "%s Waiting for logging near miss until timeout %{public}lu samples";
          v83 = v86;
          os_log_type_t v84 = OS_LOG_TYPE_INFO;
          uint32_t v85 = 22;
          goto LABEL_59;
        }
      }
    }
  }

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  if (a5)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F7B8;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F708;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F658;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F5A0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F3F0;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_hardStopAndRestartAudioQueueIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000F3A4;
  v2[3] = &unk_10022E730;
  v2[4] = self;
  -[CSSelfTriggerDetector _stopListeningWithCompletion:](self, "_stopListeningWithCompletion:", v2);
}

- (void)_transitCurrentStateTo:(unint64_t)a3
{
  id v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    unint64_t audioSourceType = self->_audioSourceType;
    int v8 = 136315906;
    float v9 = "-[CSSelfTriggerDetector _transitCurrentStateTo:]";
    __int16 v10 = 2048;
    unint64_t v11 = state;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = audioSourceType;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s From state : %lu to state : %lu , audioSourceType : %lu",  (uint8_t *)&v8,  0x2Au);
  }

  -[CSSelfTriggerDetector _addPowerLogsIfSupported:](self, "_addPowerLogsIfSupported:", a3);
  self->_unint64_t state = a3;
}

- (BOOL)_shouldAddPowerLogs
{
  return CSIsIOS(self, a2) && !+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS");
}

- (void)_addPowerLogsIfSupported:(unint64_t)a3
{
  if (-[CSSelfTriggerDetector _shouldAddPowerLogs](self, "_shouldAddPowerLogs") && self->_state != a3)
  {
    if (!a3)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[CSPowerLogger sharedPowerLogger](&OBJC_CLASS___CSPowerLogger, "sharedPowerLogger"));
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v8 timeIntervalSince1970];
      objc_msgSend(v11, "powerLogSelfTriggerSuppressionStopAtTime:");
LABEL_11:

      return;
    }

    if (a3 == 1)
    {
      unint64_t v5 = -[CSSelfTriggerDetector _getPlaybackRouteType](self, "_getPlaybackRouteType");
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
      if ([v6 phoneCallState] == (id)3)
      {
        BOOL v7 = 1LL;
      }

      else
      {
        float v9 = (void *)objc_claimAutoreleasedReturnValue( +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor]( &OBJC_CLASS___CSPhoneCallStateMonitorFactory,  "phoneCallStateMonitor"));
        BOOL v7 = [v9 phoneCallState] == (id)4;
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue(+[CSPowerLogger sharedPowerLogger](&OBJC_CLASS___CSPowerLogger, "sharedPowerLogger"));
      unint64_t audioSourceType = self->_audioSourceType;
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v8 timeIntervalSince1970];
      objc_msgSend( v11,  "powerLogSelfTriggerSuppressionStartWithSpeakerType:withAudioSource:atTime:isPhoneCall:",  v5,  audioSourceType,  v7);
      goto LABEL_11;
    }
  }

- (void)_stopAudioFileWriter
{
  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    -[CSPlainAudioFileWriter endAudio](audioFileWriter, "endAudio");
    BOOL v4 = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return (CSSpeechManager *)objc_loadWeakRetained((id *)&self->_speechManager);
}

- (void)setSpeechManager:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setKeywordAnalyzer:(id)a3
{
}

- (BOOL)isKeywordAnalyzerCorrupted
{
  return self->_isKeywordAnalyzerCorrupted;
}

- (void)setIsKeywordAnalyzerCorrupted:(BOOL)a3
{
  self->_isKeywordAnalyzerCorrupted = a3;
}

- (unint64_t)outputAudioChannel
{
  return self->_outputAudioChannel;
}

- (void)setOutputAudioChannel:(unint64_t)a3
{
  self->_outputAudioChannel = a3;
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)selfTriggerEnabled
{
  return self->_selfTriggerEnabled;
}

- (void)setSelfTriggerEnabled:(BOOL)a3
{
  self->_selfTriggerEnabled = a3;
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (void)setAudioProviderUUID:(id)a3
{
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSContinuousVoiceTriggerConfig)selfTriggerConfig
{
  return self->_selfTriggerConfig;
}

- (void)setSelfTriggerConfig:(id)a3
{
}

- (CSAudioStreamProviding)audioTapProvider
{
  return (CSAudioStreamProviding *)objc_loadWeakRetained((id *)&self->_audioTapProvider);
}

- (void)setAudioTapProvider:(id)a3
{
}

- (unint64_t)audioSourceType
{
  return self->_audioSourceType;
}

- (void)setAudioSourceType:(unint64_t)a3
{
  self->_unint64_t audioSourceType = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (CSOSTransaction)modelLoadTransaction
{
  return self->_modelLoadTransaction;
}

- (void)setModelLoadTransaction:(id)a3
{
}

- (unint64_t)nearMissDelayTimeoutInSamples
{
  return self->_nearMissDelayTimeoutInSamples;
}

- (void)setNearMissDelayTimeoutInSamples:(unint64_t)a3
{
  self->_unint64_t nearMissDelayTimeoutInSamples = a3;
}

- (unint64_t)nearMissCandidateDetectedSamples
{
  return self->_nearMissCandidateDetectedSamples;
}

- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3
{
  self->_unint64_t nearMissCandidateDetectedSamples = a3;
}

- (BOOL)hasPendingNearMiss
{
  return self->_hasPendingNearMiss;
}

- (void)setHasPendingNearMiss:(BOOL)a3
{
  self->_hasPendingNearMiss = a3;
}

- (unint64_t)numAnalyzedSamples
{
  return self->_numAnalyzedSamples;
}

- (void)setNumAnalyzedSamples:(unint64_t)a3
{
  self->_numAnalyzedSamples = a3;
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)selfTriggerAudioLoggingFilePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSSelfTriggerDetector selfTriggerAudioLogDirectory]( &OBJC_CLASS___CSSelfTriggerDetector,  "selfTriggerAudioLogDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSSelfTriggerDetector timeStampString](&OBJC_CLASS___CSSelfTriggerDetector, "timeStampString"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.wav",  v3,  @"-selfTrigger"));

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:v4]);
  return v5;
}

+ (id)selfTriggerAudioLogDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 voiceTriggerAudioLogDirectory]);

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
      BOOL v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        float v9 = v7;
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        unint64_t v13 = "+[CSSelfTriggerDetector selfTriggerAudioLogDirectory]";
        __int16 v14 = 2114;
        unint64_t v15 = v4;
        __int16 v16 = 2114;
        float v17 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Couldn't create self-trigger audio logging directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      BOOL v4 = @"/tmp";
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
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

@end