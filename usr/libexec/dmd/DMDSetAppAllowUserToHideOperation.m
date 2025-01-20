@interface DMDSetAppAllowUserToHideOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppAllowUserToHideOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetAppAllowUserToHideRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A54F0;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allowUserToHide]);

  id v13 = 0LL;
  unsigned __int8 v10 = [v8 setAllowUserToHide:v9 forBundleIdentifier:v6 error:&v13];

  id v11 = v13;
  if ((v10 & 1) != 0)
  {
    -[DMDSetAppAllowUserToHideOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0LL);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
    [v12 sendManagedAppsChangedNotification];

    -[DMDSetAppAllowUserToHideOperation endOperationWithError:](self, "endOperationWithError:", v11);
  }
}

@end