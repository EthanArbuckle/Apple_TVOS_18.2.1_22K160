@interface DMDSetPasscodeLockGracePeriodOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDSetPasscodeLockGracePeriodOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetPasscodeLockGracePeriodRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5CB8;
}

@end