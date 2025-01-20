@interface MPRemotePlayerServiceConnection
- (BKSApplicationStateMonitor)stateMonitor;
- (BKSProcessAssertion)processAssertion;
- (BOOL)_shouldPreventSuspensionForBackgroundPlayback;
- (BOOL)connectionInvalidated;
- (BOOL)supportsBackgroundAudio;
- (BOOL)wantsProcessAssertion;
- (MPCPlaybackEngine)playbackEngine;
- (MPRemotePlayerServiceConnection)initWithConnection:(id)a3 bundleID:(id)a4 pid:(int)a5 playbackEngine:(id)a6;
- (NSString)bundleID;
- (NSXPCConnection)connection;
- (OS_dispatch_source)assertionInvalidationTimer;
- (int)pid;
- (unint64_t)state;
- (void)_cancelAssertionInvalidationTimerWithReason:(id)a3;
- (void)_startAssertionInvalidationTimerWithEventHandler:(id)a3;
- (void)_updateProcessAssertion;
- (void)dealloc;
- (void)engine:(id)a3 didChangeToState:(unint64_t)a4;
- (void)getServerEndpointWithReply:(id)a3;
- (void)setAssertionInvalidationTimer:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConnectionInvalidated:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setStateMonitor:(id)a3;
- (void)setSupportsBackgroundAudio:(BOOL)a3;
- (void)setWantsProcessAssertion:(BOOL)a3;
- (void)setWantsReverseProcessAssertion:(BOOL)a3;
@end

@implementation MPRemotePlayerServiceConnection

- (MPRemotePlayerServiceConnection)initWithConnection:(id)a3 bundleID:(id)a4 pid:(int)a5 playbackEngine:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MPRemotePlayerServiceConnection;
  v13 = -[MPRemotePlayerServiceConnection init](&v28, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleID, a4);
    v14->_pid = a5;
    objc_storeStrong((id *)&v14->_playbackEngine, a6);
    -[MPCPlaybackEngine addEngineObserver:](v14->_playbackEngine, "addEngineObserver:", v14);
    objc_storeWeak((id *)&v14->_connection, v10);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10000505C;
    v25[3] = &unk_100008258;
    v15 = v14;
    v26 = v15;
    id v16 = v12;
    id v27 = v16;
    [v10 setInvalidationHandler:v25];
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v17 addObserver:v15 selector:"_mediaServicesReset:" name:AVAudioSessionMediaServicesWereResetNotification object:0];

    -[MPRemotePlayerServiceConnection _mediaServicesReset:](v15, "_mediaServicesReset:", 0LL);
    v18 = objc_alloc(&OBJC_CLASS___BKSApplicationStateMonitor);
    id v29 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    v20 = -[BKSApplicationStateMonitor initWithBundleIDs:states:]( v18,  "initWithBundleIDs:states:",  v19,  BKSApplicationStateAll);

    v21 = (void *)objc_claimAutoreleasedReturnValue( -[BKSApplicationStateMonitor bundleInfoValueForKey:PID:]( v20,  "bundleInfoValueForKey:PID:",  @"UIBackgroundModes",  v14->_pid));
    v15->_supportsBackgroundAudio = [v21 containsObject:@"audio"];

    if (v15->_supportsBackgroundAudio)
    {
      -[BKSApplicationStateMonitor invalidate](v20, "invalidate");
    }

    else
    {
      objc_storeStrong((id *)&v15->_stateMonitor, v20);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000050E4;
      v23[3] = &unk_1000082A8;
      id v24 = v16;
      -[BKSApplicationStateMonitor setHandler:](v15->_stateMonitor, "setHandler:", v23);
    }
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPRemotePlayerServiceConnection;
  -[MPRemotePlayerServiceConnection dealloc](&v3, "dealloc");
}

- (void)getServerEndpointWithReply:(id)a3
{
  id v4 = a3;
  sub_100004C88();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 beginTaskWithName:@"getServerEndpointWithReply" expirationHandler:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004F64;
  block[3] = &unk_1000082D0;
  block[4] = self;
  id v10 = v4;
  id v11 = v7;
  id v8 = v4;
  dispatch_sync(&_dispatch_main_q, block);
}

- (void)setWantsReverseProcessAssertion:(BOOL)a3
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 beginTaskWithName:@"setWantsReverseProcessAssertion" expirationHandler:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004D80;
  block[3] = &unk_1000082F8;
  BOOL v9 = a3;
  block[4] = self;
  void block[5] = v7;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  self->_state = a4;
  -[MPRemotePlayerServiceConnection _updateProcessAssertion](self, "_updateProcessAssertion", a3);
}

- (void)_updateProcessAssertion
{
  if (self->_processAssertion)
  {
    if (self->_connectionInvalidated)
    {
      -[MPRemotePlayerServiceConnection _cancelAssertionInvalidationTimerWithReason:]( self,  "_cancelAssertionInvalidationTimerWithReason:",  @"connection invalidated");
      id v3 = sub_1000049CC();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        processAssertion = self->_processAssertion;
        int pid = self->_pid;
        *(_DWORD *)buf = 134218496;
        v14 = self;
        __int16 v15 = 2048;
        id v16 = processAssertion;
        __int16 v17 = 1024;
        int v18 = pid;
        _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "MPRemotePlayerService: %p: invalidated process assertion %p for %d [connection invalidated]",  buf,  0x1Cu);
      }

      -[BKSProcessAssertion invalidate](self->_processAssertion, "invalidate");
      uint64_t v5 = self->_processAssertion;
      self->_processAssertion = 0LL;
      goto LABEL_11;
    }

    if (!-[MPRemotePlayerServiceConnection _shouldPreventSuspensionForBackgroundPlayback]( self,  "_shouldPreventSuspensionForBackgroundPlayback"))
    {
      -[MPRemotePlayerServiceConnection _cancelAssertionInvalidationTimerWithReason:]( self,  "_cancelAssertionInvalidationTimerWithReason:",  @"reset invalidation window");
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100004B8C;
      v11[3] = &unk_100008280;
      v11[4] = self;
      -[MPRemotePlayerServiceConnection _startAssertionInvalidationTimerWithEventHandler:]( self,  "_startAssertionInvalidationTimerWithEventHandler:",  v11);
      return;
    }
  }

  else if (!-[MPRemotePlayerServiceConnection _shouldPreventSuspensionForBackgroundPlayback]( self,  "_shouldPreventSuspensionForBackgroundPlayback"))
  {
    return;
  }

  if (self->_processAssertion) {
    return;
  }
  v6 = objc_alloc(&OBJC_CLASS___BKSProcessAssertion);
  uint64_t v7 = self->_pid;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004A3C;
  v12[3] = &unk_100008320;
  v12[4] = self;
  id v8 = -[BKSProcessAssertion initWithPID:flags:reason:name:withHandler:]( v6,  "initWithPID:flags:reason:name:withHandler:",  v7,  1LL,  1LL,  @"MPMusicPlayerController/applicationMusicPlayer/notifications",  v12);
  uint64_t v5 = self->_processAssertion;
  self->_processAssertion = v8;
LABEL_11:
}

- (BOOL)_shouldPreventSuspensionForBackgroundPlayback
{
  if (!self->_wantsProcessAssertion) {
    return 0;
  }
  unint64_t state = self->_state;
  return (state == 1 || state == 1000) && self->_supportsBackgroundAudio;
}

- (void)_startAssertionInvalidationTimerWithEventHandler:(id)a3
{
  id v5 = a3;
  if (self->_assertionInvalidationTimer)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2 object:self file:@"MPRemotePlayerService.m" lineNumber:243 description:@"Cancel existing timer before starting a new one."];
  }

  v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  assertionInvalidationTimer = self->_assertionInvalidationTimer;
  self->_assertionInvalidationTimer = v6;

  id v8 = self->_assertionInvalidationTimer;
  dispatch_time_t v9 = dispatch_time(0LL, 3000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  dispatch_source_set_event_handler((dispatch_source_t)self->_assertionInvalidationTimer, v5);
  dispatch_resume((dispatch_object_t)self->_assertionInvalidationTimer);
  id v10 = sub_1000049CC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = self->_assertionInvalidationTimer;
    int v14 = 134218240;
    __int16 v15 = self;
    __int16 v16 = 2048;
    __int16 v17 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MPRemotePlayerService: %p: started assertion invalidation timer %p",  (uint8_t *)&v14,  0x16u);
  }
}

- (void)_cancelAssertionInvalidationTimerWithReason:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"MPRemotePlayerService.m" lineNumber:253 description:@"Must provide a reason for logging."];
  }

  if (self->_assertionInvalidationTimer)
  {
    id v6 = sub_1000049CC();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      assertionInvalidationTimer = self->_assertionInvalidationTimer;
      int v11 = 134218498;
      id v12 = self;
      __int16 v13 = 2048;
      int v14 = assertionInvalidationTimer;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "MPRemotePlayerService: %p: canceled assertion invalidation timer %p [%{public}@]",  (uint8_t *)&v11,  0x20u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_assertionInvalidationTimer);
    id v8 = self->_assertionInvalidationTimer;
    self->_assertionInvalidationTimer = 0LL;
  }
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (void)setSupportsBackgroundAudio:(BOOL)a3
{
  self->_supportsBackgroundAudio = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_int pid = a3;
}

- (MPCPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (BOOL)connectionInvalidated
{
  return self->_connectionInvalidated;
}

- (void)setConnectionInvalidated:(BOOL)a3
{
  self->_connectionInvalidated = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (BKSApplicationStateMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (void)setStateMonitor:(id)a3
{
}

- (BKSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (BOOL)wantsProcessAssertion
{
  return self->_wantsProcessAssertion;
}

- (void)setWantsProcessAssertion:(BOOL)a3
{
  self->_wantsProcessAssertion = a3;
}

- (OS_dispatch_source)assertionInvalidationTimer
{
  return self->_assertionInvalidationTimer;
}

- (void)setAssertionInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end