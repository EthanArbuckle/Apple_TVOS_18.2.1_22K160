@interface CCDEnrollmentUploadPushTokenRequest
- (NSData)pushToken;
- (NSString)pushTopic;
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
- (void)setPushToken:(id)a3;
- (void)setPushTopic:(id)a3;
@end

@implementation CCDEnrollmentUploadPushTokenRequest

- (int64_t)requestType
{
  return 4LL;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures deviceRegisterURLStringWithURLString:]( &OBJC_CLASS___CCDFeatures,  "deviceRegisterURLStringWithURLString:",  @"https://iprofiles.apple.com/deviceRegister");
}

- (id)requestPayload
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___CCDUploadPushTokenRequestPayload, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentUploadPushTokenRequest pushToken](self, "pushToken"));
  [v3 setPushToken:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentUploadPushTokenRequest pushTopic](self, "pushTopic"));
  [v3 setPushTopic:v5];

  return v3;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end