@interface IDSPeerAccessoryMessage
- (NSData)accessToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setAccessToken:(id)a3;
@end

@implementation IDSPeerAccessoryMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSPeerAccessoryMessage;
  id v4 = -[IDSPeerMessage copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAccessoryMessage accessToken](self, "accessToken"));
  [v4 setAccessToken:v5];

  return v4;
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"sP");
  -[NSMutableArray addObject:](v2, "addObject:", @"hT");
  return v2;
}

- (id)messageBody
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSPeerAccessoryMessage;
  id v3 = -[IDSPeerMessage messageBody](&v8, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAccessoryMessage accessToken](self, "accessToken"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"hT", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6DDC();
  }

  return Mutable;
}

- (NSData)accessToken
{
  return (NSData *)objc_getProperty(self, a2, 384LL, 1);
}

- (void)setAccessToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end