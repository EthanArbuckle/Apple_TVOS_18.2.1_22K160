@interface ADSpeechCompressor
- (ADSpeechCompressor)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7;
- (void)addAudioSampleData:(id)a3;
- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3;
- (void)dealloc;
- (void)getLastStartpointTimestampAndCurrentTime:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)startCompressionNarrowband:(BOOL)a3;
- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5;
- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5;
@end

@implementation ADSpeechCompressor

- (ADSpeechCompressor)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADSpeechCompressor;
  v10 = -[ADSpeechCompressor init](&v13, "init");
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_queue, a3);
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADSpeechCompressor;
  -[ADSpeechCompressor dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BC81C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BC7CC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BC77C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getLastStartpointTimestampAndCurrentTime:(id)a3
{
  if (a3) {
    (*((void (**)(id, double, double))a3 + 2))(a3, 0.0, 0.0);
  }
}

- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void))a5 + 2))(a5, 0LL, 0LL, 0LL);
  }
}

- (void)reset
{
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    AudioConverterDispose(audioConverter);
    self->_audioConverter = 0LL;
  }

  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = 0LL;

  self->_packetIndex = 0LL;
  self->_bytesConsumed = 0LL;
}

- (void)startCompressionNarrowband:(BOOL)a3
{
  BOOL v3 = a3;
  p_audioConverter = &self->_audioConverter;
  if (self->_audioConverter)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v19 handleFailureInMethod:a2 object:self file:@"ADSpeechCompressor.m" lineNumber:109 description:@"Already started compressor"];
  }

  v7 = (void **)&SASCodecOPUS_Mono_8000HzValue;
  if (!v3) {
    v7 = (void **)&SASCodecOPUS_Mono_16000HzValue;
  }
  id v8 = *v7;
  if (v3) {
    double v9 = 8000.0;
  }
  else {
    double v9 = 16000.0;
  }
  if (v3) {
    UInt32 v10 = 160;
  }
  else {
    UInt32 v10 = 320;
  }
  id v11 = v8;
  id v12 = [[CSSiriRecordingInfo alloc] initWithDictation:1 codec:v11];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BC734;
  block[3] = &unk_1004FD968;
  block[4] = self;
  id v14 = v12;
  id v28 = v14;
  dispatch_async(queue, block);
  inSourceFormat.mSampleRate = v9;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1003CA2E0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1003CA2F0;
  inDestinationFormat.mSampleRate = v9;
  *(void *)&inDestinationFormat.mFormatID = 1869641075LL;
  inDestinationFormat.mBytesPerPacket = 0;
  inDestinationFormat.mFramesPerPacket = v10;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1003CA300;
  uint64_t v15 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, p_audioConverter);
  if ((_DWORD)v15)
  {
    uint64_t v20 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v21,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"ADSpeechCompressor.m",  143,  @"AudioConverterNew failed: %x",  v20);
  }

  int inPropertyData = 32000;
  uint64_t v16 = AudioConverterSetProperty(*p_audioConverter, 0x62726174u, 4u, &inPropertyData);
  if ((_DWORD)v16)
  {
    uint64_t v22 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v23,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"ADSpeechCompressor.m",  147,  @"AudioConverterSetProperty/kAudioConverterEncodeBitRate failed: %x",  v22);
  }

  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = v17;
}

- (void)addAudioSampleData:(id)a3
{
  id v4 = a3;
  -[NSMutableData appendData:](self->_bufferedAudio, "appendData:", v4);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BC46C;
  block[3] = &unk_1004FD968;
  block[4] = self;
  id v20 = v4;
  id v29 = v20;
  dispatch_async(queue, block);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  while (1)
  {
    UInt32 ioOutputDataPacketSize = 1;
    outOutputData.mNumberBuffers = 1;
    outOutputData.mBuffers[0].mData = v39;
    *(void *)&outOutputData.mBuffers[0].mNumberChannels = 0x200000000001LL;
    audioConverter = self->_audioConverter;
    inInputDataProcUserData[0] = _NSConcreteStackBlock;
    inInputDataProcUserData[1] = 3221225472LL;
    inInputDataProcUserData[2] = sub_1000BC4AC;
    inInputDataProcUserData[3] = &unk_1004F0198;
    inInputDataProcUserData[4] = self;
    inInputDataProcUserData[5] = a2;
    OSStatus v8 = AudioConverterFillComplexBuffer( audioConverter,  (AudioConverterComplexInputDataProc)sub_1000BC694,  inInputDataProcUserData,  &ioOutputDataPacketSize,  &outOutputData,  &outPacketDescription);
    if (v8) {
      break;
    }
    UInt32 v9 = ioOutputDataPacketSize;
    if (ioOutputDataPacketSize)
    {
      UInt32 v10 = 0;
      do
      {
        id v11 = (os_log_s *)AFSiriLogContextSpeech;
        ++v10;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v31 = "-[ADSpeechCompressor addAudioSampleData:]";
          __int16 v32 = 1024;
          UInt32 v33 = v10;
          __int16 v34 = 1024;
          UInt32 v35 = v9;
          __int16 v36 = 1024;
          UInt32 mDataByteSize = outPacketDescription.mDataByteSize;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s [%02u of %02u] Opus packet with %u bytes",  buf,  0x1Eu);
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (char *)outOutputData.mBuffers[0].mData + outPacketDescription.mStartOffset,  outPacketDescription.mDataByteSize,  v20));
        -[NSMutableArray addObject:](v6, "addObject:", v12);
        ++self->_packetIndex;

        UInt32 v9 = ioOutputDataPacketSize;
      }

      while (v10 < ioOutputDataPacketSize);
    }
  }

  OSStatus v13 = v8;
  if (v8 != 1836086393)
  {
    id v14 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[ADSpeechCompressor addAudioSampleData:]";
      __int16 v32 = 1026;
      UInt32 v33 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s AudioConverter is sad: 0x%{public}xd",  buf,  0x12u);
    }
  }

  -[NSMutableData replaceBytesInRange:withBytes:length:]( self->_bufferedAudio,  "replaceBytesInRange:withBytes:length:",  0LL,  self->_bytesConsumed,  0LL,  0LL,  v20);
  self->_bytesConsumed = 0LL;
  uint64_t v15 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v15;
    id v17 = -[NSMutableArray count](v6, "count");
    *(_DWORD *)v39 = 136315394;
    v40 = "-[ADSpeechCompressor addAudioSampleData:]";
    __int16 v41 = 2048;
    id v42 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Sending %tu packets", v39, 0x16u);
  }

  v18 = (dispatch_queue_s *)self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000BC6EC;
  v23[3] = &unk_1004FD968;
  v23[4] = self;
  v24 = v6;
  v19 = v6;
  dispatch_async(v18, v23);
}

- (void).cxx_destruct
{
}

@end