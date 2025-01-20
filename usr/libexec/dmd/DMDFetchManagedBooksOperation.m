@interface DMDFetchManagedBooksOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDFetchManagedBooksOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchManagedBooksRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A57C0;
}

@end