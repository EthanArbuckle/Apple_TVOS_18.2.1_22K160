@interface CSFallbackAudioSessionReleaseProvider
- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (CSAudioRecorder)audioRecorder;
- (CSFallbackAudioSessionReleaseProvider)initWithAudioRecorder:(id)a3;
- (OS_dispatch_queue)queue;
- (void)audioRecorderWillBeDestroyed:(id)a3;
- (void)setAudioRecorder:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSFallbackAudioSessionReleaseProvider

- (CSFallbackAudioSessionReleaseProvider)initWithAudioRecorder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CSFallbackAudioSessionReleaseProvider;
  v6 = -[CSFallbackAudioSessionReleaseProvider init](&v11, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("CSFallbackAudioSessionReleaseProvider", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_audioRecorder, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSFallbackAudioSessionReleaseProvider audioRecorder](v6, "audioRecorder"));
    [v9 registerObserver:v6];
  }

  return v6;
}

- (void)setAudioRecorder:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A510;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)fallbackDeactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10000A3E4;
  v15 = sub_10000A3F4;
  id v16 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000A3FC;
  v10[3] = &unk_10022BBC0;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  v10[7] = a3;
  dispatch_async_and_wait(queue, v10);
  if (!*((_BYTE *)v18 + 24))
  {
    id v6 = (os_log_s *)CSLogCategoryAudio;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v12[5] localizedDescription]);
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSFallbackAudioSessionReleaseProvider fallbackDeactivateAudioSession:error:]";
      __int16 v23 = 2114;
      v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Cannot deactivateAudioSession with %{public}@",  buf,  0x16u);
    }
  }

  if (a4) {
    *a4 = (id) v12[5];
  }
  BOOL v8 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)audioRecorderWillBeDestroyed:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A3B0;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void).cxx_destruct
{
}

@end