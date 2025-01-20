@interface SHMultipleConcurrentMatcher
- (BOOL)recognitionHasStopped;
- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4;
- (NSArray)matchers;
- (NSRecursiveLock)lock;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHMatcherDelegate)delegate;
- (SHMultipleConcurrentMatcher)initWithMatchers:(id)a3 audioRecordingManager:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRecognitionHasStopped:(BOOL)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHMultipleConcurrentMatcher

- (SHMultipleConcurrentMatcher)initWithMatchers:(id)a3 audioRecordingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SHMultipleConcurrentMatcher;
  v9 = -[SHMultipleConcurrentMatcher init](&v23, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_matchers, a3);
    objc_storeStrong((id *)&v10->_audioRecordingManager, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v10->_lock;
    v10->_lock = v11;

    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v17), "setDelegate:", v10, (void)v19);
          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v15);
    }
  }

  return v10;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher lock](self, "lock"));
  [v5 lock];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher matchers](self, "matchers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if (-[SHMultipleConcurrentMatcher recognitionHasStopped](self, "recognitionHasStopped")) {
        break;
      }
      [v11 startRecognitionForRequest:v4];
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher lock](self, "lock"));
  [v12 unlock];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher lock](self, "lock"));
  [v5 lock];

  uint64_t v6 = sh_log_object(-[SHMultipleConcurrentMatcher setRecognitionHasStopped:](self, "setRecognitionHasStopped:", 1LL));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher matchers](self, "matchers"));
    *(_DWORD *)buf = 138412290;
    __int128 v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "SHMultipleConcurrentMatcher Calling stop on child matchers %@",  buf,  0xCu);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher matchers](self, "matchers", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) stopRecognitionForRequestID:v4];
        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher lock](self, "lock"));
  [v14 unlock];
}

- (void)stopRecognition
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher lock](self, "lock"));
  [v3 lock];

  uint64_t v4 = sh_log_object(-[SHMultipleConcurrentMatcher setRecognitionHasStopped:](self, "setRecognitionHasStopped:", 1LL));
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher matchers](self, "matchers"));
    *(_DWORD *)buf = 138412290;
    __int128 v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "SHMultipleConcurrentMatcher Calling stop on child matchers %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher matchers](self, "matchers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) stopRecognition];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher lock](self, "lock"));
  [v12 unlock];
}

- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metrics]);
  id v7 = [v6 recordingSource];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher audioRecordingManager](self, "audioRecordingManager"));
  id v9 = [v8 suggestedAudioRecordingSource];

  uint64_t v11 = sh_log_object(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher audioRecordingManager](self, "audioRecordingManager"));
    id v14 = [v13 suggestedAudioRecordingSource];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 metrics]);
    int v17 = 134218496;
    id v18 = v14;
    __int16 v19 = 2048;
    id v20 = [v15 recordingSource];
    __int16 v21 = 1024;
    BOOL v22 = v7 == v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Suggested audio recording source %li signature source %li shouldAttempt %i",  (uint8_t *)&v17,  0x1Cu);
  }

  return v7 == v9;
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher matchers](self, "matchers"));
  if ((unint64_t)[v7 count] <= 1)
  {
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 signature]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metrics]);
    id v10 = [v9 recordingSource];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher audioRecordingManager](self, "audioRecordingManager"));
    id v12 = [v11 suggestedAudioRecordingSource];

    if (v10 != v12) {
      goto LABEL_6;
    }
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHMultipleConcurrentMatcher delegate](self, "delegate"));
  [v13 matcher:v14 didProduceResponse:v6];

LABEL_6:
}

- (SHMatcherDelegate)delegate
{
  return (SHMatcherDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)matchers
{
  return self->_matchers;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (BOOL)recognitionHasStopped
{
  return self->_recognitionHasStopped;
}

- (void)setRecognitionHasStopped:(BOOL)a3
{
  self->_recognitionHasStopped = a3;
}

- (void).cxx_destruct
{
}

@end