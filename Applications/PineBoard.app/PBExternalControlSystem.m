@interface PBExternalControlSystem
+ (BOOL)isAppleIRRemotePaired;
+ (BOOL)showATVVolumeUIForExternalAudioSource;
+ (BOOL)volumeControlNeedsConfiguring;
+ (id)_sharedInstance;
+ (id)sharedSystem;
+ (id)volumeController;
+ (void)pairAppleIRRemote;
+ (void)performVolumeDownWithGestureRecognizerState:(int64_t)a3;
+ (void)performVolumeUpWithGestureRecognizerState:(int64_t)a3;
+ (void)sendActionOrShowUnconfiguredAlertForAction:(int64_t)a3;
+ (void)unpairAppleIRRemote;
- ($95A7711724258D2DBCF2C7E5A2AF8B2C)externalControlSystemAlternateRouteCurrentVolumeState:(id)a3 behavior:(int64_t)a4;
- (BOOL)_displayHasNonZeroSize;
- (BOOL)_shouldSuppressWakeForRemoteControlButton:(int64_t)a3;
- (NSNumber)lastKnownCECVolumeLevel;
- (PBExternalControlSystem)init;
- (PBSExternalControlSystem)externalControlSystem;
- (PBSystemGestureHandle)switchToATVGesture;
- (PBSystemGestureHandle)volumeDecrementGesture;
- (PBSystemGestureHandle)volumeIncrementGesture;
- (PBSystemGestureHandle)volumeMuteButtonGesture;
- (PBVolumeController)volumeController;
- (TVSStateMachine)volumeBehaviorStateMachine;
- (id)DisplayModeBinding;
- (void)_handleDisplayModeDidChange;
- (void)_initializeVolumeBehaviorStateMachine;
- (void)_initializeVolumeButtonGestures;
- (void)_listenForNowPlayingAppNotifications;
- (void)_listenForVolumeButtonOverrideUpdates;
- (void)_pauseOnResignedActiveSource;
- (void)_performToggleMuteOrShowUnconfiguredAlert;
- (void)_performVolumeDownWithGestureRecognizerState:(int64_t)a3;
- (void)_performVolumeUpWithGestureRecognizerState:(int64_t)a3;
- (void)_sendAction:(int64_t)a3 orShowUnconfiguredAlert:(BOOL)a4;
- (void)_sendActionOrShowUnconfiguredAlertForAction:(int64_t)a3;
- (void)_showUnconfiguredAlert;
- (void)dealloc;
- (void)externalControlSystem:(id)a3 didHandleRemoteControlButtonPressed:(int64_t)a4;
- (void)externalControlSystem:(id)a3 didHandleRemoteControlButtonReleased:(int64_t)a4;
- (void)externalControlSystem:(id)a3 didReceiveAudioStatusVolumeLevel:(unint64_t)a4 muted:(BOOL)a5;
- (void)externalControlSystem:(id)a3 didReceiveRequest:(int64_t)a4;
- (void)externalControlSystemDidRequestAlternateRouteVolumeDown:(id)a3 behavior:(int64_t)a4;
- (void)externalControlSystemDidRequestAlternateRouteVolumeMute:(id)a3 behavior:(int64_t)a4 muted:(BOOL)a5;
- (void)externalControlSystemDidRequestAlternateRouteVolumeUp:(id)a3 behavior:(int64_t)a4;
- (void)externalControlSystemDidResignActiveSource:(id)a3;
- (void)externalControlSystemDidUpdatePolicy:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setExternalControlSystem:(id)a3;
- (void)setLastKnownCECVolumeLevel:(id)a3;
- (void)setVolumeBehaviorStateMachine:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)tvs_bindDisplayModeBindingToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5;
- (void)volumeSupportedChanged:(id)a3 forOutputContext:(unint64_t)a4;
@end

@implementation PBExternalControlSystem

+ (id)sharedSystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem _sharedInstance](&OBJC_CLASS___PBExternalControlSystem, "_sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 externalControlSystem]);

  return v3;
}

+ (BOOL)volumeControlNeedsConfiguring
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
  unsigned int v3 = [v2 isConfiguredForUse];
  unsigned int v4 = [v2 isEnabled];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
  unsigned int v6 = [v5 isActiveSource];

  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7
    || (v3 & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( TVSPreferences,  "sharedPineBoardServicesPreferences")),  unsigned __int8 v9 = objc_msgSend(v8, "pbs_shouldShowUnconfiguredVolumeButtonsAlert"),  v8,  (v9 & 1) == 0))
  {
    id v13 = sub_100082DE4();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
      v16[0] = 67109888;
      v16[1] = objc_msgSend(v14, "pbs_shouldShowUnconfiguredVolumeButtonsAlert");
      __int16 v17 = 1024;
      unsigned int v18 = v3;
      __int16 v19 = 1024;
      unsigned int v20 = v4;
      __int16 v21 = 2048;
      id v22 = [v2 transport];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Volume does not need configuration (pref:%d configured:%d enabled:%d transport:%ld).",  (uint8_t *)v16,  0x1Eu);
    }

    BOOL v12 = 0;
  }

  else
  {
    id v10 = sub_100082DE4();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Volume needs configuration.",  (uint8_t *)v16,  2u);
    }

    BOOL v12 = 1;
  }

  return v12;
}

+ (void)pairAppleIRRemote
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
  [v2 pairAppleIRRemoteWithCompletion:&stru_1003DC318];
}

+ (void)unpairAppleIRRemote
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
  [v2 unpairAppleIRRemoteWithCompletion:&stru_1003DC338];
}

+ (BOOL)isAppleIRRemotePaired
{
  id v2 = [(id)objc_opt_class(a1) sharedSystem];
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 isAppleIRRemotePaired];

  return v4;
}

+ (id)volumeController
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem _sharedInstance](&OBJC_CLASS___PBExternalControlSystem, "_sharedInstance"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 volumeController]);

  return v3;
}

+ (void)sendActionOrShowUnconfiguredAlertForAction:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem _sharedInstance](&OBJC_CLASS___PBExternalControlSystem, "_sharedInstance"));
  [v4 _sendActionOrShowUnconfiguredAlertForAction:a3];
}

+ (void)performVolumeUpWithGestureRecognizerState:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem _sharedInstance](&OBJC_CLASS___PBExternalControlSystem, "_sharedInstance"));
  [v4 _performVolumeUpWithGestureRecognizerState:a3];
}

+ (void)performVolumeDownWithGestureRecognizerState:(int64_t)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem _sharedInstance](&OBJC_CLASS___PBExternalControlSystem, "_sharedInstance"));
  [v4 _performVolumeDownWithGestureRecognizerState:a3];
}

+ (BOOL)showATVVolumeUIForExternalAudioSource
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  3LL));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a1 volumeController]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  unint64_t v6 = (unint64_t)[v5 eARCStatus];

  unsigned __int8 v7 = [v4 odeonActiveForOutputContext:1];
  unsigned __int8 v8 = [v4 bluetoothActiveForOutputContext:1];
  unsigned __int8 v9 = [v4 airPlayActiveForOutputContext:1];
  BOOL v10 = 0;
  if ((v7 & 1) == 0 && (v6 & 0xFFFFFFFFFFFFFFFELL) != 2 && (v8 & 1) == 0 && (v9 & 1) == 0)
  {
    else {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (id)DisplayModeBinding
{
  if (qword_1004713C0 != -1) {
    dispatch_once(&qword_1004713C0, &stru_1003DC358);
  }
  return (id)qword_1004713C8;
}

- (void)tvs_bindDisplayModeBindingToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem tvs_bindingAdaptor](self, "tvs_bindingAdaptor"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem DisplayModeBinding](self, "DisplayModeBinding"));
  [v11 establishBinding:v12 toObject:v10 withKeyPath:v9 bindingOptions:v8 updateHandler:&stru_1003DC398];
}

- (PBExternalControlSystem)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBExternalControlSystem;
  id v2 = -[PBExternalControlSystem init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[PBSExternalControlSystem sharedSystem](&OBJC_CLASS___PBSExternalControlSystem, "sharedSystem"));
    externalControlSystem = v2->_externalControlSystem;
    v2->_externalControlSystem = (PBSExternalControlSystem *)v3;

    -[PBSExternalControlSystem setDelegate:](v2->_externalControlSystem, "setDelegate:", v2);
    v5 = -[PBVolumeController initWithDelegate:](objc_alloc(&OBJC_CLASS___PBVolumeController), "initWithDelegate:", v2);
    volumeController = v2->_volumeController;
    v2->_volumeController = v5;

    -[PBExternalControlSystem _initializeVolumeButtonGestures](v2, "_initializeVolumeButtonGestures");
    -[PBExternalControlSystem _initializeVolumeBehaviorStateMachine](v2, "_initializeVolumeBehaviorStateMachine");
    -[PBExternalControlSystem _listenForVolumeButtonOverrideUpdates](v2, "_listenForVolumeButtonOverrideUpdates");
    -[PBExternalControlSystem _listenForNowPlayingAppNotifications](v2, "_listenForNowPlayingAppNotifications");
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem volumeBehaviorStateMachine](v2, "volumeBehaviorStateMachine"));
    [v7 postEvent:@"Prepare"];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001DC144;
    block[3] = &unk_1003CFF08;
    id v10 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBExternalControlSystem;
  -[PBExternalControlSystem dealloc](&v3, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10046D900 == a6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 appWithVolumeButtonAccess]);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem _sharedInstance](&OBJC_CLASS___PBExternalControlSystem, "_sharedInstance"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 volumeBehaviorStateMachine]);
    unsigned int v18 = v17;
    if (v16) {
      __int16 v19 = @"Custom Control Enabled";
    }
    else {
      __int16 v19 = @"Custom Control Disabled";
    }
    [v17 postEvent:v19];

    goto LABEL_12;
  }

  if (off_10046D908 == a6 || off_10046D910 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem volumeBehaviorStateMachine](self, "volumeBehaviorStateMachine"));
    [v14 postEvent:@"Now Playing App is Foreground Changed"];
LABEL_12:

    goto LABEL_13;
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBExternalControlSystem;
  -[PBExternalControlSystem observeValueForKeyPath:ofObject:change:context:]( &v20,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
LABEL_13:
}

- (void)externalControlSystem:(id)a3 didReceiveRequest:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 14LL:
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
      id v11 = [v10 powerState];

      if (v11 != (id)3)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
        id v23 = [v22 powerState];

        if (v23 == (id)1)
        {
          id v24 = sub_100082CF4();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v29 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Become active source requested: already awake.",  v29,  2u);
          }

          [v5 sendAction:20 withCompletion:0];
        }

        break;
      }

      id v12 = sub_100082CF4();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Become active source requested: waking device.",  buf,  2u);
      }

      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);
      [v7 wakeRequestedByClient:v15 forReason:PBSWakeReasonCEC];
LABEL_26:

      goto LABEL_27;
    case 13LL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
      id v17 = [v16 powerState];

      if (v17 != (id)1)
      {
        id v26 = sub_100082CF4();
        unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          id v8 = "Power standby requested: already asleep.";
          id v9 = v33;
          goto LABEL_21;
        }

        goto LABEL_27;
      }

      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
      if ([v18 playing])
      {
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
        unsigned __int8 v20 = [v19 nowPlayingMediaTypeAudioOnly];

        if ((v20 & 1) != 0)
        {
          id v21 = sub_100082CF4();
          unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v31 = 0;
            id v8 = "Power standby requested: not sleeping due to ongoing audio playback.";
            id v9 = (uint8_t *)&v31;
            goto LABEL_21;
          }

- (void)externalControlSystemDidUpdatePolicy:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem tvs_bindingAdaptor](self, "tvs_bindingAdaptor", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForBinding:qword_1004713C8]);

  id v6 = sub_100082C7C();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Policy updated. Current display mode:%{public}@",  buf,  0xCu);
  }

  id v8 = [(id)objc_opt_class(self) showATVVolumeUIForExternalAudioSource];
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
  if ([v9 transport] != (id)1
    && !-[PBExternalControlSystem _displayHasNonZeroSize](self, "_displayHasNonZeroSize"))
  {
    id v17 = sub_100082C7C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "PROG: Not changing remote programming or volume prefs: display is blank.",  buf,  2u);
    }

    goto LABEL_14;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  unsigned __int8 v11 = [v10 isListening];

  if ((v11 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem externalControlSystem](self, "externalControlSystem"));
    [v15 programAppleRemoteWithCurrentIRVolumeButtonConfigurationWithCompletion:&stru_1003DC3B8];

    goto LABEL_11;
  }

  id v12 = sub_100082C7C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PROG: Not programming remote programming: Siri is listening.",  buf,  2u);
  }

  dispatch_time_t v14 = dispatch_time(0LL, 3000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DC9AC;
  block[3] = &unk_1003CFF08;
  void block[4] = self;
  dispatch_after(v14, &_dispatch_main_q, block);
  if ((v8 & 1) == 0)
  {
LABEL_11:
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    -[os_log_s didBecomeIneligibleForIndeterminateState](v16, "didBecomeIneligibleForIndeterminateState");
LABEL_14:
  }

- (void)externalControlSystemDidResignActiveSource:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlSettings sharedInstance]( &OBJC_CLASS___PBSExternalControlSettings,  "sharedInstance",  a3));
  unsigned int v5 = [v4 shouldPauseMediaOnResignActiveSource];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  unint64_t v7 = (unint64_t)[v6 eARCStatus];

  unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
  id v9 = sub_100082C7C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
    v13[0] = 67109632;
    v13[1] = v8 == 2;
    __int16 v14 = 1024;
    unsigned int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = [v11 playing];
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Active source:lost Requires pause:%{BOOL}d Should pause:%{BOOL}d Media playing:%{BOOL}d",  (uint8_t *)v13,  0x14u);
  }

  if (v8 == 2) {
    unsigned int v12 = v5;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v12 == 1) {
    -[PBExternalControlSystem _pauseOnResignedActiveSource](self, "_pauseOnResignedActiveSource");
  }
}

- (void)externalControlSystem:(id)a3 didHandleRemoteControlButtonPressed:(int64_t)a4
{
  if (-[PBExternalControlSystem _shouldSuppressWakeForRemoteControlButton:]( self,  "_shouldSuppressWakeForRemoteControlButton:",  a4))
  {
    +[PBAttentionMonitor _temporarilySuppressWakeForHIDEvents]( &OBJC_CLASS___PBAttentionMonitor,  "_temporarilySuppressWakeForHIDEvents");
  }

  else
  {
    id v5 = sub_100082D6C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not suppressing wake resulting from remote button %ld press.",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)externalControlSystem:(id)a3 didHandleRemoteControlButtonReleased:(int64_t)a4
{
  if (-[PBExternalControlSystem _shouldSuppressWakeForRemoteControlButton:]( self,  "_shouldSuppressWakeForRemoteControlButton:",  a4))
  {
    +[PBAttentionMonitor _temporarilySuppressWakeForHIDEvents]( &OBJC_CLASS___PBAttentionMonitor,  "_temporarilySuppressWakeForHIDEvents");
  }

  else
  {
    id v5 = sub_100082D6C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Not suppressing wake resulting from remote button %ld release.",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)externalControlSystemDidRequestAlternateRouteVolumeUp:(id)a3 behavior:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3LL:
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 appWithVolumeButtonAccess]);

      id v13 = sub_100082DE4();
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        unsigned int v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (custom) volume up request to %{public}@",  (uint8_t *)&v17,  0xCu);
      }

      sub_100031BE8(12LL, 233LL, 0LL, 3uLL, v12);
      break;
    case 2LL:
      id v15 = sub_100082DE4();
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (system music) volume up request",  (uint8_t *)&v17,  2u);
      }

      volumeController = self->_volumeController;
      uint64_t v10 = 1LL;
      goto LABEL_13;
    case 1LL:
      id v7 = sub_100082DE4();
      int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (system audio) volume up request",  (uint8_t *)&v17,  2u);
      }

      volumeController = self->_volumeController;
      uint64_t v10 = 0LL;
LABEL_13:
      -[PBVolumeController increaseVolumeForOutputContext:](volumeController, "increaseVolumeForOutputContext:", v10);
      break;
  }
}

- (void)externalControlSystemDidRequestAlternateRouteVolumeDown:(id)a3 behavior:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3LL:
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 appWithVolumeButtonAccess]);

      id v13 = sub_100082DE4();
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        unsigned int v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (custom) volume down request to %{public}@",  (uint8_t *)&v17,  0xCu);
      }

      sub_100031BE8(12LL, 234LL, 0LL, 3uLL, v12);
      break;
    case 2LL:
      id v15 = sub_100082DE4();
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (system music) volume down request",  (uint8_t *)&v17,  2u);
      }

      volumeController = self->_volumeController;
      uint64_t v10 = 1LL;
      goto LABEL_13;
    case 1LL:
      id v7 = sub_100082DE4();
      int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (system audio) volume down request",  (uint8_t *)&v17,  2u);
      }

      volumeController = self->_volumeController;
      uint64_t v10 = 0LL;
LABEL_13:
      -[PBVolumeController decreaseVolumeForOutputContext:](volumeController, "decreaseVolumeForOutputContext:", v10);
      break;
  }
}

- (void)externalControlSystemDidRequestAlternateRouteVolumeMute:(id)a3 behavior:(int64_t)a4 muted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  switch(a4)
  {
    case 3LL:
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 appWithVolumeButtonAccess]);

      id v17 = sub_100082DE4();
      unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = "unmute";
        if (v5) {
          __int16 v19 = "mute";
        }
        int v23 = 136446466;
        id v24 = v19;
        __int16 v25 = 2114;
        id v26 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (custom) volume %{public}s request to %{public}@",  (uint8_t *)&v23,  0x16u);
      }

      sub_100031BE8(12LL, 226LL, 0LL, 3uLL, v16);
      break;
    case 2LL:
      id v20 = sub_100082DE4();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = "unmute";
        if (v5) {
          id v22 = "mute";
        }
        int v23 = 136446210;
        id v24 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (system music) volume %{public}s request",  (uint8_t *)&v23,  0xCu);
      }

      volumeController = self->_volumeController;
      BOOL v13 = v5;
      uint64_t v14 = 1LL;
      goto LABEL_19;
    case 1LL:
      id v9 = sub_100082DE4();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v11 = "unmute";
        if (v5) {
          unsigned __int8 v11 = "mute";
        }
        int v23 = 136446210;
        id v24 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (system audio) volume %{public}s request",  (uint8_t *)&v23,  0xCu);
      }

      volumeController = self->_volumeController;
      BOOL v13 = v5;
      uint64_t v14 = 0LL;
LABEL_19:
      -[PBVolumeController setVolumeMuted:forOutputContext:]( volumeController,  "setVolumeMuted:forOutputContext:",  v13,  v14);
      break;
  }
}

- ($95A7711724258D2DBCF2C7E5A2AF8B2C)externalControlSystemAlternateRouteCurrentVolumeState:(id)a3 behavior:(int64_t)a4
{
  id v6 = a3;
  float var0 = PBSExternalControlSystemUnknownVolumeLevel;
  switch(a4)
  {
    case 3LL:
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
      *(double *)&unsigned int v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v15 appWithVolumeButtonAccess]));

      id v16 = sub_100082DE4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138543362;
        double v23 = *(double *)&v12;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "AltVolRoute (custom) volume level unknown for %{public}@",  (uint8_t *)&v22,  0xCu);
      }

      unint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      break;
    case 2LL:
      $95A7711724258D2DBCF2C7E5A2AF8B2C v18 = -[PBVolumeController currentVolumeStateForOutputContext:]( self->_volumeController,  "currentVolumeStateForOutputContext:",  1LL);
      unint64_t v9 = *(void *)&v18 & 0xFFFFFFFF00000000LL;
      unint64_t v10 = *(void *)&v18 & 0xFFFFFF0000000000LL;
      float var0 = v18.var0;
      id v19 = sub_100082DE4();
      *(double *)&unsigned int v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v19));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = "muted";
        int v22 = 134218242;
        double v23 = v18.var0;
        __int16 v24 = 2080;
        __int16 v25 = v20;
        uint64_t v14 = "AltVolRoute (system music) volume level: %f %s";
        goto LABEL_15;
      }

      break;
    case 1LL:
      $95A7711724258D2DBCF2C7E5A2AF8B2C v8 = -[PBVolumeController currentVolumeStateForOutputContext:]( self->_volumeController,  "currentVolumeStateForOutputContext:",  0LL);
      unint64_t v9 = *(void *)&v8 & 0xFFFFFFFF00000000LL;
      unint64_t v10 = *(void *)&v8 & 0xFFFFFF0000000000LL;
      float var0 = v8.var0;
      id v11 = sub_100082DE4();
      *(double *)&unsigned int v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v11));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = "muted";
        int v22 = 134218242;
        double v23 = v8.var0;
        __int16 v24 = 2080;
        __int16 v25 = v13;
        uint64_t v14 = "AltVolRoute (system audio) volume level: %f %s";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v22, 0x16u);
      }

      break;
    default:
      unint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      goto LABEL_18;
  }

LABEL_18:
  return ($95A7711724258D2DBCF2C7E5A2AF8B2C)(v10 | v9 & 0xFF00000000LL | LODWORD(var0));
}

- (void)externalControlSystem:(id)a3 didReceiveAudioStatusVolumeLevel:(unint64_t)a4 muted:(BOOL)a5
{
  if ([(id)objc_opt_class(self) showATVVolumeUIForExternalAudioSource])
  {
    LODWORD(v8) = 0;
    if (!a5) {
      *(float *)&double v8 = (float)a4 / 100.0;
    }
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8));
    -[PBExternalControlSystem setLastKnownCECVolumeLevel:](self, "setLastKnownCECVolumeLevel:", v9);
    id v10 = sub_100082DE4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Saving last known CEC volume level to %@",  (uint8_t *)&v14,  0xCu);
    }

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    [v12 notePreferredVolumeLevelChanged:v9];

    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[PBCaptionsOnMuteController sharedInstance]( &OBJC_CLASS___PBCaptionsOnMuteController,  "sharedInstance"));
    [v13 noteVolumeLevel:v9 fromSource:0 sourceTracksVolumeLevel:1];
  }

- (void)volumeSupportedChanged:(id)a3 forOutputContext:(unint64_t)a4
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem volumeBehaviorStateMachine](self, "volumeBehaviorStateMachine", a3, a4));
  [v4 postEvent:@"AV Volume Control Available Changed"];
}

- (void)_initializeVolumeButtonGestures
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1001DD884;
  v22[3] = &unk_1003D1020;
  objc_copyWeak(&v23, &location);
  unsigned __int8 v4 = (PBSystemGestureHandle *)[v3 newHandleForSystemGesture:25 actionHandler:v22];
  volumeMuteButtonGesture = self->_volumeMuteButtonGesture;
  self->_volumeMuteButtonGesture = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1001DD8B0;
  v20[3] = &unk_1003D1020;
  objc_copyWeak(&v21, &location);
  id v7 = (PBSystemGestureHandle *)[v6 newHandleForSystemGesture:26 actionHandler:v20];
  volumeIncrementGesture = self->_volumeIncrementGesture;
  self->_volumeIncrementGesture = v7;

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1001DD908;
  $95A7711724258D2DBCF2C7E5A2AF8B2C v18 = &unk_1003D1020;
  objc_copyWeak(&v19, &location);
  id v10 = (PBSystemGestureHandle *)[v9 newHandleForSystemGesture:27 actionHandler:&v15];
  volumeDecrementGesture = self->_volumeDecrementGesture;
  self->_volumeDecrementGesture = v10;

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureManager sharedInstance]( &OBJC_CLASS___PBSystemGestureManager,  "sharedInstance",  v15,  v16,  v17,  v18));
  BOOL v13 = (PBSystemGestureHandle *)[v12 newHandleForSystemGesture:28 actionHandler:&stru_1003DC3D8];
  switchToATVGesture = self->_switchToATVGesture;
  self->_switchToATVGesture = v13;

  -[PBSystemGestureHandle acquire](self->_volumeMuteButtonGesture, "acquire");
  -[PBSystemGestureHandle acquire](self->_volumeIncrementGesture, "acquire");
  -[PBSystemGestureHandle acquire](self->_volumeDecrementGesture, "acquire");
  -[PBSystemGestureHandle acquire](self->_switchToATVGesture, "acquire");
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)_performToggleMuteOrShowUnconfiguredAlert
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
  if ([v3 isReadyForUse] && objc_msgSend(v3, "isConfiguredForUse"))
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
    objc_msgSend( v4,  "noteMuteWasToggledWithCurrentVolumeLevel:eligibleForIndeterminateState:",  v5,  objc_msgSend((id)objc_opt_class(self), "showATVVolumeUIForExternalAudioSource"));

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem externalControlSystem](self, "externalControlSystem"));
    [v6 sendAction:16 withCompletion:0];
  }

  else
  {
    -[PBExternalControlSystem _showUnconfiguredAlert](self, "_showUnconfiguredAlert");
  }
}

- (void)_performVolumeUpWithGestureRecognizerState:(int64_t)a3
{
  if (a3 == 1)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:"));
    if ([v4 isReadyForUse] && objc_msgSend(v4, "isConfiguredForUse"))
    {
      id v5 = sub_100082DE4();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
        int v19 = 138412290;
        id v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Volume up pressed, using last known CEC volume level of %@",  (uint8_t *)&v19,  0xCu);
      }

      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
      id v9 = [(id)objc_opt_class(self) showATVVolumeUIForExternalAudioSource];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
      [v8 noteVolumeUpWasHit:1 eligibleForIndeterminateState:v9 currentVolumeLevel:v10];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem externalControlSystem](self, "externalControlSystem"));
      [v11 sendAction:11 withCompletion:0];
    }
  }

  else
  {
    id v13 = sub_100082DE4();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
      int v19 = 138412290;
      id v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Volume up released, using last known CEC volume level of %@",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    id v17 = [(id)objc_opt_class(self) showATVVolumeUIForExternalAudioSource];
    $95A7711724258D2DBCF2C7E5A2AF8B2C v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
    [v16 noteVolumeUpWasHit:0 eligibleForIndeterminateState:v17 currentVolumeLevel:v18];

    -[PBExternalControlSystem _sendAction:orShowUnconfiguredAlert:]( self,  "_sendAction:orShowUnconfiguredAlert:",  12LL,  a3 == 3);
  }

- (void)_performVolumeDownWithGestureRecognizerState:(int64_t)a3
{
  if (a3 == 1)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:"));
    if ([v4 isReadyForUse] && objc_msgSend(v4, "isConfiguredForUse"))
    {
      id v5 = sub_100082DE4();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
        int v19 = 138412290;
        id v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Volume down pressed, using last known CEC volume level of %@",  (uint8_t *)&v19,  0xCu);
      }

      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
      id v9 = [(id)objc_opt_class(self) showATVVolumeUIForExternalAudioSource];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
      [v8 noteVolumeDownWasHit:1 eligibleForIndeterminateState:v9 currentVolumeLevel:v10];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem externalControlSystem](self, "externalControlSystem"));
      [v11 sendAction:14 withCompletion:0];
    }
  }

  else
  {
    id v13 = sub_100082DE4();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
      int v19 = 138412290;
      id v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Volume down released, using last known CEC volume level of %@",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBVolumeHUDManager sharedInstance](&OBJC_CLASS___PBVolumeHUDManager, "sharedInstance"));
    id v17 = [(id)objc_opt_class(self) showATVVolumeUIForExternalAudioSource];
    $95A7711724258D2DBCF2C7E5A2AF8B2C v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem lastKnownCECVolumeLevel](self, "lastKnownCECVolumeLevel"));
    [v16 noteVolumeDownWasHit:0 eligibleForIndeterminateState:v17 currentVolumeLevel:v18];

    -[PBExternalControlSystem _sendAction:orShowUnconfiguredAlert:]( self,  "_sendAction:orShowUnconfiguredAlert:",  15LL,  a3 == 3);
  }

- (void)_sendActionOrShowUnconfiguredAlertForAction:(int64_t)a3
{
}

- (void)_sendAction:(int64_t)a3 orShowUnconfiguredAlert:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  1LL));
  if ([v7 isReadyForUse] && objc_msgSend(v7, "isConfiguredForUse"))
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem externalControlSystem](self, "externalControlSystem"));
    [v8 sendAction:a3 withCompletion:0];
  }

  else if (v4)
  {
    -[PBExternalControlSystem _showUnconfiguredAlert](self, "_showUnconfiguredAlert");
  }
}

- (void)_showUnconfiguredAlert
{
  if ([(id)objc_opt_class(self) volumeControlNeedsConfiguring]
    && -[PBExternalControlSystem _displayHasNonZeroSize](self, "_displayHasNonZeroSize")
    && (sub_1001C9BFC() & 1) == 0)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedPineBoardServicesPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedPineBoardServicesPreferences"));
    objc_msgSend(v3, "setPbs_shouldShowUnconfiguredVolumeButtonsAlert:", 0);

    dispatch_assert_queue_V2(&_dispatch_main_q);
    id v4 = sub_1001C307C(@"RCUnconfiguredVolumeTitle", 0LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = sub_1001C307C(@"RCUnconfiguredVolumeMessage", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v7,  1LL));

    id v9 = sub_1001C307C(@"RCUnconfiguredVolumeCancelMenuItem", 0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  1LL,  0LL));
    [v8 addAction:v11];

    id v12 = sub_1001C307C(@"RCUnconfiguredVolumeGoToSettingsMenuItem", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v13,  0LL,  &stru_1003DC3F8));
    [v8 addAction:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[PBDialogContext contextWithViewController:]( &OBJC_CLASS___PBDialogContext,  "contextWithViewController:",  v8));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
    [v16 presentDialogWithContext:v15 options:0 completion:0];
  }

- (void)_listenForVolumeButtonOverrideUpdates
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBHardwareButtonAccessManager sharedInstance]( &OBJC_CLASS___PBHardwareButtonAccessManager,  "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"appWithVolumeButtonAccess" options:0 context:off_10046D900];
}

- (void)_listenForNowPlayingAppNotifications
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBNowPlayingManager sharedInstance](&OBJC_CLASS___PBNowPlayingManager, "sharedInstance"));
  [v3 addObserver:self forKeyPath:@"nowPlayingAppFocused" options:0 context:off_10046D908];
  [v3 addObserver:self forKeyPath:@"presenting" options:0 context:off_10046D910];
}

- (void)_initializeVolumeBehaviorStateMachine
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001DE6B8;
  v27[3] = &unk_1003D16D0;
  objc_copyWeak(&v28, &location);
  v27[4] = self;
  id v4 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  @"PBExternalControlSystem-VolumeButtonBehavior",  @"Unknown",  0LL,  v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1001DE8D8;
  v25[3] = &unk_1003DC440;
  objc_copyWeak(&v26, &location);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1001DEACC;
  v23[3] = &unk_1003DC468;
  id v5 = objc_retainBlock(v25);
  id v24 = v5;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v4,  "registerHandlerForEvent:onState:withBlock:",  @"Prepare",  @"Unknown",  v23);
  v32[0] = @"CEC/IR Mode";
  v32[1] = @"Core Audio (System Audio)";
  v32[2] = @"System Music";
  v32[3] = @"Custom";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 4LL));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001DEAF4;
  v21[3] = &unk_1003DC468;
  id v7 = v5;
  id v22 = v7;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v4,  "registerHandlerForEvent:onStates:withBlock:",  @"AV Volume Control Available Changed",  v6,  v21);

  v31[0] = @"CEC/IR Mode";
  v31[1] = @"Core Audio (System Audio)";
  v31[2] = @"System Music";
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001DEB1C;
  v19[3] = &unk_1003DC468;
  id v9 = v7;
  id v20 = v9;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v4,  "registerHandlerForEvent:onStates:withBlock:",  @"Now Playing App is Foreground Changed",  v8,  v19);

  v30[0] = @"CEC/IR Mode";
  v30[1] = @"Core Audio (System Audio)";
  v30[2] = @"System Music";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 3LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001DEB44;
  v17[3] = &unk_1003DC468;
  id v11 = v9;
  id v18 = v11;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v4,  "registerHandlerForEvent:onStates:withBlock:",  @"Custom Control Enabled",  v10,  v17);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001DEB6C;
  v15[3] = &unk_1003DC468;
  id v12 = v11;
  id v16 = v12;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v4,  "registerHandlerForEvent:onState:withBlock:",  @"Custom Control Disabled",  @"Custom",  v15);
  objc_storeStrong((id *)&self->_volumeBehaviorStateMachine, v4);
  id v13 = sub_100082DE4();
  int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[TVSStateMachine setLogObject:](v4, "setLogObject:", v14);

  -[TVSStateMachine setShouldAcceptEvents:](v4, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (PBSExternalControlSystem)externalControlSystem
{
  return self->_externalControlSystem;
}

- (void)setExternalControlSystem:(id)a3
{
}

- (PBVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (TVSStateMachine)volumeBehaviorStateMachine
{
  return self->_volumeBehaviorStateMachine;
}

- (void)setVolumeBehaviorStateMachine:(id)a3
{
}

- (PBSystemGestureHandle)volumeMuteButtonGesture
{
  return self->_volumeMuteButtonGesture;
}

- (PBSystemGestureHandle)volumeIncrementGesture
{
  return self->_volumeIncrementGesture;
}

- (PBSystemGestureHandle)volumeDecrementGesture
{
  return self->_volumeDecrementGesture;
}

- (PBSystemGestureHandle)switchToATVGesture
{
  return self->_switchToATVGesture;
}

- (NSNumber)lastKnownCECVolumeLevel
{
  return self->_lastKnownCECVolumeLevel;
}

- (void)setLastKnownCECVolumeLevel:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_sharedInstance
{
  if (qword_1004713D8 != -1) {
    dispatch_once(&qword_1004713D8, &stru_1003DC488);
  }
  return (id)qword_1004713D0;
}

- (void)_handleDisplayModeDidChange
{
  id v3 = sub_100082CF4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Display mode changed. Posting policy update.",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem externalControlSystem](self, "externalControlSystem"));
  -[PBExternalControlSystem externalControlSystemDidUpdatePolicy:](self, "externalControlSystemDidUpdatePolicy:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlFeature featureForType:]( &OBJC_CLASS___PBSExternalControlFeature,  "featureForType:",  0LL));
  if ([v6 transport] == (id)1
    && -[PBExternalControlSystem _displayHasNonZeroSize](self, "_displayHasNonZeroSize"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem externalControlSystem](self, "externalControlSystem"));
    [v7 reconcileActiveSourceState];
  }

  else
  {
    id v8 = sub_100082CF4();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring active source check on HPD - not CEC or empty display.",  v9,  2u);
    }
  }
}

- (BOOL)_shouldSuppressWakeForRemoteControlButton:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 7;
}

- (void)_pauseOnResignedActiveSource
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  unsigned int v3 = [v2 playing];

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    [v4 _pausePlaybackWithReason:@"ResignedActiveSource"];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance"));
  unsigned int v6 = [v5 isPresenting];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    [v7 sendPictureInPicturePlaybackCommand:2];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  [v8 dismissAssistant];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance"));
  [v9 dismissOrShrinkCurrentBulletin];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBControlCenterManager sharedInstance](&OBJC_CLASS___PBControlCenterManager, "sharedInstance"));
  [v10 dismissControlCenter];
}

- (BOOL)_displayHasNonZeroSize
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBExternalControlSystem tvs_bindingAdaptor](self, "tvs_bindingAdaptor"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForBinding:qword_1004713C8]);

  [v3 resolution];
  if (v4 == 0.0)
  {
    BOOL v6 = 0;
  }

  else
  {
    [v3 resolution];
    BOOL v6 = v5 != 0.0;
  }

  return v6;
}

@end