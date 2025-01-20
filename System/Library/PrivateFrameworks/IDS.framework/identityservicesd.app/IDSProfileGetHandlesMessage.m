@interface IDSProfileGetHandlesMessage
- (BOOL)wantsExtraTimeoutRetry;
- (IDSProfileGetHandlesMessage)init;
- (NSArray)responseHandles;
- (NSDictionary)selfHandle;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseHandles:(id)a3;
- (void)setSelfHandle:(id)a3;
@end

@implementation IDSProfileGetHandlesMessage

- (IDSProfileGetHandlesMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSProfileGetHandlesMessage;
  v2 = -[IDSProfileGetHandlesMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSProfileGetHandlesMessage setTimeout:](v2, "setTimeout:", 240.0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSProfileGetHandlesMessage;
  id v4 = -[IDSProfileGetHandlesMessage copyWithZone:](&v7, "copyWithZone:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileGetHandlesMessage responseHandles](self, "responseHandles"));
  [v4 setResponseHandles:v5];

  return v4;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSProfileGetHandlesMessage;
  id v3 = -[IDSProfileGetHandlesMessage additionalMessageHeaders](&v8, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (NSMutableDictionary *)[v4 mutableCopy];

  if (!v5) {
    objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSProfileGetHandlesMessage dsAuthID](self, "dsAuthID"));
  if (v6)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v5, @"x-ds-client-id", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB7F0();
  }

  return v5;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (id)bagKey
{
  return @"id-get-handles";
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)messageBody
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  if (_IMWillLog(@"Registration", v5))
  {
    id v8 = v4;
    _IMAlwaysLog(0LL, @"Registration", @"Handle query response: %@");
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSProfileGetHandlesMessage;
  -[IDSProfileGetHandlesMessage handleResponseDictionary:](&v9, "handleResponseDictionary:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"handles"]);
  -[IDSProfileGetHandlesMessage setResponseHandles:](self, "setResponseHandles:", v6);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"self-handle"]);
  -[IDSProfileGetHandlesMessage setSelfHandle:](self, "setSelfHandle:", v7);
}

- (NSArray)responseHandles
{
  return (NSArray *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setResponseHandles:(id)a3
{
}

- (NSDictionary)selfHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setSelfHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end