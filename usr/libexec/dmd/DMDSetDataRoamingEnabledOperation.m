@interface DMDSetDataRoamingEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDSetDataRoamingEnabledOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetDataRoamingEnabledRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5C10;
}

@end