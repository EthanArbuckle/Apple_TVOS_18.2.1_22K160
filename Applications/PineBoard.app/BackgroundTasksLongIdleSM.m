@interface BackgroundTasksLongIdleSM
- (BOOL)_canBeInOnStateAutomatically;
@end

@implementation BackgroundTasksLongIdleSM

- (BOOL)_canBeInOnStateAutomatically
{
  unsigned int v3 = -[PBAttentionMonitorStateMachine isAutomaticEnabled](self, "isAutomaticEnabled");
  -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
  double v5 = v4;
  unsigned int v6 = [(id)qword_10046FEF0 isOn];
  if (v5 > 0.0) {
    unsigned __int8 v7 = v3;
  }
  else {
    unsigned __int8 v7 = 0;
  }
  char v8 = v7 & v6;
  if ((v7 & v6 & 1) == 0)
  {
    unsigned int v9 = v6;
    id v10 = sub_100084338();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = "not autoEnabled, ";
      int v16 = 136318978;
      v17 = "-[BackgroundTasksLongIdleSM _canBeInOnStateAutomatically]";
      __int16 v18 = 2080;
      if (v3) {
        v12 = "";
      }
      v19 = v12;
      __int16 v20 = 2080;
      v13 = "not hasEnabledOffset, ";
      if (v5 > 0.0) {
        v13 = "";
      }
      v21 = v13;
      __int16 v22 = 2080;
      v14 = "not isBackgroundTasksIdleOn, ";
      if (v9) {
        v14 = "";
      }
      v23 = v14;
      __int16 v24 = 2080;
      v25 = "";
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
      __int16 v46 = 2080;
      v47 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  (uint8_t *)&v16,  0xA2u);
    }
  }

  return v8;
}

@end