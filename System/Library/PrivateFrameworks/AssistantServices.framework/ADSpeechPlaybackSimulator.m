@interface ADSpeechPlaybackSimulator
+ (id)_speechLogDecodingError;
- (ADSpeechPlaybackSimulator)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7;
- (id)delegate;
- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3;
- (void)getLastStartpointTimestampAndCurrentTime:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startPlaybackWithURL:(id)a3 narrowBand:(BOOL)a4 dictation:(BOOL)a5 completion:(id)a6;
- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5;
- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5;
@end

@implementation ADSpeechPlaybackSimulator

- (ADSpeechPlaybackSimulator)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADSpeechPlaybackSimulator;
  v10 = -[ADSpeechPlaybackSimulator init](&v13, "init");
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_queue, a3);
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002BD7D8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5
{
  playbackSource = self->_playbackSource;
  if (playbackSource) {
    dispatch_source_cancel((dispatch_source_t)playbackSource);
  }
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  playbackSource = self->_playbackSource;
  if (playbackSource) {
    dispatch_source_cancel((dispatch_source_t)playbackSource);
  }
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

- (void)startPlaybackWithURL:(id)a3 narrowBand:(BOOL)a4 dictation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v11 = (void (**)(void))a6;
  char v62 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[ADSpeechLog buffersFromSpeechLogAtURL:isNarrowBand:]( &OBJC_CLASS___ADSpeechLog,  "buffersFromSpeechLogAtURL:isNarrowBand:",  v10,  &v62));
  if (v12)
  {
    if (v62) {
      int v13 = 1;
    }
    else {
      int v13 = v8;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 pathExtension]);
    BOOL v15 = [v14 caseInsensitiveCompare:@"opx"] == 0;

    v16 = (id *)&SASCodecOPUS_Mono_8000HzValue;
    if (!v15) {
      v16 = (id *)&SASCodecSpeex_NB_Quality7Value;
    }
    v17 = (id *)&SASCodecOPUS_Mono_16000HzValue;
    if (!v15) {
      v17 = (id *)&SASCodecSpeex_WB_Quality8Value;
    }
    if (!v13) {
      v16 = v17;
    }
    id v43 = *v16;
    id v18 = [[CSSiriRecordingInfo alloc] initWithDictation:v7 codec:v43];
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002BD3F8;
    block[3] = &unk_1004FD968;
    block[4] = self;
    id v42 = v18;
    id v60 = v42;
    dispatch_async(queue, block);
    id v20 = [v12 count];
    if (AFPreferencesSimulateImmediateSpeechCapture())
    {
      v21 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[ADSpeechPlaybackSimulator startPlaybackWithURL:narrowBand:dictation:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Simulating immediate speech capture",  buf,  0xCu);
      }

      v22 = (dispatch_queue_s *)self->_queue;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_1002BD440;
      v56[3] = &unk_1004FDA80;
      v56[4] = self;
      id v57 = v12;
      id v58 = v20;
      dispatch_async(v22, v56);
      v23 = (dispatch_queue_s *)self->_queue;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_1002BD484;
      v55[3] = &unk_1004FD0A0;
      v55[4] = self;
      v55[5] = v20;
      dispatch_async(v23, v55);
      if (v11) {
        v11[2](v11);
      }
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v12 reverseObjectEnumerator]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 allObjects]);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v27));

      id v41 = [v28 count];
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      uint64_t v68 = 0LL;
      double v29 = AFPreferencesBufferedSpeechCapturePacketInterval();
      if (v29 == 0.0) {
        double v30 = 0.01;
      }
      else {
        double v30 = v29;
      }
      v31 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v63 = 136315394;
        v64 = "-[ADSpeechPlaybackSimulator startPlaybackWithURL:narrowBand:dictation:completion:]";
        __int16 v65 = 2048;
        double v66 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s Simulating buffered speech capture, speech packets sent every %f seconds",  v63,  0x16u);
      }

      objc_initWeak((id *)v63, self);
      dispatch_queue_attr_t v32 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v33 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v32);
      v34 = dispatch_queue_create(0LL, v33);
      v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v34);

      dispatch_source_set_timer(v35, 0LL, (unint64_t)(v30 * 1000000000.0), 0LL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1002BD4D0;
      handler[3] = &unk_1004FA080;
      id v50 = v28;
      v51 = self;
      id v40 = v28;
      objc_copyWeak(&v54, (id *)v63);
      v53 = buf;
      v36 = v35;
      v52 = v36;
      dispatch_source_set_event_handler(v36, handler);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_1002BD634;
      v44[3] = &unk_1004FA0D0;
      v48[1] = v41;
      v47 = buf;
      v44[4] = self;
      objc_copyWeak(v48, (id *)v63);
      v37 = v36;
      v45 = v37;
      v46 = v11;
      dispatch_source_set_cancel_handler(v37, v44);
      dispatch_resume(v37);
      playbackSource = self->_playbackSource;
      self->_playbackSource = (OS_dispatch_source *)v37;
      v39 = v37;

      objc_destroyWeak(v48);
      objc_destroyWeak(&v54);

      objc_destroyWeak((id *)v63);
      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    v24 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ADSpeechPlaybackSimulator startPlaybackWithURL:narrowBand:dictation:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Couldn't decode Speex / Opus buffers for speech log at URL %{public}@",  buf,  0x16u);
    }

    v25 = (dispatch_queue_s *)self->_queue;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1002BD394;
    v61[3] = &unk_1004FD940;
    v61[4] = self;
    dispatch_async(v25, v61);
  }
}

- (void).cxx_destruct
{
}

+ (id)_speechLogDecodingError
{
  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  204LL,  0LL);
}

@end