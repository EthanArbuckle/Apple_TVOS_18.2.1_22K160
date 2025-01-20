@interface IDSHomeKitCloudRelayConsentTokensMessage
- (NSArray)accessoryIDs;
- (NSArray)responseConsentTokens;
- (NSString)adminID;
- (NSString)expiry;
- (NSString)serviceUserID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setAccessoryIDs:(id)a3;
- (void)setAdminID:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setResponseConsentTokens:(id)a3;
- (void)setServiceUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayConsentTokensMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayConsentTokensMessage;
  id v4 = -[IDSHomeKitCloudRelayConsentTokensMessage copyWithZone:](&v12, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage subService](self, "subService"));
  [v4 setSubService:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage serviceUserID](self, "serviceUserID"));
  [v4 setServiceUserID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage accessoryIDs](self, "accessoryIDs"));
  [v4 setAccessoryIDs:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage adminID](self, "adminID"));
  [v4 setAdminID:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage expiry](self, "expiry"));
  [v4 setExpiry:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage responseConsentTokens](self, "responseConsentTokens"));
  [v4 setResponseConsentTokens:v10];

  return v4;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayConsentTokensMessage;
  id v3 = -[IDSHomeKitCloudRelayConsentTokensMessage additionalMessageHeaders](&v9, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage subService](self, "subService"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6EF4();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage serviceUserID](self, "serviceUserID"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"x-service-user-id", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6E74();
  }

  return Mutable;
}

- (id)messageBody
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage accessoryIDs](self, "accessoryIDs"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"accessory-ids", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A795C();
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage adminID](self, "adminID"));
  if (v5)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"admin-id", v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A78DC();
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayConsentTokensMessage expiry](self, "expiry"));
  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"expiry", v6);
  }

  return v3;
}

- (id)bagKey
{
  return @"id-get-consent-token";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 _arrayForKey:@"consent-tokens"]);
  if (v4)
  {
    v5 = v4;
    -[IDSHomeKitCloudRelayConsentTokensMessage setResponseConsentTokens:](self, "setResponseConsentTokens:", v4);
    id v4 = v5;
  }
}

- (NSString)serviceUserID
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setServiceUserID:(id)a3
{
}

- (NSArray)accessoryIDs
{
  return (NSArray *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setAccessoryIDs:(id)a3
{
}

- (NSString)adminID
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setAdminID:(id)a3
{
}

- (NSString)expiry
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setExpiry:(id)a3
{
}

- (NSArray)responseConsentTokens
{
  return (NSArray *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setResponseConsentTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end