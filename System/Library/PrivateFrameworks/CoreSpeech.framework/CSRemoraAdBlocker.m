@interface CSRemoraAdBlocker
- (BOOL)hasCancelled;
- (CSAdBlockerLogger)adBlockerLogger;
- (CSAudioStream)audioStream;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSRemoraAdBlocker)init;
- (CSRemoraAdBlocker)initWithHasCancelled:(BOOL)a3 withFingerprintBuffer:(id)a4 withAccessoryId:(id)a5 withAdBlockerLogger:(id)a6;
- (NSHashTable)observers;
- (NSString)accessoryId;
- (NSString)assetVersion;
- (NSUUID)requestMHUUID;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (SHMutableSignature)fingerprintBuffer;
- (SHSession)recognitionSession;
- (id)uniqueAdBlockerStoreManagerObserverIdentifier;
- (unint64_t)startTime;
- (void)_reset;
- (void)accessorySiriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7 forAccessory:(id)a8;
- (void)accessorySiriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5 forAccessory:(id)a6;
- (void)adBlockerStoreHasUpdateWithCatalog:(id)a3 withResetDictionary:(id)a4 withMaxFingerprintBufferSize:(float)a5 withAssetVersion:(id)a6;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)session:(id)a3 didFindMatch:(id)a4;
- (void)setAccessoryId:(id)a3;
- (void)setAdBlockerLogger:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setFingerprintBuffer:(id)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecognitionSession:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)startRemoraAdBlockerWithAudioProvider:(id)a3 withAccessoryId:(id)a4;
- (void)stopRemoraAdBlocker;
- (void)unregisterObserver:(id)a3;
- (void)validateSessions;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4;
@end

@implementation CSRemoraAdBlocker

- (CSRemoraAdBlocker)init
{
  v3 = objc_alloc(&OBJC_CLASS___SHMutableSignature);
  +[CSConfig defaultContinuousFingerprintBufferDurationForRemora]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDurationForRemora");
  v4 = -[SHMutableSignature initWithMaximumSeconds:clipStyle:](v3, "initWithMaximumSeconds:clipStyle:", 1LL);
  v5 = objc_alloc_init(&OBJC_CLASS___CSAdBlockerLogger);
  v6 = -[CSRemoraAdBlocker initWithHasCancelled:withFingerprintBuffer:withAccessoryId:withAdBlockerLogger:]( self,  "initWithHasCancelled:withFingerprintBuffer:withAccessoryId:withAdBlockerLogger:",  0LL,  v4,  0LL,  v5);

  return v6;
}

- (CSRemoraAdBlocker)initWithHasCancelled:(BOOL)a3 withFingerprintBuffer:(id)a4 withAccessoryId:(id)a5 withAdBlockerLogger:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CSRemoraAdBlocker;
  v14 = -[CSRemoraAdBlocker init](&v22, "init");
  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("RemoraAdBlocker", 0LL);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v17;

    v14->_hasCancelled = a3;
    objc_storeStrong((id *)&v14->_fingerprintBuffer, a4);
    objc_storeStrong((id *)&v14->_accessoryId, a5);
    objc_storeStrong((id *)&v14->_adBlockerLogger, a6);
    if (v12) {
      v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v12);
    }
    else {
      v19 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    }
    uuid = v14->_uuid;
    v14->_uuid = v19;
  }

  return v14;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSAccessorySiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSAccessorySiriClientBehaviorMonitor,  "sharedInstance"));
  [v3 unregisterObserver:self];

  v4 = (os_log_s *)CSLogCategoryAdBlocker;
  if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSRemoraAdBlocker dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Remora AdBlocker dealloc", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSRemoraAdBlocker;
  -[CSRemoraAdBlocker dealloc](&v5, "dealloc");
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100108D58;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100108CD8;
    v7[3] = &unk_10022EFD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_reset
{
  v3 = (os_log_s *)CSLogCategoryAdBlocker;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    +[CSConfig defaultContinuousFingerprintBufferDurationForRemora]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDurationForRemora");
    int v11 = 136315394;
    id v12 = "-[CSRemoraAdBlocker _reset]";
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Resetting RemoraAdBlocker with buffer size: %f",  (uint8_t *)&v11,  0x16u);
  }

  objc_super v5 = objc_alloc(&OBJC_CLASS___SHMutableSignature);
  +[CSConfig defaultContinuousFingerprintBufferDurationForRemora]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDurationForRemora");
  v6 = -[SHMutableSignature initWithMaximumSeconds:clipStyle:](v5, "initWithMaximumSeconds:clipStyle:", 1LL);
  fingerprintBuffer = self->_fingerprintBuffer;
  self->_fingerprintBuffer = v6;

  accessoryId = self->_accessoryId;
  self->_accessoryId = 0LL;

  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    -[CSPlainAudioFileWriter endAudio](audioFileWriter, "endAudio");
    v10 = self->_audioFileWriter;
    self->_audioFileWriter = 0LL;
  }

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108C14;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100108B50;
  v8[3] = &unk_10022EFD0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)startRemoraAdBlockerWithAudioProvider:(id)a3 withAccessoryId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_accessoryId && self->_recognitionSession)
  {
    objc_storeStrong((id *)&self->_accessoryId, a4);
    self->_hasCancelled = 0;
    -[CSAdBlockerLogger setHasLogged:](self->_adBlockerLogger, "setHasLogged:", 0LL);
    id v8 = objc_alloc(&OBJC_CLASS___SHMutableSignature);
    +[CSConfig defaultContinuousFingerprintBufferDurationForRemora]( &OBJC_CLASS___CSConfig,  "defaultContinuousFingerprintBufferDurationForRemora");
    id v9 = -[SHMutableSignature initWithMaximumSeconds:clipStyle:](v8, "initWithMaximumSeconds:clipStyle:", 1LL);
    fingerprintBuffer = self->_fingerprintBuffer;
    self->_fingerprintBuffer = v9;

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioStartStreamOption noAlertOption](&OBJC_CLASS___CSAudioStartStreamOption, "noAlertOption"));
    [v11 setRequestHistoricalAudioDataSampleCount:1];
    [v11 setStartRecordingSampleCount:0];
    __int16 v13 = (objc_class *)objc_opt_class(self, v12);
    uint64_t v14 = NSStringFromClass(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v24 = 0LL;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 audioStreamWithRequest:0 streamName:v15 error:&v24]);
    id v17 = v24;

    v18 = (os_log_s *)CSLogCategoryAdBlocker;
    if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_DEFAULT))
    {
      accessoryId = self->_accessoryId;
      *(_DWORD *)buf = 136315394;
      v26 = "-[CSRemoraAdBlocker startRemoraAdBlockerWithAudioProvider:withAccessoryId:]";
      __int16 v27 = 2112;
      v28 = accessoryId;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s Remora adblocker requesting to start stream with accessoryId: %@",  buf,  0x16u);
    }

    if (v16)
    {
      -[CSRemoraAdBlocker setAudioStream:](self, "setAudioStream:", v16);
      [v16 setDelegate:self];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100108954;
      v23[3] = &unk_10022E730;
      v23[4] = self;
      [v16 startAudioStreamWithOption:v11 completion:v23];
    }

    else
    {
      v20 = (void *)CSLogCategoryAdBlocker;
      if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        objc_super v22 = (NSString *)objc_claimAutoreleasedReturnValue([v17 description]);
        *(_DWORD *)buf = 136315394;
        v26 = "-[CSRemoraAdBlocker startRemoraAdBlockerWithAudioProvider:withAccessoryId:]";
        __int16 v27 = 2114;
        v28 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s Failed in requesting audio stream : %{public}@",  buf,  0x16u);
      }

      -[CSRemoraAdBlocker stopRemoraAdBlocker](self, "stopRemoraAdBlocker");
    }
  }
}

- (void)stopRemoraAdBlocker
{
  v3 = (os_log_s *)CSLogCategoryAdBlocker;
  if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSRemoraAdBlocker stopRemoraAdBlocker]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001086C0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6 = (os_log_s *)CSLogCategoryAdBlocker;
  if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[CSRemoraAdBlocker audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v9 = 2050;
    int64_t v10 = a4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s stream stopped unexpectedly : %{public}ld",  (uint8_t *)&v7,  0x16u);
  }

  -[CSRemoraAdBlocker stopRemoraAdBlocker](self, "stopRemoraAdBlocker");
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  unint64_t v6 = qword_100280098;
  if (!(v6 % +[CSUtils loggingHeartbeatRate](&OBJC_CLASS___CSUtils, "loggingHeartbeatRate")))
  {
    int v7 = (void *)CSLogCategoryAdBlocker;
    if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      *(_DWORD *)buf = 136315650;
      __int16 v27 = "-[CSRemoraAdBlocker audioStreamProvider:audioBufferAvailable:]";
      __int16 v28 = 1026;
      unsigned int v29 = [v5 numSamples];
      __int16 v30 = 2050;
      uint64_t v31 = qword_100280098;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s RemoraAdBlocker has received %{public}d samples, heartbeat = %{public}lld",  buf,  0x1Cu);
    }
  }

  ++qword_100280098;
  unsigned int v9 = +[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat");
  int64_t v10 = objc_alloc(&OBJC_CLASS___AVAudioFormat);
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  double v12 = v11;
  if (v9) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = 3LL;
  }
  uint64_t v14 = -[AVAudioFormat initWithCommonFormat:sampleRate:channels:interleaved:]( v10,  "initWithCommonFormat:sampleRate:channels:interleaved:",  v13,  1LL,  0LL,  v12);
  uint64_t v15 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]( [AVAudioPCMBuffer alloc],  "initWithPCMFormat:frameCapacity:",  v14,  [v5 numSamples]);
  -[AVAudioPCMBuffer setFrameLength:](v15, "setFrameLength:", -[AVAudioPCMBuffer frameCapacity](v15, "frameCapacity"));
  if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
  {
    v16 = -[AVAudioPCMBuffer floatChannelData](v15, "floatChannelData");
    char v17 = 2;
  }

  else
  {
    v16 = -[AVAudioPCMBuffer int16ChannelData](v15, "int16ChannelData");
    char v17 = 1;
  }

  v18 = *v16;
  id v19 = objc_claimAutoreleasedReturnValue([v5 dataForChannel:0]);
  memcpy(v18, [v19 bytes], (void)objc_msgSend(v5, "numSamples") << v17);

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001082C8;
  block[3] = &unk_10022EA98;
  block[4] = self;
  id v24 = v5;
  v25 = v15;
  v21 = v15;
  id v22 = v5;
  dispatch_async(queue, block);
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v5 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100107EB4;
  v8[3] = &unk_10022EFD0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)validateSessions
{
  recognitionSession = self->_recognitionSession;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSAccessorySiriClientBehaviorMonitor sharedInstance]( &OBJC_CLASS___CSAccessorySiriClientBehaviorMonitor,  "sharedInstance"));
  id v5 = v4;
  if (recognitionSession) {
    [v4 registerObserver:self];
  }
  else {
    [v4 unregisterObserver:self];
  }
}

- (void)adBlockerStoreHasUpdateWithCatalog:(id)a3 withResetDictionary:(id)a4 withMaxFingerprintBufferSize:(float)a5 withAssetVersion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100107D44;
  block[3] = &unk_10022EA98;
  id v14 = v8;
  id v15 = v9;
  v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

- (void)accessorySiriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7 forAccessory:(id)a8
{
  id v10 = a6;
  if (-[NSString isEqualToString:](self->_accessoryId, "isEqualToString:", a8))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100107CE0;
    v12[3] = &unk_10022EFD0;
    v12[4] = self;
    id v13 = v10;
    dispatch_async(queue, v12);
  }
}

- (void)accessorySiriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5 forAccessory:(id)a6
{
  if (-[NSString isEqualToString:](self->_accessoryId, "isEqualToString:", a6, a4, a5))
  {
    id v7 = (os_log_s *)CSLogCategoryAdBlocker;
    if (os_log_type_enabled(CSLogCategoryAdBlocker, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[CSRemoraAdBlocker accessorySiriClientBehaviorMonitor:willStopStream:reason:forAccessory:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Remora AdBlocker did not find match and client stopped streaming",  (uint8_t *)&v8,  0xCu);
    }

    -[CSRemoraAdBlocker stopRemoraAdBlocker](self, "stopRemoraAdBlocker");
  }

- (id)uniqueAdBlockerStoreManagerObserverIdentifier
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100107C90;
  id v10 = sub_100107CA0;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100107CA8;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSUUID)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (SHSession)recognitionSession
{
  return self->_recognitionSession;
}

- (void)setRecognitionSession:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)hasCancelled
{
  return self->_hasCancelled;
}

- (void)setHasCancelled:(BOOL)a3
{
  self->_hasCancelled = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
}

- (SHMutableSignature)fingerprintBuffer
{
  return self->_fingerprintBuffer;
}

- (void)setFingerprintBuffer:(id)a3
{
}

- (NSString)accessoryId
{
  return self->_accessoryId;
}

- (void)setAccessoryId:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (CSAdBlockerLogger)adBlockerLogger
{
  return self->_adBlockerLogger;
}

- (void)setAdBlockerLogger:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end