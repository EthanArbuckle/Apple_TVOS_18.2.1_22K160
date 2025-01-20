@interface CSVoiceTriggerFirstPassHearstAP
- (BOOL)_shouldProcessAudio;
- (BOOL)isAPHearstFirstPassEnabled;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStream)audioStream;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzerNDAPI;
- (CSOSTransaction)secondPassTransaction;
- (CSOpportuneSpeakEventMonitor)opportuneSpeakEventMonitor;
- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor;
- (CSPolicy)voiceTriggerHearstAPEnabledPolicy;
- (CSRemoteVADSignalExtractor)remoteVADSignalExtractor;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassHearstAP)init;
- (CSVoiceTriggerFirstPassHearstAP)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 opportuneSpeakEventMonitor:(id)a6 phoneCallStateMonitor:(id)a7 otherAppRecordingStateMonitor:(id)a8 voiceTriggerHearstAPEnabledPolicy:(id)a9;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSMutableArray)audioStreamHoldings;
- (NSString)deviceId;
- (NSString)opportuneSpeakAudioProviderUUID;
- (OS_dispatch_group)recordingWillStartGroup;
- (OS_dispatch_queue)queue;
- (float)keywordThreshold;
- (id)_fetchDeviceId;
- (unint64_t)heartbeatFactor;
- (void)_addAudioStreamHold:(id)a3;
- (void)_cancelLastAudioStreamHold;
- (void)_createSecondPass;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_startListenWithAudioProviderUUID:(id)a3 completion:(id)a4;
- (void)_stopListening;
- (void)_teardownSecondPass;
- (void)_transitHearstAPEnable:(BOOL)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)dealloc;
- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHoldings:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setHeartbeatFactor:(unint64_t)a3;
- (void)setIsAPHearstFirstPassEnabled:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setKeywordAnalyzerNDAPI:(id)a3;
- (void)setKeywordThreshold:(float)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setOpportuneSpeakAudioProviderUUID:(id)a3;
- (void)setOpportuneSpeakEventMonitor:(id)a3;
- (void)setOtherAppRecordingStateMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingWillStartGroup:(id)a3;
- (void)setRemoteVADSignalExtractor:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSecondPassTransaction:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerHearstAPEnabledPolicy:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)shouldProcessAudio:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassHearstAP

- (CSVoiceTriggerFirstPassHearstAP)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 opportuneSpeakEventMonitor:(id)a6 phoneCallStateMonitor:(id)a7 otherAppRecordingStateMonitor:(id)a8 voiceTriggerHearstAPEnabledPolicy:(id)a9
{
  id v28 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassHearstAP;
  v18 = -[CSVoiceTriggerFirstPassHearstAP init](&v29, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_speechManager, a3);
    objc_storeStrong((id *)&v19->_siriClientBehaviorMonitor, a5);
    objc_storeStrong((id *)&v19->_opportuneSpeakEventMonitor, a6);
    objc_storeStrong((id *)&v19->_otherAppRecordingStateMonitor, a8);
    objc_storeStrong((id *)&v19->_voiceTriggerHearstAPEnabledPolicy, a9);
    dispatch_queue_t v20 = dispatch_queue_create("CSVoiceTriggerFirstPassHearstAP", 0LL);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    dispatch_group_t v22 = dispatch_group_create();
    recordingWillStartGroup = v19->_recordingWillStartGroup;
    v19->_recordingWillStartGroup = (OS_dispatch_group *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    audioStreamHoldings = v19->_audioStreamHoldings;
    v19->_audioStreamHoldings = (NSMutableArray *)v24;

    +[CSConfig inputRecordingBufferDuration](&OBJC_CLASS___CSConfig, "inputRecordingBufferDuration");
    v19->_heartbeatFactor = (unint64_t)(2.0 / v26);
  }

  return v19;
}

- (CSVoiceTriggerFirstPassHearstAP)init
{
  return -[CSVoiceTriggerFirstPassHearstAP initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:opportuneSpeakEventMonitor:phoneCallStateMonitor:otherAppRecordingStateMonitor:voiceTriggerHearstAPEnabledPolicy:]( self,  "initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:opportuneSpeakEventMonitor:phoneCa llStateMonitor:otherAppRecordingStateMonitor:voiceTriggerHearstAPEnabledPolicy:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005A9A8;
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
    v6 = "-[CSVoiceTriggerFirstPassHearstAP dealloc]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s CSVoiceTriggerFirstPassHearstAP is deallocating",  buf,  0xCu);
  }

  -[CSPolicy setCallback:](self->_voiceTriggerHearstAPEnabledPolicy, "setCallback:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerFirstPassHearstAP;
  -[CSVoiceTriggerFirstPassHearstAP dealloc](&v4, "dealloc");
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005A99C;
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
    v7 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[CSVoiceTriggerFirstPassHearstAP _setAsset:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s asset is nil, stop initialization",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_reset
{
}

- (void)_startListenWithAudioProviderUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (os_log_s *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10005A724;
  v51[3] = &unk_10022E6A0;
  v51[4] = self;
  id v9 = v7;
  id v52 = v9;
  v10 = objc_retainBlock(v51);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:forFirstPassSource:]( &OBJC_CLASS___CSVoiceTriggerSecondPassConfigDecoder,  "decodeConfigFrom:forFirstPassSource:",  self->_currentAsset,  6LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 configPathNDAPI]);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self->_currentAsset, "resourcePath"));
  v13 = -[CSKeywordAnalyzerNDAPI initWithConfigPath:resourcePath:]( objc_alloc(&OBJC_CLASS___CSKeywordAnalyzerNDAPI),  "initWithConfigPath:resourcePath:",  v12,  v46);
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = v13;

  -[CSKeywordAnalyzerNDAPI getThreshold](self->_keywordAnalyzerNDAPI, "getThreshold");
  self->_keywordThreshold = v15;
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_keywordAnalyzerNDAPI, "setActiveChannel:", 0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 wearerDetectionConfig]);
  [v16 threshold];
  float v18 = v17;

  if (v18 <= 0.0)
  {
    remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
    self->_remoteVADSignalExtractor = 0LL;
  }

  else
  {
    v19 = -[CSRemoteVADSignalExtractor initWithToken:]( objc_alloc(&OBJC_CLASS___CSRemoteVADSignalExtractor),  "initWithToken:",  @"CSVoiceTriggerFirstPassHearstAP");
    remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
    self->_remoteVADSignalExtractor = v19;
  }

  speechManager = self->_speechManager;
  if (speechManager) {
    dispatch_group_t v22 = speechManager;
  }
  else {
    dispatch_group_t v22 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue( +[CSSpeechManager sharedManagerForCoreSpeechDaemon]( &OBJC_CLASS___CSSpeechManager,  "sharedManagerForCoreSpeechDaemon"));
  }
  v23 = v22;
  uint64_t v24 = (NSString *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassHearstAP _fetchDeviceId](self, "_fetchDeviceId"));
  deviceId = self->_deviceId;
  self->_deviceId = v24;

  if (!self->_deviceId)
  {
    uint64_t v28 = CSErrorDomain;
    uint64_t v29 = 1452LL;
    goto LABEL_13;
  }

  uint64_t v26 = objc_claimAutoreleasedReturnValue(-[CSSpeechManager audioProviderWithUUID:](v23, "audioProviderWithUUID:", v6));
  if (!v26)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:]( &OBJC_CLASS___CSAudioRecordContext,  "contextForHearstVoiceTriggerWithDeviceId:",  self->_deviceId));
    uint64_t v50 = 0LL;
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[CSSpeechManager audioProviderWithContext:error:]( v23,  "audioProviderWithContext:error:",  v30,  &v50));

    -[CSVoiceTriggerFirstPassHearstAP setAudioProvider:](self, "setAudioProvider:", v27);
    if (v27) {
      goto LABEL_15;
    }
    uint64_t v28 = CSErrorDomain;
    uint64_t v29 = 1451LL;
LABEL_13:
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v28,  v29,  0LL));
    ((void (*)(void *, void, void *))v10[2])(v10, 0LL, v27);
    goto LABEL_22;
  }

  v27 = (void *)v26;
  -[CSVoiceTriggerFirstPassHearstAP setAudioProvider:](self, "setAudioProvider:", v26);
LABEL_15:
  v31 = (void *)objc_claimAutoreleasedReturnValue( -[CSOpportuneSpeakEventMonitor audioRecordContext]( self->_opportuneSpeakEventMonitor,  "audioRecordContext",  v12,  v9,  v6));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamRequest defaultRequestWithContext:]( &OBJC_CLASS___CSAudioStreamRequest,  "defaultRequestWithContext:",  v31));

  [v32 setClientIdentity:2];
  v34 = (objc_class *)objc_opt_class(self, v33);
  v35 = NSStringFromClass(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  id v49 = 0LL;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v27 audioStreamWithRequest:v32 streamName:v36 error:&v49]);
  id v38 = v49;

  if (v37)
  {
    [v37 setIsWeakStream:1];
    -[CSVoiceTriggerFirstPassHearstAP setAudioStream:](self, "setAudioStream:", v37);
    [v37 setDelegate:self];
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassHearstAP audioStream](self, "audioStream"));

    if (v39)
    {
      v40 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "%s Entering recordWillStartGroup",  buf,  0xCu);
      }

      dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
      [v41 setDisableBoostForDoAP:1];
      [v41 setStartRecordingHostTime:mach_absolute_time()];
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassHearstAP audioStream](self, "audioStream"));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_10005A7A4;
      v47[3] = &unk_10022E6A0;
      v47[4] = self;
      v48 = v10;
      [v42 startAudioStreamWithOption:v41 completion:v47];
    }
  }

  else
  {
    ((void (*)(void *, void, id))v10[2])(v10, 0LL, v38);
  }

  id v9 = v44;
  id v6 = v45;
  v12 = v43;
LABEL_22:
}

- (id)_fetchDeviceId
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAudioStreamActivityMonitor sharedInstance]( &OBJC_CLASS___CSAudioStreamActivityMonitor,  "sharedInstance"));
  unsigned int v4 = [v3 hasNonVoiceTriggerStreamsOrStreamHoldersActive];

  if (!v4)
  {
    if (-[CSOpportuneSpeakEventMonitor isStreaming](self->_opportuneSpeakEventMonitor, "isStreaming"))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSOpportuneSpeakEventMonitor audioRecordContext]( self->_opportuneSpeakEventMonitor,  "audioRecordContext"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceId]);
      id v9 = [v10 copy];

      goto LABEL_6;
    }

    v11 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      id v14 = "-[CSVoiceTriggerFirstPassHearstAP _fetchDeviceId]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "%s FirstPassHearstAP doesn't meet listening condition, set deviceId to nil",  (uint8_t *)&v13,  0xCu);
    }

- (void)_stopListening
{
  v3 = objc_autoreleasePoolPush();
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = 0LL;

  remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
  self->_remoteVADSignalExtractor = 0LL;

  objc_autoreleasePoolPop(v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassHearstAP audioStream](self, "audioStream"));

  if (v6)
  {
    unsigned int v7 = (os_log_s *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSVoiceTriggerFirstPassHearstAP _stopListening]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Waiting for recordWillStartGroup before scheduling stopAudioStream",  buf,  0xCu);
    }

    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005A56C;
    block[3] = &unk_10022F100;
    block[4] = self;
    dispatch_group_notify((dispatch_group_t)recordingWillStartGroup, queue, block);
  }

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005A52C;
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
  v8[2] = sub_10005A30C;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (BOOL)_shouldProcessAudio
{
  return !self->_isSiriClientListening && !self->_isSecondPassRunning && self->_isAPHearstFirstPassEnabled;
}

- (void)shouldProcessAudio:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005A2CC;
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
  if (*(double *)&v8 != 0.0)
  {
    [v8 bestScore];
    float v11 = *(float *)&v10;
    uint64_t v12 = qword_10027FDB8;
    if (!(qword_10027FDB8 % self->_heartbeatFactor))
    {
      int v13 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v38 = 2050;
        double v39 = v11;
        __int16 v40 = 2050;
        uint64_t v41 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Hearst AP first pass best score = %{public}.3f for heartbeat = %{public}lld",  buf,  0x20u);
        uint64_t v12 = qword_10027FDB8;
      }
    }

    qword_10027FDB8 = v12 + 1;
    if (v11 >= self->_keywordThreshold)
    {
      v34[0] = kVTEIfirstPassScore;
      *(float *)&double v10 = v11;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v10));
      v35[0] = v14;
      v34[1] = kVTEIfirstPassStartSampleCount;
      float v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 bestStart]));
      v35[1] = v15;
      v34[2] = kVTEIfirstPassEndSampleCount;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 bestEnd]));
      v35[2] = v16;
      v34[3] = kVTEIfirstPassFireSampleCount;
      float v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 samplesAtFire]));
      v35[3] = v17;
      float v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  4LL));

      v19 = (os_log_s *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v38 = 2112;
        double v39 = *(double *)&v9;
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Detected : %@, %@", buf, 0x20u);
      }

      remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
      if (remoteVADSignalExtractor
        && !-[CSRemoteVADSignalExtractor hasSpeechDetectedFromStartSampleCount:toEndSampleCount:]( remoteVADSignalExtractor,  "hasSpeechDetectedFromStartSampleCount:toEndSampleCount:",  [v9 bestStart],  objc_msgSend(v9, "bestEnd")))
      {
        v21 = (os_log_s *)CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Do not send in-ear myriad trigger since remoteVAD didn't detect speech",  buf,  0xCu);
        }
      }

      else
      {
        +[CSMyriadNotifier notifyInEarMyriadTrigger](&OBJC_CLASS___CSMyriadNotifier, "notifyInEarMyriadTrigger");
      }

      [v7 reset];
      -[CSVoiceTriggerFirstPassHearstAP _createSecondPass](self, "_createSecondPass");
      self->_isSecondPassRunning = 1;
      -[CSVoiceTriggerFirstPassHearstAP _addAudioStreamHold:]( self,  "_addAudioStreamHold:",  @"Hearst AP first pass triggered");
      objc_initWeak((id *)buf, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100059FEC;
      v33[3] = &unk_10022B3A0;
      v33[4] = self;
      dispatch_group_t v22 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions),  "initWithMutableBuilder:",  v33);
      v23 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondPassRequestOption);
      deviceId = self->_deviceId;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioProvider UUID](self->_audioProvider, "UUID"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v27 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:]( v23,  "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpa ssMetrics:rtModelRequestOptions:",  6LL,  deviceId,  v25,  v18,  v26,  -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance]( self->_secondChanceContext,  "shouldRunAsSecondChance"),  0LL,  v22);

      if (-[CSVoiceTriggerRTModelRequestOptions allowMph](v22, "allowMph"))
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerRTModelRequestOptions accessoryInfo](v22, "accessoryInfo"));
        id v29 = [v28 supportsJustSiri];
      }

      else
      {
        id v29 = 0LL;
      }

      -[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:]( self->_voiceTriggerSecondPass,  "setSupportsMultiPhraseDetection:",  v29);
      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10005A160;
      v31[3] = &unk_10022C1D0;
      objc_copyWeak(&v32, (id *)buf);
      -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:]( voiceTriggerSecondPass,  "handleVoiceTriggerSecondPassFrom:completion:",  v27,  v31);
      objc_destroyWeak(&v32);

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
  int v13 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    float v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    int v29 = 136315906;
    v30 = "-[CSVoiceTriggerFirstPassHearstAP _handleSecondPassResult:deviceId:error:]";
    __int16 v31 = 1024;
    *(_DWORD *)id v32 = (_DWORD)v11;
    *(_WORD *)&v32[4] = 2114;
    *(void *)&v32[6] = v12;
    __int16 v33 = 2114;
    v34 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Second Pass Result, %d, %{public}@, %{public}@",  (uint8_t *)&v29,  0x26u);
  }

  self->_isSecondPassRunning = 0;
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
      v23 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        id v18 = v23;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
        int v29 = 136315394;
        v30 = "-[CSVoiceTriggerFirstPassHearstAP _handleSecondPassResult:deviceId:error:]";
        __int16 v31 = 2114;
        *(void *)id v32 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "%s VoiceTrigger Second Pass has failed : %{public}@",  (uint8_t *)&v29,  0x16u);

LABEL_14:
      }

      break;
  }

  if ([v8 isSecondChanceCandidate])
  {
    v27 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerSecondChanceContext),  "initWithWindowStartTime:",  mach_absolute_time());
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v27;
  }

  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0LL;
  }

  if (v11 != (id)1) {
    -[CSVoiceTriggerFirstPassHearstAP _cancelLastAudioStreamHold](self, "_cancelLastAudioStreamHold");
  }
  -[CSVoiceTriggerFirstPassHearstAP _reset](self, "_reset");
}

- (void)_addAudioStreamHold:(id)a3
{
  id v5 = [[CSAudioStreamHoldRequestOption alloc] initWithTimeout:2 clientIdentity:0 requireRecordModeLock:0 requireListeningMicIndicatorLock:5.0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioProvider holdAudioStreamWithDescription:option:]( self->_audioProvider,  "holdAudioStreamWithDescription:option:",  @"CSHearstSecondPassRequest",  v5));
  -[NSMutableArray addObject:](self->_audioStreamHoldings, "addObject:", v4);
}

- (void)_cancelLastAudioStreamHold
{
  if (-[NSMutableArray count](self->_audioStreamHoldings, "count"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_audioStreamHoldings, "lastObject"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassHearstAP audioProvider](self, "audioProvider"));
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

    -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", 6LL);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 2LL);
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVoiceTriggerFirstPassHearstAP delegate](self, "delegate"));
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

- (void)_transitHearstAPEnable:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100059FB4;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSOpportuneSpeakEventMonitor audioProviderUUID]( self->_opportuneSpeakEventMonitor,  "audioProviderUUID",  a3,  a4));
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100059FA8;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
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
    char v20 = "-[CSVoiceTriggerFirstPassHearstAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  if (v9)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100059EF4;
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
  block[2] = sub_100059E3C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059D8C;
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

- (BOOL)isAPHearstFirstPassEnabled
{
  return self->_isAPHearstFirstPassEnabled;
}

- (void)setIsAPHearstFirstPassEnabled:(BOOL)a3
{
  self->_isAPHearstFirstPassEnabled = a3;
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

- (NSString)opportuneSpeakAudioProviderUUID
{
  return self->_opportuneSpeakAudioProviderUUID;
}

- (void)setOpportuneSpeakAudioProviderUUID:(id)a3
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

- (CSOpportuneSpeakEventMonitor)opportuneSpeakEventMonitor
{
  return self->_opportuneSpeakEventMonitor;
}

- (void)setOpportuneSpeakEventMonitor:(id)a3
{
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
}

- (CSPolicy)voiceTriggerHearstAPEnabledPolicy
{
  return self->_voiceTriggerHearstAPEnabledPolicy;
}

- (void)setVoiceTriggerHearstAPEnabledPolicy:(id)a3
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

- (CSRemoteVADSignalExtractor)remoteVADSignalExtractor
{
  return self->_remoteVADSignalExtractor;
}

- (void)setRemoteVADSignalExtractor:(id)a3
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

@end