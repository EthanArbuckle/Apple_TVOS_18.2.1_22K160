@interface IDSGetDependentRegistrationMessage
- (BOOL)requiresPushTokenKeys;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsHTTPHeaders;
- (IDSGetDependentRegistrationMessage)init;
- (NSArray)responseRegistrations;
- (double)anisetteHeadersTimeout;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (int64_t)command;
- (int64_t)responseCommand;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseRegistrations:(id)a3;
@end

@implementation IDSGetDependentRegistrationMessage

- (IDSGetDependentRegistrationMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSGetDependentRegistrationMessage;
  v2 = -[IDSGetDependentRegistrationMessage init](&v7, "init");
  if (v2)
  {
    id v6 = 0LL;
    IMGetConferenceSettings(0LL, 0LL, &v6, 0LL, 0LL);
    id v3 = v6;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);
    -[IDSGetDependentRegistrationMessage setTopic:](v2, "setTopic:", v4);

    -[IDSGetDependentRegistrationMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSGetDependentRegistrationMessage;
  id v4 = -[IDSGetDependentRegistrationMessage copyWithZone:](&v8, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetDependentRegistrationMessage service](self, "service"));
  [v4 setService:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetDependentRegistrationMessage responseRegistrations](self, "responseRegistrations"));
  [v4 setResponseRegistrations:v6];

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

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (id)bagKey
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"id-get-dependent-registrations");
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)messageBody
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSGetDependentRegistrationMessage;
  id v3 = -[IDSGetDependentRegistrationMessage messageBody](&v8, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetDependentRegistrationMessage service](self, "service"));
  if (v6) {
    CFDictionarySetValue(Mutable, @"service", v6);
  }

  return Mutable;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v8 = a3;
  if (_IMWillLog(@"Registration", v4))
  {
    id v7 = v8;
    _IMAlwaysLog(0LL, @"Registration", @"Get Dependent Registrations response: %@");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", @"registrations", v7));
  -[IDSGetDependentRegistrationMessage setResponseRegistrations:](self, "setResponseRegistrations:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"alert"]);
  -[IDSGetDependentRegistrationMessage setResponseAlertInfo:](self, "setResponseAlertInfo:", v6);
}

- (NSArray)responseRegistrations
{
  return (NSArray *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setResponseRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end