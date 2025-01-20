@interface DMDClearActivationLockBypassCodeOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDClearActivationLockBypassCodeOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFClearActivationLockBypassCodeRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5520;
}

@end