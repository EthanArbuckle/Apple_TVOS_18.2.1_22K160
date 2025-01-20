@interface IDSValidateCredentialsMessage
- (NSData)authenticationDataSig;
- (NSNumber)responseOrigin;
- (NSNumber)responseStatus;
- (NSString)authenticationDataAuthToken;
- (NSString)authenticationDataUserID;
- (NSString)responseMessage;
- (NSString)responseUserID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthenticationDataAuthToken:(id)a3;
- (void)setAuthenticationDataSig:(id)a3;
- (void)setAuthenticationDataUserID:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseOrigin:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setResponseUserID:(id)a3;
@end

@implementation IDSValidateCredentialsMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSValidateCredentialsMessage;
  id v4 = -[IDSValidateCredentialsMessage copyWithZone:](&v13, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage authenticationDataSig](self, "authenticationDataSig"));
  [v4 setAuthenticationDataSig:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage authenticationDataAuthToken](self, "authenticationDataAuthToken"));
  [v4 setAuthenticationDataAuthToken:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage authenticationDataUserID](self, "authenticationDataUserID"));
  [v4 setAuthenticationDataUserID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage responseUserID](self, "responseUserID"));
  [v4 setResponseUserID:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage responseStatus](self, "responseStatus"));
  [v4 setResponseStatus:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage responseOrigin](self, "responseOrigin"));
  [v4 setResponseOrigin:v11];

  return v4;
}

- (id)additionalMessageHeaders
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IDSValidateCredentialsMessage;
  id v3 = -[IDSValidateCredentialsMessage additionalMessageHeaders](&v17, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage pushCertificate](self, "pushCertificate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _FTStringFromBaseData]);

  if (v7)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v7);
  }

  else
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_10069AF78(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return Mutable;
}

- (id)messageBody
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage authenticationDataUserID](self, "authenticationDataUserID"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"user-id", v4);
  }

  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_10069B004(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage authenticationDataSig](self, "authenticationDataSig"));
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"sig", v13);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSValidateCredentialsMessage authenticationDataAuthToken](self, "authenticationDataAuthToken"));
  if (v14) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"auth-token", v14);
  }

  uint64_t v15 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v3,  @"authentication-data",  0LL);
  return v15;
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)bagKey
{
  return @"id-validate-credentials";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"message"]);
  -[IDSValidateCredentialsMessage setResponseMessage:](self, "setResponseMessage:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"user-id"]);
  -[IDSValidateCredentialsMessage setResponseUserID:](self, "setResponseUserID:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"status"]);
  -[IDSValidateCredentialsMessage setResponseStatus:](self, "setResponseStatus:", v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"origin"]);
  -[IDSValidateCredentialsMessage setResponseOrigin:](self, "setResponseOrigin:", v8);
}

- (NSData)authenticationDataSig
{
  return (NSData *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setAuthenticationDataSig:(id)a3
{
}

- (NSString)authenticationDataAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setAuthenticationDataAuthToken:(id)a3
{
}

- (NSString)authenticationDataUserID
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setAuthenticationDataUserID:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (NSString)responseUserID
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setResponseUserID:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSNumber)responseOrigin
{
  return (NSNumber *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setResponseOrigin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end