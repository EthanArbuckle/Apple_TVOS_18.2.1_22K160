@interface SHPreRecordingWorker
- (NSArray)buffers;
- (NSUUID)requestID;
- (NSUUID)workerID;
- (SHAudioTapProvider)audioTapProvider;
- (SHPreRecordingWorker)initWithRequestID:(id)a3 audioTapProvider:(id)a4;
- (SHWorkerDelegate)workerDelegate;
- (id)completionHandler;
- (int64_t)executionScope;
- (void)setCompletionHandler:(id)a3;
- (void)setWorkerDelegate:(id)a3;
- (void)shutdownWorker;
- (void)startRecordingWithCompletionHandler:(id)a3;
- (void)stopAfterTransferingBuffers;
@end

@implementation SHPreRecordingWorker

- (SHPreRecordingWorker)initWithRequestID:(id)a3 audioTapProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 tapsForAvailableSources]);
  id v10 = [v9 count];

  if (v10)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___SHPreRecordingWorker;
    v12 = -[SHPreRecordingWorker init](&v18, "init");
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_requestID, a3);
      objc_storeStrong(p_isa + 4, a4);
    }

    self = p_isa;
    v14 = self;
  }

  else
  {
    uint64_t v15 = sh_log_object(v11);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to create pre recording worker, there are no recorders available",  buf,  2u);
    }

    v14 = 0LL;
  }

  return v14;
}

- (void)startRecordingWithCompletionHandler:(id)a3
{
  v4 = (uint64_t (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker buffers](self, "buffers"));

  if (v5)
  {
    uint64_t v6 = v4[2](v4);
    uint64_t v7 = sh_log_object(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Pre Recording should not be started twice",  buf,  2u);
    }
  }

  else
  {
    v21 = v4;
    -[SHPreRecordingWorker setCompletionHandler:](self, "setCompletionHandler:", v4);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker audioTapProvider](self, "audioTapProvider"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 tapsForAvailableSources]);

    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
          v16 = -[SHRecordingBuffer initWithTap:](objc_alloc(&OBJC_CLASS___SHRecordingBuffer), "initWithTap:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker audioTapProvider](self, "audioTapProvider"));
          objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v17 audioRecordingManager]);
          [v18 attachTap:v15];

          -[os_log_s addObject:](v8, "addObject:", v16);
        }

        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v12);
    }

    v19 = (NSArray *)-[os_log_s copy](v8, "copy");
    buffers = self->_buffers;
    self->_buffers = v19;

    v4 = v21;
  }
}

- (NSUUID)workerID
{
  return  -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"9846B3A1-6769-4363-8AA2-214973BD05A0");
}

- (int64_t)executionScope
{
  return 1LL;
}

- (void)stopAfterTransferingBuffers
{
  buffers = self->_buffers;
  self->_buffers = 0LL;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker completionHandler](self, "completionHandler"));
  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker completionHandler](self, "completionHandler"));
    v5[2]();

    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0LL;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker workerDelegate](self, "workerDelegate"));
  [v7 finishedWorker:self];

  -[SHPreRecordingWorker setWorkerDelegate:](self, "setWorkerDelegate:", 0LL);
}

- (void)shutdownWorker
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker buffers](self, "buffers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHPreRecordingWorker audioTapProvider](self, "audioTapProvider"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 audioRecordingManager]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 tap]);
        [v10 detachTap:v11];

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

  -[SHPreRecordingWorker stopAfterTransferingBuffers](self, "stopAfterTransferingBuffers");
}

- (SHWorkerDelegate)workerDelegate
{
  return (SHWorkerDelegate *)objc_loadWeakRetained((id *)&self->_workerDelegate);
}

- (void)setWorkerDelegate:(id)a3
{
}

- (NSArray)buffers
{
  return self->_buffers;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (SHAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end