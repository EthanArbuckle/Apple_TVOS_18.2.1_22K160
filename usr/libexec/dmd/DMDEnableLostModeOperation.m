@interface DMDEnableLostModeOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDEnableLostModeOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFEnableLostModeRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5688;
}

@end