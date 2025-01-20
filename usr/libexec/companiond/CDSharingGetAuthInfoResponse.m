@interface CDSharingGetAuthInfoResponse
- (CDSharingGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSData)requestData;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setRequestData:(id)a3;
@end

@implementation CDSharingGetAuthInfoResponse

- (CDSharingGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CDSharingGetAuthInfoResponse;
  v5 = -[CDSharingGetAuthInfoResponse init](&v15, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sharingData"]);
    requestData = v5->_requestData;
    v5->_requestData = (NSData *)v6;

    CFTypeID TypeID = CFStringGetTypeID();
    v9 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceClass", TypeID, 0), "copy");
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = v9;

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
  [v3 setObject:self->_requestData forKeyedSubscript:@"sharingData"];
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v4 = [v3 copy];

  return v4;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_requestData withName:@"requestData" skipIfNil:1];
  id v5 = [v3 appendObject:self->_deviceClass withName:@"deviceClass" skipIfNil:1];
  id v6 = [v3 appendObject:self->_deviceName withName:@"deviceName" skipIfNil:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v7;
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

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end