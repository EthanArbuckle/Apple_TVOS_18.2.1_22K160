@interface DMDFetchActivationLockBypassCodeOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDFetchActivationLockBypassCodeOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchActivationLockBypassCodeRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A56B8;
}

@end