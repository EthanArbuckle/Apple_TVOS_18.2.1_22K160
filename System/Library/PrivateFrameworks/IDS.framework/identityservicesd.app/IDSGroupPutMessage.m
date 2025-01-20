@interface IDSGroupPutMessage
- (BOOL)allowDualDelivery;
- (NSArray)responseEntries;
- (NSData)data;
- (NSData)engramID;
- (NSData)forwardingSig;
- (NSData)key;
- (NSData)responseEngramID;
- (NSData)signature;
- (NSNumber)requiredUpdate;
- (NSNumber)responseStatus;
- (NSNumber)responseVersion;
- (NSNumber)version;
- (NSString)deviceName;
- (NSString)forwardingSigAlgorithm;
- (NSString)hardwareVersion;
- (NSString)osVersion;
- (NSString)responseMessage;
- (NSString)route;
- (NSString)sigAlgorithm;
- (NSString)softwareVersion;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setData:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEngramID:(id)a3;
- (void)setForwardingSig:(id)a3;
- (void)setForwardingSigAlgorithm:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setKey:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setRequiredUpdate:(id)a3;
- (void)setResponseEngramID:(id)a3;
- (void)setResponseEntries:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setResponseVersion:(id)a3;
- (void)setRoute:(id)a3;
- (void)setSigAlgorithm:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation IDSGroupPutMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___IDSGroupPutMessage;
  id v4 = -[IDSGroupPutMessage copyWithZone:](&v25, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage route](self, "route"));
  [v4 setRoute:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage retryCount](self, "retryCount"));
  [v4 setRetryCount:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage hardwareVersion](self, "hardwareVersion"));
  [v4 setHardwareVersion:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage osVersion](self, "osVersion"));
  [v4 setOsVersion:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage softwareVersion](self, "softwareVersion"));
  [v4 setSoftwareVersion:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage deviceName](self, "deviceName"));
  [v4 setDeviceName:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage engramID](self, "engramID"));
  [v4 setEngramID:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage version](self, "version"));
  [v4 setVersion:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage key](self, "key"));
  [v4 setKey:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage data](self, "data"));
  [v4 setData:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage signature](self, "signature"));
  [v4 setSignature:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage sigAlgorithm](self, "sigAlgorithm"));
  [v4 setSigAlgorithm:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage forwardingSig](self, "forwardingSig"));
  [v4 setForwardingSig:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage forwardingSigAlgorithm](self, "forwardingSigAlgorithm"));
  [v4 setForwardingSigAlgorithm:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage responseEngramID](self, "responseEngramID"));
  [v4 setResponseEngramID:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage responseVersion](self, "responseVersion"));
  [v4 setResponseVersion:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage responseEntries](self, "responseEntries"));
  [v4 setResponseEntries:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage responseStatus](self, "responseStatus"));
  [v4 setResponseStatus:v22];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v23];

  return v4;
}

- (BOOL)allowDualDelivery
{
  return 1;
}

- (id)additionalMessageHeaders
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IDSGroupPutMessage;
  id v3 = -[IDSGroupPutMessage additionalMessageHeaders](&v10, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage pushCertificate](self, "pushCertificate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _FTStringFromBaseData]);

  if (v7)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006940A0();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage route](self, "route"));
  if (v8) {
    CFDictionarySetValue(Mutable, @"route", v8);
  }

  return Mutable;
}

- (id)messageBody
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IDSGroupPutMessage;
  id v3 = -[IDSGroupPutMessage messageBody](&v22, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage route](self, "route"));
  if (v6) {
    CFDictionarySetValue(Mutable, @"route", v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage retryCount](self, "retryCount"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"retry-count", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E2B0();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage hardwareVersion](self, "hardwareVersion"));
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006943A0();
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage osVersion](self, "osVersion"));
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"os-version", v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694320();
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage softwareVersion](self, "softwareVersion"));
  if (v10)
  {
    CFDictionarySetValue(Mutable, @"software-version", v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E230();
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage deviceName](self, "deviceName"));
  if (v11)
  {
    CFDictionarySetValue(Mutable, @"device-name", v11);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E1B0();
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage engramID](self, "engramID"));
  if (v12) {
    CFDictionarySetValue(Mutable, @"engram-id", v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage version](self, "version"));
  if (v13) {
    CFDictionarySetValue(Mutable, @"version", v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage requiredUpdate](self, "requiredUpdate"));
  if (v14) {
    CFDictionarySetValue(Mutable, @"required-update", v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage key](self, "key"));
  if (v15)
  {
    CFDictionarySetValue(Mutable, @"key", v15);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E130();
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage data](self, "data"));
  if (v16)
  {
    CFDictionarySetValue(Mutable, @"data", v16);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E0B0();
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage signature](self, "signature"));
  if (v17)
  {
    CFDictionarySetValue(Mutable, @"signature", v17);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E030();
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage sigAlgorithm](self, "sigAlgorithm"));
  if (v18)
  {
    CFDictionarySetValue(Mutable, @"sig-algorithm", v18);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069DFB0();
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage forwardingSig](self, "forwardingSig"));
  if (v19) {
    CFDictionarySetValue(Mutable, @"forwarding-sig", v19);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupPutMessage forwardingSigAlgorithm](self, "forwardingSigAlgorithm"));
  if (v20) {
    CFDictionarySetValue(Mutable, @"forwarding-sig-algorithm", v20);
  }

  return Mutable;
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)bagKey
{
  return @"id-group-put-key";
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _dataForKey:@"engram-id"]);
  -[IDSGroupPutMessage setResponseEngramID:](self, "setResponseEngramID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"version"]);
  -[IDSGroupPutMessage setResponseVersion:](self, "setResponseVersion:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 _arrayForKey:@"entries"]);
  -[IDSGroupPutMessage setResponseEntries:](self, "setResponseEntries:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"status"]);
  -[IDSGroupPutMessage setResponseStatus:](self, "setResponseStatus:", v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"message"]);
  -[IDSGroupPutMessage setResponseMessage:](self, "setResponseMessage:", v9);
}

- (NSString)route
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setRoute:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSData)engramID
{
  return (NSData *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setEngramID:(id)a3
{
}

- (NSNumber)version
{
  return (NSNumber *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setVersion:(id)a3
{
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setKey:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setData:(id)a3
{
}

- (NSNumber)requiredUpdate
{
  return (NSNumber *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setRequiredUpdate:(id)a3
{
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)sigAlgorithm
{
  return (NSString *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setSigAlgorithm:(id)a3
{
}

- (NSData)forwardingSig
{
  return (NSData *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setForwardingSig:(id)a3
{
}

- (NSString)forwardingSigAlgorithm
{
  return (NSString *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setForwardingSigAlgorithm:(id)a3
{
}

- (NSData)responseEngramID
{
  return (NSData *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setResponseEngramID:(id)a3
{
}

- (NSNumber)responseVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setResponseVersion:(id)a3
{
}

- (NSArray)responseEntries
{
  return (NSArray *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setResponseEntries:(id)a3
{
}

- (NSNumber)responseStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setResponseStatus:(id)a3
{
}

- (NSString)responseMessage
{
  return (NSString *)objc_getProperty(self, a2, 376LL, 1);
}

- (void)setResponseMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end