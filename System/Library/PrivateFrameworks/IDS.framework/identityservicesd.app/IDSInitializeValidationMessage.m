@interface IDSInitializeValidationMessage
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsHTTPHeaders;
- (IDSInitializeValidationMessage)init;
- (NSData)absintheHello;
- (NSData)pushToken;
- (NSData)responseAbsintheResponse;
- (NSData)responseAbsintheServKey;
- (NSData)responseSessionInfo;
- (NSData)sessionInfoRequest;
- (NSNumber)responseTTL;
- (NSString)absintheUDID;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setAbsintheHello:(id)a3;
- (void)setAbsintheUDID:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setResponseAbsintheResponse:(id)a3;
- (void)setResponseAbsintheServKey:(id)a3;
- (void)setResponseSessionInfo:(id)a3;
- (void)setResponseTTL:(id)a3;
- (void)setSessionInfoRequest:(id)a3;
@end

@implementation IDSInitializeValidationMessage

- (IDSInitializeValidationMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSInitializeValidationMessage;
  v2 = -[IDSInitializeValidationMessage init](&v7, "init");
  if (v2)
  {
    id v6 = 0LL;
    IMGetConferenceSettings(0LL, 0LL, &v6, 0LL, 0LL);
    id v3 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    -[IDSInitializeValidationMessage setTopic:](v2, "setTopic:", v4);

    -[IDSInitializeValidationMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSInitializeValidationMessage;
  id v4 = -[IDSInitializeValidationMessage copyWithZone:](&v14, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage pushToken](self, "pushToken"));
  [v4 setPushToken:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage sessionInfoRequest](self, "sessionInfoRequest"));
  [v4 setSessionInfoRequest:v6];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage responseSessionInfo](self, "responseSessionInfo"));
  [v4 setResponseSessionInfo:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage responseTTL](self, "responseTTL"));
  [v4 setResponseTTL:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage absintheUDID](self, "absintheUDID"));
  [v4 setAbsintheUDID:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage absintheHello](self, "absintheHello"));
  [v4 setAbsintheHello:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage responseAbsintheServKey](self, "responseAbsintheServKey"));
  [v4 setResponseAbsintheServKey:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage responseAbsintheResponse](self, "responseAbsintheResponse"));
  [v4 setResponseAbsintheResponse:v12];

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
  return 0;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
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
  return @"id-initialize-validation";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"session-info-request");
  return v2;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSInitializeValidationMessage;
  id v3 = -[IDSInitializeValidationMessage messageBody](&v10, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage sessionInfoRequest](self, "sessionInfoRequest"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"session-info-request", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB758();
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage absintheUDID](self, "absintheUDID"));
  if (v7) {
    CFDictionarySetValue(Mutable, @"absinthe-udid", v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage absintheHello](self, "absintheHello"));
  if (v8) {
    CFDictionarySetValue(Mutable, @"absinthe-hello", v8);
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSInitializeValidationMessage;
  id v3 = -[IDSInitializeValidationMessage additionalMessageHeaders](&v12, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInitializeValidationMessage pushToken](self, "pushToken"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _FTStringFromBaseData]);

  if (v7) {
    CFDictionarySetValue(Mutable, @"x-push-token", v7);
  }

  uint64_t v8 = _IDSIDProtocolVersionNumber();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);

  if (v10) {
    CFDictionarySetValue(Mutable, @"x-protocol-version", v10);
  }

  return Mutable;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v10 = a3;
  if (_IMWillLog(@"Registration", v4))
  {
    id v9 = v10;
    _IMAlwaysLog(0LL, @"Registration", @"Initialize Validation Response: %@");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", @"session-info", v9));
  -[IDSInitializeValidationMessage setResponseSessionInfo:](self, "setResponseSessionInfo:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ttl"]);
  -[IDSInitializeValidationMessage setResponseTTL:](self, "setResponseTTL:", v6);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"absinthe-serv-key"]);
  -[IDSInitializeValidationMessage setResponseAbsintheServKey:](self, "setResponseAbsintheServKey:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"absinthe-response"]);
  -[IDSInitializeValidationMessage setResponseAbsintheResponse:](self, "setResponseAbsintheResponse:", v8);
}

- (NSData)sessionInfoRequest
{
  return self->_sessionInfoRequest;
}

- (void)setSessionInfoRequest:(id)a3
{
}

- (NSData)responseSessionInfo
{
  return self->_responseSessionInfo;
}

- (void)setResponseSessionInfo:(id)a3
{
}

- (NSNumber)responseTTL
{
  return self->_responseTTL;
}

- (void)setResponseTTL:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)absintheUDID
{
  return self->_absintheUDID;
}

- (void)setAbsintheUDID:(id)a3
{
}

- (NSData)absintheHello
{
  return self->_absintheHello;
}

- (void)setAbsintheHello:(id)a3
{
}

- (NSData)responseAbsintheServKey
{
  return self->_responseAbsintheServKey;
}

- (void)setResponseAbsintheServKey:(id)a3
{
}

- (NSData)responseAbsintheResponse
{
  return self->_responseAbsintheResponse;
}

- (void)setResponseAbsintheResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end