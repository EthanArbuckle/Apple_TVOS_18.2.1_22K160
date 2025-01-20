@interface CDLearnMoreGetAuthInfoResponse
- (CDLearnMoreGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (NSURL)URL;
- (id)makeRapportDictionary;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation CDLearnMoreGetAuthInfoResponse

- (CDLearnMoreGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CDLearnMoreGetAuthInfoResponse;
  v5 = -[CDLearnMoreGetAuthInfoResponse init](&v18, "init");
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

    uint64_t v12 = objc_opt_self(&OBJC_CLASS___NSURL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = sub_10001AD0C(v4, @"learnMoreURL", (uint64_t)v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    URL = v5->_URL;
    v5->_URL = (NSURL *)v15;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v4 = sub_10001AFE4((uint64_t)self->_URL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"learnMoreURL"];

  id v6 = [v3 copy];
  return v6;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v4 = [v3 appendObject:self->_URL withName:@"URL"];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

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

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end