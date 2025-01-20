@interface DMDLogOutUserOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDLogOutUserOperation

+ (id)whitelistedClassesForRequest
{
  v5[0] = objc_opt_class(&OBJC_CLASS___DMFLogOutUserRequest);
  v5[1] = objc_opt_class(&OBJC_CLASS___DMFLogoutUserRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000A5970;
}

@end