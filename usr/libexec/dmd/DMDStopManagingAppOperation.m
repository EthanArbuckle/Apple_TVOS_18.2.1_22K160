@interface DMDStopManagingAppOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDStopManagingAppOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFStopManagingAppRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5D30;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 managementInformationForBundleIdentifier:v5]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000571D8;
  v11[3] = &unk_10009ECB0;
  id v12 = v5;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v5;
  [v8 setRemovability:0 forBundleIdentifier:v10 completion:v11];
}

@end