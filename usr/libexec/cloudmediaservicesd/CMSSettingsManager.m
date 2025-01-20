@interface CMSSettingsManager
+ (BOOL)explicitContentSettingForAccessoryID:(id)a3;
+ (BOOL)listeningHistorySettingForAccessory;
+ (BOOL)listeningHistorySettingForService:(id)a3 user:(id)a4;
+ (NSArray)homeKitSettingsKeyPath;
+ (id)sharedManager;
- (BOOL)explicitContentSettingForUser:(id)a3;
- (BOOL)updateListeningHistorySettingForUser:(id)a3 accessoryID:(id)a4;
- (CMSHomeManager)homeManager;
- (CMSMediaServiceChangedDelegate)serviceChangedDelegate;
- (CMSSettingsManager)init;
- (MediaServiceConfiguration)serviceConfig;
- (id)_settingsObject:(BOOL)a3;
- (void)_cleanupLegacySettings;
- (void)_initializeHomePodPlaybackConstraints;
- (void)_settingsInfoFromHMSettings:(id)a3 homeSettings:(id)a4;
- (void)_updateCachedData:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)homeManager:(id)a3 didAddSiriEndpoint:(id)a4 withSettings:(id)a5;
- (void)homeManager:(id)a3 didRemoveSiriEndpoint:(id)a4;
- (void)homeManager:(id)a3 didUpdateHomeAccessorySetting:(id)a4;
- (void)homeManager:(id)a3 didUpdateSettings:(id)a4 siriEndpoint:(id)a5;
- (void)homeManagerDidLoadHomes:(id)a3;
- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4;
- (void)setHomeManager:(id)a3;
- (void)setServiceChangedDelegate:(id)a3;
- (void)setServiceConfig:(id)a3;
- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4;
@end

@implementation CMSSettingsManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000744C;
  block[3] = &unk_10001C540;
  block[4] = a1;
  if (qword_100024440 != -1) {
    dispatch_once(&qword_100024440, block);
  }
  return (id)qword_100024448;
}

- (CMSSettingsManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CMSSettingsManager;
  v2 = -[CMSSettingsManager init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = _CMSQLoggingFacility(v2);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CMSSettingsManager init]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[MediaServiceConfiguration sharedInstance](&OBJC_CLASS___MediaServiceConfiguration, "sharedInstance"));
    serviceConfig = v3->_serviceConfig;
    v3->_serviceConfig = (MediaServiceConfiguration *)v6;

    -[MediaServiceConfiguration setDelegate:](v3->_serviceConfig, "setDelegate:", v3);
    if (+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled"))
    {
      -[CMSSettingsManager _cleanupLegacySettings](v3, "_cleanupLegacySettings");
    }

    else
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[CMSHomeManager sharedManager](&OBJC_CLASS___CMSHomeManager, "sharedManager"));
      homeManager = v3->_homeManager;
      v3->_homeManager = (CMSHomeManager *)v8;

      -[CMSHomeManager setDelegate:](v3->_homeManager, "setDelegate:", v3);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
      v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000760C;
      block[3] = &unk_10001C890;
      v14 = v3;
      dispatch_async(v11, block);
    }
  }

  return v3;
}

+ (BOOL)listeningHistorySettingForService:(id)a3 user:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForDefault:v5]);

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v9));
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v7]);
      v13 = v12;
      if (v12)
      {
        unsigned __int8 v14 = [v12 updateListeningHistory];
      }

      else
      {
        uint64_t v16 = _CMSQLoggingFacility(0LL);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10000F8CC((uint64_t)v5, v17, v18, v19, v20, v21, v22, v23);
        }

        unsigned __int8 v14 = 0;
      }
    }

    else
    {
      unsigned __int8 v14 = 0;
    }
  }

  else
  {
    uint64_t v15 = _CMSQLoggingFacility(v6);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000F930();
    }
    unsigned __int8 v14 = 0;
  }

  return v14;
}

+ (BOOL)listeningHistorySettingForAccessory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForDefault:kUpdateListeningHistoryHomeKitSettingDefaultsKey]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)explicitContentSettingForAccessoryID:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForDefault:@"SiriEndpointSettings"]);

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v6));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

    unsigned __int8 v10 = [v9 allowExplicitContent];
    id v5 = (void *)v6;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForDefault:kAllowExplicitContentHomeKitSettingDefaultsKey]);
    unsigned __int8 v10 = [v9 BOOLValue];
  }

  return v10;
}

+ (NSArray)homeKitSettingsKeyPath
{
  uint64_t v3 = allowExplicitContentSettingsKeyPath;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v3,  1LL));
}

- (BOOL)explicitContentSettingForUser:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSHomeSettingsProvider settingsProvider](&OBJC_CLASS___MSHomeSettingsProvider, "settingsProvider"));
  unsigned __int8 v5 = [v4 allowExplicitContent:v3];

  return v5;
}

- (BOOL)updateListeningHistorySettingForUser:(id)a3 accessoryID:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSHomeSettingsProvider settingsProvider](&OBJC_CLASS___MSHomeSettingsProvider, "settingsProvider"));
  unsigned __int8 v8 = [v7 updateListeningHistoryForUser:v6 accessory:v5];

  return v8;
}

- (void)_initializeHomePodPlaybackConstraints
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CMSHomeManager getCurrentAccessory](self->_homeManager, "getCurrentAccessory"));
  uint64_t v4 = _CMSQLoggingFacility(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Fetched CurrentAccessory %@",  (uint8_t *)&v15,  0xCu);
  }

  if (v3)
  {
    homeManager = self->_homeManager;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 settings]);
    -[CMSSettingsManager homeManager:didUpdateHomeAccessorySetting:]( self,  "homeManager:didUpdateHomeAccessorySetting:",  homeManager,  v7);
LABEL_5:

    goto LABEL_9;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  uint64_t v9 = kUpdateListeningHistoryHomeKitSettingDefaultsKey;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForDefault:kUpdateListeningHistoryHomeKitSettingDefaultsKey]);

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    [v11 setObject:&__kCFBooleanTrue forDefault:v9];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  uint64_t v13 = kAllowExplicitContentHomeKitSettingDefaultsKey;
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForDefault:kAllowExplicitContentHomeKitSettingDefaultsKey]);

  if (!v14)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    [v7 setObject:&__kCFBooleanTrue forDefault:v13];
    goto LABEL_5;
  }

- (void)_cleanupLegacySettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  [v2 removeDefaultForKey:kAllowExplicitContentHomeKitSettingDefaultsKey];

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  [v3 removeDefaultForKey:kUpdateListeningHistoryHomeKitSettingDefaultsKey];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  [v4 removeDefaultForKey:@"SiriEndpointSettings"];
}

- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
  int v9 = (int)v8;
  uint64_t v10 = _CMSQLoggingFacility(v8);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "HomeSidekickSettings feature enabled, skipping settings update",  buf,  2u);
    }

    goto LABEL_23;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    *(_DWORD *)buf = 136315650;
    v45 = "-[CMSSettingsManager serviceSettingDidUpdate:homeUserID:]";
    __int16 v46 = 2112;
    id v47 = v7;
    __int16 v48 = 2112;
    v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s user: %@ service: %@", buf, 0x20u);
  }

  if (v6 && v7)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceID]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 objectForDefault:v17]);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v12));
    id v19 = [v18 mutableCopy];

    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v20]);

      if (v21)
      {
        unsigned int v22 = [v21 updateListeningHistory];
        id v23 = [v6 updateListeningHistoryEnabled];
        if (v22 == (_DWORD)v23)
        {
          uint64_t v41 = _CMSQLoggingFacility(v23);
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "ULH value did not change, skipping update",  buf,  2u);
          }

          goto LABEL_22;
        }

        objc_msgSend(v21, "setUpdateListeningHistory:", objc_msgSend(v6, "updateListeningHistoryEnabled"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
        [v19 setObject:v21 forKey:v24];

        uint64_t v26 = _CMSQLoggingFacility(v25);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (char *)objc_claimAutoreleasedReturnValue([v6 serviceID]);
          *(_DWORD *)buf = 138412546;
          v45 = v28;
          __int16 v46 = 2112;
          id v47 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Updating cached value for %@ to %@",  buf,  0x16u);
        }
      }

      else
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[CMSSettingsManager _settingsObject:]( self,  "_settingsObject:",  [v6 updateListeningHistoryEnabled]));
        v38 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
        [v19 setObject:v21 forKey:v38];

        uint64_t v40 = _CMSQLoggingFacility(v39);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v45 = (const char *)v7;
          __int16 v46 = 2112;
          id v47 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "ULH value not cached for user (%@) earlier, adding entry %@",  buf,  0x16u);
        }
      }

      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceID]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 UUIDString]);
      -[os_log_s setObject:forDefault:requiresCoding:](v31, "setObject:forDefault:requiresCoding:", v19, v36, 1LL);
    }

    else
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[CMSSettingsManager _settingsObject:]( self,  "_settingsObject:",  [v6 updateListeningHistoryEnabled]));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      v42 = v30;
      v43 = v21;
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));

      uint64_t v33 = _CMSQLoggingFacility(v32);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = (const char *)v31;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Updating initial value of listening history %@",  buf,  0xCu);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceID]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 UUIDString]);
      [v35 setObject:v31 forDefault:v37 requiresCoding:1];
    }

LABEL_22:
    goto LABEL_23;
  }

  uint64_t v29 = _CMSQLoggingFacility(v14);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10000F95C();
  }
LABEL_23:
}

- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CMSQLoggingFacility(v7);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    int v27 = 136315650;
    v28 = "-[CMSSettingsManager userDidRemoveService:homeUserID:]";
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2112;
    uint64_t v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s user %@ removed service %@",  (uint8_t *)&v27,  0x20u);
  }

  if ((+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceID]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForDefault:v12]);

    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v14));
    id v16 = [v15 mutableCopy];

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      [v16 removeObjectForKey:v17];

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);
      id v19 = [v18 count];

      if (v19)
      {
        uint64_t v21 = _CMSQLoggingFacility(v20);
        unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412290;
          v28 = (const char *)v16;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Updating cached value %@",  (uint8_t *)&v27,  0xCu);
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
        [v23 setObject:v16 forDefault:v12 requiresCoding:1];
      }

      else
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
        [v23 removeDefaultForKey:v12];
      }
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CMSSettingsManager serviceChangedDelegate](self, "serviceChangedDelegate"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[CMSSettingsManager serviceChangedDelegate](self, "serviceChangedDelegate"));
  char v26 = objc_opt_respondsToSelector(v25, "settingsManager:didRemoveService:forUser:");

  if ((v26 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CMSSettingsManager serviceChangedDelegate](self, "serviceChangedDelegate"));
    [v24 settingsManager:self didRemoveService:v6 forUser:v7];
LABEL_15:
  }
}

- (void)connectionInterrupted
{
  uint64_t v3 = _CMSQLoggingFacility(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Connection mediasetupd interrupted", v5, 2u);
  }

  -[MediaServiceConfiguration setDelegate:](self->_serviceConfig, "setDelegate:", self);
}

- (void)connectionInvalidated
{
  uint64_t v3 = _CMSQLoggingFacility(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Connection mediasetupd invalidated", v5, 2u);
  }

  -[MediaServiceConfiguration setDelegate:](self->_serviceConfig, "setDelegate:", self);
}

- (id)_settingsObject:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CMSServiceSetting);
  [v4 setUpdateListeningHistory:v3];
  return v4;
}

- (void)homeManager:(id)a3 didUpdateHomeAccessorySetting:(id)a4
{
  id v4 = a4;
  id v5 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
  if (!(_DWORD)v5)
  {
    id v8 = [v4 isAllowExplicitContentEnabled];
    id v9 = [v4 isUpdateListeningHistoryEnabled];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    uint64_t v11 = kAllowExplicitContentHomeKitSettingDefaultsKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForDefault:kAllowExplicitContentHomeKitSettingDefaultsKey]);

    if (v7)
    {
      id v13 = [v7 BOOLValue];
      int v14 = (int)v13;
      uint64_t v15 = _CMSQLoggingFacility(v13);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      v17 = v16;
      if ((_DWORD)v8 == v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v33) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Explicit content setting did not change, skipping update",  (uint8_t *)&v33,  2u);
        }

- (void)homeManagerDidLoadHomes:(id)a3
{
  id v3 = a3;
  id v4 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
  int v5 = (int)v4;
  uint64_t v6 = _CMSQLoggingFacility(v4);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "HomeSidekickSettings feature enabled, skipping home update",  buf,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v26 = "-[CMSSettingsManager homeManagerDidLoadHomes:]";
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s homeManager: %@", buf, 0x16u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSHomeHubManager shared](&OBJC_CLASS___MSHomeHubManager, "shared"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 activeEndpoints]);

    if (v8 && -[os_log_s count](v8, "count"))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s na_map:](v8, "na_map:", &stru_10001C8D0));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForDefault:@"SiriEndpointSettings"]);

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v12));
      id v14 = [v13 mutableCopy];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
      id v16 = [v15 mutableCopy];

      [v16 removeObjectsInArray:v10];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100008BD0;
      v23[3] = &unk_10001C8F8;
      id v17 = v14;
      id v24 = v17;
      [v16 enumerateObjectsUsingBlock:v23];
      id v18 = [v13 isEqualToDictionary:v17];
      int v19 = (int)v18;
      uint64_t v20 = _CMSQLoggingFacility(v18);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Siri endpoint settings did not change, skipping update",  buf,  2u);
        }
      }

      else
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          int v26 = (const char *)v17;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Updating value of siri endpoint settings %@",  buf,  0xCu);
        }

        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
        -[os_log_s setObject:forDefault:requiresCoding:]( v21,  "setObject:forDefault:requiresCoding:",  v17,  @"SiriEndpointSettings",  1LL);
      }
    }
  }
}

- (void)homeManager:(id)a3 didAddSiriEndpoint:(id)a4 withSettings:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
  if ((_DWORD)v9)
  {
    uint64_t v10 = _CMSQLoggingFacility(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v42) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "HomeSidekickSettings feature enabled, skipping settings update",  (uint8_t *)&v42,  2u);
    }
  }

  else if (v7)
  {
    if (v8 && (id v9 = [v8 count]) != 0)
    {
      uint64_t v11 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___CMSServiceSetting);
      -[CMSSettingsManager _settingsInfoFromHMSettings:homeSettings:]( self,  "_settingsInfoFromHMSettings:homeSettings:",  v11,  v8);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForDefault:@"SiriEndpointSettings"]);

      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v13));
      uint64_t v15 = (NSMutableDictionary *)[v14 mutableCopy];

      if (!v15
        || (id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v15, "allKeys")),
            id v17 = [v16 count],
            v16,
            !v17))
      {
        id v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);

        uint64_t v15 = v18;
      }

      int v19 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v15, "objectForKey:", v19));

      id v21 = [v20 isEqual:v11];
      if ((_DWORD)v21)
      {
        uint64_t v22 = _CMSQLoggingFacility(v21);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v42 = 138412290;
          id v43 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "SiriEndpoint Accessory %@ setting did not change, skipping update",  (uint8_t *)&v42,  0xCu);
        }
      }

      else
      {
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
        -[NSMutableDictionary na_safeSetObject:forKey:](v15, "na_safeSetObject:forKey:", v11, v40);

        id v41 = -[NSMutableDictionary copy](v15, "copy");
        -[CMSSettingsManager _updateCachedData:](self, "_updateCachedData:", v41);
      }
    }

    else
    {
      uint64_t v24 = _CMSQLoggingFacility(v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000F9F8(v11, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }

  else
  {
    uint64_t v32 = _CMSQLoggingFacility(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000F988(v11, v33, v34, v35, v36, v37, v38, v39);
    }
  }
}

- (void)homeManager:(id)a3 didUpdateSettings:(id)a4 siriEndpoint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
  if ((_DWORD)v11)
  {
    uint64_t v12 = _CMSQLoggingFacility(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "HomeSidekickSettings feature enabled, skipping settings update",  buf,  2u);
    }
  }

  else if (v10)
  {
    if (v9 && (id v11 = [v9 count]) != 0)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 objectForDefault:@"SiriEndpointSettings"]);

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v13));
      id v16 = (NSMutableDictionary *)[v15 mutableCopy];

      if (!v16
        || (id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v16, "allKeys")),
            id v18 = [v17 count],
            v17,
            !v18))
      {
        int v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);

        id v16 = v19;
      }

      *(void *)buf = 0LL;
      v50 = buf;
      uint64_t v51 = 0x3032000000LL;
      v52 = sub_1000091D0;
      v53 = sub_1000091E0;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
      id v54 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v16, "objectForKey:", v20));

      uint64_t v22 = *((void *)v50 + 5);
      if (v22)
      {
        -[CMSSettingsManager _settingsInfoFromHMSettings:homeSettings:]( self,  "_settingsInfoFromHMSettings:homeSettings:",  v22,  v9);
        uint64_t v23 = *((void *)v50 + 5);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
        -[NSMutableDictionary na_safeSetObject:forKey:](v16, "na_safeSetObject:forKey:", v23, v24);

        id v25 = -[NSMutableDictionary copy](v16, "copy");
        -[CMSSettingsManager _updateCachedData:](self, "_updateCachedData:", v25);
      }

      else
      {
        uint64_t v42 = _CMSQLoggingFacility(v21);
        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v48 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Missing initial cached settings, fetching from HomeKit",  v48,  2u);
        }

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_1000091E8;
        v44[3] = &unk_10001C920;
        id v47 = buf;
        v44[4] = self;
        v45 = v16;
        id v46 = v10;
        [v8 fetchEndpointSettings:v46 completion:v44];
      }

      _Block_object_dispose(buf, 8);
    }

    else
    {
      uint64_t v26 = _CMSQLoggingFacility(v11);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10000FAD8(v13, v27, v28, v29, v30, v31, v32, v33);
      }
    }
  }

  else
  {
    uint64_t v34 = _CMSQLoggingFacility(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000FA68(v13, v35, v36, v37, v38, v39, v40, v41);
    }
  }
}

- (void)homeManager:(id)a3 didRemoveSiriEndpoint:(id)a4
{
  id v4 = a4;
  id v5 = +[CMSFeatureStatus isHomeMediaSettingsEnabled](&OBJC_CLASS___CMSFeatureStatus, "isHomeMediaSettingsEnabled");
  if ((_DWORD)v5)
  {
    uint64_t v6 = _CMSQLoggingFacility(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "HomeSidekickSettings feature enabled, skipping endpoint update",  v25,  2u);
    }
  }

  else if (v4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForDefault:@"SiriEndpointSettings"]);

    if (v7)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CMSServiceSetting settingDictionaryFromData:]( &OBJC_CLASS___CMSServiceSetting,  "settingDictionaryFromData:",  v7));
      id v10 = [v9 mutableCopy];

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      unsigned int v13 = [v11 containsObject:v12];

      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
        [v10 removeObjectForKey:v14];
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
      id v16 = [v10 copy];
      [v15 setObject:v16 forDefault:@"SiriEndpointSettings" requiresCoding:1];
    }
  }

  else
  {
    uint64_t v17 = _CMSQLoggingFacility(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000FB48(v7, v18, v19, v20, v21, v22, v23, v24);
    }
  }
}

- (void)_settingsInfoFromHMSettings:(id)a3 homeSettings:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000094D8;
  v6[3] = &unk_10001C948;
  id v7 = a3;
  id v5 = v7;
  [a4 enumerateObjectsUsingBlock:v6];
}

- (void)_updateCachedData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _CMSQLoggingFacility(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Updating settings for endpoint accessory %@",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CMSDefaultsManager sharedInstance](&OBJC_CLASS___CMSDefaultsManager, "sharedInstance"));
  [v6 setObject:v3 forDefault:@"SiriEndpointSettings" requiresCoding:1];
}

- (CMSMediaServiceChangedDelegate)serviceChangedDelegate
{
  return (CMSMediaServiceChangedDelegate *)objc_loadWeakRetained((id *)&self->_serviceChangedDelegate);
}

- (void)setServiceChangedDelegate:(id)a3
{
}

- (CMSHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (MediaServiceConfiguration)serviceConfig
{
  return self->_serviceConfig;
}

- (void)setServiceConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end