@interface IDSHomeKitCloudRelayAdminAccessTokenMessage
- (NSData)pairingToken;
- (NSData)responseAdminAcccessToken;
- (NSNumber)responseExpiry;
- (NSString)accessoryID;
- (NSString)responseAccessoryID;
- (NSString)serviceUserID;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (void)handleResponseDictionary:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setPairingToken:(id)a3;
- (void)setResponseAccessoryID:(id)a3;
- (void)setResponseAdminAcccessToken:(id)a3;
- (void)setResponseExpiry:(id)a3;
- (void)setServiceUserID:(id)a3;
@end

@implementation IDSHomeKitCloudRelayAdminAccessTokenMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayAdminAccessTokenMessage;
  id v4 = -[IDSHomeKitCloudRelayAdminAccessTokenMessage copyWithZone:](&v13, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage subService](self, "subService"));
  [v4 setSubService:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage serviceUserID](self, "serviceUserID"));
  [v4 setServiceUserID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage accessoryID](self, "accessoryID"));
  [v4 setAccessoryID:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage pairingToken](self, "pairingToken"));
  [v4 setPairingToken:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage responseAccessoryID](self, "responseAccessoryID"));
  [v4 setAccessoryID:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSHomeKitCloudRelayAdminAccessTokenMessage responseAdminAcccessToken]( self,  "responseAdminAcccessToken"));
  [v4 setResponseAdminAcccessToken:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage responseExpiry](self, "responseExpiry"));
  [v4 setResponseExpiry:v11];

  return v4;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSHomeKitCloudRelayAdminAccessTokenMessage;
  id v3 = -[IDSHomeKitCloudRelayAdminAccessTokenMessage additionalMessageHeaders](&v9, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage subService](self, "subService"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"x-id-sub-service", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6EF4();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage serviceUserID](self, "serviceUserID"));
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
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage accessoryID](self, "accessoryID"));
  if (v4)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"accessory-id", v4);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6FF4();
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSHomeKitCloudRelayAdminAccessTokenMessage pairingToken](self, "pairingToken"));
  if (v5)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v3, @"pairing-token", v5);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6F74();
  }

  return v3;
}

- (id)bagKey
{
  return @"id-get-admin-token";
}

- (void)handleResponseDictionary:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 _stringForKey:@"accessory-id"]);
  if (v4) {
    -[IDSHomeKitCloudRelayAdminAccessTokenMessage setResponseAccessoryID:](self, "setResponseAccessoryID:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([v7 _dataForKey:@"access-token"]);
  if (v5) {
    -[IDSHomeKitCloudRelayAdminAccessTokenMessage setResponseAdminAcccessToken:]( self,  "setResponseAdminAcccessToken:",  v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v7 _numberForKey:@"expiry"]);
  if (v6) {
    -[IDSHomeKitCloudRelayAdminAccessTokenMessage setResponseExpiry:](self, "setResponseExpiry:", v6);
  }
}

- (NSString)serviceUserID
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setServiceUserID:(id)a3
{
}

- (NSString)accessoryID
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setAccessoryID:(id)a3
{
}

- (NSData)pairingToken
{
  return (NSData *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setPairingToken:(id)a3
{
}

- (NSString)responseAccessoryID
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setResponseAccessoryID:(id)a3
{
}

- (NSData)responseAdminAcccessToken
{
  return (NSData *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setResponseAdminAcccessToken:(id)a3
{
}

- (NSNumber)responseExpiry
{
  return (NSNumber *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setResponseExpiry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end