@interface BackgroundTasksIdleSM
- (BOOL)_canBeInOnStateAutomatically;
- (BOOL)isAutomaticEnabled;
- (BackgroundTasksIdleSM)init;
- (void)__notifyIdleTasksEnabledDidChange;
- (void)_enterOffStateAutomatically;
- (void)_enterOnStateAutomatically;
@end

@implementation BackgroundTasksIdleSM

- (BackgroundTasksIdleSM)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BackgroundTasksIdleSM;
  v2 = -[PBAttentionMonitorStateMachine init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
    [v3 disableBackgroundTasksOfType:1];

    -[BackgroundTasksIdleSM __notifyIdleTasksEnabledDidChange](v2, "__notifyIdleTasksEnabledDidChange");
  }

  return v2;
}

- (BOOL)isAutomaticEnabled
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___BackgroundTasksIdleSM;
  return -[PBAttentionMonitorStateMachine isAutomaticEnabled](&v4, "isAutomaticEnabled");
}

- (BOOL)_canBeInOnStateAutomatically
{
  unsigned int v3 = -[BackgroundTasksIdleSM isAutomaticEnabled](self, "isAutomaticEnabled");
  -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
  double v5 = v4;
  unsigned int v6 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v8 = [v7 idleTimerAllowed];

  unsigned int v9 = +[PBAttentionMonitor _isVideoPlaying](&OBJC_CLASS___PBAttentionMonitor, "_isVideoPlaying");
  int v10 = v3 ^ 1;
  if (v5 <= 0.0) {
    int v10 = 1;
  }
  int v11 = v10 | v6 | v9 | v8 ^ 1;
  if (v11 == 1)
  {
    unsigned int v12 = v9;
    id v13 = sub_100084338();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = "not autoEnabled, ";
      int v21 = 136318978;
      v22 = "-[BackgroundTasksIdleSM _canBeInOnStateAutomatically]";
      __int16 v23 = 2080;
      if (v3) {
        v15 = "";
      }
      v24 = v15;
      __int16 v25 = 2080;
      v16 = "not hasEnabledOffset, ";
      if (v5 > 0.0) {
        v16 = "";
      }
      v26 = v16;
      __int16 v27 = 2080;
      v17 = "not !focusedIdleDisabled, ";
      if (!v6) {
        v17 = "";
      }
      v28 = v17;
      __int16 v29 = 2080;
      v18 = "not settingsIdleTimerEnabled, ";
      if (v8) {
        v18 = "";
      }
      v30 = v18;
      __int16 v31 = 2080;
      v19 = "not !isVideoPlaying, ";
      if (!v12) {
        v19 = "";
      }
      v32 = v19;
      __int16 v33 = 2080;
      v34 = "";
      __int16 v35 = 2080;
      v36 = "";
      __int16 v37 = 2080;
      v38 = "";
      __int16 v39 = 2080;
      v40 = "";
      __int16 v41 = 2080;
      v42 = "";
      __int16 v43 = 2080;
      v44 = "";
      __int16 v45 = 2080;
      v46 = "";
      __int16 v47 = 2080;
      v48 = "";
      __int16 v49 = 2080;
      v50 = "";
      __int16 v51 = 2080;
      v52 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  (uint8_t *)&v21,  0xA2u);
    }
  }

  return v11 ^ 1;
}

- (void)_enterOnStateAutomatically
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
  [v3 enableBackgroundTasksOfType:1];

  -[BackgroundTasksIdleSM __notifyIdleTasksEnabledDidChange](self, "__notifyIdleTasksEnabledDidChange");
}

- (void)_enterOffStateAutomatically
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
  [v3 disableBackgroundTasksOfType:1];

  -[BackgroundTasksIdleSM __notifyIdleTasksEnabledDidChange](self, "__notifyIdleTasksEnabledDidChange");
}

- (void)__notifyIdleTasksEnabledDidChange
{
  if (qword_10046FF40 != -1) {
    dispatch_once(&qword_10046FF40, &stru_1003D0500);
  }
  uint64_t state64 = 0LL;
  if (!notify_get_state(dword_1004680F0, &state64))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
    unsigned int v3 = [v2 tasksEnabledOfType:1];

    if (state64 != v3)
    {
      id v4 = sub_100084338();
      double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        unsigned int v8 = "-[BackgroundTasksIdleSM __notifyIdleTasksEnabledDidChange]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "    %s: notifying", buf, 0xCu);
      }

      uint64_t state64 = v3;
      notify_set_state(dword_1004680F0, v3);
      notify_post((const char *)[PBSSystemIdleStateDidChangeNotification UTF8String]);
    }
  }

@end