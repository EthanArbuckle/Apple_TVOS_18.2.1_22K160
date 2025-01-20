@interface DMDFetchClassroomInstructorEndpointOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
@end

@implementation DMDFetchClassroomInstructorEndpointOperation

+ (id)whitelistedClassesForRequest
{
  return +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___DMFFetchClassroomInstructorEndpointRequest));
}

+ (id)requiredEntitlements
{
  return &off_1000A5718;
}

@end