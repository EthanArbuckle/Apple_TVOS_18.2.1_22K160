@interface DMDSetAppConfigurationOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetAppConfigurationRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5BB0;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 configuration]);

  id v13 = 0LL;
  unsigned int v10 = [v8 setConfiguration:v9 forBundleIdentifier:v6 error:&v13];

  id v11 = v13;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    [v12 sendManagedAppsChangedNotification];

    -[DMDSetAppConfigurationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }

  else
  {
    -[DMDSetAppConfigurationOperation endOperationWithError:](self, "endOperationWithError:", v11);
  }
}

@end