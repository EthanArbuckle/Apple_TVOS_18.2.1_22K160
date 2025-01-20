@interface CCDEnrollmentUnenrollRequest
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
@end

@implementation CCDEnrollmentUnenrollRequest

- (int64_t)requestType
{
  return 3LL;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depRemoveEnrollmentURLStringWithURLString:]( &OBJC_CLASS___CCDFeatures,  "depRemoveEnrollmentURLStringWithURLString:",  @"https://iprofiles.apple.com/v2/unenroll");
}

- (id)requestPayload
{
  return (id)objc_opt_new(&OBJC_CLASS___CCDUnenrollRequestPayload, a2);
}

@end