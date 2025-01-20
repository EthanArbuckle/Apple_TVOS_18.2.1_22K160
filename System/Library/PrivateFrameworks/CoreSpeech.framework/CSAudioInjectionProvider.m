@interface CSAudioInjectionProvider
+ (id)defaultInjectionProvider;
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)allowZeroInjection;
- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)duckOthersOption;
- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3;
- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3;
- (BOOL)isSessionCurrentlyActivated;
- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4;
- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4;
- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5;
- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5;
- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)shouldSupportOnlyTVRemote;
- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5;
- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4;
- (CSAudioInjectionDevice)builtInDevice;
- (CSAudioInjectionDevice)bundleTvRemote;
- (CSAudioInjectionEngine)builtInAudioInjectionEngine;
- (CSAudioInjectionProvider)init;
- (CSAudioRecordContext)audioRecordContext;
- (NSHashTable)observers;
- (NSMutableArray)connectedDevices;
- (NSMutableDictionary)audioInjectionEngines;
- (NSString)atvRemoteDeviceID;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (float)averagePowerForChannel:(unint64_t)a3;
- (float)didStartDelayInSeconds;
- (float)peakPowerForChannel:(unint64_t)a3;
- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3;
- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3;
- (id)getPlaybackRouteForStreamID:(unint64_t)a3;
- (id)metrics;
- (id)primaryInputDevice;
- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)recordRouteWithRecordDeviceIndicator:(id)a3;
- (id)recordSettingsWithStreamHandleId:(unint64_t)a3;
- (unint64_t)activateEndTime;
- (unint64_t)activateStartTime;
- (unint64_t)alertStartTime;
- (unint64_t)deactivateEndTime;
- (unint64_t)deactivateStartTime;
- (unint64_t)latestPluginStreamId;
- (void)_connectPluginDevice:(id)a3;
- (void)_createSpeechDetectionVADIfNeeded;
- (void)_tearDownSpeechDetectionVADIfNeeded;
- (void)audioEngineAudioChunkForTvAvailable:(id)a3 audioChunk:(id)a4;
- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8;
- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5;
- (void)connectDevice:(id)a3;
- (void)dealloc;
- (void)disconnectDevice:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setActivateEndTime:(unint64_t)a3;
- (void)setActivateStartTime:(unint64_t)a3;
- (void)setAllowZeroInjection:(BOOL)a3;
- (void)setAtvRemoteDeviceID:(id)a3;
- (void)setAudioInjectionEngines:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setBuiltInAudioInjectionEngine:(id)a3;
- (void)setBuiltInDevice:(id)a3;
- (void)setBundleTvRemote:(id)a3;
- (void)setConnectedDevices:(id)a3;
- (void)setContext:(id)a3 completion:(id)a4;
- (void)setDeactivateEndTime:(unint64_t)a3;
- (void)setDeactivateStartTime:(unint64_t)a3;
- (void)setDidStartDelayInSeconds:(float)a3;
- (void)setLatestPluginStreamId:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldSupportOnlyTVRemote:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)start;
- (void)stop;
- (void)unregisterObserver:(id)a3;
- (void)willDestroy;
@end

@implementation CSAudioInjectionProvider

- (CSAudioInjectionProvider)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSAudioInjectionProvider;
  v2 = -[CSAudioInjectionProvider init](&v22, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioInjectionProvider", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    audioInjectionEngines = v2->_audioInjectionEngines;
    v2->_audioInjectionEngines = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    connectedDevices = v2->_connectedDevices;
    v2->_connectedDevices = (NSMutableArray *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v11;

    v2->_latestPluginStreamId = 2LL;
    int v13 = CSIsTV();
    v2->_shouldSupportOnlyTVRemote = v13;
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 UUIDString]);
      atvRemoteDeviceID = v2->_atvRemoteDeviceID;
      v2->_atvRemoteDeviceID = (NSString *)v15;

      v17 = -[CSAudioInjectionDevice initWithDeviceType:deviceName:deviceID:productID:]( objc_alloc(&OBJC_CLASS___CSAudioInjectionDevice),  "initWithDeviceType:deviceName:deviceID:productID:",  5LL,  @"ATVRemoteInput",  v2->_atvRemoteDeviceID,  0LL);
      uint64_t v18 = 56LL;
    }

    else
    {
      v17 = -[CSAudioInjectionDevice initWithDeviceType:deviceName:deviceID:productID:]( objc_alloc(&OBJC_CLASS___CSAudioInjectionDevice),  "initWithDeviceType:deviceName:deviceID:productID:",  1LL,  @"BuiltInMic",  0LL,  0LL);
      uint64_t v18 = 48LL;
    }

    v19 = (CSAudioInjectionDevice **)&v2->CSAudioRecorder_opaque[v18];
    v20 = *(void **)&v2->CSAudioRecorder_opaque[v18];
    *v19 = v17;

    -[NSMutableArray addObject:](v2->_connectedDevices, "addObject:", *v19);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[CSAudioInjectionProvider dealloc]";
    __int16 v8 = 2112;
    uint64_t v9 = uuid;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Dealloc CSAudioInjectionProvider : %@",  buf,  0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAudioInjectionProvider;
  -[CSAudioInjectionProvider dealloc](&v5, "dealloc");
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100092490;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_connectPluginDevice:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[CSAudioInjectionEngineFactory engineWithDeviceType:streamHandleId:]( CSAudioInjectionEngineFactory,  "engineWithDeviceType:streamHandleId:",  [v4 deviceType],  self->_latestPluginStreamId));
  [v7 setDelegate:self];
  [v7 start];
  [v4 setInjectionEngine:v7];
  [v7 attachDevice:v4];

  audioInjectionEngines = self->_audioInjectionEngines;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_latestPluginStreamId));
  -[NSMutableDictionary setObject:forKey:](audioInjectionEngines, "setObject:forKey:", v7, v6);

  ++self->_latestPluginStreamId;
}

- (void)_tearDownSpeechDetectionVADIfNeeded
{
  if ((CSIsWatch(self, a2) & 1) == 0)
  {
    builtInAudioInjectionEngine = self->_builtInAudioInjectionEngine;
    if (builtInAudioInjectionEngine)
    {
      -[CSAudioInjectionEngine stop](builtInAudioInjectionEngine, "stop");
      id v4 = self->_builtInAudioInjectionEngine;
      self->_builtInAudioInjectionEngine = 0LL;

      -[NSMutableDictionary removeObjectForKey:](self->_audioInjectionEngines, "removeObjectForKey:", &off_1002388B0);
    }
  }

- (void)_createSpeechDetectionVADIfNeeded
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_audioInjectionEngines,  "objectForKeyedSubscript:",  &off_1002388B0));

  if (!v3)
  {
    id v4 = -[CSAudioInjectionBuiltInEngine initWithStreamHandleId:]( objc_alloc(&OBJC_CLASS___CSAudioInjectionBuiltInEngine),  "initWithStreamHandleId:",  1LL);
    builtInAudioInjectionEngine = self->_builtInAudioInjectionEngine;
    self->_builtInAudioInjectionEngine = &v4->super;

    -[CSAudioInjectionEngine setDelegate:](self->_builtInAudioInjectionEngine, "setDelegate:", self);
    -[CSAudioInjectionEngine attachDevice:](self->_builtInAudioInjectionEngine, "attachDevice:", self->_builtInDevice);
    -[CSAudioInjectionEngine start](self->_builtInAudioInjectionEngine, "start");
    -[NSMutableDictionary setObject:forKey:]( self->_audioInjectionEngines,  "setObject:forKey:",  self->_builtInAudioInjectionEngine,  &off_1002388B0);
    builtInDevice = self->_builtInDevice;
    id v7 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_audioInjectionEngines,  "objectForKeyedSubscript:",  &off_1002388B0));
    -[CSAudioInjectionDevice setInjectionEngine:](builtInDevice, "setInjectionEngine:", v7);
  }

- (void)stop
{
  dispatch_queue_t v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    __int16 v8 = "-[CSAudioInjectionProvider stop]";
    __int16 v9 = 2112;
    v10 = uuid;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Stopping Audio Injection Provider : %@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000921FC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)primaryInputDevice
{
  if (self->_shouldSupportOnlyTVRemote) {
    v2 = &OBJC_IVAR___CSAudioInjectionProvider__bundleTvRemote;
  }
  else {
    v2 = &OBJC_IVAR___CSAudioInjectionProvider__builtInDevice;
  }
  return *(id *)&self->CSAudioRecorder_opaque[*v2];
}

- (void)connectDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100092198;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)disconnectDevice:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100091FD4;
    v7[3] = &unk_10022EFD0;
    id v8 = v4;
    __int16 v9 = self;
    dispatch_async(queue, v7);
  }
}

- (void)willDestroy
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CSAudioInjectionProvider;
  -[CSAudioInjectionProvider willDestroy](&v2, "willDestroy");
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100091FC0;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
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
  v7[2] = sub_100091FAC;
  v7[3] = &unk_10022EFD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, void))a4;
  if ([v6 isPluginContext])
  {
    if (self->_shouldSupportOnlyTVRemote) {
      [v6 setDeviceId:self->_atvRemoteDeviceID];
    }
    uint64_t v12 = 0LL;
    int v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    queue = (dispatch_queue_s *)self->_queue;
    uint64_t v15 = 0LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100091E3C;
    block[3] = &unk_10022D958;
    block[4] = self;
    id v10 = v6;
    uint64_t v11 = &v12;
    dispatch_async_and_wait(queue, block);
    if (v7) {
      v7[2](v7, v13[3], 1LL, 0LL);
    }

    _Block_object_dispose(&v12, 8);
  }

  else if (v7)
  {
    v7[2](v7, 1LL, 2LL, 0LL);
  }
}

- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100091DF0;
  v10[3] = &unk_10022EFD0;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(queue, v10);

  return 1;
}

- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100091740;
  v30 = sub_100091750;
  id v31 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091BDC;
  block[3] = &unk_10022F088;
  id v10 = v7;
  id v22 = v10;
  v23 = self;
  v25 = &v26;
  id v11 = v8;
  id v24 = v11;
  dispatch_async_and_wait(queue, block);
  uint64_t v12 = v27[5];
  if (v12)
  {
    float didStartDelayInSeconds = self->_didStartDelayInSeconds;
    if (didStartDelayInSeconds <= 0.0)
    {
      [(id)v27[5] startAudioStreamWithOption:v10];
    }

    else
    {
      dispatch_time_t v14 = dispatch_time(0LL, (uint64_t)(float)(didStartDelayInSeconds * 1000000000.0));
      uint64_t v15 = (dispatch_queue_s *)self->_queue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100091DE0;
      v18[3] = &unk_10022EF80;
      v20 = &v26;
      id v19 = v10;
      dispatch_after(v14, v15, v18);
    }
  }

  else
  {
    v16 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CSAudioInjectionProvider startAudioStreamWithOption:recordDeviceIndicator:error:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s AudioInjection Engine is nil",  buf,  0xCu);
    }
  }

  _Block_object_dispose(&v26, 8);
  return v12 != 0;
}

- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAudioInjectionProvider stopAudioStreamWithRecordDeviceIndicator:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = uuid;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Calling stop audio stream : %@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v16 = sub_100091740;
  v17 = sub_100091750;
  id v18 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091B58;
  block[3] = &unk_10022D958;
  dispatch_time_t v14 = buf;
  void block[4] = self;
  id v9 = v5;
  id v13 = v9;
  dispatch_async_and_wait(queue, block);
  uint64_t v10 = *(void *)(*(void *)&buf[8] + 40LL);
  if (v10) {
    [*(id *)(*(void *)&buf[8] + 40) stopAudioStream];
  }

  _Block_object_dispose(buf, 8);
  return v10 != 0;
}

- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  dispatch_time_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_100091740;
  v17 = sub_100091750;
  id v18 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091AD4;
  block[3] = &unk_10022D958;
  uint64_t v12 = &v13;
  void block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async_and_wait(queue, block);
  id v7 = (void *)v14[5];
  if (v7) {
    unsigned __int8 v8 = [v7 isRecording];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)recordRouteWithRecordDeviceIndicator:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100091740;
  v16 = sub_100091750;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091944;
  block[3] = &unk_10022D958;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_async_and_wait(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100091740;
  uint64_t v12 = sub_100091750;
  id v13 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091758;
  block[3] = &unk_10022D9D0;
  void block[5] = &v8;
  block[6] = a3;
  void block[4] = self;
  dispatch_async_and_wait(queue, block);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___CSFAudioDeviceInfo);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioInjectionProvider recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:]( self,  "recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:",  a3,  v6));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioInjectionProvider getPlaybackRouteForStreamID:](self, "getPlaybackRouteForStreamID:", a3));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v11 = -[CSFAudioDeviceInfo initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:]( v7,  "initWithRecordDeviceInfo:playbackRoute:playbackDeviceTypeList:",  v8,  v9,  v10);

  return v11;
}

- (id)recordSettingsWithStreamHandleId:(unint64_t)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = v4;
  if (self->_shouldSupportOnlyTVRemote)
  {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_1002388C8, AVNumberOfChannelsKey);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_1002388E0, AVSampleRateKey);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_1002388F8, AVLinearPCMBitDepthKey);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v7 = [v6 useSpeexForAudioInjection];

    if (v7) {
      uint64_t v8 = &off_100238910;
    }
    else {
      uint64_t v8 = &off_100238928;
    }
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, AVFormatIDKey);
  }

  return v5;
}

- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3
{
  return result;
}

- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3
{
  return 0;
}

- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance", a3));
  LOBYTE(a4) = [v5 setActive:1 withOptions:0x2000 error:a4];

  return (char)a4;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = mach_absolute_time();
  self->_activateStartTime = v7;
  if (CSIsHorseman(v7, v8)
    && (id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance")),
        unsigned __int8 v10 = [v9 setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:1 error:a5],  v9,  (v10 & 1) == 0))
  {
    uint64_t v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v15 = *a5;
      int v16 = 136315394;
      id v17 = "-[CSAudioInjectionProvider activateAudioSessionWithReason:streamHandleId:error:]";
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s CS set AVAudioSession category/options failed with error: %@",  (uint8_t *)&v16,  0x16u);
    }

    return 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    unsigned __int8 v12 = [v11 setActive:1 error:a5];

    self->_activateEndTime = mach_absolute_time();
    return v12;
  }

- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  self->_deactivateStartTime = mach_absolute_time();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  LOBYTE(a5) = [v8 setActive:0 withOptions:a3 error:a5];

  self->_deactivateEndTime = mach_absolute_time();
  return (char)a5;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  self->_deactivateStartTime = mach_absolute_time();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  LOBYTE(a4) = [v7 setActive:0 withOptions:a3 error:a4];

  self->_deactivateEndTime = mach_absolute_time();
  return (char)a4;
}

- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)duckOthersOption
{
  return 1;
}

- (id)getPlaybackRouteForStreamID:(unint64_t)a3
{
  return @"BuiltInSpeaker";
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  return 1;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4
{
  id v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[CSAudioInjectionProvider playRecordStartingAlertAndResetEndpointerFromStream:withAlertOverride:]";
    __int16 v9 = 2048;
    int64_t v10 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s playing start recording alert with override: %lu",  (uint8_t *)&v7,  0x16u);
  }

  return 1;
}

- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4
{
  return 1;
}

- (unint64_t)alertStartTime
{
  return 0LL;
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (BOOL)isSessionCurrentlyActivated
{
  return 0;
}

- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3
{
  return 0LL;
}

- (id)metrics
{
  uint64_t v3 = AVVoiceControllerMetricDataBeginHostTime;
  v17[0] = AVVoiceControllerMetricDataBeginHostTime;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_activateStartTime));
  v18[0] = v4;
  uint64_t v5 = AVVoiceControllerMetricDataEndHostTime;
  v17[1] = AVVoiceControllerMetricDataEndHostTime;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_activateEndTime));
  v18[1] = v6;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));

  v15[0] = v3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_deactivateStartTime));
  v15[1] = v5;
  v16[0] = v8;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_deactivateEndTime));
  v16[1] = v9;
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

  v13[0] = AVVoiceControllerMetricAudioSessionSetActiveTime;
  v13[1] = AVVoiceControllerMetricAudioSessionSetInactiveTime;
  v14[0] = v7;
  v14[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  return v11;
}

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100091610;
  v12[3] = &unk_10022BFA0;
  id v13 = v9;
  unint64_t v14 = a4;
  BOOL v15 = a5;
  v12[4] = self;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v13 = a5;
  id v14 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  void v18[2] = sub_100091478;
  v18[3] = &unk_10022C788;
  BOOL v23 = a8;
  void v18[4] = self;
  id v19 = v13;
  id v20 = v14;
  unint64_t v21 = a4;
  unint64_t v22 = a7;
  id v16 = v14;
  id v17 = v13;
  dispatch_async(queue, v18);
}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009134C;
  block[3] = &unk_10022CAA0;
  void block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)audioEngineAudioChunkForTvAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100091214;
  v8[3] = &unk_10022EFD0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (float)didStartDelayInSeconds
{
  return self->_didStartDelayInSeconds;
}

- (void)setDidStartDelayInSeconds:(float)a3
{
  self->_float didStartDelayInSeconds = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSMutableArray)connectedDevices
{
  return self->_connectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
}

- (CSAudioInjectionDevice)builtInDevice
{
  return self->_builtInDevice;
}

- (void)setBuiltInDevice:(id)a3
{
}

- (CSAudioInjectionDevice)bundleTvRemote
{
  return self->_bundleTvRemote;
}

- (void)setBundleTvRemote:(id)a3
{
}

- (CSAudioInjectionEngine)builtInAudioInjectionEngine
{
  return self->_builtInAudioInjectionEngine;
}

- (void)setBuiltInAudioInjectionEngine:(id)a3
{
}

- (NSMutableDictionary)audioInjectionEngines
{
  return self->_audioInjectionEngines;
}

- (void)setAudioInjectionEngines:(id)a3
{
}

- (unint64_t)latestPluginStreamId
{
  return self->_latestPluginStreamId;
}

- (void)setLatestPluginStreamId:(unint64_t)a3
{
  self->_latestPluginStreamId = a3;
}

- (unint64_t)activateStartTime
{
  return self->_activateStartTime;
}

- (void)setActivateStartTime:(unint64_t)a3
{
  self->_activateStartTime = a3;
}

- (unint64_t)activateEndTime
{
  return self->_activateEndTime;
}

- (void)setActivateEndTime:(unint64_t)a3
{
  self->_activateEndTime = a3;
}

- (unint64_t)deactivateStartTime
{
  return self->_deactivateStartTime;
}

- (void)setDeactivateStartTime:(unint64_t)a3
{
  self->_deactivateStartTime = a3;
}

- (unint64_t)deactivateEndTime
{
  return self->_deactivateEndTime;
}

- (void)setDeactivateEndTime:(unint64_t)a3
{
  self->_deactivateEndTime = a3;
}

- (NSString)atvRemoteDeviceID
{
  return self->_atvRemoteDeviceID;
}

- (void)setAtvRemoteDeviceID:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (BOOL)allowZeroInjection
{
  return self->_allowZeroInjection;
}

- (void)setAllowZeroInjection:(BOOL)a3
{
  self->_allowZeroInjection = a3;
}

- (BOOL)shouldSupportOnlyTVRemote
{
  return self->_shouldSupportOnlyTVRemote;
}

- (void)setShouldSupportOnlyTVRemote:(BOOL)a3
{
  self->_shouldSupportOnlyTVRemote = a3;
}

- (void).cxx_destruct
{
}

+ (id)defaultInjectionProvider
{
  if (qword_10027FE78 != -1) {
    dispatch_once(&qword_10027FE78, &stru_10022BCF0);
  }
  return (id)qword_10027FE80;
}

@end