@interface SHAudioRecordingManager
- (BOOL)hasActiveTaps;
- (BOOL)hasActiveTapsForRecordingSource:(int64_t)a3;
- (BOOL)isAudioSourceSupported:(int64_t)a3;
- (BOOL)shouldStartRecorder:(id)a3;
- (NSArray)recorders;
- (NSMutableSet)activeTaps;
- (NSMutableSet)silentRecorders;
- (NSRecursiveLock)lock;
- (OS_dispatch_group)startRecognitionGroup;
- (SHAudioEnvironment)audioEnvironment;
- (SHAudioRecordingManager)initWithRecorders:(id)a3;
- (SHAudioRecordingManagerDelegate)delegate;
- (id)recorderForSource:(int64_t)a3;
- (int64_t)previouslySuggestedAudioRecordingSource;
- (int64_t)suggestedAudioRecordingSource;
- (void)attachTap:(id)a3;
- (void)dealloc;
- (void)detachTap:(id)a3;
- (void)recorder:(id)a3 failedToStartWithError:(id)a4;
- (void)recorder:(id)a3 producedAudioBuffer:(id)a4 atTime:(id)a5;
- (void)setAudioEnvironment:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(id)a3;
- (void)setPreviouslySuggestedAudioRecordingSource:(int64_t)a3;
- (void)startRecording;
- (void)stopRecordingForReason:(int64_t)a3;
@end

@implementation SHAudioRecordingManager

- (void)dealloc
{
  uint64_t v3 = sh_log_object(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Deallocating recording service", buf, 2u);
  }

  -[SHAudioRecordingManager stopRecordingForReason:](self, "stopRecordingForReason:", 2LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SHAudioRecordingManager;
  -[SHAudioRecordingManager dealloc](&v5, "dealloc");
}

- (SHAudioRecordingManager)initWithRecorders:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SHAudioRecordingManager;
  v6 = -[SHAudioRecordingManager init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recorders, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    activeTaps = v7->_activeTaps;
    v7->_activeTaps = (NSMutableSet *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    silentRecorders = v7->_silentRecorders;
    v7->_silentRecorders = (NSMutableSet *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v7->_lock;
    v7->_lock = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___SHAudioEnvironment);
    audioEnvironment = v7->_audioEnvironment;
    v7->_audioEnvironment = v14;

    dispatch_group_t v16 = dispatch_group_create();
    startRecognitionGroup = v7->_startRecognitionGroup;
    v7->_startRecognitionGroup = (OS_dispatch_group *)v16;
  }

  return v7;
}

- (BOOL)shouldStartRecorder:(id)a3
{
  id v4 = a3;
  else {
    BOOL v5 = -[SHAudioRecordingManager hasActiveTapsForRecordingSource:]( self,  "hasActiveTapsForRecordingSource:",  [v4 recordingSource]);
  }

  return v5;
}

- (void)startRecording
{
  uint64_t v3 = sh_log_object(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting recording", (uint8_t *)buf, 2u);
  }

  BOOL v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager startRecognitionGroup](self, "startRecognitionGroup"));
  dispatch_group_enter(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](self, "delegate"));
  [v6 audioRecordingManagerWillStartRecording:self];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorders](self, "recorders"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));

  objc_initWeak(buf, self);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorders](self, "recorders"));
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (-[SHAudioRecordingManager shouldStartRecorder:](self, "shouldStartRecorder:", v13))
        {
          [v13 setDelegate:self];
          v14 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager startRecognitionGroup](self, "startRecognitionGroup"));
          dispatch_group_enter(v14);

          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_100030DA8;
          v18[3] = &unk_10006DA98;
          objc_copyWeak(&v20, buf);
          v18[4] = v13;
          id v19 = v8;
          [v13 startRecordingWithCompletion:v18];

          objc_destroyWeak(&v20);
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v10);
  }

  v15 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager startRecognitionGroup](self, "startRecognitionGroup"));
  dispatch_group_leave(v15);

  dispatch_group_t v16 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager startRecognitionGroup](self, "startRecognitionGroup"));
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

  if ([v8 count])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](self, "delegate"));
    [v17 audioRecordingManager:self failedToStartRecorders:v8];
  }

  objc_destroyWeak(buf);
}

- (void)stopRecordingForReason:(int64_t)a3
{
  uint64_t v5 = sh_log_object(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v57 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping recording for reason %lu", buf, 0xCu);
  }

  int64_t v44 = a3;

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  v43 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorders](self, "recorders"));
  id v8 = [v7 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        uint64_t v13 = sh_log_object([v12 setDelegate:0]);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v57 = (int64_t)v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Stopping recorder: %@", buf, 0xCu);
        }

        id v49 = 0LL;
        unsigned __int8 v15 = [v12 stopRecordingWithError:&v49];
        id v16 = v49;
        v17 = v16;
        if ((v15 & 1) == 0)
        {
          uint64_t v18 = sh_log_object(v16);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v57 = (int64_t)v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to stop recorder with error: %@",  buf,  0xCu);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }

    while (v9);
  }

  int64_t v20 = v44;
  if (v44 == 5 || v44 == 3)
  {
    if (v44 == 3) {
      uint64_t v21 = 104LL;
    }
    else {
      uint64_t v21 = 105LL;
    }
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](v43, "lock"));
    [v22 lock];

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](v43, "activeTaps"));
    id v24 = [v23 copy];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](v43, "lock"));
    [v25 unlock];

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v26 = v24;
    id v27 = [v26 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v46;
      uint64_t v30 = SHCoreErrorDomain;
      do
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          v32 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 completion]);

          if (v33)
          {
            v34 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v32 completion]);
            v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  v21,  0LL));
            ((void (**)(void, void, void, void *))v34)[2](v34, 0LL, 0LL, v35);
          }
        }

        id v28 = [v26 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }

      while (v28);
    }

    int64_t v20 = v44;
  }

  if ((v20 & 0xFFFFFFFFFFFFFFFDLL) != 4)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](v43, "lock"));
    [v36 lock];

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](v43, "activeTaps"));
    [v37 removeAllObjects];

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](v43, "lock"));
    [v38 unlock];
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](v43, "delegate"));
  [v39 audioRecordingManagerDidStopRecording:v43];

  uint64_t v41 = sh_log_object(v40);
  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v57 = v20;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Stopped recording for reason %lu", buf, 0xCu);
  }
}

- (void)attachTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](self, "activeTaps"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v8 = sh_log_object(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not attaching tap: %@ it is already attached",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](self, "delegate"));
    [v10 audioRecordingManager:self willAttachTap:v4];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
    [v11 lock];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](self, "activeTaps"));
    [v12 addObject:v4];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
    [v13 unlock];

    -[SHAudioRecordingManager startRecording](self, "startRecording");
  }
}

- (void)detachTap:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SHAudioRecordingManager hasActiveTaps](self, "hasActiveTaps");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v6 lock];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](self, "activeTaps"));
  [v7 removeObject:v4];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v8 unlock];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](self, "delegate"));
  [v9 audioRecordingManager:self didDetachTap:v4];

  uint64_t v11 = sh_log_object(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](self, "activeTaps"));
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Detached tap: %@ taps remaining: %@",  (uint8_t *)&v14,  0x16u);
  }

  if (v5 && !-[SHAudioRecordingManager hasActiveTaps](self, "hasActiveTaps")) {
    -[SHAudioRecordingManager stopRecordingForReason:](self, "stopRecordingForReason:", 1LL);
  }
}

- (BOOL)hasActiveTaps
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v3 lock];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](self, "activeTaps"));
  id v5 = [v4 count];

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v6 unlock];

  return v5 != 0LL;
}

- (BOOL)hasActiveTapsForRecordingSource:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v5 lock];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](self, "activeTaps", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) recordingSource] == (id)a3)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
          [v12 unlock];

          BOOL v11 = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v6 unlock];
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (int64_t)suggestedAudioRecordingSource
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorders](self, "recorders"));
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorders](self, "recorders"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    id v7 = [v6 recordingSource];

    return (int64_t)v7;
  }

  unsigned int v9 = -[SHAudioRecordingManager isAudioSourceSupported:](self, "isAudioSourceSupported:", 1LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager audioEnvironment](self, "audioEnvironment"));
  unsigned int v11 = [v10 isUsingAlternativeOutputToBuiltInSpeaker];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager audioEnvironment](self, "audioEnvironment"));
  unsigned int v13 = [v12 isOtherAudioPlaying];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v14 lock];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager silentRecorders](self, "silentRecorders"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorderForSource:](self, "recorderForSource:", 1LL));
  unsigned int v17 = [v15 containsObject:v16];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
  [v18 unlock];

  if (v17) {
    uint64_t v19 = 2LL;
  }
  else {
    uint64_t v19 = 1LL;
  }
  if ((v9 & v11 & v13) != 0) {
    int64_t v20 = v19;
  }
  else {
    int64_t v20 = 2LL;
  }
  int64_t v21 = -[SHAudioRecordingManager previouslySuggestedAudioRecordingSource]( self,  "previouslySuggestedAudioRecordingSource");
  if (v21 != v20)
  {
    if (v20 == 2)
    {
      uint64_t v25 = sh_log_object(v21);
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        id v24 = "Marking the external audio source as preferred";
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v22 = sh_log_object(v21);
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        id v24 = "Marking the internal audio source as preferred";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)v29, 2u);
      }
    }

    uint64_t v27 = sh_log_object(v26);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29[0] = 67109888;
      v29[1] = v9;
      __int16 v30 = 1024;
      unsigned int v31 = v11;
      __int16 v32 = 1024;
      unsigned int v33 = v13;
      __int16 v34 = 1024;
      int v35 = v17 ^ 1;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "Internal audio source support: %d is using alternative output to built-in speaker: %d other audio playing %d, in ternal recorder is producing audio %d",  (uint8_t *)v29,  0x1Au);
    }

    -[SHAudioRecordingManager setPreviouslySuggestedAudioRecordingSource:]( self,  "setPreviouslySuggestedAudioRecordingSource:",  v20);
  }

  return v20;
}

- (BOOL)isAudioSourceSupported:(int64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorderForSource:](self, "recorderForSource:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)recorderForSource:(int64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager recorders](self, "recorders", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 recordingSource] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (void)recorder:(id)a3 producedAudioBuffer:(id)a4 atTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](self, "delegate"));
  if (!v11
    || (__int128 v12 = (void *)v11,
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](self, "delegate")),
        unsigned int v14 = [v13 recorder:v8 shouldProcessAudioBuffer:v9 atTime:v10],
        v13,
        v12,
        v14))
  {
    id v15 = v9;
    unsigned int v16 = *((_DWORD *)[v15 audioBufferList] + 3);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 format]);
    uint64_t v18 = v16 / *((_DWORD *)[v17 streamDescription] + 6);
    uint64_t v19 = [v15 audioBufferList];

    float v20 = cblas_sasum_NEWLAPACK(v18, v19[2], 1LL);
    int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
    [v21 lock];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager silentRecorders](self, "silentRecorders"));
    __int128 v23 = v22;
    if (v20 <= 1.1755e-38)
    {
      [v22 addObject:v8];

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
      [v36 unlock];
    }

    else
    {
      [v22 removeObject:v8];

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager activeTaps](self, "activeTaps"));
      id v25 = [v24 copy];

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager lock](self, "lock"));
      [v26 unlock];

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v27 = v25;
      id v28 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v38;
        do
        {
          for (i = 0LL; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v38 != v30) {
              objc_enumerationMutation(v27);
            }
            __int16 v32 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
            id v33 = objc_msgSend(v32, "recordingSource", (void)v37);
            if (v33 == [v8 recordingSource])
            {
              __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v32 completion]);

              if (v34)
              {
                int v35 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v32 completion]);
                ((void (**)(void, id, id, void))v35)[2](v35, v15, v10, 0LL);
              }
            }
          }

          id v29 = [v27 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }

        while (v29);
      }
    }
  }
}

- (void)recorder:(id)a3 failedToStartWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SHAudioRecordingManager delegate](self, "delegate"));
  [v8 recorder:v7 failedToStartWithError:v6];
}

- (SHAudioRecordingManagerDelegate)delegate
{
  return (SHAudioRecordingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)recorders
{
  return self->_recorders;
}

- (NSMutableSet)activeTaps
{
  return self->_activeTaps;
}

- (NSMutableSet)silentRecorders
{
  return self->_silentRecorders;
}

- (OS_dispatch_group)startRecognitionGroup
{
  return self->_startRecognitionGroup;
}

- (SHAudioEnvironment)audioEnvironment
{
  return self->_audioEnvironment;
}

- (void)setAudioEnvironment:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (int64_t)previouslySuggestedAudioRecordingSource
{
  return self->_previouslySuggestedAudioRecordingSource;
}

- (void)setPreviouslySuggestedAudioRecordingSource:(int64_t)a3
{
  self->_previouslySuggestedAudioRecordingSource = a3;
}

- (void).cxx_destruct
{
}

@end