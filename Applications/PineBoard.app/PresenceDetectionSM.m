@interface PresenceDetectionSM
- (BOOL)_canBeInOnStateAutomatically;
- (void)__enableProximitySensing:(BOOL)a3;
- (void)_enterOffStateAutomatically;
- (void)_enterOnStateAutomatically;
@end

@implementation PresenceDetectionSM

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
      v33 = "-[PresenceDetectionSM _canBeInOnStateAutomatically]";
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

- (void)_enterOnStateAutomatically
{
  int v3 = _os_feature_enabled_impl("PineBoard", "Deceleration");
  id v4 = sub_100084338();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Skipping presence detection: feature flag enabled.",  buf,  2u);
    }
  }

  else
  {
    if (v6)
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Enabling presence detection: feature flag disabled.",  v7,  2u);
    }

    -[PresenceDetectionSM __enableProximitySensing:](self, "__enableProximitySensing:", 1LL);
    +[PBSSystemStatus _setPresenceDetectionActive:](&OBJC_CLASS___PBSSystemStatus, "_setPresenceDetectionActive:", 1LL);
  }

- (void)_enterOffStateAutomatically
{
}

- (void)__enableProximitySensing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_100084338();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    unsigned int v7 = "-[PresenceDetectionSM __enableProximitySensing:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "    %s: %d", (uint8_t *)&v6, 0x12u);
  }

  +[TVSBluetoothRemoteUtilities setPresenceDetectionEnabled:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "setPresenceDetectionEnabled:",  v3);
}

@end