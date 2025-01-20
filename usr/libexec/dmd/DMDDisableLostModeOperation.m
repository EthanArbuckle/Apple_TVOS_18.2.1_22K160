@interface DMDDisableLostModeOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDDisableLostModeOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFDisableLostModeRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5658;
}

@end