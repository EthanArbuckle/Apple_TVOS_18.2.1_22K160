@interface IDSProvisionDeviceIdentityMessage
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsBodySignature;
- (BOOL)wantsBodySigningOnly;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (NSArray)responseHandles;
- (NSData)csr;
- (NSData)responseCert;
- (NSData)validationData;
- (NSString)responseUserID;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setCsr:(id)a3;
- (void)setResponseCert:(id)a3;
- (void)setResponseHandles:(id)a3;
- (void)setResponseUserID:(id)a3;
- (void)setValidationData:(id)a3;
@end

@implementation IDSProvisionDeviceIdentityMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSProvisionDeviceIdentityMessage;
  id v4 = -[IDSProvisionDeviceIdentityMessage copyWithZone:](&v11, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionDeviceIdentityMessage csr](self, "csr"));
  [v4 setCsr:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionDeviceIdentityMessage responseCert](self, "responseCert"));
  [v4 setResponseCert:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionDeviceIdentityMessage responseUserID](self, "responseUserID"));
  [v4 setResponseUserID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionDeviceIdentityMessage responseHandles](self, "responseHandles"));
  id v9 = [v8 copy];
  [v4 setResponseHandles:v9];

  return v4;
}

- (id)bagKey
{
  return @"id-provision-device-identity";
}

- (BOOL)wantsBodySigningOnly
{
  return 0;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (BOOL)wantsBagKey
{
  return 1;
}

- (BOOL)wantsHTTPHeaders
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 1;
}

- (BOOL)wantsBinaryPush
{
  return 1;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"csr");
  return v2;
}

- (id)messageBody
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProvisionDeviceIdentityMessage;
  id v3 = -[IDSProvisionDeviceIdentityMessage messageBody](&v8, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionDeviceIdentityMessage csr](self, "csr"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"csr", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069FB14();
  }

  return Mutable;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"cert"]);
  -[IDSProvisionDeviceIdentityMessage setResponseCert:](self, "setResponseCert:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"user-id"]);
  -[IDSProvisionDeviceIdentityMessage setResponseUserID:](self, "setResponseUserID:", v6);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
  id v9 = sub_1001987CC(v8, v4, @"handles");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__imArrayByApplyingBlock:", &stru_1008FC6E0));
  -[IDSProvisionDeviceIdentityMessage setResponseHandles:](self, "setResponseHandles:", v11);
}

- (NSData)csr
{
  return (NSData *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setCsr:(id)a3
{
}

- (NSData)validationData
{
  return (NSData *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setValidationData:(id)a3
{
}

- (NSData)responseCert
{
  return (NSData *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setResponseCert:(id)a3
{
}

- (NSString)responseUserID
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setResponseUserID:(id)a3
{
}

- (NSArray)responseHandles
{
  return (NSArray *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setResponseHandles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end