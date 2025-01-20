@interface HiliteSM
- (BOOL)_canBeInOnStateAutomatically;
- (void)_enterOffStateAutomatically;
- (void)_establishVisualHiliteSetting:(BOOL)a3;
@end

@implementation HiliteSM

- (BOOL)_canBeInOnStateAutomatically
{
  unsigned int v3 = -[PBAttentionMonitorStateMachine isAutomaticEnabled](self, "isAutomaticEnabled");
  -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
  double v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v7 = [v6 hiliteModeDisabledForTesting];

  unsigned int v8 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v10 = [v9 idleTimerAllowed];

  unsigned int v11 = +[PBAttentionMonitor _hasOutstandingIdleAssertions]( &OBJC_CLASS___PBAttentionMonitor,  "_hasOutstandingIdleAssertions");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  unsigned int v13 = [v12 isShowingBaseUIOnly];

  unsigned int v14 = +[TVSBluetoothRemoteUtilities isAnyRemoteConnected]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "isAnyRemoteConnected");
  unsigned int v15 = +[PBAttentionMonitor _focusedSceneHasHiliteModeEnabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneHasHiliteModeEnabled");
  if (([(id)qword_10046FF10 isOn] & 1) != 0
    || ([(id)qword_10046FF18 isOn] & 1) != 0
    || ([(id)qword_10046FF20 isOn] & 1) != 0)
  {
    unsigned int v16 = 1;
  }

  else
  {
    unsigned int v16 = [(id)qword_10046FF38 isOn];
  }

  int v17 = v13 & ~((v5 <= 0.0) | ~v3 | v7 | v8 | ~v10 | v11) & v14 & v15 ^ 1 | v16;
  if (v17 == 1)
  {
    unsigned int v31 = v3;
    id v18 = sub_100084338();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318978;
      v20 = "not autoEnabled, ";
      v33 = "-[HiliteSM _canBeInOnStateAutomatically]";
      __int16 v34 = 2080;
      if (v31) {
        v20 = "";
      }
      v35 = v20;
      v21 = "not hasEnabledOffset, ";
      __int16 v36 = 2080;
      if (v5 > 0.0) {
        v21 = "";
      }
      v37 = v21;
      __int16 v38 = 2080;
      v22 = "not !hiliteDisabled, ";
      if (!v7) {
        v22 = "";
      }
      v39 = v22;
      __int16 v40 = 2080;
      v23 = "not !focusedIdleDisabled, ";
      if (!v8) {
        v23 = "";
      }
      v41 = v23;
      __int16 v42 = 2080;
      v24 = "not settingsIdleTimerEnabled, ";
      if (v10) {
        v24 = "";
      }
      v43 = v24;
      __int16 v44 = 2080;
      v25 = "not !idleAssertionsExist, ";
      if (!v11) {
        v25 = "";
      }
      v45 = v25;
      __int16 v46 = 2080;
      v26 = "not windowLayeringAtBaseState, ";
      if (v13) {
        v26 = "";
      }
      v47 = v26;
      __int16 v48 = 2080;
      v27 = "not aRemoteConnected, ";
      if (v14) {
        v27 = "";
      }
      v49 = v27;
      __int16 v50 = 2080;
      v28 = "not allowedByApp, ";
      if (v15) {
        v28 = "";
      }
      v51 = v28;
      __int16 v52 = 2080;
      v29 = "not !areOthersOn, ";
      if (!v16) {
        v29 = "";
      }
      v53 = v29;
      __int16 v54 = 2080;
      v55 = "";
      __int16 v56 = 2080;
      v57 = "";
      __int16 v58 = 2080;
      v59 = "";
      __int16 v60 = 2080;
      v61 = "";
      __int16 v62 = 2080;
      v63 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  buf,  0xA2u);
    }
  }

  return v17 ^ 1;
}

- (void)_enterOffStateAutomatically
{
}

- (void)_establishVisualHiliteSetting:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_100084338();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v26 = "-[HiliteSM _establishVisualHiliteSetting:]";
    *(_WORD *)&v26[8] = 1024;
    *(_DWORD *)&v26[10] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %d", buf, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100011590;
  v22[3] = &unk_1003D0520;
  BOOL v23 = v3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scenesPassingTest:v22]);

  id v8 = sub_100084338();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v26 = v3;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "changing IdleModeEnabled to %d for scenes %@",  buf,  0x12u);
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      unsigned int v14 = 0LL;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned int v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v14);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100011730;
        v16[3] = &unk_1003D0540;
        BOOL v17 = v3;
        [v15 updateSettingsWithBlock:v16];
        unsigned int v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v12);
  }
}

@end