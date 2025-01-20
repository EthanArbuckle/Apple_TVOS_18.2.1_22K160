@interface IDSHomeKitCloudRelayUserAccessTokensMessage
- (NSArray)accessoryRequests;
- (NSArray)responseAccessTokens;
- (NSString)serviceUserID;
- (NSString)userHandle;
- (NSString)userID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setAccessoryRequests:(id)a3;
- (void)setResponseAccessTokens:(id)a3;
- (void)setServiceUserID:(id)a3;
- (void)setUserHandle:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayUserAccessTokensMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayUserAccessTokensMessage;
  id v4 = -[IDSHomeKitCloudRelayUserAccessTokensMessage copyWithZone:](&v12, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage subService](self, "subService"));
  [v4 setSubService:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage serviceUserID](self, "serviceUserID"));
  [v4 setServiceUserID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage userID](self, "userID"));
  [v4 setUserID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage userHandle](self, "userHandle"));
  [v4 setUserHandle:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage accessoryRequests](self, "accessoryRequests"));
  [v4 setAccessoryRequests:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage responseAccessTokens](self, "responseAccessTokens"));
  [v4 setResponseAccessTokens:v10];

  return v4;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayUserAccessTokensMessage;
  id v3 = -[IDSHomeKitCloudRelayUserAccessTokensMessage additionalMessageHeaders](&v9, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage subService](self, "subService"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006960B4();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage serviceUserID](self, "serviceUserID"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"x-service-user-id", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696034();
  }

  return Mutable;
}

- (id)messageBody
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage userID](self, "userID"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"user-id", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006961B4();
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage userHandle](self, "userHandle"));
  if (v5)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"user-handle", v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100696134();
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayUserAccessTokensMessage accessoryRequests](self, "accessoryRequests"));
  if (v6) {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"tokens", v6);
  }

  return v3;
}

- (id)bagKey
{
  return @"id-get-user-token";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 _arrayForKey:@"access-tokens"]);
  if (v4)
  {
    v5 = v4;
    -[IDSHomeKitCloudRelayUserAccessTokensMessage setResponseAccessTokens:](self, "setResponseAccessTokens:", v4);
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

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setUserID:(id)a3
{
}

- (NSString)userHandle
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setUserHandle:(id)a3
{
}

- (NSArray)accessoryRequests
{
  return (NSArray *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setAccessoryRequests:(id)a3
{
}

- (NSArray)responseAccessTokens
{
  return (NSArray *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setResponseAccessTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end