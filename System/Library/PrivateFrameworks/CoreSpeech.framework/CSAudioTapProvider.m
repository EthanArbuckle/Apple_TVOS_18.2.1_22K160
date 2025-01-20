@interface CSAudioTapProvider
- (BOOL)_setupRecordingAudioQueueIfNeededWithOption:(id)a3;
- (BOOL)isNarrowBand;
- (BOOL)isRecording;
- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)setCurrentContext:(id)a3 error:(id *)a4;
- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3;
- (CSAudioCircularBuffer)circularBuffer;
- (CSAudioStream)audioStream;
- (CSAudioTapProvider)init;
- (CSOSTransaction)transaction;
- (NSString)UUIDString;
- (OS_dispatch_queue)loggingQueue;
- (OS_dispatch_queue)queue;
- (OpaqueAudioQueue)recordingAudioQueue;
- (id)UUID;
- (id)aqStartCompletion;
- (id)aqStopCompletion;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5;
- (id)audioChunkToEndFrom:(unint64_t)a3;
- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4;
- (id)audioDeviceInfo;
- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5;
- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4;
- (id)playbackRoute;
- (id)recordDeviceInfo;
- (id)recordRoute;
- (id)recordSettings;
- (unint64_t)audioStreamId;
- (unint64_t)processedSampleCount;
- (unsigned)_calculateBufferSize:(OpaqueAudioQueue *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4 frameSizeInSec:(float)a5;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)_destroyRecordingAudioQueue;
- (void)_holdTransactionForStartListening;
- (void)_releaseTransactionForStopListeningIfNeeded;
- (void)_reset;
- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)_stopRecordingAudioQueueIfNeededWithCompletion:(id)a3;
- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5;
- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)destroyRecordingAudioQueue;
- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5;
- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4;
- (void)setAqStartCompletion:(id)a3;
- (void)setAqStopCompletion:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setCircularBuffer:(id)a3;
- (void)setLoggingQueue:(id)a3;
- (void)setProcessedSampleCount:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingAudioQueue:(OpaqueAudioQueue *)a3;
- (void)setTransaction:(id)a3;
- (void)setUUIDString:(id)a3;
- (void)setup;
- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
@end

@implementation CSAudioTapProvider

- (CSAudioTapProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSAudioTapProvider;
  v2 = -[CSAudioTapProvider init](&v13, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAudioTapProvider audioDispatchQueue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, -2);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("CSAudioTapProvider logging", v6);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 UUIDString]);
    UUIDString = v2->_UUIDString;
    v2->_UUIDString = (NSString *)v10;

    v2->_processedSampleCount = 0LL;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAudioTapProvider;
  -[CSAudioTapProvider dealloc](&v3, "dealloc");
}

- (id)UUID
{
  return self->_UUIDString;
}

- (void)setup
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CSAudioServerCrashMonitor sharedInstance](&OBJC_CLASS___CSAudioServerCrashMonitor, "sharedInstance"));
  [v3 addObserver:self];
}

- (void)_reset
{
  self->_processedSampleCount = 0LL;
  circularBuffer = self->_circularBuffer;
  if (circularBuffer) {
    -[CSAudioCircularBuffer reset](circularBuffer, "reset");
  }
}

- (BOOL)_setupRecordingAudioQueueIfNeededWithOption:(id)a3
{
  id v4 = a3;
  if (-[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue"))
  {
    BOOL v5 = 1;
    goto LABEL_21;
  }

  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoNonInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmMonoNonInterleavedASBD");
  AudioQueueRef outAQ = 0LL;
  if (!AudioQueueNewInput(&inFormat, (AudioQueueInputCallback)sub_10000CCC8, self, 0LL, 0LL, 0x800u, &outAQ))
  {
    dispatch_queue_t v7 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  &inFormat);
    if ([v4 requestTelephonyDownlinkAudioTap]) {
      id v8 = [[ATAudioTapDescription alloc] initProcessTapWithFormat:v7 PID:4294967294];
    }
    else {
      id v8 = [[ATAudioTapDescription alloc] initSystemTapWithFormat:v7];
    }
    v9 = v8;
    id v10 = [[ATAudioTap alloc] initWithTapDescription:v8];
    if (!v10)
    {
      v11 = (os_log_s *)CSLogCategoryAudio;
      if (!os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
      v12 = "%s Failed to create ATAudioTap!";
LABEL_37:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
LABEL_17:
      if (outAQ) {
        AudioQueueDispose(outAQ, 1u);
      }
      goto LABEL_19;
    }

    if (AudioQueueSetProperty(outAQ, 0x71746F62u, v10, 8u))
    {
      v11 = (os_log_s *)CSLogCategoryAudio;
      if (!os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
      v12 = "%s Failed to set Audio Queue Process Tap!";
      goto LABEL_37;
    }

    UInt32 ioDataSize = 40;
    if (AudioQueueGetProperty(outAQ, 0x61716674u, &inFormat, &ioDataSize))
    {
      v14 = (os_log_s *)CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Failed to get data format size!",  buf,  0xCu);
      }

      if (outAQ) {
        AudioQueueDispose(outAQ, 1u);
      }
      goto LABEL_19;
    }

    if (outAQ)
    {
      -[CSAudioTapProvider setRecordingAudioQueue:](self, "setRecordingAudioQueue:");
      v15 = -[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue");
      +[CSConfig inputRecordingBufferDuration]( &OBJC_CLASS___CSConfig,  "inputRecordingBufferDuration",  *(void *)&inFormat.mSampleRate,  *(void *)&inFormat.mFormatID,  *(void *)&inFormat.mBytesPerPacket,  *(void *)&inFormat.mBytesPerFrame,  *(void *)&inFormat.mBitsPerChannel);
      *(float *)&double v16 = v16;
      UInt32 v17 = -[CSAudioTapProvider _calculateBufferSize:audioStreamBasicDescription:frameSizeInSec:]( self,  "_calculateBufferSize:audioStreamBasicDescription:frameSizeInSec:",  v15,  &v22,  v16);
      for (uint64_t i = 8LL; i != 40; i += 8LL)
        AudioQueueAllocateBuffer( -[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue"),  v17,  (AudioQueueBufferRef *)((char *)self + i));
      OSStatus v19 = AudioQueueAddPropertyListener( -[CSAudioTapProvider recordingAudioQueue](self, "recordingAudioQueue"),  0x6171726Eu,  (AudioQueuePropertyListenerProc)sub_10000C5C0,  self);
      v20 = (os_log_s *)CSLogCategoryAudio;
      if (!v19)
      {
        if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Successfully created audio Queue for tapping",  buf,  0xCu);
        }

        BOOL v5 = 1;
        goto LABEL_20;
      }

      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        v21 = "%s Failed to add isRunning listener!";
LABEL_35:
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
      }
    }

    else
    {
      v20 = (os_log_s *)CSLogCategoryAudio;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[CSAudioTapProvider _setupRecordingAudioQueueIfNeededWithOption:]";
        v21 = "%s recordingAudioQueue is nil!";
        goto LABEL_35;
      }
    }

- (void)destroyRecordingAudioQueue
{
  unsigned __int8 v3 = -[CSAudioTapProvider isRecording](self, "isRecording");
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000CBC0;
  v5[3] = &unk_10022EFA8;
  unsigned __int8 v6 = v3;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)_destroyRecordingAudioQueue
{
  recordingAudioQueue = self->_recordingAudioQueue;
  if (recordingAudioQueue)
  {
    AudioQueueRemovePropertyListener( recordingAudioQueue,  0x6171726Eu,  (AudioQueuePropertyListenerProc)sub_10000C5C0,  self);
    uint64_t v4 = 0LL;
    *(void *)&__int128 v5 = 136315394LL;
    __int128 v13 = v5;
    do
    {
      unsigned __int8 v6 = self->_audioBuffers[v4];
      if (v6)
      {
        OSStatus v7 = AudioQueueFreeBuffer(self->_recordingAudioQueue, v6);
        if (v7)
        {
          OSStatus v8 = v7;
          v9 = (os_log_s *)CSLogCategoryAudio;
          if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v15 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
            __int16 v16 = 1024;
            OSStatus v17 = v8;
            _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s AudioQueueFreeBuffer error: %i",  buf,  0x12u);
          }
        }
      }

      ++v4;
    }

    while (v4 != 4);
    OSStatus v10 = AudioQueueDispose(self->_recordingAudioQueue, 1u);
    v11 = (os_log_s *)CSLogCategoryAudio;
    if (v10)
    {
      OSStatus v12 = v10;
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v13;
        v15 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
        __int16 v16 = 1024;
        OSStatus v17 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Failed to dispose Audio Queue with error: %i",  buf,  0x12u);
      }
    }

    else if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSAudioTapProvider _destroyRecordingAudioQueue]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Audio Queue has been disposed", buf, 0xCu);
    }

    self->_recordingAudioQueue = 0LL;
  }

  -[CSAudioTapProvider _reset](self, "_reset", v13);
  -[CSAudioTapProvider _releaseTransactionForStopListeningIfNeeded](self, "_releaseTransactionForStopListeningIfNeeded");
}

- (void)_holdTransactionForStartListening
{
  if (!self->_transaction)
  {
    unsigned __int8 v3 = -[CSOSTransaction initWithDescription:]( objc_alloc(&OBJC_CLASS___CSOSTransaction),  "initWithDescription:",  @"AudioTapProvider");
    transaction = self->_transaction;
    self->_transaction = v3;
  }

- (void)_releaseTransactionForStopListeningIfNeeded
{
  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0LL;
  }

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000C26C;
  v23[3] = &unk_10022E6A0;
  v23[4] = self;
  id v10 = a5;
  id v24 = v10;
  v11 = objc_retainBlock(v23);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C2D8;
  block[3] = &unk_10022A0F8;
  id v18 = v8;
  id v19 = v9;
  v20 = self;
  id v21 = v11;
  id v22 = v10;
  id v13 = v10;
  v14 = v11;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(queue, block);
}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v6 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000C1BC;
  v9[3] = &unk_10022EB58;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)_stopRecordingAudioQueueIfNeededWithCompletion:(id)a3
{
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  OSStatus v17 = sub_10000C154;
  id v18 = &unk_10022E6A0;
  id v19 = self;
  id v4 = a3;
  id v20 = v4;
  __int128 v5 = objc_retainBlock(&v15);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAudioTapProvider aqStartCompletion](self, "aqStartCompletion", v15, v16, v17, v18, v19));
  BOOL v7 = v6 == 0LL;

  if (!v7)
  {
    (*((void (**)(void))self->_aqStartCompletion + 2))();
    -[CSAudioTapProvider setAqStartCompletion:](self, "setAqStartCompletion:", 0LL);
  }

  recordingAudioQueue = self->_recordingAudioQueue;
  if (recordingAudioQueue)
  {
    OSStatus v9 = AudioQueueStop(recordingAudioQueue, 1u);
    id v10 = (os_log_s *)CSLogCategoryAudio;
    if (v9)
    {
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Failed to stop Audio Queue",  buf,  0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  0LL));
      if (v4) {
        ((void (*)(void ***, void, void *))v5[2])(v5, 0LL, v11);
      }
    }

    else
    {
      if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Stopped Audio Queue successfully",  buf,  0xCu);
      }

      if (v4)
      {
        id v13 = objc_retainBlock(v4);
        id aqStopCompletion = self->_aqStopCompletion;
        self->_id aqStopCompletion = v13;
      }

      v11 = 0LL;
    }
  }

  else
  {
    OSStatus v12 = (os_log_s *)CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[CSAudioTapProvider _stopRecordingAudioQueueIfNeededWithCompletion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Recording queue does not exist, return as stopped successfully",  buf,  0xCu);
    }

    ((void (*)(void ***, uint64_t, void))v5[2])(v5, 1LL, 0LL);
    v11 = 0LL;
  }
}

- (BOOL)isRecording
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000BFF4;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)_calculateBufferSize:(OpaqueAudioQueue *)a3 audioStreamBasicDescription:(AudioStreamBasicDescription *)a4 frameSizeInSec:(float)a5
{
  signed int mBytesPerPacket = a4->mBytesPerPacket;
  signed int outData = mBytesPerPacket;
  if (!mBytesPerPacket)
  {
    UInt32 ioDataSize = 4;
    AudioQueueGetProperty(a3, 0x786F7073u, &outData, &ioDataSize);
    signed int mBytesPerPacket = outData;
  }

  return fmin(a4->mSampleRate * (double)mBytesPerPacket * a5, 57344.0);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  id v4 = (os_log_s *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[CSAudioTapProvider CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod crashed", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BF9C;
  block[3] = &unk_10022F100;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  char v3 = (os_log_s *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    __int128 v5 = "-[CSAudioTapProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s audiomxd/bridgeaudiod restarted",  (uint8_t *)&v4,  0xCu);
  }

- (unint64_t)audioStreamId
{
  return 1LL;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 requiresHistoricalBuffer])
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000BE60;
    block[3] = &unk_10022F100;
    void block[4] = self;
    dispatch_async(queue, block);
  }

  id v10 = -[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:]( objc_alloc(&OBJC_CLASS___CSAudioStream),  "initWithAudioStreamProvider:streamName:streamRequest:",  self,  v8,  v7);
  v11 = (dispatch_queue_s *)self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000BF74;
  v16[3] = &unk_10022EFD0;
  v16[4] = self;
  OSStatus v12 = v10;
  OSStatus v17 = v12;
  dispatch_async(v11, v16);
  id v13 = v17;
  v14 = v12;

  return v14;
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  if (v10)
  {
    v11 = -[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:]( objc_alloc(&OBJC_CLASS___CSAudioStream),  "initWithAudioStreamProvider:streamName:streamRequest:",  self,  v9,  v8);
    queue = (dispatch_queue_s *)self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000BE54;
    v14[3] = &unk_10022EFD0;
    v14[4] = self;
    id v13 = v11;
    id v15 = v13;
    dispatch_async(queue, v14);
    v10[2](v10, v13, 0LL);
  }
}

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  __int128 v5 = (void (**)(id, void, void *))a5;
  if (v5)
  {
    id v7 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  2058LL,  0LL));
    v7[2](v7, 0LL, v6);

    __int128 v5 = v7;
  }
}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  __int128 v5 = (void (**)(id, uint64_t, void))a5;
  if (v5) {
    v5[2](v5, 1LL, 0LL);
  }
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return 0LL;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  return 0LL;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  return 0LL;
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  return 0LL;
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000BE44;
  v11[3] = &unk_10022C3E8;
  unint64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BDEC;
  block[3] = &unk_10022E7F8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = -[CSAudioCircularBuffer copySamplesFrom:to:](self->_circularBuffer, "copySamplesFrom:to:", a3, a4);
  id v10 = v9;
  if (v9)
  {
    loggingQueue = (dispatch_queue_s *)self->_loggingQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000BD1C;
    v12[3] = &unk_10022C3E8;
    unint64_t v15 = a3;
    unint64_t v16 = a4;
    id v13 = v9;
    id v14 = v8;
    dispatch_async(loggingQueue, v12);
  }
}

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  return 0LL;
}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  return 0;
}

- (id)recordRoute
{
  return 0LL;
}

- (id)recordDeviceInfo
{
  return 0LL;
}

- (id)audioDeviceInfo
{
  return 0LL;
}

- (id)recordSettings
{
  return 0LL;
}

- (BOOL)isNarrowBand
{
  return 0;
}

- (id)playbackRoute
{
  return 0LL;
}

- (OpaqueAudioQueue)recordingAudioQueue
{
  return self->_recordingAudioQueue;
}

- (void)setRecordingAudioQueue:(OpaqueAudioQueue *)a3
{
  self->_recordingAudioQueue = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setLoggingQueue:(id)a3
{
}

- (id)aqStartCompletion
{
  return self->_aqStartCompletion;
}

- (void)setAqStartCompletion:(id)a3
{
}

- (id)aqStopCompletion
{
  return self->_aqStopCompletion;
}

- (void)setAqStopCompletion:(id)a3
{
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setCircularBuffer:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return (CSAudioStream *)objc_loadWeakRetained((id *)&self->_audioStream);
}

- (void)setAudioStream:(id)a3
{
}

- (unint64_t)processedSampleCount
{
  return self->_processedSampleCount;
}

- (void)setProcessedSampleCount:(unint64_t)a3
{
  self->_processedSampleCount = a3;
}

- (CSOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end