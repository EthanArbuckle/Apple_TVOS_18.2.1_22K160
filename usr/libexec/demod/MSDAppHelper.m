@interface MSDAppHelper
+ (id)sharedInstance;
- (BOOL)isInstalledApp:(id)a3;
- (BOOL)stopAllAppsExcept:(id)a3;
- (BOOL)waitForAppToInstall:(id)a3 withTimeout:(unint64_t)a4;
- (id)acquireAppTerminationAssertionForApp:(id)a3;
- (id)bundleLocalizedNameForInstalledApp:(id)a3;
- (id)bundlePathForInstalledApp:(id)a3;
- (id)installedApps;
- (id)runningApps;
- (id)runningApps:(BOOL)a3;
- (id)visibleApps;
- (void)releaseAppTerminationAssertion:(id)a3 forApp:(id)a4;
@end

@implementation MSDAppHelper

+ (id)sharedInstance
{
  if (qword_1001254B8 != -1) {
    dispatch_once(&qword_1001254B8, &stru_1000FA350);
  }
  return (id)qword_1001254B0;
}

- (id)installedApps
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allApplications]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 0LL));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationType", (void)v14));
        if ([v11 isEqualToString:@"User"])
        {
          unsigned __int8 v12 = [v10 isPlaceholder];

          if ((v12 & 1) != 0) {
            continue;
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationIdentifier]);
          [v4 addObject:v11];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)visibleApps
{
  v2 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v2));

  return v3;
}

- (id)runningApps:(BOOL)a3
{
  return +[NSArray array](&OBJC_CLASS___NSArray, "array", a3);
}

- (id)runningApps
{
  return +[NSArray array](&OBJC_CLASS___NSArray, "array");
}

- (id)bundleLocalizedNameForInstalledApp:(id)a3
{
  id v3 = a3;
  id v10 = 0LL;
  id v4 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedName]);
  }

  else
  {
    id v8 = sub_10003A95C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100099F0C((uint64_t)v3, v5);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (id)bundlePathForInstalledApp:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleURL]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);

  return v5;
}

- (BOOL)isInstalledApp:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appState]);
    unsigned __int8 v6 = [v5 isInstalled];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)waitForAppToInstall:(id)a3 withTimeout:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)a4));
  v9 = objc_alloc_init(&OBJC_CLASS___NSCondition);
  id v10 = sub_10003A95C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v40 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Wait for app to install: %{public}@",  buf,  0xCu);
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100058078;
  v37[3] = &unk_1000F9508;
  v13 = v9;
  v38 = v13;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( [v7 addObserverForName:@"com.apple.LaunchServices.applicationRegistered" object:0 queue:v12 usingBlock:v37]);

  if (v14)
  {
    -[NSCondition lock](v13, "lock");
    while (1)
    {
      BOOL v15 = -[MSDAppHelper isInstalledApp:](self, "isInstalledApp:", v6);
      if (v15) {
        break;
      }
      id v16 = sub_10003A95C();
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "App is not yet installed.", buf, 2u);
      }

      if (!-[NSCondition waitUntilDate:](v13, "waitUntilDate:", v8))
      {
        id v18 = sub_10003A95C();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100099FC4(v19, v20, v21, v22, v23, v24, v25, v26);
        }

        break;
      }
    }

    -[NSCondition unlock](v13, "unlock");
    [v7 removeObserver:v14];
  }

  else
  {
    id v27 = sub_10003A95C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100099F90(v28, v29, v30, v31, v32, v33, v34, v35);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)stopAllAppsExcept:(id)a3
{
  id v4 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v19 allApplications]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationIdentifier]);
        unsigned __int8 v12 = [v4 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationIdentifier]);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppHelper acquireAppTerminationAssertionForApp:]( self,  "acquireAppTerminationAssertionForApp:",  v13));

          if (v14)
          {
            BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 applicationIdentifier]);
            -[MSDAppHelper releaseAppTerminationAssertion:forApp:]( self,  "releaseAppTerminationAssertion:forApp:",  v14,  v15);
          }

          else
          {
            id v16 = sub_10003A95C();
            BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationIdentifier]);
              *(_DWORD *)buf = 138543362;
              uint64_t v25 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ERROR - Failed to acquire termination assertion for app:  %{public}@",  buf,  0xCu);
            }
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v7);
  }

  return 1;
}

- (id)acquireAppTerminationAssertionForApp:(id)a3
{
  id v3 = a3;
  id v4 = sub_10003A95C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10009A148();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v3));
  id v7 = objc_alloc(&OBJC_CLASS___RBSTerminateContext);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([@"Installing application %@" stringByAppendingString:v3]);
  id v9 = [v7 initWithExplanation:v8];

  [v9 setMaximumTerminationResistance:50];
  id v10 = (os_log_s *)[[RBSTerminationAssertion alloc] initWithPredicate:v6 context:v9];
  if (v10)
  {
    v11 = v10;
    id v19 = 0LL;
    unsigned __int8 v12 = -[os_log_s acquireWithError:](v10, "acquireWithError:", &v19);
    id v13 = v19;
    id v14 = sub_10003A95C();
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10009A064();
      }
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10009A0C4((uint64_t)v3, v13);
      }

      id v16 = v11;
      v11 = 0LL;
    }
  }

  else
  {
    id v18 = sub_10003A95C();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100099FF8();
    }
    v11 = 0LL;
    id v13 = 0LL;
  }

  return v11;
}

- (void)releaseAppTerminationAssertion:(id)a3 forApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10003A95C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10009A28C();
  }

  if (v5)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___RBSTerminationAssertion, v9);
    if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
    {
      id v16 = 0LL;
      unsigned __int8 v11 = [v5 invalidateWithError:&v16];
      id v12 = v16;
      id v13 = sub_10003A95C();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v15 = v14;
      if ((v11 & 1) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_10009A1A8();
        }
      }

      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        sub_10009A208((uint64_t)v6, v12);
      }
    }
  }
}

@end