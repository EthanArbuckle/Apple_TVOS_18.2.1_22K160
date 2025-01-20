@interface ExternalBootDriveInput
+ (BOOL)queryHasExternalBootDrive;
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExternalBootDrive;
- (BOOL)isEqual:(id)a3;
- (ExternalBootDriveInput)init;
- (ExternalBootDriveInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasExternalBootDrive:(BOOL)a3;
@end

@implementation ExternalBootDriveInput

- (ExternalBootDriveInput)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ExternalBootDriveInput;
  v2 = -[EligibilityInput initWithInputType:status:process:]( &v4,  "initWithInputType:status:process:",  11LL,  0LL,  @"eligibilityd");
  if (v2) {
    v2->_hasExternalBootDrive = +[ExternalBootDriveInput queryHasExternalBootDrive]( &OBJC_CLASS___ExternalBootDriveInput,  "queryHasExternalBootDrive");
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ExternalBootDriveInput;
  -[EligibilityInput encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

- (ExternalBootDriveInput)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ExternalBootDriveInput;
  objc_super v3 = -[EligibilityInput initWithInputType:status:process:]( &v5,  "initWithInputType:status:process:",  11LL,  0LL,  @"eligibilityd");
  if (v3) {
    v3->_hasExternalBootDrive = +[ExternalBootDriveInput queryHasExternalBootDrive]( &OBJC_CLASS___ExternalBootDriveInput,  "queryHasExternalBootDrive");
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ExternalBootDriveInput;
  id v4 = -[EligibilityInput copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend( v4,  "setHasExternalBootDrive:",  -[ExternalBootDriveInput hasExternalBootDrive](self, "hasExternalBootDrive"));
  return v4;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ExternalBootDriveInput;
  unint64_t v3 = -[EligibilityInput hash](&v5, "hash");
  return v3 ^ -[ExternalBootDriveInput hasExternalBootDrive](self, "hasExternalBootDrive");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ExternalBootDriveInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ExternalBootDriveInput;
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
    unsigned int v7 = -[ExternalBootDriveInput hasExternalBootDrive](self, "hasExternalBootDrive");
    unsigned int v8 = v7 ^ -[ExternalBootDriveInput hasExternalBootDrive](v6, "hasExternalBootDrive");
    if (v8 == 1)
    {
      id v9 = sub_10000C968();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[ExternalBootDriveInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "hasExternalBootDrive";
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
  if (-[ExternalBootDriveInput hasExternalBootDrive](self, "hasExternalBootDrive")) {
    unint64_t v3 = @"Y";
  }
  else {
    unint64_t v3 = @"N";
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ExternalBootDriveInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[ExternalBootDriveInput hasExternalBootDrive:%@ %@]",  v3,  v5));

  return v6;
}

- (BOOL)hasExternalBootDrive
{
  return self->_hasExternalBootDrive;
}

- (void)setHasExternalBootDrive:(BOOL)a3
{
  self->_hasExternalBootDrive = a3;
}

+ (BOOL)queryHasExternalBootDrive
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end