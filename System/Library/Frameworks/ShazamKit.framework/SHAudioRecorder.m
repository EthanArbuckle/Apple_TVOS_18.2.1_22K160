@interface SHAudioRecorder
+ (BOOL)hasAudioQueueFailedWithStatus:(int)a3 annotateError:(id *)a4;
+ (BOOL)isAudioQueueRunning:(OpaqueAudioQueue *)a3;
- (AudioStreamBasicDescription)audioStreamBasicDescription;
- (BOOL)isRunning;
- (BOOL)stopAudioQueueAndClearBuffersWithError:(id *)a3;
- (NSString)description;
- (OS_dispatch_queue)audioRecorderDispatchQueue;
- (OpaqueAudioQueue)audioQueue;
- (SHAudioRecorder)initWithRecordingSource:(int64_t)a3;
- (SHAudioRecorderDelegate)delegate;
- (int64_t)recordingSource;
- (void)dealloc;
- (void)setAudioQueue:(OpaqueAudioQueue *)a3;
- (void)setAudioRecorderDispatchQueue:(id)a3;
- (void)setAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (void)setDelegate:(id)a3;
- (void)setRecordingSource:(int64_t)a3;
- (void)startAudioQueueAfterRetrySecondsWithCompletion:(id)a3;
- (void)startRecordingWithCompletion:(id)a3;
@end

@implementation SHAudioRecorder

- (void)dealloc
{
  uint64_t v3 = sh_log_object(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Deallocating SHAudioRecorder", buf, 2u);
  }

  -[SHAudioRecorder stopAudioQueueAndClearBuffersWithError:](self, "stopAudioQueueAndClearBuffersWithError:", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SHAudioRecorder;
  -[SHAudioRecorder dealloc](&v5, "dealloc");
}

- (SHAudioRecorder)initWithRecordingSource:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHAudioRecorder;
  v4 = -[SHAudioRecorder init](&v9, "init");
  objc_super v5 = v4;
  if (v4)
  {
    v4->_recordingSource = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ShazamKit.shazamaudiorecorder.dispatch", 0LL);
    audioRecorderDispatchQueue = v5->_audioRecorderDispatchQueue;
    v5->_audioRecorderDispatchQueue = (OS_dispatch_queue *)v6;
  }

  return v5;
}

- (BOOL)isRunning
{
  return objc_msgSend((id)objc_opt_class(self, a2), "isAudioQueueRunning:", self->_audioQueue);
}

- (void)startRecordingWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  BOOL v5 = -[SHAudioRecorder isRunning](self, "isRunning");
  if (!v5)
  {
    v8 = -[AVAudioFormat initStandardFormatWithSampleRate:channels:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initStandardFormatWithSampleRate:channels:",  1LL,  44100.0);
    objc_super v9 = -[AVAudioFormat streamDescription](v8, "streamDescription");
    uint64_t v10 = *(void *)&v9->mBitsPerChannel;
    __int128 v11 = *(_OWORD *)&v9->mBytesPerPacket;
    *(_OWORD *)&self->_audioStreamBasicDescription.mSampleRate = *(_OWORD *)&v9->mSampleRate;
    *(_OWORD *)&self->_audioStreamBasicDescription.mBytesPerPacket = v11;
    *(void *)&self->_audioStreamBasicDescription.mBitsPerChannel = v10;
    uint64_t v12 = AudioQueueNewInput( &self->_audioStreamBasicDescription,  (AudioQueueInputCallback)sub_1000232CC,  self,  0LL,  0LL,  ((id)-[SHAudioRecorder recordingSource](self, "recordingSource") != (id)2) << 11,  &self->_audioQueue);
    id v44 = 0LL;
    unsigned int v14 = objc_msgSend( (id)objc_opt_class(self, v13),  "hasAudioQueueFailedWithStatus:annotateError:",  v12,  &v44);
    id v15 = v44;
    id v16 = v15;
    if (v14)
    {
      uint64_t v17 = sh_log_object(v15);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v16;
        v19 = "Failed to create a new audio queue input with error %@";
        v20 = v18;
        uint32_t v21 = 12;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      }
    }

    else
    {
      if ((id)-[SHAudioRecorder recordingSource](self, "recordingSource") == (id)1)
      {
        id v22 = [[ATAudioTapDescription alloc] initSystemTapWithFormat:v8];
        id v23 = [[ATAudioTap alloc] initWithTapDescription:v22];
        uint64_t v24 = AudioQueueSetProperty(self->_audioQueue, 0x71746F62u, v23, 8u);
        id v43 = v16;
        unsigned int v26 = objc_msgSend( (id)objc_opt_class(self, v25),  "hasAudioQueueFailedWithStatus:annotateError:",  v24,  &v43);
        id v27 = v43;

        if (v26)
        {
          uint64_t v29 = sh_log_object(v28);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Failed to set audio queue property",  buf,  2u);
          }

          v4[2](v4, 0LL, v27);
          id v16 = v27;
          goto LABEL_20;
        }
      }

      else
      {
        id v27 = v16;
      }

      uint64_t v31 = AudioQueueAddPropertyListener( self->_audioQueue,  0x6171726Eu,  (AudioQueuePropertyListenerProc)sub_1000233BC,  self);
      id v42 = v27;
      unsigned __int8 v33 = objc_msgSend( (id)objc_opt_class(self, v32),  "hasAudioQueueFailedWithStatus:annotateError:",  v31,  &v42);
      id v16 = v42;

      if ((v33 & 1) == 0)
      {
        for (uint64_t i = 1LL; i != 4; ++i)
        {
          AudioQueueAllocateBuffer(self->_audioQueue, 0x2000u, (AudioQueueBufferRef *)((char *)self + i * 8));
          AudioQueueEnqueueBuffer(self->_audioQueue, (AudioQueueBufferRef)(&self->super.isa)[i], 0, 0LL);
        }

        OSStatus v37 = AudioQueueStart(self->_audioQueue, 0LL);
        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SHCoreErrorDomain,  v37,  0LL));
          uint64_t v39 = sh_log_object(v38);
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v46 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed to start audio queue with error %@, retry one more time",  buf,  0xCu);
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecorder delegate](self, "delegate"));
          [v41 recorder:self failedToStartWithError:v38];

          -[SHAudioRecorder startAudioQueueAfterRetrySecondsWithCompletion:]( self,  "startAudioQueueAfterRetrySecondsWithCompletion:",  v4);
        }

        else
        {
          v4[2](v4, 1LL, 0LL);
        }

        goto LABEL_20;
      }

      uint64_t v35 = sh_log_object(v34);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v19 = "Failed to add isRunning property listener";
        v20 = v18;
        uint32_t v21 = 2;
        goto LABEL_18;
      }
    }

    v4[2](v4, 0LL, v16);
LABEL_20:

    goto LABEL_21;
  }

  uint64_t v6 = sh_log_object(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Already running audio queue", buf, 2u);
  }

  v4[2](v4, 1LL, 0LL);
LABEL_21:
}

+ (BOOL)isAudioQueueRunning:(OpaqueAudioQueue *)a3
{
  UInt32 ioDataSize = 4;
  int outData = 0;
  uint64_t v5 = 0LL;
  unsigned __int8 v3 = objc_msgSend( a1,  "hasAudioQueueFailedWithStatus:annotateError:",  AudioQueueGetProperty(a3, 0x6171726Eu, &outData, &ioDataSize),  &v5);
  return (outData != 0) & ~v3;
}

- (BOOL)stopAudioQueueAndClearBuffersWithError:(id *)a3
{
  audioQueue = self->_audioQueue;
  if (!audioQueue) {
    return 1;
  }
  uint64_t v6 = AudioQueueStop(audioQueue, 1u);
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "hasAudioQueueFailedWithStatus:annotateError:", v6, a3);
  char v9 = (char)v8;
  if (a3 && (_DWORD)v8)
  {
    uint64_t v10 = sh_log_object(v8);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = *a3;
      int v27 = 138412290;
      id v28 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to stop audio queue %@",  (uint8_t *)&v27,  0xCu);
    }
  }

  char v13 = v9 ^ 1;
  uint64_t v14 = AudioQueueRemovePropertyListener( self->_audioQueue,  0x6171726Eu,  (AudioQueuePropertyListenerProc)sub_1000233BC,  self);
  id v16 = objc_msgSend((id)objc_opt_class(self, v15), "hasAudioQueueFailedWithStatus:annotateError:", v14, a3);
  if (a3 && (_DWORD)v16)
  {
    uint64_t v17 = sh_log_object(v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = *a3;
      int v27 = 138412290;
      id v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to remove isRunning property listener %@",  (uint8_t *)&v27,  0xCu);
    }
  }

  uint64_t v20 = AudioQueueDispose(self->_audioQueue, 0);
  id v22 = objc_msgSend((id)objc_opt_class(self, v21), "hasAudioQueueFailedWithStatus:annotateError:", v20, a3);
  if ((_DWORD)v22)
  {
    if (a3)
    {
      uint64_t v23 = sh_log_object(v22);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = *a3;
        int v27 = 138412290;
        id v28 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to dispose audio queue %@",  (uint8_t *)&v27,  0xCu);
      }
    }
  }

  else
  {
    self->_audioQueue = 0LL;
  }

  return v13;
}

+ (BOOL)hasAudioQueueFailedWithStatus:(int)a3 annotateError:(id *)a4
{
  if (a3 && a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  a3,  0LL));
  }
  return a3 != 0;
}

- (void)startAudioQueueAfterRetrySecondsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHAudioRecorder audioRecorderDispatchQueue](self, "audioRecorderDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023858;
  block[3] = &unk_10006D728;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Recorder using source %li",  -[SHAudioRecorder recordingSource](self, "recordingSource"));
}

- (SHAudioRecorderDelegate)delegate
{
  return (SHAudioRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)recordingSource
{
  return self->_recordingSource;
}

- (void)setRecordingSource:(int64_t)a3
{
  self->_recordingSource = a3;
}

- (OpaqueAudioQueue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_audioQueue = a3;
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  __int128 v3 = *(_OWORD *)&self[2].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[2].mBytesPerPacket;
  return self;
}

- (void)setAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  __int128 v3 = *(_OWORD *)&a3->mSampleRate;
  __int128 v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_audioStreamBasicDescription.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_audioStreamBasicDescription.mSampleRate = v3;
  *(_OWORD *)&self->_audioStreamBasicDescription.mBytesPerPacket = v4;
}

- (OS_dispatch_queue)audioRecorderDispatchQueue
{
  return self->_audioRecorderDispatchQueue;
}

- (void)setAudioRecorderDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end