@interface CDSystemAuthenticationDidFinishAuthRequest
- (BOOL)isEnabled;
- (CDSystemAuthenticationDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setError:(id)a3;
@end

@implementation CDSystemAuthenticationDidFinishAuthRequest

- (CDSystemAuthenticationDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CDSystemAuthenticationDidFinishAuthRequest;
  v5 = -[CDSystemAuthenticationDidFinishAuthRequest init](&v20, "init");
  if (v5)
  {
    v5->_enabled = CFDictionaryGetInt64(v4, @"authResponse", 0LL) != 0;
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___NSError);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = sub_10001AD0C(v4, @"authError", (uint64_t)v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    error = v5->_error;
    v5->_error = (NSError *)v9;

    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"deviceFlags", 0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)[v12 unsignedIntegerValue];

    CFTypeID TypeID = CFStringGetTypeID();
    v14 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceModel", TypeID, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v14;

    CFTypeID v16 = CFStringGetTypeID();
    v17 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceName", v16, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v17;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_enabled));
  [v3 setObject:v4 forKeyedSubscript:@"authResponse"];

  id v5 = sub_10001AFE4((uint64_t)self->_error);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v3 setObject:v6 forKeyedSubscript:@"authError"];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_deviceFlags));
  [v3 setObject:v7 forKeyedSubscript:@"deviceFlags"];

  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v8 = [v3 copy];

  return v8;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendBool:self->_enabled withName:@"enabled"];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v6;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
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

- (void).cxx_destruct
{
}

@end