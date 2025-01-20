@interface IDSAuthenticateMessage
- (BOOL)allowsServerProvidedLenientAnisetteTimeout;
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSAuthenticateMessage)init;
- (NSData)csr;
- (NSData)responseCertificate;
- (NSDictionary)authenticationInfo;
- (NSString)realm;
- (NSString)responseUserID;
- (NSString)userID;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthenticationInfo:(id)a3;
- (void)setCsr:(id)a3;
- (void)setRealm:(id)a3;
- (void)setResponseCertificate:(id)a3;
- (void)setResponseUserID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSAuthenticateMessage

- (IDSAuthenticateMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSAuthenticateMessage;
  v2 = -[IDSAuthenticateMessage init](&v7, "init");
  if (v2)
  {
    id v6 = 0LL;
    IMGetConferenceSettings(0LL, 0LL, &v6, 0LL, 0LL);
    id v3 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    -[IDSAuthenticateMessage setTopic:](v2, "setTopic:", v4);

    -[IDSAuthenticateMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSAuthenticateMessage;
  id v4 = -[IDSAuthenticateMessage copyWithZone:](&v12, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage realm](self, "realm"));
  [v4 setRealm:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage csr](self, "csr"));
  [v4 setCsr:v6];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage userID](self, "userID"));
  [v4 setUserID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage authenticationInfo](self, "authenticationInfo"));
  [v4 setAuthenticationInfo:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage responseUserID](self, "responseUserID"));
  [v4 setResponseUserID:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage responseCertificate](self, "responseCertificate"));
  [v4 setResponseCertificate:v10];

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

- (BOOL)wantsBAASigning
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage realm](self, "realm"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"id-authenticate-%@",  v2));

  return v3;
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"csr");
  -[NSMutableArray addObject:](v2, "addObject:", @"realm-user-id");
  -[NSMutableArray addObject:](v2, "addObject:", @"authentication-data");
  return v2;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSAuthenticateMessage;
  id v3 = -[IDSAuthenticateMessage messageBody](&v10, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage csr](self, "csr"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"csr", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069669C();
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage userID](self, "userID"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"realm-user-id", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069661C();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage authenticationInfo](self, "authenticationInfo"));
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"authentication-data", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069659C();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSAuthenticateMessage;
  id v3 = -[IDSAuthenticateMessage additionalMessageHeaders](&v11, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v6 = _IDSIDProtocolVersionNumber();
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);

  if (v8)
  {
    CFDictionarySetValue(Mutable, @"x-protocol-version", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069671C();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage dsAuthID](self, "dsAuthID"));
  if (v9) {
    CFDictionarySetValue(Mutable, @"x-ds-client-id", v9);
  }

  return Mutable;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)allowsServerProvidedLenientAnisetteTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateMessage realm](self, "realm"));
  unsigned __int8 v3 = [v2 isEqualToString:@"phone-number"];

  return v3;
}

- (BOOL)requiresPushTokenKeys
{
  return 0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v9 = a3;
  if (_IMWillLog(@"Registration", v4))
  {
    id v8 = v9;
    _IMAlwaysLog(0LL, @"Registration", @"IDS Authentication response: %@");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", @"cert", v8));
  -[IDSAuthenticateMessage setResponseCertificate:](self, "setResponseCertificate:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"user-id"]);
  -[IDSAuthenticateMessage setResponseUserID:](self, "setResponseUserID:", v6);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"alert"]);
  -[IDSAuthenticateMessage setResponseAlertInfo:](self, "setResponseAlertInfo:", v7);
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setRealm:(id)a3
{
}

- (NSData)csr
{
  return (NSData *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setCsr:(id)a3
{
}

- (NSDictionary)authenticationInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setAuthenticationInfo:(id)a3
{
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setUserID:(id)a3
{
}

- (NSData)responseCertificate
{
  return (NSData *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setResponseCertificate:(id)a3
{
}

- (NSString)responseUserID
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setResponseUserID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end