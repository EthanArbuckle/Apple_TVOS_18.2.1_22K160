@interface IDSGroupGetMessage
- (NSArray)responseEntries;
- (NSData)engramID;
- (NSNumber)responseStatus;
- (NSNumber)version;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)responseMessage;
- (NSString)softwareVersion;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEngramID:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setResponseEntries:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation IDSGroupGetMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSGroupGetMessage;
  id v4 = -[IDSGroupGetMessage copyWithZone:](&v15, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage hardwareVersion](self, "hardwareVersion"));
  [v4 setHardwareVersion:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage osVersion](self, "osVersion"));
  [v4 setOsVersion:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage softwareVersion](self, "softwareVersion"));
  [v4 setSoftwareVersion:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage deviceName](self, "deviceName"));
  [v4 setDeviceName:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage engramID](self, "engramID"));
  [v4 setEngramID:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage version](self, "version"));
  [v4 setVersion:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage responseEntries](self, "responseEntries"));
  [v4 setResponseEntries:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage responseStatus](self, "responseStatus"));
  [v4 setResponseStatus:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v13];

  return v4;
}

- (id)additionalMessageHeaders
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSGroupGetMessage;
  id v3 = -[IDSGroupGetMessage additionalMessageHeaders](&v13, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage engramID](self, "engramID"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage engramID](self, "engramID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__imHexString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"HASH:%@", v8));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage pushCertificate](self, "pushCertificate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _FTStringFromBaseData]);

  if (v10)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006940A0();
  }

  id v11 = v6;
  if (v11)
  {
    CFDictionarySetValue(Mutable, @"route", v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB3D4();
  }

  return Mutable;
}

- (id)messageBody
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSGroupGetMessage;
  id v3 = -[IDSGroupGetMessage messageBody](&v13, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage hardwareVersion](self, "hardwareVersion"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006943A0();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage osVersion](self, "osVersion"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"os-version", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694320();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage softwareVersion](self, "softwareVersion"));
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"software-version", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E230();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage deviceName](self, "deviceName"));
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"device-name", v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB4D4();
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage engramID](self, "engramID"));
  if (v10)
  {
    CFDictionarySetValue(Mutable, @"engram-id", v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AB454();
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupGetMessage version](self, "version"));
  if (v11) {
    CFDictionarySetValue(Mutable, @"version", v11);
  }

  return Mutable;
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)bagKey
{
  return @"id-group-get-key";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _arrayForKey:@"entries"]);
  -[IDSGroupGetMessage setResponseEntries:](self, "setResponseEntries:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"status"]);
  -[IDSGroupGetMessage setResponseStatus:](self, "setResponseStatus:", v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"message"]);
  -[IDSGroupGetMessage setResponseMessage:](self, "setResponseMessage:", v7);
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSData)engramID
{
  return (NSData *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setEngramID:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setVersion:(id)a3
{
}

- (NSArray)responseEntries
{
  return (NSArray *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setResponseEntries:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end