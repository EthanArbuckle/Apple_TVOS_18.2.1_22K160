@interface CCDEnrollmentRetrieveCloudConfigurationRequest
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
@end

@implementation CCDEnrollmentRetrieveCloudConfigurationRequest

- (int64_t)requestType
{
  return 1LL;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depConfigurationEnrollmentURLStringWithURLString:]( &OBJC_CLASS___CCDFeatures,  "depConfigurationEnrollmentURLStringWithURLString:",  @"https://iprofiles.apple.com/v2/profile");
}

- (id)requestPayload
{
  return (id)objc_opt_new(&OBJC_CLASS___CCDProfileConfigurationRequestPayload, a2);
}

@end