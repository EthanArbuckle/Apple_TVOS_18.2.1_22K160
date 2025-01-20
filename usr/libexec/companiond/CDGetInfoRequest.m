@interface CDGetInfoRequest
- (CDGetInfoRequest)initWithRapportDictionary:(id)a3;
- (NSData)appleAccountToken;
- (NSData)storeAccountToken;
- (NSString)description;
- (NSString)deviceBuildVersion;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)nonce;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setAppleAccountToken:(id)a3;
- (void)setDeviceBuildVersion:(id)a3;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setNonce:(id)a3;
- (void)setStoreAccountToken:(id)a3;
@end

@implementation CDGetInfoRequest

- (CDGetInfoRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___CDGetInfoRequest;
  v5 = -[CDGetInfoRequest init](&v27, "init");
  if (v5)
  {
    CFTypeID TypeID = CFDataGetTypeID();
    v7 = (NSData *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"storeAccountToken", TypeID, 0), "copy");
    storeAccountToken = v5->_storeAccountToken;
    v5->_storeAccountToken = v7;

    CFTypeID v9 = CFDataGetTypeID();
    v10 = (NSData *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"appleAccountToken", v9, 0), "copy");
    appleAccountToken = v5->_appleAccountToken;
    v5->_appleAccountToken = v10;

    CFTypeID v12 = CFStringGetTypeID();
    v13 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"nonce", v12, 0), "copy");
    nonce = v5->_nonce;
    v5->_nonce = v13;

    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"deviceFlags", 0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)[v16 unsignedIntegerValue];

    CFTypeID v17 = CFStringGetTypeID();
    v18 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceModel", v17, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v18;

    CFTypeID v20 = CFStringGetTypeID();
    v21 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceName", v20, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v21;

    CFTypeID v23 = CFStringGetTypeID();
    v24 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceBuildVersion", v23, 0), "copy");
    deviceBuildVersion = v5->_deviceBuildVersion;
    v5->_deviceBuildVersion = v24;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:self->_storeAccountToken forKeyedSubscript:@"storeAccountToken"];
  [v3 setObject:self->_appleAccountToken forKeyedSubscript:@"appleAccountToken"];
  [v3 setObject:self->_nonce forKeyedSubscript:@"nonce"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_deviceFlags));
  [v3 setObject:v4 forKeyedSubscript:@"deviceFlags"];

  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  [v3 setObject:self->_deviceBuildVersion forKeyedSubscript:@"deviceBuildVersion"];
  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_storeAccountToken withName:@"storeAccountToken" skipIfNil:1];
  id v5 = [v3 appendObject:self->_appleAccountToken withName:@"appleAccountToken" skipIfNil:1];
  [v3 appendString:self->_nonce withName:@"nonce" skipIfEmpty:1];
  uint64_t v6 = CUPrintFlags64(self->_deviceFlags, &unk_1000256E0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 appendString:v7 withName:@"deviceFlags"];

  [v3 appendString:self->_deviceModel withName:@"deviceModel" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  [v3 appendString:self->_deviceBuildVersion withName:@"deviceBuildVersion" skipIfEmpty:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v8;
}

- (NSData)storeAccountToken
{
  return self->_storeAccountToken;
}

- (void)setStoreAccountToken:(id)a3
{
}

- (NSData)appleAccountToken
{
  return self->_appleAccountToken;
}

- (void)setAppleAccountToken:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (unint64_t)deviceFlags
{
  return self->_deviceFlags;
}

- (void)setDeviceFlags:(unint64_t)a3
{
  self->_deviceFlags = a3;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceBuildVersion
{
  return self->_deviceBuildVersion;
}

- (void)setDeviceBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end