@interface DMDSetAppRemovabilityOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDSetAppRemovabilityOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetAppRemovabilityRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5BC8;
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](&OBJC_CLASS___DMDAppController, "sharedController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 removable]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100055BA4;
  v10[3] = &unk_10009E850;
  v10[4] = self;
  [v8 setRemovability:v9 forBundleIdentifier:v6 completion:v10];
}

@end