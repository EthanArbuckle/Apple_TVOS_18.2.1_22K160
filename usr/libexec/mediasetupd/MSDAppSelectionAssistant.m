@interface MSDAppSelectionAssistant
+ (id)appServiceInfoForUser:(id)a3 usingPublicInfo:(id)a4;
- (id)_appServiceInfoForPrimaryUser;
- (id)_currentHomeID;
- (id)_getApplicationInformationFor:(id)a3;
- (id)_homeOwnerUserID;
- (id)appServiceInfoForAllThirdPartyServices;
- (id)appServiceInfoForUser:(id)a3;
- (id)appServiceInfoForUsers:(id)a3;
- (id)homeUserWithService:(id)a3 forEndpoint:(id)a4;
- (id)serviceInfoForUser:(id)a3;
- (void)activeApplicationRecordInfo:(id)a3 completionHandler:(id)a4;
@end

@implementation MSDAppSelectionAssistant

+ (id)appServiceInfoForUser:(id)a3 usingPublicInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIDS]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  if ([v8 isEqualToString:kAppleMusicBundleIdentifier])
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
    uint64_t v10 = (uint64_t)[v9 getAllowiTunesAccountSetting:v5];

    v11 = -[MSDAccount initWithHomeUserIdentifier:]( objc_alloc(&OBJC_CLASS___MSDAccount),  "initWithHomeUserIdentifier:",  v5);
    if (-[MSDAccount hasValidSubscription](v11, "hasValidSubscription")) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = 2LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v10 = 1LL;
  }

  id v13 = objc_alloc(&OBJC_CLASS___MSServiceAppInfo);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
  id v15 = [v13 initWithServiceName:v14 serviceBundleID:v8 useInHome:v10 subscriptionStatus:v12];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIDS]);
  [v15 setAlternateBundleIDS:v16];

  return v15;
}

- (id)appServiceInfoForUser:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant _getApplicationInformationFor:](self, "_getApplicationInformationFor:"));
    id v5 = v3;
    if (v3) {
      id v6 = v3;
    }
    else {
      id v6 = (id)objc_opt_new(&OBJC_CLASS___NSSet, v4);
    }
    v7 = v6;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant _appServiceInfoForPrimaryUser](self, "_appServiceInfoForPrimaryUser"));
  }

  return v7;
}

- (id)appServiceInfoForUsers:(id)a3
{
  id v4 = a3;
  id v6 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v5);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppSelectionAssistant _getApplicationInformationFor:]( self,  "_getApplicationInformationFor:",  v12,  (void)v20));
        id v15 = v13;
        if (v13) {
          id v16 = v13;
        }
        else {
          id v16 = (id)objc_opt_new(&OBJC_CLASS___NSSet, v14);
        }
        v17 = v16;

        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
        [v6 setObject:v17 forKeyedSubscript:v18];
      }

      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v9);
  }

  return v6;
}

- (id)appServiceInfoForAllThirdPartyServices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfo](&OBJC_CLASS___MSDPublicDBManager, "getCachedPublicInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "na_filter:", &stru_100060978));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_map:", &stru_1000609B8));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  return v5;
}

- (id)homeUserWithService:(id)a3 forEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003E9DC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[MSDAppSelectionAssistant homeUserWithService:forEndpoint:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForBundleID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForBundleID:",  v6));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant _currentHomeID](self, "_currentHomeID"));
    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForDefaultWithCustomClass:@"privateDatabaseData"]);
      id v14 = [v13 mutableCopy];

      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForDefaultWithCustomClass:@"sharedDatabaseData"]);
      [v14 addObjectsFromArray:v16];

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_100004A84;
      v43[3] = &unk_1000609E0;
      id v44 = v10;
      id v17 = v11;
      id v45 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ms_objectsPassingTest:", v43));
      if ([v18 count])
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "na_map:", &stru_100060A20));
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
        __int128 v21 = (NSUUID *)objc_claimAutoreleasedReturnValue([v20 getPrimaryUserIDForAccessoryID:v7]);

        v42 = v21;
        if (v21) {
          __int128 v21 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v21);
        }
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant _homeOwnerUserID](self, "_homeOwnerUserID"));
        if (v21 && [v19 containsObject:v21])
        {
          id v23 = sub_10003E9DC();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Primary user has the requested service",  buf,  2u);
          }

          v25 = v21;
        }

        else if (v22 {
               && ([v22 isEqual:v21] & 1) == 0
        }
               && [v19 containsObject:v22])
        {
          id v36 = sub_10003E9DC();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Owner has the requested service",  buf,  2u);
          }

          v25 = v22;
        }

        else
        {
          id v39 = sub_10003E9DC();
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Neither the primary user or the home owner has the requested service",  buf,  2u);
          }

          v25 = (NSUUID *)objc_claimAutoreleasedReturnValue([v19 firstObject]);
        }

        v27 = v25;
      }

      else
      {
        id v38 = sub_10003E9DC();
        v19 = (void *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
          sub_100040970(v17, (uint64_t)v6, (os_log_s *)v19);
        }
        v27 = 0LL;
      }
    }

    else
    {
      id v28 = sub_10003E9DC();
      id v14 = (id)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_100040900((os_log_s *)v14, v29, v30, v31, v32, v33, v34, v35);
      }
      v27 = 0LL;
    }
  }

  else
  {
    id v26 = sub_10003E9DC();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      sub_10004087C((uint64_t)v6, (os_log_s *)v11);
    }
    v27 = 0LL;
  }

  return v27;
}

- (id)serviceInfoForUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant _homeOwnerUserID](self, "_homeOwnerUserID"));
    unsigned int v6 = [v5 isEqual:v4];
    id v7 = kPrivateDatabaseKeyData;
    if (!v6) {
      id v7 = kSharedDatabaseKeyData;
    }
    id v8 = *v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForDefaultWithCustomClass:v8]);

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100004D14;
    v31[3] = &unk_100060A48;
    id v11 = v4;
    id v32 = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ms_objectsPassingTest:", v31));
    if ([v12 count])
    {
      id v13 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v12);
    }

    else
    {
      id v22 = sub_10003E9DC();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100040AA0((uint64_t)v11, v23, v24, v25, v26, v27, v28, v29);
      }

      id v13 = 0LL;
    }
  }

  else
  {
    id v14 = sub_10003E9DC();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_100040A30((os_log_s *)v5, v15, v16, v17, v18, v19, v20, v21);
    }
    id v13 = 0LL;
  }

  return v13;
}

- (id)_getApplicationInformationFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant serviceInfoForUser:](self, "serviceInfoForUser:", v4));
  if (v5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100004E9C;
    v16[3] = &unk_100060A70;
    id v17 = v4;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_map:", v16));
  }

  else
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100040AA0((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }

    unsigned int v6 = 0LL;
  }

  return v6;
}

- (id)_appServiceInfoForPrimaryUser
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getPrimaryUserIDForAccessoryID:0]);

  if (v4)
  {
    unsigned int v6 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant _getApplicationInformationFor:](self, "_getApplicationInformationFor:", v6));
  }

  else
  {
    unsigned int v6 = (NSUUID *)objc_opt_new(&OBJC_CLASS___NSArray, v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
    id v9 = [v8 getPrimaryUserSelectionType:0];

    if (!v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant _homeOwnerUserID](self, "_homeOwnerUserID"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
      id v12 = [v11 getAllowiTunesAccountSetting:v10];

      uint64_t v13 = -[MSDAccount initWithHomeUserIdentifier:]( objc_alloc(&OBJC_CLASS___MSDAccount),  "initWithHomeUserIdentifier:",  v10);
      if (-[MSDAccount hasValidSubscription](v13, "hasValidSubscription")) {
        uint64_t v14 = 1LL;
      }
      else {
        uint64_t v14 = 2LL;
      }
      id v15 = objc_alloc(&OBJC_CLASS___MSServiceAppInfo);
      uint64_t v16 = kAppleMusicBundleIdentifier;
      id v17 = [v15 initWithServiceName:kAppleMusicApplicationIdentifier serviceBundleID:kAppleMusicBundleIdentifier useInHome:v12 subscriptionStatus:v14];
      uint64_t v22 = v16;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
      [v17 setAlternateBundleIDS:v18];

      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSArray na_arrayWithSafeObject:](&OBJC_CLASS___NSArray, "na_arrayWithSafeObject:", v17));
      unsigned int v6 = (NSUUID *)v19;
    }

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  }

  uint64_t v20 = (void *)v7;

  return v20;
}

- (id)_homeOwnerUserID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userSettingsDefaults]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"AccessoryOwnerHomeUserID"]);

  if (v4)
  {
    uint64_t v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    uint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue([v6 homeOwnerUniqueIdentifier]);
  }

  return v5;
}

- (id)_currentHomeID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userSettingsDefaults]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"AccessoryHomeIDKey"]);

  if (v4)
  {
    uint64_t v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentHome]);
    uint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  }

  return v5;
}

- (void)activeApplicationRecordInfo:(id)a3 completionHandler:(id)a4
{
  unsigned int v6 = (void (**)(id, void *, void *))a4;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAppSelectionAssistant appServiceInfoForUser:](self, "appServiceInfoForUser:", a3));
    if (v7)
    {
      id v8 = 0LL;
    }

    else
    {
      uint64_t v9 = MSErrorDomain;
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      id v12 = @"User does not have any service configured in the Home";
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  5LL,  v10));
    }

    v6[2](v6, v7, v8);
  }
}

@end