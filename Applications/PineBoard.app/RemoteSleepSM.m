@interface RemoteSleepSM
- (BOOL)_canBeInOnStateAutomatically;
- (BOOL)isAutomaticEnabled;
- (RemoteSleepSM)init;
- (void)_enterOffStateAutomatically;
- (void)_enterOnStateAutomatically;
@end

@implementation RemoteSleepSM

- (RemoteSleepSM)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RemoteSleepSM;
  v2 = -[PBAttentionMonitorStateMachine init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v4 = TVSBluetoothRemoteDidConnectNotification;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100012C90;
    v9[3] = &unk_1003D0580;
    v5 = v2;
    v10 = v5;
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 addObserverForName:v4 object:0 queue:0 usingBlock:v9]);
    v7 = (void *)qword_10046FF48;
    qword_10046FF48 = v6;

    -[RemoteSleepSM _enterOffStateAutomatically](v5, "_enterOffStateAutomatically");
  }

  return v2;
}

- (BOOL)isAutomaticEnabled
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RemoteSleepSM;
  return -[PBAttentionMonitorStateMachine isAutomaticEnabled](&v4, "isAutomaticEnabled");
}

- (BOOL)_canBeInOnStateAutomatically
{
  unsigned int v3 = -[RemoteSleepSM isAutomaticEnabled](self, "isAutomaticEnabled");
  -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
  double v5 = v4;
  unsigned int v6 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
  unsigned int v7 = +[PBAttentionMonitor _isVideoPlaying](&OBJC_CLASS___PBAttentionMonitor, "_isVideoPlaying");
  if (v5 <= 0.0) {
    int v8 = 1;
  }
  else {
    int v8 = v3 ^ 1;
  }
  int v9 = v8 | v6 | v7;
  if (v9 == 1)
  {
    unsigned int v10 = v7;
    id v11 = sub_100084338();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136318978;
      v13 = "not autoEnabled, ";
      v19 = "-[RemoteSleepSM _canBeInOnStateAutomatically]";
      __int16 v20 = 2080;
      if (v3) {
        v13 = "";
      }
      v21 = v13;
      __int16 v22 = 2080;
      v14 = "not hasEnabledOffset, ";
      if (v5 > 0.0) {
        v14 = "";
      }
      v23 = v14;
      __int16 v24 = 2080;
      v15 = "not !focusedIdleDisabled, ";
      if (!v6) {
        v15 = "";
      }
      v25 = v15;
      __int16 v26 = 2080;
      v16 = "not !isVideoPlaying, ";
      if (!v10) {
        v16 = "";
      }
      v27 = v16;
      __int16 v28 = 2080;
      v29 = "";
      __int16 v30 = 2080;
      v31 = "";
      __int16 v32 = 2080;
      v33 = "";
      __int16 v34 = 2080;
      v35 = "";
      __int16 v36 = 2080;
      v37 = "";
      __int16 v38 = 2080;
      v39 = "";
      __int16 v40 = 2080;
      v41 = "";
      __int16 v42 = 2080;
      v43 = "";
      __int16 v44 = 2080;
      v45 = "";
      __int16 v46 = 2080;
      v47 = "";
      __int16 v48 = 2080;
      v49 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  (uint8_t *)&v18,  0xA2u);
    }
  }

  return v9 ^ 1;
}

- (void)_enterOnStateAutomatically
{
  if (self->_timer)
  {
    id v3 = sub_100084338();
    double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      unsigned int v7 = "-[RemoteSleepSM _enterOnStateAutomatically]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: cancelling keep-alive timer",  (uint8_t *)&v6,  0xCu);
    }

    dispatch_source_cancel((dispatch_source_t)self->_timer);
    timer = self->_timer;
    self->_timer = 0LL;

    self->_interval = 0.0;
  }

  +[TVSBluetoothRemoteUtilities setConnectionKeepAliveTimeInSeconds:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "setConnectionKeepAliveTimeInSeconds:",  0.0);
}

- (void)_enterOffStateAutomatically
{
  if (!self->_timer)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v3 bluetoothRemoteKeepAliveTimeInterval];
    double v5 = v4;

    double v6 = fmin(fmax(v5, 60.0), 86400.0);
    id v7 = sub_100084338();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RemoteSleepSM _enterOffStateAutomatically]";
      __int16 v16 = 2048;
      double v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: keep-alive startup, scheduling initial for 5 seconds, periodic for %f seconds",  buf,  0x16u);
    }

    int v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer(v9, v10, (unint64_t)(v6 * 1000000000.0), 0x12A05F200uLL);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100013254;
    v13[3] = &unk_1003D05A8;
    v13[4] = self;
    *(double *)&v13[5] = v6;
    dispatch_source_set_event_handler(v9, v13);
    dispatch_activate(v9);
    timer = self->_timer;
    self->_timer = (OS_dispatch_source *)v9;
    v12 = v9;
  }

- (void).cxx_destruct
{
}

@end