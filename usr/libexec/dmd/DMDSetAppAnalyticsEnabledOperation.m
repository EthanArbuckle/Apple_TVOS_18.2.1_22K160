@interface DMDSetAppAnalyticsEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDSetAppAnalyticsEnabledOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetAppAnalyticsEnabledRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5B68;
}

@end