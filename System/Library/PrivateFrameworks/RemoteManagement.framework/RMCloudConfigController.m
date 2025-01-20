@interface RMCloudConfigController
+ (id)_enrollmentURLFromCloudConfig:(id)a3;
+ (id)_enrollmentURLFromUpdatedCloudConfig;
+ (id)_updatedCloudConfig;
+ (id)cloudConfigEnrollmentURL;
+ (id)cloudConfigEnrollmentURLWithUpdateFromServer;
@end

@implementation RMCloudConfigController

+ (id)cloudConfigEnrollmentURL
{
  return 0LL;
}

+ (id)cloudConfigEnrollmentURLWithUpdateFromServer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagementSettings sharedSettings](&OBJC_CLASS___RMManagementSettings, "sharedSettings"));
  [v3 removeValueForKey:@"HasCloudConfigBeenChecked"];
  [v3 removeValueForKey:@"CloudConfigEnrollmentURL"];
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _enrollmentURLFromUpdatedCloudConfig]);

  return v4;
}

+ (id)_enrollmentURLFromUpdatedCloudConfig
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _updatedCloudConfig]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _enrollmentURLFromCloudConfig:v3]);

  return v4;
}

+ (id)_enrollmentURLFromCloudConfig:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagementSettings sharedSettings](&OBJC_CLASS___RMManagementSettings, "sharedSettings"));
    [v4 setValue:&__kCFBooleanTrue forKey:@"HasCloudConfigBeenChecked"];
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"MDMProtocolVersion"]);
    v6 = v5;
    if (v5 && [v5 intValue] == 2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ConfigurationURL"]);
      if ([v7 length])
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
        id v9 = v8;
        if (v8)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
          [v4 setValue:v10 forKey:@"CloudConfigEnrollmentURL"];

          v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog cloudConfigController](&OBJC_CLASS___RMLog, "cloudConfigController"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            sub_10001A72C();
          }

          id v9 = v9;
          v12 = v9;
        }

        else
        {
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog cloudConfigController](&OBJC_CLASS___RMLog, "cloudConfigController"));
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_10001A6CC();
          }

          v12 = 0LL;
        }
      }

      else
      {
        id v9 = (id)objc_claimAutoreleasedReturnValue(+[RMLog cloudConfigController](&OBJC_CLASS___RMLog, "cloudConfigController"));
        if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
          sub_10001A698((os_log_s *)v9, v20, v21, v22, v23, v24, v25, v26);
        }
        v12 = 0LL;
      }
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog cloudConfigController](&OBJC_CLASS___RMLog, "cloudConfigController"));
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
        sub_10001A638();
      }
      v12 = 0LL;
    }
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog cloudConfigController](&OBJC_CLASS___RMLog, "cloudConfigController"));
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG)) {
      sub_10001A604((os_log_s *)v4, v13, v14, v15, v16, v17, v18, v19);
    }
    v12 = 0LL;
  }

  return v12;
}

+ (id)_updatedCloudConfig
{
  if (+[RMFeatureOverrides overrideCloudConfig](&OBJC_CLASS___RMFeatureOverrides, "overrideCloudConfig"))
  {
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog cloudConfigController](&OBJC_CLASS___RMLog, "cloudConfigController"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Using OverrideCloudConfig", buf, 2u);
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations baseDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "baseDirectoryURLCreateIfNeeded:",  1LL));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"DEP.plist"]);

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v4));
    return v5;
  }

  else
  {
    *(void *)buf = 0LL;
    uint64_t v17 = buf;
    uint64_t v18 = 0x3032000000LL;
    uint64_t v19 = sub_10001A3B8;
    uint64_t v20 = sub_10001A3C8;
    id v21 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v8 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001A3D0;
    v12[3] = &unk_1000B95A8;
    uint64_t v15 = buf;
    id v9 = v8;
    uint64_t v13 = v9;
    id v10 = v7;
    id v14 = v10;
    [v10 retrieveCloudConfigurationDetailsCompletionBlock:v12];
    -[NSConditionLock lockWhenCondition:](v9, "lockWhenCondition:", 1LL);
    -[NSConditionLock unlock](v9, "unlock");
    if (*((void *)v17 + 5)) {
      v11 = 0LL;
    }
    else {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cloudConfigurationDetails]);
    }

    _Block_object_dispose(buf, 8);
    return v11;
  }

@end