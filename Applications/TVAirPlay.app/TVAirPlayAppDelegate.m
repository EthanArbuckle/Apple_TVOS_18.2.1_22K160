@interface TVAirPlayAppDelegate
- (BKSProcessAssertion)procAssert;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)playbackActive;
- (BSInvalidatable)idleTimerAssertion;
- (NSString)previousAudioRouteUID;
- (TVAirPlayAPRKManager)APRKManager;
- (TVAirPlayAirTunesReceiverDelegate)airTunesReceiverDelegate;
- (id)_createIdleTimerConfigurationForRenderer:(id)a3;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int)cloudAvailabilityNotifyToken;
- (void)_disableAirPlaySpeakerIfNecessary;
- (void)_reenableAirPlaySpeakerIfNecessary;
- (void)_updateCloudConnectivityState;
- (void)_updateIdleTimerWithRenderer:(id)a3;
- (void)_updatePlaybackActive;
- (void)applicationWillTerminate:(id)a3;
- (void)dealloc;
- (void)managerDidUpdateRenderer:(id)a3;
- (void)setAPRKManager:(id)a3;
- (void)setAirTunesReceiverDelegate:(id)a3;
- (void)setCloudAvailabilityNotifyToken:(int)a3;
- (void)setIdleTimerAssertion:(id)a3;
- (void)setPlaybackActive:(BOOL)a3;
- (void)setPreviousAudioRouteUID:(id)a3;
- (void)setProcAssert:(id)a3;
@end

@implementation TVAirPlayAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  self->_cloudAvailabilityNotifyToken = -1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3, a4));
  [v5 addObserver:self selector:"_updateCloudConnectivityState" name:kATVInternetAvailabilityChanged object:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_updatePlaybackActive" name:@"TVAirPlaySessionManagerActiveSessionsDidChangeNotification" object:0];

  -[TVAirPlayAppDelegate _updateCloudConnectivityState](self, "_updateCloudConnectivityState");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000119D4,  PBSPowerManagerDeviceWillSleepIdleDistributedNotification,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v8,  self,  (CFNotificationCallback)sub_1000119D4,  PBSPowerManagerDeviceWillSleepManualDistributedNotification,  0LL,  CFNotificationSuspensionBehaviorCoalesce);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKCloudDataClient cloudDataClient](&OBJC_CLASS___TVCKCloudDataClient, "cloudDataClient"));
  [v9 connect];

  v10 = objc_alloc(&OBJC_CLASS___BKSProcessAssertion);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  v13 = -[BKSProcessAssertion initWithBundleIdentifier:flags:reason:name:withHandler:]( v10,  "initWithBundleIdentifier:flags:reason:name:withHandler:",  v12,  13LL,  1LL,  @"ATV AirPlay",  0LL);
  -[TVAirPlayAppDelegate setProcAssert:](self, "setProcAssert:", v13);

  id v14 = sub_100004020();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAppDelegate procAssert](self, "procAssert"));
    int v25 = 138543362;
    v26 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Acquiring process assertion: %{public}@",  (uint8_t *)&v25,  0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v18 = [v17 BOOLForKey:@"DisableAirPlayReceiver"];

  id v19 = sub_100004020();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v21)
    {
      int v25 = 138412290;
      v26 = @"DisableAirPlayReceiver";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "AirPlay receiver will *NOT* be started due to defaults key: %@",  (uint8_t *)&v25,  0xCu);
    }
  }

  else
  {
    if (v21)
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Starting AirPlayReceiverKit Manager",  (uint8_t *)&v25,  2u);
    }

    +[TVPPlayer setShouldDeactivateAVAudioSession:](&OBJC_CLASS___TVPPlayer, "setShouldDeactivateAVAudioSession:", 0LL);
    v22 = objc_alloc_init(&OBJC_CLASS___TVAirPlayAPRKManager);
    APRKManager = self->_APRKManager;
    self->_APRKManager = v22;

    -[TVAirPlayAPRKManager setManagerDelegate:](self->_APRKManager, "setManagerDelegate:", self);
    -[TVAirPlayAPRKManager startReceiverServer](self->_APRKManager, "startReceiverServer");
  }

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "userActivities", 0));
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v11) activityType]);
        unsigned __int8 v13 = [v12 isEqualToString:@"com.apple.appletv.airplay-scene"];

        if ((v13 & 1) != 0)
        {

          id v17 = objc_alloc(&OBJC_CLASS___UISceneConfiguration);
          id v16 = [v17 initWithName:0 sessionRole:UIWindowSceneSessionRoleApplication];
          [v16 setSceneClass:objc_opt_class(UIWindowScene)];
          [v16 setDelegateClass:objc_opt_class(TVAirPlayWindowSceneDelegate)];
          goto LABEL_11;
        }

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = objc_alloc(&OBJC_CLASS___UISceneConfiguration);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 role]);
  id v16 = [v14 initWithName:0 sessionRole:v15];

LABEL_11:
  return v16;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  PBSPowerManagerDeviceWillSleepIdleDistributedNotification,  0LL);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, PBSPowerManagerDeviceWillSleepManualDistributedNotification, 0LL);
  -[TVAirPlayAPRKManager stopReceiverServer](self->_APRKManager, "stopReceiverServer");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVAirPlayAppDelegate;
  -[TVAirPlayAppDelegate dealloc](&v6, "dealloc");
}

- (void)applicationWillTerminate:(id)a3
{
}

- (void)setPlaybackActive:(BOOL)a3
{
  if (self->_playbackActive != a3)
  {
    self->_playbackActive = a3;
    if (a3)
    {
      v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v4, "stringForKey:", @"persistentGroupUUID"));
      id v6 = sub_100004020();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Persistent group UUID found, waiting to determine playback type before waking device",  buf,  2u);
        }
      }

      else
      {
        if (v8)
        {
          *(_WORD *)unsigned int v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No persistent group UUID found, waking device regardless of playback type",  v18,  2u);
        }

        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
        -[os_log_s wakeSystemForReason:](v7, "wakeSystemForReason:", PBSWakeReasonAirPlay);
      }

      id v12 = sub_100004020();
      unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Informing PineBoard AirPlay playback is active",  v16,  2u);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
      [v14 setAirPlayActive:1];

      -[TVAirPlayAppDelegate _disableAirPlaySpeakerIfNecessary](self, "_disableAirPlaySpeakerIfNecessary");
    }

    else
    {
      id v9 = sub_100004020();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Informing PineBoard AirPlay playback is NOT active",  v15,  2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
      [v11 setAirPlayActive:0];

      -[TVAirPlayAppDelegate _reenableAirPlaySpeakerIfNecessary](self, "_reenableAirPlaySpeakerIfNecessary");
    }
  }

- (void)_disableAirPlaySpeakerIfNecessary
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  BOOL v8 = sub_100012360;
  id v9 = sub_100012370;
  id v10 = objc_alloc_init(&OBJC_CLASS___TVPAudioRoutingController);
  [(id)v6[5] setDiscoveryMode:2];
  v3 = (void *)v6[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100012378;
  v4[3] = &unk_100030F60;
  v4[4] = self;
  v4[5] = &v5;
  [v3 fetchAvailableRoutesWithCompletionHandler:v4];
  _Block_object_dispose(&v5, 8);
}

- (void)_reenableAirPlaySpeakerIfNecessary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAppDelegate previousAudioRouteUID](self, "previousAudioRouteUID"));
  if (v3)
  {
    uint64_t v9 = 0LL;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    id v12 = sub_100012360;
    unsigned __int8 v13 = sub_100012370;
    id v14 = objc_alloc_init(&OBJC_CLASS___TVPAudioRoutingController);
    [(id)v10[5] setDiscoveryMode:2];
    v4 = (void *)v10[5];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100012608;
    v5[3] = &unk_100030F88;
    id v6 = v3;
    uint64_t v7 = self;
    BOOL v8 = &v9;
    [v4 fetchAvailableRoutesWithCompletionHandler:v5];

    _Block_object_dispose(&v9, 8);
  }
}

- (void)_updateCloudConnectivityState
{
  if ((self->_cloudAvailabilityNotifyToken & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v17 = -1;
  if (!notify_register_check("com.apple.airplay.cloudConnectivity", &v17))
  {
    self->_cloudAvailabilityNotifyToken = v17;
LABEL_2:
    unsigned int v3 = +[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable");
    id v4 = sub_100004020();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        id v6 = @"YES";
      }
      else {
        id v6 = @"NO";
      }
      if (+[TVSNetworkUtilities internetAvailable]( &OBJC_CLASS___TVSNetworkUtilities,  "internetAvailable")) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      int v17 = 138543618;
      unsigned int v18 = v6;
      __int16 v19 = 2114;
      __int128 v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AirPlay set should use cloud:  %{public}@  (internet:  %{public}@)",  (uint8_t *)&v17,  0x16u);
    }

    notify_set_state(self->_cloudAvailabilityNotifyToken, v3);
    notify_post("com.apple.airplay.cloudConnectivity");
    return;
  }

  id v8 = sub_100004020();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10001C164(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

- (void)_updatePlaybackActive
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeSessions]);
  unint64_t v5 = (unint64_t)[v4 count];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAppDelegate APRKManager](self, "APRKManager"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 activeRenderer]);

  id v8 = sub_100004020();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109888;
    v10[1] = v5 != 0;
    __int16 v11 = 1024;
    BOOL v12 = v7 != 0;
    __int16 v13 = 1024;
    BOOL v14 = (v5 | v7) != 0;
    __int16 v15 = 1024;
    unsigned int v16 = -[TVAirPlayAppDelegate playbackActive](self, "playbackActive");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Trying to update playback active flag. hasActiveSessions: %{BOOL}d, hasActiveAPRKRenderer: %{BOOL}d, newIsPlayActi ve: %{BOOL}d, currentIsPlayActive: %{BOOL}d",  (uint8_t *)v10,  0x1Au);
  }

  -[TVAirPlayAppDelegate setPlaybackActive:](self, "setPlaybackActive:", (v5 | v7) != 0);
}

- (id)_createIdleTimerConfigurationForRenderer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___ITIdleTimerConfiguration);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayAppDelegate APRKManager](self, "APRKManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeRenderer]);

  id v8 = [v4 streamRendererMode];
  if (v7) {
    BOOL v9 = v8 == (id)2;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  [v5 setDisablesTimer:v10];
  return v5;
}

- (void)_updateIdleTimerWithRenderer:(id)a3
{
  id v4 = a3;
  if (v4 && self->_playbackActive)
  {
    -[BSInvalidatable invalidate](self->_idleTimerAssertion, "invalidate");
    idleTimerAssertion = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0LL;

    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVAirPlayAppDelegate _createIdleTimerConfigurationForRenderer:]( self,  "_createIdleTimerConfigurationForRenderer:",  v4));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ITIdleTimerState sharedInstance](&OBJC_CLASS___ITIdleTimerState, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"AirPlay - %@", v8));
    id v14 = 0LL;
    uint64_t v10 = (BSInvalidatable *)[v7 newIdleTimerAssertionWithConfiguration:v6 forReason:v9 error:&v14];
    id v11 = v14;
    BOOL v12 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = v10;
  }

  else
  {
    -[BSInvalidatable invalidate](self->_idleTimerAssertion, "invalidate");
    __int16 v13 = self->_idleTimerAssertion;
    self->_idleTimerAssertion = 0LL;
  }
}

- (void)managerDidUpdateRenderer:(id)a3
{
  id v4 = a3;
  -[TVAirPlayAppDelegate _updatePlaybackActive](self, "_updatePlaybackActive");
  -[TVAirPlayAppDelegate _updateIdleTimerWithRenderer:](self, "_updateIdleTimerWithRenderer:", v4);
}

- (BOOL)playbackActive
{
  return self->_playbackActive;
}

- (BKSProcessAssertion)procAssert
{
  return self->_procAssert;
}

- (void)setProcAssert:(id)a3
{
}

- (int)cloudAvailabilityNotifyToken
{
  return self->_cloudAvailabilityNotifyToken;
}

- (void)setCloudAvailabilityNotifyToken:(int)a3
{
  self->_cloudAvailabilityNotifyToken = a3;
}

- (NSString)previousAudioRouteUID
{
  return self->_previousAudioRouteUID;
}

- (void)setPreviousAudioRouteUID:(id)a3
{
}

- (TVAirPlayAirTunesReceiverDelegate)airTunesReceiverDelegate
{
  return self->_airTunesReceiverDelegate;
}

- (void)setAirTunesReceiverDelegate:(id)a3
{
}

- (TVAirPlayAPRKManager)APRKManager
{
  return self->_APRKManager;
}

- (void)setAPRKManager:(id)a3
{
}

- (BSInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setIdleTimerAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end