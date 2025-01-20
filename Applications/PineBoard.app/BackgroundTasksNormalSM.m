@interface BackgroundTasksNormalSM
- (BOOL)_canBeInOnStateAutomatically;
- (BackgroundTasksNormalSM)init;
- (void)_enterOffStateAutomatically;
- (void)_enterOnStateAutomatically;
@end

@implementation BackgroundTasksNormalSM

- (BackgroundTasksNormalSM)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BackgroundTasksNormalSM;
  v2 = -[PBAttentionMonitorStateMachine init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[PBAttentionMonitorStateMachine automaticEnable](v2, "automaticEnable");
    -[PBAttentionMonitorStateMachine adjustStateAutomatically](v3, "adjustStateAutomatically");
  }

  return v3;
}

- (BOOL)_canBeInOnStateAutomatically
{
  unsigned int v2 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v4 = [v3 idleTimerAllowed];

  unsigned int v5 = +[PBAttentionMonitor _isVideoPlaying](&OBJC_CLASS___PBAttentionMonitor, "_isVideoPlaying");
  int v6 = v2 | v5 | v4 ^ 1;
  if (v6 == 1)
  {
    unsigned int v7 = v5;
    id v8 = sub_100084338();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136318978;
      v15 = "-[BackgroundTasksNormalSM _canBeInOnStateAutomatically]";
      __int16 v16 = 2080;
      v17 = "";
      v10 = "not !focusedIdleDisabled, ";
      if (!v2) {
        v10 = "";
      }
      __int16 v18 = 2080;
      v19 = "";
      v11 = "not settingsIdleTimerEnabled, ";
      if (v4) {
        v11 = "";
      }
      v21 = v10;
      v12 = "not !isVideoPlaying, ";
      __int16 v20 = 2080;
      if (!v7) {
        v12 = "";
      }
      __int16 v22 = 2080;
      v23 = v11;
      __int16 v24 = 2080;
      v25 = v12;
      __int16 v26 = 2080;
      v27 = "";
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
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  (uint8_t *)&v14,  0xA2u);
    }
  }

  return v6 ^ 1;
}

- (void)_enterOnStateAutomatically
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
  [v2 enableBackgroundTasksOfType:0];
}

- (void)_enterOffStateAutomatically
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
  [v2 disableBackgroundTasksOfType:0];
}

@end