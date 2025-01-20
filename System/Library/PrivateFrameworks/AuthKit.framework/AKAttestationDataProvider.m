@interface AKAttestationDataProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (NSData)attestedData;
- (NSData)certs;
- (NSString)attestationNonce;
- (id)authKitBody;
- (unint64_t)requestBodyType;
- (void)setAttestationNonce:(id)a3;
- (void)setAttestedData:(id)a3;
- (void)setCerts:(id)a3;
@end

@implementation AKAttestationDataProvider

- (unint64_t)requestBodyType
{
  return 1LL;
}

- (id)authKitBody
{
  id v3 = [&__NSDictionary0__struct mutableCopy];
  [v3 setObject:self->_attestationNonce forKeyedSubscript:@"attestationNonce"];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sfrManifest]);

  if (CFPreferencesGetAppBooleanValue(@"tamperImage4M", @"com.apple.authkit", 0LL))
  {
    [v3 setObject:@"overrideImage4MForTesting" forKeyedSubscript:@"image4Manifest"];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);
    [v3 setObject:v6 forKeyedSubscript:@"image4Manifest"];
  }

  if (CFPreferencesGetAppBooleanValue(@"tamperAttestedDataForOSVersion", @"com.apple.authkit", 0LL))
  {
    [v3 setObject:@"overrideAttestedDataForOSVersionForTesting" forKeyedSubscript:@"attestedData"];
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSData base64EncodedStringWithOptions:]( self->_attestedData,  "base64EncodedStringWithOptions:",  0LL));
    [v3 setObject:v7 forKeyedSubscript:@"attestedData"];
  }

  return v3;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKAttestationDataProvider;
  BOOL v7 = -[AKGrandSlamRequestProvider signRequest:error:](&v10, "signRequest:error:", v6, a4);
  if (v7)
  {
    if (CFPreferencesGetAppBooleanValue(@"tamperDCRT", @"com.apple.authkit", 0LL))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([@"overrideDCRTCertForTesting" dataUsingEncoding:4]);
      objc_msgSend(v6, "ak_addHeaderForDCRT:", v8);
    }

    else
    {
      objc_msgSend(v6, "ak_addHeaderForDCRT:", self->_certs);
    }

    objc_msgSend(v6, "ak_addAttestationDataHeaders");
  }

  return v7;
}

- (NSString)attestationNonce
{
  return self->_attestationNonce;
}

- (void)setAttestationNonce:(id)a3
{
}

- (NSData)attestedData
{
  return self->_attestedData;
}

- (void)setAttestedData:(id)a3
{
}

- (NSData)certs
{
  return self->_certs;
}

- (void)setCerts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end