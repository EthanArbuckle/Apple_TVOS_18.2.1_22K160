@interface DMDFetchSafariBookmarksOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDFetchSafariBookmarksOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchSafariBookmarksRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5868;
}

@end