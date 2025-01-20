@interface DMDSetBluetoothEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
@end

@implementation DMDSetBluetoothEnabledOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetBluetoothEnabledRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5BF8;
}

- (BOOL)runOnMainThread
{
  return 1;
}

@end