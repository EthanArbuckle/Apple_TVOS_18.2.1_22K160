@interface IDSCheckUnknownSenderMessage
- (BOOL)abusive;
- (BOOL)wantsHTTPGet;
- (NSNumber)attemptCount;
- (NSString)OSVersion;
- (NSString)geo;
- (NSString)hardwareVersion;
- (NSString)sender;
- (NSString)softwareVersion;
- (double)delay;
- (id)additionalMessageHeaders;
- (id)additionalQueryStringParameters;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (void)handleResponseDictionary:(id)a3;
- (void)setAbusive:(BOOL)a3;
- (void)setAttemptCount:(id)a3;
- (void)setDelay:(double)a3;
- (void)setGeo:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setOSVersion:(id)a3;
- (void)setSender:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation IDSCheckUnknownSenderMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSCheckUnknownSenderMessage;
  id v4 = -[IDSCheckUnknownSenderMessage copyWithZone:](&v12, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage hardwareVersion](self, "hardwareVersion"));
  [v4 setHardwareVersion:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage OSVersion](self, "OSVersion"));
  [v4 setOSVersion:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage softwareVersion](self, "softwareVersion"));
  [v4 setSoftwareVersion:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage sender](self, "sender"));
  [v4 setSender:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage attemptCount](self, "attemptCount"));
  [v4 setAttemptCount:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage geo](self, "geo"));
  [v4 setGeo:v10];

  objc_msgSend(v4, "setStatus:", -[IDSCheckUnknownSenderMessage status](self, "status"));
  objc_msgSend(v4, "setAbusive:", -[IDSCheckUnknownSenderMessage abusive](self, "abusive"));
  -[IDSCheckUnknownSenderMessage delay](self, "delay");
  objc_msgSend(v4, "setDelay:");
  return v4;
}

- (id)bagKey
{
  return @"id-check-unknown";
}

- (id)additionalMessageHeaders
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSCheckUnknownSenderMessage;
  id v3 = -[IDSCheckUnknownSenderMessage additionalMessageHeaders](&v12, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage pushToken](self, "pushToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _FTStringFromBaseData]);

  if (v7) {
    CFDictionarySetValue(Mutable, @"x-push-token", v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage hardwareVersion](self, "hardwareVersion"));
  if (v8) {
    CFDictionarySetValue(Mutable, @"x-hardware-version", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage OSVersion](self, "OSVersion"));
  if (v9) {
    CFDictionarySetValue(Mutable, @"x-os-version", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage softwareVersion](self, "softwareVersion"));
  if (v10) {
    CFDictionarySetValue(Mutable, @"x-software-version", v10);
  }

  return Mutable;
}

- (id)additionalQueryStringParameters
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSCheckUnknownSenderMessage;
  id v3 = -[IDSCheckUnknownSenderMessage additionalQueryStringParameters](&v11, "additionalQueryStringParameters");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage sender](self, "sender"));
  if (v6) {
    CFDictionarySetValue(Mutable, @"sender", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage attemptCount](self, "attemptCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);

  if (v8) {
    CFDictionarySetValue(Mutable, @"count", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSCheckUnknownSenderMessage geo](self, "geo"));
  if (v9) {
    CFDictionarySetValue(Mutable, @"geo", v9);
  }

  return Mutable;
}

- (BOOL)wantsHTTPGet
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"status"]);
  -[IDSCheckUnknownSenderMessage setStatus:](self, "setStatus:", [v5 integerValue]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"abusive"]);
  -[IDSCheckUnknownSenderMessage setAbusive:](self, "setAbusive:", [v6 BOOLValue]);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"delay"]);
  [v7 doubleValue];
  -[IDSCheckUnknownSenderMessage setDelay:](self, "setDelay:");
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)OSVersion
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setOSVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)sender
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setSender:(id)a3
{
}

- (NSNumber)attemptCount
{
  return (NSNumber *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setAttemptCount:(id)a3
{
}

- (NSString)geo
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setGeo:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)abusive
{
  return self->_abusive;
}

- (void)setAbusive:(BOOL)a3
{
  self->_abusive = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (void).cxx_destruct
{
}

@end