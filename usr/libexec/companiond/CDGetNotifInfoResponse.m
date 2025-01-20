@interface CDGetNotifInfoResponse
- (CDGetNotifInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)appName;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (void)setAppName:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation CDGetNotifInfoResponse

- (CDGetNotifInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CDGetNotifInfoResponse;
  v5 = -[CDGetNotifInfoResponse init](&v16, "init");
  if (v5)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    v7 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceClass", TypeID, 0), "copy");
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v7;

    CFTypeID v9 = CFStringGetTypeID();
    v10 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceName", v9, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v10;

    CFTypeID v12 = CFStringGetTypeID();
    v13 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"appName", v12, 0), "copy");
    appName = v5->_appName;
    v5->_appName = v13;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  [v3 setObject:self->_appName forKeyedSubscript:@"appName"];
  id v4 = [v3 copy];

  return v4;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  [v3 appendString:self->_appName withName:@"appName" skipIfEmpty:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v4;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end