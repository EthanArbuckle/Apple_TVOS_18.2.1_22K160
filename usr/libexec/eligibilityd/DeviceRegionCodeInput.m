@interface DeviceRegionCodeInput
+ (BOOL)supportsSecureCoding;
+ (id)_mgDeviceRegionCode;
- (BOOL)isChinaSKU;
- (BOOL)isEqual:(id)a3;
- (DeviceRegionCodeInput)init;
- (DeviceRegionCodeInput)initWithCoder:(id)a3;
- (NSString)deviceRegionCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceRegionCode:(id)a3;
@end

@implementation DeviceRegionCodeInput

- (DeviceRegionCodeInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DeviceRegionCodeInput;
  v2 = -[EligibilityInput initWithInputType:status:process:]( &v6,  "initWithInputType:status:process:",  6LL,  0LL,  @"eligibilityd");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[DeviceRegionCodeInput _mgDeviceRegionCode](&OBJC_CLASS___DeviceRegionCodeInput, "_mgDeviceRegionCode"));
    deviceRegionCode = v2->_deviceRegionCode;
    v2->_deviceRegionCode = (NSString *)v3;
  }

  return v2;
}

- (BOOL)isChinaSKU
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  unsigned __int8 v3 = [v2 isEqualToString:@"CH"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DeviceRegionCodeInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (DeviceRegionCodeInput)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DeviceRegionCodeInput;
  objc_super v3 = -[EligibilityInput initWithInputType:status:process:]( &v7,  "initWithInputType:status:process:",  6LL,  0LL,  @"eligibilityd");
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[DeviceRegionCodeInput _mgDeviceRegionCode](&OBJC_CLASS___DeviceRegionCodeInput, "_mgDeviceRegionCode"));
    deviceRegionCode = v3->_deviceRegionCode;
    v3->_deviceRegionCode = (NSString *)v4;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DeviceRegionCodeInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setDeviceRegionCode:v7];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DeviceRegionCodeInput;
  unint64_t v3 = -[EligibilityInput hash](&v7, "hash");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DeviceRegionCodeInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DeviceRegionCodeInput;
  if (!-[EligibilityInput isEqual:](&v13, "isEqual:", v4)) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_11;
  }

  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    objc_super v6 = v4;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](v6, "deviceRegionCode"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[DeviceRegionCodeInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "deviceRegionCode";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }

  else
  {
LABEL_9:
    char v9 = 0;
  }

- (id)description
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceRegionCodeInput deviceRegionCode](self, "deviceRegionCode"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DeviceRegionCodeInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[DeviceRegionCodeInput deviceRegionCode:%@ %@]",  v3,  v5));

  return v6;
}

- (NSString)deviceRegionCode
{
  return self->_deviceRegionCode;
}

- (void)setDeviceRegionCode:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_mgDeviceRegionCode
{
  return (id)MGGetStringAnswer(@"RegionCode", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end