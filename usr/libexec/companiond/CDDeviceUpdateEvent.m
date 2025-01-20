@interface CDDeviceUpdateEvent
- (CDDeviceUpdateEvent)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation CDDeviceUpdateEvent

- (CDDeviceUpdateEvent)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CDDeviceUpdateEvent;
  v5 = -[CDDeviceUpdateEvent init](&v15, "init");
  if (v5)
  {
    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"deviceFlags", 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)[v7 unsignedIntegerValue];

    CFTypeID TypeID = CFStringGetTypeID();
    v9 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceModel", TypeID, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v9;

    CFTypeID v11 = CFStringGetTypeID();
    v12 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceName", v11, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v12;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_deviceFlags));
  [v3 setObject:v4 forKeyedSubscript:@"deviceFlags"];

  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  uint64_t v4 = CUPrintFlags64(self->_deviceFlags, &unk_1000256E0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:@"deviceFlags"];

  [v3 appendString:self->_deviceModel withName:@"deviceModel" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v6;
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