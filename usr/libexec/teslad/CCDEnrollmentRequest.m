@interface CCDEnrollmentRequest
- (CCDEnrollmentRequest)requestWithError:(id *)a3;
- (CCDRequestPayload)requestPayload;
- (NSArray)clientCertificates;
- (NSString)enrollmentURLString;
- (id)_enrollmentURL;
- (id)privateKey;
- (int64_t)requestType;
- (void)setClientCertificates:(id)a3;
- (void)setPrivateKey:(id)a3;
@end

@implementation CCDEnrollmentRequest

- (id)_enrollmentURL
{
  v3 = objc_alloc(&OBJC_CLASS___NSURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest enrollmentURLString](self, "enrollmentURLString"));
  v5 = -[NSURL initWithString:](v3, "initWithString:", v4);

  return v5;
}

- (CCDEnrollmentRequest)requestWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest requestPayload](self, "requestPayload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest _enrollmentURL](self, "_enrollmentURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest privateKey](self, "privateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentRequest clientCertificates](self, "clientCertificates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CCDDeviceIdentitySupport requestWithPayload:URL:privateKey:clientCertificates:outError:]( &OBJC_CLASS___CCDDeviceIdentitySupport,  "requestWithPayload:URL:privateKey:clientCertificates:outError:",  v5,  v6,  v7,  v8,  a3));

  return (CCDEnrollmentRequest *)v9;
}

- (NSString)enrollmentURLString
{
  return self->_enrollmentURLString;
}

- (CCDRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (id)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end