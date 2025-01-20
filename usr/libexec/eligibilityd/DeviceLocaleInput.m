@interface DeviceLocaleInput
+ (BOOL)supportsSecureCoding;
+ (id)fallbackDeviceLocale;
- (BOOL)isEqual:(id)a3;
- (DeviceLocaleInput)initWithCoder:(id)a3;
- (DeviceLocaleInput)initWithDeviceLocale:(id)a3 status:(unint64_t)a4 process:(id)a5;
- (NSString)deviceLocale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceLocale:(id)a3;
@end

@implementation DeviceLocaleInput

- (NSString)deviceLocale
{
  return (NSString *)+[DeviceLocaleInput fallbackDeviceLocale](&OBJC_CLASS___DeviceLocaleInput, "fallbackDeviceLocale");
}

- (DeviceLocaleInput)initWithDeviceLocale:(id)a3 status:(unint64_t)a4 process:(id)a5
{
  id v8 = a3;
  v9 = (__CFString *)a5;
  if (v8)
  {
    xpc_type_t type = xpc_get_type(v8);
    if (type != (xpc_type_t)&_xpc_type_string)
    {
      v11 = type;
      id v12 = sub_10000C968();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[DeviceLocaleInput initWithDeviceLocale:status:process:]";
        __int16 v21 = 2080;
        name = xpc_type_get_name(v11);
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s: Device locale input is wrong data type: %s",  buf,  0x16u);
      }

      v14 = 0LL;
      goto LABEL_14;
    }

    v13 = (os_log_s *)_CFXPCCreateCFObjectFromXPCObject(v8);
  }

  else
  {
    v13 = 0LL;
  }

  if (a4 == 1 && !v13)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[DeviceLocaleInput fallbackDeviceLocale]( &OBJC_CLASS___DeviceLocaleInput,  "fallbackDeviceLocale"));

    a4 = 0LL;
    v9 = @"eligibilityd";
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
  v15 = -[EligibilityInput initWithInputType:status:process:](&v18, "initWithInputType:status:process:", 4LL, a4, v9);
  v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_deviceLocale, v13);
  }
  self = v16;
  v14 = self;
LABEL_14:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
  id v4 = a3;
  -[EligibilityInput encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"deviceLocale"];
}

- (DeviceLocaleInput)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"deviceLocale"];
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
    id v8 = -[EligibilityInput initWithInputType:status:process:]( &v10,  "initWithInputType:status:process:",  4LL,  0LL,  @"eligibilityd");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceLocaleInput fallbackDeviceLocale](&OBJC_CLASS___DeviceLocaleInput, "fallbackDeviceLocale"));
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  v7 = (void *)v6;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
  id v8 = -[EligibilityInput initWithCoder:](&v11, "initWithCoder:", v4);
  if (v8) {
LABEL_3:
  }
    objc_storeStrong((id *)&v8->_deviceLocale, v7);
LABEL_4:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
  id v5 = -[EligibilityInput copyWithZone:](&v9, "copyWithZone:");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setDeviceLocale:v7];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
  unint64_t v3 = -[EligibilityInput hash](&v7, "hash");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DeviceLocaleInput *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
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
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](v6, "deviceLocale"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[DeviceLocaleInput isEqual:]";
        __int16 v16 = 2080;
        v17 = "deviceLocale";
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
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[DeviceLocaleInput deviceLocale](self, "deviceLocale"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DeviceLocaleInput;
  id v4 = -[EligibilityInput description](&v8, "description");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[DeviceLocaleInput deviceLocale:%@ %@]",  v3,  v5));

  return v6;
}

- (void)setDeviceLocale:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)fallbackDeviceLocale
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](&OBJC_CLASS___GlobalConfiguration, "sharedInstance"));
  unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 currentUsername]);

  if (v3)
  {
    id v4 = (void *)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, v3, kCFPreferencesAnyHost);
    if (v4)
    {
      uint64_t v5 = -[NSLocale initWithLocaleIdentifier:](objc_alloc(&OBJC_CLASS___NSLocale), "initWithLocaleIdentifier:", v4);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSLocale regionCode](v5, "regionCode"));
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end