@interface ChinaCellularInput
+ (BOOL)_isGreenTeaDeviceCapable;
+ (BOOL)supportsSecureCoding;
- (BOOL)chinaCellularDevice;
- (BOOL)isEqual:(id)a3;
- (ChinaCellularInput)init;
- (ChinaCellularInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChinaCellularDevice:(BOOL)a3;
@end

@implementation ChinaCellularInput

- (ChinaCellularInput)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ChinaCellularInput;
  v2 = -[EligibilityInput initWithInputType:status:process:]( &v4,  "initWithInputType:status:process:",  5LL,  0LL,  @"eligibilityd");
  if (v2) {
    v2->_chinaCellularDevice = +[ChinaCellularInput _isGreenTeaDeviceCapable]( &OBJC_CLASS___ChinaCellularInput,  "_isGreenTeaDeviceCapable");
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ChinaCellularInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (ChinaCellularInput)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ChinaCellularInput;
  objc_super v3 = -[EligibilityInput initWithInputType:status:process:]( &v5,  "initWithInputType:status:process:",  5LL,  0LL,  @"eligibilityd");
  if (v3) {
    v3->_chinaCellularDevice = +[ChinaCellularInput _isGreenTeaDeviceCapable]( &OBJC_CLASS___ChinaCellularInput,  "_isGreenTeaDeviceCapable");
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ChinaCellularInput;
  id v4 = -[EligibilityInput copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setChinaCellularDevice:", -[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice"));
  return v4;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ChinaCellularInput;
  unint64_t v3 = -[EligibilityInput hash](&v5, "hash");
  return v3 ^ -[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ChinaCellularInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ChinaCellularInput;
  if (!-[EligibilityInput isEqual:](&v13, "isEqual:", v4)) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v11 = 1;
    goto LABEL_11;
  }

  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    objc_super v6 = v4;
    unsigned int v7 = -[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice");
    unsigned int v8 = v7 ^ -[ChinaCellularInput chinaCellularDevice](v6, "chinaCellularDevice");
    if (v8 == 1)
    {
      id v9 = sub_10000C968();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[ChinaCellularInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "chinaCellularDevice";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }

    char v11 = v8 ^ 1;
  }

  else
  {
LABEL_9:
    char v11 = 0;
  }

- (id)description
{
  if (-[ChinaCellularInput chinaCellularDevice](self, "chinaCellularDevice")) {
    unint64_t v3 = @"Y";
  }
  else {
    unint64_t v3 = @"N";
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ChinaCellularInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ChinaCellularInput chinaCellularDevice:%@ %@]",  v3,  v5));

  return v6;
}

- (BOOL)chinaCellularDevice
{
  return self->_chinaCellularDevice;
}

- (void)setChinaCellularDevice:(BOOL)a3
{
  self->_chinaCellularDevice = a3;
}

+ (BOOL)_isGreenTeaDeviceCapable
{
  return MGGetBoolAnswer(@"green-tea", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end