@interface IDSPreflightMessage
- (BOOL)requiresPushTokenKeys;
- (NSArray)responseMechanisms;
- (NSNumber)phoneNumberValidationRetryCount;
- (NSNumber)pnrReason;
- (NSNumber)responseStatus;
- (NSString)IMSI;
- (NSString)PLMN;
- (NSString)deviceName;
- (NSString)hardwareVersion;
- (NSString)hostDeviceName;
- (NSString)hostHardwareVersion;
- (NSString)hostOsVersion;
- (NSString)hostSoftwareVersion;
- (NSString)osVersion;
- (NSString)protocolVersion;
- (NSString)softwareVersion;
- (NSString)testData;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHostDeviceName:(id)a3;
- (void)setHostHardwareVersion:(id)a3;
- (void)setHostOsVersion:(id)a3;
- (void)setHostSoftwareVersion:(id)a3;
- (void)setIMSI:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPLMN:(id)a3;
- (void)setPhoneNumberValidationRetryCount:(id)a3;
- (void)setPnrReason:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setResponseMechanisms:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setTestData:(id)a3;
@end

@implementation IDSPreflightMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSPreflightMessage;
  id v4 = -[IDSPreflightMessage copyWithZone:](&v21, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage protocolVersion](self, "protocolVersion"));
  [v4 setProtocolVersion:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hardwareVersion](self, "hardwareVersion"));
  [v4 setHardwareVersion:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage osVersion](self, "osVersion"));
  [v4 setOsVersion:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage softwareVersion](self, "softwareVersion"));
  [v4 setSoftwareVersion:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage deviceName](self, "deviceName"));
  [v4 setDeviceName:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostHardwareVersion](self, "hostHardwareVersion"));
  [v4 setHostHardwareVersion:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostOsVersion](self, "hostOsVersion"));
  [v4 setHostOsVersion:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostSoftwareVersion](self, "hostSoftwareVersion"));
  [v4 setHostSoftwareVersion:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostDeviceName](self, "hostDeviceName"));
  [v4 setHostDeviceName:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage IMSI](self, "IMSI"));
  [v4 setIMSI:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage PLMN](self, "PLMN"));
  [v4 setPLMN:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage testData](self, "testData"));
  [v4 setTestData:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage pnrReason](self, "pnrReason"));
  [v4 setPnrReason:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage responseStatus](self, "responseStatus"));
  [v4 setResponseStatus:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage responseMechanisms](self, "responseMechanisms"));
  [v4 setResponseMechanisms:v19];

  return v4;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSPreflightMessage;
  id v3 = -[IDSPreflightMessage additionalMessageHeaders](&v9, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage pushCertificate](self, "pushCertificate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 _FTStringFromBaseData]);

  if (v7)
  {
    CFDictionarySetValue(Mutable, @"x-push-cert", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006940A0();
  }

  return Mutable;
}

- (id)messageBody
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSPreflightMessage;
  id v3 = -[IDSPreflightMessage messageBody](&v20, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage phoneNumberValidationRetryCount](self, "phoneNumberValidationRetryCount"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"pnv-retry-count", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694420();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hardwareVersion](self, "hardwareVersion"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006943A0();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage osVersion](self, "osVersion"));
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"os-version", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694320();
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage softwareVersion](self, "softwareVersion"));
  if (v9)
  {
    CFDictionarySetValue(Mutable, @"software-version", v9);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006942A0();
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage deviceName](self, "deviceName"));
  if (v10)
  {
    CFDictionarySetValue(Mutable, @"device-name", v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694220();
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostHardwareVersion](self, "hostHardwareVersion"));
  if (v11) {
    CFDictionarySetValue(Mutable, @"host-hardware-version", v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostOsVersion](self, "hostOsVersion"));
  if (v12) {
    CFDictionarySetValue(Mutable, @"host-os-version", v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostSoftwareVersion](self, "hostSoftwareVersion"));
  if (v13) {
    CFDictionarySetValue(Mutable, @"host-software-version", v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage hostDeviceName](self, "hostDeviceName"));
  if (v14) {
    CFDictionarySetValue(Mutable, @"host-device-name", v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage IMSI](self, "IMSI"));
  if (v15)
  {
    CFDictionarySetValue(Mutable, @"IMSI", v15);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006941A0();
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage PLMN](self, "PLMN"));
  if (v16)
  {
    CFDictionarySetValue(Mutable, @"PLMN", v16);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694120();
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage pnrReason](self, "pnrReason"));
  if (v17) {
    CFDictionarySetValue(Mutable, @"pnr-reason", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPreflightMessage testData](self, "testData"));
  if (v18) {
    CFDictionarySetValue(Mutable, @"test-data", v18);
  }

  return Mutable;
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)bagKey
{
  return @"id-preflight";
}

- (BOOL)requiresPushTokenKeys
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"status"]);
  v16 = self;
  -[IDSPreflightMessage setResponseStatus:](self, "setResponseStatus:", v5);

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v17 = v4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"mechanisms"]);
  id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"mechanism"]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"mechanism-data"]);
        if ([v12 isEqualToString:@"SMS"])
        {
          uint64_t v14 = 1LL;
        }

        else if ([v12 isEqualToString:@"SMSLess"])
        {
          uint64_t v14 = 2LL;
        }

        else
        {
          uint64_t v14 = 0LL;
        }

        v15 = -[IDSCTPNRValidationMechanism initWithType:context:]( objc_alloc(&OBJC_CLASS___IDSCTPNRValidationMechanism),  "initWithType:context:",  v14,  v13);
        -[NSMutableArray addObject:](v6, "addObject:", v15);
      }

      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  -[IDSPreflightMessage setResponseMechanisms:](v16, "setResponseMechanisms:", v6);
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (NSNumber)phoneNumberValidationRetryCount
{
  return self->_phoneNumberValidationRetryCount;
}

- (void)setPhoneNumberValidationRetryCount:(id)a3
{
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

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (void)setIMSI:(id)a3
{
}

- (NSString)PLMN
{
  return self->_PLMN;
}

- (void)setPLMN:(id)a3
{
}

- (NSString)testData
{
  return self->_testData;
}

- (void)setTestData:(id)a3
{
}

- (NSNumber)pnrReason
{
  return self->_pnrReason;
}

- (void)setPnrReason:(id)a3
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

- (NSString)hostSoftwareVersion
{
  return self->_hostSoftwareVersion;
}

- (void)setHostSoftwareVersion:(id)a3
{
}

- (NSString)hostDeviceName
{
  return self->_hostDeviceName;
}

- (void)setHostDeviceName:(id)a3
{
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
}

- (NSArray)responseMechanisms
{
  return self->_responseMechanisms;
}

- (void)setResponseMechanisms:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end