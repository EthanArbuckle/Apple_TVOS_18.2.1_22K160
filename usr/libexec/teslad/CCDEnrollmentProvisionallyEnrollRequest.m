@interface CCDEnrollmentProvisionallyEnrollRequest
- (NSString)nonce;
- (id)enrollmentURLString;
- (id)requestPayload;
- (int64_t)requestType;
- (void)setNonce:(id)a3;
@end

@implementation CCDEnrollmentProvisionallyEnrollRequest

- (int64_t)requestType
{
  return 0LL;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depProvisionalEnrollmentURLStringWithURLString:]( &OBJC_CLASS___CCDFeatures,  "depProvisionalEnrollmentURLStringWithURLString:",  @"https://deviceenrollment.apple.com/v2/enroll");
}

- (id)requestPayload
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___CCDProvisionalEnrollmentRequestPayload, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentProvisionallyEnrollRequest nonce](self, "nonce"));

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentProvisionallyEnrollRequest nonce](self, "nonce"));
    [v3 setNonce:v8];
  }

  else
  {
    v9 = *(os_log_s **)(DEPLogObjects(v5, v6, v7) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Nonce is NOT provided in %@. Request will probably fail.",  (uint8_t *)&v11,  0xCu);
    }
  }

  return v3;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
}

@end