@interface SHAudioSessionManager
- (AVAudioSession)audioSession;
- (BOOL)audioSessionIsActive;
- (BOOL)hasStartedSafetynetException;
- (BOOL)isAudioSessionInterrupted;
- (OS_dispatch_queue)audioManagerDispatchQueue;
- (SHAudioSessionManager)init;
- (SHAudioSessionManagerDelegate)delegate;
- (os_unfair_lock_s)mediaSafetyNetLock;
- (void)activateAudioSessionForClient:(int64_t)a3;
- (void)configureAudioSessionForAssistantService:(id)a3;
- (void)configureAudioSessionForStandardClient:(id)a3;
- (void)deactivateAudioSession;
- (void)dealloc;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)handleAudioSessionRouteChange:(id)a3;
- (void)handleMediaServicesWereLost:(id)a3;
- (void)handleMediaServicesWereReset:(id)a3;
- (void)registerAudioSessionObservers;
- (void)setAudioManagerDispatchQueue:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setAudioSessionIsActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHasStartedSafetynetException:(BOOL)a3;
- (void)setIsAudioSessionInterrupted:(BOOL)a3;
- (void)setMediaSafetyNetLock:(os_unfair_lock_s)a3;
- (void)unregisterAudioSessionObservers;
- (void)updateMediaSafetyNetExemptionToRunning:(BOOL)a3;
@end

@implementation SHAudioSessionManager

- (void)updateMediaSafetyNetExemptionToRunning:(BOOL)a3
{
  BOOL v3 = a3;
  p_mediaSafetyNetLock = &self->_mediaSafetyNetLock;
  os_unfair_lock_lock(&self->_mediaSafetyNetLock);
  if (v3)
  {
    if (!self->_hasStartedSafetynetException) {
      goto LABEL_5;
    }
  }

  else if (self->_hasStartedSafetynetException)
  {
LABEL_5:
    self->_hasStartedSafetynetException = v3;
  }

  os_unfair_lock_unlock(p_mediaSafetyNetLock);
}

- (void)dealloc
{
  uint64_t v3 = sh_log_object(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Deallocating audio session manager", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SHAudioSessionManager;
  -[SHAudioSessionManager dealloc](&v5, "dealloc");
}

- (SHAudioSessionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SHAudioSessionManager;
  v2 = -[SHAudioSessionManager init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.shazamd.audiomanager.dispatch", 0LL);
    audioManagerDispatchQueue = v2->_audioManagerDispatchQueue;
    v2->_audioManagerDispatchQueue = (OS_dispatch_queue *)v3;

    v2->_mediaSafetyNetLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (void)registerAudioSessionObservers
{
  uint64_t v3 = sh_log_object(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Registering audio session observers", v9, 2u);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"handleAudioSessionInterruption:" name:AVAudioSessionInterruptionNotification object:0];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"handleAudioSessionRouteChange:" name:AVAudioSessionRouteChangeNotification object:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 addObserver:self selector:"handleMediaServicesWereLost:" name:AVAudioSessionMediaServicesWereLostNotification object:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 addObserver:self selector:"handleMediaServicesWereReset:" name:AVAudioSessionMediaServicesWereResetNotification object:0];
}

- (void)unregisterAudioSessionObservers
{
  uint64_t v3 = sh_log_object(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Unregistering audio session observers", v9, 2u);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 removeObserver:self name:AVAudioSessionMediaServicesWereLostNotification object:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v8 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:0];
}

- (void)activateAudioSessionForClient:(int64_t)a3
{
  BOOL v5 = -[SHAudioSessionManager audioSessionIsActive](self, "audioSessionIsActive");
  if (!v5)
  {
    uint64_t v6 = sh_log_object(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Activating audio session", buf, 2u);
    }

    -[SHAudioSessionManager updateMediaSafetyNetExemptionToRunning:]( self,  "updateMediaSafetyNetExemptionToRunning:",  1LL);
    -[SHAudioSessionManager registerAudioSessionObservers](self, "registerAudioSessionObservers");
    -[SHAudioSessionManager setIsAudioSessionInterrupted:](self, "setIsAudioSessionInterrupted:", 0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    if (a3 == 2)
    {
      -[SHAudioSessionManager configureAudioSessionForAssistantService:]( self,  "configureAudioSessionForAssistantService:",  v8);
    }

    else if (a3 == 1)
    {
      -[SHAudioSessionManager configureAudioSessionForStandardClient:]( self,  "configureAudioSessionForStandardClient:",  v8);
    }

    id v14 = 0LL;
    unsigned __int8 v9 = [v8 setActive:1 error:&v14];
    id v10 = v14;
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      -[SHAudioSessionManager setAudioSessionIsActive:](self, "setAudioSessionIsActive:", 1LL);
    }

    else
    {
      uint64_t v12 = sh_log_object(v10);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to activate AVAudioSession: %@",  buf,  0xCu);
      }
    }
  }

- (void)configureAudioSessionForStandardClient:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sh_log_object(v3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "configureAudioSessionForStandardClient",  buf,  2u);
  }

  id v29 = 0LL;
  unsigned __int8 v6 = [v3 setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:41 error:&v29];
  id v7 = v29;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = sh_log_object(v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to set category on AVAudioSession: %@",  buf,  0xCu);
    }
  }

  id v28 = v8;
  unsigned __int8 v11 = [v3 setMode:AVAudioSessionModeVideoRecording error:&v28];
  id v12 = v28;

  if ((v11 & 1) == 0)
  {
    uint64_t v14 = sh_log_object(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to set mode: %@", buf, 0xCu);
    }
  }

  id v27 = v12;
  unsigned __int8 v16 = [v3 setAllowHapticsAndSystemSoundsDuringRecording:1 error:&v27];
  id v17 = v27;

  if ((v16 & 1) == 0)
  {
    uint64_t v19 = sh_log_object(v18);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to enable haptics while recording: %@",  buf,  0xCu);
    }
  }

  id v26 = v17;
  unsigned __int8 v21 = [v3 preferDecoupledIO:1 error:&v26];
  id v22 = v26;

  if ((v21 & 1) == 0)
  {
    uint64_t v24 = sh_log_object(v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to decouple IO AVAudioSession: %@",  buf,  0xCu);
    }
  }
}

- (void)configureAudioSessionForAssistantService:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sh_log_object(v3);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "configureAudioSessionForAssistantService",  buf,  2u);
  }

  id v17 = 0LL;
  unsigned __int8 v6 = [v3 setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:1 error:&v17];
  id v7 = v17;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = sh_log_object(v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to set category on AVAudioSession: %@",  buf,  0xCu);
    }
  }

  id v16 = v8;
  unsigned __int8 v11 = [v3 setMode:AVAudioSessionModeSpeechRecognition error:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    uint64_t v14 = sh_log_object(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to set mode: %@", buf, 0xCu);
    }
  }
}

- (void)deactivateAudioSession
{
  BOOL v3 = -[SHAudioSessionManager audioSessionIsActive](self, "audioSessionIsActive");
  if (v3)
  {
    uint64_t v4 = sh_log_object(v3);
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deactivating audio session", buf, 2u);
    }

    -[SHAudioSessionManager updateMediaSafetyNetExemptionToRunning:]( self,  "updateMediaSafetyNetExemptionToRunning:",  0LL);
    -[SHAudioSessionManager unregisterAudioSessionObservers](self, "unregisterAudioSessionObservers");
    -[SHAudioSessionManager setIsAudioSessionInterrupted:](self, "setIsAudioSessionInterrupted:", 0LL);
    -[SHAudioSessionManager setAudioSessionIsActive:](self, "setAudioSessionIsActive:", 0LL);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
    id v12 = 0LL;
    unsigned __int8 v7 = [v6 setActive:0 withOptions:1 error:&v12];
    id v8 = v12;

    if ((v7 & 1) == 0)
    {
      uint64_t v10 = sh_log_object(v9);
      unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to deactivate AVAudioSession: %@",  buf,  0xCu);
      }
    }
  }

- (void)handleAudioSessionInterruption:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:AVAudioSessionInterruptionTypeKey]);
  id v7 = [v6 unsignedIntegerValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:AVAudioSessionInterruptionOptionKey]);
  id v10 = [v9 unsignedIntegerValue];

  if (v7)
  {
    if (v7 != (id)1) {
      return;
    }
    uint64_t v12 = sh_log_object(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Audio interruption started", buf, 2u);
    }

    -[SHAudioSessionManager setIsAudioSessionInterrupted:](self, "setIsAudioSessionInterrupted:", 1LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioSessionManager delegate](self, "delegate"));
    [v14 audioSessionManager:self interruptionBeganWithOptions:v10];
  }

  else
  {
    uint64_t v15 = sh_log_object(-[SHAudioSessionManager setIsAudioSessionInterrupted:](self, "setIsAudioSessionInterrupted:", 0LL));
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Audio interruption ended", v17, 2u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioSessionManager delegate](self, "delegate"));
    [v14 audioSessionManager:self interruptionEndedWithOptions:v10];
  }
}

- (void)handleMediaServicesWereLost:(id)a3
{
  uint64_t v3 = sh_log_object(self, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received media services were lost notification",  v5,  2u);
  }
}

- (void)handleMediaServicesWereReset:(id)a3
{
  uint64_t v4 = sh_log_object(self);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received media services were reset notification - restarting recognition",  v7,  2u);
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioSessionManager delegate](self, "delegate"));
  [v6 mediaServicesWereReset];
}

- (void)handleAudioSessionRouteChange:(id)a3
{
  id v3 = a3;
  uint64_t v5 = sh_log_object(v3, v4);
  unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "handleAudioSessionRouteChange: %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (SHAudioSessionManagerDelegate)delegate
{
  return (SHAudioSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)audioSessionIsActive
{
  return self->_audioSessionIsActive;
}

- (void)setAudioSessionIsActive:(BOOL)a3
{
  self->_audioSessionIsActive = a3;
}

- (BOOL)isAudioSessionInterrupted
{
  return self->_isAudioSessionInterrupted;
}

- (void)setIsAudioSessionInterrupted:(BOOL)a3
{
  self->_isAudioSessionInterrupted = a3;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (OS_dispatch_queue)audioManagerDispatchQueue
{
  return self->_audioManagerDispatchQueue;
}

- (void)setAudioManagerDispatchQueue:(id)a3
{
}

- (os_unfair_lock_s)mediaSafetyNetLock
{
  return self->_mediaSafetyNetLock;
}

- (void)setMediaSafetyNetLock:(os_unfair_lock_s)a3
{
  self->_mediaSafetyNetLock = a3;
}

- (BOOL)hasStartedSafetynetException
{
  return self->_hasStartedSafetynetException;
}

- (void)setHasStartedSafetynetException:(BOOL)a3
{
  self->_hasStartedSafetynetException = a3;
}

- (void).cxx_destruct
{
}

@end