@interface DMDSetMaximumResidentUsersOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDSetMaximumResidentUsersOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetMaximumResidentUsersRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5CA0;
}

@end