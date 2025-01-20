@interface _TVSettingsOpenURLConfig
+ (id)_keyValueDictionaryForURL:(id)a3;
+ (id)configWithAppSettingsURL:(id)a3;
+ (id)configWithPrefsURL:(id)a3 options:(id)a4;
+ (id)configWithSettingsURL:(id)a3;
+ (id)configWithTVProviderURL:(id)a3;
- (BOOL)shouldActivateLastComponent;
- (BOOL)shouldAnimateTransition;
- (NSArray)parsedPathComponents;
- (NSDictionary)parameters;
- (NSURL)originalURL;
- (void)setOriginalURL:(id)a3;
- (void)setParameters:(id)a3;
- (void)setParsedPathComponents:(id)a3;
- (void)setShouldActivateLastComponent:(BOOL)a3;
- (void)setShouldAnimateTransition:(BOOL)a3;
@end

@implementation _TVSettingsOpenURLConfig

+ (id)configWithSettingsURL:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____TVSettingsOpenURLConfig);
  -[_TVSettingsOpenURLConfig setOriginalURL:](v4, "setOriginalURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 pathComponents]);

  -[_TVSettingsOpenURLConfig setParsedPathComponents:](v4, "setParsedPathComponents:", v5);
  return v4;
}

+ (id)configWithAppSettingsURL:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 resourceSpecifier]);
  if ([v4 length])
  {
    v5 = objc_alloc_init(&OBJC_CLASS____TVSettingsOpenURLConfig);
    -[_TVSettingsOpenURLConfig setOriginalURL:](v5, "setOriginalURL:", v3);
    v8[0] = @"/";
    v8[1] = @"AppsTitle";
    v8[2] = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));
    -[_TVSettingsOpenURLConfig setParsedPathComponents:](v5, "setParsedPathComponents:", v6);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)configWithTVProviderURL:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS____TVSettingsOpenURLConfig);
  -[_TVSettingsOpenURLConfig setOriginalURL:](v4, "setOriginalURL:", v3);

  -[_TVSettingsOpenURLConfig setShouldActivateLastComponent:](v4, "setShouldActivateLastComponent:", 1LL);
  -[_TVSettingsOpenURLConfig setParsedPathComponents:](v4, "setParsedPathComponents:", &off_1001AF2E0);
  return v4;
}

+ (id)configWithPrefsURL:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _keyValueDictionaryForURL:v6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"root"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByRemovingPercentEncoding]);

  uint64_t v11 = SFObjectAndOffsetForURLPair(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"object"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"path"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:UIApplicationOpenURLOptionsSourceApplicationKey]);

  if (!v13)
  {
    v24 = 0LL;
    goto LABEL_26;
  }

  v72 = v14;
  v73 = v15;
  v71 = v10;
  v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userProfilesSnapshot]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 selectedUserProfile]);

  if ([&off_1001AF2F8 containsObject:v13] && !v19)
  {
    id v20 = sub_1000E0438();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000FD3C0((uint64_t)v6, (uint64_t)v13, v21);
    }

    v86[0] = @"/";
    v86[1] = @"AccountsTitle";
    v86[2] = @"PrimaryUserProfile";
    v22 = v86;
    goto LABEL_7;
  }

  if ([v13 isEqual:@"STORE"])
  {
    v85[0] = @"/";
    v85[1] = @"AccountsTitle";
    v85[2] = @"SelectedUserProfile";
    v85[3] = @"AccountsUserITMSTitle";
    v22 = v85;
    uint64_t v23 = 4LL;
    goto LABEL_11;
  }

  if (([v13 isEqual:@"CASTLE"] & 1) != 0
    || [v13 isEqual:@"APPLE_ACCOUNT"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF310;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"ACCOUNTS_AND_PASSWORDS"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF328;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"GAMECENTER"])
  {
    v33 = @"PrimaryUserProfile";
    if (v73)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord bundleRecordWithApplicationIdentifier:error:]( &OBJC_CLASS___LSApplicationRecord,  "bundleRecordWithApplicationIdentifier:error:",  v73,  0LL));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 managedPersonas]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 firstObject]);

      if (v36)
      {
        v37 = @"SelectedUserProfile";

        v33 = v37;
      }
    }

    v84[0] = @"/";
    v84[1] = @"AccountsTitle";
    v84[2] = v33;
    v84[3] = @"AccountsGameCenterTitle";
    v84[4] = @"SIGN_IN";
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 5LL));

    goto LABEL_35;
  }

  if ([v13 isEqual:@"VOLUME"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF340;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"DEDICATED"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF358;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"Privacy"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF370;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"SiriPrivacy"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF388;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"DeviceUsage"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF3A0;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"Restrictions"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF3B8;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"APPS"])
  {

    uint64_t v26 = 0LL;
    v16 = &off_1001AF3D0;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"MUSICPRIVACY"])
  {

    v16 = &off_1001AF3E8;
LABEL_54:
    uint64_t v26 = 1LL;
    goto LABEL_13;
  }

  if ([v13 isEqual:@"MusicAudioQuality"])
  {

    v16 = &off_1001AF400;
    goto LABEL_54;
  }

  if ([v13 isEqual:@"DiagnosticLogExport"])
  {

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvs_stringForKey:", @"logfile"));
    if ([v38 length])
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([&off_1001AF418 arrayByAddingObject:v38]);
      v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v39 arrayByAddingObject:@"PrivacyLogFileExportMenuitem"]);
    }

    else
    {
      v16 = &off_1001AF418;
    }

+ (id)_keyValueDictionaryForURL:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 resourceSpecifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"&"]);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)v11),  "componentsSeparatedByString:",  @"=",  (void)v17));
        if ([v12 count] == (id)2)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:1]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByRemovingPercentEncoding]);

          v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:0]);
          [v4 setObject:v14 forKey:v15];
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v4;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSArray)parsedPathComponents
{
  return self->_parsedPathComponents;
}

- (void)setParsedPathComponents:(id)a3
{
}

- (BOOL)shouldActivateLastComponent
{
  return self->_shouldActivateLastComponent;
}

- (void)setShouldActivateLastComponent:(BOOL)a3
{
  self->_shouldActivateLastComponent = a3;
}

- (BOOL)shouldAnimateTransition
{
  return self->_shouldAnimateTransition;
}

- (void)setShouldAnimateTransition:(BOOL)a3
{
  self->_shouldAnimateTransition = a3;
}

- (void).cxx_destruct
{
}

@end