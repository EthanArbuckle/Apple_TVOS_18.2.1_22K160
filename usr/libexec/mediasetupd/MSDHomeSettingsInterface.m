@interface MSDHomeSettingsInterface
+ (id)shared;
- (BOOL)_cachedSetting:(id)a3 settingsKeyPath:(id)a4 defaultsKey:(id)a5;
- (BOOL)_getAllowExplicitContentSetting:(id)a3;
- (BOOL)_settingDataFromHomeKit:(id)a3 settingKeyPath:(id)a4;
- (BOOL)_updateListeningHistory:(id)a3 accessoryID:(id)a4;
- (BOOL)getAllowiTunesAccountSetting:(id)a3;
- (id)getPrimaryUserIDForAccessoryID:(id)a3;
- (unint64_t)getPrimaryUserSelectionType:(id)a3;
- (void)allowExplicitContent:(id)a3 completion:(id)a4;
- (void)allowiTunesAccount:(id)a3 completion:(id)a4;
- (void)updateListeningHistoryForUser:(id)a3 accessory:(id)a4 completion:(id)a5;
@end

@implementation MSDHomeSettingsInterface

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BBF8;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_100070798 != -1) {
    dispatch_once(&qword_100070798, block);
  }
  return (id)qword_100070790;
}

- (id)getPrimaryUserIDForAccessoryID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Requesting information for siri endpoint %@",  (uint8_t *)&v13,  0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userSettingsDefaults]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"EndpointPrimaryUser"]);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v3]);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userSettingsDefaults]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"AccessoryPrimaryUserHomeUserID"]);
  }

  return v9;
}

- (unint64_t)getPrimaryUserSelectionType:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = sub_10003E9DC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Requesting information for siri endpoint %@",  (uint8_t *)&v11,  0xCu);
    }

    unint64_t v6 = 1LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userSettingsDefaults]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"AccessoryPrimaryUserType"]);
    unint64_t v6 = (unint64_t)[v9 integerValue];
  }

  return v6;
}

- (BOOL)getAllowiTunesAccountSetting:(id)a3
{
  if (a3) {
    return -[MSDHomeSettingsInterface _cachedSetting:settingsKeyPath:defaultsKey:]( self,  "_cachedSetting:settingsKeyPath:defaultsKey:");
  }
  else {
    return 0;
  }
}

- (BOOL)_settingDataFromHomeKit:(id)a3 settingKeyPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentHome]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userWithIdentifier:v5]);
    if ([v6 isEqualToString:allowiTunesAccountSettingsKeyPath])
    {
      unsigned __int8 v10 = objc_msgSend(v9, "ms_allowiTunesAccountInHome:", v8);
    }

    else
    {
      if (![v6 isEqualToString:allowExplicitContentSettingsKeyPath])
      {
        BOOL v11 = 0;
        goto LABEL_9;
      }

      unsigned __int8 v10 = objc_msgSend(v9, "ms_allowExplicitContentInHome:", v8);
    }

    BOOL v11 = v10;
LABEL_9:

    goto LABEL_10;
  }

  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)_cachedSetting:(id)a3 settingsKeyPath:(id)a4 defaultsKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userSettingsDefaults]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v10]);

    if (v13 && [v13 count])
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v14]);

      if (v15)
      {
        LOBYTE(v16) = [v15 BOOLValue];
      }

      else
      {
        id v38 = sub_10003E9DC();
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
          sub_10000C748((uint64_t)v8, (os_log_s *)v16, v39, v40, v41, v42, v43, v44);
        }

        LOBYTE(v16) = 0;
      }
    }

    else
    {
      id v17 = sub_10003E9DC();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10000C6E4((uint64_t)v9, v18, v19, v20, v21, v22, v23, v24);
      }

      uint64_t v16 = -[MSDHomeSettingsInterface _settingDataFromHomeKit:settingKeyPath:]( self,  "_settingDataFromHomeKit:settingKeyPath:",  v8,  v9);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      v45 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
      v46 = v26;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 userSettingsDefaults]);
      [v28 setObject:v15 forKey:v10];
    }
  }

  else
  {
    id v29 = sub_10003E9DC();
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_10000C674((os_log_s *)v13, v30, v31, v32, v33, v34, v35, v36);
    }
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_getAllowExplicitContentSetting:(id)a3
{
  return -[MSDHomeSettingsInterface _cachedSetting:settingsKeyPath:defaultsKey:]( self,  "_cachedSetting:settingsKeyPath:defaultsKey:",  a3,  allowExplicitContentSettingsKeyPath,  @"HomeAllowExplicitContentUserIDMap");
}

- (BOOL)_updateListeningHistory:(id)a3 accessoryID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userSettingsDefaults]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"HomeUpdateListeningHistoryUserIDMap"]);

    if (v9 && [v9 count])
    {
      if (v6) {
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      }
      else {
        id v10 = @"CurrentAccessoryIdentifierKey";
      }
      BOOL v11 = v10;
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v13]);

      unsigned __int8 v12 = [v14 containsObject:v11];
    }

    else
    {
      BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
      unsigned __int8 v12 = -[__CFString listeningHistorySetting:accessoryID:]( v11,  "listeningHistorySetting:accessoryID:",  v5,  v6);
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)allowiTunesAccount:(id)a3 completion:(id)a4
{
  if (a3) {
    (*((void (**)(id, BOOL))a4 + 2))( a4,  -[MSDHomeSettingsInterface getAllowiTunesAccountSetting:](self, "getAllowiTunesAccountSetting:", a3));
  }
  else {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)allowExplicitContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, BOOL))a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      int v13 = 136315394;
      id v14 = "-[MSDHomeSettingsInterface allowExplicitContent:completion:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Fetching Explicit content setting for %@",  (uint8_t *)&v13,  0x16u);
    }

    v7[2]( v7,  -[MSDHomeSettingsInterface _getAllowExplicitContentSetting:](self, "_getAllowExplicitContentSetting:", v6));
  }

  else
  {
    if (v10)
    {
      int v13 = 136315138;
      id v14 = "-[MSDHomeSettingsInterface allowExplicitContent:completion:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Fetching Home Owner Explicit content setting.",  (uint8_t *)&v13,  0xCu);
    }

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 homeOwnerUniqueIdentifier]);
    v7[2]( v7,  -[MSDHomeSettingsInterface _getAllowExplicitContentSetting:](self, "_getAllowExplicitContentSetting:", v12));

    v7 = (void (**)(id, BOOL))v11;
  }
}

- (void)updateListeningHistoryForUser:(id)a3 accessory:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, BOOL))a5;
  id v11 = sub_10003E9DC();
  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    __int16 v15 = "-[MSDHomeSettingsInterface updateListeningHistoryForUser:accessory:completion:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Fetching Update Listening History setting for %@ on device %@",  (uint8_t *)&v14,  0x20u);
  }

  if (v8) {
    BOOL v13 = -[MSDHomeSettingsInterface _updateListeningHistory:accessoryID:]( self,  "_updateListeningHistory:accessoryID:",  v8,  v9);
  }
  else {
    BOOL v13 = 0LL;
  }
  v10[2](v10, v13);
}

@end