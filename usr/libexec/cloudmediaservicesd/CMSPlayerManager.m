@interface CMSPlayerManager
+ (id)shared;
- (BOOL)_isNowPlayingAppOnAnyEndpoint;
- (CMSPlaybackSessionManager)playbackSessionManager;
- (CMSPlayerManager)init;
- (CMSRemoteSetQueueManager)remoteSetQueueManager;
- (CMSSettingsManager)settingsManager;
- (CloudMediaServicesInterfaceXPCListener)xpcListener;
- (NSMutableSet)playerInstances;
- (NSString)serviceConfigurationURLString;
- (id)_getLocalPlayer;
- (id)_getMatchingPlayer:(id)a3 playerPath:(id)a4;
- (id)_getPlayerInstances;
- (id)_initializePlayerInstance:(id)a3 audioSession:(id)a4;
- (id)loggingSessionForIdentifier:(id)a3;
- (void)_destroyPlayerInstance:(id)a3;
- (void)_handleMediaServicesDied:(id)a3;
- (void)_handleMediaServicesRestarted:(id)a3;
- (void)_removePlayer:(id)a3;
- (void)_setupNotificationHandlers;
- (void)_updateAqueductServerURL;
- (void)dealloc;
- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6;
- (void)pauseSample;
- (void)playSample:(id)a3;
- (void)player:(id)a3 didChangeNowPlayingApplication:(BOOL)a4;
- (void)reportAnalyticsForMethod:(id)a3 forEventType:(id)a4 sessionIdentifier:(id)a5 andAppBundleIdentifier:(id)a6;
- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4;
- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8;
- (void)sessionManager:(id)a3 didCreateNowPlayingSession:(id)a4;
- (void)sessionManager:(id)a3 didDestroyNowPlayingSession:(id)a4;
- (void)sessionManager:(id)a3 didInterruptAudioSession:(id)a4 interruptionType:(unint64_t)a5;
- (void)sessionManager:(id)a3 nowPlayingSession:(id)a4 didUpdateAudioSession:(id)a5;
- (void)setOverrideURL:(id)a3;
- (void)setPlaybackSessionManager:(id)a3;
- (void)setPlayerInstances:(id)a3;
- (void)setRemoteSetQueueManager:(id)a3;
- (void)setServerEnvironment:(id)a3;
- (void)setServiceConfigurationURLString:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)settingsManager:(id)a3 didRemoveService:(id)a4 forUser:(id)a5;
- (void)stopAnalyticsWithIdentifier:(id)a3;
- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7;
@end

@implementation CMSPlayerManager

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100002100;
  block[3] = &unk_10001C540;
  block[4] = a1;
  if (qword_100024418 != -1) {
    dispatch_once(&qword_100024418, block);
  }
  return (id)qword_100024410;
}

- (CMSPlayerManager)init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___CMSPlayerManager;
  v2 = -[CMSPlayerManager init](&v27, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    playerInstances = v2->_playerInstances;
    v2->_playerInstances = v3;

    -[CMSPlayerManager _updateAqueductServerURL](v2, "_updateAqueductServerURL");
    -[CMSPlayerManager _setupNotificationHandlers](v2, "_setupNotificationHandlers");
    v5 = -[CMSLogger initForIdentity:]( objc_alloc(&OBJC_CLASS___CMSLogger),  "initForIdentity:",  @"com.apple.CloudMediaServices");
    analyticsLogger = v2->_analyticsLogger;
    v2->_analyticsLogger = v5;

    -[CMSLogger setOccuranceLog:](v2->_analyticsLogger, "setOccuranceLog:", 0LL);
    -[CMSLogger setReportFrequency:](v2->_analyticsLogger, "setReportFrequency:", 86400.0);
    -[CMSLogger setEntryRenamingDictionary:](v2->_analyticsLogger, "setEntryRenamingDictionary:", &off_10001D4A0);
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    analyticsLoggingSession = v2->_analyticsLoggingSession;
    v2->_analyticsLoggingSession = v7;

    if (+[CMSFeatureStatus isMultiPlayerSupported]( &OBJC_CLASS___CMSFeatureStatus,  "isMultiPlayerSupported"))
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[CMSPlaybackSessionManager shared](&OBJC_CLASS___CMSPlaybackSessionManager, "shared"));
      playbackSessionManager = v2->_playbackSessionManager;
      v2->_playbackSessionManager = (CMSPlaybackSessionManager *)v9;

      -[CMSPlaybackSessionManager registerSessionManagerDelegate:]( v2->_playbackSessionManager,  "registerSessionManagerDelegate:",  v2);
    }

    else
    {
      uint64_t v11 = _CMSQLoggingFacility();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[CMSPlayerManager init]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Device does not support being a multiplayer host",  buf,  0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPRemoteCommandCenter sharedCommandCenter]( &OBJC_CLASS___MPRemoteCommandCenter,  "sharedCommandCenter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerPath]);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](&OBJC_CLASS___MPNowPlayingInfoCenter, "defaultCenter"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      v17 = (char *)objc_claimAutoreleasedReturnValue( -[CMSPlayerManager _initializePlayerInstance:audioSession:]( v2,  "_initializePlayerInstance:audioSession:",  v14,  v16));

      uint64_t v18 = _CMSQLoggingFacility();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Initialized Local Player - %@", buf, 0xCu);
      }

      [v17 setCMSLoggingSession:v2->_currentPlaybackLoggingSession];
    }

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[CMSSettingsManager sharedManager](&OBJC_CLASS___CMSSettingsManager, "sharedManager"));
    settingsManager = v2->_settingsManager;
    v2->_settingsManager = (CMSSettingsManager *)v20;

    -[CMSSettingsManager setServiceChangedDelegate:](v2->_settingsManager, "setServiceChangedDelegate:", v2);
    v22 = objc_alloc_init(&OBJC_CLASS___CMSRemoteSetQueueManager);
    remoteSetQueueManager = v2->_remoteSetQueueManager;
    v2->_remoteSetQueueManager = v22;

    v24 = -[CloudMediaServicesInterfaceXPCListener initWithDelegate:]( objc_alloc(&OBJC_CLASS___CloudMediaServicesInterfaceXPCListener),  "initWithDelegate:",  v2);
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v24;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:AVAudioSessionMediaServicesWereLostNotification object:0];

  if ((+[CMSFeatureStatus isMultiPlayerSupported]( &OBJC_CLASS___CMSFeatureStatus,  "isMultiPlayerSupported") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:0];
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CMSPlayerManager;
  -[CMSPlayerManager dealloc](&v5, "dealloc");
}

- (void)reportAnalyticsForMethod:(id)a3 forEventType:(id)a4 sessionIdentifier:(id)a5 andAppBundleIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"."]);
  if ([v14 count] == (id)2)
  {
    v19[0] = @"requestClass";
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
    v20[0] = v15;
    v19[1] = @"requestAction";
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:1]);
    v19[2] = @"serviceName";
    v20[1] = v16;
    v20[2] = v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CMSPlayerManager submitAnalyticsForType:andIdentifier:eventType:atTime:withMetadata:]( self,  "submitAnalyticsForType:andIdentifier:eventType:atTime:withMetadata:",  v10,  v12,  v11,  v18,  v17);
  }
}

- (void)_updateAqueductServerURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v3 objectForDefault:kAqueductServerOverrideOption]);

  if (v10)
  {
    v4 = (NSString *)v10;
    serviceConfigurationURLString = self->_serviceConfigurationURLString;
    self->_serviceConfigurationURLString = v4;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    serviceConfigurationURLString = (NSString *)objc_claimAutoreleasedReturnValue( [v6 objectForDefault:kAqueductServerEnvironmentOverrideOption]);

    if (serviceConfigurationURLString)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( [@"https://aqueduct-service-" stringByAppendingString:serviceConfigurationURLString]);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue( [v7 stringByAppendingString:@".us-west-2a.app.apple.com/v2/configuration"]);
    }

    else
    {
      v8 = (NSString *)kAqueductDefaultConfigurationURLString;
    }

    uint64_t v9 = self->_serviceConfigurationURLString;
    self->_serviceConfigurationURLString = v8;
  }
}

- (id)loggingSessionForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self->_analyticsLoggingSession;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_analyticsLoggingSession, "objectForKey:", v4));
    objc_sync_exit(v5);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (void)_setupNotificationHandlers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleMediaServicesDied:" name:AVAudioSessionMediaServicesWereLostNotification object:0];

  if ((+[CMSFeatureStatus isMultiPlayerSupported]( &OBJC_CLASS___CMSFeatureStatus,  "isMultiPlayerSupported") & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:self selector:"_handleMediaServicesRestarted:" name:AVAudioSessionMediaServicesWereResetNotification object:0];
  }

  xpc_set_event_stream_handler(kCMSLaunchEventNotification, &_dispatch_main_q, &stru_10001C580);
}

- (void)_handleMediaServicesDied:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  id v6 = [v5 copy];

  objc_sync_exit(v4);
  [v6 enumerateObjectsUsingBlock:&stru_10001C5C0];
}

- (void)_handleMediaServicesRestarted:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  id v6 = [v5 copy];

  objc_sync_exit(v4);
  [v6 enumerateObjectsUsingBlock:&stru_10001C5E0];
}

- (void)pauseSample
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager _getLocalPlayer](self, "_getLocalPlayer"));
  [v2 pause];
}

- (void)playSample:(id)a3
{
  id v4 = (__CFString *)a3;
  objc_initWeak(&location, self);
  objc_super v5 = @"default";
  if (v4) {
    objc_super v5 = v4;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"playSampleSession_%@",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", self->_serviceConfigurationURLString));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](&OBJC_CLASS___MPNowPlayingInfoCenter, "defaultCenter"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);

  id v10 = -[CMSPlayer initWithPlayerPath:](objc_alloc(&OBJC_CLASS___CMSPlayer), "initWithPlayerPath:", v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MediaServiceConfiguration sharedInstance](&OBJC_CLASS___MediaServiceConfiguration, "sharedInstance"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100002DF0;
  v16[3] = &unk_10001C658;
  id v12 = v7;
  id v17 = v12;
  id v13 = v6;
  id v18 = v13;
  objc_copyWeak(&v21, &location);
  v14 = v4;
  v19 = v14;
  v15 = v10;
  uint64_t v20 = v15;
  [v11 getCachedServiceInfo:@"com.apple.amp.agora.plaza" homeUserID:0 endpointID:0 completion:v16];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)sendPlaybackQueueToRemoteDestination:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager _getLocalPlayer](self, "_getLocalPlayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v9 getCurrentPlaybackQueue]);
  -[CMSRemoteSetQueueManager sendAGPlaybackQueueToMRMediaRemoteDestination:playbackQueueInfo:withCompletion:]( self->_remoteSetQueueManager,  "sendAGPlaybackQueueToMRMediaRemoteDestination:playbackQueueInfo:withCompletion:",  v7,  v8,  v6);
}

- (void)sendPlaybackQueueWithUserActivityDictionary:(id)a3 forIntentID:(id)a4 toDestination:(id)a5 withIntentData:(id)a6 prepareQueue:(BOOL)a7 withCompletion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = v18;
  if (!v15)
  {
    uint64_t v20 = _CMSQLoggingFacility(v18);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[CMSPlayerManager sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prep"
            "areQueue:withCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s intentIdentifier is nil", buf, 0xCu);
    }
  }

  v22 = self->_analyticsLoggingSession;
  objc_sync_enter(v22);
  v23 = (CMSLoggingSession *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_analyticsLoggingSession,  "objectForKeyedSubscript:",  v15));
  currentPlaybackLoggingSession = self->_currentPlaybackLoggingSession;
  self->_currentPlaybackLoggingSession = v23;

  objc_sync_exit(v22);
  uint64_t v25 = _CMSQLoggingFacility( -[CMSLoggingSession recordEvent:]( self->_currentPlaybackLoggingSession,  "recordEvent:",  kCMSInterfaceAnalyticsDataRequestTSTypePlaybackStarted));
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v35 = "-[CMSPlayerManager sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prepar"
          "eQueue:withCompletion:]";
    objc_super v27 = @"NO";
    *(_DWORD *)buf = 136316162;
    if (v9) {
      objc_super v27 = @"YES";
    }
    __int16 v36 = 2112;
    id v37 = v16;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2112;
    id v41 = v14;
    __int16 v42 = 2112;
    v43 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "_%s_ routeID->%@ intentIdentifier->%@ UserActivityDictionary->%@ preroll %@",  buf,  0x34u);
  }

  remoteSetQueueManager = self->_remoteSetQueueManager;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100003634;
  v31[3] = &unk_10001C680;
  id v32 = v16;
  id v33 = v19;
  id v29 = v19;
  id v30 = v16;
  -[CMSRemoteSetQueueManager sendAGPlaybackQueueToMRMediaRemoteDestination:forIntentID:withIntentData:userActivityDictionary:prepareQueue:withCompletion:]( remoteSetQueueManager,  "sendAGPlaybackQueueToMRMediaRemoteDestination:forIntentID:withIntentData:userActivityDictionary:prepareQueue:withCompletion:",  v30,  v15,  v17,  v14,  v9,  v31);
}

- (void)setServerEnvironment:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  [v5 setObject:v4 forDefault:kAqueductServerEnvironmentOverrideOption];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  uint64_t v7 = kAqueductServerOverrideOption;
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 objectForDefault:kAqueductServerOverrideOption]);

  if (v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    [v8 removeDefaultForKey:v7];
  }

  -[CMSPlayerManager _updateAqueductServerURL](self, "_updateAqueductServerURL");
}

- (void)setOverrideURL:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v5 = _CMSQLoggingFacility(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Overriding Server URL to %@",  (uint8_t *)&v10,  0xCu);
  }

  serviceConfigurationURLString = self->_serviceConfigurationURLString;
  self->_serviceConfigurationURLString = v4;
  v8 = v4;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  [v9 setObject:self->_serviceConfigurationURLString forDefault:kAqueductServerOverrideOption];
}

- (void)getCloudExtensionConfigurationFor:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 withCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  id v14 = objc_alloc_init(&OBJC_CLASS___CMSSessionContextModel);
  id v15 = v14;
  if (v11)
  {
    uint64_t v16 = _CMSQLoggingFacility(v14);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      id v32 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Request made on endpoint, retrieving settings for %@",  (uint8_t *)&v31,  0xCu);
    }

    id v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v11);
  }

  else
  {
    id v18 = 0LL;
  }

  [v15 setServiceID:v9];
  [v15 setHomeUserID:v10];
  if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
  {
    v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[CMSSettingsManager sharedManager](&OBJC_CLASS___CMSSettingsManager, "sharedManager"));
    objc_msgSend( v15,  "setHomeKitAllowExplicitContentSetting:",  objc_msgSend(v20, "explicitContentSettingForUser:", v19));

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[CMSSettingsManager sharedManager](&OBJC_CLASS___CMSSettingsManager, "sharedManager"));
    objc_msgSend( v15,  "setHomeKitUpdateListeningHistorySetting:",  objc_msgSend(v21, "updateListeningHistorySettingForUser:accessoryID:", v19, v18));
  }

  else
  {
    objc_msgSend( v15,  "setHomeKitAllowExplicitContentSetting:",  +[CMSSettingsManager explicitContentSettingForAccessoryID:]( CMSSettingsManager,  "explicitContentSettingForAccessoryID:",  v18));
    id v22 = objc_msgSend( v15,  "setHomeKitUpdateListeningHistorySetting:",  +[CMSSettingsManager listeningHistorySettingForAccessory]( CMSSettingsManager,  "listeningHistorySettingForAccessory"));
    if (v9 && v10)
    {
      objc_msgSend( v15,  "setServiceUpdateListeningHistory:",  +[CMSSettingsManager listeningHistorySettingForService:user:]( CMSSettingsManager,  "listeningHistorySettingForService:user:",  v9,  v10));
      goto LABEL_14;
    }

    uint64_t v23 = _CMSQLoggingFacility(v22);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10000F1B8();
    }
  }

LABEL_14:
  v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForDefault:kAqueductServerOverrideOption]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v24));
  [v15 setServerOverrideURL:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForDefault:kAqueductServerEnvironmentOverrideOption]);
  [v15 setServerEnvironmentOverride:v26];

  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForDefault:kOverrideSessionAuthHeader]);
  [v15 setSessionAuthHeaderOverride:v27];

  uint64_t v29 = _CMSQLoggingFacility(v28);
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    int v31 = 138412290;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "CMSSessionContextModel %@", (uint8_t *)&v31, 0xCu);
  }

  if (v12) {
    v12[2](v12, v15, 0LL);
  }
}

- (void)submitAnalyticsForType:(id)a3 andIdentifier:(id)a4 eventType:(id)a5 atTime:(id)a6 withMetadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v13)
  {
    id v18 = self->_analyticsLoggingSession;
    objc_sync_enter(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_analyticsLoggingSession,  "objectForKeyedSubscript:",  v13));
    if (!v19)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( -[CMSLogger createNewSessionForType:withMetadata:]( self->_analyticsLogger,  "createNewSessionForType:withMetadata:",  v12,  v17));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_analyticsLoggingSession,  "setObject:forKeyedSubscript:",  v19,  v13);
    }

    [v19 recordEvent:v14 occuredAt:v15];

    objc_sync_exit(v18);
  }

  else
  {
    uint64_t v20 = _CMSQLoggingFacility(v16);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10000F1E4();
    }
  }
}

- (void)stopAnalyticsWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self->_analyticsLoggingSession;
    objc_sync_enter(v5);
    -[NSMutableDictionary removeObjectForKey:](self->_analyticsLoggingSession, "removeObjectForKey:", v4);
    objc_sync_exit(v5);
  }

  else
  {
    uint64_t v6 = _CMSQLoggingFacility(0LL);
    uint64_t v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10000F1E4();
    }
  }
}

- (void)sessionManager:(id)a3 didCreateNowPlayingSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CMSQLoggingFacility(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315650;
    id v18 = "-[CMSPlayerManager sessionManager:didCreateNowPlayingSession:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s manager %@ nowPlayingSession: %@",  (uint8_t *)&v17,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPNowPlayingInfoCenter infoCenterForPlayerPath:]( &OBJC_CLASS___MPNowPlayingInfoCenter,  "infoCenterForPlayerPath:",  v10));

  [v11 becomeActive];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 audioSession]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CMSPlayerManager _initializePlayerInstance:audioSession:]( self,  "_initializePlayerInstance:audioSession:",  v12,  v13));

  uint64_t v15 = _CMSQLoggingFacility([v14 setCMSLoggingSession:self->_currentPlaybackLoggingSession]);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    id v18 = "-[CMSPlayerManager sessionManager:didCreateNowPlayingSession:]";
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s Initialized Player %@",  (uint8_t *)&v17,  0x16u);
  }
}

- (void)sessionManager:(id)a3 didDestroyNowPlayingSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CMSQLoggingFacility(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[CMSPlayerManager sessionManager:didDestroyNowPlayingSession:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s manager %@ nowPlayingSession: %@",  (uint8_t *)&v11,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
  -[CMSPlayerManager _destroyPlayerInstance:](self, "_destroyPlayerInstance:", v10);
}

- (void)sessionManager:(id)a3 didInterruptAudioSession:(id)a4 interruptionType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _CMSQLoggingFacility(v9);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[CMSPlayerManager sessionManager:didInterruptAudioSession:interruptionType:]";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s manager %@ AudioSession: %@", buf, 0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v12);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  id v14 = [v13 copy];

  objc_sync_exit(v12);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000042A4;
  v16[3] = &unk_10001C6A8;
  id v17 = v9;
  unint64_t v18 = a5;
  id v15 = v9;
  [v14 enumerateObjectsUsingBlock:v16];
}

- (void)sessionManager:(id)a3 nowPlayingSession:(id)a4 didUpdateAudioSession:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = _CMSQLoggingFacility(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    id v17 = "-[CMSPlayerManager sessionManager:nowPlayingSession:didUpdateAudioSession:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s manager %@ AudioSession: %@",  (uint8_t *)&v16,  0x20u);
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager _getMatchingPlayer:playerPath:](self, "_getMatchingPlayer:playerPath:", v13, v14));
  [v15 updateAudioSession:v9];
}

- (void)player:(id)a3 didChangeNowPlayingApplication:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = _CMSQLoggingFacility(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[CMSPlayerManager player:didChangeNowPlayingApplication:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s CMSPlayer %@ NowPlayingApp status %d",  (uint8_t *)&v11,  0x1Cu);
  }

  if (!-[CMSPlayerManager _isNowPlayingAppOnAnyEndpoint](self, "_isNowPlayingAppOnAnyEndpoint"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CMSProcessTransaction sharedTransaction](&OBJC_CLASS___CMSProcessTransaction, "sharedTransaction"));
    [v9 setActive:0];

    if ((+[CMSFeatureStatus isMultiPlayerSupported]( &OBJC_CLASS___CMSFeatureStatus,  "isMultiPlayerSupported") & 1) == 0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CMSProcessTransaction sharedTransaction]( &OBJC_CLASS___CMSProcessTransaction,  "sharedTransaction"));
      [v10 setActive:0];

      [v6 invalidateAudioObjects];
    }
  }
}

- (void)settingsManager:(id)a3 didRemoveService:(id)a4 forUser:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 bundleIdentifier]);
  uint64_t v9 = _CMSQLoggingFacility(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315395;
    __int16 v20 = "-[CMSPlayerManager settingsManager:didRemoveService:forUser:]";
    __int16 v21 = 2113;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Service %{private}@", buf, 0x16u);
  }

  BOOL v11 = -[CMSPlayerManager _isNowPlayingAppOnAnyEndpoint](self, "_isNowPlayingAppOnAnyEndpoint");
  if (v11)
  {
    id v12 = (char *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager _getPlayerInstances](self, "_getPlayerInstances"));
    uint64_t v13 = _CMSQLoggingFacility(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Player Instances: %@", buf, 0xCu);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000478C;
    v16[3] = &unk_10001C6D0;
    id v17 = v8;
    id v18 = v7;
    [v12 enumerateObjectsUsingBlock:v16];
  }

  else
  {
    uint64_t v15 = _CMSQLoggingFacility(v11);
    id v12 = (char *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "CMSD is not now playing app",  buf,  2u);
    }
  }
}

- (id)_initializePlayerInstance:(id)a3 audioSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  id v10 = [v9 copy];

  objc_sync_exit(v8);
  BOOL v11 = (CMSPlayer *)objc_claimAutoreleasedReturnValue( -[CMSPlayerManager _getMatchingPlayer:playerPath:]( self,  "_getMatchingPlayer:playerPath:",  v10,  v6));
  if (!v11)
  {
    BOOL v11 = -[CMSPlayer initWithPlayerPath:audioSession:]( objc_alloc(&OBJC_CLASS___CMSPlayer),  "initWithPlayerPath:audioSession:",  v6,  v7);
    id v12 = -[CMSPlayer setDelegate:](v11, "setDelegate:", self);
    if (v11)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
      objc_sync_enter(v13);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
      [v14 addObject:v11];

      objc_sync_exit(v13);
    }

    else
    {
      uint64_t v15 = _CMSQLoggingFacility(v12);
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000F210();
      }

      BOOL v11 = 0LL;
    }
  }

  return v11;
}

- (void)_destroyPlayerInstance:(id)a3
{
  id v8 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  id v6 = [v5 copy];

  objc_sync_exit(v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager _getMatchingPlayer:playerPath:](self, "_getMatchingPlayer:playerPath:", v6, v8));
  -[CMSPlayerManager _removePlayer:](self, "_removePlayer:", v7);
}

- (void)_removePlayer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
    objc_sync_enter(v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
    [v7 removeObject:v5];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
    id v9 = [v8 count];

    if (!v9)
    {
      uint64_t v11 = _CMSQLoggingFacility(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v22 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "There are no active players, releasing active os_transactions",  v22,  2u);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CMSProcessTransaction sharedTransaction]( &OBJC_CLASS___CMSProcessTransaction,  "sharedTransaction"));
      [v13 setActive:0];
    }

    objc_sync_exit(v6);
  }

  else
  {
    uint64_t v14 = _CMSQLoggingFacility(0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_10000F23C((os_log_s *)v6, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (id)_getLocalPlayer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPNowPlayingInfoCenter defaultCenter](&OBJC_CLASS___MPNowPlayingInfoCenter, "defaultCenter"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerPath]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  id v7 = [v6 copy];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager _getMatchingPlayer:playerPath:](self, "_getMatchingPlayer:playerPath:", v7, v4));

  objc_sync_exit(v5);
  return v8;
}

- (id)_getPlayerInstances
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);

  objc_sync_exit(v3);
  return v5;
}

- (id)_getMatchingPlayer:(id)a3 playerPath:(id)a4
{
  id v5 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100004F14;
  uint64_t v16 = sub_100004F24;
  id v17 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100004F2C;
  v9[3] = &unk_10001C6F8;
  id v6 = a4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_isNowPlayingAppOnAnyEndpoint
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CMSPlayerManager playerInstances](self, "playerInstances"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005098;
  v6[3] = &unk_10001C720;
  v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  objc_sync_exit(v3);
  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (NSString)serviceConfigurationURLString
{
  return self->_serviceConfigurationURLString;
}

- (void)setServiceConfigurationURLString:(id)a3
{
}

- (CMSSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (CloudMediaServicesInterfaceXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (CMSRemoteSetQueueManager)remoteSetQueueManager
{
  return self->_remoteSetQueueManager;
}

- (void)setRemoteSetQueueManager:(id)a3
{
}

- (CMSPlaybackSessionManager)playbackSessionManager
{
  return self->_playbackSessionManager;
}

- (void)setPlaybackSessionManager:(id)a3
{
}

- (NSMutableSet)playerInstances
{
  return self->_playerInstances;
}

- (void)setPlayerInstances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end