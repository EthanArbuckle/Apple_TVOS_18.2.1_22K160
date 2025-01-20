@interface IDSProvisionTemporaryPhoneMessage
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSProvisionTemporaryPhoneMessage)init;
- (NSData)responseCertificate;
- (NSDate)responseCertificateExpiration;
- (NSNumber)responseStatus;
- (NSString)authToken;
- (NSString)countryCode;
- (NSString)networkCode;
- (NSString)profileID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)addPhoneAuthenticationCertificate:(id)a3 withUserID:(id)a4;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setNetworkCode:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setResponseCertificate:(id)a3;
- (void)setResponseCertificateExpiration:(id)a3;
- (void)setResponseStatus:(id)a3;
@end

@implementation IDSProvisionTemporaryPhoneMessage

- (IDSProvisionTemporaryPhoneMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSProvisionTemporaryPhoneMessage;
  v2 = -[IDSProvisionTemporaryPhoneMessage init](&v7, "init");
  if (v2)
  {
    id v6 = 0LL;
    IMGetConferenceSettings(0LL, 0LL, &v6, 0LL, 0LL);
    id v3 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    -[IDSProvisionTemporaryPhoneMessage setTopic:](v2, "setTopic:", v4);

    -[IDSProvisionTemporaryPhoneMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }

  return v2;
}

- (void)addPhoneAuthenticationCertificate:(id)a3 withUserID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  -[IDSProvisionTemporaryPhoneMessage addAuthUserID:certificate:privateKey:publicKey:]( self,  "addAuthUserID:certificate:privateKey:publicKey:",  v6,  v7,  [v8 identityPrivateKey],  objc_msgSend(v8, "identityPublicKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSProvisionTemporaryPhoneMessage;
  id v4 = -[IDSProvisionTemporaryPhoneMessage copyWithZone:](&v13, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage profileID](self, "profileID"));
  [v4 setProfileID:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage authToken](self, "authToken"));
  [v4 setAuthToken:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage countryCode](self, "countryCode"));
  [v4 setCountryCode:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage networkCode](self, "networkCode"));
  [v4 setNetworkCode:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage responseStatus](self, "responseStatus"));
  [v4 setResponseStatus:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage responseCertificate](self, "responseCertificate"));
  [v4 setResponseCertificate:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProvisionTemporaryPhoneMessage responseCertificateExpiration]( self,  "responseCertificateExpiration"));
  [v4 setResponseCertificateExpiration:v11];

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
  return @"id-provision-temporary";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"vc-profile-id");
  -[NSMutableArray addObject:](v2, "addObject:", @"vc-auth-token");
  return v2;
}

- (id)messageBody
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSProvisionTemporaryPhoneMessage;
  id v3 = -[IDSProvisionTemporaryPhoneMessage messageBody](&v11, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage profileID](self, "profileID"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"vc-profile-id", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069CB58();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage authToken](self, "authToken"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"vc-auth-token", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069CAD8();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage countryCode](self, "countryCode"));
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"sim-mcc", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069CA58();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage networkCode](self, "networkCode"));
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"sim-mnc", v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069C9D8();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSProvisionTemporaryPhoneMessage;
  id v3 = -[IDSProvisionTemporaryPhoneMessage additionalMessageHeaders](&v11, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage pushCertificate](self, "pushCertificate"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _FTStringFromBaseData]);

  if (v7)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006940A0();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage pushToken](self, "pushToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _FTStringFromBaseData]);

  if (v9)
  {
    CFDictionarySetValue(Mutable, @"x-push-token", v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069CBD8();
  }

  return Mutable;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDS Provision Temporary Phone response: %@",  (uint8_t *)&v18,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"status"]);
  -[IDSProvisionTemporaryPhoneMessage setResponseStatus:](self, "setResponseStatus:", v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage responseStatus](self, "responseStatus"));
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProvisionTemporaryPhoneMessage responseStatus](self, "responseStatus"));
    id v10 = [v9 integerValue];

    if (!v10)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"temporary-credential"]);
      -[IDSProvisionTemporaryPhoneMessage setResponseCertificate:](self, "setResponseCertificate:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"expiry"]);
      objc_super v13 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v13, "numberFromString:", v12));
      if (v14)
      {
        uint64_t v15 = +[IMUserDefaults homeNumberSecondsUntilExpiration]( &OBJC_CLASS___IMUserDefaults,  "homeNumberSecondsUntilExpiration");
        if (CUTIsInternalInstall() && v15) {
          uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  (double)v15));
        }
        else {
          uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)((unint64_t)[v14 unsignedLongLongValue] / 0x3E8)));
        }
        v17 = (os_log_s *)v16;
        -[IDSProvisionTemporaryPhoneMessage setResponseCertificateExpiration:]( self,  "setResponseCertificateExpiration:",  v16);
      }

      else
      {
        if (!v12)
        {
LABEL_15:

          goto LABEL_16;
        }

        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          sub_10069CC58((uint64_t)v12, v17);
        }
      }

      goto LABEL_15;
    }
  }

- (NSString)profileID
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setProfileID:(id)a3
{
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setAuthToken:(id)a3
{
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)networkCode
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setNetworkCode:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSData)responseCertificate
{
  return (NSData *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setResponseCertificate:(id)a3
{
}

- (NSDate)responseCertificateExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setResponseCertificateExpiration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end