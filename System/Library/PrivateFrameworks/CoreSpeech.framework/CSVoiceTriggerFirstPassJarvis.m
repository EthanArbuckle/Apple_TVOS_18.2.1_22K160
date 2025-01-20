@interface CSVoiceTriggerFirstPassJarvis
+ (id)jarvisAudioLogDirectory;
+ (id)jarvisAudioLoggingFilePath;
+ (id)timeStampString;
- (BOOL)firstTimeAssetConfigured;
- (BOOL)hasReceivedNDEAPIResult;
- (BOOL)hasTriggerCandidate;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStream)audioStream;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI;
- (CSKeywordAnalyzerNDEAPIResult)jarvisTriggerResult;
- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSPGEndpointAnalyzer)endpointAnalyzer;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassJarvis)init;
- (CSVoiceTriggerFirstPassJarvis)initWithSpeechManager:(id)a3 otherAppRecordingStateMonitor:(id)a4;
- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics;
- (CSVoiceTriggerRTModel)rtModel;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSMutableArray)assetConfigWaitingBuffer;
- (NSString)deviceId;
- (OS_dispatch_queue)queue;
- (int64_t)latestTriggerMode;
- (unint64_t)activeChannel;
- (unint64_t)earlyDetectFiredMachTime;
- (unint64_t)jarvisVoiceTriggerTimeout;
- (unint64_t)numProcessedSamples;
- (void)_cancelAudioStreamHold;
- (void)_clearTriggerCandidate;
- (void)_createSecondPassIfNeeded;
- (void)_didDetectKeywordFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6;
- (void)_didStartAudioStream;
- (void)_didStopAudioStream;
- (void)_handleAudioChunk:(id)a3;
- (void)_handleJarvisVoiceTriggerFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_holdAudioStreamWithTimeout:(double)a3;
- (void)_notifyJarvisVoiceTriggerReject;
- (void)_reportJarvisVoiceTriggerFire;
- (void)_requestStartAudioStreamWitContext:(id)a3 startStreamOption:(id)a4 completion:(id)a5;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_teardownSecondPass;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)reset;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setAssetConfigWaitingBuffer:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setEarlyDetectFiredMachTime:(unint64_t)a3;
- (void)setEndpointAnalyzer:(id)a3;
- (void)setFirstTimeAssetConfigured:(BOOL)a3;
- (void)setFirstpassMetrics:(id)a3;
- (void)setHasReceivedNDEAPIResult:(BOOL)a3;
- (void)setHasTriggerCandidate:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setJarvisTriggerResult:(id)a3;
- (void)setJarvisVoiceTriggerTimeout:(unint64_t)a3;
- (void)setKeywordAnalyzerNDEAPI:(id)a3;
- (void)setLatestTriggerMode:(int64_t)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setNumProcessedSamples:(unint64_t)a3;
- (void)setOtherAppRecordingStateMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRtModel:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)spgEndpointAnalyzerDidDetectEndpoint:(id)a3;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassJarvis

- (CSVoiceTriggerFirstPassJarvis)initWithSpeechManager:(id)a3 otherAppRecordingStateMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassJarvis;
  v9 = -[CSVoiceTriggerFirstPassJarvis init](&v26, "init");
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("VoiceTriggerFirstPassJarvis Queue", 0LL);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = (dispatch_object_s *)v9->_queue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v12, v14);

    v9->_numProcessedSamples = 0LL;
    v9->_activeChannel = (unint64_t)+[CSConfig channelForProcessedInput]( &OBJC_CLASS___CSConfig,  "channelForProcessedInput");
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    v9->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v15 * 3.0);
    -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](v9, "_clearTriggerCandidate");
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSJarvisTriggerModeMonitor sharedInstance]( &OBJC_CLASS___CSJarvisTriggerModeMonitor,  "sharedInstance"));
    [v16 addObserver:v9];

    v9->_firstTimeAssetConfigured = 0;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    assetConfigWaitingBuffer = v9->_assetConfigWaitingBuffer;
    v9->_assetConfigWaitingBuffer = (NSMutableArray *)v17;

    v9->_latestTriggerMode = -1LL;
    p_speechManager = (void **)&v9->_speechManager;
    objc_storeStrong((id *)&v9->_speechManager, a3);
    if (!v9->_speechManager)
    {
      uint64_t v20 = objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
      v21 = *p_speechManager;
      *p_speechManager = (void *)v20;
    }

    p_otherAppRecordingStateMonitor = (void **)&v9->_otherAppRecordingStateMonitor;
    objc_storeStrong((id *)&v9->_otherAppRecordingStateMonitor, a4);
    if (!v9->_otherAppRecordingStateMonitor)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[CSOtherAppRecordingStateMonitor sharedInstance]( &OBJC_CLASS___CSOtherAppRecordingStateMonitor,  "sharedInstance"));
      v24 = *p_otherAppRecordingStateMonitor;
      *p_otherAppRecordingStateMonitor = (void *)v23;
    }
  }

  return v9;
}

- (CSVoiceTriggerFirstPassJarvis)init
{
  return -[CSVoiceTriggerFirstPassJarvis initWithSpeechManager:otherAppRecordingStateMonitor:]( self,  "initWithSpeechManager:otherAppRecordingStateMonitor:",  0LL,  0LL);
}

- (void)start
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSVoiceTriggerFirstPassJarvis start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100064558;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100064550;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  self->_numProcessedSamples = 0LL;
  -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](self, "_clearTriggerCandidate");
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100064544;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    [v5 logAssetVersionForInsight];
    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v7 = (CSVoiceTriggerRTModel *)objc_claimAutoreleasedReturnValue([v6 RTModelWithFallbackLanguage:@"en-US"]);
    rtModel = self->_rtModel;
    self->_rtModel = v7;

    -[CSVoiceTriggerFirstPassJarvis _reset](self, "_reset");
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", v6);
    if (!self->_firstTimeAssetConfigured) {
      self->_firstTimeAssetConfigured = 1;
    }
  }

  else
  {
    v9 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[CSVoiceTriggerFirstPassJarvis _setAsset:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s asset is nil, stop initialization",  (uint8_t *)&v10,  0xCu);
    }
  }
}

- (void)_clearTriggerCandidate
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Clearing VoiceTrigger candidate in the voiceTriggerJarvis",  (uint8_t *)&v4,  0xCu);
  }

  self->_hasTriggerCandidate = 0;
}

- (void)_didStartAudioStream
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v4 = [v3 jarvisAudioLoggingEnabled];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerFirstPassJarvis jarvisAudioLoggingFilePath]( &OBJC_CLASS___CSVoiceTriggerFirstPassJarvis,  "jarvisAudioLoggingFilePath"));
    id v6 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "-[CSVoiceTriggerFirstPassJarvis _didStartAudioStream]";
      __int16 v14 = 2114;
      float v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Jarvis firstpass writing audio file into %{public}@",  (uint8_t *)&v12,  0x16u);
    }

    id v7 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
    v9 = -[CSPlainAudioFileWriter initWithURL:](v7, "initWithURL:", v8);
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v9;
  }

  else
  {
    v11 = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;
  }

- (void)_didStopAudioStream
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSVoiceTriggerFirstPassJarvis _didStopAudioStream]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }

  kdebug_trace(722472268LL, 0LL, 0LL, 0LL, 0LL);
  -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](self, "_clearTriggerCandidate");
  -[CSSPGEndpointAnalyzer stop](self->_endpointAnalyzer, "stop");
  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100064484;
  v5[3] = &unk_10022F020;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100064330;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_handleAudioChunk:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_10027FDF0;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_10027FDF0, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace(722472260LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v5 = qword_10027FDF0;
  }

  qword_10027FDF0 = v5 + 1;
  if (self->_currentAsset)
  {
    uint64_t v6 = qword_10027FDF8;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_10027FDF8, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      id v7 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
      {
        BOOL isSecondPassRunning = self->_isSecondPassRunning;
        BOOL isSiriClientListening = self->_isSiriClientListening;
        int v18 = 136315906;
        v19 = "-[CSVoiceTriggerFirstPassJarvis _handleAudioChunk:]";
        __int16 v20 = 2050;
        uint64_t v21 = v6;
        __int16 v22 = 1026;
        BOOL v23 = isSecondPassRunning;
        __int16 v24 = 1026;
        BOOL v25 = isSiriClientListening;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s NDEAPI Jarvis first pass heart beat %{public}llu, isSecondPassRunning? %{public}d, isSiriClientListening? %{public}d",  (uint8_t *)&v18,  0x22u);
        uint64_t v6 = qword_10027FDF8;
      }
    }

    qword_10027FDF8 = v6 + 1;
    if (!self->_isSecondPassRunning && !self->_isSiriClientListening)
    {
      unint64_t numProcessedSamples = self->_numProcessedSamples;
      v11 = (char *)[v4 numSamples] + numProcessedSamples;
      audioFileWriter = self->_audioFileWriter;
      id v13 = objc_claimAutoreleasedReturnValue([v4 data]);
      -[CSPlainAudioFileWriter addSamples:numSamples:]( audioFileWriter,  "addSamples:numSamples:",  [v13 bytes],  objc_msgSend(v4, "numSamples"));

      if ((unint64_t)v11 < self->_jarvisVoiceTriggerTimeout || self->_hasReceivedNDEAPIResult)
      {
        id v14 = -[CSKeywordAnalyzerNDEAPI processAudioChunk:](self->_keywordAnalyzerNDEAPI, "processAudioChunk:", v4);
        self->_numProcessedSamples += (unint64_t)[v4 numSamples];
        endpointAnalyzer = self->_endpointAnalyzer;
        v16 = (void *)objc_claimAutoreleasedReturnValue([v4 dataForChannel:self->_activeChannel]);
        -[CSSPGEndpointAnalyzer addAudio:numSamples:]( endpointAnalyzer,  "addAudio:numSamples:",  v16,  [v4 numSamples]);
      }

      else
      {
        -[CSVoiceTriggerFirstPassJarvis _notifyJarvisVoiceTriggerReject](self, "_notifyJarvisVoiceTriggerReject");
      }
    }
  }

  else
  {
    uint64_t v17 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      v19 = "-[CSVoiceTriggerFirstPassJarvis _handleAudioChunk:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Could not find Assets. Cannot process Audio",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_hasReceivedNDEAPIResult)
  {
    self->_hasReceivedNDEAPIResult = 1;
    objc_storeStrong((id *)&self->_jarvisTriggerResult, a4);
    -[CSVoiceTriggerFirstPassJarvis _reportJarvisVoiceTriggerFire](self, "_reportJarvisVoiceTriggerFire");
    -[CSVoiceTriggerFirstPassJarvis _reset](self, "_reset");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.jarvis", 0LL, 0LL, 1u);
    int v10 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      int v12 = "-[CSVoiceTriggerFirstPassJarvis keywordAnalyzerNDEAPI:hasResultAvailable:forChannel:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Send Jarvis Myriad notification",  (uint8_t *)&v11,  0xCu);
    }
  }

  [v7 reset];
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, uint64_t))a5;
  if ([v9 type] != (id)6)
  {
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  114LL,  0LL));
LABEL_8:
    id v14 = (void *)v13;
    v10[2](v10, 0LL, v13);

    goto LABEL_14;
  }

  if (!-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording]( self->_otherAppRecordingStateMonitor,  "isOtherNonEligibleAppRecording"))
  {
    float v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v16 = [v15 voiceTriggerEnabled];

    if (v16)
    {
      objc_initWeak((id *)location, self);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceId]);
      int v18 = (void *)objc_claimAutoreleasedReturnValue([v9 activationInfo]);
      id v19 = [v9 hosttime];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000642A8;
      v20[3] = &unk_10022BF00;
      objc_copyWeak(&v22, (id *)location);
      uint64_t v21 = v10;
      -[CSVoiceTriggerFirstPassJarvis _didDetectKeywordFromDeviceId:activationInfo:triggerHostTime:completion:]( self,  "_didDetectKeywordFromDeviceId:activationInfo:triggerHostTime:completion:",  v17,  v18,  v19,  v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)location);
      goto LABEL_14;
    }

    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  604LL,  0LL));
    goto LABEL_8;
  }

  int v11 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[CSVoiceTriggerFirstPassJarvis activationEventNotificationHandler:event:completion:]";
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Ignore %{public}@ since there is an other non eligible app recording",  location,  0x16u);
    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_5;
  }

  if (v10)
  {
LABEL_5:
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  610LL,  0LL));
    v10[2](v10, 0LL, (uint64_t)v12);
  }

- (void)spgEndpointAnalyzerDidDetectEndpoint:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000641F4;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleJarvisVoiceTriggerFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6
{
  id v9 = a3;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100063FD4;
  v35[3] = &unk_10022E650;
  id v10 = a6;
  id v36 = v10;
  int v11 = objc_retainBlock(v35);
  if (!self->_rtModel)
  {
    __int16 v24 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CSVoiceTriggerFirstPassJarvis _handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s rtModel is nil!", buf, 0xCu);
    }

    uint64_t v25 = CSErrorDomain;
    uint64_t v26 = 114LL;
    goto LABEL_11;
  }

  int v12 = objc_alloc(&OBJC_CLASS___CSKeywordAnalyzerNDEAPI);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModel modelData](self->_rtModel, "modelData"));
  id v14 = -[CSKeywordAnalyzerNDEAPI initWithBlob:](v12, "initWithBlob:", v13);
  keywordAnalyzerNDEAPI = self->_keywordAnalyzerNDEAPI;
  self->_keywordAnalyzerNDEAPI = v14;

  -[CSKeywordAnalyzerNDEAPI setActiveChannel:](self->_keywordAnalyzerNDEAPI, "setActiveChannel:", self->_activeChannel);
  -[CSKeywordAnalyzerNDEAPI setDelegate:](self->_keywordAnalyzerNDEAPI, "setDelegate:", self);
  if (!self->_keywordAnalyzerNDEAPI)
  {
    v27 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CSVoiceTriggerFirstPassJarvis _handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completion:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s keywordAnalyzerNDEAPI is nil!",  buf,  0xCu);
    }

    uint64_t v25 = CSErrorDomain;
    uint64_t v26 = 506LL;
LABEL_11:
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v25,  v26,  0LL));
    ((void (*)(void *, void, void *))v11[2])(v11, 0LL, v28);
    goto LABEL_17;
  }

  self->_hasReceivedNDEAPIResult = 0;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  self->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v16 * 3.0);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSJarvisTriggerModeMonitor sharedInstance]( &OBJC_CLASS___CSJarvisTriggerModeMonitor,  "sharedInstance"));
  self->_latestTriggerMode = (int64_t)[v17 getTriggerMode];

  if (self->_latestTriggerMode == 2)
  {
    int v18 = objc_alloc(&OBJC_CLASS___CSSPGEndpointAnalyzer);
    LODWORD(v19) = 1161527296;
    __int16 v20 = -[CSSPGEndpointAnalyzer initWithEndpointThreshold:](v18, "initWithEndpointThreshold:", v19);
    endpointAnalyzer = self->_endpointAnalyzer;
    self->_endpointAnalyzer = v20;

    -[CSSPGEndpointAnalyzer setDelegate:](self->_endpointAnalyzer, "setDelegate:", self);
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    self->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v22 * 60.0);
    float v23 = 0.5;
  }

  else
  {
    float v23 = 1.1;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForJarvisWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForJarvisWithDeviceId:",  v9));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
  [v29 setRequestHistoricalAudioDataWithHostTime:1];
  *(float *)&double v30 = v23;
  if ((unint64_t)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v30) >= a5)
  {
    unint64_t v32 = 0LL;
  }

  else
  {
    *(float *)&double v31 = v23;
    unint64_t v32 = a5 - (void)+[CSFTimeUtils secondsToHostTime:](&OBJC_CLASS___CSFTimeUtils, "secondsToHostTime:", v31);
  }

  [v29 setStartRecordingHostTime:v32];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100064104;
  v33[3] = &unk_10022E6A0;
  v33[4] = self;
  v34 = v11;
  -[CSVoiceTriggerFirstPassJarvis _requestStartAudioStreamWitContext:startStreamOption:completion:]( self,  "_requestStartAudioStreamWitContext:startStreamOption:completion:",  v28,  v29,  v33);

LABEL_17:
}

- (void)_requestStartAudioStreamWitContext:(id)a3 startStreamOption:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100063F24;
  v26[3] = &unk_10022E650;
  id v9 = a5;
  id v27 = v9;
  id v10 = a3;
  int v11 = objc_retainBlock(v26);
  speechManager = self->_speechManager;
  id v25 = 0LL;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager audioProviderWithContext:error:]( speechManager,  "audioProviderWithContext:error:",  v10,  &v25));

  id v14 = v25;
  if (v13)
  {
    -[CSVoiceTriggerFirstPassJarvis setAudioProvider:](self, "setAudioProvider:", v13);
    float v15 = objc_alloc_init(&OBJC_CLASS___CSAudioStreamRequest);
    -[CSAudioStreamRequest setRequiresHistoricalBuffer:](v15, "setRequiresHistoricalBuffer:", 1LL);
    uint64_t v17 = (objc_class *)objc_opt_class(self, v16);
    int v18 = NSStringFromClass(v17);
    double v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v24 = 0LL;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v13 audioStreamWithRequest:v15 streamName:v19 error:&v24]);
    id v21 = v24;

    if (v20)
    {
      -[CSVoiceTriggerFirstPassJarvis setAudioStream:](self, "setAudioStream:", v20);
      [v20 setDelegate:self];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100063F38;
      v22[3] = &unk_10022E6A0;
      v22[4] = self;
      float v23 = v11;
      [v20 startAudioStreamWithOption:v8 completion:v22];
    }

    else
    {
      ((void (*)(void *, void, id))v11[2])(v11, 0LL, v21);
    }
  }

  else
  {
    ((void (*)(void *, void, id))v11[2])(v11, 0LL, v14);
  }
}

- (void)_didDetectKeywordFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063CE8;
  block[3] = &unk_10022B5F8;
  id v20 = v12;
  unint64_t v21 = a5;
  block[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(queue, block);
}

- (void)_notifyJarvisVoiceTriggerReject
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numProcessedSamples = self->_numProcessedSamples;
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSVoiceTriggerFirstPassJarvis _notifyJarvisVoiceTriggerReject]";
    __int16 v9 = 2050;
    unint64_t v10 = numProcessedSamples;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Notify jarvis handler reject at: %{public}tu",  buf,  0x16u);
  }

  self->_hasReceivedNDEAPIResult = 1;
  -[CSVoiceTriggerFirstPassJarvis _reset](self, "_reset");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvis audioStream](self, "audioStream"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100063C88;
  v6[3] = &unk_10022E730;
  v6[4] = self;
  [v5 stopAudioStreamWithOption:0 completion:v6];

  -[CSVoiceTriggerFirstPassJarvis _cancelAudioStreamHold](self, "_cancelAudioStreamHold");
}

- (void)_reportJarvisVoiceTriggerFire
{
  v25[0] = kVTEIfirstPassDetectedChannel;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_activeChannel));
  v26[0] = v3;
  v25[1] = kVTEIfirstPassScore;
  -[CSKeywordAnalyzerNDEAPIResult bestScore](self->_jarvisTriggerResult, "bestScore");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v26[1] = v4;
  v25[2] = kVTEIfirstPassStartSampleCount;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSKeywordAnalyzerNDEAPIResult bestStart](self->_jarvisTriggerResult, "bestStart")));
  v26[2] = v5;
  v25[3] = kVTEIfirstPassEndSampleCount;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CSKeywordAnalyzerNDEAPIResult bestEnd](self->_jarvisTriggerResult, "bestEnd")));
  v26[3] = v6;
  v25[4] = kVTEIearlyDetectFiredMachTime;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_earlyDetectFiredMachTime));
  void v26[4] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  5LL));

  __int16 v9 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerFirstPassJarvis _reportJarvisVoiceTriggerFire]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  kdebug_trace(722472272LL, 0LL, 0LL, 0LL, 0LL);
  self->_BOOL isSecondPassRunning = 1;
  -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](self, "_clearTriggerCandidate");
  -[CSSPGEndpointAnalyzer stop](self->_endpointAnalyzer, "stop");
  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
  objc_initWeak(&location, self);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  float v22 = sub_100063B40;
  float v23 = sub_100063B50;
  id v24 = (id)objc_claimAutoreleasedReturnValue( +[CSJarvisTriggerModeMonitor triggerModeStringDescription:]( &OBJC_CLASS___CSJarvisTriggerModeMonitor,  "triggerModeStringDescription:",  self->_latestTriggerMode));
  -[CSVoiceTriggerFirstPassJarvis _createSecondPassIfNeeded](self, "_createSecondPassIfNeeded");
  unint64_t v10 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassRequestOption);
  deviceId = self->_deviceId;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvis audioProvider](self, "audioProvider"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v15 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:]( v10,  "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMe trics:rtModelRequestOptions:",  4LL,  deviceId,  v13,  v8,  v14,  -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance]( self->_secondChanceContext,  "shouldRunAsSecondChance"),  self->_firstpassMetrics,  0LL);

  -[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:]( self->_voiceTriggerSecondPass,  "setSupportsMultiPhraseDetection:",  -[CSVoiceTriggerUserSelectedPhrase multiPhraseSelected](self->_multiPhraseSelectedStatus, "multiPhraseSelected"));
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100063B58;
  v18[3] = &unk_10022B620;
  v18[5] = buf;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:]( voiceTriggerSecondPass,  "handleVoiceTriggerSecondPassFrom:completion:",  v15,  v18);
  firstpassMetrics = self->_firstpassMetrics;
  self->_firstpassMetrics = 0LL;

  objc_destroyWeak(&v19);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 result];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 voiceTriggerEventInfo]);
  uint64_t v13 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    *(_DWORD *)buf = 136315906;
    unint64_t v32 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]";
    __int16 v33 = 1026;
    *(_DWORD *)v34 = (_DWORD)v11;
    *(_WORD *)&v34[4] = 2114;
    *(void *)&v34[6] = v12;
    __int16 v35 = 2114;
    id v36 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Second Pass Result, %{public}d, %{public}@, %{public}@",  buf,  0x26u);
  }

  switch((unint64_t)v11)
  {
    case 1uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v17 = objc_opt_respondsToSelector(WeakRetained, "voiceTriggerDidDetectKeyword:deviceId:");

      if ((v17 & 1) != 0)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidDetectKeyword:v12 deviceId:v9];
        goto LABEL_14;
      }

      break;
    case 2uLL:
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      char v20 = objc_opt_respondsToSelector(v19, "voiceTriggerDidRejected:deviceId:");

      if ((v20 & 1) != 0)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidRejected:v12 deviceId:v9];
        goto LABEL_14;
      }

      break;
    case 3uLL:
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      char v22 = objc_opt_respondsToSelector(v21, "voiceTriggerDidDetectNearMiss:deviceId:");

      if ((v22 & 1) != 0)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidDetectNearMiss:v12 deviceId:v9];
        goto LABEL_14;
      }

      break;
    case 9uLL:
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      char v26 = objc_opt_respondsToSelector(v25, "voiceTriggerDidDetectSpeakerReject:");

      if ((v26 & 1) != 0)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidDetectSpeakerReject:v12];
        goto LABEL_14;
      }

      break;
    default:
      float v23 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        id v18 = v23;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        *(_DWORD *)buf = 136315394;
        unint64_t v32 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]";
        __int16 v33 = 2114;
        *(void *)v34 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "%s VoiceTrigger Second Pass has failed : %{public}@",  buf,  0x16u);

LABEL_14:
      }

      break;
  }

  if ([v8 isSecondChanceCandidate])
  {
    id v27 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondChanceContext),  "initWithWindowStartTime:",  mach_absolute_time());
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v27;
  }

  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0LL;
  }

  queue = (dispatch_queue_s *)self->_queue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000638CC;
  v30[3] = &unk_10022F020;
  v30[4] = self;
  v30[5] = v11;
  dispatch_async(queue, v30);
}

- (void)_createSecondPassIfNeeded
{
  if (!self->_voiceTriggerSecondPass)
  {
    v3 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPass),  "initWithPHSEnabled:",  0LL);
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = v3;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", 4LL);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 3LL);
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
    -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
  }

- (void)_teardownSecondPass
{
  v3 = objc_autoreleasePoolPush();
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  self->_voiceTriggerSecondPass = 0LL;

  objc_autoreleasePoolPop(v3);
}

- (void)_holdAudioStreamWithTimeout:(double)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:]( &OBJC_CLASS___CSAudioStreamHoldRequestOption,  "defaultOptionWithTimeout:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvis audioProvider](self, "audioProvider"));
  uint64_t v5 = (CSAudioStreamHolding *)objc_claimAutoreleasedReturnValue( [v4 holdAudioStreamWithDescription:@"CSVoiceTriggerFirstPassJarvis" option:v7]);
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;
}

- (void)_cancelAudioStreamHold
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvis audioProvider](self, "audioProvider"));
  [v3 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0LL;
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v20 = "-[CSVoiceTriggerFirstPassJarvis siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if (v9)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100063818;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }

  -[CSVoiceTriggerFirstPassJarvis _cancelAudioStreamHold](self, "_cancelAudioStreamHold");
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100063760;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000636B0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI
{
  return self->_keywordAnalyzerNDEAPI;
}

- (void)setKeywordAnalyzerNDEAPI:(id)a3
{
}

- (BOOL)hasReceivedNDEAPIResult
{
  return self->_hasReceivedNDEAPIResult;
}

- (void)setHasReceivedNDEAPIResult:(BOOL)a3
{
  self->_hasReceivedNDEAPIResult = a3;
}

- (BOOL)hasTriggerCandidate
{
  return self->_hasTriggerCandidate;
}

- (void)setHasTriggerCandidate:(BOOL)a3
{
  self->_hasTriggerCandidate = a3;
}

- (unint64_t)numProcessedSamples
{
  return self->_numProcessedSamples;
}

- (void)setNumProcessedSamples:(unint64_t)a3
{
  self->_unint64_t numProcessedSamples = a3;
}

- (unint64_t)jarvisVoiceTriggerTimeout
{
  return self->_jarvisVoiceTriggerTimeout;
}

- (void)setJarvisVoiceTriggerTimeout:(unint64_t)a3
{
  self->_jarvisVoiceTriggerTimeout = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (CSKeywordAnalyzerNDEAPIResult)jarvisTriggerResult
{
  return self->_jarvisTriggerResult;
}

- (void)setJarvisTriggerResult:(id)a3
{
}

- (unint64_t)earlyDetectFiredMachTime
{
  return self->_earlyDetectFiredMachTime;
}

- (void)setEarlyDetectFiredMachTime:(unint64_t)a3
{
  self->_earlyDetectFiredMachTime = a3;
}

- (int64_t)latestTriggerMode
{
  return self->_latestTriggerMode;
}

- (void)setLatestTriggerMode:(int64_t)a3
{
  self->_latestTriggerMode = a3;
}

- (CSSPGEndpointAnalyzer)endpointAnalyzer
{
  return self->_endpointAnalyzer;
}

- (void)setEndpointAnalyzer:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (CSVoiceTriggerRTModel)rtModel
{
  return self->_rtModel;
}

- (void)setRtModel:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_BOOL isSecondPassRunning = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_BOOL isSiriClientListening = a3;
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (BOOL)firstTimeAssetConfigured
{
  return self->_firstTimeAssetConfigured;
}

- (void)setFirstTimeAssetConfigured:(BOOL)a3
{
  self->_firstTimeAssetConfigured = a3;
}

- (NSMutableArray)assetConfigWaitingBuffer
{
  return self->_assetConfigWaitingBuffer;
}

- (void)setAssetConfigWaitingBuffer:(id)a3
{
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (void)setFirstpassMetrics:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)jarvisAudioLoggingFilePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerFirstPassJarvis jarvisAudioLogDirectory]( &OBJC_CLASS___CSVoiceTriggerFirstPassJarvis,  "jarvisAudioLogDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerFirstPassJarvis timeStampString]( &OBJC_CLASS___CSVoiceTriggerFirstPassJarvis,  "timeStampString"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.wav",  v3,  @"-jarvis"));

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:v4]);
  return v5;
}

+ (id)jarvisAudioLogDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 voiceTriggerAudioLogDirectory]);

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
      id v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        BOOL v9 = v7;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
        *(_DWORD *)buf = 136315650;
        id v13 = "+[CSVoiceTriggerFirstPassJarvis jarvisAudioLogDirectory]";
        __int16 v14 = 2114;
        id v15 = v4;
        __int16 v16 = 2114;
        char v17 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Couldn't create jarvis audio logging directory at path %{public}@ %{public}@",  buf,  0x20u);
      }

      id v4 = @"/tmp";
    }
  }

  return v4;
}

+ (id)timeStampString
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);

  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", @"yyyyMMdd-HHmmss");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v4));

  return v5;
}

@end