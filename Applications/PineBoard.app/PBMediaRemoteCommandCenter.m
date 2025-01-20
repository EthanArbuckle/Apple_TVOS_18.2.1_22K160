@interface PBMediaRemoteCommandCenter
+ (id)defaultCenter;
- (BOOL)_shouldSendMediaRemoteCommand:(unsigned int)a3 rejectionReason:(id *)a4;
- (OS_dispatch_source)updateNowPlayingGestureSource;
- (PBMediaRemoteCommandCenter)init;
- (PBMediaRemoteCommandCenter)initWithMediaRemoteObserver:(id)a3 commandPerformer:(id)a4;
- (PBSystemGestureHandle)fastForwardLongPressGestureHandle;
- (PBSystemGestureHandle)fastForwardTapGestureHandle;
- (PBSystemGestureHandle)nextTrackGestureHandle;
- (PBSystemGestureHandle)pauseGestureHandle;
- (PBSystemGestureHandle)pauseNowPlayingGestureHandle;
- (PBSystemGestureHandle)playGestureHandle;
- (PBSystemGestureHandle)previousTrackGestureHandle;
- (PBSystemGestureHandle)rewindLongPressGestureHandle;
- (PBSystemGestureHandle)rewindTapGestureHandle;
- (PBSystemGestureHandle)skipBackwardsGestureHandle;
- (PBSystemGestureHandle)skipForwardsGestureHandle;
- (PBSystemGestureHandle)stopGestureHandle;
- (id)commandFilter;
- (id)unhandledCommandHandler;
- (void)_attemptToSendMediaRemoteCommand:(unsigned int)a3 withSender:(id)a4;
- (void)_beginSystemObservations;
- (void)_changePlaybackRateWithBlock:(id)a3;
- (void)_enableSystemGestures;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4;
- (void)_setNeedsNowPlayingGestureStateUpdate;
- (void)_skipBackwardsWithInterval:(double)a3;
- (void)_skipForwardsWithInterval:(double)a3;
- (void)_stopSystemObservations;
- (void)_updateNowPlayingGestureState;
- (void)beginSeekingBackwardsWithReason:(id)a3;
- (void)beginSeekingForwardsWithReason:(id)a3;
- (void)dealloc;
- (void)decreasePlaybackRateWithReason:(id)a3;
- (void)endSeekingBackwardsWithReason:(id)a3;
- (void)endSeekingForwardsWithReason:(id)a3;
- (void)increasePlaybackRateWithReason:(id)a3;
- (void)nextTrackWithReason:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseWithReason:(id)a3;
- (void)pictureInPictureManager:(id)a3 didUpdateState:(id)a4;
- (void)playWithReason:(id)a3;
- (void)previousTrackWithReason:(id)a3;
- (void)setCommandFilter:(id)a3;
- (void)setUnhandledCommandHandler:(id)a3;
- (void)skipBackwardsWithReason:(id)a3;
- (void)skipForwardsWithReason:(id)a3;
- (void)stopWithReason:(id)a3;
@end

@implementation PBMediaRemoteCommandCenter

+ (id)defaultCenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E0CCC;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470A60 != -1) {
    dispatch_once(&qword_100470A60, block);
  }
  return (id)qword_100470A58;
}

- (PBMediaRemoteCommandCenter)initWithMediaRemoteObserver:(id)a3 commandPerformer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = v8;
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___PBMediaRemoteCommandCenter;
    v10 = -[PBMediaRemoteCommandCenter init](&v15, "init");
    if (v10)
    {
      id v11 = objc_retainBlock(v9);
      id commandPerformer = v10->_commandPerformer;
      v10->_id commandPerformer = v11;

      objc_storeStrong((id *)&v10->_mediaRemoteObserver, a3);
    }

    return v10;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"commandPerformer != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027EF60();
    }
    result = (PBMediaRemoteCommandCenter *)_bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
  }

  return result;
}

- (PBMediaRemoteCommandCenter)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  v4 = -[PBMediaRemoteCommandCenter initWithMediaRemoteObserver:commandPerformer:]( self,  "initWithMediaRemoteObserver:commandPerformer:",  v3,  &stru_1003D6498);

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMediaRemoteCommandCenter;
  -[PBMediaRemoteCommandCenter dealloc](&v3, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D64B8)
  {
    -[PBMediaRemoteCommandCenter _setNeedsNowPlayingGestureStateUpdate]( self,  "_setNeedsNowPlayingGestureStateUpdate",  a3,  a4,  a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBMediaRemoteCommandCenter;
    -[PBMediaRemoteCommandCenter observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (BOOL)_shouldSendMediaRemoteCommand:(unsigned int)a3 rejectionReason:(id *)a4
{
  commandFilter = (uint64_t (**)(id, void, id *))self->_commandFilter;
  if (!commandFilter || (commandFilter[2](commandFilter, *(void *)&a3, a4) & 1) != 0) {
    return 1;
  }
  if (*a4) {
    return 0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A rejection reason must be provided if the command is disallowed"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10027F008();
  }
  BOOL result = _bs_set_crash_log_message([v7 UTF8String]);
  __break(0);
  return result;
}

- (void)_attemptToSendMediaRemoteCommand:(unsigned int)a3 withSender:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  id v33 = 0LL;
  unsigned int v7 = -[PBMediaRemoteCommandCenter _shouldSendMediaRemoteCommand:rejectionReason:]( self,  "_shouldSendMediaRemoteCommand:rejectionReason:",  v4,  &v33);
  id v8 = v33;
  if (v7)
  {
    id v9 = objc_retainBlock(self->_commandPerformer);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000E1348;
    v29[3] = &unk_1003D64C8;
    v31 = &v34;
    id v10 = v9;
    id v30 = v10;
    int v32 = v4;
    id v11 = objc_retainBlock(v29);
    id v12 = sub_1000E0D0C(self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000E138C;
    v26[3] = &unk_1003D5870;
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    id v27 = v13;
    v28 = &v34;
    v14 = objc_retainBlock(v26);
    (*((void (**)(id, void *, void *))v6 + 2))(v6, v11, v14);
  }

  else
  {
    id v15 = sub_1000E0D0C(self);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Request to send command rejected {reason=%{public}@}",  buf,  0xCu);
    }
  }

  if (!*((_BYTE *)v35 + 24))
  {
    id unhandledCommandHandler = self->_unhandledCommandHandler;
    if (unhandledCommandHandler)
    {
      id v17 = objc_retainBlock(unhandledCommandHandler);
      v18 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/unhandled",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000E13D8;
      v23[3] = &unk_1003D5710;
      v25 = &v34;
      id v19 = v17;
      id v24 = v19;
      os_activity_apply(v18, v23);

      id v20 = sub_1000E0D0C(self);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v22 = *((unsigned __int8 *)v35 + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Unhandled command handler responded with: %{BOOL}d",  buf,  8u);
      }
    }
  }

  _Block_object_dispose(&v34, 8);
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E1494;
  v7[3] = &unk_1003D64F0;
  id v8 = a4;
  id v6 = v8;
  -[PBMediaRemoteCommandCenter _attemptToSendMediaRemoteCommand:withSender:]( self,  "_attemptToSendMediaRemoteCommand:withSender:",  v4,  v7);
}

- (void)_changePlaybackRateWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000E15A8;
    v7[3] = &unk_1003D6518;
    void v7[4] = self;
    id v8 = v4;
    id v5 = v4;
    -[PBMediaRemoteCommandCenter _attemptToSendMediaRemoteCommand:withSender:]( self,  "_attemptToSendMediaRemoteCommand:withSender:",  19LL,  v7);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"rateComputationBlock != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027F0E4();
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

- (void)_skipBackwardsWithInterval:(double)a3
{
  uint64_t v6 = kMRMediaRemoteOptionSkipInterval;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  unsigned int v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  18LL,  v5);
}

- (void)_skipForwardsWithInterval:(double)a3
{
  uint64_t v6 = kMRMediaRemoteOptionSkipInterval;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  unsigned int v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  17LL,  v5);
}

- (void)_beginSystemObservations
{
  if (self->_updateNowPlayingGestureSource)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_updateNowPlayingGestureSource == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027F1C0();
    }
    _bs_set_crash_log_message([v8 UTF8String]);
    __break(0);
  }

  else
  {
    objc_super v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_data_or,  0LL,  0LL,  &_dispatch_main_q);
    updateNowPlayingGestureSource = self->_updateNowPlayingGestureSource;
    self->_updateNowPlayingGestureSource = v3;

    objc_initWeak(&location, self);
    id v5 = self->_updateNowPlayingGestureSource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000E1C18;
    handler[3] = &unk_1003D0890;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    dispatch_activate((dispatch_object_t)self->_updateNowPlayingGestureSource);
    -[PBMediaRemoteObserver addObserver:forKeyPath:options:context:]( self->_mediaRemoteObserver,  "addObserver:forKeyPath:options:context:",  self,  @"playing",  0LL,  &off_1003D64B8);
    -[PBMediaRemoteObserver addObserver:forKeyPath:options:context:]( self->_mediaRemoteObserver,  "addObserver:forKeyPath:options:context:",  self,  @"playingMusic",  0LL,  &off_1003D64B8);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
    [v6 addObserver:self forKeyPath:@"appWithExclusivePlayPauseButtonAccess" options:0 context:&off_1003D64B8];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    [v7 addObserver:self];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (void)_stopSystemObservations
{
  updateNowPlayingGestureSource = self->_updateNowPlayingGestureSource;
  if (updateNowPlayingGestureSource)
  {
    dispatch_source_cancel((dispatch_source_t)updateNowPlayingGestureSource);
    -[PBMediaRemoteObserver removeObserver:forKeyPath:]( self->_mediaRemoteObserver,  "removeObserver:forKeyPath:",  self,  @"playing");
    -[PBMediaRemoteObserver removeObserver:forKeyPath:]( self->_mediaRemoteObserver,  "removeObserver:forKeyPath:",  self,  @"playingMusic");
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
    [v4 removeObserver:self forKeyPath:@"appWithExclusivePlayPauseButtonAccess"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    [v5 removeObserver:self];
  }

- (void)_setNeedsNowPlayingGestureStateUpdate
{
}

- (void)_updateNowPlayingGestureState
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appWithExclusivePlayPauseButtonAccess]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance"));
  unsigned __int8 v6 = [v5 isPresenting];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  id v8 = v7;
  if ((v6 & 1) != 0) {
    unsigned int v9 = [v7 playingMusic];
  }
  else {
    unsigned int v9 = [v7 playing];
  }
  unsigned int v10 = v9;

  id v11 = sub_1000E0D0C(self);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109632;
    HIDWORD(buf) = v4 != 0LL;
    __int16 v21 = 1024;
    unsigned int v22 = v10;
    __int16 v23 = 1024;
    int v24 = v10 & ~HIDWORD(buf);
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Update now playing gestures {isPlayPauseButtonReserved=%{BOOL}d, isMediaPausable=%{BOOL}d, shouldPause=%{BOOL}d}",  (uint8_t *)&buf,  0x14u);
  }

  pauseNowPlayingGestureHandle = self->_pauseNowPlayingGestureHandle;
  if ((v10 & ~(v4 != 0LL)) != 0)
  {
    if (!pauseNowPlayingGestureHandle)
    {
      objc_initWeak(&buf, self);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000E1F30;
      v18[3] = &unk_1003D1020;
      objc_copyWeak(&v19, &buf);
      id v15 = (PBSystemGestureHandle *)[v14 newHandleForSystemGesture:19 actionHandler:v18];
      id v17 = self->_pauseNowPlayingGestureHandle;
      p_pauseNowPlayingGestureHandle = &self->_pauseNowPlayingGestureHandle;
      *p_pauseNowPlayingGestureHandle = v15;

      objc_destroyWeak(&v19);
      objc_destroyWeak(&buf);
      pauseNowPlayingGestureHandle = *p_pauseNowPlayingGestureHandle;
    }

    -[PBSystemGestureHandle acquire](pauseNowPlayingGestureHandle, "acquire");
  }

  else
  {
    -[PBSystemGestureHandle relinquish](pauseNowPlayingGestureHandle, "relinquish");
  }

- (void)pictureInPictureManager:(id)a3 didUpdateState:(id)a4
{
}

- (id)commandFilter
{
  return self->_commandFilter;
}

- (void)setCommandFilter:(id)a3
{
}

- (id)unhandledCommandHandler
{
  return self->_unhandledCommandHandler;
}

- (void)setUnhandledCommandHandler:(id)a3
{
}

- (OS_dispatch_source)updateNowPlayingGestureSource
{
  return self->_updateNowPlayingGestureSource;
}

- (PBSystemGestureHandle)playGestureHandle
{
  return self->_playGestureHandle;
}

- (PBSystemGestureHandle)pauseGestureHandle
{
  return self->_pauseGestureHandle;
}

- (PBSystemGestureHandle)stopGestureHandle
{
  return self->_stopGestureHandle;
}

- (PBSystemGestureHandle)rewindTapGestureHandle
{
  return self->_rewindTapGestureHandle;
}

- (PBSystemGestureHandle)fastForwardTapGestureHandle
{
  return self->_fastForwardTapGestureHandle;
}

- (PBSystemGestureHandle)rewindLongPressGestureHandle
{
  return self->_rewindLongPressGestureHandle;
}

- (PBSystemGestureHandle)fastForwardLongPressGestureHandle
{
  return self->_fastForwardLongPressGestureHandle;
}

- (PBSystemGestureHandle)previousTrackGestureHandle
{
  return self->_previousTrackGestureHandle;
}

- (PBSystemGestureHandle)nextTrackGestureHandle
{
  return self->_nextTrackGestureHandle;
}

- (PBSystemGestureHandle)skipBackwardsGestureHandle
{
  return self->_skipBackwardsGestureHandle;
}

- (PBSystemGestureHandle)skipForwardsGestureHandle
{
  return self->_skipForwardsGestureHandle;
}

- (PBSystemGestureHandle)pauseNowPlayingGestureHandle
{
  return self->_pauseNowPlayingGestureHandle;
}

- (void).cxx_destruct
{
}

- (void)playWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/play",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Play (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  0LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)pauseWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/pause",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pause (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  1LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)stopWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/stop",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stop (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  3LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)previousTrackWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/previousTrack",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PreviousTrack (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  5LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)nextTrackWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/nextTrack",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NextTrack (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  4LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)decreasePlaybackRateWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/decreasePlaybackRate",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v6 = sub_1000E0D0C(self);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DecreasePlaybackRate (%{public}@)", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E293C;
  v8[3] = &unk_1003D6540;
  v8[4] = self;
  -[PBMediaRemoteCommandCenter _changePlaybackRateWithBlock:](self, "_changePlaybackRateWithBlock:", v8);
  os_activity_scope_leave(&state);
}

- (void)increasePlaybackRateWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/increasePlaybackRate",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v6 = sub_1000E0D0C(self);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IncreasePlaybackRate (%{public}@)", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E2C1C;
  v8[3] = &unk_1003D6540;
  v8[4] = self;
  -[PBMediaRemoteCommandCenter _changePlaybackRateWithBlock:](self, "_changePlaybackRateWithBlock:", v8);
  os_activity_scope_leave(&state);
}

- (void)skipBackwardsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/skipBackwards",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);

  double v6 = TVPPlaybackSkipBackwardDuration;
  id v7 = sub_1000E0D0C(self);
  os_activity_scope_state_s v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543618;
    id v11 = v4;
    __int16 v12 = 2048;
    double v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SkipBackwards (%{public}@) {interval=%.f}",  buf,  0x16u);
  }

  -[PBMediaRemoteCommandCenter _skipBackwardsWithInterval:](self, "_skipBackwardsWithInterval:", v6);
  os_activity_scope_leave(&v9);
}

- (void)skipForwardsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/skipForwards",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);

  double v6 = TVPPlaybackSkipForwardDuration;
  id v7 = sub_1000E0D0C(self);
  os_activity_scope_state_s v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543618;
    id v11 = v4;
    __int16 v12 = 2048;
    double v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SkipForwards (%{public}@) {interval=%.f}",  buf,  0x16u);
  }

  -[PBMediaRemoteCommandCenter _skipForwardsWithInterval:](self, "_skipForwardsWithInterval:", v6);
  os_activity_scope_leave(&v9);
}

- (void)beginSeekingBackwardsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/beginRewind",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BeginRewind (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  10LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)endSeekingBackwardsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/endRewind",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EndRewind (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  11LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)beginSeekingForwardsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/beginFastForward",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BeginFastForward (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  8LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)endSeekingForwardsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create( (void *)&_mh_execute_header,  "mediaRemote/command/endFastForward",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v8);

  id v6 = sub_1000E0D0C(self);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EndFastForward (%{public}@)", buf, 0xCu);
  }

  -[PBMediaRemoteCommandCenter _sendMediaRemoteCommand:withOptions:]( self,  "_sendMediaRemoteCommand:withOptions:",  9LL,  0LL);
  os_activity_scope_leave(&v8);
}

- (void)_enableSystemGestures
{
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000E3990;
  v27[3] = &unk_1003D6568;
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[PBSystemGestureManager sharedInstance]( &OBJC_CLASS___PBSystemGestureManager,  "sharedInstance"));
  id v28 = v3;
  id v4 = objc_retainBlock(v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000E39D4;
  v25[3] = &unk_1003D1020;
  objc_copyWeak(&v26, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_playGestureHandle,  8LL,  v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000E3A08;
  v23[3] = &unk_1003D1020;
  objc_copyWeak(&v24, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_pauseGestureHandle,  9LL,  v23);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000E3A3C;
  v21[3] = &unk_1003D1020;
  objc_copyWeak(&v22, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_stopGestureHandle,  10LL,  v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000E3A70;
  v19[3] = &unk_1003D1020;
  objc_copyWeak(&v20, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_rewindTapGestureHandle,  11LL,  v19);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000E3AC4;
  v17[3] = &unk_1003D1020;
  objc_copyWeak(&v18, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_fastForwardTapGestureHandle,  13LL,  v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E3B18;
  v15[3] = &unk_1003D1020;
  objc_copyWeak(&v16, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_rewindLongPressGestureHandle,  12LL,  v15);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E3B6C;
  v13[3] = &unk_1003D1020;
  objc_copyWeak(&v14, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_fastForwardLongPressGestureHandle,  14LL,  v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E3BC0;
  v11[3] = &unk_1003D1020;
  objc_copyWeak(&v12, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_previousTrackGestureHandle,  16LL,  v11);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E3BF4;
  v9[3] = &unk_1003D1020;
  objc_copyWeak(&v10, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_nextTrackGestureHandle,  15LL,  v9);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E3C28;
  v7[3] = &unk_1003D1020;
  objc_copyWeak(&v8, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_skipBackwardsGestureHandle,  18LL,  v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E3C5C;
  v5[3] = &unk_1003D1020;
  objc_copyWeak(&v6, location);
  ((void (*)(void *, PBSystemGestureHandle **, uint64_t, void *))v4[2])( v4,  &self->_skipForwardsGestureHandle,  17LL,  v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak(location);
}

@end