@interface CRDSM
- (BOOL)_canBeInOnStateAutomatically;
- (CRDSM)init;
- (void)_enterOnStateAutomatically;
- (void)_enterOnStateForced;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation CRDSM

- (CRDSM)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CRDSM;
  v2 = -[PBAttentionMonitorStateMachine init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
    [v3 addObserver:v2 forKeyPath:@"presenting" options:5 context:&off_1003D0568];
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D0568)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKey:", NSKeyValueChangeNewKey, a4));
    unsigned int v8 = [v7 BOOLValue];

    id v9 = sub_100084338();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      unsigned int v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "crdActive observer: %{public}d", buf, 8u);
    }

    if (v8) {
      -[PBAttentionMonitorStateMachine enterOnStateForced](self, "enterOnStateForced");
    }
    else {
      -[PBAttentionMonitorStateMachine enterOffStateForced](self, "enterOffStateForced");
    }
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___CRDSM;
    -[CRDSM observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (BOOL)_canBeInOnStateAutomatically
{
  if (-[PBAttentionMonitorStateMachine isOn](self, "isOn")) {
    return 1;
  }
  unsigned int v3 = -[PBAttentionMonitorStateMachine isAutomaticEnabled](self, "isAutomaticEnabled");
  -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
  double v5 = v4;
  unsigned int v6 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v8 = [v7 idleTimerAllowed];

  unsigned int v9 = +[PBAttentionMonitor _hasOutstandingIdleAssertionsThatPreventCRD]( &OBJC_CLASS___PBAttentionMonitor,  "_hasOutstandingIdleAssertionsThatPreventCRD");
  unsigned int v10 = [(id)qword_10046FF38 isOn];
  unsigned int v11 = v10;
  if (v3)
  {
    if (v5 > 0.0 && (v6 & 1) == 0 && v8 && (v9 & 1) == 0 && !v10) {
      return 1;
    }
  }

  id v13 = sub_100084338();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = "not autoEnabled, ";
    int v21 = 136318978;
    v22 = "-[CRDSM _canBeInOnStateAutomatically]";
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
    v19 = "not !idleAssertionsExist, ";
    if (!v9) {
      v19 = "";
    }
    v32 = v19;
    __int16 v33 = 2080;
    v20 = "not !isSleepOn, ";
    if (!v11) {
      v20 = "";
    }
    v34 = v20;
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

  return 0;
}

- (void)_enterOnStateAutomatically
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  [v2 startCRDWithReason:0];

  [(id)qword_10046FF00 enterOffStateAutomatically];
  [(id)qword_10046FF08 enterOffStateAutomatically];
}

- (void)_enterOnStateForced
{
}

@end