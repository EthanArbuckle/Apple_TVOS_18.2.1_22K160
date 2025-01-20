@interface MSDSettingsInstallOperation
- (BOOL)_applySettingToDevice;
- (BOOL)_saveDisplaySettings;
- (BOOL)_updateLocale;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDSettingsInstallOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_applySettingToDevice"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v3, 0LL));
  }

  return v2;
}

- (int64_t)type
{
  return 3LL;
}

- (BOOL)_applySettingToDevice
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v16 = 136315394;
    v17 = "-[MSDSettingsInstallOperation _applySettingToDevice]";
    __int16 v18 = 2114;
    v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s - identifier %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned int v9 = [v8 isEqual:@"locale"];

  if (v9) {
    return -[MSDSettingsInstallOperation _updateLocale](self, "_updateLocale");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  unsigned int v13 = [v12 isEqualToString:@"display"];

  if (v13) {
    return -[MSDSettingsInstallOperation _saveDisplaySettings](self, "_saveDisplaySettings");
  }
  id v14 = sub_10003A95C();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100097274(self, v15);
  }

  return 0;
}

- (BOOL)_updateLocale
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataDict]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"language"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataDict]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"region"]);

  if (v5 && v8)
  {
    v29[0] = @"language";
    v29[1] = @"region";
    v30[0] = v5;
    v30[1] = v8;
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
    id v10 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315650;
      v24 = "-[MSDSettingsInstallOperation _updateLocale]";
      __int16 v25 = 2114;
      v26 = v5;
      __int16 v27 = 2114;
      v28 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s language: %{public}@ region: %{public}@",  (uint8_t *)&v23,  0x20u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    unsigned __int8 v13 = [v12 setObject:v9 forKey:@"locale"];
  }

  else
  {
    id v14 = sub_10003A95C();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000973A4(v9, v15, v16, v17, v18, v19, v20, v21);
    }
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)_saveDisplaySettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataDict]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"HDR"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    id v7 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315394;
      v22 = "-[MSDSettingsInstallOperation _saveDisplaySettings]";
      __int16 v23 = 1024;
      unsigned int v24 = [v4 BOOLValue];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - HDR setting:  %{BOOL}d",  (uint8_t *)&v21,  0x12u);
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
    [v9 setObject:v4 forKey:@"HDR"];

    BOOL v10 = 1;
  }

  else
  {
    id v12 = sub_10003A95C();
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100097414(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    BOOL v10 = 0;
  }

  return v10;
}

@end