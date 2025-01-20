@interface CDRestrictedAccessGetAuthInfoResponse
- (CDRestrictedAccessGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)currentUserName;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (int64_t)restrictionType;
- (void)setCurrentUserName:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setRestrictionType:(int64_t)a3;
@end

@implementation CDRestrictedAccessGetAuthInfoResponse

- (CDRestrictedAccessGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CDRestrictedAccessGetAuthInfoResponse;
  v5 = -[CDRestrictedAccessGetAuthInfoResponse init](&v18, "init");
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
    v13 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"currentUserName", v12, 0), "copy");
    currentUserName = v5->_currentUserName;
    v5->_currentUserName = v13;

    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"restrictionType", 0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_restrictionType = (int64_t)[v16 integerValue];
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  [v3 setObject:self->_currentUserName forKeyedSubscript:@"currentUserName"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_restrictionType));
  [v3 setObject:v4 forKeyedSubscript:@"restrictionType"];

  id v5 = [v3 copy];
  return v5;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  [v3 appendString:self->_currentUserName withName:@"currentUserName" skipIfEmpty:1];
  id v4 = [v3 appendInteger:self->_restrictionType withName:@"restrictionType"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v5;
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

- (NSString)currentUserName
{
  return self->_currentUserName;
}

- (void)setCurrentUserName:(id)a3
{
}

- (int64_t)restrictionType
{
  return self->_restrictionType;
}

- (void)setRestrictionType:(int64_t)a3
{
  self->_restrictionType = a3;
}

- (void).cxx_destruct
{
}

@end