@interface DMDPlayLostModeSoundOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDPlayLostModeSoundOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFPlayLostModeSoundRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A59A0;
}

@end