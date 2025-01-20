@interface DMDSetVoiceRoamingEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDSetVoiceRoamingEnabledOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetVoiceRoamingEnabledRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5CE8;
}

@end