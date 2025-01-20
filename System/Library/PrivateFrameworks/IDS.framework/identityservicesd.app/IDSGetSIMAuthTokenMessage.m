@interface IDSGetSIMAuthTokenMessage
- (BOOL)isMultipleAuthCertCapable;
- (NSNumber)responseStatus;
- (NSString)IMEI;
- (NSString)carrierNonce;
- (NSString)hardwareVersion;
- (NSString)hostHardwareVersion;
- (NSString)hostOsVersion;
- (NSString)hostSoftwareVersion;
- (NSString)osVersion;
- (NSString)protocolVersion;
- (NSString)responseCarrierToken;
- (NSString)responseMessage;
- (NSString)softwareVersion;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)handleResponseDictionary:(id)a3;
- (void)setCarrierNonce:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHostHardwareVersion:(id)a3;
- (void)setHostOsVersion:(id)a3;
- (void)setHostSoftwareVersion:(id)a3;
- (void)setIMEI:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setResponseCarrierToken:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setResponseStatus:(id)a3;
- (void)setSoftwareVersion:(id)a3;
@end

@implementation IDSGetSIMAuthTokenMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSGetSIMAuthTokenMessage;
  id v4 = -[IDSGetSIMAuthTokenMessage copyWithZone:](&v18, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage protocolVersion](self, "protocolVersion"));
  [v4 setProtocolVersion:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hardwareVersion](self, "hardwareVersion"));
  [v4 setHardwareVersion:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage osVersion](self, "osVersion"));
  [v4 setOsVersion:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage softwareVersion](self, "softwareVersion"));
  [v4 setSoftwareVersion:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hostHardwareVersion](self, "hostHardwareVersion"));
  [v4 setHostHardwareVersion:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hostOsVersion](self, "hostOsVersion"));
  [v4 setHostOsVersion:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hostSoftwareVersion](self, "hostSoftwareVersion"));
  [v4 setHostSoftwareVersion:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage carrierNonce](self, "carrierNonce"));
  [v4 setCarrierNonce:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage IMEI](self, "IMEI"));
  [v4 setIMEI:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage responseStatus](self, "responseStatus"));
  [v4 setResponseStatus:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage responseCarrierToken](self, "responseCarrierToken"));
  [v4 setResponseCarrierToken:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage responseMessage](self, "responseMessage"));
  [v4 setResponseMessage:v16];

  return v4;
}

- (id)additionalMessageHeaders
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSGetSIMAuthTokenMessage;
  id v3 = -[IDSGetSIMAuthTokenMessage additionalMessageHeaders](&v9, "additionalMessageHeaders");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage pushCertificate](self, "pushCertificate"));
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
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSGetSIMAuthTokenMessage;
  id v3 = -[IDSGetSIMAuthTokenMessage messageBody](&v15, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hardwareVersion](self, "hardwareVersion"));
  if (v6)
  {
    CFDictionarySetValue(Mutable, @"hardware-version", v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006943A0();
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage osVersion](self, "osVersion"));
  if (v7)
  {
    CFDictionarySetValue(Mutable, @"os-version", v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100694320();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage softwareVersion](self, "softwareVersion"));
  if (v8)
  {
    CFDictionarySetValue(Mutable, @"software-version", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069E230();
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hostHardwareVersion](self, "hostHardwareVersion"));
  if (v9) {
    CFDictionarySetValue(Mutable, @"host-hardware-version", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hostOsVersion](self, "hostOsVersion"));
  if (v10) {
    CFDictionarySetValue(Mutable, @"host-os-version", v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage hostSoftwareVersion](self, "hostSoftwareVersion"));
  if (v11) {
    CFDictionarySetValue(Mutable, @"host-software-version", v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage carrierNonce](self, "carrierNonce"));
  if (v12)
  {
    CFDictionarySetValue(Mutable, @"carrier-nonce", v12);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AC934();
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGetSIMAuthTokenMessage IMEI](self, "IMEI"));
  if (v13)
  {
    CFDictionarySetValue(Mutable, @"imei", v13);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006AC8B4();
  }

  return Mutable;
}

- (id)requiredKeys
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableArray);
}

- (id)bagKey
{
  return @"id-get-esat";
}

- (BOOL)isMultipleAuthCertCapable
{
  return 1;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _numberForKey:@"status"]);
  -[IDSGetSIMAuthTokenMessage setResponseStatus:](self, "setResponseStatus:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"esim-auth-token"]);
  -[IDSGetSIMAuthTokenMessage setResponseCarrierToken:](self, "setResponseCarrierToken:", v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 _stringForKey:@"message"]);
  -[IDSGetSIMAuthTokenMessage setResponseMessage:](self, "setResponseMessage:", v7);
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
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

- (NSString)carrierNonce
{
  return self->_carrierNonce;
}

- (void)setCarrierNonce:(id)a3
{
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
}

- (NSNumber)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
}

- (NSString)responseCarrierToken
{
  return self->_responseCarrierToken;
}

- (void)setResponseCarrierToken:(id)a3
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