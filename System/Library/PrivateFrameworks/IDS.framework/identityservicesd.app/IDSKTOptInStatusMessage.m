@interface IDSKTOptInStatusMessage
- (NSArray)services;
- (NSNumber)isOptIn;
- (NSNumber)responseStatus;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)responseMessage;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setHardwareVersion:(id)a3;
- (void)setIsOptIn:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation IDSKTOptInStatusMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSKTOptInStatusMessage;
  id v4 = -[IDSKTOptInStatusMessage copyWithZone:](&v12, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage hardwareVersion](self, "hardwareVersion"));
  [v4 setHardwareVersion:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage osVersion](self, "osVersion"));
  [v4 setOsVersion:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage isOptIn](self, "isOptIn"));
  [v4 setIsOptIn:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage services](self, "services"));
  [v4 setServices:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage responseStatus](self, "responseStatus"));
  [v4 setResponseStatus:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v10];

  return v4;
}

- (id)bagKey
{
  return @"id-kt-opt-in-out";
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"hardware-version");
  -[NSMutableArray addObject:](v2, "addObject:", @"os-version");
  -[NSMutableArray addObject:](v2, "addObject:", @"services");
  return v2;
}

- (id)messageBody
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSKTOptInStatusMessage;
  id v3 = -[IDSKTOptInStatusMessage messageBody](&v10, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage hardwareVersion](self, "hardwareVersion"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006943A0();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage osVersion](self, "osVersion"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"os-version", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694320();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInStatusMessage services](self, "services"));
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"services", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A4074();
  }

  return Mutable;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSKTOptInStatusMessage;
  id v2 = -[IDSKTOptInStatusMessage additionalMessageHeaders](&v9, "additionalMessageHeaders");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  uint64_t v5 = _IDSKeyTransparencyOptInOutVersionNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);

  if (v7) {
    CFDictionarySetValue(Mutable, @"x-kt-opt-version", v7);
  }

  return Mutable;
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSNumber)isOptIn
{
  return self->_isOptIn;
}

- (void)setIsOptIn:(id)a3
{
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
}

- (NSString)responseMessage
{
  return self->_responseMessage;
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end