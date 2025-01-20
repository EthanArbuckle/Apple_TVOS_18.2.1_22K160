@interface GenerativeModelSystemInput
+ (BOOL)_mgSupportsGenerativeModelSystems;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsGenerativeModelSystems;
- (GenerativeModelSystemInput)init;
- (GenerativeModelSystemInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportsGenerativeModelSystems:(BOOL)a3;
@end

@implementation GenerativeModelSystemInput

- (GenerativeModelSystemInput)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GenerativeModelSystemInput;
  v2 = -[EligibilityInput initWithInputType:status:process:]( &v4,  "initWithInputType:status:process:",  8LL,  0LL,  @"eligibilityd");
  if (v2) {
    v2->_supportsGenerativeModelSystems = +[GenerativeModelSystemInput _mgSupportsGenerativeModelSystems]( &OBJC_CLASS___GenerativeModelSystemInput,  "_mgSupportsGenerativeModelSystems");
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GenerativeModelSystemInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (GenerativeModelSystemInput)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GenerativeModelSystemInput;
  objc_super v3 = -[EligibilityInput initWithInputType:status:process:]( &v5,  "initWithInputType:status:process:",  8LL,  0LL,  @"eligibilityd");
  if (v3) {
    v3->_supportsGenerativeModelSystems = +[GenerativeModelSystemInput _mgSupportsGenerativeModelSystems]( &OBJC_CLASS___GenerativeModelSystemInput,  "_mgSupportsGenerativeModelSystems");
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GenerativeModelSystemInput;
  id v4 = -[EligibilityInput copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend( v4,  "setSupportsGenerativeModelSystems:",  -[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems"));
  return v4;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GenerativeModelSystemInput;
  unint64_t v3 = -[EligibilityInput hash](&v5, "hash");
  return v3 ^ -[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (GenerativeModelSystemInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GenerativeModelSystemInput;
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
    unsigned int v7 = -[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems");
    unsigned int v8 = v7 ^ -[GenerativeModelSystemInput supportsGenerativeModelSystems](v6, "supportsGenerativeModelSystems");
    if (v8 == 1)
    {
      id v9 = sub_10000C968();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[GenerativeModelSystemInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "supportsGenerativeModelSystems";
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
  if (-[GenerativeModelSystemInput supportsGenerativeModelSystems](self, "supportsGenerativeModelSystems")) {
    unint64_t v3 = @"Y";
  }
  else {
    unint64_t v3 = @"N";
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GenerativeModelSystemInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[GenerativeModelSystemInput supportsGenerativeModelSystems:%@ %@]",  v3,  v5));

  return v6;
}

- (BOOL)supportsGenerativeModelSystems
{
  return self->_supportsGenerativeModelSystems;
}

- (void)setSupportsGenerativeModelSystems:(BOOL)a3
{
  self->_supportsGenerativeModelSystems = a3;
}

+ (BOOL)_mgSupportsGenerativeModelSystems
{
  return MGGetBoolAnswer(@"DeviceSupportsGenerativeModelSystems", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end