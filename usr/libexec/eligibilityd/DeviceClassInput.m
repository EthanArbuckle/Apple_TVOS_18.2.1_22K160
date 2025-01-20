@interface DeviceClassInput
+ (BOOL)supportsSecureCoding;
+ (id)_mgDeviceClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isiPad;
- (BOOL)isiPhone;
- (DeviceClassInput)init;
- (DeviceClassInput)initWithCoder:(id)a3;
- (NSString)deviceClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceClass:(id)a3;
@end

@implementation DeviceClassInput

- (DeviceClassInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DeviceClassInput;
  v2 = -[EligibilityInput initWithInputType:status:process:]( &v6,  "initWithInputType:status:process:",  3LL,  0LL,  @"eligibilityd");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[DeviceClassInput _mgDeviceClass](&OBJC_CLASS___DeviceClassInput, "_mgDeviceClass"));
    deviceClass = v2->_deviceClass;
    v2->_deviceClass = (NSString *)v3;
  }

  return v2;
}

- (BOOL)isiPad
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  unsigned __int8 v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (BOOL)isiPhone
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  unsigned __int8 v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DeviceClassInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (DeviceClassInput)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DeviceClassInput;
  objc_super v3 = -[EligibilityInput initWithInputType:status:process:]( &v7,  "initWithInputType:status:process:",  3LL,  0LL,  @"eligibilityd");
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[DeviceClassInput _mgDeviceClass](&OBJC_CLASS___DeviceClassInput, "_mgDeviceClass"));
    deviceClass = v3->_deviceClass;
    v3->_deviceClass = (NSString *)v4;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DeviceClassInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setDeviceClass:v7];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DeviceClassInput;
  unint64_t v3 = -[EligibilityInput hash](&v7, "hash");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DeviceClassInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DeviceClassInput;
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
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](v6, "deviceClass"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[DeviceClassInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "deviceClass";
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
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceClassInput deviceClass](self, "deviceClass"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DeviceClassInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[DeviceClassInput deviceClass:%@ %@]",  v3,  v5));

  return v6;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_mgDeviceClass
{
  return (id)MGGetStringAnswer(@"DeviceClass", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end