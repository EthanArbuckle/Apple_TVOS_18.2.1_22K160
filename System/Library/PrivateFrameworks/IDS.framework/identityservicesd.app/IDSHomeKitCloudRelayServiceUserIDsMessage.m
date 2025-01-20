@interface IDSHomeKitCloudRelayServiceUserIDsMessage
- (NSArray)responseServiceUserIDs;
- (NSString)userID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseServiceUserIDs:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayServiceUserIDsMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayServiceUserIDsMessage;
  id v4 = -[IDSHomeKitCloudRelayServiceUserIDsMessage copyWithZone:](&v9, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayServiceUserIDsMessage subService](self, "subService"));
  [v4 setSubService:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayServiceUserIDsMessage responseServiceUserIDs](self, "responseServiceUserIDs"));
  [v4 setResponseServiceUserIDs:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayServiceUserIDsMessage userID](self, "userID"));
  [v4 setUserID:v7];

  return v4;
}

- (id)additionalMessageHeaders
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayServiceUserIDsMessage;
  id v3 = -[IDSHomeKitCloudRelayServiceUserIDsMessage additionalMessageHeaders](&v16, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayServiceUserIDsMessage subService](self, "subService"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v6);
  }

  else
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_1006A8E6C(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  return Mutable;
}

- (id)bagKey
{
  return @"id-get-service-user-id";
}

- (id)messageBody
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayServiceUserIDsMessage userID](self, "userID"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"user-id", v4);
  }

  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_1006A8EF8(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return v3;
}

- (void)handleResponseDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayServiceUserIDsMessage;
  id v4 = a3;
  -[IDSHomeKitCloudRelayServiceUserIDsMessage handleResponseDictionary:](&v9, "handleResponseDictionary:", v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_stringForKey:", @"service-user-id", v9.receiver, v9.super_class));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"expiry"]);

  if (v5)
  {
    Mutable = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (!Mutable) {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"service-user-id", v5);
    if (v6) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"expiry", v6);
    }
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", Mutable));
    -[IDSHomeKitCloudRelayServiceUserIDsMessage setResponseServiceUserIDs:](self, "setResponseServiceUserIDs:", v8);
  }
}

- (NSArray)responseServiceUserIDs
{
  return (NSArray *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setResponseServiceUserIDs:(id)a3
{
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setUserID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end