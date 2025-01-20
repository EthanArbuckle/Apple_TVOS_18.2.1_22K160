@interface IDSValidationCertificateMessage
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsHTTPHeaders;
- (IDSValidationCertificateMessage)init;
- (NSData)pushToken;
- (NSData)responseCertificateData;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setResponseCertificateData:(id)a3;
@end

@implementation IDSValidationCertificateMessage

- (IDSValidationCertificateMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSValidationCertificateMessage;
  v2 = -[IDSValidationCertificateMessage init](&v7, "init");
  if (v2)
  {
    id v6 = 0LL;
    IMGetConferenceSettings(0LL, 0LL, &v6, 0LL, 0LL);
    id v3 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    -[IDSValidationCertificateMessage setTopic:](v2, "setTopic:", v4);

    -[IDSValidationCertificateMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSValidationCertificateMessage;
  id v4 = -[IDSValidationCertificateMessage copyWithZone:](&v8, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationCertificateMessage responseCertificateData](self, "responseCertificateData"));
  [v4 setResponseCertificateData:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidationCertificateMessage pushToken](self, "pushToken"));
  [v4 setPushToken:v6];

  return v4;
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

- (BOOL)wantsHTTPGet
{
  return 1;
}

- (int64_t)command
{
  return 96LL;
}

- (int64_t)responseCommand
{
  return 97LL;
}

- (id)bagKey
{
  return @"id-validation-cert";
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)messageBody
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
}

- (id)additionalMessageHeaders
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSValidationCertificateMessage;
  id v2 = -[IDSValidationCertificateMessage additionalMessageHeaders](&v6, "additionalMessageHeaders");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v3 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return Mutable;
}

- (void)handleResponseDictionary:(id)a3
{
  id v7 = a3;
  if (_IMWillLog(@"Registration", v4))
  {
    id v6 = v7;
    _IMAlwaysLog(0LL, @"Registration", @"Initialize Cert Response: %@");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", @"cert", v6));
  -[IDSValidationCertificateMessage setResponseCertificateData:](self, "setResponseCertificateData:", v5);
}

- (NSData)responseCertificateData
{
  return self->_responseCertificateData;
}

- (void)setResponseCertificateData:(id)a3
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