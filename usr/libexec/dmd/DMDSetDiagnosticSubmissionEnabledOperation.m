@interface DMDSetDiagnosticSubmissionEnabledOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDSetDiagnosticSubmissionEnabledOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFSetDiagnosticSubmissionEnabledRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5C58;
}

@end