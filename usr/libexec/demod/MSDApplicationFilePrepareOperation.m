@interface MSDApplicationFilePrepareOperation
- (BOOL)_determineAppInstallNecessity;
- (BOOL)_waitForPricingAppUpdateIfNeeded;
- (id)methodSelectors;
@end

@implementation MSDApplicationFilePrepareOperation

- (id)methodSelectors
{
  unsigned int v2 = +[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithPointer:]( &OBJC_CLASS___NSValue,  "valueWithPointer:",  "_waitForPricingAppUpdateIfNeeded"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_determineAppInstallNecessity"));
  v5 = (void *)v4;
  if (v2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v3, v4, 0LL));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v3, v5, v7, 0LL));
  }

  return v6;
}

- (BOOL)_waitForPricingAppUpdateIfNeeded
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  unsigned int v3 = [v2 pricingAppUpdateDeferred];

  if (v3)
  {
    id v4 = sub_10003A95C();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waiting for Pricing app to finish its own update.",  v8,  2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v6 waitForPricing:0 forReboot:0];
  }

  return 1;
}

- (BOOL)_determineAppInstallNecessity
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 installedApps]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  if ([v4 containsObject:v6])
  {
    id v7 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "App is already installed: %{public}@",  (uint8_t *)&v23,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundlePathForInstalledApp:v6]);

    BOOL v11 = v10 != 0LL;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDiOSApp appWithPath:](&OBJC_CLASS___MSDiOSApp, "appWithPath:", v10));
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 uniqueIdentifier]);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uniqueIdentifier]);
      id v16 = [v15 isEqualToString:v13];

      -[MSDOperation setSkipped:](self, "setSkipped:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      [v17 setAlreadyInstalled:1];

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      [v18 setCurrentUniqueIdentifier:v13];
    }

    else
    {
      id v22 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000996C4((uint64_t)v6, v13);
      }
    }
  }

  else
  {
    -[MSDOperation setSkipped:](self, "setSkipped:", 0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    [v19 setAlreadyInstalled:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    [v20 setCurrentUniqueIdentifier:0];

    BOOL v11 = 1;
  }

  return v11;
}

@end