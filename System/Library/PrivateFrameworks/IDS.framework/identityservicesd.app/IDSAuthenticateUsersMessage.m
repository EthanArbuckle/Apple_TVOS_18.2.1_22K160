@interface IDSAuthenticateUsersMessage
- (BOOL)allowsServerProvidedLenientAnisetteTimeout;
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSAuthenticateUsersMessage)init;
- (NSArray)authenticationResponses;
- (NSData)pushToken;
- (NSMutableArray)requests;
- (NSString)realm;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)_addRequestWithID:(id)a3 cert:(id)a4 sig:(id)a5 csr:(id)a6 tag:(id)a7;
- (void)addRequestWithID:(id)a3 cert:(id)a4;
- (void)addRequestWithID:(id)a3 sig:(id)a4 csr:(id)a5 tag:(id)a6;
- (void)handleResponseDictionary:(id)a3;
- (void)setAuthenticationResponses:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRealm:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation IDSAuthenticateUsersMessage

- (IDSAuthenticateUsersMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSAuthenticateUsersMessage;
  v2 = -[IDSAuthenticateUsersMessage init](&v7, "init");
  if (v2)
  {
    id v6 = 0LL;
    IMGetConferenceSettings(0LL, 0LL, &v6, 0LL, 0LL);
    id v3 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    -[IDSAuthenticateUsersMessage setTopic:](v2, "setTopic:", v4);

    -[IDSAuthenticateUsersMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSAuthenticateUsersMessage;
  id v4 = -[IDSAuthenticateUsersMessage copyWithZone:](&v11, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateUsersMessage realm](self, "realm"));
  [v4 setRealm:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateUsersMessage requests](self, "requests"));
  id v7 = [v6 copy];
  [v4 setRequests:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateUsersMessage authenticationResponses](self, "authenticationResponses"));
  id v9 = [v8 copy];
  [v4 setAuthenticationResponses:v9];

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

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (id)bagKey
{
  return @"id-authenticate-multiple-users";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"authentication-requests");
  -[NSMutableArray addObject:](v2, "addObject:", @"push-token");
  return v2;
}

- (id)messageBody
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSAuthenticateUsersMessage;
  id v3 = -[IDSAuthenticateUsersMessage messageBody](&v9, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateUsersMessage requests](self, "requests"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"authentication-requests", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A3AE0();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAuthenticateUsersMessage pushToken](self, "pushToken"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"push-token", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A3A60();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSAuthenticateUsersMessage;
  id v2 = -[IDSAuthenticateUsersMessage additionalMessageHeaders](&v9, "additionalMessageHeaders");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v5 = _IDSIDProtocolVersionNumber();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);

  if (v7)
  {
    CFDictionarySetValue(Mutable, @"x-protocol-version", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A3B60();
  }

  return Mutable;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (BOOL)allowsServerProvidedLenientAnisetteTimeout
{
  return 1;
}

- (void)addRequestWithID:(id)a3 cert:(id)a4
{
}

- (void)addRequestWithID:(id)a3 sig:(id)a4 csr:(id)a5 tag:(id)a6
{
}

- (void)_addRequestWithID:(id)a3 cert:(id)a4 sig:(id)a5 csr:(id)a6 tag:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!self->_requests)
  {
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    requests = self->_requests;
    self->_requests = v17;
  }

  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v20 = v12;
  if (v20)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v19, @"user-id", v20);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A3C60();
  }

  id v21 = v15;
  if (v21)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v19, @"csr", v21);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A3BE0();
  }

  if (v14) {
    CFDictionarySetValue((CFMutableDictionaryRef)v19, @"sig", v14);
  }
  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v19, @"auth-cert", v13);
  }
  if (v16) {
    CFDictionarySetValue((CFMutableDictionaryRef)v19, @"tag", v16);
  }
  -[NSMutableArray addObject:](self->_requests, "addObject:", v19);
}

- (void)handleResponseDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v15 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 _arrayForKey:@"authentication-responses"]);
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v8);
        v10 = objc_alloc_init(&OBJC_CLASS___IDSAuthenticateUsersResponse);
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 _dataForKey:@"cert"]);
        -[IDSAuthenticateUsersResponse setCert:](v10, "setCert:", v11);

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 _numberForKey:@"status"]);
        -[IDSAuthenticateUsersResponse setResponseCode:](v10, "setResponseCode:", [v12 integerValue]);

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 _stringForKey:@"user-id"]);
        -[IDSAuthenticateUsersResponse setUserID:](v10, "setUserID:", v13);

        -[NSMutableArray addObject:](v4, "addObject:", v10);
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v6);
  }

  -[IDSAuthenticateUsersMessage setAuthenticationResponses:](self, "setAuthenticationResponses:", v4);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setRealm:(id)a3
{
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSArray)authenticationResponses
{
  return self->_authenticationResponses;
}

- (void)setAuthenticationResponses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end