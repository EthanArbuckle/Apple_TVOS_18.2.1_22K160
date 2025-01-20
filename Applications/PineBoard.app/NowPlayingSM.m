@interface NowPlayingSM
- (BOOL)_canBeInOnStateAutomatically;
- (NowPlayingSM)init;
- (void)_enterOnStateAutomatically;
- (void)_enterOnStateForced;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NowPlayingSM

- (NowPlayingSM)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NowPlayingSM;
  v2 = -[PBAttentionMonitorStateMachine init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
    [v3 addObserver:v2 forKeyPath:@"presenting" options:5 context:&off_1003D0560];
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D0560)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKey:", NSKeyValueChangeNewKey, a4));
    unsigned int v8 = [v7 BOOLValue];

    id v9 = sub_100084338();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      unsigned int v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "isPresenting observer: %{public}d", buf, 8u);
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
    v11.super_class = (Class)&OBJC_CLASS___NowPlayingSM;
    -[NowPlayingSM observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (BOOL)_canBeInOnStateAutomatically
{
  if (-[PBAttentionMonitorStateMachine isOn](self, "isOn")) {
    return 1;
  }
  unsigned int v44 = -[PBAttentionMonitorStateMachine isAutomaticEnabled](self, "isAutomaticEnabled");
  -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
  double v5 = v4;
  unsigned int v6 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v8 = [v7 idleTimerAllowed];

  unsigned int v47 = +[PBAttentionMonitor _hasOutstandingIdleAssertionsThatPreventNowPlaying]( &OBJC_CLASS___PBAttentionMonitor,  "_hasOutstandingIdleAssertionsThatPreventNowPlaying");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v46 = [v9 systemNowPlayingAllowed];

  id v10 = +[PBSSystemStatus systemPlayingState](&OBJC_CLASS___PBSSystemStatus, "systemPlayingState");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  unsigned int v12 = [v11 nowPlayingMediaTypeAudioOnly];

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  unsigned int v14 = [v13 isMusicAppPlaying];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  int v45 = [v15 nowPlayingProcessPID];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  unsigned int v43 = [v16 isShowingBaseUIOnly];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
  unsigned int v18 = [v17 isPresenting];

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned int v42 = [v19 isPresenting];

  unsigned int v20 = [(id)qword_10046FF38 isOn];
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
  unsigned int v22 = [v21 allowsScreenSaverOverMusic];

  unsigned int v23 = [(id)qword_10046FF20 isOn];
  unsigned int v24 = v23;
  int v25 = v10 == (id)2 ? 1 : v18;
  int v26 = v12 | v14;
  if (v44)
  {
    if (v5 > 0.0
      && !v6
      && v8
      && !v47
      && v46
      && v25
      && v26
      && v45 >= 1
      && (((v43 | v18) ^ 1 | v42 | v20) & 1) == 0
      && (v23 & v22) == 0)
    {
      return 1;
    }
  }

  id v27 = sub_100084338();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136318978;
    v29 = "not autoEnabled, ";
    if (v44) {
      v29 = "";
    }
    v49 = "-[NowPlayingSM _canBeInOnStateAutomatically]";
    __int16 v50 = 2080;
    v51 = v29;
    if (v5 > 0.0) {
      v30 = "";
    }
    else {
      v30 = "not hasEnabledOffset, ";
    }
    __int16 v52 = 2080;
    v53 = v30;
    v31 = "not !focusedIdleDisabled, ";
    if (!v6) {
      v31 = "";
    }
    __int16 v54 = 2080;
    v55 = v31;
    v32 = "not settingsIdleTimerEnabled, ";
    if (v8) {
      v32 = "";
    }
    __int16 v56 = 2080;
    v57 = v32;
    v33 = "not !idleAssertionsExist, ";
    if (!v47) {
      v33 = "";
    }
    __int16 v58 = 2080;
    v59 = v33;
    v34 = "not allowed, ";
    if (v46) {
      v34 = "";
    }
    __int16 v60 = 2080;
    v61 = v34;
    v35 = "not (isMusicPlaying || nowPlayingActive), ";
    if (v25) {
      v35 = "";
    }
    __int16 v62 = 2080;
    v63 = v35;
    v36 = "not (audioOnlyMediaType || musicAppPlaying), ";
    if (v26) {
      v36 = "";
    }
    __int16 v64 = 2080;
    v65 = v36;
    v37 = "not knownNowPlayingProcess, ";
    if (v45 > 0) {
      v37 = "";
    }
    __int16 v66 = 2080;
    v67 = v37;
    v38 = "not (windowLayeringAtBaseState || nowPlayingActive), ";
    if (v43 | v18) {
      v38 = "";
    }
    __int16 v68 = 2080;
    v69 = v38;
    v39 = "not !CRDActive, ";
    if (!v42) {
      v39 = "";
    }
    __int16 v70 = 2080;
    v71 = v39;
    v40 = "not !isSleepOn, ";
    if (!v20) {
      v40 = "";
    }
    __int16 v72 = 2080;
    v73 = v40;
    v41 = "not (!isScreenSaverOn || !saverOverMusic), ";
    __int16 v74 = 2080;
    if ((v24 & v22) == 0) {
      v41 = "";
    }
    v75 = v41;
    __int16 v76 = 2080;
    v77 = "";
    __int16 v78 = 2080;
    v79 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  buf,  0xA2u);
  }

  return 0;
}

- (void)_enterOnStateAutomatically
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
  [v2 activateNowPlayingForReason:1 options:&__NSDictionary0__struct];

  [(id)qword_10046FF00 enterOffStateAutomatically];
  [(id)qword_10046FF08 enterOffStateAutomatically];
  [(id)qword_10046FF20 enterOffStateAutomatically];
}

- (void)_enterOnStateForced
{
}

@end