@interface CSAudioInjectionEngine
- (AudioBufferList)pNonInterleavedABL;
- (AudioStreamBasicDescription)_defaultOutASBD;
- (AudioStreamBasicDescription)outASBD;
- (BOOL)alwaysOnVoiceTriggerEnabled;
- (BOOL)didSetScaleFactor;
- (BOOL)injectAudio:(id)a3;
- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7;
- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6;
- (BOOL)isAlwaysOnVoiceTriggerAvailable;
- (BOOL)isRecording;
- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3;
- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3 withInputRecordingNumberOfChannels:(unsigned int)a4;
- (CSAudioInjectionEngineDelegate)delegate;
- (CSAudioInjectionFileOption)fileOption;
- (NSMutableArray)injectionAudioFileList;
- (NSMutableArray)injectionCompletionNotifyBlocks;
- (NSMutableArray)injectionStartNotifyBlocks;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)audioFeedTimer;
- (OpaqueAudioConverter)deinterleaver;
- (double)bufferDuration;
- (float)scaleFactor;
- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4;
- (id)_deinterleaveBufferIfNeeded:(AudioBufferList *)a3;
- (unint64_t)audioStreamHandleId;
- (unsigned)inputRecordingNumberOfChannels;
- (void)_createDeInterleaverIfNeeded;
- (void)_readAudioBufferAndFeed;
- (void)_startAudioFeedingTimer;
- (void)dealloc;
- (void)setAudioFeedTimer:(id)a3;
- (void)setAudioStreamHandleId:(unint64_t)a3;
- (void)setBufferDuration:(double)a3;
- (void)setDeinterleaver:(OpaqueAudioConverter *)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSetScaleFactor:(BOOL)a3;
- (void)setFileOption:(id)a3;
- (void)setInjectionAudioFileList:(id)a3;
- (void)setInjectionCompletionNotifyBlocks:(id)a3;
- (void)setInjectionStartNotifyBlocks:(id)a3;
- (void)setInputRecordingNumberOfChannels:(unsigned int)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setOutASBD:(AudioStreamBasicDescription *)a3;
- (void)setPNonInterleavedABL:(AudioBufferList *)a3;
- (void)setQueue:(id)a3;
- (void)setScaleFactor:(float)a3;
- (void)setUuid:(id)a3;
- (void)start;
- (void)startAudioStreamWithOption:(id)a3;
- (void)stop;
- (void)stopAudioStream;
@end

@implementation CSAudioInjectionEngine

- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3
{
  return -[CSAudioInjectionEngine initWithStreamHandleId:withInputRecordingNumberOfChannels:]( self,  "initWithStreamHandleId:withInputRecordingNumberOfChannels:",  a3,  +[CSConfig inputRecordingNumberOfChannels](&OBJC_CLASS___CSConfig, "inputRecordingNumberOfChannels"));
}

- (CSAudioInjectionEngine)initWithStreamHandleId:(unint64_t)a3 withInputRecordingNumberOfChannels:(unsigned int)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSAudioInjectionEngine;
  v6 = -[CSAudioInjectionEngine init](&v19, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("CSAudioInjectionEngine", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_audioStreamHandleId = a3;
    +[CSConfig inputRecordingBufferDuration](&OBJC_CLASS___CSConfig, "inputRecordingBufferDuration");
    v6->_bufferDuration = v9;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    injectionAudioFileList = v6->_injectionAudioFileList;
    v6->_injectionAudioFileList = (NSMutableArray *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    injectionStartNotifyBlocks = v6->_injectionStartNotifyBlocks;
    v6->_injectionStartNotifyBlocks = (NSMutableArray *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    injectionCompletionNotifyBlocks = v6->_injectionCompletionNotifyBlocks;
    v6->_injectionCompletionNotifyBlocks = (NSMutableArray *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v16;

    v6->_didSetScaleFactor = 0;
    v6->_scaleFactor = 0.01;
    v6->_inputRecordingNumberOfChannels = a4;
  }

  return v6;
}

- (void)dealloc
{
  deinterleaver = self->_deinterleaver;
  pNonInterleavedABL = self->_pNonInterleavedABL;
  if (pNonInterleavedABL)
  {
    free(pNonInterleavedABL);
    self->_pNonInterleavedABL = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAudioInjectionEngine;
  -[CSAudioInjectionEngine dealloc](&v5, "dealloc");
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAlwaysOnVoiceTriggerAvailable
{
  return 0;
}

- (BOOL)alwaysOnVoiceTriggerEnabled
{
  return 0;
}

- (void)start
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100142748;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_createDeInterleaverIfNeeded
{
  self->_deinterleaver = 0LL;
  p_deinterleaver = &self->_deinterleaver;
  +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmNonInterleavedASBD");
  uint64_t v4 = v14;
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    +[CSFAudioStreamBasicDescriptionFactory lpcmInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInterleavedASBD");
    +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmNonInterleavedASBD");
    OSStatus v6 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, p_deinterleaver);
    if (v6)
    {
      OSStatus v7 = v6;
      v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v16 = "-[CSAudioInjectionEngine _createDeInterleaverIfNeeded]";
        __int16 v17 = 1026;
        OSStatus v18 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s Cannot create de-interleaver using AudioConverterNew: %{public}d",  buf,  0x12u);
      }

      *p_deinterleaver = 0LL;
    }

    pNonInterleavedABL = self->_pNonInterleavedABL;
    if (pNonInterleavedABL) {
      free(pNonInterleavedABL);
    }
    uint64_t v10 = (AudioBufferList *)malloc(24 * v4);
    self->_pNonInterleavedABL = v10;
    v10->mNumberBuffers = v4;
    v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[CSAudioInjectionEngine _createDeInterleaverIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Created de-interleaver", buf, 0xCu);
    }
  }

- (void)stop
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014260C;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_startAudioFeedingTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = v3;

  dispatch_source_set_timer( (dispatch_source_t)self->_audioFeedTimer,  0LL,  (unint64_t)(self->_bufferDuration * 1000000000.0),  0x5F5E100uLL);
  objc_initWeak(&location, self);
  BOOL v5 = self->_audioFeedTimer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1001425E0;
  v6[3] = &unk_10022E920;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v5, v6);
  dispatch_resume((dispatch_object_t)self->_audioFeedTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_readAudioBufferAndFeed
{
  fileOption = self->_fileOption;
  if (!fileOption || !-[CSAudioInjectionFileOption fFile](fileOption, "fFile"))
  {
    if (!-[NSMutableArray count](self->_injectionAudioFileList, "count"))
    {
      if (!self->_isRecording) {
        return;
      }
      double bufferDuration = self->_bufferDuration;
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      LODWORD(v22) = v76;
      double v23 = bufferDuration * v77 * (double)v22;
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      LODWORD(v24) = v75;
      size_t v25 = (unint64_t)(v23 * (double)v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v25));
      *(_DWORD *)ioData = 1;
      -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
      *(_DWORD *)&ioData[8] = v74;
      *(_DWORD *)&ioData[12] = v25;
      id v27 = v26;
      *(void *)&ioData[16] = [v27 bytes];
      id v16 = v27;
      memset([v16 bytes], 1, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue( -[CSAudioInjectionEngine _deinterleaveBufferIfNeeded:]( self,  "_deinterleaveBufferIfNeeded:",  ioData));
      __int16 v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSAudioInjectionEngine _compensateChannelDataIfNeeded:receivedNumChannels:]( self,  "_compensateChannelDataIfNeeded:receivedNumChannels:",  v28,  1LL));

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v30 = objc_opt_respondsToSelector( WeakRetained,  "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:");

      if ((v30 & 1) != 0)
      {
        id v31 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend( v31,  "audioEngineBufferAvailable:audioStreamHandleId:buffer:remoteVAD:atTime:isFileLoadedBuffer:",  self,  -[CSAudioInjectionEngine audioStreamHandleId](self, "audioStreamHandleId"),  v17,  0,  mach_absolute_time(),  0);
      }

      goto LABEL_70;
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_injectionAudioFileList, "objectAtIndex:", 0LL));
    __int16 v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( self->_injectionStartNotifyBlocks,  "objectAtIndex:",  0LL));
    -[NSMutableArray removeObjectAtIndex:](self->_injectionAudioFileList, "removeObjectAtIndex:", 0LL);
    -[NSMutableArray removeObjectAtIndex:](self->_injectionStartNotifyBlocks, "removeObjectAtIndex:", 0LL);
    OSStatus v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v16 audioURL]);
    OSStatus v19 = ExtAudioFileOpenURL(v18, &outExtAudioFile);

    if (v19
      && (v20 = (void *)CSLogContextFacilityCoreSpeech,
          os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)))
    {
      v65 = v20;
      v66 = (void *)objc_claimAutoreleasedReturnValue([v16 audioURL]);
      *(_DWORD *)ioData = 136315650;
      *(void *)&ioData[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
      *(_WORD *)&ioData[12] = 2112;
      *(void *)&ioData[14] = v66;
      *(_WORD *)&ioData[22] = 1024;
      *(_DWORD *)&ioData[24] = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_ERROR,  "%s Failed to open audio file %@, error : %d",  ioData,  0x1Cu);

      if (v16) {
        goto LABEL_12;
      }
    }

    else if (v16)
    {
LABEL_12:
      [v16 outASBD];
LABEL_67:
      ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, ioData);
      *(_OWORD *)buf = *(_OWORD *)ioData;
      *(_OWORD *)&buf[16] = *(_OWORD *)&ioData[16];
      uint64_t v104 = v106;
      [v16 setOutASBD:buf];
      [v16 setFFile:outExtAudioFile];
      -[CSAudioInjectionEngine setFileOption:](self, "setFileOption:", v16);
      v67 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v68 = v67;
        v69 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSAudioInjectionEngine _readAudioBufferAndFeed]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%s Streaming from %@", buf, 0x16u);
      }

      uint64_t v70 = mach_absolute_time();
      v17[2](v17, v70);
LABEL_70:

      goto LABEL_71;
    }

    uint64_t v106 = 0LL;
    memset(ioData, 0, sizeof(ioData));
    goto LABEL_67;
  }

  double v4 = self->_bufferDuration;
  BOOL v5 = self->_fileOption;
  if (!v5)
  {
    uint64_t v102 = 0LL;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    double v10 = v4 * 0.0;
    unint64_t v7 = (unint64_t)v10;
LABEL_18:
    uint64_t v99 = 0LL;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    goto LABEL_19;
  }

  -[CSAudioInjectionFileOption outASBD](v5, "outASBD");
  OSStatus v6 = self->_fileOption;
  unint64_t v7 = (unint64_t)(v4 * *(double *)&v100);
  double v8 = self->_bufferDuration;
  if (!v6)
  {
    double v10 = v8 * 0.0;
    goto LABEL_18;
  }

  -[CSAudioInjectionFileOption outASBD](v6, "outASBD");
  double v9 = self->_fileOption;
  double v10 = v8 * *(double *)&v97;
  if (!v9)
  {
LABEL_19:
    uint64_t v96 = 0LL;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    double v13 = v10 * 0.0;
    goto LABEL_20;
  }

  -[CSAudioInjectionFileOption outASBD](v9, "outASBD");
  v11 = self->_fileOption;
  LODWORD(v12) = DWORD2(v95);
  double v13 = v10 * (double)v12;
  if (v11)
  {
    -[CSAudioInjectionFileOption outASBD](v11, "outASBD");
    LODWORD(v14) = HIDWORD(v92);
    double v15 = (double)v14;
    goto LABEL_21;
  }

- (BOOL)injectAudio:(id)a3
{
  LODWORD(v3) = 1008981770;
  return -[CSAudioInjectionEngine injectAudio:withScaleFactor:playbackStarted:completion:]( self,  "injectAudio:withScaleFactor:playbackStarted:completion:",  a3,  0LL,  0LL,  v3);
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 playbackStarted:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  -[CSAudioInjectionEngine _defaultOutASBD](self, "_defaultOutASBD");
  *(float *)&double v13 = a4;
  LOBYTE(self) = -[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]( self,  "injectAudio:withScaleFactor:outASBD:playbackStarted:completion:",  v12,  v15,  v11,  v10,  v13);

  return (char)self;
}

- (BOOL)injectAudio:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5 playbackStarted:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100142538;
  v43[3] = &unk_10022E8A8;
  id v15 = v13;
  id v44 = v15;
  id v16 = objc_retainBlock(v43);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10014254C;
  v41[3] = &unk_10022E8A8;
  id v17 = v14;
  id v42 = v17;
  OSStatus v18 = objc_retainBlock(v41);
  OSStatus v19 = v18;
  if (!v12)
  {
    id v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    BOOL v30 = 0;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Cannot speak nil Audio URL", buf, 0xCu);
LABEL_8:
    BOOL v30 = 0;
    goto LABEL_9;
  }

  id v36 = v15;
  v20 = v18;
  v21 = v16;
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
  unsigned __int8 v24 = [v22 fileExistsAtPath:v23];

  if ((v24 & 1) == 0)
  {
    size_t v32 = (void *)CSLogContextFacilityCoreSpeech;
    BOOL v30 = 0;
    id v16 = v21;
    OSStatus v19 = v20;
    id v15 = v36;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAudioInjectionEngine injectAudio:withScaleFactor:outASBD:playbackStarted:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s Cannot speak since audio file does not exists : %@",  buf,  0x16u);

    goto LABEL_8;
  }

  size_t v25 = objc_alloc(&OBJC_CLASS___CSAudioInjectionFileOption);
  __int128 v26 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  *(_OWORD *)&buf[16] = v26;
  uint64_t v46 = *(void *)&a5->mBitsPerChannel;
  id v27 = -[CSAudioInjectionFileOption initWithAudioURL:withScaleFactor:outASBD:]( v25,  "initWithAudioURL:withScaleFactor:outASBD:",  v12,  buf,  COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[4], LODWORD(a4))));
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100142560;
  block[3] = &unk_10022E8D0;
  block[4] = self;
  float v38 = v27;
  id v16 = v21;
  BOOL v39 = v21;
  OSStatus v19 = v20;
  id v40 = v20;
  v29 = v27;
  dispatch_async(queue, block);

  BOOL v30 = 1;
  id v15 = v36;
LABEL_9:

  return v30;
}

- (BOOL)isRecording
{
  uint64_t v6 = 0LL;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100142524;
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
  block[2] = sub_100142478;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopAudioStream
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100142364;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_deinterleaveBufferIfNeeded:(AudioBufferList *)a3
{
  if (self->_deinterleaver && a3->mBuffers[0].mNumberChannels >= 2)
  {
    BOOL v5 = -[NSMutableData initWithLength:]( objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", a3->mBuffers[0].mDataByteSize);
    uint64_t v6 = -[NSMutableData mutableBytes](v5, "mutableBytes");
    UInt32 v7 = a3->mBuffers[0].mDataByteSize / a3->mBuffers[0].mNumberChannels;
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    do
    {
      id v10 = (char *)self->_pNonInterleavedABL + v8;
      *((_DWORD *)v10 + 2) = 1;
      *((_DWORD *)v10 + 3) = v7;
      *((void *)v10 + 2) = &v6[v7 * v9++];
      v8 += 16LL;
    }

    while (v9 < a3->mBuffers[0].mNumberChannels);
    deinterleaver = self->_deinterleaver;
    +[CSFAudioStreamBasicDescriptionFactory lpcmNonInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmNonInterleavedASBD");
    OSStatus v12 = AudioConverterConvertComplexBuffer(deinterleaver, v7 / v16, a3, self->_pNonInterleavedABL);
    if (v12)
    {
      OSStatus v13 = v12;
      id v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        OSStatus v18 = "-[CSAudioInjectionEngine _deinterleaveBufferIfNeeded:]";
        __int16 v19 = 1026;
        OSStatus v20 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Failed to deinterleave the data: %{public}d",  buf,  0x12u);
      }
    }
  }

  else
  {
    BOOL v5 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  a3->mBuffers[0].mData,  a3->mBuffers[0].mDataByteSize);
  }

  return v5;
}

- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4
{
  id v6 = a3;
  UInt32 v7 = v6;
  if (self->_inputRecordingNumberOfChannels <= a4)
  {
    uint64_t v8 = (NSMutableData *)v6;
  }

  else
  {
    uint64_t v8 = -[NSMutableData initWithLength:]( [NSMutableData alloc],  "initWithLength:",  (unint64_t)[v6 length] / a4 * self->_inputRecordingNumberOfChannels);
    unsigned int inputRecordingNumberOfChannels = self->_inputRecordingNumberOfChannels;
    unint64_t v10 = qword_100280208;
    if (!(v10 % +[CSUtils loggingHeartbeatRate](&OBJC_CLASS___CSUtils, "loggingHeartbeatRate")))
    {
      id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        id v14 = "-[CSAudioInjectionEngine _compensateChannelDataIfNeeded:receivedNumChannels:]";
        __int16 v15 = 1026;
        unsigned int v16 = inputRecordingNumberOfChannels - a4;
        __int16 v17 = 2050;
        uint64_t v18 = qword_100280208;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Compensating %{public}u channel(s), heartbeat = %{public}lld",  (uint8_t *)&v13,  0x1Cu);
      }
    }

    ++qword_100280208;
    -[NSMutableData replaceBytesInRange:withBytes:]( v8, "replaceBytesInRange:withBytes:", 0, [v7 length], objc_msgSend(v7, "bytes"));
  }

  return v8;
}

- (AudioStreamBasicDescription)_defaultOutASBD
{
  if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat")) {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmFloatASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmFloatASBD");
  }
  else {
    result = (AudioStreamBasicDescription *)+[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
  }
  __int128 v5 = v7;
  *(_OWORD *)&retstr->mSampleRate = v6;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = v8;
  return result;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setAudioStreamHandleId:(unint64_t)a3
{
  self->_audioStreamHandleId = a3;
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

- (CSAudioInjectionFileOption)fileOption
{
  return self->_fileOption;
}

- (void)setFileOption:(id)a3
{
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setAudioFeedTimer:(id)a3
{
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (AudioStreamBasicDescription)outASBD
{
  __int128 v3 = *(_OWORD *)&self[3].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[3].mBitsPerChannel;
  return self;
}

- (void)setOutASBD:(AudioStreamBasicDescription *)a3
{
  __int128 v3 = *(_OWORD *)&a3->mSampleRate;
  __int128 v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_outASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_outASBD.mBytesPerPacket = v4;
  *(_OWORD *)&self->_outASBD.mSampleRate = v3;
}

- (double)bufferDuration
{
  return self->_bufferDuration;
}

- (void)setBufferDuration:(double)a3
{
  self->_double bufferDuration = a3;
}

- (NSMutableArray)injectionAudioFileList
{
  return self->_injectionAudioFileList;
}

- (void)setInjectionAudioFileList:(id)a3
{
}

- (NSMutableArray)injectionStartNotifyBlocks
{
  return self->_injectionStartNotifyBlocks;
}

- (void)setInjectionStartNotifyBlocks:(id)a3
{
}

- (NSMutableArray)injectionCompletionNotifyBlocks
{
  return self->_injectionCompletionNotifyBlocks;
}

- (void)setInjectionCompletionNotifyBlocks:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OpaqueAudioConverter)deinterleaver
{
  return self->_deinterleaver;
}

- (void)setDeinterleaver:(OpaqueAudioConverter *)a3
{
  self->_deinterleaver = a3;
}

- (AudioBufferList)pNonInterleavedABL
{
  return self->_pNonInterleavedABL;
}

- (void)setPNonInterleavedABL:(AudioBufferList *)a3
{
  self->_pNonInterleavedABL = a3;
}

- (BOOL)didSetScaleFactor
{
  return self->_didSetScaleFactor;
}

- (void)setDidSetScaleFactor:(BOOL)a3
{
  self->_didSetScaleFactor = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(float)a3
{
  self->_float scaleFactor = a3;
}

- (unsigned)inputRecordingNumberOfChannels
{
  return self->_inputRecordingNumberOfChannels;
}

- (void)setInputRecordingNumberOfChannels:(unsigned int)a3
{
  self->_unsigned int inputRecordingNumberOfChannels = a3;
}

- (void).cxx_destruct
{
}

@end