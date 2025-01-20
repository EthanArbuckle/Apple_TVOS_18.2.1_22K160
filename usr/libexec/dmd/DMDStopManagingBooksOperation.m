@interface DMDStopManagingBooksOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDStopManagingBooksOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFStopManagingBooksRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5D48;
}

@end