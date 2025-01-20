@interface ScreenSaverSM
- (BOOL)_canBeInOnStateAutomatically;
- (ScreenSaverSM)init;
- (void)_enterOffStateAutomatically;
- (void)_enterOnStateAutomatically;
- (void)_enterOnStateForced;
- (void)_screenSaverDidDismiss;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5;
- (void)screenSaverManagerDidDismissScreenSaver:(id)a3;
- (void)screenSaverManagerDidPresentScreenSaver:(id)a3;
- (void)screenSaverManagerWillPresentScreenSaver:(id)a3;
@end

@implementation ScreenSaverSM

- (ScreenSaverSM)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ScreenSaverSM;
  v2 = -[PBAttentionMonitorStateMachine init](&v12, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
    [v3 addObserver:v2];

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
    unsigned int v5 = [v4 isContentFrozen:0];

    if (v5)
    {
      id v6 = sub_100084338();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ScreenSaverSM] Observing scene changes",  v11,  2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      [v8 addObserver:v2];
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
    [v9 addObserver:v2 forKeyPath:@"screenSaverActivationDelayInMinutes" options:5 context:&off_1003D0570];
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  v11 = v10;
  if (a6 == &off_1003D0570)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001240C;
    block[3] = &unk_1003CFF08;
    id v14 = v10;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___ScreenSaverSM;
    -[ScreenSaverSM observeValueForKeyPath:ofObject:change:context:]( &v12,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  v10,  a6);
  }
}

- (BOOL)_canBeInOnStateAutomatically
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v4 = [v3 idleTimerAllowed];

  id v5 = +[PBSSystemStatus systemThermalState](&OBJC_CLASS___PBSSystemStatus, "systemThermalState");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  unsigned int v7 = [v6 activityInhibited];

  unsigned int v8 = [(id)qword_10046FF38 isOn];
  unsigned int v9 = v8;
  if (v4) {
    BOOL v10 = v5 == 0LL;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10 || (v7 & 1) != 0 || v8)
  {
    id v12 = sub_100084338();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = "not settingsIdleTimerEnabled, ";
      int v37 = 136318978;
      v38 = "-[ScreenSaverSM _canBeInOnStateAutomatically]";
      __int16 v39 = 2080;
      if (v4) {
        id v14 = "";
      }
      v40 = v14;
      __int16 v41 = 2080;
      v15 = "not !thermalWarningInProgress, ";
      if (!v5) {
        v15 = "";
      }
      v42 = v15;
      __int16 v43 = 2080;
      v16 = "not !activityInhibited, ";
      if (!v7) {
        v16 = "";
      }
      v44 = v16;
      __int16 v45 = 2080;
      v17 = "not !isSleepOn, ";
      if (!v9) {
        v17 = "";
      }
      v46 = v17;
      __int16 v47 = 2080;
      v48 = "";
      __int16 v49 = 2080;
      v50 = "";
      __int16 v51 = 2080;
      v52 = "";
      __int16 v53 = 2080;
      v54 = "";
      __int16 v55 = 2080;
      v56 = "";
      __int16 v57 = 2080;
      v58 = "";
      __int16 v59 = 2080;
      v60 = "";
      __int16 v61 = 2080;
      v62 = "";
      __int16 v63 = 2080;
      v64 = "";
      __int16 v65 = 2080;
      v66 = "";
      __int16 v67 = 2080;
      v68 = "";
      goto LABEL_47;
    }
  }

  else
  {
    if (-[PBAttentionMonitorStateMachine isOn](self, "isOn")) {
      return 1;
    }
    -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
    double v19 = v18;
    unsigned int v20 = -[PBAttentionMonitorStateMachine isAutomaticEnabled](self, "isAutomaticEnabled");
    unsigned int v21 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
    unsigned int v22 = +[PBAttentionMonitor _hasOutstandingIdleAssertionsThatPreventScreenSaver]( &OBJC_CLASS___PBAttentionMonitor,  "_hasOutstandingIdleAssertionsThatPreventScreenSaver");
    unsigned int v23 = [(id)qword_10046FF10 isOn];
    unsigned int v24 = +[PBAttentionMonitor _isVideoPlaying](&OBJC_CLASS___PBAttentionMonitor, "_isVideoPlaying");
    id v25 = +[PBSSystemStatus systemPlayingState](&OBJC_CLASS___PBSSystemStatus, "systemPlayingState");
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
    unsigned int v27 = [v26 allowsScreenSaverOverMusic];

    if (v19 > 0.0 && v20 && (v21 & 1) == 0 && (v22 & 1) == 0 && (v24 & 1) == 0)
    {
      int v28 = v23 ^ 1;
      if (!v25) {
        int v28 = 1;
      }
      if (((v28 | v27) & 1) != 0) {
        return 1;
      }
    }

    id v29 = sub_100084338();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 136318978;
      v38 = "-[ScreenSaverSM _canBeInOnStateAutomatically]";
      __int16 v39 = 2080;
      v30 = "not hasEnabledOffset, ";
      if (v19 > 0.0) {
        v30 = "";
      }
      v40 = v30;
      __int16 v41 = 2080;
      v31 = "not autoEnabled, ";
      if (v20) {
        v31 = "";
      }
      v42 = v31;
      __int16 v43 = 2080;
      v32 = "not !focusedIdleDisabled, ";
      if (!v21) {
        v32 = "";
      }
      v44 = v32;
      __int16 v45 = 2080;
      v33 = "not !idleAssertionsExist, ";
      if (!v22) {
        v33 = "";
      }
      v46 = v33;
      __int16 v47 = 2080;
      v34 = "not !isVideoPlaying, ";
      if (!v24) {
        v34 = "";
      }
      v48 = v34;
      __int16 v49 = 2080;
      v35 = "not (!isNowPlayingOn || !isSomethingPlaying || saverOverMusic), ";
      if (v25) {
        int v36 = v27;
      }
      else {
        int v36 = 1;
      }
      if (v36) {
        v35 = "";
      }
      if (!v23) {
        v35 = "";
      }
      v50 = v35;
      __int16 v51 = 2080;
      v52 = "";
      __int16 v53 = 2080;
      v54 = "";
      __int16 v55 = 2080;
      v56 = "";
      __int16 v57 = 2080;
      v58 = "";
      __int16 v59 = 2080;
      v60 = "";
      __int16 v61 = 2080;
      v62 = "";
      __int16 v63 = 2080;
      v64 = "";
      __int16 v65 = 2080;
      v66 = "";
      __int16 v67 = 2080;
      v68 = "";
LABEL_47:
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  (uint8_t *)&v37,  0xA2u);
    }
  }

  return 0;
}

- (void)_enterOnStateAutomatically
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001295C;
  v4[3] = &unk_1003CFEE0;
  v4[4] = self;
  [v3 _activateScreenSaverForReason:0 forPosterBundleID:0 completion:v4];
}

- (void)_enterOffStateAutomatically
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  [v2 dismissScreenSaver];
}

- (void)_enterOnStateForced
{
}

- (void)screenSaverManagerWillPresentScreenSaver:(id)a3
{
}

- (void)screenSaverManagerDidPresentScreenSaver:(id)a3
{
}

- (void)screenSaverManagerDidDismissScreenSaver:(id)a3
{
}

- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 clientProcessBundleIdentifier]);
    unsigned int v12 = [v11 isEqual:@"com.apple.ist.DemoLoop-TV"];

    if (v12) {
      -[ScreenSaverSM _screenSaverDidDismiss](self, "_screenSaverDidDismiss");
    }
  }
}

- (void)_screenSaverDidDismiss
{
}

@end