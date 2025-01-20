@interface CSAudioInjectionTvRemoteEngine
- (BOOL)alwaysOnVoiceTriggerEnabled;
- (BOOL)injectAudio:(id)a3;
- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6;
- (BOOL)isAlwaysOnVoiceTriggerAvailable;
- (BOOL)isRecording;
- (CSAudioConverter)encoder;
- (CSAudioInjectionDevice)connectedDevice;
- (CSAudioInjectionEngineDelegate)delegate;
- (CSAudioInjectionTvRemoteEngine)initWithStreamHandleId:(unint64_t)a3;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (void)audioConverterDidConvertPackets:(id)a3 packets:(id)a4 durationInSec:(float)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7;
- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8;
- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5;
- (void)setConnectedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncoder:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUuid:(id)a3;
- (void)start;
- (void)startAudioStreamWithOption:(id)a3;
- (void)stop;
- (void)stopAudioStream;
@end

@implementation CSAudioInjectionTvRemoteEngine

- (CSAudioInjectionTvRemoteEngine)initWithStreamHandleId:(unint64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  v3 = -[CSAudioInjectionEngine initWithStreamHandleId:](&v13, "initWithStreamHandleId:", a3);
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("CSAudioInjectionTvRemoteEngine", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v7 = [v6 useSpeexForAudioInjection];

    if (v7) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[CSAudioConverter speexConverter](&OBJC_CLASS___CSAudioConverter, "speexConverter"));
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[CSAudioConverter opusConverter](&OBJC_CLASS___CSAudioConverter, "opusConverter"));
    }
    encoder = v3->_encoder;
    v3->_encoder = (CSAudioConverter *)v8;

    -[CSAudioConverter setDelegate:](v3->_encoder, "setDelegate:", v3);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v3->_uuid;
    v3->_uuid = (NSUUID *)v10;
  }

  return v3;
}

- (BOOL)isAlwaysOnVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)alwaysOnVoiceTriggerEnabled
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  id v4 = a3;
  -[CSAudioInjectionEngine setDelegate:](&v5, "setDelegate:", self);
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)start
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine start](&v2, "start");
}

- (void)stop
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine stop](&v2, "stop");
}

- (BOOL)injectAudio:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  return -[CSAudioInjectionEngine injectAudio:](&v4, "injectAudio:", a3);
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  return -[CSAudioInjectionEngine injectAudio:withScaleFactor:playbackStarted:completion:]( &v7,  "injectAudio:withScaleFactor:playbackStarted:completion:",  a3,  a5,  a6);
}

- (BOOL)isRecording
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  return -[CSAudioInjectionEngine isRecording](&v3, "isRecording");
}

- (void)startAudioStreamWithOption:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine startAudioStreamWithOption:](&v3, "startAudioStreamWithOption:", a3);
}

- (void)stopAudioStream
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CSAudioInjectionTvRemoteEngine;
  -[CSAudioInjectionEngine stopAudioStream](&v2, "stopAudioStream");
}

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector(WeakRetained, "audioEngineDidStartRecord:audioStreamHandleId:successfully:error:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 audioEngineDidStartRecord:self audioStreamHandleId:a4 successfully:v6 error:v12];
  }
}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector(WeakRetained, "audioEngineDidStopRecord:audioStreamHandleId:reason:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 audioEngineDidStopRecord:self audioStreamHandleId:a4 reason:a5];
  }

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  encoder = self->_encoder;
  id v10 = a5;
  -[CSAudioConverter addSamples:timestamp:arrivalTimestampToAudioRecorder:]( encoder,  "addSamples:timestamp:arrivalTimestampToAudioRecorder:",  v10,  a7,  mach_absolute_time());
}

- (void)audioConverterDidConvertPackets:(id)a3 packets:(id)a4 durationInSec:(float)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7
{
  id v16 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector(WeakRetained, "audioEngineAudioChunkForTvAvailable:audioChunk:");

  if ((v10 & 1) != 0)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___CSAudioChunkForTV);
    [v11 setPackets:v16];
    [v11 setTimeStamp:a6];
    objc_msgSend(v11, "setStreamHandleID:", -[CSAudioInjectionEngine audioStreamHandleId](self, "audioStreamHandleId"));
    [v11 setNumChannels:1];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v13 = [v12 useSpeexForAudioInjection];

    if (v13) {
      uint64_t v14 = 1936745848LL;
    }
    else {
      uint64_t v14 = 1869641075LL;
    }
    [v11 setAudioFormat:v14];
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 audioEngineAudioChunkForTvAvailable:self audioChunk:v11];
  }
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

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (CSAudioInjectionDevice)connectedDevice
{
  return (CSAudioInjectionDevice *)objc_loadWeakRetained((id *)&self->_connectedDevice);
}

- (void)setConnectedDevice:(id)a3
{
}

- (CSAudioConverter)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end