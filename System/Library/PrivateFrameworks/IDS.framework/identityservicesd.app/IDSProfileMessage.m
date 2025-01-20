@interface IDSProfileMessage
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSProfileMessage)init;
- (NSData)pushCertificate;
- (NSData)pushToken;
- (NSString)authToken;
- (NSString)profileID;
- (__SecKey)pushPrivateKey;
- (__SecKey)pushPublicKey;
- (id)additionalMessageHeaders;
- (id)additionalMessageHeadersForOutgoingPush;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)dealloc;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setProfileID:(id)a3;
- (void)setPushCertificate:(id)a3;
- (void)setPushPrivateKey:(__SecKey *)a3;
- (void)setPushPublicKey:(__SecKey *)a3;
- (void)setPushToken:(id)a3;
@end

@implementation IDSProfileMessage

- (IDSProfileMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSProfileMessage;
  v2 = -[IDSProfileMessage init](&v7, "init");
  if (v2)
  {
    id v6 = 0LL;
    IMGetConferenceSettings(0LL, 0LL, &v6, 0LL, 0LL);
    id v3 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    -[IDSProfileMessage setTopic:](v2, "setTopic:", v4);

    -[IDSProfileMessage setTimeout:](v2, "setTimeout:", 60.0);
    -[IDSProfileMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSProfileMessage;
  id v4 = -[IDSProfileMessage copyWithZone:](&v10, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage authToken](self, "authToken"));
  [v4 setAuthToken:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage profileID](self, "profileID"));
  [v4 setProfileID:v6];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage pushCertificate](self, "pushCertificate"));
  [v4 setPushCertificate:v7];

  objc_msgSend(v4, "setPushPrivateKey:", -[IDSProfileMessage pushPrivateKey](self, "pushPrivateKey"));
  objc_msgSend(v4, "setPushPublicKey:", -[IDSProfileMessage pushPublicKey](self, "pushPublicKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage pushToken](self, "pushToken"));
  [v4 setPushToken:v8];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSProfileMessage;
  -[IDSProfileMessage dealloc](&v3, "dealloc");
}

- (void)setPushPublicKey:(__SecKey *)a3
{
  pushPublicKey = self->_pushPublicKey;
  if (pushPublicKey != a3)
  {
    if (pushPublicKey)
    {
      CFRelease(pushPublicKey);
      self->_pushPublicKey = 0LL;
    }

    if (a3)
    {
      self->_pushPublicKey = a3;
      CFRetain(a3);
    }
  }

- (void)setPushPrivateKey:(__SecKey *)a3
{
  pushKey = self->_pushKey;
  if (pushKey != a3)
  {
    if (pushKey)
    {
      CFRelease(pushKey);
      self->_pushKey = 0LL;
    }

    if (a3)
    {
      self->_pushKey = a3;
      CFRetain(a3);
    }
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

- (BOOL)hasRequiredKeys:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage authToken](self, "authToken"));
  id v6 = [v5 length];

  if (v6)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage profileID](self, "profileID"));
    id v8 = [v7 length];

    if (v8)
    {
      v12.receiver = self;
      v12.super_class = (Class)&OBJC_CLASS___IDSProfileMessage;
      return -[IDSProfileMessage hasRequiredKeys:](&v12, "hasRequiredKeys:", a3);
    }

    _IMWarn(@"No profile ID");
    if (a3)
    {
      objc_super v10 = @"profile-id";
      goto LABEL_8;
    }
  }

  else
  {
    _IMWarn(@"No auth token");
    if (a3)
    {
      objc_super v10 = @"auth token";
LABEL_8:
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v10));
      BOOL result = 0;
      *a3 = v11;
      return result;
    }
  }

  return 0;
}

- (id)additionalMessageHeadersForOutgoingPush
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSProfileMessage;
  id v3 = -[IDSProfileMessage additionalMessageHeaders](&v15, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage profileID](self, "profileID"));
  if (v6)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"vp", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069A15C();
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage authToken](self, "authToken"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _FTDataFromHexString]);

  if (v8)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"va", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069A0DC();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage authToken](self, "authToken"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _FTDataFromHexString]);

  if (v10)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"xp", v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699FDC();
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage dsAuthID](self, "dsAuthID"));
  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"x-ds-client-id", v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069A05C();
  }

  uint64_t v12 = _IDSIDProtocolVersionNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"xp", v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699FDC();
  }

  return v5;
}

- (id)additionalMessageHeaders
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSProfileMessage;
  id v3 = -[IDSProfileMessage additionalMessageHeaders](&v13, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage profileID](self, "profileID"));
  if (v6)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"x-vc-profile-id", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069A2DC();
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage authToken](self, "authToken"));
  if (v7)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"x-vc-auth-token", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069A25C();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileMessage dsAuthID](self, "dsAuthID"));
  if (v8)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"x-ds-client-id", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069A05C();
  }

  uint64_t v9 = _IDSIDProtocolVersionNumber();
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);

  if (v11)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"x-protocol-version", v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069A1DC();
  }

  return v5;
}

- (void)handleResponseDictionary:(id)a3
{
  id v7 = a3;
  if (_IMWillLog(@"Registration", v4))
  {
    id v6 = v7;
    _IMAlwaysLog(0LL, @"Registration", @"Profile response: %@");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", @"alert", v6));
  -[IDSProfileMessage setResponseAlertInfo:](self, "setResponseAlertInfo:", v5);
}

- (NSData)pushCertificate
{
  return self->_pushCert;
}

- (void)setPushCertificate:(id)a3
{
}

- (__SecKey)pushPrivateKey
{
  return self->_pushKey;
}

- (__SecKey)pushPublicKey
{
  return self->_pushPublicKey;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (NSString)profileID
{
  return self->_profileID;
}

- (void)setProfileID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end