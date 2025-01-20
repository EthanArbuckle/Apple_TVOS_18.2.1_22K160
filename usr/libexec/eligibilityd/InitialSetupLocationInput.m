@interface InitialSetupLocationInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (InitialSetupLocationInput)initWithCoder:(id)a3;
- (InitialSetupLocationInput)initWithLocations:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSSet)countryCodes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCountryCodes:(id)a3;
@end

@implementation InitialSetupLocationInput

- (InitialSetupLocationInput)initWithLocations:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_array)
    {
      v11 = type;
      id v12 = sub_10000C968();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[InitialSetupLocationInput initWithLocations:status:process:]";
        __int16 v25 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s: Initial setup location input is wrong data type: %s",  buf,  0x16u);
      }

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___InitialSetupLocationInput;
  id v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InitialSetupLocationInput countryCodes](self, "countryCodes", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"countryCodes"];
}

- (InitialSetupLocationInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___InitialSetupLocationInput;
  v5 = -[EligibilityInput initWithCoder:](&v12, "initWithCoder:", v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet);
    v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"countryCodes"]);
    countryCodes = v5->_countryCodes;
    v5->_countryCodes = (NSSet *)v9;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___InitialSetupLocationInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[InitialSetupLocationInput countryCodes](self, "countryCodes"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setCountryCodes:v7];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___InitialSetupLocationInput;
  unint64_t v3 = -[EligibilityInput hash](&v7, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[InitialSetupLocationInput countryCodes](self, "countryCodes"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (InitialSetupLocationInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___InitialSetupLocationInput;
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
    uint64_t v6 = v4;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[InitialSetupLocationInput countryCodes](self, "countryCodes"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[InitialSetupLocationInput countryCodes](v6, "countryCodes"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = "-[InitialSetupLocationInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "countryCodes";
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
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[InitialSetupLocationInput countryCodes](self, "countryCodes"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___InitialSetupLocationInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[InitialSetupLocationInput countryCodes:%@ %@]",  v3,  v5));

  return v6;
}

- (NSSet)countryCodes
{
  return self->_countryCodes;
}

- (void)setCountryCodes:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end