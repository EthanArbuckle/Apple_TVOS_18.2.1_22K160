@interface DMDRemoveProtectedProfileOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5;
@end

@implementation DMDRemoveProtectedProfileOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFRemoveProtectedProfileRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5AD8;
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v9 removeProtectedProfileAsyncWithIdentifier:v8 installationType:a4 completion:v7];
}

@end