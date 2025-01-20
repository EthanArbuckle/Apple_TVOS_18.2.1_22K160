@interface CDStorePurchaseDidFinishAuthRequest
- (AMSDelegatePurchaseResult)purchaseResult;
- (CDStorePurchaseDidFinishAuthRequest)initWithRapportDictionary:(id)a3;
- (NSError)error;
- (NSString)description;
- (NSString)deviceModel;
- (NSString)deviceName;
- (id)makeRapportDictionary;
- (unint64_t)deviceFlags;
- (void)setDeviceFlags:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setError:(id)a3;
- (void)setPurchaseResult:(id)a3;
@end

@implementation CDStorePurchaseDidFinishAuthRequest

- (CDStorePurchaseDidFinishAuthRequest)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CDStorePurchaseDidFinishAuthRequest;
  v5 = -[CDStorePurchaseDidFinishAuthRequest init](&v25, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_self(&OBJC_CLASS___AMSDelegatePurchaseResult);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = sub_10001AD0C(v4, @"purchaseResult", (uint64_t)v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSDelegatePurchaseResult *)v9;

    uint64_t v11 = objc_opt_self(&OBJC_CLASS___NSError);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = sub_10001AD0C(v4, @"authError", (uint64_t)v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    error = v5->_error;
    v5->_error = (NSError *)v14;

    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"deviceFlags", 0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    v5->_deviceFlags = (unint64_t)[v17 unsignedIntegerValue];

    CFTypeID TypeID = CFStringGetTypeID();
    v19 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceModel", TypeID, 0), "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = v19;

    CFTypeID v21 = CFStringGetTypeID();
    v22 = (NSString *)objc_msgSend((id)CFDictionaryGetTypedValue(v4, @"deviceName", v21, 0), "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = v22;
  }

  return v5;
}

- (id)makeRapportDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = sub_10001AFE4((uint64_t)self->_purchaseResult);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"purchaseResult"];

  id v6 = sub_10001AFE4((uint64_t)self->_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 setObject:v7 forKeyedSubscript:@"authError"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_deviceFlags));
  [v3 setObject:v8 forKeyedSubscript:@"deviceFlags"];

  [v3 setObject:self->_deviceModel forKeyedSubscript:@"deviceModel"];
  [v3 setObject:self->_deviceName forKeyedSubscript:@"deviceName"];
  id v9 = [v3 copy];

  return v9;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_purchaseResult withName:@"purchaseResult" skipIfNil:1];
  id v5 = [v3 appendObject:self->_error withName:@"error" skipIfNil:1];
  uint64_t v6 = CUPrintFlags64(self->_deviceFlags, &unk_1000256E0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 appendString:v7 withName:@"deviceFlags"];

  [v3 appendString:self->_deviceModel withName:@"deviceModel" skipIfEmpty:1];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v8;
}

- (AMSDelegatePurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
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