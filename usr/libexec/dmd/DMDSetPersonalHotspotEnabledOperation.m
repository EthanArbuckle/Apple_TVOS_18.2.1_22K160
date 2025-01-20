@interface DMDSetPersonalHotspotEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDSetPersonalHotspotEnabledOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetPersonalHotspotEnabledRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5CD0;
}

@end