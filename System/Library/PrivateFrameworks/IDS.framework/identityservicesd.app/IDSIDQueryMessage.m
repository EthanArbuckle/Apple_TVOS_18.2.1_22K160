@interface IDSIDQueryMessage
- (BOOL)allowDualDelivery;
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)isForced;
- (BOOL)requiresPushTokenKeys;
- (BOOL)resultExpected;
- (BOOL)wantsBodySignature;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsManagedRetries;
- (IDSIDQueryMessage)init;
- (NSArray)uris;
- (NSDictionary)responseIdentities;
- (NSString)requiredForMessaging;
- (NSString)weight;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)additionalQueryStringParameters;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataUsageBundleIdentifier;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setIsForced:(BOOL)a3;
- (void)setRequiredForMessaging:(id)a3;
- (void)setResponseIdentities:(id)a3;
- (void)setResultExpected:(BOOL)a3;
- (void)setURIs:(id)a3;
- (void)setWeight:(id)a3;
@end

@implementation IDSIDQueryMessage

- (IDSIDQueryMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSIDQueryMessage;
  v2 = -[IDSIDQueryMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSIDQueryMessage setTimeout:](v2, "setTimeout:", 20.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSIDQueryMessage;
  id v4 = -[IDSIDQueryMessage copyWithZone:](&v10, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage uris](self, "uris"));
  [v4 setURIs:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage weight](self, "weight"));
  [v4 setWeight:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage responseIdentities](self, "responseIdentities"));
  [v4 setResponseIdentities:v7];

  -[IDSIDQueryMessage timeout](self, "timeout");
  objc_msgSend(v4, "setTimeout:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage requiredForMessaging](self, "requiredForMessaging"));
  [v4 setRequiredForMessaging:v8];

  objc_msgSend(v4, "setResultExpected:", -[IDSIDQueryMessage resultExpected](self, "resultExpected"));
  objc_msgSend(v4, "setIsForced:", -[IDSIDQueryMessage isForced](self, "isForced"));
  return v4;
}

- (id)additionalQueryStringParameters
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSIDQueryMessage;
  id v3 = -[IDSIDQueryMessage additionalQueryStringParameters](&v8, "additionalQueryStringParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage weight](self, "weight"));
  if (v6) {
    CFDictionarySetValue(Mutable, @"weight", v6);
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSIDQueryMessage;
  id v3 = -[IDSIDQueryMessage additionalMessageHeaders](&v10, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage service](self, "service"));
  if (v6) {
    CFDictionarySetValue(Mutable, @"x-id-service", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage subService](self, "subService"));
  if (v7) {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v7);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage requiredForMessaging](self, "requiredForMessaging"));
  if (v8) {
    CFDictionarySetValue(Mutable, @"x-required-for-message", v8);
  }

  if (self->_resultExpected) {
    CFDictionarySetValue(Mutable, @"x-result-expected", @"true");
  }
  if (self->_isForced) {
    CFDictionarySetValue(Mutable, @"x-is-forced-query", @"true");
  }
  return Mutable;
}

- (BOOL)wantsManagedRetries
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  return 0;
}

- (BOOL)allowDualDelivery
{
  return 1;
}

- (BOOL)wantsBodySignature
{
  return 1;
}

- (id)dataUsageBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage service](self, "service"));
  unsigned int v3 = [v2 isEqualToString:@"com.apple.madrid"];

  if (v3) {
    id v4 = kFZTextAppBundleIdentifier;
  }
  else {
    id v4 = 0LL;
  }
  return v4;
}

- (id)bagKey
{
  return @"id-query";
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)messageBody
{
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage uris](self, "uris"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"uris", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A45B0();
  }

  return v3;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage selfURI](self, "selfURI"));

  if (!v6)
  {
    _IMWarn(@"Missing self identity");
    -[NSMutableArray addObject:](v5, "addObject:", @"self URI");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDQueryMessage uris](self, "uris"));
  id v8 = [v7 count];

  if (!v8)
  {
    _IMWarn(@"Missing uris");
    -[NSMutableArray addObject:](v5, "addObject:", @"uris");
  }

  if (*a3 && -[NSMutableArray count](v5, "count")) {
    *a3 = v5;
  }
  if (-[NSMutableArray count](v5, "count"))
  {
    BOOL v9 = 0;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___IDSIDQueryMessage;
    BOOL v9 = -[IDSIDQueryMessage hasRequiredKeys:](&v11, "hasRequiredKeys:", a3);
  }

  return v9;
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v7 = a3;
  if (_IMWillLog(@"iMessage", v4))
  {
    id v6 = v7;
    _IMAlwaysLog(0LL, @"iMessage", @"Handle ID query response: %@");
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_dictionaryForKey:", @"results", v6));
  if (v5) {
    -[IDSIDQueryMessage setResponseIdentities:](self, "setResponseIdentities:", v5);
  }
}

- (double)anisetteHeadersTimeout
{
  return 0.1;
}

- (NSArray)uris
{
  return (NSArray *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setURIs:(id)a3
{
}

- (NSString)weight
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setWeight:(id)a3
{
}

- (NSDictionary)responseIdentities
{
  return (NSDictionary *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setResponseIdentities:(id)a3
{
}

- (NSString)requiredForMessaging
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setRequiredForMessaging:(id)a3
{
}

- (BOOL)resultExpected
{
  return self->_resultExpected;
}

- (void)setResultExpected:(BOOL)a3
{
  self->_resultExpected = a3;
}

- (BOOL)isForced
{
  return self->_isForced;
}

- (void)setIsForced:(BOOL)a3
{
  self->_isForced = a3;
}

- (void).cxx_destruct
{
}

@end