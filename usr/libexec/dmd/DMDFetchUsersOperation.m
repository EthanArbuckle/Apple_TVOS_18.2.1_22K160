@interface DMDFetchUsersOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDFetchUsersOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchUsersRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A58B0;
}

@end