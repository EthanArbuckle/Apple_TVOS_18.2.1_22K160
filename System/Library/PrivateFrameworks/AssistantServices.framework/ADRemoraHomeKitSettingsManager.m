@interface ADRemoraHomeKitSettingsManager
+ (float)boundSiriTTSVolume:(float)a3 minValue:(float)a4 maxValue:(float)a5;
+ (void)getSiriTTSVolumeForAccessory:(id)a3 completion:(id)a4;
+ (void)setAllowHeySiriHomeKitSettingForAccessory:(id)a3 forHomeId:(id)a4 homeManager:(id)a5 value:(BOOL)a6 completion:(id)a7;
+ (void)setSiriTTSVolumeForAccessory:(id)a3 to:(float)a4 completion:(id)a5;
- (ADRemoraHomeKitSettingsManager)initWithDataSource:(id)a3 home:(id)a4;
- (void)_fetchSettingsForKeyPaths:(id)a3 endpointID:(id)a4;
- (void)_handleSettings:(id)a3 forAccessoryIdentifier:(id)a4;
- (void)_setAllowHeySiriSetting:(id)a3 forInstanceContext:(id)a4;
- (void)_setAllowJustSiriSetting:(id)a3 forInstanceContext:(id)a4;
- (void)_setMediaPlaybackEnabledSetting:(id)a3 forInstanceContext:(id)a4;
- (void)_setShareSiriAnalyticsSetting:(id)a3 forInstanceContext:(id)a4;
- (void)_setSiriLanguageSetting:(id)a3 forInstanceContext:(id)a4;
- (void)_setSoundAlertSetting:(id)a3 forInstanceContext:(id)a4;
- (void)_setTapToAccessSetting:(id)a3 forInstanceContext:(id)a4;
- (void)_subscribeToSettingsForInstanceContext:(id)a3;
- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5;
- (void)dealloc;
- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didReceiveLaunchNotificationForEndpointUUID:(id)a4;
- (void)notifyObserversOfLanguageChangeForEndpoint:(id)a3 incomingLanguageCode:(id)a4;
- (void)registerObserverForHubLanguageChanges:(id)a3;
- (void)subscribeToSettingsForPendingEndpoints;
- (void)unregisterObserverForHubLanguageChanges:(id)a3;
@end

@implementation ADRemoraHomeKitSettingsManager

- (ADRemoraHomeKitSettingsManager)initWithDataSource:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___ADRemoraHomeKitSettingsManager;
  v9 = -[ADRemoraHomeKitSettingsManager init](&v42, "init");
  if (v9)
  {
    id v41 = v7;
    v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[ADRemoraHomeKitSettingsManager initWithDataSource:home:]";
      __int16 v48 = 2112;
      id v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s homeID = %@", buf, 0x16u);
    }

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.siricore.hksettings", 0LL);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    id v40 = v8;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    instances = v9->_instances;
    v9->_instances = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    preferencesBundles = v9->_preferencesBundles;
    v9->_preferencesBundles = v15;

    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v9->_currentHome, a4);
    v45[0] = @"root.siri.allowHeySiri";
    v45[1] = @"root.siri.allowJustSiri";
    v45[2] = @"root.siri.tapToAccess";
    v45[3] = @"root.siri.soundAlert";
    v45[4] = @"root.siri.language";
    v45[5] = @"root.general.analytics.shareSiriAnalytics";
    v45[6] = @"root.airPlay.airPlayEnabled";
    v45[7] = @"root.music.allowExplicitContent";
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 8LL));
    keyPaths = v9->_keyPaths;
    v9->_keyPaths = (NSArray *)v17;

    v43[0] = @"root.siri.allowHeySiri";
    v19 = NSStringFromSelector("_setAllowHeySiriSetting:forInstanceContext:");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v44[0] = v20;
    v43[1] = @"root.siri.allowJustSiri";
    v21 = NSStringFromSelector("_setAllowJustSiriSetting:forInstanceContext:");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v44[1] = v22;
    v43[2] = @"root.siri.tapToAccess";
    v23 = NSStringFromSelector("_setTapToAccessSetting:forInstanceContext:");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v44[2] = v24;
    v43[3] = @"root.siri.soundAlert";
    v25 = NSStringFromSelector("_setSoundAlertSetting:forInstanceContext:");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v44[3] = v26;
    v43[4] = @"root.siri.language";
    v27 = NSStringFromSelector("_setSiriLanguageSetting:forInstanceContext:");
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v44[4] = v28;
    v43[5] = @"root.general.analytics.shareSiriAnalytics";
    v29 = NSStringFromSelector("_setShareSiriAnalyticsSetting:forInstanceContext:");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v44[5] = v30;
    v43[6] = @"root.airPlay.airPlayEnabled";
    v31 = NSStringFromSelector("_setMediaPlaybackEnabledSetting:forInstanceContext:");
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v44[6] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  7LL));
    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v33));
    modifierMethodMap = v9->_modifierMethodMap;
    v9->_modifierMethodMap = (NSMutableDictionary *)v34;

    id v8 = v40;
    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    pendingInstanceContexts = v9->_pendingInstanceContexts;
    v9->_pendingInstanceContexts = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreHomeHubManager sharedManager](&OBJC_CLASS___SiriCoreHomeHubManager, "sharedManager"));
    [v38 registerObserverForEndpointLifeCycleChanges:v9];

    -[HMAccessorySettingsDataSource setDelegate:](v9->_dataSource, "setDelegate:", v9);
    id v7 = v41;
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreHomeHubManager sharedManager](&OBJC_CLASS___SiriCoreHomeHubManager, "sharedManager"));
  [v3 unregisterObserverForEndpointLifeCycleChanges:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADRemoraHomeKitSettingsManager;
  -[ADRemoraHomeKitSettingsManager dealloc](&v4, "dealloc");
}

- (void)subscribeToSettingsForPendingEndpoints
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ADRemoraHomeKitSettingsManager subscribeToSettingsForPendingEndpoints]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100211D04;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[ADRemoraHomeKitSettingsManager homehubManager:didActivateEndpointWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100211CF8;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[ADRemoraHomeKitSettingsManager homehubManager:didDeactivateEndpointWithContext:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100211ACC;
  v9[3] = &unk_1004FD968;
  id v10 = v5;
  dispatch_queue_t v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)homehubManager:(id)a3 didReceiveLaunchNotificationForEndpointUUID:(id)a4
{
  id v5 = a4;
  v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[ADRemoraHomeKitSettingsManager homehubManager:didReceiveLaunchNotificationForEndpointUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100211ABC;
  v9[3] = &unk_1004FD968;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
    *(_DWORD *)buf = 136315651;
    v20 = "-[ADRemoraHomeKitSettingsManager accessorySettingsDataSource:didReceiveSettingsUpdatesForAccessoryWithIdentifier:settings:]";
    __int16 v21 = 2113;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s accessory:%{private}@\tnew settings:%@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100211AAC;
  block[3] = &unk_1004FD4C0;
  block[4] = self;
  id v17 = v8;
  id v18 = v7;
  id v14 = v7;
  id v15 = v8;
  dispatch_async(queue, block);
}

- (void)_fetchSettingsForKeyPaths:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADRemoraHomeKitSettingsManager _fetchSettingsForKeyPaths:endpointID:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s accessoryID:%@", buf, 0x16u);
  }

  dataSource = self->_dataSource;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uniqueIdentifier](self->_currentHome, "uniqueIdentifier"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100211934;
  v12[3] = &unk_1004F6A90;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  -[HMAccessorySettingsDataSource fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:]( dataSource,  "fetchAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:completionHandler:",  v10,  v11,  v6,  v12);
}

- (void)_handleSettings:(id)a3 forAccessoryIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_instances, "objectForKey:", v7));
  if (v8)
  {
    id v23 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_preferencesBundles, "objectForKey:", v7));

    if (!v9)
    {
      preferencesBundles = self->_preferencesBundles;
      id v11 = -[AFPreferences initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___AFPreferences),  "initWithInstanceContext:",  v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8 endpointUUID]);
      -[NSMutableDictionary setObject:forKey:](preferencesBundles, "setObject:forKey:", v11, v12);
    }

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v24 = v6;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 keyPath]);
          v20 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_modifierMethodMap, "objectForKey:", v19));
          SEL v21 = NSSelectorFromString(v20);

          if ((objc_opt_respondsToSelector(self, v21) & 1) != 0) {
            ((void (*)(ADRemoraHomeKitSettingsManager *, SEL, void *, void *))-[ADRemoraHomeKitSettingsManager methodForSelector:]( self,  "methodForSelector:",  v21))( self,  v21,  v18,  v8);
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }

      while (v15);
    }

    id v7 = v23;
    id v6 = v24;
  }

  else
  {
    v22 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ADRemoraHomeKitSettingsManager _handleSettings:forAccessoryIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s accessory not hosted on this hub", buf, 0xCu);
    }
  }
}

- (void)_subscribeToSettingsForInstanceContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 endpointUUID]);
  -[NSMutableDictionary setObject:forKey:](self->_instances, "setObject:forKey:", v4, v5);
  id v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[ADRemoraHomeKitSettingsManager _subscribeToSettingsForInstanceContext:]";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s endpointID:%@\taccessoryID:%@", buf, 0x20u);
  }

  if (v5)
  {
    dataSource = self->_dataSource;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HMHome uniqueIdentifier](self->_currentHome, "uniqueIdentifier"));
    keyPaths = self->_keyPaths;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100211540;
    v11[3] = &unk_1004F7328;
    id v12 = v4;
    id v13 = self;
    id v14 = v5;
    -[HMAccessorySettingsDataSource subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:]( dataSource,  "subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:",  v8,  v14,  keyPaths,  0LL,  v11);
  }

  else
  {
    id v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[ADRemoraHomeKitSettingsManager _subscribeToSettingsForInstanceContext:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Endpoint does not currently exist in HomeKit object graph, add %@ to pending list for later.",  buf,  0x16u);
    }

    -[NSMutableSet addObject:](self->_pendingInstanceContexts, "addObject:", v4);
  }
}

- (void)_setAllowHeySiriSetting:(id)a3 forInstanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    *(_DWORD *)buf = 136315394;
    SEL v21 = "-[ADRemoraHomeKitSettingsManager _setAllowHeySiriSetting:forInstanceContext:]";
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  id v11 = [v6 BOOLValue];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  [v12 setVoiceTriggerEnabled:v11 sender:self endpointId:v13];

  preferencesBundles = self->_preferencesBundles;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](preferencesBundles, "objectForKey:", v15));

  if ((_DWORD)v11)
  {
    [v16 setAssistantIsEnabled:1];
  }

  else
  {
    __int16 v19 = @"root.siri.tapToAccess";
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
    -[ADRemoraHomeKitSettingsManager _fetchSettingsForKeyPaths:endpointID:]( self,  "_fetchSettingsForKeyPaths:endpointID:",  v17,  v18);
  }
}

- (void)_setAllowJustSiriSetting:(id)a3 forInstanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    int v18 = 136315394;
    __int16 v19 = "-[ADRemoraHomeKitSettingsManager _setAllowJustSiriSetting:forInstanceContext:]";
    __int16 v20 = 2112;
    SEL v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v18, 0x16u);
  }

  unsigned int v11 = [v6 BOOLValue];
  preferencesBundles = self->_preferencesBundles;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](preferencesBundles, "objectForKey:", v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  id v17 = [v15 setUserPreferredVoiceTriggerPhraseType:v11 sender:self deviceType:2 endpointId:v16];
}

- (void)_setTapToAccessSetting:(id)a3 forInstanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    int v17 = 136315394;
    int v18 = "-[ADRemoraHomeKitSettingsManager _setTapToAccessSetting:forInstanceContext:]";
    __int16 v19 = 2112;
    __int16 v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v17, 0x16u);
  }

  unsigned int v11 = [v6 BOOLValue];
  preferencesBundles = self->_preferencesBundles;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](preferencesBundles, "objectForKey:", v13));

  if (v11)
  {
    [v14 setAssistantIsEnabled:1];
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
    objc_msgSend(v14, "setAssistantIsEnabled:", objc_msgSend(v15, "voiceTriggerEnabledForEndpointId:", v16));
  }
}

- (void)_setSoundAlertSetting:(id)a3 forInstanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    int v15 = 136315394;
    uint64_t v16 = "-[ADRemoraHomeKitSettingsManager _setSoundAlertSetting:forInstanceContext:]";
    __int16 v17 = 2112;
    int v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  id v11 = [v6 BOOLValue];
  preferencesBundles = self->_preferencesBundles;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](preferencesBundles, "objectForKey:", v13));

  [v14 setStartAlertEnabled:v11];
}

- (void)_setSiriLanguageSetting:(id)a3 forInstanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
    *(_DWORD *)buf = 136315650;
    v51 = "-[ADRemoraHomeKitSettingsManager _setSiriLanguageSetting:forInstanceContext:]";
    __int16 v52 = 2112;
    v53 = v10;
    __int16 v54 = 2112;
    v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s settings = %@, endpointUUID = %@", buf, 0x20u);
  }

  v45 = v6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 languageValue]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 inputLanguageCode]);
  id v14 = (void *)v13;
  if (v13) {
    int v15 = (__CFString *)v13;
  }
  else {
    int v15 = &stru_1004FECA0;
  }
  uint64_t v16 = v15;

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v12 outputVoiceLanguageCode]);
  int v18 = (void *)v17;
  if (v17) {
    __int16 v19 = (__CFString *)v17;
  }
  else {
    __int16 v19 = &stru_1004FECA0;
  }
  v46 = v19;

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v12 outputVoiceGenderCode]);
  SEL v21 = (void *)v20;
  if (v20) {
    __int16 v22 = (__CFString *)v20;
  }
  else {
    __int16 v22 = &stru_1004FECA0;
  }
  id v23 = v22;

  preferencesBundles = self->_preferencesBundles;
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](preferencesBundles, "objectForKey:", v25));

  __int128 v26 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[ADRemoraHomeKitSettingsManager _setSiriLanguageSetting:forInstanceContext:]";
    __int16 v52 = 2112;
    v53 = v47;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s selectedPreferenceBundle = %@", buf, 0x16u);
  }

  if ((-[__CFString isEqualToString:](v23, "isEqualToString:", @"f") & 1) != 0)
  {
    uint64_t v27 = 2LL;
    __int128 v28 = v46;
  }

  else
  {
    __int128 v28 = v46;
    if ((-[__CFString isEqualToString:](v23, "isEqualToString:", @"m") & 1) != 0)
    {
      uint64_t v27 = 1LL;
    }

    else if (-[__CFString isEqualToString:](v23, "isEqualToString:", @"n"))
    {
      uint64_t v27 = 3LL;
    }

    else
    {
      uint64_t v27 = 0LL;
    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v12 voiceName]);
  v30 = v29;
  v43 = v23;
  if (v29)
  {
    id v31 = v29;
  }

  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[AFLocalization sharedInstance](&OBJC_CLASS___AFLocalization, "sharedInstance", v23));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 voiceNamesForOutputLanguageCode:v28 gender:v27]);
    uint64_t v34 = self;
    v35 = v33;
    id v31 = (id)objc_claimAutoreleasedReturnValue([v33 firstObject]);

    self = v34;
    __int128 v28 = v46;
  }

  v36 = -[AFVoiceInfo initWithLanguageCode:gender:name:footprint:isCustom:]( objc_alloc(&OBJC_CLASS___AFVoiceInfo),  "initWithLanguageCode:gender:name:footprint:isCustom:",  v28,  v27,  v31,  2LL,  0LL);
  [v47 setLanguageCode:v16 outputVoice:v36];
  v37 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  v38 = self;
  -[ADRemoraHomeKitSettingsManager notifyObserversOfLanguageChangeForEndpoint:incomingLanguageCode:]( self,  "notifyObserversOfLanguageChangeForEndpoint:incomingLanguageCode:",  v37,  v16);

  v39 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v51 = "-[ADRemoraHomeKitSettingsManager _setSiriLanguageSetting:forInstanceContext:]";
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%s Post notification for settings language change",  buf,  0xCu);
  }

  id v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", v43));
  v48[0] = @"accessoryUniqueIdentifier";
  id v41 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  v48[1] = @"siriInputLanguage";
  v49[0] = v41;
  v49[1] = v16;
  objc_super v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  2LL));
  [v40 postNotificationName:@"RemoraHomeKitSettingsLanguageChangeNotification" object:v38 userInfo:v42];
}

- (void)_setShareSiriAnalyticsSetting:(id)a3 forInstanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    int v16 = 136315394;
    uint64_t v17 = "-[ADRemoraHomeKitSettingsManager _setShareSiriAnalyticsSetting:forInstanceContext:]";
    __int16 v18 = 2112;
    __int16 v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v16, 0x16u);
  }

  unsigned int v11 = [v6 BOOLValue];
  preferencesBundles = self->_preferencesBundles;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](preferencesBundles, "objectForKey:", v13));

  if (v11) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = 2LL;
  }
  [v14 setSiriDataSharingOptInStatus:v15 propagateToHomeAccessories:0 source:4 reason:0 completion:0];
}

- (void)_setMediaPlaybackEnabledSetting:(id)a3 forInstanceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    int v15 = 136315394;
    int v16 = "-[ADRemoraHomeKitSettingsManager _setMediaPlaybackEnabledSetting:forInstanceContext:]";
    __int16 v17 = 2112;
    __int16 v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v15, 0x16u);
  }

  id v11 = [v6 BOOLValue];
  preferencesBundles = self->_preferencesBundles;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](preferencesBundles, "objectForKey:", v13));

  [v14 setMediaPlaybackEnabled:v11];
}

- (void)registerObserverForHubLanguageChanges:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADRemoraHomeKitSettingsManager registerObserverForHubLanguageChanges:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Registering new observer for language changes",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002114F0;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)unregisterObserverForHubLanguageChanges:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADRemoraHomeKitSettingsManager unregisterObserverForHubLanguageChanges:]";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Unregistering new observer for language changes",  buf,  0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002114D4;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)notifyObserversOfLanguageChangeForEndpoint:(id)a3 incomingLanguageCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    SEL v21 = "-[ADRemoraHomeKitSettingsManager notifyObserversOfLanguageChangeForEndpoint:incomingLanguageCode:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Notifying observers language settings changed",  buf,  0xCu);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = self->_observers;
  id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
      }

      id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v11);
  }
}

- (void).cxx_destruct
{
}

+ (void)setAllowHeySiriHomeKitSettingForAccessory:(id)a3 forHomeId:(id)a4 homeManager:(id)a5 value:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [[HMSettingBooleanValue alloc] initWithBoolValue:v8];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 createAccessorySettingsController]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100212590;
  v20[3] = &unk_1004F6AB8;
  BOOL v24 = v8;
  id v21 = v11;
  id v22 = v12;
  id v23 = v14;
  id v17 = v14;
  id v18 = v12;
  id v19 = v11;
  [v16 updateAccessorySettingWithHomeIdentifier:v18 accessoryIdentifier:v19 keyPath:@"root.siri.allowHeySiri" settingValue:v15 completionHandler:v20];
}

+ (void)getSiriTTSVolumeForAccessory:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, float))a4;
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    id v23 = "+[ADRemoraHomeKitSettingsManager getSiriTTSVolumeForAccessory:completion:]";
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Fetching volume for accessory=%@",  (uint8_t *)&v22,  0x16u);
  }

  if (v6)
  {
    if (v5)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaProfile]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaSession]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 audioControl]);
      [v10 volume];
      float v12 = v11;

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaProfile]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mediaSession]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 audioControl]);

      if (v15)
      {
        __int128 v16 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v22 = 136315650;
          id v23 = "+[ADRemoraHomeKitSettingsManager getSiriTTSVolumeForAccessory:completion:]";
          __int16 v24 = 2112;
          id v25 = v5;
          __int16 v26 = 2048;
          double v27 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s The current volume of the accessory=%@ is at %f",  (uint8_t *)&v22,  0x20u);
        }

        v6[2](v6, 0LL, v12);
        goto LABEL_16;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  47LL,  @"Error fetching volume for accessory"));
      uint64_t v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        id v23 = "+[ADRemoraHomeKitSettingsManager getSiriTTSVolumeForAccessory:completion:]";
        __int16 v24 = 2112;
        id v25 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Error=%@", (uint8_t *)&v22, 0x16u);
      }

      v21.n128_f32[0] = v12;
      ((void (*)(void (**)(id, void, float), void *, __n128))v6[2])(v6, v17, v21);
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  31LL,  @"input parameter 'accessory' is nil"));
      id v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315394;
        id v23 = "+[ADRemoraHomeKitSettingsManager getSiriTTSVolumeForAccessory:completion:]";
        __int16 v24 = 2112;
        id v25 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Error=%@", (uint8_t *)&v22, 0x16u);
      }

      v19.n128_u32[0] = 0;
      ((void (*)(void (**)(id, void, float), void *, __n128))v6[2])(v6, v17, v19);
    }
  }

+ (void)setSiriTTSVolumeForAccessory:(id)a3 to:(float)a4 completion:(id)a5
{
  double v7 = COERCE_DOUBLE(a3);
  BOOL v8 = (void (**)(id, void *))a5;
  id v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v31 = "+[ADRemoraHomeKitSettingsManager setSiriTTSVolumeForAccessory:to:completion:]";
    __int16 v32 = 2112;
    double v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Updating volume for accessory=%@", buf, 0x16u);
  }

  if (v7 == 0.0)
  {
    double v24 = COERCE_DOUBLE( objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  31LL,  @"input parameter 'accessory' is nil")));
    id v25 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v31 = "+[ADRemoraHomeKitSettingsManager setSiriTTSVolumeForAccessory:to:completion:]";
      __int16 v32 = 2112;
      double v33 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Error=%@", buf, 0x16u);
      if (!v8) {
        goto LABEL_10;
      }
    }

    else if (!v8)
    {
      goto LABEL_10;
    }

    v8[2](v8, *(void **)&v24);
    goto LABEL_10;
  }

  id v10 = objc_alloc(&OBJC_CLASS___AFOneArgumentSafetyBlock);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100212570;
  v28[3] = &unk_1004FCC00;
  *(double *)&v29 = COERCE_DOUBLE(v8);
  float v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 40LL));
  id v12 = [v10 initWithBlock:v28 defaultValue:v11];

  LODWORD(v13) = 1045220557;
  LODWORD(v14) = 1061997773;
  *(float *)&double v15 = a4;
  +[ADRemoraHomeKitSettingsManager boundSiriTTSVolume:minValue:maxValue:]( &OBJC_CLASS___ADRemoraHomeKitSettingsManager,  "boundSiriTTSVolume:minValue:maxValue:",  v15,  v13,  v14);
  float v17 = v16;
  id v18 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v31 = "+[ADRemoraHomeKitSettingsManager setSiriTTSVolumeForAccessory:to:completion:]";
    __int16 v32 = 2048;
    double v33 = a4;
    __int16 v34 = 2112;
    double v35 = v7;
    __int16 v36 = 2048;
    double v37 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s The requested volume is %f. The accessory %@ will be set to bounded volume %f",  buf,  0x2Au);
  }

  __n128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v7 mediaProfile]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 mediaSession]);
  __n128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 audioControl]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100212584;
  v26[3] = &unk_1004FBD90;
  id v27 = v12;
  id v22 = v12;
  *(float *)&double v23 = v17;
  [v21 updateVolume:v26 completionHandler:v23];

  double v24 = *(double *)&v29;
LABEL_10:
}

+ (float)boundSiriTTSVolume:(float)a3 minValue:(float)a4 maxValue:(float)a5
{
  return fmaxf(a4, fminf(a5, a3));
}

@end