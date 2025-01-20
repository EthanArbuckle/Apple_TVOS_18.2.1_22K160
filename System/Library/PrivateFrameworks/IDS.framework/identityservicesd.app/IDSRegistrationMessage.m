@interface IDSRegistrationMessage
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)isMultipleAuthCertCapable;
- (BOOL)requiresPushTokenKeys;
- (NSArray)responseServices;
- (NSArray)services;
- (NSData)validationData;
- (NSDictionary)privateDeviceData;
- (NSNumber)responseHBI;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)hostDeviceName;
- (NSString)hostHardwareVersion;
- (NSString)hostLanguage;
- (NSString)hostOsVersion;
- (NSString)hostSoftwareVersion;
- (NSString)language;
- (NSString)osVersion;
- (NSString)requestReasonString;
- (NSString)softwareVersion;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)nonStandardMessageHeadersForOutgoingPush;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHostDeviceName:(id)a3;
- (void)setHostHardwareVersion:(id)a3;
- (void)setHostLanguage:(id)a3;
- (void)setHostOsVersion:(id)a3;
- (void)setHostSoftwareVersion:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPrivateDeviceData:(id)a3;
- (void)setRequestReasonString:(id)a3;
- (void)setResponseHBI:(id)a3;
- (void)setResponseServices:(id)a3;
- (void)setServices:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setValidationData:(id)a3;
@end

@implementation IDSRegistrationMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSRegistrationMessage;
  id v4 = -[IDSRegistrationMessage copyWithZone:](&v21, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage deviceName](self, "deviceName"));
  [v4 setDeviceName:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage language](self, "language"));
  [v4 setLanguage:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage services](self, "services"));
  [v4 setServices:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage osVersion](self, "osVersion"));
  [v4 setOsVersion:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage softwareVersion](self, "softwareVersion"));
  [v4 setSoftwareVersion:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hardwareVersion](self, "hardwareVersion"));
  [v4 setHardwareVersion:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage privateDeviceData](self, "privateDeviceData"));
  [v4 setPrivateDeviceData:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostDeviceName](self, "hostDeviceName"));
  [v4 setHostDeviceName:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostLanguage](self, "hostLanguage"));
  [v4 setHostLanguage:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostOsVersion](self, "hostOsVersion"));
  [v4 setHostOsVersion:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostSoftwareVersion](self, "hostSoftwareVersion"));
  [v4 setHostSoftwareVersion:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostHardwareVersion](self, "hostHardwareVersion"));
  [v4 setHostHardwareVersion:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage validationData](self, "validationData"));
  [v4 setValidationData:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage responseServices](self, "responseServices"));
  [v4 setResponseServices:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage responseHBI](self, "responseHBI"));
  [v4 setResponseHBI:v19];

  return v4;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSRegistrationMessage;
  return -[IDSRegistrationMessage hasRequiredKeys:](&v4, "hasRequiredKeys:", a3);
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (id)bagKey
{
  return @"id-register";
}

- (BOOL)isMultipleAuthCertCapable
{
  return 1;
}

- (id)requiredKeys
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSMutableArray addObject:](v2, "addObject:", @"services");
  -[NSMutableArray addObject:](v2, "addObject:", @"hardware-version");
  -[NSMutableArray addObject:](v2, "addObject:", @"os-version");
  -[NSMutableArray addObject:](v2, "addObject:", @"software-version");
  -[NSMutableArray addObject:](v2, "addObject:", @"validation-data");
  return v2;
}

- (id)additionalMessageHeaders
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSRegistrationMessage;
  id v3 = -[IDSRegistrationMessage additionalMessageHeaders](&v8, "additionalMessageHeaders");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage requestReasonString](self, "requestReasonString"));
  if (v6) {
    CFDictionarySetValue(Mutable, @"x-apple-req-reason", v6);
  }

  return Mutable;
}

- (id)messageBody
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IDSRegistrationMessage;
  id v3 = -[IDSRegistrationMessage messageBody](&v23, "messageBody");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hardwareVersion](self, "hardwareVersion"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006943A0();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage osVersion](self, "osVersion"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"os-version", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694320();
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage privateDeviceData](self, "privateDeviceData"));
  if (v8) {
    CFDictionarySetValue(Mutable, @"private-device-data", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage softwareVersion](self, "softwareVersion"));
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"software-version", v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E230();
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage validationData](self, "validationData"));
  if (v10)
  {
    CFDictionarySetValue(Mutable, @"validation-data", v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A4174();
  }

  uint64_t v13 = IMCurrentPreferredLanguage(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    CFDictionarySetValue(Mutable, @"language", v14);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A40F4();
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage services](self, "services"));
  if (v15)
  {
    CFDictionarySetValue(Mutable, @"services", v15);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A4074();
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage deviceName](self, "deviceName"));
  if (v16) {
    CFDictionarySetValue(Mutable, @"device-name", v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostHardwareVersion](self, "hostHardwareVersion"));
  if (v17) {
    CFDictionarySetValue(Mutable, @"host-hardware-version", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostOsVersion](self, "hostOsVersion"));
  if (v18) {
    CFDictionarySetValue(Mutable, @"host-os-version", v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostDeviceName](self, "hostDeviceName"));
  if (v19) {
    CFDictionarySetValue(Mutable, @"host-device-name", v19);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostSoftwareVersion](self, "hostSoftwareVersion"));
  if (v20) {
    CFDictionarySetValue(Mutable, @"host-software-version", v20);
  }

  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationMessage hostLanguage](self, "hostLanguage"));
  if (v21) {
    CFDictionarySetValue(Mutable, @"host-language", v21);
  }

  return Mutable;
}

- (id)nonStandardMessageHeadersForOutgoingPush
{
  return 0LL;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v9 = a3;
  if (_IMWillLog(@"Registration", v4))
  {
    id v8 = v9;
    _IMAlwaysLog(0LL, @"Registration", @"Registration response: %@");
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", @"services", v8));
  -[IDSRegistrationMessage setResponseServices:](self, "setResponseServices:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"next-hbi"]);
  -[IDSRegistrationMessage setResponseHBI:](self, "setResponseHBI:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"alert"]);
  -[IDSRegistrationMessage setResponseAlertInfo:](self, "setResponseAlertInfo:", v7);
}

- (NSData)validationData
{
  return (NSData *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setValidationData:(id)a3
{
}

- (NSArray)responseServices
{
  return (NSArray *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setResponseServices:(id)a3
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSArray)services
{
  return (NSArray *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setServices:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSDictionary)privateDeviceData
{
  return (NSDictionary *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setPrivateDeviceData:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)hostLanguage
{
  return self->_hostLanguage;
}

- (void)setHostLanguage:(id)a3
{
}

- (NSString)hostHardwareVersion
{
  return self->_hostHardwareVersion;
}

- (void)setHostHardwareVersion:(id)a3
{
}

- (NSString)hostOsVersion
{
  return self->_hostOsVersion;
}

- (void)setHostOsVersion:(id)a3
{
}

- (NSString)hostDeviceName
{
  return self->_hostDeviceName;
}

- (void)setHostDeviceName:(id)a3
{
}

- (NSString)hostSoftwareVersion
{
  return self->_hostSoftwareVersion;
}

- (void)setHostSoftwareVersion:(id)a3
{
}

- (NSNumber)responseHBI
{
  return (NSNumber *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setResponseHBI:(id)a3
{
}

- (NSString)requestReasonString
{
  return (NSString *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setRequestReasonString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end