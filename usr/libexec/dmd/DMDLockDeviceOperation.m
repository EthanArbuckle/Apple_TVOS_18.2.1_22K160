@interface DMDLockDeviceOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDLockDeviceOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFLockDeviceRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5958;
}

@end