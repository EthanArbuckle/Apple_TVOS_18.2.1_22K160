@interface DMDClearRestrictionsPasswordOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDClearRestrictionsPasswordOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFClearRestrictionsPasswordRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5538;
}

@end