@interface ADSystemMuteModeObserver
+ (id)sharedInstance;
- (ADSystemMuteModeObserver)init;
- (int)_ringerStateToken;
- (int64_t)muteMode;
- (void)_registerForRingerMuteStateNotifications;
- (void)_unregisterForRingerMuteStateNotifications;
- (void)_updateRingerMuteState:(int)a3;
- (void)dealloc;
@end

@implementation ADSystemMuteModeObserver

- (ADSystemMuteModeObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADSystemMuteModeObserver;
  v2 = -[ADSystemMuteModeObserver init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_muteMode = 0LL;
    v2->_ringerStateToken = -1;
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("ADSystemMuteModeObserver", v5);

    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    -[ADSystemMuteModeObserver _registerForRingerMuteStateNotifications](v3, "_registerForRingerMuteStateNotifications");
    v8 = (dispatch_queue_s *)v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100202940;
    block[3] = &unk_1004FD940;
    v11 = v3;
    dispatch_async(v8, block);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADSystemMuteModeObserver;
  -[ADSystemMuteModeObserver dealloc](&v3, "dealloc");
}

- (int64_t)muteMode
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10020292C;
  v5[3] = &unk_1004FCDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_updateRingerMuteState:(int)a3
{
  if (a3 != -1)
  {
    state64[3] = v3;
    state64[4] = v4;
    if (!notify_get_state(a3, state64))
    {
      int64_t muteMode = self->_muteMode;
      int64_t v7 = 1LL;
      if (state64[0]) {
        int64_t v7 = 2LL;
      }
      self->_int64_t muteMode = v7;
      if (muteMode != v7)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotification notificationWithName:object:]( &OBJC_CLASS___NSNotification,  "notificationWithName:object:",  @"ADMuteModeDidChangeNotification",  self));
        [v8 postNotification:v9];
      }
    }
  }

- (int)_ringerStateToken
{
  p_ringerStateToken = &self->_ringerStateToken;
  int result = self->_ringerStateToken;
  if (result == -1)
  {
    notify_register_check("com.apple.springboard.ringerstate", p_ringerStateToken);
    return *p_ringerStateToken;
  }

  return result;
}

- (void)_registerForRingerMuteStateNotifications
{
  if (self->_ringerStateToken == -1)
  {
    int out_token = -1;
    queue = (dispatch_queue_s *)self->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002028F0;
    handler[3] = &unk_1004F8E08;
    objc_copyWeak(&v6, &location);
    if (notify_register_dispatch("com.apple.springboard.ringerstate", &out_token, queue, handler))
    {
      uint64_t v4 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[ADSystemMuteModeObserver _registerForRingerMuteStateNotifications]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Failed to register for ringer switch state change",  buf,  0xCu);
      }
    }

    else
    {
      self->_ringerStateToken = out_token;
    }

    objc_destroyWeak(&v6);
  }

  objc_destroyWeak(&location);
}

- (void)_unregisterForRingerMuteStateNotifications
{
  int ringerStateToken = self->_ringerStateToken;
  if (ringerStateToken != -1)
  {
    notify_cancel(ringerStateToken);
    self->_int ringerStateToken = -1;
    self->_int64_t muteMode = 0LL;
  }

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_100578150 != -1) {
    dispatch_once(&qword_100578150, &stru_1004F6548);
  }
  return (id)qword_100578148;
}

@end