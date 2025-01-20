@interface SHAudioManager
+ (id)sharedInstance;
- (BOOL)recorder:(id)a3 shouldProcessAudioBuffer:(id)a4 atTime:(id)a5;
- (NSLock)recordingLogsLock;
- (NSMutableDictionary)recordingLogs;
- (SHAudioManager)initWithAudioSessionManager:(id)a3 audioRecordingManager:(id)a4;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioSessionManager)audioSessionManager;
- (int64_t)activeAssistantServiceTaps;
- (void)audioRecordingManager:(id)a3 didDetachTap:(id)a4;
- (void)audioRecordingManager:(id)a3 failedToStartRecorders:(id)a4;
- (void)audioRecordingManager:(id)a3 willAttachTap:(id)a4;
- (void)audioRecordingManagerDidStopRecording:(id)a3;
- (void)audioRecordingManagerWillStartRecording:(id)a3;
- (void)audioSessionManager:(id)a3 interruptionBeganWithOptions:(unint64_t)a4;
- (void)audioSessionManager:(id)a3 interruptionEndedWithOptions:(unint64_t)a4;
- (void)mediaServicesWereReset;
- (void)recorder:(id)a3 failedToStartWithError:(id)a4;
- (void)resetRecordingLog;
@end

@implementation SHAudioManager

- (SHAudioManager)initWithAudioSessionManager:(id)a3 audioRecordingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SHAudioManager;
  v9 = -[SHAudioManager init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_audioSessionManager, a3);
    -[SHAudioSessionManager setDelegate:](v10->_audioSessionManager, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_audioRecordingManager, a4);
    -[SHAudioRecordingManager setDelegate:](v10->_audioRecordingManager, "setDelegate:", v10);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    recordingLogs = v10->_recordingLogs;
    v10->_recordingLogs = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSLock);
    recordingLogsLock = v10->_recordingLogsLock;
    v10->_recordingLogsLock = v13;
  }

  return v10;
}

+ (id)sharedInstance
{
  if (qword_100088960 != -1) {
    dispatch_once(&qword_100088960, &stru_10006CF30);
  }
  return (id)qword_100088958;
}

- (void)mediaServicesWereReset
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager"));
  [v3 stopRecordingForReason:6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager"));
  unsigned int v5 = [v4 hasActiveTaps];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager"));
    [v6 startRecording];
  }

- (void)audioSessionManager:(id)a3 interruptionBeganWithOptions:(unint64_t)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager", a3, a4));
  [v4 stopRecordingForReason:4];
}

- (void)audioSessionManager:(id)a3 interruptionEndedWithOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if ((v4 & 1) != 0
    && (id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager")),
        unsigned __int8 v9 = [v8 hasActiveTaps],
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = sh_log_object(v6);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Resuming recording after interruption",  v15,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager"));
    [v12 startRecording];
  }

  else
  {
    uint64_t v13 = sh_log_object(v6);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Audio interruption ended but recording should not restart",  buf,  2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager"));
    [v12 stopRecordingForReason:5];
  }
}

- (BOOL)recorder:(id)a3 shouldProcessAudioBuffer:(id)a4 atTime:(id)a5
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioSessionManager](self, "audioSessionManager", a3, a4, a5));
  unsigned __int8 v6 = [v5 isAudioSessionInterrupted];

  return v6 ^ 1;
}

- (void)recorder:(id)a3 failedToStartWithError:(id)a4
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioSessionManager](self, "audioSessionManager", a3, a4));
  [v5 deactivateAudioSession];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioSessionManager](self, "audioSessionManager"));
  [v6 activateAudioSessionForClient:2];
}

- (void)audioRecordingManager:(id)a3 failedToStartRecorders:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioRecordingManager](self, "audioRecordingManager", a3, a4));
  [v4 stopRecordingForReason:3];
}

- (void)audioRecordingManager:(id)a3 willAttachTap:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v6 lock];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogs](self, "recordingLogs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  unsigned __int8 v9 = (SHRecordingLog *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (!v9)
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___SHRecordingLog);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    unsigned __int8 v9 = -[SHRecordingLog initWithBundleID:](v10, "initWithBundleID:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogs](self, "recordingLogs"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    [v12 setObject:v9 forKey:v13];
  }

  -[SHRecordingLog attachedTapForClient:](v9, "attachedTapForClient:", [v5 client]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v14 unlock];

  uint64_t v16 = sh_log_object(v15);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    int64_t v19 = -[SHAudioManager activeAssistantServiceTaps](self, "activeAssistantServiceTaps");
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "willAttachTap: number of assistant taps %li",  (uint8_t *)&v18,  0xCu);
  }
}

- (void)audioRecordingManager:(id)a3 didDetachTap:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v6 lock];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogs](self, "recordingLogs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  id v10 = [v5 client];
  [v9 detachedTapForClient:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v11 unlock];

  uint64_t v13 = sh_log_object(v12);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    int64_t v16 = -[SHAudioManager activeAssistantServiceTaps](self, "activeAssistantServiceTaps");
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "didDetachTap: number of assistant taps %li",  (uint8_t *)&v15,  0xCu);
  }
}

- (void)audioRecordingManagerWillStartRecording:(id)a3
{
  uint64_t v4 = sh_log_object(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = -[SHAudioManager activeAssistantServiceTaps](self, "activeAssistantServiceTaps");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "audioRecordingManagerWillStartRecording - number of assistant taps %li",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioSessionManager](self, "audioSessionManager"));
  if (-[SHAudioManager activeAssistantServiceTaps](self, "activeAssistantServiceTaps") < 1) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
  [v6 activateAudioSessionForClient:v7];
}

- (void)audioRecordingManagerDidStopRecording:(id)a3
{
  uint64_t v4 = sh_log_object(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "audioRecordingManagerDidStopRecording", v9, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioSessionManager](self, "audioSessionManager"));
  unsigned __int8 v7 = [v6 isAudioSessionInterrupted];

  if ((v7 & 1) == 0)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager audioSessionManager](self, "audioSessionManager"));
    [v8 deactivateAudioSession];
  }

- (void)resetRecordingLog
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v3 lock];

  uint64_t v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  recordingLogs = self->_recordingLogs;
  self->_recordingLogs = v4;

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v6 unlock];
}

- (int64_t)activeAssistantServiceTaps
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v3 lock];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogs](self, "recordingLogs", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0LL;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += (int64_t)[*(id *)(*((void *)&v13 + 1) + 8 * (void)i) assistantTapCount];
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  else
  {
    int64_t v8 = 0LL;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioManager recordingLogsLock](self, "recordingLogsLock"));
  [v11 unlock];

  return v8;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHAudioSessionManager)audioSessionManager
{
  return self->_audioSessionManager;
}

- (NSMutableDictionary)recordingLogs
{
  return self->_recordingLogs;
}

- (NSLock)recordingLogsLock
{
  return self->_recordingLogsLock;
}

- (void).cxx_destruct
{
}

@end