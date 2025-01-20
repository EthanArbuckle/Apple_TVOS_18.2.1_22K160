@interface DMDValidateApplicationsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDValidateApplicationsOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFValidateApplicationsRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5DC0;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifiers]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005DEC0;
  v7[3] = &unk_10009E850;
  v7[4] = self;
  [v5 validateAppBundleIDs:v6 completion:v7];
}

@end