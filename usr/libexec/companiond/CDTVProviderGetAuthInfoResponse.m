@interface CDTVProviderGetAuthInfoResponse
- (CDTVProviderGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)deviceName;
- (NSString)providerName;
- (NSURL)providerURL;
- (id)makeRapportDictionary;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setProviderURL:(id)a3;
@end

@implementation CDTVProviderGetAuthInfoResponse

- (CDTVProviderGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CDTVProviderGetAuthInfoResponse;
  v5 = -[CDTVProviderGetAuthInfoResponse init](&v21, "init");
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
    id v14 = sub_10001AD0C(v4, @"tvProviderURL", (uint64_t)v13);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    providerURL = v5->_providerURL;
    v5->_providerURL = (NSURL *)v15;

    CFTypeID v17 = CFStringGetTypeID();
    v18 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"tvProviderName", v17, 0), "copy");
    providerName = v5->_providerName;
    v5->_providerName = v18;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v3 setObject:self->_deviceClass forKeyedSubscript:@"deviceClass"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v4 = sub_10001AFE4((uint64_t)self->_providerURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"tvProviderURL"];

  [v3 setObject:self->_providerName forKeyedSubscript:@"tvProviderName"];
  id v6 = [v3 copy];

  return v6;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_deviceClass withName:@"deviceClass" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v4 = [v3 appendObject:self->_providerURL withName:@"providerURL"];
  [v3 appendString:self->_providerName withName:@"providerName"];
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

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (void)setProviderURL:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end