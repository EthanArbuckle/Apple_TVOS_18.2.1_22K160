@interface CSVoiceTriggerFirstPassJarvisAP
- (BOOL)_shouldProcessAudio;
- (BOOL)isAPJarvisFirstPassEnabled;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStream)audioStream;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzerNDAPI;
- (CSOSTransaction)secondPassTransaction;
- (CSPolicy)voiceTriggerJarvisAPEnabledPolicy;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassJarvisAP)init;
- (CSVoiceTriggerFirstPassJarvisAP)initWithSpeechManager:(id)a3 siriClientBehaviorMonitor:(id)a4;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (NSMutableArray)audioStreamHoldings;
- (NSString)deviceId;
- (OS_dispatch_group)recordingWillStartGroup;
- (OS_dispatch_queue)queue;
- (float)keywordThreshold;
- (unint64_t)heartbeatFactor;
- (void)_addAudioStreamHold:(id)a3;
- (void)_cancelLastAudioStreamHold;
- (void)_createSecondPass;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopListening;
- (void)_teardownSecondPass;
- (void)_transitJarvisAPEnable:(BOOL)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHoldings:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setHeartbeatFactor:(unint64_t)a3;
- (void)setIsAPJarvisFirstPassEnabled:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setKeywordAnalyzerNDAPI:(id)a3;
- (void)setKeywordThreshold:(float)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingWillStartGroup:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSecondPassTransaction:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerJarvisAPEnabledPolicy:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)shouldProcessAudio:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassJarvisAP

- (CSVoiceTriggerFirstPassJarvisAP)initWithSpeechManager:(id)a3 siriClientBehaviorMonitor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassJarvisAP;
  v8 = -[CSVoiceTriggerFirstPassJarvisAP init](&v23, "init");
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("CSVoiceTriggerFirstPassJarvisAP", 0LL);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    recordingWillStartGroup = v8->_recordingWillStartGroup;
    v8->_recordingWillStartGroup = (OS_dispatch_group *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    audioStreamHoldings = v8->_audioStreamHoldings;
    v8->_audioStreamHoldings = (NSMutableArray *)v13;

    +[CSConfig inputRecordingBufferDuration](&OBJC_CLASS___CSConfig, "inputRecordingBufferDuration");
    v8->_heartbeatFactor = (unint64_t)(2.0 / v15);
    if (v6) {
      v16 = (CSSpeechManager *)v6;
    }
    else {
      v16 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
    }
    speechManager = v8->_speechManager;
    v8->_speechManager = v16;

    if (v7) {
      v18 = (CSSiriClientBehaviorMonitor *)v7;
    }
    else {
      v18 = (CSSiriClientBehaviorMonitor *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    }
    siriClientBehaviorMonitor = v8->_siriClientBehaviorMonitor;
    v8->_siriClientBehaviorMonitor = v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerJarvisAPEnabledPolicy sharedInstance]( &OBJC_CLASS___CSVoiceTriggerJarvisAPEnabledPolicy,  "sharedInstance"));
    voiceTriggerJarvisAPEnabledPolicy = v8->_voiceTriggerJarvisAPEnabledPolicy;
    v8->_voiceTriggerJarvisAPEnabledPolicy = (CSPolicy *)v20;
  }

  return v8;
}

- (CSVoiceTriggerFirstPassJarvisAP)init
{
  return -[CSVoiceTriggerFirstPassJarvisAP initWithSpeechManager:siriClientBehaviorMonitor:]( self,  "initWithSpeechManager:siriClientBehaviorMonitor:",  0LL,  0LL);
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A8B94;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  v3 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSVoiceTriggerFirstPassJarvisAP dealloc]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerFirstPassJarvisAP is deallocating",  buf,  0xCu);
  }

  -[CSPolicy setCallback:](self->_voiceTriggerJarvisAPEnabledPolicy, "setCallback:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassJarvisAP;
  -[CSVoiceTriggerFirstPassJarvisAP dealloc](&v4, "dealloc");
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A8B88;
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
  }

  else
  {
    id v7 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      dispatch_queue_t v9 = "-[CSVoiceTriggerFirstPassJarvisAP _setAsset:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s asset is nil, stop initialization",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_reset
{
}

- (void)_startListenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000A897C;
  v44[3] = &unk_10022E650;
  id v6 = v4;
  id v45 = v6;
  id v7 = objc_retainBlock(v44);
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:]( &OBJC_CLASS___CSVoiceTriggerSecondPassConfigDecoder,  "decodeConfigFrom:forFirstPassSource:",  self->_currentAsset,  4LL));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 configPathNDAPI]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self->_currentAsset, "resourcePath"));
  v39 = (void *)v9;
  dispatch_group_t v11 = -[CSKeywordAnalyzerNDAPI initWithConfigPath:resourcePath:]( objc_alloc(&OBJC_CLASS___CSKeywordAnalyzerNDAPI),  "initWithConfigPath:resourcePath:",  v9,  v10);
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = v11;

  -[CSKeywordAnalyzerNDAPI getThreshold](self->_keywordAnalyzerNDAPI, "getThreshold");
  self->_keywordThreshold = v13;
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_keywordAnalyzerNDAPI, "setActiveChannel:", 0LL);
  deviceId = self->_deviceId;
  self->_deviceId = 0LL;

  double v15 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recordRoute]);
  LODWORD(v9) = +[CSUtils isJarvisAudioRouteWithRecordRoute:]( &OBJC_CLASS___CSUtils,  "isJarvisAudioRouteWithRecordRoute:",  v16);

  if ((_DWORD)v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[CSSiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSSiriClientBehaviorMonitor,  "sharedInstance"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue([v17 deviceId]);
    v19 = self->_deviceId;
    self->_deviceId = v18;
  }

  if (self->_deviceId)
  {
    v38 = v8;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForJarvisWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForJarvisWithDeviceId:"));
    speechManager = self->_speechManager;
    id v43 = 0LL;
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager audioProviderWithContext:error:]( speechManager,  "audioProviderWithContext:error:",  v20,  &v43));
    id v23 = v43;
    -[CSVoiceTriggerFirstPassJarvisAP setAudioProvider:](self, "setAudioProvider:", v22);
    if (v22)
    {
      id v36 = v23;
      id v37 = v6;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  v20));
      [v24 setClientIdentity:2];
      v26 = (objc_class *)objc_opt_class(self, v25);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      id v42 = 0LL;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v22 audioStreamWithRequest:v24 streamName:v28 error:&v42]);
      id v30 = v42;

      if (v29)
      {
        -[CSVoiceTriggerFirstPassJarvisAP setAudioStream:](self, "setAudioStream:", v29);
        [v29 setDelegate:self];
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvisAP audioStream](self, "audioStream"));

        if (v31)
        {
          v32 = (os_log_s *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s Entering recordWillStartGroup",  buf,  0xCu);
          }

          dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStartStreamOption noAlertOption]( &OBJC_CLASS___CSAudioStartStreamOption,  "noAlertOption"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvisAP audioStream](self, "audioStream"));
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472LL;
          v40[2] = sub_1000A8990;
          v40[3] = &unk_10022E6A0;
          v40[4] = self;
          v41 = v7;
          [v34 startAudioStreamWithOption:v33 completion:v40];
        }
      }

      else
      {
        ((void (*)(void *, void, id))v7[2])(v7, 0LL, v30);
      }

      id v23 = v36;
      id v6 = v37;
    }

    else
    {
      id v30 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  1451LL,  0LL));
      ((void (*)(void *, void, id))v7[2])(v7, 0LL, v30);
    }

    int v8 = v38;
  }

  else
  {
    v35 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%s JarvisAP deviceId is nil, skip starting",  buf,  0xCu);
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  509LL,  0LL));
    ((void (*)(void *, void, void *))v7[2])(v7, 0LL, v20);
  }
}

- (void)_stopListening
{
  v3 = objc_autoreleasePoolPush();
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = 0LL;

  objc_autoreleasePoolPop(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvisAP audioStream](self, "audioStream"));

  if (v5)
  {
    id v6 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      dispatch_group_t v11 = "-[CSVoiceTriggerFirstPassJarvisAP _stopListening]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Waiting for recordWillStartGroup before scheduling stpoAudioStream",  buf,  0xCu);
    }

    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A87C4;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_group_notify((dispatch_group_t)recordingWillStartGroup, queue, block);
  }

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A8784;
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
  v8[2] = sub_1000A859C;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (BOOL)_shouldProcessAudio
{
  return !self->_isSiriClientListening && !self->_isSecondPassRunning && self->_isAPJarvisFirstPassEnabled;
}

- (void)shouldProcessAudio:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A855C;
  v7[3] = &unk_10022EB58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    [v8 bestScore];
    float v11 = v10;
    uint64_t v12 = qword_10027FEF0;
    if (!(qword_10027FEF0 % self->_heartbeatFactor))
    {
      float v13 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v34 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v35 = 2050;
        double v36 = v11;
        __int16 v37 = 2050;
        uint64_t v38 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Jarvis AP first pass best score = %{public}.3f for heartbeat = %{public}lld",  buf,  0x20u);
        uint64_t v12 = qword_10027FEF0;
      }
    }

    qword_10027FEF0 = v12 + 1;
    if (v11 >= self->_keywordThreshold)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.jarvis", 0LL, 0LL, 1u);
      double v15 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Send Jarvis Myriad notification",  buf,  0xCu);
      }

      v31[0] = kVTEIfirstPassScore;
      *(float *)&double v16 = v11;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v16));
      v32[0] = v17;
      v31[1] = kVTEIfirstPassStartSampleCount;
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 bestStart]));
      v32[1] = v18;
      v31[2] = kVTEIfirstPassEndSampleCount;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 bestEnd]));
      v32[2] = v19;
      v31[3] = kVTEIfirstPassFireSampleCount;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 samplesAtFire]));
      v32[3] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  4LL));

      v22 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v34 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v35 = 2112;
        double v36 = *(double *)&v9;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Detected : %@, %@", buf, 0x20u);
      }

      [v7 reset];
      -[CSVoiceTriggerFirstPassJarvisAP _createSecondPass](self, "_createSecondPass");
      self->_isSecondPassRunning = 1;
      -[CSVoiceTriggerFirstPassJarvisAP _addAudioStreamHold:]( self,  "_addAudioStreamHold:",  @"Jarvis AP first pass triggered");
      objc_initWeak((id *)buf, self);
      id v23 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassRequestOption);
      deviceId = self->_deviceId;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioProvider UUID](self->_audioProvider, "UUID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v27 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:]( v23,  "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpa ssMetrics:rtModelRequestOptions:",  4LL,  deviceId,  v25,  v21,  v26,  -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance]( self->_secondChanceContext,  "shouldRunAsSecondChance"),  0LL,  0LL);

      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000A83F0;
      v29[3] = &unk_10022C1D0;
      objc_copyWeak(&v30, (id *)buf);
      -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:]( voiceTriggerSecondPass,  "handleVoiceTriggerSecondPassFrom:completion:",  v27,  v29);
      objc_destroyWeak(&v30);

      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 result];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 voiceTriggerEventInfo]);
  float v13 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    int v27 = 136315906;
    v28 = "-[CSVoiceTriggerFirstPassJarvisAP _handleSecondPassResult:deviceId:error:]";
    __int16 v29 = 1024;
    *(_DWORD *)id v30 = (_DWORD)v11;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v12;
    __int16 v31 = 2114;
    v32 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Second Pass Result, %d, %{public}@, %{public}@",  (uint8_t *)&v27,  0x26u);
  }

  self->_isSecondPassRunning = 0;
  if (v11 == (id)3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = objc_opt_respondsToSelector(WeakRetained, "voiceTriggerDidDetectNearMiss:deviceId:");

    if ((v20 & 1) == 0) {
      goto LABEL_14;
    }
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 voiceTriggerDidDetectNearMiss:v12 deviceId:v9];
    goto LABEL_12;
  }

  if (v11 == (id)2)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = objc_opt_respondsToSelector(v21, "voiceTriggerDidRejected:deviceId:");

    if ((v22 & 1) == 0) {
      goto LABEL_14;
    }
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 voiceTriggerDidRejected:v12 deviceId:v9];
    goto LABEL_12;
  }

  if (v11 == (id)1)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector(v16, "voiceTriggerDidDetectKeyword:deviceId:");

    if ((v17 & 1) == 0) {
      goto LABEL_14;
    }
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 voiceTriggerDidDetectKeyword:v12 deviceId:v9];
    goto LABEL_12;
  }

  id v23 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    id v18 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    int v27 = 136315394;
    v28 = "-[CSVoiceTriggerFirstPassJarvisAP _handleSecondPassResult:deviceId:error:]";
    __int16 v29 = 2114;
    *(void *)id v30 = v26;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "%s VoiceTrigger Second Pass has failed : %{public}@",  (uint8_t *)&v27,  0x16u);

LABEL_12:
  }

- (void)_addAudioStreamHold:(id)a3
{
  id v4 = a3;
  id v6 = [[CSAudioStreamHoldRequestOption alloc] initWithTimeout:2 clientIdentity:0 requireRecordModeLock:0 requireListeningMicIndicatorLock:5.0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioProvider holdAudioStreamWithDescription:option:]( self->_audioProvider,  "holdAudioStreamWithDescription:option:",  v4,  v6));

  -[NSMutableArray addObject:](self->_audioStreamHoldings, "addObject:", v5);
}

- (void)_cancelLastAudioStreamHold
{
  if (-[NSMutableArray count](self->_audioStreamHoldings, "count"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_audioStreamHoldings, "lastObject"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvisAP audioProvider](self, "audioProvider"));
    [v3 cancelAudioStreamHold:v4];

    -[NSMutableArray removeLastObject](self->_audioStreamHoldings, "removeLastObject");
  }

- (void)_createSecondPass
{
  if (!self->_voiceTriggerSecondPass)
  {
    v3 = -[CSOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CSOSTransaction),  "initWithDescription:",  @"VoiceTrigger SecondPass");
    secondPassTransaction = self->_secondPassTransaction;
    self->_secondPassTransaction = v3;

    id v5 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPass),  "initWithPHSEnabled:",  0LL);
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = v5;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", 4LL);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 3LL);
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassJarvisAP delegate](self, "delegate"));
    -[CSVoiceTriggerSecondPass setDelegate:](self->_voiceTriggerSecondPass, "setDelegate:", v7);

    -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
  }

- (void)_teardownSecondPass
{
  v3 = objc_autoreleasePoolPush();
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  self->_voiceTriggerSecondPass = 0LL;

  objc_autoreleasePoolPop(v3);
  secondPassTransaction = self->_secondPassTransaction;
  self->_secondPassTransaction = 0LL;
}

- (void)_transitJarvisAPEnable:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A83BC;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
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
    char v20 = "-[CSVoiceTriggerFirstPassJarvisAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if (v9)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A8308;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A8250;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A81A0;
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

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzerNDAPI
{
  return self->_keywordAnalyzerNDAPI;
}

- (void)setKeywordAnalyzerNDAPI:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setRecordingWillStartGroup:(id)a3
{
}

- (BOOL)isAPJarvisFirstPassEnabled
{
  return self->_isAPJarvisFirstPassEnabled;
}

- (void)setIsAPJarvisFirstPassEnabled:(BOOL)a3
{
  self->_isAPJarvisFirstPassEnabled = a3;
}

- (float)keywordThreshold
{
  return self->_keywordThreshold;
}

- (void)setKeywordThreshold:(float)a3
{
  self->_keywordThreshold = a3;
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (CSOSTransaction)secondPassTransaction
{
  return self->_secondPassTransaction;
}

- (void)setSecondPassTransaction:(id)a3
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

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
}

- (NSMutableArray)audioStreamHoldings
{
  return self->_audioStreamHoldings;
}

- (void)setAudioStreamHoldings:(id)a3
{
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSPolicy)voiceTriggerJarvisAPEnabledPolicy
{
  return self->_voiceTriggerJarvisAPEnabledPolicy;
}

- (void)setVoiceTriggerJarvisAPEnabledPolicy:(id)a3
{
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (void).cxx_destruct
{
}

@end