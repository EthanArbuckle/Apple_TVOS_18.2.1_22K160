@interface CSAudioInjectionRemoraEngine
- (BOOL)alwaysOnVoiceTriggerEnabled;
- (BOOL)injectAudio:(id)a3;
- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6;
- (BOOL)isAlwaysOnVoiceTriggerAvailable;
- (BOOL)isForwarding;
- (BOOL)isRecording;
- (BOOL)voiceTriggerEnabled;
- (CSAudioCircularBuffer)circularBuffer;
- (CSAudioInjectionDevice)connectedDevice;
- (CSAudioInjectionEngineDelegate)delegate;
- (CSAudioInjectionRemoraEngine)initWithStreamHandleId:(unint64_t)a3;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzer;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (unint64_t)lastDetectedVoiceTriggerBeginSampleCount;
- (unint64_t)lastForwardedSampleCount;
- (void)attachDevice:(id)a3;
- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8;
- (void)dealloc;
- (void)setAlwaysOnVoiceTriggerEnabled:(BOOL)a3;
- (void)setCircularBuffer:(id)a3;
- (void)setConnectedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsForwarding:(BOOL)a3;
- (void)setKeywordAnalyzer:(id)a3;
- (void)setLastDetectedVoiceTriggerBeginSampleCount:(unint64_t)a3;
- (void)setLastForwardedSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)start;
- (void)startAudioStreamWithOption:(id)a3;
- (void)stop;
- (void)stopAudioStream;
@end

@implementation CSAudioInjectionRemoraEngine

- (CSAudioInjectionRemoraEngine)initWithStreamHandleId:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSAudioInjectionRemoraEngine;
  v4 = -[CSAudioInjectionEngine initWithStreamHandleId:](&v19, "initWithStreamHandleId:");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("CSAudioInjectionRemoraEngine", 0LL);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_voiceTriggerEnabled = 0;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v4->_uuid;
    v4->_uuid = (NSUUID *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSAudioTimeConverterPool sharedInstance](&OBJC_CLASS___CSAudioTimeConverterPool, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 converterForAudioStreamId:a3]);

    v11 = objc_alloc(&OBJC_CLASS___CSAudioCircularBuffer);
    uint64_t v12 = +[CSConfig inputRecordingNumberOfChannels]( &OBJC_CLASS___CSConfig,  "inputRecordingNumberOfChannels");
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    LODWORD(v14) = v13;
    LODWORD(v15) = 3.0;
    v16 = -[CSAudioCircularBuffer initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:]( v11,  "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:",  v12,  v10,  v15,  v14);
    circularBuffer = v4->_circularBuffer;
    v4->_circularBuffer = v16;
  }

  return v4;
}

- (BOOL)isAlwaysOnVoiceTriggerAvailable
{
  return 1;
}

- (void)setAlwaysOnVoiceTriggerEnabled:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10012C868;
  v4[3] = &unk_10022EFA8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (BOOL)alwaysOnVoiceTriggerEnabled
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012C84C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)attachDevice:(id)a3
{
  id v4 = a3;
  -[CSAudioInjectionRemoraEngine setConnectedDevice:](self, "setConnectedDevice:", v4);
  unsigned int v5 = [v4 enableAlwaysOnVoiceTrigger];

  BOOL v6 = v5 && -[CSAudioInjectionRemoraEngine isAlwaysOnVoiceTriggerAvailable](self, "isAlwaysOnVoiceTriggerAvailable");
  -[CSAudioInjectionRemoraEngine setAlwaysOnVoiceTriggerEnabled:](self, "setAlwaysOnVoiceTriggerEnabled:", v6);
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAudioInjectionRemoraEngine;
  id v4 = a3;
  -[CSAudioInjectionEngine setDelegate:](&v5, "setDelegate:", self);
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)dealloc
{
  char v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[CSAudioInjectionRemoraEngine dealloc]";
    __int16 v8 = 2112;
    char v9 = uuid;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Dealloc CSAudioInjectionEngineRemoraEngine : %@",  buf,  0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAudioInjectionRemoraEngine;
  -[CSAudioInjectionEngine dealloc](&v5, "dealloc");
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012C67C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012C608;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)injectAudio:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAudioInjectionRemoraEngine;
  return -[CSAudioInjectionEngine injectAudio:](&v4, "injectAudio:", a3);
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSAudioInjectionRemoraEngine;
  return -[CSAudioInjectionEngine injectAudio:withScaleFactor:playbackStarted:completion:]( &v7,  "injectAudio:withScaleFactor:playbackStarted:completion:",  a3,  a5,  a6);
}

- (BOOL)isRecording
{
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012C5EC;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startAudioStreamWithOption:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012C4CC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAudioStream
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012C408;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v12 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012C0A8;
  block[3] = &unk_10022E048;
  id v16 = v12;
  v17 = self;
  unint64_t v18 = a4;
  unint64_t v19 = a7;
  BOOL v20 = a8;
  id v14 = v12;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAudioInjectionEngineDelegate)delegate
{
  return (CSAudioInjectionEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setKeywordAnalyzer:(id)a3
{
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setCircularBuffer:(id)a3
{
}

- (unint64_t)lastDetectedVoiceTriggerBeginSampleCount
{
  return self->_lastDetectedVoiceTriggerBeginSampleCount;
}

- (void)setLastDetectedVoiceTriggerBeginSampleCount:(unint64_t)a3
{
  self->_lastDetectedVoiceTriggerBeginSampleCount = a3;
}

- (unint64_t)lastForwardedSampleCount
{
  return self->_lastForwardedSampleCount;
}

- (void)setLastForwardedSampleCount:(unint64_t)a3
{
  self->_lastForwardedSampleCount = a3;
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (CSAudioInjectionDevice)connectedDevice
{
  return (CSAudioInjectionDevice *)objc_loadWeakRetained((id *)&self->_connectedDevice);
}

- (void)setConnectedDevice:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isForwarding
{
  return self->_isForwarding;
}

- (void)setIsForwarding:(BOOL)a3
{
  self->_isForwarding = a3;
}

- (void).cxx_destruct
{
}

@end